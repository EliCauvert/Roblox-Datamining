local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local propConditionModule = require(script.Parent.prop_condition)
local propTypesModule = require(script.Parent.prop_types)
local propTypesEngineModule = require(script.Parent.prop_types_engine)
local shareLinkDataModule = require(script.Parent.share_link_data)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 4852 ]]
	-- upvalues: t (ref), t_1 (ref)
	return setmetatable({
		action_type = if p0 == nil or p0.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p0.action_type,
		action_params = if p0 == nil or p0.action_params == nil then nil else p0.action_params
	}, t_1)
end

function t_1:encode() --[[ line: 4861 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var161 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var162, var163 = protoModule.writeTag(buff, var161, 1, protoModule.wireTypes.varint)
		var162, var163 = protoModule.writeVarInt(var162, var163, t.ActionType.toNumber(self.action_type))
		buff = var162
		var161 = var163
	end
	if self.action_params ~= nil then
		local var164 = self.action_params:encode()
		local var165, var166 = protoModule.writeTag(buff, var161, 2, protoModule.wireTypes.lengthDelimited)
		var165, var166 = protoModule.writeBuffer(var165, var166, var164, buffer.len(var164))
		buff = var165
		var161 = var166
	end
	local buff_1 = buffer.create(var161)
	buffer.copy(buff_1, 0, buff, 0, var161)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 4887 ]]
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var168 = t_1.new()
	local var169 = 0
	while var169 < buffer.len(p1) do
		local _ = nil
		local var170 = nil
		local var171, var172, var173 = protoModule.readTag(p1, var169)
		local var174 = var171
		var170 = var172
		var169 = var173
		
		if var170 == protoModule.wireTypes.varint then
			if var174 == 1 then
				local _ = nil
				local var175, var176 = protoModule.readVarIntI32(p1, var169)
				local var177 = var175
				var169 = var176
				var168.action_type = t.ActionType.fromNumber(var177) or var177
			else
				local _ = nil
				local var178, var179 = protoModule.readVarInt(p1, var169)
				local _ = var178
				var169 = var179
			end
		end
		if var170 == protoModule.wireTypes.lengthDelimited then
			if var174 == 2 then
				local _ = nil
				local var180, var181 = protoModule.readBuffer(p1, var169)
				var169 = var181
				var168.action_params = t.DismissDialogAction_Params.decode(var180)
			else
				local _ = nil
				local var182, var183 = protoModule.readVarInt(p1, var169)
				var169 = var183 + var182
			end
		elseif var170 == protoModule.wireTypes.i32 then
			local _ = nil
			local var184, var185 = protoModule.readFixed32(p1, var169)
			local _ = var184
			var169 = var185
		elseif var170 == protoModule.wireTypes.i64 then
			local _ = nil
			local var186, var187 = protoModule.readFixed64(p1, var169)
			local _ = var186
			var169 = var187
		else
			error("Unsupported wire type: " .. var170)
		end
	end
	return var168
end

function t_1:jsonEncode() --[[ line: 4935 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_1:jsonDecode() --[[ line: 4957 ]]
	-- upvalues: t_1 (ref), t (ref)
	local var189 = t_1.new()
	
	if self.action_type ~= nil then
		var189.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var189.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var189.action_params = t.DismissDialogAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var189.action_params = t.DismissDialogAction_Params.jsonDecode(self.actionParams)
	end
	return var189
end

t_1.descriptor = {
	name = "DismissDialogAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissDialogAction"
}
t.DismissDialogAction = t_1
typeRegistryModule.default:register(t.DismissDialogAction)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 4997 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		dialog_type = if p2 == nil or p2.dialog_type == nil then nil else p2.dialog_type
	}, t_2)
end

function t_2:encode() --[[ line: 5005 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var191 = 0
	
	if self.dialog_type ~= nil then
		local var192 = self.dialog_type:encode()
		local var193, var194 = protoModule.writeTag(buff, var191, 1, protoModule.wireTypes.lengthDelimited)
		var193, var194 = protoModule.writeBuffer(var193, var194, var192, buffer.len(var192))
		buff = var193
		var191 = var194
	end
	local buff_1 = buffer.create(var191)
	buffer.copy(buff_1, 0, buff, 0, var191)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 5020 ]]
	-- upvalues: t_2 (ref), protoModule (ref), propTypesModule (ref)
	local var196 = t_2.new()
	local var197 = 0
	while var197 < buffer.len(p3) do
		local _ = nil
		local var198 = nil
		local var199, var200, var201 = protoModule.readTag(p3, var197)
		local var202 = var199
		var198 = var200
		var197 = var201
		
		if var198 == protoModule.wireTypes.varint then
			local _ = nil
			local var203, var204 = protoModule.readVarInt(p3, var197)
			local _ = var203
			var197 = var204
			continue
		end
		if var198 == protoModule.wireTypes.lengthDelimited then
			if var202 == 1 then
				local _ = nil
				local var205, var206 = protoModule.readBuffer(p3, var197)
				var197 = var206
				var196.dialog_type = propTypesModule.StringProp.decode(var205)
			else
				local _ = nil
				local var207, var208 = protoModule.readVarInt(p3, var197)
				var197 = var208 + var207
			end
		elseif var198 == protoModule.wireTypes.i32 then
			local _ = nil
			local var209, var210 = protoModule.readFixed32(p3, var197)
			local _ = var209
			var197 = var210
		elseif var198 == protoModule.wireTypes.i64 then
			local _ = nil
			local var211, var212 = protoModule.readFixed64(p3, var197)
			local _ = var211
			var197 = var212
		else
			error("Unsupported wire type: " .. var198)
		end
	end
	return var196
end

function t_2:jsonEncode() --[[ line: 5063 ]]
	local t = {}
	
	if self.dialog_type ~= nil then
		t.dialogType = self.dialog_type:jsonEncode()
	end
	return t
end

function t_2:jsonDecode() --[[ line: 5073 ]]
	-- upvalues: t_2 (ref), propTypesModule (ref)
	local var214 = t_2.new()
	
	if self.dialog_type ~= nil then
		var214.dialog_type = propTypesModule.StringProp.jsonDecode(self.dialog_type)
	end
	if self.dialogType ~= nil then
		var214.dialog_type = propTypesModule.StringProp.jsonDecode(self.dialogType)
	end
	return var214
end

t_2.descriptor = {
	name = "DismissDialogAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissDialogAction_Params = t_2
typeRegistryModule.default:register(t.DismissDialogAction_Params)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 5102 ]]
	-- upvalues: t (ref), t_3 (ref)
	return setmetatable({
		action_type = if p4 == nil or p4.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p4.action_type,
		action_params = if p4 == nil or p4.action_params == nil then nil else p4.action_params
	}, t_3)
end

function t_3:encode() --[[ line: 5111 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var216 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var217, var218 = protoModule.writeTag(buff, var216, 1, protoModule.wireTypes.varint)
		var217, var218 = protoModule.writeVarInt(var217, var218, t.ActionType.toNumber(self.action_type))
		buff = var217
		var216 = var218
	end
	if self.action_params ~= nil then
		local var219 = self.action_params:encode()
		local var220, var221 = protoModule.writeTag(buff, var216, 2, protoModule.wireTypes.lengthDelimited)
		var220, var221 = protoModule.writeBuffer(var220, var221, var219, buffer.len(var219))
		buff = var220
		var216 = var221
	end
	local buff_1 = buffer.create(var216)
	buffer.copy(buff_1, 0, buff, 0, var216)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 5137 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var223 = t_3.new()
	local var224 = 0
	while var224 < buffer.len(p5) do
		local _ = nil
		local var225 = nil
		local var226, var227, var228 = protoModule.readTag(p5, var224)
		local var229 = var226
		var225 = var227
		var224 = var228
		
		if var225 == protoModule.wireTypes.varint then
			if var229 == 1 then
				local _ = nil
				local var230, var231 = protoModule.readVarIntI32(p5, var224)
				local var232 = var230
				var224 = var231
				var223.action_type = t.ActionType.fromNumber(var232) or var232
			else
				local _ = nil
				local var233, var234 = protoModule.readVarInt(p5, var224)
				local _ = var233
				var224 = var234
			end
		end
		if var225 == protoModule.wireTypes.lengthDelimited then
			if var229 == 2 then
				local _ = nil
				local var235, var236 = protoModule.readBuffer(p5, var224)
				var224 = var236
				var223.action_params = t.LinkAction_Params.decode(var235)
			else
				local _ = nil
				local var237, var238 = protoModule.readVarInt(p5, var224)
				var224 = var238 + var237
			end
		elseif var225 == protoModule.wireTypes.i32 then
			local _ = nil
			local var239, var240 = protoModule.readFixed32(p5, var224)
			local _ = var239
			var224 = var240
		elseif var225 == protoModule.wireTypes.i64 then
			local _ = nil
			local var241, var242 = protoModule.readFixed64(p5, var224)
			local _ = var241
			var224 = var242
		else
			error("Unsupported wire type: " .. var225)
		end
	end
	return var223
end

function t_3:jsonEncode() --[[ line: 5185 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_3:jsonDecode() --[[ line: 5207 ]]
	-- upvalues: t_3 (ref), t (ref)
	local var244 = t_3.new()
	
	if self.action_type ~= nil then
		var244.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var244.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var244.action_params = t.LinkAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var244.action_params = t.LinkAction_Params.jsonDecode(self.actionParams)
	end
	return var244
end

t_3.descriptor = {
	name = "LinkAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LinkAction"
}
t.LinkAction = t_3
typeRegistryModule.default:register(t.LinkAction)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 5247 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		url = if p6 == nil or p6.url == nil then nil else p6.url,
		title_key = if p6 == nil or p6.title_key == nil then nil else p6.title_key,
		on_webview_close = if p6 == nil or p6.on_webview_close == nil then nil else p6.on_webview_close
	}, t_4)
end

function t_4:encode() --[[ line: 5255 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var246 = 0
	
	if self.url ~= nil then
		local var247 = self.url:encode()
		local var248, var249 = protoModule.writeTag(buff, var246, 1, protoModule.wireTypes.lengthDelimited)
		var248, var249 = protoModule.writeBuffer(var248, var249, var247, buffer.len(var247))
		buff = var248
		var246 = var249
	end
	if self.title_key ~= nil then
		local var250 = self.title_key:encode()
		local var251, var252 = protoModule.writeTag(buff, var246, 2, protoModule.wireTypes.lengthDelimited)
		var251, var252 = protoModule.writeBuffer(var251, var252, var250, buffer.len(var250))
		buff = var251
		var246 = var252
	end
	if self.on_webview_close ~= nil then
		local var253 = self.on_webview_close:encode()
		local var254, var255 = protoModule.writeTag(buff, var246, 4, protoModule.wireTypes.lengthDelimited)
		var254, var255 = protoModule.writeBuffer(var254, var255, var253, buffer.len(var253))
		buff = var254
		var246 = var255
	end
	local buff_1 = buffer.create(var246)
	buffer.copy(buff_1, 0, buff, 0, var246)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 5282 ]]
	-- upvalues: t_4 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var257 = t_4.new()
	local var258 = 0
	while var258 < buffer.len(p7) do
		local _ = nil
		local var259 = nil
		local var260, var261, var262 = protoModule.readTag(p7, var258)
		local var263 = var260
		var259 = var261
		var258 = var262
		
		if var259 == protoModule.wireTypes.varint then
			local _ = nil
			local var264, var265 = protoModule.readVarInt(p7, var258)
			local _ = var264
			var258 = var265
			continue
		end
		if var259 == protoModule.wireTypes.lengthDelimited then
			if var263 == 1 then
				local _ = nil
				local var266, var267 = protoModule.readBuffer(p7, var258)
				var258 = var267
				var257.url = propTypesModule.StringProp.decode(var266)
			elseif var263 == 2 then
				local _ = nil
				local var268, var269 = protoModule.readBuffer(p7, var258)
				var258 = var269
				var257.title_key = propTypesModule.StringProp.decode(var268)
			elseif var263 == 4 then
				local _ = nil
				local var270, var271 = protoModule.readBuffer(p7, var258)
				var258 = var271
				var257.on_webview_close = t.ActionProp.decode(var270)
			else
				local _ = nil
				local var272, var273 = protoModule.readVarInt(p7, var258)
				var258 = var273 + var272
			end
		elseif var259 == protoModule.wireTypes.i32 then
			local _ = nil
			local var274, var275 = protoModule.readFixed32(p7, var258)
			local _ = var274
			var258 = var275
		elseif var259 == protoModule.wireTypes.i64 then
			local _ = nil
			local var276, var277 = protoModule.readFixed64(p7, var258)
			local _ = var276
			var258 = var277
		else
			error("Unsupported wire type: " .. var259)
		end
	end
	return var257
end

function t_4:jsonEncode() --[[ line: 5335 ]]
	local t = {}
	
	if self.url ~= nil then
		t.url = self.url:jsonEncode()
	end
	if self.title_key ~= nil then
		t.titleKey = self.title_key:jsonEncode()
	end
	if self.on_webview_close ~= nil then
		t.onWebviewClose = self.on_webview_close:jsonEncode()
	end
	return t
end

function t_4:jsonDecode() --[[ line: 5353 ]]
	-- upvalues: t_4 (ref), propTypesModule (ref), t (ref)
	local var279 = t_4.new()
	
	if self.url ~= nil then
		var279.url = propTypesModule.StringProp.jsonDecode(self.url)
	end
	if self.title_key ~= nil then
		var279.title_key = propTypesModule.StringProp.jsonDecode(self.title_key)
	end
	if self.titleKey ~= nil then
		var279.title_key = propTypesModule.StringProp.jsonDecode(self.titleKey)
	end
	if self.on_webview_close ~= nil then
		var279.on_webview_close = t.ActionProp.jsonDecode(self.on_webview_close)
	end
	if self.onWebviewClose ~= nil then
		var279.on_webview_close = t.ActionProp.jsonDecode(self.onWebviewClose)
	end
	return var279
end

t_4.descriptor = {
	name = "LinkAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LinkAction_Params = t_4
typeRegistryModule.default:register(t.LinkAction_Params)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 5393 ]]
	-- upvalues: t (ref), t_5 (ref)
	return setmetatable({
		action_type = if p8 == nil or p8.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p8.action_type,
		action_params = if p8 == nil or p8.action_params == nil then nil else p8.action_params
	}, t_5)
end

function t_5:encode() --[[ line: 5402 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var281 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var282, var283 = protoModule.writeTag(buff, var281, 1, protoModule.wireTypes.varint)
		var282, var283 = protoModule.writeVarInt(var282, var283, t.ActionType.toNumber(self.action_type))
		buff = var282
		var281 = var283
	end
	if self.action_params ~= nil then
		local var284 = self.action_params:encode()
		local var285, var286 = protoModule.writeTag(buff, var281, 2, protoModule.wireTypes.lengthDelimited)
		var285, var286 = protoModule.writeBuffer(var285, var286, var284, buffer.len(var284))
		buff = var285
		var281 = var286
	end
	local buff_1 = buffer.create(var281)
	buffer.copy(buff_1, 0, buff, 0, var281)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 5428 ]]
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var288 = t_5.new()
	local var289 = 0
	while var289 < buffer.len(p9) do
		local _ = nil
		local var290 = nil
		local var291, var292, var293 = protoModule.readTag(p9, var289)
		local var294 = var291
		var290 = var292
		var289 = var293
		
		if var290 == protoModule.wireTypes.varint then
			if var294 == 1 then
				local _ = nil
				local var295, var296 = protoModule.readVarIntI32(p9, var289)
				local var297 = var295
				var289 = var296
				var288.action_type = t.ActionType.fromNumber(var297) or var297
			else
				local _ = nil
				local var298, var299 = protoModule.readVarInt(p9, var289)
				local _ = var298
				var289 = var299
			end
		end
		if var290 == protoModule.wireTypes.lengthDelimited then
			if var294 == 2 then
				local _ = nil
				local var300, var301 = protoModule.readBuffer(p9, var289)
				var289 = var301
				var288.action_params = t.OpenSocialLinkAction_Params.decode(var300)
			else
				local _ = nil
				local var302, var303 = protoModule.readVarInt(p9, var289)
				var289 = var303 + var302
			end
		elseif var290 == protoModule.wireTypes.i32 then
			local _ = nil
			local var304, var305 = protoModule.readFixed32(p9, var289)
			local _ = var304
			var289 = var305
		elseif var290 == protoModule.wireTypes.i64 then
			local _ = nil
			local var306, var307 = protoModule.readFixed64(p9, var289)
			local _ = var306
			var289 = var307
		else
			error("Unsupported wire type: " .. var290)
		end
	end
	return var288
end

function t_5:jsonEncode() --[[ line: 5476 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_5:jsonDecode() --[[ line: 5498 ]]
	-- upvalues: t_5 (ref), t (ref)
	local var309 = t_5.new()
	
	if self.action_type ~= nil then
		var309.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var309.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var309.action_params = t.OpenSocialLinkAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var309.action_params = t.OpenSocialLinkAction_Params.jsonDecode(self.actionParams)
	end
	return var309
end

t_5.descriptor = {
	name = "OpenSocialLinkAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSocialLinkAction"
}
t.OpenSocialLinkAction = t_5
typeRegistryModule.default:register(t.OpenSocialLinkAction)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 5538 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		assignment_id = if p10 == nil or p10.assignment_id == nil then nil else p10.assignment_id,
		assignment_type = if p10 == nil or p10.assignment_type == nil then nil else p10.assignment_type,
		social_link_type = if p10 == nil or p10.social_link_type == nil then nil else p10.social_link_type,
		social_link_url = if p10 == nil or p10.social_link_url == nil then nil else p10.social_link_url,
		social_link_display_type = if p10 == nil or p10.social_link_display_type == nil then nil else p10.social_link_display_type
	}, t_6)
end

function t_6:encode() --[[ line: 5552 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var311 = 0
	
	if self.assignment_id ~= nil then
		local var312 = self.assignment_id:encode()
		local var313, var314 = protoModule.writeTag(buff, var311, 1, protoModule.wireTypes.lengthDelimited)
		var313, var314 = protoModule.writeBuffer(var313, var314, var312, buffer.len(var312))
		buff = var313
		var311 = var314
	end
	if self.assignment_type ~= nil then
		local var315 = self.assignment_type:encode()
		local var316, var317 = protoModule.writeTag(buff, var311, 2, protoModule.wireTypes.lengthDelimited)
		var316, var317 = protoModule.writeBuffer(var316, var317, var315, buffer.len(var315))
		buff = var316
		var311 = var317
	end
	if self.social_link_type ~= nil then
		local var318 = self.social_link_type:encode()
		local var319, var320 = protoModule.writeTag(buff, var311, 3, protoModule.wireTypes.lengthDelimited)
		var319, var320 = protoModule.writeBuffer(var319, var320, var318, buffer.len(var318))
		buff = var319
		var311 = var320
	end
	if self.social_link_url ~= nil then
		local var321 = self.social_link_url:encode()
		local var322, var323 = protoModule.writeTag(buff, var311, 4, protoModule.wireTypes.lengthDelimited)
		var322, var323 = protoModule.writeBuffer(var322, var323, var321, buffer.len(var321))
		buff = var322
		var311 = var323
	end
	if self.social_link_display_type ~= nil then
		local var324 = self.social_link_display_type:encode()
		local var325, var326 = protoModule.writeTag(buff, var311, 5, protoModule.wireTypes.lengthDelimited)
		var325, var326 = protoModule.writeBuffer(var325, var326, var324, buffer.len(var324))
		buff = var325
		var311 = var326
	end
	local buff_1 = buffer.create(var311)
	buffer.copy(buff_1, 0, buff, 0, var311)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 5591 ]]
	-- upvalues: t_6 (ref), protoModule (ref), propTypesModule (ref)
	local var328 = t_6.new()
	local var329 = 0
	while var329 < buffer.len(p11) do
		local _ = nil
		local var330 = nil
		local var331, var332, var333 = protoModule.readTag(p11, var329)
		local var334 = var331
		var330 = var332
		var329 = var333
		
		if var330 == protoModule.wireTypes.varint then
			local _ = nil
			local var335, var336 = protoModule.readVarInt(p11, var329)
			local _ = var335
			var329 = var336
			continue
		end
		if var330 == protoModule.wireTypes.lengthDelimited then
			if var334 == 1 then
				local _ = nil
				local var337, var338 = protoModule.readBuffer(p11, var329)
				var329 = var338
				var328.assignment_id = propTypesModule.StringProp.decode(var337)
			elseif var334 == 2 then
				local _ = nil
				local var339, var340 = protoModule.readBuffer(p11, var329)
				var329 = var340
				var328.assignment_type = propTypesModule.StringProp.decode(var339)
			elseif var334 == 3 then
				local _ = nil
				local var341, var342 = protoModule.readBuffer(p11, var329)
				var329 = var342
				var328.social_link_type = propTypesModule.StringProp.decode(var341)
			elseif var334 == 4 then
				local _ = nil
				local var343, var344 = protoModule.readBuffer(p11, var329)
				var329 = var344
				var328.social_link_url = propTypesModule.StringProp.decode(var343)
			elseif var334 == 5 then
				local _ = nil
				local var345, var346 = protoModule.readBuffer(p11, var329)
				var329 = var346
				var328.social_link_display_type = propTypesModule.StringProp.decode(var345)
			else
				local _ = nil
				local var347, var348 = protoModule.readVarInt(p11, var329)
				var329 = var348 + var347
			end
		elseif var330 == protoModule.wireTypes.i32 then
			local _ = nil
			local var349, var350 = protoModule.readFixed32(p11, var329)
			local _ = var349
			var329 = var350
		elseif var330 == protoModule.wireTypes.i64 then
			local _ = nil
			local var351, var352 = protoModule.readFixed64(p11, var329)
			local _ = var351
			var329 = var352
		else
			error("Unsupported wire type: " .. var330)
		end
	end
	return var328
end

function t_6:jsonEncode() --[[ line: 5655 ]]
	local t = {}
	
	if self.assignment_id ~= nil then
		t.assignmentId = self.assignment_id:jsonEncode()
	end
	if self.assignment_type ~= nil then
		t.assignmentType = self.assignment_type:jsonEncode()
	end
	if self.social_link_type ~= nil then
		t.socialLinkType = self.social_link_type:jsonEncode()
	end
	if self.social_link_url ~= nil then
		t.socialLinkUrl = self.social_link_url:jsonEncode()
	end
	if self.social_link_display_type ~= nil then
		t.socialLinkDisplayType = self.social_link_display_type:jsonEncode()
	end
	return t
end

function t_6:jsonDecode() --[[ line: 5681 ]]
	-- upvalues: t_6 (ref), propTypesModule (ref)
	local var354 = t_6.new()
	
	if self.assignment_id ~= nil then
		var354.assignment_id = propTypesModule.StringProp.jsonDecode(self.assignment_id)
	end
	if self.assignmentId ~= nil then
		var354.assignment_id = propTypesModule.StringProp.jsonDecode(self.assignmentId)
	end
	if self.assignment_type ~= nil then
		var354.assignment_type = propTypesModule.StringProp.jsonDecode(self.assignment_type)
	end
	if self.assignmentType ~= nil then
		var354.assignment_type = propTypesModule.StringProp.jsonDecode(self.assignmentType)
	end
	if self.social_link_type ~= nil then
		var354.social_link_type = propTypesModule.StringProp.jsonDecode(self.social_link_type)
	end
	if self.socialLinkType ~= nil then
		var354.social_link_type = propTypesModule.StringProp.jsonDecode(self.socialLinkType)
	end
	if self.social_link_url ~= nil then
		var354.social_link_url = propTypesModule.StringProp.jsonDecode(self.social_link_url)
	end
	if self.socialLinkUrl ~= nil then
		var354.social_link_url = propTypesModule.StringProp.jsonDecode(self.socialLinkUrl)
	end
	if self.social_link_display_type ~= nil then
		var354.social_link_display_type = propTypesModule.StringProp.jsonDecode(self.social_link_display_type)
	end
	if self.socialLinkDisplayType ~= nil then
		var354.social_link_display_type = propTypesModule.StringProp.jsonDecode(self.socialLinkDisplayType)
	end
	return var354
end

t_6.descriptor = {
	name = "OpenSocialLinkAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSocialLinkAction_Params = t_6
typeRegistryModule.default:register(t.OpenSocialLinkAction_Params)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12) --[[ line: 5751 ]]
	-- upvalues: t (ref), t_7 (ref)
	return setmetatable({
		action_type = if p12 == nil or p12.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p12.action_type,
		action_params = if p12 == nil or p12.action_params == nil then nil else p12.action_params
	}, t_7)
end

function t_7:encode() --[[ line: 5760 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var356 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var357, var358 = protoModule.writeTag(buff, var356, 1, protoModule.wireTypes.varint)
		var357, var358 = protoModule.writeVarInt(var357, var358, t.ActionType.toNumber(self.action_type))
		buff = var357
		var356 = var358
	end
	if self.action_params ~= nil then
		local var359 = self.action_params:encode()
		local var360, var361 = protoModule.writeTag(buff, var356, 2, protoModule.wireTypes.lengthDelimited)
		var360, var361 = protoModule.writeBuffer(var360, var361, var359, buffer.len(var359))
		buff = var360
		var356 = var361
	end
	local buff_1 = buffer.create(var356)
	buffer.copy(buff_1, 0, buff, 0, var356)
	
	return buff_1
end

function t_7.decode(p13) --[[ line: 5786 ]]
	-- upvalues: t_7 (ref), protoModule (ref), t (ref)
	local var363 = t_7.new()
	local var364 = 0
	while var364 < buffer.len(p13) do
		local _ = nil
		local var365 = nil
		local var366, var367, var368 = protoModule.readTag(p13, var364)
		local var369 = var366
		var365 = var367
		var364 = var368
		
		if var365 == protoModule.wireTypes.varint then
			if var369 == 1 then
				local _ = nil
				local var370, var371 = protoModule.readVarIntI32(p13, var364)
				local var372 = var370
				var364 = var371
				var363.action_type = t.ActionType.fromNumber(var372) or var372
			else
				local _ = nil
				local var373, var374 = protoModule.readVarInt(p13, var364)
				local _ = var373
				var364 = var374
			end
		end
		if var365 == protoModule.wireTypes.lengthDelimited then
			if var369 == 2 then
				local _ = nil
				local var375, var376 = protoModule.readBuffer(p13, var364)
				var364 = var376
				var363.action_params = t.OpenGameDetailsAction_Params.decode(var375)
			else
				local _ = nil
				local var377, var378 = protoModule.readVarInt(p13, var364)
				var364 = var378 + var377
			end
		elseif var365 == protoModule.wireTypes.i32 then
			local _ = nil
			local var379, var380 = protoModule.readFixed32(p13, var364)
			local _ = var379
			var364 = var380
		elseif var365 == protoModule.wireTypes.i64 then
			local _ = nil
			local var381, var382 = protoModule.readFixed64(p13, var364)
			local _ = var381
			var364 = var382
		else
			error("Unsupported wire type: " .. var365)
		end
	end
	return var363
end

function t_7:jsonEncode() --[[ line: 5834 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_7:jsonDecode() --[[ line: 5856 ]]
	-- upvalues: t_7 (ref), t (ref)
	local var384 = t_7.new()
	
	if self.action_type ~= nil then
		var384.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var384.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var384.action_params = t.OpenGameDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var384.action_params = t.OpenGameDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var384
end

t_7.descriptor = {
	name = "OpenGameDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameDetailsAction"
}
t.OpenGameDetailsAction = t_7
typeRegistryModule.default:register(t.OpenGameDetailsAction)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14) --[[ line: 5896 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		place_id = if p14 == nil or p14.place_id == nil then nil else p14.place_id,
		universe_id = if p14 == nil or p14.universe_id == nil then nil else p14.universe_id,
		inherit_referral_session = if p14 == nil or p14.inherit_referral_session == nil then nil else p14.inherit_referral_session
	}, t_8)
end

function t_8:encode() --[[ line: 5908 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var386 = 0
	
	if self.place_id ~= nil then
		local var387 = self.place_id:encode()
		local var388, var389 = protoModule.writeTag(buff, var386, 1, protoModule.wireTypes.lengthDelimited)
		var388, var389 = protoModule.writeBuffer(var388, var389, var387, buffer.len(var387))
		buff = var388
		var386 = var389
	end
	if self.universe_id ~= nil then
		local var390 = self.universe_id:encode()
		local var391, var392 = protoModule.writeTag(buff, var386, 2, protoModule.wireTypes.lengthDelimited)
		var391, var392 = protoModule.writeBuffer(var391, var392, var390, buffer.len(var390))
		buff = var391
		var386 = var392
	end
	if self.inherit_referral_session ~= nil then
		local var393 = self.inherit_referral_session:encode()
		local var394, var395 = protoModule.writeTag(buff, var386, 3, protoModule.wireTypes.lengthDelimited)
		var394, var395 = protoModule.writeBuffer(var394, var395, var393, buffer.len(var393))
		buff = var394
		var386 = var395
	end
	local buff_1 = buffer.create(var386)
	buffer.copy(buff_1, 0, buff, 0, var386)
	
	return buff_1
end

function t_8.decode(p15) --[[ line: 5935 ]]
	-- upvalues: t_8 (ref), protoModule (ref), propTypesModule (ref)
	local var397 = t_8.new()
	local var398 = 0
	while var398 < buffer.len(p15) do
		local _ = nil
		local var399 = nil
		local var400, var401, var402 = protoModule.readTag(p15, var398)
		local var403 = var400
		var399 = var401
		var398 = var402
		
		if var399 == protoModule.wireTypes.varint then
			local _ = nil
			local var404, var405 = protoModule.readVarInt(p15, var398)
			local _ = var404
			var398 = var405
			continue
		end
		if var399 == protoModule.wireTypes.lengthDelimited then
			if var403 == 1 then
				local _ = nil
				local var406, var407 = protoModule.readBuffer(p15, var398)
				var398 = var407
				var397.place_id = propTypesModule.StringProp.decode(var406)
			elseif var403 == 2 then
				local _ = nil
				local var408, var409 = protoModule.readBuffer(p15, var398)
				var398 = var409
				var397.universe_id = propTypesModule.StringProp.decode(var408)
			elseif var403 == 3 then
				local _ = nil
				local var410, var411 = protoModule.readBuffer(p15, var398)
				var398 = var411
				var397.inherit_referral_session = propTypesModule.BoolProp.decode(var410)
			else
				local _ = nil
				local var412, var413 = protoModule.readVarInt(p15, var398)
				var398 = var413 + var412
			end
		elseif var399 == protoModule.wireTypes.i32 then
			local _ = nil
			local var414, var415 = protoModule.readFixed32(p15, var398)
			local _ = var414
			var398 = var415
		elseif var399 == protoModule.wireTypes.i64 then
			local _ = nil
			local var416, var417 = protoModule.readFixed64(p15, var398)
			local _ = var416
			var398 = var417
		else
			error("Unsupported wire type: " .. var399)
		end
	end
	return var397
end

function t_8:jsonEncode() --[[ line: 5989 ]]
	local t = {}
	
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.inherit_referral_session ~= nil then
		t.inheritReferralSession = self.inherit_referral_session:jsonEncode()
	end
	return t
end

function t_8:jsonDecode() --[[ line: 6007 ]]
	-- upvalues: t_8 (ref), propTypesModule (ref)
	local var419 = t_8.new()
	
	if self.place_id ~= nil then
		var419.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var419.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var419.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var419.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.inherit_referral_session ~= nil then
		var419.inherit_referral_session = propTypesModule.BoolProp.jsonDecode(self.inherit_referral_session)
	end
	if self.inheritReferralSession ~= nil then
		var419.inherit_referral_session = propTypesModule.BoolProp.jsonDecode(self.inheritReferralSession)
	end
	return var419
end

t_8.descriptor = {
	name = "OpenGameDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameDetailsAction_Params = t_8
typeRegistryModule.default:register(t.OpenGameDetailsAction_Params)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16) --[[ line: 6054 ]]
	-- upvalues: t (ref), t_9 (ref)
	return setmetatable({
		action_type = if p16 == nil or p16.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p16.action_type,
		action_params = if p16 == nil or p16.action_params == nil then nil else p16.action_params
	}, t_9)
end

function t_9:encode() --[[ line: 6063 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var421 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var422, var423 = protoModule.writeTag(buff, var421, 1, protoModule.wireTypes.varint)
		var422, var423 = protoModule.writeVarInt(var422, var423, t.ActionType.toNumber(self.action_type))
		buff = var422
		var421 = var423
	end
	if self.action_params ~= nil then
		local var424 = self.action_params:encode()
		local var425, var426 = protoModule.writeTag(buff, var421, 2, protoModule.wireTypes.lengthDelimited)
		var425, var426 = protoModule.writeBuffer(var425, var426, var424, buffer.len(var424))
		buff = var425
		var421 = var426
	end
	local buff_1 = buffer.create(var421)
	buffer.copy(buff_1, 0, buff, 0, var421)
	
	return buff_1
end

function t_9.decode(p17) --[[ line: 6089 ]]
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var428 = t_9.new()
	local var429 = 0
	while var429 < buffer.len(p17) do
		local _ = nil
		local var430 = nil
		local var431, var432, var433 = protoModule.readTag(p17, var429)
		local var434 = var431
		var430 = var432
		var429 = var433
		
		if var430 == protoModule.wireTypes.varint then
			if var434 == 1 then
				local _ = nil
				local var435, var436 = protoModule.readVarIntI32(p17, var429)
				local var437 = var435
				var429 = var436
				var428.action_type = t.ActionType.fromNumber(var437) or var437
			else
				local _ = nil
				local var438, var439 = protoModule.readVarInt(p17, var429)
				local _ = var438
				var429 = var439
			end
		end
		if var430 == protoModule.wireTypes.lengthDelimited then
			if var434 == 2 then
				local _ = nil
				local var440, var441 = protoModule.readBuffer(p17, var429)
				var429 = var441
				var428.action_params = t.OpenJoinFriendsAction_Params.decode(var440)
			else
				local _ = nil
				local var442, var443 = protoModule.readVarInt(p17, var429)
				var429 = var443 + var442
			end
		elseif var430 == protoModule.wireTypes.i32 then
			local _ = nil
			local var444, var445 = protoModule.readFixed32(p17, var429)
			local _ = var444
			var429 = var445
		elseif var430 == protoModule.wireTypes.i64 then
			local _ = nil
			local var446, var447 = protoModule.readFixed64(p17, var429)
			local _ = var446
			var429 = var447
		else
			error("Unsupported wire type: " .. var430)
		end
	end
	return var428
end

function t_9:jsonEncode() --[[ line: 6137 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_9:jsonDecode() --[[ line: 6159 ]]
	-- upvalues: t_9 (ref), t (ref)
	local var449 = t_9.new()
	
	if self.action_type ~= nil then
		var449.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var449.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var449.action_params = t.OpenJoinFriendsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var449.action_params = t.OpenJoinFriendsAction_Params.jsonDecode(self.actionParams)
	end
	return var449
end

t_9.descriptor = {
	name = "OpenJoinFriendsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenJoinFriendsAction"
}
t.OpenJoinFriendsAction = t_9
typeRegistryModule.default:register(t.OpenJoinFriendsAction)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p18) --[[ line: 6199 ]]
	-- upvalues: t_10 (ref)
	return setmetatable({
		place_id = if p18 == nil or p18.place_id == nil then nil else p18.place_id,
		universe_id = if p18 == nil or p18.universe_id == nil then nil else p18.universe_id
	}, t_10)
end

function t_10:encode() --[[ line: 6208 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var451 = 0
	
	if self.place_id ~= nil then
		local var452 = self.place_id:encode()
		local var453, var454 = protoModule.writeTag(buff, var451, 1, protoModule.wireTypes.lengthDelimited)
		var453, var454 = protoModule.writeBuffer(var453, var454, var452, buffer.len(var452))
		buff = var453
		var451 = var454
	end
	if self.universe_id ~= nil then
		local var455 = self.universe_id:encode()
		local var456, var457 = protoModule.writeTag(buff, var451, 2, protoModule.wireTypes.lengthDelimited)
		var456, var457 = protoModule.writeBuffer(var456, var457, var455, buffer.len(var455))
		buff = var456
		var451 = var457
	end
	local buff_1 = buffer.create(var451)
	buffer.copy(buff_1, 0, buff, 0, var451)
	
	return buff_1
end

function t_10.decode(p19) --[[ line: 6229 ]]
	-- upvalues: t_10 (ref), protoModule (ref), propTypesModule (ref)
	local var459 = t_10.new()
	local var460 = 0
	while var460 < buffer.len(p19) do
		local _ = nil
		local var461 = nil
		local var462, var463, var464 = protoModule.readTag(p19, var460)
		local var465 = var462
		var461 = var463
		var460 = var464
		
		if var461 == protoModule.wireTypes.varint then
			local _ = nil
			local var466, var467 = protoModule.readVarInt(p19, var460)
			local _ = var466
			var460 = var467
			continue
		end
		if var461 == protoModule.wireTypes.lengthDelimited then
			if var465 == 1 then
				local _ = nil
				local var468, var469 = protoModule.readBuffer(p19, var460)
				var460 = var469
				var459.place_id = propTypesModule.StringProp.decode(var468)
			elseif var465 == 2 then
				local _ = nil
				local var470, var471 = protoModule.readBuffer(p19, var460)
				var460 = var471
				var459.universe_id = propTypesModule.StringProp.decode(var470)
			else
				local _ = nil
				local var472, var473 = protoModule.readVarInt(p19, var460)
				var460 = var473 + var472
			end
		elseif var461 == protoModule.wireTypes.i32 then
			local _ = nil
			local var474, var475 = protoModule.readFixed32(p19, var460)
			local _ = var474
			var460 = var475
		elseif var461 == protoModule.wireTypes.i64 then
			local _ = nil
			local var476, var477 = protoModule.readFixed64(p19, var460)
			local _ = var476
			var460 = var477
		else
			error("Unsupported wire type: " .. var461)
		end
	end
	return var459
end

function t_10:jsonEncode() --[[ line: 6277 ]]
	local t = {}
	
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_10:jsonDecode() --[[ line: 6291 ]]
	-- upvalues: t_10 (ref), propTypesModule (ref)
	local var479 = t_10.new()
	
	if self.place_id ~= nil then
		var479.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var479.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var479.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var479.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var479
end

t_10.descriptor = {
	name = "OpenJoinFriendsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenJoinFriendsAction_Params = t_10
typeRegistryModule.default:register(t.OpenJoinFriendsAction_Params)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p20) --[[ line: 6328 ]]
	-- upvalues: t (ref), t_11 (ref)
	return setmetatable({
		action_type = if p20 == nil or p20.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p20.action_type,
		action_params = if p20 == nil or p20.action_params == nil then nil else p20.action_params
	}, t_11)
end

function t_11:encode() --[[ line: 6339 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var481 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var482, var483 = protoModule.writeTag(buff, var481, 1, protoModule.wireTypes.varint)
		var482, var483 = protoModule.writeVarInt(var482, var483, t.ActionType.toNumber(self.action_type))
		buff = var482
		var481 = var483
	end
	if self.action_params ~= nil then
		local var484 = self.action_params:encode()
		local var485, var486 = protoModule.writeTag(buff, var481, 2, protoModule.wireTypes.lengthDelimited)
		var485, var486 = protoModule.writeBuffer(var485, var486, var484, buffer.len(var484))
		buff = var485
		var481 = var486
	end
	local buff_1 = buffer.create(var481)
	buffer.copy(buff_1, 0, buff, 0, var481)
	
	return buff_1
end

function t_11.decode(p21) --[[ line: 6365 ]]
	-- upvalues: t_11 (ref), protoModule (ref), t (ref)
	local var488 = t_11.new()
	local var489 = 0
	while var489 < buffer.len(p21) do
		local _ = nil
		local var490 = nil
		local var491, var492, var493 = protoModule.readTag(p21, var489)
		local var494 = var491
		var490 = var492
		var489 = var493
		
		if var490 == protoModule.wireTypes.varint then
			if var494 == 1 then
				local _ = nil
				local var495, var496 = protoModule.readVarIntI32(p21, var489)
				local var497 = var495
				var489 = var496
				var488.action_type = t.ActionType.fromNumber(var497) or var497
			else
				local _ = nil
				local var498, var499 = protoModule.readVarInt(p21, var489)
				local _ = var498
				var489 = var499
			end
		end
		if var490 == protoModule.wireTypes.lengthDelimited then
			if var494 == 2 then
				local _ = nil
				local var500, var501 = protoModule.readBuffer(p21, var489)
				var489 = var501
				var488.action_params = t.OpenMarketplaceTryOnAction_Params.decode(var500)
			else
				local _ = nil
				local var502, var503 = protoModule.readVarInt(p21, var489)
				var489 = var503 + var502
			end
		elseif var490 == protoModule.wireTypes.i32 then
			local _ = nil
			local var504, var505 = protoModule.readFixed32(p21, var489)
			local _ = var504
			var489 = var505
		elseif var490 == protoModule.wireTypes.i64 then
			local _ = nil
			local var506, var507 = protoModule.readFixed64(p21, var489)
			local _ = var506
			var489 = var507
		else
			error("Unsupported wire type: " .. var490)
		end
	end
	return var488
end

function t_11:jsonEncode() --[[ line: 6413 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_11:jsonDecode() --[[ line: 6435 ]]
	-- upvalues: t_11 (ref), t (ref)
	local var509 = t_11.new()
	
	if self.action_type ~= nil then
		var509.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var509.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var509.action_params = t.OpenMarketplaceTryOnAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var509.action_params = t.OpenMarketplaceTryOnAction_Params.jsonDecode(self.actionParams)
	end
	return var509
end

t_11.descriptor = {
	name = "OpenMarketplaceTryOnAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceTryOnAction"
}
t.OpenMarketplaceTryOnAction = t_11
typeRegistryModule.default:register(t.OpenMarketplaceTryOnAction)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p22) --[[ line: 6475 ]]
	-- upvalues: t_12 (ref)
	return setmetatable({
		item_id = if p22 == nil or p22.item_id == nil then nil else p22.item_id,
		item_type = if p22 == nil or p22.item_type == nil then nil else p22.item_type,
		item_sub_type_name = if p22 == nil or p22.item_sub_type_name == nil then nil else p22.item_sub_type_name
	}, t_12)
end

function t_12:encode() --[[ line: 6485 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var511 = 0
	
	if self.item_id ~= nil then
		local var512 = self.item_id:encode()
		local var513, var514 = protoModule.writeTag(buff, var511, 1, protoModule.wireTypes.lengthDelimited)
		var513, var514 = protoModule.writeBuffer(var513, var514, var512, buffer.len(var512))
		buff = var513
		var511 = var514
	end
	if self.item_type ~= nil then
		local var515 = self.item_type:encode()
		local var516, var517 = protoModule.writeTag(buff, var511, 2, protoModule.wireTypes.lengthDelimited)
		var516, var517 = protoModule.writeBuffer(var516, var517, var515, buffer.len(var515))
		buff = var516
		var511 = var517
	end
	if self.item_sub_type_name ~= nil then
		local var518 = self.item_sub_type_name:encode()
		local var519, var520 = protoModule.writeTag(buff, var511, 3, protoModule.wireTypes.lengthDelimited)
		var519, var520 = protoModule.writeBuffer(var519, var520, var518, buffer.len(var518))
		buff = var519
		var511 = var520
	end
	local buff_1 = buffer.create(var511)
	buffer.copy(buff_1, 0, buff, 0, var511)
	
	return buff_1
end

function t_12.decode(p23) --[[ line: 6512 ]]
	-- upvalues: t_12 (ref), protoModule (ref), propTypesModule (ref)
	local var522 = t_12.new()
	local var523 = 0
	while var523 < buffer.len(p23) do
		local _ = nil
		local var524 = nil
		local var525, var526, var527 = protoModule.readTag(p23, var523)
		local var528 = var525
		var524 = var526
		var523 = var527
		
		if var524 == protoModule.wireTypes.varint then
			local _ = nil
			local var529, var530 = protoModule.readVarInt(p23, var523)
			local _ = var529
			var523 = var530
			continue
		end
		if var524 == protoModule.wireTypes.lengthDelimited then
			if var528 == 1 then
				local _ = nil
				local var531, var532 = protoModule.readBuffer(p23, var523)
				var523 = var532
				var522.item_id = propTypesModule.StringProp.decode(var531)
			elseif var528 == 2 then
				local _ = nil
				local var533, var534 = protoModule.readBuffer(p23, var523)
				var523 = var534
				var522.item_type = propTypesModule.StringProp.decode(var533)
			elseif var528 == 3 then
				local _ = nil
				local var535, var536 = protoModule.readBuffer(p23, var523)
				var523 = var536
				var522.item_sub_type_name = propTypesModule.StringProp.decode(var535)
			else
				local _ = nil
				local var537, var538 = protoModule.readVarInt(p23, var523)
				var523 = var538 + var537
			end
		elseif var524 == protoModule.wireTypes.i32 then
			local _ = nil
			local var539, var540 = protoModule.readFixed32(p23, var523)
			local _ = var539
			var523 = var540
		elseif var524 == protoModule.wireTypes.i64 then
			local _ = nil
			local var541, var542 = protoModule.readFixed64(p23, var523)
			local _ = var541
			var523 = var542
		else
			error("Unsupported wire type: " .. var524)
		end
	end
	return var522
end

function t_12:jsonEncode() --[[ line: 6565 ]]
	local t = {}
	
	if self.item_id ~= nil then
		t.itemId = self.item_id:jsonEncode()
	end
	if self.item_type ~= nil then
		t.itemType = self.item_type:jsonEncode()
	end
	if self.item_sub_type_name ~= nil then
		t.itemSubTypeName = self.item_sub_type_name:jsonEncode()
	end
	return t
end

function t_12:jsonDecode() --[[ line: 6583 ]]
	-- upvalues: t_12 (ref), propTypesModule (ref)
	local var544 = t_12.new()
	
	if self.item_id ~= nil then
		var544.item_id = propTypesModule.StringProp.jsonDecode(self.item_id)
	end
	if self.itemId ~= nil then
		var544.item_id = propTypesModule.StringProp.jsonDecode(self.itemId)
	end
	if self.item_type ~= nil then
		var544.item_type = propTypesModule.StringProp.jsonDecode(self.item_type)
	end
	if self.itemType ~= nil then
		var544.item_type = propTypesModule.StringProp.jsonDecode(self.itemType)
	end
	if self.item_sub_type_name ~= nil then
		var544.item_sub_type_name = propTypesModule.StringProp.jsonDecode(self.item_sub_type_name)
	end
	if self.itemSubTypeName ~= nil then
		var544.item_sub_type_name = propTypesModule.StringProp.jsonDecode(self.itemSubTypeName)
	end
	return var544
end

t_12.descriptor = {
	name = "OpenMarketplaceTryOnAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceTryOnAction_Params = t_12
typeRegistryModule.default:register(t.OpenMarketplaceTryOnAction_Params)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p24) --[[ line: 6631 ]]
	-- upvalues: t (ref), t_13 (ref)
	return setmetatable({
		action_type = if p24 == nil or p24.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p24.action_type,
		action_params = if p24 == nil or p24.action_params == nil then nil else p24.action_params
	}, t_13)
end

function t_13:encode() --[[ line: 6640 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var546 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var547, var548 = protoModule.writeTag(buff, var546, 1, protoModule.wireTypes.varint)
		var547, var548 = protoModule.writeVarInt(var547, var548, t.ActionType.toNumber(self.action_type))
		buff = var547
		var546 = var548
	end
	if self.action_params ~= nil then
		local var549 = self.action_params:encode()
		local var550, var551 = protoModule.writeTag(buff, var546, 2, protoModule.wireTypes.lengthDelimited)
		var550, var551 = protoModule.writeBuffer(var550, var551, var549, buffer.len(var549))
		buff = var550
		var546 = var551
	end
	local buff_1 = buffer.create(var546)
	buffer.copy(buff_1, 0, buff, 0, var546)
	
	return buff_1
end

function t_13.decode(p25) --[[ line: 6666 ]]
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var553 = t_13.new()
	local var554 = 0
	while var554 < buffer.len(p25) do
		local _ = nil
		local var555 = nil
		local var556, var557, var558 = protoModule.readTag(p25, var554)
		local var559 = var556
		var555 = var557
		var554 = var558
		
		if var555 == protoModule.wireTypes.varint then
			if var559 == 1 then
				local _ = nil
				local var560, var561 = protoModule.readVarIntI32(p25, var554)
				local var562 = var560
				var554 = var561
				var553.action_type = t.ActionType.fromNumber(var562) or var562
			else
				local _ = nil
				local var563, var564 = protoModule.readVarInt(p25, var554)
				local _ = var563
				var554 = var564
			end
		end
		if var555 == protoModule.wireTypes.lengthDelimited then
			if var559 == 2 then
				local _ = nil
				local var565, var566 = protoModule.readBuffer(p25, var554)
				var554 = var566
				var553.action_params = t.OpenSeeAllAction_Params.decode(var565)
			else
				local _ = nil
				local var567, var568 = protoModule.readVarInt(p25, var554)
				var554 = var568 + var567
			end
		elseif var555 == protoModule.wireTypes.i32 then
			local _ = nil
			local var569, var570 = protoModule.readFixed32(p25, var554)
			local _ = var569
			var554 = var570
		elseif var555 == protoModule.wireTypes.i64 then
			local _ = nil
			local var571, var572 = protoModule.readFixed64(p25, var554)
			local _ = var571
			var554 = var572
		else
			error("Unsupported wire type: " .. var555)
		end
	end
	return var553
end

function t_13:jsonEncode() --[[ line: 6714 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_13:jsonDecode() --[[ line: 6736 ]]
	-- upvalues: t_13 (ref), t (ref)
	local var574 = t_13.new()
	
	if self.action_type ~= nil then
		var574.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var574.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var574.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var574.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var574
end

t_13.descriptor = {
	name = "OpenSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSeeAllAction"
}
t.OpenSeeAllAction = t_13
typeRegistryModule.default:register(t.OpenSeeAllAction)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p26) --[[ line: 6776 ]]
	-- upvalues: t_14 (ref)
	return setmetatable({
		collection_id = if p26 == nil or p26.collection_id == nil then nil else p26.collection_id,
		game_set_target_id = if p26 == nil or p26.game_set_target_id == nil then nil else p26.game_set_target_id,
		collection_position = if p26 == nil or p26.collection_position == nil then nil else p26.collection_position
	}, t_14)
end

function t_14:encode() --[[ line: 6786 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var576 = 0
	
	if self.collection_id ~= nil then
		local var577 = self.collection_id:encode()
		local var578, var579 = protoModule.writeTag(buff, var576, 1, protoModule.wireTypes.lengthDelimited)
		var578, var579 = protoModule.writeBuffer(var578, var579, var577, buffer.len(var577))
		buff = var578
		var576 = var579
	end
	if self.game_set_target_id ~= nil then
		local var580 = self.game_set_target_id:encode()
		local var581, var582 = protoModule.writeTag(buff, var576, 2, protoModule.wireTypes.lengthDelimited)
		var581, var582 = protoModule.writeBuffer(var581, var582, var580, buffer.len(var580))
		buff = var581
		var576 = var582
	end
	if self.collection_position ~= nil then
		local var583 = self.collection_position:encode()
		local var584, var585 = protoModule.writeTag(buff, var576, 3, protoModule.wireTypes.lengthDelimited)
		var584, var585 = protoModule.writeBuffer(var584, var585, var583, buffer.len(var583))
		buff = var584
		var576 = var585
	end
	local buff_1 = buffer.create(var576)
	buffer.copy(buff_1, 0, buff, 0, var576)
	
	return buff_1
end

function t_14.decode(p27) --[[ line: 6813 ]]
	-- upvalues: t_14 (ref), protoModule (ref), propTypesModule (ref)
	local var587 = t_14.new()
	local var588 = 0
	while var588 < buffer.len(p27) do
		local _ = nil
		local var589 = nil
		local var590, var591, var592 = protoModule.readTag(p27, var588)
		local var593 = var590
		var589 = var591
		var588 = var592
		
		if var589 == protoModule.wireTypes.varint then
			local _ = nil
			local var594, var595 = protoModule.readVarInt(p27, var588)
			local _ = var594
			var588 = var595
			continue
		end
		if var589 == protoModule.wireTypes.lengthDelimited then
			if var593 == 1 then
				local _ = nil
				local var596, var597 = protoModule.readBuffer(p27, var588)
				var588 = var597
				var587.collection_id = propTypesModule.StringProp.decode(var596)
			elseif var593 == 2 then
				local _ = nil
				local var598, var599 = protoModule.readBuffer(p27, var588)
				var588 = var599
				var587.game_set_target_id = propTypesModule.StringProp.decode(var598)
			elseif var593 == 3 then
				local _ = nil
				local var600, var601 = protoModule.readBuffer(p27, var588)
				var588 = var601
				var587.collection_position = propTypesModule.StringProp.decode(var600)
			else
				local _ = nil
				local var602, var603 = protoModule.readVarInt(p27, var588)
				var588 = var603 + var602
			end
		elseif var589 == protoModule.wireTypes.i32 then
			local _ = nil
			local var604, var605 = protoModule.readFixed32(p27, var588)
			local _ = var604
			var588 = var605
		elseif var589 == protoModule.wireTypes.i64 then
			local _ = nil
			local var606, var607 = protoModule.readFixed64(p27, var588)
			local _ = var606
			var588 = var607
		else
			error("Unsupported wire type: " .. var589)
		end
	end
	return var587
end

function t_14:jsonEncode() --[[ line: 6867 ]]
	local t = {}
	
	if self.collection_id ~= nil then
		t.collectionId = self.collection_id:jsonEncode()
	end
	if self.game_set_target_id ~= nil then
		t.gameSetTargetId = self.game_set_target_id:jsonEncode()
	end
	if self.collection_position ~= nil then
		t.collectionPosition = self.collection_position:jsonEncode()
	end
	return t
end

function t_14:jsonDecode() --[[ line: 6885 ]]
	-- upvalues: t_14 (ref), propTypesModule (ref)
	local var609 = t_14.new()
	
	if self.collection_id ~= nil then
		var609.collection_id = propTypesModule.StringProp.jsonDecode(self.collection_id)
	end
	if self.collectionId ~= nil then
		var609.collection_id = propTypesModule.StringProp.jsonDecode(self.collectionId)
	end
	if self.game_set_target_id ~= nil then
		var609.game_set_target_id = propTypesModule.StringProp.jsonDecode(self.game_set_target_id)
	end
	if self.gameSetTargetId ~= nil then
		var609.game_set_target_id = propTypesModule.StringProp.jsonDecode(self.gameSetTargetId)
	end
	if self.collection_position ~= nil then
		var609.collection_position = propTypesModule.StringProp.jsonDecode(self.collection_position)
	end
	if self.collectionPosition ~= nil then
		var609.collection_position = propTypesModule.StringProp.jsonDecode(self.collectionPosition)
	end
	return var609
end

t_14.descriptor = {
	name = "OpenSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSeeAllAction_Params = t_14
typeRegistryModule.default:register(t.OpenSeeAllAction_Params)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p28) --[[ line: 6935 ]]
	-- upvalues: t (ref), t_15 (ref)
	return setmetatable({
		action_type = if p28 == nil or p28.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p28.action_type,
		action_params = if p28 == nil or p28.action_params == nil then nil else p28.action_params
	}, t_15)
end

function t_15:encode() --[[ line: 6946 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var611 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var612, var613 = protoModule.writeTag(buff, var611, 1, protoModule.wireTypes.varint)
		var612, var613 = protoModule.writeVarInt(var612, var613, t.ActionType.toNumber(self.action_type))
		buff = var612
		var611 = var613
	end
	if self.action_params ~= nil then
		local var614 = self.action_params:encode()
		local var615, var616 = protoModule.writeTag(buff, var611, 2, protoModule.wireTypes.lengthDelimited)
		var615, var616 = protoModule.writeBuffer(var615, var616, var614, buffer.len(var614))
		buff = var615
		var611 = var616
	end
	local buff_1 = buffer.create(var611)
	buffer.copy(buff_1, 0, buff, 0, var611)
	
	return buff_1
end

function t_15.decode(p29) --[[ line: 6972 ]]
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var618 = t_15.new()
	local var619 = 0
	while var619 < buffer.len(p29) do
		local _ = nil
		local var620 = nil
		local var621, var622, var623 = protoModule.readTag(p29, var619)
		local var624 = var621
		var620 = var622
		var619 = var623
		
		if var620 == protoModule.wireTypes.varint then
			if var624 == 1 then
				local _ = nil
				local var625, var626 = protoModule.readVarIntI32(p29, var619)
				local var627 = var625
				var619 = var626
				var618.action_type = t.ActionType.fromNumber(var627) or var627
			else
				local _ = nil
				local var628, var629 = protoModule.readVarInt(p29, var619)
				local _ = var628
				var619 = var629
			end
		end
		if var620 == protoModule.wireTypes.lengthDelimited then
			if var624 == 2 then
				local _ = nil
				local var630, var631 = protoModule.readBuffer(p29, var619)
				var619 = var631
				var618.action_params = t.OpenSponsoredTooltipAction_Params.decode(var630)
			else
				local _ = nil
				local var632, var633 = protoModule.readVarInt(p29, var619)
				var619 = var633 + var632
			end
		elseif var620 == protoModule.wireTypes.i32 then
			local _ = nil
			local var634, var635 = protoModule.readFixed32(p29, var619)
			local _ = var634
			var619 = var635
		elseif var620 == protoModule.wireTypes.i64 then
			local _ = nil
			local var636, var637 = protoModule.readFixed64(p29, var619)
			local _ = var636
			var619 = var637
		else
			error("Unsupported wire type: " .. var620)
		end
	end
	return var618
end

function t_15:jsonEncode() --[[ line: 7020 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_15:jsonDecode() --[[ line: 7042 ]]
	-- upvalues: t_15 (ref), t (ref)
	local var639 = t_15.new()
	
	if self.action_type ~= nil then
		var639.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var639.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var639.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var639.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return var639
end

t_15.descriptor = {
	name = "OpenSponsoredTooltipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSponsoredTooltipAction"
}
t.OpenSponsoredTooltipAction = t_15
typeRegistryModule.default:register(t.OpenSponsoredTooltipAction)
local t_16 = {}
t_16.__index = t_16

function t_16.new(_) --[[ line: 7082 ]]
	-- upvalues: t_16 (ref)
	return setmetatable({}, t_16)
end

function t_16.encode(_) --[[ line: 7088 ]]
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_16.decode(p30) --[[ line: 7097 ]]
	-- upvalues: t_16 (ref), protoModule (ref)
	local var641 = t_16.new()
	local var642 = 0
	while var642 < buffer.len(p30) do
		local var643 = nil
		local _ = nil
		local var644, var645, var646 = protoModule.readTag(p30, var642)
		var643 = var644
		local var647 = var645
		var642 = var646
		
		if var647 == protoModule.wireTypes.varint then
			local _ = nil
			local var648, var649 = protoModule.readVarInt(p30, var642)
			local _ = var648
			var642 = var649
		elseif var647 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var650, var651 = protoModule.readVarInt(p30, var642)
			var642 = var651 + var650
		elseif var647 == protoModule.wireTypes.i32 then
			local _ = nil
			local var652, var653 = protoModule.readFixed32(p30, var642)
			local _ = var652
			var642 = var653
		elseif var647 == protoModule.wireTypes.i64 then
			local _ = nil
			local var654, var655 = protoModule.readFixed64(p30, var642)
			local _ = var654
			var642 = var655
		else
			error("Unsupported wire type: " .. var647)
		end
	end
	return var641
end

function t_16.jsonEncode(_) --[[ line: 7135 ]]
	return {}
end

function t_16.jsonDecode(_) --[[ line: 7141 ]]
	-- upvalues: t_16 (ref)
	return t_16.new()
end

t_16.descriptor = {
	name = "OpenSponsoredTooltipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSponsoredTooltipAction_Params = t_16
typeRegistryModule.default:register(t.OpenSponsoredTooltipAction_Params)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p31) --[[ line: 7163 ]]
	-- upvalues: t (ref), t_17 (ref)
	return setmetatable({
		action_type = if p31 == nil or p31.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p31.action_type,
		action_params = if p31 == nil or p31.action_params == nil then nil else p31.action_params
	}, t_17)
end

function t_17:encode() --[[ line: 7172 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var657 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var658, var659 = protoModule.writeTag(buff, var657, 1, protoModule.wireTypes.varint)
		var658, var659 = protoModule.writeVarInt(var658, var659, t.ActionType.toNumber(self.action_type))
		buff = var658
		var657 = var659
	end
	if self.action_params ~= nil then
		local var660 = self.action_params:encode()
		local var661, var662 = protoModule.writeTag(buff, var657, 2, protoModule.wireTypes.lengthDelimited)
		var661, var662 = protoModule.writeBuffer(var661, var662, var660, buffer.len(var660))
		buff = var661
		var657 = var662
	end
	local buff_1 = buffer.create(var657)
	buffer.copy(buff_1, 0, buff, 0, var657)
	
	return buff_1
end

function t_17.decode(p32) --[[ line: 7198 ]]
	-- upvalues: t_17 (ref), protoModule (ref), t (ref)
	local var664 = t_17.new()
	local var665 = 0
	while var665 < buffer.len(p32) do
		local _ = nil
		local var666 = nil
		local var667, var668, var669 = protoModule.readTag(p32, var665)
		local var670 = var667
		var666 = var668
		var665 = var669
		
		if var666 == protoModule.wireTypes.varint then
			if var670 == 1 then
				local _ = nil
				local var671, var672 = protoModule.readVarIntI32(p32, var665)
				local var673 = var671
				var665 = var672
				var664.action_type = t.ActionType.fromNumber(var673) or var673
			else
				local _ = nil
				local var674, var675 = protoModule.readVarInt(p32, var665)
				local _ = var674
				var665 = var675
			end
		end
		if var666 == protoModule.wireTypes.lengthDelimited then
			if var670 == 2 then
				local _ = nil
				local var676, var677 = protoModule.readBuffer(p32, var665)
				var665 = var677
				var664.action_params = t.PlayButtonClickAction_Params.decode(var676)
			else
				local _ = nil
				local var678, var679 = protoModule.readVarInt(p32, var665)
				var665 = var679 + var678
			end
		elseif var666 == protoModule.wireTypes.i32 then
			local _ = nil
			local var680, var681 = protoModule.readFixed32(p32, var665)
			local _ = var680
			var665 = var681
		elseif var666 == protoModule.wireTypes.i64 then
			local _ = nil
			local var682, var683 = protoModule.readFixed64(p32, var665)
			local _ = var682
			var665 = var683
		else
			error("Unsupported wire type: " .. var666)
		end
	end
	return var664
end

function t_17:jsonEncode() --[[ line: 7246 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_17:jsonDecode() --[[ line: 7268 ]]
	-- upvalues: t_17 (ref), t (ref)
	local var685 = t_17.new()
	
	if self.action_type ~= nil then
		var685.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var685.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var685.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var685.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.actionParams)
	end
	return var685
end

t_17.descriptor = {
	name = "PlayButtonClickAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.PlayButtonClickAction"
}
t.PlayButtonClickAction = t_17
typeRegistryModule.default:register(t.PlayButtonClickAction)
local t_18 = {}
t_18.__index = t_18

function t_18.new(_) --[[ line: 7308 ]]
	-- upvalues: t_18 (ref)
	return setmetatable({}, t_18)
end

function t_18.encode(_) --[[ line: 7314 ]]
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_18.decode(p33) --[[ line: 7323 ]]
	-- upvalues: t_18 (ref), protoModule (ref)
	local var687 = t_18.new()
	local var688 = 0
	while var688 < buffer.len(p33) do
		local var689 = nil
		local _ = nil
		local var690, var691, var692 = protoModule.readTag(p33, var688)
		var689 = var690
		local var693 = var691
		var688 = var692
		
		if var693 == protoModule.wireTypes.varint then
			local _ = nil
			local var694, var695 = protoModule.readVarInt(p33, var688)
			local _ = var694
			var688 = var695
		elseif var693 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var696, var697 = protoModule.readVarInt(p33, var688)
			var688 = var697 + var696
		elseif var693 == protoModule.wireTypes.i32 then
			local _ = nil
			local var698, var699 = protoModule.readFixed32(p33, var688)
			local _ = var698
			var688 = var699
		elseif var693 == protoModule.wireTypes.i64 then
			local _ = nil
			local var700, var701 = protoModule.readFixed64(p33, var688)
			local _ = var700
			var688 = var701
		else
			error("Unsupported wire type: " .. var693)
		end
	end
	return var687
end

function t_18.jsonEncode(_) --[[ line: 7361 ]]
	return {}
end

function t_18.jsonDecode(_) --[[ line: 7367 ]]
	-- upvalues: t_18 (ref)
	return t_18.new()
end

t_18.descriptor = {
	name = "PlayButtonClickAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.PlayButtonClickAction_Params = t_18
typeRegistryModule.default:register(t.PlayButtonClickAction_Params)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p34) --[[ line: 7387 ]]
	-- upvalues: t (ref), t_19 (ref)
	return setmetatable({
		action_type = if p34 == nil or p34.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p34.action_type,
		action_params = if p34 == nil or p34.action_params == nil then nil else p34.action_params
	}, t_19)
end

function t_19:encode() --[[ line: 7396 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var703 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var704, var705 = protoModule.writeTag(buff, var703, 1, protoModule.wireTypes.varint)
		var704, var705 = protoModule.writeVarInt(var704, var705, t.ActionType.toNumber(self.action_type))
		buff = var704
		var703 = var705
	end
	if self.action_params ~= nil then
		local var706 = self.action_params:encode()
		local var707, var708 = protoModule.writeTag(buff, var703, 2, protoModule.wireTypes.lengthDelimited)
		var707, var708 = protoModule.writeBuffer(var707, var708, var706, buffer.len(var706))
		buff = var707
		var703 = var708
	end
	local buff_1 = buffer.create(var703)
	buffer.copy(buff_1, 0, buff, 0, var703)
	
	return buff_1
end

function t_19.decode(p35) --[[ line: 7422 ]]
	-- upvalues: t_19 (ref), protoModule (ref), t (ref)
	local var710 = t_19.new()
	local var711 = 0
	while var711 < buffer.len(p35) do
		local _ = nil
		local var712 = nil
		local var713, var714, var715 = protoModule.readTag(p35, var711)
		local var716 = var713
		var712 = var714
		var711 = var715
		
		if var712 == protoModule.wireTypes.varint then
			if var716 == 1 then
				local _ = nil
				local var717, var718 = protoModule.readVarIntI32(p35, var711)
				local var719 = var717
				var711 = var718
				var710.action_type = t.ActionType.fromNumber(var719) or var719
			else
				local _ = nil
				local var720, var721 = protoModule.readVarInt(p35, var711)
				local _ = var720
				var711 = var721
			end
		end
		if var712 == protoModule.wireTypes.lengthDelimited then
			if var716 == 2 then
				local _ = nil
				local var722, var723 = protoModule.readBuffer(p35, var711)
				var711 = var723
				var710.action_params = t.UpdateUserSettingsAction_Params.decode(var722)
			else
				local _ = nil
				local var724, var725 = protoModule.readVarInt(p35, var711)
				var711 = var725 + var724
			end
		elseif var712 == protoModule.wireTypes.i32 then
			local _ = nil
			local var726, var727 = protoModule.readFixed32(p35, var711)
			local _ = var726
			var711 = var727
		elseif var712 == protoModule.wireTypes.i64 then
			local _ = nil
			local var728, var729 = protoModule.readFixed64(p35, var711)
			local _ = var728
			var711 = var729
		else
			error("Unsupported wire type: " .. var712)
		end
	end
	return var710
end

function t_19:jsonEncode() --[[ line: 7470 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_19:jsonDecode() --[[ line: 7492 ]]
	-- upvalues: t_19 (ref), t (ref)
	local var731 = t_19.new()
	
	if self.action_type ~= nil then
		var731.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var731.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var731.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var731.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.actionParams)
	end
	return var731
end

t_19.descriptor = {
	name = "UpdateUserSettingsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.UpdateUserSettingsAction"
}
t.UpdateUserSettingsAction = t_19
typeRegistryModule.default:register(t.UpdateUserSettingsAction)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p36) --[[ line: 7532 ]]
	-- upvalues: t_20 (ref)
	return setmetatable({
		settings = if p36 == nil or p36.settings == nil then nil else p36.settings,
		audit_data = if p36 == nil or p36.audit_data == nil then nil else p36.audit_data
	}, t_20)
end

function t_20:encode() --[[ line: 7541 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var733 = 0
	
	if self.settings ~= nil then
		local var734 = self.settings:encode()
		local var735, var736 = protoModule.writeTag(buff, var733, 1, protoModule.wireTypes.lengthDelimited)
		var735, var736 = protoModule.writeBuffer(var735, var736, var734, buffer.len(var734))
		buff = var735
		var733 = var736
	end
	if self.audit_data ~= nil then
		local var737 = self.audit_data:encode()
		local var738, var739 = protoModule.writeTag(buff, var733, 2, protoModule.wireTypes.lengthDelimited)
		var738, var739 = protoModule.writeBuffer(var738, var739, var737, buffer.len(var737))
		buff = var738
		var733 = var739
	end
	local buff_1 = buffer.create(var733)
	buffer.copy(buff_1, 0, buff, 0, var733)
	
	return buff_1
end

function t_20.decode(p37) --[[ line: 7562 ]]
	-- upvalues: t_20 (ref), protoModule (ref), propTypesModule (ref)
	local var741 = t_20.new()
	local var742 = 0
	while var742 < buffer.len(p37) do
		local _ = nil
		local var743 = nil
		local var744, var745, var746 = protoModule.readTag(p37, var742)
		local var747 = var744
		var743 = var745
		var742 = var746
		
		if var743 == protoModule.wireTypes.varint then
			local _ = nil
			local var748, var749 = protoModule.readVarInt(p37, var742)
			local _ = var748
			var742 = var749
			continue
		end
		if var743 == protoModule.wireTypes.lengthDelimited then
			if var747 == 1 then
				local _ = nil
				local var750, var751 = protoModule.readBuffer(p37, var742)
				var742 = var751
				var741.settings = propTypesModule.StructProp.decode(var750)
			elseif var747 == 2 then
				local _ = nil
				local var752, var753 = protoModule.readBuffer(p37, var742)
				var742 = var753
				var741.audit_data = propTypesModule.StringProp.decode(var752)
			else
				local _ = nil
				local var754, var755 = protoModule.readVarInt(p37, var742)
				var742 = var755 + var754
			end
		elseif var743 == protoModule.wireTypes.i32 then
			local _ = nil
			local var756, var757 = protoModule.readFixed32(p37, var742)
			local _ = var756
			var742 = var757
		elseif var743 == protoModule.wireTypes.i64 then
			local _ = nil
			local var758, var759 = protoModule.readFixed64(p37, var742)
			local _ = var758
			var742 = var759
		else
			error("Unsupported wire type: " .. var743)
		end
	end
	return var741
end

function t_20:jsonEncode() --[[ line: 7610 ]]
	local t = {}
	
	if self.settings ~= nil then
		t.settings = self.settings:jsonEncode()
	end
	if self.audit_data ~= nil then
		t.auditData = self.audit_data:jsonEncode()
	end
	return t
end

function t_20:jsonDecode() --[[ line: 7624 ]]
	-- upvalues: t_20 (ref), propTypesModule (ref)
	local var761 = t_20.new()
	
	if self.settings ~= nil then
		var761.settings = propTypesModule.StructProp.jsonDecode(self.settings)
	end
	if self.audit_data ~= nil then
		var761.audit_data = propTypesModule.StringProp.jsonDecode(self.audit_data)
	end
	if self.auditData ~= nil then
		var761.audit_data = propTypesModule.StringProp.jsonDecode(self.auditData)
	end
	return var761
end

t_20.descriptor = {
	name = "UpdateUserSettingsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.UpdateUserSettingsAction_Params = t_20
typeRegistryModule.default:register(t.UpdateUserSettingsAction_Params)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p38) --[[ line: 7656 ]]
	-- upvalues: t (ref), t_21 (ref)
	return setmetatable({
		action_type = if p38 == nil or p38.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p38.action_type,
		action_params = if p38 == nil or p38.action_params == nil then nil else p38.action_params
	}, t_21)
end

function t_21:encode() --[[ line: 7665 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var763 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var764, var765 = protoModule.writeTag(buff, var763, 1, protoModule.wireTypes.varint)
		var764, var765 = protoModule.writeVarInt(var764, var765, t.ActionType.toNumber(self.action_type))
		buff = var764
		var763 = var765
	end
	if self.action_params ~= nil then
		local var766 = self.action_params:encode()
		local var767, var768 = protoModule.writeTag(buff, var763, 2, protoModule.wireTypes.lengthDelimited)
		var767, var768 = protoModule.writeBuffer(var767, var768, var766, buffer.len(var766))
		buff = var767
		var763 = var768
	end
	local buff_1 = buffer.create(var763)
	buffer.copy(buff_1, 0, buff, 0, var763)
	
	return buff_1
end

function t_21.decode(p39) --[[ line: 7691 ]]
	-- upvalues: t_21 (ref), protoModule (ref), t (ref)
	local var770 = t_21.new()
	local var771 = 0
	while var771 < buffer.len(p39) do
		local _ = nil
		local var772 = nil
		local var773, var774, var775 = protoModule.readTag(p39, var771)
		local var776 = var773
		var772 = var774
		var771 = var775
		
		if var772 == protoModule.wireTypes.varint then
			if var776 == 1 then
				local _ = nil
				local var777, var778 = protoModule.readVarIntI32(p39, var771)
				local var779 = var777
				var771 = var778
				var770.action_type = t.ActionType.fromNumber(var779) or var779
			else
				local _ = nil
				local var780, var781 = protoModule.readVarInt(p39, var771)
				local _ = var780
				var771 = var781
			end
		end
		if var772 == protoModule.wireTypes.lengthDelimited then
			if var776 == 2 then
				local _ = nil
				local var782, var783 = protoModule.readBuffer(p39, var771)
				var771 = var783
				var770.action_params = t.OpenTooltipAction_Params.decode(var782)
			else
				local _ = nil
				local var784, var785 = protoModule.readVarInt(p39, var771)
				var771 = var785 + var784
			end
		elseif var772 == protoModule.wireTypes.i32 then
			local _ = nil
			local var786, var787 = protoModule.readFixed32(p39, var771)
			local _ = var786
			var771 = var787
		elseif var772 == protoModule.wireTypes.i64 then
			local _ = nil
			local var788, var789 = protoModule.readFixed64(p39, var771)
			local _ = var788
			var771 = var789
		else
			error("Unsupported wire type: " .. var772)
		end
	end
	return var770
end

function t_21:jsonEncode() --[[ line: 7739 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_21:jsonDecode() --[[ line: 7761 ]]
	-- upvalues: t_21 (ref), t (ref)
	local var791 = t_21.new()
	
	if self.action_type ~= nil then
		var791.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var791.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var791.action_params = t.OpenTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var791.action_params = t.OpenTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return var791
end

t_21.descriptor = {
	name = "OpenTooltipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenTooltipAction"
}
t.OpenTooltipAction = t_21
typeRegistryModule.default:register(t.OpenTooltipAction)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p40) --[[ line: 7801 ]]
	-- upvalues: t_22 (ref)
	return setmetatable({
		tooltip_title = if p40 == nil or p40.tooltip_title == nil then nil else p40.tooltip_title,
		tooltip_info_text = if p40 == nil or p40.tooltip_info_text == nil then nil else p40.tooltip_info_text
	}, t_22)
end

function t_22:encode() --[[ line: 7808 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var793 = 0
	
	if self.tooltip_title ~= nil then
		local var794 = self.tooltip_title:encode()
		local var795, var796 = protoModule.writeTag(buff, var793, 1, protoModule.wireTypes.lengthDelimited)
		var795, var796 = protoModule.writeBuffer(var795, var796, var794, buffer.len(var794))
		buff = var795
		var793 = var796
	end
	if self.tooltip_info_text ~= nil then
		local var797 = self.tooltip_info_text:encode()
		local var798, var799 = protoModule.writeTag(buff, var793, 2, protoModule.wireTypes.lengthDelimited)
		var798, var799 = protoModule.writeBuffer(var798, var799, var797, buffer.len(var797))
		buff = var798
		var793 = var799
	end
	local buff_1 = buffer.create(var793)
	buffer.copy(buff_1, 0, buff, 0, var793)
	
	return buff_1
end

function t_22.decode(p41) --[[ line: 7829 ]]
	-- upvalues: t_22 (ref), protoModule (ref), propTypesModule (ref)
	local var801 = t_22.new()
	local var802 = 0
	while var802 < buffer.len(p41) do
		local _ = nil
		local var803 = nil
		local var804, var805, var806 = protoModule.readTag(p41, var802)
		local var807 = var804
		var803 = var805
		var802 = var806
		
		if var803 == protoModule.wireTypes.varint then
			local _ = nil
			local var808, var809 = protoModule.readVarInt(p41, var802)
			local _ = var808
			var802 = var809
			continue
		end
		if var803 == protoModule.wireTypes.lengthDelimited then
			if var807 == 1 then
				local _ = nil
				local var810, var811 = protoModule.readBuffer(p41, var802)
				var802 = var811
				var801.tooltip_title = propTypesModule.StringProp.decode(var810)
			elseif var807 == 2 then
				local _ = nil
				local var812, var813 = protoModule.readBuffer(p41, var802)
				var802 = var813
				var801.tooltip_info_text = propTypesModule.StringProp.decode(var812)
			else
				local _ = nil
				local var814, var815 = protoModule.readVarInt(p41, var802)
				var802 = var815 + var814
			end
		elseif var803 == protoModule.wireTypes.i32 then
			local _ = nil
			local var816, var817 = protoModule.readFixed32(p41, var802)
			local _ = var816
			var802 = var817
		elseif var803 == protoModule.wireTypes.i64 then
			local _ = nil
			local var818, var819 = protoModule.readFixed64(p41, var802)
			local _ = var818
			var802 = var819
		else
			error("Unsupported wire type: " .. var803)
		end
	end
	return var801
end

function t_22:jsonEncode() --[[ line: 7877 ]]
	local t = {}
	
	if self.tooltip_title ~= nil then
		t.tooltipTitle = self.tooltip_title:jsonEncode()
	end
	if self.tooltip_info_text ~= nil then
		t.tooltipInfoText = self.tooltip_info_text:jsonEncode()
	end
	return t
end

function t_22:jsonDecode() --[[ line: 7891 ]]
	-- upvalues: t_22 (ref), propTypesModule (ref)
	local var821 = t_22.new()
	
	if self.tooltip_title ~= nil then
		var821.tooltip_title = propTypesModule.StringProp.jsonDecode(self.tooltip_title)
	end
	if self.tooltipTitle ~= nil then
		var821.tooltip_title = propTypesModule.StringProp.jsonDecode(self.tooltipTitle)
	end
	if self.tooltip_info_text ~= nil then
		var821.tooltip_info_text = propTypesModule.StringProp.jsonDecode(self.tooltip_info_text)
	end
	if self.tooltipInfoText ~= nil then
		var821.tooltip_info_text = propTypesModule.StringProp.jsonDecode(self.tooltipInfoText)
	end
	return var821
end

t_22.descriptor = {
	name = "OpenTooltipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenTooltipAction_Params = t_22
typeRegistryModule.default:register(t.OpenTooltipAction_Params)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p42) --[[ line: 7931 ]]
	-- upvalues: t (ref), t_23 (ref)
	return setmetatable({
		action_type = if p42 == nil or p42.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p42.action_type,
		action_params = if p42 == nil or p42.action_params == nil then nil else p42.action_params
	}, t_23)
end

function t_23:encode() --[[ line: 7940 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var823 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var824, var825 = protoModule.writeTag(buff, var823, 1, protoModule.wireTypes.varint)
		var824, var825 = protoModule.writeVarInt(var824, var825, t.ActionType.toNumber(self.action_type))
		buff = var824
		var823 = var825
	end
	if self.action_params ~= nil then
		local var826 = self.action_params:encode()
		local var827, var828 = protoModule.writeTag(buff, var823, 2, protoModule.wireTypes.lengthDelimited)
		var827, var828 = protoModule.writeBuffer(var827, var828, var826, buffer.len(var826))
		buff = var827
		var823 = var828
	end
	local buff_1 = buffer.create(var823)
	buffer.copy(buff_1, 0, buff, 0, var823)
	
	return buff_1
end

function t_23.decode(p43) --[[ line: 7966 ]]
	-- upvalues: t_23 (ref), protoModule (ref), t (ref)
	local var830 = t_23.new()
	local var831 = 0
	while var831 < buffer.len(p43) do
		local _ = nil
		local var832 = nil
		local var833, var834, var835 = protoModule.readTag(p43, var831)
		local var836 = var833
		var832 = var834
		var831 = var835
		
		if var832 == protoModule.wireTypes.varint then
			if var836 == 1 then
				local _ = nil
				local var837, var838 = protoModule.readVarIntI32(p43, var831)
				local var839 = var837
				var831 = var838
				var830.action_type = t.ActionType.fromNumber(var839) or var839
			else
				local _ = nil
				local var840, var841 = protoModule.readVarInt(p43, var831)
				local _ = var840
				var831 = var841
			end
		end
		if var832 == protoModule.wireTypes.lengthDelimited then
			if var836 == 2 then
				local _ = nil
				local var842, var843 = protoModule.readBuffer(p43, var831)
				var831 = var843
				var830.action_params = t.OpenBadgeDetailsAction_Params.decode(var842)
			else
				local _ = nil
				local var844, var845 = protoModule.readVarInt(p43, var831)
				var831 = var845 + var844
			end
		elseif var832 == protoModule.wireTypes.i32 then
			local _ = nil
			local var846, var847 = protoModule.readFixed32(p43, var831)
			local _ = var846
			var831 = var847
		elseif var832 == protoModule.wireTypes.i64 then
			local _ = nil
			local var848, var849 = protoModule.readFixed64(p43, var831)
			local _ = var848
			var831 = var849
		else
			error("Unsupported wire type: " .. var832)
		end
	end
	return var830
end

function t_23:jsonEncode() --[[ line: 8014 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_23:jsonDecode() --[[ line: 8036 ]]
	-- upvalues: t_23 (ref), t (ref)
	local var851 = t_23.new()
	
	if self.action_type ~= nil then
		var851.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var851.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var851.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var851.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var851
end

t_23.descriptor = {
	name = "OpenBadgeDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgeDetailsAction"
}
t.OpenBadgeDetailsAction = t_23
typeRegistryModule.default:register(t.OpenBadgeDetailsAction)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p44) --[[ line: 8076 ]]
	-- upvalues: t_24 (ref)
	return setmetatable({
		badge_id = if p44 == nil or p44.badge_id == nil then nil else p44.badge_id,
		title_text = if p44 == nil or p44.title_text == nil then nil else p44.title_text
	}, t_24)
end

function t_24:encode() --[[ line: 8085 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var853 = 0
	
	if self.badge_id ~= nil then
		local var854 = self.badge_id:encode()
		local var855, var856 = protoModule.writeTag(buff, var853, 1, protoModule.wireTypes.lengthDelimited)
		var855, var856 = protoModule.writeBuffer(var855, var856, var854, buffer.len(var854))
		buff = var855
		var853 = var856
	end
	if self.title_text ~= nil then
		local var857 = self.title_text:encode()
		local var858, var859 = protoModule.writeTag(buff, var853, 2, protoModule.wireTypes.lengthDelimited)
		var858, var859 = protoModule.writeBuffer(var858, var859, var857, buffer.len(var857))
		buff = var858
		var853 = var859
	end
	local buff_1 = buffer.create(var853)
	buffer.copy(buff_1, 0, buff, 0, var853)
	
	return buff_1
end

function t_24.decode(p45) --[[ line: 8106 ]]
	-- upvalues: t_24 (ref), protoModule (ref), propTypesModule (ref)
	local var861 = t_24.new()
	local var862 = 0
	while var862 < buffer.len(p45) do
		local _ = nil
		local var863 = nil
		local var864, var865, var866 = protoModule.readTag(p45, var862)
		local var867 = var864
		var863 = var865
		var862 = var866
		
		if var863 == protoModule.wireTypes.varint then
			local _ = nil
			local var868, var869 = protoModule.readVarInt(p45, var862)
			local _ = var868
			var862 = var869
			continue
		end
		if var863 == protoModule.wireTypes.lengthDelimited then
			if var867 == 1 then
				local _ = nil
				local var870, var871 = protoModule.readBuffer(p45, var862)
				var862 = var871
				var861.badge_id = propTypesModule.StringProp.decode(var870)
			elseif var867 == 2 then
				local _ = nil
				local var872, var873 = protoModule.readBuffer(p45, var862)
				var862 = var873
				var861.title_text = propTypesModule.StringProp.decode(var872)
			else
				local _ = nil
				local var874, var875 = protoModule.readVarInt(p45, var862)
				var862 = var875 + var874
			end
		elseif var863 == protoModule.wireTypes.i32 then
			local _ = nil
			local var876, var877 = protoModule.readFixed32(p45, var862)
			local _ = var876
			var862 = var877
		elseif var863 == protoModule.wireTypes.i64 then
			local _ = nil
			local var878, var879 = protoModule.readFixed64(p45, var862)
			local _ = var878
			var862 = var879
		else
			error("Unsupported wire type: " .. var863)
		end
	end
	return var861
end

function t_24:jsonEncode() --[[ line: 8154 ]]
	local t = {}
	
	if self.badge_id ~= nil then
		t.badgeId = self.badge_id:jsonEncode()
	end
	if self.title_text ~= nil then
		t.titleText = self.title_text:jsonEncode()
	end
	return t
end

function t_24:jsonDecode() --[[ line: 8168 ]]
	-- upvalues: t_24 (ref), propTypesModule (ref)
	local var881 = t_24.new()
	
	if self.badge_id ~= nil then
		var881.badge_id = propTypesModule.StringProp.jsonDecode(self.badge_id)
	end
	if self.badgeId ~= nil then
		var881.badge_id = propTypesModule.StringProp.jsonDecode(self.badgeId)
	end
	if self.title_text ~= nil then
		var881.title_text = propTypesModule.StringProp.jsonDecode(self.title_text)
	end
	if self.titleText ~= nil then
		var881.title_text = propTypesModule.StringProp.jsonDecode(self.titleText)
	end
	return var881
end

t_24.descriptor = {
	name = "OpenBadgeDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenBadgeDetailsAction_Params = t_24
typeRegistryModule.default:register(t.OpenBadgeDetailsAction_Params)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p46) --[[ line: 8204 ]]
	-- upvalues: t (ref), t_25 (ref)
	return setmetatable({
		action_type = if p46 == nil or p46.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p46.action_type,
		action_params = if p46 == nil or p46.action_params == nil then nil else p46.action_params
	}, t_25)
end

function t_25:encode() --[[ line: 8213 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var883 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var884, var885 = protoModule.writeTag(buff, var883, 1, protoModule.wireTypes.varint)
		var884, var885 = protoModule.writeVarInt(var884, var885, t.ActionType.toNumber(self.action_type))
		buff = var884
		var883 = var885
	end
	if self.action_params ~= nil then
		local var886 = self.action_params:encode()
		local var887, var888 = protoModule.writeTag(buff, var883, 2, protoModule.wireTypes.lengthDelimited)
		var887, var888 = protoModule.writeBuffer(var887, var888, var886, buffer.len(var886))
		buff = var887
		var883 = var888
	end
	local buff_1 = buffer.create(var883)
	buffer.copy(buff_1, 0, buff, 0, var883)
	
	return buff_1
end

function t_25.decode(p47) --[[ line: 8239 ]]
	-- upvalues: t_25 (ref), protoModule (ref), t (ref)
	local var890 = t_25.new()
	local var891 = 0
	while var891 < buffer.len(p47) do
		local _ = nil
		local var892 = nil
		local var893, var894, var895 = protoModule.readTag(p47, var891)
		local var896 = var893
		var892 = var894
		var891 = var895
		
		if var892 == protoModule.wireTypes.varint then
			if var896 == 1 then
				local _ = nil
				local var897, var898 = protoModule.readVarIntI32(p47, var891)
				local var899 = var897
				var891 = var898
				var890.action_type = t.ActionType.fromNumber(var899) or var899
			else
				local _ = nil
				local var900, var901 = protoModule.readVarInt(p47, var891)
				local _ = var900
				var891 = var901
			end
		end
		if var892 == protoModule.wireTypes.lengthDelimited then
			if var896 == 2 then
				local _ = nil
				local var902, var903 = protoModule.readBuffer(p47, var891)
				var891 = var903
				var890.action_params = t.LoadMoreFromApiAction_Params.decode(var902)
			else
				local _ = nil
				local var904, var905 = protoModule.readVarInt(p47, var891)
				var891 = var905 + var904
			end
		elseif var892 == protoModule.wireTypes.i32 then
			local _ = nil
			local var906, var907 = protoModule.readFixed32(p47, var891)
			local _ = var906
			var891 = var907
		elseif var892 == protoModule.wireTypes.i64 then
			local _ = nil
			local var908, var909 = protoModule.readFixed64(p47, var891)
			local _ = var908
			var891 = var909
		else
			error("Unsupported wire type: " .. var892)
		end
	end
	return var890
end

function t_25:jsonEncode() --[[ line: 8287 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_25:jsonDecode() --[[ line: 8309 ]]
	-- upvalues: t_25 (ref), t (ref)
	local var911 = t_25.new()
	
	if self.action_type ~= nil then
		var911.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var911.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var911.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var911.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var911
end

t_25.descriptor = {
	name = "LoadMoreFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LoadMoreFromApiAction"
}
t.LoadMoreFromApiAction = t_25
typeRegistryModule.default:register(t.LoadMoreFromApiAction)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p48) --[[ line: 8349 ]]
	-- upvalues: t_26 (ref)
	return setmetatable({
		surface_key = if p48 == nil or p48.surface_key == nil then nil else p48.surface_key,
		config_key = if p48 == nil or p48.config_key == nil then nil else p48.config_key
	}, t_26)
end

function t_26:encode() --[[ line: 8358 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var913 = 0
	
	if self.surface_key ~= nil then
		local var914 = self.surface_key:encode()
		local var915, var916 = protoModule.writeTag(buff, var913, 1, protoModule.wireTypes.lengthDelimited)
		var915, var916 = protoModule.writeBuffer(var915, var916, var914, buffer.len(var914))
		buff = var915
		var913 = var916
	end
	if self.config_key ~= nil then
		local var917 = self.config_key:encode()
		local var918, var919 = protoModule.writeTag(buff, var913, 2, protoModule.wireTypes.lengthDelimited)
		var918, var919 = protoModule.writeBuffer(var918, var919, var917, buffer.len(var917))
		buff = var918
		var913 = var919
	end
	local buff_1 = buffer.create(var913)
	buffer.copy(buff_1, 0, buff, 0, var913)
	
	return buff_1
end

function t_26.decode(p49) --[[ line: 8379 ]]
	-- upvalues: t_26 (ref), protoModule (ref), propTypesModule (ref)
	local var921 = t_26.new()
	local var922 = 0
	while var922 < buffer.len(p49) do
		local _ = nil
		local var923 = nil
		local var924, var925, var926 = protoModule.readTag(p49, var922)
		local var927 = var924
		var923 = var925
		var922 = var926
		
		if var923 == protoModule.wireTypes.varint then
			local _ = nil
			local var928, var929 = protoModule.readVarInt(p49, var922)
			local _ = var928
			var922 = var929
			continue
		end
		if var923 == protoModule.wireTypes.lengthDelimited then
			if var927 == 1 then
				local _ = nil
				local var930, var931 = protoModule.readBuffer(p49, var922)
				var922 = var931
				var921.surface_key = propTypesModule.StringProp.decode(var930)
			elseif var927 == 2 then
				local _ = nil
				local var932, var933 = protoModule.readBuffer(p49, var922)
				var922 = var933
				var921.config_key = propTypesModule.StringProp.decode(var932)
			else
				local _ = nil
				local var934, var935 = protoModule.readVarInt(p49, var922)
				var922 = var935 + var934
			end
		elseif var923 == protoModule.wireTypes.i32 then
			local _ = nil
			local var936, var937 = protoModule.readFixed32(p49, var922)
			local _ = var936
			var922 = var937
		elseif var923 == protoModule.wireTypes.i64 then
			local _ = nil
			local var938, var939 = protoModule.readFixed64(p49, var922)
			local _ = var938
			var922 = var939
		else
			error("Unsupported wire type: " .. var923)
		end
	end
	return var921
end

function t_26:jsonEncode() --[[ line: 8427 ]]
	local t = {}
	
	if self.surface_key ~= nil then
		t.surfaceKey = self.surface_key:jsonEncode()
	end
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	return t
end

function t_26:jsonDecode() --[[ line: 8441 ]]
	-- upvalues: t_26 (ref), propTypesModule (ref)
	local var941 = t_26.new()
	
	if self.surface_key ~= nil then
		var941.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var941.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		var941.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var941.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return var941
end

t_26.descriptor = {
	name = "LoadMoreFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LoadMoreFromApiAction_Params = t_26
typeRegistryModule.default:register(t.LoadMoreFromApiAction_Params)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p50) --[[ line: 8478 ]]
	-- upvalues: t (ref), t_27 (ref)
	return setmetatable({
		action_type = if p50 == nil or p50.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p50.action_type,
		action_params = if p50 == nil or p50.action_params == nil then nil else p50.action_params
	}, t_27)
end

function t_27:encode() --[[ line: 8487 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var943 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var944, var945 = protoModule.writeTag(buff, var943, 1, protoModule.wireTypes.varint)
		var944, var945 = protoModule.writeVarInt(var944, var945, t.ActionType.toNumber(self.action_type))
		buff = var944
		var943 = var945
	end
	if self.action_params ~= nil then
		local var946 = self.action_params:encode()
		local var947, var948 = protoModule.writeTag(buff, var943, 2, protoModule.wireTypes.lengthDelimited)
		var947, var948 = protoModule.writeBuffer(var947, var948, var946, buffer.len(var946))
		buff = var947
		var943 = var948
	end
	local buff_1 = buffer.create(var943)
	buffer.copy(buff_1, 0, buff, 0, var943)
	
	return buff_1
end

function t_27.decode(p51) --[[ line: 8513 ]]
	-- upvalues: t_27 (ref), protoModule (ref), t (ref)
	local var950 = t_27.new()
	local var951 = 0
	while var951 < buffer.len(p51) do
		local _ = nil
		local var952 = nil
		local var953, var954, var955 = protoModule.readTag(p51, var951)
		local var956 = var953
		var952 = var954
		var951 = var955
		
		if var952 == protoModule.wireTypes.varint then
			if var956 == 1 then
				local _ = nil
				local var957, var958 = protoModule.readVarIntI32(p51, var951)
				local var959 = var957
				var951 = var958
				var950.action_type = t.ActionType.fromNumber(var959) or var959
			else
				local _ = nil
				local var960, var961 = protoModule.readVarInt(p51, var951)
				local _ = var960
				var951 = var961
			end
		end
		if var952 == protoModule.wireTypes.lengthDelimited then
			if var956 == 2 then
				local _ = nil
				local var962, var963 = protoModule.readBuffer(p51, var951)
				var951 = var963
				var950.action_params = t.ShareAction_Params.decode(var962)
			else
				local _ = nil
				local var964, var965 = protoModule.readVarInt(p51, var951)
				var951 = var965 + var964
			end
		elseif var952 == protoModule.wireTypes.i32 then
			local _ = nil
			local var966, var967 = protoModule.readFixed32(p51, var951)
			local _ = var966
			var951 = var967
		elseif var952 == protoModule.wireTypes.i64 then
			local _ = nil
			local var968, var969 = protoModule.readFixed64(p51, var951)
			local _ = var968
			var951 = var969
		else
			error("Unsupported wire type: " .. var952)
		end
	end
	return var950
end

function t_27:jsonEncode() --[[ line: 8561 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_27:jsonDecode() --[[ line: 8583 ]]
	-- upvalues: t_27 (ref), t (ref)
	local var971 = t_27.new()
	
	if self.action_type ~= nil then
		var971.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var971.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var971.action_params = t.ShareAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var971.action_params = t.ShareAction_Params.jsonDecode(self.actionParams)
	end
	return var971
end

t_27.descriptor = {
	name = "ShareAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareAction"
}
t.ShareAction = t_27
typeRegistryModule.default:register(t.ShareAction)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p52) --[[ line: 8623 ]]
	-- upvalues: t_28 (ref)
	return setmetatable({
		oneof_prop = if p52 == nil or p52.oneof_prop == nil then nil else p52.oneof_prop
	}, t_28)
end

function t_28:encode() --[[ line: 8631 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var973 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "generic_share_link_data" then
			local var974 = self.oneof_prop.value:encode()
			local var975, var976 = protoModule.writeTag(buff, var973, 1, protoModule.wireTypes.lengthDelimited)
			var975, var976 = protoModule.writeBuffer(var975, var976, var974, buffer.len(var974))
			buff = var975
			var973 = var976
		elseif self.oneof_prop.type == "share_link_fetch_data" then
			local var977 = self.oneof_prop.value:encode()
			local var978, var979 = protoModule.writeTag(buff, var973, 2, protoModule.wireTypes.lengthDelimited)
			var978, var979 = protoModule.writeBuffer(var978, var979, var977, buffer.len(var977))
			buff = var978
			var973 = var979
		end
	end
	local buff_1 = buffer.create(var973)
	buffer.copy(buff_1, 0, buff, 0, var973)
	
	return buff_1
end

function t_28.decode(p53) --[[ line: 8652 ]]
	-- upvalues: t_28 (ref), protoModule (ref), shareLinkDataModule (ref)
	local var981 = t_28.new()
	local var982 = 0
	while var982 < buffer.len(p53) do
		local _ = nil
		local var983 = nil
		local var984, var985, var986 = protoModule.readTag(p53, var982)
		local var987 = var984
		var983 = var985
		var982 = var986
		
		if var983 == protoModule.wireTypes.varint then
			local _ = nil
			local var988, var989 = protoModule.readVarInt(p53, var982)
			local _ = var988
			var982 = var989
			continue
		end
		if var983 == protoModule.wireTypes.lengthDelimited then
			if var987 == 1 then
				local _ = nil
				local var990, var991 = protoModule.readBuffer(p53, var982)
				var982 = var991
				var981.oneof_prop = {
					type = "generic_share_link_data",
					value = shareLinkDataModule.GenericShareLinkData.decode(var990)
				}
			elseif var987 == 2 then
				local _ = nil
				local var992, var993 = protoModule.readBuffer(p53, var982)
				var982 = var993
				var981.oneof_prop = {
					type = "share_link_fetch_data",
					value = shareLinkDataModule.ShareLinkFetchData.decode(var992)
				}
			else
				local _ = nil
				local var994, var995 = protoModule.readVarInt(p53, var982)
				var982 = var995 + var994
			end
		elseif var983 == protoModule.wireTypes.i32 then
			local _ = nil
			local var996, var997 = protoModule.readFixed32(p53, var982)
			local _ = var996
			var982 = var997
		elseif var983 == protoModule.wireTypes.i64 then
			local _ = nil
			local var998, var999 = protoModule.readFixed64(p53, var982)
			local _ = var998
			var982 = var999
		else
			error("Unsupported wire type: " .. var983)
		end
	end
	return var981
end

function t_28:jsonEncode() --[[ line: 8708 ]]
	local t = {}
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "generic_share_link_data" then
			t.genericShareLinkData = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "share_link_fetch_data" then
			t.shareLinkFetchData = self.oneof_prop.value:jsonEncode()
		end
	end
	return t
end

function t_28:jsonDecode() --[[ line: 8722 ]]
	-- upvalues: t_28 (ref), shareLinkDataModule (ref)
	local var1001 = t_28.new()
	
	if self.generic_share_link_data ~= nil then
		var1001.oneof_prop = {
			type = "generic_share_link_data",
			value = shareLinkDataModule.GenericShareLinkData.jsonDecode(self.generic_share_link_data)
		}
	end
	if self.genericShareLinkData ~= nil then
		var1001.oneof_prop = {
			type = "generic_share_link_data",
			value = shareLinkDataModule.GenericShareLinkData.jsonDecode(self.genericShareLinkData)
		}
	end
	if self.share_link_fetch_data ~= nil then
		var1001.oneof_prop = {
			type = "share_link_fetch_data",
			value = shareLinkDataModule.ShareLinkFetchData.jsonDecode(self.share_link_fetch_data)
		}
	end
	if self.shareLinkFetchData ~= nil then
		var1001.oneof_prop = {
			type = "share_link_fetch_data",
			value = shareLinkDataModule.ShareLinkFetchData.jsonDecode(self.shareLinkFetchData)
		}
	end
	return var1001
end

t_28.descriptor = {
	name = "ShareAction_ShareLinkData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkData"
}
t.ShareAction_ShareLinkData = t_28
typeRegistryModule.default:register(t.ShareAction_ShareLinkData)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p54) --[[ line: 8778 ]]
	-- upvalues: t_29 (ref)
	return setmetatable({
		share_link_type = if p54 == nil or p54.share_link_type == nil then nil else p54.share_link_type,
		share_link_data = if p54 == nil or p54.share_link_data == nil then nil else p54.share_link_data,
		entry_point_key = if p54 == nil or p54.entry_point_key == nil then nil else p54.entry_point_key
	}, t_29)
end

function t_29:encode() --[[ line: 8786 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1003 = 0
	
	if self.share_link_type ~= nil then
		local var1004 = self.share_link_type:encode()
		local var1005, var1006 = protoModule.writeTag(buff, var1003, 1, protoModule.wireTypes.lengthDelimited)
		var1005, var1006 = protoModule.writeBuffer(var1005, var1006, var1004, buffer.len(var1004))
		buff = var1005
		var1003 = var1006
	end
	if self.share_link_data ~= nil then
		local var1007 = self.share_link_data:encode()
		local var1008, var1009 = protoModule.writeTag(buff, var1003, 2, protoModule.wireTypes.lengthDelimited)
		var1008, var1009 = protoModule.writeBuffer(var1008, var1009, var1007, buffer.len(var1007))
		buff = var1008
		var1003 = var1009
	end
	if self.entry_point_key ~= nil then
		local var1010 = self.entry_point_key:encode()
		local var1011, var1012 = protoModule.writeTag(buff, var1003, 3, protoModule.wireTypes.lengthDelimited)
		var1011, var1012 = protoModule.writeBuffer(var1011, var1012, var1010, buffer.len(var1010))
		buff = var1011
		var1003 = var1012
	end
	local buff_1 = buffer.create(var1003)
	buffer.copy(buff_1, 0, buff, 0, var1003)
	
	return buff_1
end

function t_29.decode(p55) --[[ line: 8813 ]]
	-- upvalues: t_29 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1014 = t_29.new()
	local var1015 = 0
	while var1015 < buffer.len(p55) do
		local _ = nil
		local var1016 = nil
		local var1017, var1018, var1019 = protoModule.readTag(p55, var1015)
		local var1020 = var1017
		var1016 = var1018
		var1015 = var1019
		
		if var1016 == protoModule.wireTypes.varint then
			local _ = nil
			local var1021, var1022 = protoModule.readVarInt(p55, var1015)
			local _ = var1021
			var1015 = var1022
			continue
		end
		if var1016 == protoModule.wireTypes.lengthDelimited then
			if var1020 == 1 then
				local _ = nil
				local var1023, var1024 = protoModule.readBuffer(p55, var1015)
				var1015 = var1024
				var1014.share_link_type = propTypesModule.StringProp.decode(var1023)
			elseif var1020 == 2 then
				local _ = nil
				local var1025, var1026 = protoModule.readBuffer(p55, var1015)
				var1015 = var1026
				var1014.share_link_data = t.ShareAction_ShareLinkData.decode(var1025)
			elseif var1020 == 3 then
				local _ = nil
				local var1027, var1028 = protoModule.readBuffer(p55, var1015)
				var1015 = var1028
				var1014.entry_point_key = propTypesModule.StringProp.decode(var1027)
			else
				local _ = nil
				local var1029, var1030 = protoModule.readVarInt(p55, var1015)
				var1015 = var1030 + var1029
			end
		elseif var1016 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1031, var1032 = protoModule.readFixed32(p55, var1015)
			local _ = var1031
			var1015 = var1032
		elseif var1016 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1033, var1034 = protoModule.readFixed64(p55, var1015)
			local _ = var1033
			var1015 = var1034
		else
			error("Unsupported wire type: " .. var1016)
		end
	end
	return var1014
end

function t_29:jsonEncode() --[[ line: 8866 ]]
	local t = {}
	
	if self.share_link_type ~= nil then
		t.shareLinkType = self.share_link_type:jsonEncode()
	end
	if self.share_link_data ~= nil then
		t.shareLinkData = self.share_link_data:jsonEncode()
	end
	if self.entry_point_key ~= nil then
		t.entryPointKey = self.entry_point_key:jsonEncode()
	end
	return t
end

function t_29:jsonDecode() --[[ line: 8884 ]]
	-- upvalues: t_29 (ref), propTypesModule (ref), t (ref)
	local var1036 = t_29.new()
	
	if self.share_link_type ~= nil then
		var1036.share_link_type = propTypesModule.StringProp.jsonDecode(self.share_link_type)
	end
	if self.shareLinkType ~= nil then
		var1036.share_link_type = propTypesModule.StringProp.jsonDecode(self.shareLinkType)
	end
	if self.share_link_data ~= nil then
		var1036.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.share_link_data)
	end
	if self.shareLinkData ~= nil then
		var1036.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.shareLinkData)
	end
	if self.entry_point_key ~= nil then
		var1036.entry_point_key = propTypesModule.StringProp.jsonDecode(self.entry_point_key)
	end
	if self.entryPointKey ~= nil then
		var1036.entry_point_key = propTypesModule.StringProp.jsonDecode(self.entryPointKey)
	end
	return var1036
end

t_29.descriptor = {
	name = "ShareAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ShareAction_Params = t_29
typeRegistryModule.default:register(t.ShareAction_Params)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p56) --[[ line: 8932 ]]
	-- upvalues: t (ref), t_30 (ref)
	return setmetatable({
		action_type = if p56 == nil or p56.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p56.action_type,
		action_params = if p56 == nil or p56.action_params == nil then nil else p56.action_params
	}, t_30)
end

function t_30:encode() --[[ line: 8941 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1038 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1039, var1040 = protoModule.writeTag(buff, var1038, 1, protoModule.wireTypes.varint)
		var1039, var1040 = protoModule.writeVarInt(var1039, var1040, t.ActionType.toNumber(self.action_type))
		buff = var1039
		var1038 = var1040
	end
	if self.action_params ~= nil then
		local var1041 = self.action_params:encode()
		local var1042, var1043 = protoModule.writeTag(buff, var1038, 2, protoModule.wireTypes.lengthDelimited)
		var1042, var1043 = protoModule.writeBuffer(var1042, var1043, var1041, buffer.len(var1041))
		buff = var1042
		var1038 = var1043
	end
	local buff_1 = buffer.create(var1038)
	buffer.copy(buff_1, 0, buff, 0, var1038)
	
	return buff_1
end

function t_30.decode(p57) --[[ line: 8967 ]]
	-- upvalues: t_30 (ref), protoModule (ref), t (ref)
	local var1045 = t_30.new()
	local var1046 = 0
	while var1046 < buffer.len(p57) do
		local _ = nil
		local var1047 = nil
		local var1048, var1049, var1050 = protoModule.readTag(p57, var1046)
		local var1051 = var1048
		var1047 = var1049
		var1046 = var1050
		
		if var1047 == protoModule.wireTypes.varint then
			if var1051 == 1 then
				local _ = nil
				local var1052, var1053 = protoModule.readVarIntI32(p57, var1046)
				local var1054 = var1052
				var1046 = var1053
				var1045.action_type = t.ActionType.fromNumber(var1054) or var1054
			else
				local _ = nil
				local var1055, var1056 = protoModule.readVarInt(p57, var1046)
				local _ = var1055
				var1046 = var1056
			end
		end
		if var1047 == protoModule.wireTypes.lengthDelimited then
			if var1051 == 2 then
				local _ = nil
				local var1057, var1058 = protoModule.readBuffer(p57, var1046)
				var1046 = var1058
				var1045.action_params = t.OpenAbuseReportAction_Params.decode(var1057)
			else
				local _ = nil
				local var1059, var1060 = protoModule.readVarInt(p57, var1046)
				var1046 = var1060 + var1059
			end
		elseif var1047 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1061, var1062 = protoModule.readFixed32(p57, var1046)
			local _ = var1061
			var1046 = var1062
		elseif var1047 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1063, var1064 = protoModule.readFixed64(p57, var1046)
			local _ = var1063
			var1046 = var1064
		else
			error("Unsupported wire type: " .. var1047)
		end
	end
	return var1045
end

function t_30:jsonEncode() --[[ line: 9015 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_30:jsonDecode() --[[ line: 9037 ]]
	-- upvalues: t_30 (ref), t (ref)
	local var1066 = t_30.new()
	
	if self.action_type ~= nil then
		var1066.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1066.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1066.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1066.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.actionParams)
	end
	return var1066
end

t_30.descriptor = {
	name = "OpenAbuseReportAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAbuseReportAction"
}
t.OpenAbuseReportAction = t_30
typeRegistryModule.default:register(t.OpenAbuseReportAction)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p58) --[[ line: 9077 ]]
	-- upvalues: t_31 (ref)
	return setmetatable({
		target_id = if p58 == nil or p58.target_id == nil then nil else p58.target_id,
		abuse_vector = if p58 == nil or p58.abuse_vector == nil then nil else p58.abuse_vector,
		asset_type_name = if p58 == nil or p58.asset_type_name == nil then nil else p58.asset_type_name,
		universe_id = if p58 == nil or p58.universe_id == nil then nil else p58.universe_id
	}, t_31)
end

function t_31:encode() --[[ line: 9088 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1068 = 0
	
	if self.target_id ~= nil then
		local var1069 = self.target_id:encode()
		local var1070, var1071 = protoModule.writeTag(buff, var1068, 1, protoModule.wireTypes.lengthDelimited)
		var1070, var1071 = protoModule.writeBuffer(var1070, var1071, var1069, buffer.len(var1069))
		buff = var1070
		var1068 = var1071
	end
	if self.abuse_vector ~= nil then
		local var1072 = self.abuse_vector:encode()
		local var1073, var1074 = protoModule.writeTag(buff, var1068, 2, protoModule.wireTypes.lengthDelimited)
		var1073, var1074 = protoModule.writeBuffer(var1073, var1074, var1072, buffer.len(var1072))
		buff = var1073
		var1068 = var1074
	end
	if self.asset_type_name ~= nil then
		local var1075 = self.asset_type_name:encode()
		local var1076, var1077 = protoModule.writeTag(buff, var1068, 3, protoModule.wireTypes.lengthDelimited)
		var1076, var1077 = protoModule.writeBuffer(var1076, var1077, var1075, buffer.len(var1075))
		buff = var1076
		var1068 = var1077
	end
	if self.universe_id ~= nil then
		local var1078 = self.universe_id:encode()
		local var1079, var1080 = protoModule.writeTag(buff, var1068, 4, protoModule.wireTypes.lengthDelimited)
		var1079, var1080 = protoModule.writeBuffer(var1079, var1080, var1078, buffer.len(var1078))
		buff = var1079
		var1068 = var1080
	end
	local buff_1 = buffer.create(var1068)
	buffer.copy(buff_1, 0, buff, 0, var1068)
	
	return buff_1
end

function t_31.decode(p59) --[[ line: 9121 ]]
	-- upvalues: t_31 (ref), protoModule (ref), propTypesModule (ref)
	local var1082 = t_31.new()
	local var1083 = 0
	while var1083 < buffer.len(p59) do
		local _ = nil
		local var1084 = nil
		local var1085, var1086, var1087 = protoModule.readTag(p59, var1083)
		local var1088 = var1085
		var1084 = var1086
		var1083 = var1087
		
		if var1084 == protoModule.wireTypes.varint then
			local _ = nil
			local var1089, var1090 = protoModule.readVarInt(p59, var1083)
			local _ = var1089
			var1083 = var1090
			continue
		end
		if var1084 == protoModule.wireTypes.lengthDelimited then
			if var1088 == 1 then
				local _ = nil
				local var1091, var1092 = protoModule.readBuffer(p59, var1083)
				var1083 = var1092
				var1082.target_id = propTypesModule.StringProp.decode(var1091)
			elseif var1088 == 2 then
				local _ = nil
				local var1093, var1094 = protoModule.readBuffer(p59, var1083)
				var1083 = var1094
				var1082.abuse_vector = propTypesModule.StringProp.decode(var1093)
			elseif var1088 == 3 then
				local _ = nil
				local var1095, var1096 = protoModule.readBuffer(p59, var1083)
				var1083 = var1096
				var1082.asset_type_name = propTypesModule.StringProp.decode(var1095)
			elseif var1088 == 4 then
				local _ = nil
				local var1097, var1098 = protoModule.readBuffer(p59, var1083)
				var1083 = var1098
				var1082.universe_id = propTypesModule.StringProp.decode(var1097)
			else
				local _ = nil
				local var1099, var1100 = protoModule.readVarInt(p59, var1083)
				var1083 = var1100 + var1099
			end
		elseif var1084 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1101, var1102 = protoModule.readFixed32(p59, var1083)
			local _ = var1101
			var1083 = var1102
		elseif var1084 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1103, var1104 = protoModule.readFixed64(p59, var1083)
			local _ = var1103
			var1083 = var1104
		else
			error("Unsupported wire type: " .. var1084)
		end
	end
	return var1082
end

function t_31:jsonEncode() --[[ line: 9179 ]]
	local t = {}
	
	if self.target_id ~= nil then
		t.targetId = self.target_id:jsonEncode()
	end
	if self.abuse_vector ~= nil then
		t.abuseVector = self.abuse_vector:jsonEncode()
	end
	if self.asset_type_name ~= nil then
		t.assetTypeName = self.asset_type_name:jsonEncode()
	end
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_31:jsonDecode() --[[ line: 9201 ]]
	-- upvalues: t_31 (ref), propTypesModule (ref)
	local var1106 = t_31.new()
	
	if self.target_id ~= nil then
		var1106.target_id = propTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		var1106.target_id = propTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.abuse_vector ~= nil then
		var1106.abuse_vector = propTypesModule.StringProp.jsonDecode(self.abuse_vector)
	end
	if self.abuseVector ~= nil then
		var1106.abuse_vector = propTypesModule.StringProp.jsonDecode(self.abuseVector)
	end
	if self.asset_type_name ~= nil then
		var1106.asset_type_name = propTypesModule.StringProp.jsonDecode(self.asset_type_name)
	end
	if self.assetTypeName ~= nil then
		var1106.asset_type_name = propTypesModule.StringProp.jsonDecode(self.assetTypeName)
	end
	if self.universe_id ~= nil then
		var1106.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1106.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1106
end

t_31.descriptor = {
	name = "OpenAbuseReportAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAbuseReportAction_Params = t_31
typeRegistryModule.default:register(t.OpenAbuseReportAction_Params)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p60) --[[ line: 9258 ]]
	-- upvalues: t (ref), t_32 (ref)
	return setmetatable({
		action_type = if p60 == nil or p60.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p60.action_type,
		action_params = if p60 == nil or p60.action_params == nil then nil else p60.action_params
	}, t_32)
end

function t_32:encode() --[[ line: 9269 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1108 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1109, var1110 = protoModule.writeTag(buff, var1108, 1, protoModule.wireTypes.varint)
		var1109, var1110 = protoModule.writeVarInt(var1109, var1110, t.ActionType.toNumber(self.action_type))
		buff = var1109
		var1108 = var1110
	end
	if self.action_params ~= nil then
		local var1111 = self.action_params:encode()
		local var1112, var1113 = protoModule.writeTag(buff, var1108, 2, protoModule.wireTypes.lengthDelimited)
		var1112, var1113 = protoModule.writeBuffer(var1112, var1113, var1111, buffer.len(var1111))
		buff = var1112
		var1108 = var1113
	end
	local buff_1 = buffer.create(var1108)
	buffer.copy(buff_1, 0, buff, 0, var1108)
	
	return buff_1
end

function t_32.decode(p61) --[[ line: 9295 ]]
	-- upvalues: t_32 (ref), protoModule (ref), t (ref)
	local var1115 = t_32.new()
	local var1116 = 0
	while var1116 < buffer.len(p61) do
		local _ = nil
		local var1117 = nil
		local var1118, var1119, var1120 = protoModule.readTag(p61, var1116)
		local var1121 = var1118
		var1117 = var1119
		var1116 = var1120
		
		if var1117 == protoModule.wireTypes.varint then
			if var1121 == 1 then
				local _ = nil
				local var1122, var1123 = protoModule.readVarIntI32(p61, var1116)
				local var1124 = var1122
				var1116 = var1123
				var1115.action_type = t.ActionType.fromNumber(var1124) or var1124
			else
				local _ = nil
				local var1125, var1126 = protoModule.readVarInt(p61, var1116)
				local _ = var1125
				var1116 = var1126
			end
		end
		if var1117 == protoModule.wireTypes.lengthDelimited then
			if var1121 == 2 then
				local _ = nil
				local var1127, var1128 = protoModule.readBuffer(p61, var1116)
				var1116 = var1128
				var1115.action_params = t.RemoveBadgeFromInventoryAction_Params.decode(var1127)
			else
				local _ = nil
				local var1129, var1130 = protoModule.readVarInt(p61, var1116)
				var1116 = var1130 + var1129
			end
		elseif var1117 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1131, var1132 = protoModule.readFixed32(p61, var1116)
			local _ = var1131
			var1116 = var1132
		elseif var1117 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1133, var1134 = protoModule.readFixed64(p61, var1116)
			local _ = var1133
			var1116 = var1134
		else
			error("Unsupported wire type: " .. var1117)
		end
	end
	return var1115
end

function t_32:jsonEncode() --[[ line: 9343 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_32:jsonDecode() --[[ line: 9365 ]]
	-- upvalues: t_32 (ref), t (ref)
	local var1136 = t_32.new()
	
	if self.action_type ~= nil then
		var1136.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1136.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1136.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1136.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.actionParams)
	end
	return var1136
end

t_32.descriptor = {
	name = "RemoveBadgeFromInventoryAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RemoveBadgeFromInventoryAction"
}
t.RemoveBadgeFromInventoryAction = t_32
typeRegistryModule.default:register(t.RemoveBadgeFromInventoryAction)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p62) --[[ line: 9405 ]]
	-- upvalues: t_33 (ref)
	return setmetatable({
		asset_id = if p62 == nil or p62.asset_id == nil then nil else p62.asset_id
	}, t_33)
end

function t_33:encode() --[[ line: 9413 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1138 = 0
	
	if self.asset_id ~= nil then
		local var1139 = self.asset_id:encode()
		local var1140, var1141 = protoModule.writeTag(buff, var1138, 1, protoModule.wireTypes.lengthDelimited)
		var1140, var1141 = protoModule.writeBuffer(var1140, var1141, var1139, buffer.len(var1139))
		buff = var1140
		var1138 = var1141
	end
	local buff_1 = buffer.create(var1138)
	buffer.copy(buff_1, 0, buff, 0, var1138)
	
	return buff_1
end

function t_33.decode(p63) --[[ line: 9428 ]]
	-- upvalues: t_33 (ref), protoModule (ref), propTypesModule (ref)
	local var1143 = t_33.new()
	local var1144 = 0
	while var1144 < buffer.len(p63) do
		local _ = nil
		local var1145 = nil
		local var1146, var1147, var1148 = protoModule.readTag(p63, var1144)
		local var1149 = var1146
		var1145 = var1147
		var1144 = var1148
		
		if var1145 == protoModule.wireTypes.varint then
			local _ = nil
			local var1150, var1151 = protoModule.readVarInt(p63, var1144)
			local _ = var1150
			var1144 = var1151
			continue
		end
		if var1145 == protoModule.wireTypes.lengthDelimited then
			if var1149 == 1 then
				local _ = nil
				local var1152, var1153 = protoModule.readBuffer(p63, var1144)
				var1144 = var1153
				var1143.asset_id = propTypesModule.StringProp.decode(var1152)
			else
				local _ = nil
				local var1154, var1155 = protoModule.readVarInt(p63, var1144)
				var1144 = var1155 + var1154
			end
		elseif var1145 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1156, var1157 = protoModule.readFixed32(p63, var1144)
			local _ = var1156
			var1144 = var1157
		elseif var1145 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1158, var1159 = protoModule.readFixed64(p63, var1144)
			local _ = var1158
			var1144 = var1159
		else
			error("Unsupported wire type: " .. var1145)
		end
	end
	return var1143
end

function t_33:jsonEncode() --[[ line: 9471 ]]
	local t = {}
	
	if self.asset_id ~= nil then
		t.assetId = self.asset_id:jsonEncode()
	end
	return t
end

function t_33:jsonDecode() --[[ line: 9481 ]]
	-- upvalues: t_33 (ref), propTypesModule (ref)
	local var1161 = t_33.new()
	
	if self.asset_id ~= nil then
		var1161.asset_id = propTypesModule.StringProp.jsonDecode(self.asset_id)
	end
	if self.assetId ~= nil then
		var1161.asset_id = propTypesModule.StringProp.jsonDecode(self.assetId)
	end
	return var1161
end

t_33.descriptor = {
	name = "RemoveBadgeFromInventoryAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RemoveBadgeFromInventoryAction_Params = t_33
typeRegistryModule.default:register(t.RemoveBadgeFromInventoryAction_Params)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p64) --[[ line: 9511 ]]
	-- upvalues: t (ref), t_34 (ref)
	return setmetatable({
		action_type = if p64 == nil or p64.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p64.action_type,
		action_params = if p64 == nil or p64.action_params == nil then nil else p64.action_params
	}, t_34)
end

function t_34:encode() --[[ line: 9520 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1163 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1164, var1165 = protoModule.writeTag(buff, var1163, 1, protoModule.wireTypes.varint)
		var1164, var1165 = protoModule.writeVarInt(var1164, var1165, t.ActionType.toNumber(self.action_type))
		buff = var1164
		var1163 = var1165
	end
	if self.action_params ~= nil then
		local var1166 = self.action_params:encode()
		local var1167, var1168 = protoModule.writeTag(buff, var1163, 2, protoModule.wireTypes.lengthDelimited)
		var1167, var1168 = protoModule.writeBuffer(var1167, var1168, var1166, buffer.len(var1166))
		buff = var1167
		var1163 = var1168
	end
	local buff_1 = buffer.create(var1163)
	buffer.copy(buff_1, 0, buff, 0, var1163)
	
	return buff_1
end

function t_34.decode(p65) --[[ line: 9546 ]]
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var1170 = t_34.new()
	local var1171 = 0
	while var1171 < buffer.len(p65) do
		local _ = nil
		local var1172 = nil
		local var1173, var1174, var1175 = protoModule.readTag(p65, var1171)
		local var1176 = var1173
		var1172 = var1174
		var1171 = var1175
		
		if var1172 == protoModule.wireTypes.varint then
			if var1176 == 1 then
				local _ = nil
				local var1177, var1178 = protoModule.readVarIntI32(p65, var1171)
				local var1179 = var1177
				var1171 = var1178
				var1170.action_type = t.ActionType.fromNumber(var1179) or var1179
			else
				local _ = nil
				local var1180, var1181 = protoModule.readVarInt(p65, var1171)
				local _ = var1180
				var1171 = var1181
			end
		end
		if var1172 == protoModule.wireTypes.lengthDelimited then
			if var1176 == 2 then
				local _ = nil
				local var1182, var1183 = protoModule.readBuffer(p65, var1171)
				var1171 = var1183
				var1170.action_params = t.OpenProfileAction_Params.decode(var1182)
			else
				local _ = nil
				local var1184, var1185 = protoModule.readVarInt(p65, var1171)
				var1171 = var1185 + var1184
			end
		elseif var1172 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1186, var1187 = protoModule.readFixed32(p65, var1171)
			local _ = var1186
			var1171 = var1187
		elseif var1172 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1188, var1189 = protoModule.readFixed64(p65, var1171)
			local _ = var1188
			var1171 = var1189
		else
			error("Unsupported wire type: " .. var1172)
		end
	end
	return var1170
end

function t_34:jsonEncode() --[[ line: 9594 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_34:jsonDecode() --[[ line: 9616 ]]
	-- upvalues: t_34 (ref), t (ref)
	local var1191 = t_34.new()
	
	if self.action_type ~= nil then
		var1191.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1191.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1191.action_params = t.OpenProfileAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1191.action_params = t.OpenProfileAction_Params.jsonDecode(self.actionParams)
	end
	return var1191
end

t_34.descriptor = {
	name = "OpenProfileAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenProfileAction"
}
t.OpenProfileAction = t_34
typeRegistryModule.default:register(t.OpenProfileAction)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p66) --[[ line: 9656 ]]
	-- upvalues: t_35 (ref)
	return setmetatable({
		profile_id = if p66 == nil or p66.profile_id == nil then nil else p66.profile_id,
		profile_type = if p66 == nil or p66.profile_type == nil then nil else p66.profile_type,
		source = if p66 == nil or p66.source == nil then nil else p66.source
	}, t_35)
end

function t_35:encode() --[[ line: 9664 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1193 = 0
	
	if self.profile_id ~= nil then
		local var1194 = self.profile_id:encode()
		local var1195, var1196 = protoModule.writeTag(buff, var1193, 1, protoModule.wireTypes.lengthDelimited)
		var1195, var1196 = protoModule.writeBuffer(var1195, var1196, var1194, buffer.len(var1194))
		buff = var1195
		var1193 = var1196
	end
	if self.profile_type ~= nil then
		local var1197 = self.profile_type:encode()
		local var1198, var1199 = protoModule.writeTag(buff, var1193, 2, protoModule.wireTypes.lengthDelimited)
		var1198, var1199 = protoModule.writeBuffer(var1198, var1199, var1197, buffer.len(var1197))
		buff = var1198
		var1193 = var1199
	end
	if self.source ~= nil then
		local var1200 = self.source:encode()
		local var1201, var1202 = protoModule.writeTag(buff, var1193, 3, protoModule.wireTypes.lengthDelimited)
		var1201, var1202 = protoModule.writeBuffer(var1201, var1202, var1200, buffer.len(var1200))
		buff = var1201
		var1193 = var1202
	end
	local buff_1 = buffer.create(var1193)
	buffer.copy(buff_1, 0, buff, 0, var1193)
	
	return buff_1
end

function t_35.decode(p67) --[[ line: 9691 ]]
	-- upvalues: t_35 (ref), protoModule (ref), propTypesModule (ref)
	local var1204 = t_35.new()
	local var1205 = 0
	while var1205 < buffer.len(p67) do
		local _ = nil
		local var1206 = nil
		local var1207, var1208, var1209 = protoModule.readTag(p67, var1205)
		local var1210 = var1207
		var1206 = var1208
		var1205 = var1209
		
		if var1206 == protoModule.wireTypes.varint then
			local _ = nil
			local var1211, var1212 = protoModule.readVarInt(p67, var1205)
			local _ = var1211
			var1205 = var1212
			continue
		end
		if var1206 == protoModule.wireTypes.lengthDelimited then
			if var1210 == 1 then
				local _ = nil
				local var1213, var1214 = protoModule.readBuffer(p67, var1205)
				var1205 = var1214
				var1204.profile_id = propTypesModule.StringProp.decode(var1213)
			elseif var1210 == 2 then
				local _ = nil
				local var1215, var1216 = protoModule.readBuffer(p67, var1205)
				var1205 = var1216
				var1204.profile_type = propTypesModule.StringProp.decode(var1215)
			elseif var1210 == 3 then
				local _ = nil
				local var1217, var1218 = protoModule.readBuffer(p67, var1205)
				var1205 = var1218
				var1204.source = propTypesModule.StringProp.decode(var1217)
			else
				local _ = nil
				local var1219, var1220 = protoModule.readVarInt(p67, var1205)
				var1205 = var1220 + var1219
			end
		elseif var1206 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1221, var1222 = protoModule.readFixed32(p67, var1205)
			local _ = var1221
			var1205 = var1222
		elseif var1206 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1223, var1224 = protoModule.readFixed64(p67, var1205)
			local _ = var1223
			var1205 = var1224
		else
			error("Unsupported wire type: " .. var1206)
		end
	end
	return var1204
end

function t_35:jsonEncode() --[[ line: 9744 ]]
	local t = {}
	
	if self.profile_id ~= nil then
		t.profileId = self.profile_id:jsonEncode()
	end
	if self.profile_type ~= nil then
		t.profileType = self.profile_type:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_35:jsonDecode() --[[ line: 9762 ]]
	-- upvalues: t_35 (ref), propTypesModule (ref)
	local var1226 = t_35.new()
	
	if self.profile_id ~= nil then
		var1226.profile_id = propTypesModule.StringProp.jsonDecode(self.profile_id)
	end
	if self.profileId ~= nil then
		var1226.profile_id = propTypesModule.StringProp.jsonDecode(self.profileId)
	end
	if self.profile_type ~= nil then
		var1226.profile_type = propTypesModule.StringProp.jsonDecode(self.profile_type)
	end
	if self.profileType ~= nil then
		var1226.profile_type = propTypesModule.StringProp.jsonDecode(self.profileType)
	end
	if self.source ~= nil then
		var1226.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var1226
end

t_35.descriptor = {
	name = "OpenProfileAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenProfileAction_Params = t_35
typeRegistryModule.default:register(t.OpenProfileAction_Params)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p68) --[[ line: 9804 ]]
	-- upvalues: t (ref), t_36 (ref)
	return setmetatable({
		action_type = if p68 == nil or p68.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p68.action_type,
		action_params = if p68 == nil or p68.action_params == nil then nil else p68.action_params
	}, t_36)
end

function t_36:encode() --[[ line: 9815 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1228 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1229, var1230 = protoModule.writeTag(buff, var1228, 1, protoModule.wireTypes.varint)
		var1229, var1230 = protoModule.writeVarInt(var1229, var1230, t.ActionType.toNumber(self.action_type))
		buff = var1229
		var1228 = var1230
	end
	if self.action_params ~= nil then
		local var1231 = self.action_params:encode()
		local var1232, var1233 = protoModule.writeTag(buff, var1228, 2, protoModule.wireTypes.lengthDelimited)
		var1232, var1233 = protoModule.writeBuffer(var1232, var1233, var1231, buffer.len(var1231))
		buff = var1232
		var1228 = var1233
	end
	local buff_1 = buffer.create(var1228)
	buffer.copy(buff_1, 0, buff, 0, var1228)
	
	return buff_1
end

function t_36.decode(p69) --[[ line: 9841 ]]
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1235 = t_36.new()
	local var1236 = 0
	while var1236 < buffer.len(p69) do
		local _ = nil
		local var1237 = nil
		local var1238, var1239, var1240 = protoModule.readTag(p69, var1236)
		local var1241 = var1238
		var1237 = var1239
		var1236 = var1240
		
		if var1237 == protoModule.wireTypes.varint then
			if var1241 == 1 then
				local _ = nil
				local var1242, var1243 = protoModule.readVarIntI32(p69, var1236)
				local var1244 = var1242
				var1236 = var1243
				var1235.action_type = t.ActionType.fromNumber(var1244) or var1244
			else
				local _ = nil
				local var1245, var1246 = protoModule.readVarInt(p69, var1236)
				local _ = var1245
				var1236 = var1246
			end
		end
		if var1237 == protoModule.wireTypes.lengthDelimited then
			if var1241 == 2 then
				local _ = nil
				local var1247, var1248 = protoModule.readBuffer(p69, var1236)
				var1236 = var1248
				var1235.action_params = t.OpenFacialAgeEstimationAction_Params.decode(var1247)
			else
				local _ = nil
				local var1249, var1250 = protoModule.readVarInt(p69, var1236)
				var1236 = var1250 + var1249
			end
		elseif var1237 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1251, var1252 = protoModule.readFixed32(p69, var1236)
			local _ = var1251
			var1236 = var1252
		elseif var1237 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1253, var1254 = protoModule.readFixed64(p69, var1236)
			local _ = var1253
			var1236 = var1254
		else
			error("Unsupported wire type: " .. var1237)
		end
	end
	return var1235
end

function t_36:jsonEncode() --[[ line: 9889 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_36:jsonDecode() --[[ line: 9911 ]]
	-- upvalues: t_36 (ref), t (ref)
	local var1256 = t_36.new()
	
	if self.action_type ~= nil then
		var1256.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1256.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1256.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1256.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.actionParams)
	end
	return var1256
end

t_36.descriptor = {
	name = "OpenFacialAgeEstimationAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenFacialAgeEstimationAction"
}
t.OpenFacialAgeEstimationAction = t_36
typeRegistryModule.default:register(t.OpenFacialAgeEstimationAction)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p70) --[[ line: 9951 ]]
	-- upvalues: t_37 (ref)
	return setmetatable({
		user_id = if p70 == nil or p70.user_id == nil then nil else p70.user_id,
		source = if p70 == nil or p70.source == nil then nil else p70.source,
		context = if p70 == nil or p70.context == nil then nil else p70.context,
		is_in_experience = if p70 == nil or p70.is_in_experience == nil then nil else p70.is_in_experience,
		on_success = if p70 == nil or p70.on_success == nil then nil else p70.on_success,
		on_failure = if p70 == nil or p70.on_failure == nil then nil else p70.on_failure
	}, t_37)
end

function t_37:encode() --[[ line: 9964 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1258 = 0
	
	if self.user_id ~= nil then
		local var1259 = self.user_id:encode()
		local var1260, var1261 = protoModule.writeTag(buff, var1258, 1, protoModule.wireTypes.lengthDelimited)
		var1260, var1261 = protoModule.writeBuffer(var1260, var1261, var1259, buffer.len(var1259))
		buff = var1260
		var1258 = var1261
	end
	if self.source ~= nil then
		local var1262 = self.source:encode()
		local var1263, var1264 = protoModule.writeTag(buff, var1258, 2, protoModule.wireTypes.lengthDelimited)
		var1263, var1264 = protoModule.writeBuffer(var1263, var1264, var1262, buffer.len(var1262))
		buff = var1263
		var1258 = var1264
	end
	if self.context ~= nil then
		local var1265 = self.context:encode()
		local var1266, var1267 = protoModule.writeTag(buff, var1258, 3, protoModule.wireTypes.lengthDelimited)
		var1266, var1267 = protoModule.writeBuffer(var1266, var1267, var1265, buffer.len(var1265))
		buff = var1266
		var1258 = var1267
	end
	if self.is_in_experience ~= nil then
		local var1268 = self.is_in_experience:encode()
		local var1269, var1270 = protoModule.writeTag(buff, var1258, 4, protoModule.wireTypes.lengthDelimited)
		var1269, var1270 = protoModule.writeBuffer(var1269, var1270, var1268, buffer.len(var1268))
		buff = var1269
		var1258 = var1270
	end
	if self.on_success ~= nil then
		local var1271 = self.on_success:encode()
		local var1272, var1273 = protoModule.writeTag(buff, var1258, 5, protoModule.wireTypes.lengthDelimited)
		var1272, var1273 = protoModule.writeBuffer(var1272, var1273, var1271, buffer.len(var1271))
		buff = var1272
		var1258 = var1273
	end
	if self.on_failure ~= nil then
		local var1274 = self.on_failure:encode()
		local var1275, var1276 = protoModule.writeTag(buff, var1258, 6, protoModule.wireTypes.lengthDelimited)
		var1275, var1276 = protoModule.writeBuffer(var1275, var1276, var1274, buffer.len(var1274))
		buff = var1275
		var1258 = var1276
	end
	local buff_1 = buffer.create(var1258)
	buffer.copy(buff_1, 0, buff, 0, var1258)
	
	return buff_1
end

function t_37.decode(p71) --[[ line: 10009 ]]
	-- upvalues: t_37 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1278 = t_37.new()
	local var1279 = 0
	while var1279 < buffer.len(p71) do
		local _ = nil
		local var1280 = nil
		local var1281, var1282, var1283 = protoModule.readTag(p71, var1279)
		local var1284 = var1281
		var1280 = var1282
		var1279 = var1283
		
		if var1280 == protoModule.wireTypes.varint then
			local _ = nil
			local var1285, var1286 = protoModule.readVarInt(p71, var1279)
			local _ = var1285
			var1279 = var1286
			continue
		end
		if var1280 == protoModule.wireTypes.lengthDelimited then
			if var1284 == 1 then
				local _ = nil
				local var1287, var1288 = protoModule.readBuffer(p71, var1279)
				var1279 = var1288
				var1278.user_id = propTypesModule.StringProp.decode(var1287)
			elseif var1284 == 2 then
				local _ = nil
				local var1289, var1290 = protoModule.readBuffer(p71, var1279)
				var1279 = var1290
				var1278.source = propTypesModule.StringProp.decode(var1289)
			elseif var1284 == 3 then
				local _ = nil
				local var1291, var1292 = protoModule.readBuffer(p71, var1279)
				var1279 = var1292
				var1278.context = propTypesModule.StringProp.decode(var1291)
			elseif var1284 == 4 then
				local _ = nil
				local var1293, var1294 = protoModule.readBuffer(p71, var1279)
				var1279 = var1294
				var1278.is_in_experience = propTypesModule.BoolProp.decode(var1293)
			elseif var1284 == 5 then
				local _ = nil
				local var1295, var1296 = protoModule.readBuffer(p71, var1279)
				var1279 = var1296
				var1278.on_success = t.ActionProp.decode(var1295)
			elseif var1284 == 6 then
				local _ = nil
				local var1297, var1298 = protoModule.readBuffer(p71, var1279)
				var1279 = var1298
				var1278.on_failure = t.ActionProp.decode(var1297)
			else
				local _ = nil
				local var1299, var1300 = protoModule.readVarInt(p71, var1279)
				var1279 = var1300 + var1299
			end
		elseif var1280 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1301, var1302 = protoModule.readFixed32(p71, var1279)
			local _ = var1301
			var1279 = var1302
		elseif var1280 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1303, var1304 = protoModule.readFixed64(p71, var1279)
			local _ = var1303
			var1279 = var1304
		else
			error("Unsupported wire type: " .. var1280)
		end
	end
	return var1278
end

function t_37:jsonEncode() --[[ line: 10077 ]]
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	if self.context ~= nil then
		t.context = self.context:jsonEncode()
	end
	if self.is_in_experience ~= nil then
		t.isInExperience = self.is_in_experience:jsonEncode()
	end
	if self.on_success ~= nil then
		t.onSuccess = self.on_success:jsonEncode()
	end
	if self.on_failure ~= nil then
		t.onFailure = self.on_failure:jsonEncode()
	end
	return t
end

function t_37:jsonDecode() --[[ line: 10107 ]]
	-- upvalues: t_37 (ref), propTypesModule (ref), t (ref)
	local var1306 = t_37.new()
	
	if self.user_id ~= nil then
		var1306.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1306.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var1306.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.context ~= nil then
		var1306.context = propTypesModule.StringProp.jsonDecode(self.context)
	end
	if self.is_in_experience ~= nil then
		var1306.is_in_experience = propTypesModule.BoolProp.jsonDecode(self.is_in_experience)
	end
	if self.isInExperience ~= nil then
		var1306.is_in_experience = propTypesModule.BoolProp.jsonDecode(self.isInExperience)
	end
	if self.on_success ~= nil then
		var1306.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var1306.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var1306.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var1306.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	return var1306
end

t_37.descriptor = {
	name = "OpenFacialAgeEstimationAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenFacialAgeEstimationAction_Params = t_37
typeRegistryModule.default:register(t.OpenFacialAgeEstimationAction_Params)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p72) --[[ line: 10171 ]]
	-- upvalues: t (ref), t_38 (ref)
	return setmetatable({
		action_type = if p72 == nil or p72.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p72.action_type,
		action_params = if p72 == nil or p72.action_params == nil then nil else p72.action_params
	}, t_38)
end

function t_38:encode() --[[ line: 10182 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1308 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1309, var1310 = protoModule.writeTag(buff, var1308, 1, protoModule.wireTypes.varint)
		var1309, var1310 = protoModule.writeVarInt(var1309, var1310, t.ActionType.toNumber(self.action_type))
		buff = var1309
		var1308 = var1310
	end
	if self.action_params ~= nil then
		local var1311 = self.action_params:encode()
		local var1312, var1313 = protoModule.writeTag(buff, var1308, 2, protoModule.wireTypes.lengthDelimited)
		var1312, var1313 = protoModule.writeBuffer(var1312, var1313, var1311, buffer.len(var1311))
		buff = var1312
		var1308 = var1313
	end
	local buff_1 = buffer.create(var1308)
	buffer.copy(buff_1, 0, buff, 0, var1308)
	
	return buff_1
end

function t_38.decode(p73) --[[ line: 10208 ]]
	-- upvalues: t_38 (ref), protoModule (ref), t (ref)
	local var1315 = t_38.new()
	local var1316 = 0
	while var1316 < buffer.len(p73) do
		local _ = nil
		local var1317 = nil
		local var1318, var1319, var1320 = protoModule.readTag(p73, var1316)
		local var1321 = var1318
		var1317 = var1319
		var1316 = var1320
		
		if var1317 == protoModule.wireTypes.varint then
			if var1321 == 1 then
				local _ = nil
				local var1322, var1323 = protoModule.readVarIntI32(p73, var1316)
				local var1324 = var1322
				var1316 = var1323
				var1315.action_type = t.ActionType.fromNumber(var1324) or var1324
			else
				local _ = nil
				local var1325, var1326 = protoModule.readVarInt(p73, var1316)
				local _ = var1325
				var1316 = var1326
			end
		end
		if var1317 == protoModule.wireTypes.lengthDelimited then
			if var1321 == 2 then
				local _ = nil
				local var1327, var1328 = protoModule.readBuffer(p73, var1316)
				var1316 = var1328
				var1315.action_params = t.OpenPhoneUpsellModalAction_Params.decode(var1327)
			else
				local _ = nil
				local var1329, var1330 = protoModule.readVarInt(p73, var1316)
				var1316 = var1330 + var1329
			end
		elseif var1317 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1331, var1332 = protoModule.readFixed32(p73, var1316)
			local _ = var1331
			var1316 = var1332
		elseif var1317 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1333, var1334 = protoModule.readFixed64(p73, var1316)
			local _ = var1333
			var1316 = var1334
		else
			error("Unsupported wire type: " .. var1317)
		end
	end
	return var1315
end

function t_38:jsonEncode() --[[ line: 10256 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_38:jsonDecode() --[[ line: 10278 ]]
	-- upvalues: t_38 (ref), t (ref)
	local var1336 = t_38.new()
	
	if self.action_type ~= nil then
		var1336.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1336.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1336.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1336.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var1336
end

t_38.descriptor = {
	name = "OpenPhoneUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenPhoneUpsellModalAction"
}
t.OpenPhoneUpsellModalAction = t_38
typeRegistryModule.default:register(t.OpenPhoneUpsellModalAction)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p74) --[[ line: 10318 ]]
	-- upvalues: t_39 (ref)
	return setmetatable({
		voice_opt_in = if p74 == nil or p74.voice_opt_in == nil then nil else p74.voice_opt_in,
		event_context = if p74 == nil or p74.event_context == nil then nil else p74.event_context,
		origin = if p74 == nil or p74.origin == nil then nil else p74.origin,
		should_autofill_android_phone_number_at_launch = if p74 == nil or p74.should_autofill_android_phone_number_at_launch == nil then nil else p74.should_autofill_android_phone_number_at_launch,
		add_phone_description_key = if p74 == nil or p74.add_phone_description_key == nil then nil else p74.add_phone_description_key,
		on_success = if p74 == nil or p74.on_success == nil then nil else p74.on_success,
		on_failure = if p74 == nil or p74.on_failure == nil then nil else p74.on_failure,
		on_cancelled = if p74 == nil or p74.on_cancelled == nil then nil else p74.on_cancelled
	}, t_39)
end

function t_39:encode() --[[ line: 10338 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1338 = 0
	
	if self.voice_opt_in ~= nil then
		local var1339 = self.voice_opt_in:encode()
		local var1340, var1341 = protoModule.writeTag(buff, var1338, 1, protoModule.wireTypes.lengthDelimited)
		var1340, var1341 = protoModule.writeBuffer(var1340, var1341, var1339, buffer.len(var1339))
		buff = var1340
		var1338 = var1341
	end
	if self.event_context ~= nil then
		local var1342 = self.event_context:encode()
		local var1343, var1344 = protoModule.writeTag(buff, var1338, 2, protoModule.wireTypes.lengthDelimited)
		var1343, var1344 = protoModule.writeBuffer(var1343, var1344, var1342, buffer.len(var1342))
		buff = var1343
		var1338 = var1344
	end
	if self.origin ~= nil then
		local var1345 = self.origin:encode()
		local var1346, var1347 = protoModule.writeTag(buff, var1338, 3, protoModule.wireTypes.lengthDelimited)
		var1346, var1347 = protoModule.writeBuffer(var1346, var1347, var1345, buffer.len(var1345))
		buff = var1346
		var1338 = var1347
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		local var1348 = self.should_autofill_android_phone_number_at_launch:encode()
		local var1349, var1350 = protoModule.writeTag(buff, var1338, 4, protoModule.wireTypes.lengthDelimited)
		var1349, var1350 = protoModule.writeBuffer(var1349, var1350, var1348, buffer.len(var1348))
		buff = var1349
		var1338 = var1350
	end
	if self.add_phone_description_key ~= nil then
		local var1351 = self.add_phone_description_key:encode()
		local var1352, var1353 = protoModule.writeTag(buff, var1338, 5, protoModule.wireTypes.lengthDelimited)
		var1352, var1353 = protoModule.writeBuffer(var1352, var1353, var1351, buffer.len(var1351))
		buff = var1352
		var1338 = var1353
	end
	if self.on_success ~= nil then
		local var1354 = self.on_success:encode()
		local var1355, var1356 = protoModule.writeTag(buff, var1338, 6, protoModule.wireTypes.lengthDelimited)
		var1355, var1356 = protoModule.writeBuffer(var1355, var1356, var1354, buffer.len(var1354))
		buff = var1355
		var1338 = var1356
	end
	if self.on_failure ~= nil then
		local var1357 = self.on_failure:encode()
		local var1358, var1359 = protoModule.writeTag(buff, var1338, 7, protoModule.wireTypes.lengthDelimited)
		var1358, var1359 = protoModule.writeBuffer(var1358, var1359, var1357, buffer.len(var1357))
		buff = var1358
		var1338 = var1359
	end
	if self.on_cancelled ~= nil then
		local var1360 = self.on_cancelled:encode()
		local var1361, var1362 = protoModule.writeTag(buff, var1338, 8, protoModule.wireTypes.lengthDelimited)
		var1361, var1362 = protoModule.writeBuffer(var1361, var1362, var1360, buffer.len(var1360))
		buff = var1361
		var1338 = var1362
	end
	local buff_1 = buffer.create(var1338)
	buffer.copy(buff_1, 0, buff, 0, var1338)
	
	return buff_1
end

function t_39.decode(p75) --[[ line: 10395 ]]
	-- upvalues: t_39 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1364 = t_39.new()
	local var1365 = 0
	while var1365 < buffer.len(p75) do
		local _ = nil
		local var1366 = nil
		local var1367, var1368, var1369 = protoModule.readTag(p75, var1365)
		local var1370 = var1367
		var1366 = var1368
		var1365 = var1369
		
		if var1366 == protoModule.wireTypes.varint then
			local _ = nil
			local var1371, var1372 = protoModule.readVarInt(p75, var1365)
			local _ = var1371
			var1365 = var1372
			continue
		end
		if var1366 == protoModule.wireTypes.lengthDelimited then
			if var1370 == 1 then
				local _ = nil
				local var1373, var1374 = protoModule.readBuffer(p75, var1365)
				var1365 = var1374
				var1364.voice_opt_in = propTypesModule.BoolProp.decode(var1373)
			elseif var1370 == 2 then
				local _ = nil
				local var1375, var1376 = protoModule.readBuffer(p75, var1365)
				var1365 = var1376
				var1364.event_context = propTypesModule.StringProp.decode(var1375)
			elseif var1370 == 3 then
				local _ = nil
				local var1377, var1378 = protoModule.readBuffer(p75, var1365)
				var1365 = var1378
				var1364.origin = propTypesModule.StringProp.decode(var1377)
			elseif var1370 == 4 then
				local _ = nil
				local var1379, var1380 = protoModule.readBuffer(p75, var1365)
				var1365 = var1380
				var1364.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.decode(var1379)
			elseif var1370 == 5 then
				local _ = nil
				local var1381, var1382 = protoModule.readBuffer(p75, var1365)
				var1365 = var1382
				var1364.add_phone_description_key = propTypesModule.StringProp.decode(var1381)
			elseif var1370 == 6 then
				local _ = nil
				local var1383, var1384 = protoModule.readBuffer(p75, var1365)
				var1365 = var1384
				var1364.on_success = t.ActionProp.decode(var1383)
			elseif var1370 == 7 then
				local _ = nil
				local var1385, var1386 = protoModule.readBuffer(p75, var1365)
				var1365 = var1386
				var1364.on_failure = t.ActionProp.decode(var1385)
			elseif var1370 == 8 then
				local _ = nil
				local var1387, var1388 = protoModule.readBuffer(p75, var1365)
				var1365 = var1388
				var1364.on_cancelled = t.ActionProp.decode(var1387)
			else
				local _ = nil
				local var1389, var1390 = protoModule.readVarInt(p75, var1365)
				var1365 = var1390 + var1389
			end
		elseif var1366 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1391, var1392 = protoModule.readFixed32(p75, var1365)
			local _ = var1391
			var1365 = var1392
		elseif var1366 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1393, var1394 = protoModule.readFixed64(p75, var1365)
			local _ = var1393
			var1365 = var1394
		else
			error("Unsupported wire type: " .. var1366)
		end
	end
	return var1364
end

function t_39:jsonEncode() --[[ line: 10475 ]]
	local t = {}
	
	if self.voice_opt_in ~= nil then
		t.voiceOptIn = self.voice_opt_in:jsonEncode()
	end
	if self.event_context ~= nil then
		t.eventContext = self.event_context:jsonEncode()
	end
	if self.origin ~= nil then
		t.origin = self.origin:jsonEncode()
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		t.shouldAutofillAndroidPhoneNumberAtLaunch = self.should_autofill_android_phone_number_at_launch:jsonEncode()
	end
	if self.add_phone_description_key ~= nil then
		t.addPhoneDescriptionKey = self.add_phone_description_key:jsonEncode()
	end
	if self.on_success ~= nil then
		t.onSuccess = self.on_success:jsonEncode()
	end
	if self.on_failure ~= nil then
		t.onFailure = self.on_failure:jsonEncode()
	end
	if self.on_cancelled ~= nil then
		t.onCancelled = self.on_cancelled:jsonEncode()
	end
	return t
end

function t_39:jsonDecode() --[[ line: 10514 ]]
	-- upvalues: t_39 (ref), propTypesModule (ref), t (ref)
	local var1396 = t_39.new()
	
	if self.voice_opt_in ~= nil then
		var1396.voice_opt_in = propTypesModule.BoolProp.jsonDecode(self.voice_opt_in)
	end
	if self.voiceOptIn ~= nil then
		var1396.voice_opt_in = propTypesModule.BoolProp.jsonDecode(self.voiceOptIn)
	end
	if self.event_context ~= nil then
		var1396.event_context = propTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		var1396.event_context = propTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		var1396.origin = propTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		var1396.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.jsonDecode(self.should_autofill_android_phone_number_at_launch)
	end
	if self.shouldAutofillAndroidPhoneNumberAtLaunch ~= nil then
		var1396.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.jsonDecode(self.shouldAutofillAndroidPhoneNumberAtLaunch)
	end
	if self.add_phone_description_key ~= nil then
		var1396.add_phone_description_key = propTypesModule.StringProp.jsonDecode(self.add_phone_description_key)
	end
	if self.addPhoneDescriptionKey ~= nil then
		var1396.add_phone_description_key = propTypesModule.StringProp.jsonDecode(self.addPhoneDescriptionKey)
	end
	if self.on_success ~= nil then
		var1396.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var1396.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var1396.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var1396.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	if self.on_cancelled ~= nil then
		var1396.on_cancelled = t.ActionProp.jsonDecode(self.on_cancelled)
	end
	if self.onCancelled ~= nil then
		var1396.on_cancelled = t.ActionProp.jsonDecode(self.onCancelled)
	end
	return var1396
end

t_39.descriptor = {
	name = "OpenPhoneUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenPhoneUpsellModalAction_Params = t_39
typeRegistryModule.default:register(t.OpenPhoneUpsellModalAction_Params)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p76) --[[ line: 10607 ]]
	-- upvalues: t (ref), t_40 (ref)
	return setmetatable({
		action_type = if p76 == nil or p76.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p76.action_type,
		action_params = if p76 == nil or p76.action_params == nil then nil else p76.action_params
	}, t_40)
end

function t_40:encode() --[[ line: 10618 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1398 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1399, var1400 = protoModule.writeTag(buff, var1398, 1, protoModule.wireTypes.varint)
		var1399, var1400 = protoModule.writeVarInt(var1399, var1400, t.ActionType.toNumber(self.action_type))
		buff = var1399
		var1398 = var1400
	end
	if self.action_params ~= nil then
		local var1401 = self.action_params:encode()
		local var1402, var1403 = protoModule.writeTag(buff, var1398, 2, protoModule.wireTypes.lengthDelimited)
		var1402, var1403 = protoModule.writeBuffer(var1402, var1403, var1401, buffer.len(var1401))
		buff = var1402
		var1398 = var1403
	end
	local buff_1 = buffer.create(var1398)
	buffer.copy(buff_1, 0, buff, 0, var1398)
	
	return buff_1
end

function t_40.decode(p77) --[[ line: 10644 ]]
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var1405 = t_40.new()
	local var1406 = 0
	while var1406 < buffer.len(p77) do
		local _ = nil
		local var1407 = nil
		local var1408, var1409, var1410 = protoModule.readTag(p77, var1406)
		local var1411 = var1408
		var1407 = var1409
		var1406 = var1410
		
		if var1407 == protoModule.wireTypes.varint then
			if var1411 == 1 then
				local _ = nil
				local var1412, var1413 = protoModule.readVarIntI32(p77, var1406)
				local var1414 = var1412
				var1406 = var1413
				var1405.action_type = t.ActionType.fromNumber(var1414) or var1414
			else
				local _ = nil
				local var1415, var1416 = protoModule.readVarInt(p77, var1406)
				local _ = var1415
				var1406 = var1416
			end
		end
		if var1407 == protoModule.wireTypes.lengthDelimited then
			if var1411 == 2 then
				local _ = nil
				local var1417, var1418 = protoModule.readBuffer(p77, var1406)
				var1406 = var1418
				var1405.action_params = t.OpenEmailUpsellModalAction_Params.decode(var1417)
			else
				local _ = nil
				local var1419, var1420 = protoModule.readVarInt(p77, var1406)
				var1406 = var1420 + var1419
			end
		elseif var1407 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1421, var1422 = protoModule.readFixed32(p77, var1406)
			local _ = var1421
			var1406 = var1422
		elseif var1407 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1423, var1424 = protoModule.readFixed64(p77, var1406)
			local _ = var1423
			var1406 = var1424
		else
			error("Unsupported wire type: " .. var1407)
		end
	end
	return var1405
end

function t_40:jsonEncode() --[[ line: 10692 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_40:jsonDecode() --[[ line: 10714 ]]
	-- upvalues: t_40 (ref), t (ref)
	local var1426 = t_40.new()
	
	if self.action_type ~= nil then
		var1426.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1426.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1426.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1426.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var1426
end

t_40.descriptor = {
	name = "OpenEmailUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenEmailUpsellModalAction"
}
t.OpenEmailUpsellModalAction = t_40
typeRegistryModule.default:register(t.OpenEmailUpsellModalAction)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p78) --[[ line: 10754 ]]
	-- upvalues: t_41 (ref)
	return setmetatable({
		add_email_over13_text_key = if p78 == nil or p78.add_email_over13_text_key == nil then nil else p78.add_email_over13_text_key,
		add_email_title_key = if p78 == nil or p78.add_email_title_key == nil then nil else p78.add_email_title_key,
		is_email_modal_called_from_home_page = if p78 == nil or p78.is_email_modal_called_from_home_page == nil then nil else p78.is_email_modal_called_from_home_page,
		event_context = if p78 == nil or p78.event_context == nil then nil else p78.event_context,
		origin = if p78 == nil or p78.origin == nil then nil else p78.origin,
		section = if p78 == nil or p78.section == nil then nil else p78.section,
		on_success = if p78 == nil or p78.on_success == nil then nil else p78.on_success,
		on_failure = if p78 == nil or p78.on_failure == nil then nil else p78.on_failure
	}, t_41)
end

function t_41:encode() --[[ line: 10776 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1428 = 0
	
	if self.add_email_over13_text_key ~= nil then
		local var1429 = self.add_email_over13_text_key:encode()
		local var1430, var1431 = protoModule.writeTag(buff, var1428, 1, protoModule.wireTypes.lengthDelimited)
		var1430, var1431 = protoModule.writeBuffer(var1430, var1431, var1429, buffer.len(var1429))
		buff = var1430
		var1428 = var1431
	end
	if self.add_email_title_key ~= nil then
		local var1432 = self.add_email_title_key:encode()
		local var1433, var1434 = protoModule.writeTag(buff, var1428, 2, protoModule.wireTypes.lengthDelimited)
		var1433, var1434 = protoModule.writeBuffer(var1433, var1434, var1432, buffer.len(var1432))
		buff = var1433
		var1428 = var1434
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		local var1435 = self.is_email_modal_called_from_home_page:encode()
		local var1436, var1437 = protoModule.writeTag(buff, var1428, 3, protoModule.wireTypes.lengthDelimited)
		var1436, var1437 = protoModule.writeBuffer(var1436, var1437, var1435, buffer.len(var1435))
		buff = var1436
		var1428 = var1437
	end
	if self.event_context ~= nil then
		local var1438 = self.event_context:encode()
		local var1439, var1440 = protoModule.writeTag(buff, var1428, 4, protoModule.wireTypes.lengthDelimited)
		var1439, var1440 = protoModule.writeBuffer(var1439, var1440, var1438, buffer.len(var1438))
		buff = var1439
		var1428 = var1440
	end
	if self.origin ~= nil then
		local var1441 = self.origin:encode()
		local var1442, var1443 = protoModule.writeTag(buff, var1428, 5, protoModule.wireTypes.lengthDelimited)
		var1442, var1443 = protoModule.writeBuffer(var1442, var1443, var1441, buffer.len(var1441))
		buff = var1442
		var1428 = var1443
	end
	if self.section ~= nil then
		local var1444 = self.section:encode()
		local var1445, var1446 = protoModule.writeTag(buff, var1428, 6, protoModule.wireTypes.lengthDelimited)
		var1445, var1446 = protoModule.writeBuffer(var1445, var1446, var1444, buffer.len(var1444))
		buff = var1445
		var1428 = var1446
	end
	if self.on_success ~= nil then
		local var1447 = self.on_success:encode()
		local var1448, var1449 = protoModule.writeTag(buff, var1428, 7, protoModule.wireTypes.lengthDelimited)
		var1448, var1449 = protoModule.writeBuffer(var1448, var1449, var1447, buffer.len(var1447))
		buff = var1448
		var1428 = var1449
	end
	if self.on_failure ~= nil then
		local var1450 = self.on_failure:encode()
		local var1451, var1452 = protoModule.writeTag(buff, var1428, 8, protoModule.wireTypes.lengthDelimited)
		var1451, var1452 = protoModule.writeBuffer(var1451, var1452, var1450, buffer.len(var1450))
		buff = var1451
		var1428 = var1452
	end
	local buff_1 = buffer.create(var1428)
	buffer.copy(buff_1, 0, buff, 0, var1428)
	
	return buff_1
end

function t_41.decode(p79) --[[ line: 10833 ]]
	-- upvalues: t_41 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1454 = t_41.new()
	local var1455 = 0
	while var1455 < buffer.len(p79) do
		local _ = nil
		local var1456 = nil
		local var1457, var1458, var1459 = protoModule.readTag(p79, var1455)
		local var1460 = var1457
		var1456 = var1458
		var1455 = var1459
		
		if var1456 == protoModule.wireTypes.varint then
			local _ = nil
			local var1461, var1462 = protoModule.readVarInt(p79, var1455)
			local _ = var1461
			var1455 = var1462
			continue
		end
		if var1456 == protoModule.wireTypes.lengthDelimited then
			if var1460 == 1 then
				local _ = nil
				local var1463, var1464 = protoModule.readBuffer(p79, var1455)
				var1455 = var1464
				var1454.add_email_over13_text_key = propTypesModule.StringProp.decode(var1463)
			elseif var1460 == 2 then
				local _ = nil
				local var1465, var1466 = protoModule.readBuffer(p79, var1455)
				var1455 = var1466
				var1454.add_email_title_key = propTypesModule.StringProp.decode(var1465)
			elseif var1460 == 3 then
				local _ = nil
				local var1467, var1468 = protoModule.readBuffer(p79, var1455)
				var1455 = var1468
				var1454.is_email_modal_called_from_home_page = propTypesModule.BoolProp.decode(var1467)
			elseif var1460 == 4 then
				local _ = nil
				local var1469, var1470 = protoModule.readBuffer(p79, var1455)
				var1455 = var1470
				var1454.event_context = propTypesModule.StringProp.decode(var1469)
			elseif var1460 == 5 then
				local _ = nil
				local var1471, var1472 = protoModule.readBuffer(p79, var1455)
				var1455 = var1472
				var1454.origin = propTypesModule.StringProp.decode(var1471)
			elseif var1460 == 6 then
				local _ = nil
				local var1473, var1474 = protoModule.readBuffer(p79, var1455)
				var1455 = var1474
				var1454.section = propTypesModule.StringProp.decode(var1473)
			elseif var1460 == 7 then
				local _ = nil
				local var1475, var1476 = protoModule.readBuffer(p79, var1455)
				var1455 = var1476
				var1454.on_success = t.ActionProp.decode(var1475)
			elseif var1460 == 8 then
				local _ = nil
				local var1477, var1478 = protoModule.readBuffer(p79, var1455)
				var1455 = var1478
				var1454.on_failure = t.ActionProp.decode(var1477)
			else
				local _ = nil
				local var1479, var1480 = protoModule.readVarInt(p79, var1455)
				var1455 = var1480 + var1479
			end
		elseif var1456 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1481, var1482 = protoModule.readFixed32(p79, var1455)
			local _ = var1481
			var1455 = var1482
		elseif var1456 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1483, var1484 = protoModule.readFixed64(p79, var1455)
			local _ = var1483
			var1455 = var1484
		else
			error("Unsupported wire type: " .. var1456)
		end
	end
	return var1454
end

function t_41:jsonEncode() --[[ line: 10914 ]]
	local t = {}
	
	if self.add_email_over13_text_key ~= nil then
		t.addEmailOver13TextKey = self.add_email_over13_text_key:jsonEncode()
	end
	if self.add_email_title_key ~= nil then
		t.addEmailTitleKey = self.add_email_title_key:jsonEncode()
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		t.isEmailModalCalledFromHomePage = self.is_email_modal_called_from_home_page:jsonEncode()
	end
	if self.event_context ~= nil then
		t.eventContext = self.event_context:jsonEncode()
	end
	if self.origin ~= nil then
		t.origin = self.origin:jsonEncode()
	end
	if self.section ~= nil then
		t.section = self.section:jsonEncode()
	end
	if self.on_success ~= nil then
		t.onSuccess = self.on_success:jsonEncode()
	end
	if self.on_failure ~= nil then
		t.onFailure = self.on_failure:jsonEncode()
	end
	return t
end

function t_41:jsonDecode() --[[ line: 10952 ]]
	-- upvalues: t_41 (ref), propTypesModule (ref), t (ref)
	local var1486 = t_41.new()
	
	if self.add_email_over13_text_key ~= nil then
		var1486.add_email_over13_text_key = propTypesModule.StringProp.jsonDecode(self.add_email_over13_text_key)
	end
	if self.addEmailOver13TextKey ~= nil then
		var1486.add_email_over13_text_key = propTypesModule.StringProp.jsonDecode(self.addEmailOver13TextKey)
	end
	if self.add_email_title_key ~= nil then
		var1486.add_email_title_key = propTypesModule.StringProp.jsonDecode(self.add_email_title_key)
	end
	if self.addEmailTitleKey ~= nil then
		var1486.add_email_title_key = propTypesModule.StringProp.jsonDecode(self.addEmailTitleKey)
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		var1486.is_email_modal_called_from_home_page = propTypesModule.BoolProp.jsonDecode(self.is_email_modal_called_from_home_page)
	end
	if self.isEmailModalCalledFromHomePage ~= nil then
		var1486.is_email_modal_called_from_home_page = propTypesModule.BoolProp.jsonDecode(self.isEmailModalCalledFromHomePage)
	end
	if self.event_context ~= nil then
		var1486.event_context = propTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		var1486.event_context = propTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		var1486.origin = propTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.section ~= nil then
		var1486.section = propTypesModule.StringProp.jsonDecode(self.section)
	end
	if self.on_success ~= nil then
		var1486.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var1486.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var1486.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var1486.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	return var1486
end

t_41.descriptor = {
	name = "OpenEmailUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenEmailUpsellModalAction_Params = t_41
typeRegistryModule.default:register(t.OpenEmailUpsellModalAction_Params)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p80) --[[ line: 11042 ]]
	-- upvalues: t (ref), t_42 (ref)
	return setmetatable({
		action_type = if p80 == nil or p80.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p80.action_type,
		action_params = if p80 == nil or p80.action_params == nil then nil else p80.action_params
	}, t_42)
end

function t_42:encode() --[[ line: 11053 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1488 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1489, var1490 = protoModule.writeTag(buff, var1488, 1, protoModule.wireTypes.varint)
		var1489, var1490 = protoModule.writeVarInt(var1489, var1490, t.ActionType.toNumber(self.action_type))
		buff = var1489
		var1488 = var1490
	end
	if self.action_params ~= nil then
		local var1491 = self.action_params:encode()
		local var1492, var1493 = protoModule.writeTag(buff, var1488, 2, protoModule.wireTypes.lengthDelimited)
		var1492, var1493 = protoModule.writeBuffer(var1492, var1493, var1491, buffer.len(var1491))
		buff = var1492
		var1488 = var1493
	end
	local buff_1 = buffer.create(var1488)
	buffer.copy(buff_1, 0, buff, 0, var1488)
	
	return buff_1
end

function t_42.decode(p81) --[[ line: 11079 ]]
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1495 = t_42.new()
	local var1496 = 0
	while var1496 < buffer.len(p81) do
		local _ = nil
		local var1497 = nil
		local var1498, var1499, var1500 = protoModule.readTag(p81, var1496)
		local var1501 = var1498
		var1497 = var1499
		var1496 = var1500
		
		if var1497 == protoModule.wireTypes.varint then
			if var1501 == 1 then
				local _ = nil
				local var1502, var1503 = protoModule.readVarIntI32(p81, var1496)
				local var1504 = var1502
				var1496 = var1503
				var1495.action_type = t.ActionType.fromNumber(var1504) or var1504
			else
				local _ = nil
				local var1505, var1506 = protoModule.readVarInt(p81, var1496)
				local _ = var1505
				var1496 = var1506
			end
		end
		if var1497 == protoModule.wireTypes.lengthDelimited then
			if var1501 == 2 then
				local _ = nil
				local var1507, var1508 = protoModule.readBuffer(p81, var1496)
				var1496 = var1508
				var1495.action_params = t.OpenAddConnectionsPageAction_Params.decode(var1507)
			else
				local _ = nil
				local var1509, var1510 = protoModule.readVarInt(p81, var1496)
				var1496 = var1510 + var1509
			end
		elseif var1497 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1511, var1512 = protoModule.readFixed32(p81, var1496)
			local _ = var1511
			var1496 = var1512
		elseif var1497 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1513, var1514 = protoModule.readFixed64(p81, var1496)
			local _ = var1513
			var1496 = var1514
		else
			error("Unsupported wire type: " .. var1497)
		end
	end
	return var1495
end

function t_42:jsonEncode() --[[ line: 11127 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_42:jsonDecode() --[[ line: 11149 ]]
	-- upvalues: t_42 (ref), t (ref)
	local var1516 = t_42.new()
	
	if self.action_type ~= nil then
		var1516.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1516.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1516.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1516.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.actionParams)
	end
	return var1516
end

t_42.descriptor = {
	name = "OpenAddConnectionsPageAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAddConnectionsPageAction"
}
t.OpenAddConnectionsPageAction = t_42
typeRegistryModule.default:register(t.OpenAddConnectionsPageAction)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p82) --[[ line: 11189 ]]
	-- upvalues: t_43 (ref)
	return setmetatable({
		user_id = if p82 == nil or p82.user_id == nil then nil else p82.user_id,
		source = if p82 == nil or p82.source == nil then nil else p82.source
	}, t_43)
end

function t_43:encode() --[[ line: 11198 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1518 = 0
	
	if self.user_id ~= nil then
		local var1519 = self.user_id:encode()
		local var1520, var1521 = protoModule.writeTag(buff, var1518, 1, protoModule.wireTypes.lengthDelimited)
		var1520, var1521 = protoModule.writeBuffer(var1520, var1521, var1519, buffer.len(var1519))
		buff = var1520
		var1518 = var1521
	end
	if self.source ~= nil then
		local var1522 = self.source:encode()
		local var1523, var1524 = protoModule.writeTag(buff, var1518, 2, protoModule.wireTypes.lengthDelimited)
		var1523, var1524 = protoModule.writeBuffer(var1523, var1524, var1522, buffer.len(var1522))
		buff = var1523
		var1518 = var1524
	end
	local buff_1 = buffer.create(var1518)
	buffer.copy(buff_1, 0, buff, 0, var1518)
	
	return buff_1
end

function t_43.decode(p83) --[[ line: 11219 ]]
	-- upvalues: t_43 (ref), protoModule (ref), propTypesModule (ref)
	local var1526 = t_43.new()
	local var1527 = 0
	while var1527 < buffer.len(p83) do
		local _ = nil
		local var1528 = nil
		local var1529, var1530, var1531 = protoModule.readTag(p83, var1527)
		local var1532 = var1529
		var1528 = var1530
		var1527 = var1531
		
		if var1528 == protoModule.wireTypes.varint then
			local _ = nil
			local var1533, var1534 = protoModule.readVarInt(p83, var1527)
			local _ = var1533
			var1527 = var1534
			continue
		end
		if var1528 == protoModule.wireTypes.lengthDelimited then
			if var1532 == 1 then
				local _ = nil
				local var1535, var1536 = protoModule.readBuffer(p83, var1527)
				var1527 = var1536
				var1526.user_id = propTypesModule.StringProp.decode(var1535)
			elseif var1532 == 2 then
				local _ = nil
				local var1537, var1538 = protoModule.readBuffer(p83, var1527)
				var1527 = var1538
				var1526.source = propTypesModule.StringProp.decode(var1537)
			else
				local _ = nil
				local var1539, var1540 = protoModule.readVarInt(p83, var1527)
				var1527 = var1540 + var1539
			end
		elseif var1528 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1541, var1542 = protoModule.readFixed32(p83, var1527)
			local _ = var1541
			var1527 = var1542
		elseif var1528 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1543, var1544 = protoModule.readFixed64(p83, var1527)
			local _ = var1543
			var1527 = var1544
		else
			error("Unsupported wire type: " .. var1528)
		end
	end
	return var1526
end

function t_43:jsonEncode() --[[ line: 11267 ]]
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_43:jsonDecode() --[[ line: 11281 ]]
	-- upvalues: t_43 (ref), propTypesModule (ref)
	local var1546 = t_43.new()
	
	if self.user_id ~= nil then
		var1546.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1546.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var1546.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var1546
end

t_43.descriptor = {
	name = "OpenAddConnectionsPageAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAddConnectionsPageAction_Params = t_43
typeRegistryModule.default:register(t.OpenAddConnectionsPageAction_Params)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p84) --[[ line: 11315 ]]
	-- upvalues: t (ref), t_44 (ref)
	return setmetatable({
		action_type = if p84 == nil or p84.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p84.action_type,
		action_params = if p84 == nil or p84.action_params == nil then nil else p84.action_params
	}, t_44)
end

function t_44:encode() --[[ line: 11324 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1548 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1549, var1550 = protoModule.writeTag(buff, var1548, 1, protoModule.wireTypes.varint)
		var1549, var1550 = protoModule.writeVarInt(var1549, var1550, t.ActionType.toNumber(self.action_type))
		buff = var1549
		var1548 = var1550
	end
	if self.action_params ~= nil then
		local var1551 = self.action_params:encode()
		local var1552, var1553 = protoModule.writeTag(buff, var1548, 2, protoModule.wireTypes.lengthDelimited)
		var1552, var1553 = protoModule.writeBuffer(var1552, var1553, var1551, buffer.len(var1551))
		buff = var1552
		var1548 = var1553
	end
	local buff_1 = buffer.create(var1548)
	buffer.copy(buff_1, 0, buff, 0, var1548)
	
	return buff_1
end

function t_44.decode(p85) --[[ line: 11350 ]]
	-- upvalues: t_44 (ref), protoModule (ref), t (ref)
	local var1555 = t_44.new()
	local var1556 = 0
	while var1556 < buffer.len(p85) do
		local _ = nil
		local var1557 = nil
		local var1558, var1559, var1560 = protoModule.readTag(p85, var1556)
		local var1561 = var1558
		var1557 = var1559
		var1556 = var1560
		
		if var1557 == protoModule.wireTypes.varint then
			if var1561 == 1 then
				local _ = nil
				local var1562, var1563 = protoModule.readVarIntI32(p85, var1556)
				local var1564 = var1562
				var1556 = var1563
				var1555.action_type = t.ActionType.fromNumber(var1564) or var1564
			else
				local _ = nil
				local var1565, var1566 = protoModule.readVarInt(p85, var1556)
				local _ = var1565
				var1556 = var1566
			end
		end
		if var1557 == protoModule.wireTypes.lengthDelimited then
			if var1561 == 2 then
				local _ = nil
				local var1567, var1568 = protoModule.readBuffer(p85, var1556)
				var1556 = var1568
				var1555.action_params = t.OpenMarketplaceAction_Params.decode(var1567)
			else
				local _ = nil
				local var1569, var1570 = protoModule.readVarInt(p85, var1556)
				var1556 = var1570 + var1569
			end
		elseif var1557 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1571, var1572 = protoModule.readFixed32(p85, var1556)
			local _ = var1571
			var1556 = var1572
		elseif var1557 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1573, var1574 = protoModule.readFixed64(p85, var1556)
			local _ = var1573
			var1556 = var1574
		else
			error("Unsupported wire type: " .. var1557)
		end
	end
	return var1555
end

function t_44:jsonEncode() --[[ line: 11398 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_44:jsonDecode() --[[ line: 11420 ]]
	-- upvalues: t_44 (ref), t (ref)
	local var1576 = t_44.new()
	
	if self.action_type ~= nil then
		var1576.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1576.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1576.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1576.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.actionParams)
	end
	return var1576
end

t_44.descriptor = {
	name = "OpenMarketplaceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceAction"
}
t.OpenMarketplaceAction = t_44
typeRegistryModule.default:register(t.OpenMarketplaceAction)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p86) --[[ line: 11460 ]]
	-- upvalues: t_45 (ref)
	return setmetatable({
		user_id = if p86 == nil or p86.user_id == nil then nil else p86.user_id,
		source = if p86 == nil or p86.source == nil then nil else p86.source
	}, t_45)
end

function t_45:encode() --[[ line: 11469 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1578 = 0
	
	if self.user_id ~= nil then
		local var1579 = self.user_id:encode()
		local var1580, var1581 = protoModule.writeTag(buff, var1578, 1, protoModule.wireTypes.lengthDelimited)
		var1580, var1581 = protoModule.writeBuffer(var1580, var1581, var1579, buffer.len(var1579))
		buff = var1580
		var1578 = var1581
	end
	if self.source ~= nil then
		local var1582 = self.source:encode()
		local var1583, var1584 = protoModule.writeTag(buff, var1578, 2, protoModule.wireTypes.lengthDelimited)
		var1583, var1584 = protoModule.writeBuffer(var1583, var1584, var1582, buffer.len(var1582))
		buff = var1583
		var1578 = var1584
	end
	local buff_1 = buffer.create(var1578)
	buffer.copy(buff_1, 0, buff, 0, var1578)
	
	return buff_1
end

function t_45.decode(p87) --[[ line: 11490 ]]
	-- upvalues: t_45 (ref), protoModule (ref), propTypesModule (ref)
	local var1586 = t_45.new()
	local var1587 = 0
	while var1587 < buffer.len(p87) do
		local _ = nil
		local var1588 = nil
		local var1589, var1590, var1591 = protoModule.readTag(p87, var1587)
		local var1592 = var1589
		var1588 = var1590
		var1587 = var1591
		
		if var1588 == protoModule.wireTypes.varint then
			local _ = nil
			local var1593, var1594 = protoModule.readVarInt(p87, var1587)
			local _ = var1593
			var1587 = var1594
			continue
		end
		if var1588 == protoModule.wireTypes.lengthDelimited then
			if var1592 == 1 then
				local _ = nil
				local var1595, var1596 = protoModule.readBuffer(p87, var1587)
				var1587 = var1596
				var1586.user_id = propTypesModule.StringProp.decode(var1595)
			elseif var1592 == 2 then
				local _ = nil
				local var1597, var1598 = protoModule.readBuffer(p87, var1587)
				var1587 = var1598
				var1586.source = propTypesModule.StringProp.decode(var1597)
			else
				local _ = nil
				local var1599, var1600 = protoModule.readVarInt(p87, var1587)
				var1587 = var1600 + var1599
			end
		elseif var1588 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1601, var1602 = protoModule.readFixed32(p87, var1587)
			local _ = var1601
			var1587 = var1602
		elseif var1588 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1603, var1604 = protoModule.readFixed64(p87, var1587)
			local _ = var1603
			var1587 = var1604
		else
			error("Unsupported wire type: " .. var1588)
		end
	end
	return var1586
end

function t_45:jsonEncode() --[[ line: 11538 ]]
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_45:jsonDecode() --[[ line: 11552 ]]
	-- upvalues: t_45 (ref), propTypesModule (ref)
	local var1606 = t_45.new()
	
	if self.user_id ~= nil then
		var1606.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1606.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var1606.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var1606
end

t_45.descriptor = {
	name = "OpenMarketplaceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceAction_Params = t_45
typeRegistryModule.default:register(t.OpenMarketplaceAction_Params)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p88) --[[ line: 11584 ]]
	-- upvalues: t (ref), t_46 (ref)
	return setmetatable({
		action_type = if p88 == nil or p88.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p88.action_type,
		action_params = if p88 == nil or p88.action_params == nil then nil else p88.action_params
	}, t_46)
end

function t_46:encode() --[[ line: 11595 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1608 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1609, var1610 = protoModule.writeTag(buff, var1608, 1, protoModule.wireTypes.varint)
		var1609, var1610 = protoModule.writeVarInt(var1609, var1610, t.ActionType.toNumber(self.action_type))
		buff = var1609
		var1608 = var1610
	end
	if self.action_params ~= nil then
		local var1611 = self.action_params:encode()
		local var1612, var1613 = protoModule.writeTag(buff, var1608, 2, protoModule.wireTypes.lengthDelimited)
		var1612, var1613 = protoModule.writeBuffer(var1612, var1613, var1611, buffer.len(var1611))
		buff = var1612
		var1608 = var1613
	end
	local buff_1 = buffer.create(var1608)
	buffer.copy(buff_1, 0, buff, 0, var1608)
	
	return buff_1
end

function t_46.decode(p89) --[[ line: 11621 ]]
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var1615 = t_46.new()
	local var1616 = 0
	while var1616 < buffer.len(p89) do
		local _ = nil
		local var1617 = nil
		local var1618, var1619, var1620 = protoModule.readTag(p89, var1616)
		local var1621 = var1618
		var1617 = var1619
		var1616 = var1620
		
		if var1617 == protoModule.wireTypes.varint then
			if var1621 == 1 then
				local _ = nil
				local var1622, var1623 = protoModule.readVarIntI32(p89, var1616)
				local var1624 = var1622
				var1616 = var1623
				var1615.action_type = t.ActionType.fromNumber(var1624) or var1624
			else
				local _ = nil
				local var1625, var1626 = protoModule.readVarInt(p89, var1616)
				local _ = var1625
				var1616 = var1626
			end
		end
		if var1617 == protoModule.wireTypes.lengthDelimited then
			if var1621 == 2 then
				local _ = nil
				local var1627, var1628 = protoModule.readBuffer(p89, var1616)
				var1616 = var1628
				var1615.action_params = t.HideProfileCompletionAction_Params.decode(var1627)
			else
				local _ = nil
				local var1629, var1630 = protoModule.readVarInt(p89, var1616)
				var1616 = var1630 + var1629
			end
		elseif var1617 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1631, var1632 = protoModule.readFixed32(p89, var1616)
			local _ = var1631
			var1616 = var1632
		elseif var1617 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1633, var1634 = protoModule.readFixed64(p89, var1616)
			local _ = var1633
			var1616 = var1634
		else
			error("Unsupported wire type: " .. var1617)
		end
	end
	return var1615
end

function t_46:jsonEncode() --[[ line: 11669 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_46:jsonDecode() --[[ line: 11691 ]]
	-- upvalues: t_46 (ref), t (ref)
	local var1636 = t_46.new()
	
	if self.action_type ~= nil then
		var1636.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1636.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1636.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1636.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.actionParams)
	end
	return var1636
end

t_46.descriptor = {
	name = "HideProfileCompletionAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.HideProfileCompletionAction"
}
t.HideProfileCompletionAction = t_46
typeRegistryModule.default:register(t.HideProfileCompletionAction)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p90) --[[ line: 11731 ]]
	-- upvalues: t_47 (ref)
	return setmetatable({
		user_id = if p90 == nil or p90.user_id == nil then nil else p90.user_id,
		prompt_id = if p90 == nil or p90.prompt_id == nil then nil else p90.prompt_id,
		source = if p90 == nil or p90.source == nil then nil else p90.source,
		prompt_type = if p90 == nil or p90.prompt_type == nil then nil else p90.prompt_type
	}, t_47)
end

function t_47:encode() --[[ line: 11742 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1638 = 0
	
	if self.user_id ~= nil then
		local var1639 = self.user_id:encode()
		local var1640, var1641 = protoModule.writeTag(buff, var1638, 1, protoModule.wireTypes.lengthDelimited)
		var1640, var1641 = protoModule.writeBuffer(var1640, var1641, var1639, buffer.len(var1639))
		buff = var1640
		var1638 = var1641
	end
	if self.prompt_id ~= nil then
		local var1642 = self.prompt_id:encode()
		local var1643, var1644 = protoModule.writeTag(buff, var1638, 2, protoModule.wireTypes.lengthDelimited)
		var1643, var1644 = protoModule.writeBuffer(var1643, var1644, var1642, buffer.len(var1642))
		buff = var1643
		var1638 = var1644
	end
	if self.source ~= nil then
		local var1645 = self.source:encode()
		local var1646, var1647 = protoModule.writeTag(buff, var1638, 3, protoModule.wireTypes.lengthDelimited)
		var1646, var1647 = protoModule.writeBuffer(var1646, var1647, var1645, buffer.len(var1645))
		buff = var1646
		var1638 = var1647
	end
	if self.prompt_type ~= nil then
		local var1648 = self.prompt_type:encode()
		local var1649, var1650 = protoModule.writeTag(buff, var1638, 4, protoModule.wireTypes.lengthDelimited)
		var1649, var1650 = protoModule.writeBuffer(var1649, var1650, var1648, buffer.len(var1648))
		buff = var1649
		var1638 = var1650
	end
	local buff_1 = buffer.create(var1638)
	buffer.copy(buff_1, 0, buff, 0, var1638)
	
	return buff_1
end

function t_47.decode(p91) --[[ line: 11775 ]]
	-- upvalues: t_47 (ref), protoModule (ref), propTypesModule (ref)
	local var1652 = t_47.new()
	local var1653 = 0
	while var1653 < buffer.len(p91) do
		local _ = nil
		local var1654 = nil
		local var1655, var1656, var1657 = protoModule.readTag(p91, var1653)
		local var1658 = var1655
		var1654 = var1656
		var1653 = var1657
		
		if var1654 == protoModule.wireTypes.varint then
			local _ = nil
			local var1659, var1660 = protoModule.readVarInt(p91, var1653)
			local _ = var1659
			var1653 = var1660
			continue
		end
		if var1654 == protoModule.wireTypes.lengthDelimited then
			if var1658 == 1 then
				local _ = nil
				local var1661, var1662 = protoModule.readBuffer(p91, var1653)
				var1653 = var1662
				var1652.user_id = propTypesModule.StringProp.decode(var1661)
			elseif var1658 == 2 then
				local _ = nil
				local var1663, var1664 = protoModule.readBuffer(p91, var1653)
				var1653 = var1664
				var1652.prompt_id = propTypesModule.StringProp.decode(var1663)
			elseif var1658 == 3 then
				local _ = nil
				local var1665, var1666 = protoModule.readBuffer(p91, var1653)
				var1653 = var1666
				var1652.source = propTypesModule.StringProp.decode(var1665)
			elseif var1658 == 4 then
				local _ = nil
				local var1667, var1668 = protoModule.readBuffer(p91, var1653)
				var1653 = var1668
				var1652.prompt_type = propTypesModule.StringProp.decode(var1667)
			else
				local _ = nil
				local var1669, var1670 = protoModule.readVarInt(p91, var1653)
				var1653 = var1670 + var1669
			end
		elseif var1654 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1671, var1672 = protoModule.readFixed32(p91, var1653)
			local _ = var1671
			var1653 = var1672
		elseif var1654 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1673, var1674 = protoModule.readFixed64(p91, var1653)
			local _ = var1673
			var1653 = var1674
		else
			error("Unsupported wire type: " .. var1654)
		end
	end
	return var1652
end

function t_47:jsonEncode() --[[ line: 11833 ]]
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.prompt_id ~= nil then
		t.promptId = self.prompt_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	if self.prompt_type ~= nil then
		t.promptType = self.prompt_type:jsonEncode()
	end
	return t
end

function t_47:jsonDecode() --[[ line: 11855 ]]
	-- upvalues: t_47 (ref), propTypesModule (ref)
	local var1676 = t_47.new()
	
	if self.user_id ~= nil then
		var1676.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1676.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.prompt_id ~= nil then
		var1676.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1676.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.source ~= nil then
		var1676.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.prompt_type ~= nil then
		var1676.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1676.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	return var1676
end

t_47.descriptor = {
	name = "HideProfileCompletionAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.HideProfileCompletionAction_Params = t_47
typeRegistryModule.default:register(t.HideProfileCompletionAction_Params)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p92) --[[ line: 11906 ]]
	-- upvalues: t (ref), t_48 (ref)
	return setmetatable({
		action_type = if p92 == nil or p92.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p92.action_type,
		action_params = if p92 == nil or p92.action_params == nil then nil else p92.action_params
	}, t_48)
end

function t_48:encode() --[[ line: 11917 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1678 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1679, var1680 = protoModule.writeTag(buff, var1678, 1, protoModule.wireTypes.varint)
		var1679, var1680 = protoModule.writeVarInt(var1679, var1680, t.ActionType.toNumber(self.action_type))
		buff = var1679
		var1678 = var1680
	end
	if self.action_params ~= nil then
		local var1681 = self.action_params:encode()
		local var1682, var1683 = protoModule.writeTag(buff, var1678, 2, protoModule.wireTypes.lengthDelimited)
		var1682, var1683 = protoModule.writeBuffer(var1682, var1683, var1681, buffer.len(var1681))
		buff = var1682
		var1678 = var1683
	end
	local buff_1 = buffer.create(var1678)
	buffer.copy(buff_1, 0, buff, 0, var1678)
	
	return buff_1
end

function t_48.decode(p93) --[[ line: 11943 ]]
	-- upvalues: t_48 (ref), protoModule (ref), t (ref)
	local var1685 = t_48.new()
	local var1686 = 0
	while var1686 < buffer.len(p93) do
		local _ = nil
		local var1687 = nil
		local var1688, var1689, var1690 = protoModule.readTag(p93, var1686)
		local var1691 = var1688
		var1687 = var1689
		var1686 = var1690
		
		if var1687 == protoModule.wireTypes.varint then
			if var1691 == 1 then
				local _ = nil
				local var1692, var1693 = protoModule.readVarIntI32(p93, var1686)
				local var1694 = var1692
				var1686 = var1693
				var1685.action_type = t.ActionType.fromNumber(var1694) or var1694
			else
				local _ = nil
				local var1695, var1696 = protoModule.readVarInt(p93, var1686)
				local _ = var1695
				var1686 = var1696
			end
		end
		if var1687 == protoModule.wireTypes.lengthDelimited then
			if var1691 == 2 then
				local _ = nil
				local var1697, var1698 = protoModule.readBuffer(p93, var1686)
				var1686 = var1698
				var1685.action_params = t.SelectMarketplaceCatalogCategory_Params.decode(var1697)
			else
				local _ = nil
				local var1699, var1700 = protoModule.readVarInt(p93, var1686)
				var1686 = var1700 + var1699
			end
		elseif var1687 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1701, var1702 = protoModule.readFixed32(p93, var1686)
			local _ = var1701
			var1686 = var1702
		elseif var1687 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1703, var1704 = protoModule.readFixed64(p93, var1686)
			local _ = var1703
			var1686 = var1704
		else
			error("Unsupported wire type: " .. var1687)
		end
	end
	return var1685
end

function t_48:jsonEncode() --[[ line: 11991 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_48:jsonDecode() --[[ line: 12013 ]]
	-- upvalues: t_48 (ref), t (ref)
	local var1706 = t_48.new()
	
	if self.action_type ~= nil then
		var1706.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1706.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1706.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1706.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.actionParams)
	end
	return var1706
end

t_48.descriptor = {
	name = "SelectMarketplaceCatalogCategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogCategory"
}
t.SelectMarketplaceCatalogCategory = t_48
typeRegistryModule.default:register(t.SelectMarketplaceCatalogCategory)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p94) --[[ line: 12055 ]]
	-- upvalues: t_49 (ref)
	return setmetatable({
		category_id = if p94 == nil or p94.category_id == nil then nil else p94.category_id
	}, t_49)
end

function t_49:encode() --[[ line: 12063 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1708 = 0
	
	if self.category_id ~= nil then
		local var1709 = self.category_id:encode()
		local var1710, var1711 = protoModule.writeTag(buff, var1708, 1, protoModule.wireTypes.lengthDelimited)
		var1710, var1711 = protoModule.writeBuffer(var1710, var1711, var1709, buffer.len(var1709))
		buff = var1710
		var1708 = var1711
	end
	local buff_1 = buffer.create(var1708)
	buffer.copy(buff_1, 0, buff, 0, var1708)
	
	return buff_1
end

function t_49.decode(p95) --[[ line: 12078 ]]
	-- upvalues: t_49 (ref), protoModule (ref), propTypesModule (ref)
	local var1713 = t_49.new()
	local var1714 = 0
	while var1714 < buffer.len(p95) do
		local _ = nil
		local var1715 = nil
		local var1716, var1717, var1718 = protoModule.readTag(p95, var1714)
		local var1719 = var1716
		var1715 = var1717
		var1714 = var1718
		
		if var1715 == protoModule.wireTypes.varint then
			local _ = nil
			local var1720, var1721 = protoModule.readVarInt(p95, var1714)
			local _ = var1720
			var1714 = var1721
			continue
		end
		if var1715 == protoModule.wireTypes.lengthDelimited then
			if var1719 == 1 then
				local _ = nil
				local var1722, var1723 = protoModule.readBuffer(p95, var1714)
				var1714 = var1723
				var1713.category_id = propTypesModule.StringProp.decode(var1722)
			else
				local _ = nil
				local var1724, var1725 = protoModule.readVarInt(p95, var1714)
				var1714 = var1725 + var1724
			end
		elseif var1715 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1726, var1727 = protoModule.readFixed32(p95, var1714)
			local _ = var1726
			var1714 = var1727
		elseif var1715 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1728, var1729 = protoModule.readFixed64(p95, var1714)
			local _ = var1728
			var1714 = var1729
		else
			error("Unsupported wire type: " .. var1715)
		end
	end
	return var1713
end

function t_49:jsonEncode() --[[ line: 12121 ]]
	local t = {}
	
	if self.category_id ~= nil then
		t.categoryId = self.category_id:jsonEncode()
	end
	return t
end

function t_49:jsonDecode() --[[ line: 12131 ]]
	-- upvalues: t_49 (ref), propTypesModule (ref)
	local var1731 = t_49.new()
	
	if self.category_id ~= nil then
		var1731.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var1731.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	return var1731
end

t_49.descriptor = {
	name = "SelectMarketplaceCatalogCategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceCatalogCategory_Params = t_49
typeRegistryModule.default:register(t.SelectMarketplaceCatalogCategory_Params)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p96) --[[ line: 12162 ]]
	-- upvalues: t (ref), t_50 (ref)
	return setmetatable({
		action_type = if p96 == nil or p96.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p96.action_type,
		action_params = if p96 == nil or p96.action_params == nil then nil else p96.action_params
	}, t_50)
end

function t_50:encode() --[[ line: 12173 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1733 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1734, var1735 = protoModule.writeTag(buff, var1733, 1, protoModule.wireTypes.varint)
		var1734, var1735 = protoModule.writeVarInt(var1734, var1735, t.ActionType.toNumber(self.action_type))
		buff = var1734
		var1733 = var1735
	end
	if self.action_params ~= nil then
		local var1736 = self.action_params:encode()
		local var1737, var1738 = protoModule.writeTag(buff, var1733, 2, protoModule.wireTypes.lengthDelimited)
		var1737, var1738 = protoModule.writeBuffer(var1737, var1738, var1736, buffer.len(var1736))
		buff = var1737
		var1733 = var1738
	end
	local buff_1 = buffer.create(var1733)
	buffer.copy(buff_1, 0, buff, 0, var1733)
	
	return buff_1
end

function t_50.decode(p97) --[[ line: 12199 ]]
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var1740 = t_50.new()
	local var1741 = 0
	while var1741 < buffer.len(p97) do
		local _ = nil
		local var1742 = nil
		local var1743, var1744, var1745 = protoModule.readTag(p97, var1741)
		local var1746 = var1743
		var1742 = var1744
		var1741 = var1745
		
		if var1742 == protoModule.wireTypes.varint then
			if var1746 == 1 then
				local _ = nil
				local var1747, var1748 = protoModule.readVarIntI32(p97, var1741)
				local var1749 = var1747
				var1741 = var1748
				var1740.action_type = t.ActionType.fromNumber(var1749) or var1749
			else
				local _ = nil
				local var1750, var1751 = protoModule.readVarInt(p97, var1741)
				local _ = var1750
				var1741 = var1751
			end
		end
		if var1742 == protoModule.wireTypes.lengthDelimited then
			if var1746 == 2 then
				local _ = nil
				local var1752, var1753 = protoModule.readBuffer(p97, var1741)
				var1741 = var1753
				var1740.action_params = t.SelectMarketplaceCatalogSubcategory_Params.decode(var1752)
			else
				local _ = nil
				local var1754, var1755 = protoModule.readVarInt(p97, var1741)
				var1741 = var1755 + var1754
			end
		elseif var1742 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1756, var1757 = protoModule.readFixed32(p97, var1741)
			local _ = var1756
			var1741 = var1757
		elseif var1742 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1758, var1759 = protoModule.readFixed64(p97, var1741)
			local _ = var1758
			var1741 = var1759
		else
			error("Unsupported wire type: " .. var1742)
		end
	end
	return var1740
end

function t_50:jsonEncode() --[[ line: 12247 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_50:jsonDecode() --[[ line: 12269 ]]
	-- upvalues: t_50 (ref), t (ref)
	local var1761 = t_50.new()
	
	if self.action_type ~= nil then
		var1761.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1761.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1761.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1761.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.actionParams)
	end
	return var1761
end

t_50.descriptor = {
	name = "SelectMarketplaceCatalogSubcategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogSubcategory"
}
t.SelectMarketplaceCatalogSubcategory = t_50
typeRegistryModule.default:register(t.SelectMarketplaceCatalogSubcategory)
local t_51 = {}
t_51.__index = t_51

function t_51.new(p98) --[[ line: 12311 ]]
	-- upvalues: t_51 (ref)
	return setmetatable({
		subcategory_id = if p98 == nil or p98.subcategory_id == nil then nil else p98.subcategory_id
	}, t_51)
end

function t_51:encode() --[[ line: 12319 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1763 = 0
	
	if self.subcategory_id ~= nil then
		local var1764 = self.subcategory_id:encode()
		local var1765, var1766 = protoModule.writeTag(buff, var1763, 1, protoModule.wireTypes.lengthDelimited)
		var1765, var1766 = protoModule.writeBuffer(var1765, var1766, var1764, buffer.len(var1764))
		buff = var1765
		var1763 = var1766
	end
	local buff_1 = buffer.create(var1763)
	buffer.copy(buff_1, 0, buff, 0, var1763)
	
	return buff_1
end

function t_51.decode(p99) --[[ line: 12336 ]]
	-- upvalues: t_51 (ref), protoModule (ref), propTypesModule (ref)
	local var1768 = t_51.new()
	local var1769 = 0
	while var1769 < buffer.len(p99) do
		local _ = nil
		local var1770 = nil
		local var1771, var1772, var1773 = protoModule.readTag(p99, var1769)
		local var1774 = var1771
		var1770 = var1772
		var1769 = var1773
		
		if var1770 == protoModule.wireTypes.varint then
			local _ = nil
			local var1775, var1776 = protoModule.readVarInt(p99, var1769)
			local _ = var1775
			var1769 = var1776
			continue
		end
		if var1770 == protoModule.wireTypes.lengthDelimited then
			if var1774 == 1 then
				local _ = nil
				local var1777, var1778 = protoModule.readBuffer(p99, var1769)
				var1769 = var1778
				var1768.subcategory_id = propTypesModule.StringProp.decode(var1777)
			else
				local _ = nil
				local var1779, var1780 = protoModule.readVarInt(p99, var1769)
				var1769 = var1780 + var1779
			end
		elseif var1770 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1781, var1782 = protoModule.readFixed32(p99, var1769)
			local _ = var1781
			var1769 = var1782
		elseif var1770 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1783, var1784 = protoModule.readFixed64(p99, var1769)
			local _ = var1783
			var1769 = var1784
		else
			error("Unsupported wire type: " .. var1770)
		end
	end
	return var1768
end

function t_51:jsonEncode() --[[ line: 12381 ]]
	local t = {}
	
	if self.subcategory_id ~= nil then
		t.subcategoryId = self.subcategory_id:jsonEncode()
	end
	return t
end

function t_51:jsonDecode() --[[ line: 12393 ]]
	-- upvalues: t_51 (ref), propTypesModule (ref)
	local var1786 = t_51.new()
	
	if self.subcategory_id ~= nil then
		var1786.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var1786.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	return var1786
end

t_51.descriptor = {
	name = "SelectMarketplaceCatalogSubcategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceCatalogSubcategory_Params = t_51
typeRegistryModule.default:register(t.SelectMarketplaceCatalogSubcategory_Params)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p100) --[[ line: 12425 ]]
	-- upvalues: t (ref), t_52 (ref)
	return setmetatable({
		action_type = if p100 == nil or p100.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p100.action_type,
		action_params = if p100 == nil or p100.action_params == nil then nil else p100.action_params
	}, t_52)
end

function t_52:encode() --[[ line: 12436 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1788 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1789, var1790 = protoModule.writeTag(buff, var1788, 1, protoModule.wireTypes.varint)
		var1789, var1790 = protoModule.writeVarInt(var1789, var1790, t.ActionType.toNumber(self.action_type))
		buff = var1789
		var1788 = var1790
	end
	if self.action_params ~= nil then
		local var1791 = self.action_params:encode()
		local var1792, var1793 = protoModule.writeTag(buff, var1788, 2, protoModule.wireTypes.lengthDelimited)
		var1792, var1793 = protoModule.writeBuffer(var1792, var1793, var1791, buffer.len(var1791))
		buff = var1792
		var1788 = var1793
	end
	local buff_1 = buffer.create(var1788)
	buffer.copy(buff_1, 0, buff, 0, var1788)
	
	return buff_1
end

function t_52.decode(p101) --[[ line: 12462 ]]
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1795 = t_52.new()
	local var1796 = 0
	while var1796 < buffer.len(p101) do
		local _ = nil
		local var1797 = nil
		local var1798, var1799, var1800 = protoModule.readTag(p101, var1796)
		local var1801 = var1798
		var1797 = var1799
		var1796 = var1800
		
		if var1797 == protoModule.wireTypes.varint then
			if var1801 == 1 then
				local _ = nil
				local var1802, var1803 = protoModule.readVarIntI32(p101, var1796)
				local var1804 = var1802
				var1796 = var1803
				var1795.action_type = t.ActionType.fromNumber(var1804) or var1804
			else
				local _ = nil
				local var1805, var1806 = protoModule.readVarInt(p101, var1796)
				local _ = var1805
				var1796 = var1806
			end
		end
		if var1797 == protoModule.wireTypes.lengthDelimited then
			if var1801 == 2 then
				local _ = nil
				local var1807, var1808 = protoModule.readBuffer(p101, var1796)
				var1796 = var1808
				var1795.action_params = t.OpenMarketplaceCatalogSeeAll_Params.decode(var1807)
			else
				local _ = nil
				local var1809, var1810 = protoModule.readVarInt(p101, var1796)
				var1796 = var1810 + var1809
			end
		elseif var1797 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1811, var1812 = protoModule.readFixed32(p101, var1796)
			local _ = var1811
			var1796 = var1812
		elseif var1797 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1813, var1814 = protoModule.readFixed64(p101, var1796)
			local _ = var1813
			var1796 = var1814
		else
			error("Unsupported wire type: " .. var1797)
		end
	end
	return var1795
end

function t_52:jsonEncode() --[[ line: 12510 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_52:jsonDecode() --[[ line: 12532 ]]
	-- upvalues: t_52 (ref), t (ref)
	local var1816 = t_52.new()
	
	if self.action_type ~= nil then
		var1816.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1816.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1816.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1816.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.actionParams)
	end
	return var1816
end

t_52.descriptor = {
	name = "OpenMarketplaceCatalogSeeAll",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogSeeAll"
}
t.OpenMarketplaceCatalogSeeAll = t_52
typeRegistryModule.default:register(t.OpenMarketplaceCatalogSeeAll)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p102) --[[ line: 12572 ]]
	-- upvalues: t_53 (ref)
	return setmetatable({
		sort_id = if p102 == nil or p102.sort_id == nil then nil else p102.sort_id,
		title = if p102 == nil or p102.title == nil then nil else p102.title,
		description = if p102 == nil or p102.description == nil then nil else p102.description,
		tooltip_text = if p102 == nil or p102.tooltip_text == nil then nil else p102.tooltip_text
	}, t_53)
end

function t_53:encode() --[[ line: 12583 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1818 = 0
	
	if self.sort_id ~= nil then
		local var1819 = self.sort_id:encode()
		local var1820, var1821 = protoModule.writeTag(buff, var1818, 1, protoModule.wireTypes.lengthDelimited)
		var1820, var1821 = protoModule.writeBuffer(var1820, var1821, var1819, buffer.len(var1819))
		buff = var1820
		var1818 = var1821
	end
	if self.title ~= nil then
		local var1822 = self.title:encode()
		local var1823, var1824 = protoModule.writeTag(buff, var1818, 2, protoModule.wireTypes.lengthDelimited)
		var1823, var1824 = protoModule.writeBuffer(var1823, var1824, var1822, buffer.len(var1822))
		buff = var1823
		var1818 = var1824
	end
	if self.description ~= nil then
		local var1825 = self.description:encode()
		local var1826, var1827 = protoModule.writeTag(buff, var1818, 3, protoModule.wireTypes.lengthDelimited)
		var1826, var1827 = protoModule.writeBuffer(var1826, var1827, var1825, buffer.len(var1825))
		buff = var1826
		var1818 = var1827
	end
	if self.tooltip_text ~= nil then
		local var1828 = self.tooltip_text:encode()
		local var1829, var1830 = protoModule.writeTag(buff, var1818, 4, protoModule.wireTypes.lengthDelimited)
		var1829, var1830 = protoModule.writeBuffer(var1829, var1830, var1828, buffer.len(var1828))
		buff = var1829
		var1818 = var1830
	end
	local buff_1 = buffer.create(var1818)
	buffer.copy(buff_1, 0, buff, 0, var1818)
	
	return buff_1
end

function t_53.decode(p103) --[[ line: 12616 ]]
	-- upvalues: t_53 (ref), protoModule (ref), propTypesModule (ref)
	local var1832 = t_53.new()
	local var1833 = 0
	while var1833 < buffer.len(p103) do
		local _ = nil
		local var1834 = nil
		local var1835, var1836, var1837 = protoModule.readTag(p103, var1833)
		local var1838 = var1835
		var1834 = var1836
		var1833 = var1837
		
		if var1834 == protoModule.wireTypes.varint then
			local _ = nil
			local var1839, var1840 = protoModule.readVarInt(p103, var1833)
			local _ = var1839
			var1833 = var1840
			continue
		end
		if var1834 == protoModule.wireTypes.lengthDelimited then
			if var1838 == 1 then
				local _ = nil
				local var1841, var1842 = protoModule.readBuffer(p103, var1833)
				var1833 = var1842
				var1832.sort_id = propTypesModule.StringProp.decode(var1841)
			elseif var1838 == 2 then
				local _ = nil
				local var1843, var1844 = protoModule.readBuffer(p103, var1833)
				var1833 = var1844
				var1832.title = propTypesModule.StringProp.decode(var1843)
			elseif var1838 == 3 then
				local _ = nil
				local var1845, var1846 = protoModule.readBuffer(p103, var1833)
				var1833 = var1846
				var1832.description = propTypesModule.StringProp.decode(var1845)
			elseif var1838 == 4 then
				local _ = nil
				local var1847, var1848 = protoModule.readBuffer(p103, var1833)
				var1833 = var1848
				var1832.tooltip_text = propTypesModule.StringProp.decode(var1847)
			else
				local _ = nil
				local var1849, var1850 = protoModule.readVarInt(p103, var1833)
				var1833 = var1850 + var1849
			end
		elseif var1834 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1851, var1852 = protoModule.readFixed32(p103, var1833)
			local _ = var1851
			var1833 = var1852
		elseif var1834 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1853, var1854 = protoModule.readFixed64(p103, var1833)
			local _ = var1853
			var1833 = var1854
		else
			error("Unsupported wire type: " .. var1834)
		end
	end
	return var1832
end

function t_53:jsonEncode() --[[ line: 12674 ]]
	local t = {}
	
	if self.sort_id ~= nil then
		t.sortId = self.sort_id:jsonEncode()
	end
	if self.title ~= nil then
		t.title = self.title:jsonEncode()
	end
	if self.description ~= nil then
		t.description = self.description:jsonEncode()
	end
	if self.tooltip_text ~= nil then
		t.tooltipText = self.tooltip_text:jsonEncode()
	end
	return t
end

function t_53:jsonDecode() --[[ line: 12696 ]]
	-- upvalues: t_53 (ref), propTypesModule (ref)
	local var1856 = t_53.new()
	
	if self.sort_id ~= nil then
		var1856.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var1856.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.title ~= nil then
		var1856.title = propTypesModule.StringProp.jsonDecode(self.title)
	end
	if self.description ~= nil then
		var1856.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.tooltip_text ~= nil then
		var1856.tooltip_text = propTypesModule.StringProp.jsonDecode(self.tooltip_text)
	end
	if self.tooltipText ~= nil then
		var1856.tooltip_text = propTypesModule.StringProp.jsonDecode(self.tooltipText)
	end
	return var1856
end

t_53.descriptor = {
	name = "OpenMarketplaceCatalogSeeAll_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceCatalogSeeAll_Params = t_53
typeRegistryModule.default:register(t.OpenMarketplaceCatalogSeeAll_Params)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p104) --[[ line: 12745 ]]
	-- upvalues: t (ref), t_54 (ref)
	return setmetatable({
		action_type = if p104 == nil or p104.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p104.action_type,
		action_params = if p104 == nil or p104.action_params == nil then nil else p104.action_params
	}, t_54)
end

function t_54:encode() --[[ line: 12756 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1858 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1859, var1860 = protoModule.writeTag(buff, var1858, 1, protoModule.wireTypes.varint)
		var1859, var1860 = protoModule.writeVarInt(var1859, var1860, t.ActionType.toNumber(self.action_type))
		buff = var1859
		var1858 = var1860
	end
	if self.action_params ~= nil then
		local var1861 = self.action_params:encode()
		local var1862, var1863 = protoModule.writeTag(buff, var1858, 2, protoModule.wireTypes.lengthDelimited)
		var1862, var1863 = protoModule.writeBuffer(var1862, var1863, var1861, buffer.len(var1861))
		buff = var1862
		var1858 = var1863
	end
	local buff_1 = buffer.create(var1858)
	buffer.copy(buff_1, 0, buff, 0, var1858)
	
	return buff_1
end

function t_54.decode(p105) --[[ line: 12782 ]]
	-- upvalues: t_54 (ref), protoModule (ref), t (ref)
	local var1865 = t_54.new()
	local var1866 = 0
	while var1866 < buffer.len(p105) do
		local _ = nil
		local var1867 = nil
		local var1868, var1869, var1870 = protoModule.readTag(p105, var1866)
		local var1871 = var1868
		var1867 = var1869
		var1866 = var1870
		
		if var1867 == protoModule.wireTypes.varint then
			if var1871 == 1 then
				local _ = nil
				local var1872, var1873 = protoModule.readVarIntI32(p105, var1866)
				local var1874 = var1872
				var1866 = var1873
				var1865.action_type = t.ActionType.fromNumber(var1874) or var1874
			else
				local _ = nil
				local var1875, var1876 = protoModule.readVarInt(p105, var1866)
				local _ = var1875
				var1866 = var1876
			end
		end
		if var1867 == protoModule.wireTypes.lengthDelimited then
			if var1871 == 2 then
				local _ = nil
				local var1877, var1878 = protoModule.readBuffer(p105, var1866)
				var1866 = var1878
				var1865.action_params = t.CloseMarketplaceCategoryTooltip_Params.decode(var1877)
			else
				local _ = nil
				local var1879, var1880 = protoModule.readVarInt(p105, var1866)
				var1866 = var1880 + var1879
			end
		elseif var1867 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1881, var1882 = protoModule.readFixed32(p105, var1866)
			local _ = var1881
			var1866 = var1882
		elseif var1867 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1883, var1884 = protoModule.readFixed64(p105, var1866)
			local _ = var1883
			var1866 = var1884
		else
			error("Unsupported wire type: " .. var1867)
		end
	end
	return var1865
end

function t_54:jsonEncode() --[[ line: 12830 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_54:jsonDecode() --[[ line: 12852 ]]
	-- upvalues: t_54 (ref), t (ref)
	local var1886 = t_54.new()
	
	if self.action_type ~= nil then
		var1886.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1886.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1886.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1886.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.actionParams)
	end
	return var1886
end

t_54.descriptor = {
	name = "CloseMarketplaceCategoryTooltip",
	fullName = "roblox.apppageplatform.shared.v1beta1.CloseMarketplaceCategoryTooltip"
}
t.CloseMarketplaceCategoryTooltip = t_54
typeRegistryModule.default:register(t.CloseMarketplaceCategoryTooltip)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p106) --[[ line: 12892 ]]
	-- upvalues: t_55 (ref)
	return setmetatable({
		tooltip_id = if p106 == nil or p106.tooltip_id == nil then nil else p106.tooltip_id
	}, t_55)
end

function t_55:encode() --[[ line: 12900 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1888 = 0
	
	if self.tooltip_id ~= nil then
		local var1889 = self.tooltip_id:encode()
		local var1890, var1891 = protoModule.writeTag(buff, var1888, 1, protoModule.wireTypes.lengthDelimited)
		var1890, var1891 = protoModule.writeBuffer(var1890, var1891, var1889, buffer.len(var1889))
		buff = var1890
		var1888 = var1891
	end
	local buff_1 = buffer.create(var1888)
	buffer.copy(buff_1, 0, buff, 0, var1888)
	
	return buff_1
end

function t_55.decode(p107) --[[ line: 12915 ]]
	-- upvalues: t_55 (ref), protoModule (ref), propTypesModule (ref)
	local var1893 = t_55.new()
	local var1894 = 0
	while var1894 < buffer.len(p107) do
		local _ = nil
		local var1895 = nil
		local var1896, var1897, var1898 = protoModule.readTag(p107, var1894)
		local var1899 = var1896
		var1895 = var1897
		var1894 = var1898
		
		if var1895 == protoModule.wireTypes.varint then
			local _ = nil
			local var1900, var1901 = protoModule.readVarInt(p107, var1894)
			local _ = var1900
			var1894 = var1901
			continue
		end
		if var1895 == protoModule.wireTypes.lengthDelimited then
			if var1899 == 1 then
				local _ = nil
				local var1902, var1903 = protoModule.readBuffer(p107, var1894)
				var1894 = var1903
				var1893.tooltip_id = propTypesModule.StringProp.decode(var1902)
			else
				local _ = nil
				local var1904, var1905 = protoModule.readVarInt(p107, var1894)
				var1894 = var1905 + var1904
			end
		elseif var1895 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1906, var1907 = protoModule.readFixed32(p107, var1894)
			local _ = var1906
			var1894 = var1907
		elseif var1895 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1908, var1909 = protoModule.readFixed64(p107, var1894)
			local _ = var1908
			var1894 = var1909
		else
			error("Unsupported wire type: " .. var1895)
		end
	end
	return var1893
end

function t_55:jsonEncode() --[[ line: 12958 ]]
	local t = {}
	
	if self.tooltip_id ~= nil then
		t.tooltipId = self.tooltip_id:jsonEncode()
	end
	return t
end

function t_55:jsonDecode() --[[ line: 12968 ]]
	-- upvalues: t_55 (ref), propTypesModule (ref)
	local var1911 = t_55.new()
	
	if self.tooltip_id ~= nil then
		var1911.tooltip_id = propTypesModule.StringProp.jsonDecode(self.tooltip_id)
	end
	if self.tooltipId ~= nil then
		var1911.tooltip_id = propTypesModule.StringProp.jsonDecode(self.tooltipId)
	end
	return var1911
end

t_55.descriptor = {
	name = "CloseMarketplaceCategoryTooltip_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.CloseMarketplaceCategoryTooltip_Params = t_55
typeRegistryModule.default:register(t.CloseMarketplaceCategoryTooltip_Params)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p108) --[[ line: 12998 ]]
	-- upvalues: t (ref), t_56 (ref)
	return setmetatable({
		action_type = if p108 == nil or p108.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p108.action_type,
		action_params = if p108 == nil or p108.action_params == nil then nil else p108.action_params
	}, t_56)
end

function t_56:encode() --[[ line: 13007 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1913 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1914, var1915 = protoModule.writeTag(buff, var1913, 1, protoModule.wireTypes.varint)
		var1914, var1915 = protoModule.writeVarInt(var1914, var1915, t.ActionType.toNumber(self.action_type))
		buff = var1914
		var1913 = var1915
	end
	if self.action_params ~= nil then
		local var1916 = self.action_params:encode()
		local var1917, var1918 = protoModule.writeTag(buff, var1913, 2, protoModule.wireTypes.lengthDelimited)
		var1917, var1918 = protoModule.writeBuffer(var1917, var1918, var1916, buffer.len(var1916))
		buff = var1917
		var1913 = var1918
	end
	local buff_1 = buffer.create(var1913)
	buffer.copy(buff_1, 0, buff, 0, var1913)
	
	return buff_1
end

function t_56.decode(p109) --[[ line: 13033 ]]
	-- upvalues: t_56 (ref), protoModule (ref), t (ref)
	local var1920 = t_56.new()
	local var1921 = 0
	while var1921 < buffer.len(p109) do
		local _ = nil
		local var1922 = nil
		local var1923, var1924, var1925 = protoModule.readTag(p109, var1921)
		local var1926 = var1923
		var1922 = var1924
		var1921 = var1925
		
		if var1922 == protoModule.wireTypes.varint then
			if var1926 == 1 then
				local _ = nil
				local var1927, var1928 = protoModule.readVarIntI32(p109, var1921)
				local var1929 = var1927
				var1921 = var1928
				var1920.action_type = t.ActionType.fromNumber(var1929) or var1929
			else
				local _ = nil
				local var1930, var1931 = protoModule.readVarInt(p109, var1921)
				local _ = var1930
				var1921 = var1931
			end
		end
		if var1922 == protoModule.wireTypes.lengthDelimited then
			if var1926 == 2 then
				local _ = nil
				local var1932, var1933 = protoModule.readBuffer(p109, var1921)
				var1921 = var1933
				var1920.action_params = t.ResizeMarketplaceCatalog_Params.decode(var1932)
			else
				local _ = nil
				local var1934, var1935 = protoModule.readVarInt(p109, var1921)
				var1921 = var1935 + var1934
			end
		elseif var1922 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1936, var1937 = protoModule.readFixed32(p109, var1921)
			local _ = var1936
			var1921 = var1937
		elseif var1922 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1938, var1939 = protoModule.readFixed64(p109, var1921)
			local _ = var1938
			var1921 = var1939
		else
			error("Unsupported wire type: " .. var1922)
		end
	end
	return var1920
end

function t_56:jsonEncode() --[[ line: 13081 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_56:jsonDecode() --[[ line: 13103 ]]
	-- upvalues: t_56 (ref), t (ref)
	local var1941 = t_56.new()
	
	if self.action_type ~= nil then
		var1941.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1941.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1941.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1941.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.actionParams)
	end
	return var1941
end

t_56.descriptor = {
	name = "ResizeMarketplaceCatalog",
	fullName = "roblox.apppageplatform.shared.v1beta1.ResizeMarketplaceCatalog"
}
t.ResizeMarketplaceCatalog = t_56
typeRegistryModule.default:register(t.ResizeMarketplaceCatalog)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p110) --[[ line: 13143 ]]
	-- upvalues: t_57 (ref)
	return setmetatable({
		category_id = if p110 == nil or p110.category_id == nil then nil else p110.category_id,
		subcategory_id = if p110 == nil or p110.subcategory_id == nil then nil else p110.subcategory_id,
		screen_size = if p110 == nil or p110.screen_size == nil then nil else p110.screen_size
	}, t_57)
end

function t_57:encode() --[[ line: 13153 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1943 = 0
	
	if self.category_id ~= nil then
		local var1944 = self.category_id:encode()
		local var1945, var1946 = protoModule.writeTag(buff, var1943, 1, protoModule.wireTypes.lengthDelimited)
		var1945, var1946 = protoModule.writeBuffer(var1945, var1946, var1944, buffer.len(var1944))
		buff = var1945
		var1943 = var1946
	end
	if self.subcategory_id ~= nil then
		local var1947 = self.subcategory_id:encode()
		local var1948, var1949 = protoModule.writeTag(buff, var1943, 2, protoModule.wireTypes.lengthDelimited)
		var1948, var1949 = protoModule.writeBuffer(var1948, var1949, var1947, buffer.len(var1947))
		buff = var1948
		var1943 = var1949
	end
	if self.screen_size ~= nil then
		local var1950 = self.screen_size:encode()
		local var1951, var1952 = protoModule.writeTag(buff, var1943, 3, protoModule.wireTypes.lengthDelimited)
		var1951, var1952 = protoModule.writeBuffer(var1951, var1952, var1950, buffer.len(var1950))
		buff = var1951
		var1943 = var1952
	end
	local buff_1 = buffer.create(var1943)
	buffer.copy(buff_1, 0, buff, 0, var1943)
	
	return buff_1
end

function t_57.decode(p111) --[[ line: 13180 ]]
	-- upvalues: t_57 (ref), protoModule (ref), propTypesModule (ref)
	local var1954 = t_57.new()
	local var1955 = 0
	while var1955 < buffer.len(p111) do
		local _ = nil
		local var1956 = nil
		local var1957, var1958, var1959 = protoModule.readTag(p111, var1955)
		local var1960 = var1957
		var1956 = var1958
		var1955 = var1959
		
		if var1956 == protoModule.wireTypes.varint then
			local _ = nil
			local var1961, var1962 = protoModule.readVarInt(p111, var1955)
			local _ = var1961
			var1955 = var1962
			continue
		end
		if var1956 == protoModule.wireTypes.lengthDelimited then
			if var1960 == 1 then
				local _ = nil
				local var1963, var1964 = protoModule.readBuffer(p111, var1955)
				var1955 = var1964
				var1954.category_id = propTypesModule.StringProp.decode(var1963)
			elseif var1960 == 2 then
				local _ = nil
				local var1965, var1966 = protoModule.readBuffer(p111, var1955)
				var1955 = var1966
				var1954.subcategory_id = propTypesModule.StringProp.decode(var1965)
			elseif var1960 == 3 then
				local _ = nil
				local var1967, var1968 = protoModule.readBuffer(p111, var1955)
				var1955 = var1968
				var1954.screen_size = propTypesModule.StringProp.decode(var1967)
			else
				local _ = nil
				local var1969, var1970 = protoModule.readVarInt(p111, var1955)
				var1955 = var1970 + var1969
			end
		elseif var1956 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1971, var1972 = protoModule.readFixed32(p111, var1955)
			local _ = var1971
			var1955 = var1972
		elseif var1956 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1973, var1974 = protoModule.readFixed64(p111, var1955)
			local _ = var1973
			var1955 = var1974
		else
			error("Unsupported wire type: " .. var1956)
		end
	end
	return var1954
end

function t_57:jsonEncode() --[[ line: 13233 ]]
	local t = {}
	
	if self.category_id ~= nil then
		t.categoryId = self.category_id:jsonEncode()
	end
	if self.subcategory_id ~= nil then
		t.subcategoryId = self.subcategory_id:jsonEncode()
	end
	if self.screen_size ~= nil then
		t.screenSize = self.screen_size:jsonEncode()
	end
	return t
end

function t_57:jsonDecode() --[[ line: 13251 ]]
	-- upvalues: t_57 (ref), propTypesModule (ref)
	local var1976 = t_57.new()
	
	if self.category_id ~= nil then
		var1976.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var1976.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	if self.subcategory_id ~= nil then
		var1976.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var1976.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	if self.screen_size ~= nil then
		var1976.screen_size = propTypesModule.StringProp.jsonDecode(self.screen_size)
	end
	if self.screenSize ~= nil then
		var1976.screen_size = propTypesModule.StringProp.jsonDecode(self.screenSize)
	end
	return var1976
end

t_57.descriptor = {
	name = "ResizeMarketplaceCatalog_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ResizeMarketplaceCatalog_Params = t_57
typeRegistryModule.default:register(t.ResizeMarketplaceCatalog_Params)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p112) --[[ line: 13299 ]]
	-- upvalues: t (ref), t_58 (ref)
	return setmetatable({
		action_type = if p112 == nil or p112.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p112.action_type,
		action_params = if p112 == nil or p112.action_params == nil then nil else p112.action_params
	}, t_58)
end

function t_58:encode() --[[ line: 13310 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1978 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1979, var1980 = protoModule.writeTag(buff, var1978, 1, protoModule.wireTypes.varint)
		var1979, var1980 = protoModule.writeVarInt(var1979, var1980, t.ActionType.toNumber(self.action_type))
		buff = var1979
		var1978 = var1980
	end
	if self.action_params ~= nil then
		local var1981 = self.action_params:encode()
		local var1982, var1983 = protoModule.writeTag(buff, var1978, 2, protoModule.wireTypes.lengthDelimited)
		var1982, var1983 = protoModule.writeBuffer(var1982, var1983, var1981, buffer.len(var1981))
		buff = var1982
		var1978 = var1983
	end
	local buff_1 = buffer.create(var1978)
	buffer.copy(buff_1, 0, buff, 0, var1978)
	
	return buff_1
end

function t_58.decode(p113) --[[ line: 13336 ]]
	-- upvalues: t_58 (ref), protoModule (ref), t (ref)
	local var1985 = t_58.new()
	local var1986 = 0
	while var1986 < buffer.len(p113) do
		local _ = nil
		local var1987 = nil
		local var1988, var1989, var1990 = protoModule.readTag(p113, var1986)
		local var1991 = var1988
		var1987 = var1989
		var1986 = var1990
		
		if var1987 == protoModule.wireTypes.varint then
			if var1991 == 1 then
				local _ = nil
				local var1992, var1993 = protoModule.readVarIntI32(p113, var1986)
				local var1994 = var1992
				var1986 = var1993
				var1985.action_type = t.ActionType.fromNumber(var1994) or var1994
			else
				local _ = nil
				local var1995, var1996 = protoModule.readVarInt(p113, var1986)
				local _ = var1995
				var1986 = var1996
			end
		end
		if var1987 == protoModule.wireTypes.lengthDelimited then
			if var1991 == 2 then
				local _ = nil
				local var1997, var1998 = protoModule.readBuffer(p113, var1986)
				var1986 = var1998
				var1985.action_params = t.OpenChartsSortDetailAction_Params.decode(var1997)
			else
				local _ = nil
				local var1999, var2000 = protoModule.readVarInt(p113, var1986)
				var1986 = var2000 + var1999
			end
		elseif var1987 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2001, var2002 = protoModule.readFixed32(p113, var1986)
			local _ = var2001
			var1986 = var2002
		elseif var1987 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2003, var2004 = protoModule.readFixed64(p113, var1986)
			local _ = var2003
			var1986 = var2004
		else
			error("Unsupported wire type: " .. var1987)
		end
	end
	return var1985
end

function t_58:jsonEncode() --[[ line: 13384 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_58:jsonDecode() --[[ line: 13406 ]]
	-- upvalues: t_58 (ref), t (ref)
	local var2006 = t_58.new()
	
	if self.action_type ~= nil then
		var2006.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2006.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2006.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2006.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var2006
end

t_58.descriptor = {
	name = "OpenChartsSortDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenChartsSortDetailAction"
}
t.OpenChartsSortDetailAction = t_58
typeRegistryModule.default:register(t.OpenChartsSortDetailAction)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p114) --[[ line: 13446 ]]
	-- upvalues: t_59 (ref)
	return setmetatable({
		sort_id = if p114 == nil or p114.sort_id == nil then nil else p114.sort_id,
		secondary_sort_id = if p114 == nil or p114.secondary_sort_id == nil then nil else p114.secondary_sort_id
	}, t_59)
end

function t_59:encode() --[[ line: 13455 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2008 = 0
	
	if self.sort_id ~= nil then
		local var2009 = self.sort_id:encode()
		local var2010, var2011 = protoModule.writeTag(buff, var2008, 1, protoModule.wireTypes.lengthDelimited)
		var2010, var2011 = protoModule.writeBuffer(var2010, var2011, var2009, buffer.len(var2009))
		buff = var2010
		var2008 = var2011
	end
	if self.secondary_sort_id ~= nil then
		local var2012 = self.secondary_sort_id:encode()
		local var2013, var2014 = protoModule.writeTag(buff, var2008, 2, protoModule.wireTypes.lengthDelimited)
		var2013, var2014 = protoModule.writeBuffer(var2013, var2014, var2012, buffer.len(var2012))
		buff = var2013
		var2008 = var2014
	end
	local buff_1 = buffer.create(var2008)
	buffer.copy(buff_1, 0, buff, 0, var2008)
	
	return buff_1
end

function t_59.decode(p115) --[[ line: 13476 ]]
	-- upvalues: t_59 (ref), protoModule (ref), propTypesModule (ref)
	local var2016 = t_59.new()
	local var2017 = 0
	while var2017 < buffer.len(p115) do
		local _ = nil
		local var2018 = nil
		local var2019, var2020, var2021 = protoModule.readTag(p115, var2017)
		local var2022 = var2019
		var2018 = var2020
		var2017 = var2021
		
		if var2018 == protoModule.wireTypes.varint then
			local _ = nil
			local var2023, var2024 = protoModule.readVarInt(p115, var2017)
			local _ = var2023
			var2017 = var2024
			continue
		end
		if var2018 == protoModule.wireTypes.lengthDelimited then
			if var2022 == 1 then
				local _ = nil
				local var2025, var2026 = protoModule.readBuffer(p115, var2017)
				var2017 = var2026
				var2016.sort_id = propTypesModule.StringProp.decode(var2025)
			elseif var2022 == 2 then
				local _ = nil
				local var2027, var2028 = protoModule.readBuffer(p115, var2017)
				var2017 = var2028
				var2016.secondary_sort_id = propTypesModule.Int32Prop.decode(var2027)
			else
				local _ = nil
				local var2029, var2030 = protoModule.readVarInt(p115, var2017)
				var2017 = var2030 + var2029
			end
		elseif var2018 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2031, var2032 = protoModule.readFixed32(p115, var2017)
			local _ = var2031
			var2017 = var2032
		elseif var2018 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2033, var2034 = protoModule.readFixed64(p115, var2017)
			local _ = var2033
			var2017 = var2034
		else
			error("Unsupported wire type: " .. var2018)
		end
	end
	return var2016
end

function t_59:jsonEncode() --[[ line: 13524 ]]
	local t = {}
	
	if self.sort_id ~= nil then
		t.sortId = self.sort_id:jsonEncode()
	end
	if self.secondary_sort_id ~= nil then
		t.secondarySortId = self.secondary_sort_id:jsonEncode()
	end
	return t
end

function t_59:jsonDecode() --[[ line: 13538 ]]
	-- upvalues: t_59 (ref), propTypesModule (ref)
	local var2036 = t_59.new()
	
	if self.sort_id ~= nil then
		var2036.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var2036.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.secondary_sort_id ~= nil then
		var2036.secondary_sort_id = propTypesModule.Int32Prop.jsonDecode(self.secondary_sort_id)
	end
	if self.secondarySortId ~= nil then
		var2036.secondary_sort_id = propTypesModule.Int32Prop.jsonDecode(self.secondarySortId)
	end
	return var2036
end

t_59.descriptor = {
	name = "OpenChartsSortDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenChartsSortDetailAction_Params = t_59
typeRegistryModule.default:register(t.OpenChartsSortDetailAction_Params)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p116) --[[ line: 13578 ]]
	-- upvalues: t (ref), t_60 (ref)
	return setmetatable({
		action_type = if p116 == nil or p116.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p116.action_type,
		action_params = if p116 == nil or p116.action_params == nil then nil else p116.action_params
	}, t_60)
end

function t_60:encode() --[[ line: 13587 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2038 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2039, var2040 = protoModule.writeTag(buff, var2038, 1, protoModule.wireTypes.varint)
		var2039, var2040 = protoModule.writeVarInt(var2039, var2040, t.ActionType.toNumber(self.action_type))
		buff = var2039
		var2038 = var2040
	end
	if self.action_params ~= nil then
		local var2041 = self.action_params:encode()
		local var2042, var2043 = protoModule.writeTag(buff, var2038, 2, protoModule.wireTypes.lengthDelimited)
		var2042, var2043 = protoModule.writeBuffer(var2042, var2043, var2041, buffer.len(var2041))
		buff = var2042
		var2038 = var2043
	end
	local buff_1 = buffer.create(var2038)
	buffer.copy(buff_1, 0, buff, 0, var2038)
	
	return buff_1
end

function t_60.decode(p117) --[[ line: 13613 ]]
	-- upvalues: t_60 (ref), protoModule (ref), t (ref)
	local var2045 = t_60.new()
	local var2046 = 0
	while var2046 < buffer.len(p117) do
		local _ = nil
		local var2047 = nil
		local var2048, var2049, var2050 = protoModule.readTag(p117, var2046)
		local var2051 = var2048
		var2047 = var2049
		var2046 = var2050
		
		if var2047 == protoModule.wireTypes.varint then
			if var2051 == 1 then
				local _ = nil
				local var2052, var2053 = protoModule.readVarIntI32(p117, var2046)
				local var2054 = var2052
				var2046 = var2053
				var2045.action_type = t.ActionType.fromNumber(var2054) or var2054
			else
				local _ = nil
				local var2055, var2056 = protoModule.readVarInt(p117, var2046)
				local _ = var2055
				var2046 = var2056
			end
		end
		if var2047 == protoModule.wireTypes.lengthDelimited then
			if var2051 == 2 then
				local _ = nil
				local var2057, var2058 = protoModule.readBuffer(p117, var2046)
				var2046 = var2058
				var2045.action_params = t.OpenSongDetailAction_Params.decode(var2057)
			else
				local _ = nil
				local var2059, var2060 = protoModule.readVarInt(p117, var2046)
				var2046 = var2060 + var2059
			end
		elseif var2047 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2061, var2062 = protoModule.readFixed32(p117, var2046)
			local _ = var2061
			var2046 = var2062
		elseif var2047 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2063, var2064 = protoModule.readFixed64(p117, var2046)
			local _ = var2063
			var2046 = var2064
		else
			error("Unsupported wire type: " .. var2047)
		end
	end
	return var2045
end

function t_60:jsonEncode() --[[ line: 13661 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_60:jsonDecode() --[[ line: 13683 ]]
	-- upvalues: t_60 (ref), t (ref)
	local var2066 = t_60.new()
	
	if self.action_type ~= nil then
		var2066.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2066.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2066.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2066.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var2066
end

t_60.descriptor = {
	name = "OpenSongDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSongDetailAction"
}
t.OpenSongDetailAction = t_60
typeRegistryModule.default:register(t.OpenSongDetailAction)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p118) --[[ line: 13723 ]]
	-- upvalues: t_61 (ref)
	return setmetatable({
		song_id = if p118 == nil or p118.song_id == nil then nil else p118.song_id
	}, t_61)
end

function t_61:encode() --[[ line: 13731 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2068 = 0
	
	if self.song_id ~= nil then
		local var2069 = self.song_id:encode()
		local var2070, var2071 = protoModule.writeTag(buff, var2068, 1, protoModule.wireTypes.lengthDelimited)
		var2070, var2071 = protoModule.writeBuffer(var2070, var2071, var2069, buffer.len(var2069))
		buff = var2070
		var2068 = var2071
	end
	local buff_1 = buffer.create(var2068)
	buffer.copy(buff_1, 0, buff, 0, var2068)
	
	return buff_1
end

function t_61.decode(p119) --[[ line: 13746 ]]
	-- upvalues: t_61 (ref), protoModule (ref), propTypesModule (ref)
	local var2073 = t_61.new()
	local var2074 = 0
	while var2074 < buffer.len(p119) do
		local _ = nil
		local var2075 = nil
		local var2076, var2077, var2078 = protoModule.readTag(p119, var2074)
		local var2079 = var2076
		var2075 = var2077
		var2074 = var2078
		
		if var2075 == protoModule.wireTypes.varint then
			local _ = nil
			local var2080, var2081 = protoModule.readVarInt(p119, var2074)
			local _ = var2080
			var2074 = var2081
			continue
		end
		if var2075 == protoModule.wireTypes.lengthDelimited then
			if var2079 == 1 then
				local _ = nil
				local var2082, var2083 = protoModule.readBuffer(p119, var2074)
				var2074 = var2083
				var2073.song_id = propTypesModule.StringProp.decode(var2082)
			else
				local _ = nil
				local var2084, var2085 = protoModule.readVarInt(p119, var2074)
				var2074 = var2085 + var2084
			end
		elseif var2075 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2086, var2087 = protoModule.readFixed32(p119, var2074)
			local _ = var2086
			var2074 = var2087
		elseif var2075 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2088, var2089 = protoModule.readFixed64(p119, var2074)
			local _ = var2088
			var2074 = var2089
		else
			error("Unsupported wire type: " .. var2075)
		end
	end
	return var2073
end

function t_61:jsonEncode() --[[ line: 13789 ]]
	local t = {}
	
	if self.song_id ~= nil then
		t.songId = self.song_id:jsonEncode()
	end
	return t
end

function t_61:jsonDecode() --[[ line: 13799 ]]
	-- upvalues: t_61 (ref), propTypesModule (ref)
	local var2091 = t_61.new()
	
	if self.song_id ~= nil then
		var2091.song_id = propTypesModule.StringProp.jsonDecode(self.song_id)
	end
	if self.songId ~= nil then
		var2091.song_id = propTypesModule.StringProp.jsonDecode(self.songId)
	end
	return var2091
end

t_61.descriptor = {
	name = "OpenSongDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSongDetailAction_Params = t_61
typeRegistryModule.default:register(t.OpenSongDetailAction_Params)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p120) --[[ line: 13827 ]]
	-- upvalues: t (ref), t_62 (ref)
	return setmetatable({
		action_type = if p120 == nil or p120.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p120.action_type,
		action_params = if p120 == nil or p120.action_params == nil then nil else p120.action_params
	}, t_62)
end

function t_62:encode() --[[ line: 13838 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2093 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2094, var2095 = protoModule.writeTag(buff, var2093, 1, protoModule.wireTypes.varint)
		var2094, var2095 = protoModule.writeVarInt(var2094, var2095, t.ActionType.toNumber(self.action_type))
		buff = var2094
		var2093 = var2095
	end
	if self.action_params ~= nil then
		local var2096 = self.action_params:encode()
		local var2097, var2098 = protoModule.writeTag(buff, var2093, 2, protoModule.wireTypes.lengthDelimited)
		var2097, var2098 = protoModule.writeBuffer(var2097, var2098, var2096, buffer.len(var2096))
		buff = var2097
		var2093 = var2098
	end
	local buff_1 = buffer.create(var2093)
	buffer.copy(buff_1, 0, buff, 0, var2093)
	
	return buff_1
end

function t_62.decode(p121) --[[ line: 13864 ]]
	-- upvalues: t_62 (ref), protoModule (ref), t (ref)
	local var2100 = t_62.new()
	local var2101 = 0
	while var2101 < buffer.len(p121) do
		local _ = nil
		local var2102 = nil
		local var2103, var2104, var2105 = protoModule.readTag(p121, var2101)
		local var2106 = var2103
		var2102 = var2104
		var2101 = var2105
		
		if var2102 == protoModule.wireTypes.varint then
			if var2106 == 1 then
				local _ = nil
				local var2107, var2108 = protoModule.readVarIntI32(p121, var2101)
				local var2109 = var2107
				var2101 = var2108
				var2100.action_type = t.ActionType.fromNumber(var2109) or var2109
			else
				local _ = nil
				local var2110, var2111 = protoModule.readVarInt(p121, var2101)
				local _ = var2110
				var2101 = var2111
			end
		end
		if var2102 == protoModule.wireTypes.lengthDelimited then
			if var2106 == 2 then
				local _ = nil
				local var2112, var2113 = protoModule.readBuffer(p121, var2101)
				var2101 = var2113
				var2100.action_params = t.OpenMarketplaceCatalogFilters_Params.decode(var2112)
			else
				local _ = nil
				local var2114, var2115 = protoModule.readVarInt(p121, var2101)
				var2101 = var2115 + var2114
			end
		elseif var2102 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2116, var2117 = protoModule.readFixed32(p121, var2101)
			local _ = var2116
			var2101 = var2117
		elseif var2102 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2118, var2119 = protoModule.readFixed64(p121, var2101)
			local _ = var2118
			var2101 = var2119
		else
			error("Unsupported wire type: " .. var2102)
		end
	end
	return var2100
end

function t_62:jsonEncode() --[[ line: 13912 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_62:jsonDecode() --[[ line: 13934 ]]
	-- upvalues: t_62 (ref), t (ref)
	local var2121 = t_62.new()
	
	if self.action_type ~= nil then
		var2121.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2121.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2121.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2121.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.actionParams)
	end
	return var2121
end

t_62.descriptor = {
	name = "OpenMarketplaceCatalogFilters",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogFilters"
}
t.OpenMarketplaceCatalogFilters = t_62
typeRegistryModule.default:register(t.OpenMarketplaceCatalogFilters)
local t_63 = {}
t_63.__index = t_63

function t_63.new(_) --[[ line: 13974 ]]
	-- upvalues: t_63 (ref)
	return setmetatable({}, t_63)
end

function t_63.encode(_) --[[ line: 13980 ]]
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_63.decode(p122) --[[ line: 13989 ]]
	-- upvalues: t_63 (ref), protoModule (ref)
	local var2123 = t_63.new()
	local var2124 = 0
	while var2124 < buffer.len(p122) do
		local var2125 = nil
		local _ = nil
		local var2126, var2127, var2128 = protoModule.readTag(p122, var2124)
		var2125 = var2126
		local var2129 = var2127
		var2124 = var2128
		
		if var2129 == protoModule.wireTypes.varint then
			local _ = nil
			local var2130, var2131 = protoModule.readVarInt(p122, var2124)
			local _ = var2130
			var2124 = var2131
		elseif var2129 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2132, var2133 = protoModule.readVarInt(p122, var2124)
			var2124 = var2133 + var2132
		elseif var2129 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2134, var2135 = protoModule.readFixed32(p122, var2124)
			local _ = var2134
			var2124 = var2135
		elseif var2129 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2136, var2137 = protoModule.readFixed64(p122, var2124)
			local _ = var2136
			var2124 = var2137
		else
			error("Unsupported wire type: " .. var2129)
		end
	end
	return var2123
end

function t_63.jsonEncode(_) --[[ line: 14027 ]]
	return {}
end

function t_63.jsonDecode(_) --[[ line: 14033 ]]
	-- upvalues: t_63 (ref)
	return t_63.new()
end

t_63.descriptor = {
	name = "OpenMarketplaceCatalogFilters_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceCatalogFilters_Params = t_63
typeRegistryModule.default:register(t.OpenMarketplaceCatalogFilters_Params)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p123) --[[ line: 14055 ]]
	-- upvalues: t (ref), t_64 (ref)
	return setmetatable({
		action_type = if p123 == nil or p123.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p123.action_type,
		action_params = if p123 == nil or p123.action_params == nil then nil else p123.action_params
	}, t_64)
end

function t_64:encode() --[[ line: 14064 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2139 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2140, var2141 = protoModule.writeTag(buff, var2139, 1, protoModule.wireTypes.varint)
		var2140, var2141 = protoModule.writeVarInt(var2140, var2141, t.ActionType.toNumber(self.action_type))
		buff = var2140
		var2139 = var2141
	end
	if self.action_params ~= nil then
		local var2142 = self.action_params:encode()
		local var2143, var2144 = protoModule.writeTag(buff, var2139, 2, protoModule.wireTypes.lengthDelimited)
		var2143, var2144 = protoModule.writeBuffer(var2143, var2144, var2142, buffer.len(var2142))
		buff = var2143
		var2139 = var2144
	end
	local buff_1 = buffer.create(var2139)
	buffer.copy(buff_1, 0, buff, 0, var2139)
	
	return buff_1
end

function t_64.decode(p124) --[[ line: 14090 ]]
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var2146 = t_64.new()
	local var2147 = 0
	while var2147 < buffer.len(p124) do
		local _ = nil
		local var2148 = nil
		local var2149, var2150, var2151 = protoModule.readTag(p124, var2147)
		local var2152 = var2149
		var2148 = var2150
		var2147 = var2151
		
		if var2148 == protoModule.wireTypes.varint then
			if var2152 == 1 then
				local _ = nil
				local var2153, var2154 = protoModule.readVarIntI32(p124, var2147)
				local var2155 = var2153
				var2147 = var2154
				var2146.action_type = t.ActionType.fromNumber(var2155) or var2155
			else
				local _ = nil
				local var2156, var2157 = protoModule.readVarInt(p124, var2147)
				local _ = var2156
				var2147 = var2157
			end
		end
		if var2148 == protoModule.wireTypes.lengthDelimited then
			if var2152 == 2 then
				local _ = nil
				local var2158, var2159 = protoModule.readBuffer(p124, var2147)
				var2147 = var2159
				var2146.action_params = t.RefreshFromApiAction_Params.decode(var2158)
			else
				local _ = nil
				local var2160, var2161 = protoModule.readVarInt(p124, var2147)
				var2147 = var2161 + var2160
			end
		elseif var2148 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2162, var2163 = protoModule.readFixed32(p124, var2147)
			local _ = var2162
			var2147 = var2163
		elseif var2148 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2164, var2165 = protoModule.readFixed64(p124, var2147)
			local _ = var2164
			var2147 = var2165
		else
			error("Unsupported wire type: " .. var2148)
		end
	end
	return var2146
end

function t_64:jsonEncode() --[[ line: 14138 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_64:jsonDecode() --[[ line: 14160 ]]
	-- upvalues: t_64 (ref), t (ref)
	local var2167 = t_64.new()
	
	if self.action_type ~= nil then
		var2167.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2167.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2167.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2167.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var2167
end

t_64.descriptor = {
	name = "RefreshFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshFromApiAction"
}
t.RefreshFromApiAction = t_64
typeRegistryModule.default:register(t.RefreshFromApiAction)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p125) --[[ line: 14200 ]]
	-- upvalues: t_65 (ref)
	return setmetatable({
		surface_key = if p125 == nil or p125.surface_key == nil then nil else p125.surface_key,
		config_key = if p125 == nil or p125.config_key == nil then nil else p125.config_key
	}, t_65)
end

function t_65:encode() --[[ line: 14209 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2169 = 0
	
	if self.surface_key ~= nil then
		local var2170 = self.surface_key:encode()
		local var2171, var2172 = protoModule.writeTag(buff, var2169, 1, protoModule.wireTypes.lengthDelimited)
		var2171, var2172 = protoModule.writeBuffer(var2171, var2172, var2170, buffer.len(var2170))
		buff = var2171
		var2169 = var2172
	end
	if self.config_key ~= nil then
		local var2173 = self.config_key:encode()
		local var2174, var2175 = protoModule.writeTag(buff, var2169, 2, protoModule.wireTypes.lengthDelimited)
		var2174, var2175 = protoModule.writeBuffer(var2174, var2175, var2173, buffer.len(var2173))
		buff = var2174
		var2169 = var2175
	end
	local buff_1 = buffer.create(var2169)
	buffer.copy(buff_1, 0, buff, 0, var2169)
	
	return buff_1
end

function t_65.decode(p126) --[[ line: 14230 ]]
	-- upvalues: t_65 (ref), protoModule (ref), propTypesModule (ref)
	local var2177 = t_65.new()
	local var2178 = 0
	while var2178 < buffer.len(p126) do
		local _ = nil
		local var2179 = nil
		local var2180, var2181, var2182 = protoModule.readTag(p126, var2178)
		local var2183 = var2180
		var2179 = var2181
		var2178 = var2182
		
		if var2179 == protoModule.wireTypes.varint then
			local _ = nil
			local var2184, var2185 = protoModule.readVarInt(p126, var2178)
			local _ = var2184
			var2178 = var2185
			continue
		end
		if var2179 == protoModule.wireTypes.lengthDelimited then
			if var2183 == 1 then
				local _ = nil
				local var2186, var2187 = protoModule.readBuffer(p126, var2178)
				var2178 = var2187
				var2177.surface_key = propTypesModule.StringProp.decode(var2186)
			elseif var2183 == 2 then
				local _ = nil
				local var2188, var2189 = protoModule.readBuffer(p126, var2178)
				var2178 = var2189
				var2177.config_key = propTypesModule.StringProp.decode(var2188)
			else
				local _ = nil
				local var2190, var2191 = protoModule.readVarInt(p126, var2178)
				var2178 = var2191 + var2190
			end
		elseif var2179 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2192, var2193 = protoModule.readFixed32(p126, var2178)
			local _ = var2192
			var2178 = var2193
		elseif var2179 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2194, var2195 = protoModule.readFixed64(p126, var2178)
			local _ = var2194
			var2178 = var2195
		else
			error("Unsupported wire type: " .. var2179)
		end
	end
	return var2177
end

function t_65:jsonEncode() --[[ line: 14278 ]]
	local t = {}
	
	if self.surface_key ~= nil then
		t.surfaceKey = self.surface_key:jsonEncode()
	end
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	return t
end

function t_65:jsonDecode() --[[ line: 14292 ]]
	-- upvalues: t_65 (ref), propTypesModule (ref)
	local var2197 = t_65.new()
	
	if self.surface_key ~= nil then
		var2197.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var2197.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		var2197.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var2197.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return var2197
end

t_65.descriptor = {
	name = "RefreshFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshFromApiAction_Params = t_65
typeRegistryModule.default:register(t.RefreshFromApiAction_Params)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p127) --[[ line: 14329 ]]
	-- upvalues: t (ref), t_66 (ref)
	return setmetatable({
		action_type = if p127 == nil or p127.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p127.action_type,
		action_params = if p127 == nil or p127.action_params == nil then nil else p127.action_params
	}, t_66)
end

function t_66:encode() --[[ line: 14340 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2199 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2200, var2201 = protoModule.writeTag(buff, var2199, 1, protoModule.wireTypes.varint)
		var2200, var2201 = protoModule.writeVarInt(var2200, var2201, t.ActionType.toNumber(self.action_type))
		buff = var2200
		var2199 = var2201
	end
	if self.action_params ~= nil then
		local var2202 = self.action_params:encode()
		local var2203, var2204 = protoModule.writeTag(buff, var2199, 2, protoModule.wireTypes.lengthDelimited)
		var2203, var2204 = protoModule.writeBuffer(var2203, var2204, var2202, buffer.len(var2202))
		buff = var2203
		var2199 = var2204
	end
	local buff_1 = buffer.create(var2199)
	buffer.copy(buff_1, 0, buff, 0, var2199)
	
	return buff_1
end

function t_66.decode(p128) --[[ line: 14366 ]]
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var2206 = t_66.new()
	local var2207 = 0
	while var2207 < buffer.len(p128) do
		local _ = nil
		local var2208 = nil
		local var2209, var2210, var2211 = protoModule.readTag(p128, var2207)
		local var2212 = var2209
		var2208 = var2210
		var2207 = var2211
		
		if var2208 == protoModule.wireTypes.varint then
			if var2212 == 1 then
				local _ = nil
				local var2213, var2214 = protoModule.readVarIntI32(p128, var2207)
				local var2215 = var2213
				var2207 = var2214
				var2206.action_type = t.ActionType.fromNumber(var2215) or var2215
			else
				local _ = nil
				local var2216, var2217 = protoModule.readVarInt(p128, var2207)
				local _ = var2216
				var2207 = var2217
			end
		end
		if var2208 == protoModule.wireTypes.lengthDelimited then
			if var2212 == 2 then
				local _ = nil
				local var2218, var2219 = protoModule.readBuffer(p128, var2207)
				var2207 = var2219
				var2206.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.decode(var2218)
			else
				local _ = nil
				local var2220, var2221 = protoModule.readVarInt(p128, var2207)
				var2207 = var2221 + var2220
			end
		elseif var2208 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2222, var2223 = protoModule.readFixed32(p128, var2207)
			local _ = var2222
			var2207 = var2223
		elseif var2208 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2224, var2225 = protoModule.readFixed64(p128, var2207)
			local _ = var2224
			var2207 = var2225
		else
			error("Unsupported wire type: " .. var2208)
		end
	end
	return var2206
end

function t_66:jsonEncode() --[[ line: 14414 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_66:jsonDecode() --[[ line: 14436 ]]
	-- upvalues: t_66 (ref), t (ref)
	local var2227 = t_66.new()
	
	if self.action_type ~= nil then
		var2227.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2227.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2227.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2227.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.actionParams)
	end
	return var2227
end

t_66.descriptor = {
	name = "RefreshOmniRecommendationFeedItemAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshOmniRecommendationFeedItemAction"
}
t.RefreshOmniRecommendationFeedItemAction = t_66
typeRegistryModule.default:register(t.RefreshOmniRecommendationFeedItemAction)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p129) --[[ line: 14478 ]]
	-- upvalues: t_67 (ref)
	return setmetatable({
		topic_id = if p129 == nil or p129.topic_id == nil then nil else p129.topic_id,
		selected_option = if p129 == nil or p129.selected_option == nil then nil else p129.selected_option,
		request_intent = if p129 == nil or p129.request_intent == nil then nil else p129.request_intent,
		feed_item_key = if p129 == nil or p129.feed_item_key == nil then nil else p129.feed_item_key
	}, t_67)
end

function t_67:encode() --[[ line: 14489 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2229 = 0
	
	if self.topic_id ~= nil then
		local var2230 = self.topic_id:encode()
		local var2231, var2232 = protoModule.writeTag(buff, var2229, 1, protoModule.wireTypes.lengthDelimited)
		var2231, var2232 = protoModule.writeBuffer(var2231, var2232, var2230, buffer.len(var2230))
		buff = var2231
		var2229 = var2232
	end
	if self.selected_option ~= nil then
		local var2233 = self.selected_option:encode()
		local var2234, var2235 = protoModule.writeTag(buff, var2229, 2, protoModule.wireTypes.lengthDelimited)
		var2234, var2235 = protoModule.writeBuffer(var2234, var2235, var2233, buffer.len(var2233))
		buff = var2234
		var2229 = var2235
	end
	if self.request_intent ~= nil then
		local var2236 = self.request_intent:encode()
		local var2237, var2238 = protoModule.writeTag(buff, var2229, 3, protoModule.wireTypes.lengthDelimited)
		var2237, var2238 = protoModule.writeBuffer(var2237, var2238, var2236, buffer.len(var2236))
		buff = var2237
		var2229 = var2238
	end
	if self.feed_item_key ~= nil then
		local var2239 = self.feed_item_key:encode()
		local var2240, var2241 = protoModule.writeTag(buff, var2229, 4, protoModule.wireTypes.lengthDelimited)
		var2240, var2241 = protoModule.writeBuffer(var2240, var2241, var2239, buffer.len(var2239))
		buff = var2240
		var2229 = var2241
	end
	local buff_1 = buffer.create(var2229)
	buffer.copy(buff_1, 0, buff, 0, var2229)
	
	return buff_1
end

function t_67.decode(p130) --[[ line: 14524 ]]
	-- upvalues: t_67 (ref), protoModule (ref), propTypesModule (ref)
	local var2243 = t_67.new()
	local var2244 = 0
	while var2244 < buffer.len(p130) do
		local _ = nil
		local var2245 = nil
		local var2246, var2247, var2248 = protoModule.readTag(p130, var2244)
		local var2249 = var2246
		var2245 = var2247
		var2244 = var2248
		
		if var2245 == protoModule.wireTypes.varint then
			local _ = nil
			local var2250, var2251 = protoModule.readVarInt(p130, var2244)
			local _ = var2250
			var2244 = var2251
			continue
		end
		if var2245 == protoModule.wireTypes.lengthDelimited then
			if var2249 == 1 then
				local _ = nil
				local var2252, var2253 = protoModule.readBuffer(p130, var2244)
				var2244 = var2253
				var2243.topic_id = propTypesModule.StringProp.decode(var2252)
			elseif var2249 == 2 then
				local _ = nil
				local var2254, var2255 = protoModule.readBuffer(p130, var2244)
				var2244 = var2255
				var2243.selected_option = propTypesModule.StringProp.decode(var2254)
			elseif var2249 == 3 then
				local _ = nil
				local var2256, var2257 = protoModule.readBuffer(p130, var2244)
				var2244 = var2257
				var2243.request_intent = propTypesModule.StringProp.decode(var2256)
			elseif var2249 == 4 then
				local _ = nil
				local var2258, var2259 = protoModule.readBuffer(p130, var2244)
				var2244 = var2259
				var2243.feed_item_key = propTypesModule.StringProp.decode(var2258)
			else
				local _ = nil
				local var2260, var2261 = protoModule.readVarInt(p130, var2244)
				var2244 = var2261 + var2260
			end
		elseif var2245 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2262, var2263 = protoModule.readFixed32(p130, var2244)
			local _ = var2262
			var2244 = var2263
		elseif var2245 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2264, var2265 = protoModule.readFixed64(p130, var2244)
			local _ = var2264
			var2244 = var2265
		else
			error("Unsupported wire type: " .. var2245)
		end
	end
	return var2243
end

function t_67:jsonEncode() --[[ line: 14584 ]]
	local t = {}
	
	if self.topic_id ~= nil then
		t.topicId = self.topic_id:jsonEncode()
	end
	if self.selected_option ~= nil then
		t.selectedOption = self.selected_option:jsonEncode()
	end
	if self.request_intent ~= nil then
		t.requestIntent = self.request_intent:jsonEncode()
	end
	if self.feed_item_key ~= nil then
		t.feedItemKey = self.feed_item_key:jsonEncode()
	end
	return t
end

function t_67:jsonDecode() --[[ line: 14608 ]]
	-- upvalues: t_67 (ref), propTypesModule (ref)
	local var2267 = t_67.new()
	
	if self.topic_id ~= nil then
		var2267.topic_id = propTypesModule.StringProp.jsonDecode(self.topic_id)
	end
	if self.topicId ~= nil then
		var2267.topic_id = propTypesModule.StringProp.jsonDecode(self.topicId)
	end
	if self.selected_option ~= nil then
		var2267.selected_option = propTypesModule.StringProp.jsonDecode(self.selected_option)
	end
	if self.selectedOption ~= nil then
		var2267.selected_option = propTypesModule.StringProp.jsonDecode(self.selectedOption)
	end
	if self.request_intent ~= nil then
		var2267.request_intent = propTypesModule.StringProp.jsonDecode(self.request_intent)
	end
	if self.requestIntent ~= nil then
		var2267.request_intent = propTypesModule.StringProp.jsonDecode(self.requestIntent)
	end
	if self.feed_item_key ~= nil then
		var2267.feed_item_key = propTypesModule.StringProp.jsonDecode(self.feed_item_key)
	end
	if self.feedItemKey ~= nil then
		var2267.feed_item_key = propTypesModule.StringProp.jsonDecode(self.feedItemKey)
	end
	return var2267
end

t_67.descriptor = {
	name = "RefreshOmniRecommendationFeedItemAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshOmniRecommendationFeedItemAction_Params = t_67
typeRegistryModule.default:register(t.RefreshOmniRecommendationFeedItemAction_Params)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p131) --[[ line: 14668 ]]
	-- upvalues: t (ref), t_68 (ref)
	return setmetatable({
		action_type = if p131 == nil or p131.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p131.action_type,
		action_params = if p131 == nil or p131.action_params == nil then nil else p131.action_params
	}, t_68)
end

function t_68:encode() --[[ line: 14677 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2269 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2270, var2271 = protoModule.writeTag(buff, var2269, 1, protoModule.wireTypes.varint)
		var2270, var2271 = protoModule.writeVarInt(var2270, var2271, t.ActionType.toNumber(self.action_type))
		buff = var2270
		var2269 = var2271
	end
	if self.action_params ~= nil then
		local var2272 = self.action_params:encode()
		local var2273, var2274 = protoModule.writeTag(buff, var2269, 2, protoModule.wireTypes.lengthDelimited)
		var2273, var2274 = protoModule.writeBuffer(var2273, var2274, var2272, buffer.len(var2272))
		buff = var2273
		var2269 = var2274
	end
	local buff_1 = buffer.create(var2269)
	buffer.copy(buff_1, 0, buff, 0, var2269)
	
	return buff_1
end

function t_68.decode(p132) --[[ line: 14703 ]]
	-- upvalues: t_68 (ref), protoModule (ref), t (ref)
	local var2276 = t_68.new()
	local var2277 = 0
	while var2277 < buffer.len(p132) do
		local _ = nil
		local var2278 = nil
		local var2279, var2280, var2281 = protoModule.readTag(p132, var2277)
		local var2282 = var2279
		var2278 = var2280
		var2277 = var2281
		
		if var2278 == protoModule.wireTypes.varint then
			if var2282 == 1 then
				local _ = nil
				local var2283, var2284 = protoModule.readVarIntI32(p132, var2277)
				local var2285 = var2283
				var2277 = var2284
				var2276.action_type = t.ActionType.fromNumber(var2285) or var2285
			else
				local _ = nil
				local var2286, var2287 = protoModule.readVarInt(p132, var2277)
				local _ = var2286
				var2277 = var2287
			end
		end
		if var2278 == protoModule.wireTypes.lengthDelimited then
			if var2282 == 2 then
				local _ = nil
				local var2288, var2289 = protoModule.readBuffer(p132, var2277)
				var2277 = var2289
				var2276.action_params = t.RsvpToEventAction_Params.decode(var2288)
			else
				local _ = nil
				local var2290, var2291 = protoModule.readVarInt(p132, var2277)
				var2277 = var2291 + var2290
			end
		elseif var2278 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2292, var2293 = protoModule.readFixed32(p132, var2277)
			local _ = var2292
			var2277 = var2293
		elseif var2278 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2294, var2295 = protoModule.readFixed64(p132, var2277)
			local _ = var2294
			var2277 = var2295
		else
			error("Unsupported wire type: " .. var2278)
		end
	end
	return var2276
end

function t_68:jsonEncode() --[[ line: 14751 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_68:jsonDecode() --[[ line: 14773 ]]
	-- upvalues: t_68 (ref), t (ref)
	local var2297 = t_68.new()
	
	if self.action_type ~= nil then
		var2297.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2297.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2297.action_params = t.RsvpToEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2297.action_params = t.RsvpToEventAction_Params.jsonDecode(self.actionParams)
	end
	return var2297
end

t_68.descriptor = {
	name = "RsvpToEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpToEventAction"
}
t.RsvpToEventAction = t_68
typeRegistryModule.default:register(t.RsvpToEventAction)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p133) --[[ line: 14813 ]]
	-- upvalues: t_69 (ref)
	return setmetatable({
		event_id = if p133 == nil or p133.event_id == nil then nil else p133.event_id,
		user_rsvp = if p133 == nil or p133.user_rsvp == nil then nil else p133.user_rsvp,
		notifications_modal_identifier = if p133 == nil or p133.notifications_modal_identifier == nil then nil else p133.notifications_modal_identifier
	}, t_69)
end

function t_69:encode() --[[ line: 14823 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2299 = 0
	
	if self.event_id ~= nil then
		local var2300 = self.event_id:encode()
		local var2301, var2302 = protoModule.writeTag(buff, var2299, 1, protoModule.wireTypes.lengthDelimited)
		var2301, var2302 = protoModule.writeBuffer(var2301, var2302, var2300, buffer.len(var2300))
		buff = var2301
		var2299 = var2302
	end
	if self.user_rsvp ~= nil then
		local var2303 = self.user_rsvp:encode()
		local var2304, var2305 = protoModule.writeTag(buff, var2299, 2, protoModule.wireTypes.lengthDelimited)
		var2304, var2305 = protoModule.writeBuffer(var2304, var2305, var2303, buffer.len(var2303))
		buff = var2304
		var2299 = var2305
	end
	if self.notifications_modal_identifier ~= nil then
		local var2306 = self.notifications_modal_identifier:encode()
		local var2307, var2308 = protoModule.writeTag(buff, var2299, 3, protoModule.wireTypes.lengthDelimited)
		var2307, var2308 = protoModule.writeBuffer(var2307, var2308, var2306, buffer.len(var2306))
		buff = var2307
		var2299 = var2308
	end
	local buff_1 = buffer.create(var2299)
	buffer.copy(buff_1, 0, buff, 0, var2299)
	
	return buff_1
end

function t_69.decode(p134) --[[ line: 14850 ]]
	-- upvalues: t_69 (ref), protoModule (ref), propTypesModule (ref)
	local var2310 = t_69.new()
	local var2311 = 0
	while var2311 < buffer.len(p134) do
		local _ = nil
		local var2312 = nil
		local var2313, var2314, var2315 = protoModule.readTag(p134, var2311)
		local var2316 = var2313
		var2312 = var2314
		var2311 = var2315
		
		if var2312 == protoModule.wireTypes.varint then
			local _ = nil
			local var2317, var2318 = protoModule.readVarInt(p134, var2311)
			local _ = var2317
			var2311 = var2318
			continue
		end
		if var2312 == protoModule.wireTypes.lengthDelimited then
			if var2316 == 1 then
				local _ = nil
				local var2319, var2320 = protoModule.readBuffer(p134, var2311)
				var2311 = var2320
				var2310.event_id = propTypesModule.StringProp.decode(var2319)
			elseif var2316 == 2 then
				local _ = nil
				local var2321, var2322 = protoModule.readBuffer(p134, var2311)
				var2311 = var2322
				var2310.user_rsvp = propTypesModule.BoolProp.decode(var2321)
			elseif var2316 == 3 then
				local _ = nil
				local var2323, var2324 = protoModule.readBuffer(p134, var2311)
				var2311 = var2324
				var2310.notifications_modal_identifier = propTypesModule.StringProp.decode(var2323)
			else
				local _ = nil
				local var2325, var2326 = protoModule.readVarInt(p134, var2311)
				var2311 = var2326 + var2325
			end
		elseif var2312 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2327, var2328 = protoModule.readFixed32(p134, var2311)
			local _ = var2327
			var2311 = var2328
		elseif var2312 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2329, var2330 = protoModule.readFixed64(p134, var2311)
			local _ = var2329
			var2311 = var2330
		else
			error("Unsupported wire type: " .. var2312)
		end
	end
	return var2310
end

function t_69:jsonEncode() --[[ line: 14904 ]]
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	if self.user_rsvp ~= nil then
		t.userRsvp = self.user_rsvp:jsonEncode()
	end
	if self.notifications_modal_identifier ~= nil then
		t.notificationsModalIdentifier = self.notifications_modal_identifier:jsonEncode()
	end
	return t
end

function t_69:jsonDecode() --[[ line: 14922 ]]
	-- upvalues: t_69 (ref), propTypesModule (ref)
	local var2332 = t_69.new()
	
	if self.event_id ~= nil then
		var2332.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var2332.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.user_rsvp ~= nil then
		var2332.user_rsvp = propTypesModule.BoolProp.jsonDecode(self.user_rsvp)
	end
	if self.userRsvp ~= nil then
		var2332.user_rsvp = propTypesModule.BoolProp.jsonDecode(self.userRsvp)
	end
	if self.notifications_modal_identifier ~= nil then
		var2332.notifications_modal_identifier = propTypesModule.StringProp.jsonDecode(self.notifications_modal_identifier)
	end
	if self.notificationsModalIdentifier ~= nil then
		var2332.notifications_modal_identifier = propTypesModule.StringProp.jsonDecode(self.notificationsModalIdentifier)
	end
	return var2332
end

t_69.descriptor = {
	name = "RsvpToEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RsvpToEventAction_Params = t_69
typeRegistryModule.default:register(t.RsvpToEventAction_Params)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p135) --[[ line: 14972 ]]
	-- upvalues: t (ref), t_70 (ref)
	return setmetatable({
		action_type = if p135 == nil or p135.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p135.action_type,
		action_params = if p135 == nil or p135.action_params == nil then nil else p135.action_params
	}, t_70)
end

function t_70:encode() --[[ line: 14981 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2334 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2335, var2336 = protoModule.writeTag(buff, var2334, 1, protoModule.wireTypes.varint)
		var2335, var2336 = protoModule.writeVarInt(var2335, var2336, t.ActionType.toNumber(self.action_type))
		buff = var2335
		var2334 = var2336
	end
	if self.action_params ~= nil then
		local var2337 = self.action_params:encode()
		local var2338, var2339 = protoModule.writeTag(buff, var2334, 2, protoModule.wireTypes.lengthDelimited)
		var2338, var2339 = protoModule.writeBuffer(var2338, var2339, var2337, buffer.len(var2337))
		buff = var2338
		var2334 = var2339
	end
	local buff_1 = buffer.create(var2334)
	buffer.copy(buff_1, 0, buff, 0, var2334)
	
	return buff_1
end

function t_70.decode(p136) --[[ line: 15007 ]]
	-- upvalues: t_70 (ref), protoModule (ref), t (ref)
	local var2341 = t_70.new()
	local var2342 = 0
	while var2342 < buffer.len(p136) do
		local _ = nil
		local var2343 = nil
		local var2344, var2345, var2346 = protoModule.readTag(p136, var2342)
		local var2347 = var2344
		var2343 = var2345
		var2342 = var2346
		
		if var2343 == protoModule.wireTypes.varint then
			if var2347 == 1 then
				local _ = nil
				local var2348, var2349 = protoModule.readVarIntI32(p136, var2342)
				local var2350 = var2348
				var2342 = var2349
				var2341.action_type = t.ActionType.fromNumber(var2350) or var2350
			else
				local _ = nil
				local var2351, var2352 = protoModule.readVarInt(p136, var2342)
				local _ = var2351
				var2342 = var2352
			end
		end
		if var2343 == protoModule.wireTypes.lengthDelimited then
			if var2347 == 2 then
				local _ = nil
				local var2353, var2354 = protoModule.readBuffer(p136, var2342)
				var2342 = var2354
				var2341.action_params = t.OpenEventDetailsAction_Params.decode(var2353)
			else
				local _ = nil
				local var2355, var2356 = protoModule.readVarInt(p136, var2342)
				var2342 = var2356 + var2355
			end
		elseif var2343 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2357, var2358 = protoModule.readFixed32(p136, var2342)
			local _ = var2357
			var2342 = var2358
		elseif var2343 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2359, var2360 = protoModule.readFixed64(p136, var2342)
			local _ = var2359
			var2342 = var2360
		else
			error("Unsupported wire type: " .. var2343)
		end
	end
	return var2341
end

function t_70:jsonEncode() --[[ line: 15055 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_70:jsonDecode() --[[ line: 15077 ]]
	-- upvalues: t_70 (ref), t (ref)
	local var2362 = t_70.new()
	
	if self.action_type ~= nil then
		var2362.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2362.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2362.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2362.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var2362
end

t_70.descriptor = {
	name = "OpenEventDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenEventDetailsAction"
}
t.OpenEventDetailsAction = t_70
typeRegistryModule.default:register(t.OpenEventDetailsAction)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p137) --[[ line: 15117 ]]
	-- upvalues: t_71 (ref)
	return setmetatable({
		event_id = if p137 == nil or p137.event_id == nil then nil else p137.event_id
	}, t_71)
end

function t_71:encode() --[[ line: 15125 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2364 = 0
	
	if self.event_id ~= nil then
		local var2365 = self.event_id:encode()
		local var2366, var2367 = protoModule.writeTag(buff, var2364, 1, protoModule.wireTypes.lengthDelimited)
		var2366, var2367 = protoModule.writeBuffer(var2366, var2367, var2365, buffer.len(var2365))
		buff = var2366
		var2364 = var2367
	end
	local buff_1 = buffer.create(var2364)
	buffer.copy(buff_1, 0, buff, 0, var2364)
	
	return buff_1
end

function t_71.decode(p138) --[[ line: 15140 ]]
	-- upvalues: t_71 (ref), protoModule (ref), propTypesModule (ref)
	local var2369 = t_71.new()
	local var2370 = 0
	while var2370 < buffer.len(p138) do
		local _ = nil
		local var2371 = nil
		local var2372, var2373, var2374 = protoModule.readTag(p138, var2370)
		local var2375 = var2372
		var2371 = var2373
		var2370 = var2374
		
		if var2371 == protoModule.wireTypes.varint then
			local _ = nil
			local var2376, var2377 = protoModule.readVarInt(p138, var2370)
			local _ = var2376
			var2370 = var2377
			continue
		end
		if var2371 == protoModule.wireTypes.lengthDelimited then
			if var2375 == 1 then
				local _ = nil
				local var2378, var2379 = protoModule.readBuffer(p138, var2370)
				var2370 = var2379
				var2369.event_id = propTypesModule.StringProp.decode(var2378)
			else
				local _ = nil
				local var2380, var2381 = protoModule.readVarInt(p138, var2370)
				var2370 = var2381 + var2380
			end
		elseif var2371 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2382, var2383 = protoModule.readFixed32(p138, var2370)
			local _ = var2382
			var2370 = var2383
		elseif var2371 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2384, var2385 = protoModule.readFixed64(p138, var2370)
			local _ = var2384
			var2370 = var2385
		else
			error("Unsupported wire type: " .. var2371)
		end
	end
	return var2369
end

function t_71:jsonEncode() --[[ line: 15183 ]]
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_71:jsonDecode() --[[ line: 15193 ]]
	-- upvalues: t_71 (ref), propTypesModule (ref)
	local var2387 = t_71.new()
	
	if self.event_id ~= nil then
		var2387.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var2387.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var2387
end

t_71.descriptor = {
	name = "OpenEventDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenEventDetailsAction_Params = t_71
typeRegistryModule.default:register(t.OpenEventDetailsAction_Params)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p139) --[[ line: 15221 ]]
	-- upvalues: t (ref), t_72 (ref)
	return setmetatable({
		action_type = if p139 == nil or p139.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p139.action_type,
		action_params = if p139 == nil or p139.action_params == nil then nil else p139.action_params
	}, t_72)
end

function t_72:encode() --[[ line: 15230 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2389 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2390, var2391 = protoModule.writeTag(buff, var2389, 1, protoModule.wireTypes.varint)
		var2390, var2391 = protoModule.writeVarInt(var2390, var2391, t.ActionType.toNumber(self.action_type))
		buff = var2390
		var2389 = var2391
	end
	if self.action_params ~= nil then
		local var2392 = self.action_params:encode()
		local var2393, var2394 = protoModule.writeTag(buff, var2389, 2, protoModule.wireTypes.lengthDelimited)
		var2393, var2394 = protoModule.writeBuffer(var2393, var2394, var2392, buffer.len(var2392))
		buff = var2393
		var2389 = var2394
	end
	local buff_1 = buffer.create(var2389)
	buffer.copy(buff_1, 0, buff, 0, var2389)
	
	return buff_1
end

function t_72.decode(p140) --[[ line: 15256 ]]
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var2396 = t_72.new()
	local var2397 = 0
	while var2397 < buffer.len(p140) do
		local _ = nil
		local var2398 = nil
		local var2399, var2400, var2401 = protoModule.readTag(p140, var2397)
		local var2402 = var2399
		var2398 = var2400
		var2397 = var2401
		
		if var2398 == protoModule.wireTypes.varint then
			if var2402 == 1 then
				local _ = nil
				local var2403, var2404 = protoModule.readVarIntI32(p140, var2397)
				local var2405 = var2403
				var2397 = var2404
				var2396.action_type = t.ActionType.fromNumber(var2405) or var2405
			else
				local _ = nil
				local var2406, var2407 = protoModule.readVarInt(p140, var2397)
				local _ = var2406
				var2397 = var2407
			end
		end
		if var2398 == protoModule.wireTypes.lengthDelimited then
			if var2402 == 2 then
				local _ = nil
				local var2408, var2409 = protoModule.readBuffer(p140, var2397)
				var2397 = var2409
				var2396.action_params = t.OpenBadgesSeeAllAction_Params.decode(var2408)
			else
				local _ = nil
				local var2410, var2411 = protoModule.readVarInt(p140, var2397)
				var2397 = var2411 + var2410
			end
		elseif var2398 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2412, var2413 = protoModule.readFixed32(p140, var2397)
			local _ = var2412
			var2397 = var2413
		elseif var2398 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2414, var2415 = protoModule.readFixed64(p140, var2397)
			local _ = var2414
			var2397 = var2415
		else
			error("Unsupported wire type: " .. var2398)
		end
	end
	return var2396
end

function t_72:jsonEncode() --[[ line: 15304 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_72:jsonDecode() --[[ line: 15326 ]]
	-- upvalues: t_72 (ref), t (ref)
	local var2417 = t_72.new()
	
	if self.action_type ~= nil then
		var2417.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2417.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2417.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2417.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var2417
end

t_72.descriptor = {
	name = "OpenBadgesSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgesSeeAllAction"
}
t.OpenBadgesSeeAllAction = t_72
typeRegistryModule.default:register(t.OpenBadgesSeeAllAction)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p141) --[[ line: 15366 ]]
	-- upvalues: t_73 (ref)
	return setmetatable({
		universe_id = if p141 == nil or p141.universe_id == nil then nil else p141.universe_id
	}, t_73)
end

function t_73:encode() --[[ line: 15374 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2419 = 0
	
	if self.universe_id ~= nil then
		local var2420 = self.universe_id:encode()
		local var2421, var2422 = protoModule.writeTag(buff, var2419, 1, protoModule.wireTypes.lengthDelimited)
		var2421, var2422 = protoModule.writeBuffer(var2421, var2422, var2420, buffer.len(var2420))
		buff = var2421
		var2419 = var2422
	end
	local buff_1 = buffer.create(var2419)
	buffer.copy(buff_1, 0, buff, 0, var2419)
	
	return buff_1
end

function t_73.decode(p142) --[[ line: 15389 ]]
	-- upvalues: t_73 (ref), protoModule (ref), propTypesModule (ref)
	local var2424 = t_73.new()
	local var2425 = 0
	while var2425 < buffer.len(p142) do
		local _ = nil
		local var2426 = nil
		local var2427, var2428, var2429 = protoModule.readTag(p142, var2425)
		local var2430 = var2427
		var2426 = var2428
		var2425 = var2429
		
		if var2426 == protoModule.wireTypes.varint then
			local _ = nil
			local var2431, var2432 = protoModule.readVarInt(p142, var2425)
			local _ = var2431
			var2425 = var2432
			continue
		end
		if var2426 == protoModule.wireTypes.lengthDelimited then
			if var2430 == 1 then
				local _ = nil
				local var2433, var2434 = protoModule.readBuffer(p142, var2425)
				var2425 = var2434
				var2424.universe_id = propTypesModule.StringProp.decode(var2433)
			else
				local _ = nil
				local var2435, var2436 = protoModule.readVarInt(p142, var2425)
				var2425 = var2436 + var2435
			end
		elseif var2426 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2437, var2438 = protoModule.readFixed32(p142, var2425)
			local _ = var2437
			var2425 = var2438
		elseif var2426 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2439, var2440 = protoModule.readFixed64(p142, var2425)
			local _ = var2439
			var2425 = var2440
		else
			error("Unsupported wire type: " .. var2426)
		end
	end
	return var2424
end

function t_73:jsonEncode() --[[ line: 15432 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_73:jsonDecode() --[[ line: 15442 ]]
	-- upvalues: t_73 (ref), propTypesModule (ref)
	local var2442 = t_73.new()
	
	if self.universe_id ~= nil then
		var2442.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2442.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var2442
end

t_73.descriptor = {
	name = "OpenBadgesSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenBadgesSeeAllAction_Params = t_73
typeRegistryModule.default:register(t.OpenBadgesSeeAllAction_Params)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p143) --[[ line: 15471 ]]
	-- upvalues: t (ref), t_74 (ref)
	return setmetatable({
		action_type = if p143 == nil or p143.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p143.action_type,
		action_params = if p143 == nil or p143.action_params == nil then nil else p143.action_params
	}, t_74)
end

function t_74:encode() --[[ line: 15482 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2444 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2445, var2446 = protoModule.writeTag(buff, var2444, 1, protoModule.wireTypes.varint)
		var2445, var2446 = protoModule.writeVarInt(var2445, var2446, t.ActionType.toNumber(self.action_type))
		buff = var2445
		var2444 = var2446
	end
	if self.action_params ~= nil then
		local var2447 = self.action_params:encode()
		local var2448, var2449 = protoModule.writeTag(buff, var2444, 2, protoModule.wireTypes.lengthDelimited)
		var2448, var2449 = protoModule.writeBuffer(var2448, var2449, var2447, buffer.len(var2447))
		buff = var2448
		var2444 = var2449
	end
	local buff_1 = buffer.create(var2444)
	buffer.copy(buff_1, 0, buff, 0, var2444)
	
	return buff_1
end

function t_74.decode(p144) --[[ line: 15508 ]]
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var2451 = t_74.new()
	local var2452 = 0
	while var2452 < buffer.len(p144) do
		local _ = nil
		local var2453 = nil
		local var2454, var2455, var2456 = protoModule.readTag(p144, var2452)
		local var2457 = var2454
		var2453 = var2455
		var2452 = var2456
		
		if var2453 == protoModule.wireTypes.varint then
			if var2457 == 1 then
				local _ = nil
				local var2458, var2459 = protoModule.readVarIntI32(p144, var2452)
				local var2460 = var2458
				var2452 = var2459
				var2451.action_type = t.ActionType.fromNumber(var2460) or var2460
			else
				local _ = nil
				local var2461, var2462 = protoModule.readVarInt(p144, var2452)
				local _ = var2461
				var2452 = var2462
			end
		end
		if var2453 == protoModule.wireTypes.lengthDelimited then
			if var2457 == 2 then
				local _ = nil
				local var2463, var2464 = protoModule.readBuffer(p144, var2452)
				var2452 = var2464
				var2451.action_params = t.OpenExperienceStoreSeeAllAction_Params.decode(var2463)
			else
				local _ = nil
				local var2465, var2466 = protoModule.readVarInt(p144, var2452)
				var2452 = var2466 + var2465
			end
		elseif var2453 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2467, var2468 = protoModule.readFixed32(p144, var2452)
			local _ = var2467
			var2452 = var2468
		elseif var2453 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2469, var2470 = protoModule.readFixed64(p144, var2452)
			local _ = var2469
			var2452 = var2470
		else
			error("Unsupported wire type: " .. var2453)
		end
	end
	return var2451
end

function t_74:jsonEncode() --[[ line: 15556 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_74:jsonDecode() --[[ line: 15578 ]]
	-- upvalues: t_74 (ref), t (ref)
	local var2472 = t_74.new()
	
	if self.action_type ~= nil then
		var2472.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2472.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2472.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2472.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var2472
end

t_74.descriptor = {
	name = "OpenExperienceStoreSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenExperienceStoreSeeAllAction"
}
t.OpenExperienceStoreSeeAllAction = t_74
typeRegistryModule.default:register(t.OpenExperienceStoreSeeAllAction)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p145) --[[ line: 15618 ]]
	-- upvalues: t_75 (ref)
	return setmetatable({
		universe_id = if p145 == nil or p145.universe_id == nil then nil else p145.universe_id
	}, t_75)
end

function t_75:encode() --[[ line: 15626 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2474 = 0
	
	if self.universe_id ~= nil then
		local var2475 = self.universe_id:encode()
		local var2476, var2477 = protoModule.writeTag(buff, var2474, 1, protoModule.wireTypes.lengthDelimited)
		var2476, var2477 = protoModule.writeBuffer(var2476, var2477, var2475, buffer.len(var2475))
		buff = var2476
		var2474 = var2477
	end
	local buff_1 = buffer.create(var2474)
	buffer.copy(buff_1, 0, buff, 0, var2474)
	
	return buff_1
end

function t_75.decode(p146) --[[ line: 15641 ]]
	-- upvalues: t_75 (ref), protoModule (ref), propTypesModule (ref)
	local var2479 = t_75.new()
	local var2480 = 0
	while var2480 < buffer.len(p146) do
		local _ = nil
		local var2481 = nil
		local var2482, var2483, var2484 = protoModule.readTag(p146, var2480)
		local var2485 = var2482
		var2481 = var2483
		var2480 = var2484
		
		if var2481 == protoModule.wireTypes.varint then
			local _ = nil
			local var2486, var2487 = protoModule.readVarInt(p146, var2480)
			local _ = var2486
			var2480 = var2487
			continue
		end
		if var2481 == protoModule.wireTypes.lengthDelimited then
			if var2485 == 1 then
				local _ = nil
				local var2488, var2489 = protoModule.readBuffer(p146, var2480)
				var2480 = var2489
				var2479.universe_id = propTypesModule.StringProp.decode(var2488)
			else
				local _ = nil
				local var2490, var2491 = protoModule.readVarInt(p146, var2480)
				var2480 = var2491 + var2490
			end
		elseif var2481 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2492, var2493 = protoModule.readFixed32(p146, var2480)
			local _ = var2492
			var2480 = var2493
		elseif var2481 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2494, var2495 = protoModule.readFixed64(p146, var2480)
			local _ = var2494
			var2480 = var2495
		else
			error("Unsupported wire type: " .. var2481)
		end
	end
	return var2479
end

function t_75:jsonEncode() --[[ line: 15684 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_75:jsonDecode() --[[ line: 15694 ]]
	-- upvalues: t_75 (ref), propTypesModule (ref)
	local var2497 = t_75.new()
	
	if self.universe_id ~= nil then
		var2497.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2497.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var2497
end

t_75.descriptor = {
	name = "OpenExperienceStoreSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenExperienceStoreSeeAllAction_Params = t_75
typeRegistryModule.default:register(t.OpenExperienceStoreSeeAllAction_Params)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p147) --[[ line: 15725 ]]
	-- upvalues: t (ref), t_76 (ref)
	return setmetatable({
		action_type = if p147 == nil or p147.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p147.action_type,
		action_params = if p147 == nil or p147.action_params == nil then nil else p147.action_params
	}, t_76)
end

function t_76:encode() --[[ line: 15736 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2499 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2500, var2501 = protoModule.writeTag(buff, var2499, 1, protoModule.wireTypes.varint)
		var2500, var2501 = protoModule.writeVarInt(var2500, var2501, t.ActionType.toNumber(self.action_type))
		buff = var2500
		var2499 = var2501
	end
	if self.action_params ~= nil then
		local var2502 = self.action_params:encode()
		local var2503, var2504 = protoModule.writeTag(buff, var2499, 2, protoModule.wireTypes.lengthDelimited)
		var2503, var2504 = protoModule.writeBuffer(var2503, var2504, var2502, buffer.len(var2502))
		buff = var2503
		var2499 = var2504
	end
	local buff_1 = buffer.create(var2499)
	buffer.copy(buff_1, 0, buff, 0, var2499)
	
	return buff_1
end

function t_76.decode(p148) --[[ line: 15762 ]]
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var2506 = t_76.new()
	local var2507 = 0
	while var2507 < buffer.len(p148) do
		local _ = nil
		local var2508 = nil
		local var2509, var2510, var2511 = protoModule.readTag(p148, var2507)
		local var2512 = var2509
		var2508 = var2510
		var2507 = var2511
		
		if var2508 == protoModule.wireTypes.varint then
			if var2512 == 1 then
				local _ = nil
				local var2513, var2514 = protoModule.readVarIntI32(p148, var2507)
				local var2515 = var2513
				var2507 = var2514
				var2506.action_type = t.ActionType.fromNumber(var2515) or var2515
			else
				local _ = nil
				local var2516, var2517 = protoModule.readVarInt(p148, var2507)
				local _ = var2516
				var2507 = var2517
			end
		end
		if var2508 == protoModule.wireTypes.lengthDelimited then
			if var2512 == 2 then
				local _ = nil
				local var2518, var2519 = protoModule.readBuffer(p148, var2507)
				var2507 = var2519
				var2506.action_params = t.OpenSubscriptionPurchasePageAction_Params.decode(var2518)
			else
				local _ = nil
				local var2520, var2521 = protoModule.readVarInt(p148, var2507)
				var2507 = var2521 + var2520
			end
		elseif var2508 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2522, var2523 = protoModule.readFixed32(p148, var2507)
			local _ = var2522
			var2507 = var2523
		elseif var2508 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2524, var2525 = protoModule.readFixed64(p148, var2507)
			local _ = var2524
			var2507 = var2525
		else
			error("Unsupported wire type: " .. var2508)
		end
	end
	return var2506
end

function t_76:jsonEncode() --[[ line: 15810 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_76:jsonDecode() --[[ line: 15832 ]]
	-- upvalues: t_76 (ref), t (ref)
	local var2527 = t_76.new()
	
	if self.action_type ~= nil then
		var2527.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2527.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2527.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2527.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.actionParams)
	end
	return var2527
end

t_76.descriptor = {
	name = "OpenSubscriptionPurchasePageAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSubscriptionPurchasePageAction"
}
t.OpenSubscriptionPurchasePageAction = t_76
typeRegistryModule.default:register(t.OpenSubscriptionPurchasePageAction)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p149) --[[ line: 15874 ]]
	-- upvalues: t_77 (ref)
	return setmetatable({
		subscription_id = if p149 == nil or p149.subscription_id == nil then nil else p149.subscription_id,
		universe_id = if p149 == nil or p149.universe_id == nil then nil else p149.universe_id,
		creator_name = if p149 == nil or p149.creator_name == nil then nil else p149.creator_name,
		creator_verified = if p149 == nil or p149.creator_verified == nil then nil else p149.creator_verified,
		name = if p149 == nil or p149.name == nil then nil else p149.name,
		description = if p149 == nil or p149.description == nil then nil else p149.description,
		image_asset_id = if p149 == nil or p149.image_asset_id == nil then nil else p149.image_asset_id,
		period_type = if p149 == nil or p149.period_type == nil then nil else p149.period_type,
		is_subscribed = if p149 == nil or p149.is_subscribed == nil then nil else p149.is_subscribed,
		price_display = if p149 == nil or p149.price_display == nil then nil else p149.price_display,
		price_in_robux = if p149 == nil or p149.price_in_robux == nil then nil else p149.price_in_robux,
		price_tier = if p149 == nil or p149.price_tier == nil then nil else p149.price_tier,
		thumbnail_string = if p149 == nil or p149.thumbnail_string == nil then nil else p149.thumbnail_string
	}, t_77)
end

function t_77:encode() --[[ line: 15894 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2529 = 0
	
	if self.subscription_id ~= nil then
		local var2530 = self.subscription_id:encode()
		local var2531, var2532 = protoModule.writeTag(buff, var2529, 1, protoModule.wireTypes.lengthDelimited)
		var2531, var2532 = protoModule.writeBuffer(var2531, var2532, var2530, buffer.len(var2530))
		buff = var2531
		var2529 = var2532
	end
	if self.universe_id ~= nil then
		local var2533 = self.universe_id:encode()
		local var2534, var2535 = protoModule.writeTag(buff, var2529, 2, protoModule.wireTypes.lengthDelimited)
		var2534, var2535 = protoModule.writeBuffer(var2534, var2535, var2533, buffer.len(var2533))
		buff = var2534
		var2529 = var2535
	end
	if self.creator_name ~= nil then
		local var2536 = self.creator_name:encode()
		local var2537, var2538 = protoModule.writeTag(buff, var2529, 3, protoModule.wireTypes.lengthDelimited)
		var2537, var2538 = protoModule.writeBuffer(var2537, var2538, var2536, buffer.len(var2536))
		buff = var2537
		var2529 = var2538
	end
	if self.creator_verified ~= nil then
		local var2539 = self.creator_verified:encode()
		local var2540, var2541 = protoModule.writeTag(buff, var2529, 4, protoModule.wireTypes.lengthDelimited)
		var2540, var2541 = protoModule.writeBuffer(var2540, var2541, var2539, buffer.len(var2539))
		buff = var2540
		var2529 = var2541
	end
	if self.name ~= nil then
		local var2542 = self.name:encode()
		local var2543, var2544 = protoModule.writeTag(buff, var2529, 5, protoModule.wireTypes.lengthDelimited)
		var2543, var2544 = protoModule.writeBuffer(var2543, var2544, var2542, buffer.len(var2542))
		buff = var2543
		var2529 = var2544
	end
	if self.description ~= nil then
		local var2545 = self.description:encode()
		local var2546, var2547 = protoModule.writeTag(buff, var2529, 6, protoModule.wireTypes.lengthDelimited)
		var2546, var2547 = protoModule.writeBuffer(var2546, var2547, var2545, buffer.len(var2545))
		buff = var2546
		var2529 = var2547
	end
	if self.image_asset_id ~= nil then
		local var2548 = self.image_asset_id:encode()
		local var2549, var2550 = protoModule.writeTag(buff, var2529, 7, protoModule.wireTypes.lengthDelimited)
		var2549, var2550 = protoModule.writeBuffer(var2549, var2550, var2548, buffer.len(var2548))
		buff = var2549
		var2529 = var2550
	end
	if self.period_type ~= nil then
		local var2551 = self.period_type:encode()
		local var2552, var2553 = protoModule.writeTag(buff, var2529, 8, protoModule.wireTypes.lengthDelimited)
		var2552, var2553 = protoModule.writeBuffer(var2552, var2553, var2551, buffer.len(var2551))
		buff = var2552
		var2529 = var2553
	end
	if self.is_subscribed ~= nil then
		local var2554 = self.is_subscribed:encode()
		local var2555, var2556 = protoModule.writeTag(buff, var2529, 9, protoModule.wireTypes.lengthDelimited)
		var2555, var2556 = protoModule.writeBuffer(var2555, var2556, var2554, buffer.len(var2554))
		buff = var2555
		var2529 = var2556
	end
	if self.price_display ~= nil then
		local var2557 = self.price_display:encode()
		local var2558, var2559 = protoModule.writeTag(buff, var2529, 10, protoModule.wireTypes.lengthDelimited)
		var2558, var2559 = protoModule.writeBuffer(var2558, var2559, var2557, buffer.len(var2557))
		buff = var2558
		var2529 = var2559
	end
	if self.price_in_robux ~= nil then
		local var2560 = self.price_in_robux:encode()
		local var2561, var2562 = protoModule.writeTag(buff, var2529, 11, protoModule.wireTypes.lengthDelimited)
		var2561, var2562 = protoModule.writeBuffer(var2561, var2562, var2560, buffer.len(var2560))
		buff = var2561
		var2529 = var2562
	end
	if self.price_tier ~= nil then
		local var2563 = self.price_tier:encode()
		local var2564, var2565 = protoModule.writeTag(buff, var2529, 12, protoModule.wireTypes.lengthDelimited)
		var2564, var2565 = protoModule.writeBuffer(var2564, var2565, var2563, buffer.len(var2563))
		buff = var2564
		var2529 = var2565
	end
	if self.thumbnail_string ~= nil then
		local var2566 = self.thumbnail_string:encode()
		local var2567, var2568 = protoModule.writeTag(buff, var2529, 13, protoModule.wireTypes.lengthDelimited)
		var2567, var2568 = protoModule.writeBuffer(var2567, var2568, var2566, buffer.len(var2566))
		buff = var2567
		var2529 = var2568
	end
	local buff_1 = buffer.create(var2529)
	buffer.copy(buff_1, 0, buff, 0, var2529)
	
	return buff_1
end

function t_77.decode(p150) --[[ line: 15983 ]]
	-- upvalues: t_77 (ref), protoModule (ref), propTypesModule (ref)
	local var2570 = t_77.new()
	local var2571 = 0
	while var2571 < buffer.len(p150) do
		local _ = nil
		local var2572 = nil
		local var2573, var2574, var2575 = protoModule.readTag(p150, var2571)
		local var2576 = var2573
		var2572 = var2574
		var2571 = var2575
		
		if var2572 == protoModule.wireTypes.varint then
			local _ = nil
			local var2577, var2578 = protoModule.readVarInt(p150, var2571)
			local _ = var2577
			var2571 = var2578
			continue
		end
		if var2572 == protoModule.wireTypes.lengthDelimited then
			if var2576 == 1 then
				local _ = nil
				local var2579, var2580 = protoModule.readBuffer(p150, var2571)
				var2571 = var2580
				var2570.subscription_id = propTypesModule.StringProp.decode(var2579)
			elseif var2576 == 2 then
				local _ = nil
				local var2581, var2582 = protoModule.readBuffer(p150, var2571)
				var2571 = var2582
				var2570.universe_id = propTypesModule.StringProp.decode(var2581)
			elseif var2576 == 3 then
				local _ = nil
				local var2583, var2584 = protoModule.readBuffer(p150, var2571)
				var2571 = var2584
				var2570.creator_name = propTypesModule.StringProp.decode(var2583)
			elseif var2576 == 4 then
				local _ = nil
				local var2585, var2586 = protoModule.readBuffer(p150, var2571)
				var2571 = var2586
				var2570.creator_verified = propTypesModule.BoolProp.decode(var2585)
			elseif var2576 == 5 then
				local _ = nil
				local var2587, var2588 = protoModule.readBuffer(p150, var2571)
				var2571 = var2588
				var2570.name = propTypesModule.StringProp.decode(var2587)
			elseif var2576 == 6 then
				local _ = nil
				local var2589, var2590 = protoModule.readBuffer(p150, var2571)
				var2571 = var2590
				var2570.description = propTypesModule.StringProp.decode(var2589)
			elseif var2576 == 7 then
				local _ = nil
				local var2591, var2592 = protoModule.readBuffer(p150, var2571)
				var2571 = var2592
				var2570.image_asset_id = propTypesModule.Int64Prop.decode(var2591)
			elseif var2576 == 8 then
				local _ = nil
				local var2593, var2594 = protoModule.readBuffer(p150, var2571)
				var2571 = var2594
				var2570.period_type = propTypesModule.StringProp.decode(var2593)
			elseif var2576 == 9 then
				local _ = nil
				local var2595, var2596 = protoModule.readBuffer(p150, var2571)
				var2571 = var2596
				var2570.is_subscribed = propTypesModule.BoolProp.decode(var2595)
			elseif var2576 == 10 then
				local _ = nil
				local var2597, var2598 = protoModule.readBuffer(p150, var2571)
				var2571 = var2598
				var2570.price_display = propTypesModule.StringProp.decode(var2597)
			elseif var2576 == 11 then
				local _ = nil
				local var2599, var2600 = protoModule.readBuffer(p150, var2571)
				var2571 = var2600
				var2570.price_in_robux = propTypesModule.Int64Prop.decode(var2599)
			elseif var2576 == 12 then
				local _ = nil
				local var2601, var2602 = protoModule.readBuffer(p150, var2571)
				var2571 = var2602
				var2570.price_tier = propTypesModule.Int64Prop.decode(var2601)
			elseif var2576 == 13 then
				local _ = nil
				local var2603, var2604 = protoModule.readBuffer(p150, var2571)
				var2571 = var2604
				var2570.thumbnail_string = propTypesModule.StringProp.decode(var2603)
			else
				local _ = nil
				local var2605, var2606 = protoModule.readVarInt(p150, var2571)
				var2571 = var2606 + var2605
			end
		elseif var2572 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2607, var2608 = protoModule.readFixed32(p150, var2571)
			local _ = var2607
			var2571 = var2608
		elseif var2572 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2609, var2610 = protoModule.readFixed64(p150, var2571)
			local _ = var2609
			var2571 = var2610
		else
			error("Unsupported wire type: " .. var2572)
		end
	end
	return var2570
end

function t_77:jsonEncode() --[[ line: 16088 ]]
	local t = {}
	
	if self.subscription_id ~= nil then
		t.subscriptionId = self.subscription_id:jsonEncode()
	end
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.creator_name ~= nil then
		t.creatorName = self.creator_name:jsonEncode()
	end
	if self.creator_verified ~= nil then
		t.creatorVerified = self.creator_verified:jsonEncode()
	end
	if self.name ~= nil then
		t.name = self.name:jsonEncode()
	end
	if self.description ~= nil then
		t.description = self.description:jsonEncode()
	end
	if self.image_asset_id ~= nil then
		t.imageAssetId = self.image_asset_id:jsonEncode()
	end
	if self.period_type ~= nil then
		t.periodType = self.period_type:jsonEncode()
	end
	if self.is_subscribed ~= nil then
		t.isSubscribed = self.is_subscribed:jsonEncode()
	end
	if self.price_display ~= nil then
		t.priceDisplay = self.price_display:jsonEncode()
	end
	if self.price_in_robux ~= nil then
		t.priceInRobux = self.price_in_robux:jsonEncode()
	end
	if self.price_tier ~= nil then
		t.priceTier = self.price_tier:jsonEncode()
	end
	if self.thumbnail_string ~= nil then
		t.thumbnailString = self.thumbnail_string:jsonEncode()
	end
	return t
end

function t_77:jsonDecode() --[[ line: 16148 ]]
	-- upvalues: t_77 (ref), propTypesModule (ref)
	local var2612 = t_77.new()
	
	if self.subscription_id ~= nil then
		var2612.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		var2612.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		var2612.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2612.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.creator_name ~= nil then
		var2612.creator_name = propTypesModule.StringProp.jsonDecode(self.creator_name)
	end
	if self.creatorName ~= nil then
		var2612.creator_name = propTypesModule.StringProp.jsonDecode(self.creatorName)
	end
	if self.creator_verified ~= nil then
		var2612.creator_verified = propTypesModule.BoolProp.jsonDecode(self.creator_verified)
	end
	if self.creatorVerified ~= nil then
		var2612.creator_verified = propTypesModule.BoolProp.jsonDecode(self.creatorVerified)
	end
	if self.name ~= nil then
		var2612.name = propTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.description ~= nil then
		var2612.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_asset_id ~= nil then
		var2612.image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.image_asset_id)
	end
	if self.imageAssetId ~= nil then
		var2612.image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.imageAssetId)
	end
	if self.period_type ~= nil then
		var2612.period_type = propTypesModule.StringProp.jsonDecode(self.period_type)
	end
	if self.periodType ~= nil then
		var2612.period_type = propTypesModule.StringProp.jsonDecode(self.periodType)
	end
	if self.is_subscribed ~= nil then
		var2612.is_subscribed = propTypesModule.BoolProp.jsonDecode(self.is_subscribed)
	end
	if self.isSubscribed ~= nil then
		var2612.is_subscribed = propTypesModule.BoolProp.jsonDecode(self.isSubscribed)
	end
	if self.price_display ~= nil then
		var2612.price_display = propTypesModule.StringProp.jsonDecode(self.price_display)
	end
	if self.priceDisplay ~= nil then
		var2612.price_display = propTypesModule.StringProp.jsonDecode(self.priceDisplay)
	end
	if self.price_in_robux ~= nil then
		var2612.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		var2612.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.price_tier ~= nil then
		var2612.price_tier = propTypesModule.Int64Prop.jsonDecode(self.price_tier)
	end
	if self.priceTier ~= nil then
		var2612.price_tier = propTypesModule.Int64Prop.jsonDecode(self.priceTier)
	end
	if self.thumbnail_string ~= nil then
		var2612.thumbnail_string = propTypesModule.StringProp.jsonDecode(self.thumbnail_string)
	end
	if self.thumbnailString ~= nil then
		var2612.thumbnail_string = propTypesModule.StringProp.jsonDecode(self.thumbnailString)
	end
	return var2612
end

t_77.descriptor = {
	name = "OpenSubscriptionPurchasePageAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSubscriptionPurchasePageAction_Params = t_77
typeRegistryModule.default:register(t.OpenSubscriptionPurchasePageAction_Params)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p151) --[[ line: 16285 ]]
	-- upvalues: t (ref), t_78 (ref)
	return setmetatable({
		action_type = if p151 == nil or p151.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p151.action_type,
		action_params = if p151 == nil or p151.action_params == nil then nil else p151.action_params
	}, t_78)
end

function t_78:encode() --[[ line: 16294 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2614 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2615, var2616 = protoModule.writeTag(buff, var2614, 1, protoModule.wireTypes.varint)
		var2615, var2616 = protoModule.writeVarInt(var2615, var2616, t.ActionType.toNumber(self.action_type))
		buff = var2615
		var2614 = var2616
	end
	if self.action_params ~= nil then
		local var2617 = self.action_params:encode()
		local var2618, var2619 = protoModule.writeTag(buff, var2614, 2, protoModule.wireTypes.lengthDelimited)
		var2618, var2619 = protoModule.writeBuffer(var2618, var2619, var2617, buffer.len(var2617))
		buff = var2618
		var2614 = var2619
	end
	local buff_1 = buffer.create(var2614)
	buffer.copy(buff_1, 0, buff, 0, var2614)
	
	return buff_1
end

function t_78.decode(p152) --[[ line: 16320 ]]
	-- upvalues: t_78 (ref), protoModule (ref), t (ref)
	local var2621 = t_78.new()
	local var2622 = 0
	while var2622 < buffer.len(p152) do
		local _ = nil
		local var2623 = nil
		local var2624, var2625, var2626 = protoModule.readTag(p152, var2622)
		local var2627 = var2624
		var2623 = var2625
		var2622 = var2626
		
		if var2623 == protoModule.wireTypes.varint then
			if var2627 == 1 then
				local _ = nil
				local var2628, var2629 = protoModule.readVarIntI32(p152, var2622)
				local var2630 = var2628
				var2622 = var2629
				var2621.action_type = t.ActionType.fromNumber(var2630) or var2630
			else
				local _ = nil
				local var2631, var2632 = protoModule.readVarInt(p152, var2622)
				local _ = var2631
				var2622 = var2632
			end
		end
		if var2623 == protoModule.wireTypes.lengthDelimited then
			if var2627 == 2 then
				local _ = nil
				local var2633, var2634 = protoModule.readBuffer(p152, var2622)
				var2622 = var2634
				var2621.action_params = t.RefreshGamePassesAction_Params.decode(var2633)
			else
				local _ = nil
				local var2635, var2636 = protoModule.readVarInt(p152, var2622)
				var2622 = var2636 + var2635
			end
		elseif var2623 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2637, var2638 = protoModule.readFixed32(p152, var2622)
			local _ = var2637
			var2622 = var2638
		elseif var2623 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2639, var2640 = protoModule.readFixed64(p152, var2622)
			local _ = var2639
			var2622 = var2640
		else
			error("Unsupported wire type: " .. var2623)
		end
	end
	return var2621
end

function t_78:jsonEncode() --[[ line: 16368 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_78:jsonDecode() --[[ line: 16390 ]]
	-- upvalues: t_78 (ref), t (ref)
	local var2642 = t_78.new()
	
	if self.action_type ~= nil then
		var2642.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2642.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2642.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2642.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.actionParams)
	end
	return var2642
end

t_78.descriptor = {
	name = "RefreshGamePassesAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshGamePassesAction"
}
t.RefreshGamePassesAction = t_78
typeRegistryModule.default:register(t.RefreshGamePassesAction)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p153) --[[ line: 16430 ]]
	-- upvalues: t_79 (ref)
	return setmetatable({
		universe_id = if p153 == nil or p153.universe_id == nil then nil else p153.universe_id
	}, t_79)
end

function t_79:encode() --[[ line: 16438 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2644 = 0
	
	if self.universe_id ~= nil then
		local var2645 = self.universe_id:encode()
		local var2646, var2647 = protoModule.writeTag(buff, var2644, 1, protoModule.wireTypes.lengthDelimited)
		var2646, var2647 = protoModule.writeBuffer(var2646, var2647, var2645, buffer.len(var2645))
		buff = var2646
		var2644 = var2647
	end
	local buff_1 = buffer.create(var2644)
	buffer.copy(buff_1, 0, buff, 0, var2644)
	
	return buff_1
end

function t_79.decode(p154) --[[ line: 16453 ]]
	-- upvalues: t_79 (ref), protoModule (ref), propTypesModule (ref)
	local var2649 = t_79.new()
	local var2650 = 0
	while var2650 < buffer.len(p154) do
		local _ = nil
		local var2651 = nil
		local var2652, var2653, var2654 = protoModule.readTag(p154, var2650)
		local var2655 = var2652
		var2651 = var2653
		var2650 = var2654
		
		if var2651 == protoModule.wireTypes.varint then
			local _ = nil
			local var2656, var2657 = protoModule.readVarInt(p154, var2650)
			local _ = var2656
			var2650 = var2657
			continue
		end
		if var2651 == protoModule.wireTypes.lengthDelimited then
			if var2655 == 1 then
				local _ = nil
				local var2658, var2659 = protoModule.readBuffer(p154, var2650)
				var2650 = var2659
				var2649.universe_id = propTypesModule.StringProp.decode(var2658)
			else
				local _ = nil
				local var2660, var2661 = protoModule.readVarInt(p154, var2650)
				var2650 = var2661 + var2660
			end
		elseif var2651 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2662, var2663 = protoModule.readFixed32(p154, var2650)
			local _ = var2662
			var2650 = var2663
		elseif var2651 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2664, var2665 = protoModule.readFixed64(p154, var2650)
			local _ = var2664
			var2650 = var2665
		else
			error("Unsupported wire type: " .. var2651)
		end
	end
	return var2649
end

function t_79:jsonEncode() --[[ line: 16496 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_79:jsonDecode() --[[ line: 16506 ]]
	-- upvalues: t_79 (ref), propTypesModule (ref)
	local var2667 = t_79.new()
	
	if self.universe_id ~= nil then
		var2667.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2667.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var2667
end

t_79.descriptor = {
	name = "RefreshGamePassesAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshGamePassesAction_Params = t_79
typeRegistryModule.default:register(t.RefreshGamePassesAction_Params)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p155) --[[ line: 16535 ]]
	-- upvalues: t (ref), t_80 (ref)
	return setmetatable({
		action_type = if p155 == nil or p155.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p155.action_type,
		action_params = if p155 == nil or p155.action_params == nil then nil else p155.action_params
	}, t_80)
end

function t_80:encode() --[[ line: 16544 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2669 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2670, var2671 = protoModule.writeTag(buff, var2669, 1, protoModule.wireTypes.varint)
		var2670, var2671 = protoModule.writeVarInt(var2670, var2671, t.ActionType.toNumber(self.action_type))
		buff = var2670
		var2669 = var2671
	end
	if self.action_params ~= nil then
		local var2672 = self.action_params:encode()
		local var2673, var2674 = protoModule.writeTag(buff, var2669, 2, protoModule.wireTypes.lengthDelimited)
		var2673, var2674 = protoModule.writeBuffer(var2673, var2674, var2672, buffer.len(var2672))
		buff = var2673
		var2669 = var2674
	end
	local buff_1 = buffer.create(var2669)
	buffer.copy(buff_1, 0, buff, 0, var2669)
	
	return buff_1
end

function t_80.decode(p156) --[[ line: 16570 ]]
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var2676 = t_80.new()
	local var2677 = 0
	while var2677 < buffer.len(p156) do
		local _ = nil
		local var2678 = nil
		local var2679, var2680, var2681 = protoModule.readTag(p156, var2677)
		local var2682 = var2679
		var2678 = var2680
		var2677 = var2681
		
		if var2678 == protoModule.wireTypes.varint then
			if var2682 == 1 then
				local _ = nil
				local var2683, var2684 = protoModule.readVarIntI32(p156, var2677)
				local var2685 = var2683
				var2677 = var2684
				var2676.action_type = t.ActionType.fromNumber(var2685) or var2685
			else
				local _ = nil
				local var2686, var2687 = protoModule.readVarInt(p156, var2677)
				local _ = var2686
				var2677 = var2687
			end
		end
		if var2678 == protoModule.wireTypes.lengthDelimited then
			if var2682 == 2 then
				local _ = nil
				local var2688, var2689 = protoModule.readBuffer(p156, var2677)
				var2677 = var2689
				var2676.action_params = t.RefreshPlayabilityAction_Params.decode(var2688)
			else
				local _ = nil
				local var2690, var2691 = protoModule.readVarInt(p156, var2677)
				var2677 = var2691 + var2690
			end
		elseif var2678 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2692, var2693 = protoModule.readFixed32(p156, var2677)
			local _ = var2692
			var2677 = var2693
		elseif var2678 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2694, var2695 = protoModule.readFixed64(p156, var2677)
			local _ = var2694
			var2677 = var2695
		else
			error("Unsupported wire type: " .. var2678)
		end
	end
	return var2676
end

function t_80:jsonEncode() --[[ line: 16618 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_80:jsonDecode() --[[ line: 16640 ]]
	-- upvalues: t_80 (ref), t (ref)
	local var2697 = t_80.new()
	
	if self.action_type ~= nil then
		var2697.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2697.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2697.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2697.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.actionParams)
	end
	return var2697
end

t_80.descriptor = {
	name = "RefreshPlayabilityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshPlayabilityAction"
}
t.RefreshPlayabilityAction = t_80
typeRegistryModule.default:register(t.RefreshPlayabilityAction)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p157) --[[ line: 16680 ]]
	-- upvalues: t_81 (ref)
	return setmetatable({
		universe_id = if p157 == nil or p157.universe_id == nil then nil else p157.universe_id
	}, t_81)
end

function t_81:encode() --[[ line: 16688 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2699 = 0
	
	if self.universe_id ~= nil then
		local var2700 = self.universe_id:encode()
		local var2701, var2702 = protoModule.writeTag(buff, var2699, 1, protoModule.wireTypes.lengthDelimited)
		var2701, var2702 = protoModule.writeBuffer(var2701, var2702, var2700, buffer.len(var2700))
		buff = var2701
		var2699 = var2702
	end
	local buff_1 = buffer.create(var2699)
	buffer.copy(buff_1, 0, buff, 0, var2699)
	
	return buff_1
end

function t_81.decode(p158) --[[ line: 16703 ]]
	-- upvalues: t_81 (ref), protoModule (ref), propTypesModule (ref)
	local var2704 = t_81.new()
	local var2705 = 0
	while var2705 < buffer.len(p158) do
		local _ = nil
		local var2706 = nil
		local var2707, var2708, var2709 = protoModule.readTag(p158, var2705)
		local var2710 = var2707
		var2706 = var2708
		var2705 = var2709
		
		if var2706 == protoModule.wireTypes.varint then
			local _ = nil
			local var2711, var2712 = protoModule.readVarInt(p158, var2705)
			local _ = var2711
			var2705 = var2712
			continue
		end
		if var2706 == protoModule.wireTypes.lengthDelimited then
			if var2710 == 1 then
				local _ = nil
				local var2713, var2714 = protoModule.readBuffer(p158, var2705)
				var2705 = var2714
				var2704.universe_id = propTypesModule.StringProp.decode(var2713)
			else
				local _ = nil
				local var2715, var2716 = protoModule.readVarInt(p158, var2705)
				var2705 = var2716 + var2715
			end
		elseif var2706 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2717, var2718 = protoModule.readFixed32(p158, var2705)
			local _ = var2717
			var2705 = var2718
		elseif var2706 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2719, var2720 = protoModule.readFixed64(p158, var2705)
			local _ = var2719
			var2705 = var2720
		else
			error("Unsupported wire type: " .. var2706)
		end
	end
	return var2704
end

function t_81:jsonEncode() --[[ line: 16746 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_81:jsonDecode() --[[ line: 16756 ]]
	-- upvalues: t_81 (ref), propTypesModule (ref)
	local var2722 = t_81.new()
	
	if self.universe_id ~= nil then
		var2722.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2722.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var2722
end

t_81.descriptor = {
	name = "RefreshPlayabilityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshPlayabilityAction_Params = t_81
typeRegistryModule.default:register(t.RefreshPlayabilityAction_Params)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p159) --[[ line: 16785 ]]
	-- upvalues: t (ref), t_82 (ref)
	return setmetatable({
		action_type = if p159 == nil or p159.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p159.action_type,
		action_params = if p159 == nil or p159.action_params == nil then nil else p159.action_params
	}, t_82)
end

function t_82:encode() --[[ line: 16796 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2724 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2725, var2726 = protoModule.writeTag(buff, var2724, 1, protoModule.wireTypes.varint)
		var2725, var2726 = protoModule.writeVarInt(var2725, var2726, t.ActionType.toNumber(self.action_type))
		buff = var2725
		var2724 = var2726
	end
	if self.action_params ~= nil then
		local var2727 = self.action_params:encode()
		local var2728, var2729 = protoModule.writeTag(buff, var2724, 2, protoModule.wireTypes.lengthDelimited)
		var2728, var2729 = protoModule.writeBuffer(var2728, var2729, var2727, buffer.len(var2727))
		buff = var2728
		var2724 = var2729
	end
	local buff_1 = buffer.create(var2724)
	buffer.copy(buff_1, 0, buff, 0, var2724)
	
	return buff_1
end

function t_82.decode(p160) --[[ line: 16822 ]]
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var2731 = t_82.new()
	local var2732 = 0
	while var2732 < buffer.len(p160) do
		local _ = nil
		local var2733 = nil
		local var2734, var2735, var2736 = protoModule.readTag(p160, var2732)
		local var2737 = var2734
		var2733 = var2735
		var2732 = var2736
		
		if var2733 == protoModule.wireTypes.varint then
			if var2737 == 1 then
				local _ = nil
				local var2738, var2739 = protoModule.readVarIntI32(p160, var2732)
				local var2740 = var2738
				var2732 = var2739
				var2731.action_type = t.ActionType.fromNumber(var2740) or var2740
			else
				local _ = nil
				local var2741, var2742 = protoModule.readVarInt(p160, var2732)
				local _ = var2741
				var2732 = var2742
			end
		end
		if var2733 == protoModule.wireTypes.lengthDelimited then
			if var2737 == 2 then
				local _ = nil
				local var2743, var2744 = protoModule.readBuffer(p160, var2732)
				var2732 = var2744
				var2731.action_params = t.RefreshDeveloperProductsAction_Params.decode(var2743)
			else
				local _ = nil
				local var2745, var2746 = protoModule.readVarInt(p160, var2732)
				var2732 = var2746 + var2745
			end
		elseif var2733 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2747, var2748 = protoModule.readFixed32(p160, var2732)
			local _ = var2747
			var2732 = var2748
		elseif var2733 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2749, var2750 = protoModule.readFixed64(p160, var2732)
			local _ = var2749
			var2732 = var2750
		else
			error("Unsupported wire type: " .. var2733)
		end
	end
	return var2731
end

function t_82:jsonEncode() --[[ line: 16870 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_82:jsonDecode() --[[ line: 16892 ]]
	-- upvalues: t_82 (ref), t (ref)
	local var2752 = t_82.new()
	
	if self.action_type ~= nil then
		var2752.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2752.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2752.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2752.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.actionParams)
	end
	return var2752
end

t_82.descriptor = {
	name = "RefreshDeveloperProductsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshDeveloperProductsAction"
}
t.RefreshDeveloperProductsAction = t_82
typeRegistryModule.default:register(t.RefreshDeveloperProductsAction)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p161) --[[ line: 16932 ]]
	-- upvalues: t_83 (ref)
	return setmetatable({
		place_id = if p161 == nil or p161.place_id == nil then nil else p161.place_id
	}, t_83)
end

function t_83:encode() --[[ line: 16940 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2754 = 0
	
	if self.place_id ~= nil then
		local var2755 = self.place_id:encode()
		local var2756, var2757 = protoModule.writeTag(buff, var2754, 1, protoModule.wireTypes.lengthDelimited)
		var2756, var2757 = protoModule.writeBuffer(var2756, var2757, var2755, buffer.len(var2755))
		buff = var2756
		var2754 = var2757
	end
	local buff_1 = buffer.create(var2754)
	buffer.copy(buff_1, 0, buff, 0, var2754)
	
	return buff_1
end

function t_83.decode(p162) --[[ line: 16955 ]]
	-- upvalues: t_83 (ref), protoModule (ref), propTypesModule (ref)
	local var2759 = t_83.new()
	local var2760 = 0
	while var2760 < buffer.len(p162) do
		local _ = nil
		local var2761 = nil
		local var2762, var2763, var2764 = protoModule.readTag(p162, var2760)
		local var2765 = var2762
		var2761 = var2763
		var2760 = var2764
		
		if var2761 == protoModule.wireTypes.varint then
			local _ = nil
			local var2766, var2767 = protoModule.readVarInt(p162, var2760)
			local _ = var2766
			var2760 = var2767
			continue
		end
		if var2761 == protoModule.wireTypes.lengthDelimited then
			if var2765 == 1 then
				local _ = nil
				local var2768, var2769 = protoModule.readBuffer(p162, var2760)
				var2760 = var2769
				var2759.place_id = propTypesModule.StringProp.decode(var2768)
			else
				local _ = nil
				local var2770, var2771 = protoModule.readVarInt(p162, var2760)
				var2760 = var2771 + var2770
			end
		elseif var2761 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2772, var2773 = protoModule.readFixed32(p162, var2760)
			local _ = var2772
			var2760 = var2773
		elseif var2761 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2774, var2775 = protoModule.readFixed64(p162, var2760)
			local _ = var2774
			var2760 = var2775
		else
			error("Unsupported wire type: " .. var2761)
		end
	end
	return var2759
end

function t_83:jsonEncode() --[[ line: 16998 ]]
	local t = {}
	
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	return t
end

function t_83:jsonDecode() --[[ line: 17008 ]]
	-- upvalues: t_83 (ref), propTypesModule (ref)
	local var2777 = t_83.new()
	
	if self.place_id ~= nil then
		var2777.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var2777.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	return var2777
end

t_83.descriptor = {
	name = "RefreshDeveloperProductsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshDeveloperProductsAction_Params = t_83
typeRegistryModule.default:register(t.RefreshDeveloperProductsAction_Params)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p163) --[[ line: 17038 ]]
	-- upvalues: t (ref), t_84 (ref)
	return setmetatable({
		action_type = if p163 == nil or p163.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p163.action_type,
		action_params = if p163 == nil or p163.action_params == nil then nil else p163.action_params
	}, t_84)
end

function t_84:encode() --[[ line: 17047 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2779 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2780, var2781 = protoModule.writeTag(buff, var2779, 1, protoModule.wireTypes.varint)
		var2780, var2781 = protoModule.writeVarInt(var2780, var2781, t.ActionType.toNumber(self.action_type))
		buff = var2780
		var2779 = var2781
	end
	if self.action_params ~= nil then
		local var2782 = self.action_params:encode()
		local var2783, var2784 = protoModule.writeTag(buff, var2779, 2, protoModule.wireTypes.lengthDelimited)
		var2783, var2784 = protoModule.writeBuffer(var2783, var2784, var2782, buffer.len(var2782))
		buff = var2783
		var2779 = var2784
	end
	local buff_1 = buffer.create(var2779)
	buffer.copy(buff_1, 0, buff, 0, var2779)
	
	return buff_1
end

function t_84.decode(p164) --[[ line: 17073 ]]
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var2786 = t_84.new()
	local var2787 = 0
	while var2787 < buffer.len(p164) do
		local _ = nil
		local var2788 = nil
		local var2789, var2790, var2791 = protoModule.readTag(p164, var2787)
		local var2792 = var2789
		var2788 = var2790
		var2787 = var2791
		
		if var2788 == protoModule.wireTypes.varint then
			if var2792 == 1 then
				local _ = nil
				local var2793, var2794 = protoModule.readVarIntI32(p164, var2787)
				local var2795 = var2793
				var2787 = var2794
				var2786.action_type = t.ActionType.fromNumber(var2795) or var2795
			else
				local _ = nil
				local var2796, var2797 = protoModule.readVarInt(p164, var2787)
				local _ = var2796
				var2787 = var2797
			end
		end
		if var2788 == protoModule.wireTypes.lengthDelimited then
			if var2792 == 2 then
				local _ = nil
				local var2798, var2799 = protoModule.readBuffer(p164, var2787)
				var2787 = var2799
				var2786.action_params = t.OpenFaeTrialUpsellAction_Params.decode(var2798)
			else
				local _ = nil
				local var2800, var2801 = protoModule.readVarInt(p164, var2787)
				var2787 = var2801 + var2800
			end
		elseif var2788 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2802, var2803 = protoModule.readFixed32(p164, var2787)
			local _ = var2802
			var2787 = var2803
		elseif var2788 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2804, var2805 = protoModule.readFixed64(p164, var2787)
			local _ = var2804
			var2787 = var2805
		else
			error("Unsupported wire type: " .. var2788)
		end
	end
	return var2786
end

function t_84:jsonEncode() --[[ line: 17121 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_84:jsonDecode() --[[ line: 17143 ]]
	-- upvalues: t_84 (ref), t (ref)
	local var2807 = t_84.new()
	
	if self.action_type ~= nil then
		var2807.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2807.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2807.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2807.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.actionParams)
	end
	return var2807
end

t_84.descriptor = {
	name = "OpenFaeTrialUpsellAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenFaeTrialUpsellAction"
}
t.OpenFaeTrialUpsellAction = t_84
typeRegistryModule.default:register(t.OpenFaeTrialUpsellAction)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p165) --[[ line: 17183 ]]
	-- upvalues: t_85 (ref)
	return setmetatable({
		source = if p165 == nil or p165.source == nil then nil else p165.source
	}, t_85)
end

function t_85:encode() --[[ line: 17191 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2809 = 0
	
	if self.source ~= nil then
		local var2810 = self.source:encode()
		local var2811, var2812 = protoModule.writeTag(buff, var2809, 1, protoModule.wireTypes.lengthDelimited)
		var2811, var2812 = protoModule.writeBuffer(var2811, var2812, var2810, buffer.len(var2810))
		buff = var2811
		var2809 = var2812
	end
	local buff_1 = buffer.create(var2809)
	buffer.copy(buff_1, 0, buff, 0, var2809)
	
	return buff_1
end

function t_85.decode(p166) --[[ line: 17206 ]]
	-- upvalues: t_85 (ref), protoModule (ref), propTypesModule (ref)
	local var2814 = t_85.new()
	local var2815 = 0
	while var2815 < buffer.len(p166) do
		local _ = nil
		local var2816 = nil
		local var2817, var2818, var2819 = protoModule.readTag(p166, var2815)
		local var2820 = var2817
		var2816 = var2818
		var2815 = var2819
		
		if var2816 == protoModule.wireTypes.varint then
			local _ = nil
			local var2821, var2822 = protoModule.readVarInt(p166, var2815)
			local _ = var2821
			var2815 = var2822
			continue
		end
		if var2816 == protoModule.wireTypes.lengthDelimited then
			if var2820 == 1 then
				local _ = nil
				local var2823, var2824 = protoModule.readBuffer(p166, var2815)
				var2815 = var2824
				var2814.source = propTypesModule.StringProp.decode(var2823)
			else
				local _ = nil
				local var2825, var2826 = protoModule.readVarInt(p166, var2815)
				var2815 = var2826 + var2825
			end
		elseif var2816 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2827, var2828 = protoModule.readFixed32(p166, var2815)
			local _ = var2827
			var2815 = var2828
		elseif var2816 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2829, var2830 = protoModule.readFixed64(p166, var2815)
			local _ = var2829
			var2815 = var2830
		else
			error("Unsupported wire type: " .. var2816)
		end
	end
	return var2814
end

function t_85:jsonEncode() --[[ line: 17249 ]]
	local t = {}
	
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_85:jsonDecode() --[[ line: 17259 ]]
	-- upvalues: t_85 (ref), propTypesModule (ref)
	local var2832 = t_85.new()
	
	if self.source ~= nil then
		var2832.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var2832
end

t_85.descriptor = {
	name = "OpenFaeTrialUpsellAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenFaeTrialUpsellAction_Params = t_85
typeRegistryModule.default:register(t.OpenFaeTrialUpsellAction_Params)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p167) --[[ line: 17283 ]]
	-- upvalues: t (ref), t_86 (ref)
	return setmetatable({
		action_type = if p167 == nil or p167.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p167.action_type,
		action_params = if p167 == nil or p167.action_params == nil then nil else p167.action_params
	}, t_86)
end

function t_86:encode() --[[ line: 17292 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2834 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2835, var2836 = protoModule.writeTag(buff, var2834, 1, protoModule.wireTypes.varint)
		var2835, var2836 = protoModule.writeVarInt(var2835, var2836, t.ActionType.toNumber(self.action_type))
		buff = var2835
		var2834 = var2836
	end
	if self.action_params ~= nil then
		local var2837 = self.action_params:encode()
		local var2838, var2839 = protoModule.writeTag(buff, var2834, 2, protoModule.wireTypes.lengthDelimited)
		var2838, var2839 = protoModule.writeBuffer(var2838, var2839, var2837, buffer.len(var2837))
		buff = var2838
		var2834 = var2839
	end
	local buff_1 = buffer.create(var2834)
	buffer.copy(buff_1, 0, buff, 0, var2834)
	
	return buff_1
end

function t_86.decode(p168) --[[ line: 17318 ]]
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2841 = t_86.new()
	local var2842 = 0
	while var2842 < buffer.len(p168) do
		local _ = nil
		local var2843 = nil
		local var2844, var2845, var2846 = protoModule.readTag(p168, var2842)
		local var2847 = var2844
		var2843 = var2845
		var2842 = var2846
		
		if var2843 == protoModule.wireTypes.varint then
			if var2847 == 1 then
				local _ = nil
				local var2848, var2849 = protoModule.readVarIntI32(p168, var2842)
				local var2850 = var2848
				var2842 = var2849
				var2841.action_type = t.ActionType.fromNumber(var2850) or var2850
			else
				local _ = nil
				local var2851, var2852 = protoModule.readVarInt(p168, var2842)
				local _ = var2851
				var2842 = var2852
			end
		end
		if var2843 == protoModule.wireTypes.lengthDelimited then
			if var2847 == 2 then
				local _ = nil
				local var2853, var2854 = protoModule.readBuffer(p168, var2842)
				var2842 = var2854
				var2841.action_params = t.OpenSduiOverlayAction_Params.decode(var2853)
			else
				local _ = nil
				local var2855, var2856 = protoModule.readVarInt(p168, var2842)
				var2842 = var2856 + var2855
			end
		elseif var2843 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2857, var2858 = protoModule.readFixed32(p168, var2842)
			local _ = var2857
			var2842 = var2858
		elseif var2843 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2859, var2860 = protoModule.readFixed64(p168, var2842)
			local _ = var2859
			var2842 = var2860
		else
			error("Unsupported wire type: " .. var2843)
		end
	end
	return var2841
end

function t_86:jsonEncode() --[[ line: 17366 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_86:jsonDecode() --[[ line: 17388 ]]
	-- upvalues: t_86 (ref), t (ref)
	local var2862 = t_86.new()
	
	if self.action_type ~= nil then
		var2862.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2862.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2862.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2862.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.actionParams)
	end
	return var2862
end

t_86.descriptor = {
	name = "OpenSduiOverlayAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSduiOverlayAction"
}
t.OpenSduiOverlayAction = t_86
typeRegistryModule.default:register(t.OpenSduiOverlayAction)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p169) --[[ line: 17428 ]]
	-- upvalues: t_87 (ref)
	return setmetatable({
		config_key = if p169 == nil or p169.config_key == nil then nil else p169.config_key,
		identifier = if p169 == nil or p169.identifier == nil then nil else p169.identifier
	}, t_87)
end

function t_87:encode() --[[ line: 17437 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2864 = 0
	
	if self.config_key ~= nil then
		local var2865 = self.config_key:encode()
		local var2866, var2867 = protoModule.writeTag(buff, var2864, 1, protoModule.wireTypes.lengthDelimited)
		var2866, var2867 = protoModule.writeBuffer(var2866, var2867, var2865, buffer.len(var2865))
		buff = var2866
		var2864 = var2867
	end
	if self.identifier ~= nil then
		local var2868 = self.identifier:encode()
		local var2869, var2870 = protoModule.writeTag(buff, var2864, 2, protoModule.wireTypes.lengthDelimited)
		var2869, var2870 = protoModule.writeBuffer(var2869, var2870, var2868, buffer.len(var2868))
		buff = var2869
		var2864 = var2870
	end
	local buff_1 = buffer.create(var2864)
	buffer.copy(buff_1, 0, buff, 0, var2864)
	
	return buff_1
end

function t_87.decode(p170) --[[ line: 17458 ]]
	-- upvalues: t_87 (ref), protoModule (ref), propTypesModule (ref)
	local var2872 = t_87.new()
	local var2873 = 0
	while var2873 < buffer.len(p170) do
		local _ = nil
		local var2874 = nil
		local var2875, var2876, var2877 = protoModule.readTag(p170, var2873)
		local var2878 = var2875
		var2874 = var2876
		var2873 = var2877
		
		if var2874 == protoModule.wireTypes.varint then
			local _ = nil
			local var2879, var2880 = protoModule.readVarInt(p170, var2873)
			local _ = var2879
			var2873 = var2880
			continue
		end
		if var2874 == protoModule.wireTypes.lengthDelimited then
			if var2878 == 1 then
				local _ = nil
				local var2881, var2882 = protoModule.readBuffer(p170, var2873)
				var2873 = var2882
				var2872.config_key = propTypesModule.StringProp.decode(var2881)
			elseif var2878 == 2 then
				local _ = nil
				local var2883, var2884 = protoModule.readBuffer(p170, var2873)
				var2873 = var2884
				var2872.identifier = propTypesModule.StringProp.decode(var2883)
			else
				local _ = nil
				local var2885, var2886 = protoModule.readVarInt(p170, var2873)
				var2873 = var2886 + var2885
			end
		elseif var2874 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2887, var2888 = protoModule.readFixed32(p170, var2873)
			local _ = var2887
			var2873 = var2888
		elseif var2874 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2889, var2890 = protoModule.readFixed64(p170, var2873)
			local _ = var2889
			var2873 = var2890
		else
			error("Unsupported wire type: " .. var2874)
		end
	end
	return var2872
end

function t_87:jsonEncode() --[[ line: 17506 ]]
	local t = {}
	
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	if self.identifier ~= nil then
		t.identifier = self.identifier:jsonEncode()
	end
	return t
end

function t_87:jsonDecode() --[[ line: 17520 ]]
	-- upvalues: t_87 (ref), propTypesModule (ref)
	local var2892 = t_87.new()
	
	if self.config_key ~= nil then
		var2892.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var2892.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.identifier ~= nil then
		var2892.identifier = propTypesModule.StringProp.jsonDecode(self.identifier)
	end
	return var2892
end

t_87.descriptor = {
	name = "OpenSduiOverlayAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSduiOverlayAction_Params = t_87
typeRegistryModule.default:register(t.OpenSduiOverlayAction_Params)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p171) --[[ line: 17552 ]]
	-- upvalues: t (ref), t_88 (ref)
	return setmetatable({
		action_type = if p171 == nil or p171.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p171.action_type,
		action_params = if p171 == nil or p171.action_params == nil then nil else p171.action_params
	}, t_88)
end

function t_88:encode() --[[ line: 17561 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2894 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2895, var2896 = protoModule.writeTag(buff, var2894, 1, protoModule.wireTypes.varint)
		var2895, var2896 = protoModule.writeVarInt(var2895, var2896, t.ActionType.toNumber(self.action_type))
		buff = var2895
		var2894 = var2896
	end
	if self.action_params ~= nil then
		local var2897 = self.action_params:encode()
		local var2898, var2899 = protoModule.writeTag(buff, var2894, 2, protoModule.wireTypes.lengthDelimited)
		var2898, var2899 = protoModule.writeBuffer(var2898, var2899, var2897, buffer.len(var2897))
		buff = var2898
		var2894 = var2899
	end
	local buff_1 = buffer.create(var2894)
	buffer.copy(buff_1, 0, buff, 0, var2894)
	
	return buff_1
end

function t_88.decode(p172) --[[ line: 17587 ]]
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2901 = t_88.new()
	local var2902 = 0
	while var2902 < buffer.len(p172) do
		local _ = nil
		local var2903 = nil
		local var2904, var2905, var2906 = protoModule.readTag(p172, var2902)
		local var2907 = var2904
		var2903 = var2905
		var2902 = var2906
		
		if var2903 == protoModule.wireTypes.varint then
			if var2907 == 1 then
				local _ = nil
				local var2908, var2909 = protoModule.readVarIntI32(p172, var2902)
				local var2910 = var2908
				var2902 = var2909
				var2901.action_type = t.ActionType.fromNumber(var2910) or var2910
			else
				local _ = nil
				local var2911, var2912 = protoModule.readVarInt(p172, var2902)
				local _ = var2911
				var2902 = var2912
			end
		end
		if var2903 == protoModule.wireTypes.lengthDelimited then
			if var2907 == 2 then
				local _ = nil
				local var2913, var2914 = protoModule.readBuffer(p172, var2902)
				var2902 = var2914
				var2901.action_params = t.ApplyChartsFilterAction_Params.decode(var2913)
			else
				local _ = nil
				local var2915, var2916 = protoModule.readVarInt(p172, var2902)
				var2902 = var2916 + var2915
			end
		elseif var2903 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2917, var2918 = protoModule.readFixed32(p172, var2902)
			local _ = var2917
			var2902 = var2918
		elseif var2903 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2919, var2920 = protoModule.readFixed64(p172, var2902)
			local _ = var2919
			var2902 = var2920
		else
			error("Unsupported wire type: " .. var2903)
		end
	end
	return var2901
end

function t_88:jsonEncode() --[[ line: 17635 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_88:jsonDecode() --[[ line: 17657 ]]
	-- upvalues: t_88 (ref), t (ref)
	local var2922 = t_88.new()
	
	if self.action_type ~= nil then
		var2922.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2922.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2922.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2922.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.actionParams)
	end
	return var2922
end

t_88.descriptor = {
	name = "ApplyChartsFilterAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ApplyChartsFilterAction"
}
t.ApplyChartsFilterAction = t_88
typeRegistryModule.default:register(t.ApplyChartsFilterAction)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p173) --[[ line: 17697 ]]
	-- upvalues: t_89 (ref)
	return setmetatable({
		session_id = if p173 == nil or p173.session_id == nil then nil else p173.session_id
	}, t_89)
end

function t_89:encode() --[[ line: 17705 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2924 = 0
	
	if self.session_id ~= nil then
		local var2925 = self.session_id:encode()
		local var2926, var2927 = protoModule.writeTag(buff, var2924, 1, protoModule.wireTypes.lengthDelimited)
		var2926, var2927 = protoModule.writeBuffer(var2926, var2927, var2925, buffer.len(var2925))
		buff = var2926
		var2924 = var2927
	end
	local buff_1 = buffer.create(var2924)
	buffer.copy(buff_1, 0, buff, 0, var2924)
	
	return buff_1
end

function t_89.decode(p174) --[[ line: 17720 ]]
	-- upvalues: t_89 (ref), protoModule (ref), propTypesModule (ref)
	local var2929 = t_89.new()
	local var2930 = 0
	while var2930 < buffer.len(p174) do
		local _ = nil
		local var2931 = nil
		local var2932, var2933, var2934 = protoModule.readTag(p174, var2930)
		local var2935 = var2932
		var2931 = var2933
		var2930 = var2934
		
		if var2931 == protoModule.wireTypes.varint then
			local _ = nil
			local var2936, var2937 = protoModule.readVarInt(p174, var2930)
			local _ = var2936
			var2930 = var2937
			continue
		end
		if var2931 == protoModule.wireTypes.lengthDelimited then
			if var2935 == 1 then
				local _ = nil
				local var2938, var2939 = protoModule.readBuffer(p174, var2930)
				var2930 = var2939
				var2929.session_id = propTypesModule.StringProp.decode(var2938)
			else
				local _ = nil
				local var2940, var2941 = protoModule.readVarInt(p174, var2930)
				var2930 = var2941 + var2940
			end
		elseif var2931 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2942, var2943 = protoModule.readFixed32(p174, var2930)
			local _ = var2942
			var2930 = var2943
		elseif var2931 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2944, var2945 = protoModule.readFixed64(p174, var2930)
			local _ = var2944
			var2930 = var2945
		else
			error("Unsupported wire type: " .. var2931)
		end
	end
	return var2929
end

function t_89:jsonEncode() --[[ line: 17763 ]]
	local t = {}
	
	if self.session_id ~= nil then
		t.sessionId = self.session_id:jsonEncode()
	end
	return t
end

function t_89:jsonDecode() --[[ line: 17773 ]]
	-- upvalues: t_89 (ref), propTypesModule (ref)
	local var2947 = t_89.new()
	
	if self.session_id ~= nil then
		var2947.session_id = propTypesModule.StringProp.jsonDecode(self.session_id)
	end
	if self.sessionId ~= nil then
		var2947.session_id = propTypesModule.StringProp.jsonDecode(self.sessionId)
	end
	return var2947
end

t_89.descriptor = {
	name = "ApplyChartsFilterAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ApplyChartsFilterAction_Params = t_89
typeRegistryModule.default:register(t.ApplyChartsFilterAction_Params)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p175) --[[ line: 17801 ]]
	-- upvalues: t (ref), t_90 (ref)
	return setmetatable({
		action_type = if p175 == nil or p175.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p175.action_type,
		action_params = if p175 == nil or p175.action_params == nil then nil else p175.action_params
	}, t_90)
end

function t_90:encode() --[[ line: 17810 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2949 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2950, var2951 = protoModule.writeTag(buff, var2949, 1, protoModule.wireTypes.varint)
		var2950, var2951 = protoModule.writeVarInt(var2950, var2951, t.ActionType.toNumber(self.action_type))
		buff = var2950
		var2949 = var2951
	end
	if self.action_params ~= nil then
		local var2952 = self.action_params:encode()
		local var2953, var2954 = protoModule.writeTag(buff, var2949, 2, protoModule.wireTypes.lengthDelimited)
		var2953, var2954 = protoModule.writeBuffer(var2953, var2954, var2952, buffer.len(var2952))
		buff = var2953
		var2949 = var2954
	end
	local buff_1 = buffer.create(var2949)
	buffer.copy(buff_1, 0, buff, 0, var2949)
	
	return buff_1
end

function t_90.decode(p176) --[[ line: 17836 ]]
	-- upvalues: t_90 (ref), protoModule (ref), t (ref)
	local var2956 = t_90.new()
	local var2957 = 0
	while var2957 < buffer.len(p176) do
		local _ = nil
		local var2958 = nil
		local var2959, var2960, var2961 = protoModule.readTag(p176, var2957)
		local var2962 = var2959
		var2958 = var2960
		var2957 = var2961
		
		if var2958 == protoModule.wireTypes.varint then
			if var2962 == 1 then
				local _ = nil
				local var2963, var2964 = protoModule.readVarIntI32(p176, var2957)
				local var2965 = var2963
				var2957 = var2964
				var2956.action_type = t.ActionType.fromNumber(var2965) or var2965
			else
				local _ = nil
				local var2966, var2967 = protoModule.readVarInt(p176, var2957)
				local _ = var2966
				var2957 = var2967
			end
		end
		if var2958 == protoModule.wireTypes.lengthDelimited then
			if var2962 == 2 then
				local _ = nil
				local var2968, var2969 = protoModule.readBuffer(p176, var2957)
				var2957 = var2969
				var2956.action_params = t.AnalyticsEventAction_Params.decode(var2968)
			else
				local _ = nil
				local var2970, var2971 = protoModule.readVarInt(p176, var2957)
				var2957 = var2971 + var2970
			end
		elseif var2958 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2972, var2973 = protoModule.readFixed32(p176, var2957)
			local _ = var2972
			var2957 = var2973
		elseif var2958 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2974, var2975 = protoModule.readFixed64(p176, var2957)
			local _ = var2974
			var2957 = var2975
		else
			error("Unsupported wire type: " .. var2958)
		end
	end
	return var2956
end

function t_90:jsonEncode() --[[ line: 17884 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_90:jsonDecode() --[[ line: 17906 ]]
	-- upvalues: t_90 (ref), t (ref)
	local var2977 = t_90.new()
	
	if self.action_type ~= nil then
		var2977.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2977.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2977.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2977.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return var2977
end

t_90.descriptor = {
	name = "AnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.AnalyticsEventAction"
}
t.AnalyticsEventAction = t_90
typeRegistryModule.default:register(t.AnalyticsEventAction)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p177) --[[ line: 17946 ]]
	-- upvalues: t_91 (ref)
	return setmetatable({
		event_name = if p177 == nil or p177.event_name == nil then nil else p177.event_name,
		event_fields = if p177 == nil or p177.event_fields == nil then nil else p177.event_fields
	}, t_91)
end

function t_91:encode() --[[ line: 17955 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2979 = 0
	
	if self.event_name ~= nil then
		local var2980 = self.event_name:encode()
		local var2981, var2982 = protoModule.writeTag(buff, var2979, 1, protoModule.wireTypes.lengthDelimited)
		var2981, var2982 = protoModule.writeBuffer(var2981, var2982, var2980, buffer.len(var2980))
		buff = var2981
		var2979 = var2982
	end
	if self.event_fields ~= nil then
		local var2983 = self.event_fields:encode()
		local var2984, var2985 = protoModule.writeTag(buff, var2979, 2, protoModule.wireTypes.lengthDelimited)
		var2984, var2985 = protoModule.writeBuffer(var2984, var2985, var2983, buffer.len(var2983))
		buff = var2984
		var2979 = var2985
	end
	local buff_1 = buffer.create(var2979)
	buffer.copy(buff_1, 0, buff, 0, var2979)
	
	return buff_1
end

function t_91.decode(p178) --[[ line: 17976 ]]
	-- upvalues: t_91 (ref), protoModule (ref), propTypesModule (ref)
	local var2987 = t_91.new()
	local var2988 = 0
	while var2988 < buffer.len(p178) do
		local _ = nil
		local var2989 = nil
		local var2990, var2991, var2992 = protoModule.readTag(p178, var2988)
		local var2993 = var2990
		var2989 = var2991
		var2988 = var2992
		
		if var2989 == protoModule.wireTypes.varint then
			local _ = nil
			local var2994, var2995 = protoModule.readVarInt(p178, var2988)
			local _ = var2994
			var2988 = var2995
			continue
		end
		if var2989 == protoModule.wireTypes.lengthDelimited then
			if var2993 == 1 then
				local _ = nil
				local var2996, var2997 = protoModule.readBuffer(p178, var2988)
				var2988 = var2997
				var2987.event_name = propTypesModule.StringProp.decode(var2996)
			elseif var2993 == 2 then
				local _ = nil
				local var2998, var2999 = protoModule.readBuffer(p178, var2988)
				var2988 = var2999
				var2987.event_fields = propTypesModule.StructProp.decode(var2998)
			else
				local _ = nil
				local var3000, var3001 = protoModule.readVarInt(p178, var2988)
				var2988 = var3001 + var3000
			end
		elseif var2989 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3002, var3003 = protoModule.readFixed32(p178, var2988)
			local _ = var3002
			var2988 = var3003
		elseif var2989 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3004, var3005 = protoModule.readFixed64(p178, var2988)
			local _ = var3004
			var2988 = var3005
		else
			error("Unsupported wire type: " .. var2989)
		end
	end
	return var2987
end

function t_91:jsonEncode() --[[ line: 18024 ]]
	local t = {}
	
	if self.event_name ~= nil then
		t.eventName = self.event_name:jsonEncode()
	end
	if self.event_fields ~= nil then
		t.eventFields = self.event_fields:jsonEncode()
	end
	return t
end

function t_91:jsonDecode() --[[ line: 18038 ]]
	-- upvalues: t_91 (ref), propTypesModule (ref)
	local var3007 = t_91.new()
	
	if self.event_name ~= nil then
		var3007.event_name = propTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		var3007.event_name = propTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		var3007.event_fields = propTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		var3007.event_fields = propTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return var3007
end

t_91.descriptor = {
	name = "AnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.AnalyticsEventAction_Params = t_91
typeRegistryModule.default:register(t.AnalyticsEventAction_Params)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p179) --[[ line: 18076 ]]
	-- upvalues: t (ref), t_92 (ref)
	return setmetatable({
		action_type = if p179 == nil or p179.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p179.action_type,
		action_params = if p179 == nil or p179.action_params == nil then nil else p179.action_params
	}, t_92)
end

function t_92:encode() --[[ line: 18087 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3009 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3010, var3011 = protoModule.writeTag(buff, var3009, 1, protoModule.wireTypes.varint)
		var3010, var3011 = protoModule.writeVarInt(var3010, var3011, t.ActionType.toNumber(self.action_type))
		buff = var3010
		var3009 = var3011
	end
	if self.action_params ~= nil then
		local var3012 = self.action_params:encode()
		local var3013, var3014 = protoModule.writeTag(buff, var3009, 2, protoModule.wireTypes.lengthDelimited)
		var3013, var3014 = protoModule.writeBuffer(var3013, var3014, var3012, buffer.len(var3012))
		buff = var3013
		var3009 = var3014
	end
	local buff_1 = buffer.create(var3009)
	buffer.copy(buff_1, 0, buff, 0, var3009)
	
	return buff_1
end

function t_92.decode(p180) --[[ line: 18113 ]]
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var3016 = t_92.new()
	local var3017 = 0
	while var3017 < buffer.len(p180) do
		local _ = nil
		local var3018 = nil
		local var3019, var3020, var3021 = protoModule.readTag(p180, var3017)
		local var3022 = var3019
		var3018 = var3020
		var3017 = var3021
		
		if var3018 == protoModule.wireTypes.varint then
			if var3022 == 1 then
				local _ = nil
				local var3023, var3024 = protoModule.readVarIntI32(p180, var3017)
				local var3025 = var3023
				var3017 = var3024
				var3016.action_type = t.ActionType.fromNumber(var3025) or var3025
			else
				local _ = nil
				local var3026, var3027 = protoModule.readVarInt(p180, var3017)
				local _ = var3026
				var3017 = var3027
			end
		end
		if var3018 == protoModule.wireTypes.lengthDelimited then
			if var3022 == 2 then
				local _ = nil
				local var3028, var3029 = protoModule.readBuffer(p180, var3017)
				var3017 = var3029
				var3016.action_params = t.CustomAnalyticsEventAction_Params.decode(var3028)
			else
				local _ = nil
				local var3030, var3031 = protoModule.readVarInt(p180, var3017)
				var3017 = var3031 + var3030
			end
		elseif var3018 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3032, var3033 = protoModule.readFixed32(p180, var3017)
			local _ = var3032
			var3017 = var3033
		elseif var3018 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3034, var3035 = protoModule.readFixed64(p180, var3017)
			local _ = var3034
			var3017 = var3035
		else
			error("Unsupported wire type: " .. var3018)
		end
	end
	return var3016
end

function t_92:jsonEncode() --[[ line: 18161 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_92:jsonDecode() --[[ line: 18183 ]]
	-- upvalues: t_92 (ref), t (ref)
	local var3037 = t_92.new()
	
	if self.action_type ~= nil then
		var3037.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3037.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3037.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3037.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return var3037
end

t_92.descriptor = {
	name = "CustomAnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomAnalyticsEventAction"
}
t.CustomAnalyticsEventAction = t_92
typeRegistryModule.default:register(t.CustomAnalyticsEventAction)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p181) --[[ line: 18223 ]]
	-- upvalues: t_93 (ref)
	return setmetatable({
		event_name = if p181 == nil or p181.event_name == nil then nil else p181.event_name,
		event_fields = if p181 == nil or p181.event_fields == nil then nil else p181.event_fields
	}, t_93)
end

function t_93:encode() --[[ line: 18232 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3039 = 0
	
	if self.event_name ~= nil then
		local var3040 = self.event_name:encode()
		local var3041, var3042 = protoModule.writeTag(buff, var3039, 1, protoModule.wireTypes.lengthDelimited)
		var3041, var3042 = protoModule.writeBuffer(var3041, var3042, var3040, buffer.len(var3040))
		buff = var3041
		var3039 = var3042
	end
	if self.event_fields ~= nil then
		local var3043 = self.event_fields:encode()
		local var3044, var3045 = protoModule.writeTag(buff, var3039, 2, protoModule.wireTypes.lengthDelimited)
		var3044, var3045 = protoModule.writeBuffer(var3044, var3045, var3043, buffer.len(var3043))
		buff = var3044
		var3039 = var3045
	end
	local buff_1 = buffer.create(var3039)
	buffer.copy(buff_1, 0, buff, 0, var3039)
	
	return buff_1
end

function t_93.decode(p182) --[[ line: 18253 ]]
	-- upvalues: t_93 (ref), protoModule (ref), propTypesModule (ref)
	local var3047 = t_93.new()
	local var3048 = 0
	while var3048 < buffer.len(p182) do
		local _ = nil
		local var3049 = nil
		local var3050, var3051, var3052 = protoModule.readTag(p182, var3048)
		local var3053 = var3050
		var3049 = var3051
		var3048 = var3052
		
		if var3049 == protoModule.wireTypes.varint then
			local _ = nil
			local var3054, var3055 = protoModule.readVarInt(p182, var3048)
			local _ = var3054
			var3048 = var3055
			continue
		end
		if var3049 == protoModule.wireTypes.lengthDelimited then
			if var3053 == 1 then
				local _ = nil
				local var3056, var3057 = protoModule.readBuffer(p182, var3048)
				var3048 = var3057
				var3047.event_name = propTypesModule.StringProp.decode(var3056)
			elseif var3053 == 2 then
				local _ = nil
				local var3058, var3059 = protoModule.readBuffer(p182, var3048)
				var3048 = var3059
				var3047.event_fields = propTypesModule.StructProp.decode(var3058)
			else
				local _ = nil
				local var3060, var3061 = protoModule.readVarInt(p182, var3048)
				var3048 = var3061 + var3060
			end
		elseif var3049 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3062, var3063 = protoModule.readFixed32(p182, var3048)
			local _ = var3062
			var3048 = var3063
		elseif var3049 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3064, var3065 = protoModule.readFixed64(p182, var3048)
			local _ = var3064
			var3048 = var3065
		else
			error("Unsupported wire type: " .. var3049)
		end
	end
	return var3047
end

function t_93:jsonEncode() --[[ line: 18301 ]]
	local t = {}
	
	if self.event_name ~= nil then
		t.eventName = self.event_name:jsonEncode()
	end
	if self.event_fields ~= nil then
		t.eventFields = self.event_fields:jsonEncode()
	end
	return t
end

function t_93:jsonDecode() --[[ line: 18315 ]]
	-- upvalues: t_93 (ref), propTypesModule (ref)
	local var3067 = t_93.new()
	
	if self.event_name ~= nil then
		var3067.event_name = propTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		var3067.event_name = propTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		var3067.event_fields = propTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		var3067.event_fields = propTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return var3067
end

t_93.descriptor = {
	name = "CustomAnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.CustomAnalyticsEventAction_Params = t_93
typeRegistryModule.default:register(t.CustomAnalyticsEventAction_Params)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p183) --[[ line: 18355 ]]
	-- upvalues: t (ref), t_94 (ref)
	return setmetatable({
		action_type = if p183 == nil or p183.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p183.action_type,
		action_params = if p183 == nil or p183.action_params == nil then nil else p183.action_params
	}, t_94)
end

function t_94:encode() --[[ line: 18364 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3069 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3070, var3071 = protoModule.writeTag(buff, var3069, 1, protoModule.wireTypes.varint)
		var3070, var3071 = protoModule.writeVarInt(var3070, var3071, t.ActionType.toNumber(self.action_type))
		buff = var3070
		var3069 = var3071
	end
	if self.action_params ~= nil then
		local var3072 = self.action_params:encode()
		local var3073, var3074 = protoModule.writeTag(buff, var3069, 2, protoModule.wireTypes.lengthDelimited)
		var3073, var3074 = protoModule.writeBuffer(var3073, var3074, var3072, buffer.len(var3072))
		buff = var3073
		var3069 = var3074
	end
	local buff_1 = buffer.create(var3069)
	buffer.copy(buff_1, 0, buff, 0, var3069)
	
	return buff_1
end

function t_94.decode(p184) --[[ line: 18390 ]]
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var3076 = t_94.new()
	local var3077 = 0
	while var3077 < buffer.len(p184) do
		local _ = nil
		local var3078 = nil
		local var3079, var3080, var3081 = protoModule.readTag(p184, var3077)
		local var3082 = var3079
		var3078 = var3080
		var3077 = var3081
		
		if var3078 == protoModule.wireTypes.varint then
			if var3082 == 1 then
				local _ = nil
				local var3083, var3084 = protoModule.readVarIntI32(p184, var3077)
				local var3085 = var3083
				var3077 = var3084
				var3076.action_type = t.ActionType.fromNumber(var3085) or var3085
			else
				local _ = nil
				local var3086, var3087 = protoModule.readVarInt(p184, var3077)
				local _ = var3086
				var3077 = var3087
			end
		end
		if var3078 == protoModule.wireTypes.lengthDelimited then
			if var3082 == 2 then
				local _ = nil
				local var3088, var3089 = protoModule.readBuffer(p184, var3077)
				var3077 = var3089
				var3076.action_params = t.OpenGameInviteAction_Params.decode(var3088)
			else
				local _ = nil
				local var3090, var3091 = protoModule.readVarInt(p184, var3077)
				var3077 = var3091 + var3090
			end
		elseif var3078 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3092, var3093 = protoModule.readFixed32(p184, var3077)
			local _ = var3092
			var3077 = var3093
		elseif var3078 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3094, var3095 = protoModule.readFixed64(p184, var3077)
			local _ = var3094
			var3077 = var3095
		else
			error("Unsupported wire type: " .. var3078)
		end
	end
	return var3076
end

function t_94:jsonEncode() --[[ line: 18438 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_94:jsonDecode() --[[ line: 18460 ]]
	-- upvalues: t_94 (ref), t (ref)
	local var3097 = t_94.new()
	
	if self.action_type ~= nil then
		var3097.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3097.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3097.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3097.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.actionParams)
	end
	return var3097
end

t_94.descriptor = {
	name = "OpenGameInviteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameInviteAction"
}
t.OpenGameInviteAction = t_94
typeRegistryModule.default:register(t.OpenGameInviteAction)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p185) --[[ line: 18500 ]]
	-- upvalues: t_95 (ref)
	return setmetatable({
		universe_id = if p185 == nil or p185.universe_id == nil then nil else p185.universe_id,
		root_place_id = if p185 == nil or p185.root_place_id == nil then nil else p185.root_place_id,
		trigger = if p185 == nil or p185.trigger == nil then nil else p185.trigger,
		button_name = if p185 == nil or p185.button_name == nil then nil else p185.button_name
	}, t_95)
end

function t_95:encode() --[[ line: 18511 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3099 = 0
	
	if self.universe_id ~= nil then
		local var3100 = self.universe_id:encode()
		local var3101, var3102 = protoModule.writeTag(buff, var3099, 1, protoModule.wireTypes.lengthDelimited)
		var3101, var3102 = protoModule.writeBuffer(var3101, var3102, var3100, buffer.len(var3100))
		buff = var3101
		var3099 = var3102
	end
	if self.root_place_id ~= nil then
		local var3103 = self.root_place_id:encode()
		local var3104, var3105 = protoModule.writeTag(buff, var3099, 2, protoModule.wireTypes.lengthDelimited)
		var3104, var3105 = protoModule.writeBuffer(var3104, var3105, var3103, buffer.len(var3103))
		buff = var3104
		var3099 = var3105
	end
	if self.trigger ~= nil then
		local var3106 = self.trigger:encode()
		local var3107, var3108 = protoModule.writeTag(buff, var3099, 3, protoModule.wireTypes.lengthDelimited)
		var3107, var3108 = protoModule.writeBuffer(var3107, var3108, var3106, buffer.len(var3106))
		buff = var3107
		var3099 = var3108
	end
	if self.button_name ~= nil then
		local var3109 = self.button_name:encode()
		local var3110, var3111 = protoModule.writeTag(buff, var3099, 4, protoModule.wireTypes.lengthDelimited)
		var3110, var3111 = protoModule.writeBuffer(var3110, var3111, var3109, buffer.len(var3109))
		buff = var3110
		var3099 = var3111
	end
	local buff_1 = buffer.create(var3099)
	buffer.copy(buff_1, 0, buff, 0, var3099)
	
	return buff_1
end

function t_95.decode(p186) --[[ line: 18544 ]]
	-- upvalues: t_95 (ref), protoModule (ref), propTypesModule (ref)
	local var3113 = t_95.new()
	local var3114 = 0
	while var3114 < buffer.len(p186) do
		local _ = nil
		local var3115 = nil
		local var3116, var3117, var3118 = protoModule.readTag(p186, var3114)
		local var3119 = var3116
		var3115 = var3117
		var3114 = var3118
		
		if var3115 == protoModule.wireTypes.varint then
			local _ = nil
			local var3120, var3121 = protoModule.readVarInt(p186, var3114)
			local _ = var3120
			var3114 = var3121
			continue
		end
		if var3115 == protoModule.wireTypes.lengthDelimited then
			if var3119 == 1 then
				local _ = nil
				local var3122, var3123 = protoModule.readBuffer(p186, var3114)
				var3114 = var3123
				var3113.universe_id = propTypesModule.StringProp.decode(var3122)
			elseif var3119 == 2 then
				local _ = nil
				local var3124, var3125 = protoModule.readBuffer(p186, var3114)
				var3114 = var3125
				var3113.root_place_id = propTypesModule.StringProp.decode(var3124)
			elseif var3119 == 3 then
				local _ = nil
				local var3126, var3127 = protoModule.readBuffer(p186, var3114)
				var3114 = var3127
				var3113.trigger = propTypesModule.StringProp.decode(var3126)
			elseif var3119 == 4 then
				local _ = nil
				local var3128, var3129 = protoModule.readBuffer(p186, var3114)
				var3114 = var3129
				var3113.button_name = propTypesModule.StringProp.decode(var3128)
			else
				local _ = nil
				local var3130, var3131 = protoModule.readVarInt(p186, var3114)
				var3114 = var3131 + var3130
			end
		elseif var3115 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3132, var3133 = protoModule.readFixed32(p186, var3114)
			local _ = var3132
			var3114 = var3133
		elseif var3115 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3134, var3135 = protoModule.readFixed64(p186, var3114)
			local _ = var3134
			var3114 = var3135
		else
			error("Unsupported wire type: " .. var3115)
		end
	end
	return var3113
end

function t_95:jsonEncode() --[[ line: 18602 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.root_place_id ~= nil then
		t.rootPlaceId = self.root_place_id:jsonEncode()
	end
	if self.trigger ~= nil then
		t.trigger = self.trigger:jsonEncode()
	end
	if self.button_name ~= nil then
		t.buttonName = self.button_name:jsonEncode()
	end
	return t
end

function t_95:jsonDecode() --[[ line: 18624 ]]
	-- upvalues: t_95 (ref), propTypesModule (ref)
	local var3137 = t_95.new()
	
	if self.universe_id ~= nil then
		var3137.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3137.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		var3137.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var3137.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	if self.trigger ~= nil then
		var3137.trigger = propTypesModule.StringProp.jsonDecode(self.trigger)
	end
	if self.button_name ~= nil then
		var3137.button_name = propTypesModule.StringProp.jsonDecode(self.button_name)
	end
	if self.buttonName ~= nil then
		var3137.button_name = propTypesModule.StringProp.jsonDecode(self.buttonName)
	end
	return var3137
end

t_95.descriptor = {
	name = "OpenGameInviteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameInviteAction_Params = t_95
typeRegistryModule.default:register(t.OpenGameInviteAction_Params)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p187) --[[ line: 18676 ]]
	-- upvalues: t (ref), t_96 (ref)
	return setmetatable({
		action_type = if p187 == nil or p187.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p187.action_type,
		action_params = if p187 == nil or p187.action_params == nil then nil else p187.action_params
	}, t_96)
end

function t_96:encode() --[[ line: 18685 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3139 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3140, var3141 = protoModule.writeTag(buff, var3139, 1, protoModule.wireTypes.varint)
		var3140, var3141 = protoModule.writeVarInt(var3140, var3141, t.ActionType.toNumber(self.action_type))
		buff = var3140
		var3139 = var3141
	end
	if self.action_params ~= nil then
		local var3142 = self.action_params:encode()
		local var3143, var3144 = protoModule.writeTag(buff, var3139, 2, protoModule.wireTypes.lengthDelimited)
		var3143, var3144 = protoModule.writeBuffer(var3143, var3144, var3142, buffer.len(var3142))
		buff = var3143
		var3139 = var3144
	end
	local buff_1 = buffer.create(var3139)
	buffer.copy(buff_1, 0, buff, 0, var3139)
	
	return buff_1
end

function t_96.decode(p188) --[[ line: 18711 ]]
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var3146 = t_96.new()
	local var3147 = 0
	while var3147 < buffer.len(p188) do
		local _ = nil
		local var3148 = nil
		local var3149, var3150, var3151 = protoModule.readTag(p188, var3147)
		local var3152 = var3149
		var3148 = var3150
		var3147 = var3151
		
		if var3148 == protoModule.wireTypes.varint then
			if var3152 == 1 then
				local _ = nil
				local var3153, var3154 = protoModule.readVarIntI32(p188, var3147)
				local var3155 = var3153
				var3147 = var3154
				var3146.action_type = t.ActionType.fromNumber(var3155) or var3155
			else
				local _ = nil
				local var3156, var3157 = protoModule.readVarInt(p188, var3147)
				local _ = var3156
				var3147 = var3157
			end
		end
		if var3148 == protoModule.wireTypes.lengthDelimited then
			if var3152 == 2 then
				local _ = nil
				local var3158, var3159 = protoModule.readBuffer(p188, var3147)
				var3147 = var3159
				var3146.action_params = t.LaunchExperienceAction_Params.decode(var3158)
			else
				local _ = nil
				local var3160, var3161 = protoModule.readVarInt(p188, var3147)
				var3147 = var3161 + var3160
			end
		elseif var3148 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3162, var3163 = protoModule.readFixed32(p188, var3147)
			local _ = var3162
			var3147 = var3163
		elseif var3148 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3164, var3165 = protoModule.readFixed64(p188, var3147)
			local _ = var3164
			var3147 = var3165
		else
			error("Unsupported wire type: " .. var3148)
		end
	end
	return var3146
end

function t_96:jsonEncode() --[[ line: 18759 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_96:jsonDecode() --[[ line: 18781 ]]
	-- upvalues: t_96 (ref), t (ref)
	local var3167 = t_96.new()
	
	if self.action_type ~= nil then
		var3167.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3167.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3167.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3167.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.actionParams)
	end
	return var3167
end

t_96.descriptor = {
	name = "LaunchExperienceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LaunchExperienceAction"
}
t.LaunchExperienceAction = t_96
typeRegistryModule.default:register(t.LaunchExperienceAction)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p189) --[[ line: 18821 ]]
	-- upvalues: t_97 (ref)
	return setmetatable({
		kind = if p189 == nil or p189.kind == nil then nil else p189.kind
	}, t_97)
end

function t_97:encode() --[[ line: 18829 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3169 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3170 = self.kind.value:encode()
			local var3171, var3172 = protoModule.writeTag(buff, var3169, 1, protoModule.wireTypes.lengthDelimited)
			var3171, var3172 = protoModule.writeBuffer(var3171, var3172, var3170, buffer.len(var3170))
			buff = var3171
			var3169 = var3172
		elseif self.kind.type == "binding_path" then
			local var3173, var3174 = protoModule.writeTag(buff, var3169, 2, protoModule.wireTypes.lengthDelimited)
			var3173, var3174 = protoModule.writeString(var3173, var3174, self.kind.value)
			buff = var3173
			var3169 = var3174
		end
	end
	local buff_1 = buffer.create(var3169)
	buffer.copy(buff_1, 0, buff, 0, var3169)
	
	return buff_1
end

function t_97.decode(p190) --[[ line: 18851 ]]
	-- upvalues: t_97 (ref), protoModule (ref), t (ref)
	local var3176 = t_97.new()
	local var3177 = 0
	while var3177 < buffer.len(p190) do
		local _ = nil
		local var3178 = nil
		local var3179, var3180, var3181 = protoModule.readTag(p190, var3177)
		local var3182 = var3179
		var3178 = var3180
		var3177 = var3181
		
		if var3178 == protoModule.wireTypes.varint then
			local _ = nil
			local var3183, var3184 = protoModule.readVarInt(p190, var3177)
			local _ = var3183
			var3177 = var3184
			continue
		end
		if var3178 == protoModule.wireTypes.lengthDelimited then
			if var3182 == 1 then
				local _ = nil
				local var3185, var3186 = protoModule.readBuffer(p190, var3177)
				var3177 = var3186
				var3176.kind = {
					type = "literal",
					value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.decode(var3185)
				}
			elseif var3182 == 2 then
				local _ = nil
				local var3187, var3188 = protoModule.readBuffer(p190, var3177)
				var3177 = var3188
				var3176.kind = { type = "binding_path", value = buffer.tostring(var3187) }
			else
				local _ = nil
				local var3189, var3190 = protoModule.readVarInt(p190, var3177)
				var3177 = var3190 + var3189
			end
		elseif var3178 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3191, var3192 = protoModule.readFixed32(p190, var3177)
			local _ = var3191
			var3177 = var3192
		elseif var3178 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3193, var3194 = protoModule.readFixed64(p190, var3177)
			local _ = var3193
			var3177 = var3194
		else
			error("Unsupported wire type: " .. var3178)
		end
	end
	return var3176
end

function t_97:jsonEncode() --[[ line: 18906 ]]
	local t = {}
	
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

function t_97:jsonDecode() --[[ line: 18922 ]]
	-- upvalues: t_97 (ref), t (ref)
	local var3196 = t_97.new()
	
	if self.literal ~= nil then
		var3196.kind = {
			type = "literal",
			value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3196.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3196.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3196
end

t_97.descriptor = {
	name = "LaunchExperienceAction_ExperienceJoinData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceJoinData"
}
t.LaunchExperienceAction_ExperienceJoinData = t_97
typeRegistryModule.default:register(t.LaunchExperienceAction_ExperienceJoinData)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p191) --[[ line: 18962 ]]
	-- upvalues: t_98 (ref)
	return setmetatable({
		launch_data = if p191 == nil or p191.launch_data == nil then nil else p191.launch_data,
		event_id = if p191 == nil or p191.event_id == nil then nil else p191.event_id
	}, t_98)
end

function t_98:encode() --[[ line: 18974 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3198 = 0
	
	if self.launch_data ~= nil then
		local var3199 = self.launch_data:encode()
		local var3200, var3201 = protoModule.writeTag(buff, var3198, 1, protoModule.wireTypes.lengthDelimited)
		var3200, var3201 = protoModule.writeBuffer(var3200, var3201, var3199, buffer.len(var3199))
		buff = var3200
		var3198 = var3201
	end
	if self.event_id ~= nil then
		local var3202 = self.event_id:encode()
		local var3203, var3204 = protoModule.writeTag(buff, var3198, 2, protoModule.wireTypes.lengthDelimited)
		var3203, var3204 = protoModule.writeBuffer(var3203, var3204, var3202, buffer.len(var3202))
		buff = var3203
		var3198 = var3204
	end
	local buff_1 = buffer.create(var3198)
	buffer.copy(buff_1, 0, buff, 0, var3198)
	
	return buff_1
end

function t_98.decode(p192) --[[ line: 18997 ]]
	-- upvalues: t_98 (ref), protoModule (ref), propTypesModule (ref)
	local var3206 = t_98.new()
	local var3207 = 0
	while var3207 < buffer.len(p192) do
		local _ = nil
		local var3208 = nil
		local var3209, var3210, var3211 = protoModule.readTag(p192, var3207)
		local var3212 = var3209
		var3208 = var3210
		var3207 = var3211
		
		if var3208 == protoModule.wireTypes.varint then
			local _ = nil
			local var3213, var3214 = protoModule.readVarInt(p192, var3207)
			local _ = var3213
			var3207 = var3214
			continue
		end
		if var3208 == protoModule.wireTypes.lengthDelimited then
			if var3212 == 1 then
				local _ = nil
				local var3215, var3216 = protoModule.readBuffer(p192, var3207)
				var3207 = var3216
				var3206.launch_data = propTypesModule.StringProp.decode(var3215)
			elseif var3212 == 2 then
				local _ = nil
				local var3217, var3218 = protoModule.readBuffer(p192, var3207)
				var3207 = var3218
				var3206.event_id = propTypesModule.StringProp.decode(var3217)
			else
				local _ = nil
				local var3219, var3220 = protoModule.readVarInt(p192, var3207)
				var3207 = var3220 + var3219
			end
		elseif var3208 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3221, var3222 = protoModule.readFixed32(p192, var3207)
			local _ = var3221
			var3207 = var3222
		elseif var3208 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3223, var3224 = protoModule.readFixed64(p192, var3207)
			local _ = var3223
			var3207 = var3224
		else
			error("Unsupported wire type: " .. var3208)
		end
	end
	return var3206
end

function t_98:jsonEncode() --[[ line: 19047 ]]
	local t = {}
	
	if self.launch_data ~= nil then
		t.launchData = self.launch_data:jsonEncode()
	end
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_98:jsonDecode() --[[ line: 19063 ]]
	-- upvalues: t_98 (ref), propTypesModule (ref)
	local var3226 = t_98.new()
	
	if self.launch_data ~= nil then
		var3226.launch_data = propTypesModule.StringProp.jsonDecode(self.launch_data)
	end
	if self.launchData ~= nil then
		var3226.launch_data = propTypesModule.StringProp.jsonDecode(self.launchData)
	end
	if self.event_id ~= nil then
		var3226.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var3226.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var3226
end

t_98.descriptor = {
	name = "LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceJoinDataLiteral"
}
t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral = t_98
typeRegistryModule.default:register(t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p193) --[[ line: 19103 ]]
	-- upvalues: t_99 (ref)
	return setmetatable({
		place_id = if p193 == nil or p193.place_id == nil then nil else p193.place_id,
		universe_id = if p193 == nil or p193.universe_id == nil then nil else p193.universe_id,
		launch_source = if p193 == nil or p193.launch_source == nil then nil else p193.launch_source,
		experience_join_data = if p193 == nil or p193.experience_join_data == nil then nil else p193.experience_join_data
	}, t_99)
end

function t_99:encode() --[[ line: 19116 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3228 = 0
	
	if self.place_id ~= nil then
		local var3229 = self.place_id:encode()
		local var3230, var3231 = protoModule.writeTag(buff, var3228, 1, protoModule.wireTypes.lengthDelimited)
		var3230, var3231 = protoModule.writeBuffer(var3230, var3231, var3229, buffer.len(var3229))
		buff = var3230
		var3228 = var3231
	end
	if self.universe_id ~= nil then
		local var3232 = self.universe_id:encode()
		local var3233, var3234 = protoModule.writeTag(buff, var3228, 2, protoModule.wireTypes.lengthDelimited)
		var3233, var3234 = protoModule.writeBuffer(var3233, var3234, var3232, buffer.len(var3232))
		buff = var3233
		var3228 = var3234
	end
	if self.launch_source ~= nil then
		local var3235 = self.launch_source:encode()
		local var3236, var3237 = protoModule.writeTag(buff, var3228, 3, protoModule.wireTypes.lengthDelimited)
		var3236, var3237 = protoModule.writeBuffer(var3236, var3237, var3235, buffer.len(var3235))
		buff = var3236
		var3228 = var3237
	end
	if self.experience_join_data ~= nil then
		local var3238 = self.experience_join_data:encode()
		local var3239, var3240 = protoModule.writeTag(buff, var3228, 4, protoModule.wireTypes.lengthDelimited)
		var3239, var3240 = protoModule.writeBuffer(var3239, var3240, var3238, buffer.len(var3238))
		buff = var3239
		var3228 = var3240
	end
	local buff_1 = buffer.create(var3228)
	buffer.copy(buff_1, 0, buff, 0, var3228)
	
	return buff_1
end

function t_99.decode(p194) --[[ line: 19149 ]]
	-- upvalues: t_99 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var3242 = t_99.new()
	local var3243 = 0
	while var3243 < buffer.len(p194) do
		local _ = nil
		local var3244 = nil
		local var3245, var3246, var3247 = protoModule.readTag(p194, var3243)
		local var3248 = var3245
		var3244 = var3246
		var3243 = var3247
		
		if var3244 == protoModule.wireTypes.varint then
			local _ = nil
			local var3249, var3250 = protoModule.readVarInt(p194, var3243)
			local _ = var3249
			var3243 = var3250
			continue
		end
		if var3244 == protoModule.wireTypes.lengthDelimited then
			if var3248 == 1 then
				local _ = nil
				local var3251, var3252 = protoModule.readBuffer(p194, var3243)
				var3243 = var3252
				var3242.place_id = propTypesModule.StringProp.decode(var3251)
			elseif var3248 == 2 then
				local _ = nil
				local var3253, var3254 = protoModule.readBuffer(p194, var3243)
				var3243 = var3254
				var3242.universe_id = propTypesModule.StringProp.decode(var3253)
			elseif var3248 == 3 then
				local _ = nil
				local var3255, var3256 = protoModule.readBuffer(p194, var3243)
				var3243 = var3256
				var3242.launch_source = propTypesModule.StringProp.decode(var3255)
			elseif var3248 == 4 then
				local _ = nil
				local var3257, var3258 = protoModule.readBuffer(p194, var3243)
				var3243 = var3258
				var3242.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.decode(var3257)
			else
				local _ = nil
				local var3259, var3260 = protoModule.readVarInt(p194, var3243)
				var3243 = var3260 + var3259
			end
		elseif var3244 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3261, var3262 = protoModule.readFixed32(p194, var3243)
			local _ = var3261
			var3243 = var3262
		elseif var3244 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3263, var3264 = protoModule.readFixed64(p194, var3243)
			local _ = var3263
			var3243 = var3264
		else
			error("Unsupported wire type: " .. var3244)
		end
	end
	return var3242
end

function t_99:jsonEncode() --[[ line: 19207 ]]
	local t = {}
	
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.launch_source ~= nil then
		t.launchSource = self.launch_source:jsonEncode()
	end
	if self.experience_join_data ~= nil then
		t.experienceJoinData = self.experience_join_data:jsonEncode()
	end
	return t
end

function t_99:jsonDecode() --[[ line: 19229 ]]
	-- upvalues: t_99 (ref), propTypesModule (ref), t (ref)
	local var3266 = t_99.new()
	
	if self.place_id ~= nil then
		var3266.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var3266.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var3266.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3266.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.launch_source ~= nil then
		var3266.launch_source = propTypesModule.StringProp.jsonDecode(self.launch_source)
	end
	if self.launchSource ~= nil then
		var3266.launch_source = propTypesModule.StringProp.jsonDecode(self.launchSource)
	end
	if self.experience_join_data ~= nil then
		var3266.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experience_join_data)
	end
	if self.experienceJoinData ~= nil then
		var3266.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experienceJoinData)
	end
	return var3266
end

t_99.descriptor = {
	name = "LaunchExperienceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LaunchExperienceAction_Params = t_99
typeRegistryModule.default:register(t.LaunchExperienceAction_Params)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p195) --[[ line: 19286 ]]
	-- upvalues: t (ref), t_100 (ref)
	return setmetatable({
		action_type = if p195 == nil or p195.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p195.action_type,
		action_params = if p195 == nil or p195.action_params == nil then nil else p195.action_params
	}, t_100)
end

function t_100:encode() --[[ line: 19297 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3268 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3269, var3270 = protoModule.writeTag(buff, var3268, 1, protoModule.wireTypes.varint)
		var3269, var3270 = protoModule.writeVarInt(var3269, var3270, t.ActionType.toNumber(self.action_type))
		buff = var3269
		var3268 = var3270
	end
	if self.action_params ~= nil then
		local var3271 = self.action_params:encode()
		local var3272, var3273 = protoModule.writeTag(buff, var3268, 2, protoModule.wireTypes.lengthDelimited)
		var3272, var3273 = protoModule.writeBuffer(var3272, var3273, var3271, buffer.len(var3271))
		buff = var3272
		var3268 = var3273
	end
	local buff_1 = buffer.create(var3268)
	buffer.copy(buff_1, 0, buff, 0, var3268)
	
	return buff_1
end

function t_100.decode(p196) --[[ line: 19323 ]]
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var3275 = t_100.new()
	local var3276 = 0
	while var3276 < buffer.len(p196) do
		local _ = nil
		local var3277 = nil
		local var3278, var3279, var3280 = protoModule.readTag(p196, var3276)
		local var3281 = var3278
		var3277 = var3279
		var3276 = var3280
		
		if var3277 == protoModule.wireTypes.varint then
			if var3281 == 1 then
				local _ = nil
				local var3282, var3283 = protoModule.readVarIntI32(p196, var3276)
				local var3284 = var3282
				var3276 = var3283
				var3275.action_type = t.ActionType.fromNumber(var3284) or var3284
			else
				local _ = nil
				local var3285, var3286 = protoModule.readVarInt(p196, var3276)
				local _ = var3285
				var3276 = var3286
			end
		end
		if var3277 == protoModule.wireTypes.lengthDelimited then
			if var3281 == 2 then
				local _ = nil
				local var3287, var3288 = protoModule.readBuffer(p196, var3276)
				var3276 = var3288
				var3275.action_params = t.ToggleExperienceFavoriteAction_Params.decode(var3287)
			else
				local _ = nil
				local var3289, var3290 = protoModule.readVarInt(p196, var3276)
				var3276 = var3290 + var3289
			end
		elseif var3277 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3291, var3292 = protoModule.readFixed32(p196, var3276)
			local _ = var3291
			var3276 = var3292
		elseif var3277 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3293, var3294 = protoModule.readFixed64(p196, var3276)
			local _ = var3293
			var3276 = var3294
		else
			error("Unsupported wire type: " .. var3277)
		end
	end
	return var3275
end

function t_100:jsonEncode() --[[ line: 19371 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_100:jsonDecode() --[[ line: 19393 ]]
	-- upvalues: t_100 (ref), t (ref)
	local var3296 = t_100.new()
	
	if self.action_type ~= nil then
		var3296.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3296.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3296.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3296.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.actionParams)
	end
	return var3296
end

t_100.descriptor = {
	name = "ToggleExperienceFavoriteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceFavoriteAction"
}
t.ToggleExperienceFavoriteAction = t_100
typeRegistryModule.default:register(t.ToggleExperienceFavoriteAction)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p197) --[[ line: 19433 ]]
	-- upvalues: t_101 (ref)
	return setmetatable({
		universe_id = if p197 == nil or p197.universe_id == nil then nil else p197.universe_id,
		place_id = if p197 == nil or p197.place_id == nil then nil else p197.place_id,
		ctx = if p197 == nil or p197.ctx == nil then nil else p197.ctx
	}, t_101)
end

function t_101:encode() --[[ line: 19443 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3298 = 0
	
	if self.universe_id ~= nil then
		local var3299 = self.universe_id:encode()
		local var3300, var3301 = protoModule.writeTag(buff, var3298, 1, protoModule.wireTypes.lengthDelimited)
		var3300, var3301 = protoModule.writeBuffer(var3300, var3301, var3299, buffer.len(var3299))
		buff = var3300
		var3298 = var3301
	end
	if self.place_id ~= nil then
		local var3302 = self.place_id:encode()
		local var3303, var3304 = protoModule.writeTag(buff, var3298, 2, protoModule.wireTypes.lengthDelimited)
		var3303, var3304 = protoModule.writeBuffer(var3303, var3304, var3302, buffer.len(var3302))
		buff = var3303
		var3298 = var3304
	end
	if self.ctx ~= nil then
		local var3305 = self.ctx:encode()
		local var3306, var3307 = protoModule.writeTag(buff, var3298, 3, protoModule.wireTypes.lengthDelimited)
		var3306, var3307 = protoModule.writeBuffer(var3306, var3307, var3305, buffer.len(var3305))
		buff = var3306
		var3298 = var3307
	end
	local buff_1 = buffer.create(var3298)
	buffer.copy(buff_1, 0, buff, 0, var3298)
	
	return buff_1
end

function t_101.decode(p198) --[[ line: 19470 ]]
	-- upvalues: t_101 (ref), protoModule (ref), propTypesModule (ref)
	local var3309 = t_101.new()
	local var3310 = 0
	while var3310 < buffer.len(p198) do
		local _ = nil
		local var3311 = nil
		local var3312, var3313, var3314 = protoModule.readTag(p198, var3310)
		local var3315 = var3312
		var3311 = var3313
		var3310 = var3314
		
		if var3311 == protoModule.wireTypes.varint then
			local _ = nil
			local var3316, var3317 = protoModule.readVarInt(p198, var3310)
			local _ = var3316
			var3310 = var3317
			continue
		end
		if var3311 == protoModule.wireTypes.lengthDelimited then
			if var3315 == 1 then
				local _ = nil
				local var3318, var3319 = protoModule.readBuffer(p198, var3310)
				var3310 = var3319
				var3309.universe_id = propTypesModule.StringProp.decode(var3318)
			elseif var3315 == 2 then
				local _ = nil
				local var3320, var3321 = protoModule.readBuffer(p198, var3310)
				var3310 = var3321
				var3309.place_id = propTypesModule.StringProp.decode(var3320)
			elseif var3315 == 3 then
				local _ = nil
				local var3322, var3323 = protoModule.readBuffer(p198, var3310)
				var3310 = var3323
				var3309.ctx = propTypesModule.StringProp.decode(var3322)
			else
				local _ = nil
				local var3324, var3325 = protoModule.readVarInt(p198, var3310)
				var3310 = var3325 + var3324
			end
		elseif var3311 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3326, var3327 = protoModule.readFixed32(p198, var3310)
			local _ = var3326
			var3310 = var3327
		elseif var3311 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3328, var3329 = protoModule.readFixed64(p198, var3310)
			local _ = var3328
			var3310 = var3329
		else
			error("Unsupported wire type: " .. var3311)
		end
	end
	return var3309
end

function t_101:jsonEncode() --[[ line: 19523 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	if self.ctx ~= nil then
		t.ctx = self.ctx:jsonEncode()
	end
	return t
end

function t_101:jsonDecode() --[[ line: 19541 ]]
	-- upvalues: t_101 (ref), propTypesModule (ref)
	local var3331 = t_101.new()
	
	if self.universe_id ~= nil then
		var3331.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3331.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var3331.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var3331.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		var3331.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var3331
end

t_101.descriptor = {
	name = "ToggleExperienceFavoriteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceFavoriteAction_Params = t_101
typeRegistryModule.default:register(t.ToggleExperienceFavoriteAction_Params)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p199) --[[ line: 19584 ]]
	-- upvalues: t (ref), t_102 (ref)
	return setmetatable({
		action_type = if p199 == nil or p199.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p199.action_type,
		action_params = if p199 == nil or p199.action_params == nil then nil else p199.action_params
	}, t_102)
end

function t_102:encode() --[[ line: 19595 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3333 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3334, var3335 = protoModule.writeTag(buff, var3333, 1, protoModule.wireTypes.varint)
		var3334, var3335 = protoModule.writeVarInt(var3334, var3335, t.ActionType.toNumber(self.action_type))
		buff = var3334
		var3333 = var3335
	end
	if self.action_params ~= nil then
		local var3336 = self.action_params:encode()
		local var3337, var3338 = protoModule.writeTag(buff, var3333, 2, protoModule.wireTypes.lengthDelimited)
		var3337, var3338 = protoModule.writeBuffer(var3337, var3338, var3336, buffer.len(var3336))
		buff = var3337
		var3333 = var3338
	end
	local buff_1 = buffer.create(var3333)
	buffer.copy(buff_1, 0, buff, 0, var3333)
	
	return buff_1
end

function t_102.decode(p200) --[[ line: 19621 ]]
	-- upvalues: t_102 (ref), protoModule (ref), t (ref)
	local var3340 = t_102.new()
	local var3341 = 0
	while var3341 < buffer.len(p200) do
		local _ = nil
		local var3342 = nil
		local var3343, var3344, var3345 = protoModule.readTag(p200, var3341)
		local var3346 = var3343
		var3342 = var3344
		var3341 = var3345
		
		if var3342 == protoModule.wireTypes.varint then
			if var3346 == 1 then
				local _ = nil
				local var3347, var3348 = protoModule.readVarIntI32(p200, var3341)
				local var3349 = var3347
				var3341 = var3348
				var3340.action_type = t.ActionType.fromNumber(var3349) or var3349
			else
				local _ = nil
				local var3350, var3351 = protoModule.readVarInt(p200, var3341)
				local _ = var3350
				var3341 = var3351
			end
		end
		if var3342 == protoModule.wireTypes.lengthDelimited then
			if var3346 == 2 then
				local _ = nil
				local var3352, var3353 = protoModule.readBuffer(p200, var3341)
				var3341 = var3353
				var3340.action_params = t.ToggleExperienceFollowAction_Params.decode(var3352)
			else
				local _ = nil
				local var3354, var3355 = protoModule.readVarInt(p200, var3341)
				var3341 = var3355 + var3354
			end
		elseif var3342 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3356, var3357 = protoModule.readFixed32(p200, var3341)
			local _ = var3356
			var3341 = var3357
		elseif var3342 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3358, var3359 = protoModule.readFixed64(p200, var3341)
			local _ = var3358
			var3341 = var3359
		else
			error("Unsupported wire type: " .. var3342)
		end
	end
	return var3340
end

function t_102:jsonEncode() --[[ line: 19669 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_102:jsonDecode() --[[ line: 19691 ]]
	-- upvalues: t_102 (ref), t (ref)
	local var3361 = t_102.new()
	
	if self.action_type ~= nil then
		var3361.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3361.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3361.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3361.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.actionParams)
	end
	return var3361
end

t_102.descriptor = {
	name = "ToggleExperienceFollowAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceFollowAction"
}
t.ToggleExperienceFollowAction = t_102
typeRegistryModule.default:register(t.ToggleExperienceFollowAction)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p201) --[[ line: 19731 ]]
	-- upvalues: t_103 (ref)
	return setmetatable({
		universe_id = if p201 == nil or p201.universe_id == nil then nil else p201.universe_id,
		game_name = if p201 == nil or p201.game_name == nil then nil else p201.game_name,
		ctx = if p201 == nil or p201.ctx == nil then nil else p201.ctx
	}, t_103)
end

function t_103:encode() --[[ line: 19741 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3363 = 0
	
	if self.universe_id ~= nil then
		local var3364 = self.universe_id:encode()
		local var3365, var3366 = protoModule.writeTag(buff, var3363, 1, protoModule.wireTypes.lengthDelimited)
		var3365, var3366 = protoModule.writeBuffer(var3365, var3366, var3364, buffer.len(var3364))
		buff = var3365
		var3363 = var3366
	end
	if self.game_name ~= nil then
		local var3367 = self.game_name:encode()
		local var3368, var3369 = protoModule.writeTag(buff, var3363, 2, protoModule.wireTypes.lengthDelimited)
		var3368, var3369 = protoModule.writeBuffer(var3368, var3369, var3367, buffer.len(var3367))
		buff = var3368
		var3363 = var3369
	end
	if self.ctx ~= nil then
		local var3370 = self.ctx:encode()
		local var3371, var3372 = protoModule.writeTag(buff, var3363, 3, protoModule.wireTypes.lengthDelimited)
		var3371, var3372 = protoModule.writeBuffer(var3371, var3372, var3370, buffer.len(var3370))
		buff = var3371
		var3363 = var3372
	end
	local buff_1 = buffer.create(var3363)
	buffer.copy(buff_1, 0, buff, 0, var3363)
	
	return buff_1
end

function t_103.decode(p202) --[[ line: 19768 ]]
	-- upvalues: t_103 (ref), protoModule (ref), propTypesModule (ref)
	local var3374 = t_103.new()
	local var3375 = 0
	while var3375 < buffer.len(p202) do
		local _ = nil
		local var3376 = nil
		local var3377, var3378, var3379 = protoModule.readTag(p202, var3375)
		local var3380 = var3377
		var3376 = var3378
		var3375 = var3379
		
		if var3376 == protoModule.wireTypes.varint then
			local _ = nil
			local var3381, var3382 = protoModule.readVarInt(p202, var3375)
			local _ = var3381
			var3375 = var3382
			continue
		end
		if var3376 == protoModule.wireTypes.lengthDelimited then
			if var3380 == 1 then
				local _ = nil
				local var3383, var3384 = protoModule.readBuffer(p202, var3375)
				var3375 = var3384
				var3374.universe_id = propTypesModule.StringProp.decode(var3383)
			elseif var3380 == 2 then
				local _ = nil
				local var3385, var3386 = protoModule.readBuffer(p202, var3375)
				var3375 = var3386
				var3374.game_name = propTypesModule.StringProp.decode(var3385)
			elseif var3380 == 3 then
				local _ = nil
				local var3387, var3388 = protoModule.readBuffer(p202, var3375)
				var3375 = var3388
				var3374.ctx = propTypesModule.StringProp.decode(var3387)
			else
				local _ = nil
				local var3389, var3390 = protoModule.readVarInt(p202, var3375)
				var3375 = var3390 + var3389
			end
		elseif var3376 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3391, var3392 = protoModule.readFixed32(p202, var3375)
			local _ = var3391
			var3375 = var3392
		elseif var3376 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3393, var3394 = protoModule.readFixed64(p202, var3375)
			local _ = var3393
			var3375 = var3394
		else
			error("Unsupported wire type: " .. var3376)
		end
	end
	return var3374
end

function t_103:jsonEncode() --[[ line: 19821 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.game_name ~= nil then
		t.gameName = self.game_name:jsonEncode()
	end
	if self.ctx ~= nil then
		t.ctx = self.ctx:jsonEncode()
	end
	return t
end

function t_103:jsonDecode() --[[ line: 19839 ]]
	-- upvalues: t_103 (ref), propTypesModule (ref)
	local var3396 = t_103.new()
	
	if self.universe_id ~= nil then
		var3396.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3396.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.game_name ~= nil then
		var3396.game_name = propTypesModule.StringProp.jsonDecode(self.game_name)
	end
	if self.gameName ~= nil then
		var3396.game_name = propTypesModule.StringProp.jsonDecode(self.gameName)
	end
	if self.ctx ~= nil then
		var3396.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var3396
end

t_103.descriptor = {
	name = "ToggleExperienceFollowAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceFollowAction_Params = t_103
typeRegistryModule.default:register(t.ToggleExperienceFollowAction_Params)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p203) --[[ line: 19882 ]]
	-- upvalues: t (ref), t_104 (ref)
	return setmetatable({
		action_type = if p203 == nil or p203.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p203.action_type,
		action_params = if p203 == nil or p203.action_params == nil then nil else p203.action_params
	}, t_104)
end

function t_104:encode() --[[ line: 19893 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3398 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3399, var3400 = protoModule.writeTag(buff, var3398, 1, protoModule.wireTypes.varint)
		var3399, var3400 = protoModule.writeVarInt(var3399, var3400, t.ActionType.toNumber(self.action_type))
		buff = var3399
		var3398 = var3400
	end
	if self.action_params ~= nil then
		local var3401 = self.action_params:encode()
		local var3402, var3403 = protoModule.writeTag(buff, var3398, 2, protoModule.wireTypes.lengthDelimited)
		var3402, var3403 = protoModule.writeBuffer(var3402, var3403, var3401, buffer.len(var3401))
		buff = var3402
		var3398 = var3403
	end
	local buff_1 = buffer.create(var3398)
	buffer.copy(buff_1, 0, buff, 0, var3398)
	
	return buff_1
end

function t_104.decode(p204) --[[ line: 19919 ]]
	-- upvalues: t_104 (ref), protoModule (ref), t (ref)
	local var3405 = t_104.new()
	local var3406 = 0
	while var3406 < buffer.len(p204) do
		local _ = nil
		local var3407 = nil
		local var3408, var3409, var3410 = protoModule.readTag(p204, var3406)
		local var3411 = var3408
		var3407 = var3409
		var3406 = var3410
		
		if var3407 == protoModule.wireTypes.varint then
			if var3411 == 1 then
				local _ = nil
				local var3412, var3413 = protoModule.readVarIntI32(p204, var3406)
				local var3414 = var3412
				var3406 = var3413
				var3405.action_type = t.ActionType.fromNumber(var3414) or var3414
			else
				local _ = nil
				local var3415, var3416 = protoModule.readVarInt(p204, var3406)
				local _ = var3415
				var3406 = var3416
			end
		end
		if var3407 == protoModule.wireTypes.lengthDelimited then
			if var3411 == 2 then
				local _ = nil
				local var3417, var3418 = protoModule.readBuffer(p204, var3406)
				var3406 = var3418
				var3405.action_params = t.ToggleExperienceVoteAction_Params.decode(var3417)
			else
				local _ = nil
				local var3419, var3420 = protoModule.readVarInt(p204, var3406)
				var3406 = var3420 + var3419
			end
		elseif var3407 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3421, var3422 = protoModule.readFixed32(p204, var3406)
			local _ = var3421
			var3406 = var3422
		elseif var3407 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3423, var3424 = protoModule.readFixed64(p204, var3406)
			local _ = var3423
			var3406 = var3424
		else
			error("Unsupported wire type: " .. var3407)
		end
	end
	return var3405
end

function t_104:jsonEncode() --[[ line: 19967 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_104:jsonDecode() --[[ line: 19989 ]]
	-- upvalues: t_104 (ref), t (ref)
	local var3426 = t_104.new()
	
	if self.action_type ~= nil then
		var3426.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3426.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3426.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3426.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.actionParams)
	end
	return var3426
end

t_104.descriptor = {
	name = "ToggleExperienceVoteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceVoteAction"
}
t.ToggleExperienceVoteAction = t_104
typeRegistryModule.default:register(t.ToggleExperienceVoteAction)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p205) --[[ line: 20029 ]]
	-- upvalues: t_105 (ref)
	return setmetatable({
		universe_id = if p205 == nil or p205.universe_id == nil then nil else p205.universe_id,
		vote_direction = if p205 == nil or p205.vote_direction == nil then nil else p205.vote_direction,
		place_id = if p205 == nil or p205.place_id == nil then nil else p205.place_id,
		ctx = if p205 == nil or p205.ctx == nil then nil else p205.ctx
	}, t_105)
end

function t_105:encode() --[[ line: 20040 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3428 = 0
	
	if self.universe_id ~= nil then
		local var3429 = self.universe_id:encode()
		local var3430, var3431 = protoModule.writeTag(buff, var3428, 1, protoModule.wireTypes.lengthDelimited)
		var3430, var3431 = protoModule.writeBuffer(var3430, var3431, var3429, buffer.len(var3429))
		buff = var3430
		var3428 = var3431
	end
	if self.vote_direction ~= nil then
		local var3432 = self.vote_direction:encode()
		local var3433, var3434 = protoModule.writeTag(buff, var3428, 2, protoModule.wireTypes.lengthDelimited)
		var3433, var3434 = protoModule.writeBuffer(var3433, var3434, var3432, buffer.len(var3432))
		buff = var3433
		var3428 = var3434
	end
	if self.place_id ~= nil then
		local var3435 = self.place_id:encode()
		local var3436, var3437 = protoModule.writeTag(buff, var3428, 3, protoModule.wireTypes.lengthDelimited)
		var3436, var3437 = protoModule.writeBuffer(var3436, var3437, var3435, buffer.len(var3435))
		buff = var3436
		var3428 = var3437
	end
	if self.ctx ~= nil then
		local var3438 = self.ctx:encode()
		local var3439, var3440 = protoModule.writeTag(buff, var3428, 4, protoModule.wireTypes.lengthDelimited)
		var3439, var3440 = protoModule.writeBuffer(var3439, var3440, var3438, buffer.len(var3438))
		buff = var3439
		var3428 = var3440
	end
	local buff_1 = buffer.create(var3428)
	buffer.copy(buff_1, 0, buff, 0, var3428)
	
	return buff_1
end

function t_105.decode(p206) --[[ line: 20073 ]]
	-- upvalues: t_105 (ref), protoModule (ref), propTypesModule (ref)
	local var3442 = t_105.new()
	local var3443 = 0
	while var3443 < buffer.len(p206) do
		local _ = nil
		local var3444 = nil
		local var3445, var3446, var3447 = protoModule.readTag(p206, var3443)
		local var3448 = var3445
		var3444 = var3446
		var3443 = var3447
		
		if var3444 == protoModule.wireTypes.varint then
			local _ = nil
			local var3449, var3450 = protoModule.readVarInt(p206, var3443)
			local _ = var3449
			var3443 = var3450
			continue
		end
		if var3444 == protoModule.wireTypes.lengthDelimited then
			if var3448 == 1 then
				local _ = nil
				local var3451, var3452 = protoModule.readBuffer(p206, var3443)
				var3443 = var3452
				var3442.universe_id = propTypesModule.StringProp.decode(var3451)
			elseif var3448 == 2 then
				local _ = nil
				local var3453, var3454 = protoModule.readBuffer(p206, var3443)
				var3443 = var3454
				var3442.vote_direction = propTypesModule.BoolProp.decode(var3453)
			elseif var3448 == 3 then
				local _ = nil
				local var3455, var3456 = protoModule.readBuffer(p206, var3443)
				var3443 = var3456
				var3442.place_id = propTypesModule.StringProp.decode(var3455)
			elseif var3448 == 4 then
				local _ = nil
				local var3457, var3458 = protoModule.readBuffer(p206, var3443)
				var3443 = var3458
				var3442.ctx = propTypesModule.StringProp.decode(var3457)
			else
				local _ = nil
				local var3459, var3460 = protoModule.readVarInt(p206, var3443)
				var3443 = var3460 + var3459
			end
		elseif var3444 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3461, var3462 = protoModule.readFixed32(p206, var3443)
			local _ = var3461
			var3443 = var3462
		elseif var3444 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3463, var3464 = protoModule.readFixed64(p206, var3443)
			local _ = var3463
			var3443 = var3464
		else
			error("Unsupported wire type: " .. var3444)
		end
	end
	return var3442
end

function t_105:jsonEncode() --[[ line: 20131 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.vote_direction ~= nil then
		t.voteDirection = self.vote_direction:jsonEncode()
	end
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	if self.ctx ~= nil then
		t.ctx = self.ctx:jsonEncode()
	end
	return t
end

function t_105:jsonDecode() --[[ line: 20153 ]]
	-- upvalues: t_105 (ref), propTypesModule (ref)
	local var3466 = t_105.new()
	
	if self.universe_id ~= nil then
		var3466.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3466.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.vote_direction ~= nil then
		var3466.vote_direction = propTypesModule.BoolProp.jsonDecode(self.vote_direction)
	end
	if self.voteDirection ~= nil then
		var3466.vote_direction = propTypesModule.BoolProp.jsonDecode(self.voteDirection)
	end
	if self.place_id ~= nil then
		var3466.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var3466.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		var3466.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var3466
end

t_105.descriptor = {
	name = "ToggleExperienceVoteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceVoteAction_Params = t_105
typeRegistryModule.default:register(t.ToggleExperienceVoteAction_Params)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p207) --[[ line: 20206 ]]
	-- upvalues: t (ref), t_106 (ref)
	return setmetatable({
		action_type = if p207 == nil or p207.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p207.action_type,
		action_params = if p207 == nil or p207.action_params == nil then nil else p207.action_params
	}, t_106)
end

function t_106:encode() --[[ line: 20215 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3468 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3469, var3470 = protoModule.writeTag(buff, var3468, 1, protoModule.wireTypes.varint)
		var3469, var3470 = protoModule.writeVarInt(var3469, var3470, t.ActionType.toNumber(self.action_type))
		buff = var3469
		var3468 = var3470
	end
	if self.action_params ~= nil then
		local var3471 = self.action_params:encode()
		local var3472, var3473 = protoModule.writeTag(buff, var3468, 2, protoModule.wireTypes.lengthDelimited)
		var3472, var3473 = protoModule.writeBuffer(var3472, var3473, var3471, buffer.len(var3471))
		buff = var3472
		var3468 = var3473
	end
	local buff_1 = buffer.create(var3468)
	buffer.copy(buff_1, 0, buff, 0, var3468)
	
	return buff_1
end

function t_106.decode(p208) --[[ line: 20241 ]]
	-- upvalues: t_106 (ref), protoModule (ref), t (ref)
	local var3475 = t_106.new()
	local var3476 = 0
	while var3476 < buffer.len(p208) do
		local _ = nil
		local var3477 = nil
		local var3478, var3479, var3480 = protoModule.readTag(p208, var3476)
		local var3481 = var3478
		var3477 = var3479
		var3476 = var3480
		
		if var3477 == protoModule.wireTypes.varint then
			if var3481 == 1 then
				local _ = nil
				local var3482, var3483 = protoModule.readVarIntI32(p208, var3476)
				local var3484 = var3482
				var3476 = var3483
				var3475.action_type = t.ActionType.fromNumber(var3484) or var3484
			else
				local _ = nil
				local var3485, var3486 = protoModule.readVarInt(p208, var3476)
				local _ = var3485
				var3476 = var3486
			end
		end
		if var3477 == protoModule.wireTypes.lengthDelimited then
			if var3481 == 2 then
				local _ = nil
				local var3487, var3488 = protoModule.readBuffer(p208, var3476)
				var3476 = var3488
				var3475.action_params = t.OpenPurchasePromptAction_Params.decode(var3487)
			else
				local _ = nil
				local var3489, var3490 = protoModule.readVarInt(p208, var3476)
				var3476 = var3490 + var3489
			end
		elseif var3477 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3491, var3492 = protoModule.readFixed32(p208, var3476)
			local _ = var3491
			var3476 = var3492
		elseif var3477 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3493, var3494 = protoModule.readFixed64(p208, var3476)
			local _ = var3493
			var3476 = var3494
		else
			error("Unsupported wire type: " .. var3477)
		end
	end
	return var3475
end

function t_106:jsonEncode() --[[ line: 20289 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_106:jsonDecode() --[[ line: 20311 ]]
	-- upvalues: t_106 (ref), t (ref)
	local var3496 = t_106.new()
	
	if self.action_type ~= nil then
		var3496.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3496.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3496.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3496.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.actionParams)
	end
	return var3496
end

t_106.descriptor = {
	name = "OpenPurchasePromptAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenPurchasePromptAction"
}
t.OpenPurchasePromptAction = t_106
typeRegistryModule.default:register(t.OpenPurchasePromptAction)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p209) --[[ line: 20351 ]]
	-- upvalues: t_107 (ref)
	return setmetatable({
		kind = if p209 == nil or p209.kind == nil then nil else p209.kind
	}, t_107)
end

function t_107:encode() --[[ line: 20359 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3498 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3499 = self.kind.value:encode()
			local var3500, var3501 = protoModule.writeTag(buff, var3498, 1, protoModule.wireTypes.lengthDelimited)
			var3500, var3501 = protoModule.writeBuffer(var3500, var3501, var3499, buffer.len(var3499))
			buff = var3500
			var3498 = var3501
		elseif self.kind.type == "binding_path" then
			local var3502, var3503 = protoModule.writeTag(buff, var3498, 2, protoModule.wireTypes.lengthDelimited)
			var3502, var3503 = protoModule.writeString(var3502, var3503, self.kind.value)
			buff = var3502
			var3498 = var3503
		end
	end
	local buff_1 = buffer.create(var3498)
	buffer.copy(buff_1, 0, buff, 0, var3498)
	
	return buff_1
end

function t_107.decode(p210) --[[ line: 20379 ]]
	-- upvalues: t_107 (ref), protoModule (ref), t (ref)
	local var3505 = t_107.new()
	local var3506 = 0
	while var3506 < buffer.len(p210) do
		local _ = nil
		local var3507 = nil
		local var3508, var3509, var3510 = protoModule.readTag(p210, var3506)
		local var3511 = var3508
		var3507 = var3509
		var3506 = var3510
		
		if var3507 == protoModule.wireTypes.varint then
			local _ = nil
			local var3512, var3513 = protoModule.readVarInt(p210, var3506)
			local _ = var3512
			var3506 = var3513
			continue
		end
		if var3507 == protoModule.wireTypes.lengthDelimited then
			if var3511 == 1 then
				local _ = nil
				local var3514, var3515 = protoModule.readBuffer(p210, var3506)
				var3506 = var3515
				var3505.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.decode(var3514)
				}
			elseif var3511 == 2 then
				local _ = nil
				local var3516, var3517 = protoModule.readBuffer(p210, var3506)
				var3506 = var3517
				var3505.kind = { type = "binding_path", value = buffer.tostring(var3516) }
			else
				local _ = nil
				local var3518, var3519 = protoModule.readVarInt(p210, var3506)
				var3506 = var3519 + var3518
			end
		elseif var3507 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3520, var3521 = protoModule.readFixed32(p210, var3506)
			local _ = var3520
			var3506 = var3521
		elseif var3507 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3522, var3523 = protoModule.readFixed64(p210, var3506)
			local _ = var3522
			var3506 = var3523
		else
			error("Unsupported wire type: " .. var3507)
		end
	end
	return var3505
end

function t_107:jsonEncode() --[[ line: 20430 ]]
	local t = {}
	
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

function t_107:jsonDecode() --[[ line: 20444 ]]
	-- upvalues: t_107 (ref), t (ref)
	local var3525 = t_107.new()
	
	if self.literal ~= nil then
		var3525.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3525.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3525.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3525
end

t_107.descriptor = {
	name = "OpenPurchasePromptAction_ProductPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ProductPayload"
}
t.OpenPurchasePromptAction_ProductPayload = t_107
typeRegistryModule.default:register(t.OpenPurchasePromptAction_ProductPayload)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p211) --[[ line: 20484 ]]
	-- upvalues: t_108 (ref)
	return setmetatable({
		kind = if p211 == nil or p211.kind == nil then nil else p211.kind,
		id = if p211 == nil or p211.id == nil then nil else p211.id,
		subscription_id = if p211 == nil or p211.subscription_id == nil then nil else p211.subscription_id,
		universe_id = if p211 == nil or p211.universe_id == nil then nil else p211.universe_id,
		equip_if_purchased = if p211 == nil or p211.equip_if_purchased == nil then nil else p211.equip_if_purchased,
		name = if p211 == nil or p211.name == nil then nil else p211.name,
		expected_price = if p211 == nil or p211.expected_price == nil then nil else p211.expected_price,
		icon_image_asset_id = if p211 == nil or p211.icon_image_asset_id == nil then nil else p211.icon_image_asset_id,
		is_subscription_in_robux = if p211 == nil or p211.is_subscription_in_robux == nil then nil else p211.is_subscription_in_robux,
		display_price = if p211 == nil or p211.display_price == nil then nil else p211.display_price
	}, t_108)
end

function t_108:encode() --[[ line: 20510 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3527 = 0
	
	if self.kind ~= nil then
		local var3528 = self.kind:encode()
		local var3529, var3530 = protoModule.writeTag(buff, var3527, 1, protoModule.wireTypes.lengthDelimited)
		var3529, var3530 = protoModule.writeBuffer(var3529, var3530, var3528, buffer.len(var3528))
		buff = var3529
		var3527 = var3530
	end
	if self.id ~= nil then
		local var3531 = self.id:encode()
		local var3532, var3533 = protoModule.writeTag(buff, var3527, 2, protoModule.wireTypes.lengthDelimited)
		var3532, var3533 = protoModule.writeBuffer(var3532, var3533, var3531, buffer.len(var3531))
		buff = var3532
		var3527 = var3533
	end
	if self.subscription_id ~= nil then
		local var3534 = self.subscription_id:encode()
		local var3535, var3536 = protoModule.writeTag(buff, var3527, 3, protoModule.wireTypes.lengthDelimited)
		var3535, var3536 = protoModule.writeBuffer(var3535, var3536, var3534, buffer.len(var3534))
		buff = var3535
		var3527 = var3536
	end
	if self.universe_id ~= nil then
		local var3537 = self.universe_id:encode()
		local var3538, var3539 = protoModule.writeTag(buff, var3527, 4, protoModule.wireTypes.lengthDelimited)
		var3538, var3539 = protoModule.writeBuffer(var3538, var3539, var3537, buffer.len(var3537))
		buff = var3538
		var3527 = var3539
	end
	if self.equip_if_purchased ~= nil then
		local var3540 = self.equip_if_purchased:encode()
		local var3541, var3542 = protoModule.writeTag(buff, var3527, 5, protoModule.wireTypes.lengthDelimited)
		var3541, var3542 = protoModule.writeBuffer(var3541, var3542, var3540, buffer.len(var3540))
		buff = var3541
		var3527 = var3542
	end
	if self.name ~= nil then
		local var3543 = self.name:encode()
		local var3544, var3545 = protoModule.writeTag(buff, var3527, 6, protoModule.wireTypes.lengthDelimited)
		var3544, var3545 = protoModule.writeBuffer(var3544, var3545, var3543, buffer.len(var3543))
		buff = var3544
		var3527 = var3545
	end
	if self.expected_price ~= nil then
		local var3546 = self.expected_price:encode()
		local var3547, var3548 = protoModule.writeTag(buff, var3527, 7, protoModule.wireTypes.lengthDelimited)
		var3547, var3548 = protoModule.writeBuffer(var3547, var3548, var3546, buffer.len(var3546))
		buff = var3547
		var3527 = var3548
	end
	if self.icon_image_asset_id ~= nil then
		local var3549 = self.icon_image_asset_id:encode()
		local var3550, var3551 = protoModule.writeTag(buff, var3527, 8, protoModule.wireTypes.lengthDelimited)
		var3550, var3551 = protoModule.writeBuffer(var3550, var3551, var3549, buffer.len(var3549))
		buff = var3550
		var3527 = var3551
	end
	if self.is_subscription_in_robux ~= nil then
		local var3552 = self.is_subscription_in_robux:encode()
		local var3553, var3554 = protoModule.writeTag(buff, var3527, 9, protoModule.wireTypes.lengthDelimited)
		var3553, var3554 = protoModule.writeBuffer(var3553, var3554, var3552, buffer.len(var3552))
		buff = var3553
		var3527 = var3554
	end
	if self.display_price ~= nil then
		local var3555 = self.display_price:encode()
		local var3556, var3557 = protoModule.writeTag(buff, var3527, 10, protoModule.wireTypes.lengthDelimited)
		var3556, var3557 = protoModule.writeBuffer(var3556, var3557, var3555, buffer.len(var3555))
		buff = var3556
		var3527 = var3557
	end
	local buff_1 = buffer.create(var3527)
	buffer.copy(buff_1, 0, buff, 0, var3527)
	
	return buff_1
end

function t_108.decode(p212) --[[ line: 20581 ]]
	-- upvalues: t_108 (ref), protoModule (ref), propTypesModule (ref)
	local var3559 = t_108.new()
	local var3560 = 0
	while var3560 < buffer.len(p212) do
		local _ = nil
		local var3561 = nil
		local var3562, var3563, var3564 = protoModule.readTag(p212, var3560)
		local var3565 = var3562
		var3561 = var3563
		var3560 = var3564
		
		if var3561 == protoModule.wireTypes.varint then
			local _ = nil
			local var3566, var3567 = protoModule.readVarInt(p212, var3560)
			local _ = var3566
			var3560 = var3567
			continue
		end
		if var3561 == protoModule.wireTypes.lengthDelimited then
			if var3565 == 1 then
				local _ = nil
				local var3568, var3569 = protoModule.readBuffer(p212, var3560)
				var3560 = var3569
				var3559.kind = propTypesModule.StringProp.decode(var3568)
			elseif var3565 == 2 then
				local _ = nil
				local var3570, var3571 = protoModule.readBuffer(p212, var3560)
				var3560 = var3571
				var3559.id = propTypesModule.StringProp.decode(var3570)
			elseif var3565 == 3 then
				local _ = nil
				local var3572, var3573 = protoModule.readBuffer(p212, var3560)
				var3560 = var3573
				var3559.subscription_id = propTypesModule.StringProp.decode(var3572)
			elseif var3565 == 4 then
				local _ = nil
				local var3574, var3575 = protoModule.readBuffer(p212, var3560)
				var3560 = var3575
				var3559.universe_id = propTypesModule.StringProp.decode(var3574)
			elseif var3565 == 5 then
				local _ = nil
				local var3576, var3577 = protoModule.readBuffer(p212, var3560)
				var3560 = var3577
				var3559.equip_if_purchased = propTypesModule.BoolProp.decode(var3576)
			elseif var3565 == 6 then
				local _ = nil
				local var3578, var3579 = protoModule.readBuffer(p212, var3560)
				var3560 = var3579
				var3559.name = propTypesModule.StringProp.decode(var3578)
			elseif var3565 == 7 then
				local _ = nil
				local var3580, var3581 = protoModule.readBuffer(p212, var3560)
				var3560 = var3581
				var3559.expected_price = propTypesModule.Int64Prop.decode(var3580)
			elseif var3565 == 8 then
				local _ = nil
				local var3582, var3583 = protoModule.readBuffer(p212, var3560)
				var3560 = var3583
				var3559.icon_image_asset_id = propTypesModule.Int64Prop.decode(var3582)
			elseif var3565 == 9 then
				local _ = nil
				local var3584, var3585 = protoModule.readBuffer(p212, var3560)
				var3560 = var3585
				var3559.is_subscription_in_robux = propTypesModule.BoolProp.decode(var3584)
			elseif var3565 == 10 then
				local _ = nil
				local var3586, var3587 = protoModule.readBuffer(p212, var3560)
				var3560 = var3587
				var3559.display_price = propTypesModule.StringProp.decode(var3586)
			else
				local _ = nil
				local var3588, var3589 = protoModule.readVarInt(p212, var3560)
				var3560 = var3589 + var3588
			end
		elseif var3561 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3590, var3591 = protoModule.readFixed32(p212, var3560)
			local _ = var3590
			var3560 = var3591
		elseif var3561 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3592, var3593 = protoModule.readFixed64(p212, var3560)
			local _ = var3592
			var3560 = var3593
		else
			error("Unsupported wire type: " .. var3561)
		end
	end
	return var3559
end

function t_108:jsonEncode() --[[ line: 20672 ]]
	local t = {}
	
	if self.kind ~= nil then
		t.kind = self.kind:jsonEncode()
	end
	if self.id ~= nil then
		t.id = self.id:jsonEncode()
	end
	if self.subscription_id ~= nil then
		t.subscriptionId = self.subscription_id:jsonEncode()
	end
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.equip_if_purchased ~= nil then
		t.equipIfPurchased = self.equip_if_purchased:jsonEncode()
	end
	if self.name ~= nil then
		t.name = self.name:jsonEncode()
	end
	if self.expected_price ~= nil then
		t.expectedPrice = self.expected_price:jsonEncode()
	end
	if self.icon_image_asset_id ~= nil then
		t.iconImageAssetId = self.icon_image_asset_id:jsonEncode()
	end
	if self.is_subscription_in_robux ~= nil then
		t.isSubscriptionInRobux = self.is_subscription_in_robux:jsonEncode()
	end
	if self.display_price ~= nil then
		t.displayPrice = self.display_price:jsonEncode()
	end
	return t
end

function t_108:jsonDecode() --[[ line: 20720 ]]
	-- upvalues: t_108 (ref), propTypesModule (ref)
	local var3595 = t_108.new()
	
	if self.kind ~= nil then
		var3595.kind = propTypesModule.StringProp.jsonDecode(self.kind)
	end
	if self.id ~= nil then
		var3595.id = propTypesModule.StringProp.jsonDecode(self.id)
	end
	if self.subscription_id ~= nil then
		var3595.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		var3595.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		var3595.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3595.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.equip_if_purchased ~= nil then
		var3595.equip_if_purchased = propTypesModule.BoolProp.jsonDecode(self.equip_if_purchased)
	end
	if self.equipIfPurchased ~= nil then
		var3595.equip_if_purchased = propTypesModule.BoolProp.jsonDecode(self.equipIfPurchased)
	end
	if self.name ~= nil then
		var3595.name = propTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.expected_price ~= nil then
		var3595.expected_price = propTypesModule.Int64Prop.jsonDecode(self.expected_price)
	end
	if self.expectedPrice ~= nil then
		var3595.expected_price = propTypesModule.Int64Prop.jsonDecode(self.expectedPrice)
	end
	if self.icon_image_asset_id ~= nil then
		var3595.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		var3595.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.is_subscription_in_robux ~= nil then
		var3595.is_subscription_in_robux = propTypesModule.BoolProp.jsonDecode(self.is_subscription_in_robux)
	end
	if self.isSubscriptionInRobux ~= nil then
		var3595.is_subscription_in_robux = propTypesModule.BoolProp.jsonDecode(self.isSubscriptionInRobux)
	end
	if self.display_price ~= nil then
		var3595.display_price = propTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		var3595.display_price = propTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	return var3595
end

t_108.descriptor = {
	name = "OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.ProductPayloadLiteral"
}
t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral = t_108
typeRegistryModule.default:register(t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p213) --[[ line: 20824 ]]
	-- upvalues: t_109 (ref)
	return setmetatable({
		kind = if p213 == nil or p213.kind == nil then nil else p213.kind
	}, t_109)
end

function t_109:encode() --[[ line: 20832 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3597 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3598 = self.kind.value:encode()
			local var3599, var3600 = protoModule.writeTag(buff, var3597, 1, protoModule.wireTypes.lengthDelimited)
			var3599, var3600 = protoModule.writeBuffer(var3599, var3600, var3598, buffer.len(var3598))
			buff = var3599
			var3597 = var3600
		elseif self.kind.type == "binding_path" then
			local var3601, var3602 = protoModule.writeTag(buff, var3597, 2, protoModule.wireTypes.lengthDelimited)
			var3601, var3602 = protoModule.writeString(var3601, var3602, self.kind.value)
			buff = var3601
			var3597 = var3602
		end
	end
	local buff_1 = buffer.create(var3597)
	buffer.copy(buff_1, 0, buff, 0, var3597)
	
	return buff_1
end

function t_109.decode(p214) --[[ line: 20852 ]]
	-- upvalues: t_109 (ref), protoModule (ref), t (ref)
	local var3604 = t_109.new()
	local var3605 = 0
	while var3605 < buffer.len(p214) do
		local _ = nil
		local var3606 = nil
		local var3607, var3608, var3609 = protoModule.readTag(p214, var3605)
		local var3610 = var3607
		var3606 = var3608
		var3605 = var3609
		
		if var3606 == protoModule.wireTypes.varint then
			local _ = nil
			local var3611, var3612 = protoModule.readVarInt(p214, var3605)
			local _ = var3611
			var3605 = var3612
			continue
		end
		if var3606 == protoModule.wireTypes.lengthDelimited then
			if var3610 == 1 then
				local _ = nil
				local var3613, var3614 = protoModule.readBuffer(p214, var3605)
				var3605 = var3614
				var3604.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.decode(var3613)
				}
			elseif var3610 == 2 then
				local _ = nil
				local var3615, var3616 = protoModule.readBuffer(p214, var3605)
				var3605 = var3616
				var3604.kind = { type = "binding_path", value = buffer.tostring(var3615) }
			else
				local _ = nil
				local var3617, var3618 = protoModule.readVarInt(p214, var3605)
				var3605 = var3618 + var3617
			end
		elseif var3606 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3619, var3620 = protoModule.readFixed32(p214, var3605)
			local _ = var3619
			var3605 = var3620
		elseif var3606 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3621, var3622 = protoModule.readFixed64(p214, var3605)
			local _ = var3621
			var3605 = var3622
		else
			error("Unsupported wire type: " .. var3606)
		end
	end
	return var3604
end

function t_109:jsonEncode() --[[ line: 20903 ]]
	local t = {}
	
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

function t_109:jsonDecode() --[[ line: 20917 ]]
	-- upvalues: t_109 (ref), t (ref)
	local var3624 = t_109.new()
	
	if self.literal ~= nil then
		var3624.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3624.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3624.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3624
end

t_109.descriptor = {
	name = "OpenPurchasePromptAction_DisplayInfo",
	fullName = "roblox.apppageplatform.shared.v1beta1.DisplayInfo"
}
t.OpenPurchasePromptAction_DisplayInfo = t_109
typeRegistryModule.default:register(t.OpenPurchasePromptAction_DisplayInfo)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p215) --[[ line: 20955 ]]
	-- upvalues: t_110 (ref)
	return setmetatable({
		product_name = if p215 == nil or p215.product_name == nil then nil else p215.product_name,
		description = if p215 == nil or p215.description == nil then nil else p215.description,
		image_url = if p215 == nil or p215.image_url == nil then nil else p215.image_url,
		price_in_robux = if p215 == nil or p215.price_in_robux == nil then nil else p215.price_in_robux,
		display_price = if p215 == nil or p215.display_price == nil then nil else p215.display_price,
		icon_image_asset_id = if p215 == nil or p215.icon_image_asset_id == nil then nil else p215.icon_image_asset_id,
		product_id = if p215 == nil or p215.product_id == nil then nil else p215.product_id,
		target_id = if p215 == nil or p215.target_id == nil then nil else p215.target_id,
		is_for_sale = if p215 == nil or p215.is_for_sale == nil then nil else p215.is_for_sale,
		product_type = if p215 == nil or p215.product_type == nil then nil else p215.product_type,
		base_price_in_robux = if p215 == nil or p215.base_price_in_robux == nil then nil else p215.base_price_in_robux,
		price_discount_details = if p215 == nil or p215.price_discount_details == nil then nil else p215.price_discount_details
	}, t_110)
end

function t_110:encode() --[[ line: 20983 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3626 = 0
	
	if self.product_name ~= nil then
		local var3627 = self.product_name:encode()
		local var3628, var3629 = protoModule.writeTag(buff, var3626, 1, protoModule.wireTypes.lengthDelimited)
		var3628, var3629 = protoModule.writeBuffer(var3628, var3629, var3627, buffer.len(var3627))
		buff = var3628
		var3626 = var3629
	end
	if self.description ~= nil then
		local var3630 = self.description:encode()
		local var3631, var3632 = protoModule.writeTag(buff, var3626, 2, protoModule.wireTypes.lengthDelimited)
		var3631, var3632 = protoModule.writeBuffer(var3631, var3632, var3630, buffer.len(var3630))
		buff = var3631
		var3626 = var3632
	end
	if self.image_url ~= nil then
		local var3633 = self.image_url:encode()
		local var3634, var3635 = protoModule.writeTag(buff, var3626, 3, protoModule.wireTypes.lengthDelimited)
		var3634, var3635 = protoModule.writeBuffer(var3634, var3635, var3633, buffer.len(var3633))
		buff = var3634
		var3626 = var3635
	end
	if self.price_in_robux ~= nil then
		local var3636 = self.price_in_robux:encode()
		local var3637, var3638 = protoModule.writeTag(buff, var3626, 4, protoModule.wireTypes.lengthDelimited)
		var3637, var3638 = protoModule.writeBuffer(var3637, var3638, var3636, buffer.len(var3636))
		buff = var3637
		var3626 = var3638
	end
	if self.display_price ~= nil then
		local var3639 = self.display_price:encode()
		local var3640, var3641 = protoModule.writeTag(buff, var3626, 5, protoModule.wireTypes.lengthDelimited)
		var3640, var3641 = protoModule.writeBuffer(var3640, var3641, var3639, buffer.len(var3639))
		buff = var3640
		var3626 = var3641
	end
	if self.icon_image_asset_id ~= nil then
		local var3642 = self.icon_image_asset_id:encode()
		local var3643, var3644 = protoModule.writeTag(buff, var3626, 6, protoModule.wireTypes.lengthDelimited)
		var3643, var3644 = protoModule.writeBuffer(var3643, var3644, var3642, buffer.len(var3642))
		buff = var3643
		var3626 = var3644
	end
	if self.product_id ~= nil then
		local var3645 = self.product_id:encode()
		local var3646, var3647 = protoModule.writeTag(buff, var3626, 7, protoModule.wireTypes.lengthDelimited)
		var3646, var3647 = protoModule.writeBuffer(var3646, var3647, var3645, buffer.len(var3645))
		buff = var3646
		var3626 = var3647
	end
	if self.target_id ~= nil then
		local var3648 = self.target_id:encode()
		local var3649, var3650 = protoModule.writeTag(buff, var3626, 8, protoModule.wireTypes.lengthDelimited)
		var3649, var3650 = protoModule.writeBuffer(var3649, var3650, var3648, buffer.len(var3648))
		buff = var3649
		var3626 = var3650
	end
	if self.is_for_sale ~= nil then
		local var3651 = self.is_for_sale:encode()
		local var3652, var3653 = protoModule.writeTag(buff, var3626, 9, protoModule.wireTypes.lengthDelimited)
		var3652, var3653 = protoModule.writeBuffer(var3652, var3653, var3651, buffer.len(var3651))
		buff = var3652
		var3626 = var3653
	end
	if self.product_type ~= nil then
		local var3654 = self.product_type:encode()
		local var3655, var3656 = protoModule.writeTag(buff, var3626, 10, protoModule.wireTypes.lengthDelimited)
		var3655, var3656 = protoModule.writeBuffer(var3655, var3656, var3654, buffer.len(var3654))
		buff = var3655
		var3626 = var3656
	end
	if self.base_price_in_robux ~= nil then
		local var3657 = self.base_price_in_robux:encode()
		local var3658, var3659 = protoModule.writeTag(buff, var3626, 11, protoModule.wireTypes.lengthDelimited)
		var3658, var3659 = protoModule.writeBuffer(var3658, var3659, var3657, buffer.len(var3657))
		buff = var3658
		var3626 = var3659
	end
	if self.price_discount_details ~= nil then
		local var3660 = self.price_discount_details:encode()
		local var3661, var3662 = protoModule.writeTag(buff, var3626, 12, protoModule.wireTypes.lengthDelimited)
		var3661, var3662 = protoModule.writeBuffer(var3661, var3662, var3660, buffer.len(var3660))
		buff = var3661
		var3626 = var3662
	end
	local buff_1 = buffer.create(var3626)
	buffer.copy(buff_1, 0, buff, 0, var3626)
	
	return buff_1
end

function t_110.decode(p216) --[[ line: 21066 ]]
	-- upvalues: t_110 (ref), protoModule (ref), propTypesModule (ref)
	local var3664 = t_110.new()
	local var3665 = 0
	while var3665 < buffer.len(p216) do
		local _ = nil
		local var3666 = nil
		local var3667, var3668, var3669 = protoModule.readTag(p216, var3665)
		local var3670 = var3667
		var3666 = var3668
		var3665 = var3669
		
		if var3666 == protoModule.wireTypes.varint then
			local _ = nil
			local var3671, var3672 = protoModule.readVarInt(p216, var3665)
			local _ = var3671
			var3665 = var3672
			continue
		end
		if var3666 == protoModule.wireTypes.lengthDelimited then
			if var3670 == 1 then
				local _ = nil
				local var3673, var3674 = protoModule.readBuffer(p216, var3665)
				var3665 = var3674
				var3664.product_name = propTypesModule.StringProp.decode(var3673)
			elseif var3670 == 2 then
				local _ = nil
				local var3675, var3676 = protoModule.readBuffer(p216, var3665)
				var3665 = var3676
				var3664.description = propTypesModule.StringProp.decode(var3675)
			elseif var3670 == 3 then
				local _ = nil
				local var3677, var3678 = protoModule.readBuffer(p216, var3665)
				var3665 = var3678
				var3664.image_url = propTypesModule.StringProp.decode(var3677)
			elseif var3670 == 4 then
				local _ = nil
				local var3679, var3680 = protoModule.readBuffer(p216, var3665)
				var3665 = var3680
				var3664.price_in_robux = propTypesModule.Int64Prop.decode(var3679)
			elseif var3670 == 5 then
				local _ = nil
				local var3681, var3682 = protoModule.readBuffer(p216, var3665)
				var3665 = var3682
				var3664.display_price = propTypesModule.StringProp.decode(var3681)
			elseif var3670 == 6 then
				local _ = nil
				local var3683, var3684 = protoModule.readBuffer(p216, var3665)
				var3665 = var3684
				var3664.icon_image_asset_id = propTypesModule.Int64Prop.decode(var3683)
			elseif var3670 == 7 then
				local _ = nil
				local var3685, var3686 = protoModule.readBuffer(p216, var3665)
				var3665 = var3686
				var3664.product_id = propTypesModule.Int64Prop.decode(var3685)
			elseif var3670 == 8 then
				local _ = nil
				local var3687, var3688 = protoModule.readBuffer(p216, var3665)
				var3665 = var3688
				var3664.target_id = propTypesModule.StringProp.decode(var3687)
			elseif var3670 == 9 then
				local _ = nil
				local var3689, var3690 = protoModule.readBuffer(p216, var3665)
				var3665 = var3690
				var3664.is_for_sale = propTypesModule.BoolProp.decode(var3689)
			elseif var3670 == 10 then
				local _ = nil
				local var3691, var3692 = protoModule.readBuffer(p216, var3665)
				var3665 = var3692
				var3664.product_type = propTypesModule.StringProp.decode(var3691)
			elseif var3670 == 11 then
				local _ = nil
				local var3693, var3694 = protoModule.readBuffer(p216, var3665)
				var3665 = var3694
				var3664.base_price_in_robux = propTypesModule.Int64Prop.decode(var3693)
			elseif var3670 == 12 then
				local _ = nil
				local var3695, var3696 = protoModule.readBuffer(p216, var3665)
				var3665 = var3696
				var3664.price_discount_details = propTypesModule.ArrayOfStructProp.decode(var3695)
			else
				local _ = nil
				local var3697, var3698 = protoModule.readVarInt(p216, var3665)
				var3665 = var3698 + var3697
			end
		elseif var3666 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3699, var3700 = protoModule.readFixed32(p216, var3665)
			local _ = var3699
			var3665 = var3700
		elseif var3666 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3701, var3702 = protoModule.readFixed64(p216, var3665)
			local _ = var3701
			var3665 = var3702
		else
			error("Unsupported wire type: " .. var3666)
		end
	end
	return var3664
end

function t_110:jsonEncode() --[[ line: 21167 ]]
	local t = {}
	
	if self.product_name ~= nil then
		t.productName = self.product_name:jsonEncode()
	end
	if self.description ~= nil then
		t.description = self.description:jsonEncode()
	end
	if self.image_url ~= nil then
		t.imageUrl = self.image_url:jsonEncode()
	end
	if self.price_in_robux ~= nil then
		t.priceInRobux = self.price_in_robux:jsonEncode()
	end
	if self.display_price ~= nil then
		t.displayPrice = self.display_price:jsonEncode()
	end
	if self.icon_image_asset_id ~= nil then
		t.iconImageAssetId = self.icon_image_asset_id:jsonEncode()
	end
	if self.product_id ~= nil then
		t.productId = self.product_id:jsonEncode()
	end
	if self.target_id ~= nil then
		t.targetId = self.target_id:jsonEncode()
	end
	if self.is_for_sale ~= nil then
		t.isForSale = self.is_for_sale:jsonEncode()
	end
	if self.product_type ~= nil then
		t.productType = self.product_type:jsonEncode()
	end
	if self.base_price_in_robux ~= nil then
		t.basePriceInRobux = self.base_price_in_robux:jsonEncode()
	end
	if self.price_discount_details ~= nil then
		t.priceDiscountDetails = self.price_discount_details:jsonEncode()
	end
	return t
end

function t_110:jsonDecode() --[[ line: 21223 ]]
	-- upvalues: t_110 (ref), propTypesModule (ref)
	local var3704 = t_110.new()
	
	if self.product_name ~= nil then
		var3704.product_name = propTypesModule.StringProp.jsonDecode(self.product_name)
	end
	if self.productName ~= nil then
		var3704.product_name = propTypesModule.StringProp.jsonDecode(self.productName)
	end
	if self.description ~= nil then
		var3704.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_url ~= nil then
		var3704.image_url = propTypesModule.StringProp.jsonDecode(self.image_url)
	end
	if self.imageUrl ~= nil then
		var3704.image_url = propTypesModule.StringProp.jsonDecode(self.imageUrl)
	end
	if self.price_in_robux ~= nil then
		var3704.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		var3704.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.display_price ~= nil then
		var3704.display_price = propTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		var3704.display_price = propTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	if self.icon_image_asset_id ~= nil then
		var3704.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		var3704.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.product_id ~= nil then
		var3704.product_id = propTypesModule.Int64Prop.jsonDecode(self.product_id)
	end
	if self.productId ~= nil then
		var3704.product_id = propTypesModule.Int64Prop.jsonDecode(self.productId)
	end
	if self.target_id ~= nil then
		var3704.target_id = propTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		var3704.target_id = propTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.is_for_sale ~= nil then
		var3704.is_for_sale = propTypesModule.BoolProp.jsonDecode(self.is_for_sale)
	end
	if self.isForSale ~= nil then
		var3704.is_for_sale = propTypesModule.BoolProp.jsonDecode(self.isForSale)
	end
	if self.product_type ~= nil then
		var3704.product_type = propTypesModule.StringProp.jsonDecode(self.product_type)
	end
	if self.productType ~= nil then
		var3704.product_type = propTypesModule.StringProp.jsonDecode(self.productType)
	end
	if self.base_price_in_robux ~= nil then
		var3704.base_price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.base_price_in_robux)
	end
	if self.basePriceInRobux ~= nil then
		var3704.base_price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.basePriceInRobux)
	end
	if self.price_discount_details ~= nil then
		var3704.price_discount_details = propTypesModule.ArrayOfStructProp.jsonDecode(self.price_discount_details)
	end
	if self.priceDiscountDetails ~= nil then
		var3704.price_discount_details = propTypesModule.ArrayOfStructProp.jsonDecode(self.priceDiscountDetails)
	end
	return var3704
end

t_110.descriptor = {
	name = "OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.DisplayInfoLiteral"
}
t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral = t_110
typeRegistryModule.default:register(t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p217) --[[ line: 21357 ]]
	-- upvalues: t_111 (ref)
	return setmetatable({
		kind = if p217 == nil or p217.kind == nil then nil else p217.kind
	}, t_111)
end

function t_111:encode() --[[ line: 21365 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3706 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3707 = self.kind.value:encode()
			local var3708, var3709 = protoModule.writeTag(buff, var3706, 1, protoModule.wireTypes.lengthDelimited)
			var3708, var3709 = protoModule.writeBuffer(var3708, var3709, var3707, buffer.len(var3707))
			buff = var3708
			var3706 = var3709
		elseif self.kind.type == "binding_path" then
			local var3710, var3711 = protoModule.writeTag(buff, var3706, 2, protoModule.wireTypes.lengthDelimited)
			var3710, var3711 = protoModule.writeString(var3710, var3711, self.kind.value)
			buff = var3710
			var3706 = var3711
		end
	end
	local buff_1 = buffer.create(var3706)
	buffer.copy(buff_1, 0, buff, 0, var3706)
	
	return buff_1
end

function t_111.decode(p218) --[[ line: 21387 ]]
	-- upvalues: t_111 (ref), protoModule (ref), t (ref)
	local var3713 = t_111.new()
	local var3714 = 0
	while var3714 < buffer.len(p218) do
		local _ = nil
		local var3715 = nil
		local var3716, var3717, var3718 = protoModule.readTag(p218, var3714)
		local var3719 = var3716
		var3715 = var3717
		var3714 = var3718
		
		if var3715 == protoModule.wireTypes.varint then
			local _ = nil
			local var3720, var3721 = protoModule.readVarInt(p218, var3714)
			local _ = var3720
			var3714 = var3721
			continue
		end
		if var3715 == protoModule.wireTypes.lengthDelimited then
			if var3719 == 1 then
				local _ = nil
				local var3722, var3723 = protoModule.readBuffer(p218, var3714)
				var3714 = var3723
				var3713.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.decode(var3722)
				}
			elseif var3719 == 2 then
				local _ = nil
				local var3724, var3725 = protoModule.readBuffer(p218, var3714)
				var3714 = var3725
				var3713.kind = { type = "binding_path", value = buffer.tostring(var3724) }
			else
				local _ = nil
				local var3726, var3727 = protoModule.readVarInt(p218, var3714)
				var3714 = var3727 + var3726
			end
		elseif var3715 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3728, var3729 = protoModule.readFixed32(p218, var3714)
			local _ = var3728
			var3714 = var3729
		elseif var3715 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3730, var3731 = protoModule.readFixed64(p218, var3714)
			local _ = var3730
			var3714 = var3731
		else
			error("Unsupported wire type: " .. var3715)
		end
	end
	return var3713
end

function t_111:jsonEncode() --[[ line: 21440 ]]
	local t = {}
	
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

function t_111:jsonDecode() --[[ line: 21456 ]]
	-- upvalues: t_111 (ref), t (ref)
	local var3733 = t_111.new()
	
	if self.literal ~= nil then
		var3733.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3733.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3733.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3733
end

t_111.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseOptions"
}
t.OpenPurchasePromptAction_PurchaseOptions = t_111
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseOptions)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p219) --[[ line: 21496 ]]
	-- upvalues: t_112 (ref)
	return setmetatable({
		should_skip_ownership_check = if p219 == nil or p219.should_skip_ownership_check == nil then nil else p219.should_skip_ownership_check,
		enable_preloaded_purchase_ui = if p219 == nil or p219.enable_preloaded_purchase_ui == nil then nil else p219.enable_preloaded_purchase_ui,
		completion_message = if p219 == nil or p219.completion_message == nil then nil else p219.completion_message,
		completion_button_text = if p219 == nil or p219.completion_button_text == nil then nil else p219.completion_button_text,
		prevent_double_confirm = if p219 == nil or p219.prevent_double_confirm == nil then nil else p219.prevent_double_confirm,
		provided_robux_balance = if p219 == nil or p219.provided_robux_balance == nil then nil else p219.provided_robux_balance
	}, t_112)
end

function t_112:encode() --[[ line: 21524 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3735 = 0
	
	if self.should_skip_ownership_check ~= nil then
		local var3736 = self.should_skip_ownership_check:encode()
		local var3737, var3738 = protoModule.writeTag(buff, var3735, 1, protoModule.wireTypes.lengthDelimited)
		var3737, var3738 = protoModule.writeBuffer(var3737, var3738, var3736, buffer.len(var3736))
		buff = var3737
		var3735 = var3738
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		local var3739 = self.enable_preloaded_purchase_ui:encode()
		local var3740, var3741 = protoModule.writeTag(buff, var3735, 2, protoModule.wireTypes.lengthDelimited)
		var3740, var3741 = protoModule.writeBuffer(var3740, var3741, var3739, buffer.len(var3739))
		buff = var3740
		var3735 = var3741
	end
	if self.completion_message ~= nil then
		local var3742 = self.completion_message:encode()
		local var3743, var3744 = protoModule.writeTag(buff, var3735, 3, protoModule.wireTypes.lengthDelimited)
		var3743, var3744 = protoModule.writeBuffer(var3743, var3744, var3742, buffer.len(var3742))
		buff = var3743
		var3735 = var3744
	end
	if self.completion_button_text ~= nil then
		local var3745 = self.completion_button_text:encode()
		local var3746, var3747 = protoModule.writeTag(buff, var3735, 4, protoModule.wireTypes.lengthDelimited)
		var3746, var3747 = protoModule.writeBuffer(var3746, var3747, var3745, buffer.len(var3745))
		buff = var3746
		var3735 = var3747
	end
	if self.prevent_double_confirm ~= nil then
		local var3748 = self.prevent_double_confirm:encode()
		local var3749, var3750 = protoModule.writeTag(buff, var3735, 5, protoModule.wireTypes.lengthDelimited)
		var3749, var3750 = protoModule.writeBuffer(var3749, var3750, var3748, buffer.len(var3748))
		buff = var3749
		var3735 = var3750
	end
	if self.provided_robux_balance ~= nil then
		local var3751 = self.provided_robux_balance:encode()
		local var3752, var3753 = protoModule.writeTag(buff, var3735, 6, protoModule.wireTypes.lengthDelimited)
		var3752, var3753 = protoModule.writeBuffer(var3752, var3753, var3751, buffer.len(var3751))
		buff = var3752
		var3735 = var3753
	end
	local buff_1 = buffer.create(var3735)
	buffer.copy(buff_1, 0, buff, 0, var3735)
	
	return buff_1
end

function t_112.decode(p220) --[[ line: 21571 ]]
	-- upvalues: t_112 (ref), protoModule (ref), propTypesModule (ref)
	local var3755 = t_112.new()
	local var3756 = 0
	while var3756 < buffer.len(p220) do
		local _ = nil
		local var3757 = nil
		local var3758, var3759, var3760 = protoModule.readTag(p220, var3756)
		local var3761 = var3758
		var3757 = var3759
		var3756 = var3760
		
		if var3757 == protoModule.wireTypes.varint then
			local _ = nil
			local var3762, var3763 = protoModule.readVarInt(p220, var3756)
			local _ = var3762
			var3756 = var3763
			continue
		end
		if var3757 == protoModule.wireTypes.lengthDelimited then
			if var3761 == 1 then
				local _ = nil
				local var3764, var3765 = protoModule.readBuffer(p220, var3756)
				var3756 = var3765
				var3755.should_skip_ownership_check = propTypesModule.BoolProp.decode(var3764)
			elseif var3761 == 2 then
				local _ = nil
				local var3766, var3767 = protoModule.readBuffer(p220, var3756)
				var3756 = var3767
				var3755.enable_preloaded_purchase_ui = propTypesModule.BoolProp.decode(var3766)
			elseif var3761 == 3 then
				local _ = nil
				local var3768, var3769 = protoModule.readBuffer(p220, var3756)
				var3756 = var3769
				var3755.completion_message = propTypesModule.StringProp.decode(var3768)
			elseif var3761 == 4 then
				local _ = nil
				local var3770, var3771 = protoModule.readBuffer(p220, var3756)
				var3756 = var3771
				var3755.completion_button_text = propTypesModule.StringProp.decode(var3770)
			elseif var3761 == 5 then
				local _ = nil
				local var3772, var3773 = protoModule.readBuffer(p220, var3756)
				var3756 = var3773
				var3755.prevent_double_confirm = propTypesModule.BoolProp.decode(var3772)
			elseif var3761 == 6 then
				local _ = nil
				local var3774, var3775 = protoModule.readBuffer(p220, var3756)
				var3756 = var3775
				var3755.provided_robux_balance = propTypesModule.Int64Prop.decode(var3774)
			else
				local _ = nil
				local var3776, var3777 = protoModule.readVarInt(p220, var3756)
				var3756 = var3777 + var3776
			end
		elseif var3757 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3778, var3779 = protoModule.readFixed32(p220, var3756)
			local _ = var3778
			var3756 = var3779
		elseif var3757 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3780, var3781 = protoModule.readFixed64(p220, var3756)
			local _ = var3780
			var3756 = var3781
		else
			error("Unsupported wire type: " .. var3757)
		end
	end
	return var3755
end

function t_112:jsonEncode() --[[ line: 21646 ]]
	local t = {}
	
	if self.should_skip_ownership_check ~= nil then
		t.shouldSkipOwnershipCheck = self.should_skip_ownership_check:jsonEncode()
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		t.enablePreloadedPurchaseUi = self.enable_preloaded_purchase_ui:jsonEncode()
	end
	if self.completion_message ~= nil then
		t.completionMessage = self.completion_message:jsonEncode()
	end
	if self.completion_button_text ~= nil then
		t.completionButtonText = self.completion_button_text:jsonEncode()
	end
	if self.prevent_double_confirm ~= nil then
		t.preventDoubleConfirm = self.prevent_double_confirm:jsonEncode()
	end
	if self.provided_robux_balance ~= nil then
		t.providedRobuxBalance = self.provided_robux_balance:jsonEncode()
	end
	return t
end

function t_112:jsonDecode() --[[ line: 21678 ]]
	-- upvalues: t_112 (ref), propTypesModule (ref)
	local var3783 = t_112.new()
	
	if self.should_skip_ownership_check ~= nil then
		var3783.should_skip_ownership_check = propTypesModule.BoolProp.jsonDecode(self.should_skip_ownership_check)
	end
	if self.shouldSkipOwnershipCheck ~= nil then
		var3783.should_skip_ownership_check = propTypesModule.BoolProp.jsonDecode(self.shouldSkipOwnershipCheck)
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		var3783.enable_preloaded_purchase_ui = propTypesModule.BoolProp.jsonDecode(self.enable_preloaded_purchase_ui)
	end
	if self.enablePreloadedPurchaseUi ~= nil then
		var3783.enable_preloaded_purchase_ui = propTypesModule.BoolProp.jsonDecode(self.enablePreloadedPurchaseUi)
	end
	if self.completion_message ~= nil then
		var3783.completion_message = propTypesModule.StringProp.jsonDecode(self.completion_message)
	end
	if self.completionMessage ~= nil then
		var3783.completion_message = propTypesModule.StringProp.jsonDecode(self.completionMessage)
	end
	if self.completion_button_text ~= nil then
		var3783.completion_button_text = propTypesModule.StringProp.jsonDecode(self.completion_button_text)
	end
	if self.completionButtonText ~= nil then
		var3783.completion_button_text = propTypesModule.StringProp.jsonDecode(self.completionButtonText)
	end
	if self.prevent_double_confirm ~= nil then
		var3783.prevent_double_confirm = propTypesModule.BoolProp.jsonDecode(self.prevent_double_confirm)
	end
	if self.preventDoubleConfirm ~= nil then
		var3783.prevent_double_confirm = propTypesModule.BoolProp.jsonDecode(self.preventDoubleConfirm)
	end
	if self.provided_robux_balance ~= nil then
		var3783.provided_robux_balance = propTypesModule.Int64Prop.jsonDecode(self.provided_robux_balance)
	end
	if self.providedRobuxBalance ~= nil then
		var3783.provided_robux_balance = propTypesModule.Int64Prop.jsonDecode(self.providedRobuxBalance)
	end
	return var3783
end

t_112.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseOptionsLiteral"
}
t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral = t_112
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p221) --[[ line: 21763 ]]
	-- upvalues: t_113 (ref)
	return setmetatable({
		kind = if p221 == nil or p221.kind == nil then nil else p221.kind
	}, t_113)
end

function t_113:encode() --[[ line: 21774 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3785 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3786 = self.kind.value:encode()
			local var3787, var3788 = protoModule.writeTag(buff, var3785, 1, protoModule.wireTypes.lengthDelimited)
			var3787, var3788 = protoModule.writeBuffer(var3787, var3788, var3786, buffer.len(var3786))
			buff = var3787
			var3785 = var3788
		elseif self.kind.type == "binding_path" then
			local var3789, var3790 = protoModule.writeTag(buff, var3785, 2, protoModule.wireTypes.lengthDelimited)
			var3789, var3790 = protoModule.writeString(var3789, var3790, self.kind.value)
			buff = var3789
			var3785 = var3790
		end
	end
	local buff_1 = buffer.create(var3785)
	buffer.copy(buff_1, 0, buff, 0, var3785)
	
	return buff_1
end

function t_113.decode(p222) --[[ line: 21796 ]]
	-- upvalues: t_113 (ref), protoModule (ref), t (ref)
	local var3792 = t_113.new()
	local var3793 = 0
	while var3793 < buffer.len(p222) do
		local _ = nil
		local var3794 = nil
		local var3795, var3796, var3797 = protoModule.readTag(p222, var3793)
		local var3798 = var3795
		var3794 = var3796
		var3793 = var3797
		
		if var3794 == protoModule.wireTypes.varint then
			local _ = nil
			local var3799, var3800 = protoModule.readVarInt(p222, var3793)
			local _ = var3799
			var3793 = var3800
			continue
		end
		if var3794 == protoModule.wireTypes.lengthDelimited then
			if var3798 == 1 then
				local _ = nil
				local var3801, var3802 = protoModule.readBuffer(p222, var3793)
				var3793 = var3802
				var3792.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.decode(var3801)
				}
			elseif var3798 == 2 then
				local _ = nil
				local var3803, var3804 = protoModule.readBuffer(p222, var3793)
				var3793 = var3804
				var3792.kind = { type = "binding_path", value = buffer.tostring(var3803) }
			else
				local _ = nil
				local var3805, var3806 = protoModule.readVarInt(p222, var3793)
				var3793 = var3806 + var3805
			end
		elseif var3794 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3807, var3808 = protoModule.readFixed32(p222, var3793)
			local _ = var3807
			var3793 = var3808
		elseif var3794 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3809, var3810 = protoModule.readFixed64(p222, var3793)
			local _ = var3809
			var3793 = var3810
		else
			error("Unsupported wire type: " .. var3794)
		end
	end
	return var3792
end

function t_113:jsonEncode() --[[ line: 21851 ]]
	local t = {}
	
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

function t_113:jsonDecode() --[[ line: 21867 ]]
	-- upvalues: t_113 (ref), t (ref)
	local var3812 = t_113.new()
	
	if self.literal ~= nil then
		var3812.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3812.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3812.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3812
end

t_113.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseAnalyticsMetadata",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseAnalyticsMetadata"
}
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata = t_113
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p223) --[[ line: 21908 ]]
	-- upvalues: t_114 (ref)
	return setmetatable({
		surface = if p223 == nil or p223.surface == nil then nil else p223.surface,
		product_universe_id = if p223 == nil or p223.product_universe_id == nil then nil else p223.product_universe_id
	}, t_114)
end

function t_114:encode() --[[ line: 21922 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3814 = 0
	
	if self.surface ~= nil then
		local var3815 = self.surface:encode()
		local var3816, var3817 = protoModule.writeTag(buff, var3814, 1, protoModule.wireTypes.lengthDelimited)
		var3816, var3817 = protoModule.writeBuffer(var3816, var3817, var3815, buffer.len(var3815))
		buff = var3816
		var3814 = var3817
	end
	if self.product_universe_id ~= nil then
		local var3818 = self.product_universe_id:encode()
		local var3819, var3820 = protoModule.writeTag(buff, var3814, 2, protoModule.wireTypes.lengthDelimited)
		var3819, var3820 = protoModule.writeBuffer(var3819, var3820, var3818, buffer.len(var3818))
		buff = var3819
		var3814 = var3820
	end
	local buff_1 = buffer.create(var3814)
	buffer.copy(buff_1, 0, buff, 0, var3814)
	
	return buff_1
end

function t_114.decode(p224) --[[ line: 21945 ]]
	-- upvalues: t_114 (ref), protoModule (ref), propTypesModule (ref)
	local var3822 = t_114.new()
	local var3823 = 0
	while var3823 < buffer.len(p224) do
		local _ = nil
		local var3824 = nil
		local var3825, var3826, var3827 = protoModule.readTag(p224, var3823)
		local var3828 = var3825
		var3824 = var3826
		var3823 = var3827
		
		if var3824 == protoModule.wireTypes.varint then
			local _ = nil
			local var3829, var3830 = protoModule.readVarInt(p224, var3823)
			local _ = var3829
			var3823 = var3830
			continue
		end
		if var3824 == protoModule.wireTypes.lengthDelimited then
			if var3828 == 1 then
				local _ = nil
				local var3831, var3832 = protoModule.readBuffer(p224, var3823)
				var3823 = var3832
				var3822.surface = propTypesModule.StringProp.decode(var3831)
			elseif var3828 == 2 then
				local _ = nil
				local var3833, var3834 = protoModule.readBuffer(p224, var3823)
				var3823 = var3834
				var3822.product_universe_id = propTypesModule.StringProp.decode(var3833)
			else
				local _ = nil
				local var3835, var3836 = protoModule.readVarInt(p224, var3823)
				var3823 = var3836 + var3835
			end
		elseif var3824 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3837, var3838 = protoModule.readFixed32(p224, var3823)
			local _ = var3837
			var3823 = var3838
		elseif var3824 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3839, var3840 = protoModule.readFixed64(p224, var3823)
			local _ = var3839
			var3823 = var3840
		else
			error("Unsupported wire type: " .. var3824)
		end
	end
	return var3822
end

function t_114:jsonEncode() --[[ line: 21996 ]]
	local t = {}
	
	if self.surface ~= nil then
		t.surface = self.surface:jsonEncode()
	end
	if self.product_universe_id ~= nil then
		t.productUniverseId = self.product_universe_id:jsonEncode()
	end
	return t
end

function t_114:jsonDecode() --[[ line: 22012 ]]
	-- upvalues: t_114 (ref), propTypesModule (ref)
	local var3842 = t_114.new()
	
	if self.surface ~= nil then
		var3842.surface = propTypesModule.StringProp.jsonDecode(self.surface)
	end
	if self.product_universe_id ~= nil then
		var3842.product_universe_id = propTypesModule.StringProp.jsonDecode(self.product_universe_id)
	end
	if self.productUniverseId ~= nil then
		var3842.product_universe_id = propTypesModule.StringProp.jsonDecode(self.productUniverseId)
	end
	return var3842
end

t_114.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseAnalyticsMetadataLiteral"
}
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral = t_114
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p225) --[[ line: 22053 ]]
	-- upvalues: t_115 (ref)
	return setmetatable({
		product_payload = if p225 == nil or p225.product_payload == nil then nil else p225.product_payload,
		display_info = if p225 == nil or p225.display_info == nil then nil else p225.display_info,
		purchase_options = if p225 == nil or p225.purchase_options == nil then nil else p225.purchase_options,
		purchase_analytics_metadata = if p225 == nil or p225.purchase_analytics_metadata == nil then nil else p225.purchase_analytics_metadata,
		root_place_id = if p225 == nil or p225.root_place_id == nil then nil else p225.root_place_id
	}, t_115)
end

function t_115:encode() --[[ line: 22067 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3844 = 0
	
	if self.product_payload ~= nil then
		local var3845 = self.product_payload:encode()
		local var3846, var3847 = protoModule.writeTag(buff, var3844, 1, protoModule.wireTypes.lengthDelimited)
		var3846, var3847 = protoModule.writeBuffer(var3846, var3847, var3845, buffer.len(var3845))
		buff = var3846
		var3844 = var3847
	end
	if self.display_info ~= nil then
		local var3848 = self.display_info:encode()
		local var3849, var3850 = protoModule.writeTag(buff, var3844, 2, protoModule.wireTypes.lengthDelimited)
		var3849, var3850 = protoModule.writeBuffer(var3849, var3850, var3848, buffer.len(var3848))
		buff = var3849
		var3844 = var3850
	end
	if self.purchase_options ~= nil then
		local var3851 = self.purchase_options:encode()
		local var3852, var3853 = protoModule.writeTag(buff, var3844, 3, protoModule.wireTypes.lengthDelimited)
		var3852, var3853 = protoModule.writeBuffer(var3852, var3853, var3851, buffer.len(var3851))
		buff = var3852
		var3844 = var3853
	end
	if self.purchase_analytics_metadata ~= nil then
		local var3854 = self.purchase_analytics_metadata:encode()
		local var3855, var3856 = protoModule.writeTag(buff, var3844, 4, protoModule.wireTypes.lengthDelimited)
		var3855, var3856 = protoModule.writeBuffer(var3855, var3856, var3854, buffer.len(var3854))
		buff = var3855
		var3844 = var3856
	end
	if self.root_place_id ~= nil then
		local var3857 = self.root_place_id:encode()
		local var3858, var3859 = protoModule.writeTag(buff, var3844, 5, protoModule.wireTypes.lengthDelimited)
		var3858, var3859 = protoModule.writeBuffer(var3858, var3859, var3857, buffer.len(var3857))
		buff = var3858
		var3844 = var3859
	end
	local buff_1 = buffer.create(var3844)
	buffer.copy(buff_1, 0, buff, 0, var3844)
	
	return buff_1
end

function t_115.decode(p226) --[[ line: 22106 ]]
	-- upvalues: t_115 (ref), protoModule (ref), t (ref), propTypesModule (ref)
	local var3861 = t_115.new()
	local var3862 = 0
	while var3862 < buffer.len(p226) do
		local _ = nil
		local var3863 = nil
		local var3864, var3865, var3866 = protoModule.readTag(p226, var3862)
		local var3867 = var3864
		var3863 = var3865
		var3862 = var3866
		
		if var3863 == protoModule.wireTypes.varint then
			local _ = nil
			local var3868, var3869 = protoModule.readVarInt(p226, var3862)
			local _ = var3868
			var3862 = var3869
			continue
		end
		if var3863 == protoModule.wireTypes.lengthDelimited then
			if var3867 == 1 then
				local _ = nil
				local var3870, var3871 = protoModule.readBuffer(p226, var3862)
				var3862 = var3871
				var3861.product_payload = t.OpenPurchasePromptAction_ProductPayload.decode(var3870)
			elseif var3867 == 2 then
				local _ = nil
				local var3872, var3873 = protoModule.readBuffer(p226, var3862)
				var3862 = var3873
				var3861.display_info = t.OpenPurchasePromptAction_DisplayInfo.decode(var3872)
			elseif var3867 == 3 then
				local _ = nil
				local var3874, var3875 = protoModule.readBuffer(p226, var3862)
				var3862 = var3875
				var3861.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.decode(var3874)
			elseif var3867 == 4 then
				local _ = nil
				local var3876, var3877 = protoModule.readBuffer(p226, var3862)
				var3862 = var3877
				var3861.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.decode(var3876)
			elseif var3867 == 5 then
				local _ = nil
				local var3878, var3879 = protoModule.readBuffer(p226, var3862)
				var3862 = var3879
				var3861.root_place_id = propTypesModule.StringProp.decode(var3878)
			else
				local _ = nil
				local var3880, var3881 = protoModule.readVarInt(p226, var3862)
				var3862 = var3881 + var3880
			end
		elseif var3863 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3882, var3883 = protoModule.readFixed32(p226, var3862)
			local _ = var3882
			var3862 = var3883
		elseif var3863 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3884, var3885 = protoModule.readFixed64(p226, var3862)
			local _ = var3884
			var3862 = var3885
		else
			error("Unsupported wire type: " .. var3863)
		end
	end
	return var3861
end

function t_115:jsonEncode() --[[ line: 22170 ]]
	local t = {}
	
	if self.product_payload ~= nil then
		t.productPayload = self.product_payload:jsonEncode()
	end
	if self.display_info ~= nil then
		t.displayInfo = self.display_info:jsonEncode()
	end
	if self.purchase_options ~= nil then
		t.purchaseOptions = self.purchase_options:jsonEncode()
	end
	if self.purchase_analytics_metadata ~= nil then
		t.purchaseAnalyticsMetadata = self.purchase_analytics_metadata:jsonEncode()
	end
	if self.root_place_id ~= nil then
		t.rootPlaceId = self.root_place_id:jsonEncode()
	end
	return t
end

function t_115:jsonDecode() --[[ line: 22196 ]]
	-- upvalues: t_115 (ref), t (ref), propTypesModule (ref)
	local var3887 = t_115.new()
	
	if self.product_payload ~= nil then
		var3887.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.product_payload)
	end
	if self.productPayload ~= nil then
		var3887.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.productPayload)
	end
	if self.display_info ~= nil then
		var3887.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.display_info)
	end
	if self.displayInfo ~= nil then
		var3887.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.displayInfo)
	end
	if self.purchase_options ~= nil then
		var3887.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchase_options)
	end
	if self.purchaseOptions ~= nil then
		var3887.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchaseOptions)
	end
	if self.purchase_analytics_metadata ~= nil then
		var3887.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchase_analytics_metadata)
	end
	if self.purchaseAnalyticsMetadata ~= nil then
		var3887.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchaseAnalyticsMetadata)
	end
	if self.root_place_id ~= nil then
		var3887.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var3887.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var3887
end

t_115.descriptor = {
	name = "OpenPurchasePromptAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenPurchasePromptAction_Params = t_115
typeRegistryModule.default:register(t.OpenPurchasePromptAction_Params)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p227) --[[ line: 22261 ]]
	-- upvalues: t (ref), t_116 (ref)
	return setmetatable({
		action_type = if p227 == nil or p227.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p227.action_type,
		action_params = if p227 == nil or p227.action_params == nil then nil else p227.action_params
	}, t_116)
end

function t_116:encode() --[[ line: 22272 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3889 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3890, var3891 = protoModule.writeTag(buff, var3889, 1, protoModule.wireTypes.varint)
		var3890, var3891 = protoModule.writeVarInt(var3890, var3891, t.ActionType.toNumber(self.action_type))
		buff = var3890
		var3889 = var3891
	end
	if self.action_params ~= nil then
		local var3892 = self.action_params:encode()
		local var3893, var3894 = protoModule.writeTag(buff, var3889, 2, protoModule.wireTypes.lengthDelimited)
		var3893, var3894 = protoModule.writeBuffer(var3893, var3894, var3892, buffer.len(var3892))
		buff = var3893
		var3889 = var3894
	end
	local buff_1 = buffer.create(var3889)
	buffer.copy(buff_1, 0, buff, 0, var3889)
	
	return buff_1
end

function t_116.decode(p228) --[[ line: 22298 ]]
	-- upvalues: t_116 (ref), protoModule (ref), t (ref)
	local var3896 = t_116.new()
	local var3897 = 0
	while var3897 < buffer.len(p228) do
		local _ = nil
		local var3898 = nil
		local var3899, var3900, var3901 = protoModule.readTag(p228, var3897)
		local var3902 = var3899
		var3898 = var3900
		var3897 = var3901
		
		if var3898 == protoModule.wireTypes.varint then
			if var3902 == 1 then
				local _ = nil
				local var3903, var3904 = protoModule.readVarIntI32(p228, var3897)
				local var3905 = var3903
				var3897 = var3904
				var3896.action_type = t.ActionType.fromNumber(var3905) or var3905
			else
				local _ = nil
				local var3906, var3907 = protoModule.readVarInt(p228, var3897)
				local _ = var3906
				var3897 = var3907
			end
		end
		if var3898 == protoModule.wireTypes.lengthDelimited then
			if var3902 == 2 then
				local _ = nil
				local var3908, var3909 = protoModule.readBuffer(p228, var3897)
				var3897 = var3909
				var3896.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.decode(var3908)
			else
				local _ = nil
				local var3910, var3911 = protoModule.readVarInt(p228, var3897)
				var3897 = var3911 + var3910
			end
		elseif var3898 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3912, var3913 = protoModule.readFixed32(p228, var3897)
			local _ = var3912
			var3897 = var3913
		elseif var3898 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3914, var3915 = protoModule.readFixed64(p228, var3897)
			local _ = var3914
			var3897 = var3915
		else
			error("Unsupported wire type: " .. var3898)
		end
	end
	return var3896
end

function t_116:jsonEncode() --[[ line: 22346 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_116:jsonDecode() --[[ line: 22368 ]]
	-- upvalues: t_116 (ref), t (ref)
	local var3917 = t_116.new()
	
	if self.action_type ~= nil then
		var3917.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3917.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3917.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3917.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.actionParams)
	end
	return var3917
end

t_116.descriptor = {
	name = "ReportSurfaceLoadTimeMilestoneAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ReportSurfaceLoadTimeMilestoneAction"
}
t.ReportSurfaceLoadTimeMilestoneAction = t_116
typeRegistryModule.default:register(t.ReportSurfaceLoadTimeMilestoneAction)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p229) --[[ line: 22410 ]]
	-- upvalues: t_117 (ref)
	return setmetatable({
		milestone = if p229 == nil or p229.milestone == nil then nil else p229.milestone,
		metadata = if p229 == nil or p229.metadata == nil then nil else p229.metadata
	}, t_117)
end

function t_117:encode() --[[ line: 22419 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3919 = 0
	
	if self.milestone ~= nil then
		local var3920 = self.milestone:encode()
		local var3921, var3922 = protoModule.writeTag(buff, var3919, 1, protoModule.wireTypes.lengthDelimited)
		var3921, var3922 = protoModule.writeBuffer(var3921, var3922, var3920, buffer.len(var3920))
		buff = var3921
		var3919 = var3922
	end
	if self.metadata ~= nil then
		local var3923 = self.metadata:encode()
		local var3924, var3925 = protoModule.writeTag(buff, var3919, 3, protoModule.wireTypes.lengthDelimited)
		var3924, var3925 = protoModule.writeBuffer(var3924, var3925, var3923, buffer.len(var3923))
		buff = var3924
		var3919 = var3925
	end
	local buff_1 = buffer.create(var3919)
	buffer.copy(buff_1, 0, buff, 0, var3919)
	
	return buff_1
end

function t_117.decode(p230) --[[ line: 22442 ]]
	-- upvalues: t_117 (ref), protoModule (ref), propTypesModule (ref)
	local var3927 = t_117.new()
	local var3928 = 0
	while var3928 < buffer.len(p230) do
		local _ = nil
		local var3929 = nil
		local var3930, var3931, var3932 = protoModule.readTag(p230, var3928)
		local var3933 = var3930
		var3929 = var3931
		var3928 = var3932
		
		if var3929 == protoModule.wireTypes.varint then
			local _ = nil
			local var3934, var3935 = protoModule.readVarInt(p230, var3928)
			local _ = var3934
			var3928 = var3935
			continue
		end
		if var3929 == protoModule.wireTypes.lengthDelimited then
			if var3933 == 1 then
				local _ = nil
				local var3936, var3937 = protoModule.readBuffer(p230, var3928)
				var3928 = var3937
				var3927.milestone = propTypesModule.StringProp.decode(var3936)
			elseif var3933 == 3 then
				local _ = nil
				local var3938, var3939 = protoModule.readBuffer(p230, var3928)
				var3928 = var3939
				var3927.metadata = propTypesModule.StructProp.decode(var3938)
			else
				local _ = nil
				local var3940, var3941 = protoModule.readVarInt(p230, var3928)
				var3928 = var3941 + var3940
			end
		elseif var3929 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3942, var3943 = protoModule.readFixed32(p230, var3928)
			local _ = var3942
			var3928 = var3943
		elseif var3929 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3944, var3945 = protoModule.readFixed64(p230, var3928)
			local _ = var3944
			var3928 = var3945
		else
			error("Unsupported wire type: " .. var3929)
		end
	end
	return var3927
end

function t_117:jsonEncode() --[[ line: 22492 ]]
	local t = {}
	
	if self.milestone ~= nil then
		t.milestone = self.milestone:jsonEncode()
	end
	if self.metadata ~= nil then
		t.metadata = self.metadata:jsonEncode()
	end
	return t
end

function t_117:jsonDecode() --[[ line: 22508 ]]
	-- upvalues: t_117 (ref), propTypesModule (ref)
	local var3947 = t_117.new()
	
	if self.milestone ~= nil then
		var3947.milestone = propTypesModule.StringProp.jsonDecode(self.milestone)
	end
	if self.metadata ~= nil then
		var3947.metadata = propTypesModule.StructProp.jsonDecode(self.metadata)
	end
	return var3947
end

t_117.descriptor = {
	name = "ReportSurfaceLoadTimeMilestoneAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ReportSurfaceLoadTimeMilestoneAction_Params = t_117
typeRegistryModule.default:register(t.ReportSurfaceLoadTimeMilestoneAction_Params)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p231) --[[ line: 22538 ]]
	-- upvalues: t (ref), t_118 (ref)
	return setmetatable({
		action_type = if p231 == nil or p231.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p231.action_type,
		action_params = if p231 == nil or p231.action_params == nil then nil else p231.action_params
	}, t_118)
end

function t_118:encode() --[[ line: 22549 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3949 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3950, var3951 = protoModule.writeTag(buff, var3949, 1, protoModule.wireTypes.varint)
		var3950, var3951 = protoModule.writeVarInt(var3950, var3951, t.ActionType.toNumber(self.action_type))
		buff = var3950
		var3949 = var3951
	end
	if self.action_params ~= nil then
		local var3952 = self.action_params:encode()
		local var3953, var3954 = protoModule.writeTag(buff, var3949, 2, protoModule.wireTypes.lengthDelimited)
		var3953, var3954 = protoModule.writeBuffer(var3953, var3954, var3952, buffer.len(var3952))
		buff = var3953
		var3949 = var3954
	end
	local buff_1 = buffer.create(var3949)
	buffer.copy(buff_1, 0, buff, 0, var3949)
	
	return buff_1
end

function t_118.decode(p232) --[[ line: 22575 ]]
	-- upvalues: t_118 (ref), protoModule (ref), t (ref)
	local var3956 = t_118.new()
	local var3957 = 0
	while var3957 < buffer.len(p232) do
		local _ = nil
		local var3958 = nil
		local var3959, var3960, var3961 = protoModule.readTag(p232, var3957)
		local var3962 = var3959
		var3958 = var3960
		var3957 = var3961
		
		if var3958 == protoModule.wireTypes.varint then
			if var3962 == 1 then
				local _ = nil
				local var3963, var3964 = protoModule.readVarIntI32(p232, var3957)
				local var3965 = var3963
				var3957 = var3964
				var3956.action_type = t.ActionType.fromNumber(var3965) or var3965
			else
				local _ = nil
				local var3966, var3967 = protoModule.readVarInt(p232, var3957)
				local _ = var3966
				var3957 = var3967
			end
		end
		if var3958 == protoModule.wireTypes.lengthDelimited then
			if var3962 == 2 then
				local _ = nil
				local var3968, var3969 = protoModule.readBuffer(p232, var3957)
				var3957 = var3969
				var3956.action_params = t.DismissGameFeedbackAction_Params.decode(var3968)
			else
				local _ = nil
				local var3970, var3971 = protoModule.readVarInt(p232, var3957)
				var3957 = var3971 + var3970
			end
		elseif var3958 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3972, var3973 = protoModule.readFixed32(p232, var3957)
			local _ = var3972
			var3957 = var3973
		elseif var3958 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3974, var3975 = protoModule.readFixed64(p232, var3957)
			local _ = var3974
			var3957 = var3975
		else
			error("Unsupported wire type: " .. var3958)
		end
	end
	return var3956
end

function t_118:jsonEncode() --[[ line: 22623 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_118:jsonDecode() --[[ line: 22645 ]]
	-- upvalues: t_118 (ref), t (ref)
	local var3977 = t_118.new()
	
	if self.action_type ~= nil then
		var3977.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3977.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3977.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3977.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return var3977
end

t_118.descriptor = {
	name = "DismissGameFeedbackAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissGameFeedbackAction"
}
t.DismissGameFeedbackAction = t_118
typeRegistryModule.default:register(t.DismissGameFeedbackAction)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p233) --[[ line: 22685 ]]
	-- upvalues: t_119 (ref)
	return setmetatable({
		root_place_id = if p233 == nil or p233.root_place_id == nil then nil else p233.root_place_id
	}, t_119)
end

function t_119:encode() --[[ line: 22693 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3979 = 0
	
	if self.root_place_id ~= nil then
		local var3980 = self.root_place_id:encode()
		local var3981, var3982 = protoModule.writeTag(buff, var3979, 1, protoModule.wireTypes.lengthDelimited)
		var3981, var3982 = protoModule.writeBuffer(var3981, var3982, var3980, buffer.len(var3980))
		buff = var3981
		var3979 = var3982
	end
	local buff_1 = buffer.create(var3979)
	buffer.copy(buff_1, 0, buff, 0, var3979)
	
	return buff_1
end

function t_119.decode(p234) --[[ line: 22708 ]]
	-- upvalues: t_119 (ref), protoModule (ref), propTypesModule (ref)
	local var3984 = t_119.new()
	local var3985 = 0
	while var3985 < buffer.len(p234) do
		local _ = nil
		local var3986 = nil
		local var3987, var3988, var3989 = protoModule.readTag(p234, var3985)
		local var3990 = var3987
		var3986 = var3988
		var3985 = var3989
		
		if var3986 == protoModule.wireTypes.varint then
			local _ = nil
			local var3991, var3992 = protoModule.readVarInt(p234, var3985)
			local _ = var3991
			var3985 = var3992
			continue
		end
		if var3986 == protoModule.wireTypes.lengthDelimited then
			if var3990 == 1 then
				local _ = nil
				local var3993, var3994 = protoModule.readBuffer(p234, var3985)
				var3985 = var3994
				var3984.root_place_id = propTypesModule.StringProp.decode(var3993)
			else
				local _ = nil
				local var3995, var3996 = protoModule.readVarInt(p234, var3985)
				var3985 = var3996 + var3995
			end
		elseif var3986 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3997, var3998 = protoModule.readFixed32(p234, var3985)
			local _ = var3997
			var3985 = var3998
		elseif var3986 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3999, var4000 = protoModule.readFixed64(p234, var3985)
			local _ = var3999
			var3985 = var4000
		else
			error("Unsupported wire type: " .. var3986)
		end
	end
	return var3984
end

function t_119:jsonEncode() --[[ line: 22751 ]]
	local t = {}
	
	if self.root_place_id ~= nil then
		t.rootPlaceId = self.root_place_id:jsonEncode()
	end
	return t
end

function t_119:jsonDecode() --[[ line: 22761 ]]
	-- upvalues: t_119 (ref), propTypesModule (ref)
	local var4002 = t_119.new()
	
	if self.root_place_id ~= nil then
		var4002.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var4002.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var4002
end

t_119.descriptor = {
	name = "DismissGameFeedbackAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissGameFeedbackAction_Params = t_119
typeRegistryModule.default:register(t.DismissGameFeedbackAction_Params)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p235) --[[ line: 22793 ]]
	-- upvalues: t (ref), t_120 (ref)
	return setmetatable({
		action_type = if p235 == nil or p235.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p235.action_type,
		action_params = if p235 == nil or p235.action_params == nil then nil else p235.action_params
	}, t_120)
end

function t_120:encode() --[[ line: 22804 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4004 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4005, var4006 = protoModule.writeTag(buff, var4004, 1, protoModule.wireTypes.varint)
		var4005, var4006 = protoModule.writeVarInt(var4005, var4006, t.ActionType.toNumber(self.action_type))
		buff = var4005
		var4004 = var4006
	end
	if self.action_params ~= nil then
		local var4007 = self.action_params:encode()
		local var4008, var4009 = protoModule.writeTag(buff, var4004, 2, protoModule.wireTypes.lengthDelimited)
		var4008, var4009 = protoModule.writeBuffer(var4008, var4009, var4007, buffer.len(var4007))
		buff = var4008
		var4004 = var4009
	end
	local buff_1 = buffer.create(var4004)
	buffer.copy(buff_1, 0, buff, 0, var4004)
	
	return buff_1
end

function t_120.decode(p236) --[[ line: 22830 ]]
	-- upvalues: t_120 (ref), protoModule (ref), t (ref)
	local var4011 = t_120.new()
	local var4012 = 0
	while var4012 < buffer.len(p236) do
		local _ = nil
		local var4013 = nil
		local var4014, var4015, var4016 = protoModule.readTag(p236, var4012)
		local var4017 = var4014
		var4013 = var4015
		var4012 = var4016
		
		if var4013 == protoModule.wireTypes.varint then
			if var4017 == 1 then
				local _ = nil
				local var4018, var4019 = protoModule.readVarIntI32(p236, var4012)
				local var4020 = var4018
				var4012 = var4019
				var4011.action_type = t.ActionType.fromNumber(var4020) or var4020
			else
				local _ = nil
				local var4021, var4022 = protoModule.readVarInt(p236, var4012)
				local _ = var4021
				var4012 = var4022
			end
		end
		if var4013 == protoModule.wireTypes.lengthDelimited then
			if var4017 == 2 then
				local _ = nil
				local var4023, var4024 = protoModule.readBuffer(p236, var4012)
				var4012 = var4024
				var4011.action_params = t.OpenGameFeedbackFormAction_Params.decode(var4023)
			else
				local _ = nil
				local var4025, var4026 = protoModule.readVarInt(p236, var4012)
				var4012 = var4026 + var4025
			end
		elseif var4013 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4027, var4028 = protoModule.readFixed32(p236, var4012)
			local _ = var4027
			var4012 = var4028
		elseif var4013 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4029, var4030 = protoModule.readFixed64(p236, var4012)
			local _ = var4029
			var4012 = var4030
		else
			error("Unsupported wire type: " .. var4013)
		end
	end
	return var4011
end

function t_120:jsonEncode() --[[ line: 22878 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_120:jsonDecode() --[[ line: 22900 ]]
	-- upvalues: t_120 (ref), t (ref)
	local var4032 = t_120.new()
	
	if self.action_type ~= nil then
		var4032.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4032.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4032.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4032.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.actionParams)
	end
	return var4032
end

t_120.descriptor = {
	name = "OpenGameFeedbackFormAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameFeedbackFormAction"
}
t.OpenGameFeedbackFormAction = t_120
typeRegistryModule.default:register(t.OpenGameFeedbackFormAction)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p237) --[[ line: 22940 ]]
	-- upvalues: t_121 (ref)
	return setmetatable({
		universe_id = if p237 == nil or p237.universe_id == nil then nil else p237.universe_id,
		root_place_id = if p237 == nil or p237.root_place_id == nil then nil else p237.root_place_id
	}, t_121)
end

function t_121:encode() --[[ line: 22949 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4034 = 0
	
	if self.universe_id ~= nil then
		local var4035 = self.universe_id:encode()
		local var4036, var4037 = protoModule.writeTag(buff, var4034, 1, protoModule.wireTypes.lengthDelimited)
		var4036, var4037 = protoModule.writeBuffer(var4036, var4037, var4035, buffer.len(var4035))
		buff = var4036
		var4034 = var4037
	end
	if self.root_place_id ~= nil then
		local var4038 = self.root_place_id:encode()
		local var4039, var4040 = protoModule.writeTag(buff, var4034, 2, protoModule.wireTypes.lengthDelimited)
		var4039, var4040 = protoModule.writeBuffer(var4039, var4040, var4038, buffer.len(var4038))
		buff = var4039
		var4034 = var4040
	end
	local buff_1 = buffer.create(var4034)
	buffer.copy(buff_1, 0, buff, 0, var4034)
	
	return buff_1
end

function t_121.decode(p238) --[[ line: 22970 ]]
	-- upvalues: t_121 (ref), protoModule (ref), propTypesModule (ref)
	local var4042 = t_121.new()
	local var4043 = 0
	while var4043 < buffer.len(p238) do
		local _ = nil
		local var4044 = nil
		local var4045, var4046, var4047 = protoModule.readTag(p238, var4043)
		local var4048 = var4045
		var4044 = var4046
		var4043 = var4047
		
		if var4044 == protoModule.wireTypes.varint then
			local _ = nil
			local var4049, var4050 = protoModule.readVarInt(p238, var4043)
			local _ = var4049
			var4043 = var4050
			continue
		end
		if var4044 == protoModule.wireTypes.lengthDelimited then
			if var4048 == 1 then
				local _ = nil
				local var4051, var4052 = protoModule.readBuffer(p238, var4043)
				var4043 = var4052
				var4042.universe_id = propTypesModule.StringProp.decode(var4051)
			elseif var4048 == 2 then
				local _ = nil
				local var4053, var4054 = protoModule.readBuffer(p238, var4043)
				var4043 = var4054
				var4042.root_place_id = propTypesModule.StringProp.decode(var4053)
			else
				local _ = nil
				local var4055, var4056 = protoModule.readVarInt(p238, var4043)
				var4043 = var4056 + var4055
			end
		elseif var4044 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4057, var4058 = protoModule.readFixed32(p238, var4043)
			local _ = var4057
			var4043 = var4058
		elseif var4044 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4059, var4060 = protoModule.readFixed64(p238, var4043)
			local _ = var4059
			var4043 = var4060
		else
			error("Unsupported wire type: " .. var4044)
		end
	end
	return var4042
end

function t_121:jsonEncode() --[[ line: 23018 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.root_place_id ~= nil then
		t.rootPlaceId = self.root_place_id:jsonEncode()
	end
	return t
end

function t_121:jsonDecode() --[[ line: 23032 ]]
	-- upvalues: t_121 (ref), propTypesModule (ref)
	local var4062 = t_121.new()
	
	if self.universe_id ~= nil then
		var4062.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var4062.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		var4062.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var4062.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var4062
end

t_121.descriptor = {
	name = "OpenGameFeedbackFormAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameFeedbackFormAction_Params = t_121
typeRegistryModule.default:register(t.OpenGameFeedbackFormAction_Params)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p239) --[[ line: 23073 ]]
	-- upvalues: t (ref), t_122 (ref)
	return setmetatable({
		action_type = if p239 == nil or p239.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p239.action_type,
		action_params = if p239 == nil or p239.action_params == nil then nil else p239.action_params
	}, t_122)
end

function t_122:encode() --[[ line: 23082 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4064 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4065, var4066 = protoModule.writeTag(buff, var4064, 1, protoModule.wireTypes.varint)
		var4065, var4066 = protoModule.writeVarInt(var4065, var4066, t.ActionType.toNumber(self.action_type))
		buff = var4065
		var4064 = var4066
	end
	if self.action_params ~= nil then
		local var4067 = self.action_params:encode()
		local var4068, var4069 = protoModule.writeTag(buff, var4064, 2, protoModule.wireTypes.lengthDelimited)
		var4068, var4069 = protoModule.writeBuffer(var4068, var4069, var4067, buffer.len(var4067))
		buff = var4068
		var4064 = var4069
	end
	local buff_1 = buffer.create(var4064)
	buffer.copy(buff_1, 0, buff, 0, var4064)
	
	return buff_1
end

function t_122.decode(p240) --[[ line: 23108 ]]
	-- upvalues: t_122 (ref), protoModule (ref), t (ref)
	local var4071 = t_122.new()
	local var4072 = 0
	while var4072 < buffer.len(p240) do
		local _ = nil
		local var4073 = nil
		local var4074, var4075, var4076 = protoModule.readTag(p240, var4072)
		local var4077 = var4074
		var4073 = var4075
		var4072 = var4076
		
		if var4073 == protoModule.wireTypes.varint then
			if var4077 == 1 then
				local _ = nil
				local var4078, var4079 = protoModule.readVarIntI32(p240, var4072)
				local var4080 = var4078
				var4072 = var4079
				var4071.action_type = t.ActionType.fromNumber(var4080) or var4080
			else
				local _ = nil
				local var4081, var4082 = protoModule.readVarInt(p240, var4072)
				local _ = var4081
				var4072 = var4082
			end
		end
		if var4073 == protoModule.wireTypes.lengthDelimited then
			if var4077 == 2 then
				local _ = nil
				local var4083, var4084 = protoModule.readBuffer(p240, var4072)
				var4072 = var4084
				var4071.action_params = t.AiOverviewFeedbackAction_Params.decode(var4083)
			else
				local _ = nil
				local var4085, var4086 = protoModule.readVarInt(p240, var4072)
				var4072 = var4086 + var4085
			end
		elseif var4073 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4087, var4088 = protoModule.readFixed32(p240, var4072)
			local _ = var4087
			var4072 = var4088
		elseif var4073 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4089, var4090 = protoModule.readFixed64(p240, var4072)
			local _ = var4089
			var4072 = var4090
		else
			error("Unsupported wire type: " .. var4073)
		end
	end
	return var4071
end

function t_122:jsonEncode() --[[ line: 23156 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_122:jsonDecode() --[[ line: 23178 ]]
	-- upvalues: t_122 (ref), t (ref)
	local var4092 = t_122.new()
	
	if self.action_type ~= nil then
		var4092.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4092.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4092.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4092.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return var4092
end

t_122.descriptor = {
	name = "AiOverviewFeedbackAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.AiOverviewFeedbackAction"
}
t.AiOverviewFeedbackAction = t_122
typeRegistryModule.default:register(t.AiOverviewFeedbackAction)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p241) --[[ line: 23218 ]]
	-- upvalues: t_123 (ref)
	return setmetatable({
		sentiment = if p241 == nil or p241.sentiment == nil then nil else p241.sentiment,
		dialog_title = if p241 == nil or p241.dialog_title == nil then nil else p241.dialog_title,
		dialog_text = if p241 == nil or p241.dialog_text == nil then nil else p241.dialog_text,
		placeholder_text = if p241 == nil or p241.placeholder_text == nil then nil else p241.placeholder_text
	}, t_123)
end

function t_123:encode() --[[ line: 23229 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4094 = 0
	
	if self.sentiment ~= nil then
		local var4095 = self.sentiment:encode()
		local var4096, var4097 = protoModule.writeTag(buff, var4094, 1, protoModule.wireTypes.lengthDelimited)
		var4096, var4097 = protoModule.writeBuffer(var4096, var4097, var4095, buffer.len(var4095))
		buff = var4096
		var4094 = var4097
	end
	if self.dialog_title ~= nil then
		local var4098 = self.dialog_title:encode()
		local var4099, var4100 = protoModule.writeTag(buff, var4094, 2, protoModule.wireTypes.lengthDelimited)
		var4099, var4100 = protoModule.writeBuffer(var4099, var4100, var4098, buffer.len(var4098))
		buff = var4099
		var4094 = var4100
	end
	if self.dialog_text ~= nil then
		local var4101 = self.dialog_text:encode()
		local var4102, var4103 = protoModule.writeTag(buff, var4094, 3, protoModule.wireTypes.lengthDelimited)
		var4102, var4103 = protoModule.writeBuffer(var4102, var4103, var4101, buffer.len(var4101))
		buff = var4102
		var4094 = var4103
	end
	if self.placeholder_text ~= nil then
		local var4104 = self.placeholder_text:encode()
		local var4105, var4106 = protoModule.writeTag(buff, var4094, 4, protoModule.wireTypes.lengthDelimited)
		var4105, var4106 = protoModule.writeBuffer(var4105, var4106, var4104, buffer.len(var4104))
		buff = var4105
		var4094 = var4106
	end
	local buff_1 = buffer.create(var4094)
	buffer.copy(buff_1, 0, buff, 0, var4094)
	
	return buff_1
end

function t_123.decode(p242) --[[ line: 23262 ]]
	-- upvalues: t_123 (ref), protoModule (ref), propTypesModule (ref)
	local var4108 = t_123.new()
	local var4109 = 0
	while var4109 < buffer.len(p242) do
		local _ = nil
		local var4110 = nil
		local var4111, var4112, var4113 = protoModule.readTag(p242, var4109)
		local var4114 = var4111
		var4110 = var4112
		var4109 = var4113
		
		if var4110 == protoModule.wireTypes.varint then
			local _ = nil
			local var4115, var4116 = protoModule.readVarInt(p242, var4109)
			local _ = var4115
			var4109 = var4116
			continue
		end
		if var4110 == protoModule.wireTypes.lengthDelimited then
			if var4114 == 1 then
				local _ = nil
				local var4117, var4118 = protoModule.readBuffer(p242, var4109)
				var4109 = var4118
				var4108.sentiment = propTypesModule.StringProp.decode(var4117)
			elseif var4114 == 2 then
				local _ = nil
				local var4119, var4120 = protoModule.readBuffer(p242, var4109)
				var4109 = var4120
				var4108.dialog_title = propTypesModule.StringProp.decode(var4119)
			elseif var4114 == 3 then
				local _ = nil
				local var4121, var4122 = protoModule.readBuffer(p242, var4109)
				var4109 = var4122
				var4108.dialog_text = propTypesModule.StringProp.decode(var4121)
			elseif var4114 == 4 then
				local _ = nil
				local var4123, var4124 = protoModule.readBuffer(p242, var4109)
				var4109 = var4124
				var4108.placeholder_text = propTypesModule.StringProp.decode(var4123)
			else
				local _ = nil
				local var4125, var4126 = protoModule.readVarInt(p242, var4109)
				var4109 = var4126 + var4125
			end
		elseif var4110 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4127, var4128 = protoModule.readFixed32(p242, var4109)
			local _ = var4127
			var4109 = var4128
		elseif var4110 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4129, var4130 = protoModule.readFixed64(p242, var4109)
			local _ = var4129
			var4109 = var4130
		else
			error("Unsupported wire type: " .. var4110)
		end
	end
	return var4108
end

function t_123:jsonEncode() --[[ line: 23320 ]]
	local t = {}
	
	if self.sentiment ~= nil then
		t.sentiment = self.sentiment:jsonEncode()
	end
	if self.dialog_title ~= nil then
		t.dialogTitle = self.dialog_title:jsonEncode()
	end
	if self.dialog_text ~= nil then
		t.dialogText = self.dialog_text:jsonEncode()
	end
	if self.placeholder_text ~= nil then
		t.placeholderText = self.placeholder_text:jsonEncode()
	end
	return t
end

function t_123:jsonDecode() --[[ line: 23342 ]]
	-- upvalues: t_123 (ref), propTypesModule (ref)
	local var4132 = t_123.new()
	
	if self.sentiment ~= nil then
		var4132.sentiment = propTypesModule.StringProp.jsonDecode(self.sentiment)
	end
	if self.dialog_title ~= nil then
		var4132.dialog_title = propTypesModule.StringProp.jsonDecode(self.dialog_title)
	end
	if self.dialogTitle ~= nil then
		var4132.dialog_title = propTypesModule.StringProp.jsonDecode(self.dialogTitle)
	end
	if self.dialog_text ~= nil then
		var4132.dialog_text = propTypesModule.StringProp.jsonDecode(self.dialog_text)
	end
	if self.dialogText ~= nil then
		var4132.dialog_text = propTypesModule.StringProp.jsonDecode(self.dialogText)
	end
	if self.placeholder_text ~= nil then
		var4132.placeholder_text = propTypesModule.StringProp.jsonDecode(self.placeholder_text)
	end
	if self.placeholderText ~= nil then
		var4132.placeholder_text = propTypesModule.StringProp.jsonDecode(self.placeholderText)
	end
	return var4132
end

t_123.descriptor = {
	name = "AiOverviewFeedbackAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.AiOverviewFeedbackAction_Params = t_123
typeRegistryModule.default:register(t.AiOverviewFeedbackAction_Params)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p243) --[[ line: 23395 ]]
	-- upvalues: t (ref), t_124 (ref)
	return setmetatable({
		action_type = if p243 == nil or p243.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p243.action_type,
		action_params = if p243 == nil or p243.action_params == nil then nil else p243.action_params
	}, t_124)
end

function t_124:encode() --[[ line: 23406 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4134 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4135, var4136 = protoModule.writeTag(buff, var4134, 1, protoModule.wireTypes.varint)
		var4135, var4136 = protoModule.writeVarInt(var4135, var4136, t.ActionType.toNumber(self.action_type))
		buff = var4135
		var4134 = var4136
	end
	if self.action_params ~= nil then
		local var4137 = self.action_params:encode()
		local var4138, var4139 = protoModule.writeTag(buff, var4134, 2, protoModule.wireTypes.lengthDelimited)
		var4138, var4139 = protoModule.writeBuffer(var4138, var4139, var4137, buffer.len(var4137))
		buff = var4138
		var4134 = var4139
	end
	local buff_1 = buffer.create(var4134)
	buffer.copy(buff_1, 0, buff, 0, var4134)
	
	return buff_1
end

function t_124.decode(p244) --[[ line: 23432 ]]
	-- upvalues: t_124 (ref), protoModule (ref), t (ref)
	local var4141 = t_124.new()
	local var4142 = 0
	while var4142 < buffer.len(p244) do
		local _ = nil
		local var4143 = nil
		local var4144, var4145, var4146 = protoModule.readTag(p244, var4142)
		local var4147 = var4144
		var4143 = var4145
		var4142 = var4146
		
		if var4143 == protoModule.wireTypes.varint then
			if var4147 == 1 then
				local _ = nil
				local var4148, var4149 = protoModule.readVarIntI32(p244, var4142)
				local var4150 = var4148
				var4142 = var4149
				var4141.action_type = t.ActionType.fromNumber(var4150) or var4150
			else
				local _ = nil
				local var4151, var4152 = protoModule.readVarInt(p244, var4142)
				local _ = var4151
				var4142 = var4152
			end
		end
		if var4143 == protoModule.wireTypes.lengthDelimited then
			if var4147 == 2 then
				local _ = nil
				local var4153, var4154 = protoModule.readBuffer(p244, var4142)
				var4142 = var4154
				var4141.action_params = t.EnableEventNotificationsAction_Params.decode(var4153)
			else
				local _ = nil
				local var4155, var4156 = protoModule.readVarInt(p244, var4142)
				var4142 = var4156 + var4155
			end
		elseif var4143 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4157, var4158 = protoModule.readFixed32(p244, var4142)
			local _ = var4157
			var4142 = var4158
		elseif var4143 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4159, var4160 = protoModule.readFixed64(p244, var4142)
			local _ = var4159
			var4142 = var4160
		else
			error("Unsupported wire type: " .. var4143)
		end
	end
	return var4141
end

function t_124:jsonEncode() --[[ line: 23480 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_124:jsonDecode() --[[ line: 23502 ]]
	-- upvalues: t_124 (ref), t (ref)
	local var4162 = t_124.new()
	
	if self.action_type ~= nil then
		var4162.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4162.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4162.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4162.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.actionParams)
	end
	return var4162
end

t_124.descriptor = {
	name = "EnableEventNotificationsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.EnableEventNotificationsAction"
}
t.EnableEventNotificationsAction = t_124
typeRegistryModule.default:register(t.EnableEventNotificationsAction)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p245) --[[ line: 23542 ]]
	-- upvalues: t_125 (ref)
	return setmetatable({
		event_id = if p245 == nil or p245.event_id == nil then nil else p245.event_id,
		universe_id = if p245 == nil or p245.universe_id == nil then nil else p245.universe_id,
		channel = if p245 == nil or p245.channel == nil then nil else p245.channel
	}, t_125)
end

function t_125:encode() --[[ line: 23552 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4164 = 0
	
	if self.event_id ~= nil then
		local var4165 = self.event_id:encode()
		local var4166, var4167 = protoModule.writeTag(buff, var4164, 1, protoModule.wireTypes.lengthDelimited)
		var4166, var4167 = protoModule.writeBuffer(var4166, var4167, var4165, buffer.len(var4165))
		buff = var4166
		var4164 = var4167
	end
	if self.universe_id ~= nil then
		local var4168 = self.universe_id:encode()
		local var4169, var4170 = protoModule.writeTag(buff, var4164, 2, protoModule.wireTypes.lengthDelimited)
		var4169, var4170 = protoModule.writeBuffer(var4169, var4170, var4168, buffer.len(var4168))
		buff = var4169
		var4164 = var4170
	end
	if self.channel ~= nil then
		local var4171 = self.channel:encode()
		local var4172, var4173 = protoModule.writeTag(buff, var4164, 3, protoModule.wireTypes.lengthDelimited)
		var4172, var4173 = protoModule.writeBuffer(var4172, var4173, var4171, buffer.len(var4171))
		buff = var4172
		var4164 = var4173
	end
	local buff_1 = buffer.create(var4164)
	buffer.copy(buff_1, 0, buff, 0, var4164)
	
	return buff_1
end

function t_125.decode(p246) --[[ line: 23579 ]]
	-- upvalues: t_125 (ref), protoModule (ref), propTypesModule (ref)
	local var4175 = t_125.new()
	local var4176 = 0
	while var4176 < buffer.len(p246) do
		local _ = nil
		local var4177 = nil
		local var4178, var4179, var4180 = protoModule.readTag(p246, var4176)
		local var4181 = var4178
		var4177 = var4179
		var4176 = var4180
		
		if var4177 == protoModule.wireTypes.varint then
			local _ = nil
			local var4182, var4183 = protoModule.readVarInt(p246, var4176)
			local _ = var4182
			var4176 = var4183
			continue
		end
		if var4177 == protoModule.wireTypes.lengthDelimited then
			if var4181 == 1 then
				local _ = nil
				local var4184, var4185 = protoModule.readBuffer(p246, var4176)
				var4176 = var4185
				var4175.event_id = propTypesModule.StringProp.decode(var4184)
			elseif var4181 == 2 then
				local _ = nil
				local var4186, var4187 = protoModule.readBuffer(p246, var4176)
				var4176 = var4187
				var4175.universe_id = propTypesModule.StringProp.decode(var4186)
			elseif var4181 == 3 then
				local _ = nil
				local var4188, var4189 = protoModule.readBuffer(p246, var4176)
				var4176 = var4189
				var4175.channel = propTypesModule.StringProp.decode(var4188)
			else
				local _ = nil
				local var4190, var4191 = protoModule.readVarInt(p246, var4176)
				var4176 = var4191 + var4190
			end
		elseif var4177 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4192, var4193 = protoModule.readFixed32(p246, var4176)
			local _ = var4192
			var4176 = var4193
		elseif var4177 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4194, var4195 = protoModule.readFixed64(p246, var4176)
			local _ = var4194
			var4176 = var4195
		else
			error("Unsupported wire type: " .. var4177)
		end
	end
	return var4175
end

function t_125:jsonEncode() --[[ line: 23632 ]]
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.channel ~= nil then
		t.channel = self.channel:jsonEncode()
	end
	return t
end

function t_125:jsonDecode() --[[ line: 23650 ]]
	-- upvalues: t_125 (ref), propTypesModule (ref)
	local var4197 = t_125.new()
	
	if self.event_id ~= nil then
		var4197.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var4197.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.universe_id ~= nil then
		var4197.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var4197.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.channel ~= nil then
		var4197.channel = propTypesModule.StringProp.jsonDecode(self.channel)
	end
	return var4197
end

t_125.descriptor = {
	name = "EnableEventNotificationsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.EnableEventNotificationsAction_Params = t_125
typeRegistryModule.default:register(t.EnableEventNotificationsAction_Params)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p247) --[[ line: 23693 ]]
	-- upvalues: t (ref), t_126 (ref)
	return setmetatable({
		action_type = if p247 == nil or p247.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p247.action_type,
		action_params = if p247 == nil or p247.action_params == nil then nil else p247.action_params
	}, t_126)
end

function t_126:encode() --[[ line: 23704 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4199 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4200, var4201 = protoModule.writeTag(buff, var4199, 1, protoModule.wireTypes.varint)
		var4200, var4201 = protoModule.writeVarInt(var4200, var4201, t.ActionType.toNumber(self.action_type))
		buff = var4200
		var4199 = var4201
	end
	if self.action_params ~= nil then
		local var4202 = self.action_params:encode()
		local var4203, var4204 = protoModule.writeTag(buff, var4199, 2, protoModule.wireTypes.lengthDelimited)
		var4203, var4204 = protoModule.writeBuffer(var4203, var4204, var4202, buffer.len(var4202))
		buff = var4203
		var4199 = var4204
	end
	local buff_1 = buffer.create(var4199)
	buffer.copy(buff_1, 0, buff, 0, var4199)
	
	return buff_1
end

function t_126.decode(p248) --[[ line: 23730 ]]
	-- upvalues: t_126 (ref), protoModule (ref), t (ref)
	local var4206 = t_126.new()
	local var4207 = 0
	while var4207 < buffer.len(p248) do
		local _ = nil
		local var4208 = nil
		local var4209, var4210, var4211 = protoModule.readTag(p248, var4207)
		local var4212 = var4209
		var4208 = var4210
		var4207 = var4211
		
		if var4208 == protoModule.wireTypes.varint then
			if var4212 == 1 then
				local _ = nil
				local var4213, var4214 = protoModule.readVarIntI32(p248, var4207)
				local var4215 = var4213
				var4207 = var4214
				var4206.action_type = t.ActionType.fromNumber(var4215) or var4215
			else
				local _ = nil
				local var4216, var4217 = protoModule.readVarInt(p248, var4207)
				local _ = var4216
				var4207 = var4217
			end
		end
		if var4208 == protoModule.wireTypes.lengthDelimited then
			if var4212 == 2 then
				local _ = nil
				local var4218, var4219 = protoModule.readBuffer(p248, var4207)
				var4207 = var4219
				var4206.action_params = t.DismissEventNotificationsModalAction_Params.decode(var4218)
			else
				local _ = nil
				local var4220, var4221 = protoModule.readVarInt(p248, var4207)
				var4207 = var4221 + var4220
			end
		elseif var4208 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4222, var4223 = protoModule.readFixed32(p248, var4207)
			local _ = var4222
			var4207 = var4223
		elseif var4208 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4224, var4225 = protoModule.readFixed64(p248, var4207)
			local _ = var4224
			var4207 = var4225
		else
			error("Unsupported wire type: " .. var4208)
		end
	end
	return var4206
end

function t_126:jsonEncode() --[[ line: 23778 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_126:jsonDecode() --[[ line: 23800 ]]
	-- upvalues: t_126 (ref), t (ref)
	local var4227 = t_126.new()
	
	if self.action_type ~= nil then
		var4227.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4227.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4227.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4227.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.actionParams)
	end
	return var4227
end

t_126.descriptor = {
	name = "DismissEventNotificationsModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissEventNotificationsModalAction"
}
t.DismissEventNotificationsModalAction = t_126
typeRegistryModule.default:register(t.DismissEventNotificationsModalAction)
local t_127 = {}
t_127.__index = t_127

function t_127.new(p249) --[[ line: 23842 ]]
	-- upvalues: t_127 (ref)
	return setmetatable({
		event_id = if p249 == nil or p249.event_id == nil then nil else p249.event_id
	}, t_127)
end

function t_127:encode() --[[ line: 23850 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4229 = 0
	
	if self.event_id ~= nil then
		local var4230 = self.event_id:encode()
		local var4231, var4232 = protoModule.writeTag(buff, var4229, 1, protoModule.wireTypes.lengthDelimited)
		var4231, var4232 = protoModule.writeBuffer(var4231, var4232, var4230, buffer.len(var4230))
		buff = var4231
		var4229 = var4232
	end
	local buff_1 = buffer.create(var4229)
	buffer.copy(buff_1, 0, buff, 0, var4229)
	
	return buff_1
end

function t_127.decode(p250) --[[ line: 23867 ]]
	-- upvalues: t_127 (ref), protoModule (ref), propTypesModule (ref)
	local var4234 = t_127.new()
	local var4235 = 0
	while var4235 < buffer.len(p250) do
		local _ = nil
		local var4236 = nil
		local var4237, var4238, var4239 = protoModule.readTag(p250, var4235)
		local var4240 = var4237
		var4236 = var4238
		var4235 = var4239
		
		if var4236 == protoModule.wireTypes.varint then
			local _ = nil
			local var4241, var4242 = protoModule.readVarInt(p250, var4235)
			local _ = var4241
			var4235 = var4242
			continue
		end
		if var4236 == protoModule.wireTypes.lengthDelimited then
			if var4240 == 1 then
				local _ = nil
				local var4243, var4244 = protoModule.readBuffer(p250, var4235)
				var4235 = var4244
				var4234.event_id = propTypesModule.StringProp.decode(var4243)
			else
				local _ = nil
				local var4245, var4246 = protoModule.readVarInt(p250, var4235)
				var4235 = var4246 + var4245
			end
		elseif var4236 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4247, var4248 = protoModule.readFixed32(p250, var4235)
			local _ = var4247
			var4235 = var4248
		elseif var4236 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4249, var4250 = protoModule.readFixed64(p250, var4235)
			local _ = var4249
			var4235 = var4250
		else
			error("Unsupported wire type: " .. var4236)
		end
	end
	return var4234
end

function t_127:jsonEncode() --[[ line: 23912 ]]
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_127:jsonDecode() --[[ line: 23924 ]]
	-- upvalues: t_127 (ref), propTypesModule (ref)
	local var4252 = t_127.new()
	
	if self.event_id ~= nil then
		var4252.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var4252.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var4252
end

t_127.descriptor = {
	name = "DismissEventNotificationsModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissEventNotificationsModalAction_Params = t_127
typeRegistryModule.default:register(t.DismissEventNotificationsModalAction_Params)
local t_128 = {}
t_128.__index = t_128

function t_128.new(p251) --[[ line: 23954 ]]
	-- upvalues: t (ref), t_128 (ref)
	return setmetatable({
		action_type = if p251 == nil or p251.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p251.action_type,
		action_params = if p251 == nil or p251.action_params == nil then nil else p251.action_params
	}, t_128)
end

function t_128:encode() --[[ line: 23963 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4254 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4255, var4256 = protoModule.writeTag(buff, var4254, 1, protoModule.wireTypes.varint)
		var4255, var4256 = protoModule.writeVarInt(var4255, var4256, t.ActionType.toNumber(self.action_type))
		buff = var4255
		var4254 = var4256
	end
	if self.action_params ~= nil then
		local var4257 = self.action_params:encode()
		local var4258, var4259 = protoModule.writeTag(buff, var4254, 2, protoModule.wireTypes.lengthDelimited)
		var4258, var4259 = protoModule.writeBuffer(var4258, var4259, var4257, buffer.len(var4257))
		buff = var4258
		var4254 = var4259
	end
	local buff_1 = buffer.create(var4254)
	buffer.copy(buff_1, 0, buff, 0, var4254)
	
	return buff_1
end

function t_128.decode(p252) --[[ line: 23989 ]]
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var4261 = t_128.new()
	local var4262 = 0
	while var4262 < buffer.len(p252) do
		local _ = nil
		local var4263 = nil
		local var4264, var4265, var4266 = protoModule.readTag(p252, var4262)
		local var4267 = var4264
		var4263 = var4265
		var4262 = var4266
		
		if var4263 == protoModule.wireTypes.varint then
			if var4267 == 1 then
				local _ = nil
				local var4268, var4269 = protoModule.readVarIntI32(p252, var4262)
				local var4270 = var4268
				var4262 = var4269
				var4261.action_type = t.ActionType.fromNumber(var4270) or var4270
			else
				local _ = nil
				local var4271, var4272 = protoModule.readVarInt(p252, var4262)
				local _ = var4271
				var4262 = var4272
			end
		end
		if var4263 == protoModule.wireTypes.lengthDelimited then
			if var4267 == 2 then
				local _ = nil
				local var4273, var4274 = protoModule.readBuffer(p252, var4262)
				var4262 = var4274
				var4261.action_params = t.OpenAmpWizardAction_Params.decode(var4273)
			else
				local _ = nil
				local var4275, var4276 = protoModule.readVarInt(p252, var4262)
				var4262 = var4276 + var4275
			end
		elseif var4263 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4277, var4278 = protoModule.readFixed32(p252, var4262)
			local _ = var4277
			var4262 = var4278
		elseif var4263 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4279, var4280 = protoModule.readFixed64(p252, var4262)
			local _ = var4279
			var4262 = var4280
		else
			error("Unsupported wire type: " .. var4263)
		end
	end
	return var4261
end

function t_128:jsonEncode() --[[ line: 24037 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_128:jsonDecode() --[[ line: 24059 ]]
	-- upvalues: t_128 (ref), t (ref)
	local var4282 = t_128.new()
	
	if self.action_type ~= nil then
		var4282.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4282.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4282.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4282.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.actionParams)
	end
	return var4282
end

t_128.descriptor = {
	name = "OpenAmpWizardAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAmpWizardAction"
}
t.OpenAmpWizardAction = t_128
typeRegistryModule.default:register(t.OpenAmpWizardAction)
local t_129 = {}
t_129.__index = t_129

function t_129.new(p253) --[[ line: 24099 ]]
	-- upvalues: t_129 (ref)
	return setmetatable({
		feature_name = if p253 == nil or p253.feature_name == nil then nil else p253.feature_name,
		name_space = if p253 == nil or p253.name_space == nil then nil else p253.name_space,
		entry_point_event_ctx = if p253 == nil or p253.entry_point_event_ctx == nil then nil else p253.entry_point_event_ctx,
		skip_facial_age_estimation_web_link_modal = if p253 == nil or p253.skip_facial_age_estimation_web_link_modal == nil then nil else p253.skip_facial_age_estimation_web_link_modal
	}, t_129)
end

function t_129:encode() --[[ line: 24115 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4284 = 0
	
	if self.feature_name ~= nil then
		local var4285 = self.feature_name:encode()
		local var4286, var4287 = protoModule.writeTag(buff, var4284, 1, protoModule.wireTypes.lengthDelimited)
		var4286, var4287 = protoModule.writeBuffer(var4286, var4287, var4285, buffer.len(var4285))
		buff = var4286
		var4284 = var4287
	end
	if self.name_space ~= nil then
		local var4288 = self.name_space:encode()
		local var4289, var4290 = protoModule.writeTag(buff, var4284, 2, protoModule.wireTypes.lengthDelimited)
		var4289, var4290 = protoModule.writeBuffer(var4289, var4290, var4288, buffer.len(var4288))
		buff = var4289
		var4284 = var4290
	end
	if self.entry_point_event_ctx ~= nil then
		local var4291 = self.entry_point_event_ctx:encode()
		local var4292, var4293 = protoModule.writeTag(buff, var4284, 3, protoModule.wireTypes.lengthDelimited)
		var4292, var4293 = protoModule.writeBuffer(var4292, var4293, var4291, buffer.len(var4291))
		buff = var4292
		var4284 = var4293
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		local var4294 = self.skip_facial_age_estimation_web_link_modal:encode()
		local var4295, var4296 = protoModule.writeTag(buff, var4284, 4, protoModule.wireTypes.lengthDelimited)
		var4295, var4296 = protoModule.writeBuffer(var4295, var4296, var4294, buffer.len(var4294))
		buff = var4295
		var4284 = var4296
	end
	local buff_1 = buffer.create(var4284)
	buffer.copy(buff_1, 0, buff, 0, var4284)
	
	return buff_1
end

function t_129.decode(p254) --[[ line: 24148 ]]
	-- upvalues: t_129 (ref), protoModule (ref), propTypesModule (ref)
	local var4298 = t_129.new()
	local var4299 = 0
	while var4299 < buffer.len(p254) do
		local _ = nil
		local var4300 = nil
		local var4301, var4302, var4303 = protoModule.readTag(p254, var4299)
		local var4304 = var4301
		var4300 = var4302
		var4299 = var4303
		
		if var4300 == protoModule.wireTypes.varint then
			local _ = nil
			local var4305, var4306 = protoModule.readVarInt(p254, var4299)
			local _ = var4305
			var4299 = var4306
			continue
		end
		if var4300 == protoModule.wireTypes.lengthDelimited then
			if var4304 == 1 then
				local _ = nil
				local var4307, var4308 = protoModule.readBuffer(p254, var4299)
				var4299 = var4308
				var4298.feature_name = propTypesModule.StringProp.decode(var4307)
			elseif var4304 == 2 then
				local _ = nil
				local var4309, var4310 = protoModule.readBuffer(p254, var4299)
				var4299 = var4310
				var4298.name_space = propTypesModule.StringProp.decode(var4309)
			elseif var4304 == 3 then
				local _ = nil
				local var4311, var4312 = protoModule.readBuffer(p254, var4299)
				var4299 = var4312
				var4298.entry_point_event_ctx = propTypesModule.StringProp.decode(var4311)
			elseif var4304 == 4 then
				local _ = nil
				local var4313, var4314 = protoModule.readBuffer(p254, var4299)
				var4299 = var4314
				var4298.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.decode(var4313)
			else
				local _ = nil
				local var4315, var4316 = protoModule.readVarInt(p254, var4299)
				var4299 = var4316 + var4315
			end
		elseif var4300 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4317, var4318 = protoModule.readFixed32(p254, var4299)
			local _ = var4317
			var4299 = var4318
		elseif var4300 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4319, var4320 = protoModule.readFixed64(p254, var4299)
			local _ = var4319
			var4299 = var4320
		else
			error("Unsupported wire type: " .. var4300)
		end
	end
	return var4298
end

function t_129:jsonEncode() --[[ line: 24208 ]]
	local t = {}
	
	if self.feature_name ~= nil then
		t.featureName = self.feature_name:jsonEncode()
	end
	if self.name_space ~= nil then
		t.nameSpace = self.name_space:jsonEncode()
	end
	if self.entry_point_event_ctx ~= nil then
		t.entryPointEventCtx = self.entry_point_event_ctx:jsonEncode()
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		t.skipFacialAgeEstimationWebLinkModal = self.skip_facial_age_estimation_web_link_modal:jsonEncode()
	end
	return t
end

function t_129:jsonDecode() --[[ line: 24230 ]]
	-- upvalues: t_129 (ref), propTypesModule (ref)
	local var4322 = t_129.new()
	
	if self.feature_name ~= nil then
		var4322.feature_name = propTypesModule.StringProp.jsonDecode(self.feature_name)
	end
	if self.featureName ~= nil then
		var4322.feature_name = propTypesModule.StringProp.jsonDecode(self.featureName)
	end
	if self.name_space ~= nil then
		var4322.name_space = propTypesModule.StringProp.jsonDecode(self.name_space)
	end
	if self.nameSpace ~= nil then
		var4322.name_space = propTypesModule.StringProp.jsonDecode(self.nameSpace)
	end
	if self.entry_point_event_ctx ~= nil then
		var4322.entry_point_event_ctx = propTypesModule.StringProp.jsonDecode(self.entry_point_event_ctx)
	end
	if self.entryPointEventCtx ~= nil then
		var4322.entry_point_event_ctx = propTypesModule.StringProp.jsonDecode(self.entryPointEventCtx)
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		var4322.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.jsonDecode(self.skip_facial_age_estimation_web_link_modal)
	end
	if self.skipFacialAgeEstimationWebLinkModal ~= nil then
		var4322.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.jsonDecode(self.skipFacialAgeEstimationWebLinkModal)
	end
	return var4322
end

t_129.descriptor = {
	name = "OpenAmpWizardAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAmpWizardAction_Params = t_129
typeRegistryModule.default:register(t.OpenAmpWizardAction_Params)
local t_130 = {}
t_130.__index = t_130

function t_130.new(p255) --[[ line: 24292 ]]
	-- upvalues: t (ref), t_130 (ref)
	return setmetatable({
		action_type = if p255 == nil or p255.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p255.action_type,
		action_params = if p255 == nil or p255.action_params == nil then nil else p255.action_params
	}, t_130)
end

function t_130:encode() --[[ line: 24303 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4324 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4325, var4326 = protoModule.writeTag(buff, var4324, 1, protoModule.wireTypes.varint)
		var4325, var4326 = protoModule.writeVarInt(var4325, var4326, t.ActionType.toNumber(self.action_type))
		buff = var4325
		var4324 = var4326
	end
	if self.action_params ~= nil then
		local var4327 = self.action_params:encode()
		local var4328, var4329 = protoModule.writeTag(buff, var4324, 2, protoModule.wireTypes.lengthDelimited)
		var4328, var4329 = protoModule.writeBuffer(var4328, var4329, var4327, buffer.len(var4327))
		buff = var4328
		var4324 = var4329
	end
	local buff_1 = buffer.create(var4324)
	buffer.copy(buff_1, 0, buff, 0, var4324)
	
	return buff_1
end

function t_130.decode(p256) --[[ line: 24329 ]]
	-- upvalues: t_130 (ref), protoModule (ref), t (ref)
	local var4331 = t_130.new()
	local var4332 = 0
	while var4332 < buffer.len(p256) do
		local _ = nil
		local var4333 = nil
		local var4334, var4335, var4336 = protoModule.readTag(p256, var4332)
		local var4337 = var4334
		var4333 = var4335
		var4332 = var4336
		
		if var4333 == protoModule.wireTypes.varint then
			if var4337 == 1 then
				local _ = nil
				local var4338, var4339 = protoModule.readVarIntI32(p256, var4332)
				local var4340 = var4338
				var4332 = var4339
				var4331.action_type = t.ActionType.fromNumber(var4340) or var4340
			else
				local _ = nil
				local var4341, var4342 = protoModule.readVarInt(p256, var4332)
				local _ = var4341
				var4332 = var4342
			end
		end
		if var4333 == protoModule.wireTypes.lengthDelimited then
			if var4337 == 2 then
				local _ = nil
				local var4343, var4344 = protoModule.readBuffer(p256, var4332)
				var4332 = var4344
				var4331.action_params = t.OpenSocialProofUserListSheetAction_Params.decode(var4343)
			else
				local _ = nil
				local var4345, var4346 = protoModule.readVarInt(p256, var4332)
				var4332 = var4346 + var4345
			end
		elseif var4333 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4347, var4348 = protoModule.readFixed32(p256, var4332)
			local _ = var4347
			var4332 = var4348
		elseif var4333 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4349, var4350 = protoModule.readFixed64(p256, var4332)
			local _ = var4349
			var4332 = var4350
		else
			error("Unsupported wire type: " .. var4333)
		end
	end
	return var4331
end

function t_130:jsonEncode() --[[ line: 24377 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_130:jsonDecode() --[[ line: 24399 ]]
	-- upvalues: t_130 (ref), t (ref)
	local var4352 = t_130.new()
	
	if self.action_type ~= nil then
		var4352.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4352.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4352.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4352.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.actionParams)
	end
	return var4352
end

t_130.descriptor = {
	name = "OpenSocialProofUserListSheetAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSocialProofUserListSheetAction"
}
t.OpenSocialProofUserListSheetAction = t_130
typeRegistryModule.default:register(t.OpenSocialProofUserListSheetAction)
local t_131 = {}
t_131.__index = t_131

function t_131.new(p257) --[[ line: 24441 ]]
	-- upvalues: t_131 (ref)
	return setmetatable({
		universe_id = if p257 == nil or p257.universe_id == nil then nil else p257.universe_id,
		place_id = if p257 == nil or p257.place_id == nil then nil else p257.place_id,
		total_connections = if p257 == nil or p257.total_connections == nil then nil else p257.total_connections,
		user_ids = if p257 == nil or p257.user_ids == nil then nil else p257.user_ids,
		sheet_title = if p257 == nil or p257.sheet_title == nil then nil else p257.sheet_title
	}, t_131)
end

function t_131:encode() --[[ line: 24453 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4354 = 0
	
	if self.universe_id ~= nil then
		local var4355 = self.universe_id:encode()
		local var4356, var4357 = protoModule.writeTag(buff, var4354, 1, protoModule.wireTypes.lengthDelimited)
		var4356, var4357 = protoModule.writeBuffer(var4356, var4357, var4355, buffer.len(var4355))
		buff = var4356
		var4354 = var4357
	end
	if self.place_id ~= nil then
		local var4358 = self.place_id:encode()
		local var4359, var4360 = protoModule.writeTag(buff, var4354, 2, protoModule.wireTypes.lengthDelimited)
		var4359, var4360 = protoModule.writeBuffer(var4359, var4360, var4358, buffer.len(var4358))
		buff = var4359
		var4354 = var4360
	end
	if self.total_connections ~= nil then
		local var4361 = self.total_connections:encode()
		local var4362, var4363 = protoModule.writeTag(buff, var4354, 3, protoModule.wireTypes.lengthDelimited)
		var4362, var4363 = protoModule.writeBuffer(var4362, var4363, var4361, buffer.len(var4361))
		buff = var4362
		var4354 = var4363
	end
	if self.user_ids ~= nil then
		local var4364 = self.user_ids:encode()
		local var4365, var4366 = protoModule.writeTag(buff, var4354, 4, protoModule.wireTypes.lengthDelimited)
		var4365, var4366 = protoModule.writeBuffer(var4365, var4366, var4364, buffer.len(var4364))
		buff = var4365
		var4354 = var4366
	end
	if self.sheet_title ~= nil then
		local var4367 = self.sheet_title:encode()
		local var4368, var4369 = protoModule.writeTag(buff, var4354, 5, protoModule.wireTypes.lengthDelimited)
		var4368, var4369 = protoModule.writeBuffer(var4368, var4369, var4367, buffer.len(var4367))
		buff = var4368
		var4354 = var4369
	end
	local buff_1 = buffer.create(var4354)
	buffer.copy(buff_1, 0, buff, 0, var4354)
	
	return buff_1
end

function t_131.decode(p258) --[[ line: 24494 ]]
	-- upvalues: t_131 (ref), protoModule (ref), propTypesModule (ref)
	local var4371 = t_131.new()
	local var4372 = 0
	while var4372 < buffer.len(p258) do
		local _ = nil
		local var4373 = nil
		local var4374, var4375, var4376 = protoModule.readTag(p258, var4372)
		local var4377 = var4374
		var4373 = var4375
		var4372 = var4376
		
		if var4373 == protoModule.wireTypes.varint then
			local _ = nil
			local var4378, var4379 = protoModule.readVarInt(p258, var4372)
			local _ = var4378
			var4372 = var4379
			continue
		end
		if var4373 == protoModule.wireTypes.lengthDelimited then
			if var4377 == 1 then
				local _ = nil
				local var4380, var4381 = protoModule.readBuffer(p258, var4372)
				var4372 = var4381
				var4371.universe_id = propTypesModule.StringProp.decode(var4380)
			elseif var4377 == 2 then
				local _ = nil
				local var4382, var4383 = protoModule.readBuffer(p258, var4372)
				var4372 = var4383
				var4371.place_id = propTypesModule.StringProp.decode(var4382)
			elseif var4377 == 3 then
				local _ = nil
				local var4384, var4385 = protoModule.readBuffer(p258, var4372)
				var4372 = var4385
				var4371.total_connections = propTypesModule.Int32Prop.decode(var4384)
			elseif var4377 == 4 then
				local _ = nil
				local var4386, var4387 = protoModule.readBuffer(p258, var4372)
				var4372 = var4387
				var4371.user_ids = propTypesModule.ArrayOfAvatarProp.decode(var4386)
			elseif var4377 == 5 then
				local _ = nil
				local var4388, var4389 = protoModule.readBuffer(p258, var4372)
				var4372 = var4389
				var4371.sheet_title = propTypesModule.StringProp.decode(var4388)
			else
				local _ = nil
				local var4390, var4391 = protoModule.readVarInt(p258, var4372)
				var4372 = var4391 + var4390
			end
		elseif var4373 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4392, var4393 = protoModule.readFixed32(p258, var4372)
			local _ = var4392
			var4372 = var4393
		elseif var4373 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4394, var4395 = protoModule.readFixed64(p258, var4372)
			local _ = var4394
			var4372 = var4395
		else
			error("Unsupported wire type: " .. var4373)
		end
	end
	return var4371
end

function t_131:jsonEncode() --[[ line: 24559 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	if self.total_connections ~= nil then
		t.totalConnections = self.total_connections:jsonEncode()
	end
	if self.user_ids ~= nil then
		t.userIds = self.user_ids:jsonEncode()
	end
	if self.sheet_title ~= nil then
		t.sheetTitle = self.sheet_title:jsonEncode()
	end
	return t
end

function t_131:jsonDecode() --[[ line: 24587 ]]
	-- upvalues: t_131 (ref), propTypesModule (ref)
	local var4397 = t_131.new()
	
	if self.universe_id ~= nil then
		var4397.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var4397.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var4397.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var4397.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.total_connections ~= nil then
		var4397.total_connections = propTypesModule.Int32Prop.jsonDecode(self.total_connections)
	end
	if self.totalConnections ~= nil then
		var4397.total_connections = propTypesModule.Int32Prop.jsonDecode(self.totalConnections)
	end
	if self.user_ids ~= nil then
		var4397.user_ids = propTypesModule.ArrayOfAvatarProp.jsonDecode(self.user_ids)
	end
	if self.userIds ~= nil then
		var4397.user_ids = propTypesModule.ArrayOfAvatarProp.jsonDecode(self.userIds)
	end
	if self.sheet_title ~= nil then
		var4397.sheet_title = propTypesModule.StringProp.jsonDecode(self.sheet_title)
	end
	if self.sheetTitle ~= nil then
		var4397.sheet_title = propTypesModule.StringProp.jsonDecode(self.sheetTitle)
	end
	return var4397
end

t_131.descriptor = {
	name = "OpenSocialProofUserListSheetAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSocialProofUserListSheetAction_Params = t_131
typeRegistryModule.default:register(t.OpenSocialProofUserListSheetAction_Params)
local t_132 = {}
t_132.__index = t_132

function t_132.new(p259) --[[ line: 24655 ]]
	-- upvalues: t (ref), t_132 (ref)
	return setmetatable({
		action_type = if p259 == nil or p259.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p259.action_type,
		action_params = if p259 == nil or p259.action_params == nil then nil else p259.action_params
	}, t_132)
end

function t_132:encode() --[[ line: 24666 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4399 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4400, var4401 = protoModule.writeTag(buff, var4399, 1, protoModule.wireTypes.varint)
		var4400, var4401 = protoModule.writeVarInt(var4400, var4401, t.ActionType.toNumber(self.action_type))
		buff = var4400
		var4399 = var4401
	end
	if self.action_params ~= nil then
		local var4402 = self.action_params:encode()
		local var4403, var4404 = protoModule.writeTag(buff, var4399, 2, protoModule.wireTypes.lengthDelimited)
		var4403, var4404 = protoModule.writeBuffer(var4403, var4404, var4402, buffer.len(var4402))
		buff = var4403
		var4399 = var4404
	end
	local buff_1 = buffer.create(var4399)
	buffer.copy(buff_1, 0, buff, 0, var4399)
	
	return buff_1
end

function t_132.decode(p260) --[[ line: 24692 ]]
	-- upvalues: t_132 (ref), protoModule (ref), t (ref)
	local var4406 = t_132.new()
	local var4407 = 0
	while var4407 < buffer.len(p260) do
		local _ = nil
		local var4408 = nil
		local var4409, var4410, var4411 = protoModule.readTag(p260, var4407)
		local var4412 = var4409
		var4408 = var4410
		var4407 = var4411
		
		if var4408 == protoModule.wireTypes.varint then
			if var4412 == 1 then
				local _ = nil
				local var4413, var4414 = protoModule.readVarIntI32(p260, var4407)
				local var4415 = var4413
				var4407 = var4414
				var4406.action_type = t.ActionType.fromNumber(var4415) or var4415
			else
				local _ = nil
				local var4416, var4417 = protoModule.readVarInt(p260, var4407)
				local _ = var4416
				var4407 = var4417
			end
		end
		if var4408 == protoModule.wireTypes.lengthDelimited then
			if var4412 == 2 then
				local _ = nil
				local var4418, var4419 = protoModule.readBuffer(p260, var4407)
				var4407 = var4419
				var4406.action_params = t.OpenSearchResultsTabAction_Params.decode(var4418)
			else
				local _ = nil
				local var4420, var4421 = protoModule.readVarInt(p260, var4407)
				var4407 = var4421 + var4420
			end
		elseif var4408 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4422, var4423 = protoModule.readFixed32(p260, var4407)
			local _ = var4422
			var4407 = var4423
		elseif var4408 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4424, var4425 = protoModule.readFixed64(p260, var4407)
			local _ = var4424
			var4407 = var4425
		else
			error("Unsupported wire type: " .. var4408)
		end
	end
	return var4406
end

function t_132:jsonEncode() --[[ line: 24740 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_132:jsonDecode() --[[ line: 24762 ]]
	-- upvalues: t_132 (ref), t (ref)
	local var4427 = t_132.new()
	
	if self.action_type ~= nil then
		var4427.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4427.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4427.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4427.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.actionParams)
	end
	return var4427
end

t_132.descriptor = {
	name = "OpenSearchResultsTabAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSearchResultsTabAction"
}
t.OpenSearchResultsTabAction = t_132
typeRegistryModule.default:register(t.OpenSearchResultsTabAction)
local t_133 = {}
t_133.__index = t_133

function t_133.new(p261) --[[ line: 24802 ]]
	-- upvalues: t_133 (ref)
	return setmetatable({
		search_type = if p261 == nil or p261.search_type == nil then nil else p261.search_type
	}, t_133)
end

function t_133:encode() --[[ line: 24810 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4429 = 0
	
	if self.search_type ~= nil then
		local var4430 = self.search_type:encode()
		local var4431, var4432 = protoModule.writeTag(buff, var4429, 1, protoModule.wireTypes.lengthDelimited)
		var4431, var4432 = protoModule.writeBuffer(var4431, var4432, var4430, buffer.len(var4430))
		buff = var4431
		var4429 = var4432
	end
	local buff_1 = buffer.create(var4429)
	buffer.copy(buff_1, 0, buff, 0, var4429)
	
	return buff_1
end

function t_133.decode(p262) --[[ line: 24825 ]]
	-- upvalues: t_133 (ref), protoModule (ref), propTypesModule (ref)
	local var4434 = t_133.new()
	local var4435 = 0
	while var4435 < buffer.len(p262) do
		local _ = nil
		local var4436 = nil
		local var4437, var4438, var4439 = protoModule.readTag(p262, var4435)
		local var4440 = var4437
		var4436 = var4438
		var4435 = var4439
		
		if var4436 == protoModule.wireTypes.varint then
			local _ = nil
			local var4441, var4442 = protoModule.readVarInt(p262, var4435)
			local _ = var4441
			var4435 = var4442
			continue
		end
		if var4436 == protoModule.wireTypes.lengthDelimited then
			if var4440 == 1 then
				local _ = nil
				local var4443, var4444 = protoModule.readBuffer(p262, var4435)
				var4435 = var4444
				var4434.search_type = propTypesModule.StringProp.decode(var4443)
			else
				local _ = nil
				local var4445, var4446 = protoModule.readVarInt(p262, var4435)
				var4435 = var4446 + var4445
			end
		elseif var4436 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4447, var4448 = protoModule.readFixed32(p262, var4435)
			local _ = var4447
			var4435 = var4448
		elseif var4436 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4449, var4450 = protoModule.readFixed64(p262, var4435)
			local _ = var4449
			var4435 = var4450
		else
			error("Unsupported wire type: " .. var4436)
		end
	end
	return var4434
end

function t_133:jsonEncode() --[[ line: 24868 ]]
	local t = {}
	
	if self.search_type ~= nil then
		t.searchType = self.search_type:jsonEncode()
	end
	return t
end

function t_133:jsonDecode() --[[ line: 24878 ]]
	-- upvalues: t_133 (ref), propTypesModule (ref)
	local var4452 = t_133.new()
	
	if self.search_type ~= nil then
		var4452.search_type = propTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		var4452.search_type = propTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return var4452
end

t_133.descriptor = {
	name = "OpenSearchResultsTabAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSearchResultsTabAction_Params = t_133
typeRegistryModule.default:register(t.OpenSearchResultsTabAction_Params)
local t_134 = {}
t_134.__index = t_134

function t_134.new(p263) --[[ line: 24909 ]]
	-- upvalues: t (ref), t_134 (ref)
	return setmetatable({
		action_type = if p263 == nil or p263.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p263.action_type,
		action_params = if p263 == nil or p263.action_params == nil then nil else p263.action_params
	}, t_134)
end

function t_134:encode() --[[ line: 24918 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4454 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4455, var4456 = protoModule.writeTag(buff, var4454, 1, protoModule.wireTypes.varint)
		var4455, var4456 = protoModule.writeVarInt(var4455, var4456, t.ActionType.toNumber(self.action_type))
		buff = var4455
		var4454 = var4456
	end
	if self.action_params ~= nil then
		local var4457 = self.action_params:encode()
		local var4458, var4459 = protoModule.writeTag(buff, var4454, 2, protoModule.wireTypes.lengthDelimited)
		var4458, var4459 = protoModule.writeBuffer(var4458, var4459, var4457, buffer.len(var4457))
		buff = var4458
		var4454 = var4459
	end
	local buff_1 = buffer.create(var4454)
	buffer.copy(buff_1, 0, buff, 0, var4454)
	
	return buff_1
end

function t_134.decode(p264) --[[ line: 24944 ]]
	-- upvalues: t_134 (ref), protoModule (ref), t (ref)
	local var4461 = t_134.new()
	local var4462 = 0
	while var4462 < buffer.len(p264) do
		local _ = nil
		local var4463 = nil
		local var4464, var4465, var4466 = protoModule.readTag(p264, var4462)
		local var4467 = var4464
		var4463 = var4465
		var4462 = var4466
		
		if var4463 == protoModule.wireTypes.varint then
			if var4467 == 1 then
				local _ = nil
				local var4468, var4469 = protoModule.readVarIntI32(p264, var4462)
				local var4470 = var4468
				var4462 = var4469
				var4461.action_type = t.ActionType.fromNumber(var4470) or var4470
			else
				local _ = nil
				local var4471, var4472 = protoModule.readVarInt(p264, var4462)
				local _ = var4471
				var4462 = var4472
			end
		end
		if var4463 == protoModule.wireTypes.lengthDelimited then
			if var4467 == 2 then
				local _ = nil
				local var4473, var4474 = protoModule.readBuffer(p264, var4462)
				var4462 = var4474
				var4461.action_params = t.DismissPromptAction_Params.decode(var4473)
			else
				local _ = nil
				local var4475, var4476 = protoModule.readVarInt(p264, var4462)
				var4462 = var4476 + var4475
			end
		elseif var4463 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4477, var4478 = protoModule.readFixed32(p264, var4462)
			local _ = var4477
			var4462 = var4478
		elseif var4463 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4479, var4480 = protoModule.readFixed64(p264, var4462)
			local _ = var4479
			var4462 = var4480
		else
			error("Unsupported wire type: " .. var4463)
		end
	end
	return var4461
end

function t_134:jsonEncode() --[[ line: 24992 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_134:jsonDecode() --[[ line: 25014 ]]
	-- upvalues: t_134 (ref), t (ref)
	local var4482 = t_134.new()
	
	if self.action_type ~= nil then
		var4482.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4482.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4482.action_params = t.DismissPromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4482.action_params = t.DismissPromptAction_Params.jsonDecode(self.actionParams)
	end
	return var4482
end

t_134.descriptor = {
	name = "DismissPromptAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissPromptAction"
}
t.DismissPromptAction = t_134
typeRegistryModule.default:register(t.DismissPromptAction)
local t_135 = {}
t_135.__index = t_135

function t_135.new(p265) --[[ line: 25054 ]]
	-- upvalues: t_135 (ref)
	return setmetatable({
		prompt_type = if p265 == nil or p265.prompt_type == nil then nil else p265.prompt_type,
		prompt_id = if p265 == nil or p265.prompt_id == nil then nil else p265.prompt_id
	}, t_135)
end

function t_135:encode() --[[ line: 25063 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4484 = 0
	
	if self.prompt_type ~= nil then
		local var4485 = self.prompt_type:encode()
		local var4486, var4487 = protoModule.writeTag(buff, var4484, 1, protoModule.wireTypes.lengthDelimited)
		var4486, var4487 = protoModule.writeBuffer(var4486, var4487, var4485, buffer.len(var4485))
		buff = var4486
		var4484 = var4487
	end
	if self.prompt_id ~= nil then
		local var4488 = self.prompt_id:encode()
		local var4489, var4490 = protoModule.writeTag(buff, var4484, 2, protoModule.wireTypes.lengthDelimited)
		var4489, var4490 = protoModule.writeBuffer(var4489, var4490, var4488, buffer.len(var4488))
		buff = var4489
		var4484 = var4490
	end
	local buff_1 = buffer.create(var4484)
	buffer.copy(buff_1, 0, buff, 0, var4484)
	
	return buff_1
end

function t_135.decode(p266) --[[ line: 25084 ]]
	-- upvalues: t_135 (ref), protoModule (ref), propTypesModule (ref)
	local var4492 = t_135.new()
	local var4493 = 0
	while var4493 < buffer.len(p266) do
		local _ = nil
		local var4494 = nil
		local var4495, var4496, var4497 = protoModule.readTag(p266, var4493)
		local var4498 = var4495
		var4494 = var4496
		var4493 = var4497
		
		if var4494 == protoModule.wireTypes.varint then
			local _ = nil
			local var4499, var4500 = protoModule.readVarInt(p266, var4493)
			local _ = var4499
			var4493 = var4500
			continue
		end
		if var4494 == protoModule.wireTypes.lengthDelimited then
			if var4498 == 1 then
				local _ = nil
				local var4501, var4502 = protoModule.readBuffer(p266, var4493)
				var4493 = var4502
				var4492.prompt_type = propTypesModule.StringProp.decode(var4501)
			elseif var4498 == 2 then
				local _ = nil
				local var4503, var4504 = protoModule.readBuffer(p266, var4493)
				var4493 = var4504
				var4492.prompt_id = propTypesModule.StringProp.decode(var4503)
			else
				local _ = nil
				local var4505, var4506 = protoModule.readVarInt(p266, var4493)
				var4493 = var4506 + var4505
			end
		elseif var4494 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4507, var4508 = protoModule.readFixed32(p266, var4493)
			local _ = var4507
			var4493 = var4508
		elseif var4494 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4509, var4510 = protoModule.readFixed64(p266, var4493)
			local _ = var4509
			var4493 = var4510
		else
			error("Unsupported wire type: " .. var4494)
		end
	end
	return var4492
end

function t_135:jsonEncode() --[[ line: 25132 ]]
	local t = {}
	
	if self.prompt_type ~= nil then
		t.promptType = self.prompt_type:jsonEncode()
	end
	if self.prompt_id ~= nil then
		t.promptId = self.prompt_id:jsonEncode()
	end
	return t
end

function t_135:jsonDecode() --[[ line: 25146 ]]
	-- upvalues: t_135 (ref), propTypesModule (ref)
	local var4512 = t_135.new()
	
	if self.prompt_type ~= nil then
		var4512.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var4512.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var4512.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var4512.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	return var4512
end

t_135.descriptor = {
	name = "DismissPromptAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissPromptAction_Params = t_135
typeRegistryModule.default:register(t.DismissPromptAction_Params)
local t_136 = {}
t_136.__index = t_136

function t_136.new(p267) --[[ line: 25184 ]]
	-- upvalues: t (ref), t_136 (ref)
	return setmetatable({
		action_type = if p267 == nil or p267.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p267.action_type,
		action_params = if p267 == nil or p267.action_params == nil then nil else p267.action_params
	}, t_136)
end

function t_136:encode() --[[ line: 25198 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4514 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4515, var4516 = protoModule.writeTag(buff, var4514, 1, protoModule.wireTypes.varint)
		var4515, var4516 = protoModule.writeVarInt(var4515, var4516, t.ActionType.toNumber(self.action_type))
		buff = var4515
		var4514 = var4516
	end
	if self.action_params ~= nil then
		local var4517 = self.action_params:encode()
		local var4518, var4519 = protoModule.writeTag(buff, var4514, 2, protoModule.wireTypes.lengthDelimited)
		var4518, var4519 = protoModule.writeBuffer(var4518, var4519, var4517, buffer.len(var4517))
		buff = var4518
		var4514 = var4519
	end
	local buff_1 = buffer.create(var4514)
	buffer.copy(buff_1, 0, buff, 0, var4514)
	
	return buff_1
end

function t_136.decode(p268) --[[ line: 25226 ]]
	-- upvalues: t_136 (ref), protoModule (ref), t (ref)
	local var4521 = t_136.new()
	local var4522 = 0
	while var4522 < buffer.len(p268) do
		local _ = nil
		local var4523 = nil
		local var4524, var4525, var4526 = protoModule.readTag(p268, var4522)
		local var4527 = var4524
		var4523 = var4525
		var4522 = var4526
		
		if var4523 == protoModule.wireTypes.varint then
			if var4527 == 1 then
				local _ = nil
				local var4528, var4529 = protoModule.readVarIntI32(p268, var4522)
				local var4530 = var4528
				var4522 = var4529
				var4521.action_type = t.ActionType.fromNumber(var4530) or var4530
			else
				local _ = nil
				local var4531, var4532 = protoModule.readVarInt(p268, var4522)
				local _ = var4531
				var4522 = var4532
			end
		end
		if var4523 == protoModule.wireTypes.lengthDelimited then
			if var4527 == 2 then
				local _ = nil
				local var4533, var4534 = protoModule.readBuffer(p268, var4522)
				var4522 = var4534
				var4521.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.decode(var4533)
			else
				local _ = nil
				local var4535, var4536 = protoModule.readVarInt(p268, var4522)
				var4522 = var4536 + var4535
			end
		elseif var4523 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4537, var4538 = protoModule.readFixed32(p268, var4522)
			local _ = var4537
			var4522 = var4538
		elseif var4523 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4539, var4540 = protoModule.readFixed64(p268, var4522)
			local _ = var4539
			var4522 = var4540
		else
			error("Unsupported wire type: " .. var4523)
		end
	end
	return var4521
end

function t_136:jsonEncode() --[[ line: 25277 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_136:jsonDecode() --[[ line: 25301 ]]
	-- upvalues: t_136 (ref), t (ref)
	local var4542 = t_136.new()
	
	if self.action_type ~= nil then
		var4542.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4542.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4542.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4542.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.actionParams)
	end
	return var4542
end

t_136.descriptor = {
	name = "RecordPartyChatConversationUpsellAcknowledgementAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecordPartyChatConversationUpsellAcknowledgementAction"
}
t.RecordPartyChatConversationUpsellAcknowledgementAction = t_136
typeRegistryModule.default:register(t.RecordPartyChatConversationUpsellAcknowledgementAction)
local t_137 = {}
t_137.__index = t_137

function t_137.new(p269) --[[ line: 25347 ]]
	-- upvalues: t_137 (ref)
	return setmetatable({
		modal_action = if p269 == nil or p269.modal_action == nil then nil else p269.modal_action,
		modal_variant = if p269 == nil or p269.modal_variant == nil then nil else p269.modal_variant,
		modal_sequence = if p269 == nil or p269.modal_sequence == nil then nil else p269.modal_sequence,
		conversation_id = if p269 == nil or p269.conversation_id == nil then nil else p269.conversation_id,
		friend_id = if p269 == nil or p269.friend_id == nil then nil else p269.friend_id
	}, t_137)
end

function t_137:encode() --[[ line: 25362 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4544 = 0
	
	if self.modal_action ~= nil then
		local var4545 = self.modal_action:encode()
		local var4546, var4547 = protoModule.writeTag(buff, var4544, 1, protoModule.wireTypes.lengthDelimited)
		var4546, var4547 = protoModule.writeBuffer(var4546, var4547, var4545, buffer.len(var4545))
		buff = var4546
		var4544 = var4547
	end
	if self.modal_variant ~= nil then
		local var4548 = self.modal_variant:encode()
		local var4549, var4550 = protoModule.writeTag(buff, var4544, 2, protoModule.wireTypes.lengthDelimited)
		var4549, var4550 = protoModule.writeBuffer(var4549, var4550, var4548, buffer.len(var4548))
		buff = var4549
		var4544 = var4550
	end
	if self.modal_sequence ~= nil then
		local var4551 = self.modal_sequence:encode()
		local var4552, var4553 = protoModule.writeTag(buff, var4544, 3, protoModule.wireTypes.lengthDelimited)
		var4552, var4553 = protoModule.writeBuffer(var4552, var4553, var4551, buffer.len(var4551))
		buff = var4552
		var4544 = var4553
	end
	if self.conversation_id ~= nil then
		local var4554 = self.conversation_id:encode()
		local var4555, var4556 = protoModule.writeTag(buff, var4544, 4, protoModule.wireTypes.lengthDelimited)
		var4555, var4556 = protoModule.writeBuffer(var4555, var4556, var4554, buffer.len(var4554))
		buff = var4555
		var4544 = var4556
	end
	if self.friend_id ~= nil then
		local var4557 = self.friend_id:encode()
		local var4558, var4559 = protoModule.writeTag(buff, var4544, 5, protoModule.wireTypes.lengthDelimited)
		var4558, var4559 = protoModule.writeBuffer(var4558, var4559, var4557, buffer.len(var4557))
		buff = var4558
		var4544 = var4559
	end
	local buff_1 = buffer.create(var4544)
	buffer.copy(buff_1, 0, buff, 0, var4544)
	
	return buff_1
end

function t_137.decode(p270) --[[ line: 25403 ]]
	-- upvalues: t_137 (ref), protoModule (ref), propTypesModule (ref)
	local var4561 = t_137.new()
	local var4562 = 0
	while var4562 < buffer.len(p270) do
		local _ = nil
		local var4563 = nil
		local var4564, var4565, var4566 = protoModule.readTag(p270, var4562)
		local var4567 = var4564
		var4563 = var4565
		var4562 = var4566
		
		if var4563 == protoModule.wireTypes.varint then
			local _ = nil
			local var4568, var4569 = protoModule.readVarInt(p270, var4562)
			local _ = var4568
			var4562 = var4569
			continue
		end
		if var4563 == protoModule.wireTypes.lengthDelimited then
			if var4567 == 1 then
				local _ = nil
				local var4570, var4571 = protoModule.readBuffer(p270, var4562)
				var4562 = var4571
				var4561.modal_action = propTypesModule.StringProp.decode(var4570)
			elseif var4567 == 2 then
				local _ = nil
				local var4572, var4573 = protoModule.readBuffer(p270, var4562)
				var4562 = var4573
				var4561.modal_variant = propTypesModule.StringProp.decode(var4572)
			elseif var4567 == 3 then
				local _ = nil
				local var4574, var4575 = protoModule.readBuffer(p270, var4562)
				var4562 = var4575
				var4561.modal_sequence = propTypesModule.StringProp.decode(var4574)
			elseif var4567 == 4 then
				local _ = nil
				local var4576, var4577 = protoModule.readBuffer(p270, var4562)
				var4562 = var4577
				var4561.conversation_id = propTypesModule.StringProp.decode(var4576)
			elseif var4567 == 5 then
				local _ = nil
				local var4578, var4579 = protoModule.readBuffer(p270, var4562)
				var4562 = var4579
				var4561.friend_id = propTypesModule.StringProp.decode(var4578)
			else
				local _ = nil
				local var4580, var4581 = protoModule.readVarInt(p270, var4562)
				var4562 = var4581 + var4580
			end
		elseif var4563 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4582, var4583 = protoModule.readFixed32(p270, var4562)
			local _ = var4582
			var4562 = var4583
		elseif var4563 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4584, var4585 = protoModule.readFixed64(p270, var4562)
			local _ = var4584
			var4562 = var4585
		else
			error("Unsupported wire type: " .. var4563)
		end
	end
	return var4561
end

function t_137:jsonEncode() --[[ line: 25468 ]]
	local t = {}
	
	if self.modal_action ~= nil then
		t.modalAction = self.modal_action:jsonEncode()
	end
	if self.modal_variant ~= nil then
		t.modalVariant = self.modal_variant:jsonEncode()
	end
	if self.modal_sequence ~= nil then
		t.modalSequence = self.modal_sequence:jsonEncode()
	end
	if self.conversation_id ~= nil then
		t.conversationId = self.conversation_id:jsonEncode()
	end
	if self.friend_id ~= nil then
		t.friendId = self.friend_id:jsonEncode()
	end
	return t
end

function t_137:jsonDecode() --[[ line: 25496 ]]
	-- upvalues: t_137 (ref), propTypesModule (ref)
	local var4587 = t_137.new()
	
	if self.modal_action ~= nil then
		var4587.modal_action = propTypesModule.StringProp.jsonDecode(self.modal_action)
	end
	if self.modalAction ~= nil then
		var4587.modal_action = propTypesModule.StringProp.jsonDecode(self.modalAction)
	end
	if self.modal_variant ~= nil then
		var4587.modal_variant = propTypesModule.StringProp.jsonDecode(self.modal_variant)
	end
	if self.modalVariant ~= nil then
		var4587.modal_variant = propTypesModule.StringProp.jsonDecode(self.modalVariant)
	end
	if self.modal_sequence ~= nil then
		var4587.modal_sequence = propTypesModule.StringProp.jsonDecode(self.modal_sequence)
	end
	if self.modalSequence ~= nil then
		var4587.modal_sequence = propTypesModule.StringProp.jsonDecode(self.modalSequence)
	end
	if self.conversation_id ~= nil then
		var4587.conversation_id = propTypesModule.StringProp.jsonDecode(self.conversation_id)
	end
	if self.conversationId ~= nil then
		var4587.conversation_id = propTypesModule.StringProp.jsonDecode(self.conversationId)
	end
	if self.friend_id ~= nil then
		var4587.friend_id = propTypesModule.StringProp.jsonDecode(self.friend_id)
	end
	if self.friendId ~= nil then
		var4587.friend_id = propTypesModule.StringProp.jsonDecode(self.friendId)
	end
	return var4587
end

t_137.descriptor = {
	name = "RecordPartyChatConversationUpsellAcknowledgementAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RecordPartyChatConversationUpsellAcknowledgementAction_Params = t_137
typeRegistryModule.default:register(t.RecordPartyChatConversationUpsellAcknowledgementAction_Params)
local t_138 = {}
t_138.__index = t_138

function t_138.new(p271) --[[ line: 25567 ]]
	-- upvalues: t (ref), t_138 (ref)
	return setmetatable({
		action_type = if p271 == nil or p271.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p271.action_type,
		action_params = if p271 == nil or p271.action_params == nil then nil else p271.action_params
	}, t_138)
end

function t_138:encode() --[[ line: 25576 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4589 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4590, var4591 = protoModule.writeTag(buff, var4589, 1, protoModule.wireTypes.varint)
		var4590, var4591 = protoModule.writeVarInt(var4590, var4591, t.ActionType.toNumber(self.action_type))
		buff = var4590
		var4589 = var4591
	end
	if self.action_params ~= nil then
		local var4592 = self.action_params:encode()
		local var4593, var4594 = protoModule.writeTag(buff, var4589, 2, protoModule.wireTypes.lengthDelimited)
		var4593, var4594 = protoModule.writeBuffer(var4593, var4594, var4592, buffer.len(var4592))
		buff = var4593
		var4589 = var4594
	end
	local buff_1 = buffer.create(var4589)
	buffer.copy(buff_1, 0, buff, 0, var4589)
	
	return buff_1
end

function t_138.decode(p272) --[[ line: 25602 ]]
	-- upvalues: t_138 (ref), protoModule (ref), t (ref)
	local var4596 = t_138.new()
	local var4597 = 0
	while var4597 < buffer.len(p272) do
		local _ = nil
		local var4598 = nil
		local var4599, var4600, var4601 = protoModule.readTag(p272, var4597)
		local var4602 = var4599
		var4598 = var4600
		var4597 = var4601
		
		if var4598 == protoModule.wireTypes.varint then
			if var4602 == 1 then
				local _ = nil
				local var4603, var4604 = protoModule.readVarIntI32(p272, var4597)
				local var4605 = var4603
				var4597 = var4604
				var4596.action_type = t.ActionType.fromNumber(var4605) or var4605
			else
				local _ = nil
				local var4606, var4607 = protoModule.readVarInt(p272, var4597)
				local _ = var4606
				var4597 = var4607
			end
		end
		if var4598 == protoModule.wireTypes.lengthDelimited then
			if var4602 == 2 then
				local _ = nil
				local var4608, var4609 = protoModule.readBuffer(p272, var4597)
				var4597 = var4609
				var4596.action_params = t.RequestFriendshipAction_Params.decode(var4608)
			else
				local _ = nil
				local var4610, var4611 = protoModule.readVarInt(p272, var4597)
				var4597 = var4611 + var4610
			end
		elseif var4598 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4612, var4613 = protoModule.readFixed32(p272, var4597)
			local _ = var4612
			var4597 = var4613
		elseif var4598 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4614, var4615 = protoModule.readFixed64(p272, var4597)
			local _ = var4614
			var4597 = var4615
		else
			error("Unsupported wire type: " .. var4598)
		end
	end
	return var4596
end

function t_138:jsonEncode() --[[ line: 25650 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_138:jsonDecode() --[[ line: 25672 ]]
	-- upvalues: t_138 (ref), t (ref)
	local var4617 = t_138.new()
	
	if self.action_type ~= nil then
		var4617.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4617.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4617.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4617.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.actionParams)
	end
	return var4617
end

t_138.descriptor = {
	name = "RequestFriendshipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RequestFriendshipAction"
}
t.RequestFriendshipAction = t_138
typeRegistryModule.default:register(t.RequestFriendshipAction)
local t_139 = {}
t_139.__index = t_139

function t_139.new(p273) --[[ line: 25712 ]]
	-- upvalues: t_139 (ref)
	return setmetatable({
		target_user_id = if p273 == nil or p273.target_user_id == nil then nil else p273.target_user_id,
		source = if p273 == nil or p273.source == nil then nil else p273.source
	}, t_139)
end

function t_139:encode() --[[ line: 25721 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4619 = 0
	
	if self.target_user_id ~= nil then
		local var4620 = self.target_user_id:encode()
		local var4621, var4622 = protoModule.writeTag(buff, var4619, 1, protoModule.wireTypes.lengthDelimited)
		var4621, var4622 = protoModule.writeBuffer(var4621, var4622, var4620, buffer.len(var4620))
		buff = var4621
		var4619 = var4622
	end
	if self.source ~= nil then
		local var4623 = self.source:encode()
		local var4624, var4625 = protoModule.writeTag(buff, var4619, 2, protoModule.wireTypes.lengthDelimited)
		var4624, var4625 = protoModule.writeBuffer(var4624, var4625, var4623, buffer.len(var4623))
		buff = var4624
		var4619 = var4625
	end
	local buff_1 = buffer.create(var4619)
	buffer.copy(buff_1, 0, buff, 0, var4619)
	
	return buff_1
end

function t_139.decode(p274) --[[ line: 25742 ]]
	-- upvalues: t_139 (ref), protoModule (ref), propTypesModule (ref)
	local var4627 = t_139.new()
	local var4628 = 0
	while var4628 < buffer.len(p274) do
		local _ = nil
		local var4629 = nil
		local var4630, var4631, var4632 = protoModule.readTag(p274, var4628)
		local var4633 = var4630
		var4629 = var4631
		var4628 = var4632
		
		if var4629 == protoModule.wireTypes.varint then
			local _ = nil
			local var4634, var4635 = protoModule.readVarInt(p274, var4628)
			local _ = var4634
			var4628 = var4635
			continue
		end
		if var4629 == protoModule.wireTypes.lengthDelimited then
			if var4633 == 1 then
				local _ = nil
				local var4636, var4637 = protoModule.readBuffer(p274, var4628)
				var4628 = var4637
				var4627.target_user_id = propTypesModule.StringProp.decode(var4636)
			elseif var4633 == 2 then
				local _ = nil
				local var4638, var4639 = protoModule.readBuffer(p274, var4628)
				var4628 = var4639
				var4627.source = propTypesModule.StringProp.decode(var4638)
			else
				local _ = nil
				local var4640, var4641 = protoModule.readVarInt(p274, var4628)
				var4628 = var4641 + var4640
			end
		elseif var4629 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4642, var4643 = protoModule.readFixed32(p274, var4628)
			local _ = var4642
			var4628 = var4643
		elseif var4629 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4644, var4645 = protoModule.readFixed64(p274, var4628)
			local _ = var4644
			var4628 = var4645
		else
			error("Unsupported wire type: " .. var4629)
		end
	end
	return var4627
end

function t_139:jsonEncode() --[[ line: 25790 ]]
	local t = {}
	
	if self.target_user_id ~= nil then
		t.targetUserId = self.target_user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_139:jsonDecode() --[[ line: 25804 ]]
	-- upvalues: t_139 (ref), propTypesModule (ref)
	local var4647 = t_139.new()
	
	if self.target_user_id ~= nil then
		var4647.target_user_id = propTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		var4647.target_user_id = propTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	if self.source ~= nil then
		var4647.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var4647
end

t_139.descriptor = {
	name = "RequestFriendshipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RequestFriendshipAction_Params = t_139
typeRegistryModule.default:register(t.RequestFriendshipAction_Params)
local t_140 = {}
t_140.__index = t_140

function t_140.new(p275) --[[ line: 25838 ]]
	-- upvalues: t (ref), t_140 (ref)
	return setmetatable({
		action_type = if p275 == nil or p275.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p275.action_type,
		action_params = if p275 == nil or p275.action_params == nil then nil else p275.action_params
	}, t_140)
end

function t_140:encode() --[[ line: 25849 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4649 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4650, var4651 = protoModule.writeTag(buff, var4649, 1, protoModule.wireTypes.varint)
		var4650, var4651 = protoModule.writeVarInt(var4650, var4651, t.ActionType.toNumber(self.action_type))
		buff = var4650
		var4649 = var4651
	end
	if self.action_params ~= nil then
		local var4652 = self.action_params:encode()
		local var4653, var4654 = protoModule.writeTag(buff, var4649, 2, protoModule.wireTypes.lengthDelimited)
		var4653, var4654 = protoModule.writeBuffer(var4653, var4654, var4652, buffer.len(var4652))
		buff = var4653
		var4649 = var4654
	end
	local buff_1 = buffer.create(var4649)
	buffer.copy(buff_1, 0, buff, 0, var4649)
	
	return buff_1
end

function t_140.decode(p276) --[[ line: 25875 ]]
	-- upvalues: t_140 (ref), protoModule (ref), t (ref)
	local var4656 = t_140.new()
	local var4657 = 0
	while var4657 < buffer.len(p276) do
		local _ = nil
		local var4658 = nil
		local var4659, var4660, var4661 = protoModule.readTag(p276, var4657)
		local var4662 = var4659
		var4658 = var4660
		var4657 = var4661
		
		if var4658 == protoModule.wireTypes.varint then
			if var4662 == 1 then
				local _ = nil
				local var4663, var4664 = protoModule.readVarIntI32(p276, var4657)
				local var4665 = var4663
				var4657 = var4664
				var4656.action_type = t.ActionType.fromNumber(var4665) or var4665
			else
				local _ = nil
				local var4666, var4667 = protoModule.readVarInt(p276, var4657)
				local _ = var4666
				var4657 = var4667
			end
		end
		if var4658 == protoModule.wireTypes.lengthDelimited then
			if var4662 == 2 then
				local _ = nil
				local var4668, var4669 = protoModule.readBuffer(p276, var4657)
				var4657 = var4669
				var4656.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.decode(var4668)
			else
				local _ = nil
				local var4670, var4671 = protoModule.readVarInt(p276, var4657)
				var4657 = var4671 + var4670
			end
		elseif var4658 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4672, var4673 = protoModule.readFixed32(p276, var4657)
			local _ = var4672
			var4657 = var4673
		elseif var4658 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4674, var4675 = protoModule.readFixed64(p276, var4657)
			local _ = var4674
			var4657 = var4675
		else
			error("Unsupported wire type: " .. var4658)
		end
	end
	return var4656
end

function t_140:jsonEncode() --[[ line: 25923 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_140:jsonDecode() --[[ line: 25945 ]]
	-- upvalues: t_140 (ref), t (ref)
	local var4677 = t_140.new()
	
	if self.action_type ~= nil then
		var4677.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4677.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4677.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4677.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var4677
end

t_140.descriptor = {
	name = "OpenTrustedFriendsUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenTrustedFriendsUpsellModalAction"
}
t.OpenTrustedFriendsUpsellModalAction = t_140
typeRegistryModule.default:register(t.OpenTrustedFriendsUpsellModalAction)
local t_141 = {}
t_141.__index = t_141

function t_141.new(p277) --[[ line: 25987 ]]
	-- upvalues: t_141 (ref)
	return setmetatable({
		target_user_id = if p277 == nil or p277.target_user_id == nil then nil else p277.target_user_id
	}, t_141)
end

function t_141:encode() --[[ line: 25995 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4679 = 0
	
	if self.target_user_id ~= nil then
		local var4680 = self.target_user_id:encode()
		local var4681, var4682 = protoModule.writeTag(buff, var4679, 1, protoModule.wireTypes.lengthDelimited)
		var4681, var4682 = protoModule.writeBuffer(var4681, var4682, var4680, buffer.len(var4680))
		buff = var4681
		var4679 = var4682
	end
	local buff_1 = buffer.create(var4679)
	buffer.copy(buff_1, 0, buff, 0, var4679)
	
	return buff_1
end

function t_141.decode(p278) --[[ line: 26012 ]]
	-- upvalues: t_141 (ref), protoModule (ref), propTypesModule (ref)
	local var4684 = t_141.new()
	local var4685 = 0
	while var4685 < buffer.len(p278) do
		local _ = nil
		local var4686 = nil
		local var4687, var4688, var4689 = protoModule.readTag(p278, var4685)
		local var4690 = var4687
		var4686 = var4688
		var4685 = var4689
		
		if var4686 == protoModule.wireTypes.varint then
			local _ = nil
			local var4691, var4692 = protoModule.readVarInt(p278, var4685)
			local _ = var4691
			var4685 = var4692
			continue
		end
		if var4686 == protoModule.wireTypes.lengthDelimited then
			if var4690 == 1 then
				local _ = nil
				local var4693, var4694 = protoModule.readBuffer(p278, var4685)
				var4685 = var4694
				var4684.target_user_id = propTypesModule.StringProp.decode(var4693)
			else
				local _ = nil
				local var4695, var4696 = protoModule.readVarInt(p278, var4685)
				var4685 = var4696 + var4695
			end
		elseif var4686 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4697, var4698 = protoModule.readFixed32(p278, var4685)
			local _ = var4697
			var4685 = var4698
		elseif var4686 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4699, var4700 = protoModule.readFixed64(p278, var4685)
			local _ = var4699
			var4685 = var4700
		else
			error("Unsupported wire type: " .. var4686)
		end
	end
	return var4684
end

function t_141:jsonEncode() --[[ line: 26057 ]]
	local t = {}
	
	if self.target_user_id ~= nil then
		t.targetUserId = self.target_user_id:jsonEncode()
	end
	return t
end

function t_141:jsonDecode() --[[ line: 26069 ]]
	-- upvalues: t_141 (ref), propTypesModule (ref)
	local var4702 = t_141.new()
	
	if self.target_user_id ~= nil then
		var4702.target_user_id = propTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		var4702.target_user_id = propTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	return var4702
end

t_141.descriptor = {
	name = "OpenTrustedFriendsUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenTrustedFriendsUpsellModalAction_Params = t_141
typeRegistryModule.default:register(t.OpenTrustedFriendsUpsellModalAction_Params)
local t_142 = {}
t_142.__index = t_142

function t_142.new(p279) --[[ line: 26101 ]]
	-- upvalues: t (ref), t_142 (ref)
	return setmetatable({
		action_type = if p279 == nil or p279.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p279.action_type,
		action_params = if p279 == nil or p279.action_params == nil then nil else p279.action_params
	}, t_142)
end

function t_142:encode() --[[ line: 26112 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4704 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4705, var4706 = protoModule.writeTag(buff, var4704, 1, protoModule.wireTypes.varint)
		var4705, var4706 = protoModule.writeVarInt(var4705, var4706, t.ActionType.toNumber(self.action_type))
		buff = var4705
		var4704 = var4706
	end
	if self.action_params ~= nil then
		local var4707 = self.action_params:encode()
		local var4708, var4709 = protoModule.writeTag(buff, var4704, 2, protoModule.wireTypes.lengthDelimited)
		var4708, var4709 = protoModule.writeBuffer(var4708, var4709, var4707, buffer.len(var4707))
		buff = var4708
		var4704 = var4709
	end
	local buff_1 = buffer.create(var4704)
	buffer.copy(buff_1, 0, buff, 0, var4704)
	
	return buff_1
end

function t_142.decode(p280) --[[ line: 26138 ]]
	-- upvalues: t_142 (ref), protoModule (ref), t (ref)
	local var4711 = t_142.new()
	local var4712 = 0
	while var4712 < buffer.len(p280) do
		local _ = nil
		local var4713 = nil
		local var4714, var4715, var4716 = protoModule.readTag(p280, var4712)
		local var4717 = var4714
		var4713 = var4715
		var4712 = var4716
		
		if var4713 == protoModule.wireTypes.varint then
			if var4717 == 1 then
				local _ = nil
				local var4718, var4719 = protoModule.readVarIntI32(p280, var4712)
				local var4720 = var4718
				var4712 = var4719
				var4711.action_type = t.ActionType.fromNumber(var4720) or var4720
			else
				local _ = nil
				local var4721, var4722 = protoModule.readVarInt(p280, var4712)
				local _ = var4721
				var4712 = var4722
			end
		end
		if var4713 == protoModule.wireTypes.lengthDelimited then
			if var4717 == 2 then
				local _ = nil
				local var4723, var4724 = protoModule.readBuffer(p280, var4712)
				var4712 = var4724
				var4711.action_params = t.OpenSearchResultsWithQueryAction_Params.decode(var4723)
			else
				local _ = nil
				local var4725, var4726 = protoModule.readVarInt(p280, var4712)
				var4712 = var4726 + var4725
			end
		elseif var4713 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4727, var4728 = protoModule.readFixed32(p280, var4712)
			local _ = var4727
			var4712 = var4728
		elseif var4713 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4729, var4730 = protoModule.readFixed64(p280, var4712)
			local _ = var4729
			var4712 = var4730
		else
			error("Unsupported wire type: " .. var4713)
		end
	end
	return var4711
end

function t_142:jsonEncode() --[[ line: 26186 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_142:jsonDecode() --[[ line: 26208 ]]
	-- upvalues: t_142 (ref), t (ref)
	local var4732 = t_142.new()
	
	if self.action_type ~= nil then
		var4732.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4732.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4732.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4732.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.actionParams)
	end
	return var4732
end

t_142.descriptor = {
	name = "OpenSearchResultsWithQueryAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSearchResultsWithQueryAction"
}
t.OpenSearchResultsWithQueryAction = t_142
typeRegistryModule.default:register(t.OpenSearchResultsWithQueryAction)
local t_143 = {}
t_143.__index = t_143

function t_143.new(p281) --[[ line: 26250 ]]
	-- upvalues: t_143 (ref)
	return setmetatable({
		search_query = if p281 == nil or p281.search_query == nil then nil else p281.search_query,
		search_type = if p281 == nil or p281.search_type == nil then nil else p281.search_type
	}, t_143)
end

function t_143:encode() --[[ line: 26259 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4734 = 0
	
	if self.search_query ~= nil then
		local var4735 = self.search_query:encode()
		local var4736, var4737 = protoModule.writeTag(buff, var4734, 1, protoModule.wireTypes.lengthDelimited)
		var4736, var4737 = protoModule.writeBuffer(var4736, var4737, var4735, buffer.len(var4735))
		buff = var4736
		var4734 = var4737
	end
	if self.search_type ~= nil then
		local var4738 = self.search_type:encode()
		local var4739, var4740 = protoModule.writeTag(buff, var4734, 2, protoModule.wireTypes.lengthDelimited)
		var4739, var4740 = protoModule.writeBuffer(var4739, var4740, var4738, buffer.len(var4738))
		buff = var4739
		var4734 = var4740
	end
	local buff_1 = buffer.create(var4734)
	buffer.copy(buff_1, 0, buff, 0, var4734)
	
	return buff_1
end

function t_143.decode(p282) --[[ line: 26280 ]]
	-- upvalues: t_143 (ref), protoModule (ref), propTypesModule (ref)
	local var4742 = t_143.new()
	local var4743 = 0
	while var4743 < buffer.len(p282) do
		local _ = nil
		local var4744 = nil
		local var4745, var4746, var4747 = protoModule.readTag(p282, var4743)
		local var4748 = var4745
		var4744 = var4746
		var4743 = var4747
		
		if var4744 == protoModule.wireTypes.varint then
			local _ = nil
			local var4749, var4750 = protoModule.readVarInt(p282, var4743)
			local _ = var4749
			var4743 = var4750
			continue
		end
		if var4744 == protoModule.wireTypes.lengthDelimited then
			if var4748 == 1 then
				local _ = nil
				local var4751, var4752 = protoModule.readBuffer(p282, var4743)
				var4743 = var4752
				var4742.search_query = propTypesModule.StringProp.decode(var4751)
			elseif var4748 == 2 then
				local _ = nil
				local var4753, var4754 = protoModule.readBuffer(p282, var4743)
				var4743 = var4754
				var4742.search_type = propTypesModule.StringProp.decode(var4753)
			else
				local _ = nil
				local var4755, var4756 = protoModule.readVarInt(p282, var4743)
				var4743 = var4756 + var4755
			end
		elseif var4744 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4757, var4758 = protoModule.readFixed32(p282, var4743)
			local _ = var4757
			var4743 = var4758
		elseif var4744 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4759, var4760 = protoModule.readFixed64(p282, var4743)
			local _ = var4759
			var4743 = var4760
		else
			error("Unsupported wire type: " .. var4744)
		end
	end
	return var4742
end

function t_143:jsonEncode() --[[ line: 26328 ]]
	local t = {}
	
	if self.search_query ~= nil then
		t.searchQuery = self.search_query:jsonEncode()
	end
	if self.search_type ~= nil then
		t.searchType = self.search_type:jsonEncode()
	end
	return t
end

function t_143:jsonDecode() --[[ line: 26342 ]]
	-- upvalues: t_143 (ref), propTypesModule (ref)
	local var4762 = t_143.new()
	
	if self.search_query ~= nil then
		var4762.search_query = propTypesModule.StringProp.jsonDecode(self.search_query)
	end
	if self.searchQuery ~= nil then
		var4762.search_query = propTypesModule.StringProp.jsonDecode(self.searchQuery)
	end
	if self.search_type ~= nil then
		var4762.search_type = propTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		var4762.search_type = propTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return var4762
end

t_143.descriptor = {
	name = "OpenSearchResultsWithQueryAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSearchResultsWithQueryAction_Params = t_143
typeRegistryModule.default:register(t.OpenSearchResultsWithQueryAction_Params)
local t_144 = {}
t_144.__index = t_144

function t_144.new(p283) --[[ line: 26383 ]]
	-- upvalues: t_144 (ref)
	return setmetatable({
		kind = if p283 == nil or p283.kind == nil then nil else p283.kind,
		telemetry_handler = if p283 == nil or p283.telemetry_handler == nil then nil else p283.telemetry_handler,
		accessibility_label = if p283 == nil or p283.accessibility_label == nil then nil else p283.accessibility_label
	}, t_144)
end

function t_144:encode() --[[ line: 26393 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4764 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "dismiss_dialog_action" then
			local var4765 = self.kind.value:encode()
			local var4766, var4767 = protoModule.writeTag(buff, var4764, 1, protoModule.wireTypes.lengthDelimited)
			var4766, var4767 = protoModule.writeBuffer(var4766, var4767, var4765, buffer.len(var4765))
			buff = var4766
			var4764 = var4767
		elseif self.kind.type == "link_action" then
			local var4768 = self.kind.value:encode()
			local var4769, var4770 = protoModule.writeTag(buff, var4764, 2, protoModule.wireTypes.lengthDelimited)
			var4769, var4770 = protoModule.writeBuffer(var4769, var4770, var4768, buffer.len(var4768))
			buff = var4769
			var4764 = var4770
		elseif self.kind.type == "open_game_details_action" then
			local var4771 = self.kind.value:encode()
			local var4772, var4773 = protoModule.writeTag(buff, var4764, 3, protoModule.wireTypes.lengthDelimited)
			var4772, var4773 = protoModule.writeBuffer(var4772, var4773, var4771, buffer.len(var4771))
			buff = var4772
			var4764 = var4773
		elseif self.kind.type == "open_join_friends_action" then
			local var4774 = self.kind.value:encode()
			local var4775, var4776 = protoModule.writeTag(buff, var4764, 4, protoModule.wireTypes.lengthDelimited)
			var4775, var4776 = protoModule.writeBuffer(var4775, var4776, var4774, buffer.len(var4774))
			buff = var4775
			var4764 = var4776
		elseif self.kind.type == "open_marketplace_try_on_action" then
			local var4777 = self.kind.value:encode()
			local var4778, var4779 = protoModule.writeTag(buff, var4764, 5, protoModule.wireTypes.lengthDelimited)
			var4778, var4779 = protoModule.writeBuffer(var4778, var4779, var4777, buffer.len(var4777))
			buff = var4778
			var4764 = var4779
		elseif self.kind.type == "open_see_all_action" then
			local var4780 = self.kind.value:encode()
			local var4781, var4782 = protoModule.writeTag(buff, var4764, 6, protoModule.wireTypes.lengthDelimited)
			var4781, var4782 = protoModule.writeBuffer(var4781, var4782, var4780, buffer.len(var4780))
			buff = var4781
			var4764 = var4782
		elseif self.kind.type == "open_sponsored_tooltip_action" then
			local var4783 = self.kind.value:encode()
			local var4784, var4785 = protoModule.writeTag(buff, var4764, 7, protoModule.wireTypes.lengthDelimited)
			var4784, var4785 = protoModule.writeBuffer(var4784, var4785, var4783, buffer.len(var4783))
			buff = var4784
			var4764 = var4785
		elseif self.kind.type == "play_button_click_action" then
			local var4786 = self.kind.value:encode()
			local var4787, var4788 = protoModule.writeTag(buff, var4764, 8, protoModule.wireTypes.lengthDelimited)
			var4787, var4788 = protoModule.writeBuffer(var4787, var4788, var4786, buffer.len(var4786))
			buff = var4787
			var4764 = var4788
		elseif self.kind.type == "update_user_settings_action" then
			local var4789 = self.kind.value:encode()
			local var4790, var4791 = protoModule.writeTag(buff, var4764, 9, protoModule.wireTypes.lengthDelimited)
			var4790, var4791 = protoModule.writeBuffer(var4790, var4791, var4789, buffer.len(var4789))
			buff = var4790
			var4764 = var4791
		elseif self.kind.type == "open_tooltip_action" then
			local var4792 = self.kind.value:encode()
			local var4793, var4794 = protoModule.writeTag(buff, var4764, 10, protoModule.wireTypes.lengthDelimited)
			var4793, var4794 = protoModule.writeBuffer(var4793, var4794, var4792, buffer.len(var4792))
			buff = var4793
			var4764 = var4794
		elseif self.kind.type == "open_badge_details_action" then
			local var4795 = self.kind.value:encode()
			local var4796, var4797 = protoModule.writeTag(buff, var4764, 11, protoModule.wireTypes.lengthDelimited)
			var4796, var4797 = protoModule.writeBuffer(var4796, var4797, var4795, buffer.len(var4795))
			buff = var4796
			var4764 = var4797
		elseif self.kind.type == "load_more_from_api_action" then
			local var4798 = self.kind.value:encode()
			local var4799, var4800 = protoModule.writeTag(buff, var4764, 12, protoModule.wireTypes.lengthDelimited)
			var4799, var4800 = protoModule.writeBuffer(var4799, var4800, var4798, buffer.len(var4798))
			buff = var4799
			var4764 = var4800
		elseif self.kind.type == "share_action" then
			local var4801 = self.kind.value:encode()
			local var4802, var4803 = protoModule.writeTag(buff, var4764, 13, protoModule.wireTypes.lengthDelimited)
			var4802, var4803 = protoModule.writeBuffer(var4802, var4803, var4801, buffer.len(var4801))
			buff = var4802
			var4764 = var4803
		elseif self.kind.type == "open_abuse_report_action" then
			local var4804 = self.kind.value:encode()
			local var4805, var4806 = protoModule.writeTag(buff, var4764, 14, protoModule.wireTypes.lengthDelimited)
			var4805, var4806 = protoModule.writeBuffer(var4805, var4806, var4804, buffer.len(var4804))
			buff = var4805
			var4764 = var4806
		elseif self.kind.type == "remove_badge_from_inventory_action" then
			local var4807 = self.kind.value:encode()
			local var4808, var4809 = protoModule.writeTag(buff, var4764, 15, protoModule.wireTypes.lengthDelimited)
			var4808, var4809 = protoModule.writeBuffer(var4808, var4809, var4807, buffer.len(var4807))
			buff = var4808
			var4764 = var4809
		elseif self.kind.type == "open_profile_action" then
			local var4810 = self.kind.value:encode()
			local var4811, var4812 = protoModule.writeTag(buff, var4764, 16, protoModule.wireTypes.lengthDelimited)
			var4811, var4812 = protoModule.writeBuffer(var4811, var4812, var4810, buffer.len(var4810))
			buff = var4811
			var4764 = var4812
		elseif self.kind.type == "open_facial_age_estimation_action" then
			local var4813 = self.kind.value:encode()
			local var4814, var4815 = protoModule.writeTag(buff, var4764, 17, protoModule.wireTypes.lengthDelimited)
			var4814, var4815 = protoModule.writeBuffer(var4814, var4815, var4813, buffer.len(var4813))
			buff = var4814
			var4764 = var4815
		elseif self.kind.type == "open_add_connections_page_action" then
			local var4816 = self.kind.value:encode()
			local var4817, var4818 = protoModule.writeTag(buff, var4764, 18, protoModule.wireTypes.lengthDelimited)
			var4817, var4818 = protoModule.writeBuffer(var4817, var4818, var4816, buffer.len(var4816))
			buff = var4817
			var4764 = var4818
		elseif self.kind.type == "open_marketplace_action" then
			local var4819 = self.kind.value:encode()
			local var4820, var4821 = protoModule.writeTag(buff, var4764, 19, protoModule.wireTypes.lengthDelimited)
			var4820, var4821 = protoModule.writeBuffer(var4820, var4821, var4819, buffer.len(var4819))
			buff = var4820
			var4764 = var4821
		elseif self.kind.type == "hide_profile_completion_action" then
			local var4822 = self.kind.value:encode()
			local var4823, var4824 = protoModule.writeTag(buff, var4764, 20, protoModule.wireTypes.lengthDelimited)
			var4823, var4824 = protoModule.writeBuffer(var4823, var4824, var4822, buffer.len(var4822))
			buff = var4823
			var4764 = var4824
		elseif self.kind.type == "select_marketplace_catalog_category" then
			local var4825 = self.kind.value:encode()
			local var4826, var4827 = protoModule.writeTag(buff, var4764, 21, protoModule.wireTypes.lengthDelimited)
			var4826, var4827 = protoModule.writeBuffer(var4826, var4827, var4825, buffer.len(var4825))
			buff = var4826
			var4764 = var4827
		elseif self.kind.type == "select_marketplace_catalog_subcategory" then
			local var4828 = self.kind.value:encode()
			local var4829, var4830 = protoModule.writeTag(buff, var4764, 22, protoModule.wireTypes.lengthDelimited)
			var4829, var4830 = protoModule.writeBuffer(var4829, var4830, var4828, buffer.len(var4828))
			buff = var4829
			var4764 = var4830
		elseif self.kind.type == "open_marketplace_catalog_see_all" then
			local var4831 = self.kind.value:encode()
			local var4832, var4833 = protoModule.writeTag(buff, var4764, 23, protoModule.wireTypes.lengthDelimited)
			var4832, var4833 = protoModule.writeBuffer(var4832, var4833, var4831, buffer.len(var4831))
			buff = var4832
			var4764 = var4833
		elseif self.kind.type == "close_marketplace_category_tooltip" then
			local var4834 = self.kind.value:encode()
			local var4835, var4836 = protoModule.writeTag(buff, var4764, 24, protoModule.wireTypes.lengthDelimited)
			var4835, var4836 = protoModule.writeBuffer(var4835, var4836, var4834, buffer.len(var4834))
			buff = var4835
			var4764 = var4836
		elseif self.kind.type == "resize_marketplace_catalog" then
			local var4837 = self.kind.value:encode()
			local var4838, var4839 = protoModule.writeTag(buff, var4764, 25, protoModule.wireTypes.lengthDelimited)
			var4838, var4839 = protoModule.writeBuffer(var4838, var4839, var4837, buffer.len(var4837))
			buff = var4838
			var4764 = var4839
		elseif self.kind.type == "open_marketplace_catalog_filters" then
			local var4840 = self.kind.value:encode()
			local var4841, var4842 = protoModule.writeTag(buff, var4764, 26, protoModule.wireTypes.lengthDelimited)
			var4841, var4842 = protoModule.writeBuffer(var4841, var4842, var4840, buffer.len(var4840))
			buff = var4841
			var4764 = var4842
		elseif self.kind.type == "open_social_link_action" then
			local var4843 = self.kind.value:encode()
			local var4844, var4845 = protoModule.writeTag(buff, var4764, 27, protoModule.wireTypes.lengthDelimited)
			var4844, var4845 = protoModule.writeBuffer(var4844, var4845, var4843, buffer.len(var4843))
			buff = var4844
			var4764 = var4845
		elseif self.kind.type == "open_charts_sort_detail_action" then
			local var4846 = self.kind.value:encode()
			local var4847, var4848 = protoModule.writeTag(buff, var4764, 28, protoModule.wireTypes.lengthDelimited)
			var4847, var4848 = protoModule.writeBuffer(var4847, var4848, var4846, buffer.len(var4846))
			buff = var4847
			var4764 = var4848
		elseif self.kind.type == "open_song_detail_action" then
			local var4849 = self.kind.value:encode()
			local var4850, var4851 = protoModule.writeTag(buff, var4764, 29, protoModule.wireTypes.lengthDelimited)
			var4850, var4851 = protoModule.writeBuffer(var4850, var4851, var4849, buffer.len(var4849))
			buff = var4850
			var4764 = var4851
		elseif self.kind.type == "refresh_from_api_action" then
			local var4852 = self.kind.value:encode()
			local var4853, var4854 = protoModule.writeTag(buff, var4764, 30, protoModule.wireTypes.lengthDelimited)
			var4853, var4854 = protoModule.writeBuffer(var4853, var4854, var4852, buffer.len(var4852))
			buff = var4853
			var4764 = var4854
		elseif self.kind.type == "rsvp_to_event_action" then
			local var4855 = self.kind.value:encode()
			local var4856, var4857 = protoModule.writeTag(buff, var4764, 31, protoModule.wireTypes.lengthDelimited)
			var4856, var4857 = protoModule.writeBuffer(var4856, var4857, var4855, buffer.len(var4855))
			buff = var4856
			var4764 = var4857
		elseif self.kind.type == "apply_charts_filter_action" then
			local var4858 = self.kind.value:encode()
			local var4859, var4860 = protoModule.writeTag(buff, var4764, 32, protoModule.wireTypes.lengthDelimited)
			var4859, var4860 = protoModule.writeBuffer(var4859, var4860, var4858, buffer.len(var4858))
			buff = var4859
			var4764 = var4860
		elseif self.kind.type == "analytics_event_action" then
			local var4861 = self.kind.value:encode()
			local var4862, var4863 = protoModule.writeTag(buff, var4764, 33, protoModule.wireTypes.lengthDelimited)
			var4862, var4863 = protoModule.writeBuffer(var4862, var4863, var4861, buffer.len(var4861))
			buff = var4862
			var4764 = var4863
		elseif self.kind.type == "custom_analytics_event_action" then
			local var4864 = self.kind.value:encode()
			local var4865, var4866 = protoModule.writeTag(buff, var4764, 34, protoModule.wireTypes.lengthDelimited)
			var4865, var4866 = protoModule.writeBuffer(var4865, var4866, var4864, buffer.len(var4864))
			buff = var4865
			var4764 = var4866
		elseif self.kind.type == "open_game_invite_action" then
			local var4867 = self.kind.value:encode()
			local var4868, var4869 = protoModule.writeTag(buff, var4764, 35, protoModule.wireTypes.lengthDelimited)
			var4868, var4869 = protoModule.writeBuffer(var4868, var4869, var4867, buffer.len(var4867))
			buff = var4868
			var4764 = var4869
		elseif self.kind.type == "open_event_details_action" then
			local var4870 = self.kind.value:encode()
			local var4871, var4872 = protoModule.writeTag(buff, var4764, 36, protoModule.wireTypes.lengthDelimited)
			var4871, var4872 = protoModule.writeBuffer(var4871, var4872, var4870, buffer.len(var4870))
			buff = var4871
			var4764 = var4872
		elseif self.kind.type == "launch_experience_action" then
			local var4873 = self.kind.value:encode()
			local var4874, var4875 = protoModule.writeTag(buff, var4764, 37, protoModule.wireTypes.lengthDelimited)
			var4874, var4875 = protoModule.writeBuffer(var4874, var4875, var4873, buffer.len(var4873))
			buff = var4874
			var4764 = var4875
		elseif self.kind.type == "toggle_experience_favorite_action" then
			local var4876 = self.kind.value:encode()
			local var4877, var4878 = protoModule.writeTag(buff, var4764, 38, protoModule.wireTypes.lengthDelimited)
			var4877, var4878 = protoModule.writeBuffer(var4877, var4878, var4876, buffer.len(var4876))
			buff = var4877
			var4764 = var4878
		elseif self.kind.type == "toggle_experience_follow_action" then
			local var4879 = self.kind.value:encode()
			local var4880, var4881 = protoModule.writeTag(buff, var4764, 39, protoModule.wireTypes.lengthDelimited)
			var4880, var4881 = protoModule.writeBuffer(var4880, var4881, var4879, buffer.len(var4879))
			buff = var4880
			var4764 = var4881
		elseif self.kind.type == "toggle_experience_vote_action" then
			local var4882 = self.kind.value:encode()
			local var4883, var4884 = protoModule.writeTag(buff, var4764, 40, protoModule.wireTypes.lengthDelimited)
			var4883, var4884 = protoModule.writeBuffer(var4883, var4884, var4882, buffer.len(var4882))
			buff = var4883
			var4764 = var4884
		elseif self.kind.type == "open_purchase_prompt_action" then
			local var4885 = self.kind.value:encode()
			local var4886, var4887 = protoModule.writeTag(buff, var4764, 41, protoModule.wireTypes.lengthDelimited)
			var4886, var4887 = protoModule.writeBuffer(var4886, var4887, var4885, buffer.len(var4885))
			buff = var4886
			var4764 = var4887
		elseif self.kind.type == "open_sdui_overlay_action" then
			local var4888 = self.kind.value:encode()
			local var4889, var4890 = protoModule.writeTag(buff, var4764, 42, protoModule.wireTypes.lengthDelimited)
			var4889, var4890 = protoModule.writeBuffer(var4889, var4890, var4888, buffer.len(var4888))
			buff = var4889
			var4764 = var4890
		elseif self.kind.type == "open_badges_see_all_action" then
			local var4891 = self.kind.value:encode()
			local var4892, var4893 = protoModule.writeTag(buff, var4764, 43, protoModule.wireTypes.lengthDelimited)
			var4892, var4893 = protoModule.writeBuffer(var4892, var4893, var4891, buffer.len(var4891))
			buff = var4892
			var4764 = var4893
		elseif self.kind.type == "open_experience_store_see_all_action" then
			local var4894 = self.kind.value:encode()
			local var4895, var4896 = protoModule.writeTag(buff, var4764, 44, protoModule.wireTypes.lengthDelimited)
			var4895, var4896 = protoModule.writeBuffer(var4895, var4896, var4894, buffer.len(var4894))
			buff = var4895
			var4764 = var4896
		elseif self.kind.type == "dismiss_game_feedback_action" then
			local var4897 = self.kind.value:encode()
			local var4898, var4899 = protoModule.writeTag(buff, var4764, 45, protoModule.wireTypes.lengthDelimited)
			var4898, var4899 = protoModule.writeBuffer(var4898, var4899, var4897, buffer.len(var4897))
			buff = var4898
			var4764 = var4899
		elseif self.kind.type == "open_game_feedback_form_action" then
			local var4900 = self.kind.value:encode()
			local var4901, var4902 = protoModule.writeTag(buff, var4764, 46, protoModule.wireTypes.lengthDelimited)
			var4901, var4902 = protoModule.writeBuffer(var4901, var4902, var4900, buffer.len(var4900))
			buff = var4901
			var4764 = var4902
		elseif self.kind.type == "enable_event_notifications_action" then
			local var4903 = self.kind.value:encode()
			local var4904, var4905 = protoModule.writeTag(buff, var4764, 47, protoModule.wireTypes.lengthDelimited)
			var4904, var4905 = protoModule.writeBuffer(var4904, var4905, var4903, buffer.len(var4903))
			buff = var4904
			var4764 = var4905
		elseif self.kind.type == "dismiss_event_notifications_modal_action" then
			local var4906 = self.kind.value:encode()
			local var4907, var4908 = protoModule.writeTag(buff, var4764, 48, protoModule.wireTypes.lengthDelimited)
			var4907, var4908 = protoModule.writeBuffer(var4907, var4908, var4906, buffer.len(var4906))
			buff = var4907
			var4764 = var4908
		elseif self.kind.type == "open_amp_wizard_action" then
			local var4909 = self.kind.value:encode()
			local var4910, var4911 = protoModule.writeTag(buff, var4764, 49, protoModule.wireTypes.lengthDelimited)
			var4910, var4911 = protoModule.writeBuffer(var4910, var4911, var4909, buffer.len(var4909))
			buff = var4910
			var4764 = var4911
		elseif self.kind.type == "open_subscription_purchase_page_action" then
			local var4912 = self.kind.value:encode()
			local var4913, var4914 = protoModule.writeTag(buff, var4764, 50, protoModule.wireTypes.lengthDelimited)
			var4913, var4914 = protoModule.writeBuffer(var4913, var4914, var4912, buffer.len(var4912))
			buff = var4913
			var4764 = var4914
		elseif self.kind.type == "refresh_game_passes_action" then
			local var4915 = self.kind.value:encode()
			local var4916, var4917 = protoModule.writeTag(buff, var4764, 51, protoModule.wireTypes.lengthDelimited)
			var4916, var4917 = protoModule.writeBuffer(var4916, var4917, var4915, buffer.len(var4915))
			buff = var4916
			var4764 = var4917
		elseif self.kind.type == "refresh_playability_action" then
			local var4918 = self.kind.value:encode()
			local var4919, var4920 = protoModule.writeTag(buff, var4764, 52, protoModule.wireTypes.lengthDelimited)
			var4919, var4920 = protoModule.writeBuffer(var4919, var4920, var4918, buffer.len(var4918))
			buff = var4919
			var4764 = var4920
		elseif self.kind.type == "open_social_proof_user_list_sheet_action" then
			local var4921 = self.kind.value:encode()
			local var4922, var4923 = protoModule.writeTag(buff, var4764, 53, protoModule.wireTypes.lengthDelimited)
			var4922, var4923 = protoModule.writeBuffer(var4922, var4923, var4921, buffer.len(var4921))
			buff = var4922
			var4764 = var4923
		elseif self.kind.type == "report_surface_load_time_milestone_action" then
			local var4924 = self.kind.value:encode()
			local var4925, var4926 = protoModule.writeTag(buff, var4764, 54, protoModule.wireTypes.lengthDelimited)
			var4925, var4926 = protoModule.writeBuffer(var4925, var4926, var4924, buffer.len(var4924))
			buff = var4925
			var4764 = var4926
		elseif self.kind.type == "open_search_results_tab_action" then
			local var4927 = self.kind.value:encode()
			local var4928, var4929 = protoModule.writeTag(buff, var4764, 55, protoModule.wireTypes.lengthDelimited)
			var4928, var4929 = protoModule.writeBuffer(var4928, var4929, var4927, buffer.len(var4927))
			buff = var4928
			var4764 = var4929
		elseif self.kind.type == "open_phone_upsell_modal_action" then
			local var4930 = self.kind.value:encode()
			local var4931, var4932 = protoModule.writeTag(buff, var4764, 56, protoModule.wireTypes.lengthDelimited)
			var4931, var4932 = protoModule.writeBuffer(var4931, var4932, var4930, buffer.len(var4930))
			buff = var4931
			var4764 = var4932
		elseif self.kind.type == "open_email_upsell_modal_action" then
			local var4933 = self.kind.value:encode()
			local var4934, var4935 = protoModule.writeTag(buff, var4764, 57, protoModule.wireTypes.lengthDelimited)
			var4934, var4935 = protoModule.writeBuffer(var4934, var4935, var4933, buffer.len(var4933))
			buff = var4934
			var4764 = var4935
		elseif self.kind.type == "dismiss_prompt_action" then
			local var4936 = self.kind.value:encode()
			local var4937, var4938 = protoModule.writeTag(buff, var4764, 58, protoModule.wireTypes.lengthDelimited)
			var4937, var4938 = protoModule.writeBuffer(var4937, var4938, var4936, buffer.len(var4936))
			buff = var4937
			var4764 = var4938
		elseif self.kind.type == "request_friendship_action" then
			local var4939 = self.kind.value:encode()
			local var4940, var4941 = protoModule.writeTag(buff, var4764, 59, protoModule.wireTypes.lengthDelimited)
			var4940, var4941 = protoModule.writeBuffer(var4940, var4941, var4939, buffer.len(var4939))
			buff = var4940
			var4764 = var4941
		elseif self.kind.type == "refresh_developer_products_action" then
			local var4942 = self.kind.value:encode()
			local var4943, var4944 = protoModule.writeTag(buff, var4764, 60, protoModule.wireTypes.lengthDelimited)
			var4943, var4944 = protoModule.writeBuffer(var4943, var4944, var4942, buffer.len(var4942))
			buff = var4943
			var4764 = var4944
		elseif self.kind.type == "open_fae_trial_upsell_action" then
			local var4945 = self.kind.value:encode()
			local var4946, var4947 = protoModule.writeTag(buff, var4764, 61, protoModule.wireTypes.lengthDelimited)
			var4946, var4947 = protoModule.writeBuffer(var4946, var4947, var4945, buffer.len(var4945))
			buff = var4946
			var4764 = var4947
		elseif self.kind.type == "refresh_omni_recommendation_feed_item_action" then
			local var4948 = self.kind.value:encode()
			local var4949, var4950 = protoModule.writeTag(buff, var4764, 62, protoModule.wireTypes.lengthDelimited)
			var4949, var4950 = protoModule.writeBuffer(var4949, var4950, var4948, buffer.len(var4948))
			buff = var4949
			var4764 = var4950
		elseif self.kind.type == "ai_overview_feedback_action" then
			local var4951 = self.kind.value:encode()
			local var4952, var4953 = protoModule.writeTag(buff, var4764, 63, protoModule.wireTypes.lengthDelimited)
			var4952, var4953 = protoModule.writeBuffer(var4952, var4953, var4951, buffer.len(var4951))
			buff = var4952
			var4764 = var4953
		elseif self.kind.type == "open_trusted_friends_upsell_modal_action" then
			local var4954 = self.kind.value:encode()
			local var4955, var4956 = protoModule.writeTag(buff, var4764, 64, protoModule.wireTypes.lengthDelimited)
			var4955, var4956 = protoModule.writeBuffer(var4955, var4956, var4954, buffer.len(var4954))
			buff = var4955
			var4764 = var4956
		elseif self.kind.type == "record_party_chat_conversation_upsell_acknowledgement_action" then
			local var4957 = self.kind.value:encode()
			local var4958, var4959 = protoModule.writeTag(buff, var4764, 65, protoModule.wireTypes.lengthDelimited)
			var4958, var4959 = protoModule.writeBuffer(var4958, var4959, var4957, buffer.len(var4957))
			buff = var4958
			var4764 = var4959
		elseif self.kind.type == "open_search_results_with_query_action" then
			local var4960 = self.kind.value:encode()
			local var4961, var4962 = protoModule.writeTag(buff, var4764, 66, protoModule.wireTypes.lengthDelimited)
			var4961, var4962 = protoModule.writeBuffer(var4961, var4962, var4960, buffer.len(var4960))
			buff = var4961
			var4764 = var4962
		end
	end
	if self.telemetry_handler ~= nil then
		local var4963 = self.telemetry_handler:encode()
		local var4964, var4965 = protoModule.writeTag(buff, var4764, 1000, protoModule.wireTypes.lengthDelimited)
		var4964, var4965 = protoModule.writeBuffer(var4964, var4965, var4963, buffer.len(var4963))
		buff = var4964
		var4764 = var4965
	end
	if self.accessibility_label ~= nil then
		local var4966 = self.accessibility_label:encode()
		local var4967, var4968 = protoModule.writeTag(buff, var4764, 1001, protoModule.wireTypes.lengthDelimited)
		var4967, var4968 = protoModule.writeBuffer(var4967, var4968, var4966, buffer.len(var4966))
		buff = var4967
		var4764 = var4968
	end
	local buff_1 = buffer.create(var4764)
	buffer.copy(buff_1, 0, buff, 0, var4764)
	
	return buff_1
end

function t_144.decode(p284) --[[ line: 26682 ]]
	-- upvalues: t_144 (ref), protoModule (ref), t (ref), propTypesModule (ref)
	local var4970 = t_144.new()
	local var4971 = 0
	while var4971 < buffer.len(p284) do
		local _ = nil
		local var4972 = nil
		local var4973, var4974, var4975 = protoModule.readTag(p284, var4971)
		local var4976 = var4973
		var4972 = var4974
		var4971 = var4975
		
		if var4972 == protoModule.wireTypes.varint then
			local _ = nil
			local var4977, var4978 = protoModule.readVarInt(p284, var4971)
			local _ = var4977
			var4971 = var4978
			continue
		end
		if var4972 == protoModule.wireTypes.lengthDelimited then
			if var4976 == 1 then
				local _ = nil
				local var4979, var4980 = protoModule.readBuffer(p284, var4971)
				var4971 = var4980
				var4970.kind = {
					type = "dismiss_dialog_action",
					value = t.DismissDialogAction.decode(var4979)
				}
			elseif var4976 == 2 then
				local _ = nil
				local var4981, var4982 = protoModule.readBuffer(p284, var4971)
				var4971 = var4982
				var4970.kind = {
					type = "link_action",
					value = t.LinkAction.decode(var4981)
				}
			elseif var4976 == 3 then
				local _ = nil
				local var4983, var4984 = protoModule.readBuffer(p284, var4971)
				var4971 = var4984
				var4970.kind = {
					type = "open_game_details_action",
					value = t.OpenGameDetailsAction.decode(var4983)
				}
			elseif var4976 == 4 then
				local _ = nil
				local var4985, var4986 = protoModule.readBuffer(p284, var4971)
				var4971 = var4986
				var4970.kind = {
					type = "open_join_friends_action",
					value = t.OpenJoinFriendsAction.decode(var4985)
				}
			elseif var4976 == 5 then
				local _ = nil
				local var4987, var4988 = protoModule.readBuffer(p284, var4971)
				var4971 = var4988
				var4970.kind = {
					type = "open_marketplace_try_on_action",
					value = t.OpenMarketplaceTryOnAction.decode(var4987)
				}
			elseif var4976 == 6 then
				local _ = nil
				local var4989, var4990 = protoModule.readBuffer(p284, var4971)
				var4971 = var4990
				var4970.kind = {
					type = "open_see_all_action",
					value = t.OpenSeeAllAction.decode(var4989)
				}
			elseif var4976 == 7 then
				local _ = nil
				local var4991, var4992 = protoModule.readBuffer(p284, var4971)
				var4971 = var4992
				var4970.kind = {
					type = "open_sponsored_tooltip_action",
					value = t.OpenSponsoredTooltipAction.decode(var4991)
				}
			elseif var4976 == 8 then
				local _ = nil
				local var4993, var4994 = protoModule.readBuffer(p284, var4971)
				var4971 = var4994
				var4970.kind = {
					type = "play_button_click_action",
					value = t.PlayButtonClickAction.decode(var4993)
				}
			elseif var4976 == 9 then
				local _ = nil
				local var4995, var4996 = protoModule.readBuffer(p284, var4971)
				var4971 = var4996
				var4970.kind = {
					type = "update_user_settings_action",
					value = t.UpdateUserSettingsAction.decode(var4995)
				}
			elseif var4976 == 10 then
				local _ = nil
				local var4997, var4998 = protoModule.readBuffer(p284, var4971)
				var4971 = var4998
				var4970.kind = {
					type = "open_tooltip_action",
					value = t.OpenTooltipAction.decode(var4997)
				}
			elseif var4976 == 11 then
				local _ = nil
				local var4999, var5000 = protoModule.readBuffer(p284, var4971)
				var4971 = var5000
				var4970.kind = {
					type = "open_badge_details_action",
					value = t.OpenBadgeDetailsAction.decode(var4999)
				}
			elseif var4976 == 12 then
				local _ = nil
				local var5001, var5002 = protoModule.readBuffer(p284, var4971)
				var4971 = var5002
				var4970.kind = {
					type = "load_more_from_api_action",
					value = t.LoadMoreFromApiAction.decode(var5001)
				}
			elseif var4976 == 13 then
				local _ = nil
				local var5003, var5004 = protoModule.readBuffer(p284, var4971)
				var4971 = var5004
				var4970.kind = {
					type = "share_action",
					value = t.ShareAction.decode(var5003)
				}
			elseif var4976 == 14 then
				local _ = nil
				local var5005, var5006 = protoModule.readBuffer(p284, var4971)
				var4971 = var5006
				var4970.kind = {
					type = "open_abuse_report_action",
					value = t.OpenAbuseReportAction.decode(var5005)
				}
			elseif var4976 == 15 then
				local _ = nil
				local var5007, var5008 = protoModule.readBuffer(p284, var4971)
				var4971 = var5008
				var4970.kind = {
					type = "remove_badge_from_inventory_action",
					value = t.RemoveBadgeFromInventoryAction.decode(var5007)
				}
			elseif var4976 == 16 then
				local _ = nil
				local var5009, var5010 = protoModule.readBuffer(p284, var4971)
				var4971 = var5010
				var4970.kind = {
					type = "open_profile_action",
					value = t.OpenProfileAction.decode(var5009)
				}
			elseif var4976 == 17 then
				local _ = nil
				local var5011, var5012 = protoModule.readBuffer(p284, var4971)
				var4971 = var5012
				var4970.kind = {
					type = "open_facial_age_estimation_action",
					value = t.OpenFacialAgeEstimationAction.decode(var5011)
				}
			elseif var4976 == 18 then
				local _ = nil
				local var5013, var5014 = protoModule.readBuffer(p284, var4971)
				var4971 = var5014
				var4970.kind = {
					type = "open_add_connections_page_action",
					value = t.OpenAddConnectionsPageAction.decode(var5013)
				}
			elseif var4976 == 19 then
				local _ = nil
				local var5015, var5016 = protoModule.readBuffer(p284, var4971)
				var4971 = var5016
				var4970.kind = {
					type = "open_marketplace_action",
					value = t.OpenMarketplaceAction.decode(var5015)
				}
			elseif var4976 == 20 then
				local _ = nil
				local var5017, var5018 = protoModule.readBuffer(p284, var4971)
				var4971 = var5018
				var4970.kind = {
					type = "hide_profile_completion_action",
					value = t.HideProfileCompletionAction.decode(var5017)
				}
			elseif var4976 == 21 then
				local _ = nil
				local var5019, var5020 = protoModule.readBuffer(p284, var4971)
				var4971 = var5020
				var4970.kind = {
					type = "select_marketplace_catalog_category",
					value = t.SelectMarketplaceCatalogCategory.decode(var5019)
				}
			elseif var4976 == 22 then
				local _ = nil
				local var5021, var5022 = protoModule.readBuffer(p284, var4971)
				var4971 = var5022
				var4970.kind = {
					type = "select_marketplace_catalog_subcategory",
					value = t.SelectMarketplaceCatalogSubcategory.decode(var5021)
				}
			elseif var4976 == 23 then
				local _ = nil
				local var5023, var5024 = protoModule.readBuffer(p284, var4971)
				var4971 = var5024
				var4970.kind = {
					type = "open_marketplace_catalog_see_all",
					value = t.OpenMarketplaceCatalogSeeAll.decode(var5023)
				}
			elseif var4976 == 24 then
				local _ = nil
				local var5025, var5026 = protoModule.readBuffer(p284, var4971)
				var4971 = var5026
				var4970.kind = {
					type = "close_marketplace_category_tooltip",
					value = t.CloseMarketplaceCategoryTooltip.decode(var5025)
				}
			elseif var4976 == 25 then
				local _ = nil
				local var5027, var5028 = protoModule.readBuffer(p284, var4971)
				var4971 = var5028
				var4970.kind = {
					type = "resize_marketplace_catalog",
					value = t.ResizeMarketplaceCatalog.decode(var5027)
				}
			elseif var4976 == 26 then
				local _ = nil
				local var5029, var5030 = protoModule.readBuffer(p284, var4971)
				var4971 = var5030
				var4970.kind = {
					type = "open_marketplace_catalog_filters",
					value = t.OpenMarketplaceCatalogFilters.decode(var5029)
				}
			elseif var4976 == 27 then
				local _ = nil
				local var5031, var5032 = protoModule.readBuffer(p284, var4971)
				var4971 = var5032
				var4970.kind = {
					type = "open_social_link_action",
					value = t.OpenSocialLinkAction.decode(var5031)
				}
			elseif var4976 == 28 then
				local _ = nil
				local var5033, var5034 = protoModule.readBuffer(p284, var4971)
				var4971 = var5034
				var4970.kind = {
					type = "open_charts_sort_detail_action",
					value = t.OpenChartsSortDetailAction.decode(var5033)
				}
			elseif var4976 == 29 then
				local _ = nil
				local var5035, var5036 = protoModule.readBuffer(p284, var4971)
				var4971 = var5036
				var4970.kind = {
					type = "open_song_detail_action",
					value = t.OpenSongDetailAction.decode(var5035)
				}
			elseif var4976 == 30 then
				local _ = nil
				local var5037, var5038 = protoModule.readBuffer(p284, var4971)
				var4971 = var5038
				var4970.kind = {
					type = "refresh_from_api_action",
					value = t.RefreshFromApiAction.decode(var5037)
				}
			elseif var4976 == 31 then
				local _ = nil
				local var5039, var5040 = protoModule.readBuffer(p284, var4971)
				var4971 = var5040
				var4970.kind = {
					type = "rsvp_to_event_action",
					value = t.RsvpToEventAction.decode(var5039)
				}
			elseif var4976 == 32 then
				local _ = nil
				local var5041, var5042 = protoModule.readBuffer(p284, var4971)
				var4971 = var5042
				var4970.kind = {
					type = "apply_charts_filter_action",
					value = t.ApplyChartsFilterAction.decode(var5041)
				}
			elseif var4976 == 33 then
				local _ = nil
				local var5043, var5044 = protoModule.readBuffer(p284, var4971)
				var4971 = var5044
				var4970.kind = {
					type = "analytics_event_action",
					value = t.AnalyticsEventAction.decode(var5043)
				}
			elseif var4976 == 34 then
				local _ = nil
				local var5045, var5046 = protoModule.readBuffer(p284, var4971)
				var4971 = var5046
				var4970.kind = {
					type = "custom_analytics_event_action",
					value = t.CustomAnalyticsEventAction.decode(var5045)
				}
			elseif var4976 == 35 then
				local _ = nil
				local var5047, var5048 = protoModule.readBuffer(p284, var4971)
				var4971 = var5048
				var4970.kind = {
					type = "open_game_invite_action",
					value = t.OpenGameInviteAction.decode(var5047)
				}
			elseif var4976 == 36 then
				local _ = nil
				local var5049, var5050 = protoModule.readBuffer(p284, var4971)
				var4971 = var5050
				var4970.kind = {
					type = "open_event_details_action",
					value = t.OpenEventDetailsAction.decode(var5049)
				}
			elseif var4976 == 37 then
				local _ = nil
				local var5051, var5052 = protoModule.readBuffer(p284, var4971)
				var4971 = var5052
				var4970.kind = {
					type = "launch_experience_action",
					value = t.LaunchExperienceAction.decode(var5051)
				}
			elseif var4976 == 38 then
				local _ = nil
				local var5053, var5054 = protoModule.readBuffer(p284, var4971)
				var4971 = var5054
				var4970.kind = {
					type = "toggle_experience_favorite_action",
					value = t.ToggleExperienceFavoriteAction.decode(var5053)
				}
			elseif var4976 == 39 then
				local _ = nil
				local var5055, var5056 = protoModule.readBuffer(p284, var4971)
				var4971 = var5056
				var4970.kind = {
					type = "toggle_experience_follow_action",
					value = t.ToggleExperienceFollowAction.decode(var5055)
				}
			elseif var4976 == 40 then
				local _ = nil
				local var5057, var5058 = protoModule.readBuffer(p284, var4971)
				var4971 = var5058
				var4970.kind = {
					type = "toggle_experience_vote_action",
					value = t.ToggleExperienceVoteAction.decode(var5057)
				}
			elseif var4976 == 41 then
				local _ = nil
				local var5059, var5060 = protoModule.readBuffer(p284, var4971)
				var4971 = var5060
				var4970.kind = {
					type = "open_purchase_prompt_action",
					value = t.OpenPurchasePromptAction.decode(var5059)
				}
			elseif var4976 == 42 then
				local _ = nil
				local var5061, var5062 = protoModule.readBuffer(p284, var4971)
				var4971 = var5062
				var4970.kind = {
					type = "open_sdui_overlay_action",
					value = t.OpenSduiOverlayAction.decode(var5061)
				}
			elseif var4976 == 43 then
				local _ = nil
				local var5063, var5064 = protoModule.readBuffer(p284, var4971)
				var4971 = var5064
				var4970.kind = {
					type = "open_badges_see_all_action",
					value = t.OpenBadgesSeeAllAction.decode(var5063)
				}
			elseif var4976 == 44 then
				local _ = nil
				local var5065, var5066 = protoModule.readBuffer(p284, var4971)
				var4971 = var5066
				var4970.kind = {
					type = "open_experience_store_see_all_action",
					value = t.OpenExperienceStoreSeeAllAction.decode(var5065)
				}
			elseif var4976 == 45 then
				local _ = nil
				local var5067, var5068 = protoModule.readBuffer(p284, var4971)
				var4971 = var5068
				var4970.kind = {
					type = "dismiss_game_feedback_action",
					value = t.DismissGameFeedbackAction.decode(var5067)
				}
			elseif var4976 == 46 then
				local _ = nil
				local var5069, var5070 = protoModule.readBuffer(p284, var4971)
				var4971 = var5070
				var4970.kind = {
					type = "open_game_feedback_form_action",
					value = t.OpenGameFeedbackFormAction.decode(var5069)
				}
			elseif var4976 == 47 then
				local _ = nil
				local var5071, var5072 = protoModule.readBuffer(p284, var4971)
				var4971 = var5072
				var4970.kind = {
					type = "enable_event_notifications_action",
					value = t.EnableEventNotificationsAction.decode(var5071)
				}
			elseif var4976 == 48 then
				local _ = nil
				local var5073, var5074 = protoModule.readBuffer(p284, var4971)
				var4971 = var5074
				var4970.kind = {
					type = "dismiss_event_notifications_modal_action",
					value = t.DismissEventNotificationsModalAction.decode(var5073)
				}
			elseif var4976 == 49 then
				local _ = nil
				local var5075, var5076 = protoModule.readBuffer(p284, var4971)
				var4971 = var5076
				var4970.kind = {
					type = "open_amp_wizard_action",
					value = t.OpenAmpWizardAction.decode(var5075)
				}
			elseif var4976 == 50 then
				local _ = nil
				local var5077, var5078 = protoModule.readBuffer(p284, var4971)
				var4971 = var5078
				var4970.kind = {
					type = "open_subscription_purchase_page_action",
					value = t.OpenSubscriptionPurchasePageAction.decode(var5077)
				}
			elseif var4976 == 51 then
				local _ = nil
				local var5079, var5080 = protoModule.readBuffer(p284, var4971)
				var4971 = var5080
				var4970.kind = {
					type = "refresh_game_passes_action",
					value = t.RefreshGamePassesAction.decode(var5079)
				}
			elseif var4976 == 52 then
				local _ = nil
				local var5081, var5082 = protoModule.readBuffer(p284, var4971)
				var4971 = var5082
				var4970.kind = {
					type = "refresh_playability_action",
					value = t.RefreshPlayabilityAction.decode(var5081)
				}
			elseif var4976 == 53 then
				local _ = nil
				local var5083, var5084 = protoModule.readBuffer(p284, var4971)
				var4971 = var5084
				var4970.kind = {
					type = "open_social_proof_user_list_sheet_action",
					value = t.OpenSocialProofUserListSheetAction.decode(var5083)
				}
			elseif var4976 == 54 then
				local _ = nil
				local var5085, var5086 = protoModule.readBuffer(p284, var4971)
				var4971 = var5086
				var4970.kind = {
					type = "report_surface_load_time_milestone_action",
					value = t.ReportSurfaceLoadTimeMilestoneAction.decode(var5085)
				}
			elseif var4976 == 55 then
				local _ = nil
				local var5087, var5088 = protoModule.readBuffer(p284, var4971)
				var4971 = var5088
				var4970.kind = {
					type = "open_search_results_tab_action",
					value = t.OpenSearchResultsTabAction.decode(var5087)
				}
			elseif var4976 == 56 then
				local _ = nil
				local var5089, var5090 = protoModule.readBuffer(p284, var4971)
				var4971 = var5090
				var4970.kind = {
					type = "open_phone_upsell_modal_action",
					value = t.OpenPhoneUpsellModalAction.decode(var5089)
				}
			elseif var4976 == 57 then
				local _ = nil
				local var5091, var5092 = protoModule.readBuffer(p284, var4971)
				var4971 = var5092
				var4970.kind = {
					type = "open_email_upsell_modal_action",
					value = t.OpenEmailUpsellModalAction.decode(var5091)
				}
			elseif var4976 == 58 then
				local _ = nil
				local var5093, var5094 = protoModule.readBuffer(p284, var4971)
				var4971 = var5094
				var4970.kind = {
					type = "dismiss_prompt_action",
					value = t.DismissPromptAction.decode(var5093)
				}
			elseif var4976 == 59 then
				local _ = nil
				local var5095, var5096 = protoModule.readBuffer(p284, var4971)
				var4971 = var5096
				var4970.kind = {
					type = "request_friendship_action",
					value = t.RequestFriendshipAction.decode(var5095)
				}
			elseif var4976 == 60 then
				local _ = nil
				local var5097, var5098 = protoModule.readBuffer(p284, var4971)
				var4971 = var5098
				var4970.kind = {
					type = "refresh_developer_products_action",
					value = t.RefreshDeveloperProductsAction.decode(var5097)
				}
			elseif var4976 == 61 then
				local _ = nil
				local var5099, var5100 = protoModule.readBuffer(p284, var4971)
				var4971 = var5100
				var4970.kind = {
					type = "open_fae_trial_upsell_action",
					value = t.OpenFaeTrialUpsellAction.decode(var5099)
				}
			elseif var4976 == 62 then
				local _ = nil
				local var5101, var5102 = protoModule.readBuffer(p284, var4971)
				var4971 = var5102
				var4970.kind = {
					type = "refresh_omni_recommendation_feed_item_action",
					value = t.RefreshOmniRecommendationFeedItemAction.decode(var5101)
				}
			elseif var4976 == 63 then
				local _ = nil
				local var5103, var5104 = protoModule.readBuffer(p284, var4971)
				var4971 = var5104
				var4970.kind = {
					type = "ai_overview_feedback_action",
					value = t.AiOverviewFeedbackAction.decode(var5103)
				}
			elseif var4976 == 64 then
				local _ = nil
				local var5105, var5106 = protoModule.readBuffer(p284, var4971)
				var4971 = var5106
				var4970.kind = {
					type = "open_trusted_friends_upsell_modal_action",
					value = t.OpenTrustedFriendsUpsellModalAction.decode(var5105)
				}
			elseif var4976 == 65 then
				local _ = nil
				local var5107, var5108 = protoModule.readBuffer(p284, var4971)
				var4971 = var5108
				var4970.kind = {
					type = "record_party_chat_conversation_upsell_acknowledgement_action",
					value = t.RecordPartyChatConversationUpsellAcknowledgementAction.decode(var5107)
				}
			elseif var4976 == 66 then
				local _ = nil
				local var5109, var5110 = protoModule.readBuffer(p284, var4971)
				var4971 = var5110
				var4970.kind = {
					type = "open_search_results_with_query_action",
					value = t.OpenSearchResultsWithQueryAction.decode(var5109)
				}
			elseif var4976 == 1000 then
				local _ = nil
				local var5111, var5112 = protoModule.readBuffer(p284, var4971)
				var4971 = var5112
				var4970.telemetry_handler = propTypesModule.StringProp.decode(var5111)
			elseif var4976 == 1001 then
				local _ = nil
				local var5113, var5114 = protoModule.readBuffer(p284, var4971)
				var4971 = var5114
				var4970.accessibility_label = propTypesModule.StringFormat.decode(var5113)
			else
				local _ = nil
				local var5115, var5116 = protoModule.readVarInt(p284, var4971)
				var4971 = var5116 + var5115
			end
		elseif var4972 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5117, var5118 = protoModule.readFixed32(p284, var4971)
			local _ = var5117
			var4971 = var5118
		elseif var4972 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5119, var5120 = protoModule.readFixed64(p284, var4971)
			local _ = var5119
			var4971 = var5120
		else
			error("Unsupported wire type: " .. var4972)
		end
	end
	return var4970
end

function t_144:jsonEncode() --[[ line: 27189 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "dismiss_dialog_action" then
			t.dismissDialogAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "link_action" then
			t.linkAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_game_details_action" then
			t.openGameDetailsAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_join_friends_action" then
			t.openJoinFriendsAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_marketplace_try_on_action" then
			t.openMarketplaceTryOnAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_see_all_action" then
			t.openSeeAllAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_sponsored_tooltip_action" then
			t.openSponsoredTooltipAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "play_button_click_action" then
			t.playButtonClickAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "update_user_settings_action" then
			t.updateUserSettingsAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_tooltip_action" then
			t.openTooltipAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_badge_details_action" then
			t.openBadgeDetailsAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "load_more_from_api_action" then
			t.loadMoreFromApiAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "share_action" then
			t.shareAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_abuse_report_action" then
			t.openAbuseReportAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "remove_badge_from_inventory_action" then
			t.removeBadgeFromInventoryAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_profile_action" then
			t.openProfileAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_facial_age_estimation_action" then
			t.openFacialAgeEstimationAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_add_connections_page_action" then
			t.openAddConnectionsPageAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_marketplace_action" then
			t.openMarketplaceAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "hide_profile_completion_action" then
			t.hideProfileCompletionAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "select_marketplace_catalog_category" then
			t.selectMarketplaceCatalogCategory = self.kind.value:jsonEncode()
		elseif self.kind.type == "select_marketplace_catalog_subcategory" then
			t.selectMarketplaceCatalogSubcategory = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_marketplace_catalog_see_all" then
			t.openMarketplaceCatalogSeeAll = self.kind.value:jsonEncode()
		elseif self.kind.type == "close_marketplace_category_tooltip" then
			t.closeMarketplaceCategoryTooltip = self.kind.value:jsonEncode()
		elseif self.kind.type == "resize_marketplace_catalog" then
			t.resizeMarketplaceCatalog = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_marketplace_catalog_filters" then
			t.openMarketplaceCatalogFilters = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_social_link_action" then
			t.openSocialLinkAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_charts_sort_detail_action" then
			t.openChartsSortDetailAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_song_detail_action" then
			t.openSongDetailAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "refresh_from_api_action" then
			t.refreshFromApiAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "rsvp_to_event_action" then
			t.rsvpToEventAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "apply_charts_filter_action" then
			t.applyChartsFilterAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "analytics_event_action" then
			t.analyticsEventAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "custom_analytics_event_action" then
			t.customAnalyticsEventAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_game_invite_action" then
			t.openGameInviteAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_event_details_action" then
			t.openEventDetailsAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "launch_experience_action" then
			t.launchExperienceAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "toggle_experience_favorite_action" then
			t.toggleExperienceFavoriteAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "toggle_experience_follow_action" then
			t.toggleExperienceFollowAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "toggle_experience_vote_action" then
			t.toggleExperienceVoteAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_purchase_prompt_action" then
			t.openPurchasePromptAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_sdui_overlay_action" then
			t.openSduiOverlayAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_badges_see_all_action" then
			t.openBadgesSeeAllAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_experience_store_see_all_action" then
			t.openExperienceStoreSeeAllAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "dismiss_game_feedback_action" then
			t.dismissGameFeedbackAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_game_feedback_form_action" then
			t.openGameFeedbackFormAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "enable_event_notifications_action" then
			t.enableEventNotificationsAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "dismiss_event_notifications_modal_action" then
			t.dismissEventNotificationsModalAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_amp_wizard_action" then
			t.openAmpWizardAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_subscription_purchase_page_action" then
			t.openSubscriptionPurchasePageAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "refresh_game_passes_action" then
			t.refreshGamePassesAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "refresh_playability_action" then
			t.refreshPlayabilityAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_social_proof_user_list_sheet_action" then
			t.openSocialProofUserListSheetAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "report_surface_load_time_milestone_action" then
			t.reportSurfaceLoadTimeMilestoneAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_search_results_tab_action" then
			t.openSearchResultsTabAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_phone_upsell_modal_action" then
			t.openPhoneUpsellModalAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_email_upsell_modal_action" then
			t.openEmailUpsellModalAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "dismiss_prompt_action" then
			t.dismissPromptAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "request_friendship_action" then
			t.requestFriendshipAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "refresh_developer_products_action" then
			t.refreshDeveloperProductsAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_fae_trial_upsell_action" then
			t.openFaeTrialUpsellAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "refresh_omni_recommendation_feed_item_action" then
			t.refreshOmniRecommendationFeedItemAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "ai_overview_feedback_action" then
			t.aiOverviewFeedbackAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_trusted_friends_upsell_modal_action" then
			t.openTrustedFriendsUpsellModalAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "record_party_chat_conversation_upsell_acknowledgement_action" then
			t.recordPartyChatConversationUpsellAcknowledgementAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_search_results_with_query_action" then
			t.openSearchResultsWithQueryAction = self.kind.value:jsonEncode()
		end
	end
	if self.telemetry_handler ~= nil then
		t.telemetryHandler = self.telemetry_handler:jsonEncode()
	end
	if self.accessibility_label ~= nil then
		t.accessibilityLabel = self.accessibility_label:jsonEncode()
	end
	return t
end

function t_144:jsonDecode() --[[ line: 27339 ]]
	-- upvalues: t_144 (ref), t (ref), propTypesModule (ref)
	local var5122 = t_144.new()
	
	if self.dismiss_dialog_action ~= nil then
		var5122.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismiss_dialog_action)
		}
	end
	if self.dismissDialogAction ~= nil then
		var5122.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismissDialogAction)
		}
	end
	if self.link_action ~= nil then
		var5122.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.link_action)
		}
	end
	if self.linkAction ~= nil then
		var5122.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.linkAction)
		}
	end
	if self.open_game_details_action ~= nil then
		var5122.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.open_game_details_action)
		}
	end
	if self.openGameDetailsAction ~= nil then
		var5122.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.openGameDetailsAction)
		}
	end
	if self.open_join_friends_action ~= nil then
		var5122.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.open_join_friends_action)
		}
	end
	if self.openJoinFriendsAction ~= nil then
		var5122.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.openJoinFriendsAction)
		}
	end
	if self.open_marketplace_try_on_action ~= nil then
		var5122.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.open_marketplace_try_on_action)
		}
	end
	if self.openMarketplaceTryOnAction ~= nil then
		var5122.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.openMarketplaceTryOnAction)
		}
	end
	if self.open_see_all_action ~= nil then
		var5122.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.open_see_all_action)
		}
	end
	if self.openSeeAllAction ~= nil then
		var5122.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.openSeeAllAction)
		}
	end
	if self.open_sponsored_tooltip_action ~= nil then
		var5122.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.open_sponsored_tooltip_action)
		}
	end
	if self.openSponsoredTooltipAction ~= nil then
		var5122.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.openSponsoredTooltipAction)
		}
	end
	if self.play_button_click_action ~= nil then
		var5122.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.play_button_click_action)
		}
	end
	if self.playButtonClickAction ~= nil then
		var5122.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.playButtonClickAction)
		}
	end
	if self.update_user_settings_action ~= nil then
		var5122.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.update_user_settings_action)
		}
	end
	if self.updateUserSettingsAction ~= nil then
		var5122.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.updateUserSettingsAction)
		}
	end
	if self.open_tooltip_action ~= nil then
		var5122.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.open_tooltip_action)
		}
	end
	if self.openTooltipAction ~= nil then
		var5122.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.openTooltipAction)
		}
	end
	if self.open_badge_details_action ~= nil then
		var5122.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.open_badge_details_action)
		}
	end
	if self.openBadgeDetailsAction ~= nil then
		var5122.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.openBadgeDetailsAction)
		}
	end
	if self.load_more_from_api_action ~= nil then
		var5122.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.load_more_from_api_action)
		}
	end
	if self.loadMoreFromApiAction ~= nil then
		var5122.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.loadMoreFromApiAction)
		}
	end
	if self.share_action ~= nil then
		var5122.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.share_action)
		}
	end
	if self.shareAction ~= nil then
		var5122.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.shareAction)
		}
	end
	if self.open_abuse_report_action ~= nil then
		var5122.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.open_abuse_report_action)
		}
	end
	if self.openAbuseReportAction ~= nil then
		var5122.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.openAbuseReportAction)
		}
	end
	if self.remove_badge_from_inventory_action ~= nil then
		var5122.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.remove_badge_from_inventory_action)
		}
	end
	if self.removeBadgeFromInventoryAction ~= nil then
		var5122.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.removeBadgeFromInventoryAction)
		}
	end
	if self.open_profile_action ~= nil then
		var5122.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.open_profile_action)
		}
	end
	if self.openProfileAction ~= nil then
		var5122.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.openProfileAction)
		}
	end
	if self.open_facial_age_estimation_action ~= nil then
		var5122.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.open_facial_age_estimation_action)
		}
	end
	if self.openFacialAgeEstimationAction ~= nil then
		var5122.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.openFacialAgeEstimationAction)
		}
	end
	if self.open_add_connections_page_action ~= nil then
		var5122.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.open_add_connections_page_action)
		}
	end
	if self.openAddConnectionsPageAction ~= nil then
		var5122.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.openAddConnectionsPageAction)
		}
	end
	if self.open_marketplace_action ~= nil then
		var5122.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.open_marketplace_action)
		}
	end
	if self.openMarketplaceAction ~= nil then
		var5122.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.openMarketplaceAction)
		}
	end
	if self.hide_profile_completion_action ~= nil then
		var5122.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hide_profile_completion_action)
		}
	end
	if self.hideProfileCompletionAction ~= nil then
		var5122.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hideProfileCompletionAction)
		}
	end
	if self.select_marketplace_catalog_category ~= nil then
		var5122.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.select_marketplace_catalog_category)
		}
	end
	if self.selectMarketplaceCatalogCategory ~= nil then
		var5122.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.selectMarketplaceCatalogCategory)
		}
	end
	if self.select_marketplace_catalog_subcategory ~= nil then
		var5122.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.select_marketplace_catalog_subcategory)
		}
	end
	if self.selectMarketplaceCatalogSubcategory ~= nil then
		var5122.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.selectMarketplaceCatalogSubcategory)
		}
	end
	if self.open_marketplace_catalog_see_all ~= nil then
		var5122.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.open_marketplace_catalog_see_all)
		}
	end
	if self.openMarketplaceCatalogSeeAll ~= nil then
		var5122.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.openMarketplaceCatalogSeeAll)
		}
	end
	if self.close_marketplace_category_tooltip ~= nil then
		var5122.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.close_marketplace_category_tooltip)
		}
	end
	if self.closeMarketplaceCategoryTooltip ~= nil then
		var5122.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.closeMarketplaceCategoryTooltip)
		}
	end
	if self.resize_marketplace_catalog ~= nil then
		var5122.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resize_marketplace_catalog)
		}
	end
	if self.resizeMarketplaceCatalog ~= nil then
		var5122.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resizeMarketplaceCatalog)
		}
	end
	if self.open_marketplace_catalog_filters ~= nil then
		var5122.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.open_marketplace_catalog_filters)
		}
	end
	if self.openMarketplaceCatalogFilters ~= nil then
		var5122.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.openMarketplaceCatalogFilters)
		}
	end
	if self.open_social_link_action ~= nil then
		var5122.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.open_social_link_action)
		}
	end
	if self.openSocialLinkAction ~= nil then
		var5122.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.openSocialLinkAction)
		}
	end
	if self.open_charts_sort_detail_action ~= nil then
		var5122.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.open_charts_sort_detail_action)
		}
	end
	if self.openChartsSortDetailAction ~= nil then
		var5122.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.openChartsSortDetailAction)
		}
	end
	if self.open_song_detail_action ~= nil then
		var5122.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.open_song_detail_action)
		}
	end
	if self.openSongDetailAction ~= nil then
		var5122.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.openSongDetailAction)
		}
	end
	if self.refresh_from_api_action ~= nil then
		var5122.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refresh_from_api_action)
		}
	end
	if self.refreshFromApiAction ~= nil then
		var5122.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refreshFromApiAction)
		}
	end
	if self.rsvp_to_event_action ~= nil then
		var5122.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvp_to_event_action)
		}
	end
	if self.rsvpToEventAction ~= nil then
		var5122.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvpToEventAction)
		}
	end
	if self.apply_charts_filter_action ~= nil then
		var5122.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.apply_charts_filter_action)
		}
	end
	if self.applyChartsFilterAction ~= nil then
		var5122.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.applyChartsFilterAction)
		}
	end
	if self.analytics_event_action ~= nil then
		var5122.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analytics_event_action)
		}
	end
	if self.analyticsEventAction ~= nil then
		var5122.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analyticsEventAction)
		}
	end
	if self.custom_analytics_event_action ~= nil then
		var5122.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.custom_analytics_event_action)
		}
	end
	if self.customAnalyticsEventAction ~= nil then
		var5122.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.customAnalyticsEventAction)
		}
	end
	if self.open_game_invite_action ~= nil then
		var5122.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.open_game_invite_action)
		}
	end
	if self.openGameInviteAction ~= nil then
		var5122.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.openGameInviteAction)
		}
	end
	if self.open_event_details_action ~= nil then
		var5122.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.open_event_details_action)
		}
	end
	if self.openEventDetailsAction ~= nil then
		var5122.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.openEventDetailsAction)
		}
	end
	if self.launch_experience_action ~= nil then
		var5122.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launch_experience_action)
		}
	end
	if self.launchExperienceAction ~= nil then
		var5122.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launchExperienceAction)
		}
	end
	if self.toggle_experience_favorite_action ~= nil then
		var5122.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggle_experience_favorite_action)
		}
	end
	if self.toggleExperienceFavoriteAction ~= nil then
		var5122.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggleExperienceFavoriteAction)
		}
	end
	if self.toggle_experience_follow_action ~= nil then
		var5122.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggle_experience_follow_action)
		}
	end
	if self.toggleExperienceFollowAction ~= nil then
		var5122.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggleExperienceFollowAction)
		}
	end
	if self.toggle_experience_vote_action ~= nil then
		var5122.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggle_experience_vote_action)
		}
	end
	if self.toggleExperienceVoteAction ~= nil then
		var5122.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggleExperienceVoteAction)
		}
	end
	if self.open_purchase_prompt_action ~= nil then
		var5122.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.open_purchase_prompt_action)
		}
	end
	if self.openPurchasePromptAction ~= nil then
		var5122.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.openPurchasePromptAction)
		}
	end
	if self.open_sdui_overlay_action ~= nil then
		var5122.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.open_sdui_overlay_action)
		}
	end
	if self.openSduiOverlayAction ~= nil then
		var5122.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.openSduiOverlayAction)
		}
	end
	if self.open_badges_see_all_action ~= nil then
		var5122.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.open_badges_see_all_action)
		}
	end
	if self.openBadgesSeeAllAction ~= nil then
		var5122.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.openBadgesSeeAllAction)
		}
	end
	if self.open_experience_store_see_all_action ~= nil then
		var5122.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.open_experience_store_see_all_action)
		}
	end
	if self.openExperienceStoreSeeAllAction ~= nil then
		var5122.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.openExperienceStoreSeeAllAction)
		}
	end
	if self.dismiss_game_feedback_action ~= nil then
		var5122.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismiss_game_feedback_action)
		}
	end
	if self.dismissGameFeedbackAction ~= nil then
		var5122.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismissGameFeedbackAction)
		}
	end
	if self.open_game_feedback_form_action ~= nil then
		var5122.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.open_game_feedback_form_action)
		}
	end
	if self.openGameFeedbackFormAction ~= nil then
		var5122.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.openGameFeedbackFormAction)
		}
	end
	if self.enable_event_notifications_action ~= nil then
		var5122.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enable_event_notifications_action)
		}
	end
	if self.enableEventNotificationsAction ~= nil then
		var5122.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enableEventNotificationsAction)
		}
	end
	if self.dismiss_event_notifications_modal_action ~= nil then
		var5122.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismiss_event_notifications_modal_action)
		}
	end
	if self.dismissEventNotificationsModalAction ~= nil then
		var5122.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismissEventNotificationsModalAction)
		}
	end
	if self.open_amp_wizard_action ~= nil then
		var5122.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.open_amp_wizard_action)
		}
	end
	if self.openAmpWizardAction ~= nil then
		var5122.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.openAmpWizardAction)
		}
	end
	if self.open_subscription_purchase_page_action ~= nil then
		var5122.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.open_subscription_purchase_page_action)
		}
	end
	if self.openSubscriptionPurchasePageAction ~= nil then
		var5122.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.openSubscriptionPurchasePageAction)
		}
	end
	if self.refresh_game_passes_action ~= nil then
		var5122.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refresh_game_passes_action)
		}
	end
	if self.refreshGamePassesAction ~= nil then
		var5122.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refreshGamePassesAction)
		}
	end
	if self.refresh_playability_action ~= nil then
		var5122.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refresh_playability_action)
		}
	end
	if self.refreshPlayabilityAction ~= nil then
		var5122.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refreshPlayabilityAction)
		}
	end
	if self.open_social_proof_user_list_sheet_action ~= nil then
		var5122.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.open_social_proof_user_list_sheet_action)
		}
	end
	if self.openSocialProofUserListSheetAction ~= nil then
		var5122.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.openSocialProofUserListSheetAction)
		}
	end
	if self.report_surface_load_time_milestone_action ~= nil then
		var5122.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.report_surface_load_time_milestone_action)
		}
	end
	if self.reportSurfaceLoadTimeMilestoneAction ~= nil then
		var5122.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.reportSurfaceLoadTimeMilestoneAction)
		}
	end
	if self.open_search_results_tab_action ~= nil then
		var5122.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.open_search_results_tab_action)
		}
	end
	if self.openSearchResultsTabAction ~= nil then
		var5122.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.openSearchResultsTabAction)
		}
	end
	if self.open_phone_upsell_modal_action ~= nil then
		var5122.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.open_phone_upsell_modal_action)
		}
	end
	if self.openPhoneUpsellModalAction ~= nil then
		var5122.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.openPhoneUpsellModalAction)
		}
	end
	if self.open_email_upsell_modal_action ~= nil then
		var5122.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.open_email_upsell_modal_action)
		}
	end
	if self.openEmailUpsellModalAction ~= nil then
		var5122.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.openEmailUpsellModalAction)
		}
	end
	if self.dismiss_prompt_action ~= nil then
		var5122.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismiss_prompt_action)
		}
	end
	if self.dismissPromptAction ~= nil then
		var5122.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismissPromptAction)
		}
	end
	if self.request_friendship_action ~= nil then
		var5122.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.request_friendship_action)
		}
	end
	if self.requestFriendshipAction ~= nil then
		var5122.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.requestFriendshipAction)
		}
	end
	if self.refresh_developer_products_action ~= nil then
		var5122.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refresh_developer_products_action)
		}
	end
	if self.refreshDeveloperProductsAction ~= nil then
		var5122.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refreshDeveloperProductsAction)
		}
	end
	if self.open_fae_trial_upsell_action ~= nil then
		var5122.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.open_fae_trial_upsell_action)
		}
	end
	if self.openFaeTrialUpsellAction ~= nil then
		var5122.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.openFaeTrialUpsellAction)
		}
	end
	if self.refresh_omni_recommendation_feed_item_action ~= nil then
		var5122.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refresh_omni_recommendation_feed_item_action)
		}
	end
	if self.refreshOmniRecommendationFeedItemAction ~= nil then
		var5122.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refreshOmniRecommendationFeedItemAction)
		}
	end
	if self.ai_overview_feedback_action ~= nil then
		var5122.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.ai_overview_feedback_action)
		}
	end
	if self.aiOverviewFeedbackAction ~= nil then
		var5122.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.aiOverviewFeedbackAction)
		}
	end
	if self.open_trusted_friends_upsell_modal_action ~= nil then
		var5122.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.open_trusted_friends_upsell_modal_action)
		}
	end
	if self.openTrustedFriendsUpsellModalAction ~= nil then
		var5122.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.openTrustedFriendsUpsellModalAction)
		}
	end
	if self.record_party_chat_conversation_upsell_acknowledgement_action ~= nil then
		var5122.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.record_party_chat_conversation_upsell_acknowledgement_action)
		}
	end
	if self.recordPartyChatConversationUpsellAcknowledgementAction ~= nil then
		var5122.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.recordPartyChatConversationUpsellAcknowledgementAction)
		}
	end
	if self.open_search_results_with_query_action ~= nil then
		var5122.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.open_search_results_with_query_action)
		}
	end
	if self.openSearchResultsWithQueryAction ~= nil then
		var5122.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.openSearchResultsWithQueryAction)
		}
	end
	if self.telemetry_handler ~= nil then
		var5122.telemetry_handler = propTypesModule.StringProp.jsonDecode(self.telemetry_handler)
	end
	if self.telemetryHandler ~= nil then
		var5122.telemetry_handler = propTypesModule.StringProp.jsonDecode(self.telemetryHandler)
	end
	if self.accessibility_label ~= nil then
		var5122.accessibility_label = propTypesModule.StringFormat.jsonDecode(self.accessibility_label)
	end
	if self.accessibilityLabel ~= nil then
		var5122.accessibility_label = propTypesModule.StringFormat.jsonDecode(self.accessibilityLabel)
	end
	return var5122
end

t_144.descriptor = {
	name = "Action",
	fullName = "roblox.apppageplatform.shared.v1beta1.Action"
}
t.Action = t_144
typeRegistryModule.default:register(t.Action)
local t_145 = {}
t_145.__index = t_145

function t_145.new(p285) --[[ line: 28319 ]]
	-- upvalues: t_145 (ref)
	return setmetatable({
		kind = if p285 == nil or p285.kind == nil then nil else p285.kind
	}, t_145)
end

function t_145:encode() --[[ line: 28325 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5124 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "value" then
			local var5125 = self.kind.value:encode()
			local var5126, var5127 = protoModule.writeTag(buff, var5124, 1, protoModule.wireTypes.lengthDelimited)
			var5126, var5127 = protoModule.writeBuffer(var5126, var5127, var5125, buffer.len(var5125))
			buff = var5126
			var5124 = var5127
		elseif self.kind.type == "conditional" then
			local var5128 = self.kind.value:encode()
			local var5129, var5130 = protoModule.writeTag(buff, var5124, 2, protoModule.wireTypes.lengthDelimited)
			var5129, var5130 = protoModule.writeBuffer(var5129, var5130, var5128, buffer.len(var5128))
			buff = var5129
			var5124 = var5130
		end
	end
	local buff_1 = buffer.create(var5124)
	buffer.copy(buff_1, 0, buff, 0, var5124)
	
	return buff_1
end

function t_145.decode(p286) --[[ line: 28346 ]]
	-- upvalues: t_145 (ref), protoModule (ref), t (ref)
	local var5132 = t_145.new()
	local var5133 = 0
	while var5133 < buffer.len(p286) do
		local _ = nil
		local var5134 = nil
		local var5135, var5136, var5137 = protoModule.readTag(p286, var5133)
		local var5138 = var5135
		var5134 = var5136
		var5133 = var5137
		
		if var5134 == protoModule.wireTypes.varint then
			local _ = nil
			local var5139, var5140 = protoModule.readVarInt(p286, var5133)
			local _ = var5139
			var5133 = var5140
			continue
		end
		if var5134 == protoModule.wireTypes.lengthDelimited then
			if var5138 == 1 then
				local _ = nil
				local var5141, var5142 = protoModule.readBuffer(p286, var5133)
				var5133 = var5142
				var5132.kind = { type = "value", value = t.Action.decode(var5141) }
			elseif var5138 == 2 then
				local _ = nil
				local var5143, var5144 = protoModule.readBuffer(p286, var5133)
				var5133 = var5144
				var5132.kind = {
					type = "conditional",
					value = t.ActionProp_ConditionalOptions.decode(var5143)
				}
			else
				local _ = nil
				local var5145, var5146 = protoModule.readVarInt(p286, var5133)
				var5133 = var5146 + var5145
			end
		elseif var5134 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5147, var5148 = protoModule.readFixed32(p286, var5133)
			local _ = var5147
			var5133 = var5148
		elseif var5134 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5149, var5150 = protoModule.readFixed64(p286, var5133)
			local _ = var5149
			var5133 = var5150
		else
			error("Unsupported wire type: " .. var5134)
		end
	end
	return var5132
end

function t_145:jsonEncode() --[[ line: 28394 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "value" then
			t.value = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_145:jsonDecode() --[[ line: 28408 ]]
	-- upvalues: t_145 (ref), t (ref)
	local var5152 = t_145.new()
	
	if self.value ~= nil then
		var5152.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	if self.conditional ~= nil then
		var5152.kind = {
			type = "conditional",
			value = t.ActionProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var5152
end

t_145.descriptor = {
	name = "ActionProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionProp"
}
t.ActionProp = t_145
typeRegistryModule.default:register(t.ActionProp)
local t_146 = {}
t_146.__index = t_146

function t_146.new(p287) --[[ line: 28437 ]]
	-- upvalues: t_146 (ref)
	return setmetatable({
		condition = if p287 == nil or p287.condition == nil then nil else p287.condition,
		kind = if p287 == nil or p287.kind == nil then nil else p287.kind
	}, t_146)
end

function t_146:encode() --[[ line: 28446 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5154 = 0
	
	if self.condition ~= nil then
		local var5155 = self.condition:encode()
		local var5156, var5157 = protoModule.writeTag(buff, var5154, 1, protoModule.wireTypes.lengthDelimited)
		var5156, var5157 = protoModule.writeBuffer(var5156, var5157, var5155, buffer.len(var5155))
		buff = var5156
		var5154 = var5157
	end
	if self.kind ~= nil and self.kind.type == "value" then
		local var5158 = self.kind.value:encode()
		local var5159, var5160 = protoModule.writeTag(buff, var5154, 3, protoModule.wireTypes.lengthDelimited)
		var5159, var5160 = protoModule.writeBuffer(var5159, var5160, var5158, buffer.len(var5158))
		buff = var5159
		var5154 = var5160
	end
	local buff_1 = buffer.create(var5154)
	buffer.copy(buff_1, 0, buff, 0, var5154)
	
	return buff_1
end

function t_146.decode(p288) --[[ line: 28469 ]]
	-- upvalues: t_146 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var5162 = t_146.new()
	local var5163 = 0
	while var5163 < buffer.len(p288) do
		local _ = nil
		local var5164 = nil
		local var5165, var5166, var5167 = protoModule.readTag(p288, var5163)
		local var5168 = var5165
		var5164 = var5166
		var5163 = var5167
		
		if var5164 == protoModule.wireTypes.varint then
			local _ = nil
			local var5169, var5170 = protoModule.readVarInt(p288, var5163)
			local _ = var5169
			var5163 = var5170
			continue
		end
		if var5164 == protoModule.wireTypes.lengthDelimited then
			if var5168 == 1 then
				local _ = nil
				local var5171, var5172 = protoModule.readBuffer(p288, var5163)
				var5163 = var5172
				var5162.condition = propConditionModule.PropCondition.decode(var5171)
			elseif var5168 == 3 then
				local _ = nil
				local var5173, var5174 = protoModule.readBuffer(p288, var5163)
				var5163 = var5174
				var5162.kind = { type = "value", value = t.Action.decode(var5173) }
			else
				local _ = nil
				local var5175, var5176 = protoModule.readVarInt(p288, var5163)
				var5163 = var5176 + var5175
			end
		elseif var5164 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5177, var5178 = protoModule.readFixed32(p288, var5163)
			local _ = var5177
			var5163 = var5178
		elseif var5164 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5179, var5180 = protoModule.readFixed64(p288, var5163)
			local _ = var5179
			var5163 = var5180
		else
			error("Unsupported wire type: " .. var5164)
		end
	end
	return var5162
end

function t_146:jsonEncode() --[[ line: 28517 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "value" then
		t.value = self.kind.value:jsonEncode()
	end
	return t
end

function t_146:jsonDecode() --[[ line: 28533 ]]
	-- upvalues: t_146 (ref), propConditionModule (ref), t (ref)
	local var5182 = t_146.new()
	
	if self.condition ~= nil then
		var5182.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.value ~= nil then
		var5182.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	return var5182
end

t_146.descriptor = {
	name = "ActionProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ActionProp_ConditionalOption = t_146
typeRegistryModule.default:register(t.ActionProp_ConditionalOption)
local t_147 = {}
t_147.__index = t_147

function t_147.new(p289) --[[ line: 28562 ]]
	-- upvalues: t_147 (ref)
	return setmetatable({
		options = if p289 == nil or p289.options == nil then {} else p289.options
	}, t_147)
end

function t_147:encode() --[[ line: 28570 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5184 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var5185 = v:encode()
			local var5186, var5187 = protoModule.writeTag(buff, var5184, 1, protoModule.wireTypes.lengthDelimited)
			var5186, var5187 = protoModule.writeBuffer(var5186, var5187, var5185, buffer.len(var5185))
			buff = var5186
			var5184 = var5187
		end
	end
	local buff_1 = buffer.create(var5184)
	buffer.copy(buff_1, 0, buff, 0, var5184)
	
	return buff_1
end

function t_147.decode(p290) --[[ line: 28587 ]]
	-- upvalues: t_147 (ref), protoModule (ref), t (ref)
	local var5189 = t_147.new()
	local var5190 = 0
	while var5190 < buffer.len(p290) do
		local _ = nil
		local var5191 = nil
		local var5192, var5193, var5194 = protoModule.readTag(p290, var5190)
		local var5195 = var5192
		var5191 = var5193
		var5190 = var5194
		
		if var5191 == protoModule.wireTypes.varint then
			local _ = nil
			local var5196, var5197 = protoModule.readVarInt(p290, var5190)
			local _ = var5196
			var5190 = var5197
			continue
		end
		if var5191 == protoModule.wireTypes.lengthDelimited then
			if var5195 == 1 then
				local _ = nil
				local var5198, var5199 = protoModule.readBuffer(p290, var5190)
				var5190 = var5199
				table.insert(var5189.options, t.ActionProp_ConditionalOption.decode(var5198))
			else
				local _ = nil
				local var5200, var5201 = protoModule.readVarInt(p290, var5190)
				var5190 = var5201 + var5200
			end
		elseif var5191 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5202, var5203 = protoModule.readFixed32(p290, var5190)
			local _ = var5202
			var5190 = var5203
		elseif var5191 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5204, var5205 = protoModule.readFixed64(p290, var5190)
			local _ = var5204
			var5190 = var5205
		else
			error("Unsupported wire type: " .. var5191)
		end
	end
	return var5189
end

function t_147:jsonEncode() --[[ line: 28630 ]]
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

function t_147:jsonDecode() --[[ line: 28644 ]]
	-- upvalues: t_147 (ref), t (ref)
	local var5208 = t_147.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ActionProp_ConditionalOption.jsonDecode(v))
		end
		var5208.options = t_1
	end
	return var5208
end

t_147.descriptor = {
	name = "ActionProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ActionProp_ConditionalOptions = t_147
typeRegistryModule.default:register(t.ActionProp_ConditionalOptions)
local t_148 = {}
t_148.__index = t_148

function t_148.new(p291) --[[ line: 28673 ]]
	-- upvalues: t_148 (ref)
	return setmetatable({
		kind = if p291 == nil or p291.kind == nil then nil else p291.kind
	}, t_148)
end

function t_148:encode() --[[ line: 28679 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5211 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var5212 = self.kind.value:encode()
			local var5213, var5214 = protoModule.writeTag(buff, var5211, 1, protoModule.wireTypes.lengthDelimited)
			var5213, var5214 = protoModule.writeBuffer(var5213, var5214, var5212, buffer.len(var5212))
			buff = var5213
			var5211 = var5214
		elseif self.kind.type == "conditional" then
			local var5215 = self.kind.value:encode()
			local var5216, var5217 = protoModule.writeTag(buff, var5211, 2, protoModule.wireTypes.lengthDelimited)
			var5216, var5217 = protoModule.writeBuffer(var5216, var5217, var5215, buffer.len(var5215))
			buff = var5216
			var5211 = var5217
		elseif self.kind.type == "binding_path" then
			local var5218, var5219 = protoModule.writeTag(buff, var5211, 3, protoModule.wireTypes.lengthDelimited)
			var5218, var5219 = protoModule.writeString(var5218, var5219, self.kind.value)
			buff = var5218
			var5211 = var5219
		end
	end
	local buff_1 = buffer.create(var5211)
	buffer.copy(buff_1, 0, buff, 0, var5211)
	
	return buff_1
end

function t_148.decode(p292) --[[ line: 28703 ]]
	-- upvalues: t_148 (ref), protoModule (ref), t (ref)
	local var5221 = t_148.new()
	local var5222 = 0
	while var5222 < buffer.len(p292) do
		local _ = nil
		local var5223 = nil
		local var5224, var5225, var5226 = protoModule.readTag(p292, var5222)
		local var5227 = var5224
		var5223 = var5225
		var5222 = var5226
		
		if var5223 == protoModule.wireTypes.varint then
			local _ = nil
			local var5228, var5229 = protoModule.readVarInt(p292, var5222)
			local _ = var5228
			var5222 = var5229
			continue
		end
		if var5223 == protoModule.wireTypes.lengthDelimited then
			if var5227 == 1 then
				local _ = nil
				local var5230, var5231 = protoModule.readBuffer(p292, var5222)
				var5222 = var5231
				var5221.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(var5230)
				}
			elseif var5227 == 2 then
				local _ = nil
				local var5232, var5233 = protoModule.readBuffer(p292, var5222)
				var5222 = var5233
				var5221.kind = {
					type = "conditional",
					value = t.FocusNavActionsProp_ConditionalOptions.decode(var5232)
				}
			elseif var5227 == 3 then
				local _ = nil
				local var5234, var5235 = protoModule.readBuffer(p292, var5222)
				var5222 = var5235
				var5221.kind = { type = "binding_path", value = buffer.tostring(var5234) }
			else
				local _ = nil
				local var5236, var5237 = protoModule.readVarInt(p292, var5222)
				var5222 = var5237 + var5236
			end
		elseif var5223 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5238, var5239 = protoModule.readFixed32(p292, var5222)
			local _ = var5238
			var5222 = var5239
		elseif var5223 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5240, var5241 = protoModule.readFixed64(p292, var5222)
			local _ = var5240
			var5222 = var5241
		else
			error("Unsupported wire type: " .. var5223)
		end
	end
	return var5221
end

function t_148:jsonEncode() --[[ line: 28757 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
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

function t_148:jsonDecode() --[[ line: 28773 ]]
	-- upvalues: t_148 (ref), t (ref)
	local var5243 = t_148.new()
	
	if self.literal ~= nil then
		var5243.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
		}
	end
	if self.conditional ~= nil then
		var5243.kind = {
			type = "conditional",
			value = t.FocusNavActionsProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var5243.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var5243.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var5243
end

t_148.descriptor = {
	name = "FocusNavActionsProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavActionsProp"
}
t.FocusNavActionsProp = t_148
typeRegistryModule.default:register(t.FocusNavActionsProp)
local t_149 = {}
t_149.__index = t_149

function t_149.new(p293) --[[ line: 28813 ]]
	-- upvalues: t_149 (ref)
	return setmetatable({
		condition = if p293 == nil or p293.condition == nil then nil else p293.condition,
		kind = if p293 == nil or p293.kind == nil then nil else p293.kind
	}, t_149)
end

function t_149:encode() --[[ line: 28822 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5245 = 0
	
	if self.condition ~= nil then
		local var5246 = self.condition:encode()
		local var5247, var5248 = protoModule.writeTag(buff, var5245, 1, protoModule.wireTypes.lengthDelimited)
		var5247, var5248 = protoModule.writeBuffer(var5247, var5248, var5246, buffer.len(var5246))
		buff = var5247
		var5245 = var5248
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var5249 = self.kind.value:encode()
			local var5250, var5251 = protoModule.writeTag(buff, var5245, 3, protoModule.wireTypes.lengthDelimited)
			var5250, var5251 = protoModule.writeBuffer(var5250, var5251, var5249, buffer.len(var5249))
			buff = var5250
			var5245 = var5251
		elseif self.kind.type == "binding_path" then
			local var5252, var5253 = protoModule.writeTag(buff, var5245, 4, protoModule.wireTypes.lengthDelimited)
			var5252, var5253 = protoModule.writeString(var5252, var5253, self.kind.value)
			buff = var5252
			var5245 = var5253
		end
	end
	local buff_1 = buffer.create(var5245)
	buffer.copy(buff_1, 0, buff, 0, var5245)
	
	return buff_1
end

function t_149.decode(p294) --[[ line: 28848 ]]
	-- upvalues: t_149 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var5255 = t_149.new()
	local var5256 = 0
	while var5256 < buffer.len(p294) do
		local _ = nil
		local var5257 = nil
		local var5258, var5259, var5260 = protoModule.readTag(p294, var5256)
		local var5261 = var5258
		var5257 = var5259
		var5256 = var5260
		
		if var5257 == protoModule.wireTypes.varint then
			local _ = nil
			local var5262, var5263 = protoModule.readVarInt(p294, var5256)
			local _ = var5262
			var5256 = var5263
			continue
		end
		if var5257 == protoModule.wireTypes.lengthDelimited then
			if var5261 == 1 then
				local _ = nil
				local var5264, var5265 = protoModule.readBuffer(p294, var5256)
				var5256 = var5265
				var5255.condition = propConditionModule.PropCondition.decode(var5264)
			elseif var5261 == 3 then
				local _ = nil
				local var5266, var5267 = protoModule.readBuffer(p294, var5256)
				var5256 = var5267
				var5255.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(var5266)
				}
			elseif var5261 == 4 then
				local _ = nil
				local var5268, var5269 = protoModule.readBuffer(p294, var5256)
				var5256 = var5269
				var5255.kind = { type = "binding_path", value = buffer.tostring(var5268) }
			else
				local _ = nil
				local var5270, var5271 = protoModule.readVarInt(p294, var5256)
				var5256 = var5271 + var5270
			end
		elseif var5257 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5272, var5273 = protoModule.readFixed32(p294, var5256)
			local _ = var5272
			var5256 = var5273
		elseif var5257 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5274, var5275 = protoModule.readFixed64(p294, var5256)
			local _ = var5274
			var5256 = var5275
		else
			error("Unsupported wire type: " .. var5257)
		end
	end
	return var5255
end

function t_149:jsonEncode() --[[ line: 28901 ]]
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

function t_149:jsonDecode() --[[ line: 28919 ]]
	-- upvalues: t_149 (ref), propConditionModule (ref), t (ref)
	local var5277 = t_149.new()
	
	if self.condition ~= nil then
		var5277.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var5277.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var5277.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var5277.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var5277
end

t_149.descriptor = {
	name = "FocusNavActionsProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FocusNavActionsProp_ConditionalOption = t_149
typeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOption)
local t_150 = {}
t_150.__index = t_150

function t_150.new(p295) --[[ line: 28959 ]]
	-- upvalues: t_150 (ref)
	return setmetatable({
		options = if p295 == nil or p295.options == nil then {} else p295.options
	}, t_150)
end

function t_150:encode() --[[ line: 28967 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5279 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var5280 = v:encode()
			local var5281, var5282 = protoModule.writeTag(buff, var5279, 1, protoModule.wireTypes.lengthDelimited)
			var5281, var5282 = protoModule.writeBuffer(var5281, var5282, var5280, buffer.len(var5280))
			buff = var5281
			var5279 = var5282
		end
	end
	local buff_1 = buffer.create(var5279)
	buffer.copy(buff_1, 0, buff, 0, var5279)
	
	return buff_1
end

function t_150.decode(p296) --[[ line: 28984 ]]
	-- upvalues: t_150 (ref), protoModule (ref), t (ref)
	local var5284 = t_150.new()
	local var5285 = 0
	while var5285 < buffer.len(p296) do
		local _ = nil
		local var5286 = nil
		local var5287, var5288, var5289 = protoModule.readTag(p296, var5285)
		local var5290 = var5287
		var5286 = var5288
		var5285 = var5289
		
		if var5286 == protoModule.wireTypes.varint then
			local _ = nil
			local var5291, var5292 = protoModule.readVarInt(p296, var5285)
			local _ = var5291
			var5285 = var5292
			continue
		end
		if var5286 == protoModule.wireTypes.lengthDelimited then
			if var5290 == 1 then
				local _ = nil
				local var5293, var5294 = protoModule.readBuffer(p296, var5285)
				var5285 = var5294
				table.insert(var5284.options, t.FocusNavActionsProp_ConditionalOption.decode(var5293))
			else
				local _ = nil
				local var5295, var5296 = protoModule.readVarInt(p296, var5285)
				var5285 = var5296 + var5295
			end
		elseif var5286 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5297, var5298 = protoModule.readFixed32(p296, var5285)
			local _ = var5297
			var5285 = var5298
		elseif var5286 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5299, var5300 = protoModule.readFixed64(p296, var5285)
			local _ = var5299
			var5285 = var5300
		else
			error("Unsupported wire type: " .. var5286)
		end
	end
	return var5284
end

function t_150:jsonEncode() --[[ line: 29027 ]]
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

function t_150:jsonDecode() --[[ line: 29041 ]]
	-- upvalues: t_150 (ref), t (ref)
	local var5303 = t_150.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FocusNavActionsProp_ConditionalOption.jsonDecode(v))
		end
		var5303.options = t_1
	end
	return var5303
end

t_150.descriptor = {
	name = "FocusNavActionsProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FocusNavActionsProp_ConditionalOptions = t_150
typeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOptions)
local t_151 = {}
t_151.__index = t_151

function t_151.new(p297) --[[ line: 29072 ]]
	-- upvalues: t_151 (ref)
	return setmetatable({
		keys = if p297 == nil or p297.keys == nil then {} else p297.keys,
		events = if p297 == nil or p297.events == nil then {} else p297.events
	}, t_151)
end

function t_151:encode() --[[ line: 29081 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5306 = 0
	
	if self.keys ~= nil and next(self.keys) ~= nil then
		for i, v in self.keys do
			local var5307, var5308 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var5307, var5308 = protoModule.writeString(var5307, var5308, i)
			local var5309 = v:encode()
			var5308, var5310 = protoModule.writeTag(var5307, var5308, 2, protoModule.wireTypes.lengthDelimited)
			var5308, var5310 = protoModule.writeBuffer(var5308, var5310, var5309, buffer.len(var5309))
			local var5311 = var5308
			local var5312 = var5310
			local var5313, var5314 = protoModule.writeTag(buff, var5306, 3, protoModule.wireTypes.lengthDelimited)
			var5313, var5314 = protoModule.writeBuffer(var5313, var5314, var5311, var5312)
			buff = var5313
			var5306 = var5314
		end
	end
	if self.events ~= nil and next(self.events) ~= nil then
		for i, v in self.events do
			local var5315, var5316 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var5315, var5316 = protoModule.writeString(var5315, var5316, i)
			local var5317 = v:encode()
			var5316, var5318 = protoModule.writeTag(var5315, var5316, 2, protoModule.wireTypes.lengthDelimited)
			var5316, var5318 = protoModule.writeBuffer(var5316, var5318, var5317, buffer.len(var5317))
			local var5319 = var5316
			local var5320 = var5318
			local var5321, var5322 = protoModule.writeTag(buff, var5306, 4, protoModule.wireTypes.lengthDelimited)
			var5321, var5322 = protoModule.writeBuffer(var5321, var5322, var5319, var5320)
			buff = var5321
			var5306 = var5322
		end
	end
	local buff_1 = buffer.create(var5306)
	buffer.copy(buff_1, 0, buff, 0, var5306)
	
	return buff_1
end

function t_151.decode(p298) --[[ line: 29118 ]]
	-- upvalues: t_151 (ref), protoModule (ref), t (ref), propTypesEngineModule (ref)
	local var5324 = t_151.new()
	local var5325 = 0
	while var5325 < buffer.len(p298) do
		local _ = nil
		local var5326 = nil
		local var5327, var5328, var5329 = protoModule.readTag(p298, var5325)
		local var5330 = var5327
		var5326 = var5328
		var5325 = var5329
		
		if var5326 == protoModule.wireTypes.varint then
			local _ = nil
			local var5331, var5332 = protoModule.readVarInt(p298, var5325)
			local _ = var5331
			var5325 = var5332
			continue
		end
		if var5326 == protoModule.wireTypes.lengthDelimited then
			if var5330 == 3 then
				local _ = nil
				local var5333, var5334 = protoModule.readBuffer(p298, var5325)
				var5325 = var5334
				var5333 = t.FocusNavActionsProp_FocusNavData_KeysEntry.decode(var5333)
				var5324.keys[var5333.key or ""] = var5333.value or propTypesEngineModule.KeyCodeProp.new()
			elseif var5330 == 4 then
				local _ = nil
				local var5335, var5336 = protoModule.readBuffer(p298, var5325)
				var5325 = var5336
				var5335 = t.FocusNavActionsProp_FocusNavData_EventsEntry.decode(var5335)
				var5324.events[var5335.key or ""] = var5335.value or t.ActionProp.new()
			else
				local _ = nil
				local var5337, var5338 = protoModule.readVarInt(p298, var5325)
				var5325 = var5338 + var5337
			end
		elseif var5326 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5339, var5340 = protoModule.readFixed32(p298, var5325)
			local _ = var5339
			var5325 = var5340
		elseif var5326 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5341, var5342 = protoModule.readFixed64(p298, var5325)
			local _ = var5341
			var5325 = var5342
		else
			error("Unsupported wire type: " .. var5326)
		end
	end
	return var5324
end

function t_151:jsonEncode() --[[ line: 29180 ]]
	local t = {}
	
	if self.keys ~= nil and next(self.keys) ~= nil then
		local t_1 = {}
		
		for i, v in self.keys do
			t_1[i] = v:jsonEncode()
		end
		t.keys = t_1
	end
	if self.events ~= nil and next(self.events) ~= nil then
		local t_1 = {}
		
		for i, v in self.events do
			t_1[i] = v:jsonEncode()
		end
		t.events = t_1
	end
	return t
end

function t_151:jsonDecode() --[[ line: 29202 ]]
	-- upvalues: t_151 (ref), propTypesEngineModule (ref), t (ref)
	local var5346 = t_151.new()
	
	if self.keys ~= nil then
		local t_1 = {}
		
		for i, v in self.keys do
			t_1[i] = propTypesEngineModule.KeyCodeProp.jsonDecode(v)
		end
		var5346.keys = t_1
	end
	if self.events ~= nil then
		local t_1 = {}
		
		for i, v in self.events do
			t_1[i] = t.ActionProp.jsonDecode(v)
		end
		var5346.events = t_1
	end
	return var5346
end

t_151.descriptor = {
	name = "FocusNavActionsProp_FocusNavData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavData"
}
t.FocusNavActionsProp_FocusNavData = t_151
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData)
local t_152 = {}
t_152.__index = t_152

function t_152.new(p299) --[[ line: 29242 ]]
	-- upvalues: t_152 (ref)
	return setmetatable({
		key = if p299 == nil or p299.key == nil then "" else p299.key,
		value = if p299 == nil or p299.value == nil then nil else p299.value
	}, t_152)
end

function t_152:encode() --[[ line: 29251 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5350 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var5351, var5352 = protoModule.writeTag(buff, var5350, 1, protoModule.wireTypes.lengthDelimited)
		var5351, var5352 = protoModule.writeString(var5351, var5352, self.key)
		buff = var5351
		var5350 = var5352
	end
	if self.value ~= nil then
		local var5353 = self.value:encode()
		local var5354, var5355 = protoModule.writeTag(buff, var5350, 2, protoModule.wireTypes.lengthDelimited)
		var5354, var5355 = protoModule.writeBuffer(var5354, var5355, var5353, buffer.len(var5353))
		buff = var5354
		var5350 = var5355
	end
	local buff_1 = buffer.create(var5350)
	buffer.copy(buff_1, 0, buff, 0, var5350)
	
	return buff_1
end

function t_152.decode(p300) --[[ line: 29273 ]]
	-- upvalues: t_152 (ref), protoModule (ref), propTypesEngineModule (ref)
	local var5357 = t_152.new()
	local var5358 = 0
	while var5358 < buffer.len(p300) do
		local _ = nil
		local var5359 = nil
		local var5360, var5361, var5362 = protoModule.readTag(p300, var5358)
		local var5363 = var5360
		var5359 = var5361
		var5358 = var5362
		
		if var5359 == protoModule.wireTypes.varint then
			local _ = nil
			local var5364, var5365 = protoModule.readVarInt(p300, var5358)
			local _ = var5364
			var5358 = var5365
			continue
		end
		if var5359 == protoModule.wireTypes.lengthDelimited then
			if var5363 == 1 then
				local _ = nil
				local var5366, var5367 = protoModule.readBuffer(p300, var5358)
				var5358 = var5367
				var5357.key = buffer.tostring(var5366)
			elseif var5363 == 2 then
				local _ = nil
				local var5368, var5369 = protoModule.readBuffer(p300, var5358)
				var5358 = var5369
				var5357.value = propTypesEngineModule.KeyCodeProp.decode(var5368)
			else
				local _ = nil
				local var5370, var5371 = protoModule.readVarInt(p300, var5358)
				var5358 = var5371 + var5370
			end
		elseif var5359 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5372, var5373 = protoModule.readFixed32(p300, var5358)
			local _ = var5372
			var5358 = var5373
		elseif var5359 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5374, var5375 = protoModule.readFixed64(p300, var5358)
			local _ = var5374
			var5358 = var5375
		else
			error("Unsupported wire type: " .. var5359)
		end
	end
	return var5357
end

function t_152:jsonEncode() --[[ line: 29323 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_152:jsonDecode() --[[ line: 29339 ]]
	-- upvalues: t_152 (ref), propTypesEngineModule (ref)
	local var5377 = t_152.new()
	
	if self.key ~= nil then
		var5377.key = self.key
	end
	if self.value ~= nil then
		var5377.value = propTypesEngineModule.KeyCodeProp.jsonDecode(self.value)
	end
	return var5377
end

t_152.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_KeysEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.KeysEntry"
}
t.FocusNavActionsProp_FocusNavData_KeysEntry = t_152
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_KeysEntry)
local t_153 = {}
t_153.__index = t_153

function t_153.new(p301) --[[ line: 29369 ]]
	-- upvalues: t_153 (ref)
	return setmetatable({
		key = if p301 == nil or p301.key == nil then "" else p301.key,
		value = if p301 == nil or p301.value == nil then nil else p301.value
	}, t_153)
end

function t_153:encode() --[[ line: 29378 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5379 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var5380, var5381 = protoModule.writeTag(buff, var5379, 1, protoModule.wireTypes.lengthDelimited)
		var5380, var5381 = protoModule.writeString(var5380, var5381, self.key)
		buff = var5380
		var5379 = var5381
	end
	if self.value ~= nil then
		local var5382 = self.value:encode()
		local var5383, var5384 = protoModule.writeTag(buff, var5379, 2, protoModule.wireTypes.lengthDelimited)
		var5383, var5384 = protoModule.writeBuffer(var5383, var5384, var5382, buffer.len(var5382))
		buff = var5383
		var5379 = var5384
	end
	local buff_1 = buffer.create(var5379)
	buffer.copy(buff_1, 0, buff, 0, var5379)
	
	return buff_1
end

function t_153.decode(p302) --[[ line: 29400 ]]
	-- upvalues: t_153 (ref), protoModule (ref), t (ref)
	local var5386 = t_153.new()
	local var5387 = 0
	while var5387 < buffer.len(p302) do
		local _ = nil
		local var5388 = nil
		local var5389, var5390, var5391 = protoModule.readTag(p302, var5387)
		local var5392 = var5389
		var5388 = var5390
		var5387 = var5391
		
		if var5388 == protoModule.wireTypes.varint then
			local _ = nil
			local var5393, var5394 = protoModule.readVarInt(p302, var5387)
			local _ = var5393
			var5387 = var5394
			continue
		end
		if var5388 == protoModule.wireTypes.lengthDelimited then
			if var5392 == 1 then
				local _ = nil
				local var5395, var5396 = protoModule.readBuffer(p302, var5387)
				var5387 = var5396
				var5386.key = buffer.tostring(var5395)
			elseif var5392 == 2 then
				local _ = nil
				local var5397, var5398 = protoModule.readBuffer(p302, var5387)
				var5387 = var5398
				var5386.value = t.ActionProp.decode(var5397)
			else
				local _ = nil
				local var5399, var5400 = protoModule.readVarInt(p302, var5387)
				var5387 = var5400 + var5399
			end
		elseif var5388 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5401, var5402 = protoModule.readFixed32(p302, var5387)
			local _ = var5401
			var5387 = var5402
		elseif var5388 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5403, var5404 = protoModule.readFixed64(p302, var5387)
			local _ = var5403
			var5387 = var5404
		else
			error("Unsupported wire type: " .. var5388)
		end
	end
	return var5386
end

function t_153:jsonEncode() --[[ line: 29450 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_153:jsonDecode() --[[ line: 29466 ]]
	-- upvalues: t_153 (ref), t (ref)
	local var5406 = t_153.new()
	
	if self.key ~= nil then
		var5406.key = self.key
	end
	if self.value ~= nil then
		var5406.value = t.ActionProp.jsonDecode(self.value)
	end
	return var5406
end

t_153.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_EventsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsEntry"
}
t.FocusNavActionsProp_FocusNavData_EventsEntry = t_153
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_EventsEntry)
t.ActionType = {
	fromNumber = function(p303) --[[ line: 29493 ]]
		return if p303 == 0 then "ACTION_TYPE_INVALID" elseif p303 == 1 then "ACTION_TYPE_DISMISS_DIALOG" elseif p303 == 2 then "ACTION_TYPE_LINK" elseif p303 == 3 then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p303 == 4 then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p303 == 5 then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p303 == 6 then "ACTION_TYPE_OPEN_SEE_ALL" elseif p303 == 7 then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p303 == 8 then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p303 == 9 then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p303 == 10 then "ACTION_TYPE_OPEN_TOOLTIP" elseif p303 == 11 then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p303 == 12 then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p303 == 13 then "ACTION_TYPE_SHARE" elseif p303 == 14 then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p303 == 15 then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p303 == 16 then "ACTION_TYPE_OPEN_PROFILE" elseif p303 == 17 then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p303 == 18 then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p303 == 19 then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p303 == 20 then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p303 == 21 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p303 == 22 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p303 == 23 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p303 == 24 then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p303 == 25 then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p303 == 26 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p303 == 27 then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p303 == 28 then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p303 == 29 then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p303 == 30 then "ACTION_TYPE_REFRESH_FROM_API" elseif p303 == 31 then "ACTION_TYPE_RSVP_TO_EVENT" elseif p303 == 32 then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p303 == 33 then "ACTION_TYPE_ANALYTICS_EVENT" elseif p303 == 34 then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p303 == 35 then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p303 == 36 then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p303 == 37 then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p303 == 38 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p303 == 39 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p303 == 40 then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p303 == 41 then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p303 == 42 then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p303 == 43 then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p303 == 44 then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p303 == 45 then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p303 == 46 then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p303 == 47 then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p303 == 48 then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p303 == 49 then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p303 == 50 then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p303 == 51 then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p303 == 52 then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p303 == 53 then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p303 == 54 then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p303 == 55 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p303 == 56 then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p303 == 57 then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p303 == 58 then "ACTION_TYPE_DISMISS_PROMPT" elseif p303 == 59 then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p303 == 60 then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p303 == 61 then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p303 == 62 then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p303 == 63 then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p303 == 64 then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p303 == 65 then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p303 == 66 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" else nil
	end,
	toNumber = function(p304) --[[ line: 29633 ]]
		return if p304 == "ACTION_TYPE_INVALID" then 0 elseif p304 == "ACTION_TYPE_DISMISS_DIALOG" then 1 elseif p304 == "ACTION_TYPE_LINK" then 2 elseif p304 == "ACTION_TYPE_OPEN_GAME_DETAILS" then 3 elseif p304 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then 4 elseif p304 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then 5 elseif p304 == "ACTION_TYPE_OPEN_SEE_ALL" then 6 elseif p304 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then 7 elseif p304 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then 8 elseif p304 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then 9 elseif p304 == "ACTION_TYPE_OPEN_TOOLTIP" then 10 elseif p304 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then 11 elseif p304 == "ACTION_TYPE_LOAD_MORE_FROM_API" then 12 elseif p304 == "ACTION_TYPE_SHARE" then 13 elseif p304 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then 14 elseif p304 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then 15 elseif p304 == "ACTION_TYPE_OPEN_PROFILE" then 16 elseif p304 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then 17 elseif p304 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then 18 elseif p304 == "ACTION_TYPE_OPEN_MARKETPLACE" then 19 elseif p304 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then 20 elseif p304 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then 21 elseif p304 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then 22 elseif p304 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then 23 elseif p304 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then 24 elseif p304 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then 25 elseif p304 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then 26 elseif p304 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then 27 elseif p304 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then 28 elseif p304 == "ACTION_TYPE_OPEN_SONG_DETAIL" then 29 elseif p304 == "ACTION_TYPE_REFRESH_FROM_API" then 30 elseif p304 == "ACTION_TYPE_RSVP_TO_EVENT" then 31 elseif p304 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then 32 elseif p304 == "ACTION_TYPE_ANALYTICS_EVENT" then 33 elseif p304 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then 34 elseif p304 == "ACTION_TYPE_OPEN_GAME_INVITE" then 35 elseif p304 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then 36 elseif p304 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then 37 elseif p304 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then 38 elseif p304 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then 39 elseif p304 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then 40 elseif p304 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then 41 elseif p304 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then 42 elseif p304 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then 43 elseif p304 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then 44 elseif p304 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then 45 elseif p304 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then 46 elseif p304 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then 47 elseif p304 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then 48 elseif p304 == "ACTION_TYPE_OPEN_AMP_WIZARD" then 49 elseif p304 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then 50 elseif p304 == "ACTION_TYPE_REFRESH_GAME_PASSES" then 51 elseif p304 == "ACTION_TYPE_REFRESH_PLAYABILITY" then 52 elseif p304 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then 53 elseif p304 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then 54 elseif p304 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then 55 elseif p304 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then 56 elseif p304 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then 57 elseif p304 == "ACTION_TYPE_DISMISS_PROMPT" then 58 elseif p304 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then 59 elseif p304 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then 60 elseif p304 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then 61 elseif p304 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then 62 elseif p304 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then 63 elseif p304 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then 64 elseif p304 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then 65 elseif p304 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then 66 else p304
	end,
	fromName = function(p305) --[[ line: 29773 ]]
		return if p305 == "ACTION_TYPE_INVALID" then "ACTION_TYPE_INVALID" elseif p305 == "ACTION_TYPE_DISMISS_DIALOG" then "ACTION_TYPE_DISMISS_DIALOG" elseif p305 == "ACTION_TYPE_LINK" then "ACTION_TYPE_LINK" elseif p305 == "ACTION_TYPE_OPEN_GAME_DETAILS" then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p305 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p305 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p305 == "ACTION_TYPE_OPEN_SEE_ALL" then "ACTION_TYPE_OPEN_SEE_ALL" elseif p305 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p305 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p305 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p305 == "ACTION_TYPE_OPEN_TOOLTIP" then "ACTION_TYPE_OPEN_TOOLTIP" elseif p305 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p305 == "ACTION_TYPE_LOAD_MORE_FROM_API" then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p305 == "ACTION_TYPE_SHARE" then "ACTION_TYPE_SHARE" elseif p305 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p305 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p305 == "ACTION_TYPE_OPEN_PROFILE" then "ACTION_TYPE_OPEN_PROFILE" elseif p305 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p305 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p305 == "ACTION_TYPE_OPEN_MARKETPLACE" then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p305 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p305 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p305 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p305 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p305 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p305 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p305 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p305 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p305 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p305 == "ACTION_TYPE_OPEN_SONG_DETAIL" then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p305 == "ACTION_TYPE_REFRESH_FROM_API" then "ACTION_TYPE_REFRESH_FROM_API" elseif p305 == "ACTION_TYPE_RSVP_TO_EVENT" then "ACTION_TYPE_RSVP_TO_EVENT" elseif p305 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p305 == "ACTION_TYPE_ANALYTICS_EVENT" then "ACTION_TYPE_ANALYTICS_EVENT" elseif p305 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p305 == "ACTION_TYPE_OPEN_GAME_INVITE" then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p305 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p305 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p305 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p305 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p305 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p305 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p305 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p305 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p305 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p305 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p305 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p305 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p305 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p305 == "ACTION_TYPE_OPEN_AMP_WIZARD" then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p305 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p305 == "ACTION_TYPE_REFRESH_GAME_PASSES" then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p305 == "ACTION_TYPE_REFRESH_PLAYABILITY" then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p305 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p305 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p305 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p305 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p305 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p305 == "ACTION_TYPE_DISMISS_PROMPT" then "ACTION_TYPE_DISMISS_PROMPT" elseif p305 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p305 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p305 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p305 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p305 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p305 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p305 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p305 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" else nil
	end
}

return {
	DismissDialogAction = t.DismissDialogAction,
	DismissDialogAction_Params = t.DismissDialogAction_Params,
	LinkAction = t.LinkAction,
	LinkAction_Params = t.LinkAction_Params,
	OpenSocialLinkAction = t.OpenSocialLinkAction,
	OpenSocialLinkAction_Params = t.OpenSocialLinkAction_Params,
	OpenGameDetailsAction = t.OpenGameDetailsAction,
	OpenGameDetailsAction_Params = t.OpenGameDetailsAction_Params,
	OpenJoinFriendsAction = t.OpenJoinFriendsAction,
	OpenJoinFriendsAction_Params = t.OpenJoinFriendsAction_Params,
	OpenMarketplaceTryOnAction = t.OpenMarketplaceTryOnAction,
	OpenMarketplaceTryOnAction_Params = t.OpenMarketplaceTryOnAction_Params,
	OpenSeeAllAction = t.OpenSeeAllAction,
	OpenSeeAllAction_Params = t.OpenSeeAllAction_Params,
	OpenSponsoredTooltipAction = t.OpenSponsoredTooltipAction,
	OpenSponsoredTooltipAction_Params = t.OpenSponsoredTooltipAction_Params,
	PlayButtonClickAction = t.PlayButtonClickAction,
	PlayButtonClickAction_Params = t.PlayButtonClickAction_Params,
	UpdateUserSettingsAction = t.UpdateUserSettingsAction,
	UpdateUserSettingsAction_Params = t.UpdateUserSettingsAction_Params,
	OpenTooltipAction = t.OpenTooltipAction,
	OpenTooltipAction_Params = t.OpenTooltipAction_Params,
	OpenBadgeDetailsAction = t.OpenBadgeDetailsAction,
	OpenBadgeDetailsAction_Params = t.OpenBadgeDetailsAction_Params,
	LoadMoreFromApiAction = t.LoadMoreFromApiAction,
	LoadMoreFromApiAction_Params = t.LoadMoreFromApiAction_Params,
	ShareAction = t.ShareAction,
	ShareAction_ShareLinkData = t.ShareAction_ShareLinkData,
	ShareAction_Params = t.ShareAction_Params,
	OpenAbuseReportAction = t.OpenAbuseReportAction,
	OpenAbuseReportAction_Params = t.OpenAbuseReportAction_Params,
	RemoveBadgeFromInventoryAction = t.RemoveBadgeFromInventoryAction,
	RemoveBadgeFromInventoryAction_Params = t.RemoveBadgeFromInventoryAction_Params,
	OpenProfileAction = t.OpenProfileAction,
	OpenProfileAction_Params = t.OpenProfileAction_Params,
	OpenFacialAgeEstimationAction = t.OpenFacialAgeEstimationAction,
	OpenFacialAgeEstimationAction_Params = t.OpenFacialAgeEstimationAction_Params,
	OpenPhoneUpsellModalAction = t.OpenPhoneUpsellModalAction,
	OpenPhoneUpsellModalAction_Params = t.OpenPhoneUpsellModalAction_Params,
	OpenEmailUpsellModalAction = t.OpenEmailUpsellModalAction,
	OpenEmailUpsellModalAction_Params = t.OpenEmailUpsellModalAction_Params,
	OpenAddConnectionsPageAction = t.OpenAddConnectionsPageAction,
	OpenAddConnectionsPageAction_Params = t.OpenAddConnectionsPageAction_Params,
	OpenMarketplaceAction = t.OpenMarketplaceAction,
	OpenMarketplaceAction_Params = t.OpenMarketplaceAction_Params,
	HideProfileCompletionAction = t.HideProfileCompletionAction,
	HideProfileCompletionAction_Params = t.HideProfileCompletionAction_Params,
	SelectMarketplaceCatalogCategory = t.SelectMarketplaceCatalogCategory,
	SelectMarketplaceCatalogCategory_Params = t.SelectMarketplaceCatalogCategory_Params,
	SelectMarketplaceCatalogSubcategory = t.SelectMarketplaceCatalogSubcategory,
	SelectMarketplaceCatalogSubcategory_Params = t.SelectMarketplaceCatalogSubcategory_Params,
	OpenMarketplaceCatalogSeeAll = t.OpenMarketplaceCatalogSeeAll,
	OpenMarketplaceCatalogSeeAll_Params = t.OpenMarketplaceCatalogSeeAll_Params,
	CloseMarketplaceCategoryTooltip = t.CloseMarketplaceCategoryTooltip,
	CloseMarketplaceCategoryTooltip_Params = t.CloseMarketplaceCategoryTooltip_Params,
	ResizeMarketplaceCatalog = t.ResizeMarketplaceCatalog,
	ResizeMarketplaceCatalog_Params = t.ResizeMarketplaceCatalog_Params,
	OpenChartsSortDetailAction = t.OpenChartsSortDetailAction,
	OpenChartsSortDetailAction_Params = t.OpenChartsSortDetailAction_Params,
	OpenSongDetailAction = t.OpenSongDetailAction,
	OpenSongDetailAction_Params = t.OpenSongDetailAction_Params,
	OpenMarketplaceCatalogFilters = t.OpenMarketplaceCatalogFilters,
	OpenMarketplaceCatalogFilters_Params = t.OpenMarketplaceCatalogFilters_Params,
	RefreshFromApiAction = t.RefreshFromApiAction,
	RefreshFromApiAction_Params = t.RefreshFromApiAction_Params,
	RefreshOmniRecommendationFeedItemAction = t.RefreshOmniRecommendationFeedItemAction,
	RefreshOmniRecommendationFeedItemAction_Params = t.RefreshOmniRecommendationFeedItemAction_Params,
	RsvpToEventAction = t.RsvpToEventAction,
	RsvpToEventAction_Params = t.RsvpToEventAction_Params,
	OpenEventDetailsAction = t.OpenEventDetailsAction,
	OpenEventDetailsAction_Params = t.OpenEventDetailsAction_Params,
	OpenBadgesSeeAllAction = t.OpenBadgesSeeAllAction,
	OpenBadgesSeeAllAction_Params = t.OpenBadgesSeeAllAction_Params,
	OpenExperienceStoreSeeAllAction = t.OpenExperienceStoreSeeAllAction,
	OpenExperienceStoreSeeAllAction_Params = t.OpenExperienceStoreSeeAllAction_Params,
	OpenSubscriptionPurchasePageAction = t.OpenSubscriptionPurchasePageAction,
	OpenSubscriptionPurchasePageAction_Params = t.OpenSubscriptionPurchasePageAction_Params,
	RefreshGamePassesAction = t.RefreshGamePassesAction,
	RefreshGamePassesAction_Params = t.RefreshGamePassesAction_Params,
	RefreshPlayabilityAction = t.RefreshPlayabilityAction,
	RefreshPlayabilityAction_Params = t.RefreshPlayabilityAction_Params,
	RefreshDeveloperProductsAction = t.RefreshDeveloperProductsAction,
	RefreshDeveloperProductsAction_Params = t.RefreshDeveloperProductsAction_Params,
	OpenFaeTrialUpsellAction = t.OpenFaeTrialUpsellAction,
	OpenFaeTrialUpsellAction_Params = t.OpenFaeTrialUpsellAction_Params,
	OpenSduiOverlayAction = t.OpenSduiOverlayAction,
	OpenSduiOverlayAction_Params = t.OpenSduiOverlayAction_Params,
	ApplyChartsFilterAction = t.ApplyChartsFilterAction,
	ApplyChartsFilterAction_Params = t.ApplyChartsFilterAction_Params,
	AnalyticsEventAction = t.AnalyticsEventAction,
	AnalyticsEventAction_Params = t.AnalyticsEventAction_Params,
	CustomAnalyticsEventAction = t.CustomAnalyticsEventAction,
	CustomAnalyticsEventAction_Params = t.CustomAnalyticsEventAction_Params,
	OpenGameInviteAction = t.OpenGameInviteAction,
	OpenGameInviteAction_Params = t.OpenGameInviteAction_Params,
	LaunchExperienceAction = t.LaunchExperienceAction,
	LaunchExperienceAction_ExperienceJoinData = t.LaunchExperienceAction_ExperienceJoinData,
	LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral,
	LaunchExperienceAction_Params = t.LaunchExperienceAction_Params,
	ToggleExperienceFavoriteAction = t.ToggleExperienceFavoriteAction,
	ToggleExperienceFavoriteAction_Params = t.ToggleExperienceFavoriteAction_Params,
	ToggleExperienceFollowAction = t.ToggleExperienceFollowAction,
	ToggleExperienceFollowAction_Params = t.ToggleExperienceFollowAction_Params,
	ToggleExperienceVoteAction = t.ToggleExperienceVoteAction,
	ToggleExperienceVoteAction_Params = t.ToggleExperienceVoteAction_Params,
	OpenPurchasePromptAction = t.OpenPurchasePromptAction,
	OpenPurchasePromptAction_ProductPayload = t.OpenPurchasePromptAction_ProductPayload,
	OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral,
	OpenPurchasePromptAction_DisplayInfo = t.OpenPurchasePromptAction_DisplayInfo,
	OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral,
	OpenPurchasePromptAction_PurchaseOptions = t.OpenPurchasePromptAction_PurchaseOptions,
	OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral,
	OpenPurchasePromptAction_PurchaseAnalyticsMetadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata,
	OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral,
	OpenPurchasePromptAction_Params = t.OpenPurchasePromptAction_Params,
	ReportSurfaceLoadTimeMilestoneAction = t.ReportSurfaceLoadTimeMilestoneAction,
	ReportSurfaceLoadTimeMilestoneAction_Params = t.ReportSurfaceLoadTimeMilestoneAction_Params,
	DismissGameFeedbackAction = t.DismissGameFeedbackAction,
	DismissGameFeedbackAction_Params = t.DismissGameFeedbackAction_Params,
	OpenGameFeedbackFormAction = t.OpenGameFeedbackFormAction,
	OpenGameFeedbackFormAction_Params = t.OpenGameFeedbackFormAction_Params,
	AiOverviewFeedbackAction = t.AiOverviewFeedbackAction,
	AiOverviewFeedbackAction_Params = t.AiOverviewFeedbackAction_Params,
	EnableEventNotificationsAction = t.EnableEventNotificationsAction,
	EnableEventNotificationsAction_Params = t.EnableEventNotificationsAction_Params,
	DismissEventNotificationsModalAction = t.DismissEventNotificationsModalAction,
	DismissEventNotificationsModalAction_Params = t.DismissEventNotificationsModalAction_Params,
	OpenAmpWizardAction = t.OpenAmpWizardAction,
	OpenAmpWizardAction_Params = t.OpenAmpWizardAction_Params,
	OpenSocialProofUserListSheetAction = t.OpenSocialProofUserListSheetAction,
	OpenSocialProofUserListSheetAction_Params = t.OpenSocialProofUserListSheetAction_Params,
	OpenSearchResultsTabAction = t.OpenSearchResultsTabAction,
	OpenSearchResultsTabAction_Params = t.OpenSearchResultsTabAction_Params,
	DismissPromptAction = t.DismissPromptAction,
	DismissPromptAction_Params = t.DismissPromptAction_Params,
	RecordPartyChatConversationUpsellAcknowledgementAction = t.RecordPartyChatConversationUpsellAcknowledgementAction,
	RecordPartyChatConversationUpsellAcknowledgementAction_Params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params,
	RequestFriendshipAction = t.RequestFriendshipAction,
	RequestFriendshipAction_Params = t.RequestFriendshipAction_Params,
	OpenTrustedFriendsUpsellModalAction = t.OpenTrustedFriendsUpsellModalAction,
	OpenTrustedFriendsUpsellModalAction_Params = t.OpenTrustedFriendsUpsellModalAction_Params,
	OpenSearchResultsWithQueryAction = t.OpenSearchResultsWithQueryAction,
	OpenSearchResultsWithQueryAction_Params = t.OpenSearchResultsWithQueryAction_Params,
	Action = t.Action,
	ActionProp = t.ActionProp,
	ActionProp_ConditionalOption = t.ActionProp_ConditionalOption,
	ActionProp_ConditionalOptions = t.ActionProp_ConditionalOptions,
	FocusNavActionsProp = t.FocusNavActionsProp,
	FocusNavActionsProp_ConditionalOption = t.FocusNavActionsProp_ConditionalOption,
	FocusNavActionsProp_ConditionalOptions = t.FocusNavActionsProp_ConditionalOptions,
	FocusNavActionsProp_FocusNavData = t.FocusNavActionsProp_FocusNavData,
	ActionType = t.ActionType
}