local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local backgroundLayerModule = require(script.Parent.background_layer)
local pageEntryModule = require(script.Parent.page_entry)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 3348 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		page_entry = if p0 == nil or p0.page_entry == nil then nil else p0.page_entry,
		input_data = if p0 == nil or p0.input_data == nil then nil else p0.input_data
	}, t_1)
end

function t_1:encode() --[[ line: 3355 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var111 = 0
	
	if self.page_entry ~= nil then
		local var112 = self.page_entry:encode()
		local var113, var114 = protoModule.writeTag(buff, var111, 1, protoModule.wireTypes.lengthDelimited)
		var113, var114 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
		buff = var113
		var111 = var114
	end
	if self.input_data ~= nil then
		local var115 = self.input_data:encode()
		local var116, var117 = protoModule.writeTag(buff, var111, 2, protoModule.wireTypes.lengthDelimited)
		var116, var117 = protoModule.writeBuffer(var116, var117, var115, buffer.len(var115))
		buff = var116
		var111 = var117
	end
	local buff_1 = buffer.create(var111)
	buffer.copy(buff_1, 0, buff, 0, var111)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 3376 ]]
	-- upvalues: t_1 (ref), protoModule (ref), pageEntryModule (ref), t (ref)
	local var119 = t_1.new()
	local var120 = 0
	while var120 < buffer.len(p1) do
		local _ = nil
		local var121 = nil
		local var122, var123, var124 = protoModule.readTag(p1, var120)
		local var125 = var122
		var121 = var123
		var120 = var124
		
		if var121 == protoModule.wireTypes.varint then
			local _ = nil
			local var126, var127 = protoModule.readVarInt(p1, var120)
			local _ = var126
			var120 = var127
			continue
		end
		if var121 == protoModule.wireTypes.lengthDelimited then
			if var125 == 1 then
				local _ = nil
				local var128, var129 = protoModule.readBuffer(p1, var120)
				var120 = var129
				var119.page_entry = pageEntryModule.PageEntry.decode(var128)
			elseif var125 == 2 then
				local _ = nil
				local var130, var131 = protoModule.readBuffer(p1, var120)
				var120 = var131
				var119.input_data = t.PageEntryInputData.decode(var130)
			else
				local _ = nil
				local var132, var133 = protoModule.readVarInt(p1, var120)
				var120 = var133 + var132
			end
		elseif var121 == protoModule.wireTypes.i32 then
			local _ = nil
			local var134, var135 = protoModule.readFixed32(p1, var120)
			local _ = var134
			var120 = var135
		elseif var121 == protoModule.wireTypes.i64 then
			local _ = nil
			local var136, var137 = protoModule.readFixed64(p1, var120)
			local _ = var136
			var120 = var137
		else
			error("Unsupported wire type: " .. var121)
		end
	end
	return var119
end

function t_1:jsonEncode() --[[ line: 3424 ]]
	local t = {}
	
	if self.page_entry ~= nil then
		t.pageEntry = self.page_entry:jsonEncode()
	end
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	return t
end

function t_1:jsonDecode() --[[ line: 3438 ]]
	-- upvalues: t_1 (ref), pageEntryModule (ref), t (ref)
	local var139 = t_1.new()
	
	if self.page_entry ~= nil then
		var139.page_entry = pageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		var139.page_entry = pageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.input_data ~= nil then
		var139.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var139.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	return var139
end

t_1.descriptor = {
	name = "UniversalPageEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniversalPageEntry"
}
t.UniversalPageEntry = t_1
typeRegistryModule.default:register(t.UniversalPageEntry)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 3474 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		input_data = if p2 == nil or p2.input_data == nil then nil else p2.input_data,
		roblox_component = if p2 == nil or p2.roblox_component == nil then "" else p2.roblox_component
	}, t_2)
end

function t_2:encode() --[[ line: 3481 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var141 = 0
	
	if self.input_data ~= nil then
		local var142 = self.input_data:encode()
		local var143, var144 = protoModule.writeTag(buff, var141, 1, protoModule.wireTypes.lengthDelimited)
		var143, var144 = protoModule.writeBuffer(var143, var144, var142, buffer.len(var142))
		buff = var143
		var141 = var144
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var145, var146 = protoModule.writeTag(buff, var141, 2, protoModule.wireTypes.lengthDelimited)
		var145, var146 = protoModule.writeString(var145, var146, self.roblox_component)
		buff = var145
		var141 = var146
	end
	local buff_1 = buffer.create(var141)
	buffer.copy(buff_1, 0, buff, 0, var141)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 3501 ]]
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var148 = t_2.new()
	local var149 = 0
	while var149 < buffer.len(p3) do
		local _ = nil
		local var150 = nil
		local var151, var152, var153 = protoModule.readTag(p3, var149)
		local var154 = var151
		var150 = var152
		var149 = var153
		
		if var150 == protoModule.wireTypes.varint then
			local _ = nil
			local var155, var156 = protoModule.readVarInt(p3, var149)
			local _ = var155
			var149 = var156
			continue
		end
		if var150 == protoModule.wireTypes.lengthDelimited then
			if var154 == 1 then
				local _ = nil
				local var157, var158 = protoModule.readBuffer(p3, var149)
				var149 = var158
				var148.input_data = t.PageEntryInputData.decode(var157)
			elseif var154 == 2 then
				local _ = nil
				local var159, var160 = protoModule.readBuffer(p3, var149)
				var149 = var160
				var148.roblox_component = buffer.tostring(var159)
			else
				local _ = nil
				local var161, var162 = protoModule.readVarInt(p3, var149)
				var149 = var162 + var161
			end
		elseif var150 == protoModule.wireTypes.i32 then
			local _ = nil
			local var163, var164 = protoModule.readFixed32(p3, var149)
			local _ = var163
			var149 = var164
		elseif var150 == protoModule.wireTypes.i64 then
			local _ = nil
			local var165, var166 = protoModule.readFixed64(p3, var149)
			local _ = var165
			var149 = var166
		else
			error("Unsupported wire type: " .. var150)
		end
	end
	return var148
end

function t_2:jsonEncode() --[[ line: 3549 ]]
	local t = {}
	
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	return t
end

function t_2:jsonDecode() --[[ line: 3563 ]]
	-- upvalues: t_2 (ref), t (ref)
	local var168 = t_2.new()
	
	if self.input_data ~= nil then
		var168.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var168.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	if self.roblox_component ~= nil then
		var168.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var168.roblox_component = self.robloxComponent
	end
	return var168
end

t_2.descriptor = {
	name = "FeedEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.FeedEntry"
}
t.FeedEntry = t_2
typeRegistryModule.default:register(t.FeedEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 3599 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		roblox_component = if p4 == nil or p4.roblox_component == nil then "" else p4.roblox_component,
		input_data = if p4 == nil or p4.input_data == nil then nil else p4.input_data
	}, t_3)
end

function t_3:encode() --[[ line: 3606 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var170 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var171, var172 = protoModule.writeTag(buff, var170, 1, protoModule.wireTypes.lengthDelimited)
		var171, var172 = protoModule.writeString(var171, var172, self.roblox_component)
		buff = var171
		var170 = var172
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var173 = self.input_data.value:encode()
		local var174, var175 = protoModule.writeTag(buff, var170, 2, protoModule.wireTypes.lengthDelimited)
		var174, var175 = protoModule.writeBuffer(var174, var175, var173, buffer.len(var173))
		buff = var174
		var170 = var175
	end
	local buff_1 = buffer.create(var170)
	buffer.copy(buff_1, 0, buff, 0, var170)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 3628 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var177 = t_3.new()
	local var178 = 0
	while var178 < buffer.len(p5) do
		local _ = nil
		local var179 = nil
		local var180, var181, var182 = protoModule.readTag(p5, var178)
		local var183 = var180
		var179 = var181
		var178 = var182
		
		if var179 == protoModule.wireTypes.varint then
			local _ = nil
			local var184, var185 = protoModule.readVarInt(p5, var178)
			local _ = var184
			var178 = var185
			continue
		end
		if var179 == protoModule.wireTypes.lengthDelimited then
			if var183 == 1 then
				local _ = nil
				local var186, var187 = protoModule.readBuffer(p5, var178)
				var178 = var187
				var177.roblox_component = buffer.tostring(var186)
			elseif var183 == 2 then
				local _ = nil
				local var188, var189 = protoModule.readBuffer(p5, var178)
				var178 = var189
				var177.input_data = {
					type = "attribution_row",
					value = t.AttributionRowInputData.decode(var188)
				}
			else
				local _ = nil
				local var190, var191 = protoModule.readVarInt(p5, var178)
				var178 = var191 + var190
			end
		elseif var179 == protoModule.wireTypes.i32 then
			local _ = nil
			local var192, var193 = protoModule.readFixed32(p5, var178)
			local _ = var192
			var178 = var193
		elseif var179 == protoModule.wireTypes.i64 then
			local _ = nil
			local var194, var195 = protoModule.readFixed64(p5, var178)
			local _ = var194
			var178 = var195
		else
			error("Unsupported wire type: " .. var179)
		end
	end
	return var177
end

function t_3:jsonEncode() --[[ line: 3677 ]]
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		t.attributionRow = self.input_data.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode() --[[ line: 3693 ]]
	-- upvalues: t_3 (ref), t (ref)
	local var197 = t_3.new()
	
	if self.roblox_component ~= nil then
		var197.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var197.roblox_component = self.robloxComponent
	end
	if self.attribution_row ~= nil then
		var197.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attribution_row)
		}
	end
	if self.attributionRow ~= nil then
		var197.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attributionRow)
		}
	end
	return var197
end

t_3.descriptor = {
	name = "ForegroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ForegroundHeaderEntry"
}
t.ForegroundHeaderEntry = t_3
typeRegistryModule.default:register(t.ForegroundHeaderEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 3731 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		roblox_component = if p6 == nil or p6.roblox_component == nil then "" else p6.roblox_component,
		input_data = if p6 == nil or p6.input_data == nil then nil else p6.input_data
	}, t_4)
end

function t_4:encode() --[[ line: 3738 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var199 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var200, var201 = protoModule.writeTag(buff, var199, 1, protoModule.wireTypes.lengthDelimited)
		var200, var201 = protoModule.writeString(var200, var201, self.roblox_component)
		buff = var200
		var199 = var201
	end
	if self.input_data ~= nil and self.input_data.type == "image" then
		local var202 = self.input_data.value:encode()
		local var203, var204 = protoModule.writeTag(buff, var199, 2, protoModule.wireTypes.lengthDelimited)
		var203, var204 = protoModule.writeBuffer(var203, var204, var202, buffer.len(var202))
		buff = var203
		var199 = var204
	end
	local buff_1 = buffer.create(var199)
	buffer.copy(buff_1, 0, buff, 0, var199)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 3760 ]]
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var206 = t_4.new()
	local var207 = 0
	while var207 < buffer.len(p7) do
		local _ = nil
		local var208 = nil
		local var209, var210, var211 = protoModule.readTag(p7, var207)
		local var212 = var209
		var208 = var210
		var207 = var211
		
		if var208 == protoModule.wireTypes.varint then
			local _ = nil
			local var213, var214 = protoModule.readVarInt(p7, var207)
			local _ = var213
			var207 = var214
			continue
		end
		if var208 == protoModule.wireTypes.lengthDelimited then
			if var212 == 1 then
				local _ = nil
				local var215, var216 = protoModule.readBuffer(p7, var207)
				var207 = var216
				var206.roblox_component = buffer.tostring(var215)
			elseif var212 == 2 then
				local _ = nil
				local var217, var218 = protoModule.readBuffer(p7, var207)
				var207 = var218
				var206.input_data = { type = "image", value = t.ImageInputData.decode(var217) }
			else
				local _ = nil
				local var219, var220 = protoModule.readVarInt(p7, var207)
				var207 = var220 + var219
			end
		elseif var208 == protoModule.wireTypes.i32 then
			local _ = nil
			local var221, var222 = protoModule.readFixed32(p7, var207)
			local _ = var221
			var207 = var222
		elseif var208 == protoModule.wireTypes.i64 then
			local _ = nil
			local var223, var224 = protoModule.readFixed64(p7, var207)
			local _ = var223
			var207 = var224
		else
			error("Unsupported wire type: " .. var208)
		end
	end
	return var206
end

function t_4:jsonEncode() --[[ line: 3808 ]]
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.input_data ~= nil and self.input_data.type == "image" then
		t.image = self.input_data.value:jsonEncode()
	end
	return t
end

function t_4:jsonDecode() --[[ line: 3824 ]]
	-- upvalues: t_4 (ref), t (ref)
	local var226 = t_4.new()
	
	if self.roblox_component ~= nil then
		var226.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var226.roblox_component = self.robloxComponent
	end
	if self.image ~= nil then
		var226.input_data = {
			type = "image",
			value = t.ImageInputData.jsonDecode(self.image)
		}
	end
	return var226
end

t_4.descriptor = {
	name = "BackgroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.BackgroundHeaderEntry"
}
t.BackgroundHeaderEntry = t_4
typeRegistryModule.default:register(t.BackgroundHeaderEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 3856 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		kind = if p8 == nil or p8.kind == nil then nil else p8.kind
	}, t_5)
end

function t_5:encode() --[[ line: 3862 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var228 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "badges_grid" then
			local var229 = self.kind.value:encode()
			local var230, var231 = protoModule.writeTag(buff, var228, 1, protoModule.wireTypes.lengthDelimited)
			var230, var231 = protoModule.writeBuffer(var230, var231, var229, buffer.len(var229))
			buff = var230
			var228 = var231
		elseif self.kind.type == "badge_details" then
			local var232 = self.kind.value:encode()
			local var233, var234 = protoModule.writeTag(buff, var228, 2, protoModule.wireTypes.lengthDelimited)
			var233, var234 = protoModule.writeBuffer(var233, var234, var232, buffer.len(var232))
			buff = var233
			var228 = var234
		elseif self.kind.type == "static_content" then
			local var235 = self.kind.value:encode()
			local var236, var237 = protoModule.writeTag(buff, var228, 3, protoModule.wireTypes.lengthDelimited)
			var236, var237 = protoModule.writeBuffer(var236, var237, var235, buffer.len(var235))
			buff = var236
			var228 = var237
		elseif self.kind.type == "experience_attribution_row" then
			local var238 = self.kind.value:encode()
			local var239, var240 = protoModule.writeTag(buff, var228, 4, protoModule.wireTypes.lengthDelimited)
			var239, var240 = protoModule.writeBuffer(var239, var240, var238, buffer.len(var238))
			buff = var239
			var228 = var240
		elseif self.kind.type == "experience_action_module" then
			local var241 = self.kind.value:encode()
			local var242, var243 = protoModule.writeTag(buff, var228, 5, protoModule.wireTypes.lengthDelimited)
			var242, var243 = protoModule.writeBuffer(var242, var243, var241, buffer.len(var241))
			buff = var242
			var228 = var243
		elseif self.kind.type == "experience_media_gallery" then
			local var244 = self.kind.value:encode()
			local var245, var246 = protoModule.writeTag(buff, var228, 6, protoModule.wireTypes.lengthDelimited)
			var245, var246 = protoModule.writeBuffer(var245, var246, var244, buffer.len(var244))
			buff = var245
			var228 = var246
		elseif self.kind.type == "experience_description" then
			local var247 = self.kind.value:encode()
			local var248, var249 = protoModule.writeTag(buff, var228, 7, protoModule.wireTypes.lengthDelimited)
			var248, var249 = protoModule.writeBuffer(var248, var249, var247, buffer.len(var247))
			buff = var248
			var228 = var249
		elseif self.kind.type == "experience_stat_row" then
			local var250 = self.kind.value:encode()
			local var251, var252 = protoModule.writeTag(buff, var228, 8, protoModule.wireTypes.lengthDelimited)
			var251, var252 = protoModule.writeBuffer(var251, var252, var250, buffer.len(var250))
			buff = var251
			var228 = var252
		elseif self.kind.type == "experience_info_table" then
			local var253 = self.kind.value:encode()
			local var254, var255 = protoModule.writeTag(buff, var228, 9, protoModule.wireTypes.lengthDelimited)
			var254, var255 = protoModule.writeBuffer(var254, var255, var253, buffer.len(var253))
			buff = var254
			var228 = var255
		elseif self.kind.type == "social_link_row" then
			local var256 = self.kind.value:encode()
			local var257, var258 = protoModule.writeTag(buff, var228, 10, protoModule.wireTypes.lengthDelimited)
			var257, var258 = protoModule.writeBuffer(var257, var258, var256, buffer.len(var256))
			buff = var257
			var228 = var258
		elseif self.kind.type == "experience_carousel" then
			local var259 = self.kind.value:encode()
			local var260, var261 = protoModule.writeTag(buff, var228, 11, protoModule.wireTypes.lengthDelimited)
			var260, var261 = protoModule.writeBuffer(var260, var261, var259, buffer.len(var259))
			buff = var260
			var228 = var261
		elseif self.kind.type == "song_carousel" then
			local var262 = self.kind.value:encode()
			local var263, var264 = protoModule.writeTag(buff, var228, 12, protoModule.wireTypes.lengthDelimited)
			var263, var264 = protoModule.writeBuffer(var263, var264, var262, buffer.len(var262))
			buff = var263
			var228 = var264
		elseif self.kind.type == "events_carousel" then
			local var265 = self.kind.value:encode()
			local var266, var267 = protoModule.writeTag(buff, var228, 13, protoModule.wireTypes.lengthDelimited)
			var266, var267 = protoModule.writeBuffer(var266, var267, var265, buffer.len(var265))
			buff = var266
			var228 = var267
		elseif self.kind.type == "game_pass_collection" then
			local var268 = self.kind.value:encode()
			local var269, var270 = protoModule.writeTag(buff, var228, 14, protoModule.wireTypes.lengthDelimited)
			var269, var270 = protoModule.writeBuffer(var269, var270, var268, buffer.len(var268))
			buff = var269
			var228 = var270
		elseif self.kind.type == "developer_product_collection" then
			local var271 = self.kind.value:encode()
			local var272, var273 = protoModule.writeTag(buff, var228, 15, protoModule.wireTypes.lengthDelimited)
			var272, var273 = protoModule.writeBuffer(var272, var273, var271, buffer.len(var271))
			buff = var272
			var228 = var273
		elseif self.kind.type == "subscription_collection" then
			local var274 = self.kind.value:encode()
			local var275, var276 = protoModule.writeTag(buff, var228, 16, protoModule.wireTypes.lengthDelimited)
			var275, var276 = protoModule.writeBuffer(var275, var276, var274, buffer.len(var274))
			buff = var275
			var228 = var276
		elseif self.kind.type == "card_container" then
			local var277 = self.kind.value:encode()
			local var278, var279 = protoModule.writeTag(buff, var228, 20, protoModule.wireTypes.lengthDelimited)
			var278, var279 = protoModule.writeBuffer(var278, var279, var277, buffer.len(var277))
			buff = var278
			var228 = var279
		elseif self.kind.type == "card" then
			local var280 = self.kind.value:encode()
			local var281, var282 = protoModule.writeTag(buff, var228, 21, protoModule.wireTypes.lengthDelimited)
			var281, var282 = protoModule.writeBuffer(var281, var282, var280, buffer.len(var280))
			buff = var281
			var228 = var282
		elseif self.kind.type == "dialog" then
			local var283 = self.kind.value:encode()
			local var284, var285 = protoModule.writeTag(buff, var228, 22, protoModule.wireTypes.lengthDelimited)
			var284, var285 = protoModule.writeBuffer(var284, var285, var283, buffer.len(var283))
			buff = var284
			var228 = var285
		elseif self.kind.type == "banner" then
			local var286 = self.kind.value:encode()
			local var287, var288 = protoModule.writeTag(buff, var228, 23, protoModule.wireTypes.lengthDelimited)
			var287, var288 = protoModule.writeBuffer(var287, var288, var286, buffer.len(var286))
			buff = var287
			var228 = var288
		elseif self.kind.type == "tooltip" then
			local var289 = self.kind.value:encode()
			local var290, var291 = protoModule.writeTag(buff, var228, 24, protoModule.wireTypes.lengthDelimited)
			var290, var291 = protoModule.writeBuffer(var290, var291, var289, buffer.len(var289))
			buff = var290
			var228 = var291
		elseif self.kind.type == "coachmark" then
			local var292 = self.kind.value:encode()
			local var293, var294 = protoModule.writeTag(buff, var228, 25, protoModule.wireTypes.lengthDelimited)
			var293, var294 = protoModule.writeBuffer(var293, var294, var292, buffer.len(var292))
			buff = var293
			var228 = var294
		elseif self.kind.type == "system_banner_prompt" then
			local var295 = self.kind.value:encode()
			local var296, var297 = protoModule.writeTag(buff, var228, 28, protoModule.wireTypes.lengthDelimited)
			var296, var297 = protoModule.writeBuffer(var296, var297, var295, buffer.len(var295))
			buff = var296
			var228 = var297
		elseif self.kind.type == "age_check_upsell" then
			local var298 = self.kind.value:encode()
			local var299, var300 = protoModule.writeTag(buff, var228, 29, protoModule.wireTypes.lengthDelimited)
			var299, var300 = protoModule.writeBuffer(var299, var300, var298, buffer.len(var298))
			buff = var299
			var228 = var300
		elseif self.kind.type == "catalog_item_list" then
			local var301 = self.kind.value:encode()
			local var302, var303 = protoModule.writeTag(buff, var228, 26, protoModule.wireTypes.lengthDelimited)
			var302, var303 = protoModule.writeBuffer(var302, var303, var301, buffer.len(var301))
			buff = var302
			var228 = var303
		elseif self.kind.type == "user_list" then
			local var304 = self.kind.value:encode()
			local var305, var306 = protoModule.writeTag(buff, var228, 27, protoModule.wireTypes.lengthDelimited)
			var305, var306 = protoModule.writeBuffer(var305, var306, var304, buffer.len(var304))
			buff = var305
			var228 = var306
		elseif self.kind.type == "experience_content_rating_label" then
			local var307 = self.kind.value:encode()
			local var308, var309 = protoModule.writeTag(buff, var228, 30, protoModule.wireTypes.lengthDelimited)
			var308, var309 = protoModule.writeBuffer(var308, var309, var307, buffer.len(var307))
			buff = var308
			var228 = var309
		elseif self.kind.type == "experience_refund_policy" then
			local var310 = self.kind.value:encode()
			local var311, var312 = protoModule.writeTag(buff, var228, 31, protoModule.wireTypes.lengthDelimited)
			var311, var312 = protoModule.writeBuffer(var311, var312, var310, buffer.len(var310))
			buff = var311
			var228 = var312
		elseif self.kind.type == "experience_play_with_reward" then
			local var313 = self.kind.value:encode()
			local var314, var315 = protoModule.writeTag(buff, var228, 32, protoModule.wireTypes.lengthDelimited)
			var314, var315 = protoModule.writeBuffer(var314, var315, var313, buffer.len(var313))
			buff = var314
			var228 = var315
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var316 = self.kind.value:encode()
			local var317, var318 = protoModule.writeTag(buff, var228, 33, protoModule.wireTypes.lengthDelimited)
			var317, var318 = protoModule.writeBuffer(var317, var318, var316, buffer.len(var316))
			buff = var317
			var228 = var318
		elseif self.kind.type == "moments_carousel" then
			local var319 = self.kind.value:encode()
			local var320, var321 = protoModule.writeTag(buff, var228, 34, protoModule.wireTypes.lengthDelimited)
			var320, var321 = protoModule.writeBuffer(var320, var321, var319, buffer.len(var319))
			buff = var320
			var228 = var321
		elseif self.kind.type == "text" then
			local var322 = self.kind.value:encode()
			local var323, var324 = protoModule.writeTag(buff, var228, 40, protoModule.wireTypes.lengthDelimited)
			var323, var324 = protoModule.writeBuffer(var323, var324, var322, buffer.len(var322))
			buff = var323
			var228 = var324
		elseif self.kind.type == "vertical_feed" then
			local var325 = self.kind.value:encode()
			local var326, var327 = protoModule.writeTag(buff, var228, 41, protoModule.wireTypes.lengthDelimited)
			var326, var327 = protoModule.writeBuffer(var326, var327, var325, buffer.len(var325))
			buff = var326
			var228 = var327
		elseif self.kind.type == "page_header" then
			local var328 = self.kind.value:encode()
			local var329, var330 = protoModule.writeTag(buff, var228, 42, protoModule.wireTypes.lengthDelimited)
			var329, var330 = protoModule.writeBuffer(var329, var330, var328, buffer.len(var328))
			buff = var329
			var228 = var330
		elseif self.kind.type == "experience_details_feed" then
			local var331 = self.kind.value:encode()
			local var332, var333 = protoModule.writeTag(buff, var228, 500, protoModule.wireTypes.lengthDelimited)
			var332, var333 = protoModule.writeBuffer(var332, var333, var331, buffer.len(var331))
			buff = var332
			var228 = var333
		elseif self.kind.type == "experience_details_action_bar" then
			local var334 = self.kind.value:encode()
			local var335, var336 = protoModule.writeTag(buff, var228, 501, protoModule.wireTypes.lengthDelimited)
			var335, var336 = protoModule.writeBuffer(var335, var336, var334, buffer.len(var334))
			buff = var335
			var228 = var336
		elseif self.kind.type == "experience_details_banner_image" then
			local var337 = self.kind.value:encode()
			local var338, var339 = protoModule.writeTag(buff, var228, 502, protoModule.wireTypes.lengthDelimited)
			var338, var339 = protoModule.writeBuffer(var338, var339, var337, buffer.len(var337))
			buff = var338
			var228 = var339
		elseif self.kind.type == "experience_details_sticky_header" then
			local var340 = self.kind.value:encode()
			local var341, var342 = protoModule.writeTag(buff, var228, 503, protoModule.wireTypes.lengthDelimited)
			var341, var342 = protoModule.writeBuffer(var341, var342, var340, buffer.len(var340))
			buff = var341
			var228 = var342
		elseif self.kind.type == "event_details_feed" then
			local var343 = self.kind.value:encode()
			local var344, var345 = protoModule.writeTag(buff, var228, 600, protoModule.wireTypes.lengthDelimited)
			var344, var345 = protoModule.writeBuffer(var344, var345, var343, buffer.len(var343))
			buff = var344
			var228 = var345
		elseif self.kind.type == "event_details_action_bar" then
			local var346 = self.kind.value:encode()
			local var347, var348 = protoModule.writeTag(buff, var228, 601, protoModule.wireTypes.lengthDelimited)
			var347, var348 = protoModule.writeBuffer(var347, var348, var346, buffer.len(var346))
			buff = var347
			var228 = var348
		elseif self.kind.type == "event_attribution_row" then
			local var349 = self.kind.value:encode()
			local var350, var351 = protoModule.writeTag(buff, var228, 602, protoModule.wireTypes.lengthDelimited)
			var350, var351 = protoModule.writeBuffer(var350, var351, var349, buffer.len(var349))
			buff = var350
			var228 = var351
		elseif self.kind.type == "event_description" then
			local var352 = self.kind.value:encode()
			local var353, var354 = protoModule.writeTag(buff, var228, 603, protoModule.wireTypes.lengthDelimited)
			var353, var354 = protoModule.writeBuffer(var353, var354, var352, buffer.len(var352))
			buff = var353
			var228 = var354
		elseif self.kind.type == "event_info_table" then
			local var355 = self.kind.value:encode()
			local var356, var357 = protoModule.writeTag(buff, var228, 604, protoModule.wireTypes.lengthDelimited)
			var356, var357 = protoModule.writeBuffer(var356, var357, var355, buffer.len(var355))
			buff = var356
			var228 = var357
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var358 = self.kind.value:encode()
			local var359, var360 = protoModule.writeTag(buff, var228, 605, protoModule.wireTypes.lengthDelimited)
			var359, var360 = protoModule.writeBuffer(var359, var360, var358, buffer.len(var358))
			buff = var359
			var228 = var360
		elseif self.kind.type == "event_notifications_modal" then
			local var361 = self.kind.value:encode()
			local var362, var363 = protoModule.writeTag(buff, var228, 606, protoModule.wireTypes.lengthDelimited)
			var362, var363 = protoModule.writeBuffer(var362, var363, var361, buffer.len(var361))
			buff = var362
			var228 = var363
		elseif self.kind.type == "dev_store_feed" then
			local var364 = self.kind.value:encode()
			local var365, var366 = protoModule.writeTag(buff, var228, 700, protoModule.wireTypes.lengthDelimited)
			var365, var366 = protoModule.writeBuffer(var365, var366, var364, buffer.len(var364))
			buff = var365
			var228 = var366
		elseif self.kind.type == "charts_feed" then
			local var367 = self.kind.value:encode()
			local var368, var369 = protoModule.writeTag(buff, var228, 800, protoModule.wireTypes.lengthDelimited)
			var368, var369 = protoModule.writeBuffer(var368, var369, var367, buffer.len(var367))
			buff = var368
			var228 = var369
		elseif self.kind.type == "filter_pills" then
			local var370 = self.kind.value:encode()
			local var371, var372 = protoModule.writeTag(buff, var228, 801, protoModule.wireTypes.lengthDelimited)
			var371, var372 = protoModule.writeBuffer(var371, var372, var370, buffer.len(var370))
			buff = var371
			var228 = var372
		elseif self.kind.type == "sort_selector" then
			local var373 = self.kind.value:encode()
			local var374, var375 = protoModule.writeTag(buff, var228, 802, protoModule.wireTypes.lengthDelimited)
			var374, var375 = protoModule.writeBuffer(var374, var375, var373, buffer.len(var373))
			buff = var374
			var228 = var375
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var376 = self.kind.value:encode()
			local var377, var378 = protoModule.writeTag(buff, var228, 900, protoModule.wireTypes.lengthDelimited)
			var377, var378 = protoModule.writeBuffer(var377, var378, var376, buffer.len(var376))
			buff = var377
			var228 = var378
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var379 = self.kind.value:encode()
			local var380, var381 = protoModule.writeTag(buff, var228, 901, protoModule.wireTypes.lengthDelimited)
			var380, var381 = protoModule.writeBuffer(var380, var381, var379, buffer.len(var379))
			buff = var380
			var228 = var381
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var382 = self.kind.value:encode()
			local var383, var384 = protoModule.writeTag(buff, var228, 902, protoModule.wireTypes.lengthDelimited)
			var383, var384 = protoModule.writeBuffer(var383, var384, var382, buffer.len(var382))
			buff = var383
			var228 = var384
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var385 = self.kind.value:encode()
			local var386, var387 = protoModule.writeTag(buff, var228, 903, protoModule.wireTypes.lengthDelimited)
			var386, var387 = protoModule.writeBuffer(var386, var387, var385, buffer.len(var385))
			buff = var386
			var228 = var387
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var388 = self.kind.value:encode()
			local var389, var390 = protoModule.writeTag(buff, var228, 904, protoModule.wireTypes.lengthDelimited)
			var389, var390 = protoModule.writeBuffer(var389, var390, var388, buffer.len(var388))
			buff = var389
			var228 = var390
		elseif self.kind.type == "search_results_feed" then
			local var391 = self.kind.value:encode()
			local var392, var393 = protoModule.writeTag(buff, var228, 1000, protoModule.wireTypes.lengthDelimited)
			var392, var393 = protoModule.writeBuffer(var392, var393, var391, buffer.len(var391))
			buff = var392
			var228 = var393
		elseif self.kind.type == "power_search_ai_overview" then
			local var394 = self.kind.value:encode()
			local var395, var396 = protoModule.writeTag(buff, var228, 1001, protoModule.wireTypes.lengthDelimited)
			var395, var396 = protoModule.writeBuffer(var395, var396, var394, buffer.len(var394))
			buff = var395
			var228 = var396
		elseif self.kind.type == "experience_emphasis_tile" then
			local var397 = self.kind.value:encode()
			local var398, var399 = protoModule.writeTag(buff, var228, 1002, protoModule.wireTypes.lengthDelimited)
			var398, var399 = protoModule.writeBuffer(var398, var399, var397, buffer.len(var397))
			buff = var398
			var228 = var399
		elseif self.kind.type == "option_selector_carousel" then
			local var400 = self.kind.value:encode()
			local var401, var402 = protoModule.writeTag(buff, var228, 1100, protoModule.wireTypes.lengthDelimited)
			var401, var402 = protoModule.writeBuffer(var401, var402, var400, buffer.len(var400))
			buff = var401
			var228 = var402
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var403 = self.kind.value:encode()
			local var404, var405 = protoModule.writeTag(buff, var228, 1200, protoModule.wireTypes.lengthDelimited)
			var404, var405 = protoModule.writeBuffer(var404, var405, var403, buffer.len(var403))
			buff = var404
			var228 = var405
		end
	end
	local buff_1 = buffer.create(var228)
	buffer.copy(buff_1, 0, buff, 0, var228)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 4111 ]]
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var407 = t_5.new()
	local var408 = 0
	while var408 < buffer.len(p9) do
		local _ = nil
		local var409 = nil
		local var410, var411, var412 = protoModule.readTag(p9, var408)
		local var413 = var410
		var409 = var411
		var408 = var412
		
		if var409 == protoModule.wireTypes.varint then
			local _ = nil
			local var414, var415 = protoModule.readVarInt(p9, var408)
			local _ = var414
			var408 = var415
			continue
		end
		if var409 == protoModule.wireTypes.lengthDelimited then
			if var413 == 1 then
				local _ = nil
				local var416, var417 = protoModule.readBuffer(p9, var408)
				var408 = var417
				var407.kind = {
					type = "badges_grid",
					value = t.BadgesGridInputData.decode(var416)
				}
			elseif var413 == 2 then
				local _ = nil
				local var418, var419 = protoModule.readBuffer(p9, var408)
				var408 = var419
				var407.kind = {
					type = "badge_details",
					value = t.BadgeDetailsInputData.decode(var418)
				}
			elseif var413 == 3 then
				local _ = nil
				local var420, var421 = protoModule.readBuffer(p9, var408)
				var408 = var421
				var407.kind = {
					type = "static_content",
					value = t.StaticInputData.decode(var420)
				}
			elseif var413 == 4 then
				local _ = nil
				local var422, var423 = protoModule.readBuffer(p9, var408)
				var408 = var423
				var407.kind = {
					type = "experience_attribution_row",
					value = t.ExperienceAttributionRowInputData.decode(var422)
				}
			elseif var413 == 5 then
				local _ = nil
				local var424, var425 = protoModule.readBuffer(p9, var408)
				var408 = var425
				var407.kind = {
					type = "experience_action_module",
					value = t.ExperienceActionModuleInputData.decode(var424)
				}
			elseif var413 == 6 then
				local _ = nil
				local var426, var427 = protoModule.readBuffer(p9, var408)
				var408 = var427
				var407.kind = {
					type = "experience_media_gallery",
					value = t.ExperienceMediaGalleryInputData.decode(var426)
				}
			elseif var413 == 7 then
				local _ = nil
				local var428, var429 = protoModule.readBuffer(p9, var408)
				var408 = var429
				var407.kind = {
					type = "experience_description",
					value = t.ExperienceDescriptionInputData.decode(var428)
				}
			elseif var413 == 8 then
				local _ = nil
				local var430, var431 = protoModule.readBuffer(p9, var408)
				var408 = var431
				var407.kind = {
					type = "experience_stat_row",
					value = t.ExperienceStatRowInputData.decode(var430)
				}
			elseif var413 == 9 then
				local _ = nil
				local var432, var433 = protoModule.readBuffer(p9, var408)
				var408 = var433
				var407.kind = {
					type = "experience_info_table",
					value = t.ExperienceInfoTableInputData.decode(var432)
				}
			elseif var413 == 10 then
				local _ = nil
				local var434, var435 = protoModule.readBuffer(p9, var408)
				var408 = var435
				var407.kind = {
					type = "social_link_row",
					value = t.SocialLinkRowInputData.decode(var434)
				}
			elseif var413 == 11 then
				local _ = nil
				local var436, var437 = protoModule.readBuffer(p9, var408)
				var408 = var437
				var407.kind = {
					type = "experience_carousel",
					value = t.ExperienceCarouselInputData.decode(var436)
				}
			elseif var413 == 12 then
				local _ = nil
				local var438, var439 = protoModule.readBuffer(p9, var408)
				var408 = var439
				var407.kind = {
					type = "song_carousel",
					value = t.SongCarouselInputData.decode(var438)
				}
			elseif var413 == 13 then
				local _ = nil
				local var440, var441 = protoModule.readBuffer(p9, var408)
				var408 = var441
				var407.kind = {
					type = "events_carousel",
					value = t.EventsCarouselInputData.decode(var440)
				}
			elseif var413 == 14 then
				local _ = nil
				local var442, var443 = protoModule.readBuffer(p9, var408)
				var408 = var443
				var407.kind = {
					type = "game_pass_collection",
					value = t.GamePassCollectionInputData.decode(var442)
				}
			elseif var413 == 15 then
				local _ = nil
				local var444, var445 = protoModule.readBuffer(p9, var408)
				var408 = var445
				var407.kind = {
					type = "developer_product_collection",
					value = t.DeveloperProductCollectionInputData.decode(var444)
				}
			elseif var413 == 16 then
				local _ = nil
				local var446, var447 = protoModule.readBuffer(p9, var408)
				var408 = var447
				var407.kind = {
					type = "subscription_collection",
					value = t.SubscriptionCollectionInputData.decode(var446)
				}
			elseif var413 == 20 then
				local _ = nil
				local var448, var449 = protoModule.readBuffer(p9, var408)
				var408 = var449
				var407.kind = {
					type = "card_container",
					value = t.CardContainerInputData.decode(var448)
				}
			elseif var413 == 21 then
				local _ = nil
				local var450, var451 = protoModule.readBuffer(p9, var408)
				var408 = var451
				var407.kind = { type = "card", value = t.CardInputData.decode(var450) }
			elseif var413 == 22 then
				local _ = nil
				local var452, var453 = protoModule.readBuffer(p9, var408)
				var408 = var453
				var407.kind = {
					type = "dialog",
					value = t.DialogInputData.decode(var452)
				}
			elseif var413 == 23 then
				local _ = nil
				local var454, var455 = protoModule.readBuffer(p9, var408)
				var408 = var455
				var407.kind = {
					type = "banner",
					value = t.BannerInputData.decode(var454)
				}
			elseif var413 == 24 then
				local _ = nil
				local var456, var457 = protoModule.readBuffer(p9, var408)
				var408 = var457
				var407.kind = {
					type = "tooltip",
					value = t.TooltipInputData.decode(var456)
				}
			elseif var413 == 25 then
				local _ = nil
				local var458, var459 = protoModule.readBuffer(p9, var408)
				var408 = var459
				var407.kind = {
					type = "coachmark",
					value = t.CoachmarkInputData.decode(var458)
				}
			elseif var413 == 26 then
				local _ = nil
				local var460, var461 = protoModule.readBuffer(p9, var408)
				var408 = var461
				var407.kind = {
					type = "catalog_item_list",
					value = t.CatalogItemListInputData.decode(var460)
				}
			elseif var413 == 27 then
				local _ = nil
				local var462, var463 = protoModule.readBuffer(p9, var408)
				var408 = var463
				var407.kind = {
					type = "user_list",
					value = t.UserListInputData.decode(var462)
				}
			elseif var413 == 28 then
				local _ = nil
				local var464, var465 = protoModule.readBuffer(p9, var408)
				var408 = var465
				var407.kind = {
					type = "system_banner_prompt",
					value = t.SystemBannerInputData.decode(var464)
				}
			elseif var413 == 29 then
				local _ = nil
				local var466, var467 = protoModule.readBuffer(p9, var408)
				var408 = var467
				var407.kind = {
					type = "age_check_upsell",
					value = t.AgeCheckUpsellInputData.decode(var466)
				}
			elseif var413 == 30 then
				local _ = nil
				local var468, var469 = protoModule.readBuffer(p9, var408)
				var408 = var469
				var407.kind = {
					type = "experience_content_rating_label",
					value = t.ExperienceContentRatingLabelInputData.decode(var468)
				}
			elseif var413 == 31 then
				local _ = nil
				local var470, var471 = protoModule.readBuffer(p9, var408)
				var408 = var471
				var407.kind = {
					type = "experience_refund_policy",
					value = t.ExperienceRefundPolicyInputData.decode(var470)
				}
			elseif var413 == 32 then
				local _ = nil
				local var472, var473 = protoModule.readBuffer(p9, var408)
				var408 = var473
				var407.kind = {
					type = "experience_play_with_reward",
					value = t.ExperiencePlayWithRewardInputData.decode(var472)
				}
			elseif var413 == 33 then
				local _ = nil
				local var474, var475 = protoModule.readBuffer(p9, var408)
				var408 = var475
				var407.kind = {
					type = "experience_guidelines_dialog",
					value = t.ExperienceGuidelinesDialogInputData.decode(var474)
				}
			elseif var413 == 34 then
				local _ = nil
				local var476, var477 = protoModule.readBuffer(p9, var408)
				var408 = var477
				var407.kind = {
					type = "moments_carousel",
					value = t.MomentsCarouselInputData.decode(var476)
				}
			elseif var413 == 40 then
				local _ = nil
				local var478, var479 = protoModule.readBuffer(p9, var408)
				var408 = var479
				var407.kind = { type = "text", value = t.TextInputData.decode(var478) }
			elseif var413 == 41 then
				local _ = nil
				local var480, var481 = protoModule.readBuffer(p9, var408)
				var408 = var481
				var407.kind = {
					type = "vertical_feed",
					value = t.VerticalFeedInputData.decode(var480)
				}
			elseif var413 == 42 then
				local _ = nil
				local var482, var483 = protoModule.readBuffer(p9, var408)
				var408 = var483
				var407.kind = {
					type = "page_header",
					value = t.PageHeaderInputData.decode(var482)
				}
			elseif var413 == 500 then
				local _ = nil
				local var484, var485 = protoModule.readBuffer(p9, var408)
				var408 = var485
				var407.kind = {
					type = "experience_details_feed",
					value = t.ExperienceDetailsFeedInputData.decode(var484)
				}
			elseif var413 == 501 then
				local _ = nil
				local var486, var487 = protoModule.readBuffer(p9, var408)
				var408 = var487
				var407.kind = {
					type = "experience_details_action_bar",
					value = t.ExperienceDetailsActionBarInputData.decode(var486)
				}
			elseif var413 == 502 then
				local _ = nil
				local var488, var489 = protoModule.readBuffer(p9, var408)
				var408 = var489
				var407.kind = {
					type = "experience_details_banner_image",
					value = t.ExperienceDetailsBannerImageInputData.decode(var488)
				}
			elseif var413 == 503 then
				local _ = nil
				local var490, var491 = protoModule.readBuffer(p9, var408)
				var408 = var491
				var407.kind = {
					type = "experience_details_sticky_header",
					value = t.ExperienceDetailsStickyHeaderInputData.decode(var490)
				}
			elseif var413 == 600 then
				local _ = nil
				local var492, var493 = protoModule.readBuffer(p9, var408)
				var408 = var493
				var407.kind = {
					type = "event_details_feed",
					value = t.EventDetailsFeedInputData.decode(var492)
				}
			elseif var413 == 601 then
				local _ = nil
				local var494, var495 = protoModule.readBuffer(p9, var408)
				var408 = var495
				var407.kind = {
					type = "event_details_action_bar",
					value = t.EventDetailsActionBarInputData.decode(var494)
				}
			elseif var413 == 602 then
				local _ = nil
				local var496, var497 = protoModule.readBuffer(p9, var408)
				var408 = var497
				var407.kind = {
					type = "event_attribution_row",
					value = t.EventAttributionRowInputData.decode(var496)
				}
			elseif var413 == 603 then
				local _ = nil
				local var498, var499 = protoModule.readBuffer(p9, var408)
				var408 = var499
				var407.kind = {
					type = "event_description",
					value = t.EventDescriptionInputData.decode(var498)
				}
			elseif var413 == 604 then
				local _ = nil
				local var500, var501 = protoModule.readBuffer(p9, var408)
				var408 = var501
				var407.kind = {
					type = "event_info_table",
					value = t.EventInfoTableInputData.decode(var500)
				}
			elseif var413 == 605 then
				local _ = nil
				local var502, var503 = protoModule.readBuffer(p9, var408)
				var408 = var503
				var407.kind = {
					type = "event_details_sheet_full_bleed",
					value = t.EventDetailsSheetFullBleedInputData.decode(var502)
				}
			elseif var413 == 606 then
				local _ = nil
				local var504, var505 = protoModule.readBuffer(p9, var408)
				var408 = var505
				var407.kind = {
					type = "event_notifications_modal",
					value = t.EventNotificationsModalInputData.decode(var504)
				}
			elseif var413 == 700 then
				local _ = nil
				local var506, var507 = protoModule.readBuffer(p9, var408)
				var408 = var507
				var407.kind = {
					type = "dev_store_feed",
					value = t.DevStoreFeedInputData.decode(var506)
				}
			elseif var413 == 800 then
				local _ = nil
				local var508, var509 = protoModule.readBuffer(p9, var408)
				var408 = var509
				var407.kind = {
					type = "charts_feed",
					value = t.ChartsFeedInputData.decode(var508)
				}
			elseif var413 == 801 then
				local _ = nil
				local var510, var511 = protoModule.readBuffer(p9, var408)
				var408 = var511
				var407.kind = {
					type = "filter_pills",
					value = t.FilterPillsInputData.decode(var510)
				}
			elseif var413 == 802 then
				local _ = nil
				local var512, var513 = protoModule.readBuffer(p9, var408)
				var408 = var513
				var407.kind = {
					type = "sort_selector",
					value = t.SortSelectorInputData.decode(var512)
				}
			elseif var413 == 900 then
				local _ = nil
				local var514, var515 = protoModule.readBuffer(p9, var408)
				var408 = var515
				var407.kind = {
					type = "marketplace_catalog_feed",
					value = t.UAMarketplaceCatalogFeedInputData.decode(var514)
				}
			elseif var413 == 901 then
				local _ = nil
				local var516, var517 = protoModule.readBuffer(p9, var408)
				var408 = var517
				var407.kind = {
					type = "marketplace_catalog_category_menu",
					value = t.UAMarketplaceCatalogCategoryMenuInputData.decode(var516)
				}
			elseif var413 == 902 then
				local _ = nil
				local var518, var519 = protoModule.readBuffer(p9, var408)
				var408 = var519
				var407.kind = {
					type = "marketplace_catalog_item_group",
					value = t.UAMarketplaceCatalogItemGroupInputData.decode(var518)
				}
			elseif var413 == 903 then
				local _ = nil
				local var520, var521 = protoModule.readBuffer(p9, var408)
				var408 = var521
				var407.kind = {
					type = "marketplace_catalog_item_carousel",
					value = t.UAMarketplaceCatalogItemCarouselInputData.decode(var520)
				}
			elseif var413 == 904 then
				local _ = nil
				local var522, var523 = protoModule.readBuffer(p9, var408)
				var408 = var523
				var407.kind = {
					type = "marketplace_catalog_hero_unit",
					value = t.UAMarketplaceCatalogHeroUnitInputData.decode(var522)
				}
			elseif var413 == 1000 then
				local _ = nil
				local var524, var525 = protoModule.readBuffer(p9, var408)
				var408 = var525
				var407.kind = {
					type = "search_results_feed",
					value = t.SearchResultsFeedInputData.decode(var524)
				}
			elseif var413 == 1001 then
				local _ = nil
				local var526, var527 = protoModule.readBuffer(p9, var408)
				var408 = var527
				var407.kind = {
					type = "power_search_ai_overview",
					value = t.PowerSearchAIOverviewInputData.decode(var526)
				}
			elseif var413 == 1002 then
				local _ = nil
				local var528, var529 = protoModule.readBuffer(p9, var408)
				var408 = var529
				var407.kind = {
					type = "experience_emphasis_tile",
					value = t.ExperienceEmphasisTileInputData.decode(var528)
				}
			elseif var413 == 1100 then
				local _ = nil
				local var530, var531 = protoModule.readBuffer(p9, var408)
				var408 = var531
				var407.kind = {
					type = "option_selector_carousel",
					value = t.OptionSelectorCarouselInputData.decode(var530)
				}
			elseif var413 == 1200 then
				local _ = nil
				local var532, var533 = protoModule.readBuffer(p9, var408)
				var408 = var533
				var407.kind = {
					type = "party_chat_conversation_upsell",
					value = t.PartyChatConversationUpsellInputData.decode(var532)
				}
			else
				local _ = nil
				local var534, var535 = protoModule.readVarInt(p9, var408)
				var408 = var535 + var534
			end
		elseif var409 == protoModule.wireTypes.i32 then
			local _ = nil
			local var536, var537 = protoModule.readFixed32(p9, var408)
			local _ = var536
			var408 = var537
		elseif var409 == protoModule.wireTypes.i64 then
			local _ = nil
			local var538, var539 = protoModule.readFixed64(p9, var408)
			local _ = var538
			var408 = var539
		else
			error("Unsupported wire type: " .. var409)
		end
	end
	return var407
end

function t_5:jsonEncode() --[[ line: 4529 ]]
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
		end
	end
	return t
end

function t_5:jsonDecode() --[[ line: 4657 ]]
	-- upvalues: t_5 (ref), t (ref)
	local var541 = t_5.new()
	
	if self.badges_grid ~= nil then
		var541.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var541.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		var541.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var541.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		var541.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		var541.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		var541.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		var541.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		var541.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		var541.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		var541.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		var541.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		var541.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		var541.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		var541.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		var541.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		var541.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		var541.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		var541.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		var541.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		var541.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		var541.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		var541.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		var541.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		var541.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		var541.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		var541.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		var541.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		var541.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		var541.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		var541.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		var541.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.card_container ~= nil then
		var541.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		var541.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		var541.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		var541.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		var541.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		var541.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		var541.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		var541.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		var541.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		var541.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		var541.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		var541.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		var541.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		var541.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		var541.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		var541.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		var541.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		var541.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		var541.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		var541.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		var541.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		var541.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		var541.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.moments_carousel ~= nil then
		var541.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		var541.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		var541.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		var541.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		var541.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		var541.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		var541.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.experience_details_feed ~= nil then
		var541.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		var541.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		var541.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		var541.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		var541.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		var541.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		var541.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		var541.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		var541.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		var541.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		var541.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		var541.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		var541.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		var541.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		var541.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		var541.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		var541.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		var541.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		var541.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		var541.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		var541.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		var541.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		var541.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		var541.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		var541.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		var541.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		var541.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		var541.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		var541.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		var541.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		var541.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		var541.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		var541.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		var541.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		var541.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		var541.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		var541.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		var541.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		var541.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		var541.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.search_results_feed ~= nil then
		var541.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		var541.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		var541.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		var541.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		var541.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		var541.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.option_selector_carousel ~= nil then
		var541.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		var541.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		var541.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		var541.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	return var541
end

t_5.descriptor = {
	name = "PageEntryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageEntryInputData"
}
t.PageEntryInputData = t_5
typeRegistryModule.default:register(t.PageEntryInputData)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 5387 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		section_title = if p10 == nil or p10.section_title == nil then "" else p10.section_title,
		badges = if p10 == nil or p10.badges == nil then {} else p10.badges,
		collection_id = if p10 == nil or p10.collection_id == nil then "" else p10.collection_id,
		collection_position = if p10 == nil or p10.collection_position == nil then "" else p10.collection_position,
		universe_id = if p10 == nil or p10.universe_id == nil then "" else p10.universe_id
	}, t_6)
end

function t_6:encode() --[[ line: 5399 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var543 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var544, var545 = protoModule.writeTag(buff, var543, 1, protoModule.wireTypes.lengthDelimited)
		var544, var545 = protoModule.writeString(var544, var545, self.section_title)
		buff = var544
		var543 = var545
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var546 = v:encode()
			local var547, var548 = protoModule.writeTag(buff, var543, 2, protoModule.wireTypes.lengthDelimited)
			var547, var548 = protoModule.writeBuffer(var547, var548, var546, buffer.len(var546))
			buff = var547
			var543 = var548
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var549, var550 = protoModule.writeTag(buff, var543, 3, protoModule.wireTypes.lengthDelimited)
		var549, var550 = protoModule.writeString(var549, var550, self.collection_id)
		buff = var549
		var543 = var550
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var551, var552 = protoModule.writeTag(buff, var543, 4, protoModule.wireTypes.lengthDelimited)
		var551, var552 = protoModule.writeString(var551, var552, self.collection_position)
		buff = var551
		var543 = var552
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var553, var554 = protoModule.writeTag(buff, var543, 5, protoModule.wireTypes.lengthDelimited)
		var553, var554 = protoModule.writeString(var553, var554, self.universe_id)
		buff = var553
		var543 = var554
	end
	local buff_1 = buffer.create(var543)
	buffer.copy(buff_1, 0, buff, 0, var543)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 5436 ]]
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var556 = t_6.new()
	local var557 = 0
	while var557 < buffer.len(p11) do
		local _ = nil
		local var558 = nil
		local var559, var560, var561 = protoModule.readTag(p11, var557)
		local var562 = var559
		var558 = var560
		var557 = var561
		
		if var558 == protoModule.wireTypes.varint then
			local _ = nil
			local var563, var564 = protoModule.readVarInt(p11, var557)
			local _ = var563
			var557 = var564
			continue
		end
		if var558 == protoModule.wireTypes.lengthDelimited then
			if var562 == 1 then
				local _ = nil
				local var565, var566 = protoModule.readBuffer(p11, var557)
				var557 = var566
				var556.section_title = buffer.tostring(var565)
			elseif var562 == 2 then
				local _ = nil
				local var567, var568 = protoModule.readBuffer(p11, var557)
				var557 = var568
				table.insert(var556.badges, t.BadgesGridInputData_BadgeInputData.decode(var567))
			elseif var562 == 3 then
				local _ = nil
				local var569, var570 = protoModule.readBuffer(p11, var557)
				var557 = var570
				var556.collection_id = buffer.tostring(var569)
			elseif var562 == 4 then
				local _ = nil
				local var571, var572 = protoModule.readBuffer(p11, var557)
				var557 = var572
				var556.collection_position = buffer.tostring(var571)
			elseif var562 == 5 then
				local _ = nil
				local var573, var574 = protoModule.readBuffer(p11, var557)
				var557 = var574
				var556.universe_id = buffer.tostring(var573)
			else
				local _ = nil
				local var575, var576 = protoModule.readVarInt(p11, var557)
				var557 = var576 + var575
			end
		elseif var558 == protoModule.wireTypes.i32 then
			local _ = nil
			local var577, var578 = protoModule.readFixed32(p11, var557)
			local _ = var577
			var557 = var578
		elseif var558 == protoModule.wireTypes.i64 then
			local _ = nil
			local var579, var580 = protoModule.readFixed64(p11, var557)
			local _ = var579
			var557 = var580
		else
			error("Unsupported wire type: " .. var558)
		end
	end
	return var556
end

function t_6:jsonEncode() --[[ line: 5499 ]]
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

function t_6:jsonDecode() --[[ line: 5529 ]]
	-- upvalues: t_6 (ref), t (ref)
	local var583 = t_6.new()
	
	if self.section_title ~= nil then
		var583.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var583.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridInputData_BadgeInputData.jsonDecode(v))
		end
		var583.badges = t_1
	end
	if self.collection_id ~= nil then
		var583.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var583.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var583.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var583.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var583.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var583.universe_id = self.universeId
	end
	return var583
end

t_6.descriptor = {
	name = "BadgesGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgesGridInputData"
}
t.BadgesGridInputData = t_6
typeRegistryModule.default:register(t.BadgesGridInputData)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12) --[[ line: 5590 ]]
	-- upvalues: t_7 (ref)
	return setmetatable({
		badge_id = if p12 == nil or p12.badge_id == nil then "" else p12.badge_id
	}, t_7)
end

function t_7:encode() --[[ line: 5598 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var586 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var587, var588 = protoModule.writeTag(buff, var586, 1, protoModule.wireTypes.lengthDelimited)
		var587, var588 = protoModule.writeString(var587, var588, self.badge_id)
		buff = var587
		var586 = var588
	end
	local buff_1 = buffer.create(var586)
	buffer.copy(buff_1, 0, buff, 0, var586)
	
	return buff_1
end

function t_7.decode(p13) --[[ line: 5612 ]]
	-- upvalues: t_7 (ref), protoModule (ref)
	local var590 = t_7.new()
	local var591 = 0
	while var591 < buffer.len(p13) do
		local _ = nil
		local var592 = nil
		local var593, var594, var595 = protoModule.readTag(p13, var591)
		local var596 = var593
		var592 = var594
		var591 = var595
		
		if var592 == protoModule.wireTypes.varint then
			local _ = nil
			local var597, var598 = protoModule.readVarInt(p13, var591)
			local _ = var597
			var591 = var598
			continue
		end
		if var592 == protoModule.wireTypes.lengthDelimited then
			if var596 == 1 then
				local _ = nil
				local var599, var600 = protoModule.readBuffer(p13, var591)
				var591 = var600
				var590.badge_id = buffer.tostring(var599)
			else
				local _ = nil
				local var601, var602 = protoModule.readVarInt(p13, var591)
				var591 = var602 + var601
			end
		elseif var592 == protoModule.wireTypes.i32 then
			local _ = nil
			local var603, var604 = protoModule.readFixed32(p13, var591)
			local _ = var603
			var591 = var604
		elseif var592 == protoModule.wireTypes.i64 then
			local _ = nil
			local var605, var606 = protoModule.readFixed64(p13, var591)
			local _ = var605
			var591 = var606
		else
			error("Unsupported wire type: " .. var592)
		end
	end
	return var590
end

function t_7:jsonEncode() --[[ line: 5655 ]]
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	return t
end

function t_7:jsonDecode() --[[ line: 5665 ]]
	-- upvalues: t_7 (ref)
	local var608 = t_7.new()
	
	if self.badge_id ~= nil then
		var608.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var608.badge_id = self.badgeId
	end
	return var608
end

t_7.descriptor = {
	name = "BadgesGridInputData_BadgeInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeInputData"
}
t.BadgesGridInputData_BadgeInputData = t_7
typeRegistryModule.default:register(t.BadgesGridInputData_BadgeInputData)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14) --[[ line: 5695 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		badge_id = if p14 == nil or p14.badge_id == nil then "" else p14.badge_id,
		universe_id = if p14 == nil or p14.universe_id == nil then "" else p14.universe_id,
		localized_literals = if p14 == nil or p14.localized_literals == nil then nil else p14.localized_literals,
		creator_key = if p14 == nil or p14.creator_key == nil then "" else p14.creator_key
	}, t_8)
end

function t_8:encode() --[[ line: 5704 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var610 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var611, var612 = protoModule.writeTag(buff, var610, 1, protoModule.wireTypes.lengthDelimited)
		var611, var612 = protoModule.writeString(var611, var612, self.badge_id)
		buff = var611
		var610 = var612
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var613, var614 = protoModule.writeTag(buff, var610, 2, protoModule.wireTypes.lengthDelimited)
		var613, var614 = protoModule.writeString(var613, var614, self.universe_id)
		buff = var613
		var610 = var614
	end
	if self.localized_literals ~= nil then
		local var615 = self.localized_literals:encode()
		local var616, var617 = protoModule.writeTag(buff, var610, 3, protoModule.wireTypes.lengthDelimited)
		var616, var617 = protoModule.writeBuffer(var616, var617, var615, buffer.len(var615))
		buff = var616
		var610 = var617
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var618, var619 = protoModule.writeTag(buff, var610, 4, protoModule.wireTypes.lengthDelimited)
		var618, var619 = protoModule.writeString(var618, var619, self.creator_key)
		buff = var618
		var610 = var619
	end
	local buff_1 = buffer.create(var610)
	buffer.copy(buff_1, 0, buff, 0, var610)
	
	return buff_1
end

function t_8.decode(p15) --[[ line: 5734 ]]
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var621 = t_8.new()
	local var622 = 0
	while var622 < buffer.len(p15) do
		local _ = nil
		local var623 = nil
		local var624, var625, var626 = protoModule.readTag(p15, var622)
		local var627 = var624
		var623 = var625
		var622 = var626
		
		if var623 == protoModule.wireTypes.varint then
			local _ = nil
			local var628, var629 = protoModule.readVarInt(p15, var622)
			local _ = var628
			var622 = var629
			continue
		end
		if var623 == protoModule.wireTypes.lengthDelimited then
			if var627 == 1 then
				local _ = nil
				local var630, var631 = protoModule.readBuffer(p15, var622)
				var622 = var631
				var621.badge_id = buffer.tostring(var630)
			elseif var627 == 2 then
				local _ = nil
				local var632, var633 = protoModule.readBuffer(p15, var622)
				var622 = var633
				var621.universe_id = buffer.tostring(var632)
			elseif var627 == 3 then
				local _ = nil
				local var634, var635 = protoModule.readBuffer(p15, var622)
				var622 = var635
				var621.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(var634)
			elseif var627 == 4 then
				local _ = nil
				local var636, var637 = protoModule.readBuffer(p15, var622)
				var622 = var637
				var621.creator_key = buffer.tostring(var636)
			else
				local _ = nil
				local var638, var639 = protoModule.readVarInt(p15, var622)
				var622 = var639 + var638
			end
		elseif var623 == protoModule.wireTypes.i32 then
			local _ = nil
			local var640, var641 = protoModule.readFixed32(p15, var622)
			local _ = var640
			var622 = var641
		elseif var623 == protoModule.wireTypes.i64 then
			local _ = nil
			local var642, var643 = protoModule.readFixed64(p15, var622)
			local _ = var642
			var622 = var643
		else
			error("Unsupported wire type: " .. var623)
		end
	end
	return var621
end

function t_8:jsonEncode() --[[ line: 5792 ]]
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

function t_8:jsonDecode() --[[ line: 5814 ]]
	-- upvalues: t_8 (ref), t (ref)
	local var645 = t_8.new()
	
	if self.badge_id ~= nil then
		var645.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var645.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var645.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var645.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var645.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var645.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var645.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var645.creator_key = self.creatorKey
	end
	return var645
end

t_8.descriptor = {
	name = "BadgeDetailsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeDetailsInputData"
}
t.BadgeDetailsInputData = t_8
typeRegistryModule.default:register(t.BadgeDetailsInputData)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16) --[[ line: 5868 ]]
	-- upvalues: t_9 (ref)
	return setmetatable({
		info_table = if p16 == nil or p16.info_table == nil then nil else p16.info_table,
		action_module = if p16 == nil or p16.action_module == nil then nil else p16.action_module,
		overflow_menu = if p16 == nil or p16.overflow_menu == nil then nil else p16.overflow_menu
	}, t_9)
end

function t_9:encode() --[[ line: 5878 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var647 = 0
	
	if self.info_table ~= nil then
		local var648 = self.info_table:encode()
		local var649, var650 = protoModule.writeTag(buff, var647, 1, protoModule.wireTypes.lengthDelimited)
		var649, var650 = protoModule.writeBuffer(var649, var650, var648, buffer.len(var648))
		buff = var649
		var647 = var650
	end
	if self.action_module ~= nil then
		local var651 = self.action_module:encode()
		local var652, var653 = protoModule.writeTag(buff, var647, 2, protoModule.wireTypes.lengthDelimited)
		var652, var653 = protoModule.writeBuffer(var652, var653, var651, buffer.len(var651))
		buff = var652
		var647 = var653
	end
	if self.overflow_menu ~= nil then
		local var654 = self.overflow_menu:encode()
		local var655, var656 = protoModule.writeTag(buff, var647, 3, protoModule.wireTypes.lengthDelimited)
		var655, var656 = protoModule.writeBuffer(var655, var656, var654, buffer.len(var654))
		buff = var655
		var647 = var656
	end
	local buff_1 = buffer.create(var647)
	buffer.copy(buff_1, 0, buff, 0, var647)
	
	return buff_1
end

function t_9.decode(p17) --[[ line: 5905 ]]
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var658 = t_9.new()
	local var659 = 0
	while var659 < buffer.len(p17) do
		local _ = nil
		local var660 = nil
		local var661, var662, var663 = protoModule.readTag(p17, var659)
		local var664 = var661
		var660 = var662
		var659 = var663
		
		if var660 == protoModule.wireTypes.varint then
			local _ = nil
			local var665, var666 = protoModule.readVarInt(p17, var659)
			local _ = var665
			var659 = var666
			continue
		end
		if var660 == protoModule.wireTypes.lengthDelimited then
			if var664 == 1 then
				local _ = nil
				local var667, var668 = protoModule.readBuffer(p17, var659)
				var659 = var668
				var658.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(var667)
			elseif var664 == 2 then
				local _ = nil
				local var669, var670 = protoModule.readBuffer(p17, var659)
				var659 = var670
				var658.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(var669)
			elseif var664 == 3 then
				local _ = nil
				local var671, var672 = protoModule.readBuffer(p17, var659)
				var659 = var672
				var658.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(var671)
			else
				local _ = nil
				local var673, var674 = protoModule.readVarInt(p17, var659)
				var659 = var674 + var673
			end
		elseif var660 == protoModule.wireTypes.i32 then
			local _ = nil
			local var675, var676 = protoModule.readFixed32(p17, var659)
			local _ = var675
			var659 = var676
		elseif var660 == protoModule.wireTypes.i64 then
			local _ = nil
			local var677, var678 = protoModule.readFixed64(p17, var659)
			local _ = var677
			var659 = var678
		else
			error("Unsupported wire type: " .. var660)
		end
	end
	return var658
end

function t_9:jsonEncode() --[[ line: 5958 ]]
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

function t_9:jsonDecode() --[[ line: 5976 ]]
	-- upvalues: t_9 (ref), t (ref)
	local var680 = t_9.new()
	
	if self.info_table ~= nil then
		var680.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var680.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var680.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var680.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var680.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var680.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var680
end

t_9.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals",
	fullName = "roblox.apppageplatform.shared.v1beta1.LocalizedLiterals"
}
t.BadgeDetailsInputData_LocalizedLiterals = t_9
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p18) --[[ line: 6027 ]]
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

function t_10:encode() --[[ line: 6046 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var682 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var683, var684 = protoModule.writeTag(buff, var682, 1, protoModule.wireTypes.lengthDelimited)
		var683, var684 = protoModule.writeString(var683, var684, self.type_label)
		buff = var683
		var682 = var684
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var685, var686 = protoModule.writeTag(buff, var682, 2, protoModule.wireTypes.lengthDelimited)
		var685, var686 = protoModule.writeString(var685, var686, self.earned_label)
		buff = var685
		var682 = var686
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var687, var688 = protoModule.writeTag(buff, var682, 3, protoModule.wireTypes.lengthDelimited)
		var687, var688 = protoModule.writeString(var687, var688, self.updated_label)
		buff = var687
		var682 = var688
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var689, var690 = protoModule.writeTag(buff, var682, 4, protoModule.wireTypes.lengthDelimited)
		var689, var690 = protoModule.writeString(var689, var690, self.experience_label)
		buff = var689
		var682 = var690
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var691, var692 = protoModule.writeTag(buff, var682, 5, protoModule.wireTypes.lengthDelimited)
		var691, var692 = protoModule.writeString(var691, var692, self.rarity_label)
		buff = var691
		var682 = var692
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var693, var694 = protoModule.writeTag(buff, var682, 6, protoModule.wireTypes.lengthDelimited)
		var693, var694 = protoModule.writeString(var693, var694, self.won_yesterday_label)
		buff = var693
		var682 = var694
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var695, var696 = protoModule.writeTag(buff, var682, 7, protoModule.wireTypes.lengthDelimited)
		var695, var696 = protoModule.writeString(var695, var696, self.won_ever_label)
		buff = var695
		var682 = var696
	end
	local buff_1 = buffer.create(var682)
	buffer.copy(buff_1, 0, buff, 0, var682)
	
	return buff_1
end

function t_10.decode(p19) --[[ line: 6092 ]]
	-- upvalues: t_10 (ref), protoModule (ref)
	local var698 = t_10.new()
	local var699 = 0
	while var699 < buffer.len(p19) do
		local _ = nil
		local var700 = nil
		local var701, var702, var703 = protoModule.readTag(p19, var699)
		local var704 = var701
		var700 = var702
		var699 = var703
		
		if var700 == protoModule.wireTypes.varint then
			local _ = nil
			local var705, var706 = protoModule.readVarInt(p19, var699)
			local _ = var705
			var699 = var706
			continue
		end
		if var700 == protoModule.wireTypes.lengthDelimited then
			if var704 == 1 then
				local _ = nil
				local var707, var708 = protoModule.readBuffer(p19, var699)
				var699 = var708
				var698.type_label = buffer.tostring(var707)
			elseif var704 == 2 then
				local _ = nil
				local var709, var710 = protoModule.readBuffer(p19, var699)
				var699 = var710
				var698.earned_label = buffer.tostring(var709)
			elseif var704 == 3 then
				local _ = nil
				local var711, var712 = protoModule.readBuffer(p19, var699)
				var699 = var712
				var698.updated_label = buffer.tostring(var711)
			elseif var704 == 4 then
				local _ = nil
				local var713, var714 = protoModule.readBuffer(p19, var699)
				var699 = var714
				var698.experience_label = buffer.tostring(var713)
			elseif var704 == 5 then
				local _ = nil
				local var715, var716 = protoModule.readBuffer(p19, var699)
				var699 = var716
				var698.rarity_label = buffer.tostring(var715)
			elseif var704 == 6 then
				local _ = nil
				local var717, var718 = protoModule.readBuffer(p19, var699)
				var699 = var718
				var698.won_yesterday_label = buffer.tostring(var717)
			elseif var704 == 7 then
				local _ = nil
				local var719, var720 = protoModule.readBuffer(p19, var699)
				var699 = var720
				var698.won_ever_label = buffer.tostring(var719)
			else
				local _ = nil
				local var721, var722 = protoModule.readVarInt(p19, var699)
				var699 = var722 + var721
			end
		elseif var700 == protoModule.wireTypes.i32 then
			local _ = nil
			local var723, var724 = protoModule.readFixed32(p19, var699)
			local _ = var723
			var699 = var724
		elseif var700 == protoModule.wireTypes.i64 then
			local _ = nil
			local var725, var726 = protoModule.readFixed64(p19, var699)
			local _ = var725
			var699 = var726
		else
			error("Unsupported wire type: " .. var700)
		end
	end
	return var698
end

function t_10:jsonEncode() --[[ line: 6167 ]]
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

function t_10:jsonDecode() --[[ line: 6203 ]]
	-- upvalues: t_10 (ref)
	local var728 = t_10.new()
	
	if self.type_label ~= nil then
		var728.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var728.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var728.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var728.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var728.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var728.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var728.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var728.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var728.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var728.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var728.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var728.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var728.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var728.won_ever_label = self.wonEverLabel
	end
	return var728
end

t_10.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_InfoTable",
	fullName = "roblox.apppageplatform.shared.v1beta1.InfoTable"
}
t.BadgeDetailsInputData_LocalizedLiterals_InfoTable = t_10
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_InfoTable)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p20) --[[ line: 6283 ]]
	-- upvalues: t_11 (ref)
	return setmetatable({
		share = if p20 == nil or p20.share == nil then "" else p20.share,
		report = if p20 == nil or p20.report == nil then "" else p20.report
	}, t_11)
end

function t_11:encode() --[[ line: 6295 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var730 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var731, var732 = protoModule.writeTag(buff, var730, 1, protoModule.wireTypes.lengthDelimited)
		var731, var732 = protoModule.writeString(var731, var732, self.share)
		buff = var731
		var730 = var732
	end
	if self.report ~= nil and self.report ~= "" then
		local var733, var734 = protoModule.writeTag(buff, var730, 2, protoModule.wireTypes.lengthDelimited)
		var733, var734 = protoModule.writeString(var733, var734, self.report)
		buff = var733
		var730 = var734
	end
	local buff_1 = buffer.create(var730)
	buffer.copy(buff_1, 0, buff, 0, var730)
	
	return buff_1
end

function t_11.decode(p21) --[[ line: 6316 ]]
	-- upvalues: t_11 (ref), protoModule (ref)
	local var736 = t_11.new()
	local var737 = 0
	while var737 < buffer.len(p21) do
		local _ = nil
		local var738 = nil
		local var739, var740, var741 = protoModule.readTag(p21, var737)
		local var742 = var739
		var738 = var740
		var737 = var741
		
		if var738 == protoModule.wireTypes.varint then
			local _ = nil
			local var743, var744 = protoModule.readVarInt(p21, var737)
			local _ = var743
			var737 = var744
			continue
		end
		if var738 == protoModule.wireTypes.lengthDelimited then
			if var742 == 1 then
				local _ = nil
				local var745, var746 = protoModule.readBuffer(p21, var737)
				var737 = var746
				var736.share = buffer.tostring(var745)
			elseif var742 == 2 then
				local _ = nil
				local var747, var748 = protoModule.readBuffer(p21, var737)
				var737 = var748
				var736.report = buffer.tostring(var747)
			else
				local _ = nil
				local var749, var750 = protoModule.readVarInt(p21, var737)
				var737 = var750 + var749
			end
		elseif var738 == protoModule.wireTypes.i32 then
			local _ = nil
			local var751, var752 = protoModule.readFixed32(p21, var737)
			local _ = var751
			var737 = var752
		elseif var738 == protoModule.wireTypes.i64 then
			local _ = nil
			local var753, var754 = protoModule.readFixed64(p21, var737)
			local _ = var753
			var737 = var754
		else
			error("Unsupported wire type: " .. var738)
		end
	end
	return var736
end

function t_11:jsonEncode() --[[ line: 6366 ]]
	local t = {}
	
	if self.share ~= nil and self.share ~= "" then
		t.share = self.share
	end
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	return t
end

function t_11:jsonDecode() --[[ line: 6382 ]]
	-- upvalues: t_11 (ref)
	local var756 = t_11.new()
	
	if self.share ~= nil then
		var756.share = self.share
	end
	if self.report ~= nil then
		var756.report = self.report
	end
	return var756
end

t_11.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_ActionModule",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionModule"
}
t.BadgeDetailsInputData_LocalizedLiterals_ActionModule = t_11
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_ActionModule)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p22) --[[ line: 6414 ]]
	-- upvalues: t_12 (ref)
	return setmetatable({
		report = if p22 == nil or p22.report == nil then "" else p22.report,
		remove = if p22 == nil or p22.remove == nil then "" else p22.remove
	}, t_12)
end

function t_12:encode() --[[ line: 6426 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var758 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var759, var760 = protoModule.writeTag(buff, var758, 1, protoModule.wireTypes.lengthDelimited)
		var759, var760 = protoModule.writeString(var759, var760, self.report)
		buff = var759
		var758 = var760
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var761, var762 = protoModule.writeTag(buff, var758, 2, protoModule.wireTypes.lengthDelimited)
		var761, var762 = protoModule.writeString(var761, var762, self.remove)
		buff = var761
		var758 = var762
	end
	local buff_1 = buffer.create(var758)
	buffer.copy(buff_1, 0, buff, 0, var758)
	
	return buff_1
end

function t_12.decode(p23) --[[ line: 6447 ]]
	-- upvalues: t_12 (ref), protoModule (ref)
	local var764 = t_12.new()
	local var765 = 0
	while var765 < buffer.len(p23) do
		local _ = nil
		local var766 = nil
		local var767, var768, var769 = protoModule.readTag(p23, var765)
		local var770 = var767
		var766 = var768
		var765 = var769
		
		if var766 == protoModule.wireTypes.varint then
			local _ = nil
			local var771, var772 = protoModule.readVarInt(p23, var765)
			local _ = var771
			var765 = var772
			continue
		end
		if var766 == protoModule.wireTypes.lengthDelimited then
			if var770 == 1 then
				local _ = nil
				local var773, var774 = protoModule.readBuffer(p23, var765)
				var765 = var774
				var764.report = buffer.tostring(var773)
			elseif var770 == 2 then
				local _ = nil
				local var775, var776 = protoModule.readBuffer(p23, var765)
				var765 = var776
				var764.remove = buffer.tostring(var775)
			else
				local _ = nil
				local var777, var778 = protoModule.readVarInt(p23, var765)
				var765 = var778 + var777
			end
		elseif var766 == protoModule.wireTypes.i32 then
			local _ = nil
			local var779, var780 = protoModule.readFixed32(p23, var765)
			local _ = var779
			var765 = var780
		elseif var766 == protoModule.wireTypes.i64 then
			local _ = nil
			local var781, var782 = protoModule.readFixed64(p23, var765)
			local _ = var781
			var765 = var782
		else
			error("Unsupported wire type: " .. var766)
		end
	end
	return var764
end

function t_12:jsonEncode() --[[ line: 6497 ]]
	local t = {}
	
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	if self.remove ~= nil and self.remove ~= "" then
		t.remove = self.remove
	end
	return t
end

function t_12:jsonDecode() --[[ line: 6513 ]]
	-- upvalues: t_12 (ref)
	local var784 = t_12.new()
	
	if self.report ~= nil then
		var784.report = self.report
	end
	if self.remove ~= nil then
		var784.remove = self.remove
	end
	return var784
end

t_12.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_OverflowMenu",
	fullName = "roblox.apppageplatform.shared.v1beta1.OverflowMenu"
}
t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = t_12
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu)
local t_13 = {}
t_13.__index = t_13

function t_13.new(_) --[[ line: 6544 ]]
	-- upvalues: t_13 (ref)
	return setmetatable({}, t_13)
end

function t_13.encode(_) --[[ line: 6548 ]]
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_13.decode(p24) --[[ line: 6557 ]]
	-- upvalues: t_13 (ref), protoModule (ref)
	local var786 = t_13.new()
	local var787 = 0
	while var787 < buffer.len(p24) do
		local var788 = nil
		local _ = nil
		local var789, var790, var791 = protoModule.readTag(p24, var787)
		var788 = var789
		local var792 = var790
		var787 = var791
		
		if var792 == protoModule.wireTypes.varint then
			local _ = nil
			local var793, var794 = protoModule.readVarInt(p24, var787)
			local _ = var793
			var787 = var794
		elseif var792 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var795, var796 = protoModule.readVarInt(p24, var787)
			var787 = var796 + var795
		elseif var792 == protoModule.wireTypes.i32 then
			local _ = nil
			local var797, var798 = protoModule.readFixed32(p24, var787)
			local _ = var797
			var787 = var798
		elseif var792 == protoModule.wireTypes.i64 then
			local _ = nil
			local var799, var800 = protoModule.readFixed64(p24, var787)
			local _ = var799
			var787 = var800
		else
			error("Unsupported wire type: " .. var792)
		end
	end
	return var786
end

function t_13.jsonEncode(_) --[[ line: 6595 ]]
	return {}
end

function t_13.jsonDecode(_) --[[ line: 6601 ]]
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

function t_14.new(p25) --[[ line: 6621 ]]
	-- upvalues: t_14 (ref)
	return setmetatable({
		universe_id = if p25 == nil or p25.universe_id == nil then "" else p25.universe_id,
		creator_key = if p25 == nil or p25.creator_key == nil then "" else p25.creator_key,
		entry_map = if p25 == nil or p25.entry_map == nil then {} else p25.entry_map,
		entry_order = if p25 == nil or p25.entry_order == nil then {} else p25.entry_order,
		entry_order_map = if p25 == nil or p25.entry_order_map == nil then {} else p25.entry_order_map
	}, t_14)
end

function t_14:encode() --[[ line: 6633 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var802 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var803, var804 = protoModule.writeTag(buff, var802, 1, protoModule.wireTypes.lengthDelimited)
		var803, var804 = protoModule.writeString(var803, var804, self.universe_id)
		buff = var803
		var802 = var804
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var805, var806 = protoModule.writeTag(buff, var802, 2, protoModule.wireTypes.lengthDelimited)
		var805, var806 = protoModule.writeString(var805, var806, self.creator_key)
		buff = var805
		var802 = var806
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var807, var808 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var807, var808 = protoModule.writeString(var807, var808, i)
			local var809 = v:encode()
			var808, var810 = protoModule.writeTag(var807, var808, 2, protoModule.wireTypes.lengthDelimited)
			var808, var810 = protoModule.writeBuffer(var808, var810, var809, buffer.len(var809))
			local var811 = var808
			local var812 = var810
			local var813, var814 = protoModule.writeTag(buff, var802, 3, protoModule.wireTypes.lengthDelimited)
			var813, var814 = protoModule.writeBuffer(var813, var814, var811, var812)
			buff = var813
			var802 = var814
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var815, var816 = protoModule.writeTag(buff, var802, 4, protoModule.wireTypes.lengthDelimited)
			var815, var816 = protoModule.writeString(var815, var816, v)
			buff = var815
			var802 = var816
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var817, var818 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var817, var818 = protoModule.writeString(var817, var818, i)
			local var819 = v:encode()
			var818, var820 = protoModule.writeTag(var817, var818, 2, protoModule.wireTypes.lengthDelimited)
			var818, var820 = protoModule.writeBuffer(var818, var820, var819, buffer.len(var819))
			local var821 = var818
			local var822 = var820
			local var823, var824 = protoModule.writeTag(buff, var802, 5, protoModule.wireTypes.lengthDelimited)
			var823, var824 = protoModule.writeBuffer(var823, var824, var821, var822)
			buff = var823
			var802 = var824
		end
	end
	local buff_1 = buffer.create(var802)
	buffer.copy(buff_1, 0, buff, 0, var802)
	
	return buff_1
end

function t_14.decode(p26) --[[ line: 6687 ]]
	-- upvalues: t_14 (ref), protoModule (ref), t (ref)
	local var826 = t_14.new()
	local var827 = 0
	while var827 < buffer.len(p26) do
		local _ = nil
		local var828 = nil
		local var829, var830, var831 = protoModule.readTag(p26, var827)
		local var832 = var829
		var828 = var830
		var827 = var831
		
		if var828 == protoModule.wireTypes.varint then
			local _ = nil
			local var833, var834 = protoModule.readVarInt(p26, var827)
			local _ = var833
			var827 = var834
			continue
		end
		if var828 == protoModule.wireTypes.lengthDelimited then
			if var832 == 1 then
				local _ = nil
				local var835, var836 = protoModule.readBuffer(p26, var827)
				var827 = var836
				var826.universe_id = buffer.tostring(var835)
			elseif var832 == 2 then
				local _ = nil
				local var837, var838 = protoModule.readBuffer(p26, var827)
				var827 = var838
				var826.creator_key = buffer.tostring(var837)
			elseif var832 == 3 then
				local _ = nil
				local var839, var840 = protoModule.readBuffer(p26, var827)
				var827 = var840
				var839 = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(var839)
				var826.entry_map[var839.key or ""] = var839.value or t.FeedEntry.new()
			elseif var832 == 4 then
				local _ = nil
				local var841, var842 = protoModule.readBuffer(p26, var827)
				var827 = var842
				table.insert(var826.entry_order, buffer.tostring(var841))
			elseif var832 == 5 then
				local _ = nil
				local var843, var844 = protoModule.readBuffer(p26, var827)
				var827 = var844
				var843 = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(var843)
				var826.entry_order_map[var843.key or ""] = var843.value or t.EntryOrder.new()
			else
				local _ = nil
				local var845, var846 = protoModule.readVarInt(p26, var827)
				var827 = var846 + var845
			end
		elseif var828 == protoModule.wireTypes.i32 then
			local _ = nil
			local var847, var848 = protoModule.readFixed32(p26, var827)
			local _ = var847
			var827 = var848
		elseif var828 == protoModule.wireTypes.i64 then
			local _ = nil
			local var849, var850 = protoModule.readFixed64(p26, var827)
			local _ = var849
			var827 = var850
		else
			error("Unsupported wire type: " .. var828)
		end
	end
	return var826
end

function t_14:jsonEncode() --[[ line: 6764 ]]
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

function t_14:jsonDecode() --[[ line: 6802 ]]
	-- upvalues: t_14 (ref), t (ref)
	local var855 = t_14.new()
	
	if self.universe_id ~= nil then
		var855.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var855.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var855.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var855.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var855.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var855.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var855.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var855.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var855.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var855.entry_order_map = t_1
	end
	return var855
end

t_14.descriptor = {
	name = "ExperienceDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsFeedInputData"
}
t.ExperienceDetailsFeedInputData = t_14
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p27) --[[ line: 6892 ]]
	-- upvalues: t_15 (ref)
	return setmetatable({
		key = if p27 == nil or p27.key == nil then "" else p27.key,
		value = if p27 == nil or p27.value == nil then nil else p27.value
	}, t_15)
end

function t_15:encode() --[[ line: 6901 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var863 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var864, var865 = protoModule.writeTag(buff, var863, 1, protoModule.wireTypes.lengthDelimited)
		var864, var865 = protoModule.writeString(var864, var865, self.key)
		buff = var864
		var863 = var865
	end
	if self.value ~= nil then
		local var866 = self.value:encode()
		local var867, var868 = protoModule.writeTag(buff, var863, 2, protoModule.wireTypes.lengthDelimited)
		var867, var868 = protoModule.writeBuffer(var867, var868, var866, buffer.len(var866))
		buff = var867
		var863 = var868
	end
	local buff_1 = buffer.create(var863)
	buffer.copy(buff_1, 0, buff, 0, var863)
	
	return buff_1
end

function t_15.decode(p28) --[[ line: 6923 ]]
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var870 = t_15.new()
	local var871 = 0
	while var871 < buffer.len(p28) do
		local _ = nil
		local var872 = nil
		local var873, var874, var875 = protoModule.readTag(p28, var871)
		local var876 = var873
		var872 = var874
		var871 = var875
		
		if var872 == protoModule.wireTypes.varint then
			local _ = nil
			local var877, var878 = protoModule.readVarInt(p28, var871)
			local _ = var877
			var871 = var878
			continue
		end
		if var872 == protoModule.wireTypes.lengthDelimited then
			if var876 == 1 then
				local _ = nil
				local var879, var880 = protoModule.readBuffer(p28, var871)
				var871 = var880
				var870.key = buffer.tostring(var879)
			elseif var876 == 2 then
				local _ = nil
				local var881, var882 = protoModule.readBuffer(p28, var871)
				var871 = var882
				var870.value = t.FeedEntry.decode(var881)
			else
				local _ = nil
				local var883, var884 = protoModule.readVarInt(p28, var871)
				var871 = var884 + var883
			end
		elseif var872 == protoModule.wireTypes.i32 then
			local _ = nil
			local var885, var886 = protoModule.readFixed32(p28, var871)
			local _ = var885
			var871 = var886
		elseif var872 == protoModule.wireTypes.i64 then
			local _ = nil
			local var887, var888 = protoModule.readFixed64(p28, var871)
			local _ = var887
			var871 = var888
		else
			error("Unsupported wire type: " .. var872)
		end
	end
	return var870
end

function t_15:jsonEncode() --[[ line: 6973 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_15:jsonDecode() --[[ line: 6989 ]]
	-- upvalues: t_15 (ref), t (ref)
	local var890 = t_15.new()
	
	if self.key ~= nil then
		var890.key = self.key
	end
	if self.value ~= nil then
		var890.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var890
end

t_15.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryMapEntry = t_15
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryMapEntry)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p29) --[[ line: 7020 ]]
	-- upvalues: t_16 (ref)
	return setmetatable({
		key = if p29 == nil or p29.key == nil then "" else p29.key,
		value = if p29 == nil or p29.value == nil then nil else p29.value
	}, t_16)
end

function t_16:encode() --[[ line: 7032 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var892 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var893, var894 = protoModule.writeTag(buff, var892, 1, protoModule.wireTypes.lengthDelimited)
		var893, var894 = protoModule.writeString(var893, var894, self.key)
		buff = var893
		var892 = var894
	end
	if self.value ~= nil then
		local var895 = self.value:encode()
		local var896, var897 = protoModule.writeTag(buff, var892, 2, protoModule.wireTypes.lengthDelimited)
		var896, var897 = protoModule.writeBuffer(var896, var897, var895, buffer.len(var895))
		buff = var896
		var892 = var897
	end
	local buff_1 = buffer.create(var892)
	buffer.copy(buff_1, 0, buff, 0, var892)
	
	return buff_1
end

function t_16.decode(p30) --[[ line: 7054 ]]
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var899 = t_16.new()
	local var900 = 0
	while var900 < buffer.len(p30) do
		local _ = nil
		local var901 = nil
		local var902, var903, var904 = protoModule.readTag(p30, var900)
		local var905 = var902
		var901 = var903
		var900 = var904
		
		if var901 == protoModule.wireTypes.varint then
			local _ = nil
			local var906, var907 = protoModule.readVarInt(p30, var900)
			local _ = var906
			var900 = var907
			continue
		end
		if var901 == protoModule.wireTypes.lengthDelimited then
			if var905 == 1 then
				local _ = nil
				local var908, var909 = protoModule.readBuffer(p30, var900)
				var900 = var909
				var899.key = buffer.tostring(var908)
			elseif var905 == 2 then
				local _ = nil
				local var910, var911 = protoModule.readBuffer(p30, var900)
				var900 = var911
				var899.value = t.EntryOrder.decode(var910)
			else
				local _ = nil
				local var912, var913 = protoModule.readVarInt(p30, var900)
				var900 = var913 + var912
			end
		elseif var901 == protoModule.wireTypes.i32 then
			local _ = nil
			local var914, var915 = protoModule.readFixed32(p30, var900)
			local _ = var914
			var900 = var915
		elseif var901 == protoModule.wireTypes.i64 then
			local _ = nil
			local var916, var917 = protoModule.readFixed64(p30, var900)
			local _ = var916
			var900 = var917
		else
			error("Unsupported wire type: " .. var901)
		end
	end
	return var899
end

function t_16:jsonEncode() --[[ line: 7104 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_16:jsonDecode() --[[ line: 7120 ]]
	-- upvalues: t_16 (ref), t (ref)
	local var919 = t_16.new()
	
	if self.key ~= nil then
		var919.key = self.key
	end
	if self.value ~= nil then
		var919.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var919
end

t_16.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryOrderMapEntry = t_16
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryOrderMapEntry)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p31) --[[ line: 7151 ]]
	-- upvalues: t_17 (ref)
	return setmetatable({
		items = if p31 == nil or p31.items == nil then {} else p31.items
	}, t_17)
end

function t_17:encode() --[[ line: 7157 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var921 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var922, var923 = protoModule.writeTag(buff, var921, 1, protoModule.wireTypes.lengthDelimited)
			var922, var923 = protoModule.writeString(var922, var923, v)
			buff = var922
			var921 = var923
		end
	end
	local buff_1 = buffer.create(var921)
	buffer.copy(buff_1, 0, buff, 0, var921)
	
	return buff_1
end

function t_17.decode(p32) --[[ line: 7173 ]]
	-- upvalues: t_17 (ref), protoModule (ref)
	local var925 = t_17.new()
	local var926 = 0
	while var926 < buffer.len(p32) do
		local _ = nil
		local var927 = nil
		local var928, var929, var930 = protoModule.readTag(p32, var926)
		local var931 = var928
		var927 = var929
		var926 = var930
		
		if var927 == protoModule.wireTypes.varint then
			local _ = nil
			local var932, var933 = protoModule.readVarInt(p32, var926)
			local _ = var932
			var926 = var933
			continue
		end
		if var927 == protoModule.wireTypes.lengthDelimited then
			if var931 == 1 then
				local _ = nil
				local var934, var935 = protoModule.readBuffer(p32, var926)
				var926 = var935
				table.insert(var925.items, buffer.tostring(var934))
			else
				local _ = nil
				local var936, var937 = protoModule.readVarInt(p32, var926)
				var926 = var937 + var936
			end
		elseif var927 == protoModule.wireTypes.i32 then
			local _ = nil
			local var938, var939 = protoModule.readFixed32(p32, var926)
			local _ = var938
			var926 = var939
		elseif var927 == protoModule.wireTypes.i64 then
			local _ = nil
			local var940, var941 = protoModule.readFixed64(p32, var926)
			local _ = var940
			var926 = var941
		else
			error("Unsupported wire type: " .. var927)
		end
	end
	return var925
end

function t_17:jsonEncode() --[[ line: 7216 ]]
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

function t_17:jsonDecode() --[[ line: 7230 ]]
	-- upvalues: t_17 (ref)
	local var944 = t_17.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var944.items = t
	end
	return var944
end

t_17.descriptor = {
	name = "EntryOrder",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrder"
}
t.EntryOrder = t_17
typeRegistryModule.default:register(t.EntryOrder)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p33) --[[ line: 7259 ]]
	-- upvalues: t_18 (ref)
	return setmetatable({
		universe_id = if p33 == nil or p33.universe_id == nil then "" else p33.universe_id,
		user_owns_experience = if p33 == nil or p33.user_owns_experience == nil then false else p33.user_owns_experience
	}, t_18)
end

function t_18:encode() --[[ line: 7270 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var947 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var948, var949 = protoModule.writeTag(buff, var947, 1, protoModule.wireTypes.lengthDelimited)
		var948, var949 = protoModule.writeString(var948, var949, self.universe_id)
		buff = var948
		var947 = var949
	end
	if self.user_owns_experience then
		local var950, var951 = protoModule.writeTag(buff, var947, 2, protoModule.wireTypes.varint)
		var950, var951 = protoModule.writeVarInt(var950, var951, if self.user_owns_experience then 1 else 0)
		buff = var950
		var947 = var951
	end
	local buff_1 = buffer.create(var947)
	buffer.copy(buff_1, 0, buff, 0, var947)
	
	return buff_1
end

function t_18.decode(p34) --[[ line: 7289 ]]
	-- upvalues: t_18 (ref), protoModule (ref)
	local var953 = t_18.new()
	local var954 = 0
	while var954 < buffer.len(p34) do
		local _ = nil
		local var955 = nil
		local var956, var957, var958 = protoModule.readTag(p34, var954)
		local var959 = var956
		var955 = var957
		var954 = var958
		
		if var955 == protoModule.wireTypes.varint then
			if var959 == 2 then
				local _ = nil
				local var960, var961 = protoModule.readVarInt(p34, var954)
				var954 = var961
				var953.user_owns_experience = var960 ~= 0
			else
				local _ = nil
				local var962, var963 = protoModule.readVarInt(p34, var954)
				local _ = var962
				var954 = var963
			end
		end
		if var955 == protoModule.wireTypes.lengthDelimited then
			if var959 == 1 then
				local _ = nil
				local var964, var965 = protoModule.readBuffer(p34, var954)
				var954 = var965
				var953.universe_id = buffer.tostring(var964)
			else
				local _ = nil
				local var966, var967 = protoModule.readVarInt(p34, var954)
				var954 = var967 + var966
			end
		elseif var955 == protoModule.wireTypes.i32 then
			local _ = nil
			local var968, var969 = protoModule.readFixed32(p34, var954)
			local _ = var968
			var954 = var969
		elseif var955 == protoModule.wireTypes.i64 then
			local _ = nil
			local var970, var971 = protoModule.readFixed64(p34, var954)
			local _ = var970
			var954 = var971
		else
			error("Unsupported wire type: " .. var955)
		end
	end
	return var953
end

function t_18:jsonEncode() --[[ line: 7337 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function t_18:jsonDecode() --[[ line: 7351 ]]
	-- upvalues: t_18 (ref)
	local var973 = t_18.new()
	
	if self.universe_id ~= nil then
		var973.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var973.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var973.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var973.user_owns_experience = self.userOwnsExperience
	end
	return var973
end

t_18.descriptor = {
	name = "ExperienceDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsActionBarInputData"
}
t.ExperienceDetailsActionBarInputData = t_18
typeRegistryModule.default:register(t.ExperienceDetailsActionBarInputData)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p35) --[[ line: 7389 ]]
	-- upvalues: t_19 (ref)
	return setmetatable({
		media_asset_id = if p35 == nil or p35.media_asset_id == nil then "" else p35.media_asset_id
	}, t_19)
end

function t_19:encode() --[[ line: 7397 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var975 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var976, var977 = protoModule.writeTag(buff, var975, 1, protoModule.wireTypes.lengthDelimited)
		var976, var977 = protoModule.writeString(var976, var977, self.media_asset_id)
		buff = var976
		var975 = var977
	end
	local buff_1 = buffer.create(var975)
	buffer.copy(buff_1, 0, buff, 0, var975)
	
	return buff_1
end

function t_19.decode(p36) --[[ line: 7411 ]]
	-- upvalues: t_19 (ref), protoModule (ref)
	local var979 = t_19.new()
	local var980 = 0
	while var980 < buffer.len(p36) do
		local _ = nil
		local var981 = nil
		local var982, var983, var984 = protoModule.readTag(p36, var980)
		local var985 = var982
		var981 = var983
		var980 = var984
		
		if var981 == protoModule.wireTypes.varint then
			local _ = nil
			local var986, var987 = protoModule.readVarInt(p36, var980)
			local _ = var986
			var980 = var987
			continue
		end
		if var981 == protoModule.wireTypes.lengthDelimited then
			if var985 == 1 then
				local _ = nil
				local var988, var989 = protoModule.readBuffer(p36, var980)
				var980 = var989
				var979.media_asset_id = buffer.tostring(var988)
			else
				local _ = nil
				local var990, var991 = protoModule.readVarInt(p36, var980)
				var980 = var991 + var990
			end
		elseif var981 == protoModule.wireTypes.i32 then
			local _ = nil
			local var992, var993 = protoModule.readFixed32(p36, var980)
			local _ = var992
			var980 = var993
		elseif var981 == protoModule.wireTypes.i64 then
			local _ = nil
			local var994, var995 = protoModule.readFixed64(p36, var980)
			local _ = var994
			var980 = var995
		else
			error("Unsupported wire type: " .. var981)
		end
	end
	return var979
end

function t_19:jsonEncode() --[[ line: 7454 ]]
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function t_19:jsonDecode() --[[ line: 7464 ]]
	-- upvalues: t_19 (ref)
	local var997 = t_19.new()
	
	if self.media_asset_id ~= nil then
		var997.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var997.media_asset_id = self.mediaAssetId
	end
	return var997
end

t_19.descriptor = {
	name = "ExperienceDetailsBannerImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsBannerImageInputData"
}
t.ExperienceDetailsBannerImageInputData = t_19
typeRegistryModule.default:register(t.ExperienceDetailsBannerImageInputData)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p37) --[[ line: 7494 ]]
	-- upvalues: t_20 (ref)
	return setmetatable({
		universe_id = if p37 == nil or p37.universe_id == nil then "" else p37.universe_id
	}, t_20)
end

function t_20:encode() --[[ line: 7502 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var999 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1000, var1001 = protoModule.writeTag(buff, var999, 1, protoModule.wireTypes.lengthDelimited)
		var1000, var1001 = protoModule.writeString(var1000, var1001, self.universe_id)
		buff = var1000
		var999 = var1001
	end
	local buff_1 = buffer.create(var999)
	buffer.copy(buff_1, 0, buff, 0, var999)
	
	return buff_1
end

function t_20.decode(p38) --[[ line: 7516 ]]
	-- upvalues: t_20 (ref), protoModule (ref)
	local var1003 = t_20.new()
	local var1004 = 0
	while var1004 < buffer.len(p38) do
		local _ = nil
		local var1005 = nil
		local var1006, var1007, var1008 = protoModule.readTag(p38, var1004)
		local var1009 = var1006
		var1005 = var1007
		var1004 = var1008
		
		if var1005 == protoModule.wireTypes.varint then
			local _ = nil
			local var1010, var1011 = protoModule.readVarInt(p38, var1004)
			local _ = var1010
			var1004 = var1011
			continue
		end
		if var1005 == protoModule.wireTypes.lengthDelimited then
			if var1009 == 1 then
				local _ = nil
				local var1012, var1013 = protoModule.readBuffer(p38, var1004)
				var1004 = var1013
				var1003.universe_id = buffer.tostring(var1012)
			else
				local _ = nil
				local var1014, var1015 = protoModule.readVarInt(p38, var1004)
				var1004 = var1015 + var1014
			end
		elseif var1005 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1016, var1017 = protoModule.readFixed32(p38, var1004)
			local _ = var1016
			var1004 = var1017
		elseif var1005 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1018, var1019 = protoModule.readFixed64(p38, var1004)
			local _ = var1018
			var1004 = var1019
		else
			error("Unsupported wire type: " .. var1005)
		end
	end
	return var1003
end

function t_20:jsonEncode() --[[ line: 7559 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_20:jsonDecode() --[[ line: 7569 ]]
	-- upvalues: t_20 (ref)
	local var1021 = t_20.new()
	
	if self.universe_id ~= nil then
		var1021.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1021.universe_id = self.universeId
	end
	return var1021
end

t_20.descriptor = {
	name = "ExperienceDetailsStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsStickyHeaderInputData"
}
t.ExperienceDetailsStickyHeaderInputData = t_20
typeRegistryModule.default:register(t.ExperienceDetailsStickyHeaderInputData)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p39) --[[ line: 7599 ]]
	-- upvalues: t_21 (ref)
	return setmetatable({
		universe_id = if p39 == nil or p39.universe_id == nil then "" else p39.universe_id,
		creator_key = if p39 == nil or p39.creator_key == nil then "" else p39.creator_key
	}, t_21)
end

function t_21:encode() --[[ line: 7608 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1023 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1024, var1025 = protoModule.writeTag(buff, var1023, 1, protoModule.wireTypes.lengthDelimited)
		var1024, var1025 = protoModule.writeString(var1024, var1025, self.universe_id)
		buff = var1024
		var1023 = var1025
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1026, var1027 = protoModule.writeTag(buff, var1023, 2, protoModule.wireTypes.lengthDelimited)
		var1026, var1027 = protoModule.writeString(var1026, var1027, self.creator_key)
		buff = var1026
		var1023 = var1027
	end
	local buff_1 = buffer.create(var1023)
	buffer.copy(buff_1, 0, buff, 0, var1023)
	
	return buff_1
end

function t_21.decode(p40) --[[ line: 7627 ]]
	-- upvalues: t_21 (ref), protoModule (ref)
	local var1029 = t_21.new()
	local var1030 = 0
	while var1030 < buffer.len(p40) do
		local _ = nil
		local var1031 = nil
		local var1032, var1033, var1034 = protoModule.readTag(p40, var1030)
		local var1035 = var1032
		var1031 = var1033
		var1030 = var1034
		
		if var1031 == protoModule.wireTypes.varint then
			local _ = nil
			local var1036, var1037 = protoModule.readVarInt(p40, var1030)
			local _ = var1036
			var1030 = var1037
			continue
		end
		if var1031 == protoModule.wireTypes.lengthDelimited then
			if var1035 == 1 then
				local _ = nil
				local var1038, var1039 = protoModule.readBuffer(p40, var1030)
				var1030 = var1039
				var1029.universe_id = buffer.tostring(var1038)
			elseif var1035 == 2 then
				local _ = nil
				local var1040, var1041 = protoModule.readBuffer(p40, var1030)
				var1030 = var1041
				var1029.creator_key = buffer.tostring(var1040)
			else
				local _ = nil
				local var1042, var1043 = protoModule.readVarInt(p40, var1030)
				var1030 = var1043 + var1042
			end
		elseif var1031 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1044, var1045 = protoModule.readFixed32(p40, var1030)
			local _ = var1044
			var1030 = var1045
		elseif var1031 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1046, var1047 = protoModule.readFixed64(p40, var1030)
			local _ = var1046
			var1030 = var1047
		else
			error("Unsupported wire type: " .. var1031)
		end
	end
	return var1029
end

function t_21:jsonEncode() --[[ line: 7675 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function t_21:jsonDecode() --[[ line: 7689 ]]
	-- upvalues: t_21 (ref)
	local var1049 = t_21.new()
	
	if self.universe_id ~= nil then
		var1049.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1049.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var1049.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1049.creator_key = self.creatorKey
	end
	return var1049
end

t_21.descriptor = {
	name = "ExperienceAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceAttributionRowInputData"
}
t.ExperienceAttributionRowInputData = t_21
typeRegistryModule.default:register(t.ExperienceAttributionRowInputData)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p41) --[[ line: 7727 ]]
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

function t_22:encode() --[[ line: 7749 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1051 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1052, var1053 = protoModule.writeTag(buff, var1051, 1, protoModule.wireTypes.lengthDelimited)
		var1052, var1053 = protoModule.writeString(var1052, var1053, self.universe_id)
		buff = var1052
		var1051 = var1053
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var1054, var1055 = protoModule.writeTag(buff, var1051, 2, protoModule.wireTypes.lengthDelimited)
		var1054, var1055 = protoModule.writeString(var1054, var1055, self.root_place_id)
		buff = var1054
		var1051 = var1055
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var1056, var1057 = protoModule.writeTag(buff, var1051, 3, protoModule.wireTypes.lengthDelimited)
		var1056, var1057 = protoModule.writeString(var1056, var1057, self.connection_played_display_name)
		buff = var1056
		var1051 = var1057
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1058, var1059 = protoModule.writeTag(buff, var1051, 4, protoModule.wireTypes.lengthDelimited)
		var1058, var1059 = protoModule.writeString(var1058, var1059, self.upsell_prompt)
		buff = var1058
		var1051 = var1059
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var1060 = v:encode()
			local var1061, var1062 = protoModule.writeTag(buff, var1051, 5, protoModule.wireTypes.lengthDelimited)
			var1061, var1062 = protoModule.writeBuffer(var1061, var1062, var1060, buffer.len(var1060))
			buff = var1061
			var1051 = var1062
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var1063, var1064 = protoModule.writeTag(buff, var1051, 6, protoModule.wireTypes.varint)
		var1063, var1064 = protoModule.writeVarInt(var1063, var1064, self.connection_played_num_others)
		buff = var1063
		var1051 = var1064
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var1065, var1066 = protoModule.writeTag(buff, var1051, 7, protoModule.wireTypes.varint)
		var1065, var1066 = protoModule.writeVarInt(var1065, var1066, self.connection_played_total_count)
		buff = var1065
		var1051 = var1066
	end
	local buff_1 = buffer.create(var1051)
	buffer.copy(buff_1, 0, buff, 0, var1051)
	
	return buff_1
end

function t_22.decode(p42) --[[ line: 7796 ]]
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var1068 = t_22.new()
	local var1069 = 0
	while var1069 < buffer.len(p42) do
		local _ = nil
		local var1070 = nil
		local var1071, var1072, var1073 = protoModule.readTag(p42, var1069)
		local var1074 = var1071
		var1070 = var1072
		var1069 = var1073
		
		if var1070 == protoModule.wireTypes.varint then
			if var1074 == 6 then
				local _ = nil
				local var1075, var1076 = protoModule.readVarIntI32(p42, var1069)
				var1069 = var1076
				var1068.connection_played_num_others = var1075
			elseif var1074 == 7 then
				local _ = nil
				local var1077, var1078 = protoModule.readVarIntI32(p42, var1069)
				var1069 = var1078
				var1068.connection_played_total_count = var1077
			else
				local _ = nil
				local var1079, var1080 = protoModule.readVarInt(p42, var1069)
				local _ = var1079
				var1069 = var1080
			end
		end
		if var1070 == protoModule.wireTypes.lengthDelimited then
			if var1074 == 1 then
				local _ = nil
				local var1081, var1082 = protoModule.readBuffer(p42, var1069)
				var1069 = var1082
				var1068.universe_id = buffer.tostring(var1081)
			elseif var1074 == 2 then
				local _ = nil
				local var1083, var1084 = protoModule.readBuffer(p42, var1069)
				var1069 = var1084
				var1068.root_place_id = buffer.tostring(var1083)
			elseif var1074 == 3 then
				local _ = nil
				local var1085, var1086 = protoModule.readBuffer(p42, var1069)
				var1069 = var1086
				var1068.connection_played_display_name = buffer.tostring(var1085)
			elseif var1074 == 4 then
				local _ = nil
				local var1087, var1088 = protoModule.readBuffer(p42, var1069)
				var1069 = var1088
				var1068.upsell_prompt = buffer.tostring(var1087)
			elseif var1074 == 5 then
				local _ = nil
				local var1089, var1090 = protoModule.readBuffer(p42, var1069)
				var1069 = var1090
				table.insert(var1068.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(var1089))
			else
				local _ = nil
				local var1091, var1092 = protoModule.readVarInt(p42, var1069)
				var1069 = var1092 + var1091
			end
		elseif var1070 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1093, var1094 = protoModule.readFixed32(p42, var1069)
			local _ = var1093
			var1069 = var1094
		elseif var1070 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1095, var1096 = protoModule.readFixed64(p42, var1069)
			local _ = var1095
			var1069 = var1096
		else
			error("Unsupported wire type: " .. var1070)
		end
	end
	return var1068
end

function t_22:jsonEncode() --[[ line: 7872 ]]
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

function t_22:jsonDecode() --[[ line: 7910 ]]
	-- upvalues: t_22 (ref), t (ref)
	local var1099 = t_22.new()
	
	if self.universe_id ~= nil then
		var1099.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1099.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		var1099.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var1099.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		var1099.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		var1099.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		var1099.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1099.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var1099.connection_played_users = t_1
	end
	if self.connectionPlayedUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.connectionPlayedUsers do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var1099.connection_played_users = t_1
	end
	if self.connection_played_num_others ~= nil then
		var1099.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		var1099.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		var1099.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		var1099.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return var1099
end

t_22.descriptor = {
	name = "ExperienceActionModuleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceActionModuleInputData"
}
t.ExperienceActionModuleInputData = t_22
typeRegistryModule.default:register(t.ExperienceActionModuleInputData)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p43) --[[ line: 7997 ]]
	-- upvalues: t_23 (ref)
	return setmetatable({
		user_id = if p43 == nil or p43.user_id == nil then "" else p43.user_id
	}, t_23)
end

function t_23:encode() --[[ line: 8008 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1103 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1104, var1105 = protoModule.writeTag(buff, var1103, 1, protoModule.wireTypes.lengthDelimited)
		var1104, var1105 = protoModule.writeString(var1104, var1105, self.user_id)
		buff = var1104
		var1103 = var1105
	end
	local buff_1 = buffer.create(var1103)
	buffer.copy(buff_1, 0, buff, 0, var1103)
	
	return buff_1
end

function t_23.decode(p44) --[[ line: 8024 ]]
	-- upvalues: t_23 (ref), protoModule (ref)
	local var1107 = t_23.new()
	local var1108 = 0
	while var1108 < buffer.len(p44) do
		local _ = nil
		local var1109 = nil
		local var1110, var1111, var1112 = protoModule.readTag(p44, var1108)
		local var1113 = var1110
		var1109 = var1111
		var1108 = var1112
		
		if var1109 == protoModule.wireTypes.varint then
			local _ = nil
			local var1114, var1115 = protoModule.readVarInt(p44, var1108)
			local _ = var1114
			var1108 = var1115
			continue
		end
		if var1109 == protoModule.wireTypes.lengthDelimited then
			if var1113 == 1 then
				local _ = nil
				local var1116, var1117 = protoModule.readBuffer(p44, var1108)
				var1108 = var1117
				var1107.user_id = buffer.tostring(var1116)
			else
				local _ = nil
				local var1118, var1119 = protoModule.readVarInt(p44, var1108)
				var1108 = var1119 + var1118
			end
		elseif var1109 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1120, var1121 = protoModule.readFixed32(p44, var1108)
			local _ = var1120
			var1108 = var1121
		elseif var1109 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1122, var1123 = protoModule.readFixed64(p44, var1108)
			local _ = var1122
			var1108 = var1123
		else
			error("Unsupported wire type: " .. var1109)
		end
	end
	return var1107
end

function t_23:jsonEncode() --[[ line: 8069 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_23:jsonDecode() --[[ line: 8081 ]]
	-- upvalues: t_23 (ref)
	local var1125 = t_23.new()
	
	if self.user_id ~= nil then
		var1125.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1125.user_id = self.userId
	end
	return var1125
end

t_23.descriptor = {
	name = "ExperienceActionModuleInputData_ConnectionPlayedUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConnectionPlayedUser"
}
t.ExperienceActionModuleInputData_ConnectionPlayedUser = t_23
typeRegistryModule.default:register(t.ExperienceActionModuleInputData_ConnectionPlayedUser)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p45) --[[ line: 8112 ]]
	-- upvalues: t_24 (ref)
	return setmetatable({
		media_items = if p45 == nil or p45.media_items == nil then {} else p45.media_items,
		universe_id = if p45 == nil or p45.universe_id == nil then "" else p45.universe_id,
		place_id = if p45 == nil or p45.place_id == nil then "" else p45.place_id
	}, t_24)
end

function t_24:encode() --[[ line: 8122 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1127 = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for i, v in self.media_items do
			local var1128 = v:encode()
			local var1129, var1130 = protoModule.writeTag(buff, var1127, 1, protoModule.wireTypes.lengthDelimited)
			var1129, var1130 = protoModule.writeBuffer(var1129, var1130, var1128, buffer.len(var1128))
			buff = var1129
			var1127 = var1130
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1131, var1132 = protoModule.writeTag(buff, var1127, 2, protoModule.wireTypes.lengthDelimited)
		var1131, var1132 = protoModule.writeString(var1131, var1132, self.universe_id)
		buff = var1131
		var1127 = var1132
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var1133, var1134 = protoModule.writeTag(buff, var1127, 3, protoModule.wireTypes.lengthDelimited)
		var1133, var1134 = protoModule.writeString(var1133, var1134, self.place_id)
		buff = var1133
		var1127 = var1134
	end
	local buff_1 = buffer.create(var1127)
	buffer.copy(buff_1, 0, buff, 0, var1127)
	
	return buff_1
end

function t_24.decode(p46) --[[ line: 8149 ]]
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var1136 = t_24.new()
	local var1137 = 0
	while var1137 < buffer.len(p46) do
		local _ = nil
		local var1138 = nil
		local var1139, var1140, var1141 = protoModule.readTag(p46, var1137)
		local var1142 = var1139
		var1138 = var1140
		var1137 = var1141
		
		if var1138 == protoModule.wireTypes.varint then
			local _ = nil
			local var1143, var1144 = protoModule.readVarInt(p46, var1137)
			local _ = var1143
			var1137 = var1144
			continue
		end
		if var1138 == protoModule.wireTypes.lengthDelimited then
			if var1142 == 1 then
				local _ = nil
				local var1145, var1146 = protoModule.readBuffer(p46, var1137)
				var1137 = var1146
				table.insert(var1136.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(var1145))
			elseif var1142 == 2 then
				local _ = nil
				local var1147, var1148 = protoModule.readBuffer(p46, var1137)
				var1137 = var1148
				var1136.universe_id = buffer.tostring(var1147)
			elseif var1142 == 3 then
				local _ = nil
				local var1149, var1150 = protoModule.readBuffer(p46, var1137)
				var1137 = var1150
				var1136.place_id = buffer.tostring(var1149)
			else
				local _ = nil
				local var1151, var1152 = protoModule.readVarInt(p46, var1137)
				var1137 = var1152 + var1151
			end
		elseif var1138 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1153, var1154 = protoModule.readFixed32(p46, var1137)
			local _ = var1153
			var1137 = var1154
		elseif var1138 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1155, var1156 = protoModule.readFixed64(p46, var1137)
			local _ = var1155
			var1137 = var1156
		else
			error("Unsupported wire type: " .. var1138)
		end
	end
	return var1136
end

function t_24:jsonEncode() --[[ line: 8202 ]]
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

function t_24:jsonDecode() --[[ line: 8224 ]]
	-- upvalues: t_24 (ref), t (ref)
	local var1159 = t_24.new()
	
	if self.media_items ~= nil then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var1159.media_items = t_1
	end
	if self.mediaItems ~= nil then
		local t_1 = {}
		
		for i, v in self.mediaItems do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var1159.media_items = t_1
	end
	if self.universe_id ~= nil then
		var1159.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1159.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var1159.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1159.place_id = self.placeId
	end
	return var1159
end

t_24.descriptor = {
	name = "ExperienceMediaGalleryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceMediaGalleryInputData"
}
t.ExperienceMediaGalleryInputData = t_24
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p47) --[[ line: 8278 ]]
	-- upvalues: t_25 (ref)
	return setmetatable({
		media_asset_id = if p47 == nil or p47.media_asset_id == nil then "" else p47.media_asset_id
	}, t_25)
end

function t_25:encode() --[[ line: 8286 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1163 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var1164, var1165 = protoModule.writeTag(buff, var1163, 1, protoModule.wireTypes.lengthDelimited)
		var1164, var1165 = protoModule.writeString(var1164, var1165, self.media_asset_id)
		buff = var1164
		var1163 = var1165
	end
	local buff_1 = buffer.create(var1163)
	buffer.copy(buff_1, 0, buff, 0, var1163)
	
	return buff_1
end

function t_25.decode(p48) --[[ line: 8302 ]]
	-- upvalues: t_25 (ref), protoModule (ref)
	local var1167 = t_25.new()
	local var1168 = 0
	while var1168 < buffer.len(p48) do
		local _ = nil
		local var1169 = nil
		local var1170, var1171, var1172 = protoModule.readTag(p48, var1168)
		local var1173 = var1170
		var1169 = var1171
		var1168 = var1172
		
		if var1169 == protoModule.wireTypes.varint then
			local _ = nil
			local var1174, var1175 = protoModule.readVarInt(p48, var1168)
			local _ = var1174
			var1168 = var1175
			continue
		end
		if var1169 == protoModule.wireTypes.lengthDelimited then
			if var1173 == 1 then
				local _ = nil
				local var1176, var1177 = protoModule.readBuffer(p48, var1168)
				var1168 = var1177
				var1167.media_asset_id = buffer.tostring(var1176)
			else
				local _ = nil
				local var1178, var1179 = protoModule.readVarInt(p48, var1168)
				var1168 = var1179 + var1178
			end
		elseif var1169 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1180, var1181 = protoModule.readFixed32(p48, var1168)
			local _ = var1180
			var1168 = var1181
		elseif var1169 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1182, var1183 = protoModule.readFixed64(p48, var1168)
			local _ = var1182
			var1168 = var1183
		else
			error("Unsupported wire type: " .. var1169)
		end
	end
	return var1167
end

function t_25:jsonEncode() --[[ line: 8347 ]]
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function t_25:jsonDecode() --[[ line: 8359 ]]
	-- upvalues: t_25 (ref)
	local var1185 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var1185.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var1185.media_asset_id = self.mediaAssetId
	end
	return var1185
end

t_25.descriptor = {
	name = "ExperienceMediaGalleryInputData_MediaItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaItem"
}
t.ExperienceMediaGalleryInputData_MediaItem = t_25
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData_MediaItem)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p49) --[[ line: 8389 ]]
	-- upvalues: t_26 (ref)
	return setmetatable({
		universe_id = if p49 == nil or p49.universe_id == nil then "" else p49.universe_id
	}, t_26)
end

function t_26:encode() --[[ line: 8397 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1187 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1188, var1189 = protoModule.writeTag(buff, var1187, 1, protoModule.wireTypes.lengthDelimited)
		var1188, var1189 = protoModule.writeString(var1188, var1189, self.universe_id)
		buff = var1188
		var1187 = var1189
	end
	local buff_1 = buffer.create(var1187)
	buffer.copy(buff_1, 0, buff, 0, var1187)
	
	return buff_1
end

function t_26.decode(p50) --[[ line: 8411 ]]
	-- upvalues: t_26 (ref), protoModule (ref)
	local var1191 = t_26.new()
	local var1192 = 0
	while var1192 < buffer.len(p50) do
		local _ = nil
		local var1193 = nil
		local var1194, var1195, var1196 = protoModule.readTag(p50, var1192)
		local var1197 = var1194
		var1193 = var1195
		var1192 = var1196
		
		if var1193 == protoModule.wireTypes.varint then
			local _ = nil
			local var1198, var1199 = protoModule.readVarInt(p50, var1192)
			local _ = var1198
			var1192 = var1199
			continue
		end
		if var1193 == protoModule.wireTypes.lengthDelimited then
			if var1197 == 1 then
				local _ = nil
				local var1200, var1201 = protoModule.readBuffer(p50, var1192)
				var1192 = var1201
				var1191.universe_id = buffer.tostring(var1200)
			else
				local _ = nil
				local var1202, var1203 = protoModule.readVarInt(p50, var1192)
				var1192 = var1203 + var1202
			end
		elseif var1193 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1204, var1205 = protoModule.readFixed32(p50, var1192)
			local _ = var1204
			var1192 = var1205
		elseif var1193 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1206, var1207 = protoModule.readFixed64(p50, var1192)
			local _ = var1206
			var1192 = var1207
		else
			error("Unsupported wire type: " .. var1193)
		end
	end
	return var1191
end

function t_26:jsonEncode() --[[ line: 8454 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_26:jsonDecode() --[[ line: 8464 ]]
	-- upvalues: t_26 (ref)
	local var1209 = t_26.new()
	
	if self.universe_id ~= nil then
		var1209.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1209.universe_id = self.universeId
	end
	return var1209
end

t_26.descriptor = {
	name = "ExperienceDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDescriptionInputData"
}
t.ExperienceDescriptionInputData = t_26
typeRegistryModule.default:register(t.ExperienceDescriptionInputData)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p51) --[[ line: 8492 ]]
	-- upvalues: t_27 (ref)
	return setmetatable({
		universe_id = if p51 == nil or p51.universe_id == nil then "" else p51.universe_id
	}, t_27)
end

function t_27:encode() --[[ line: 8500 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1211 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1212, var1213 = protoModule.writeTag(buff, var1211, 1, protoModule.wireTypes.lengthDelimited)
		var1212, var1213 = protoModule.writeString(var1212, var1213, self.universe_id)
		buff = var1212
		var1211 = var1213
	end
	local buff_1 = buffer.create(var1211)
	buffer.copy(buff_1, 0, buff, 0, var1211)
	
	return buff_1
end

function t_27.decode(p52) --[[ line: 8514 ]]
	-- upvalues: t_27 (ref), protoModule (ref)
	local var1215 = t_27.new()
	local var1216 = 0
	while var1216 < buffer.len(p52) do
		local _ = nil
		local var1217 = nil
		local var1218, var1219, var1220 = protoModule.readTag(p52, var1216)
		local var1221 = var1218
		var1217 = var1219
		var1216 = var1220
		
		if var1217 == protoModule.wireTypes.varint then
			local _ = nil
			local var1222, var1223 = protoModule.readVarInt(p52, var1216)
			local _ = var1222
			var1216 = var1223
			continue
		end
		if var1217 == protoModule.wireTypes.lengthDelimited then
			if var1221 == 1 then
				local _ = nil
				local var1224, var1225 = protoModule.readBuffer(p52, var1216)
				var1216 = var1225
				var1215.universe_id = buffer.tostring(var1224)
			else
				local _ = nil
				local var1226, var1227 = protoModule.readVarInt(p52, var1216)
				var1216 = var1227 + var1226
			end
		elseif var1217 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1228, var1229 = protoModule.readFixed32(p52, var1216)
			local _ = var1228
			var1216 = var1229
		elseif var1217 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1230, var1231 = protoModule.readFixed64(p52, var1216)
			local _ = var1230
			var1216 = var1231
		else
			error("Unsupported wire type: " .. var1217)
		end
	end
	return var1215
end

function t_27:jsonEncode() --[[ line: 8557 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_27:jsonDecode() --[[ line: 8567 ]]
	-- upvalues: t_27 (ref)
	local var1233 = t_27.new()
	
	if self.universe_id ~= nil then
		var1233.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1233.universe_id = self.universeId
	end
	return var1233
end

t_27.descriptor = {
	name = "ExperienceStatRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceStatRowInputData"
}
t.ExperienceStatRowInputData = t_27
typeRegistryModule.default:register(t.ExperienceStatRowInputData)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p53) --[[ line: 8595 ]]
	-- upvalues: t_28 (ref)
	return setmetatable({
		universe_id = if p53 == nil or p53.universe_id == nil then "" else p53.universe_id,
		has_store_items = if p53 == nil or p53.has_store_items == nil then false else p53.has_store_items,
		has_badges = if p53 == nil or p53.has_badges == nil then false else p53.has_badges,
		has_game_passes = if p53 == nil or p53.has_game_passes == nil then false else p53.has_game_passes
	}, t_28)
end

function t_28:encode() --[[ line: 8606 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1235 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1236, var1237 = protoModule.writeTag(buff, var1235, 1, protoModule.wireTypes.lengthDelimited)
		var1236, var1237 = protoModule.writeString(var1236, var1237, self.universe_id)
		buff = var1236
		var1235 = var1237
	end
	if self.has_store_items then
		local var1238, var1239 = protoModule.writeTag(buff, var1235, 2, protoModule.wireTypes.varint)
		var1238, var1239 = protoModule.writeVarInt(var1238, var1239, if self.has_store_items then 1 else 0)
		buff = var1238
		var1235 = var1239
	end
	if self.has_badges then
		local var1240, var1241 = protoModule.writeTag(buff, var1235, 3, protoModule.wireTypes.varint)
		var1240, var1241 = protoModule.writeVarInt(var1240, var1241, if self.has_badges then 1 else 0)
		buff = var1240
		var1235 = var1241
	end
	if self.has_game_passes then
		local var1242, var1243 = protoModule.writeTag(buff, var1235, 4, protoModule.wireTypes.varint)
		var1242, var1243 = protoModule.writeVarInt(var1242, var1243, if self.has_game_passes then 1 else 0)
		buff = var1242
		var1235 = var1243
	end
	local buff_1 = buffer.create(var1235)
	buffer.copy(buff_1, 0, buff, 0, var1235)
	
	return buff_1
end

function t_28.decode(p54) --[[ line: 8635 ]]
	-- upvalues: t_28 (ref), protoModule (ref)
	local var1245 = t_28.new()
	local var1246 = 0
	while var1246 < buffer.len(p54) do
		local _ = nil
		local var1247 = nil
		local var1248, var1249, var1250 = protoModule.readTag(p54, var1246)
		local var1251 = var1248
		var1247 = var1249
		var1246 = var1250
		
		if var1247 == protoModule.wireTypes.varint then
			if var1251 == 2 then
				local _ = nil
				local var1252, var1253 = protoModule.readVarInt(p54, var1246)
				var1246 = var1253
				var1245.has_store_items = var1252 ~= 0
			elseif var1251 == 3 then
				local _ = nil
				local var1254, var1255 = protoModule.readVarInt(p54, var1246)
				var1246 = var1255
				var1245.has_badges = var1254 ~= 0
			elseif var1251 == 4 then
				local _ = nil
				local var1256, var1257 = protoModule.readVarInt(p54, var1246)
				var1246 = var1257
				var1245.has_game_passes = var1256 ~= 0
			else
				local _ = nil
				local var1258, var1259 = protoModule.readVarInt(p54, var1246)
				local _ = var1258
				var1246 = var1259
			end
		end
		if var1247 == protoModule.wireTypes.lengthDelimited then
			if var1251 == 1 then
				local _ = nil
				local var1260, var1261 = protoModule.readBuffer(p54, var1246)
				var1246 = var1261
				var1245.universe_id = buffer.tostring(var1260)
			else
				local _ = nil
				local var1262, var1263 = protoModule.readVarInt(p54, var1246)
				var1246 = var1263 + var1262
			end
		elseif var1247 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1264, var1265 = protoModule.readFixed32(p54, var1246)
			local _ = var1264
			var1246 = var1265
		elseif var1247 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1266, var1267 = protoModule.readFixed64(p54, var1246)
			local _ = var1266
			var1246 = var1267
		else
			error("Unsupported wire type: " .. var1247)
		end
	end
	return var1245
end

function t_28:jsonEncode() --[[ line: 8693 ]]
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

function t_28:jsonDecode() --[[ line: 8715 ]]
	-- upvalues: t_28 (ref)
	local var1269 = t_28.new()
	
	if self.universe_id ~= nil then
		var1269.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1269.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var1269.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var1269.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var1269.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var1269.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var1269.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var1269.has_game_passes = self.hasGamePasses
	end
	return var1269
end

t_28.descriptor = {
	name = "ExperienceInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceInfoTableInputData"
}
t.ExperienceInfoTableInputData = t_28
typeRegistryModule.default:register(t.ExperienceInfoTableInputData)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p55) --[[ line: 8767 ]]
	-- upvalues: t_29 (ref)
	return setmetatable({
		universe_id = if p55 == nil or p55.universe_id == nil then "" else p55.universe_id
	}, t_29)
end

function t_29:encode() --[[ line: 8775 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1271 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1272, var1273 = protoModule.writeTag(buff, var1271, 1, protoModule.wireTypes.lengthDelimited)
		var1272, var1273 = protoModule.writeString(var1272, var1273, self.universe_id)
		buff = var1272
		var1271 = var1273
	end
	local buff_1 = buffer.create(var1271)
	buffer.copy(buff_1, 0, buff, 0, var1271)
	
	return buff_1
end

function t_29.decode(p56) --[[ line: 8789 ]]
	-- upvalues: t_29 (ref), protoModule (ref)
	local var1275 = t_29.new()
	local var1276 = 0
	while var1276 < buffer.len(p56) do
		local _ = nil
		local var1277 = nil
		local var1278, var1279, var1280 = protoModule.readTag(p56, var1276)
		local var1281 = var1278
		var1277 = var1279
		var1276 = var1280
		
		if var1277 == protoModule.wireTypes.varint then
			local _ = nil
			local var1282, var1283 = protoModule.readVarInt(p56, var1276)
			local _ = var1282
			var1276 = var1283
			continue
		end
		if var1277 == protoModule.wireTypes.lengthDelimited then
			if var1281 == 1 then
				local _ = nil
				local var1284, var1285 = protoModule.readBuffer(p56, var1276)
				var1276 = var1285
				var1275.universe_id = buffer.tostring(var1284)
			else
				local _ = nil
				local var1286, var1287 = protoModule.readVarInt(p56, var1276)
				var1276 = var1287 + var1286
			end
		elseif var1277 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1288, var1289 = protoModule.readFixed32(p56, var1276)
			local _ = var1288
			var1276 = var1289
		elseif var1277 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1290, var1291 = protoModule.readFixed64(p56, var1276)
			local _ = var1290
			var1276 = var1291
		else
			error("Unsupported wire type: " .. var1277)
		end
	end
	return var1275
end

function t_29:jsonEncode() --[[ line: 8832 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_29:jsonDecode() --[[ line: 8842 ]]
	-- upvalues: t_29 (ref)
	local var1293 = t_29.new()
	
	if self.universe_id ~= nil then
		var1293.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1293.universe_id = self.universeId
	end
	return var1293
end

t_29.descriptor = {
	name = "ExperienceContentRatingLabelInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceContentRatingLabelInputData"
}
t.ExperienceContentRatingLabelInputData = t_29
typeRegistryModule.default:register(t.ExperienceContentRatingLabelInputData)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p57) --[[ line: 8872 ]]
	-- upvalues: t_30 (ref)
	return setmetatable({
		universe_id = if p57 == nil or p57.universe_id == nil then "" else p57.universe_id,
		user_owns_experience = if p57 == nil or p57.user_owns_experience == nil then false else p57.user_owns_experience
	}, t_30)
end

function t_30:encode() --[[ line: 8883 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1295 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1296, var1297 = protoModule.writeTag(buff, var1295, 1, protoModule.wireTypes.lengthDelimited)
		var1296, var1297 = protoModule.writeString(var1296, var1297, self.universe_id)
		buff = var1296
		var1295 = var1297
	end
	if self.user_owns_experience then
		local var1298, var1299 = protoModule.writeTag(buff, var1295, 2, protoModule.wireTypes.varint)
		var1298, var1299 = protoModule.writeVarInt(var1298, var1299, if self.user_owns_experience then 1 else 0)
		buff = var1298
		var1295 = var1299
	end
	local buff_1 = buffer.create(var1295)
	buffer.copy(buff_1, 0, buff, 0, var1295)
	
	return buff_1
end

function t_30.decode(p58) --[[ line: 8902 ]]
	-- upvalues: t_30 (ref), protoModule (ref)
	local var1301 = t_30.new()
	local var1302 = 0
	while var1302 < buffer.len(p58) do
		local _ = nil
		local var1303 = nil
		local var1304, var1305, var1306 = protoModule.readTag(p58, var1302)
		local var1307 = var1304
		var1303 = var1305
		var1302 = var1306
		
		if var1303 == protoModule.wireTypes.varint then
			if var1307 == 2 then
				local _ = nil
				local var1308, var1309 = protoModule.readVarInt(p58, var1302)
				var1302 = var1309
				var1301.user_owns_experience = var1308 ~= 0
			else
				local _ = nil
				local var1310, var1311 = protoModule.readVarInt(p58, var1302)
				local _ = var1310
				var1302 = var1311
			end
		end
		if var1303 == protoModule.wireTypes.lengthDelimited then
			if var1307 == 1 then
				local _ = nil
				local var1312, var1313 = protoModule.readBuffer(p58, var1302)
				var1302 = var1313
				var1301.universe_id = buffer.tostring(var1312)
			else
				local _ = nil
				local var1314, var1315 = protoModule.readVarInt(p58, var1302)
				var1302 = var1315 + var1314
			end
		elseif var1303 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1316, var1317 = protoModule.readFixed32(p58, var1302)
			local _ = var1316
			var1302 = var1317
		elseif var1303 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1318, var1319 = protoModule.readFixed64(p58, var1302)
			local _ = var1318
			var1302 = var1319
		else
			error("Unsupported wire type: " .. var1303)
		end
	end
	return var1301
end

function t_30:jsonEncode() --[[ line: 8950 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function t_30:jsonDecode() --[[ line: 8964 ]]
	-- upvalues: t_30 (ref)
	local var1321 = t_30.new()
	
	if self.universe_id ~= nil then
		var1321.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1321.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var1321.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var1321.user_owns_experience = self.userOwnsExperience
	end
	return var1321
end

t_30.descriptor = {
	name = "ExperienceRefundPolicyInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceRefundPolicyInputData"
}
t.ExperienceRefundPolicyInputData = t_30
typeRegistryModule.default:register(t.ExperienceRefundPolicyInputData)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p59) --[[ line: 9000 ]]
	-- upvalues: t_31 (ref)
	return setmetatable({
		universe_id = if p59 == nil or p59.universe_id == nil then "" else p59.universe_id,
		place_id = if p59 == nil or p59.place_id == nil then "" else p59.place_id
	}, t_31)
end

function t_31:encode() --[[ line: 9009 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1323 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1324, var1325 = protoModule.writeTag(buff, var1323, 1, protoModule.wireTypes.lengthDelimited)
		var1324, var1325 = protoModule.writeString(var1324, var1325, self.universe_id)
		buff = var1324
		var1323 = var1325
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var1326, var1327 = protoModule.writeTag(buff, var1323, 2, protoModule.wireTypes.lengthDelimited)
		var1326, var1327 = protoModule.writeString(var1326, var1327, self.place_id)
		buff = var1326
		var1323 = var1327
	end
	local buff_1 = buffer.create(var1323)
	buffer.copy(buff_1, 0, buff, 0, var1323)
	
	return buff_1
end

function t_31.decode(p60) --[[ line: 9028 ]]
	-- upvalues: t_31 (ref), protoModule (ref)
	local var1329 = t_31.new()
	local var1330 = 0
	while var1330 < buffer.len(p60) do
		local _ = nil
		local var1331 = nil
		local var1332, var1333, var1334 = protoModule.readTag(p60, var1330)
		local var1335 = var1332
		var1331 = var1333
		var1330 = var1334
		
		if var1331 == protoModule.wireTypes.varint then
			local _ = nil
			local var1336, var1337 = protoModule.readVarInt(p60, var1330)
			local _ = var1336
			var1330 = var1337
			continue
		end
		if var1331 == protoModule.wireTypes.lengthDelimited then
			if var1335 == 1 then
				local _ = nil
				local var1338, var1339 = protoModule.readBuffer(p60, var1330)
				var1330 = var1339
				var1329.universe_id = buffer.tostring(var1338)
			elseif var1335 == 2 then
				local _ = nil
				local var1340, var1341 = protoModule.readBuffer(p60, var1330)
				var1330 = var1341
				var1329.place_id = buffer.tostring(var1340)
			else
				local _ = nil
				local var1342, var1343 = protoModule.readVarInt(p60, var1330)
				var1330 = var1343 + var1342
			end
		elseif var1331 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1344, var1345 = protoModule.readFixed32(p60, var1330)
			local _ = var1344
			var1330 = var1345
		elseif var1331 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1346, var1347 = protoModule.readFixed64(p60, var1330)
			local _ = var1346
			var1330 = var1347
		else
			error("Unsupported wire type: " .. var1331)
		end
	end
	return var1329
end

function t_31:jsonEncode() --[[ line: 9076 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		t.placeId = self.place_id
	end
	return t
end

function t_31:jsonDecode() --[[ line: 9090 ]]
	-- upvalues: t_31 (ref)
	local var1349 = t_31.new()
	
	if self.universe_id ~= nil then
		var1349.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1349.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var1349.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1349.place_id = self.placeId
	end
	return var1349
end

t_31.descriptor = {
	name = "ExperiencePlayWithRewardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperiencePlayWithRewardInputData"
}
t.ExperiencePlayWithRewardInputData = t_31
typeRegistryModule.default:register(t.ExperiencePlayWithRewardInputData)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p61) --[[ line: 9128 ]]
	-- upvalues: t_32 (ref)
	return setmetatable({
		social_link_items = if p61 == nil or p61.social_link_items == nil then {} else p61.social_link_items
	}, t_32)
end

function t_32:encode() --[[ line: 9134 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1351 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var1352 = v:encode()
			local var1353, var1354 = protoModule.writeTag(buff, var1351, 1, protoModule.wireTypes.lengthDelimited)
			var1353, var1354 = protoModule.writeBuffer(var1353, var1354, var1352, buffer.len(var1352))
			buff = var1353
			var1351 = var1354
		end
	end
	local buff_1 = buffer.create(var1351)
	buffer.copy(buff_1, 0, buff, 0, var1351)
	
	return buff_1
end

function t_32.decode(p62) --[[ line: 9151 ]]
	-- upvalues: t_32 (ref), protoModule (ref), t (ref)
	local var1356 = t_32.new()
	local var1357 = 0
	while var1357 < buffer.len(p62) do
		local _ = nil
		local var1358 = nil
		local var1359, var1360, var1361 = protoModule.readTag(p62, var1357)
		local var1362 = var1359
		var1358 = var1360
		var1357 = var1361
		
		if var1358 == protoModule.wireTypes.varint then
			local _ = nil
			local var1363, var1364 = protoModule.readVarInt(p62, var1357)
			local _ = var1363
			var1357 = var1364
			continue
		end
		if var1358 == protoModule.wireTypes.lengthDelimited then
			if var1362 == 1 then
				local _ = nil
				local var1365, var1366 = protoModule.readBuffer(p62, var1357)
				var1357 = var1366
				table.insert(var1356.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var1365))
			else
				local _ = nil
				local var1367, var1368 = protoModule.readVarInt(p62, var1357)
				var1357 = var1368 + var1367
			end
		elseif var1358 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1369, var1370 = protoModule.readFixed32(p62, var1357)
			local _ = var1369
			var1357 = var1370
		elseif var1358 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1371, var1372 = protoModule.readFixed64(p62, var1357)
			local _ = var1371
			var1357 = var1372
		else
			error("Unsupported wire type: " .. var1358)
		end
	end
	return var1356
end

function t_32:jsonEncode() --[[ line: 9194 ]]
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

function t_32:jsonDecode() --[[ line: 9208 ]]
	-- upvalues: t_32 (ref), t (ref)
	local var1375 = t_32.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1375.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1375.social_link_items = t_1
	end
	return var1375
end

t_32.descriptor = {
	name = "SocialLinkRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
}
t.SocialLinkRowInputData = t_32
typeRegistryModule.default:register(t.SocialLinkRowInputData)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p63) --[[ line: 9246 ]]
	-- upvalues: t_33 (ref)
	return setmetatable({
		social_link_id = if p63 == nil or p63.social_link_id == nil then "" else p63.social_link_id
	}, t_33)
end

function t_33:encode() --[[ line: 9254 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1379 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var1380, var1381 = protoModule.writeTag(buff, var1379, 1, protoModule.wireTypes.lengthDelimited)
		var1380, var1381 = protoModule.writeString(var1380, var1381, self.social_link_id)
		buff = var1380
		var1379 = var1381
	end
	local buff_1 = buffer.create(var1379)
	buffer.copy(buff_1, 0, buff, 0, var1379)
	
	return buff_1
end

function t_33.decode(p64) --[[ line: 9268 ]]
	-- upvalues: t_33 (ref), protoModule (ref)
	local var1383 = t_33.new()
	local var1384 = 0
	while var1384 < buffer.len(p64) do
		local _ = nil
		local var1385 = nil
		local var1386, var1387, var1388 = protoModule.readTag(p64, var1384)
		local var1389 = var1386
		var1385 = var1387
		var1384 = var1388
		
		if var1385 == protoModule.wireTypes.varint then
			local _ = nil
			local var1390, var1391 = protoModule.readVarInt(p64, var1384)
			local _ = var1390
			var1384 = var1391
			continue
		end
		if var1385 == protoModule.wireTypes.lengthDelimited then
			if var1389 == 1 then
				local _ = nil
				local var1392, var1393 = protoModule.readBuffer(p64, var1384)
				var1384 = var1393
				var1383.social_link_id = buffer.tostring(var1392)
			else
				local _ = nil
				local var1394, var1395 = protoModule.readVarInt(p64, var1384)
				var1384 = var1395 + var1394
			end
		elseif var1385 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1396, var1397 = protoModule.readFixed32(p64, var1384)
			local _ = var1396
			var1384 = var1397
		elseif var1385 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1398, var1399 = protoModule.readFixed64(p64, var1384)
			local _ = var1398
			var1384 = var1399
		else
			error("Unsupported wire type: " .. var1385)
		end
	end
	return var1383
end

function t_33:jsonEncode() --[[ line: 9311 ]]
	local t = {}
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		t.socialLinkId = self.social_link_id
	end
	return t
end

function t_33:jsonDecode() --[[ line: 9321 ]]
	-- upvalues: t_33 (ref)
	local var1401 = t_33.new()
	
	if self.social_link_id ~= nil then
		var1401.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var1401.social_link_id = self.socialLinkId
	end
	return var1401
end

t_33.descriptor = {
	name = "SocialLinkRowInputData_SocialLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
}
t.SocialLinkRowInputData_SocialLinkItem = t_33
typeRegistryModule.default:register(t.SocialLinkRowInputData_SocialLinkItem)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p65) --[[ line: 9351 ]]
	-- upvalues: t_34 (ref)
	return setmetatable({
		title = if p65 == nil or p65.title == nil then "" else p65.title,
		universe_items = if p65 == nil or p65.universe_items == nil then {} else p65.universe_items,
		next_page_token = if p65 == nil or p65.next_page_token == nil then "" else p65.next_page_token,
		sort_id = if p65 == nil or p65.sort_id == nil then "" else p65.sort_id,
		secondary_sort_id = if p65 == nil or p65.secondary_sort_id == nil then 0 else p65.secondary_sort_id,
		max_visible_rows = if p65 == nil or p65.max_visible_rows == nil then 0 else p65.max_visible_rows,
		subtitle = if p65 == nil or p65.subtitle == nil then "" else p65.subtitle,
		info_text = if p65 == nil or p65.info_text == nil then "" else p65.info_text,
		subtitle_link_path = if p65 == nil or p65.subtitle_link_path == nil then "" else p65.subtitle_link_path,
		is_placeholder = if p65 == nil or p65.is_placeholder == nil then nil else p65.is_placeholder,
		primary_sort_id = if p65 == nil or p65.primary_sort_id == nil then nil else p65.primary_sort_id,
		applied_filters = if p65 == nil or p65.applied_filters == nil then nil else p65.applied_filters,
		pool_id = if p65 == nil or p65.pool_id == nil then nil else p65.pool_id
	}, t_34)
end

function t_34:encode() --[[ line: 9371 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1403 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1404, var1405 = protoModule.writeTag(buff, var1403, 1, protoModule.wireTypes.lengthDelimited)
		var1404, var1405 = protoModule.writeString(var1404, var1405, self.title)
		buff = var1404
		var1403 = var1405
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var1406 = v:encode()
			local var1407, var1408 = protoModule.writeTag(buff, var1403, 2, protoModule.wireTypes.lengthDelimited)
			var1407, var1408 = protoModule.writeBuffer(var1407, var1408, var1406, buffer.len(var1406))
			buff = var1407
			var1403 = var1408
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1409, var1410 = protoModule.writeTag(buff, var1403, 3, protoModule.wireTypes.lengthDelimited)
		var1409, var1410 = protoModule.writeString(var1409, var1410, self.next_page_token)
		buff = var1409
		var1403 = var1410
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1411, var1412 = protoModule.writeTag(buff, var1403, 4, protoModule.wireTypes.lengthDelimited)
		var1411, var1412 = protoModule.writeString(var1411, var1412, self.sort_id)
		buff = var1411
		var1403 = var1412
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1413, var1414 = protoModule.writeTag(buff, var1403, 5, protoModule.wireTypes.varint)
		var1413, var1414 = protoModule.writeVarInt(var1413, var1414, self.secondary_sort_id)
		buff = var1413
		var1403 = var1414
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var1415, var1416 = protoModule.writeTag(buff, var1403, 6, protoModule.wireTypes.varint)
		var1415, var1416 = protoModule.writeVarInt(var1415, var1416, self.max_visible_rows)
		buff = var1415
		var1403 = var1416
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1417, var1418 = protoModule.writeTag(buff, var1403, 7, protoModule.wireTypes.lengthDelimited)
		var1417, var1418 = protoModule.writeString(var1417, var1418, self.subtitle)
		buff = var1417
		var1403 = var1418
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1419, var1420 = protoModule.writeTag(buff, var1403, 8, protoModule.wireTypes.lengthDelimited)
		var1419, var1420 = protoModule.writeString(var1419, var1420, self.info_text)
		buff = var1419
		var1403 = var1420
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1421, var1422 = protoModule.writeTag(buff, var1403, 9, protoModule.wireTypes.lengthDelimited)
		var1421, var1422 = protoModule.writeString(var1421, var1422, self.subtitle_link_path)
		buff = var1421
		var1403 = var1422
	end
	if self.is_placeholder ~= nil then
		local var1423, var1424 = protoModule.writeTag(buff, var1403, 10, protoModule.wireTypes.varint)
		var1423, var1424 = protoModule.writeVarInt(var1423, var1424, if self.is_placeholder then 1 else 0)
		buff = var1423
		var1403 = var1424
	end
	if self.primary_sort_id ~= nil then
		local var1425, var1426 = protoModule.writeTag(buff, var1403, 11, protoModule.wireTypes.varint)
		var1425, var1426 = protoModule.writeVarInt(var1425, var1426, self.primary_sort_id)
		buff = var1425
		var1403 = var1426
	end
	if self.applied_filters ~= nil then
		local var1427, var1428 = protoModule.writeTag(buff, var1403, 12, protoModule.wireTypes.lengthDelimited)
		var1427, var1428 = protoModule.writeString(var1427, var1428, self.applied_filters)
		buff = var1427
		var1403 = var1428
	end
	if self.pool_id ~= nil then
		local var1429, var1430 = protoModule.writeTag(buff, var1403, 13, protoModule.wireTypes.lengthDelimited)
		var1429, var1430 = protoModule.writeString(var1429, var1430, self.pool_id)
		buff = var1429
		var1403 = var1430
	end
	local buff_1 = buffer.create(var1403)
	buffer.copy(buff_1, 0, buff, 0, var1403)
	
	return buff_1
end

function t_34.decode(p66) --[[ line: 9448 ]]
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var1432 = t_34.new()
	local var1433 = 0
	while var1433 < buffer.len(p66) do
		local _ = nil
		local var1434 = nil
		local var1435, var1436, var1437 = protoModule.readTag(p66, var1433)
		local var1438 = var1435
		var1434 = var1436
		var1433 = var1437
		
		if var1434 == protoModule.wireTypes.varint then
			if var1438 == 5 then
				local _ = nil
				local var1439, var1440 = protoModule.readVarIntI32(p66, var1433)
				var1433 = var1440
				var1432.secondary_sort_id = var1439
			elseif var1438 == 6 then
				local _ = nil
				local var1441, var1442 = protoModule.readVarIntI32(p66, var1433)
				var1433 = var1442
				var1432.max_visible_rows = var1441
			elseif var1438 == 10 then
				local _ = nil
				local var1443, var1444 = protoModule.readVarInt(p66, var1433)
				var1433 = var1444
				var1432.is_placeholder = var1443 ~= 0
			elseif var1438 == 11 then
				local _ = nil
				local var1445, var1446 = protoModule.readVarIntI32(p66, var1433)
				var1433 = var1446
				var1432.primary_sort_id = var1445
			else
				local _ = nil
				local var1447, var1448 = protoModule.readVarInt(p66, var1433)
				local _ = var1447
				var1433 = var1448
			end
		end
		if var1434 == protoModule.wireTypes.lengthDelimited then
			if var1438 == 1 then
				local _ = nil
				local var1449, var1450 = protoModule.readBuffer(p66, var1433)
				var1433 = var1450
				var1432.title = buffer.tostring(var1449)
			elseif var1438 == 2 then
				local _ = nil
				local var1451, var1452 = protoModule.readBuffer(p66, var1433)
				var1433 = var1452
				table.insert(var1432.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var1451))
			elseif var1438 == 3 then
				local _ = nil
				local var1453, var1454 = protoModule.readBuffer(p66, var1433)
				var1433 = var1454
				var1432.next_page_token = buffer.tostring(var1453)
			elseif var1438 == 4 then
				local _ = nil
				local var1455, var1456 = protoModule.readBuffer(p66, var1433)
				var1433 = var1456
				var1432.sort_id = buffer.tostring(var1455)
			elseif var1438 == 7 then
				local _ = nil
				local var1457, var1458 = protoModule.readBuffer(p66, var1433)
				var1433 = var1458
				var1432.subtitle = buffer.tostring(var1457)
			elseif var1438 == 8 then
				local _ = nil
				local var1459, var1460 = protoModule.readBuffer(p66, var1433)
				var1433 = var1460
				var1432.info_text = buffer.tostring(var1459)
			elseif var1438 == 9 then
				local _ = nil
				local var1461, var1462 = protoModule.readBuffer(p66, var1433)
				var1433 = var1462
				var1432.subtitle_link_path = buffer.tostring(var1461)
			elseif var1438 == 12 then
				local _ = nil
				local var1463, var1464 = protoModule.readBuffer(p66, var1433)
				var1433 = var1464
				var1432.applied_filters = buffer.tostring(var1463)
			elseif var1438 == 13 then
				local _ = nil
				local var1465, var1466 = protoModule.readBuffer(p66, var1433)
				var1433 = var1466
				var1432.pool_id = buffer.tostring(var1465)
			else
				local _ = nil
				local var1467, var1468 = protoModule.readVarInt(p66, var1433)
				var1433 = var1468 + var1467
			end
		elseif var1434 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1469, var1470 = protoModule.readFixed32(p66, var1433)
			local _ = var1469
			var1433 = var1470
		elseif var1434 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1471, var1472 = protoModule.readFixed64(p66, var1433)
			local _ = var1471
			var1433 = var1472
		else
			error("Unsupported wire type: " .. var1434)
		end
	end
	return var1432
end

function t_34:jsonEncode() --[[ line: 9551 ]]
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
	return t
end

function t_34:jsonDecode() --[[ line: 9613 ]]
	-- upvalues: t_34 (ref), t (ref)
	local var1475 = t_34.new()
	
	if self.title ~= nil then
		var1475.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1475.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1475.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var1475.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1475.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1475.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1475.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1475.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1475.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var1475.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var1475.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var1475.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1475.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1475.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1475.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1475.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1475.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1475.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1475.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1475.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1475.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1475.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var1475.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var1475.pool_id = self.poolId
	end
	return var1475
end

t_34.descriptor = {
	name = "ExperienceCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
}
t.ExperienceCarouselInputData = t_34
typeRegistryModule.default:register(t.ExperienceCarouselInputData)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p67) --[[ line: 9739 ]]
	-- upvalues: t_35 (ref)
	return setmetatable({
		universe_id = if p67 == nil or p67.universe_id == nil then "" else p67.universe_id,
		is_sponsored = if p67 == nil or p67.is_sponsored == nil then false else p67.is_sponsored,
		roblox_component = if p67 == nil or p67.roblox_component == nil then "" else p67.roblox_component,
		native_ad_data = if p67 == nil or p67.native_ad_data == nil then "" else p67.native_ad_data,
		is_content_locked = if p67 == nil or p67.is_content_locked == nil then false else p67.is_content_locked,
		title = if p67 == nil or p67.title == nil then "" else p67.title,
		subtitle = if p67 == nil or p67.subtitle == nil then "" else p67.subtitle,
		image_asset_id = if p67 == nil or p67.image_asset_id == nil then "" else p67.image_asset_id,
		video_asset_id = if p67 == nil or p67.video_asset_id == nil then "" else p67.video_asset_id,
		badge_text = if p67 == nil or p67.badge_text == nil then "" else p67.badge_text,
		player_count = if p67 == nil or p67.player_count == nil then nil else p67.player_count,
		creator_key = if p67 == nil or p67.creator_key == nil then "" else p67.creator_key
	}, t_35)
end

function t_35:encode() --[[ line: 9758 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1479 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1480, var1481 = protoModule.writeTag(buff, var1479, 1, protoModule.wireTypes.lengthDelimited)
		var1480, var1481 = protoModule.writeString(var1480, var1481, self.universe_id)
		buff = var1480
		var1479 = var1481
	end
	if self.is_sponsored then
		local var1482, var1483 = protoModule.writeTag(buff, var1479, 2, protoModule.wireTypes.varint)
		var1482, var1483 = protoModule.writeVarInt(var1482, var1483, if self.is_sponsored then 1 else 0)
		buff = var1482
		var1479 = var1483
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1484, var1485 = protoModule.writeTag(buff, var1479, 3, protoModule.wireTypes.lengthDelimited)
		var1484, var1485 = protoModule.writeString(var1484, var1485, self.roblox_component)
		buff = var1484
		var1479 = var1485
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var1486, var1487 = protoModule.writeTag(buff, var1479, 4, protoModule.wireTypes.lengthDelimited)
		var1486, var1487 = protoModule.writeString(var1486, var1487, self.native_ad_data)
		buff = var1486
		var1479 = var1487
	end
	if self.is_content_locked then
		local var1488, var1489 = protoModule.writeTag(buff, var1479, 5, protoModule.wireTypes.varint)
		var1488, var1489 = protoModule.writeVarInt(var1488, var1489, if self.is_content_locked then 1 else 0)
		buff = var1488
		var1479 = var1489
	end
	if self.title ~= nil and self.title ~= "" then
		local var1490, var1491 = protoModule.writeTag(buff, var1479, 6, protoModule.wireTypes.lengthDelimited)
		var1490, var1491 = protoModule.writeString(var1490, var1491, self.title)
		buff = var1490
		var1479 = var1491
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1492, var1493 = protoModule.writeTag(buff, var1479, 7, protoModule.wireTypes.lengthDelimited)
		var1492, var1493 = protoModule.writeString(var1492, var1493, self.subtitle)
		buff = var1492
		var1479 = var1493
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var1494, var1495 = protoModule.writeTag(buff, var1479, 8, protoModule.wireTypes.lengthDelimited)
		var1494, var1495 = protoModule.writeString(var1494, var1495, self.image_asset_id)
		buff = var1494
		var1479 = var1495
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var1496, var1497 = protoModule.writeTag(buff, var1479, 9, protoModule.wireTypes.lengthDelimited)
		var1496, var1497 = protoModule.writeString(var1496, var1497, self.video_asset_id)
		buff = var1496
		var1479 = var1497
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var1498, var1499 = protoModule.writeTag(buff, var1479, 10, protoModule.wireTypes.lengthDelimited)
		var1498, var1499 = protoModule.writeString(var1498, var1499, self.badge_text)
		buff = var1498
		var1479 = var1499
	end
	if self.player_count ~= nil then
		local var1500, var1501 = protoModule.writeTag(buff, var1479, 11, protoModule.wireTypes.varint)
		var1500, var1501 = protoModule.writeVarInt(var1500, var1501, self.player_count)
		buff = var1500
		var1479 = var1501
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1502, var1503 = protoModule.writeTag(buff, var1479, 12, protoModule.wireTypes.lengthDelimited)
		var1502, var1503 = protoModule.writeString(var1502, var1503, self.creator_key)
		buff = var1502
		var1479 = var1503
	end
	local buff_1 = buffer.create(var1479)
	buffer.copy(buff_1, 0, buff, 0, var1479)
	
	return buff_1
end

function t_35.decode(p68) --[[ line: 9829 ]]
	-- upvalues: t_35 (ref), protoModule (ref)
	local var1505 = t_35.new()
	local var1506 = 0
	while var1506 < buffer.len(p68) do
		local _ = nil
		local var1507 = nil
		local var1508, var1509, var1510 = protoModule.readTag(p68, var1506)
		local var1511 = var1508
		var1507 = var1509
		var1506 = var1510
		
		if var1507 == protoModule.wireTypes.varint then
			if var1511 == 2 then
				local _ = nil
				local var1512, var1513 = protoModule.readVarInt(p68, var1506)
				var1506 = var1513
				var1505.is_sponsored = var1512 ~= 0
			elseif var1511 == 5 then
				local _ = nil
				local var1514, var1515 = protoModule.readVarInt(p68, var1506)
				var1506 = var1515
				var1505.is_content_locked = var1514 ~= 0
			elseif var1511 == 11 then
				local _ = nil
				local var1516, var1517 = protoModule.readVarIntI64(p68, var1506)
				var1506 = var1517
				var1505.player_count = var1516
			else
				local _ = nil
				local var1518, var1519 = protoModule.readVarInt(p68, var1506)
				local _ = var1518
				var1506 = var1519
			end
		end
		if var1507 == protoModule.wireTypes.lengthDelimited then
			if var1511 == 1 then
				local _ = nil
				local var1520, var1521 = protoModule.readBuffer(p68, var1506)
				var1506 = var1521
				var1505.universe_id = buffer.tostring(var1520)
			elseif var1511 == 3 then
				local _ = nil
				local var1522, var1523 = protoModule.readBuffer(p68, var1506)
				var1506 = var1523
				var1505.roblox_component = buffer.tostring(var1522)
			elseif var1511 == 4 then
				local _ = nil
				local var1524, var1525 = protoModule.readBuffer(p68, var1506)
				var1506 = var1525
				var1505.native_ad_data = buffer.tostring(var1524)
			elseif var1511 == 6 then
				local _ = nil
				local var1526, var1527 = protoModule.readBuffer(p68, var1506)
				var1506 = var1527
				var1505.title = buffer.tostring(var1526)
			elseif var1511 == 7 then
				local _ = nil
				local var1528, var1529 = protoModule.readBuffer(p68, var1506)
				var1506 = var1529
				var1505.subtitle = buffer.tostring(var1528)
			elseif var1511 == 8 then
				local _ = nil
				local var1530, var1531 = protoModule.readBuffer(p68, var1506)
				var1506 = var1531
				var1505.image_asset_id = buffer.tostring(var1530)
			elseif var1511 == 9 then
				local _ = nil
				local var1532, var1533 = protoModule.readBuffer(p68, var1506)
				var1506 = var1533
				var1505.video_asset_id = buffer.tostring(var1532)
			elseif var1511 == 10 then
				local _ = nil
				local var1534, var1535 = protoModule.readBuffer(p68, var1506)
				var1506 = var1535
				var1505.badge_text = buffer.tostring(var1534)
			elseif var1511 == 12 then
				local _ = nil
				local var1536, var1537 = protoModule.readBuffer(p68, var1506)
				var1506 = var1537
				var1505.creator_key = buffer.tostring(var1536)
			else
				local _ = nil
				local var1538, var1539 = protoModule.readVarInt(p68, var1506)
				var1506 = var1539 + var1538
			end
		elseif var1507 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1540, var1541 = protoModule.readFixed32(p68, var1506)
			local _ = var1540
			var1506 = var1541
		elseif var1507 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1542, var1543 = protoModule.readFixed64(p68, var1506)
			local _ = var1542
			var1506 = var1543
		else
			error("Unsupported wire type: " .. var1507)
		end
	end
	return var1505
end

function t_35:jsonEncode() --[[ line: 9929 ]]
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
	return t
end

function t_35:jsonDecode() --[[ line: 9985 ]]
	-- upvalues: t_35 (ref)
	local var1545 = t_35.new()
	
	if self.universe_id ~= nil then
		var1545.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1545.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1545.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1545.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1545.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1545.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1545.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1545.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1545.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1545.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1545.title = self.title
	end
	if self.subtitle ~= nil then
		var1545.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1545.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1545.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1545.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1545.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1545.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1545.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1545.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1545.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1545.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1545.creator_key = self.creatorKey
	end
	return var1545
end

t_35.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
}
t.ExperienceCarouselInputData_UniverseItem = t_35
typeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p69) --[[ line: 10095 ]]
	-- upvalues: t_36 (ref)
	return setmetatable({
		title = if p69 == nil or p69.title == nil then "" else p69.title,
		song_items = if p69 == nil or p69.song_items == nil then {} else p69.song_items,
		next_page_token = if p69 == nil or p69.next_page_token == nil then "" else p69.next_page_token,
		sort_id = if p69 == nil or p69.sort_id == nil then "" else p69.sort_id,
		secondary_sort_id = if p69 == nil or p69.secondary_sort_id == nil then 0 else p69.secondary_sort_id,
		subtitle = if p69 == nil or p69.subtitle == nil then "" else p69.subtitle,
		info_text = if p69 == nil or p69.info_text == nil then "" else p69.info_text,
		subtitle_link_path = if p69 == nil or p69.subtitle_link_path == nil then "" else p69.subtitle_link_path,
		is_placeholder = if p69 == nil or p69.is_placeholder == nil then nil else p69.is_placeholder,
		primary_sort_id = if p69 == nil or p69.primary_sort_id == nil then nil else p69.primary_sort_id,
		applied_filters = if p69 == nil or p69.applied_filters == nil then nil else p69.applied_filters
	}, t_36)
end

function t_36:encode() --[[ line: 10111 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1547 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1548, var1549 = protoModule.writeTag(buff, var1547, 1, protoModule.wireTypes.lengthDelimited)
		var1548, var1549 = protoModule.writeString(var1548, var1549, self.title)
		buff = var1548
		var1547 = var1549
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1550 = v:encode()
			local var1551, var1552 = protoModule.writeTag(buff, var1547, 2, protoModule.wireTypes.lengthDelimited)
			var1551, var1552 = protoModule.writeBuffer(var1551, var1552, var1550, buffer.len(var1550))
			buff = var1551
			var1547 = var1552
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1553, var1554 = protoModule.writeTag(buff, var1547, 3, protoModule.wireTypes.lengthDelimited)
		var1553, var1554 = protoModule.writeString(var1553, var1554, self.next_page_token)
		buff = var1553
		var1547 = var1554
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1555, var1556 = protoModule.writeTag(buff, var1547, 4, protoModule.wireTypes.lengthDelimited)
		var1555, var1556 = protoModule.writeString(var1555, var1556, self.sort_id)
		buff = var1555
		var1547 = var1556
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1557, var1558 = protoModule.writeTag(buff, var1547, 5, protoModule.wireTypes.varint)
		var1557, var1558 = protoModule.writeVarInt(var1557, var1558, self.secondary_sort_id)
		buff = var1557
		var1547 = var1558
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1559, var1560 = protoModule.writeTag(buff, var1547, 6, protoModule.wireTypes.lengthDelimited)
		var1559, var1560 = protoModule.writeString(var1559, var1560, self.subtitle)
		buff = var1559
		var1547 = var1560
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1561, var1562 = protoModule.writeTag(buff, var1547, 7, protoModule.wireTypes.lengthDelimited)
		var1561, var1562 = protoModule.writeString(var1561, var1562, self.info_text)
		buff = var1561
		var1547 = var1562
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1563, var1564 = protoModule.writeTag(buff, var1547, 8, protoModule.wireTypes.lengthDelimited)
		var1563, var1564 = protoModule.writeString(var1563, var1564, self.subtitle_link_path)
		buff = var1563
		var1547 = var1564
	end
	if self.is_placeholder ~= nil then
		local var1565, var1566 = protoModule.writeTag(buff, var1547, 9, protoModule.wireTypes.varint)
		var1565, var1566 = protoModule.writeVarInt(var1565, var1566, if self.is_placeholder then 1 else 0)
		buff = var1565
		var1547 = var1566
	end
	if self.primary_sort_id ~= nil then
		local var1567, var1568 = protoModule.writeTag(buff, var1547, 10, protoModule.wireTypes.varint)
		var1567, var1568 = protoModule.writeVarInt(var1567, var1568, self.primary_sort_id)
		buff = var1567
		var1547 = var1568
	end
	if self.applied_filters ~= nil then
		local var1569, var1570 = protoModule.writeTag(buff, var1547, 11, protoModule.wireTypes.lengthDelimited)
		var1569, var1570 = protoModule.writeString(var1569, var1570, self.applied_filters)
		buff = var1569
		var1547 = var1570
	end
	local buff_1 = buffer.create(var1547)
	buffer.copy(buff_1, 0, buff, 0, var1547)
	
	return buff_1
end

function t_36.decode(p70) --[[ line: 10178 ]]
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1572 = t_36.new()
	local var1573 = 0
	while var1573 < buffer.len(p70) do
		local _ = nil
		local var1574 = nil
		local var1575, var1576, var1577 = protoModule.readTag(p70, var1573)
		local var1578 = var1575
		var1574 = var1576
		var1573 = var1577
		
		if var1574 == protoModule.wireTypes.varint then
			if var1578 == 5 then
				local _ = nil
				local var1579, var1580 = protoModule.readVarIntI32(p70, var1573)
				var1573 = var1580
				var1572.secondary_sort_id = var1579
			elseif var1578 == 9 then
				local _ = nil
				local var1581, var1582 = protoModule.readVarInt(p70, var1573)
				var1573 = var1582
				var1572.is_placeholder = var1581 ~= 0
			elseif var1578 == 10 then
				local _ = nil
				local var1583, var1584 = protoModule.readVarIntI32(p70, var1573)
				var1573 = var1584
				var1572.primary_sort_id = var1583
			else
				local _ = nil
				local var1585, var1586 = protoModule.readVarInt(p70, var1573)
				local _ = var1585
				var1573 = var1586
			end
		end
		if var1574 == protoModule.wireTypes.lengthDelimited then
			if var1578 == 1 then
				local _ = nil
				local var1587, var1588 = protoModule.readBuffer(p70, var1573)
				var1573 = var1588
				var1572.title = buffer.tostring(var1587)
			elseif var1578 == 2 then
				local _ = nil
				local var1589, var1590 = protoModule.readBuffer(p70, var1573)
				var1573 = var1590
				table.insert(var1572.song_items, t.SongCarouselInputData_SongItem.decode(var1589))
			elseif var1578 == 3 then
				local _ = nil
				local var1591, var1592 = protoModule.readBuffer(p70, var1573)
				var1573 = var1592
				var1572.next_page_token = buffer.tostring(var1591)
			elseif var1578 == 4 then
				local _ = nil
				local var1593, var1594 = protoModule.readBuffer(p70, var1573)
				var1573 = var1594
				var1572.sort_id = buffer.tostring(var1593)
			elseif var1578 == 6 then
				local _ = nil
				local var1595, var1596 = protoModule.readBuffer(p70, var1573)
				var1573 = var1596
				var1572.subtitle = buffer.tostring(var1595)
			elseif var1578 == 7 then
				local _ = nil
				local var1597, var1598 = protoModule.readBuffer(p70, var1573)
				var1573 = var1598
				var1572.info_text = buffer.tostring(var1597)
			elseif var1578 == 8 then
				local _ = nil
				local var1599, var1600 = protoModule.readBuffer(p70, var1573)
				var1573 = var1600
				var1572.subtitle_link_path = buffer.tostring(var1599)
			elseif var1578 == 11 then
				local _ = nil
				local var1601, var1602 = protoModule.readBuffer(p70, var1573)
				var1573 = var1602
				var1572.applied_filters = buffer.tostring(var1601)
			else
				local _ = nil
				local var1603, var1604 = protoModule.readVarInt(p70, var1573)
				var1573 = var1604 + var1603
			end
		elseif var1574 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1605, var1606 = protoModule.readFixed32(p70, var1573)
			local _ = var1605
			var1573 = var1606
		elseif var1574 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1607, var1608 = protoModule.readFixed64(p70, var1573)
			local _ = var1607
			var1573 = var1608
		else
			error("Unsupported wire type: " .. var1574)
		end
	end
	return var1572
end

function t_36:jsonEncode() --[[ line: 10271 ]]
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

function t_36:jsonDecode() --[[ line: 10325 ]]
	-- upvalues: t_36 (ref), t (ref)
	local var1611 = t_36.new()
	
	if self.title ~= nil then
		var1611.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1611.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1611.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1611.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1611.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1611.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1611.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1611.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1611.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1611.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1611.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1611.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1611.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1611.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1611.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1611.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1611.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1611.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1611.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1611.applied_filters = self.appliedFilters
	end
	return var1611
end

t_36.descriptor = {
	name = "SongCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
}
t.SongCarouselInputData = t_36
typeRegistryModule.default:register(t.SongCarouselInputData)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p71) --[[ line: 10435 ]]
	-- upvalues: t_37 (ref)
	return setmetatable({
		song_id = if p71 == nil or p71.song_id == nil then "" else p71.song_id
	}, t_37)
end

function t_37:encode() --[[ line: 10443 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1615 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1616, var1617 = protoModule.writeTag(buff, var1615, 1, protoModule.wireTypes.lengthDelimited)
		var1616, var1617 = protoModule.writeString(var1616, var1617, self.song_id)
		buff = var1616
		var1615 = var1617
	end
	local buff_1 = buffer.create(var1615)
	buffer.copy(buff_1, 0, buff, 0, var1615)
	
	return buff_1
end

function t_37.decode(p72) --[[ line: 10457 ]]
	-- upvalues: t_37 (ref), protoModule (ref)
	local var1619 = t_37.new()
	local var1620 = 0
	while var1620 < buffer.len(p72) do
		local _ = nil
		local var1621 = nil
		local var1622, var1623, var1624 = protoModule.readTag(p72, var1620)
		local var1625 = var1622
		var1621 = var1623
		var1620 = var1624
		
		if var1621 == protoModule.wireTypes.varint then
			local _ = nil
			local var1626, var1627 = protoModule.readVarInt(p72, var1620)
			local _ = var1626
			var1620 = var1627
			continue
		end
		if var1621 == protoModule.wireTypes.lengthDelimited then
			if var1625 == 1 then
				local _ = nil
				local var1628, var1629 = protoModule.readBuffer(p72, var1620)
				var1620 = var1629
				var1619.song_id = buffer.tostring(var1628)
			else
				local _ = nil
				local var1630, var1631 = protoModule.readVarInt(p72, var1620)
				var1620 = var1631 + var1630
			end
		elseif var1621 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1632, var1633 = protoModule.readFixed32(p72, var1620)
			local _ = var1632
			var1620 = var1633
		elseif var1621 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1634, var1635 = protoModule.readFixed64(p72, var1620)
			local _ = var1634
			var1620 = var1635
		else
			error("Unsupported wire type: " .. var1621)
		end
	end
	return var1619
end

function t_37:jsonEncode() --[[ line: 10500 ]]
	local t = {}
	
	if self.song_id ~= nil and self.song_id ~= "" then
		t.songId = self.song_id
	end
	return t
end

function t_37:jsonDecode() --[[ line: 10510 ]]
	-- upvalues: t_37 (ref)
	local var1637 = t_37.new()
	
	if self.song_id ~= nil then
		var1637.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1637.song_id = self.songId
	end
	return var1637
end

t_37.descriptor = {
	name = "SongCarouselInputData_SongItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
}
t.SongCarouselInputData_SongItem = t_37
typeRegistryModule.default:register(t.SongCarouselInputData_SongItem)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p73) --[[ line: 10538 ]]
	-- upvalues: t_38 (ref)
	return setmetatable({
		title = if p73 == nil or p73.title == nil then "" else p73.title,
		event_items = if p73 == nil or p73.event_items == nil then {} else p73.event_items,
		universe_id = if p73 == nil or p73.universe_id == nil then "" else p73.universe_id,
		sort_id = if p73 == nil or p73.sort_id == nil then "" else p73.sort_id,
		subtitle = if p73 == nil or p73.subtitle == nil then "" else p73.subtitle,
		info_text = if p73 == nil or p73.info_text == nil then "" else p73.info_text
	}, t_38)
end

function t_38:encode() --[[ line: 10549 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1639 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1640, var1641 = protoModule.writeTag(buff, var1639, 1, protoModule.wireTypes.lengthDelimited)
		var1640, var1641 = protoModule.writeString(var1640, var1641, self.title)
		buff = var1640
		var1639 = var1641
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1642 = v:encode()
			local var1643, var1644 = protoModule.writeTag(buff, var1639, 2, protoModule.wireTypes.lengthDelimited)
			var1643, var1644 = protoModule.writeBuffer(var1643, var1644, var1642, buffer.len(var1642))
			buff = var1643
			var1639 = var1644
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1645, var1646 = protoModule.writeTag(buff, var1639, 3, protoModule.wireTypes.lengthDelimited)
		var1645, var1646 = protoModule.writeString(var1645, var1646, self.universe_id)
		buff = var1645
		var1639 = var1646
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1647, var1648 = protoModule.writeTag(buff, var1639, 4, protoModule.wireTypes.lengthDelimited)
		var1647, var1648 = protoModule.writeString(var1647, var1648, self.sort_id)
		buff = var1647
		var1639 = var1648
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1649, var1650 = protoModule.writeTag(buff, var1639, 5, protoModule.wireTypes.lengthDelimited)
		var1649, var1650 = protoModule.writeString(var1649, var1650, self.subtitle)
		buff = var1649
		var1639 = var1650
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1651, var1652 = protoModule.writeTag(buff, var1639, 6, protoModule.wireTypes.lengthDelimited)
		var1651, var1652 = protoModule.writeString(var1651, var1652, self.info_text)
		buff = var1651
		var1639 = var1652
	end
	local buff_1 = buffer.create(var1639)
	buffer.copy(buff_1, 0, buff, 0, var1639)
	
	return buff_1
end

function t_38.decode(p74) --[[ line: 10591 ]]
	-- upvalues: t_38 (ref), protoModule (ref), t (ref)
	local var1654 = t_38.new()
	local var1655 = 0
	while var1655 < buffer.len(p74) do
		local _ = nil
		local var1656 = nil
		local var1657, var1658, var1659 = protoModule.readTag(p74, var1655)
		local var1660 = var1657
		var1656 = var1658
		var1655 = var1659
		
		if var1656 == protoModule.wireTypes.varint then
			local _ = nil
			local var1661, var1662 = protoModule.readVarInt(p74, var1655)
			local _ = var1661
			var1655 = var1662
			continue
		end
		if var1656 == protoModule.wireTypes.lengthDelimited then
			if var1660 == 1 then
				local _ = nil
				local var1663, var1664 = protoModule.readBuffer(p74, var1655)
				var1655 = var1664
				var1654.title = buffer.tostring(var1663)
			elseif var1660 == 2 then
				local _ = nil
				local var1665, var1666 = protoModule.readBuffer(p74, var1655)
				var1655 = var1666
				table.insert(var1654.event_items, t.EventsCarouselInputData_EventItem.decode(var1665))
			elseif var1660 == 3 then
				local _ = nil
				local var1667, var1668 = protoModule.readBuffer(p74, var1655)
				var1655 = var1668
				var1654.universe_id = buffer.tostring(var1667)
			elseif var1660 == 4 then
				local _ = nil
				local var1669, var1670 = protoModule.readBuffer(p74, var1655)
				var1655 = var1670
				var1654.sort_id = buffer.tostring(var1669)
			elseif var1660 == 5 then
				local _ = nil
				local var1671, var1672 = protoModule.readBuffer(p74, var1655)
				var1655 = var1672
				var1654.subtitle = buffer.tostring(var1671)
			elseif var1660 == 6 then
				local _ = nil
				local var1673, var1674 = protoModule.readBuffer(p74, var1655)
				var1655 = var1674
				var1654.info_text = buffer.tostring(var1673)
			else
				local _ = nil
				local var1675, var1676 = protoModule.readVarInt(p74, var1655)
				var1655 = var1676 + var1675
			end
		elseif var1656 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1677, var1678 = protoModule.readFixed32(p74, var1655)
			local _ = var1677
			var1655 = var1678
		elseif var1656 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1679, var1680 = protoModule.readFixed64(p74, var1655)
			local _ = var1679
			var1655 = var1680
		else
			error("Unsupported wire type: " .. var1656)
		end
	end
	return var1654
end

function t_38:jsonEncode() --[[ line: 10659 ]]
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

function t_38:jsonDecode() --[[ line: 10693 ]]
	-- upvalues: t_38 (ref), t (ref)
	local var1683 = t_38.new()
	
	if self.title ~= nil then
		var1683.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1683.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1683.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1683.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1683.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1683.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1683.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1683.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1683.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1683.info_text = self.infoText
	end
	return var1683
end

t_38.descriptor = {
	name = "EventsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
}
t.EventsCarouselInputData = t_38
typeRegistryModule.default:register(t.EventsCarouselInputData)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p75) --[[ line: 10763 ]]
	-- upvalues: t_39 (ref)
	return setmetatable({
		event_id = if p75 == nil or p75.event_id == nil then "" else p75.event_id
	}, t_39)
end

function t_39:encode() --[[ line: 10771 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1687 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1688, var1689 = protoModule.writeTag(buff, var1687, 1, protoModule.wireTypes.lengthDelimited)
		var1688, var1689 = protoModule.writeString(var1688, var1689, self.event_id)
		buff = var1688
		var1687 = var1689
	end
	local buff_1 = buffer.create(var1687)
	buffer.copy(buff_1, 0, buff, 0, var1687)
	
	return buff_1
end

function t_39.decode(p76) --[[ line: 10785 ]]
	-- upvalues: t_39 (ref), protoModule (ref)
	local var1691 = t_39.new()
	local var1692 = 0
	while var1692 < buffer.len(p76) do
		local _ = nil
		local var1693 = nil
		local var1694, var1695, var1696 = protoModule.readTag(p76, var1692)
		local var1697 = var1694
		var1693 = var1695
		var1692 = var1696
		
		if var1693 == protoModule.wireTypes.varint then
			local _ = nil
			local var1698, var1699 = protoModule.readVarInt(p76, var1692)
			local _ = var1698
			var1692 = var1699
			continue
		end
		if var1693 == protoModule.wireTypes.lengthDelimited then
			if var1697 == 1 then
				local _ = nil
				local var1700, var1701 = protoModule.readBuffer(p76, var1692)
				var1692 = var1701
				var1691.event_id = buffer.tostring(var1700)
			else
				local _ = nil
				local var1702, var1703 = protoModule.readVarInt(p76, var1692)
				var1692 = var1703 + var1702
			end
		elseif var1693 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1704, var1705 = protoModule.readFixed32(p76, var1692)
			local _ = var1704
			var1692 = var1705
		elseif var1693 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1706, var1707 = protoModule.readFixed64(p76, var1692)
			local _ = var1706
			var1692 = var1707
		else
			error("Unsupported wire type: " .. var1693)
		end
	end
	return var1691
end

function t_39:jsonEncode() --[[ line: 10828 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_39:jsonDecode() --[[ line: 10838 ]]
	-- upvalues: t_39 (ref)
	local var1709 = t_39.new()
	
	if self.event_id ~= nil then
		var1709.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1709.event_id = self.eventId
	end
	return var1709
end

t_39.descriptor = {
	name = "EventsCarouselInputData_EventItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
}
t.EventsCarouselInputData_EventItem = t_39
typeRegistryModule.default:register(t.EventsCarouselInputData_EventItem)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p77) --[[ line: 10868 ]]
	-- upvalues: t_40 (ref)
	return setmetatable({
		universe_id = if p77 == nil or p77.universe_id == nil then "" else p77.universe_id,
		entry_map = if p77 == nil or p77.entry_map == nil then {} else p77.entry_map,
		entry_order = if p77 == nil or p77.entry_order == nil then {} else p77.entry_order,
		creator_key = if p77 == nil or p77.creator_key == nil then "" else p77.creator_key
	}, t_40)
end

function t_40:encode() --[[ line: 10877 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1711 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1712, var1713 = protoModule.writeTag(buff, var1711, 1, protoModule.wireTypes.lengthDelimited)
		var1712, var1713 = protoModule.writeString(var1712, var1713, self.universe_id)
		buff = var1712
		var1711 = var1713
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1714, var1715 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1714, var1715 = protoModule.writeString(var1714, var1715, i)
			local var1716 = v:encode()
			var1715, var1717 = protoModule.writeTag(var1714, var1715, 2, protoModule.wireTypes.lengthDelimited)
			var1715, var1717 = protoModule.writeBuffer(var1715, var1717, var1716, buffer.len(var1716))
			local var1718 = var1715
			local var1719 = var1717
			local var1720, var1721 = protoModule.writeTag(buff, var1711, 2, protoModule.wireTypes.lengthDelimited)
			var1720, var1721 = protoModule.writeBuffer(var1720, var1721, var1718, var1719)
			buff = var1720
			var1711 = var1721
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1722, var1723 = protoModule.writeTag(buff, var1711, 3, protoModule.wireTypes.lengthDelimited)
			var1722, var1723 = protoModule.writeString(var1722, var1723, v)
			buff = var1722
			var1711 = var1723
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1724, var1725 = protoModule.writeTag(buff, var1711, 4, protoModule.wireTypes.lengthDelimited)
		var1724, var1725 = protoModule.writeString(var1724, var1725, self.creator_key)
		buff = var1724
		var1711 = var1725
	end
	local buff_1 = buffer.create(var1711)
	buffer.copy(buff_1, 0, buff, 0, var1711)
	
	return buff_1
end

function t_40.decode(p78) --[[ line: 10917 ]]
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var1727 = t_40.new()
	local var1728 = 0
	while var1728 < buffer.len(p78) do
		local _ = nil
		local var1729 = nil
		local var1730, var1731, var1732 = protoModule.readTag(p78, var1728)
		local var1733 = var1730
		var1729 = var1731
		var1728 = var1732
		
		if var1729 == protoModule.wireTypes.varint then
			local _ = nil
			local var1734, var1735 = protoModule.readVarInt(p78, var1728)
			local _ = var1734
			var1728 = var1735
			continue
		end
		if var1729 == protoModule.wireTypes.lengthDelimited then
			if var1733 == 1 then
				local _ = nil
				local var1736, var1737 = protoModule.readBuffer(p78, var1728)
				var1728 = var1737
				var1727.universe_id = buffer.tostring(var1736)
			elseif var1733 == 2 then
				local _ = nil
				local var1738, var1739 = protoModule.readBuffer(p78, var1728)
				var1728 = var1739
				var1738 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1738)
				var1727.entry_map[var1738.key or ""] = var1738.value or t.FeedEntry.new()
			elseif var1733 == 3 then
				local _ = nil
				local var1740, var1741 = protoModule.readBuffer(p78, var1728)
				var1728 = var1741
				table.insert(var1727.entry_order, buffer.tostring(var1740))
			elseif var1733 == 4 then
				local _ = nil
				local var1742, var1743 = protoModule.readBuffer(p78, var1728)
				var1728 = var1743
				var1727.creator_key = buffer.tostring(var1742)
			else
				local _ = nil
				local var1744, var1745 = protoModule.readVarInt(p78, var1728)
				var1728 = var1745 + var1744
			end
		elseif var1729 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1746, var1747 = protoModule.readFixed32(p78, var1728)
			local _ = var1746
			var1728 = var1747
		elseif var1729 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1748, var1749 = protoModule.readFixed64(p78, var1728)
			local _ = var1748
			var1728 = var1749
		else
			error("Unsupported wire type: " .. var1729)
		end
	end
	return var1727
end

function t_40:jsonEncode() --[[ line: 10982 ]]
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

function t_40:jsonDecode() --[[ line: 11012 ]]
	-- upvalues: t_40 (ref), t (ref)
	local var1753 = t_40.new()
	
	if self.universe_id ~= nil then
		var1753.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1753.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1753.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1753.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1753.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1753.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1753.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1753.creator_key = self.creatorKey
	end
	return var1753
end

t_40.descriptor = {
	name = "DevStoreFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
}
t.DevStoreFeedInputData = t_40
typeRegistryModule.default:register(t.DevStoreFeedInputData)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p79) --[[ line: 11084 ]]
	-- upvalues: t_41 (ref)
	return setmetatable({
		key = if p79 == nil or p79.key == nil then "" else p79.key,
		value = if p79 == nil or p79.value == nil then nil else p79.value
	}, t_41)
end

function t_41:encode() --[[ line: 11093 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1759 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1760, var1761 = protoModule.writeTag(buff, var1759, 1, protoModule.wireTypes.lengthDelimited)
		var1760, var1761 = protoModule.writeString(var1760, var1761, self.key)
		buff = var1760
		var1759 = var1761
	end
	if self.value ~= nil then
		local var1762 = self.value:encode()
		local var1763, var1764 = protoModule.writeTag(buff, var1759, 2, protoModule.wireTypes.lengthDelimited)
		var1763, var1764 = protoModule.writeBuffer(var1763, var1764, var1762, buffer.len(var1762))
		buff = var1763
		var1759 = var1764
	end
	local buff_1 = buffer.create(var1759)
	buffer.copy(buff_1, 0, buff, 0, var1759)
	
	return buff_1
end

function t_41.decode(p80) --[[ line: 11113 ]]
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1766 = t_41.new()
	local var1767 = 0
	while var1767 < buffer.len(p80) do
		local _ = nil
		local var1768 = nil
		local var1769, var1770, var1771 = protoModule.readTag(p80, var1767)
		local var1772 = var1769
		var1768 = var1770
		var1767 = var1771
		
		if var1768 == protoModule.wireTypes.varint then
			local _ = nil
			local var1773, var1774 = protoModule.readVarInt(p80, var1767)
			local _ = var1773
			var1767 = var1774
			continue
		end
		if var1768 == protoModule.wireTypes.lengthDelimited then
			if var1772 == 1 then
				local _ = nil
				local var1775, var1776 = protoModule.readBuffer(p80, var1767)
				var1767 = var1776
				var1766.key = buffer.tostring(var1775)
			elseif var1772 == 2 then
				local _ = nil
				local var1777, var1778 = protoModule.readBuffer(p80, var1767)
				var1767 = var1778
				var1766.value = t.FeedEntry.decode(var1777)
			else
				local _ = nil
				local var1779, var1780 = protoModule.readVarInt(p80, var1767)
				var1767 = var1780 + var1779
			end
		elseif var1768 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1781, var1782 = protoModule.readFixed32(p80, var1767)
			local _ = var1781
			var1767 = var1782
		elseif var1768 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1783, var1784 = protoModule.readFixed64(p80, var1767)
			local _ = var1783
			var1767 = var1784
		else
			error("Unsupported wire type: " .. var1768)
		end
	end
	return var1766
end

function t_41:jsonEncode() --[[ line: 11161 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_41:jsonDecode() --[[ line: 11175 ]]
	-- upvalues: t_41 (ref), t (ref)
	local var1786 = t_41.new()
	
	if self.key ~= nil then
		var1786.key = self.key
	end
	if self.value ~= nil then
		var1786.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1786
end

t_41.descriptor = {
	name = "DevStoreFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.DevStoreFeedInputData_EntryMapEntry = t_41
typeRegistryModule.default:register(t.DevStoreFeedInputData_EntryMapEntry)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p81) --[[ line: 11205 ]]
	-- upvalues: t_42 (ref)
	return setmetatable({
		game_passes = if p81 == nil or p81.game_passes == nil then {} else p81.game_passes
	}, t_42)
end

function t_42:encode() --[[ line: 11213 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1788 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1789 = v:encode()
			local var1790, var1791 = protoModule.writeTag(buff, var1788, 1, protoModule.wireTypes.lengthDelimited)
			var1790, var1791 = protoModule.writeBuffer(var1790, var1791, var1789, buffer.len(var1789))
			buff = var1790
			var1788 = var1791
		end
	end
	local buff_1 = buffer.create(var1788)
	buffer.copy(buff_1, 0, buff, 0, var1788)
	
	return buff_1
end

function t_42.decode(p82) --[[ line: 11230 ]]
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1793 = t_42.new()
	local var1794 = 0
	while var1794 < buffer.len(p82) do
		local _ = nil
		local var1795 = nil
		local var1796, var1797, var1798 = protoModule.readTag(p82, var1794)
		local var1799 = var1796
		var1795 = var1797
		var1794 = var1798
		
		if var1795 == protoModule.wireTypes.varint then
			local _ = nil
			local var1800, var1801 = protoModule.readVarInt(p82, var1794)
			local _ = var1800
			var1794 = var1801
			continue
		end
		if var1795 == protoModule.wireTypes.lengthDelimited then
			if var1799 == 1 then
				local _ = nil
				local var1802, var1803 = protoModule.readBuffer(p82, var1794)
				var1794 = var1803
				table.insert(var1793.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1802))
			else
				local _ = nil
				local var1804, var1805 = protoModule.readVarInt(p82, var1794)
				var1794 = var1805 + var1804
			end
		elseif var1795 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1806, var1807 = protoModule.readFixed32(p82, var1794)
			local _ = var1806
			var1794 = var1807
		elseif var1795 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1808, var1809 = protoModule.readFixed64(p82, var1794)
			local _ = var1808
			var1794 = var1809
		else
			error("Unsupported wire type: " .. var1795)
		end
	end
	return var1793
end

function t_42:jsonEncode() --[[ line: 11273 ]]
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

function t_42:jsonDecode() --[[ line: 11287 ]]
	-- upvalues: t_42 (ref), t (ref)
	local var1812 = t_42.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1812.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1812.game_passes = t_1
	end
	return var1812
end

t_42.descriptor = {
	name = "GamePassCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
}
t.GamePassCollectionInputData = t_42
typeRegistryModule.default:register(t.GamePassCollectionInputData)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p83) --[[ line: 11325 ]]
	-- upvalues: t_43 (ref)
	return setmetatable({
		game_pass_id = if p83 == nil or p83.game_pass_id == nil then "" else p83.game_pass_id
	}, t_43)
end

function t_43:encode() --[[ line: 11333 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1816 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1817, var1818 = protoModule.writeTag(buff, var1816, 1, protoModule.wireTypes.lengthDelimited)
		var1817, var1818 = protoModule.writeString(var1817, var1818, self.game_pass_id)
		buff = var1817
		var1816 = var1818
	end
	local buff_1 = buffer.create(var1816)
	buffer.copy(buff_1, 0, buff, 0, var1816)
	
	return buff_1
end

function t_43.decode(p84) --[[ line: 11349 ]]
	-- upvalues: t_43 (ref), protoModule (ref)
	local var1820 = t_43.new()
	local var1821 = 0
	while var1821 < buffer.len(p84) do
		local _ = nil
		local var1822 = nil
		local var1823, var1824, var1825 = protoModule.readTag(p84, var1821)
		local var1826 = var1823
		var1822 = var1824
		var1821 = var1825
		
		if var1822 == protoModule.wireTypes.varint then
			local _ = nil
			local var1827, var1828 = protoModule.readVarInt(p84, var1821)
			local _ = var1827
			var1821 = var1828
			continue
		end
		if var1822 == protoModule.wireTypes.lengthDelimited then
			if var1826 == 1 then
				local _ = nil
				local var1829, var1830 = protoModule.readBuffer(p84, var1821)
				var1821 = var1830
				var1820.game_pass_id = buffer.tostring(var1829)
			else
				local _ = nil
				local var1831, var1832 = protoModule.readVarInt(p84, var1821)
				var1821 = var1832 + var1831
			end
		elseif var1822 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1833, var1834 = protoModule.readFixed32(p84, var1821)
			local _ = var1833
			var1821 = var1834
		elseif var1822 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1835, var1836 = protoModule.readFixed64(p84, var1821)
			local _ = var1835
			var1821 = var1836
		else
			error("Unsupported wire type: " .. var1822)
		end
	end
	return var1820
end

function t_43:jsonEncode() --[[ line: 11394 ]]
	local t = {}
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		t.gamePassId = self.game_pass_id
	end
	return t
end

function t_43:jsonDecode() --[[ line: 11406 ]]
	-- upvalues: t_43 (ref)
	local var1838 = t_43.new()
	
	if self.game_pass_id ~= nil then
		var1838.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1838.game_pass_id = self.gamePassId
	end
	return var1838
end

t_43.descriptor = {
	name = "GamePassCollectionInputData_GamePassItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
}
t.GamePassCollectionInputData_GamePassItem = t_43
typeRegistryModule.default:register(t.GamePassCollectionInputData_GamePassItem)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p85) --[[ line: 11436 ]]
	-- upvalues: t_44 (ref)
	return setmetatable({
		developer_products = if p85 == nil or p85.developer_products == nil then {} else p85.developer_products
	}, t_44)
end

function t_44:encode() --[[ line: 11444 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1840 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1841 = v:encode()
			local var1842, var1843 = protoModule.writeTag(buff, var1840, 1, protoModule.wireTypes.lengthDelimited)
			var1842, var1843 = protoModule.writeBuffer(var1842, var1843, var1841, buffer.len(var1841))
			buff = var1842
			var1840 = var1843
		end
	end
	local buff_1 = buffer.create(var1840)
	buffer.copy(buff_1, 0, buff, 0, var1840)
	
	return buff_1
end

function t_44.decode(p86) --[[ line: 11461 ]]
	-- upvalues: t_44 (ref), protoModule (ref), t (ref)
	local var1845 = t_44.new()
	local var1846 = 0
	while var1846 < buffer.len(p86) do
		local _ = nil
		local var1847 = nil
		local var1848, var1849, var1850 = protoModule.readTag(p86, var1846)
		local var1851 = var1848
		var1847 = var1849
		var1846 = var1850
		
		if var1847 == protoModule.wireTypes.varint then
			local _ = nil
			local var1852, var1853 = protoModule.readVarInt(p86, var1846)
			local _ = var1852
			var1846 = var1853
			continue
		end
		if var1847 == protoModule.wireTypes.lengthDelimited then
			if var1851 == 1 then
				local _ = nil
				local var1854, var1855 = protoModule.readBuffer(p86, var1846)
				var1846 = var1855
				table.insert(var1845.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1854))
			else
				local _ = nil
				local var1856, var1857 = protoModule.readVarInt(p86, var1846)
				var1846 = var1857 + var1856
			end
		elseif var1847 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1858, var1859 = protoModule.readFixed32(p86, var1846)
			local _ = var1858
			var1846 = var1859
		elseif var1847 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1860, var1861 = protoModule.readFixed64(p86, var1846)
			local _ = var1860
			var1846 = var1861
		else
			error("Unsupported wire type: " .. var1847)
		end
	end
	return var1845
end

function t_44:jsonEncode() --[[ line: 11507 ]]
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

function t_44:jsonDecode() --[[ line: 11521 ]]
	-- upvalues: t_44 (ref), t (ref)
	local var1864 = t_44.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1864.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1864.developer_products = t_1
	end
	return var1864
end

t_44.descriptor = {
	name = "DeveloperProductCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
}
t.DeveloperProductCollectionInputData = t_44
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p87) --[[ line: 11568 ]]
	-- upvalues: t_45 (ref)
	return setmetatable({
		developer_product_id = if p87 == nil or p87.developer_product_id == nil then "" else p87.developer_product_id
	}, t_45)
end

function t_45:encode() --[[ line: 11581 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1868 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1869, var1870 = protoModule.writeTag(buff, var1868, 1, protoModule.wireTypes.lengthDelimited)
		var1869, var1870 = protoModule.writeString(var1869, var1870, self.developer_product_id)
		buff = var1869
		var1868 = var1870
	end
	local buff_1 = buffer.create(var1868)
	buffer.copy(buff_1, 0, buff, 0, var1868)
	
	return buff_1
end

function t_45.decode(p88) --[[ line: 11597 ]]
	-- upvalues: t_45 (ref), protoModule (ref)
	local var1872 = t_45.new()
	local var1873 = 0
	while var1873 < buffer.len(p88) do
		local _ = nil
		local var1874 = nil
		local var1875, var1876, var1877 = protoModule.readTag(p88, var1873)
		local var1878 = var1875
		var1874 = var1876
		var1873 = var1877
		
		if var1874 == protoModule.wireTypes.varint then
			local _ = nil
			local var1879, var1880 = protoModule.readVarInt(p88, var1873)
			local _ = var1879
			var1873 = var1880
			continue
		end
		if var1874 == protoModule.wireTypes.lengthDelimited then
			if var1878 == 1 then
				local _ = nil
				local var1881, var1882 = protoModule.readBuffer(p88, var1873)
				var1873 = var1882
				var1872.developer_product_id = buffer.tostring(var1881)
			else
				local _ = nil
				local var1883, var1884 = protoModule.readVarInt(p88, var1873)
				var1873 = var1884 + var1883
			end
		elseif var1874 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1885, var1886 = protoModule.readFixed32(p88, var1873)
			local _ = var1885
			var1873 = var1886
		elseif var1874 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1887, var1888 = protoModule.readFixed64(p88, var1873)
			local _ = var1887
			var1873 = var1888
		else
			error("Unsupported wire type: " .. var1874)
		end
	end
	return var1872
end

function t_45:jsonEncode() --[[ line: 11642 ]]
	local t = {}
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		t.developerProductId = self.developer_product_id
	end
	return t
end

function t_45:jsonDecode() --[[ line: 11654 ]]
	-- upvalues: t_45 (ref)
	local var1890 = t_45.new()
	
	if self.developer_product_id ~= nil then
		var1890.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1890.developer_product_id = self.developerProductId
	end
	return var1890
end

t_45.descriptor = {
	name = "DeveloperProductCollectionInputData_DeveloperProductItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
}
t.DeveloperProductCollectionInputData_DeveloperProductItem = t_45
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData_DeveloperProductItem)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p89) --[[ line: 11685 ]]
	-- upvalues: t_46 (ref)
	return setmetatable({
		subscriptions = if p89 == nil or p89.subscriptions == nil then {} else p89.subscriptions
	}, t_46)
end

function t_46:encode() --[[ line: 11693 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1892 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
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

function t_46.decode(p90) --[[ line: 11710 ]]
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var1897 = t_46.new()
	local var1898 = 0
	while var1898 < buffer.len(p90) do
		local _ = nil
		local var1899 = nil
		local var1900, var1901, var1902 = protoModule.readTag(p90, var1898)
		local var1903 = var1900
		var1899 = var1901
		var1898 = var1902
		
		if var1899 == protoModule.wireTypes.varint then
			local _ = nil
			local var1904, var1905 = protoModule.readVarInt(p90, var1898)
			local _ = var1904
			var1898 = var1905
			continue
		end
		if var1899 == protoModule.wireTypes.lengthDelimited then
			if var1903 == 1 then
				local _ = nil
				local var1906, var1907 = protoModule.readBuffer(p90, var1898)
				var1898 = var1907
				table.insert(var1897.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1906))
			else
				local _ = nil
				local var1908, var1909 = protoModule.readVarInt(p90, var1898)
				var1898 = var1909 + var1908
			end
		elseif var1899 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1910, var1911 = protoModule.readFixed32(p90, var1898)
			local _ = var1910
			var1898 = var1911
		elseif var1899 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1912, var1913 = protoModule.readFixed64(p90, var1898)
			local _ = var1912
			var1898 = var1913
		else
			error("Unsupported wire type: " .. var1899)
		end
	end
	return var1897
end

function t_46:jsonEncode() --[[ line: 11756 ]]
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

function t_46:jsonDecode() --[[ line: 11770 ]]
	-- upvalues: t_46 (ref), t (ref)
	local var1916 = t_46.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1916.subscriptions = t_1
	end
	return var1916
end

t_46.descriptor = {
	name = "SubscriptionCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
}
t.SubscriptionCollectionInputData = t_46
typeRegistryModule.default:register(t.SubscriptionCollectionInputData)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p91) --[[ line: 11800 ]]
	-- upvalues: t_47 (ref)
	return setmetatable({
		subscription_id = if p91 == nil or p91.subscription_id == nil then "" else p91.subscription_id
	}, t_47)
end

function t_47:encode() --[[ line: 11811 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1919 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var1920, var1921 = protoModule.writeTag(buff, var1919, 1, protoModule.wireTypes.lengthDelimited)
		var1920, var1921 = protoModule.writeString(var1920, var1921, self.subscription_id)
		buff = var1920
		var1919 = var1921
	end
	local buff_1 = buffer.create(var1919)
	buffer.copy(buff_1, 0, buff, 0, var1919)
	
	return buff_1
end

function t_47.decode(p92) --[[ line: 11827 ]]
	-- upvalues: t_47 (ref), protoModule (ref)
	local var1923 = t_47.new()
	local var1924 = 0
	while var1924 < buffer.len(p92) do
		local _ = nil
		local var1925 = nil
		local var1926, var1927, var1928 = protoModule.readTag(p92, var1924)
		local var1929 = var1926
		var1925 = var1927
		var1924 = var1928
		
		if var1925 == protoModule.wireTypes.varint then
			local _ = nil
			local var1930, var1931 = protoModule.readVarInt(p92, var1924)
			local _ = var1930
			var1924 = var1931
			continue
		end
		if var1925 == protoModule.wireTypes.lengthDelimited then
			if var1929 == 1 then
				local _ = nil
				local var1932, var1933 = protoModule.readBuffer(p92, var1924)
				var1924 = var1933
				var1923.subscription_id = buffer.tostring(var1932)
			else
				local _ = nil
				local var1934, var1935 = protoModule.readVarInt(p92, var1924)
				var1924 = var1935 + var1934
			end
		elseif var1925 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1936, var1937 = protoModule.readFixed32(p92, var1924)
			local _ = var1936
			var1924 = var1937
		elseif var1925 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1938, var1939 = protoModule.readFixed64(p92, var1924)
			local _ = var1938
			var1924 = var1939
		else
			error("Unsupported wire type: " .. var1925)
		end
	end
	return var1923
end

function t_47:jsonEncode() --[[ line: 11872 ]]
	local t = {}
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		t.subscriptionId = self.subscription_id
	end
	return t
end

function t_47:jsonDecode() --[[ line: 11884 ]]
	-- upvalues: t_47 (ref)
	local var1941 = t_47.new()
	
	if self.subscription_id ~= nil then
		var1941.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1941.subscription_id = self.subscriptionId
	end
	return var1941
end

t_47.descriptor = {
	name = "SubscriptionCollectionInputData_SubscriptionItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
}
t.SubscriptionCollectionInputData_SubscriptionItem = t_47
typeRegistryModule.default:register(t.SubscriptionCollectionInputData_SubscriptionItem)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p93) --[[ line: 11915 ]]
	-- upvalues: t_48 (ref)
	return setmetatable({
		roblox_component = if p93 == nil or p93.roblox_component == nil then "" else p93.roblox_component,
		identifier = if p93 == nil or p93.identifier == nil then "" else p93.identifier,
		title = if p93 == nil or p93.title == nil then "" else p93.title,
		user_id = if p93 == nil or p93.user_id == nil then "" else p93.user_id,
		description = if p93 == nil or p93.description == nil then "" else p93.description,
		cta_text = if p93 == nil or p93.cta_text == nil then "" else p93.cta_text,
		prompt_id = if p93 == nil or p93.prompt_id == nil then "" else p93.prompt_id,
		prompt_type = if p93 == nil or p93.prompt_type == nil then "" else p93.prompt_type
	}, t_48)
end

function t_48:encode() --[[ line: 11930 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1943 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1944, var1945 = protoModule.writeTag(buff, var1943, 1, protoModule.wireTypes.lengthDelimited)
		var1944, var1945 = protoModule.writeString(var1944, var1945, self.roblox_component)
		buff = var1944
		var1943 = var1945
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var1946, var1947 = protoModule.writeTag(buff, var1943, 2, protoModule.wireTypes.lengthDelimited)
		var1946, var1947 = protoModule.writeString(var1946, var1947, self.identifier)
		buff = var1946
		var1943 = var1947
	end
	if self.title ~= nil and self.title ~= "" then
		local var1948, var1949 = protoModule.writeTag(buff, var1943, 3, protoModule.wireTypes.lengthDelimited)
		var1948, var1949 = protoModule.writeString(var1948, var1949, self.title)
		buff = var1948
		var1943 = var1949
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1950, var1951 = protoModule.writeTag(buff, var1943, 4, protoModule.wireTypes.lengthDelimited)
		var1950, var1951 = protoModule.writeString(var1950, var1951, self.user_id)
		buff = var1950
		var1943 = var1951
	end
	if self.description ~= nil and self.description ~= "" then
		local var1952, var1953 = protoModule.writeTag(buff, var1943, 5, protoModule.wireTypes.lengthDelimited)
		var1952, var1953 = protoModule.writeString(var1952, var1953, self.description)
		buff = var1952
		var1943 = var1953
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1954, var1955 = protoModule.writeTag(buff, var1943, 6, protoModule.wireTypes.lengthDelimited)
		var1954, var1955 = protoModule.writeString(var1954, var1955, self.cta_text)
		buff = var1954
		var1943 = var1955
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1956, var1957 = protoModule.writeTag(buff, var1943, 7, protoModule.wireTypes.lengthDelimited)
		var1956, var1957 = protoModule.writeString(var1956, var1957, self.prompt_id)
		buff = var1956
		var1943 = var1957
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1958, var1959 = protoModule.writeTag(buff, var1943, 8, protoModule.wireTypes.lengthDelimited)
		var1958, var1959 = protoModule.writeString(var1958, var1959, self.prompt_type)
		buff = var1958
		var1943 = var1959
	end
	local buff_1 = buffer.create(var1943)
	buffer.copy(buff_1, 0, buff, 0, var1943)
	
	return buff_1
end

function t_48.decode(p94) --[[ line: 11979 ]]
	-- upvalues: t_48 (ref), protoModule (ref)
	local var1961 = t_48.new()
	local var1962 = 0
	while var1962 < buffer.len(p94) do
		local _ = nil
		local var1963 = nil
		local var1964, var1965, var1966 = protoModule.readTag(p94, var1962)
		local var1967 = var1964
		var1963 = var1965
		var1962 = var1966
		
		if var1963 == protoModule.wireTypes.varint then
			local _ = nil
			local var1968, var1969 = protoModule.readVarInt(p94, var1962)
			local _ = var1968
			var1962 = var1969
			continue
		end
		if var1963 == protoModule.wireTypes.lengthDelimited then
			if var1967 == 1 then
				local _ = nil
				local var1970, var1971 = protoModule.readBuffer(p94, var1962)
				var1962 = var1971
				var1961.roblox_component = buffer.tostring(var1970)
			elseif var1967 == 2 then
				local _ = nil
				local var1972, var1973 = protoModule.readBuffer(p94, var1962)
				var1962 = var1973
				var1961.identifier = buffer.tostring(var1972)
			elseif var1967 == 3 then
				local _ = nil
				local var1974, var1975 = protoModule.readBuffer(p94, var1962)
				var1962 = var1975
				var1961.title = buffer.tostring(var1974)
			elseif var1967 == 4 then
				local _ = nil
				local var1976, var1977 = protoModule.readBuffer(p94, var1962)
				var1962 = var1977
				var1961.user_id = buffer.tostring(var1976)
			elseif var1967 == 5 then
				local _ = nil
				local var1978, var1979 = protoModule.readBuffer(p94, var1962)
				var1962 = var1979
				var1961.description = buffer.tostring(var1978)
			elseif var1967 == 6 then
				local _ = nil
				local var1980, var1981 = protoModule.readBuffer(p94, var1962)
				var1962 = var1981
				var1961.cta_text = buffer.tostring(var1980)
			elseif var1967 == 7 then
				local _ = nil
				local var1982, var1983 = protoModule.readBuffer(p94, var1962)
				var1962 = var1983
				var1961.prompt_id = buffer.tostring(var1982)
			elseif var1967 == 8 then
				local _ = nil
				local var1984, var1985 = protoModule.readBuffer(p94, var1962)
				var1962 = var1985
				var1961.prompt_type = buffer.tostring(var1984)
			else
				local _ = nil
				local var1986, var1987 = protoModule.readVarInt(p94, var1962)
				var1962 = var1987 + var1986
			end
		elseif var1963 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1988, var1989 = protoModule.readFixed32(p94, var1962)
			local _ = var1988
			var1962 = var1989
		elseif var1963 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1990, var1991 = protoModule.readFixed64(p94, var1962)
			local _ = var1990
			var1962 = var1991
		else
			error("Unsupported wire type: " .. var1963)
		end
	end
	return var1961
end

function t_48:jsonEncode() --[[ line: 12057 ]]
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
	return t
end

function t_48:jsonDecode() --[[ line: 12095 ]]
	-- upvalues: t_48 (ref)
	local var1993 = t_48.new()
	
	if self.roblox_component ~= nil then
		var1993.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1993.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1993.identifier = self.identifier
	end
	if self.title ~= nil then
		var1993.title = self.title
	end
	if self.user_id ~= nil then
		var1993.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1993.user_id = self.userId
	end
	if self.description ~= nil then
		var1993.description = self.description
	end
	if self.cta_text ~= nil then
		var1993.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1993.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1993.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1993.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1993.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1993.prompt_type = self.promptType
	end
	return var1993
end

t_48.descriptor = {
	name = "CardContainerCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
}
t.CardContainerCardInputData = t_48
typeRegistryModule.default:register(t.CardContainerCardInputData)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p95) --[[ line: 12167 ]]
	-- upvalues: t_49 (ref)
	return setmetatable({
		title = if p95 == nil or p95.title == nil then "" else p95.title,
		dismiss_text = if p95 == nil or p95.dismiss_text == nil then "" else p95.dismiss_text,
		user_id = if p95 == nil or p95.user_id == nil then "" else p95.user_id,
		cards = if p95 == nil or p95.cards == nil then {} else p95.cards,
		prompt_id = if p95 == nil or p95.prompt_id == nil then "" else p95.prompt_id,
		prompt_type = if p95 == nil or p95.prompt_type == nil then "" else p95.prompt_type
	}, t_49)
end

function t_49:encode() --[[ line: 12178 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1995 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1996, var1997 = protoModule.writeTag(buff, var1995, 1, protoModule.wireTypes.lengthDelimited)
		var1996, var1997 = protoModule.writeString(var1996, var1997, self.title)
		buff = var1996
		var1995 = var1997
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var1998, var1999 = protoModule.writeTag(buff, var1995, 2, protoModule.wireTypes.lengthDelimited)
		var1998, var1999 = protoModule.writeString(var1998, var1999, self.dismiss_text)
		buff = var1998
		var1995 = var1999
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2000, var2001 = protoModule.writeTag(buff, var1995, 3, protoModule.wireTypes.lengthDelimited)
		var2000, var2001 = protoModule.writeString(var2000, var2001, self.user_id)
		buff = var2000
		var1995 = var2001
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var2002 = v:encode()
			local var2003, var2004 = protoModule.writeTag(buff, var1995, 4, protoModule.wireTypes.lengthDelimited)
			var2003, var2004 = protoModule.writeBuffer(var2003, var2004, var2002, buffer.len(var2002))
			buff = var2003
			var1995 = var2004
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2005, var2006 = protoModule.writeTag(buff, var1995, 5, protoModule.wireTypes.lengthDelimited)
		var2005, var2006 = protoModule.writeString(var2005, var2006, self.prompt_id)
		buff = var2005
		var1995 = var2006
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2007, var2008 = protoModule.writeTag(buff, var1995, 6, protoModule.wireTypes.lengthDelimited)
		var2007, var2008 = protoModule.writeString(var2007, var2008, self.prompt_type)
		buff = var2007
		var1995 = var2008
	end
	local buff_1 = buffer.create(var1995)
	buffer.copy(buff_1, 0, buff, 0, var1995)
	
	return buff_1
end

function t_49.decode(p96) --[[ line: 12220 ]]
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var2010 = t_49.new()
	local var2011 = 0
	while var2011 < buffer.len(p96) do
		local _ = nil
		local var2012 = nil
		local var2013, var2014, var2015 = protoModule.readTag(p96, var2011)
		local var2016 = var2013
		var2012 = var2014
		var2011 = var2015
		
		if var2012 == protoModule.wireTypes.varint then
			local _ = nil
			local var2017, var2018 = protoModule.readVarInt(p96, var2011)
			local _ = var2017
			var2011 = var2018
			continue
		end
		if var2012 == protoModule.wireTypes.lengthDelimited then
			if var2016 == 1 then
				local _ = nil
				local var2019, var2020 = protoModule.readBuffer(p96, var2011)
				var2011 = var2020
				var2010.title = buffer.tostring(var2019)
			elseif var2016 == 2 then
				local _ = nil
				local var2021, var2022 = protoModule.readBuffer(p96, var2011)
				var2011 = var2022
				var2010.dismiss_text = buffer.tostring(var2021)
			elseif var2016 == 3 then
				local _ = nil
				local var2023, var2024 = protoModule.readBuffer(p96, var2011)
				var2011 = var2024
				var2010.user_id = buffer.tostring(var2023)
			elseif var2016 == 4 then
				local _ = nil
				local var2025, var2026 = protoModule.readBuffer(p96, var2011)
				var2011 = var2026
				table.insert(var2010.cards, t.CardContainerCardInputData.decode(var2025))
			elseif var2016 == 5 then
				local _ = nil
				local var2027, var2028 = protoModule.readBuffer(p96, var2011)
				var2011 = var2028
				var2010.prompt_id = buffer.tostring(var2027)
			elseif var2016 == 6 then
				local _ = nil
				local var2029, var2030 = protoModule.readBuffer(p96, var2011)
				var2011 = var2030
				var2010.prompt_type = buffer.tostring(var2029)
			else
				local _ = nil
				local var2031, var2032 = protoModule.readVarInt(p96, var2011)
				var2011 = var2032 + var2031
			end
		elseif var2012 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2033, var2034 = protoModule.readFixed32(p96, var2011)
			local _ = var2033
			var2011 = var2034
		elseif var2012 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2035, var2036 = protoModule.readFixed64(p96, var2011)
			local _ = var2035
			var2011 = var2036
		else
			error("Unsupported wire type: " .. var2012)
		end
	end
	return var2010
end

function t_49:jsonEncode() --[[ line: 12288 ]]
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
	return t
end

function t_49:jsonDecode() --[[ line: 12322 ]]
	-- upvalues: t_49 (ref), t (ref)
	local var2039 = t_49.new()
	
	if self.title ~= nil then
		var2039.title = self.title
	end
	if self.dismiss_text ~= nil then
		var2039.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var2039.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var2039.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2039.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var2039.cards = t_1
	end
	if self.prompt_id ~= nil then
		var2039.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2039.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2039.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2039.prompt_type = self.promptType
	end
	return var2039
end

t_49.descriptor = {
	name = "CardContainerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
}
t.CardContainerInputData = t_49
typeRegistryModule.default:register(t.CardContainerInputData)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p97) --[[ line: 12387 ]]
	-- upvalues: t_50 (ref)
	return setmetatable({
		title = if p97 == nil or p97.title == nil then "" else p97.title,
		user_id = if p97 == nil or p97.user_id == nil then "" else p97.user_id,
		description = if p97 == nil or p97.description == nil then "" else p97.description,
		cta_text = if p97 == nil or p97.cta_text == nil then "" else p97.cta_text,
		prompt_id = if p97 == nil or p97.prompt_id == nil then "" else p97.prompt_id,
		prompt_type = if p97 == nil or p97.prompt_type == nil then "" else p97.prompt_type
	}, t_50)
end

function t_50:encode() --[[ line: 12398 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2042 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2043, var2044 = protoModule.writeTag(buff, var2042, 1, protoModule.wireTypes.lengthDelimited)
		var2043, var2044 = protoModule.writeString(var2043, var2044, self.title)
		buff = var2043
		var2042 = var2044
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2045, var2046 = protoModule.writeTag(buff, var2042, 2, protoModule.wireTypes.lengthDelimited)
		var2045, var2046 = protoModule.writeString(var2045, var2046, self.user_id)
		buff = var2045
		var2042 = var2046
	end
	if self.description ~= nil and self.description ~= "" then
		local var2047, var2048 = protoModule.writeTag(buff, var2042, 3, protoModule.wireTypes.lengthDelimited)
		var2047, var2048 = protoModule.writeString(var2047, var2048, self.description)
		buff = var2047
		var2042 = var2048
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var2049, var2050 = protoModule.writeTag(buff, var2042, 4, protoModule.wireTypes.lengthDelimited)
		var2049, var2050 = protoModule.writeString(var2049, var2050, self.cta_text)
		buff = var2049
		var2042 = var2050
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2051, var2052 = protoModule.writeTag(buff, var2042, 5, protoModule.wireTypes.lengthDelimited)
		var2051, var2052 = protoModule.writeString(var2051, var2052, self.prompt_id)
		buff = var2051
		var2042 = var2052
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2053, var2054 = protoModule.writeTag(buff, var2042, 6, protoModule.wireTypes.lengthDelimited)
		var2053, var2054 = protoModule.writeString(var2053, var2054, self.prompt_type)
		buff = var2053
		var2042 = var2054
	end
	local buff_1 = buffer.create(var2042)
	buffer.copy(buff_1, 0, buff, 0, var2042)
	
	return buff_1
end

function t_50.decode(p98) --[[ line: 12437 ]]
	-- upvalues: t_50 (ref), protoModule (ref)
	local var2056 = t_50.new()
	local var2057 = 0
	while var2057 < buffer.len(p98) do
		local _ = nil
		local var2058 = nil
		local var2059, var2060, var2061 = protoModule.readTag(p98, var2057)
		local var2062 = var2059
		var2058 = var2060
		var2057 = var2061
		
		if var2058 == protoModule.wireTypes.varint then
			local _ = nil
			local var2063, var2064 = protoModule.readVarInt(p98, var2057)
			local _ = var2063
			var2057 = var2064
			continue
		end
		if var2058 == protoModule.wireTypes.lengthDelimited then
			if var2062 == 1 then
				local _ = nil
				local var2065, var2066 = protoModule.readBuffer(p98, var2057)
				var2057 = var2066
				var2056.title = buffer.tostring(var2065)
			elseif var2062 == 2 then
				local _ = nil
				local var2067, var2068 = protoModule.readBuffer(p98, var2057)
				var2057 = var2068
				var2056.user_id = buffer.tostring(var2067)
			elseif var2062 == 3 then
				local _ = nil
				local var2069, var2070 = protoModule.readBuffer(p98, var2057)
				var2057 = var2070
				var2056.description = buffer.tostring(var2069)
			elseif var2062 == 4 then
				local _ = nil
				local var2071, var2072 = protoModule.readBuffer(p98, var2057)
				var2057 = var2072
				var2056.cta_text = buffer.tostring(var2071)
			elseif var2062 == 5 then
				local _ = nil
				local var2073, var2074 = protoModule.readBuffer(p98, var2057)
				var2057 = var2074
				var2056.prompt_id = buffer.tostring(var2073)
			elseif var2062 == 6 then
				local _ = nil
				local var2075, var2076 = protoModule.readBuffer(p98, var2057)
				var2057 = var2076
				var2056.prompt_type = buffer.tostring(var2075)
			else
				local _ = nil
				local var2077, var2078 = protoModule.readVarInt(p98, var2057)
				var2057 = var2078 + var2077
			end
		elseif var2058 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2079, var2080 = protoModule.readFixed32(p98, var2057)
			local _ = var2079
			var2057 = var2080
		elseif var2058 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2081, var2082 = protoModule.readFixed64(p98, var2057)
			local _ = var2081
			var2057 = var2082
		else
			error("Unsupported wire type: " .. var2058)
		end
	end
	return var2056
end

function t_50:jsonEncode() --[[ line: 12505 ]]
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
	return t
end

function t_50:jsonDecode() --[[ line: 12535 ]]
	-- upvalues: t_50 (ref)
	local var2084 = t_50.new()
	
	if self.title ~= nil then
		var2084.title = self.title
	end
	if self.user_id ~= nil then
		var2084.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2084.user_id = self.userId
	end
	if self.description ~= nil then
		var2084.description = self.description
	end
	if self.cta_text ~= nil then
		var2084.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var2084.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var2084.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2084.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2084.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2084.prompt_type = self.promptType
	end
	return var2084
end

t_50.descriptor = {
	name = "CardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
}
t.CardInputData = t_50
typeRegistryModule.default:register(t.CardInputData)
local t_51 = {}
t_51.__index = t_51

function t_51.new(p99) --[[ line: 12595 ]]
	-- upvalues: t_51 (ref)
	return setmetatable({
		prompt_id = if p99 == nil or p99.prompt_id == nil then "" else p99.prompt_id,
		prompt_type = if p99 == nil or p99.prompt_type == nil then "" else p99.prompt_type,
		user_id = if p99 == nil or p99.user_id == nil then "" else p99.user_id,
		audit_data = if p99 == nil or p99.audit_data == nil then "" else p99.audit_data
	}, t_51)
end

function t_51:encode() --[[ line: 12604 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2086 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2087, var2088 = protoModule.writeTag(buff, var2086, 1, protoModule.wireTypes.lengthDelimited)
		var2087, var2088 = protoModule.writeString(var2087, var2088, self.prompt_id)
		buff = var2087
		var2086 = var2088
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2089, var2090 = protoModule.writeTag(buff, var2086, 2, protoModule.wireTypes.lengthDelimited)
		var2089, var2090 = protoModule.writeString(var2089, var2090, self.prompt_type)
		buff = var2089
		var2086 = var2090
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2091, var2092 = protoModule.writeTag(buff, var2086, 3, protoModule.wireTypes.lengthDelimited)
		var2091, var2092 = protoModule.writeString(var2091, var2092, self.user_id)
		buff = var2091
		var2086 = var2092
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var2093, var2094 = protoModule.writeTag(buff, var2086, 4, protoModule.wireTypes.lengthDelimited)
		var2093, var2094 = protoModule.writeString(var2093, var2094, self.audit_data)
		buff = var2093
		var2086 = var2094
	end
	local buff_1 = buffer.create(var2086)
	buffer.copy(buff_1, 0, buff, 0, var2086)
	
	return buff_1
end

function t_51.decode(p100) --[[ line: 12633 ]]
	-- upvalues: t_51 (ref), protoModule (ref)
	local var2096 = t_51.new()
	local var2097 = 0
	while var2097 < buffer.len(p100) do
		local _ = nil
		local var2098 = nil
		local var2099, var2100, var2101 = protoModule.readTag(p100, var2097)
		local var2102 = var2099
		var2098 = var2100
		var2097 = var2101
		
		if var2098 == protoModule.wireTypes.varint then
			local _ = nil
			local var2103, var2104 = protoModule.readVarInt(p100, var2097)
			local _ = var2103
			var2097 = var2104
			continue
		end
		if var2098 == protoModule.wireTypes.lengthDelimited then
			if var2102 == 1 then
				local _ = nil
				local var2105, var2106 = protoModule.readBuffer(p100, var2097)
				var2097 = var2106
				var2096.prompt_id = buffer.tostring(var2105)
			elseif var2102 == 2 then
				local _ = nil
				local var2107, var2108 = protoModule.readBuffer(p100, var2097)
				var2097 = var2108
				var2096.prompt_type = buffer.tostring(var2107)
			elseif var2102 == 3 then
				local _ = nil
				local var2109, var2110 = protoModule.readBuffer(p100, var2097)
				var2097 = var2110
				var2096.user_id = buffer.tostring(var2109)
			elseif var2102 == 4 then
				local _ = nil
				local var2111, var2112 = protoModule.readBuffer(p100, var2097)
				var2097 = var2112
				var2096.audit_data = buffer.tostring(var2111)
			else
				local _ = nil
				local var2113, var2114 = protoModule.readVarInt(p100, var2097)
				var2097 = var2114 + var2113
			end
		elseif var2098 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2115, var2116 = protoModule.readFixed32(p100, var2097)
			local _ = var2115
			var2097 = var2116
		elseif var2098 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2117, var2118 = protoModule.readFixed64(p100, var2097)
			local _ = var2117
			var2097 = var2118
		else
			error("Unsupported wire type: " .. var2098)
		end
	end
	return var2096
end

function t_51:jsonEncode() --[[ line: 12691 ]]
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

function t_51:jsonDecode() --[[ line: 12713 ]]
	-- upvalues: t_51 (ref)
	local var2120 = t_51.new()
	
	if self.prompt_id ~= nil then
		var2120.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2120.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2120.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2120.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var2120.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2120.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var2120.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var2120.audit_data = self.auditData
	end
	return var2120
end

t_51.descriptor = {
	name = "DialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
}
t.DialogInputData = t_51
typeRegistryModule.default:register(t.DialogInputData)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p101) --[[ line: 12765 ]]
	-- upvalues: t_52 (ref)
	return setmetatable({
		title = if p101 == nil or p101.title == nil then "" else p101.title,
		description = if p101 == nil or p101.description == nil then "" else p101.description,
		primary_text = if p101 == nil or p101.primary_text == nil then "" else p101.primary_text,
		secondary_text = if p101 == nil or p101.secondary_text == nil then "" else p101.secondary_text,
		prompt_id = if p101 == nil or p101.prompt_id == nil then "" else p101.prompt_id,
		prompt_type = if p101 == nil or p101.prompt_type == nil then "" else p101.prompt_type,
		times_seen = if p101 == nil or p101.times_seen == nil then 0 else p101.times_seen
	}, t_52)
end

function t_52:encode() --[[ line: 12777 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2122 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2123, var2124 = protoModule.writeTag(buff, var2122, 1, protoModule.wireTypes.lengthDelimited)
		var2123, var2124 = protoModule.writeString(var2123, var2124, self.title)
		buff = var2123
		var2122 = var2124
	end
	if self.description ~= nil and self.description ~= "" then
		local var2125, var2126 = protoModule.writeTag(buff, var2122, 2, protoModule.wireTypes.lengthDelimited)
		var2125, var2126 = protoModule.writeString(var2125, var2126, self.description)
		buff = var2125
		var2122 = var2126
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var2127, var2128 = protoModule.writeTag(buff, var2122, 3, protoModule.wireTypes.lengthDelimited)
		var2127, var2128 = protoModule.writeString(var2127, var2128, self.primary_text)
		buff = var2127
		var2122 = var2128
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var2129, var2130 = protoModule.writeTag(buff, var2122, 4, protoModule.wireTypes.lengthDelimited)
		var2129, var2130 = protoModule.writeString(var2129, var2130, self.secondary_text)
		buff = var2129
		var2122 = var2130
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2131, var2132 = protoModule.writeTag(buff, var2122, 5, protoModule.wireTypes.lengthDelimited)
		var2131, var2132 = protoModule.writeString(var2131, var2132, self.prompt_id)
		buff = var2131
		var2122 = var2132
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2133, var2134 = protoModule.writeTag(buff, var2122, 6, protoModule.wireTypes.lengthDelimited)
		var2133, var2134 = protoModule.writeString(var2133, var2134, self.prompt_type)
		buff = var2133
		var2122 = var2134
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var2135, var2136 = protoModule.writeTag(buff, var2122, 7, protoModule.wireTypes.varint)
		var2135, var2136 = protoModule.writeVarInt(var2135, var2136, self.times_seen)
		buff = var2135
		var2122 = var2136
	end
	local buff_1 = buffer.create(var2122)
	buffer.copy(buff_1, 0, buff, 0, var2122)
	
	return buff_1
end

function t_52.decode(p102) --[[ line: 12821 ]]
	-- upvalues: t_52 (ref), protoModule (ref)
	local var2138 = t_52.new()
	local var2139 = 0
	while var2139 < buffer.len(p102) do
		local _ = nil
		local var2140 = nil
		local var2141, var2142, var2143 = protoModule.readTag(p102, var2139)
		local var2144 = var2141
		var2140 = var2142
		var2139 = var2143
		
		if var2140 == protoModule.wireTypes.varint then
			if var2144 == 7 then
				local _ = nil
				local var2145, var2146 = protoModule.readVarIntI32(p102, var2139)
				var2139 = var2146
				var2138.times_seen = var2145
			else
				local _ = nil
				local var2147, var2148 = protoModule.readVarInt(p102, var2139)
				local _ = var2147
				var2139 = var2148
			end
		end
		if var2140 == protoModule.wireTypes.lengthDelimited then
			if var2144 == 1 then
				local _ = nil
				local var2149, var2150 = protoModule.readBuffer(p102, var2139)
				var2139 = var2150
				var2138.title = buffer.tostring(var2149)
			elseif var2144 == 2 then
				local _ = nil
				local var2151, var2152 = protoModule.readBuffer(p102, var2139)
				var2139 = var2152
				var2138.description = buffer.tostring(var2151)
			elseif var2144 == 3 then
				local _ = nil
				local var2153, var2154 = protoModule.readBuffer(p102, var2139)
				var2139 = var2154
				var2138.primary_text = buffer.tostring(var2153)
			elseif var2144 == 4 then
				local _ = nil
				local var2155, var2156 = protoModule.readBuffer(p102, var2139)
				var2139 = var2156
				var2138.secondary_text = buffer.tostring(var2155)
			elseif var2144 == 5 then
				local _ = nil
				local var2157, var2158 = protoModule.readBuffer(p102, var2139)
				var2139 = var2158
				var2138.prompt_id = buffer.tostring(var2157)
			elseif var2144 == 6 then
				local _ = nil
				local var2159, var2160 = protoModule.readBuffer(p102, var2139)
				var2139 = var2160
				var2138.prompt_type = buffer.tostring(var2159)
			else
				local _ = nil
				local var2161, var2162 = protoModule.readVarInt(p102, var2139)
				var2139 = var2162 + var2161
			end
		elseif var2140 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2163, var2164 = protoModule.readFixed32(p102, var2139)
			local _ = var2163
			var2139 = var2164
		elseif var2140 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2165, var2166 = protoModule.readFixed64(p102, var2139)
			local _ = var2165
			var2139 = var2166
		else
			error("Unsupported wire type: " .. var2140)
		end
	end
	return var2138
end

function t_52:jsonEncode() --[[ line: 12894 ]]
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
	return t
end

function t_52:jsonDecode() --[[ line: 12928 ]]
	-- upvalues: t_52 (ref)
	local var2168 = t_52.new()
	
	if self.title ~= nil then
		var2168.title = self.title
	end
	if self.description ~= nil then
		var2168.description = self.description
	end
	if self.primary_text ~= nil then
		var2168.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var2168.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var2168.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var2168.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var2168.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2168.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2168.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2168.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var2168.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var2168.times_seen = self.timesSeen
	end
	return var2168
end

t_52.descriptor = {
	name = "BannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
}
t.BannerInputData = t_52
typeRegistryModule.default:register(t.BannerInputData)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p103) --[[ line: 12996 ]]
	-- upvalues: t_53 (ref)
	return setmetatable({
		tooltip_text = if p103 == nil or p103.tooltip_text == nil then "" else p103.tooltip_text,
		prompt_id = if p103 == nil or p103.prompt_id == nil then "" else p103.prompt_id,
		prompt_type = if p103 == nil or p103.prompt_type == nil then "" else p103.prompt_type
	}, t_53)
end

function t_53:encode() --[[ line: 13004 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2170 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var2171, var2172 = protoModule.writeTag(buff, var2170, 1, protoModule.wireTypes.lengthDelimited)
		var2171, var2172 = protoModule.writeString(var2171, var2172, self.tooltip_text)
		buff = var2171
		var2170 = var2172
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2173, var2174 = protoModule.writeTag(buff, var2170, 2, protoModule.wireTypes.lengthDelimited)
		var2173, var2174 = protoModule.writeString(var2173, var2174, self.prompt_id)
		buff = var2173
		var2170 = var2174
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2175, var2176 = protoModule.writeTag(buff, var2170, 3, protoModule.wireTypes.lengthDelimited)
		var2175, var2176 = protoModule.writeString(var2175, var2176, self.prompt_type)
		buff = var2175
		var2170 = var2176
	end
	local buff_1 = buffer.create(var2170)
	buffer.copy(buff_1, 0, buff, 0, var2170)
	
	return buff_1
end

function t_53.decode(p104) --[[ line: 13028 ]]
	-- upvalues: t_53 (ref), protoModule (ref)
	local var2178 = t_53.new()
	local var2179 = 0
	while var2179 < buffer.len(p104) do
		local _ = nil
		local var2180 = nil
		local var2181, var2182, var2183 = protoModule.readTag(p104, var2179)
		local var2184 = var2181
		var2180 = var2182
		var2179 = var2183
		
		if var2180 == protoModule.wireTypes.varint then
			local _ = nil
			local var2185, var2186 = protoModule.readVarInt(p104, var2179)
			local _ = var2185
			var2179 = var2186
			continue
		end
		if var2180 == protoModule.wireTypes.lengthDelimited then
			if var2184 == 1 then
				local _ = nil
				local var2187, var2188 = protoModule.readBuffer(p104, var2179)
				var2179 = var2188
				var2178.tooltip_text = buffer.tostring(var2187)
			elseif var2184 == 2 then
				local _ = nil
				local var2189, var2190 = protoModule.readBuffer(p104, var2179)
				var2179 = var2190
				var2178.prompt_id = buffer.tostring(var2189)
			elseif var2184 == 3 then
				local _ = nil
				local var2191, var2192 = protoModule.readBuffer(p104, var2179)
				var2179 = var2192
				var2178.prompt_type = buffer.tostring(var2191)
			else
				local _ = nil
				local var2193, var2194 = protoModule.readVarInt(p104, var2179)
				var2179 = var2194 + var2193
			end
		elseif var2180 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2195, var2196 = protoModule.readFixed32(p104, var2179)
			local _ = var2195
			var2179 = var2196
		elseif var2180 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2197, var2198 = protoModule.readFixed64(p104, var2179)
			local _ = var2197
			var2179 = var2198
		else
			error("Unsupported wire type: " .. var2180)
		end
	end
	return var2178
end

function t_53:jsonEncode() --[[ line: 13081 ]]
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

function t_53:jsonDecode() --[[ line: 13099 ]]
	-- upvalues: t_53 (ref)
	local var2200 = t_53.new()
	
	if self.tooltip_text ~= nil then
		var2200.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var2200.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var2200.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2200.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2200.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2200.prompt_type = self.promptType
	end
	return var2200
end

t_53.descriptor = {
	name = "TooltipInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
}
t.TooltipInputData = t_53
typeRegistryModule.default:register(t.TooltipInputData)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p105) --[[ line: 13143 ]]
	-- upvalues: t_54 (ref)
	return setmetatable({
		media_id = if p105 == nil or p105.media_id == nil then "" else p105.media_id,
		title = if p105 == nil or p105.title == nil then "" else p105.title,
		description = if p105 == nil or p105.description == nil then "" else p105.description,
		prompt_id = if p105 == nil or p105.prompt_id == nil then "" else p105.prompt_id,
		prompt_type = if p105 == nil or p105.prompt_type == nil then "" else p105.prompt_type,
		anchor_tag = if p105 == nil or p105.anchor_tag == nil then "" else p105.anchor_tag
	}, t_54)
end

function t_54:encode() --[[ line: 13154 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2202 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var2203, var2204 = protoModule.writeTag(buff, var2202, 1, protoModule.wireTypes.lengthDelimited)
		var2203, var2204 = protoModule.writeString(var2203, var2204, self.media_id)
		buff = var2203
		var2202 = var2204
	end
	if self.title ~= nil and self.title ~= "" then
		local var2205, var2206 = protoModule.writeTag(buff, var2202, 2, protoModule.wireTypes.lengthDelimited)
		var2205, var2206 = protoModule.writeString(var2205, var2206, self.title)
		buff = var2205
		var2202 = var2206
	end
	if self.description ~= nil and self.description ~= "" then
		local var2207, var2208 = protoModule.writeTag(buff, var2202, 3, protoModule.wireTypes.lengthDelimited)
		var2207, var2208 = protoModule.writeString(var2207, var2208, self.description)
		buff = var2207
		var2202 = var2208
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2209, var2210 = protoModule.writeTag(buff, var2202, 4, protoModule.wireTypes.lengthDelimited)
		var2209, var2210 = protoModule.writeString(var2209, var2210, self.prompt_id)
		buff = var2209
		var2202 = var2210
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2211, var2212 = protoModule.writeTag(buff, var2202, 5, protoModule.wireTypes.lengthDelimited)
		var2211, var2212 = protoModule.writeString(var2211, var2212, self.prompt_type)
		buff = var2211
		var2202 = var2212
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var2213, var2214 = protoModule.writeTag(buff, var2202, 6, protoModule.wireTypes.lengthDelimited)
		var2213, var2214 = protoModule.writeString(var2213, var2214, self.anchor_tag)
		buff = var2213
		var2202 = var2214
	end
	local buff_1 = buffer.create(var2202)
	buffer.copy(buff_1, 0, buff, 0, var2202)
	
	return buff_1
end

function t_54.decode(p106) --[[ line: 13193 ]]
	-- upvalues: t_54 (ref), protoModule (ref)
	local var2216 = t_54.new()
	local var2217 = 0
	while var2217 < buffer.len(p106) do
		local _ = nil
		local var2218 = nil
		local var2219, var2220, var2221 = protoModule.readTag(p106, var2217)
		local var2222 = var2219
		var2218 = var2220
		var2217 = var2221
		
		if var2218 == protoModule.wireTypes.varint then
			local _ = nil
			local var2223, var2224 = protoModule.readVarInt(p106, var2217)
			local _ = var2223
			var2217 = var2224
			continue
		end
		if var2218 == protoModule.wireTypes.lengthDelimited then
			if var2222 == 1 then
				local _ = nil
				local var2225, var2226 = protoModule.readBuffer(p106, var2217)
				var2217 = var2226
				var2216.media_id = buffer.tostring(var2225)
			elseif var2222 == 2 then
				local _ = nil
				local var2227, var2228 = protoModule.readBuffer(p106, var2217)
				var2217 = var2228
				var2216.title = buffer.tostring(var2227)
			elseif var2222 == 3 then
				local _ = nil
				local var2229, var2230 = protoModule.readBuffer(p106, var2217)
				var2217 = var2230
				var2216.description = buffer.tostring(var2229)
			elseif var2222 == 4 then
				local _ = nil
				local var2231, var2232 = protoModule.readBuffer(p106, var2217)
				var2217 = var2232
				var2216.prompt_id = buffer.tostring(var2231)
			elseif var2222 == 5 then
				local _ = nil
				local var2233, var2234 = protoModule.readBuffer(p106, var2217)
				var2217 = var2234
				var2216.prompt_type = buffer.tostring(var2233)
			elseif var2222 == 6 then
				local _ = nil
				local var2235, var2236 = protoModule.readBuffer(p106, var2217)
				var2217 = var2236
				var2216.anchor_tag = buffer.tostring(var2235)
			else
				local _ = nil
				local var2237, var2238 = protoModule.readVarInt(p106, var2217)
				var2217 = var2238 + var2237
			end
		elseif var2218 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2239, var2240 = protoModule.readFixed32(p106, var2217)
			local _ = var2239
			var2217 = var2240
		elseif var2218 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2241, var2242 = protoModule.readFixed64(p106, var2217)
			local _ = var2241
			var2217 = var2242
		else
			error("Unsupported wire type: " .. var2218)
		end
	end
	return var2216
end

function t_54:jsonEncode() --[[ line: 13261 ]]
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

function t_54:jsonDecode() --[[ line: 13291 ]]
	-- upvalues: t_54 (ref)
	local var2244 = t_54.new()
	
	if self.media_id ~= nil then
		var2244.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var2244.media_id = self.mediaId
	end
	if self.title ~= nil then
		var2244.title = self.title
	end
	if self.description ~= nil then
		var2244.description = self.description
	end
	if self.prompt_id ~= nil then
		var2244.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2244.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2244.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2244.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var2244.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var2244.anchor_tag = self.anchorTag
	end
	return var2244
end

t_54.descriptor = {
	name = "CoachmarkInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
}
t.CoachmarkInputData = t_54
typeRegistryModule.default:register(t.CoachmarkInputData)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p107) --[[ line: 13351 ]]
	-- upvalues: t_55 (ref)
	return setmetatable({
		prompt_id = if p107 == nil or p107.prompt_id == nil then "" else p107.prompt_id,
		prompt_type = if p107 == nil or p107.prompt_type == nil then "" else p107.prompt_type
	}, t_55)
end

function t_55:encode() --[[ line: 13358 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2246 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2247, var2248 = protoModule.writeTag(buff, var2246, 1, protoModule.wireTypes.lengthDelimited)
		var2247, var2248 = protoModule.writeString(var2247, var2248, self.prompt_id)
		buff = var2247
		var2246 = var2248
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2249, var2250 = protoModule.writeTag(buff, var2246, 2, protoModule.wireTypes.lengthDelimited)
		var2249, var2250 = protoModule.writeString(var2249, var2250, self.prompt_type)
		buff = var2249
		var2246 = var2250
	end
	local buff_1 = buffer.create(var2246)
	buffer.copy(buff_1, 0, buff, 0, var2246)
	
	return buff_1
end

function t_55.decode(p108) --[[ line: 13377 ]]
	-- upvalues: t_55 (ref), protoModule (ref)
	local var2252 = t_55.new()
	local var2253 = 0
	while var2253 < buffer.len(p108) do
		local _ = nil
		local var2254 = nil
		local var2255, var2256, var2257 = protoModule.readTag(p108, var2253)
		local var2258 = var2255
		var2254 = var2256
		var2253 = var2257
		
		if var2254 == protoModule.wireTypes.varint then
			local _ = nil
			local var2259, var2260 = protoModule.readVarInt(p108, var2253)
			local _ = var2259
			var2253 = var2260
			continue
		end
		if var2254 == protoModule.wireTypes.lengthDelimited then
			if var2258 == 1 then
				local _ = nil
				local var2261, var2262 = protoModule.readBuffer(p108, var2253)
				var2253 = var2262
				var2252.prompt_id = buffer.tostring(var2261)
			elseif var2258 == 2 then
				local _ = nil
				local var2263, var2264 = protoModule.readBuffer(p108, var2253)
				var2253 = var2264
				var2252.prompt_type = buffer.tostring(var2263)
			else
				local _ = nil
				local var2265, var2266 = protoModule.readVarInt(p108, var2253)
				var2253 = var2266 + var2265
			end
		elseif var2254 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2267, var2268 = protoModule.readFixed32(p108, var2253)
			local _ = var2267
			var2253 = var2268
		elseif var2254 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2269, var2270 = protoModule.readFixed64(p108, var2253)
			local _ = var2269
			var2253 = var2270
		else
			error("Unsupported wire type: " .. var2254)
		end
	end
	return var2252
end

function t_55:jsonEncode() --[[ line: 13425 ]]
	local t = {}
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function t_55:jsonDecode() --[[ line: 13439 ]]
	-- upvalues: t_55 (ref)
	local var2272 = t_55.new()
	
	if self.prompt_id ~= nil then
		var2272.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2272.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2272.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2272.prompt_type = self.promptType
	end
	return var2272
end

t_55.descriptor = {
	name = "SystemBannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SystemBannerInputData"
}
t.SystemBannerInputData = t_55
typeRegistryModule.default:register(t.SystemBannerInputData)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p109) --[[ line: 13475 ]]
	-- upvalues: t_56 (ref)
	return setmetatable({
		upsell_prompt = if p109 == nil or p109.upsell_prompt == nil then "" else p109.upsell_prompt
	}, t_56)
end

function t_56:encode() --[[ line: 13481 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2274 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var2275, var2276 = protoModule.writeTag(buff, var2274, 1, protoModule.wireTypes.lengthDelimited)
		var2275, var2276 = protoModule.writeString(var2275, var2276, self.upsell_prompt)
		buff = var2275
		var2274 = var2276
	end
	local buff_1 = buffer.create(var2274)
	buffer.copy(buff_1, 0, buff, 0, var2274)
	
	return buff_1
end

function t_56.decode(p110) --[[ line: 13495 ]]
	-- upvalues: t_56 (ref), protoModule (ref)
	local var2278 = t_56.new()
	local var2279 = 0
	while var2279 < buffer.len(p110) do
		local _ = nil
		local var2280 = nil
		local var2281, var2282, var2283 = protoModule.readTag(p110, var2279)
		local var2284 = var2281
		var2280 = var2282
		var2279 = var2283
		
		if var2280 == protoModule.wireTypes.varint then
			local _ = nil
			local var2285, var2286 = protoModule.readVarInt(p110, var2279)
			local _ = var2285
			var2279 = var2286
			continue
		end
		if var2280 == protoModule.wireTypes.lengthDelimited then
			if var2284 == 1 then
				local _ = nil
				local var2287, var2288 = protoModule.readBuffer(p110, var2279)
				var2279 = var2288
				var2278.upsell_prompt = buffer.tostring(var2287)
			else
				local _ = nil
				local var2289, var2290 = protoModule.readVarInt(p110, var2279)
				var2279 = var2290 + var2289
			end
		elseif var2280 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2291, var2292 = protoModule.readFixed32(p110, var2279)
			local _ = var2291
			var2279 = var2292
		elseif var2280 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2293, var2294 = protoModule.readFixed64(p110, var2279)
			local _ = var2293
			var2279 = var2294
		else
			error("Unsupported wire type: " .. var2280)
		end
	end
	return var2278
end

function t_56:jsonEncode() --[[ line: 13538 ]]
	local t = {}
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	return t
end

function t_56:jsonDecode() --[[ line: 13548 ]]
	-- upvalues: t_56 (ref)
	local var2296 = t_56.new()
	
	if self.upsell_prompt ~= nil then
		var2296.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var2296.upsell_prompt = self.upsellPrompt
	end
	return var2296
end

t_56.descriptor = {
	name = "AgeCheckUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeCheckUpsellInputData"
}
t.AgeCheckUpsellInputData = t_56
typeRegistryModule.default:register(t.AgeCheckUpsellInputData)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p111) --[[ line: 13576 ]]
	-- upvalues: t_57 (ref)
	return setmetatable({
		modal_variant = if p111 == nil or p111.modal_variant == nil then "" else p111.modal_variant,
		modal_sequence = if p111 == nil or p111.modal_sequence == nil then "" else p111.modal_sequence,
		conversation_id = if p111 == nil or p111.conversation_id == nil then "" else p111.conversation_id,
		friend_id = if p111 == nil or p111.friend_id == nil then "" else p111.friend_id
	}, t_57)
end

function t_57:encode() --[[ line: 13587 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2298 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var2299, var2300 = protoModule.writeTag(buff, var2298, 1, protoModule.wireTypes.lengthDelimited)
		var2299, var2300 = protoModule.writeString(var2299, var2300, self.modal_variant)
		buff = var2299
		var2298 = var2300
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var2301, var2302 = protoModule.writeTag(buff, var2298, 2, protoModule.wireTypes.lengthDelimited)
		var2301, var2302 = protoModule.writeString(var2301, var2302, self.modal_sequence)
		buff = var2301
		var2298 = var2302
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var2303, var2304 = protoModule.writeTag(buff, var2298, 3, protoModule.wireTypes.lengthDelimited)
		var2303, var2304 = protoModule.writeString(var2303, var2304, self.conversation_id)
		buff = var2303
		var2298 = var2304
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var2305, var2306 = protoModule.writeTag(buff, var2298, 4, protoModule.wireTypes.lengthDelimited)
		var2305, var2306 = protoModule.writeString(var2305, var2306, self.friend_id)
		buff = var2305
		var2298 = var2306
	end
	local buff_1 = buffer.create(var2298)
	buffer.copy(buff_1, 0, buff, 0, var2298)
	
	return buff_1
end

function t_57.decode(p112) --[[ line: 13616 ]]
	-- upvalues: t_57 (ref), protoModule (ref)
	local var2308 = t_57.new()
	local var2309 = 0
	while var2309 < buffer.len(p112) do
		local _ = nil
		local var2310 = nil
		local var2311, var2312, var2313 = protoModule.readTag(p112, var2309)
		local var2314 = var2311
		var2310 = var2312
		var2309 = var2313
		
		if var2310 == protoModule.wireTypes.varint then
			local _ = nil
			local var2315, var2316 = protoModule.readVarInt(p112, var2309)
			local _ = var2315
			var2309 = var2316
			continue
		end
		if var2310 == protoModule.wireTypes.lengthDelimited then
			if var2314 == 1 then
				local _ = nil
				local var2317, var2318 = protoModule.readBuffer(p112, var2309)
				var2309 = var2318
				var2308.modal_variant = buffer.tostring(var2317)
			elseif var2314 == 2 then
				local _ = nil
				local var2319, var2320 = protoModule.readBuffer(p112, var2309)
				var2309 = var2320
				var2308.modal_sequence = buffer.tostring(var2319)
			elseif var2314 == 3 then
				local _ = nil
				local var2321, var2322 = protoModule.readBuffer(p112, var2309)
				var2309 = var2322
				var2308.conversation_id = buffer.tostring(var2321)
			elseif var2314 == 4 then
				local _ = nil
				local var2323, var2324 = protoModule.readBuffer(p112, var2309)
				var2309 = var2324
				var2308.friend_id = buffer.tostring(var2323)
			else
				local _ = nil
				local var2325, var2326 = protoModule.readVarInt(p112, var2309)
				var2309 = var2326 + var2325
			end
		elseif var2310 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2327, var2328 = protoModule.readFixed32(p112, var2309)
			local _ = var2327
			var2309 = var2328
		elseif var2310 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2329, var2330 = protoModule.readFixed64(p112, var2309)
			local _ = var2329
			var2309 = var2330
		else
			error("Unsupported wire type: " .. var2310)
		end
	end
	return var2308
end

function t_57:jsonEncode() --[[ line: 13674 ]]
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

function t_57:jsonDecode() --[[ line: 13696 ]]
	-- upvalues: t_57 (ref)
	local var2332 = t_57.new()
	
	if self.modal_variant ~= nil then
		var2332.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var2332.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var2332.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var2332.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var2332.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var2332.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var2332.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var2332.friend_id = self.friendId
	end
	return var2332
end

t_57.descriptor = {
	name = "PartyChatConversationUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PartyChatConversationUpsellInputData"
}
t.PartyChatConversationUpsellInputData = t_57
typeRegistryModule.default:register(t.PartyChatConversationUpsellInputData)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p113) --[[ line: 13750 ]]
	-- upvalues: t_58 (ref)
	return setmetatable({
		event_id = if p113 == nil or p113.event_id == nil then "" else p113.event_id,
		universe_id = if p113 == nil or p113.universe_id == nil then "" else p113.universe_id,
		entry_map = if p113 == nil or p113.entry_map == nil then {} else p113.entry_map,
		entry_order = if p113 == nil or p113.entry_order == nil then {} else p113.entry_order
	}, t_58)
end

function t_58:encode() --[[ line: 13761 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2334 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2335, var2336 = protoModule.writeTag(buff, var2334, 1, protoModule.wireTypes.lengthDelimited)
		var2335, var2336 = protoModule.writeString(var2335, var2336, self.event_id)
		buff = var2335
		var2334 = var2336
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2337, var2338 = protoModule.writeTag(buff, var2334, 2, protoModule.wireTypes.lengthDelimited)
		var2337, var2338 = protoModule.writeString(var2337, var2338, self.universe_id)
		buff = var2337
		var2334 = var2338
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2339, var2340 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2339, var2340 = protoModule.writeString(var2339, var2340, i)
			local var2341 = v:encode()
			var2340, var2342 = protoModule.writeTag(var2339, var2340, 2, protoModule.wireTypes.lengthDelimited)
			var2340, var2342 = protoModule.writeBuffer(var2340, var2342, var2341, buffer.len(var2341))
			local var2343 = var2340
			local var2344 = var2342
			local var2345, var2346 = protoModule.writeTag(buff, var2334, 3, protoModule.wireTypes.lengthDelimited)
			var2345, var2346 = protoModule.writeBuffer(var2345, var2346, var2343, var2344)
			buff = var2345
			var2334 = var2346
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2347, var2348 = protoModule.writeTag(buff, var2334, 4, protoModule.wireTypes.lengthDelimited)
			var2347, var2348 = protoModule.writeString(var2347, var2348, v)
			buff = var2347
			var2334 = var2348
		end
	end
	local buff_1 = buffer.create(var2334)
	buffer.copy(buff_1, 0, buff, 0, var2334)
	
	return buff_1
end

function t_58.decode(p114) --[[ line: 13801 ]]
	-- upvalues: t_58 (ref), protoModule (ref), t (ref)
	local var2350 = t_58.new()
	local var2351 = 0
	while var2351 < buffer.len(p114) do
		local _ = nil
		local var2352 = nil
		local var2353, var2354, var2355 = protoModule.readTag(p114, var2351)
		local var2356 = var2353
		var2352 = var2354
		var2351 = var2355
		
		if var2352 == protoModule.wireTypes.varint then
			local _ = nil
			local var2357, var2358 = protoModule.readVarInt(p114, var2351)
			local _ = var2357
			var2351 = var2358
			continue
		end
		if var2352 == protoModule.wireTypes.lengthDelimited then
			if var2356 == 1 then
				local _ = nil
				local var2359, var2360 = protoModule.readBuffer(p114, var2351)
				var2351 = var2360
				var2350.event_id = buffer.tostring(var2359)
			elseif var2356 == 2 then
				local _ = nil
				local var2361, var2362 = protoModule.readBuffer(p114, var2351)
				var2351 = var2362
				var2350.universe_id = buffer.tostring(var2361)
			elseif var2356 == 3 then
				local _ = nil
				local var2363, var2364 = protoModule.readBuffer(p114, var2351)
				var2351 = var2364
				var2363 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var2363)
				var2350.entry_map[var2363.key or ""] = var2363.value or t.FeedEntry.new()
			elseif var2356 == 4 then
				local _ = nil
				local var2365, var2366 = protoModule.readBuffer(p114, var2351)
				var2351 = var2366
				table.insert(var2350.entry_order, buffer.tostring(var2365))
			else
				local _ = nil
				local var2367, var2368 = protoModule.readVarInt(p114, var2351)
				var2351 = var2368 + var2367
			end
		elseif var2352 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2369, var2370 = protoModule.readFixed32(p114, var2351)
			local _ = var2369
			var2351 = var2370
		elseif var2352 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2371, var2372 = protoModule.readFixed64(p114, var2351)
			local _ = var2371
			var2351 = var2372
		else
			error("Unsupported wire type: " .. var2352)
		end
	end
	return var2350
end

function t_58:jsonEncode() --[[ line: 13866 ]]
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

function t_58:jsonDecode() --[[ line: 13896 ]]
	-- upvalues: t_58 (ref), t (ref)
	local var2376 = t_58.new()
	
	if self.event_id ~= nil then
		var2376.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2376.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2376.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2376.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2376.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2376.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2376.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2376.entry_order = t_1
	end
	return var2376
end

t_58.descriptor = {
	name = "EventDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
}
t.EventDetailsFeedInputData = t_58
typeRegistryModule.default:register(t.EventDetailsFeedInputData)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p115) --[[ line: 13968 ]]
	-- upvalues: t_59 (ref)
	return setmetatable({
		key = if p115 == nil or p115.key == nil then "" else p115.key,
		value = if p115 == nil or p115.value == nil then nil else p115.value
	}, t_59)
end

function t_59:encode() --[[ line: 13977 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2382 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2383, var2384 = protoModule.writeTag(buff, var2382, 1, protoModule.wireTypes.lengthDelimited)
		var2383, var2384 = protoModule.writeString(var2383, var2384, self.key)
		buff = var2383
		var2382 = var2384
	end
	if self.value ~= nil then
		local var2385 = self.value:encode()
		local var2386, var2387 = protoModule.writeTag(buff, var2382, 2, protoModule.wireTypes.lengthDelimited)
		var2386, var2387 = protoModule.writeBuffer(var2386, var2387, var2385, buffer.len(var2385))
		buff = var2386
		var2382 = var2387
	end
	local buff_1 = buffer.create(var2382)
	buffer.copy(buff_1, 0, buff, 0, var2382)
	
	return buff_1
end

function t_59.decode(p116) --[[ line: 13997 ]]
	-- upvalues: t_59 (ref), protoModule (ref), t (ref)
	local var2389 = t_59.new()
	local var2390 = 0
	while var2390 < buffer.len(p116) do
		local _ = nil
		local var2391 = nil
		local var2392, var2393, var2394 = protoModule.readTag(p116, var2390)
		local var2395 = var2392
		var2391 = var2393
		var2390 = var2394
		
		if var2391 == protoModule.wireTypes.varint then
			local _ = nil
			local var2396, var2397 = protoModule.readVarInt(p116, var2390)
			local _ = var2396
			var2390 = var2397
			continue
		end
		if var2391 == protoModule.wireTypes.lengthDelimited then
			if var2395 == 1 then
				local _ = nil
				local var2398, var2399 = protoModule.readBuffer(p116, var2390)
				var2390 = var2399
				var2389.key = buffer.tostring(var2398)
			elseif var2395 == 2 then
				local _ = nil
				local var2400, var2401 = protoModule.readBuffer(p116, var2390)
				var2390 = var2401
				var2389.value = t.FeedEntry.decode(var2400)
			else
				local _ = nil
				local var2402, var2403 = protoModule.readVarInt(p116, var2390)
				var2390 = var2403 + var2402
			end
		elseif var2391 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2404, var2405 = protoModule.readFixed32(p116, var2390)
			local _ = var2404
			var2390 = var2405
		elseif var2391 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2406, var2407 = protoModule.readFixed64(p116, var2390)
			local _ = var2406
			var2390 = var2407
		else
			error("Unsupported wire type: " .. var2391)
		end
	end
	return var2389
end

function t_59:jsonEncode() --[[ line: 14045 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_59:jsonDecode() --[[ line: 14059 ]]
	-- upvalues: t_59 (ref), t (ref)
	local var2409 = t_59.new()
	
	if self.key ~= nil then
		var2409.key = self.key
	end
	if self.value ~= nil then
		var2409.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2409
end

t_59.descriptor = {
	name = "EventDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.EventDetailsFeedInputData_EntryMapEntry = t_59
typeRegistryModule.default:register(t.EventDetailsFeedInputData_EntryMapEntry)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p117) --[[ line: 14089 ]]
	-- upvalues: t_60 (ref)
	return setmetatable({
		event_id = if p117 == nil or p117.event_id == nil then "" else p117.event_id,
		universe_id = if p117 == nil or p117.universe_id == nil then "" else p117.universe_id
	}, t_60)
end

function t_60:encode() --[[ line: 14098 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2411 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2412, var2413 = protoModule.writeTag(buff, var2411, 1, protoModule.wireTypes.lengthDelimited)
		var2412, var2413 = protoModule.writeString(var2412, var2413, self.event_id)
		buff = var2412
		var2411 = var2413
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2414, var2415 = protoModule.writeTag(buff, var2411, 2, protoModule.wireTypes.lengthDelimited)
		var2414, var2415 = protoModule.writeString(var2414, var2415, self.universe_id)
		buff = var2414
		var2411 = var2415
	end
	local buff_1 = buffer.create(var2411)
	buffer.copy(buff_1, 0, buff, 0, var2411)
	
	return buff_1
end

function t_60.decode(p118) --[[ line: 14117 ]]
	-- upvalues: t_60 (ref), protoModule (ref)
	local var2417 = t_60.new()
	local var2418 = 0
	while var2418 < buffer.len(p118) do
		local _ = nil
		local var2419 = nil
		local var2420, var2421, var2422 = protoModule.readTag(p118, var2418)
		local var2423 = var2420
		var2419 = var2421
		var2418 = var2422
		
		if var2419 == protoModule.wireTypes.varint then
			local _ = nil
			local var2424, var2425 = protoModule.readVarInt(p118, var2418)
			local _ = var2424
			var2418 = var2425
			continue
		end
		if var2419 == protoModule.wireTypes.lengthDelimited then
			if var2423 == 1 then
				local _ = nil
				local var2426, var2427 = protoModule.readBuffer(p118, var2418)
				var2418 = var2427
				var2417.event_id = buffer.tostring(var2426)
			elseif var2423 == 2 then
				local _ = nil
				local var2428, var2429 = protoModule.readBuffer(p118, var2418)
				var2418 = var2429
				var2417.universe_id = buffer.tostring(var2428)
			else
				local _ = nil
				local var2430, var2431 = protoModule.readVarInt(p118, var2418)
				var2418 = var2431 + var2430
			end
		elseif var2419 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2432, var2433 = protoModule.readFixed32(p118, var2418)
			local _ = var2432
			var2418 = var2433
		elseif var2419 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2434, var2435 = protoModule.readFixed64(p118, var2418)
			local _ = var2434
			var2418 = var2435
		else
			error("Unsupported wire type: " .. var2419)
		end
	end
	return var2417
end

function t_60:jsonEncode() --[[ line: 14165 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_60:jsonDecode() --[[ line: 14179 ]]
	-- upvalues: t_60 (ref)
	local var2437 = t_60.new()
	
	if self.event_id ~= nil then
		var2437.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2437.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2437.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2437.universe_id = self.universeId
	end
	return var2437
end

t_60.descriptor = {
	name = "EventDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
}
t.EventDetailsActionBarInputData = t_60
typeRegistryModule.default:register(t.EventDetailsActionBarInputData)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p119) --[[ line: 14215 ]]
	-- upvalues: t_61 (ref)
	return setmetatable({
		event_id = if p119 == nil or p119.event_id == nil then "" else p119.event_id
	}, t_61)
end

function t_61:encode() --[[ line: 14223 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2439 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2440, var2441 = protoModule.writeTag(buff, var2439, 1, protoModule.wireTypes.lengthDelimited)
		var2440, var2441 = protoModule.writeString(var2440, var2441, self.event_id)
		buff = var2440
		var2439 = var2441
	end
	local buff_1 = buffer.create(var2439)
	buffer.copy(buff_1, 0, buff, 0, var2439)
	
	return buff_1
end

function t_61.decode(p120) --[[ line: 14237 ]]
	-- upvalues: t_61 (ref), protoModule (ref)
	local var2443 = t_61.new()
	local var2444 = 0
	while var2444 < buffer.len(p120) do
		local _ = nil
		local var2445 = nil
		local var2446, var2447, var2448 = protoModule.readTag(p120, var2444)
		local var2449 = var2446
		var2445 = var2447
		var2444 = var2448
		
		if var2445 == protoModule.wireTypes.varint then
			local _ = nil
			local var2450, var2451 = protoModule.readVarInt(p120, var2444)
			local _ = var2450
			var2444 = var2451
			continue
		end
		if var2445 == protoModule.wireTypes.lengthDelimited then
			if var2449 == 1 then
				local _ = nil
				local var2452, var2453 = protoModule.readBuffer(p120, var2444)
				var2444 = var2453
				var2443.event_id = buffer.tostring(var2452)
			else
				local _ = nil
				local var2454, var2455 = protoModule.readVarInt(p120, var2444)
				var2444 = var2455 + var2454
			end
		elseif var2445 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2456, var2457 = protoModule.readFixed32(p120, var2444)
			local _ = var2456
			var2444 = var2457
		elseif var2445 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2458, var2459 = protoModule.readFixed64(p120, var2444)
			local _ = var2458
			var2444 = var2459
		else
			error("Unsupported wire type: " .. var2445)
		end
	end
	return var2443
end

function t_61:jsonEncode() --[[ line: 14280 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_61:jsonDecode() --[[ line: 14290 ]]
	-- upvalues: t_61 (ref)
	local var2461 = t_61.new()
	
	if self.event_id ~= nil then
		var2461.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2461.event_id = self.eventId
	end
	return var2461
end

t_61.descriptor = {
	name = "EventDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
}
t.EventDescriptionInputData = t_61
typeRegistryModule.default:register(t.EventDescriptionInputData)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p121) --[[ line: 14318 ]]
	-- upvalues: t_62 (ref)
	return setmetatable({
		event_id = if p121 == nil or p121.event_id == nil then "" else p121.event_id,
		universe_id = if p121 == nil or p121.universe_id == nil then "" else p121.universe_id
	}, t_62)
end

function t_62:encode() --[[ line: 14327 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2463 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2464, var2465 = protoModule.writeTag(buff, var2463, 1, protoModule.wireTypes.lengthDelimited)
		var2464, var2465 = protoModule.writeString(var2464, var2465, self.event_id)
		buff = var2464
		var2463 = var2465
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2466, var2467 = protoModule.writeTag(buff, var2463, 2, protoModule.wireTypes.lengthDelimited)
		var2466, var2467 = protoModule.writeString(var2466, var2467, self.universe_id)
		buff = var2466
		var2463 = var2467
	end
	local buff_1 = buffer.create(var2463)
	buffer.copy(buff_1, 0, buff, 0, var2463)
	
	return buff_1
end

function t_62.decode(p122) --[[ line: 14346 ]]
	-- upvalues: t_62 (ref), protoModule (ref)
	local var2469 = t_62.new()
	local var2470 = 0
	while var2470 < buffer.len(p122) do
		local _ = nil
		local var2471 = nil
		local var2472, var2473, var2474 = protoModule.readTag(p122, var2470)
		local var2475 = var2472
		var2471 = var2473
		var2470 = var2474
		
		if var2471 == protoModule.wireTypes.varint then
			local _ = nil
			local var2476, var2477 = protoModule.readVarInt(p122, var2470)
			local _ = var2476
			var2470 = var2477
			continue
		end
		if var2471 == protoModule.wireTypes.lengthDelimited then
			if var2475 == 1 then
				local _ = nil
				local var2478, var2479 = protoModule.readBuffer(p122, var2470)
				var2470 = var2479
				var2469.event_id = buffer.tostring(var2478)
			elseif var2475 == 2 then
				local _ = nil
				local var2480, var2481 = protoModule.readBuffer(p122, var2470)
				var2470 = var2481
				var2469.universe_id = buffer.tostring(var2480)
			else
				local _ = nil
				local var2482, var2483 = protoModule.readVarInt(p122, var2470)
				var2470 = var2483 + var2482
			end
		elseif var2471 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2484, var2485 = protoModule.readFixed32(p122, var2470)
			local _ = var2484
			var2470 = var2485
		elseif var2471 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2486, var2487 = protoModule.readFixed64(p122, var2470)
			local _ = var2486
			var2470 = var2487
		else
			error("Unsupported wire type: " .. var2471)
		end
	end
	return var2469
end

function t_62:jsonEncode() --[[ line: 14394 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_62:jsonDecode() --[[ line: 14408 ]]
	-- upvalues: t_62 (ref)
	local var2489 = t_62.new()
	
	if self.event_id ~= nil then
		var2489.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2489.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2489.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2489.universe_id = self.universeId
	end
	return var2489
end

t_62.descriptor = {
	name = "EventAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
}
t.EventAttributionRowInputData = t_62
typeRegistryModule.default:register(t.EventAttributionRowInputData)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p123) --[[ line: 14444 ]]
	-- upvalues: t_63 (ref)
	return setmetatable({
		event_id = if p123 == nil or p123.event_id == nil then "" else p123.event_id
	}, t_63)
end

function t_63:encode() --[[ line: 14450 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2491 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2492, var2493 = protoModule.writeTag(buff, var2491, 1, protoModule.wireTypes.lengthDelimited)
		var2492, var2493 = protoModule.writeString(var2492, var2493, self.event_id)
		buff = var2492
		var2491 = var2493
	end
	local buff_1 = buffer.create(var2491)
	buffer.copy(buff_1, 0, buff, 0, var2491)
	
	return buff_1
end

function t_63.decode(p124) --[[ line: 14464 ]]
	-- upvalues: t_63 (ref), protoModule (ref)
	local var2495 = t_63.new()
	local var2496 = 0
	while var2496 < buffer.len(p124) do
		local _ = nil
		local var2497 = nil
		local var2498, var2499, var2500 = protoModule.readTag(p124, var2496)
		local var2501 = var2498
		var2497 = var2499
		var2496 = var2500
		
		if var2497 == protoModule.wireTypes.varint then
			local _ = nil
			local var2502, var2503 = protoModule.readVarInt(p124, var2496)
			local _ = var2502
			var2496 = var2503
			continue
		end
		if var2497 == protoModule.wireTypes.lengthDelimited then
			if var2501 == 1 then
				local _ = nil
				local var2504, var2505 = protoModule.readBuffer(p124, var2496)
				var2496 = var2505
				var2495.event_id = buffer.tostring(var2504)
			else
				local _ = nil
				local var2506, var2507 = protoModule.readVarInt(p124, var2496)
				var2496 = var2507 + var2506
			end
		elseif var2497 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2508, var2509 = protoModule.readFixed32(p124, var2496)
			local _ = var2508
			var2496 = var2509
		elseif var2497 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2510, var2511 = protoModule.readFixed64(p124, var2496)
			local _ = var2510
			var2496 = var2511
		else
			error("Unsupported wire type: " .. var2497)
		end
	end
	return var2495
end

function t_63:jsonEncode() --[[ line: 14507 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_63:jsonDecode() --[[ line: 14517 ]]
	-- upvalues: t_63 (ref)
	local var2513 = t_63.new()
	
	if self.event_id ~= nil then
		var2513.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2513.event_id = self.eventId
	end
	return var2513
end

t_63.descriptor = {
	name = "EventInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
}
t.EventInfoTableInputData = t_63
typeRegistryModule.default:register(t.EventInfoTableInputData)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p125) --[[ line: 14545 ]]
	-- upvalues: t_64 (ref)
	return setmetatable({
		event_id = if p125 == nil or p125.event_id == nil then "" else p125.event_id
	}, t_64)
end

function t_64:encode() --[[ line: 14553 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2515 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2516, var2517 = protoModule.writeTag(buff, var2515, 1, protoModule.wireTypes.lengthDelimited)
		var2516, var2517 = protoModule.writeString(var2516, var2517, self.event_id)
		buff = var2516
		var2515 = var2517
	end
	local buff_1 = buffer.create(var2515)
	buffer.copy(buff_1, 0, buff, 0, var2515)
	
	return buff_1
end

function t_64.decode(p126) --[[ line: 14567 ]]
	-- upvalues: t_64 (ref), protoModule (ref)
	local var2519 = t_64.new()
	local var2520 = 0
	while var2520 < buffer.len(p126) do
		local _ = nil
		local var2521 = nil
		local var2522, var2523, var2524 = protoModule.readTag(p126, var2520)
		local var2525 = var2522
		var2521 = var2523
		var2520 = var2524
		
		if var2521 == protoModule.wireTypes.varint then
			local _ = nil
			local var2526, var2527 = protoModule.readVarInt(p126, var2520)
			local _ = var2526
			var2520 = var2527
			continue
		end
		if var2521 == protoModule.wireTypes.lengthDelimited then
			if var2525 == 1 then
				local _ = nil
				local var2528, var2529 = protoModule.readBuffer(p126, var2520)
				var2520 = var2529
				var2519.event_id = buffer.tostring(var2528)
			else
				local _ = nil
				local var2530, var2531 = protoModule.readVarInt(p126, var2520)
				var2520 = var2531 + var2530
			end
		elseif var2521 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2532, var2533 = protoModule.readFixed32(p126, var2520)
			local _ = var2532
			var2520 = var2533
		elseif var2521 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2534, var2535 = protoModule.readFixed64(p126, var2520)
			local _ = var2534
			var2520 = var2535
		else
			error("Unsupported wire type: " .. var2521)
		end
	end
	return var2519
end

function t_64:jsonEncode() --[[ line: 14610 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_64:jsonDecode() --[[ line: 14620 ]]
	-- upvalues: t_64 (ref)
	local var2537 = t_64.new()
	
	if self.event_id ~= nil then
		var2537.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2537.event_id = self.eventId
	end
	return var2537
end

t_64.descriptor = {
	name = "EventDetailsSheetFullBleedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsSheetFullBleedInputData"
}
t.EventDetailsSheetFullBleedInputData = t_64
typeRegistryModule.default:register(t.EventDetailsSheetFullBleedInputData)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p127) --[[ line: 14650 ]]
	-- upvalues: t_65 (ref)
	return setmetatable({
		event_id = if p127 == nil or p127.event_id == nil then "" else p127.event_id,
		universe_id = if p127 == nil or p127.universe_id == nil then "" else p127.universe_id
	}, t_65)
end

function t_65:encode() --[[ line: 14659 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2539 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2540, var2541 = protoModule.writeTag(buff, var2539, 1, protoModule.wireTypes.lengthDelimited)
		var2540, var2541 = protoModule.writeString(var2540, var2541, self.event_id)
		buff = var2540
		var2539 = var2541
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2542, var2543 = protoModule.writeTag(buff, var2539, 2, protoModule.wireTypes.lengthDelimited)
		var2542, var2543 = protoModule.writeString(var2542, var2543, self.universe_id)
		buff = var2542
		var2539 = var2543
	end
	local buff_1 = buffer.create(var2539)
	buffer.copy(buff_1, 0, buff, 0, var2539)
	
	return buff_1
end

function t_65.decode(p128) --[[ line: 14678 ]]
	-- upvalues: t_65 (ref), protoModule (ref)
	local var2545 = t_65.new()
	local var2546 = 0
	while var2546 < buffer.len(p128) do
		local _ = nil
		local var2547 = nil
		local var2548, var2549, var2550 = protoModule.readTag(p128, var2546)
		local var2551 = var2548
		var2547 = var2549
		var2546 = var2550
		
		if var2547 == protoModule.wireTypes.varint then
			local _ = nil
			local var2552, var2553 = protoModule.readVarInt(p128, var2546)
			local _ = var2552
			var2546 = var2553
			continue
		end
		if var2547 == protoModule.wireTypes.lengthDelimited then
			if var2551 == 1 then
				local _ = nil
				local var2554, var2555 = protoModule.readBuffer(p128, var2546)
				var2546 = var2555
				var2545.event_id = buffer.tostring(var2554)
			elseif var2551 == 2 then
				local _ = nil
				local var2556, var2557 = protoModule.readBuffer(p128, var2546)
				var2546 = var2557
				var2545.universe_id = buffer.tostring(var2556)
			else
				local _ = nil
				local var2558, var2559 = protoModule.readVarInt(p128, var2546)
				var2546 = var2559 + var2558
			end
		elseif var2547 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2560, var2561 = protoModule.readFixed32(p128, var2546)
			local _ = var2560
			var2546 = var2561
		elseif var2547 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2562, var2563 = protoModule.readFixed64(p128, var2546)
			local _ = var2562
			var2546 = var2563
		else
			error("Unsupported wire type: " .. var2547)
		end
	end
	return var2545
end

function t_65:jsonEncode() --[[ line: 14726 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_65:jsonDecode() --[[ line: 14740 ]]
	-- upvalues: t_65 (ref)
	local var2565 = t_65.new()
	
	if self.event_id ~= nil then
		var2565.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2565.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2565.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2565.universe_id = self.universeId
	end
	return var2565
end

t_65.descriptor = {
	name = "EventNotificationsModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventNotificationsModalInputData"
}
t.EventNotificationsModalInputData = t_65
typeRegistryModule.default:register(t.EventNotificationsModalInputData)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p129) --[[ line: 14778 ]]
	-- upvalues: t_66 (ref)
	return setmetatable({
		entry_map = if p129 == nil or p129.entry_map == nil then {} else p129.entry_map,
		entry_order = if p129 == nil or p129.entry_order == nil then {} else p129.entry_order,
		next_page_token = if p129 == nil or p129.next_page_token == nil then "" else p129.next_page_token,
		sticky_filter_pills = if p129 == nil or p129.sticky_filter_pills == nil then nil else p129.sticky_filter_pills,
		applied_filters = if p129 == nil or p129.applied_filters == nil then "" else p129.applied_filters
	}, t_66)
end

function t_66:encode() --[[ line: 14790 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2567 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2568, var2569 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2568, var2569 = protoModule.writeString(var2568, var2569, i)
			local var2570 = v:encode()
			var2569, var2571 = protoModule.writeTag(var2568, var2569, 2, protoModule.wireTypes.lengthDelimited)
			var2569, var2571 = protoModule.writeBuffer(var2569, var2571, var2570, buffer.len(var2570))
			local var2572 = var2569
			local var2573 = var2571
			local var2574, var2575 = protoModule.writeTag(buff, var2567, 1, protoModule.wireTypes.lengthDelimited)
			var2574, var2575 = protoModule.writeBuffer(var2574, var2575, var2572, var2573)
			buff = var2574
			var2567 = var2575
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2576, var2577 = protoModule.writeTag(buff, var2567, 2, protoModule.wireTypes.lengthDelimited)
			var2576, var2577 = protoModule.writeString(var2576, var2577, v)
			buff = var2576
			var2567 = var2577
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2578, var2579 = protoModule.writeTag(buff, var2567, 3, protoModule.wireTypes.lengthDelimited)
		var2578, var2579 = protoModule.writeString(var2578, var2579, self.next_page_token)
		buff = var2578
		var2567 = var2579
	end
	if self.sticky_filter_pills ~= nil then
		local var2580 = self.sticky_filter_pills:encode()
		local var2581, var2582 = protoModule.writeTag(buff, var2567, 4, protoModule.wireTypes.lengthDelimited)
		var2581, var2582 = protoModule.writeBuffer(var2581, var2582, var2580, buffer.len(var2580))
		buff = var2581
		var2567 = var2582
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2583, var2584 = protoModule.writeTag(buff, var2567, 5, protoModule.wireTypes.lengthDelimited)
		var2583, var2584 = protoModule.writeString(var2583, var2584, self.applied_filters)
		buff = var2583
		var2567 = var2584
	end
	local buff_1 = buffer.create(var2567)
	buffer.copy(buff_1, 0, buff, 0, var2567)
	
	return buff_1
end

function t_66.decode(p130) --[[ line: 14836 ]]
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var2586 = t_66.new()
	local var2587 = 0
	while var2587 < buffer.len(p130) do
		local _ = nil
		local var2588 = nil
		local var2589, var2590, var2591 = protoModule.readTag(p130, var2587)
		local var2592 = var2589
		var2588 = var2590
		var2587 = var2591
		
		if var2588 == protoModule.wireTypes.varint then
			local _ = nil
			local var2593, var2594 = protoModule.readVarInt(p130, var2587)
			local _ = var2593
			var2587 = var2594
			continue
		end
		if var2588 == protoModule.wireTypes.lengthDelimited then
			if var2592 == 1 then
				local _ = nil
				local var2595, var2596 = protoModule.readBuffer(p130, var2587)
				var2587 = var2596
				var2595 = t.ChartsFeedInputData_EntryMapEntry.decode(var2595)
				var2586.entry_map[var2595.key or ""] = var2595.value or t.FeedEntry.new()
			elseif var2592 == 2 then
				local _ = nil
				local var2597, var2598 = protoModule.readBuffer(p130, var2587)
				var2587 = var2598
				table.insert(var2586.entry_order, buffer.tostring(var2597))
			elseif var2592 == 3 then
				local _ = nil
				local var2599, var2600 = protoModule.readBuffer(p130, var2587)
				var2587 = var2600
				var2586.next_page_token = buffer.tostring(var2599)
			elseif var2592 == 4 then
				local _ = nil
				local var2601, var2602 = protoModule.readBuffer(p130, var2587)
				var2587 = var2602
				var2586.sticky_filter_pills = t.FilterPillsInputData.decode(var2601)
			elseif var2592 == 5 then
				local _ = nil
				local var2603, var2604 = protoModule.readBuffer(p130, var2587)
				var2587 = var2604
				var2586.applied_filters = buffer.tostring(var2603)
			else
				local _ = nil
				local var2605, var2606 = protoModule.readVarInt(p130, var2587)
				var2587 = var2606 + var2605
			end
		elseif var2588 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2607, var2608 = protoModule.readFixed32(p130, var2587)
			local _ = var2607
			var2587 = var2608
		elseif var2588 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2609, var2610 = protoModule.readFixed64(p130, var2587)
			local _ = var2609
			var2587 = var2610
		else
			error("Unsupported wire type: " .. var2588)
		end
	end
	return var2586
end

function t_66:jsonEncode() --[[ line: 14906 ]]
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

function t_66:jsonDecode() --[[ line: 14940 ]]
	-- upvalues: t_66 (ref), t (ref)
	local var2614 = t_66.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2614.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2614.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2614.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2614.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2614.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2614.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2614.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2614.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2614.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2614.applied_filters = self.appliedFilters
	end
	return var2614
end

t_66.descriptor = {
	name = "ChartsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
}
t.ChartsFeedInputData = t_66
typeRegistryModule.default:register(t.ChartsFeedInputData)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p131) --[[ line: 15020 ]]
	-- upvalues: t_67 (ref)
	return setmetatable({
		key = if p131 == nil or p131.key == nil then "" else p131.key,
		value = if p131 == nil or p131.value == nil then nil else p131.value
	}, t_67)
end

function t_67:encode() --[[ line: 15029 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2620 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2621, var2622 = protoModule.writeTag(buff, var2620, 1, protoModule.wireTypes.lengthDelimited)
		var2621, var2622 = protoModule.writeString(var2621, var2622, self.key)
		buff = var2621
		var2620 = var2622
	end
	if self.value ~= nil then
		local var2623 = self.value:encode()
		local var2624, var2625 = protoModule.writeTag(buff, var2620, 2, protoModule.wireTypes.lengthDelimited)
		var2624, var2625 = protoModule.writeBuffer(var2624, var2625, var2623, buffer.len(var2623))
		buff = var2624
		var2620 = var2625
	end
	local buff_1 = buffer.create(var2620)
	buffer.copy(buff_1, 0, buff, 0, var2620)
	
	return buff_1
end

function t_67.decode(p132) --[[ line: 15049 ]]
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var2627 = t_67.new()
	local var2628 = 0
	while var2628 < buffer.len(p132) do
		local _ = nil
		local var2629 = nil
		local var2630, var2631, var2632 = protoModule.readTag(p132, var2628)
		local var2633 = var2630
		var2629 = var2631
		var2628 = var2632
		
		if var2629 == protoModule.wireTypes.varint then
			local _ = nil
			local var2634, var2635 = protoModule.readVarInt(p132, var2628)
			local _ = var2634
			var2628 = var2635
			continue
		end
		if var2629 == protoModule.wireTypes.lengthDelimited then
			if var2633 == 1 then
				local _ = nil
				local var2636, var2637 = protoModule.readBuffer(p132, var2628)
				var2628 = var2637
				var2627.key = buffer.tostring(var2636)
			elseif var2633 == 2 then
				local _ = nil
				local var2638, var2639 = protoModule.readBuffer(p132, var2628)
				var2628 = var2639
				var2627.value = t.FeedEntry.decode(var2638)
			else
				local _ = nil
				local var2640, var2641 = protoModule.readVarInt(p132, var2628)
				var2628 = var2641 + var2640
			end
		elseif var2629 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2642, var2643 = protoModule.readFixed32(p132, var2628)
			local _ = var2642
			var2628 = var2643
		elseif var2629 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2644, var2645 = protoModule.readFixed64(p132, var2628)
			local _ = var2644
			var2628 = var2645
		else
			error("Unsupported wire type: " .. var2629)
		end
	end
	return var2627
end

function t_67:jsonEncode() --[[ line: 15097 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_67:jsonDecode() --[[ line: 15111 ]]
	-- upvalues: t_67 (ref), t (ref)
	local var2647 = t_67.new()
	
	if self.key ~= nil then
		var2647.key = self.key
	end
	if self.value ~= nil then
		var2647.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2647
end

t_67.descriptor = {
	name = "ChartsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ChartsFeedInputData_EntryMapEntry = t_67
typeRegistryModule.default:register(t.ChartsFeedInputData_EntryMapEntry)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p133) --[[ line: 15141 ]]
	-- upvalues: t_68 (ref)
	return setmetatable({
		filter_groups = if p133 == nil or p133.filter_groups == nil then {} else p133.filter_groups,
		sort_id = if p133 == nil or p133.sort_id == nil then "" else p133.sort_id,
		secondary_sort_id = if p133 == nil or p133.secondary_sort_id == nil then 0 else p133.secondary_sort_id,
		title = if p133 == nil or p133.title == nil then "" else p133.title,
		primary_sort_id = if p133 == nil or p133.primary_sort_id == nil then nil else p133.primary_sort_id,
		applied_filters = if p133 == nil or p133.applied_filters == nil then nil else p133.applied_filters
	}, t_68)
end

function t_68:encode() --[[ line: 15152 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2649 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2650 = v:encode()
			local var2651, var2652 = protoModule.writeTag(buff, var2649, 1, protoModule.wireTypes.lengthDelimited)
			var2651, var2652 = protoModule.writeBuffer(var2651, var2652, var2650, buffer.len(var2650))
			buff = var2651
			var2649 = var2652
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2653, var2654 = protoModule.writeTag(buff, var2649, 2, protoModule.wireTypes.lengthDelimited)
		var2653, var2654 = protoModule.writeString(var2653, var2654, self.sort_id)
		buff = var2653
		var2649 = var2654
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2655, var2656 = protoModule.writeTag(buff, var2649, 3, protoModule.wireTypes.varint)
		var2655, var2656 = protoModule.writeVarInt(var2655, var2656, self.secondary_sort_id)
		buff = var2655
		var2649 = var2656
	end
	if self.title ~= nil and self.title ~= "" then
		local var2657, var2658 = protoModule.writeTag(buff, var2649, 4, protoModule.wireTypes.lengthDelimited)
		var2657, var2658 = protoModule.writeString(var2657, var2658, self.title)
		buff = var2657
		var2649 = var2658
	end
	if self.primary_sort_id ~= nil then
		local var2659, var2660 = protoModule.writeTag(buff, var2649, 5, protoModule.wireTypes.varint)
		var2659, var2660 = protoModule.writeVarInt(var2659, var2660, self.primary_sort_id)
		buff = var2659
		var2649 = var2660
	end
	if self.applied_filters ~= nil then
		local var2661, var2662 = protoModule.writeTag(buff, var2649, 6, protoModule.wireTypes.lengthDelimited)
		var2661, var2662 = protoModule.writeString(var2661, var2662, self.applied_filters)
		buff = var2661
		var2649 = var2662
	end
	local buff_1 = buffer.create(var2649)
	buffer.copy(buff_1, 0, buff, 0, var2649)
	
	return buff_1
end

function t_68.decode(p134) --[[ line: 15194 ]]
	-- upvalues: t_68 (ref), protoModule (ref), t (ref)
	local var2664 = t_68.new()
	local var2665 = 0
	while var2665 < buffer.len(p134) do
		local _ = nil
		local var2666 = nil
		local var2667, var2668, var2669 = protoModule.readTag(p134, var2665)
		local var2670 = var2667
		var2666 = var2668
		var2665 = var2669
		
		if var2666 == protoModule.wireTypes.varint then
			if var2670 == 3 then
				local _ = nil
				local var2671, var2672 = protoModule.readVarIntI32(p134, var2665)
				var2665 = var2672
				var2664.secondary_sort_id = var2671
			elseif var2670 == 5 then
				local _ = nil
				local var2673, var2674 = protoModule.readVarIntI32(p134, var2665)
				var2665 = var2674
				var2664.primary_sort_id = var2673
			else
				local _ = nil
				local var2675, var2676 = protoModule.readVarInt(p134, var2665)
				local _ = var2675
				var2665 = var2676
			end
		end
		if var2666 == protoModule.wireTypes.lengthDelimited then
			if var2670 == 1 then
				local _ = nil
				local var2677, var2678 = protoModule.readBuffer(p134, var2665)
				var2665 = var2678
				table.insert(var2664.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2677))
			elseif var2670 == 2 then
				local _ = nil
				local var2679, var2680 = protoModule.readBuffer(p134, var2665)
				var2665 = var2680
				var2664.sort_id = buffer.tostring(var2679)
			elseif var2670 == 4 then
				local _ = nil
				local var2681, var2682 = protoModule.readBuffer(p134, var2665)
				var2665 = var2682
				var2664.title = buffer.tostring(var2681)
			elseif var2670 == 6 then
				local _ = nil
				local var2683, var2684 = protoModule.readBuffer(p134, var2665)
				var2665 = var2684
				var2664.applied_filters = buffer.tostring(var2683)
			else
				local _ = nil
				local var2685, var2686 = protoModule.readVarInt(p134, var2665)
				var2665 = var2686 + var2685
			end
		elseif var2666 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2687, var2688 = protoModule.readFixed32(p134, var2665)
			local _ = var2687
			var2665 = var2688
		elseif var2666 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2689, var2690 = protoModule.readFixed64(p134, var2665)
			local _ = var2689
			var2665 = var2690
		else
			error("Unsupported wire type: " .. var2666)
		end
	end
	return var2664
end

function t_68:jsonEncode() --[[ line: 15262 ]]
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

function t_68:jsonDecode() --[[ line: 15296 ]]
	-- upvalues: t_68 (ref), t (ref)
	local var2693 = t_68.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2693.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2693.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2693.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2693.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2693.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2693.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2693.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2693.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2693.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2693.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2693.applied_filters = self.appliedFilters
	end
	return var2693
end

t_68.descriptor = {
	name = "FilterPillsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
}
t.FilterPillsInputData = t_68
typeRegistryModule.default:register(t.FilterPillsInputData)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p135) --[[ line: 15370 ]]
	-- upvalues: t_69 (ref)
	return setmetatable({
		filter_id = if p135 == nil or p135.filter_id == nil then "" else p135.filter_id,
		display_name = if p135 == nil or p135.display_name == nil then "" else p135.display_name,
		options = if p135 == nil or p135.options == nil then {} else p135.options,
		default_option_id = if p135 == nil or p135.default_option_id == nil then "" else p135.default_option_id,
		selected_option_id = if p135 == nil or p135.selected_option_id == nil then "" else p135.selected_option_id,
		filter_type = if p135 == nil or p135.filter_type == nil then "" else p135.filter_type,
		inactive_option_ids = if p135 == nil or p135.inactive_option_ids == nil then {} else p135.inactive_option_ids,
		info_text = if p135 == nil or p135.info_text == nil then "" else p135.info_text
	}, t_69)
end

function t_69:encode() --[[ line: 15387 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2697 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2698, var2699 = protoModule.writeTag(buff, var2697, 1, protoModule.wireTypes.lengthDelimited)
		var2698, var2699 = protoModule.writeString(var2698, var2699, self.filter_id)
		buff = var2698
		var2697 = var2699
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2700, var2701 = protoModule.writeTag(buff, var2697, 2, protoModule.wireTypes.lengthDelimited)
		var2700, var2701 = protoModule.writeString(var2700, var2701, self.display_name)
		buff = var2700
		var2697 = var2701
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2702 = v:encode()
			local var2703, var2704 = protoModule.writeTag(buff, var2697, 3, protoModule.wireTypes.lengthDelimited)
			var2703, var2704 = protoModule.writeBuffer(var2703, var2704, var2702, buffer.len(var2702))
			buff = var2703
			var2697 = var2704
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2705, var2706 = protoModule.writeTag(buff, var2697, 4, protoModule.wireTypes.lengthDelimited)
		var2705, var2706 = protoModule.writeString(var2705, var2706, self.default_option_id)
		buff = var2705
		var2697 = var2706
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2707, var2708 = protoModule.writeTag(buff, var2697, 5, protoModule.wireTypes.lengthDelimited)
		var2707, var2708 = protoModule.writeString(var2707, var2708, self.selected_option_id)
		buff = var2707
		var2697 = var2708
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2709, var2710 = protoModule.writeTag(buff, var2697, 6, protoModule.wireTypes.lengthDelimited)
		var2709, var2710 = protoModule.writeString(var2709, var2710, self.filter_type)
		buff = var2709
		var2697 = var2710
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2711, var2712 = protoModule.writeTag(buff, var2697, 7, protoModule.wireTypes.lengthDelimited)
			var2711, var2712 = protoModule.writeString(var2711, var2712, v)
			buff = var2711
			var2697 = var2712
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2713, var2714 = protoModule.writeTag(buff, var2697, 8, protoModule.wireTypes.lengthDelimited)
		var2713, var2714 = protoModule.writeString(var2713, var2714, self.info_text)
		buff = var2713
		var2697 = var2714
	end
	local buff_1 = buffer.create(var2697)
	buffer.copy(buff_1, 0, buff, 0, var2697)
	
	return buff_1
end

function t_69.decode(p136) --[[ line: 15441 ]]
	-- upvalues: t_69 (ref), protoModule (ref), t (ref)
	local var2716 = t_69.new()
	local var2717 = 0
	while var2717 < buffer.len(p136) do
		local _ = nil
		local var2718 = nil
		local var2719, var2720, var2721 = protoModule.readTag(p136, var2717)
		local var2722 = var2719
		var2718 = var2720
		var2717 = var2721
		
		if var2718 == protoModule.wireTypes.varint then
			local _ = nil
			local var2723, var2724 = protoModule.readVarInt(p136, var2717)
			local _ = var2723
			var2717 = var2724
			continue
		end
		if var2718 == protoModule.wireTypes.lengthDelimited then
			if var2722 == 1 then
				local _ = nil
				local var2725, var2726 = protoModule.readBuffer(p136, var2717)
				var2717 = var2726
				var2716.filter_id = buffer.tostring(var2725)
			elseif var2722 == 2 then
				local _ = nil
				local var2727, var2728 = protoModule.readBuffer(p136, var2717)
				var2717 = var2728
				var2716.display_name = buffer.tostring(var2727)
			elseif var2722 == 3 then
				local _ = nil
				local var2729, var2730 = protoModule.readBuffer(p136, var2717)
				var2717 = var2730
				table.insert(var2716.options, t.FilterPillsInputData_FilterOption.decode(var2729))
			elseif var2722 == 4 then
				local _ = nil
				local var2731, var2732 = protoModule.readBuffer(p136, var2717)
				var2717 = var2732
				var2716.default_option_id = buffer.tostring(var2731)
			elseif var2722 == 5 then
				local _ = nil
				local var2733, var2734 = protoModule.readBuffer(p136, var2717)
				var2717 = var2734
				var2716.selected_option_id = buffer.tostring(var2733)
			elseif var2722 == 6 then
				local _ = nil
				local var2735, var2736 = protoModule.readBuffer(p136, var2717)
				var2717 = var2736
				var2716.filter_type = buffer.tostring(var2735)
			elseif var2722 == 7 then
				local _ = nil
				local var2737, var2738 = protoModule.readBuffer(p136, var2717)
				var2717 = var2738
				table.insert(var2716.inactive_option_ids, buffer.tostring(var2737))
			elseif var2722 == 8 then
				local _ = nil
				local var2739, var2740 = protoModule.readBuffer(p136, var2717)
				var2717 = var2740
				var2716.info_text = buffer.tostring(var2739)
			else
				local _ = nil
				local var2741, var2742 = protoModule.readVarInt(p136, var2717)
				var2717 = var2742 + var2741
			end
		elseif var2718 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2743, var2744 = protoModule.readFixed32(p136, var2717)
			local _ = var2743
			var2717 = var2744
		elseif var2718 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2745, var2746 = protoModule.readFixed64(p136, var2717)
			local _ = var2745
			var2717 = var2746
		else
			error("Unsupported wire type: " .. var2718)
		end
	end
	return var2716
end

function t_69:jsonEncode() --[[ line: 15519 ]]
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

function t_69:jsonDecode() --[[ line: 15565 ]]
	-- upvalues: t_69 (ref), t (ref)
	local var2750 = t_69.new()
	
	if self.filter_id ~= nil then
		var2750.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2750.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2750.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2750.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2750.options = t_1
	end
	if self.default_option_id ~= nil then
		var2750.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2750.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2750.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2750.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2750.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2750.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2750.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2750.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2750.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2750.info_text = self.infoText
	end
	return var2750
end

t_69.descriptor = {
	name = "FilterPillsInputData_FilterGroup",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
}
t.FilterPillsInputData_FilterGroup = t_69
typeRegistryModule.default:register(t.FilterPillsInputData_FilterGroup)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p137) --[[ line: 15662 ]]
	-- upvalues: t_70 (ref)
	return setmetatable({
		option_id = if p137 == nil or p137.option_id == nil then "" else p137.option_id,
		display_name = if p137 == nil or p137.display_name == nil then "" else p137.display_name,
		option_context_tag = if p137 == nil or p137.option_context_tag == nil then "" else p137.option_context_tag
	}, t_70)
end

function t_70:encode() --[[ line: 15672 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2755 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2756, var2757 = protoModule.writeTag(buff, var2755, 1, protoModule.wireTypes.lengthDelimited)
		var2756, var2757 = protoModule.writeString(var2756, var2757, self.option_id)
		buff = var2756
		var2755 = var2757
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2758, var2759 = protoModule.writeTag(buff, var2755, 2, protoModule.wireTypes.lengthDelimited)
		var2758, var2759 = protoModule.writeString(var2758, var2759, self.display_name)
		buff = var2758
		var2755 = var2759
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2760, var2761 = protoModule.writeTag(buff, var2755, 3, protoModule.wireTypes.lengthDelimited)
		var2760, var2761 = protoModule.writeString(var2760, var2761, self.option_context_tag)
		buff = var2760
		var2755 = var2761
	end
	local buff_1 = buffer.create(var2755)
	buffer.copy(buff_1, 0, buff, 0, var2755)
	
	return buff_1
end

function t_70.decode(p138) --[[ line: 15696 ]]
	-- upvalues: t_70 (ref), protoModule (ref)
	local var2763 = t_70.new()
	local var2764 = 0
	while var2764 < buffer.len(p138) do
		local _ = nil
		local var2765 = nil
		local var2766, var2767, var2768 = protoModule.readTag(p138, var2764)
		local var2769 = var2766
		var2765 = var2767
		var2764 = var2768
		
		if var2765 == protoModule.wireTypes.varint then
			local _ = nil
			local var2770, var2771 = protoModule.readVarInt(p138, var2764)
			local _ = var2770
			var2764 = var2771
			continue
		end
		if var2765 == protoModule.wireTypes.lengthDelimited then
			if var2769 == 1 then
				local _ = nil
				local var2772, var2773 = protoModule.readBuffer(p138, var2764)
				var2764 = var2773
				var2763.option_id = buffer.tostring(var2772)
			elseif var2769 == 2 then
				local _ = nil
				local var2774, var2775 = protoModule.readBuffer(p138, var2764)
				var2764 = var2775
				var2763.display_name = buffer.tostring(var2774)
			elseif var2769 == 3 then
				local _ = nil
				local var2776, var2777 = protoModule.readBuffer(p138, var2764)
				var2764 = var2777
				var2763.option_context_tag = buffer.tostring(var2776)
			else
				local _ = nil
				local var2778, var2779 = protoModule.readVarInt(p138, var2764)
				var2764 = var2779 + var2778
			end
		elseif var2765 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2780, var2781 = protoModule.readFixed32(p138, var2764)
			local _ = var2780
			var2764 = var2781
		elseif var2765 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2782, var2783 = protoModule.readFixed64(p138, var2764)
			local _ = var2782
			var2764 = var2783
		else
			error("Unsupported wire type: " .. var2765)
		end
	end
	return var2763
end

function t_70:jsonEncode() --[[ line: 15749 ]]
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

function t_70:jsonDecode() --[[ line: 15767 ]]
	-- upvalues: t_70 (ref)
	local var2785 = t_70.new()
	
	if self.option_id ~= nil then
		var2785.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var2785.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var2785.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2785.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var2785.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var2785.option_context_tag = self.optionContextTag
	end
	return var2785
end

t_70.descriptor = {
	name = "FilterPillsInputData_FilterOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
}
t.FilterPillsInputData_FilterOption = t_70
typeRegistryModule.default:register(t.FilterPillsInputData_FilterOption)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p139) --[[ line: 15813 ]]
	-- upvalues: t_71 (ref)
	return setmetatable({
		sort_options = if p139 == nil or p139.sort_options == nil then {} else p139.sort_options,
		selected_sort_id = if p139 == nil or p139.selected_sort_id == nil then "" else p139.selected_sort_id
	}, t_71)
end

function t_71:encode() --[[ line: 15820 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2787 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2788 = v:encode()
			local var2789, var2790 = protoModule.writeTag(buff, var2787, 1, protoModule.wireTypes.lengthDelimited)
			var2789, var2790 = protoModule.writeBuffer(var2789, var2790, var2788, buffer.len(var2788))
			buff = var2789
			var2787 = var2790
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var2791, var2792 = protoModule.writeTag(buff, var2787, 2, protoModule.wireTypes.lengthDelimited)
		var2791, var2792 = protoModule.writeString(var2791, var2792, self.selected_sort_id)
		buff = var2791
		var2787 = var2792
	end
	local buff_1 = buffer.create(var2787)
	buffer.copy(buff_1, 0, buff, 0, var2787)
	
	return buff_1
end

function t_71.decode(p140) --[[ line: 15842 ]]
	-- upvalues: t_71 (ref), protoModule (ref), t (ref)
	local var2794 = t_71.new()
	local var2795 = 0
	while var2795 < buffer.len(p140) do
		local _ = nil
		local var2796 = nil
		local var2797, var2798, var2799 = protoModule.readTag(p140, var2795)
		local var2800 = var2797
		var2796 = var2798
		var2795 = var2799
		
		if var2796 == protoModule.wireTypes.varint then
			local _ = nil
			local var2801, var2802 = protoModule.readVarInt(p140, var2795)
			local _ = var2801
			var2795 = var2802
			continue
		end
		if var2796 == protoModule.wireTypes.lengthDelimited then
			if var2800 == 1 then
				local _ = nil
				local var2803, var2804 = protoModule.readBuffer(p140, var2795)
				var2795 = var2804
				table.insert(var2794.sort_options, t.SortSelectorInputData_SortOption.decode(var2803))
			elseif var2800 == 2 then
				local _ = nil
				local var2805, var2806 = protoModule.readBuffer(p140, var2795)
				var2795 = var2806
				var2794.selected_sort_id = buffer.tostring(var2805)
			else
				local _ = nil
				local var2807, var2808 = protoModule.readVarInt(p140, var2795)
				var2795 = var2808 + var2807
			end
		elseif var2796 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2809, var2810 = protoModule.readFixed32(p140, var2795)
			local _ = var2809
			var2795 = var2810
		elseif var2796 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2811, var2812 = protoModule.readFixed64(p140, var2795)
			local _ = var2811
			var2795 = var2812
		else
			error("Unsupported wire type: " .. var2796)
		end
	end
	return var2794
end

function t_71:jsonEncode() --[[ line: 15890 ]]
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

function t_71:jsonDecode() --[[ line: 15908 ]]
	-- upvalues: t_71 (ref), t (ref)
	local var2815 = t_71.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2815.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2815.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var2815.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var2815.selected_sort_id = self.selectedSortId
	end
	return var2815
end

t_71.descriptor = {
	name = "SortSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
}
t.SortSelectorInputData = t_71
typeRegistryModule.default:register(t.SortSelectorInputData)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p141) --[[ line: 15954 ]]
	-- upvalues: t_72 (ref)
	return setmetatable({
		sort_id = if p141 == nil or p141.sort_id == nil then "" else p141.sort_id,
		display_name = if p141 == nil or p141.display_name == nil then "" else p141.display_name,
		content_type = if p141 == nil or p141.content_type == nil then "" else p141.content_type
	}, t_72)
end

function t_72:encode() --[[ line: 15964 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2819 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2820, var2821 = protoModule.writeTag(buff, var2819, 1, protoModule.wireTypes.lengthDelimited)
		var2820, var2821 = protoModule.writeString(var2820, var2821, self.sort_id)
		buff = var2820
		var2819 = var2821
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2822, var2823 = protoModule.writeTag(buff, var2819, 2, protoModule.wireTypes.lengthDelimited)
		var2822, var2823 = protoModule.writeString(var2822, var2823, self.display_name)
		buff = var2822
		var2819 = var2823
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2824, var2825 = protoModule.writeTag(buff, var2819, 3, protoModule.wireTypes.lengthDelimited)
		var2824, var2825 = protoModule.writeString(var2824, var2825, self.content_type)
		buff = var2824
		var2819 = var2825
	end
	local buff_1 = buffer.create(var2819)
	buffer.copy(buff_1, 0, buff, 0, var2819)
	
	return buff_1
end

function t_72.decode(p142) --[[ line: 15988 ]]
	-- upvalues: t_72 (ref), protoModule (ref)
	local var2827 = t_72.new()
	local var2828 = 0
	while var2828 < buffer.len(p142) do
		local _ = nil
		local var2829 = nil
		local var2830, var2831, var2832 = protoModule.readTag(p142, var2828)
		local var2833 = var2830
		var2829 = var2831
		var2828 = var2832
		
		if var2829 == protoModule.wireTypes.varint then
			local _ = nil
			local var2834, var2835 = protoModule.readVarInt(p142, var2828)
			local _ = var2834
			var2828 = var2835
			continue
		end
		if var2829 == protoModule.wireTypes.lengthDelimited then
			if var2833 == 1 then
				local _ = nil
				local var2836, var2837 = protoModule.readBuffer(p142, var2828)
				var2828 = var2837
				var2827.sort_id = buffer.tostring(var2836)
			elseif var2833 == 2 then
				local _ = nil
				local var2838, var2839 = protoModule.readBuffer(p142, var2828)
				var2828 = var2839
				var2827.display_name = buffer.tostring(var2838)
			elseif var2833 == 3 then
				local _ = nil
				local var2840, var2841 = protoModule.readBuffer(p142, var2828)
				var2828 = var2841
				var2827.content_type = buffer.tostring(var2840)
			else
				local _ = nil
				local var2842, var2843 = protoModule.readVarInt(p142, var2828)
				var2828 = var2843 + var2842
			end
		elseif var2829 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2844, var2845 = protoModule.readFixed32(p142, var2828)
			local _ = var2844
			var2828 = var2845
		elseif var2829 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2846, var2847 = protoModule.readFixed64(p142, var2828)
			local _ = var2846
			var2828 = var2847
		else
			error("Unsupported wire type: " .. var2829)
		end
	end
	return var2827
end

function t_72:jsonEncode() --[[ line: 16041 ]]
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

function t_72:jsonDecode() --[[ line: 16059 ]]
	-- upvalues: t_72 (ref)
	local var2849 = t_72.new()
	
	if self.sort_id ~= nil then
		var2849.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2849.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var2849.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2849.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var2849.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2849.content_type = self.contentType
	end
	return var2849
end

t_72.descriptor = {
	name = "SortSelectorInputData_SortOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
}
t.SortSelectorInputData_SortOption = t_72
typeRegistryModule.default:register(t.SortSelectorInputData_SortOption)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p143) --[[ line: 16105 ]]
	-- upvalues: t_73 (ref)
	return setmetatable({
		id = if p143 == nil or p143.id == nil then "" else p143.id,
		preview_rows = if p143 == nil or p143.preview_rows == nil then 0 else p143.preview_rows,
		widget_style = if p143 == nil or p143.widget_style == nil then nil else p143.widget_style,
		see_all_button = if p143 == nil or p143.see_all_button == nil then false else p143.see_all_button,
		information_popover_text = if p143 == nil or p143.information_popover_text == nil then "" else p143.information_popover_text
	}, t_73)
end

function t_73:encode() --[[ line: 16119 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2851 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2852, var2853 = protoModule.writeTag(buff, var2851, 1, protoModule.wireTypes.lengthDelimited)
		var2852, var2853 = protoModule.writeString(var2852, var2853, self.id)
		buff = var2852
		var2851 = var2853
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var2854, var2855 = protoModule.writeTag(buff, var2851, 4, protoModule.wireTypes.varint)
		var2854, var2855 = protoModule.writeVarInt(var2854, var2855, self.preview_rows)
		buff = var2854
		var2851 = var2855
	end
	if self.widget_style ~= nil then
		local var2856 = self.widget_style:encode()
		local var2857, var2858 = protoModule.writeTag(buff, var2851, 3, protoModule.wireTypes.lengthDelimited)
		var2857, var2858 = protoModule.writeBuffer(var2857, var2858, var2856, buffer.len(var2856))
		buff = var2857
		var2851 = var2858
	end
	if self.see_all_button then
		local var2859, var2860 = protoModule.writeTag(buff, var2851, 5, protoModule.wireTypes.varint)
		var2859, var2860 = protoModule.writeVarInt(var2859, var2860, if self.see_all_button then 1 else 0)
		buff = var2859
		var2851 = var2860
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2861, var2862 = protoModule.writeTag(buff, var2851, 6, protoModule.wireTypes.lengthDelimited)
		var2861, var2862 = protoModule.writeString(var2861, var2862, self.information_popover_text)
		buff = var2861
		var2851 = var2862
	end
	local buff_1 = buffer.create(var2851)
	buffer.copy(buff_1, 0, buff, 0, var2851)
	
	return buff_1
end

function t_73.decode(p144) --[[ line: 16154 ]]
	-- upvalues: t_73 (ref), protoModule (ref), t (ref)
	local var2864 = t_73.new()
	local var2865 = 0
	while var2865 < buffer.len(p144) do
		local _ = nil
		local var2866 = nil
		local var2867, var2868, var2869 = protoModule.readTag(p144, var2865)
		local var2870 = var2867
		var2866 = var2868
		var2865 = var2869
		
		if var2866 == protoModule.wireTypes.varint then
			if var2870 == 4 then
				local _ = nil
				local var2871, var2872 = protoModule.readVarIntI64(p144, var2865)
				var2865 = var2872
				var2864.preview_rows = var2871
			elseif var2870 == 5 then
				local _ = nil
				local var2873, var2874 = protoModule.readVarInt(p144, var2865)
				var2865 = var2874
				var2864.see_all_button = var2873 ~= 0
			else
				local _ = nil
				local var2875, var2876 = protoModule.readVarInt(p144, var2865)
				local _ = var2875
				var2865 = var2876
			end
		end
		if var2866 == protoModule.wireTypes.lengthDelimited then
			if var2870 == 1 then
				local _ = nil
				local var2877, var2878 = protoModule.readBuffer(p144, var2865)
				var2865 = var2878
				var2864.id = buffer.tostring(var2877)
			elseif var2870 == 3 then
				local _ = nil
				local var2879, var2880 = protoModule.readBuffer(p144, var2865)
				var2865 = var2880
				var2864.widget_style = t.WidgetStyleData.decode(var2879)
			elseif var2870 == 6 then
				local _ = nil
				local var2881, var2882 = protoModule.readBuffer(p144, var2865)
				var2865 = var2882
				var2864.information_popover_text = buffer.tostring(var2881)
			else
				local _ = nil
				local var2883, var2884 = protoModule.readVarInt(p144, var2865)
				var2865 = var2884 + var2883
			end
		elseif var2866 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2885, var2886 = protoModule.readFixed32(p144, var2865)
			local _ = var2885
			var2865 = var2886
		elseif var2866 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2887, var2888 = protoModule.readFixed64(p144, var2865)
			local _ = var2887
			var2865 = var2888
		else
			error("Unsupported wire type: " .. var2866)
		end
	end
	return var2864
end

function t_73:jsonEncode() --[[ line: 16217 ]]
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

function t_73:jsonDecode() --[[ line: 16243 ]]
	-- upvalues: t_73 (ref), t (ref)
	local var2890 = t_73.new()
	
	if self.id ~= nil then
		var2890.id = self.id
	end
	if self.preview_rows ~= nil then
		var2890.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var2890.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var2890.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2890.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2890.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2890.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2890.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2890.information_popover_text = self.informationPopoverText
	end
	return var2890
end

t_73.descriptor = {
	name = "UAMarketplaceCatalogItemGroupInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
}
t.UAMarketplaceCatalogItemGroupInputData = t_73
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemGroupInputData)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p145) --[[ line: 16301 ]]
	-- upvalues: t_74 (ref)
	return setmetatable({
		id = if p145 == nil or p145.id == nil then "" else p145.id,
		num_items_to_show = if p145 == nil or p145.num_items_to_show == nil then 0 else p145.num_items_to_show,
		widget_style = if p145 == nil or p145.widget_style == nil then nil else p145.widget_style,
		see_all_button = if p145 == nil or p145.see_all_button == nil then false else p145.see_all_button,
		information_popover_text = if p145 == nil or p145.information_popover_text == nil then "" else p145.information_popover_text
	}, t_74)
end

function t_74:encode() --[[ line: 16315 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2892 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2893, var2894 = protoModule.writeTag(buff, var2892, 1, protoModule.wireTypes.lengthDelimited)
		var2893, var2894 = protoModule.writeString(var2893, var2894, self.id)
		buff = var2893
		var2892 = var2894
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var2895, var2896 = protoModule.writeTag(buff, var2892, 5, protoModule.wireTypes.varint)
		var2895, var2896 = protoModule.writeVarInt(var2895, var2896, self.num_items_to_show)
		buff = var2895
		var2892 = var2896
	end
	if self.widget_style ~= nil then
		local var2897 = self.widget_style:encode()
		local var2898, var2899 = protoModule.writeTag(buff, var2892, 3, protoModule.wireTypes.lengthDelimited)
		var2898, var2899 = protoModule.writeBuffer(var2898, var2899, var2897, buffer.len(var2897))
		buff = var2898
		var2892 = var2899
	end
	if self.see_all_button then
		local var2900, var2901 = protoModule.writeTag(buff, var2892, 6, protoModule.wireTypes.varint)
		var2900, var2901 = protoModule.writeVarInt(var2900, var2901, if self.see_all_button then 1 else 0)
		buff = var2900
		var2892 = var2901
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2902, var2903 = protoModule.writeTag(buff, var2892, 7, protoModule.wireTypes.lengthDelimited)
		var2902, var2903 = protoModule.writeString(var2902, var2903, self.information_popover_text)
		buff = var2902
		var2892 = var2903
	end
	local buff_1 = buffer.create(var2892)
	buffer.copy(buff_1, 0, buff, 0, var2892)
	
	return buff_1
end

function t_74.decode(p146) --[[ line: 16352 ]]
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var2905 = t_74.new()
	local var2906 = 0
	while var2906 < buffer.len(p146) do
		local _ = nil
		local var2907 = nil
		local var2908, var2909, var2910 = protoModule.readTag(p146, var2906)
		local var2911 = var2908
		var2907 = var2909
		var2906 = var2910
		
		if var2907 == protoModule.wireTypes.varint then
			if var2911 == 5 then
				local _ = nil
				local var2912, var2913 = protoModule.readVarIntI64(p146, var2906)
				var2906 = var2913
				var2905.num_items_to_show = var2912
			elseif var2911 == 6 then
				local _ = nil
				local var2914, var2915 = protoModule.readVarInt(p146, var2906)
				var2906 = var2915
				var2905.see_all_button = var2914 ~= 0
			else
				local _ = nil
				local var2916, var2917 = protoModule.readVarInt(p146, var2906)
				local _ = var2916
				var2906 = var2917
			end
		end
		if var2907 == protoModule.wireTypes.lengthDelimited then
			if var2911 == 1 then
				local _ = nil
				local var2918, var2919 = protoModule.readBuffer(p146, var2906)
				var2906 = var2919
				var2905.id = buffer.tostring(var2918)
			elseif var2911 == 3 then
				local _ = nil
				local var2920, var2921 = protoModule.readBuffer(p146, var2906)
				var2906 = var2921
				var2905.widget_style = t.WidgetStyleData.decode(var2920)
			elseif var2911 == 7 then
				local _ = nil
				local var2922, var2923 = protoModule.readBuffer(p146, var2906)
				var2906 = var2923
				var2905.information_popover_text = buffer.tostring(var2922)
			else
				local _ = nil
				local var2924, var2925 = protoModule.readVarInt(p146, var2906)
				var2906 = var2925 + var2924
			end
		elseif var2907 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2926, var2927 = protoModule.readFixed32(p146, var2906)
			local _ = var2926
			var2906 = var2927
		elseif var2907 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2928, var2929 = protoModule.readFixed64(p146, var2906)
			local _ = var2928
			var2906 = var2929
		else
			error("Unsupported wire type: " .. var2907)
		end
	end
	return var2905
end

function t_74:jsonEncode() --[[ line: 16417 ]]
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

function t_74:jsonDecode() --[[ line: 16445 ]]
	-- upvalues: t_74 (ref), t (ref)
	local var2931 = t_74.new()
	
	if self.id ~= nil then
		var2931.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var2931.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var2931.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var2931.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2931.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2931.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2931.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2931.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2931.information_popover_text = self.informationPopoverText
	end
	return var2931
end

t_74.descriptor = {
	name = "UAMarketplaceCatalogItemCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
}
t.UAMarketplaceCatalogItemCarouselInputData = t_74
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemCarouselInputData)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p147) --[[ line: 16503 ]]
	-- upvalues: t_75 (ref)
	return setmetatable({
		background_layers = if p147 == nil or p147.background_layers == nil then {} else p147.background_layers
	}, t_75)
end

function t_75:encode() --[[ line: 16509 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2933 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2934 = v:encode()
			local var2935, var2936 = protoModule.writeTag(buff, var2933, 1, protoModule.wireTypes.lengthDelimited)
			var2935, var2936 = protoModule.writeBuffer(var2935, var2936, var2934, buffer.len(var2934))
			buff = var2935
			var2933 = var2936
		end
	end
	local buff_1 = buffer.create(var2933)
	buffer.copy(buff_1, 0, buff, 0, var2933)
	
	return buff_1
end

function t_75.decode(p148) --[[ line: 16526 ]]
	-- upvalues: t_75 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var2938 = t_75.new()
	local var2939 = 0
	while var2939 < buffer.len(p148) do
		local _ = nil
		local var2940 = nil
		local var2941, var2942, var2943 = protoModule.readTag(p148, var2939)
		local var2944 = var2941
		var2940 = var2942
		var2939 = var2943
		
		if var2940 == protoModule.wireTypes.varint then
			local _ = nil
			local var2945, var2946 = protoModule.readVarInt(p148, var2939)
			local _ = var2945
			var2939 = var2946
			continue
		end
		if var2940 == protoModule.wireTypes.lengthDelimited then
			if var2944 == 1 then
				local _ = nil
				local var2947, var2948 = protoModule.readBuffer(p148, var2939)
				var2939 = var2948
				table.insert(var2938.background_layers, backgroundLayerModule.BackgroundLayer.decode(var2947))
			else
				local _ = nil
				local var2949, var2950 = protoModule.readVarInt(p148, var2939)
				var2939 = var2950 + var2949
			end
		elseif var2940 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2951, var2952 = protoModule.readFixed32(p148, var2939)
			local _ = var2951
			var2939 = var2952
		elseif var2940 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2953, var2954 = protoModule.readFixed64(p148, var2939)
			local _ = var2953
			var2939 = var2954
		else
			error("Unsupported wire type: " .. var2940)
		end
	end
	return var2938
end

function t_75:jsonEncode() --[[ line: 16572 ]]
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

function t_75:jsonDecode() --[[ line: 16586 ]]
	-- upvalues: t_75 (ref), backgroundLayerModule (ref)
	local var2957 = t_75.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2957.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2957.background_layers = t
	end
	return var2957
end

t_75.descriptor = {
	name = "WidgetStyleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleData"
}
t.WidgetStyleData = t_75
typeRegistryModule.default:register(t.WidgetStyleData)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p149) --[[ line: 16630 ]]
	-- upvalues: t_76 (ref)
	return setmetatable({
		id = if p149 == nil or p149.id == nil then "" else p149.id,
		available_until = if p149 == nil or p149.available_until == nil then "" else p149.available_until,
		widget_style = if p149 == nil or p149.widget_style == nil then nil else p149.widget_style
	}, t_76)
end

function t_76:encode() --[[ line: 16640 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2961 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2962, var2963 = protoModule.writeTag(buff, var2961, 1, protoModule.wireTypes.lengthDelimited)
		var2962, var2963 = protoModule.writeString(var2962, var2963, self.id)
		buff = var2962
		var2961 = var2963
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var2964, var2965 = protoModule.writeTag(buff, var2961, 2, protoModule.wireTypes.lengthDelimited)
		var2964, var2965 = protoModule.writeString(var2964, var2965, self.available_until)
		buff = var2964
		var2961 = var2965
	end
	if self.widget_style ~= nil then
		local var2966 = self.widget_style:encode()
		local var2967, var2968 = protoModule.writeTag(buff, var2961, 3, protoModule.wireTypes.lengthDelimited)
		var2967, var2968 = protoModule.writeBuffer(var2967, var2968, var2966, buffer.len(var2966))
		buff = var2967
		var2961 = var2968
	end
	local buff_1 = buffer.create(var2961)
	buffer.copy(buff_1, 0, buff, 0, var2961)
	
	return buff_1
end

function t_76.decode(p150) --[[ line: 16665 ]]
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var2970 = t_76.new()
	local var2971 = 0
	while var2971 < buffer.len(p150) do
		local _ = nil
		local var2972 = nil
		local var2973, var2974, var2975 = protoModule.readTag(p150, var2971)
		local var2976 = var2973
		var2972 = var2974
		var2971 = var2975
		
		if var2972 == protoModule.wireTypes.varint then
			local _ = nil
			local var2977, var2978 = protoModule.readVarInt(p150, var2971)
			local _ = var2977
			var2971 = var2978
			continue
		end
		if var2972 == protoModule.wireTypes.lengthDelimited then
			if var2976 == 1 then
				local _ = nil
				local var2979, var2980 = protoModule.readBuffer(p150, var2971)
				var2971 = var2980
				var2970.id = buffer.tostring(var2979)
			elseif var2976 == 2 then
				local _ = nil
				local var2981, var2982 = protoModule.readBuffer(p150, var2971)
				var2971 = var2982
				var2970.available_until = buffer.tostring(var2981)
			elseif var2976 == 3 then
				local _ = nil
				local var2983, var2984 = protoModule.readBuffer(p150, var2971)
				var2971 = var2984
				var2970.widget_style = t.WidgetStyleData.decode(var2983)
			else
				local _ = nil
				local var2985, var2986 = protoModule.readVarInt(p150, var2971)
				var2971 = var2986 + var2985
			end
		elseif var2972 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2987, var2988 = protoModule.readFixed32(p150, var2971)
			local _ = var2987
			var2971 = var2988
		elseif var2972 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2989, var2990 = protoModule.readFixed64(p150, var2971)
			local _ = var2989
			var2971 = var2990
		else
			error("Unsupported wire type: " .. var2972)
		end
	end
	return var2970
end

function t_76:jsonEncode() --[[ line: 16718 ]]
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

function t_76:jsonDecode() --[[ line: 16736 ]]
	-- upvalues: t_76 (ref), t (ref)
	local var2992 = t_76.new()
	
	if self.id ~= nil then
		var2992.id = self.id
	end
	if self.available_until ~= nil then
		var2992.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var2992.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var2992.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2992.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var2992
end

t_76.descriptor = {
	name = "UAMarketplaceCatalogHeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogHeroUnitInputData"
}
t.UAMarketplaceCatalogHeroUnitInputData = t_76
typeRegistryModule.default:register(t.UAMarketplaceCatalogHeroUnitInputData)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p151) --[[ line: 16778 ]]
	-- upvalues: t_77 (ref)
	return setmetatable({
		entry_map = if p151 == nil or p151.entry_map == nil then {} else p151.entry_map,
		entry_order = if p151 == nil or p151.entry_order == nil then {} else p151.entry_order
	}, t_77)
end

function t_77:encode() --[[ line: 16787 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2994 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2995, var2996 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2995, var2996 = protoModule.writeString(var2995, var2996, i)
			local var2997 = v:encode()
			var2996, var2998 = protoModule.writeTag(var2995, var2996, 2, protoModule.wireTypes.lengthDelimited)
			var2996, var2998 = protoModule.writeBuffer(var2996, var2998, var2997, buffer.len(var2997))
			local var2999 = var2996
			local var3000 = var2998
			local var3001, var3002 = protoModule.writeTag(buff, var2994, 1, protoModule.wireTypes.lengthDelimited)
			var3001, var3002 = protoModule.writeBuffer(var3001, var3002, var2999, var3000)
			buff = var3001
			var2994 = var3002
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3003, var3004 = protoModule.writeTag(buff, var2994, 2, protoModule.wireTypes.lengthDelimited)
			var3003, var3004 = protoModule.writeString(var3003, var3004, v)
			buff = var3003
			var2994 = var3004
		end
	end
	local buff_1 = buffer.create(var2994)
	buffer.copy(buff_1, 0, buff, 0, var2994)
	
	return buff_1
end

function t_77.decode(p152) --[[ line: 16817 ]]
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var3006 = t_77.new()
	local var3007 = 0
	while var3007 < buffer.len(p152) do
		local _ = nil
		local var3008 = nil
		local var3009, var3010, var3011 = protoModule.readTag(p152, var3007)
		local var3012 = var3009
		var3008 = var3010
		var3007 = var3011
		
		if var3008 == protoModule.wireTypes.varint then
			local _ = nil
			local var3013, var3014 = protoModule.readVarInt(p152, var3007)
			local _ = var3013
			var3007 = var3014
			continue
		end
		if var3008 == protoModule.wireTypes.lengthDelimited then
			if var3012 == 1 then
				local _ = nil
				local var3015, var3016 = protoModule.readBuffer(p152, var3007)
				var3007 = var3016
				var3015 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var3015)
				var3006.entry_map[var3015.key or ""] = var3015.value or t.FeedEntry.new()
			elseif var3012 == 2 then
				local _ = nil
				local var3017, var3018 = protoModule.readBuffer(p152, var3007)
				var3007 = var3018
				table.insert(var3006.entry_order, buffer.tostring(var3017))
			else
				local _ = nil
				local var3019, var3020 = protoModule.readVarInt(p152, var3007)
				var3007 = var3020 + var3019
			end
		elseif var3008 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3021, var3022 = protoModule.readFixed32(p152, var3007)
			local _ = var3021
			var3007 = var3022
		elseif var3008 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3023, var3024 = protoModule.readFixed64(p152, var3007)
			local _ = var3023
			var3007 = var3024
		else
			error("Unsupported wire type: " .. var3008)
		end
	end
	return var3006
end

function t_77:jsonEncode() --[[ line: 16872 ]]
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

function t_77:jsonDecode() --[[ line: 16894 ]]
	-- upvalues: t_77 (ref), t (ref)
	local var3028 = t_77.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3028.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3028.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3028.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3028.entry_order = t_1
	end
	return var3028
end

t_77.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
}
t.UAMarketplaceCatalogFeedInputData = t_77
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p153) --[[ line: 16952 ]]
	-- upvalues: t_78 (ref)
	return setmetatable({
		key = if p153 == nil or p153.key == nil then "" else p153.key,
		value = if p153 == nil or p153.value == nil then nil else p153.value
	}, t_78)
end

function t_78:encode() --[[ line: 16961 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3034 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3035, var3036 = protoModule.writeTag(buff, var3034, 1, protoModule.wireTypes.lengthDelimited)
		var3035, var3036 = protoModule.writeString(var3035, var3036, self.key)
		buff = var3035
		var3034 = var3036
	end
	if self.value ~= nil then
		local var3037 = self.value:encode()
		local var3038, var3039 = protoModule.writeTag(buff, var3034, 2, protoModule.wireTypes.lengthDelimited)
		var3038, var3039 = protoModule.writeBuffer(var3038, var3039, var3037, buffer.len(var3037))
		buff = var3038
		var3034 = var3039
	end
	local buff_1 = buffer.create(var3034)
	buffer.copy(buff_1, 0, buff, 0, var3034)
	
	return buff_1
end

function t_78.decode(p154) --[[ line: 16983 ]]
	-- upvalues: t_78 (ref), protoModule (ref), t (ref)
	local var3041 = t_78.new()
	local var3042 = 0
	while var3042 < buffer.len(p154) do
		local _ = nil
		local var3043 = nil
		local var3044, var3045, var3046 = protoModule.readTag(p154, var3042)
		local var3047 = var3044
		var3043 = var3045
		var3042 = var3046
		
		if var3043 == protoModule.wireTypes.varint then
			local _ = nil
			local var3048, var3049 = protoModule.readVarInt(p154, var3042)
			local _ = var3048
			var3042 = var3049
			continue
		end
		if var3043 == protoModule.wireTypes.lengthDelimited then
			if var3047 == 1 then
				local _ = nil
				local var3050, var3051 = protoModule.readBuffer(p154, var3042)
				var3042 = var3051
				var3041.key = buffer.tostring(var3050)
			elseif var3047 == 2 then
				local _ = nil
				local var3052, var3053 = protoModule.readBuffer(p154, var3042)
				var3042 = var3053
				var3041.value = t.FeedEntry.decode(var3052)
			else
				local _ = nil
				local var3054, var3055 = protoModule.readVarInt(p154, var3042)
				var3042 = var3055 + var3054
			end
		elseif var3043 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3056, var3057 = protoModule.readFixed32(p154, var3042)
			local _ = var3056
			var3042 = var3057
		elseif var3043 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3058, var3059 = protoModule.readFixed64(p154, var3042)
			local _ = var3058
			var3042 = var3059
		else
			error("Unsupported wire type: " .. var3043)
		end
	end
	return var3041
end

function t_78:jsonEncode() --[[ line: 17033 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_78:jsonDecode() --[[ line: 17049 ]]
	-- upvalues: t_78 (ref), t (ref)
	local var3061 = t_78.new()
	
	if self.key ~= nil then
		var3061.key = self.key
	end
	if self.value ~= nil then
		var3061.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3061
end

t_78.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.UAMarketplaceCatalogFeedInputData_EntryMapEntry = t_78
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData_EntryMapEntry)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p155) --[[ line: 17080 ]]
	-- upvalues: t_79 (ref)
	return setmetatable({
		marketplace_catalog_category_items = if p155 == nil or p155.marketplace_catalog_category_items == nil then {} else p155.marketplace_catalog_category_items,
		active_category_id = if p155 == nil or p155.active_category_id == nil then "" else p155.active_category_id,
		active_tooltip_idx = if p155 == nil or p155.active_tooltip_idx == nil then 0 else p155.active_tooltip_idx
	}, t_79)
end

function t_79:encode() --[[ line: 17093 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3063 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var3064 = v:encode()
			local var3065, var3066 = protoModule.writeTag(buff, var3063, 1, protoModule.wireTypes.lengthDelimited)
			var3065, var3066 = protoModule.writeBuffer(var3065, var3066, var3064, buffer.len(var3064))
			buff = var3065
			var3063 = var3066
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var3067, var3068 = protoModule.writeTag(buff, var3063, 2, protoModule.wireTypes.lengthDelimited)
		var3067, var3068 = protoModule.writeString(var3067, var3068, self.active_category_id)
		buff = var3067
		var3063 = var3068
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var3069, var3070 = protoModule.writeTag(buff, var3063, 3, protoModule.wireTypes.varint)
		var3069, var3070 = protoModule.writeVarInt(var3069, var3070, self.active_tooltip_idx)
		buff = var3069
		var3063 = var3070
	end
	local buff_1 = buffer.create(var3063)
	buffer.copy(buff_1, 0, buff, 0, var3063)
	
	return buff_1
end

function t_79.decode(p156) --[[ line: 17122 ]]
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var3072 = t_79.new()
	local var3073 = 0
	while var3073 < buffer.len(p156) do
		local _ = nil
		local var3074 = nil
		local var3075, var3076, var3077 = protoModule.readTag(p156, var3073)
		local var3078 = var3075
		var3074 = var3076
		var3073 = var3077
		
		if var3074 == protoModule.wireTypes.varint then
			if var3078 == 3 then
				local _ = nil
				local var3079, var3080 = protoModule.readVarIntI64(p156, var3073)
				var3073 = var3080
				var3072.active_tooltip_idx = var3079
			else
				local _ = nil
				local var3081, var3082 = protoModule.readVarInt(p156, var3073)
				local _ = var3081
				var3073 = var3082
			end
		end
		if var3074 == protoModule.wireTypes.lengthDelimited then
			if var3078 == 1 then
				local _ = nil
				local var3083, var3084 = protoModule.readBuffer(p156, var3073)
				var3073 = var3084
				table.insert(var3072.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var3083))
			elseif var3078 == 2 then
				local _ = nil
				local var3085, var3086 = protoModule.readBuffer(p156, var3073)
				var3073 = var3086
				var3072.active_category_id = buffer.tostring(var3085)
			else
				local _ = nil
				local var3087, var3088 = protoModule.readVarInt(p156, var3073)
				var3073 = var3088 + var3087
			end
		elseif var3074 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3089, var3090 = protoModule.readFixed32(p156, var3073)
			local _ = var3089
			var3073 = var3090
		elseif var3074 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3091, var3092 = protoModule.readFixed64(p156, var3073)
			local _ = var3091
			var3073 = var3092
		else
			error("Unsupported wire type: " .. var3074)
		end
	end
	return var3072
end

function t_79:jsonEncode() --[[ line: 17180 ]]
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

function t_79:jsonDecode() --[[ line: 17204 ]]
	-- upvalues: t_79 (ref), t (ref)
	local var3095 = t_79.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var3095.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var3095.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var3095.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var3095.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var3095.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var3095.active_tooltip_idx = self.activeTooltipIdx
	end
	return var3095
end

t_79.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
}
t.UAMarketplaceCatalogCategoryMenuInputData = t_79
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p157) --[[ line: 17267 ]]
	-- upvalues: t_80 (ref)
	return setmetatable({
		marketplace_catalog_category_item_id = if p157 == nil or p157.marketplace_catalog_category_item_id == nil then "" else p157.marketplace_catalog_category_item_id
	}, t_80)
end

function t_80:encode() --[[ line: 17281 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3099 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var3100, var3101 = protoModule.writeTag(buff, var3099, 1, protoModule.wireTypes.lengthDelimited)
		var3100, var3101 = protoModule.writeString(var3100, var3101, self.marketplace_catalog_category_item_id)
		buff = var3100
		var3099 = var3101
	end
	local buff_1 = buffer.create(var3099)
	buffer.copy(buff_1, 0, buff, 0, var3099)
	
	return buff_1
end

function t_80.decode(p158) --[[ line: 17297 ]]
	-- upvalues: t_80 (ref), protoModule (ref)
	local var3103 = t_80.new()
	local var3104 = 0
	while var3104 < buffer.len(p158) do
		local _ = nil
		local var3105 = nil
		local var3106, var3107, var3108 = protoModule.readTag(p158, var3104)
		local var3109 = var3106
		var3105 = var3107
		var3104 = var3108
		
		if var3105 == protoModule.wireTypes.varint then
			local _ = nil
			local var3110, var3111 = protoModule.readVarInt(p158, var3104)
			local _ = var3110
			var3104 = var3111
			continue
		end
		if var3105 == protoModule.wireTypes.lengthDelimited then
			if var3109 == 1 then
				local _ = nil
				local var3112, var3113 = protoModule.readBuffer(p158, var3104)
				var3104 = var3113
				var3103.marketplace_catalog_category_item_id = buffer.tostring(var3112)
			else
				local _ = nil
				local var3114, var3115 = protoModule.readVarInt(p158, var3104)
				var3104 = var3115 + var3114
			end
		elseif var3105 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3116, var3117 = protoModule.readFixed32(p158, var3104)
			local _ = var3116
			var3104 = var3117
		elseif var3105 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3118, var3119 = protoModule.readFixed64(p158, var3104)
			local _ = var3118
			var3104 = var3119
		else
			error("Unsupported wire type: " .. var3105)
		end
	end
	return var3103
end

function t_80:jsonEncode() --[[ line: 17342 ]]
	local t = {}
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		t.marketplaceCatalogCategoryItemId = self.marketplace_catalog_category_item_id
	end
	return t
end

function t_80:jsonDecode() --[[ line: 17354 ]]
	-- upvalues: t_80 (ref)
	local var3121 = t_80.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var3121.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var3121.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var3121
end

t_80.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
}
t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t_80
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p159) --[[ line: 17387 ]]
	-- upvalues: t_81 (ref)
	return setmetatable({
		entry_map = if p159 == nil or p159.entry_map == nil then {} else p159.entry_map,
		entry_order = if p159 == nil or p159.entry_order == nil then {} else p159.entry_order,
		content_pools = if p159 == nil or p159.content_pools == nil then {} else p159.content_pools
	}, t_81)
end

function t_81:encode() --[[ line: 17397 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3123 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3124, var3125 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3124, var3125 = protoModule.writeString(var3124, var3125, i)
			local var3126 = v:encode()
			var3125, var3127 = protoModule.writeTag(var3124, var3125, 2, protoModule.wireTypes.lengthDelimited)
			var3125, var3127 = protoModule.writeBuffer(var3125, var3127, var3126, buffer.len(var3126))
			local var3128 = var3125
			local var3129 = var3127
			local var3130, var3131 = protoModule.writeTag(buff, var3123, 1, protoModule.wireTypes.lengthDelimited)
			var3130, var3131 = protoModule.writeBuffer(var3130, var3131, var3128, var3129)
			buff = var3130
			var3123 = var3131
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3132, var3133 = protoModule.writeTag(buff, var3123, 2, protoModule.wireTypes.lengthDelimited)
			var3132, var3133 = protoModule.writeString(var3132, var3133, v)
			buff = var3132
			var3123 = var3133
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var3134, var3135 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3134, var3135 = protoModule.writeString(var3134, var3135, i)
			local var3136 = v:encode()
			var3135, var3137 = protoModule.writeTag(var3134, var3135, 2, protoModule.wireTypes.lengthDelimited)
			var3135, var3137 = protoModule.writeBuffer(var3135, var3137, var3136, buffer.len(var3136))
			local var3138 = var3135
			local var3139 = var3137
			local var3140, var3141 = protoModule.writeTag(buff, var3123, 3, protoModule.wireTypes.lengthDelimited)
			var3140, var3141 = protoModule.writeBuffer(var3140, var3141, var3138, var3139)
			buff = var3140
			var3123 = var3141
		end
	end
	local buff_1 = buffer.create(var3123)
	buffer.copy(buff_1, 0, buff, 0, var3123)
	
	return buff_1
end

function t_81.decode(p160) --[[ line: 17441 ]]
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var3143 = t_81.new()
	local var3144 = 0
	while var3144 < buffer.len(p160) do
		local _ = nil
		local var3145 = nil
		local var3146, var3147, var3148 = protoModule.readTag(p160, var3144)
		local var3149 = var3146
		var3145 = var3147
		var3144 = var3148
		
		if var3145 == protoModule.wireTypes.varint then
			local _ = nil
			local var3150, var3151 = protoModule.readVarInt(p160, var3144)
			local _ = var3150
			var3144 = var3151
			continue
		end
		if var3145 == protoModule.wireTypes.lengthDelimited then
			if var3149 == 1 then
				local _ = nil
				local var3152, var3153 = protoModule.readBuffer(p160, var3144)
				var3144 = var3153
				var3152 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var3152)
				var3143.entry_map[var3152.key or ""] = var3152.value or t.FeedEntry.new()
			elseif var3149 == 2 then
				local _ = nil
				local var3154, var3155 = protoModule.readBuffer(p160, var3144)
				var3144 = var3155
				table.insert(var3143.entry_order, buffer.tostring(var3154))
			elseif var3149 == 3 then
				local _ = nil
				local var3156, var3157 = protoModule.readBuffer(p160, var3144)
				var3144 = var3157
				var3156 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var3156)
				var3143.content_pools[var3156.key or ""] = var3156.value or t.ContentPool.new()
			else
				local _ = nil
				local var3158, var3159 = protoModule.readVarInt(p160, var3144)
				var3144 = var3159 + var3158
			end
		elseif var3145 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3160, var3161 = protoModule.readFixed32(p160, var3144)
			local _ = var3160
			var3144 = var3161
		elseif var3145 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3162, var3163 = protoModule.readFixed64(p160, var3144)
			local _ = var3162
			var3144 = var3163
		else
			error("Unsupported wire type: " .. var3145)
		end
	end
	return var3143
end

function t_81:jsonEncode() --[[ line: 17508 ]]
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
	return t
end

function t_81:jsonDecode() --[[ line: 17538 ]]
	-- upvalues: t_81 (ref), t (ref)
	local var3168 = t_81.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3168.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3168.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3168.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3168.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3168.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3168.content_pools = t_1
	end
	return var3168
end

t_81.descriptor = {
	name = "SearchResultsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
}
t.SearchResultsFeedInputData = t_81
typeRegistryModule.default:register(t.SearchResultsFeedInputData)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p161) --[[ line: 17612 ]]
	-- upvalues: t_82 (ref)
	return setmetatable({
		key = if p161 == nil or p161.key == nil then "" else p161.key,
		value = if p161 == nil or p161.value == nil then nil else p161.value
	}, t_82)
end

function t_82:encode() --[[ line: 17621 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3176 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3177, var3178 = protoModule.writeTag(buff, var3176, 1, protoModule.wireTypes.lengthDelimited)
		var3177, var3178 = protoModule.writeString(var3177, var3178, self.key)
		buff = var3177
		var3176 = var3178
	end
	if self.value ~= nil then
		local var3179 = self.value:encode()
		local var3180, var3181 = protoModule.writeTag(buff, var3176, 2, protoModule.wireTypes.lengthDelimited)
		var3180, var3181 = protoModule.writeBuffer(var3180, var3181, var3179, buffer.len(var3179))
		buff = var3180
		var3176 = var3181
	end
	local buff_1 = buffer.create(var3176)
	buffer.copy(buff_1, 0, buff, 0, var3176)
	
	return buff_1
end

function t_82.decode(p162) --[[ line: 17643 ]]
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var3183 = t_82.new()
	local var3184 = 0
	while var3184 < buffer.len(p162) do
		local _ = nil
		local var3185 = nil
		local var3186, var3187, var3188 = protoModule.readTag(p162, var3184)
		local var3189 = var3186
		var3185 = var3187
		var3184 = var3188
		
		if var3185 == protoModule.wireTypes.varint then
			local _ = nil
			local var3190, var3191 = protoModule.readVarInt(p162, var3184)
			local _ = var3190
			var3184 = var3191
			continue
		end
		if var3185 == protoModule.wireTypes.lengthDelimited then
			if var3189 == 1 then
				local _ = nil
				local var3192, var3193 = protoModule.readBuffer(p162, var3184)
				var3184 = var3193
				var3183.key = buffer.tostring(var3192)
			elseif var3189 == 2 then
				local _ = nil
				local var3194, var3195 = protoModule.readBuffer(p162, var3184)
				var3184 = var3195
				var3183.value = t.FeedEntry.decode(var3194)
			else
				local _ = nil
				local var3196, var3197 = protoModule.readVarInt(p162, var3184)
				var3184 = var3197 + var3196
			end
		elseif var3185 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3198, var3199 = protoModule.readFixed32(p162, var3184)
			local _ = var3198
			var3184 = var3199
		elseif var3185 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3200, var3201 = protoModule.readFixed64(p162, var3184)
			local _ = var3200
			var3184 = var3201
		else
			error("Unsupported wire type: " .. var3185)
		end
	end
	return var3183
end

function t_82:jsonEncode() --[[ line: 17693 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_82:jsonDecode() --[[ line: 17709 ]]
	-- upvalues: t_82 (ref), t (ref)
	local var3203 = t_82.new()
	
	if self.key ~= nil then
		var3203.key = self.key
	end
	if self.value ~= nil then
		var3203.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3203
end

t_82.descriptor = {
	name = "SearchResultsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.SearchResultsFeedInputData_EntryMapEntry = t_82
typeRegistryModule.default:register(t.SearchResultsFeedInputData_EntryMapEntry)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p163) --[[ line: 17739 ]]
	-- upvalues: t_83 (ref)
	return setmetatable({
		key = if p163 == nil or p163.key == nil then "" else p163.key,
		value = if p163 == nil or p163.value == nil then nil else p163.value
	}, t_83)
end

function t_83:encode() --[[ line: 17748 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3205 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3206, var3207 = protoModule.writeTag(buff, var3205, 1, protoModule.wireTypes.lengthDelimited)
		var3206, var3207 = protoModule.writeString(var3206, var3207, self.key)
		buff = var3206
		var3205 = var3207
	end
	if self.value ~= nil then
		local var3208 = self.value:encode()
		local var3209, var3210 = protoModule.writeTag(buff, var3205, 2, protoModule.wireTypes.lengthDelimited)
		var3209, var3210 = protoModule.writeBuffer(var3209, var3210, var3208, buffer.len(var3208))
		buff = var3209
		var3205 = var3210
	end
	local buff_1 = buffer.create(var3205)
	buffer.copy(buff_1, 0, buff, 0, var3205)
	
	return buff_1
end

function t_83.decode(p164) --[[ line: 17770 ]]
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var3212 = t_83.new()
	local var3213 = 0
	while var3213 < buffer.len(p164) do
		local _ = nil
		local var3214 = nil
		local var3215, var3216, var3217 = protoModule.readTag(p164, var3213)
		local var3218 = var3215
		var3214 = var3216
		var3213 = var3217
		
		if var3214 == protoModule.wireTypes.varint then
			local _ = nil
			local var3219, var3220 = protoModule.readVarInt(p164, var3213)
			local _ = var3219
			var3213 = var3220
			continue
		end
		if var3214 == protoModule.wireTypes.lengthDelimited then
			if var3218 == 1 then
				local _ = nil
				local var3221, var3222 = protoModule.readBuffer(p164, var3213)
				var3213 = var3222
				var3212.key = buffer.tostring(var3221)
			elseif var3218 == 2 then
				local _ = nil
				local var3223, var3224 = protoModule.readBuffer(p164, var3213)
				var3213 = var3224
				var3212.value = t.ContentPool.decode(var3223)
			else
				local _ = nil
				local var3225, var3226 = protoModule.readVarInt(p164, var3213)
				var3213 = var3226 + var3225
			end
		elseif var3214 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3227, var3228 = protoModule.readFixed32(p164, var3213)
			local _ = var3227
			var3213 = var3228
		elseif var3214 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3229, var3230 = protoModule.readFixed64(p164, var3213)
			local _ = var3229
			var3213 = var3230
		else
			error("Unsupported wire type: " .. var3214)
		end
	end
	return var3212
end

function t_83:jsonEncode() --[[ line: 17820 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_83:jsonDecode() --[[ line: 17836 ]]
	-- upvalues: t_83 (ref), t (ref)
	local var3232 = t_83.new()
	
	if self.key ~= nil then
		var3232.key = self.key
	end
	if self.value ~= nil then
		var3232.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3232
end

t_83.descriptor = {
	name = "SearchResultsFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.SearchResultsFeedInputData_ContentPoolsEntry = t_83
typeRegistryModule.default:register(t.SearchResultsFeedInputData_ContentPoolsEntry)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p165) --[[ line: 17866 ]]
	-- upvalues: t_84 (ref)
	return setmetatable({
		universe_id = if p165 == nil or p165.universe_id == nil then "" else p165.universe_id,
		is_content_locked = if p165 == nil or p165.is_content_locked == nil then false else p165.is_content_locked
	}, t_84)
end

function t_84:encode() --[[ line: 17875 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3234 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3235, var3236 = protoModule.writeTag(buff, var3234, 1, protoModule.wireTypes.lengthDelimited)
		var3235, var3236 = protoModule.writeString(var3235, var3236, self.universe_id)
		buff = var3235
		var3234 = var3236
	end
	if self.is_content_locked then
		local var3237, var3238 = protoModule.writeTag(buff, var3234, 2, protoModule.wireTypes.varint)
		var3237, var3238 = protoModule.writeVarInt(var3237, var3238, if self.is_content_locked then 1 else 0)
		buff = var3237
		var3234 = var3238
	end
	local buff_1 = buffer.create(var3234)
	buffer.copy(buff_1, 0, buff, 0, var3234)
	
	return buff_1
end

function t_84.decode(p166) --[[ line: 17894 ]]
	-- upvalues: t_84 (ref), protoModule (ref)
	local var3240 = t_84.new()
	local var3241 = 0
	while var3241 < buffer.len(p166) do
		local _ = nil
		local var3242 = nil
		local var3243, var3244, var3245 = protoModule.readTag(p166, var3241)
		local var3246 = var3243
		var3242 = var3244
		var3241 = var3245
		
		if var3242 == protoModule.wireTypes.varint then
			if var3246 == 2 then
				local _ = nil
				local var3247, var3248 = protoModule.readVarInt(p166, var3241)
				var3241 = var3248
				var3240.is_content_locked = var3247 ~= 0
			else
				local _ = nil
				local var3249, var3250 = protoModule.readVarInt(p166, var3241)
				local _ = var3249
				var3241 = var3250
			end
		end
		if var3242 == protoModule.wireTypes.lengthDelimited then
			if var3246 == 1 then
				local _ = nil
				local var3251, var3252 = protoModule.readBuffer(p166, var3241)
				var3241 = var3252
				var3240.universe_id = buffer.tostring(var3251)
			else
				local _ = nil
				local var3253, var3254 = protoModule.readVarInt(p166, var3241)
				var3241 = var3254 + var3253
			end
		elseif var3242 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3255, var3256 = protoModule.readFixed32(p166, var3241)
			local _ = var3255
			var3241 = var3256
		elseif var3242 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3257, var3258 = protoModule.readFixed64(p166, var3241)
			local _ = var3257
			var3241 = var3258
		else
			error("Unsupported wire type: " .. var3242)
		end
	end
	return var3240
end

function t_84:jsonEncode() --[[ line: 17942 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	return t
end

function t_84:jsonDecode() --[[ line: 17956 ]]
	-- upvalues: t_84 (ref)
	local var3260 = t_84.new()
	
	if self.universe_id ~= nil then
		var3260.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3260.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var3260.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var3260.is_content_locked = self.isContentLocked
	end
	return var3260
end

t_84.descriptor = {
	name = "ExperienceEmphasisTileInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceEmphasisTileInputData"
}
t.ExperienceEmphasisTileInputData = t_84
typeRegistryModule.default:register(t.ExperienceEmphasisTileInputData)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p167) --[[ line: 17992 ]]
	-- upvalues: t_85 (ref)
	return setmetatable({
		overview_rich_text = if p167 == nil or p167.overview_rich_text == nil then "" else p167.overview_rich_text,
		result_entry = if p167 == nil or p167.result_entry == nil then nil else p167.result_entry,
		follow_up_queries = if p167 == nil or p167.follow_up_queries == nil then {} else p167.follow_up_queries,
		show_loading = if p167 == nil or p167.show_loading == nil then false else p167.show_loading,
		title = if p167 == nil or p167.title == nil then "" else p167.title,
		search_query = if p167 == nil or p167.search_query == nil then "" else p167.search_query,
		search_session_id = if p167 == nil or p167.search_session_id == nil then "" else p167.search_session_id,
		universe_ids = if p167 == nil or p167.universe_ids == nil then "" else p167.universe_ids
	}, t_85)
end

function t_85:encode() --[[ line: 18007 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3262 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var3263, var3264 = protoModule.writeTag(buff, var3262, 1, protoModule.wireTypes.lengthDelimited)
		var3263, var3264 = protoModule.writeString(var3263, var3264, self.overview_rich_text)
		buff = var3263
		var3262 = var3264
	end
	if self.result_entry ~= nil then
		local var3265 = self.result_entry:encode()
		local var3266, var3267 = protoModule.writeTag(buff, var3262, 2, protoModule.wireTypes.lengthDelimited)
		var3266, var3267 = protoModule.writeBuffer(var3266, var3267, var3265, buffer.len(var3265))
		buff = var3266
		var3262 = var3267
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var3268, var3269 = protoModule.writeTag(buff, var3262, 3, protoModule.wireTypes.lengthDelimited)
			var3268, var3269 = protoModule.writeString(var3268, var3269, v)
			buff = var3268
			var3262 = var3269
		end
	end
	if self.show_loading then
		local var3270, var3271 = protoModule.writeTag(buff, var3262, 4, protoModule.wireTypes.varint)
		var3270, var3271 = protoModule.writeVarInt(var3270, var3271, if self.show_loading then 1 else 0)
		buff = var3270
		var3262 = var3271
	end
	if self.title ~= nil and self.title ~= "" then
		local var3272, var3273 = protoModule.writeTag(buff, var3262, 5, protoModule.wireTypes.lengthDelimited)
		var3272, var3273 = protoModule.writeString(var3272, var3273, self.title)
		buff = var3272
		var3262 = var3273
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var3274, var3275 = protoModule.writeTag(buff, var3262, 6, protoModule.wireTypes.lengthDelimited)
		var3274, var3275 = protoModule.writeString(var3274, var3275, self.search_query)
		buff = var3274
		var3262 = var3275
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var3276, var3277 = protoModule.writeTag(buff, var3262, 7, protoModule.wireTypes.lengthDelimited)
		var3276, var3277 = protoModule.writeString(var3276, var3277, self.search_session_id)
		buff = var3276
		var3262 = var3277
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var3278, var3279 = protoModule.writeTag(buff, var3262, 8, protoModule.wireTypes.lengthDelimited)
		var3278, var3279 = protoModule.writeString(var3278, var3279, self.universe_ids)
		buff = var3278
		var3262 = var3279
	end
	local buff_1 = buffer.create(var3262)
	buffer.copy(buff_1, 0, buff, 0, var3262)
	
	return buff_1
end

function t_85.decode(p168) --[[ line: 18059 ]]
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var3281 = t_85.new()
	local var3282 = 0
	while var3282 < buffer.len(p168) do
		local _ = nil
		local var3283 = nil
		local var3284, var3285, var3286 = protoModule.readTag(p168, var3282)
		local var3287 = var3284
		var3283 = var3285
		var3282 = var3286
		
		if var3283 == protoModule.wireTypes.varint then
			if var3287 == 4 then
				local _ = nil
				local var3288, var3289 = protoModule.readVarInt(p168, var3282)
				var3282 = var3289
				var3281.show_loading = var3288 ~= 0
			else
				local _ = nil
				local var3290, var3291 = protoModule.readVarInt(p168, var3282)
				local _ = var3290
				var3282 = var3291
			end
		end
		if var3283 == protoModule.wireTypes.lengthDelimited then
			if var3287 == 1 then
				local _ = nil
				local var3292, var3293 = protoModule.readBuffer(p168, var3282)
				var3282 = var3293
				var3281.overview_rich_text = buffer.tostring(var3292)
			elseif var3287 == 2 then
				local _ = nil
				local var3294, var3295 = protoModule.readBuffer(p168, var3282)
				var3282 = var3295
				var3281.result_entry = t.FeedEntry.decode(var3294)
			elseif var3287 == 3 then
				local _ = nil
				local var3296, var3297 = protoModule.readBuffer(p168, var3282)
				var3282 = var3297
				table.insert(var3281.follow_up_queries, buffer.tostring(var3296))
			elseif var3287 == 5 then
				local _ = nil
				local var3298, var3299 = protoModule.readBuffer(p168, var3282)
				var3282 = var3299
				var3281.title = buffer.tostring(var3298)
			elseif var3287 == 6 then
				local _ = nil
				local var3300, var3301 = protoModule.readBuffer(p168, var3282)
				var3282 = var3301
				var3281.search_query = buffer.tostring(var3300)
			elseif var3287 == 7 then
				local _ = nil
				local var3302, var3303 = protoModule.readBuffer(p168, var3282)
				var3282 = var3303
				var3281.search_session_id = buffer.tostring(var3302)
			elseif var3287 == 8 then
				local _ = nil
				local var3304, var3305 = protoModule.readBuffer(p168, var3282)
				var3282 = var3305
				var3281.universe_ids = buffer.tostring(var3304)
			else
				local _ = nil
				local var3306, var3307 = protoModule.readVarInt(p168, var3282)
				var3282 = var3307 + var3306
			end
		elseif var3283 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3308, var3309 = protoModule.readFixed32(p168, var3282)
			local _ = var3308
			var3282 = var3309
		elseif var3283 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3310, var3311 = protoModule.readFixed64(p168, var3282)
			local _ = var3310
			var3282 = var3311
		else
			error("Unsupported wire type: " .. var3283)
		end
	end
	return var3281
end

function t_85:jsonEncode() --[[ line: 18137 ]]
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
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		t.searchSessionId = self.search_session_id
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		t.universeIds = self.universe_ids
	end
	return t
end

function t_85:jsonDecode() --[[ line: 18179 ]]
	-- upvalues: t_85 (ref), t (ref)
	local var3314 = t_85.new()
	
	if self.overview_rich_text ~= nil then
		var3314.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var3314.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var3314.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var3314.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var3314.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var3314.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var3314.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var3314.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var3314.title = self.title
	end
	if self.search_query ~= nil then
		var3314.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var3314.search_query = self.searchQuery
	end
	if self.search_session_id ~= nil then
		var3314.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var3314.search_session_id = self.searchSessionId
	end
	if self.universe_ids ~= nil then
		var3314.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var3314.universe_ids = self.universeIds
	end
	return var3314
end

t_85.descriptor = {
	name = "PowerSearchAIOverviewInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PowerSearchAIOverviewInputData"
}
t.PowerSearchAIOverviewInputData = t_85
typeRegistryModule.default:register(t.PowerSearchAIOverviewInputData)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p169) --[[ line: 18269 ]]
	-- upvalues: t_86 (ref)
	return setmetatable({
		title = if p169 == nil or p169.title == nil then "" else p169.title,
		user_items = if p169 == nil or p169.user_items == nil then {} else p169.user_items,
		max_visible_rows = if p169 == nil or p169.max_visible_rows == nil then 0 else p169.max_visible_rows
	}, t_86)
end

function t_86:encode() --[[ line: 18277 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3318 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3319, var3320 = protoModule.writeTag(buff, var3318, 1, protoModule.wireTypes.lengthDelimited)
		var3319, var3320 = protoModule.writeString(var3319, var3320, self.title)
		buff = var3319
		var3318 = var3320
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var3321 = v:encode()
			local var3322, var3323 = protoModule.writeTag(buff, var3318, 2, protoModule.wireTypes.lengthDelimited)
			var3322, var3323 = protoModule.writeBuffer(var3322, var3323, var3321, buffer.len(var3321))
			buff = var3322
			var3318 = var3323
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var3324, var3325 = protoModule.writeTag(buff, var3318, 3, protoModule.wireTypes.varint)
		var3324, var3325 = protoModule.writeVarInt(var3324, var3325, self.max_visible_rows)
		buff = var3324
		var3318 = var3325
	end
	local buff_1 = buffer.create(var3318)
	buffer.copy(buff_1, 0, buff, 0, var3318)
	
	return buff_1
end

function t_86.decode(p170) --[[ line: 18304 ]]
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var3327 = t_86.new()
	local var3328 = 0
	while var3328 < buffer.len(p170) do
		local _ = nil
		local var3329 = nil
		local var3330, var3331, var3332 = protoModule.readTag(p170, var3328)
		local var3333 = var3330
		var3329 = var3331
		var3328 = var3332
		
		if var3329 == protoModule.wireTypes.varint then
			if var3333 == 3 then
				local _ = nil
				local var3334, var3335 = protoModule.readVarIntI32(p170, var3328)
				var3328 = var3335
				var3327.max_visible_rows = var3334
			else
				local _ = nil
				local var3336, var3337 = protoModule.readVarInt(p170, var3328)
				local _ = var3336
				var3328 = var3337
			end
		end
		if var3329 == protoModule.wireTypes.lengthDelimited then
			if var3333 == 1 then
				local _ = nil
				local var3338, var3339 = protoModule.readBuffer(p170, var3328)
				var3328 = var3339
				var3327.title = buffer.tostring(var3338)
			elseif var3333 == 2 then
				local _ = nil
				local var3340, var3341 = protoModule.readBuffer(p170, var3328)
				var3328 = var3341
				table.insert(var3327.user_items, t.UserListInputData_UserItem.decode(var3340))
			else
				local _ = nil
				local var3342, var3343 = protoModule.readVarInt(p170, var3328)
				var3328 = var3343 + var3342
			end
		elseif var3329 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3344, var3345 = protoModule.readFixed32(p170, var3328)
			local _ = var3344
			var3328 = var3345
		elseif var3329 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3346, var3347 = protoModule.readFixed64(p170, var3328)
			local _ = var3346
			var3328 = var3347
		else
			error("Unsupported wire type: " .. var3329)
		end
	end
	return var3327
end

function t_86:jsonEncode() --[[ line: 18357 ]]
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

function t_86:jsonDecode() --[[ line: 18379 ]]
	-- upvalues: t_86 (ref), t (ref)
	local var3350 = t_86.new()
	
	if self.title ~= nil then
		var3350.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var3350.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var3350.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var3350.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var3350.max_visible_rows = self.maxVisibleRows
	end
	return var3350
end

t_86.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t.UserListInputData = t_86
typeRegistryModule.default:register(t.UserListInputData)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p171) --[[ line: 18429 ]]
	-- upvalues: t_87 (ref)
	return setmetatable({
		user_id = if p171 == nil or p171.user_id == nil then "" else p171.user_id
	}, t_87)
end

function t_87:encode() --[[ line: 18437 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3354 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var3355, var3356 = protoModule.writeTag(buff, var3354, 1, protoModule.wireTypes.lengthDelimited)
		var3355, var3356 = protoModule.writeString(var3355, var3356, self.user_id)
		buff = var3355
		var3354 = var3356
	end
	local buff_1 = buffer.create(var3354)
	buffer.copy(buff_1, 0, buff, 0, var3354)
	
	return buff_1
end

function t_87.decode(p172) --[[ line: 18451 ]]
	-- upvalues: t_87 (ref), protoModule (ref)
	local var3358 = t_87.new()
	local var3359 = 0
	while var3359 < buffer.len(p172) do
		local _ = nil
		local var3360 = nil
		local var3361, var3362, var3363 = protoModule.readTag(p172, var3359)
		local var3364 = var3361
		var3360 = var3362
		var3359 = var3363
		
		if var3360 == protoModule.wireTypes.varint then
			local _ = nil
			local var3365, var3366 = protoModule.readVarInt(p172, var3359)
			local _ = var3365
			var3359 = var3366
			continue
		end
		if var3360 == protoModule.wireTypes.lengthDelimited then
			if var3364 == 1 then
				local _ = nil
				local var3367, var3368 = protoModule.readBuffer(p172, var3359)
				var3359 = var3368
				var3358.user_id = buffer.tostring(var3367)
			else
				local _ = nil
				local var3369, var3370 = protoModule.readVarInt(p172, var3359)
				var3359 = var3370 + var3369
			end
		elseif var3360 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3371, var3372 = protoModule.readFixed32(p172, var3359)
			local _ = var3371
			var3359 = var3372
		elseif var3360 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3373, var3374 = protoModule.readFixed64(p172, var3359)
			local _ = var3373
			var3359 = var3374
		else
			error("Unsupported wire type: " .. var3360)
		end
	end
	return var3358
end

function t_87:jsonEncode() --[[ line: 18494 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_87:jsonDecode() --[[ line: 18504 ]]
	-- upvalues: t_87 (ref)
	local var3376 = t_87.new()
	
	if self.user_id ~= nil then
		var3376.user_id = self.user_id
	end
	if self.userId ~= nil then
		var3376.user_id = self.userId
	end
	return var3376
end

t_87.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.UserListInputData_UserItem = t_87
typeRegistryModule.default:register(t.UserListInputData_UserItem)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p173) --[[ line: 18532 ]]
	-- upvalues: t_88 (ref)
	return setmetatable({
		title = if p173 == nil or p173.title == nil then "" else p173.title,
		items = if p173 == nil or p173.items == nil then {} else p173.items,
		max_visible_rows = if p173 == nil or p173.max_visible_rows == nil then 0 else p173.max_visible_rows
	}, t_88)
end

function t_88:encode() --[[ line: 18540 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3378 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3379, var3380 = protoModule.writeTag(buff, var3378, 1, protoModule.wireTypes.lengthDelimited)
		var3379, var3380 = protoModule.writeString(var3379, var3380, self.title)
		buff = var3379
		var3378 = var3380
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3381 = v:encode()
			local var3382, var3383 = protoModule.writeTag(buff, var3378, 2, protoModule.wireTypes.lengthDelimited)
			var3382, var3383 = protoModule.writeBuffer(var3382, var3383, var3381, buffer.len(var3381))
			buff = var3382
			var3378 = var3383
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var3384, var3385 = protoModule.writeTag(buff, var3378, 3, protoModule.wireTypes.varint)
		var3384, var3385 = protoModule.writeVarInt(var3384, var3385, self.max_visible_rows)
		buff = var3384
		var3378 = var3385
	end
	local buff_1 = buffer.create(var3378)
	buffer.copy(buff_1, 0, buff, 0, var3378)
	
	return buff_1
end

function t_88.decode(p174) --[[ line: 18567 ]]
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var3387 = t_88.new()
	local var3388 = 0
	while var3388 < buffer.len(p174) do
		local _ = nil
		local var3389 = nil
		local var3390, var3391, var3392 = protoModule.readTag(p174, var3388)
		local var3393 = var3390
		var3389 = var3391
		var3388 = var3392
		
		if var3389 == protoModule.wireTypes.varint then
			if var3393 == 3 then
				local _ = nil
				local var3394, var3395 = protoModule.readVarIntI32(p174, var3388)
				var3388 = var3395
				var3387.max_visible_rows = var3394
			else
				local _ = nil
				local var3396, var3397 = protoModule.readVarInt(p174, var3388)
				local _ = var3396
				var3388 = var3397
			end
		end
		if var3389 == protoModule.wireTypes.lengthDelimited then
			if var3393 == 1 then
				local _ = nil
				local var3398, var3399 = protoModule.readBuffer(p174, var3388)
				var3388 = var3399
				var3387.title = buffer.tostring(var3398)
			elseif var3393 == 2 then
				local _ = nil
				local var3400, var3401 = protoModule.readBuffer(p174, var3388)
				var3388 = var3401
				table.insert(var3387.items, t.CatalogItemListInputData_CatalogItem.decode(var3400))
			else
				local _ = nil
				local var3402, var3403 = protoModule.readVarInt(p174, var3388)
				var3388 = var3403 + var3402
			end
		elseif var3389 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3404, var3405 = protoModule.readFixed32(p174, var3388)
			local _ = var3404
			var3388 = var3405
		elseif var3389 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3406, var3407 = protoModule.readFixed64(p174, var3388)
			local _ = var3406
			var3388 = var3407
		else
			error("Unsupported wire type: " .. var3389)
		end
	end
	return var3387
end

function t_88:jsonEncode() --[[ line: 18620 ]]
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

function t_88:jsonDecode() --[[ line: 18642 ]]
	-- upvalues: t_88 (ref), t (ref)
	local var3410 = t_88.new()
	
	if self.title ~= nil then
		var3410.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var3410.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var3410.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var3410.max_visible_rows = self.maxVisibleRows
	end
	return var3410
end

t_88.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t.CatalogItemListInputData = t_88
typeRegistryModule.default:register(t.CatalogItemListInputData)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p175) --[[ line: 18683 ]]
	-- upvalues: t_89 (ref)
	return setmetatable({
		item_id = if p175 == nil or p175.item_id == nil then "" else p175.item_id,
		item_type = if p175 == nil or p175.item_type == nil then "" else p175.item_type
	}, t_89)
end

function t_89:encode() --[[ line: 18692 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3413 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3414, var3415 = protoModule.writeTag(buff, var3413, 1, protoModule.wireTypes.lengthDelimited)
		var3414, var3415 = protoModule.writeString(var3414, var3415, self.item_id)
		buff = var3414
		var3413 = var3415
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3416, var3417 = protoModule.writeTag(buff, var3413, 2, protoModule.wireTypes.lengthDelimited)
		var3416, var3417 = protoModule.writeString(var3416, var3417, self.item_type)
		buff = var3416
		var3413 = var3417
	end
	local buff_1 = buffer.create(var3413)
	buffer.copy(buff_1, 0, buff, 0, var3413)
	
	return buff_1
end

function t_89.decode(p176) --[[ line: 18711 ]]
	-- upvalues: t_89 (ref), protoModule (ref)
	local var3419 = t_89.new()
	local var3420 = 0
	while var3420 < buffer.len(p176) do
		local _ = nil
		local var3421 = nil
		local var3422, var3423, var3424 = protoModule.readTag(p176, var3420)
		local var3425 = var3422
		var3421 = var3423
		var3420 = var3424
		
		if var3421 == protoModule.wireTypes.varint then
			local _ = nil
			local var3426, var3427 = protoModule.readVarInt(p176, var3420)
			local _ = var3426
			var3420 = var3427
			continue
		end
		if var3421 == protoModule.wireTypes.lengthDelimited then
			if var3425 == 1 then
				local _ = nil
				local var3428, var3429 = protoModule.readBuffer(p176, var3420)
				var3420 = var3429
				var3419.item_id = buffer.tostring(var3428)
			elseif var3425 == 2 then
				local _ = nil
				local var3430, var3431 = protoModule.readBuffer(p176, var3420)
				var3420 = var3431
				var3419.item_type = buffer.tostring(var3430)
			else
				local _ = nil
				local var3432, var3433 = protoModule.readVarInt(p176, var3420)
				var3420 = var3433 + var3432
			end
		elseif var3421 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3434, var3435 = protoModule.readFixed32(p176, var3420)
			local _ = var3434
			var3420 = var3435
		elseif var3421 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3436, var3437 = protoModule.readFixed64(p176, var3420)
			local _ = var3436
			var3420 = var3437
		else
			error("Unsupported wire type: " .. var3421)
		end
	end
	return var3419
end

function t_89:jsonEncode() --[[ line: 18759 ]]
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_89:jsonDecode() --[[ line: 18773 ]]
	-- upvalues: t_89 (ref)
	local var3439 = t_89.new()
	
	if self.item_id ~= nil then
		var3439.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3439.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3439.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3439.item_type = self.itemType
	end
	return var3439
end

t_89.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemListInputData_CatalogItem = t_89
typeRegistryModule.default:register(t.CatalogItemListInputData_CatalogItem)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p177) --[[ line: 18811 ]]
	-- upvalues: t_90 (ref)
	return setmetatable({
		universe_id = if p177 == nil or p177.universe_id == nil then "" else p177.universe_id
	}, t_90)
end

function t_90:encode() --[[ line: 18819 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3441 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3442, var3443 = protoModule.writeTag(buff, var3441, 1, protoModule.wireTypes.lengthDelimited)
		var3442, var3443 = protoModule.writeString(var3442, var3443, self.universe_id)
		buff = var3442
		var3441 = var3443
	end
	local buff_1 = buffer.create(var3441)
	buffer.copy(buff_1, 0, buff, 0, var3441)
	
	return buff_1
end

function t_90.decode(p178) --[[ line: 18833 ]]
	-- upvalues: t_90 (ref), protoModule (ref)
	local var3445 = t_90.new()
	local var3446 = 0
	while var3446 < buffer.len(p178) do
		local _ = nil
		local var3447 = nil
		local var3448, var3449, var3450 = protoModule.readTag(p178, var3446)
		local var3451 = var3448
		var3447 = var3449
		var3446 = var3450
		
		if var3447 == protoModule.wireTypes.varint then
			local _ = nil
			local var3452, var3453 = protoModule.readVarInt(p178, var3446)
			local _ = var3452
			var3446 = var3453
			continue
		end
		if var3447 == protoModule.wireTypes.lengthDelimited then
			if var3451 == 1 then
				local _ = nil
				local var3454, var3455 = protoModule.readBuffer(p178, var3446)
				var3446 = var3455
				var3445.universe_id = buffer.tostring(var3454)
			else
				local _ = nil
				local var3456, var3457 = protoModule.readVarInt(p178, var3446)
				var3446 = var3457 + var3456
			end
		elseif var3447 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3458, var3459 = protoModule.readFixed32(p178, var3446)
			local _ = var3458
			var3446 = var3459
		elseif var3447 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3460, var3461 = protoModule.readFixed64(p178, var3446)
			local _ = var3460
			var3446 = var3461
		else
			error("Unsupported wire type: " .. var3447)
		end
	end
	return var3445
end

function t_90:jsonEncode() --[[ line: 18876 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_90:jsonDecode() --[[ line: 18886 ]]
	-- upvalues: t_90 (ref)
	local var3463 = t_90.new()
	
	if self.universe_id ~= nil then
		var3463.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3463.universe_id = self.universeId
	end
	return var3463
end

t_90.descriptor = {
	name = "ExperienceGuidelinesDialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceGuidelinesDialogInputData"
}
t.ExperienceGuidelinesDialogInputData = t_90
typeRegistryModule.default:register(t.ExperienceGuidelinesDialogInputData)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p179) --[[ line: 18916 ]]
	-- upvalues: t_91 (ref)
	return setmetatable({
		title = if p179 == nil or p179.title == nil then "" else p179.title,
		subtitle = if p179 == nil or p179.subtitle == nil then "" else p179.subtitle,
		moment_items = if p179 == nil or p179.moment_items == nil then {} else p179.moment_items
	}, t_91)
end

function t_91:encode() --[[ line: 18924 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3465 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3466, var3467 = protoModule.writeTag(buff, var3465, 1, protoModule.wireTypes.lengthDelimited)
		var3466, var3467 = protoModule.writeString(var3466, var3467, self.title)
		buff = var3466
		var3465 = var3467
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3468, var3469 = protoModule.writeTag(buff, var3465, 2, protoModule.wireTypes.lengthDelimited)
		var3468, var3469 = protoModule.writeString(var3468, var3469, self.subtitle)
		buff = var3468
		var3465 = var3469
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var3470 = v:encode()
			local var3471, var3472 = protoModule.writeTag(buff, var3465, 3, protoModule.wireTypes.lengthDelimited)
			var3471, var3472 = protoModule.writeBuffer(var3471, var3472, var3470, buffer.len(var3470))
			buff = var3471
			var3465 = var3472
		end
	end
	local buff_1 = buffer.create(var3465)
	buffer.copy(buff_1, 0, buff, 0, var3465)
	
	return buff_1
end

function t_91.decode(p180) --[[ line: 18951 ]]
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var3474 = t_91.new()
	local var3475 = 0
	while var3475 < buffer.len(p180) do
		local _ = nil
		local var3476 = nil
		local var3477, var3478, var3479 = protoModule.readTag(p180, var3475)
		local var3480 = var3477
		var3476 = var3478
		var3475 = var3479
		
		if var3476 == protoModule.wireTypes.varint then
			local _ = nil
			local var3481, var3482 = protoModule.readVarInt(p180, var3475)
			local _ = var3481
			var3475 = var3482
			continue
		end
		if var3476 == protoModule.wireTypes.lengthDelimited then
			if var3480 == 1 then
				local _ = nil
				local var3483, var3484 = protoModule.readBuffer(p180, var3475)
				var3475 = var3484
				var3474.title = buffer.tostring(var3483)
			elseif var3480 == 2 then
				local _ = nil
				local var3485, var3486 = protoModule.readBuffer(p180, var3475)
				var3475 = var3486
				var3474.subtitle = buffer.tostring(var3485)
			elseif var3480 == 3 then
				local _ = nil
				local var3487, var3488 = protoModule.readBuffer(p180, var3475)
				var3475 = var3488
				table.insert(var3474.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var3487))
			else
				local _ = nil
				local var3489, var3490 = protoModule.readVarInt(p180, var3475)
				var3475 = var3490 + var3489
			end
		elseif var3476 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3491, var3492 = protoModule.readFixed32(p180, var3475)
			local _ = var3491
			var3475 = var3492
		elseif var3476 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3493, var3494 = protoModule.readFixed64(p180, var3475)
			local _ = var3493
			var3475 = var3494
		else
			error("Unsupported wire type: " .. var3476)
		end
	end
	return var3474
end

function t_91:jsonEncode() --[[ line: 19004 ]]
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

function t_91:jsonDecode() --[[ line: 19026 ]]
	-- upvalues: t_91 (ref), t (ref)
	local var3497 = t_91.new()
	
	if self.title ~= nil then
		var3497.title = self.title
	end
	if self.subtitle ~= nil then
		var3497.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3497.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3497.moment_items = t_1
	end
	return var3497
end

t_91.descriptor = {
	name = "MomentsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentsCarouselInputData"
}
t.MomentsCarouselInputData = t_91
typeRegistryModule.default:register(t.MomentsCarouselInputData)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p181) --[[ line: 19072 ]]
	-- upvalues: t_92 (ref)
	return setmetatable({
		moment_id = if p181 == nil or p181.moment_id == nil then "" else p181.moment_id,
		video_asset_id = if p181 == nil or p181.video_asset_id == nil then "" else p181.video_asset_id,
		target_universe_id = if p181 == nil or p181.target_universe_id == nil then "" else p181.target_universe_id,
		target_place_id = if p181 == nil or p181.target_place_id == nil then "" else p181.target_place_id,
		feed_item_id = if p181 == nil or p181.feed_item_id == nil then "" else p181.feed_item_id,
		capture_universe_id = if p181 == nil or p181.capture_universe_id == nil then "" else p181.capture_universe_id
	}, t_92)
end

function t_92:encode() --[[ line: 19087 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3501 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var3502, var3503 = protoModule.writeTag(buff, var3501, 1, protoModule.wireTypes.lengthDelimited)
		var3502, var3503 = protoModule.writeString(var3502, var3503, self.moment_id)
		buff = var3502
		var3501 = var3503
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var3504, var3505 = protoModule.writeTag(buff, var3501, 2, protoModule.wireTypes.lengthDelimited)
		var3504, var3505 = protoModule.writeString(var3504, var3505, self.video_asset_id)
		buff = var3504
		var3501 = var3505
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var3506, var3507 = protoModule.writeTag(buff, var3501, 3, protoModule.wireTypes.lengthDelimited)
		var3506, var3507 = protoModule.writeString(var3506, var3507, self.target_universe_id)
		buff = var3506
		var3501 = var3507
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var3508, var3509 = protoModule.writeTag(buff, var3501, 4, protoModule.wireTypes.lengthDelimited)
		var3508, var3509 = protoModule.writeString(var3508, var3509, self.target_place_id)
		buff = var3508
		var3501 = var3509
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var3510, var3511 = protoModule.writeTag(buff, var3501, 5, protoModule.wireTypes.lengthDelimited)
		var3510, var3511 = protoModule.writeString(var3510, var3511, self.feed_item_id)
		buff = var3510
		var3501 = var3511
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var3512, var3513 = protoModule.writeTag(buff, var3501, 6, protoModule.wireTypes.lengthDelimited)
		var3512, var3513 = protoModule.writeString(var3512, var3513, self.capture_universe_id)
		buff = var3512
		var3501 = var3513
	end
	local buff_1 = buffer.create(var3501)
	buffer.copy(buff_1, 0, buff, 0, var3501)
	
	return buff_1
end

function t_92.decode(p182) --[[ line: 19126 ]]
	-- upvalues: t_92 (ref), protoModule (ref)
	local var3515 = t_92.new()
	local var3516 = 0
	while var3516 < buffer.len(p182) do
		local _ = nil
		local var3517 = nil
		local var3518, var3519, var3520 = protoModule.readTag(p182, var3516)
		local var3521 = var3518
		var3517 = var3519
		var3516 = var3520
		
		if var3517 == protoModule.wireTypes.varint then
			local _ = nil
			local var3522, var3523 = protoModule.readVarInt(p182, var3516)
			local _ = var3522
			var3516 = var3523
			continue
		end
		if var3517 == protoModule.wireTypes.lengthDelimited then
			if var3521 == 1 then
				local _ = nil
				local var3524, var3525 = protoModule.readBuffer(p182, var3516)
				var3516 = var3525
				var3515.moment_id = buffer.tostring(var3524)
			elseif var3521 == 2 then
				local _ = nil
				local var3526, var3527 = protoModule.readBuffer(p182, var3516)
				var3516 = var3527
				var3515.video_asset_id = buffer.tostring(var3526)
			elseif var3521 == 3 then
				local _ = nil
				local var3528, var3529 = protoModule.readBuffer(p182, var3516)
				var3516 = var3529
				var3515.target_universe_id = buffer.tostring(var3528)
			elseif var3521 == 4 then
				local _ = nil
				local var3530, var3531 = protoModule.readBuffer(p182, var3516)
				var3516 = var3531
				var3515.target_place_id = buffer.tostring(var3530)
			elseif var3521 == 5 then
				local _ = nil
				local var3532, var3533 = protoModule.readBuffer(p182, var3516)
				var3516 = var3533
				var3515.feed_item_id = buffer.tostring(var3532)
			elseif var3521 == 6 then
				local _ = nil
				local var3534, var3535 = protoModule.readBuffer(p182, var3516)
				var3516 = var3535
				var3515.capture_universe_id = buffer.tostring(var3534)
			else
				local _ = nil
				local var3536, var3537 = protoModule.readVarInt(p182, var3516)
				var3516 = var3537 + var3536
			end
		elseif var3517 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3538, var3539 = protoModule.readFixed32(p182, var3516)
			local _ = var3538
			var3516 = var3539
		elseif var3517 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3540, var3541 = protoModule.readFixed64(p182, var3516)
			local _ = var3540
			var3516 = var3541
		else
			error("Unsupported wire type: " .. var3517)
		end
	end
	return var3515
end

function t_92:jsonEncode() --[[ line: 19194 ]]
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

function t_92:jsonDecode() --[[ line: 19224 ]]
	-- upvalues: t_92 (ref)
	local var3543 = t_92.new()
	
	if self.moment_id ~= nil then
		var3543.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var3543.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var3543.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3543.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var3543.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var3543.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var3543.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var3543.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var3543.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var3543.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var3543.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var3543.capture_universe_id = self.captureUniverseId
	end
	return var3543
end

t_92.descriptor = {
	name = "MomentsCarouselInputData_MomentItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentItem"
}
t.MomentsCarouselInputData_MomentItem = t_92
typeRegistryModule.default:register(t.MomentsCarouselInputData_MomentItem)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p183) --[[ line: 19294 ]]
	-- upvalues: t_93 (ref)
	return setmetatable({
		title = if p183 == nil or p183.title == nil then "" else p183.title,
		subtitle = if p183 == nil or p183.subtitle == nil then "" else p183.subtitle
	}, t_93)
end

function t_93:encode() --[[ line: 19301 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3545 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3546, var3547 = protoModule.writeTag(buff, var3545, 1, protoModule.wireTypes.lengthDelimited)
		var3546, var3547 = protoModule.writeString(var3546, var3547, self.title)
		buff = var3546
		var3545 = var3547
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3548, var3549 = protoModule.writeTag(buff, var3545, 2, protoModule.wireTypes.lengthDelimited)
		var3548, var3549 = protoModule.writeString(var3548, var3549, self.subtitle)
		buff = var3548
		var3545 = var3549
	end
	local buff_1 = buffer.create(var3545)
	buffer.copy(buff_1, 0, buff, 0, var3545)
	
	return buff_1
end

function t_93.decode(p184) --[[ line: 19320 ]]
	-- upvalues: t_93 (ref), protoModule (ref)
	local var3551 = t_93.new()
	local var3552 = 0
	while var3552 < buffer.len(p184) do
		local _ = nil
		local var3553 = nil
		local var3554, var3555, var3556 = protoModule.readTag(p184, var3552)
		local var3557 = var3554
		var3553 = var3555
		var3552 = var3556
		
		if var3553 == protoModule.wireTypes.varint then
			local _ = nil
			local var3558, var3559 = protoModule.readVarInt(p184, var3552)
			local _ = var3558
			var3552 = var3559
			continue
		end
		if var3553 == protoModule.wireTypes.lengthDelimited then
			if var3557 == 1 then
				local _ = nil
				local var3560, var3561 = protoModule.readBuffer(p184, var3552)
				var3552 = var3561
				var3551.title = buffer.tostring(var3560)
			elseif var3557 == 2 then
				local _ = nil
				local var3562, var3563 = protoModule.readBuffer(p184, var3552)
				var3552 = var3563
				var3551.subtitle = buffer.tostring(var3562)
			else
				local _ = nil
				local var3564, var3565 = protoModule.readVarInt(p184, var3552)
				var3552 = var3565 + var3564
			end
		elseif var3553 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3566, var3567 = protoModule.readFixed32(p184, var3552)
			local _ = var3566
			var3552 = var3567
		elseif var3553 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3568, var3569 = protoModule.readFixed64(p184, var3552)
			local _ = var3568
			var3552 = var3569
		else
			error("Unsupported wire type: " .. var3553)
		end
	end
	return var3551
end

function t_93:jsonEncode() --[[ line: 19368 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	return t
end

function t_93:jsonDecode() --[[ line: 19382 ]]
	-- upvalues: t_93 (ref)
	local var3571 = t_93.new()
	
	if self.title ~= nil then
		var3571.title = self.title
	end
	if self.subtitle ~= nil then
		var3571.subtitle = self.subtitle
	end
	return var3571
end

t_93.descriptor = {
	name = "AttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowInputData"
}
t.AttributionRowInputData = t_93
typeRegistryModule.default:register(t.AttributionRowInputData)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p185) --[[ line: 19410 ]]
	-- upvalues: t_94 (ref)
	return setmetatable({
		image_asset_id = if p185 == nil or p185.image_asset_id == nil then "" else p185.image_asset_id
	}, t_94)
end

function t_94:encode() --[[ line: 19416 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3573 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3574, var3575 = protoModule.writeTag(buff, var3573, 1, protoModule.wireTypes.lengthDelimited)
		var3574, var3575 = protoModule.writeString(var3574, var3575, self.image_asset_id)
		buff = var3574
		var3573 = var3575
	end
	local buff_1 = buffer.create(var3573)
	buffer.copy(buff_1, 0, buff, 0, var3573)
	
	return buff_1
end

function t_94.decode(p186) --[[ line: 19430 ]]
	-- upvalues: t_94 (ref), protoModule (ref)
	local var3577 = t_94.new()
	local var3578 = 0
	while var3578 < buffer.len(p186) do
		local _ = nil
		local var3579 = nil
		local var3580, var3581, var3582 = protoModule.readTag(p186, var3578)
		local var3583 = var3580
		var3579 = var3581
		var3578 = var3582
		
		if var3579 == protoModule.wireTypes.varint then
			local _ = nil
			local var3584, var3585 = protoModule.readVarInt(p186, var3578)
			local _ = var3584
			var3578 = var3585
			continue
		end
		if var3579 == protoModule.wireTypes.lengthDelimited then
			if var3583 == 1 then
				local _ = nil
				local var3586, var3587 = protoModule.readBuffer(p186, var3578)
				var3578 = var3587
				var3577.image_asset_id = buffer.tostring(var3586)
			else
				local _ = nil
				local var3588, var3589 = protoModule.readVarInt(p186, var3578)
				var3578 = var3589 + var3588
			end
		elseif var3579 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3590, var3591 = protoModule.readFixed32(p186, var3578)
			local _ = var3590
			var3578 = var3591
		elseif var3579 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3592, var3593 = protoModule.readFixed64(p186, var3578)
			local _ = var3592
			var3578 = var3593
		else
			error("Unsupported wire type: " .. var3579)
		end
	end
	return var3577
end

function t_94:jsonEncode() --[[ line: 19473 ]]
	local t = {}
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	return t
end

function t_94:jsonDecode() --[[ line: 19483 ]]
	-- upvalues: t_94 (ref)
	local var3595 = t_94.new()
	
	if self.image_asset_id ~= nil then
		var3595.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3595.image_asset_id = self.imageAssetId
	end
	return var3595
end

t_94.descriptor = {
	name = "ImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageInputData"
}
t.ImageInputData = t_94
typeRegistryModule.default:register(t.ImageInputData)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p187) --[[ line: 19511 ]]
	-- upvalues: t_95 (ref)
	return setmetatable({
		text = if p187 == nil or p187.text == nil then "" else p187.text,
		is_rendered_text = if p187 == nil or p187.is_rendered_text == nil then false else p187.is_rendered_text
	}, t_95)
end

function t_95:encode() --[[ line: 19518 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3597 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var3598, var3599 = protoModule.writeTag(buff, var3597, 1, protoModule.wireTypes.lengthDelimited)
		var3598, var3599 = protoModule.writeString(var3598, var3599, self.text)
		buff = var3598
		var3597 = var3599
	end
	if self.is_rendered_text then
		local var3600, var3601 = protoModule.writeTag(buff, var3597, 2, protoModule.wireTypes.varint)
		var3600, var3601 = protoModule.writeVarInt(var3600, var3601, if self.is_rendered_text then 1 else 0)
		buff = var3600
		var3597 = var3601
	end
	local buff_1 = buffer.create(var3597)
	buffer.copy(buff_1, 0, buff, 0, var3597)
	
	return buff_1
end

function t_95.decode(p188) --[[ line: 19537 ]]
	-- upvalues: t_95 (ref), protoModule (ref)
	local var3603 = t_95.new()
	local var3604 = 0
	while var3604 < buffer.len(p188) do
		local _ = nil
		local var3605 = nil
		local var3606, var3607, var3608 = protoModule.readTag(p188, var3604)
		local var3609 = var3606
		var3605 = var3607
		var3604 = var3608
		
		if var3605 == protoModule.wireTypes.varint then
			if var3609 == 2 then
				local _ = nil
				local var3610, var3611 = protoModule.readVarInt(p188, var3604)
				var3604 = var3611
				var3603.is_rendered_text = var3610 ~= 0
			else
				local _ = nil
				local var3612, var3613 = protoModule.readVarInt(p188, var3604)
				local _ = var3612
				var3604 = var3613
			end
		end
		if var3605 == protoModule.wireTypes.lengthDelimited then
			if var3609 == 1 then
				local _ = nil
				local var3614, var3615 = protoModule.readBuffer(p188, var3604)
				var3604 = var3615
				var3603.text = buffer.tostring(var3614)
			else
				local _ = nil
				local var3616, var3617 = protoModule.readVarInt(p188, var3604)
				var3604 = var3617 + var3616
			end
		elseif var3605 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3618, var3619 = protoModule.readFixed32(p188, var3604)
			local _ = var3618
			var3604 = var3619
		elseif var3605 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3620, var3621 = protoModule.readFixed64(p188, var3604)
			local _ = var3620
			var3604 = var3621
		else
			error("Unsupported wire type: " .. var3605)
		end
	end
	return var3603
end

function t_95:jsonEncode() --[[ line: 19585 ]]
	local t = {}
	
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	if self.is_rendered_text then
		t.isRenderedText = self.is_rendered_text
	end
	return t
end

function t_95:jsonDecode() --[[ line: 19599 ]]
	-- upvalues: t_95 (ref)
	local var3623 = t_95.new()
	
	if self.text ~= nil then
		var3623.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var3623.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var3623.is_rendered_text = self.isRenderedText
	end
	return var3623
end

t_95.descriptor = {
	name = "TextInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextInputData"
}
t.TextInputData = t_95
typeRegistryModule.default:register(t.TextInputData)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p189) --[[ line: 19631 ]]
	-- upvalues: t_96 (ref)
	return setmetatable({
		entry_map = if p189 == nil or p189.entry_map == nil then {} else p189.entry_map,
		entry_order = if p189 == nil or p189.entry_order == nil then {} else p189.entry_order,
		entry_order_map = if p189 == nil or p189.entry_order_map == nil then {} else p189.entry_order_map,
		content_pools = if p189 == nil or p189.content_pools == nil then {} else p189.content_pools
	}, t_96)
end

function t_96:encode() --[[ line: 19640 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3625 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3626, var3627 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3626, var3627 = protoModule.writeString(var3626, var3627, i)
			local var3628 = v:encode()
			var3627, var3629 = protoModule.writeTag(var3626, var3627, 2, protoModule.wireTypes.lengthDelimited)
			var3627, var3629 = protoModule.writeBuffer(var3627, var3629, var3628, buffer.len(var3628))
			local var3630 = var3627
			local var3631 = var3629
			local var3632, var3633 = protoModule.writeTag(buff, var3625, 1, protoModule.wireTypes.lengthDelimited)
			var3632, var3633 = protoModule.writeBuffer(var3632, var3633, var3630, var3631)
			buff = var3632
			var3625 = var3633
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3634, var3635 = protoModule.writeTag(buff, var3625, 2, protoModule.wireTypes.lengthDelimited)
			var3634, var3635 = protoModule.writeString(var3634, var3635, v)
			buff = var3634
			var3625 = var3635
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var3636, var3637 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3636, var3637 = protoModule.writeString(var3636, var3637, i)
			local var3638 = v:encode()
			var3637, var3639 = protoModule.writeTag(var3636, var3637, 2, protoModule.wireTypes.lengthDelimited)
			var3637, var3639 = protoModule.writeBuffer(var3637, var3639, var3638, buffer.len(var3638))
			local var3640 = var3637
			local var3641 = var3639
			local var3642, var3643 = protoModule.writeTag(buff, var3625, 3, protoModule.wireTypes.lengthDelimited)
			var3642, var3643 = protoModule.writeBuffer(var3642, var3643, var3640, var3641)
			buff = var3642
			var3625 = var3643
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
			local var3650, var3651 = protoModule.writeTag(buff, var3625, 4, protoModule.wireTypes.lengthDelimited)
			var3650, var3651 = protoModule.writeBuffer(var3650, var3651, var3648, var3649)
			buff = var3650
			var3625 = var3651
		end
	end
	local buff_1 = buffer.create(var3625)
	buffer.copy(buff_1, 0, buff, 0, var3625)
	
	return buff_1
end

function t_96.decode(p190) --[[ line: 19698 ]]
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var3653 = t_96.new()
	local var3654 = 0
	while var3654 < buffer.len(p190) do
		local _ = nil
		local var3655 = nil
		local var3656, var3657, var3658 = protoModule.readTag(p190, var3654)
		local var3659 = var3656
		var3655 = var3657
		var3654 = var3658
		
		if var3655 == protoModule.wireTypes.varint then
			local _ = nil
			local var3660, var3661 = protoModule.readVarInt(p190, var3654)
			local _ = var3660
			var3654 = var3661
			continue
		end
		if var3655 == protoModule.wireTypes.lengthDelimited then
			if var3659 == 1 then
				local _ = nil
				local var3662, var3663 = protoModule.readBuffer(p190, var3654)
				var3654 = var3663
				var3662 = t.VerticalFeedInputData_EntryMapEntry.decode(var3662)
				var3653.entry_map[var3662.key or ""] = var3662.value or t.FeedEntry.new()
			elseif var3659 == 2 then
				local _ = nil
				local var3664, var3665 = protoModule.readBuffer(p190, var3654)
				var3654 = var3665
				table.insert(var3653.entry_order, buffer.tostring(var3664))
			elseif var3659 == 3 then
				local _ = nil
				local var3666, var3667 = protoModule.readBuffer(p190, var3654)
				var3654 = var3667
				var3666 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var3666)
				var3653.entry_order_map[var3666.key or ""] = var3666.value or t.EntryOrder.new()
			elseif var3659 == 4 then
				local _ = nil
				local var3668, var3669 = protoModule.readBuffer(p190, var3654)
				var3654 = var3669
				var3668 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var3668)
				var3653.content_pools[var3668.key or ""] = var3668.value or t.ContentPool.new()
			else
				local _ = nil
				local var3670, var3671 = protoModule.readVarInt(p190, var3654)
				var3654 = var3671 + var3670
			end
		elseif var3655 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3672, var3673 = protoModule.readFixed32(p190, var3654)
			local _ = var3672
			var3654 = var3673
		elseif var3655 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3674, var3675 = protoModule.readFixed64(p190, var3654)
			local _ = var3674
			var3654 = var3675
		else
			error("Unsupported wire type: " .. var3655)
		end
	end
	return var3653
end

function t_96:jsonEncode() --[[ line: 19777 ]]
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

function t_96:jsonDecode() --[[ line: 19815 ]]
	-- upvalues: t_96 (ref), t (ref)
	local var3681 = t_96.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3681.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3681.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3681.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3681.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3681.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3681.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3681.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3681.content_pools = t_1
	end
	return var3681
end

t_96.descriptor = {
	name = "VerticalFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedInputData"
}
t.VerticalFeedInputData = t_96
typeRegistryModule.default:register(t.VerticalFeedInputData)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p191) --[[ line: 19907 ]]
	-- upvalues: t_97 (ref)
	return setmetatable({
		key = if p191 == nil or p191.key == nil then "" else p191.key,
		value = if p191 == nil or p191.value == nil then nil else p191.value
	}, t_97)
end

function t_97:encode() --[[ line: 19916 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3691 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3692, var3693 = protoModule.writeTag(buff, var3691, 1, protoModule.wireTypes.lengthDelimited)
		var3692, var3693 = protoModule.writeString(var3692, var3693, self.key)
		buff = var3692
		var3691 = var3693
	end
	if self.value ~= nil then
		local var3694 = self.value:encode()
		local var3695, var3696 = protoModule.writeTag(buff, var3691, 2, protoModule.wireTypes.lengthDelimited)
		var3695, var3696 = protoModule.writeBuffer(var3695, var3696, var3694, buffer.len(var3694))
		buff = var3695
		var3691 = var3696
	end
	local buff_1 = buffer.create(var3691)
	buffer.copy(buff_1, 0, buff, 0, var3691)
	
	return buff_1
end

function t_97.decode(p192) --[[ line: 19936 ]]
	-- upvalues: t_97 (ref), protoModule (ref), t (ref)
	local var3698 = t_97.new()
	local var3699 = 0
	while var3699 < buffer.len(p192) do
		local _ = nil
		local var3700 = nil
		local var3701, var3702, var3703 = protoModule.readTag(p192, var3699)
		local var3704 = var3701
		var3700 = var3702
		var3699 = var3703
		
		if var3700 == protoModule.wireTypes.varint then
			local _ = nil
			local var3705, var3706 = protoModule.readVarInt(p192, var3699)
			local _ = var3705
			var3699 = var3706
			continue
		end
		if var3700 == protoModule.wireTypes.lengthDelimited then
			if var3704 == 1 then
				local _ = nil
				local var3707, var3708 = protoModule.readBuffer(p192, var3699)
				var3699 = var3708
				var3698.key = buffer.tostring(var3707)
			elseif var3704 == 2 then
				local _ = nil
				local var3709, var3710 = protoModule.readBuffer(p192, var3699)
				var3699 = var3710
				var3698.value = t.FeedEntry.decode(var3709)
			else
				local _ = nil
				local var3711, var3712 = protoModule.readVarInt(p192, var3699)
				var3699 = var3712 + var3711
			end
		elseif var3700 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3713, var3714 = protoModule.readFixed32(p192, var3699)
			local _ = var3713
			var3699 = var3714
		elseif var3700 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3715, var3716 = protoModule.readFixed64(p192, var3699)
			local _ = var3715
			var3699 = var3716
		else
			error("Unsupported wire type: " .. var3700)
		end
	end
	return var3698
end

function t_97:jsonEncode() --[[ line: 19984 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_97:jsonDecode() --[[ line: 19998 ]]
	-- upvalues: t_97 (ref), t (ref)
	local var3718 = t_97.new()
	
	if self.key ~= nil then
		var3718.key = self.key
	end
	if self.value ~= nil then
		var3718.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3718
end

t_97.descriptor = {
	name = "VerticalFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.VerticalFeedInputData_EntryMapEntry = t_97
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryMapEntry)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p193) --[[ line: 20028 ]]
	-- upvalues: t_98 (ref)
	return setmetatable({
		key = if p193 == nil or p193.key == nil then "" else p193.key,
		value = if p193 == nil or p193.value == nil then nil else p193.value
	}, t_98)
end

function t_98:encode() --[[ line: 20037 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3720 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3721, var3722 = protoModule.writeTag(buff, var3720, 1, protoModule.wireTypes.lengthDelimited)
		var3721, var3722 = protoModule.writeString(var3721, var3722, self.key)
		buff = var3721
		var3720 = var3722
	end
	if self.value ~= nil then
		local var3723 = self.value:encode()
		local var3724, var3725 = protoModule.writeTag(buff, var3720, 2, protoModule.wireTypes.lengthDelimited)
		var3724, var3725 = protoModule.writeBuffer(var3724, var3725, var3723, buffer.len(var3723))
		buff = var3724
		var3720 = var3725
	end
	local buff_1 = buffer.create(var3720)
	buffer.copy(buff_1, 0, buff, 0, var3720)
	
	return buff_1
end

function t_98.decode(p194) --[[ line: 20059 ]]
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var3727 = t_98.new()
	local var3728 = 0
	while var3728 < buffer.len(p194) do
		local _ = nil
		local var3729 = nil
		local var3730, var3731, var3732 = protoModule.readTag(p194, var3728)
		local var3733 = var3730
		var3729 = var3731
		var3728 = var3732
		
		if var3729 == protoModule.wireTypes.varint then
			local _ = nil
			local var3734, var3735 = protoModule.readVarInt(p194, var3728)
			local _ = var3734
			var3728 = var3735
			continue
		end
		if var3729 == protoModule.wireTypes.lengthDelimited then
			if var3733 == 1 then
				local _ = nil
				local var3736, var3737 = protoModule.readBuffer(p194, var3728)
				var3728 = var3737
				var3727.key = buffer.tostring(var3736)
			elseif var3733 == 2 then
				local _ = nil
				local var3738, var3739 = protoModule.readBuffer(p194, var3728)
				var3728 = var3739
				var3727.value = t.EntryOrder.decode(var3738)
			else
				local _ = nil
				local var3740, var3741 = protoModule.readVarInt(p194, var3728)
				var3728 = var3741 + var3740
			end
		elseif var3729 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3742, var3743 = protoModule.readFixed32(p194, var3728)
			local _ = var3742
			var3728 = var3743
		elseif var3729 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3744, var3745 = protoModule.readFixed64(p194, var3728)
			local _ = var3744
			var3728 = var3745
		else
			error("Unsupported wire type: " .. var3729)
		end
	end
	return var3727
end

function t_98:jsonEncode() --[[ line: 20109 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_98:jsonDecode() --[[ line: 20125 ]]
	-- upvalues: t_98 (ref), t (ref)
	local var3747 = t_98.new()
	
	if self.key ~= nil then
		var3747.key = self.key
	end
	if self.value ~= nil then
		var3747.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var3747
end

t_98.descriptor = {
	name = "VerticalFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.VerticalFeedInputData_EntryOrderMapEntry = t_98
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryOrderMapEntry)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p195) --[[ line: 20155 ]]
	-- upvalues: t_99 (ref)
	return setmetatable({
		key = if p195 == nil or p195.key == nil then "" else p195.key,
		value = if p195 == nil or p195.value == nil then nil else p195.value
	}, t_99)
end

function t_99:encode() --[[ line: 20164 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3749 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3750, var3751 = protoModule.writeTag(buff, var3749, 1, protoModule.wireTypes.lengthDelimited)
		var3750, var3751 = protoModule.writeString(var3750, var3751, self.key)
		buff = var3750
		var3749 = var3751
	end
	if self.value ~= nil then
		local var3752 = self.value:encode()
		local var3753, var3754 = protoModule.writeTag(buff, var3749, 2, protoModule.wireTypes.lengthDelimited)
		var3753, var3754 = protoModule.writeBuffer(var3753, var3754, var3752, buffer.len(var3752))
		buff = var3753
		var3749 = var3754
	end
	local buff_1 = buffer.create(var3749)
	buffer.copy(buff_1, 0, buff, 0, var3749)
	
	return buff_1
end

function t_99.decode(p196) --[[ line: 20184 ]]
	-- upvalues: t_99 (ref), protoModule (ref), t (ref)
	local var3756 = t_99.new()
	local var3757 = 0
	while var3757 < buffer.len(p196) do
		local _ = nil
		local var3758 = nil
		local var3759, var3760, var3761 = protoModule.readTag(p196, var3757)
		local var3762 = var3759
		var3758 = var3760
		var3757 = var3761
		
		if var3758 == protoModule.wireTypes.varint then
			local _ = nil
			local var3763, var3764 = protoModule.readVarInt(p196, var3757)
			local _ = var3763
			var3757 = var3764
			continue
		end
		if var3758 == protoModule.wireTypes.lengthDelimited then
			if var3762 == 1 then
				local _ = nil
				local var3765, var3766 = protoModule.readBuffer(p196, var3757)
				var3757 = var3766
				var3756.key = buffer.tostring(var3765)
			elseif var3762 == 2 then
				local _ = nil
				local var3767, var3768 = protoModule.readBuffer(p196, var3757)
				var3757 = var3768
				var3756.value = t.ContentPool.decode(var3767)
			else
				local _ = nil
				local var3769, var3770 = protoModule.readVarInt(p196, var3757)
				var3757 = var3770 + var3769
			end
		elseif var3758 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3771, var3772 = protoModule.readFixed32(p196, var3757)
			local _ = var3771
			var3757 = var3772
		elseif var3758 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3773, var3774 = protoModule.readFixed64(p196, var3757)
			local _ = var3773
			var3757 = var3774
		else
			error("Unsupported wire type: " .. var3758)
		end
	end
	return var3756
end

function t_99:jsonEncode() --[[ line: 20232 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_99:jsonDecode() --[[ line: 20246 ]]
	-- upvalues: t_99 (ref), t (ref)
	local var3776 = t_99.new()
	
	if self.key ~= nil then
		var3776.key = self.key
	end
	if self.value ~= nil then
		var3776.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3776
end

t_99.descriptor = {
	name = "VerticalFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.VerticalFeedInputData_ContentPoolsEntry = t_99
typeRegistryModule.default:register(t.VerticalFeedInputData_ContentPoolsEntry)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p197) --[[ line: 20276 ]]
	-- upvalues: t_100 (ref)
	return setmetatable({
		foreground_header_entry = if p197 == nil or p197.foreground_header_entry == nil then nil else p197.foreground_header_entry,
		background_header_entry = if p197 == nil or p197.background_header_entry == nil then nil else p197.background_header_entry
	}, t_100)
end

function t_100:encode() --[[ line: 20287 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3778 = 0
	
	if self.foreground_header_entry ~= nil then
		local var3779 = self.foreground_header_entry:encode()
		local var3780, var3781 = protoModule.writeTag(buff, var3778, 1, protoModule.wireTypes.lengthDelimited)
		var3780, var3781 = protoModule.writeBuffer(var3780, var3781, var3779, buffer.len(var3779))
		buff = var3780
		var3778 = var3781
	end
	if self.background_header_entry ~= nil then
		local var3782 = self.background_header_entry:encode()
		local var3783, var3784 = protoModule.writeTag(buff, var3778, 2, protoModule.wireTypes.lengthDelimited)
		var3783, var3784 = protoModule.writeBuffer(var3783, var3784, var3782, buffer.len(var3782))
		buff = var3783
		var3778 = var3784
	end
	local buff_1 = buffer.create(var3778)
	buffer.copy(buff_1, 0, buff, 0, var3778)
	
	return buff_1
end

function t_100.decode(p198) --[[ line: 20308 ]]
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var3786 = t_100.new()
	local var3787 = 0
	while var3787 < buffer.len(p198) do
		local _ = nil
		local var3788 = nil
		local var3789, var3790, var3791 = protoModule.readTag(p198, var3787)
		local var3792 = var3789
		var3788 = var3790
		var3787 = var3791
		
		if var3788 == protoModule.wireTypes.varint then
			local _ = nil
			local var3793, var3794 = protoModule.readVarInt(p198, var3787)
			local _ = var3793
			var3787 = var3794
			continue
		end
		if var3788 == protoModule.wireTypes.lengthDelimited then
			if var3792 == 1 then
				local _ = nil
				local var3795, var3796 = protoModule.readBuffer(p198, var3787)
				var3787 = var3796
				var3786.foreground_header_entry = t.ForegroundHeaderEntry.decode(var3795)
			elseif var3792 == 2 then
				local _ = nil
				local var3797, var3798 = protoModule.readBuffer(p198, var3787)
				var3787 = var3798
				var3786.background_header_entry = t.BackgroundHeaderEntry.decode(var3797)
			else
				local _ = nil
				local var3799, var3800 = protoModule.readVarInt(p198, var3787)
				var3787 = var3800 + var3799
			end
		elseif var3788 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3801, var3802 = protoModule.readFixed32(p198, var3787)
			local _ = var3801
			var3787 = var3802
		elseif var3788 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3803, var3804 = protoModule.readFixed64(p198, var3787)
			local _ = var3803
			var3787 = var3804
		else
			error("Unsupported wire type: " .. var3788)
		end
	end
	return var3786
end

function t_100:jsonEncode() --[[ line: 20356 ]]
	local t = {}
	
	if self.foreground_header_entry ~= nil then
		t.foregroundHeaderEntry = self.foreground_header_entry:jsonEncode()
	end
	if self.background_header_entry ~= nil then
		t.backgroundHeaderEntry = self.background_header_entry:jsonEncode()
	end
	return t
end

function t_100:jsonDecode() --[[ line: 20370 ]]
	-- upvalues: t_100 (ref), t (ref)
	local var3806 = t_100.new()
	
	if self.foreground_header_entry ~= nil then
		var3806.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var3806.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var3806.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var3806.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	return var3806
end

t_100.descriptor = {
	name = "PageHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageHeaderInputData"
}
t.PageHeaderInputData = t_100
typeRegistryModule.default:register(t.PageHeaderInputData)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p199) --[[ line: 20406 ]]
	-- upvalues: t_101 (ref)
	return setmetatable({
		selected_option = if p199 == nil or p199.selected_option == nil then "" else p199.selected_option,
		sort_id = if p199 == nil or p199.sort_id == nil then "" else p199.sort_id,
		options = if p199 == nil or p199.options == nil then {} else p199.options,
		experience_carousel = if p199 == nil or p199.experience_carousel == nil then nil else p199.experience_carousel,
		feed_item_key = if p199 == nil or p199.feed_item_key == nil then "" else p199.feed_item_key
	}, t_101)
end

function t_101:encode() --[[ line: 20420 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3808 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3809, var3810 = protoModule.writeTag(buff, var3808, 1, protoModule.wireTypes.lengthDelimited)
		var3809, var3810 = protoModule.writeString(var3809, var3810, self.selected_option)
		buff = var3809
		var3808 = var3810
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3811, var3812 = protoModule.writeTag(buff, var3808, 2, protoModule.wireTypes.lengthDelimited)
		var3811, var3812 = protoModule.writeString(var3811, var3812, self.sort_id)
		buff = var3811
		var3808 = var3812
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3813 = v:encode()
			local var3814, var3815 = protoModule.writeTag(buff, var3808, 3, protoModule.wireTypes.lengthDelimited)
			var3814, var3815 = protoModule.writeBuffer(var3814, var3815, var3813, buffer.len(var3813))
			buff = var3814
			var3808 = var3815
		end
	end
	if self.experience_carousel ~= nil then
		local var3816 = self.experience_carousel:encode()
		local var3817, var3818 = protoModule.writeTag(buff, var3808, 4, protoModule.wireTypes.lengthDelimited)
		var3817, var3818 = protoModule.writeBuffer(var3817, var3818, var3816, buffer.len(var3816))
		buff = var3817
		var3808 = var3818
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var3819, var3820 = protoModule.writeTag(buff, var3808, 5, protoModule.wireTypes.lengthDelimited)
		var3819, var3820 = protoModule.writeString(var3819, var3820, self.feed_item_key)
		buff = var3819
		var3808 = var3820
	end
	local buff_1 = buffer.create(var3808)
	buffer.copy(buff_1, 0, buff, 0, var3808)
	
	return buff_1
end

function t_101.decode(p200) --[[ line: 20458 ]]
	-- upvalues: t_101 (ref), protoModule (ref), t (ref)
	local var3822 = t_101.new()
	local var3823 = 0
	while var3823 < buffer.len(p200) do
		local _ = nil
		local var3824 = nil
		local var3825, var3826, var3827 = protoModule.readTag(p200, var3823)
		local var3828 = var3825
		var3824 = var3826
		var3823 = var3827
		
		if var3824 == protoModule.wireTypes.varint then
			local _ = nil
			local var3829, var3830 = protoModule.readVarInt(p200, var3823)
			local _ = var3829
			var3823 = var3830
			continue
		end
		if var3824 == protoModule.wireTypes.lengthDelimited then
			if var3828 == 1 then
				local _ = nil
				local var3831, var3832 = protoModule.readBuffer(p200, var3823)
				var3823 = var3832
				var3822.selected_option = buffer.tostring(var3831)
			elseif var3828 == 2 then
				local _ = nil
				local var3833, var3834 = protoModule.readBuffer(p200, var3823)
				var3823 = var3834
				var3822.sort_id = buffer.tostring(var3833)
			elseif var3828 == 3 then
				local _ = nil
				local var3835, var3836 = protoModule.readBuffer(p200, var3823)
				var3823 = var3836
				table.insert(var3822.options, t.SelectorOption.decode(var3835))
			elseif var3828 == 4 then
				local _ = nil
				local var3837, var3838 = protoModule.readBuffer(p200, var3823)
				var3823 = var3838
				var3822.experience_carousel = t.ExperienceCarouselInputData.decode(var3837)
			elseif var3828 == 5 then
				local _ = nil
				local var3839, var3840 = protoModule.readBuffer(p200, var3823)
				var3823 = var3840
				var3822.feed_item_key = buffer.tostring(var3839)
			else
				local _ = nil
				local var3841, var3842 = protoModule.readVarInt(p200, var3823)
				var3823 = var3842 + var3841
			end
		elseif var3824 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3843, var3844 = protoModule.readFixed32(p200, var3823)
			local _ = var3843
			var3823 = var3844
		elseif var3824 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3845, var3846 = protoModule.readFixed64(p200, var3823)
			local _ = var3845
			var3823 = var3846
		else
			error("Unsupported wire type: " .. var3824)
		end
	end
	return var3822
end

function t_101:jsonEncode() --[[ line: 20521 ]]
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

function t_101:jsonDecode() --[[ line: 20551 ]]
	-- upvalues: t_101 (ref), t (ref)
	local var3849 = t_101.new()
	
	if self.selected_option ~= nil then
		var3849.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3849.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var3849.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3849.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3849.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3849.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3849.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var3849.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var3849.feed_item_key = self.feedItemKey
	end
	return var3849
end

t_101.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = t_101
typeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p201) --[[ line: 20612 ]]
	-- upvalues: t_102 (ref)
	return setmetatable({
		id = if p201 == nil or p201.id == nil then "" else p201.id,
		display_name = if p201 == nil or p201.display_name == nil then "" else p201.display_name,
		is_selected = if p201 == nil or p201.is_selected == nil then false else p201.is_selected
	}, t_102)
end

function t_102:encode() --[[ line: 20620 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3852 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3853, var3854 = protoModule.writeTag(buff, var3852, 1, protoModule.wireTypes.lengthDelimited)
		var3853, var3854 = protoModule.writeString(var3853, var3854, self.id)
		buff = var3853
		var3852 = var3854
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3855, var3856 = protoModule.writeTag(buff, var3852, 2, protoModule.wireTypes.lengthDelimited)
		var3855, var3856 = protoModule.writeString(var3855, var3856, self.display_name)
		buff = var3855
		var3852 = var3856
	end
	if self.is_selected then
		local var3857, var3858 = protoModule.writeTag(buff, var3852, 3, protoModule.wireTypes.varint)
		var3857, var3858 = protoModule.writeVarInt(var3857, var3858, if self.is_selected then 1 else 0)
		buff = var3857
		var3852 = var3858
	end
	local buff_1 = buffer.create(var3852)
	buffer.copy(buff_1, 0, buff, 0, var3852)
	
	return buff_1
end

function t_102.decode(p202) --[[ line: 20644 ]]
	-- upvalues: t_102 (ref), protoModule (ref)
	local var3860 = t_102.new()
	local var3861 = 0
	while var3861 < buffer.len(p202) do
		local _ = nil
		local var3862 = nil
		local var3863, var3864, var3865 = protoModule.readTag(p202, var3861)
		local var3866 = var3863
		var3862 = var3864
		var3861 = var3865
		
		if var3862 == protoModule.wireTypes.varint then
			if var3866 == 3 then
				local _ = nil
				local var3867, var3868 = protoModule.readVarInt(p202, var3861)
				var3861 = var3868
				var3860.is_selected = var3867 ~= 0
			else
				local _ = nil
				local var3869, var3870 = protoModule.readVarInt(p202, var3861)
				local _ = var3869
				var3861 = var3870
			end
		end
		if var3862 == protoModule.wireTypes.lengthDelimited then
			if var3866 == 1 then
				local _ = nil
				local var3871, var3872 = protoModule.readBuffer(p202, var3861)
				var3861 = var3872
				var3860.id = buffer.tostring(var3871)
			elseif var3866 == 2 then
				local _ = nil
				local var3873, var3874 = protoModule.readBuffer(p202, var3861)
				var3861 = var3874
				var3860.display_name = buffer.tostring(var3873)
			else
				local _ = nil
				local var3875, var3876 = protoModule.readVarInt(p202, var3861)
				var3861 = var3876 + var3875
			end
		elseif var3862 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3877, var3878 = protoModule.readFixed32(p202, var3861)
			local _ = var3877
			var3861 = var3878
		elseif var3862 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3879, var3880 = protoModule.readFixed64(p202, var3861)
			local _ = var3879
			var3861 = var3880
		else
			error("Unsupported wire type: " .. var3862)
		end
	end
	return var3860
end

function t_102:jsonEncode() --[[ line: 20697 ]]
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

function t_102:jsonDecode() --[[ line: 20715 ]]
	-- upvalues: t_102 (ref)
	local var3882 = t_102.new()
	
	if self.id ~= nil then
		var3882.id = self.id
	end
	if self.display_name ~= nil then
		var3882.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3882.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var3882.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var3882.is_selected = self.isSelected
	end
	return var3882
end

t_102.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = t_102
typeRegistryModule.default:register(t.SelectorOption)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p203) --[[ line: 20755 ]]
	-- upvalues: t_103 (ref)
	return setmetatable({
		layout = if p203 == nil or p203.layout == nil then nil else p203.layout,
		kind = if p203 == nil or p203.kind == nil then nil else p203.kind
	}, t_103)
end

function t_103:encode() --[[ line: 20762 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3884 = 0
	
	if self.layout ~= nil then
		local var3885 = self.layout:encode()
		local var3886, var3887 = protoModule.writeTag(buff, var3884, 1, protoModule.wireTypes.lengthDelimited)
		var3886, var3887 = protoModule.writeBuffer(var3886, var3887, var3885, buffer.len(var3885))
		buff = var3886
		var3884 = var3887
	end
	if self.kind ~= nil and self.kind.type == "universe" then
		local var3888 = self.kind.value:encode()
		local var3889, var3890 = protoModule.writeTag(buff, var3884, 2, protoModule.wireTypes.lengthDelimited)
		var3889, var3890 = protoModule.writeBuffer(var3889, var3890, var3888, buffer.len(var3888))
		buff = var3889
		var3884 = var3890
	end
	local buff_1 = buffer.create(var3884)
	buffer.copy(buff_1, 0, buff, 0, var3884)
	
	return buff_1
end

function t_103.decode(p204) --[[ line: 20785 ]]
	-- upvalues: t_103 (ref), protoModule (ref), t (ref)
	local var3892 = t_103.new()
	local var3893 = 0
	while var3893 < buffer.len(p204) do
		local _ = nil
		local var3894 = nil
		local var3895, var3896, var3897 = protoModule.readTag(p204, var3893)
		local var3898 = var3895
		var3894 = var3896
		var3893 = var3897
		
		if var3894 == protoModule.wireTypes.varint then
			local _ = nil
			local var3899, var3900 = protoModule.readVarInt(p204, var3893)
			local _ = var3899
			var3893 = var3900
			continue
		end
		if var3894 == protoModule.wireTypes.lengthDelimited then
			if var3898 == 1 then
				local _ = nil
				local var3901, var3902 = protoModule.readBuffer(p204, var3893)
				var3893 = var3902
				var3892.layout = t.ItemLayout.decode(var3901)
			elseif var3898 == 2 then
				local _ = nil
				local var3903, var3904 = protoModule.readBuffer(p204, var3893)
				var3893 = var3904
				var3892.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var3903)
				}
			else
				local _ = nil
				local var3905, var3906 = protoModule.readVarInt(p204, var3893)
				var3893 = var3906 + var3905
			end
		elseif var3894 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3907, var3908 = protoModule.readFixed32(p204, var3893)
			local _ = var3907
			var3893 = var3908
		elseif var3894 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3909, var3910 = protoModule.readFixed64(p204, var3893)
			local _ = var3909
			var3893 = var3910
		else
			error("Unsupported wire type: " .. var3894)
		end
	end
	return var3892
end

function t_103:jsonEncode() --[[ line: 20834 ]]
	local t = {}
	
	if self.layout ~= nil then
		t.layout = self.layout:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "universe" then
		t.universe = self.kind.value:jsonEncode()
	end
	return t
end

function t_103:jsonDecode() --[[ line: 20850 ]]
	-- upvalues: t_103 (ref), t (ref)
	local var3912 = t_103.new()
	
	if self.layout ~= nil then
		var3912.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var3912.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	return var3912
end

t_103.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = t_103
typeRegistryModule.default:register(t.ItemWithLayout)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p205) --[[ line: 20881 ]]
	-- upvalues: t_104 (ref)
	return setmetatable({
		items = if p205 == nil or p205.items == nil then {} else p205.items,
		collection_item_size = if p205 == nil or p205.collection_item_size == nil then nil else p205.collection_item_size
	}, t_104)
end

function t_104:encode() --[[ line: 20890 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3914 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3915 = v:encode()
			local var3916, var3917 = protoModule.writeTag(buff, var3914, 1, protoModule.wireTypes.lengthDelimited)
			var3916, var3917 = protoModule.writeBuffer(var3916, var3917, var3915, buffer.len(var3915))
			buff = var3916
			var3914 = var3917
		end
	end
	if self.collection_item_size ~= nil then
		local var3918, var3919 = protoModule.writeTag(buff, var3914, 2, protoModule.wireTypes.lengthDelimited)
		var3918, var3919 = protoModule.writeString(var3918, var3919, self.collection_item_size)
		buff = var3918
		var3914 = var3919
	end
	local buff_1 = buffer.create(var3914)
	buffer.copy(buff_1, 0, buff, 0, var3914)
	
	return buff_1
end

function t_104.decode(p206) --[[ line: 20912 ]]
	-- upvalues: t_104 (ref), protoModule (ref), t (ref)
	local var3921 = t_104.new()
	local var3922 = 0
	while var3922 < buffer.len(p206) do
		local _ = nil
		local var3923 = nil
		local var3924, var3925, var3926 = protoModule.readTag(p206, var3922)
		local var3927 = var3924
		var3923 = var3925
		var3922 = var3926
		
		if var3923 == protoModule.wireTypes.varint then
			local _ = nil
			local var3928, var3929 = protoModule.readVarInt(p206, var3922)
			local _ = var3928
			var3922 = var3929
			continue
		end
		if var3923 == protoModule.wireTypes.lengthDelimited then
			if var3927 == 1 then
				local _ = nil
				local var3930, var3931 = protoModule.readBuffer(p206, var3922)
				var3922 = var3931
				table.insert(var3921.items, t.ItemWithLayout.decode(var3930))
			elseif var3927 == 2 then
				local _ = nil
				local var3932, var3933 = protoModule.readBuffer(p206, var3922)
				var3922 = var3933
				var3921.collection_item_size = buffer.tostring(var3932)
			else
				local _ = nil
				local var3934, var3935 = protoModule.readVarInt(p206, var3922)
				var3922 = var3935 + var3934
			end
		elseif var3923 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3936, var3937 = protoModule.readFixed32(p206, var3922)
			local _ = var3936
			var3922 = var3937
		elseif var3923 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3938, var3939 = protoModule.readFixed64(p206, var3922)
			local _ = var3938
			var3922 = var3939
		else
			error("Unsupported wire type: " .. var3923)
		end
	end
	return var3921
end

function t_104:jsonEncode() --[[ line: 20960 ]]
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

function t_104:jsonDecode() --[[ line: 20978 ]]
	-- upvalues: t_104 (ref), t (ref)
	local var3942 = t_104.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var3942.items = t_1
	end
	if self.collection_item_size ~= nil then
		var3942.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var3942.collection_item_size = self.collectionItemSize
	end
	return var3942
end

t_104.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = t_104
typeRegistryModule.default:register(t.ContentPool)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p207) --[[ line: 21015 ]]
	-- upvalues: t_105 (ref)
	return setmetatable({
		col_span = if p207 == nil or p207.col_span == nil then 0 else p207.col_span,
		row_span = if p207 == nil or p207.row_span == nil then 0 else p207.row_span,
		alignment_type = if p207 == nil or p207.alignment_type == nil then "" else p207.alignment_type,
		min_row_padding = if p207 == nil or p207.min_row_padding == nil then 0 else p207.min_row_padding
	}, t_105)
end

function t_105:encode() --[[ line: 21024 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3945 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var3946, var3947 = protoModule.writeTag(buff, var3945, 1, protoModule.wireTypes.varint)
		var3946, var3947 = protoModule.writeVarInt(var3946, var3947, self.col_span)
		buff = var3946
		var3945 = var3947
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var3948, var3949 = protoModule.writeTag(buff, var3945, 2, protoModule.wireTypes.varint)
		var3948, var3949 = protoModule.writeVarInt(var3948, var3949, self.row_span)
		buff = var3948
		var3945 = var3949
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var3950, var3951 = protoModule.writeTag(buff, var3945, 3, protoModule.wireTypes.lengthDelimited)
		var3950, var3951 = protoModule.writeString(var3950, var3951, self.alignment_type)
		buff = var3950
		var3945 = var3951
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var3952, var3953 = protoModule.writeTag(buff, var3945, 4, protoModule.wireTypes.varint)
		var3952, var3953 = protoModule.writeVarInt(var3952, var3953, self.min_row_padding)
		buff = var3952
		var3945 = var3953
	end
	local buff_1 = buffer.create(var3945)
	buffer.copy(buff_1, 0, buff, 0, var3945)
	
	return buff_1
end

function t_105.decode(p208) --[[ line: 21053 ]]
	-- upvalues: t_105 (ref), protoModule (ref)
	local var3955 = t_105.new()
	local var3956 = 0
	while var3956 < buffer.len(p208) do
		local _ = nil
		local var3957 = nil
		local var3958, var3959, var3960 = protoModule.readTag(p208, var3956)
		local var3961 = var3958
		var3957 = var3959
		var3956 = var3960
		
		if var3957 == protoModule.wireTypes.varint then
			if var3961 == 1 then
				local _ = nil
				local var3962, var3963 = protoModule.readVarIntI32(p208, var3956)
				var3956 = var3963
				var3955.col_span = var3962
			elseif var3961 == 2 then
				local _ = nil
				local var3964, var3965 = protoModule.readVarIntI32(p208, var3956)
				var3956 = var3965
				var3955.row_span = var3964
			elseif var3961 == 4 then
				local _ = nil
				local var3966, var3967 = protoModule.readVarIntI32(p208, var3956)
				var3956 = var3967
				var3955.min_row_padding = var3966
			else
				local _ = nil
				local var3968, var3969 = protoModule.readVarInt(p208, var3956)
				local _ = var3968
				var3956 = var3969
			end
		end
		if var3957 == protoModule.wireTypes.lengthDelimited then
			if var3961 == 3 then
				local _ = nil
				local var3970, var3971 = protoModule.readBuffer(p208, var3956)
				var3956 = var3971
				var3955.alignment_type = buffer.tostring(var3970)
			else
				local _ = nil
				local var3972, var3973 = protoModule.readVarInt(p208, var3956)
				var3956 = var3973 + var3972
			end
		elseif var3957 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3974, var3975 = protoModule.readFixed32(p208, var3956)
			local _ = var3974
			var3956 = var3975
		elseif var3957 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3976, var3977 = protoModule.readFixed64(p208, var3956)
			local _ = var3976
			var3956 = var3977
		else
			error("Unsupported wire type: " .. var3957)
		end
	end
	return var3955
end

function t_105:jsonEncode() --[[ line: 21111 ]]
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

function t_105:jsonDecode() --[[ line: 21133 ]]
	-- upvalues: t_105 (ref)
	local var3979 = t_105.new()
	
	if self.col_span ~= nil then
		var3979.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var3979.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var3979.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var3979.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var3979.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var3979.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var3979.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var3979.min_row_padding = self.minRowPadding
	end
	return var3979
end

t_105.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = t_105
typeRegistryModule.default:register(t.ItemLayout)
t.PageEntryFormat = {
	fromNumber = function(p209) --[[ line: 21182 ]]
		return if p209 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p209 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p210) --[[ line: 21192 ]]
		return if p210 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p210 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p210
	end,
	fromName = function(p211) --[[ line: 21202 ]]
		return if p211 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p211 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
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
	CardContainerCardInputData = t.CardContainerCardInputData,
	CardContainerInputData = t.CardContainerInputData,
	CardInputData = t.CardInputData,
	DialogInputData = t.DialogInputData,
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
	UAMarketplaceCatalogItemGroupInputData = t.UAMarketplaceCatalogItemGroupInputData,
	UAMarketplaceCatalogItemCarouselInputData = t.UAMarketplaceCatalogItemCarouselInputData,
	WidgetStyleData = t.WidgetStyleData,
	UAMarketplaceCatalogHeroUnitInputData = t.UAMarketplaceCatalogHeroUnitInputData,
	UAMarketplaceCatalogFeedInputData = t.UAMarketplaceCatalogFeedInputData,
	UAMarketplaceCatalogCategoryMenuInputData = t.UAMarketplaceCatalogCategoryMenuInputData,
	UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem,
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
	ImageInputData = t.ImageInputData,
	TextInputData = t.TextInputData,
	VerticalFeedInputData = t.VerticalFeedInputData,
	PageHeaderInputData = t.PageHeaderInputData,
	OptionSelectorCarouselInputData = t.OptionSelectorCarouselInputData,
	SelectorOption = t.SelectorOption,
	ItemWithLayout = t.ItemWithLayout,
	ContentPool = t.ContentPool,
	ItemLayout = t.ItemLayout,
	PageEntryFormat = t.PageEntryFormat
}