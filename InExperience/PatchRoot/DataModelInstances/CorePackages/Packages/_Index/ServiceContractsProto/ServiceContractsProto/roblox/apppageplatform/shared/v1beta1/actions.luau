local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local propConditionModule = require(script.Parent.prop_condition)
local propTypesModule = require(script.Parent.prop_types)
local propTypesEngineModule = require(script.Parent.prop_types_engine)
local shareLinkDataModule = require(script.Parent.share_link_data)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 5471 ]]
	-- upvalues: t (ref), t_1 (ref)
	return setmetatable({
		action_type = if p0 == nil or p0.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p0.action_type,
		action_params = if p0 == nil or p0.action_params == nil then nil else p0.action_params
	}, t_1)
end

function t_1:encode() --[[ line: 5480 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var181 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var182, var183 = protoModule.writeTag(buff, var181, 1, protoModule.wireTypes.varint)
		var182, var183 = protoModule.writeVarInt(var182, var183, t.ActionType.toNumber(self.action_type))
		buff = var182
		var181 = var183
	end
	if self.action_params ~= nil then
		local var184 = self.action_params:encode()
		local var185, var186 = protoModule.writeTag(buff, var181, 2, protoModule.wireTypes.lengthDelimited)
		var185, var186 = protoModule.writeBuffer(var185, var186, var184, buffer.len(var184))
		buff = var185
		var181 = var186
	end
	local buff_1 = buffer.create(var181)
	buffer.copy(buff_1, 0, buff, 0, var181)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 5506 ]]
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var188 = t_1.new()
	local var189 = 0
	while var189 < buffer.len(p1) do
		local _ = nil
		local var190 = nil
		local var191, var192, var193 = protoModule.readTag(p1, var189)
		local var194 = var191
		var190 = var192
		var189 = var193
		
		if var190 == protoModule.wireTypes.varint then
			if var194 == 1 then
				local _ = nil
				local var195, var196 = protoModule.readVarIntI32(p1, var189)
				local var197 = var195
				var189 = var196
				var188.action_type = t.ActionType.fromNumber(var197) or var197
			else
				local _ = nil
				local var198, var199 = protoModule.readVarInt(p1, var189)
				local _ = var198
				var189 = var199
			end
		end
		if var190 == protoModule.wireTypes.lengthDelimited then
			if var194 == 2 then
				local _ = nil
				local var200, var201 = protoModule.readBuffer(p1, var189)
				var189 = var201
				var188.action_params = t.DismissDialogAction_Params.decode(var200)
			else
				local _ = nil
				local var202, var203 = protoModule.readVarInt(p1, var189)
				var189 = var203 + var202
			end
		elseif var190 == protoModule.wireTypes.i32 then
			local _ = nil
			local var204, var205 = protoModule.readFixed32(p1, var189)
			local _ = var204
			var189 = var205
		elseif var190 == protoModule.wireTypes.i64 then
			local _ = nil
			local var206, var207 = protoModule.readFixed64(p1, var189)
			local _ = var206
			var189 = var207
		else
			error("Unsupported wire type: " .. var190)
		end
	end
	return var188
end

function t_1:jsonEncode() --[[ line: 5554 ]]
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

function t_1:jsonDecode() --[[ line: 5576 ]]
	-- upvalues: t_1 (ref), t (ref)
	local var209 = t_1.new()
	
	if self.action_type ~= nil then
		var209.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var209.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var209.action_params = t.DismissDialogAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var209.action_params = t.DismissDialogAction_Params.jsonDecode(self.actionParams)
	end
	return var209
end

t_1.descriptor = {
	name = "DismissDialogAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissDialogAction"
}
t.DismissDialogAction = t_1
typeRegistryModule.default:register(t.DismissDialogAction)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 5616 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		dialog_type = if p2 == nil or p2.dialog_type == nil then nil else p2.dialog_type
	}, t_2)
end

function t_2:encode() --[[ line: 5624 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var211 = 0
	
	if self.dialog_type ~= nil then
		local var212 = self.dialog_type:encode()
		local var213, var214 = protoModule.writeTag(buff, var211, 1, protoModule.wireTypes.lengthDelimited)
		var213, var214 = protoModule.writeBuffer(var213, var214, var212, buffer.len(var212))
		buff = var213
		var211 = var214
	end
	local buff_1 = buffer.create(var211)
	buffer.copy(buff_1, 0, buff, 0, var211)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 5639 ]]
	-- upvalues: t_2 (ref), protoModule (ref), propTypesModule (ref)
	local var216 = t_2.new()
	local var217 = 0
	while var217 < buffer.len(p3) do
		local _ = nil
		local var218 = nil
		local var219, var220, var221 = protoModule.readTag(p3, var217)
		local var222 = var219
		var218 = var220
		var217 = var221
		
		if var218 == protoModule.wireTypes.varint then
			local _ = nil
			local var223, var224 = protoModule.readVarInt(p3, var217)
			local _ = var223
			var217 = var224
			continue
		end
		if var218 == protoModule.wireTypes.lengthDelimited then
			if var222 == 1 then
				local _ = nil
				local var225, var226 = protoModule.readBuffer(p3, var217)
				var217 = var226
				var216.dialog_type = propTypesModule.StringProp.decode(var225)
			else
				local _ = nil
				local var227, var228 = protoModule.readVarInt(p3, var217)
				var217 = var228 + var227
			end
		elseif var218 == protoModule.wireTypes.i32 then
			local _ = nil
			local var229, var230 = protoModule.readFixed32(p3, var217)
			local _ = var229
			var217 = var230
		elseif var218 == protoModule.wireTypes.i64 then
			local _ = nil
			local var231, var232 = protoModule.readFixed64(p3, var217)
			local _ = var231
			var217 = var232
		else
			error("Unsupported wire type: " .. var218)
		end
	end
	return var216
end

function t_2:jsonEncode() --[[ line: 5682 ]]
	local t = {}
	
	if self.dialog_type ~= nil then
		t.dialogType = self.dialog_type:jsonEncode()
	end
	return t
end

function t_2:jsonDecode() --[[ line: 5692 ]]
	-- upvalues: t_2 (ref), propTypesModule (ref)
	local var234 = t_2.new()
	
	if self.dialog_type ~= nil then
		var234.dialog_type = propTypesModule.StringProp.jsonDecode(self.dialog_type)
	end
	if self.dialogType ~= nil then
		var234.dialog_type = propTypesModule.StringProp.jsonDecode(self.dialogType)
	end
	return var234
end

t_2.descriptor = {
	name = "DismissDialogAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissDialogAction_Params = t_2
typeRegistryModule.default:register(t.DismissDialogAction_Params)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 5721 ]]
	-- upvalues: t (ref), t_3 (ref)
	return setmetatable({
		action_type = if p4 == nil or p4.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p4.action_type,
		action_params = if p4 == nil or p4.action_params == nil then nil else p4.action_params
	}, t_3)
end

function t_3:encode() --[[ line: 5730 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var236 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var237, var238 = protoModule.writeTag(buff, var236, 1, protoModule.wireTypes.varint)
		var237, var238 = protoModule.writeVarInt(var237, var238, t.ActionType.toNumber(self.action_type))
		buff = var237
		var236 = var238
	end
	if self.action_params ~= nil then
		local var239 = self.action_params:encode()
		local var240, var241 = protoModule.writeTag(buff, var236, 2, protoModule.wireTypes.lengthDelimited)
		var240, var241 = protoModule.writeBuffer(var240, var241, var239, buffer.len(var239))
		buff = var240
		var236 = var241
	end
	local buff_1 = buffer.create(var236)
	buffer.copy(buff_1, 0, buff, 0, var236)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 5756 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var243 = t_3.new()
	local var244 = 0
	while var244 < buffer.len(p5) do
		local _ = nil
		local var245 = nil
		local var246, var247, var248 = protoModule.readTag(p5, var244)
		local var249 = var246
		var245 = var247
		var244 = var248
		
		if var245 == protoModule.wireTypes.varint then
			if var249 == 1 then
				local _ = nil
				local var250, var251 = protoModule.readVarIntI32(p5, var244)
				local var252 = var250
				var244 = var251
				var243.action_type = t.ActionType.fromNumber(var252) or var252
			else
				local _ = nil
				local var253, var254 = protoModule.readVarInt(p5, var244)
				local _ = var253
				var244 = var254
			end
		end
		if var245 == protoModule.wireTypes.lengthDelimited then
			if var249 == 2 then
				local _ = nil
				local var255, var256 = protoModule.readBuffer(p5, var244)
				var244 = var256
				var243.action_params = t.LinkAction_Params.decode(var255)
			else
				local _ = nil
				local var257, var258 = protoModule.readVarInt(p5, var244)
				var244 = var258 + var257
			end
		elseif var245 == protoModule.wireTypes.i32 then
			local _ = nil
			local var259, var260 = protoModule.readFixed32(p5, var244)
			local _ = var259
			var244 = var260
		elseif var245 == protoModule.wireTypes.i64 then
			local _ = nil
			local var261, var262 = protoModule.readFixed64(p5, var244)
			local _ = var261
			var244 = var262
		else
			error("Unsupported wire type: " .. var245)
		end
	end
	return var243
end

function t_3:jsonEncode() --[[ line: 5804 ]]
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

function t_3:jsonDecode() --[[ line: 5826 ]]
	-- upvalues: t_3 (ref), t (ref)
	local var264 = t_3.new()
	
	if self.action_type ~= nil then
		var264.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var264.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var264.action_params = t.LinkAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var264.action_params = t.LinkAction_Params.jsonDecode(self.actionParams)
	end
	return var264
end

t_3.descriptor = {
	name = "LinkAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LinkAction"
}
t.LinkAction = t_3
typeRegistryModule.default:register(t.LinkAction)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 5866 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		url = if p6 == nil or p6.url == nil then nil else p6.url,
		title_key = if p6 == nil or p6.title_key == nil then nil else p6.title_key,
		on_webview_close = if p6 == nil or p6.on_webview_close == nil then nil else p6.on_webview_close
	}, t_4)
end

function t_4:encode() --[[ line: 5874 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var266 = 0
	
	if self.url ~= nil then
		local var267 = self.url:encode()
		local var268, var269 = protoModule.writeTag(buff, var266, 1, protoModule.wireTypes.lengthDelimited)
		var268, var269 = protoModule.writeBuffer(var268, var269, var267, buffer.len(var267))
		buff = var268
		var266 = var269
	end
	if self.title_key ~= nil then
		local var270 = self.title_key:encode()
		local var271, var272 = protoModule.writeTag(buff, var266, 2, protoModule.wireTypes.lengthDelimited)
		var271, var272 = protoModule.writeBuffer(var271, var272, var270, buffer.len(var270))
		buff = var271
		var266 = var272
	end
	if self.on_webview_close ~= nil then
		local var273 = self.on_webview_close:encode()
		local var274, var275 = protoModule.writeTag(buff, var266, 4, protoModule.wireTypes.lengthDelimited)
		var274, var275 = protoModule.writeBuffer(var274, var275, var273, buffer.len(var273))
		buff = var274
		var266 = var275
	end
	local buff_1 = buffer.create(var266)
	buffer.copy(buff_1, 0, buff, 0, var266)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 5901 ]]
	-- upvalues: t_4 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var277 = t_4.new()
	local var278 = 0
	while var278 < buffer.len(p7) do
		local _ = nil
		local var279 = nil
		local var280, var281, var282 = protoModule.readTag(p7, var278)
		local var283 = var280
		var279 = var281
		var278 = var282
		
		if var279 == protoModule.wireTypes.varint then
			local _ = nil
			local var284, var285 = protoModule.readVarInt(p7, var278)
			local _ = var284
			var278 = var285
			continue
		end
		if var279 == protoModule.wireTypes.lengthDelimited then
			if var283 == 1 then
				local _ = nil
				local var286, var287 = protoModule.readBuffer(p7, var278)
				var278 = var287
				var277.url = propTypesModule.StringProp.decode(var286)
			elseif var283 == 2 then
				local _ = nil
				local var288, var289 = protoModule.readBuffer(p7, var278)
				var278 = var289
				var277.title_key = propTypesModule.StringProp.decode(var288)
			elseif var283 == 4 then
				local _ = nil
				local var290, var291 = protoModule.readBuffer(p7, var278)
				var278 = var291
				var277.on_webview_close = t.ActionProp.decode(var290)
			else
				local _ = nil
				local var292, var293 = protoModule.readVarInt(p7, var278)
				var278 = var293 + var292
			end
		elseif var279 == protoModule.wireTypes.i32 then
			local _ = nil
			local var294, var295 = protoModule.readFixed32(p7, var278)
			local _ = var294
			var278 = var295
		elseif var279 == protoModule.wireTypes.i64 then
			local _ = nil
			local var296, var297 = protoModule.readFixed64(p7, var278)
			local _ = var296
			var278 = var297
		else
			error("Unsupported wire type: " .. var279)
		end
	end
	return var277
end

function t_4:jsonEncode() --[[ line: 5954 ]]
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

function t_4:jsonDecode() --[[ line: 5972 ]]
	-- upvalues: t_4 (ref), propTypesModule (ref), t (ref)
	local var299 = t_4.new()
	
	if self.url ~= nil then
		var299.url = propTypesModule.StringProp.jsonDecode(self.url)
	end
	if self.title_key ~= nil then
		var299.title_key = propTypesModule.StringProp.jsonDecode(self.title_key)
	end
	if self.titleKey ~= nil then
		var299.title_key = propTypesModule.StringProp.jsonDecode(self.titleKey)
	end
	if self.on_webview_close ~= nil then
		var299.on_webview_close = t.ActionProp.jsonDecode(self.on_webview_close)
	end
	if self.onWebviewClose ~= nil then
		var299.on_webview_close = t.ActionProp.jsonDecode(self.onWebviewClose)
	end
	return var299
end

t_4.descriptor = {
	name = "LinkAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LinkAction_Params = t_4
typeRegistryModule.default:register(t.LinkAction_Params)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 6012 ]]
	-- upvalues: t (ref), t_5 (ref)
	return setmetatable({
		action_type = if p8 == nil or p8.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p8.action_type,
		action_params = if p8 == nil or p8.action_params == nil then nil else p8.action_params
	}, t_5)
end

function t_5:encode() --[[ line: 6021 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var301 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var302, var303 = protoModule.writeTag(buff, var301, 1, protoModule.wireTypes.varint)
		var302, var303 = protoModule.writeVarInt(var302, var303, t.ActionType.toNumber(self.action_type))
		buff = var302
		var301 = var303
	end
	if self.action_params ~= nil then
		local var304 = self.action_params:encode()
		local var305, var306 = protoModule.writeTag(buff, var301, 2, protoModule.wireTypes.lengthDelimited)
		var305, var306 = protoModule.writeBuffer(var305, var306, var304, buffer.len(var304))
		buff = var305
		var301 = var306
	end
	local buff_1 = buffer.create(var301)
	buffer.copy(buff_1, 0, buff, 0, var301)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 6047 ]]
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var308 = t_5.new()
	local var309 = 0
	while var309 < buffer.len(p9) do
		local _ = nil
		local var310 = nil
		local var311, var312, var313 = protoModule.readTag(p9, var309)
		local var314 = var311
		var310 = var312
		var309 = var313
		
		if var310 == protoModule.wireTypes.varint then
			if var314 == 1 then
				local _ = nil
				local var315, var316 = protoModule.readVarIntI32(p9, var309)
				local var317 = var315
				var309 = var316
				var308.action_type = t.ActionType.fromNumber(var317) or var317
			else
				local _ = nil
				local var318, var319 = protoModule.readVarInt(p9, var309)
				local _ = var318
				var309 = var319
			end
		end
		if var310 == protoModule.wireTypes.lengthDelimited then
			if var314 == 2 then
				local _ = nil
				local var320, var321 = protoModule.readBuffer(p9, var309)
				var309 = var321
				var308.action_params = t.OpenSocialLinkAction_Params.decode(var320)
			else
				local _ = nil
				local var322, var323 = protoModule.readVarInt(p9, var309)
				var309 = var323 + var322
			end
		elseif var310 == protoModule.wireTypes.i32 then
			local _ = nil
			local var324, var325 = protoModule.readFixed32(p9, var309)
			local _ = var324
			var309 = var325
		elseif var310 == protoModule.wireTypes.i64 then
			local _ = nil
			local var326, var327 = protoModule.readFixed64(p9, var309)
			local _ = var326
			var309 = var327
		else
			error("Unsupported wire type: " .. var310)
		end
	end
	return var308
end

function t_5:jsonEncode() --[[ line: 6095 ]]
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

function t_5:jsonDecode() --[[ line: 6117 ]]
	-- upvalues: t_5 (ref), t (ref)
	local var329 = t_5.new()
	
	if self.action_type ~= nil then
		var329.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var329.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var329.action_params = t.OpenSocialLinkAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var329.action_params = t.OpenSocialLinkAction_Params.jsonDecode(self.actionParams)
	end
	return var329
end

t_5.descriptor = {
	name = "OpenSocialLinkAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSocialLinkAction"
}
t.OpenSocialLinkAction = t_5
typeRegistryModule.default:register(t.OpenSocialLinkAction)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 6157 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		assignment_id = if p10 == nil or p10.assignment_id == nil then nil else p10.assignment_id,
		assignment_type = if p10 == nil or p10.assignment_type == nil then nil else p10.assignment_type,
		social_link_type = if p10 == nil or p10.social_link_type == nil then nil else p10.social_link_type,
		social_link_url = if p10 == nil or p10.social_link_url == nil then nil else p10.social_link_url,
		social_link_display_type = if p10 == nil or p10.social_link_display_type == nil then nil else p10.social_link_display_type
	}, t_6)
end

function t_6:encode() --[[ line: 6171 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var331 = 0
	
	if self.assignment_id ~= nil then
		local var332 = self.assignment_id:encode()
		local var333, var334 = protoModule.writeTag(buff, var331, 1, protoModule.wireTypes.lengthDelimited)
		var333, var334 = protoModule.writeBuffer(var333, var334, var332, buffer.len(var332))
		buff = var333
		var331 = var334
	end
	if self.assignment_type ~= nil then
		local var335 = self.assignment_type:encode()
		local var336, var337 = protoModule.writeTag(buff, var331, 2, protoModule.wireTypes.lengthDelimited)
		var336, var337 = protoModule.writeBuffer(var336, var337, var335, buffer.len(var335))
		buff = var336
		var331 = var337
	end
	if self.social_link_type ~= nil then
		local var338 = self.social_link_type:encode()
		local var339, var340 = protoModule.writeTag(buff, var331, 3, protoModule.wireTypes.lengthDelimited)
		var339, var340 = protoModule.writeBuffer(var339, var340, var338, buffer.len(var338))
		buff = var339
		var331 = var340
	end
	if self.social_link_url ~= nil then
		local var341 = self.social_link_url:encode()
		local var342, var343 = protoModule.writeTag(buff, var331, 4, protoModule.wireTypes.lengthDelimited)
		var342, var343 = protoModule.writeBuffer(var342, var343, var341, buffer.len(var341))
		buff = var342
		var331 = var343
	end
	if self.social_link_display_type ~= nil then
		local var344 = self.social_link_display_type:encode()
		local var345, var346 = protoModule.writeTag(buff, var331, 5, protoModule.wireTypes.lengthDelimited)
		var345, var346 = protoModule.writeBuffer(var345, var346, var344, buffer.len(var344))
		buff = var345
		var331 = var346
	end
	local buff_1 = buffer.create(var331)
	buffer.copy(buff_1, 0, buff, 0, var331)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 6210 ]]
	-- upvalues: t_6 (ref), protoModule (ref), propTypesModule (ref)
	local var348 = t_6.new()
	local var349 = 0
	while var349 < buffer.len(p11) do
		local _ = nil
		local var350 = nil
		local var351, var352, var353 = protoModule.readTag(p11, var349)
		local var354 = var351
		var350 = var352
		var349 = var353
		
		if var350 == protoModule.wireTypes.varint then
			local _ = nil
			local var355, var356 = protoModule.readVarInt(p11, var349)
			local _ = var355
			var349 = var356
			continue
		end
		if var350 == protoModule.wireTypes.lengthDelimited then
			if var354 == 1 then
				local _ = nil
				local var357, var358 = protoModule.readBuffer(p11, var349)
				var349 = var358
				var348.assignment_id = propTypesModule.StringProp.decode(var357)
			elseif var354 == 2 then
				local _ = nil
				local var359, var360 = protoModule.readBuffer(p11, var349)
				var349 = var360
				var348.assignment_type = propTypesModule.StringProp.decode(var359)
			elseif var354 == 3 then
				local _ = nil
				local var361, var362 = protoModule.readBuffer(p11, var349)
				var349 = var362
				var348.social_link_type = propTypesModule.StringProp.decode(var361)
			elseif var354 == 4 then
				local _ = nil
				local var363, var364 = protoModule.readBuffer(p11, var349)
				var349 = var364
				var348.social_link_url = propTypesModule.StringProp.decode(var363)
			elseif var354 == 5 then
				local _ = nil
				local var365, var366 = protoModule.readBuffer(p11, var349)
				var349 = var366
				var348.social_link_display_type = propTypesModule.StringProp.decode(var365)
			else
				local _ = nil
				local var367, var368 = protoModule.readVarInt(p11, var349)
				var349 = var368 + var367
			end
		elseif var350 == protoModule.wireTypes.i32 then
			local _ = nil
			local var369, var370 = protoModule.readFixed32(p11, var349)
			local _ = var369
			var349 = var370
		elseif var350 == protoModule.wireTypes.i64 then
			local _ = nil
			local var371, var372 = protoModule.readFixed64(p11, var349)
			local _ = var371
			var349 = var372
		else
			error("Unsupported wire type: " .. var350)
		end
	end
	return var348
end

function t_6:jsonEncode() --[[ line: 6274 ]]
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

function t_6:jsonDecode() --[[ line: 6300 ]]
	-- upvalues: t_6 (ref), propTypesModule (ref)
	local var374 = t_6.new()
	
	if self.assignment_id ~= nil then
		var374.assignment_id = propTypesModule.StringProp.jsonDecode(self.assignment_id)
	end
	if self.assignmentId ~= nil then
		var374.assignment_id = propTypesModule.StringProp.jsonDecode(self.assignmentId)
	end
	if self.assignment_type ~= nil then
		var374.assignment_type = propTypesModule.StringProp.jsonDecode(self.assignment_type)
	end
	if self.assignmentType ~= nil then
		var374.assignment_type = propTypesModule.StringProp.jsonDecode(self.assignmentType)
	end
	if self.social_link_type ~= nil then
		var374.social_link_type = propTypesModule.StringProp.jsonDecode(self.social_link_type)
	end
	if self.socialLinkType ~= nil then
		var374.social_link_type = propTypesModule.StringProp.jsonDecode(self.socialLinkType)
	end
	if self.social_link_url ~= nil then
		var374.social_link_url = propTypesModule.StringProp.jsonDecode(self.social_link_url)
	end
	if self.socialLinkUrl ~= nil then
		var374.social_link_url = propTypesModule.StringProp.jsonDecode(self.socialLinkUrl)
	end
	if self.social_link_display_type ~= nil then
		var374.social_link_display_type = propTypesModule.StringProp.jsonDecode(self.social_link_display_type)
	end
	if self.socialLinkDisplayType ~= nil then
		var374.social_link_display_type = propTypesModule.StringProp.jsonDecode(self.socialLinkDisplayType)
	end
	return var374
end

t_6.descriptor = {
	name = "OpenSocialLinkAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSocialLinkAction_Params = t_6
typeRegistryModule.default:register(t.OpenSocialLinkAction_Params)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12) --[[ line: 6370 ]]
	-- upvalues: t (ref), t_7 (ref)
	return setmetatable({
		action_type = if p12 == nil or p12.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p12.action_type,
		action_params = if p12 == nil or p12.action_params == nil then nil else p12.action_params
	}, t_7)
end

function t_7:encode() --[[ line: 6379 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var376 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var377, var378 = protoModule.writeTag(buff, var376, 1, protoModule.wireTypes.varint)
		var377, var378 = protoModule.writeVarInt(var377, var378, t.ActionType.toNumber(self.action_type))
		buff = var377
		var376 = var378
	end
	if self.action_params ~= nil then
		local var379 = self.action_params:encode()
		local var380, var381 = protoModule.writeTag(buff, var376, 2, protoModule.wireTypes.lengthDelimited)
		var380, var381 = protoModule.writeBuffer(var380, var381, var379, buffer.len(var379))
		buff = var380
		var376 = var381
	end
	local buff_1 = buffer.create(var376)
	buffer.copy(buff_1, 0, buff, 0, var376)
	
	return buff_1
end

function t_7.decode(p13) --[[ line: 6405 ]]
	-- upvalues: t_7 (ref), protoModule (ref), t (ref)
	local var383 = t_7.new()
	local var384 = 0
	while var384 < buffer.len(p13) do
		local _ = nil
		local var385 = nil
		local var386, var387, var388 = protoModule.readTag(p13, var384)
		local var389 = var386
		var385 = var387
		var384 = var388
		
		if var385 == protoModule.wireTypes.varint then
			if var389 == 1 then
				local _ = nil
				local var390, var391 = protoModule.readVarIntI32(p13, var384)
				local var392 = var390
				var384 = var391
				var383.action_type = t.ActionType.fromNumber(var392) or var392
			else
				local _ = nil
				local var393, var394 = protoModule.readVarInt(p13, var384)
				local _ = var393
				var384 = var394
			end
		end
		if var385 == protoModule.wireTypes.lengthDelimited then
			if var389 == 2 then
				local _ = nil
				local var395, var396 = protoModule.readBuffer(p13, var384)
				var384 = var396
				var383.action_params = t.OpenGameDetailsAction_Params.decode(var395)
			else
				local _ = nil
				local var397, var398 = protoModule.readVarInt(p13, var384)
				var384 = var398 + var397
			end
		elseif var385 == protoModule.wireTypes.i32 then
			local _ = nil
			local var399, var400 = protoModule.readFixed32(p13, var384)
			local _ = var399
			var384 = var400
		elseif var385 == protoModule.wireTypes.i64 then
			local _ = nil
			local var401, var402 = protoModule.readFixed64(p13, var384)
			local _ = var401
			var384 = var402
		else
			error("Unsupported wire type: " .. var385)
		end
	end
	return var383
end

function t_7:jsonEncode() --[[ line: 6453 ]]
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

function t_7:jsonDecode() --[[ line: 6475 ]]
	-- upvalues: t_7 (ref), t (ref)
	local var404 = t_7.new()
	
	if self.action_type ~= nil then
		var404.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var404.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var404.action_params = t.OpenGameDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var404.action_params = t.OpenGameDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var404
end

t_7.descriptor = {
	name = "OpenGameDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameDetailsAction"
}
t.OpenGameDetailsAction = t_7
typeRegistryModule.default:register(t.OpenGameDetailsAction)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14) --[[ line: 6515 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		place_id = if p14 == nil or p14.place_id == nil then nil else p14.place_id,
		universe_id = if p14 == nil or p14.universe_id == nil then nil else p14.universe_id,
		inherit_referral_session = if p14 == nil or p14.inherit_referral_session == nil then nil else p14.inherit_referral_session
	}, t_8)
end

function t_8:encode() --[[ line: 6527 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var406 = 0
	
	if self.place_id ~= nil then
		local var407 = self.place_id:encode()
		local var408, var409 = protoModule.writeTag(buff, var406, 1, protoModule.wireTypes.lengthDelimited)
		var408, var409 = protoModule.writeBuffer(var408, var409, var407, buffer.len(var407))
		buff = var408
		var406 = var409
	end
	if self.universe_id ~= nil then
		local var410 = self.universe_id:encode()
		local var411, var412 = protoModule.writeTag(buff, var406, 2, protoModule.wireTypes.lengthDelimited)
		var411, var412 = protoModule.writeBuffer(var411, var412, var410, buffer.len(var410))
		buff = var411
		var406 = var412
	end
	if self.inherit_referral_session ~= nil then
		local var413 = self.inherit_referral_session:encode()
		local var414, var415 = protoModule.writeTag(buff, var406, 3, protoModule.wireTypes.lengthDelimited)
		var414, var415 = protoModule.writeBuffer(var414, var415, var413, buffer.len(var413))
		buff = var414
		var406 = var415
	end
	local buff_1 = buffer.create(var406)
	buffer.copy(buff_1, 0, buff, 0, var406)
	
	return buff_1
end

function t_8.decode(p15) --[[ line: 6554 ]]
	-- upvalues: t_8 (ref), protoModule (ref), propTypesModule (ref)
	local var417 = t_8.new()
	local var418 = 0
	while var418 < buffer.len(p15) do
		local _ = nil
		local var419 = nil
		local var420, var421, var422 = protoModule.readTag(p15, var418)
		local var423 = var420
		var419 = var421
		var418 = var422
		
		if var419 == protoModule.wireTypes.varint then
			local _ = nil
			local var424, var425 = protoModule.readVarInt(p15, var418)
			local _ = var424
			var418 = var425
			continue
		end
		if var419 == protoModule.wireTypes.lengthDelimited then
			if var423 == 1 then
				local _ = nil
				local var426, var427 = protoModule.readBuffer(p15, var418)
				var418 = var427
				var417.place_id = propTypesModule.StringProp.decode(var426)
			elseif var423 == 2 then
				local _ = nil
				local var428, var429 = protoModule.readBuffer(p15, var418)
				var418 = var429
				var417.universe_id = propTypesModule.StringProp.decode(var428)
			elseif var423 == 3 then
				local _ = nil
				local var430, var431 = protoModule.readBuffer(p15, var418)
				var418 = var431
				var417.inherit_referral_session = propTypesModule.BoolProp.decode(var430)
			else
				local _ = nil
				local var432, var433 = protoModule.readVarInt(p15, var418)
				var418 = var433 + var432
			end
		elseif var419 == protoModule.wireTypes.i32 then
			local _ = nil
			local var434, var435 = protoModule.readFixed32(p15, var418)
			local _ = var434
			var418 = var435
		elseif var419 == protoModule.wireTypes.i64 then
			local _ = nil
			local var436, var437 = protoModule.readFixed64(p15, var418)
			local _ = var436
			var418 = var437
		else
			error("Unsupported wire type: " .. var419)
		end
	end
	return var417
end

function t_8:jsonEncode() --[[ line: 6608 ]]
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

function t_8:jsonDecode() --[[ line: 6626 ]]
	-- upvalues: t_8 (ref), propTypesModule (ref)
	local var439 = t_8.new()
	
	if self.place_id ~= nil then
		var439.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var439.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var439.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var439.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.inherit_referral_session ~= nil then
		var439.inherit_referral_session = propTypesModule.BoolProp.jsonDecode(self.inherit_referral_session)
	end
	if self.inheritReferralSession ~= nil then
		var439.inherit_referral_session = propTypesModule.BoolProp.jsonDecode(self.inheritReferralSession)
	end
	return var439
end

t_8.descriptor = {
	name = "OpenGameDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameDetailsAction_Params = t_8
typeRegistryModule.default:register(t.OpenGameDetailsAction_Params)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16) --[[ line: 6673 ]]
	-- upvalues: t (ref), t_9 (ref)
	return setmetatable({
		action_type = if p16 == nil or p16.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p16.action_type,
		action_params = if p16 == nil or p16.action_params == nil then nil else p16.action_params
	}, t_9)
end

function t_9:encode() --[[ line: 6682 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var441 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var442, var443 = protoModule.writeTag(buff, var441, 1, protoModule.wireTypes.varint)
		var442, var443 = protoModule.writeVarInt(var442, var443, t.ActionType.toNumber(self.action_type))
		buff = var442
		var441 = var443
	end
	if self.action_params ~= nil then
		local var444 = self.action_params:encode()
		local var445, var446 = protoModule.writeTag(buff, var441, 2, protoModule.wireTypes.lengthDelimited)
		var445, var446 = protoModule.writeBuffer(var445, var446, var444, buffer.len(var444))
		buff = var445
		var441 = var446
	end
	local buff_1 = buffer.create(var441)
	buffer.copy(buff_1, 0, buff, 0, var441)
	
	return buff_1
end

function t_9.decode(p17) --[[ line: 6708 ]]
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var448 = t_9.new()
	local var449 = 0
	while var449 < buffer.len(p17) do
		local _ = nil
		local var450 = nil
		local var451, var452, var453 = protoModule.readTag(p17, var449)
		local var454 = var451
		var450 = var452
		var449 = var453
		
		if var450 == protoModule.wireTypes.varint then
			if var454 == 1 then
				local _ = nil
				local var455, var456 = protoModule.readVarIntI32(p17, var449)
				local var457 = var455
				var449 = var456
				var448.action_type = t.ActionType.fromNumber(var457) or var457
			else
				local _ = nil
				local var458, var459 = protoModule.readVarInt(p17, var449)
				local _ = var458
				var449 = var459
			end
		end
		if var450 == protoModule.wireTypes.lengthDelimited then
			if var454 == 2 then
				local _ = nil
				local var460, var461 = protoModule.readBuffer(p17, var449)
				var449 = var461
				var448.action_params = t.OpenJoinFriendsAction_Params.decode(var460)
			else
				local _ = nil
				local var462, var463 = protoModule.readVarInt(p17, var449)
				var449 = var463 + var462
			end
		elseif var450 == protoModule.wireTypes.i32 then
			local _ = nil
			local var464, var465 = protoModule.readFixed32(p17, var449)
			local _ = var464
			var449 = var465
		elseif var450 == protoModule.wireTypes.i64 then
			local _ = nil
			local var466, var467 = protoModule.readFixed64(p17, var449)
			local _ = var466
			var449 = var467
		else
			error("Unsupported wire type: " .. var450)
		end
	end
	return var448
end

function t_9:jsonEncode() --[[ line: 6756 ]]
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

function t_9:jsonDecode() --[[ line: 6778 ]]
	-- upvalues: t_9 (ref), t (ref)
	local var469 = t_9.new()
	
	if self.action_type ~= nil then
		var469.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var469.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var469.action_params = t.OpenJoinFriendsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var469.action_params = t.OpenJoinFriendsAction_Params.jsonDecode(self.actionParams)
	end
	return var469
end

t_9.descriptor = {
	name = "OpenJoinFriendsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenJoinFriendsAction"
}
t.OpenJoinFriendsAction = t_9
typeRegistryModule.default:register(t.OpenJoinFriendsAction)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p18) --[[ line: 6818 ]]
	-- upvalues: t_10 (ref)
	return setmetatable({
		place_id = if p18 == nil or p18.place_id == nil then nil else p18.place_id,
		universe_id = if p18 == nil or p18.universe_id == nil then nil else p18.universe_id
	}, t_10)
end

function t_10:encode() --[[ line: 6827 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var471 = 0
	
	if self.place_id ~= nil then
		local var472 = self.place_id:encode()
		local var473, var474 = protoModule.writeTag(buff, var471, 1, protoModule.wireTypes.lengthDelimited)
		var473, var474 = protoModule.writeBuffer(var473, var474, var472, buffer.len(var472))
		buff = var473
		var471 = var474
	end
	if self.universe_id ~= nil then
		local var475 = self.universe_id:encode()
		local var476, var477 = protoModule.writeTag(buff, var471, 2, protoModule.wireTypes.lengthDelimited)
		var476, var477 = protoModule.writeBuffer(var476, var477, var475, buffer.len(var475))
		buff = var476
		var471 = var477
	end
	local buff_1 = buffer.create(var471)
	buffer.copy(buff_1, 0, buff, 0, var471)
	
	return buff_1
end

function t_10.decode(p19) --[[ line: 6848 ]]
	-- upvalues: t_10 (ref), protoModule (ref), propTypesModule (ref)
	local var479 = t_10.new()
	local var480 = 0
	while var480 < buffer.len(p19) do
		local _ = nil
		local var481 = nil
		local var482, var483, var484 = protoModule.readTag(p19, var480)
		local var485 = var482
		var481 = var483
		var480 = var484
		
		if var481 == protoModule.wireTypes.varint then
			local _ = nil
			local var486, var487 = protoModule.readVarInt(p19, var480)
			local _ = var486
			var480 = var487
			continue
		end
		if var481 == protoModule.wireTypes.lengthDelimited then
			if var485 == 1 then
				local _ = nil
				local var488, var489 = protoModule.readBuffer(p19, var480)
				var480 = var489
				var479.place_id = propTypesModule.StringProp.decode(var488)
			elseif var485 == 2 then
				local _ = nil
				local var490, var491 = protoModule.readBuffer(p19, var480)
				var480 = var491
				var479.universe_id = propTypesModule.StringProp.decode(var490)
			else
				local _ = nil
				local var492, var493 = protoModule.readVarInt(p19, var480)
				var480 = var493 + var492
			end
		elseif var481 == protoModule.wireTypes.i32 then
			local _ = nil
			local var494, var495 = protoModule.readFixed32(p19, var480)
			local _ = var494
			var480 = var495
		elseif var481 == protoModule.wireTypes.i64 then
			local _ = nil
			local var496, var497 = protoModule.readFixed64(p19, var480)
			local _ = var496
			var480 = var497
		else
			error("Unsupported wire type: " .. var481)
		end
	end
	return var479
end

function t_10:jsonEncode() --[[ line: 6896 ]]
	local t = {}
	
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_10:jsonDecode() --[[ line: 6910 ]]
	-- upvalues: t_10 (ref), propTypesModule (ref)
	local var499 = t_10.new()
	
	if self.place_id ~= nil then
		var499.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var499.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var499.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var499.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var499
end

t_10.descriptor = {
	name = "OpenJoinFriendsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenJoinFriendsAction_Params = t_10
typeRegistryModule.default:register(t.OpenJoinFriendsAction_Params)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p20) --[[ line: 6947 ]]
	-- upvalues: t (ref), t_11 (ref)
	return setmetatable({
		action_type = if p20 == nil or p20.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p20.action_type,
		action_params = if p20 == nil or p20.action_params == nil then nil else p20.action_params
	}, t_11)
end

function t_11:encode() --[[ line: 6958 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var501 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var502, var503 = protoModule.writeTag(buff, var501, 1, protoModule.wireTypes.varint)
		var502, var503 = protoModule.writeVarInt(var502, var503, t.ActionType.toNumber(self.action_type))
		buff = var502
		var501 = var503
	end
	if self.action_params ~= nil then
		local var504 = self.action_params:encode()
		local var505, var506 = protoModule.writeTag(buff, var501, 2, protoModule.wireTypes.lengthDelimited)
		var505, var506 = protoModule.writeBuffer(var505, var506, var504, buffer.len(var504))
		buff = var505
		var501 = var506
	end
	local buff_1 = buffer.create(var501)
	buffer.copy(buff_1, 0, buff, 0, var501)
	
	return buff_1
end

function t_11.decode(p21) --[[ line: 6984 ]]
	-- upvalues: t_11 (ref), protoModule (ref), t (ref)
	local var508 = t_11.new()
	local var509 = 0
	while var509 < buffer.len(p21) do
		local _ = nil
		local var510 = nil
		local var511, var512, var513 = protoModule.readTag(p21, var509)
		local var514 = var511
		var510 = var512
		var509 = var513
		
		if var510 == protoModule.wireTypes.varint then
			if var514 == 1 then
				local _ = nil
				local var515, var516 = protoModule.readVarIntI32(p21, var509)
				local var517 = var515
				var509 = var516
				var508.action_type = t.ActionType.fromNumber(var517) or var517
			else
				local _ = nil
				local var518, var519 = protoModule.readVarInt(p21, var509)
				local _ = var518
				var509 = var519
			end
		end
		if var510 == protoModule.wireTypes.lengthDelimited then
			if var514 == 2 then
				local _ = nil
				local var520, var521 = protoModule.readBuffer(p21, var509)
				var509 = var521
				var508.action_params = t.OpenMarketplaceTryOnAction_Params.decode(var520)
			else
				local _ = nil
				local var522, var523 = protoModule.readVarInt(p21, var509)
				var509 = var523 + var522
			end
		elseif var510 == protoModule.wireTypes.i32 then
			local _ = nil
			local var524, var525 = protoModule.readFixed32(p21, var509)
			local _ = var524
			var509 = var525
		elseif var510 == protoModule.wireTypes.i64 then
			local _ = nil
			local var526, var527 = protoModule.readFixed64(p21, var509)
			local _ = var526
			var509 = var527
		else
			error("Unsupported wire type: " .. var510)
		end
	end
	return var508
end

function t_11:jsonEncode() --[[ line: 7032 ]]
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

function t_11:jsonDecode() --[[ line: 7054 ]]
	-- upvalues: t_11 (ref), t (ref)
	local var529 = t_11.new()
	
	if self.action_type ~= nil then
		var529.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var529.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var529.action_params = t.OpenMarketplaceTryOnAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var529.action_params = t.OpenMarketplaceTryOnAction_Params.jsonDecode(self.actionParams)
	end
	return var529
end

t_11.descriptor = {
	name = "OpenMarketplaceTryOnAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceTryOnAction"
}
t.OpenMarketplaceTryOnAction = t_11
typeRegistryModule.default:register(t.OpenMarketplaceTryOnAction)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p22) --[[ line: 7094 ]]
	-- upvalues: t_12 (ref)
	return setmetatable({
		item_id = if p22 == nil or p22.item_id == nil then nil else p22.item_id,
		item_type = if p22 == nil or p22.item_type == nil then nil else p22.item_type,
		item_sub_type_name = if p22 == nil or p22.item_sub_type_name == nil then nil else p22.item_sub_type_name
	}, t_12)
end

function t_12:encode() --[[ line: 7104 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var531 = 0
	
	if self.item_id ~= nil then
		local var532 = self.item_id:encode()
		local var533, var534 = protoModule.writeTag(buff, var531, 1, protoModule.wireTypes.lengthDelimited)
		var533, var534 = protoModule.writeBuffer(var533, var534, var532, buffer.len(var532))
		buff = var533
		var531 = var534
	end
	if self.item_type ~= nil then
		local var535 = self.item_type:encode()
		local var536, var537 = protoModule.writeTag(buff, var531, 2, protoModule.wireTypes.lengthDelimited)
		var536, var537 = protoModule.writeBuffer(var536, var537, var535, buffer.len(var535))
		buff = var536
		var531 = var537
	end
	if self.item_sub_type_name ~= nil then
		local var538 = self.item_sub_type_name:encode()
		local var539, var540 = protoModule.writeTag(buff, var531, 3, protoModule.wireTypes.lengthDelimited)
		var539, var540 = protoModule.writeBuffer(var539, var540, var538, buffer.len(var538))
		buff = var539
		var531 = var540
	end
	local buff_1 = buffer.create(var531)
	buffer.copy(buff_1, 0, buff, 0, var531)
	
	return buff_1
end

function t_12.decode(p23) --[[ line: 7131 ]]
	-- upvalues: t_12 (ref), protoModule (ref), propTypesModule (ref)
	local var542 = t_12.new()
	local var543 = 0
	while var543 < buffer.len(p23) do
		local _ = nil
		local var544 = nil
		local var545, var546, var547 = protoModule.readTag(p23, var543)
		local var548 = var545
		var544 = var546
		var543 = var547
		
		if var544 == protoModule.wireTypes.varint then
			local _ = nil
			local var549, var550 = protoModule.readVarInt(p23, var543)
			local _ = var549
			var543 = var550
			continue
		end
		if var544 == protoModule.wireTypes.lengthDelimited then
			if var548 == 1 then
				local _ = nil
				local var551, var552 = protoModule.readBuffer(p23, var543)
				var543 = var552
				var542.item_id = propTypesModule.StringProp.decode(var551)
			elseif var548 == 2 then
				local _ = nil
				local var553, var554 = protoModule.readBuffer(p23, var543)
				var543 = var554
				var542.item_type = propTypesModule.StringProp.decode(var553)
			elseif var548 == 3 then
				local _ = nil
				local var555, var556 = protoModule.readBuffer(p23, var543)
				var543 = var556
				var542.item_sub_type_name = propTypesModule.StringProp.decode(var555)
			else
				local _ = nil
				local var557, var558 = protoModule.readVarInt(p23, var543)
				var543 = var558 + var557
			end
		elseif var544 == protoModule.wireTypes.i32 then
			local _ = nil
			local var559, var560 = protoModule.readFixed32(p23, var543)
			local _ = var559
			var543 = var560
		elseif var544 == protoModule.wireTypes.i64 then
			local _ = nil
			local var561, var562 = protoModule.readFixed64(p23, var543)
			local _ = var561
			var543 = var562
		else
			error("Unsupported wire type: " .. var544)
		end
	end
	return var542
end

function t_12:jsonEncode() --[[ line: 7184 ]]
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

function t_12:jsonDecode() --[[ line: 7202 ]]
	-- upvalues: t_12 (ref), propTypesModule (ref)
	local var564 = t_12.new()
	
	if self.item_id ~= nil then
		var564.item_id = propTypesModule.StringProp.jsonDecode(self.item_id)
	end
	if self.itemId ~= nil then
		var564.item_id = propTypesModule.StringProp.jsonDecode(self.itemId)
	end
	if self.item_type ~= nil then
		var564.item_type = propTypesModule.StringProp.jsonDecode(self.item_type)
	end
	if self.itemType ~= nil then
		var564.item_type = propTypesModule.StringProp.jsonDecode(self.itemType)
	end
	if self.item_sub_type_name ~= nil then
		var564.item_sub_type_name = propTypesModule.StringProp.jsonDecode(self.item_sub_type_name)
	end
	if self.itemSubTypeName ~= nil then
		var564.item_sub_type_name = propTypesModule.StringProp.jsonDecode(self.itemSubTypeName)
	end
	return var564
end

t_12.descriptor = {
	name = "OpenMarketplaceTryOnAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceTryOnAction_Params = t_12
typeRegistryModule.default:register(t.OpenMarketplaceTryOnAction_Params)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p24) --[[ line: 7250 ]]
	-- upvalues: t (ref), t_13 (ref)
	return setmetatable({
		action_type = if p24 == nil or p24.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p24.action_type,
		action_params = if p24 == nil or p24.action_params == nil then nil else p24.action_params
	}, t_13)
end

function t_13:encode() --[[ line: 7259 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var566 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var567, var568 = protoModule.writeTag(buff, var566, 1, protoModule.wireTypes.varint)
		var567, var568 = protoModule.writeVarInt(var567, var568, t.ActionType.toNumber(self.action_type))
		buff = var567
		var566 = var568
	end
	if self.action_params ~= nil then
		local var569 = self.action_params:encode()
		local var570, var571 = protoModule.writeTag(buff, var566, 2, protoModule.wireTypes.lengthDelimited)
		var570, var571 = protoModule.writeBuffer(var570, var571, var569, buffer.len(var569))
		buff = var570
		var566 = var571
	end
	local buff_1 = buffer.create(var566)
	buffer.copy(buff_1, 0, buff, 0, var566)
	
	return buff_1
end

function t_13.decode(p25) --[[ line: 7285 ]]
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var573 = t_13.new()
	local var574 = 0
	while var574 < buffer.len(p25) do
		local _ = nil
		local var575 = nil
		local var576, var577, var578 = protoModule.readTag(p25, var574)
		local var579 = var576
		var575 = var577
		var574 = var578
		
		if var575 == protoModule.wireTypes.varint then
			if var579 == 1 then
				local _ = nil
				local var580, var581 = protoModule.readVarIntI32(p25, var574)
				local var582 = var580
				var574 = var581
				var573.action_type = t.ActionType.fromNumber(var582) or var582
			else
				local _ = nil
				local var583, var584 = protoModule.readVarInt(p25, var574)
				local _ = var583
				var574 = var584
			end
		end
		if var575 == protoModule.wireTypes.lengthDelimited then
			if var579 == 2 then
				local _ = nil
				local var585, var586 = protoModule.readBuffer(p25, var574)
				var574 = var586
				var573.action_params = t.OpenSeeAllAction_Params.decode(var585)
			else
				local _ = nil
				local var587, var588 = protoModule.readVarInt(p25, var574)
				var574 = var588 + var587
			end
		elseif var575 == protoModule.wireTypes.i32 then
			local _ = nil
			local var589, var590 = protoModule.readFixed32(p25, var574)
			local _ = var589
			var574 = var590
		elseif var575 == protoModule.wireTypes.i64 then
			local _ = nil
			local var591, var592 = protoModule.readFixed64(p25, var574)
			local _ = var591
			var574 = var592
		else
			error("Unsupported wire type: " .. var575)
		end
	end
	return var573
end

function t_13:jsonEncode() --[[ line: 7333 ]]
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

function t_13:jsonDecode() --[[ line: 7355 ]]
	-- upvalues: t_13 (ref), t (ref)
	local var594 = t_13.new()
	
	if self.action_type ~= nil then
		var594.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var594.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var594.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var594.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var594
end

t_13.descriptor = {
	name = "OpenSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSeeAllAction"
}
t.OpenSeeAllAction = t_13
typeRegistryModule.default:register(t.OpenSeeAllAction)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p26) --[[ line: 7395 ]]
	-- upvalues: t_14 (ref)
	return setmetatable({
		collection_id = if p26 == nil or p26.collection_id == nil then nil else p26.collection_id,
		game_set_target_id = if p26 == nil or p26.game_set_target_id == nil then nil else p26.game_set_target_id,
		collection_position = if p26 == nil or p26.collection_position == nil then nil else p26.collection_position
	}, t_14)
end

function t_14:encode() --[[ line: 7405 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var596 = 0
	
	if self.collection_id ~= nil then
		local var597 = self.collection_id:encode()
		local var598, var599 = protoModule.writeTag(buff, var596, 1, protoModule.wireTypes.lengthDelimited)
		var598, var599 = protoModule.writeBuffer(var598, var599, var597, buffer.len(var597))
		buff = var598
		var596 = var599
	end
	if self.game_set_target_id ~= nil then
		local var600 = self.game_set_target_id:encode()
		local var601, var602 = protoModule.writeTag(buff, var596, 2, protoModule.wireTypes.lengthDelimited)
		var601, var602 = protoModule.writeBuffer(var601, var602, var600, buffer.len(var600))
		buff = var601
		var596 = var602
	end
	if self.collection_position ~= nil then
		local var603 = self.collection_position:encode()
		local var604, var605 = protoModule.writeTag(buff, var596, 3, protoModule.wireTypes.lengthDelimited)
		var604, var605 = protoModule.writeBuffer(var604, var605, var603, buffer.len(var603))
		buff = var604
		var596 = var605
	end
	local buff_1 = buffer.create(var596)
	buffer.copy(buff_1, 0, buff, 0, var596)
	
	return buff_1
end

function t_14.decode(p27) --[[ line: 7432 ]]
	-- upvalues: t_14 (ref), protoModule (ref), propTypesModule (ref)
	local var607 = t_14.new()
	local var608 = 0
	while var608 < buffer.len(p27) do
		local _ = nil
		local var609 = nil
		local var610, var611, var612 = protoModule.readTag(p27, var608)
		local var613 = var610
		var609 = var611
		var608 = var612
		
		if var609 == protoModule.wireTypes.varint then
			local _ = nil
			local var614, var615 = protoModule.readVarInt(p27, var608)
			local _ = var614
			var608 = var615
			continue
		end
		if var609 == protoModule.wireTypes.lengthDelimited then
			if var613 == 1 then
				local _ = nil
				local var616, var617 = protoModule.readBuffer(p27, var608)
				var608 = var617
				var607.collection_id = propTypesModule.StringProp.decode(var616)
			elseif var613 == 2 then
				local _ = nil
				local var618, var619 = protoModule.readBuffer(p27, var608)
				var608 = var619
				var607.game_set_target_id = propTypesModule.StringProp.decode(var618)
			elseif var613 == 3 then
				local _ = nil
				local var620, var621 = protoModule.readBuffer(p27, var608)
				var608 = var621
				var607.collection_position = propTypesModule.StringProp.decode(var620)
			else
				local _ = nil
				local var622, var623 = protoModule.readVarInt(p27, var608)
				var608 = var623 + var622
			end
		elseif var609 == protoModule.wireTypes.i32 then
			local _ = nil
			local var624, var625 = protoModule.readFixed32(p27, var608)
			local _ = var624
			var608 = var625
		elseif var609 == protoModule.wireTypes.i64 then
			local _ = nil
			local var626, var627 = protoModule.readFixed64(p27, var608)
			local _ = var626
			var608 = var627
		else
			error("Unsupported wire type: " .. var609)
		end
	end
	return var607
end

function t_14:jsonEncode() --[[ line: 7486 ]]
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

function t_14:jsonDecode() --[[ line: 7504 ]]
	-- upvalues: t_14 (ref), propTypesModule (ref)
	local var629 = t_14.new()
	
	if self.collection_id ~= nil then
		var629.collection_id = propTypesModule.StringProp.jsonDecode(self.collection_id)
	end
	if self.collectionId ~= nil then
		var629.collection_id = propTypesModule.StringProp.jsonDecode(self.collectionId)
	end
	if self.game_set_target_id ~= nil then
		var629.game_set_target_id = propTypesModule.StringProp.jsonDecode(self.game_set_target_id)
	end
	if self.gameSetTargetId ~= nil then
		var629.game_set_target_id = propTypesModule.StringProp.jsonDecode(self.gameSetTargetId)
	end
	if self.collection_position ~= nil then
		var629.collection_position = propTypesModule.StringProp.jsonDecode(self.collection_position)
	end
	if self.collectionPosition ~= nil then
		var629.collection_position = propTypesModule.StringProp.jsonDecode(self.collectionPosition)
	end
	return var629
end

t_14.descriptor = {
	name = "OpenSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSeeAllAction_Params = t_14
typeRegistryModule.default:register(t.OpenSeeAllAction_Params)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p28) --[[ line: 7554 ]]
	-- upvalues: t (ref), t_15 (ref)
	return setmetatable({
		action_type = if p28 == nil or p28.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p28.action_type,
		action_params = if p28 == nil or p28.action_params == nil then nil else p28.action_params
	}, t_15)
end

function t_15:encode() --[[ line: 7565 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var631 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var632, var633 = protoModule.writeTag(buff, var631, 1, protoModule.wireTypes.varint)
		var632, var633 = protoModule.writeVarInt(var632, var633, t.ActionType.toNumber(self.action_type))
		buff = var632
		var631 = var633
	end
	if self.action_params ~= nil then
		local var634 = self.action_params:encode()
		local var635, var636 = protoModule.writeTag(buff, var631, 2, protoModule.wireTypes.lengthDelimited)
		var635, var636 = protoModule.writeBuffer(var635, var636, var634, buffer.len(var634))
		buff = var635
		var631 = var636
	end
	local buff_1 = buffer.create(var631)
	buffer.copy(buff_1, 0, buff, 0, var631)
	
	return buff_1
end

function t_15.decode(p29) --[[ line: 7591 ]]
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var638 = t_15.new()
	local var639 = 0
	while var639 < buffer.len(p29) do
		local _ = nil
		local var640 = nil
		local var641, var642, var643 = protoModule.readTag(p29, var639)
		local var644 = var641
		var640 = var642
		var639 = var643
		
		if var640 == protoModule.wireTypes.varint then
			if var644 == 1 then
				local _ = nil
				local var645, var646 = protoModule.readVarIntI32(p29, var639)
				local var647 = var645
				var639 = var646
				var638.action_type = t.ActionType.fromNumber(var647) or var647
			else
				local _ = nil
				local var648, var649 = protoModule.readVarInt(p29, var639)
				local _ = var648
				var639 = var649
			end
		end
		if var640 == protoModule.wireTypes.lengthDelimited then
			if var644 == 2 then
				local _ = nil
				local var650, var651 = protoModule.readBuffer(p29, var639)
				var639 = var651
				var638.action_params = t.OpenSponsoredTooltipAction_Params.decode(var650)
			else
				local _ = nil
				local var652, var653 = protoModule.readVarInt(p29, var639)
				var639 = var653 + var652
			end
		elseif var640 == protoModule.wireTypes.i32 then
			local _ = nil
			local var654, var655 = protoModule.readFixed32(p29, var639)
			local _ = var654
			var639 = var655
		elseif var640 == protoModule.wireTypes.i64 then
			local _ = nil
			local var656, var657 = protoModule.readFixed64(p29, var639)
			local _ = var656
			var639 = var657
		else
			error("Unsupported wire type: " .. var640)
		end
	end
	return var638
end

function t_15:jsonEncode() --[[ line: 7639 ]]
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

function t_15:jsonDecode() --[[ line: 7661 ]]
	-- upvalues: t_15 (ref), t (ref)
	local var659 = t_15.new()
	
	if self.action_type ~= nil then
		var659.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var659.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var659.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var659.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return var659
end

t_15.descriptor = {
	name = "OpenSponsoredTooltipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSponsoredTooltipAction"
}
t.OpenSponsoredTooltipAction = t_15
typeRegistryModule.default:register(t.OpenSponsoredTooltipAction)
local t_16 = {}
t_16.__index = t_16

function t_16.new(_) --[[ line: 7701 ]]
	-- upvalues: t_16 (ref)
	return setmetatable({}, t_16)
end

function t_16.encode(_) --[[ line: 7707 ]]
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_16.decode(p30) --[[ line: 7716 ]]
	-- upvalues: t_16 (ref), protoModule (ref)
	local var661 = t_16.new()
	local var662 = 0
	while var662 < buffer.len(p30) do
		local var663 = nil
		local _ = nil
		local var664, var665, var666 = protoModule.readTag(p30, var662)
		var663 = var664
		local var667 = var665
		var662 = var666
		
		if var667 == protoModule.wireTypes.varint then
			local _ = nil
			local var668, var669 = protoModule.readVarInt(p30, var662)
			local _ = var668
			var662 = var669
		elseif var667 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var670, var671 = protoModule.readVarInt(p30, var662)
			var662 = var671 + var670
		elseif var667 == protoModule.wireTypes.i32 then
			local _ = nil
			local var672, var673 = protoModule.readFixed32(p30, var662)
			local _ = var672
			var662 = var673
		elseif var667 == protoModule.wireTypes.i64 then
			local _ = nil
			local var674, var675 = protoModule.readFixed64(p30, var662)
			local _ = var674
			var662 = var675
		else
			error("Unsupported wire type: " .. var667)
		end
	end
	return var661
end

function t_16.jsonEncode(_) --[[ line: 7754 ]]
	return {}
end

function t_16.jsonDecode(_) --[[ line: 7760 ]]
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

function t_17.new(p31) --[[ line: 7782 ]]
	-- upvalues: t (ref), t_17 (ref)
	return setmetatable({
		action_type = if p31 == nil or p31.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p31.action_type,
		action_params = if p31 == nil or p31.action_params == nil then nil else p31.action_params
	}, t_17)
end

function t_17:encode() --[[ line: 7791 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var677 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var678, var679 = protoModule.writeTag(buff, var677, 1, protoModule.wireTypes.varint)
		var678, var679 = protoModule.writeVarInt(var678, var679, t.ActionType.toNumber(self.action_type))
		buff = var678
		var677 = var679
	end
	if self.action_params ~= nil then
		local var680 = self.action_params:encode()
		local var681, var682 = protoModule.writeTag(buff, var677, 2, protoModule.wireTypes.lengthDelimited)
		var681, var682 = protoModule.writeBuffer(var681, var682, var680, buffer.len(var680))
		buff = var681
		var677 = var682
	end
	local buff_1 = buffer.create(var677)
	buffer.copy(buff_1, 0, buff, 0, var677)
	
	return buff_1
end

function t_17.decode(p32) --[[ line: 7817 ]]
	-- upvalues: t_17 (ref), protoModule (ref), t (ref)
	local var684 = t_17.new()
	local var685 = 0
	while var685 < buffer.len(p32) do
		local _ = nil
		local var686 = nil
		local var687, var688, var689 = protoModule.readTag(p32, var685)
		local var690 = var687
		var686 = var688
		var685 = var689
		
		if var686 == protoModule.wireTypes.varint then
			if var690 == 1 then
				local _ = nil
				local var691, var692 = protoModule.readVarIntI32(p32, var685)
				local var693 = var691
				var685 = var692
				var684.action_type = t.ActionType.fromNumber(var693) or var693
			else
				local _ = nil
				local var694, var695 = protoModule.readVarInt(p32, var685)
				local _ = var694
				var685 = var695
			end
		end
		if var686 == protoModule.wireTypes.lengthDelimited then
			if var690 == 2 then
				local _ = nil
				local var696, var697 = protoModule.readBuffer(p32, var685)
				var685 = var697
				var684.action_params = t.PlayButtonClickAction_Params.decode(var696)
			else
				local _ = nil
				local var698, var699 = protoModule.readVarInt(p32, var685)
				var685 = var699 + var698
			end
		elseif var686 == protoModule.wireTypes.i32 then
			local _ = nil
			local var700, var701 = protoModule.readFixed32(p32, var685)
			local _ = var700
			var685 = var701
		elseif var686 == protoModule.wireTypes.i64 then
			local _ = nil
			local var702, var703 = protoModule.readFixed64(p32, var685)
			local _ = var702
			var685 = var703
		else
			error("Unsupported wire type: " .. var686)
		end
	end
	return var684
end

function t_17:jsonEncode() --[[ line: 7865 ]]
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

function t_17:jsonDecode() --[[ line: 7887 ]]
	-- upvalues: t_17 (ref), t (ref)
	local var705 = t_17.new()
	
	if self.action_type ~= nil then
		var705.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var705.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var705.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var705.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.actionParams)
	end
	return var705
end

t_17.descriptor = {
	name = "PlayButtonClickAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.PlayButtonClickAction"
}
t.PlayButtonClickAction = t_17
typeRegistryModule.default:register(t.PlayButtonClickAction)
local t_18 = {}
t_18.__index = t_18

function t_18.new(_) --[[ line: 7927 ]]
	-- upvalues: t_18 (ref)
	return setmetatable({}, t_18)
end

function t_18.encode(_) --[[ line: 7933 ]]
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_18.decode(p33) --[[ line: 7942 ]]
	-- upvalues: t_18 (ref), protoModule (ref)
	local var707 = t_18.new()
	local var708 = 0
	while var708 < buffer.len(p33) do
		local var709 = nil
		local _ = nil
		local var710, var711, var712 = protoModule.readTag(p33, var708)
		var709 = var710
		local var713 = var711
		var708 = var712
		
		if var713 == protoModule.wireTypes.varint then
			local _ = nil
			local var714, var715 = protoModule.readVarInt(p33, var708)
			local _ = var714
			var708 = var715
		elseif var713 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var716, var717 = protoModule.readVarInt(p33, var708)
			var708 = var717 + var716
		elseif var713 == protoModule.wireTypes.i32 then
			local _ = nil
			local var718, var719 = protoModule.readFixed32(p33, var708)
			local _ = var718
			var708 = var719
		elseif var713 == protoModule.wireTypes.i64 then
			local _ = nil
			local var720, var721 = protoModule.readFixed64(p33, var708)
			local _ = var720
			var708 = var721
		else
			error("Unsupported wire type: " .. var713)
		end
	end
	return var707
end

function t_18.jsonEncode(_) --[[ line: 7980 ]]
	return {}
end

function t_18.jsonDecode(_) --[[ line: 7986 ]]
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

function t_19.new(p34) --[[ line: 8006 ]]
	-- upvalues: t (ref), t_19 (ref)
	return setmetatable({
		action_type = if p34 == nil or p34.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p34.action_type,
		action_params = if p34 == nil or p34.action_params == nil then nil else p34.action_params
	}, t_19)
end

function t_19:encode() --[[ line: 8015 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var723 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var724, var725 = protoModule.writeTag(buff, var723, 1, protoModule.wireTypes.varint)
		var724, var725 = protoModule.writeVarInt(var724, var725, t.ActionType.toNumber(self.action_type))
		buff = var724
		var723 = var725
	end
	if self.action_params ~= nil then
		local var726 = self.action_params:encode()
		local var727, var728 = protoModule.writeTag(buff, var723, 2, protoModule.wireTypes.lengthDelimited)
		var727, var728 = protoModule.writeBuffer(var727, var728, var726, buffer.len(var726))
		buff = var727
		var723 = var728
	end
	local buff_1 = buffer.create(var723)
	buffer.copy(buff_1, 0, buff, 0, var723)
	
	return buff_1
end

function t_19.decode(p35) --[[ line: 8041 ]]
	-- upvalues: t_19 (ref), protoModule (ref), t (ref)
	local var730 = t_19.new()
	local var731 = 0
	while var731 < buffer.len(p35) do
		local _ = nil
		local var732 = nil
		local var733, var734, var735 = protoModule.readTag(p35, var731)
		local var736 = var733
		var732 = var734
		var731 = var735
		
		if var732 == protoModule.wireTypes.varint then
			if var736 == 1 then
				local _ = nil
				local var737, var738 = protoModule.readVarIntI32(p35, var731)
				local var739 = var737
				var731 = var738
				var730.action_type = t.ActionType.fromNumber(var739) or var739
			else
				local _ = nil
				local var740, var741 = protoModule.readVarInt(p35, var731)
				local _ = var740
				var731 = var741
			end
		end
		if var732 == protoModule.wireTypes.lengthDelimited then
			if var736 == 2 then
				local _ = nil
				local var742, var743 = protoModule.readBuffer(p35, var731)
				var731 = var743
				var730.action_params = t.UpdateUserSettingsAction_Params.decode(var742)
			else
				local _ = nil
				local var744, var745 = protoModule.readVarInt(p35, var731)
				var731 = var745 + var744
			end
		elseif var732 == protoModule.wireTypes.i32 then
			local _ = nil
			local var746, var747 = protoModule.readFixed32(p35, var731)
			local _ = var746
			var731 = var747
		elseif var732 == protoModule.wireTypes.i64 then
			local _ = nil
			local var748, var749 = protoModule.readFixed64(p35, var731)
			local _ = var748
			var731 = var749
		else
			error("Unsupported wire type: " .. var732)
		end
	end
	return var730
end

function t_19:jsonEncode() --[[ line: 8089 ]]
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

function t_19:jsonDecode() --[[ line: 8111 ]]
	-- upvalues: t_19 (ref), t (ref)
	local var751 = t_19.new()
	
	if self.action_type ~= nil then
		var751.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var751.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var751.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var751.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.actionParams)
	end
	return var751
end

t_19.descriptor = {
	name = "UpdateUserSettingsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.UpdateUserSettingsAction"
}
t.UpdateUserSettingsAction = t_19
typeRegistryModule.default:register(t.UpdateUserSettingsAction)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p36) --[[ line: 8151 ]]
	-- upvalues: t_20 (ref)
	return setmetatable({
		settings = if p36 == nil or p36.settings == nil then nil else p36.settings,
		audit_data = if p36 == nil or p36.audit_data == nil then nil else p36.audit_data
	}, t_20)
end

function t_20:encode() --[[ line: 8160 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var753 = 0
	
	if self.settings ~= nil then
		local var754 = self.settings:encode()
		local var755, var756 = protoModule.writeTag(buff, var753, 1, protoModule.wireTypes.lengthDelimited)
		var755, var756 = protoModule.writeBuffer(var755, var756, var754, buffer.len(var754))
		buff = var755
		var753 = var756
	end
	if self.audit_data ~= nil then
		local var757 = self.audit_data:encode()
		local var758, var759 = protoModule.writeTag(buff, var753, 2, protoModule.wireTypes.lengthDelimited)
		var758, var759 = protoModule.writeBuffer(var758, var759, var757, buffer.len(var757))
		buff = var758
		var753 = var759
	end
	local buff_1 = buffer.create(var753)
	buffer.copy(buff_1, 0, buff, 0, var753)
	
	return buff_1
end

function t_20.decode(p37) --[[ line: 8181 ]]
	-- upvalues: t_20 (ref), protoModule (ref), propTypesModule (ref)
	local var761 = t_20.new()
	local var762 = 0
	while var762 < buffer.len(p37) do
		local _ = nil
		local var763 = nil
		local var764, var765, var766 = protoModule.readTag(p37, var762)
		local var767 = var764
		var763 = var765
		var762 = var766
		
		if var763 == protoModule.wireTypes.varint then
			local _ = nil
			local var768, var769 = protoModule.readVarInt(p37, var762)
			local _ = var768
			var762 = var769
			continue
		end
		if var763 == protoModule.wireTypes.lengthDelimited then
			if var767 == 1 then
				local _ = nil
				local var770, var771 = protoModule.readBuffer(p37, var762)
				var762 = var771
				var761.settings = propTypesModule.StructProp.decode(var770)
			elseif var767 == 2 then
				local _ = nil
				local var772, var773 = protoModule.readBuffer(p37, var762)
				var762 = var773
				var761.audit_data = propTypesModule.StringProp.decode(var772)
			else
				local _ = nil
				local var774, var775 = protoModule.readVarInt(p37, var762)
				var762 = var775 + var774
			end
		elseif var763 == protoModule.wireTypes.i32 then
			local _ = nil
			local var776, var777 = protoModule.readFixed32(p37, var762)
			local _ = var776
			var762 = var777
		elseif var763 == protoModule.wireTypes.i64 then
			local _ = nil
			local var778, var779 = protoModule.readFixed64(p37, var762)
			local _ = var778
			var762 = var779
		else
			error("Unsupported wire type: " .. var763)
		end
	end
	return var761
end

function t_20:jsonEncode() --[[ line: 8229 ]]
	local t = {}
	
	if self.settings ~= nil then
		t.settings = self.settings:jsonEncode()
	end
	if self.audit_data ~= nil then
		t.auditData = self.audit_data:jsonEncode()
	end
	return t
end

function t_20:jsonDecode() --[[ line: 8243 ]]
	-- upvalues: t_20 (ref), propTypesModule (ref)
	local var781 = t_20.new()
	
	if self.settings ~= nil then
		var781.settings = propTypesModule.StructProp.jsonDecode(self.settings)
	end
	if self.audit_data ~= nil then
		var781.audit_data = propTypesModule.StringProp.jsonDecode(self.audit_data)
	end
	if self.auditData ~= nil then
		var781.audit_data = propTypesModule.StringProp.jsonDecode(self.auditData)
	end
	return var781
end

t_20.descriptor = {
	name = "UpdateUserSettingsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.UpdateUserSettingsAction_Params = t_20
typeRegistryModule.default:register(t.UpdateUserSettingsAction_Params)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p38) --[[ line: 8275 ]]
	-- upvalues: t (ref), t_21 (ref)
	return setmetatable({
		action_type = if p38 == nil or p38.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p38.action_type,
		action_params = if p38 == nil or p38.action_params == nil then nil else p38.action_params
	}, t_21)
end

function t_21:encode() --[[ line: 8284 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var783 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var784, var785 = protoModule.writeTag(buff, var783, 1, protoModule.wireTypes.varint)
		var784, var785 = protoModule.writeVarInt(var784, var785, t.ActionType.toNumber(self.action_type))
		buff = var784
		var783 = var785
	end
	if self.action_params ~= nil then
		local var786 = self.action_params:encode()
		local var787, var788 = protoModule.writeTag(buff, var783, 2, protoModule.wireTypes.lengthDelimited)
		var787, var788 = protoModule.writeBuffer(var787, var788, var786, buffer.len(var786))
		buff = var787
		var783 = var788
	end
	local buff_1 = buffer.create(var783)
	buffer.copy(buff_1, 0, buff, 0, var783)
	
	return buff_1
end

function t_21.decode(p39) --[[ line: 8310 ]]
	-- upvalues: t_21 (ref), protoModule (ref), t (ref)
	local var790 = t_21.new()
	local var791 = 0
	while var791 < buffer.len(p39) do
		local _ = nil
		local var792 = nil
		local var793, var794, var795 = protoModule.readTag(p39, var791)
		local var796 = var793
		var792 = var794
		var791 = var795
		
		if var792 == protoModule.wireTypes.varint then
			if var796 == 1 then
				local _ = nil
				local var797, var798 = protoModule.readVarIntI32(p39, var791)
				local var799 = var797
				var791 = var798
				var790.action_type = t.ActionType.fromNumber(var799) or var799
			else
				local _ = nil
				local var800, var801 = protoModule.readVarInt(p39, var791)
				local _ = var800
				var791 = var801
			end
		end
		if var792 == protoModule.wireTypes.lengthDelimited then
			if var796 == 2 then
				local _ = nil
				local var802, var803 = protoModule.readBuffer(p39, var791)
				var791 = var803
				var790.action_params = t.OpenTooltipAction_Params.decode(var802)
			else
				local _ = nil
				local var804, var805 = protoModule.readVarInt(p39, var791)
				var791 = var805 + var804
			end
		elseif var792 == protoModule.wireTypes.i32 then
			local _ = nil
			local var806, var807 = protoModule.readFixed32(p39, var791)
			local _ = var806
			var791 = var807
		elseif var792 == protoModule.wireTypes.i64 then
			local _ = nil
			local var808, var809 = protoModule.readFixed64(p39, var791)
			local _ = var808
			var791 = var809
		else
			error("Unsupported wire type: " .. var792)
		end
	end
	return var790
end

function t_21:jsonEncode() --[[ line: 8358 ]]
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

function t_21:jsonDecode() --[[ line: 8380 ]]
	-- upvalues: t_21 (ref), t (ref)
	local var811 = t_21.new()
	
	if self.action_type ~= nil then
		var811.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var811.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var811.action_params = t.OpenTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var811.action_params = t.OpenTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return var811
end

t_21.descriptor = {
	name = "OpenTooltipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenTooltipAction"
}
t.OpenTooltipAction = t_21
typeRegistryModule.default:register(t.OpenTooltipAction)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p40) --[[ line: 8420 ]]
	-- upvalues: t_22 (ref)
	return setmetatable({
		tooltip_title = if p40 == nil or p40.tooltip_title == nil then nil else p40.tooltip_title,
		tooltip_info_text = if p40 == nil or p40.tooltip_info_text == nil then nil else p40.tooltip_info_text
	}, t_22)
end

function t_22:encode() --[[ line: 8427 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var813 = 0
	
	if self.tooltip_title ~= nil then
		local var814 = self.tooltip_title:encode()
		local var815, var816 = protoModule.writeTag(buff, var813, 1, protoModule.wireTypes.lengthDelimited)
		var815, var816 = protoModule.writeBuffer(var815, var816, var814, buffer.len(var814))
		buff = var815
		var813 = var816
	end
	if self.tooltip_info_text ~= nil then
		local var817 = self.tooltip_info_text:encode()
		local var818, var819 = protoModule.writeTag(buff, var813, 2, protoModule.wireTypes.lengthDelimited)
		var818, var819 = protoModule.writeBuffer(var818, var819, var817, buffer.len(var817))
		buff = var818
		var813 = var819
	end
	local buff_1 = buffer.create(var813)
	buffer.copy(buff_1, 0, buff, 0, var813)
	
	return buff_1
end

function t_22.decode(p41) --[[ line: 8448 ]]
	-- upvalues: t_22 (ref), protoModule (ref), propTypesModule (ref)
	local var821 = t_22.new()
	local var822 = 0
	while var822 < buffer.len(p41) do
		local _ = nil
		local var823 = nil
		local var824, var825, var826 = protoModule.readTag(p41, var822)
		local var827 = var824
		var823 = var825
		var822 = var826
		
		if var823 == protoModule.wireTypes.varint then
			local _ = nil
			local var828, var829 = protoModule.readVarInt(p41, var822)
			local _ = var828
			var822 = var829
			continue
		end
		if var823 == protoModule.wireTypes.lengthDelimited then
			if var827 == 1 then
				local _ = nil
				local var830, var831 = protoModule.readBuffer(p41, var822)
				var822 = var831
				var821.tooltip_title = propTypesModule.StringProp.decode(var830)
			elseif var827 == 2 then
				local _ = nil
				local var832, var833 = protoModule.readBuffer(p41, var822)
				var822 = var833
				var821.tooltip_info_text = propTypesModule.StringProp.decode(var832)
			else
				local _ = nil
				local var834, var835 = protoModule.readVarInt(p41, var822)
				var822 = var835 + var834
			end
		elseif var823 == protoModule.wireTypes.i32 then
			local _ = nil
			local var836, var837 = protoModule.readFixed32(p41, var822)
			local _ = var836
			var822 = var837
		elseif var823 == protoModule.wireTypes.i64 then
			local _ = nil
			local var838, var839 = protoModule.readFixed64(p41, var822)
			local _ = var838
			var822 = var839
		else
			error("Unsupported wire type: " .. var823)
		end
	end
	return var821
end

function t_22:jsonEncode() --[[ line: 8496 ]]
	local t = {}
	
	if self.tooltip_title ~= nil then
		t.tooltipTitle = self.tooltip_title:jsonEncode()
	end
	if self.tooltip_info_text ~= nil then
		t.tooltipInfoText = self.tooltip_info_text:jsonEncode()
	end
	return t
end

function t_22:jsonDecode() --[[ line: 8510 ]]
	-- upvalues: t_22 (ref), propTypesModule (ref)
	local var841 = t_22.new()
	
	if self.tooltip_title ~= nil then
		var841.tooltip_title = propTypesModule.StringProp.jsonDecode(self.tooltip_title)
	end
	if self.tooltipTitle ~= nil then
		var841.tooltip_title = propTypesModule.StringProp.jsonDecode(self.tooltipTitle)
	end
	if self.tooltip_info_text ~= nil then
		var841.tooltip_info_text = propTypesModule.StringProp.jsonDecode(self.tooltip_info_text)
	end
	if self.tooltipInfoText ~= nil then
		var841.tooltip_info_text = propTypesModule.StringProp.jsonDecode(self.tooltipInfoText)
	end
	return var841
end

t_22.descriptor = {
	name = "OpenTooltipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenTooltipAction_Params = t_22
typeRegistryModule.default:register(t.OpenTooltipAction_Params)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p42) --[[ line: 8550 ]]
	-- upvalues: t (ref), t_23 (ref)
	return setmetatable({
		action_type = if p42 == nil or p42.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p42.action_type,
		action_params = if p42 == nil or p42.action_params == nil then nil else p42.action_params
	}, t_23)
end

function t_23:encode() --[[ line: 8559 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var843 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var844, var845 = protoModule.writeTag(buff, var843, 1, protoModule.wireTypes.varint)
		var844, var845 = protoModule.writeVarInt(var844, var845, t.ActionType.toNumber(self.action_type))
		buff = var844
		var843 = var845
	end
	if self.action_params ~= nil then
		local var846 = self.action_params:encode()
		local var847, var848 = protoModule.writeTag(buff, var843, 2, protoModule.wireTypes.lengthDelimited)
		var847, var848 = protoModule.writeBuffer(var847, var848, var846, buffer.len(var846))
		buff = var847
		var843 = var848
	end
	local buff_1 = buffer.create(var843)
	buffer.copy(buff_1, 0, buff, 0, var843)
	
	return buff_1
end

function t_23.decode(p43) --[[ line: 8585 ]]
	-- upvalues: t_23 (ref), protoModule (ref), t (ref)
	local var850 = t_23.new()
	local var851 = 0
	while var851 < buffer.len(p43) do
		local _ = nil
		local var852 = nil
		local var853, var854, var855 = protoModule.readTag(p43, var851)
		local var856 = var853
		var852 = var854
		var851 = var855
		
		if var852 == protoModule.wireTypes.varint then
			if var856 == 1 then
				local _ = nil
				local var857, var858 = protoModule.readVarIntI32(p43, var851)
				local var859 = var857
				var851 = var858
				var850.action_type = t.ActionType.fromNumber(var859) or var859
			else
				local _ = nil
				local var860, var861 = protoModule.readVarInt(p43, var851)
				local _ = var860
				var851 = var861
			end
		end
		if var852 == protoModule.wireTypes.lengthDelimited then
			if var856 == 2 then
				local _ = nil
				local var862, var863 = protoModule.readBuffer(p43, var851)
				var851 = var863
				var850.action_params = t.OpenBadgeDetailsAction_Params.decode(var862)
			else
				local _ = nil
				local var864, var865 = protoModule.readVarInt(p43, var851)
				var851 = var865 + var864
			end
		elseif var852 == protoModule.wireTypes.i32 then
			local _ = nil
			local var866, var867 = protoModule.readFixed32(p43, var851)
			local _ = var866
			var851 = var867
		elseif var852 == protoModule.wireTypes.i64 then
			local _ = nil
			local var868, var869 = protoModule.readFixed64(p43, var851)
			local _ = var868
			var851 = var869
		else
			error("Unsupported wire type: " .. var852)
		end
	end
	return var850
end

function t_23:jsonEncode() --[[ line: 8633 ]]
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

function t_23:jsonDecode() --[[ line: 8655 ]]
	-- upvalues: t_23 (ref), t (ref)
	local var871 = t_23.new()
	
	if self.action_type ~= nil then
		var871.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var871.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var871.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var871.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var871
end

t_23.descriptor = {
	name = "OpenBadgeDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgeDetailsAction"
}
t.OpenBadgeDetailsAction = t_23
typeRegistryModule.default:register(t.OpenBadgeDetailsAction)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p44) --[[ line: 8695 ]]
	-- upvalues: t_24 (ref)
	return setmetatable({
		badge_id = if p44 == nil or p44.badge_id == nil then nil else p44.badge_id,
		title_text = if p44 == nil or p44.title_text == nil then nil else p44.title_text
	}, t_24)
end

function t_24:encode() --[[ line: 8704 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var873 = 0
	
	if self.badge_id ~= nil then
		local var874 = self.badge_id:encode()
		local var875, var876 = protoModule.writeTag(buff, var873, 1, protoModule.wireTypes.lengthDelimited)
		var875, var876 = protoModule.writeBuffer(var875, var876, var874, buffer.len(var874))
		buff = var875
		var873 = var876
	end
	if self.title_text ~= nil then
		local var877 = self.title_text:encode()
		local var878, var879 = protoModule.writeTag(buff, var873, 2, protoModule.wireTypes.lengthDelimited)
		var878, var879 = protoModule.writeBuffer(var878, var879, var877, buffer.len(var877))
		buff = var878
		var873 = var879
	end
	local buff_1 = buffer.create(var873)
	buffer.copy(buff_1, 0, buff, 0, var873)
	
	return buff_1
end

function t_24.decode(p45) --[[ line: 8725 ]]
	-- upvalues: t_24 (ref), protoModule (ref), propTypesModule (ref)
	local var881 = t_24.new()
	local var882 = 0
	while var882 < buffer.len(p45) do
		local _ = nil
		local var883 = nil
		local var884, var885, var886 = protoModule.readTag(p45, var882)
		local var887 = var884
		var883 = var885
		var882 = var886
		
		if var883 == protoModule.wireTypes.varint then
			local _ = nil
			local var888, var889 = protoModule.readVarInt(p45, var882)
			local _ = var888
			var882 = var889
			continue
		end
		if var883 == protoModule.wireTypes.lengthDelimited then
			if var887 == 1 then
				local _ = nil
				local var890, var891 = protoModule.readBuffer(p45, var882)
				var882 = var891
				var881.badge_id = propTypesModule.StringProp.decode(var890)
			elseif var887 == 2 then
				local _ = nil
				local var892, var893 = protoModule.readBuffer(p45, var882)
				var882 = var893
				var881.title_text = propTypesModule.StringProp.decode(var892)
			else
				local _ = nil
				local var894, var895 = protoModule.readVarInt(p45, var882)
				var882 = var895 + var894
			end
		elseif var883 == protoModule.wireTypes.i32 then
			local _ = nil
			local var896, var897 = protoModule.readFixed32(p45, var882)
			local _ = var896
			var882 = var897
		elseif var883 == protoModule.wireTypes.i64 then
			local _ = nil
			local var898, var899 = protoModule.readFixed64(p45, var882)
			local _ = var898
			var882 = var899
		else
			error("Unsupported wire type: " .. var883)
		end
	end
	return var881
end

function t_24:jsonEncode() --[[ line: 8773 ]]
	local t = {}
	
	if self.badge_id ~= nil then
		t.badgeId = self.badge_id:jsonEncode()
	end
	if self.title_text ~= nil then
		t.titleText = self.title_text:jsonEncode()
	end
	return t
end

function t_24:jsonDecode() --[[ line: 8787 ]]
	-- upvalues: t_24 (ref), propTypesModule (ref)
	local var901 = t_24.new()
	
	if self.badge_id ~= nil then
		var901.badge_id = propTypesModule.StringProp.jsonDecode(self.badge_id)
	end
	if self.badgeId ~= nil then
		var901.badge_id = propTypesModule.StringProp.jsonDecode(self.badgeId)
	end
	if self.title_text ~= nil then
		var901.title_text = propTypesModule.StringProp.jsonDecode(self.title_text)
	end
	if self.titleText ~= nil then
		var901.title_text = propTypesModule.StringProp.jsonDecode(self.titleText)
	end
	return var901
end

t_24.descriptor = {
	name = "OpenBadgeDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenBadgeDetailsAction_Params = t_24
typeRegistryModule.default:register(t.OpenBadgeDetailsAction_Params)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p46) --[[ line: 8823 ]]
	-- upvalues: t (ref), t_25 (ref)
	return setmetatable({
		action_type = if p46 == nil or p46.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p46.action_type,
		action_params = if p46 == nil or p46.action_params == nil then nil else p46.action_params
	}, t_25)
end

function t_25:encode() --[[ line: 8832 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var903 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var904, var905 = protoModule.writeTag(buff, var903, 1, protoModule.wireTypes.varint)
		var904, var905 = protoModule.writeVarInt(var904, var905, t.ActionType.toNumber(self.action_type))
		buff = var904
		var903 = var905
	end
	if self.action_params ~= nil then
		local var906 = self.action_params:encode()
		local var907, var908 = protoModule.writeTag(buff, var903, 2, protoModule.wireTypes.lengthDelimited)
		var907, var908 = protoModule.writeBuffer(var907, var908, var906, buffer.len(var906))
		buff = var907
		var903 = var908
	end
	local buff_1 = buffer.create(var903)
	buffer.copy(buff_1, 0, buff, 0, var903)
	
	return buff_1
end

function t_25.decode(p47) --[[ line: 8858 ]]
	-- upvalues: t_25 (ref), protoModule (ref), t (ref)
	local var910 = t_25.new()
	local var911 = 0
	while var911 < buffer.len(p47) do
		local _ = nil
		local var912 = nil
		local var913, var914, var915 = protoModule.readTag(p47, var911)
		local var916 = var913
		var912 = var914
		var911 = var915
		
		if var912 == protoModule.wireTypes.varint then
			if var916 == 1 then
				local _ = nil
				local var917, var918 = protoModule.readVarIntI32(p47, var911)
				local var919 = var917
				var911 = var918
				var910.action_type = t.ActionType.fromNumber(var919) or var919
			else
				local _ = nil
				local var920, var921 = protoModule.readVarInt(p47, var911)
				local _ = var920
				var911 = var921
			end
		end
		if var912 == protoModule.wireTypes.lengthDelimited then
			if var916 == 2 then
				local _ = nil
				local var922, var923 = protoModule.readBuffer(p47, var911)
				var911 = var923
				var910.action_params = t.LoadMoreFromApiAction_Params.decode(var922)
			else
				local _ = nil
				local var924, var925 = protoModule.readVarInt(p47, var911)
				var911 = var925 + var924
			end
		elseif var912 == protoModule.wireTypes.i32 then
			local _ = nil
			local var926, var927 = protoModule.readFixed32(p47, var911)
			local _ = var926
			var911 = var927
		elseif var912 == protoModule.wireTypes.i64 then
			local _ = nil
			local var928, var929 = protoModule.readFixed64(p47, var911)
			local _ = var928
			var911 = var929
		else
			error("Unsupported wire type: " .. var912)
		end
	end
	return var910
end

function t_25:jsonEncode() --[[ line: 8906 ]]
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

function t_25:jsonDecode() --[[ line: 8928 ]]
	-- upvalues: t_25 (ref), t (ref)
	local var931 = t_25.new()
	
	if self.action_type ~= nil then
		var931.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var931.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var931.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var931.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var931
end

t_25.descriptor = {
	name = "LoadMoreFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LoadMoreFromApiAction"
}
t.LoadMoreFromApiAction = t_25
typeRegistryModule.default:register(t.LoadMoreFromApiAction)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p48) --[[ line: 8968 ]]
	-- upvalues: t_26 (ref)
	return setmetatable({
		surface_key = if p48 == nil or p48.surface_key == nil then nil else p48.surface_key,
		config_key = if p48 == nil or p48.config_key == nil then nil else p48.config_key
	}, t_26)
end

function t_26:encode() --[[ line: 8977 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var933 = 0
	
	if self.surface_key ~= nil then
		local var934 = self.surface_key:encode()
		local var935, var936 = protoModule.writeTag(buff, var933, 1, protoModule.wireTypes.lengthDelimited)
		var935, var936 = protoModule.writeBuffer(var935, var936, var934, buffer.len(var934))
		buff = var935
		var933 = var936
	end
	if self.config_key ~= nil then
		local var937 = self.config_key:encode()
		local var938, var939 = protoModule.writeTag(buff, var933, 2, protoModule.wireTypes.lengthDelimited)
		var938, var939 = protoModule.writeBuffer(var938, var939, var937, buffer.len(var937))
		buff = var938
		var933 = var939
	end
	local buff_1 = buffer.create(var933)
	buffer.copy(buff_1, 0, buff, 0, var933)
	
	return buff_1
end

function t_26.decode(p49) --[[ line: 8998 ]]
	-- upvalues: t_26 (ref), protoModule (ref), propTypesModule (ref)
	local var941 = t_26.new()
	local var942 = 0
	while var942 < buffer.len(p49) do
		local _ = nil
		local var943 = nil
		local var944, var945, var946 = protoModule.readTag(p49, var942)
		local var947 = var944
		var943 = var945
		var942 = var946
		
		if var943 == protoModule.wireTypes.varint then
			local _ = nil
			local var948, var949 = protoModule.readVarInt(p49, var942)
			local _ = var948
			var942 = var949
			continue
		end
		if var943 == protoModule.wireTypes.lengthDelimited then
			if var947 == 1 then
				local _ = nil
				local var950, var951 = protoModule.readBuffer(p49, var942)
				var942 = var951
				var941.surface_key = propTypesModule.StringProp.decode(var950)
			elseif var947 == 2 then
				local _ = nil
				local var952, var953 = protoModule.readBuffer(p49, var942)
				var942 = var953
				var941.config_key = propTypesModule.StringProp.decode(var952)
			else
				local _ = nil
				local var954, var955 = protoModule.readVarInt(p49, var942)
				var942 = var955 + var954
			end
		elseif var943 == protoModule.wireTypes.i32 then
			local _ = nil
			local var956, var957 = protoModule.readFixed32(p49, var942)
			local _ = var956
			var942 = var957
		elseif var943 == protoModule.wireTypes.i64 then
			local _ = nil
			local var958, var959 = protoModule.readFixed64(p49, var942)
			local _ = var958
			var942 = var959
		else
			error("Unsupported wire type: " .. var943)
		end
	end
	return var941
end

function t_26:jsonEncode() --[[ line: 9046 ]]
	local t = {}
	
	if self.surface_key ~= nil then
		t.surfaceKey = self.surface_key:jsonEncode()
	end
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	return t
end

function t_26:jsonDecode() --[[ line: 9060 ]]
	-- upvalues: t_26 (ref), propTypesModule (ref)
	local var961 = t_26.new()
	
	if self.surface_key ~= nil then
		var961.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var961.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		var961.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var961.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return var961
end

t_26.descriptor = {
	name = "LoadMoreFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LoadMoreFromApiAction_Params = t_26
typeRegistryModule.default:register(t.LoadMoreFromApiAction_Params)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p50) --[[ line: 9097 ]]
	-- upvalues: t (ref), t_27 (ref)
	return setmetatable({
		action_type = if p50 == nil or p50.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p50.action_type,
		action_params = if p50 == nil or p50.action_params == nil then nil else p50.action_params
	}, t_27)
end

function t_27:encode() --[[ line: 9106 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var963 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var964, var965 = protoModule.writeTag(buff, var963, 1, protoModule.wireTypes.varint)
		var964, var965 = protoModule.writeVarInt(var964, var965, t.ActionType.toNumber(self.action_type))
		buff = var964
		var963 = var965
	end
	if self.action_params ~= nil then
		local var966 = self.action_params:encode()
		local var967, var968 = protoModule.writeTag(buff, var963, 2, protoModule.wireTypes.lengthDelimited)
		var967, var968 = protoModule.writeBuffer(var967, var968, var966, buffer.len(var966))
		buff = var967
		var963 = var968
	end
	local buff_1 = buffer.create(var963)
	buffer.copy(buff_1, 0, buff, 0, var963)
	
	return buff_1
end

function t_27.decode(p51) --[[ line: 9132 ]]
	-- upvalues: t_27 (ref), protoModule (ref), t (ref)
	local var970 = t_27.new()
	local var971 = 0
	while var971 < buffer.len(p51) do
		local _ = nil
		local var972 = nil
		local var973, var974, var975 = protoModule.readTag(p51, var971)
		local var976 = var973
		var972 = var974
		var971 = var975
		
		if var972 == protoModule.wireTypes.varint then
			if var976 == 1 then
				local _ = nil
				local var977, var978 = protoModule.readVarIntI32(p51, var971)
				local var979 = var977
				var971 = var978
				var970.action_type = t.ActionType.fromNumber(var979) or var979
			else
				local _ = nil
				local var980, var981 = protoModule.readVarInt(p51, var971)
				local _ = var980
				var971 = var981
			end
		end
		if var972 == protoModule.wireTypes.lengthDelimited then
			if var976 == 2 then
				local _ = nil
				local var982, var983 = protoModule.readBuffer(p51, var971)
				var971 = var983
				var970.action_params = t.ShareAction_Params.decode(var982)
			else
				local _ = nil
				local var984, var985 = protoModule.readVarInt(p51, var971)
				var971 = var985 + var984
			end
		elseif var972 == protoModule.wireTypes.i32 then
			local _ = nil
			local var986, var987 = protoModule.readFixed32(p51, var971)
			local _ = var986
			var971 = var987
		elseif var972 == protoModule.wireTypes.i64 then
			local _ = nil
			local var988, var989 = protoModule.readFixed64(p51, var971)
			local _ = var988
			var971 = var989
		else
			error("Unsupported wire type: " .. var972)
		end
	end
	return var970
end

function t_27:jsonEncode() --[[ line: 9180 ]]
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

function t_27:jsonDecode() --[[ line: 9202 ]]
	-- upvalues: t_27 (ref), t (ref)
	local var991 = t_27.new()
	
	if self.action_type ~= nil then
		var991.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var991.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var991.action_params = t.ShareAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var991.action_params = t.ShareAction_Params.jsonDecode(self.actionParams)
	end
	return var991
end

t_27.descriptor = {
	name = "ShareAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareAction"
}
t.ShareAction = t_27
typeRegistryModule.default:register(t.ShareAction)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p52) --[[ line: 9242 ]]
	-- upvalues: t_28 (ref)
	return setmetatable({
		oneof_prop = if p52 == nil or p52.oneof_prop == nil then nil else p52.oneof_prop
	}, t_28)
end

function t_28:encode() --[[ line: 9250 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var993 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "generic_share_link_data" then
			local var994 = self.oneof_prop.value:encode()
			local var995, var996 = protoModule.writeTag(buff, var993, 1, protoModule.wireTypes.lengthDelimited)
			var995, var996 = protoModule.writeBuffer(var995, var996, var994, buffer.len(var994))
			buff = var995
			var993 = var996
		elseif self.oneof_prop.type == "share_link_fetch_data" then
			local var997 = self.oneof_prop.value:encode()
			local var998, var999 = protoModule.writeTag(buff, var993, 2, protoModule.wireTypes.lengthDelimited)
			var998, var999 = protoModule.writeBuffer(var998, var999, var997, buffer.len(var997))
			buff = var998
			var993 = var999
		end
	end
	local buff_1 = buffer.create(var993)
	buffer.copy(buff_1, 0, buff, 0, var993)
	
	return buff_1
end

function t_28.decode(p53) --[[ line: 9271 ]]
	-- upvalues: t_28 (ref), protoModule (ref), shareLinkDataModule (ref)
	local var1001 = t_28.new()
	local var1002 = 0
	while var1002 < buffer.len(p53) do
		local _ = nil
		local var1003 = nil
		local var1004, var1005, var1006 = protoModule.readTag(p53, var1002)
		local var1007 = var1004
		var1003 = var1005
		var1002 = var1006
		
		if var1003 == protoModule.wireTypes.varint then
			local _ = nil
			local var1008, var1009 = protoModule.readVarInt(p53, var1002)
			local _ = var1008
			var1002 = var1009
			continue
		end
		if var1003 == protoModule.wireTypes.lengthDelimited then
			if var1007 == 1 then
				local _ = nil
				local var1010, var1011 = protoModule.readBuffer(p53, var1002)
				var1002 = var1011
				var1001.oneof_prop = {
					type = "generic_share_link_data",
					value = shareLinkDataModule.GenericShareLinkData.decode(var1010)
				}
			elseif var1007 == 2 then
				local _ = nil
				local var1012, var1013 = protoModule.readBuffer(p53, var1002)
				var1002 = var1013
				var1001.oneof_prop = {
					type = "share_link_fetch_data",
					value = shareLinkDataModule.ShareLinkFetchData.decode(var1012)
				}
			else
				local _ = nil
				local var1014, var1015 = protoModule.readVarInt(p53, var1002)
				var1002 = var1015 + var1014
			end
		elseif var1003 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1016, var1017 = protoModule.readFixed32(p53, var1002)
			local _ = var1016
			var1002 = var1017
		elseif var1003 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1018, var1019 = protoModule.readFixed64(p53, var1002)
			local _ = var1018
			var1002 = var1019
		else
			error("Unsupported wire type: " .. var1003)
		end
	end
	return var1001
end

function t_28:jsonEncode() --[[ line: 9327 ]]
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

function t_28:jsonDecode() --[[ line: 9341 ]]
	-- upvalues: t_28 (ref), shareLinkDataModule (ref)
	local var1021 = t_28.new()
	
	if self.generic_share_link_data ~= nil then
		var1021.oneof_prop = {
			type = "generic_share_link_data",
			value = shareLinkDataModule.GenericShareLinkData.jsonDecode(self.generic_share_link_data)
		}
	end
	if self.genericShareLinkData ~= nil then
		var1021.oneof_prop = {
			type = "generic_share_link_data",
			value = shareLinkDataModule.GenericShareLinkData.jsonDecode(self.genericShareLinkData)
		}
	end
	if self.share_link_fetch_data ~= nil then
		var1021.oneof_prop = {
			type = "share_link_fetch_data",
			value = shareLinkDataModule.ShareLinkFetchData.jsonDecode(self.share_link_fetch_data)
		}
	end
	if self.shareLinkFetchData ~= nil then
		var1021.oneof_prop = {
			type = "share_link_fetch_data",
			value = shareLinkDataModule.ShareLinkFetchData.jsonDecode(self.shareLinkFetchData)
		}
	end
	return var1021
end

t_28.descriptor = {
	name = "ShareAction_ShareLinkData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkData"
}
t.ShareAction_ShareLinkData = t_28
typeRegistryModule.default:register(t.ShareAction_ShareLinkData)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p54) --[[ line: 9397 ]]
	-- upvalues: t_29 (ref)
	return setmetatable({
		share_link_type = if p54 == nil or p54.share_link_type == nil then nil else p54.share_link_type,
		share_link_data = if p54 == nil or p54.share_link_data == nil then nil else p54.share_link_data,
		entry_point_key = if p54 == nil or p54.entry_point_key == nil then nil else p54.entry_point_key
	}, t_29)
end

function t_29:encode() --[[ line: 9405 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1023 = 0
	
	if self.share_link_type ~= nil then
		local var1024 = self.share_link_type:encode()
		local var1025, var1026 = protoModule.writeTag(buff, var1023, 1, protoModule.wireTypes.lengthDelimited)
		var1025, var1026 = protoModule.writeBuffer(var1025, var1026, var1024, buffer.len(var1024))
		buff = var1025
		var1023 = var1026
	end
	if self.share_link_data ~= nil then
		local var1027 = self.share_link_data:encode()
		local var1028, var1029 = protoModule.writeTag(buff, var1023, 2, protoModule.wireTypes.lengthDelimited)
		var1028, var1029 = protoModule.writeBuffer(var1028, var1029, var1027, buffer.len(var1027))
		buff = var1028
		var1023 = var1029
	end
	if self.entry_point_key ~= nil then
		local var1030 = self.entry_point_key:encode()
		local var1031, var1032 = protoModule.writeTag(buff, var1023, 3, protoModule.wireTypes.lengthDelimited)
		var1031, var1032 = protoModule.writeBuffer(var1031, var1032, var1030, buffer.len(var1030))
		buff = var1031
		var1023 = var1032
	end
	local buff_1 = buffer.create(var1023)
	buffer.copy(buff_1, 0, buff, 0, var1023)
	
	return buff_1
end

function t_29.decode(p55) --[[ line: 9432 ]]
	-- upvalues: t_29 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1034 = t_29.new()
	local var1035 = 0
	while var1035 < buffer.len(p55) do
		local _ = nil
		local var1036 = nil
		local var1037, var1038, var1039 = protoModule.readTag(p55, var1035)
		local var1040 = var1037
		var1036 = var1038
		var1035 = var1039
		
		if var1036 == protoModule.wireTypes.varint then
			local _ = nil
			local var1041, var1042 = protoModule.readVarInt(p55, var1035)
			local _ = var1041
			var1035 = var1042
			continue
		end
		if var1036 == protoModule.wireTypes.lengthDelimited then
			if var1040 == 1 then
				local _ = nil
				local var1043, var1044 = protoModule.readBuffer(p55, var1035)
				var1035 = var1044
				var1034.share_link_type = propTypesModule.StringProp.decode(var1043)
			elseif var1040 == 2 then
				local _ = nil
				local var1045, var1046 = protoModule.readBuffer(p55, var1035)
				var1035 = var1046
				var1034.share_link_data = t.ShareAction_ShareLinkData.decode(var1045)
			elseif var1040 == 3 then
				local _ = nil
				local var1047, var1048 = protoModule.readBuffer(p55, var1035)
				var1035 = var1048
				var1034.entry_point_key = propTypesModule.StringProp.decode(var1047)
			else
				local _ = nil
				local var1049, var1050 = protoModule.readVarInt(p55, var1035)
				var1035 = var1050 + var1049
			end
		elseif var1036 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1051, var1052 = protoModule.readFixed32(p55, var1035)
			local _ = var1051
			var1035 = var1052
		elseif var1036 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1053, var1054 = protoModule.readFixed64(p55, var1035)
			local _ = var1053
			var1035 = var1054
		else
			error("Unsupported wire type: " .. var1036)
		end
	end
	return var1034
end

function t_29:jsonEncode() --[[ line: 9485 ]]
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

function t_29:jsonDecode() --[[ line: 9503 ]]
	-- upvalues: t_29 (ref), propTypesModule (ref), t (ref)
	local var1056 = t_29.new()
	
	if self.share_link_type ~= nil then
		var1056.share_link_type = propTypesModule.StringProp.jsonDecode(self.share_link_type)
	end
	if self.shareLinkType ~= nil then
		var1056.share_link_type = propTypesModule.StringProp.jsonDecode(self.shareLinkType)
	end
	if self.share_link_data ~= nil then
		var1056.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.share_link_data)
	end
	if self.shareLinkData ~= nil then
		var1056.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.shareLinkData)
	end
	if self.entry_point_key ~= nil then
		var1056.entry_point_key = propTypesModule.StringProp.jsonDecode(self.entry_point_key)
	end
	if self.entryPointKey ~= nil then
		var1056.entry_point_key = propTypesModule.StringProp.jsonDecode(self.entryPointKey)
	end
	return var1056
end

t_29.descriptor = {
	name = "ShareAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ShareAction_Params = t_29
typeRegistryModule.default:register(t.ShareAction_Params)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p56) --[[ line: 9551 ]]
	-- upvalues: t (ref), t_30 (ref)
	return setmetatable({
		action_type = if p56 == nil or p56.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p56.action_type,
		action_params = if p56 == nil or p56.action_params == nil then nil else p56.action_params
	}, t_30)
end

function t_30:encode() --[[ line: 9560 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1058 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1059, var1060 = protoModule.writeTag(buff, var1058, 1, protoModule.wireTypes.varint)
		var1059, var1060 = protoModule.writeVarInt(var1059, var1060, t.ActionType.toNumber(self.action_type))
		buff = var1059
		var1058 = var1060
	end
	if self.action_params ~= nil then
		local var1061 = self.action_params:encode()
		local var1062, var1063 = protoModule.writeTag(buff, var1058, 2, protoModule.wireTypes.lengthDelimited)
		var1062, var1063 = protoModule.writeBuffer(var1062, var1063, var1061, buffer.len(var1061))
		buff = var1062
		var1058 = var1063
	end
	local buff_1 = buffer.create(var1058)
	buffer.copy(buff_1, 0, buff, 0, var1058)
	
	return buff_1
end

function t_30.decode(p57) --[[ line: 9586 ]]
	-- upvalues: t_30 (ref), protoModule (ref), t (ref)
	local var1065 = t_30.new()
	local var1066 = 0
	while var1066 < buffer.len(p57) do
		local _ = nil
		local var1067 = nil
		local var1068, var1069, var1070 = protoModule.readTag(p57, var1066)
		local var1071 = var1068
		var1067 = var1069
		var1066 = var1070
		
		if var1067 == protoModule.wireTypes.varint then
			if var1071 == 1 then
				local _ = nil
				local var1072, var1073 = protoModule.readVarIntI32(p57, var1066)
				local var1074 = var1072
				var1066 = var1073
				var1065.action_type = t.ActionType.fromNumber(var1074) or var1074
			else
				local _ = nil
				local var1075, var1076 = protoModule.readVarInt(p57, var1066)
				local _ = var1075
				var1066 = var1076
			end
		end
		if var1067 == protoModule.wireTypes.lengthDelimited then
			if var1071 == 2 then
				local _ = nil
				local var1077, var1078 = protoModule.readBuffer(p57, var1066)
				var1066 = var1078
				var1065.action_params = t.OpenAbuseReportAction_Params.decode(var1077)
			else
				local _ = nil
				local var1079, var1080 = protoModule.readVarInt(p57, var1066)
				var1066 = var1080 + var1079
			end
		elseif var1067 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1081, var1082 = protoModule.readFixed32(p57, var1066)
			local _ = var1081
			var1066 = var1082
		elseif var1067 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1083, var1084 = protoModule.readFixed64(p57, var1066)
			local _ = var1083
			var1066 = var1084
		else
			error("Unsupported wire type: " .. var1067)
		end
	end
	return var1065
end

function t_30:jsonEncode() --[[ line: 9634 ]]
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

function t_30:jsonDecode() --[[ line: 9656 ]]
	-- upvalues: t_30 (ref), t (ref)
	local var1086 = t_30.new()
	
	if self.action_type ~= nil then
		var1086.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1086.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1086.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1086.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.actionParams)
	end
	return var1086
end

t_30.descriptor = {
	name = "OpenAbuseReportAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAbuseReportAction"
}
t.OpenAbuseReportAction = t_30
typeRegistryModule.default:register(t.OpenAbuseReportAction)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p58) --[[ line: 9696 ]]
	-- upvalues: t_31 (ref)
	return setmetatable({
		target_id = if p58 == nil or p58.target_id == nil then nil else p58.target_id,
		abuse_vector = if p58 == nil or p58.abuse_vector == nil then nil else p58.abuse_vector,
		asset_type_name = if p58 == nil or p58.asset_type_name == nil then nil else p58.asset_type_name,
		universe_id = if p58 == nil or p58.universe_id == nil then nil else p58.universe_id
	}, t_31)
end

function t_31:encode() --[[ line: 9707 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1088 = 0
	
	if self.target_id ~= nil then
		local var1089 = self.target_id:encode()
		local var1090, var1091 = protoModule.writeTag(buff, var1088, 1, protoModule.wireTypes.lengthDelimited)
		var1090, var1091 = protoModule.writeBuffer(var1090, var1091, var1089, buffer.len(var1089))
		buff = var1090
		var1088 = var1091
	end
	if self.abuse_vector ~= nil then
		local var1092 = self.abuse_vector:encode()
		local var1093, var1094 = protoModule.writeTag(buff, var1088, 2, protoModule.wireTypes.lengthDelimited)
		var1093, var1094 = protoModule.writeBuffer(var1093, var1094, var1092, buffer.len(var1092))
		buff = var1093
		var1088 = var1094
	end
	if self.asset_type_name ~= nil then
		local var1095 = self.asset_type_name:encode()
		local var1096, var1097 = protoModule.writeTag(buff, var1088, 3, protoModule.wireTypes.lengthDelimited)
		var1096, var1097 = protoModule.writeBuffer(var1096, var1097, var1095, buffer.len(var1095))
		buff = var1096
		var1088 = var1097
	end
	if self.universe_id ~= nil then
		local var1098 = self.universe_id:encode()
		local var1099, var1100 = protoModule.writeTag(buff, var1088, 4, protoModule.wireTypes.lengthDelimited)
		var1099, var1100 = protoModule.writeBuffer(var1099, var1100, var1098, buffer.len(var1098))
		buff = var1099
		var1088 = var1100
	end
	local buff_1 = buffer.create(var1088)
	buffer.copy(buff_1, 0, buff, 0, var1088)
	
	return buff_1
end

function t_31.decode(p59) --[[ line: 9740 ]]
	-- upvalues: t_31 (ref), protoModule (ref), propTypesModule (ref)
	local var1102 = t_31.new()
	local var1103 = 0
	while var1103 < buffer.len(p59) do
		local _ = nil
		local var1104 = nil
		local var1105, var1106, var1107 = protoModule.readTag(p59, var1103)
		local var1108 = var1105
		var1104 = var1106
		var1103 = var1107
		
		if var1104 == protoModule.wireTypes.varint then
			local _ = nil
			local var1109, var1110 = protoModule.readVarInt(p59, var1103)
			local _ = var1109
			var1103 = var1110
			continue
		end
		if var1104 == protoModule.wireTypes.lengthDelimited then
			if var1108 == 1 then
				local _ = nil
				local var1111, var1112 = protoModule.readBuffer(p59, var1103)
				var1103 = var1112
				var1102.target_id = propTypesModule.StringProp.decode(var1111)
			elseif var1108 == 2 then
				local _ = nil
				local var1113, var1114 = protoModule.readBuffer(p59, var1103)
				var1103 = var1114
				var1102.abuse_vector = propTypesModule.StringProp.decode(var1113)
			elseif var1108 == 3 then
				local _ = nil
				local var1115, var1116 = protoModule.readBuffer(p59, var1103)
				var1103 = var1116
				var1102.asset_type_name = propTypesModule.StringProp.decode(var1115)
			elseif var1108 == 4 then
				local _ = nil
				local var1117, var1118 = protoModule.readBuffer(p59, var1103)
				var1103 = var1118
				var1102.universe_id = propTypesModule.StringProp.decode(var1117)
			else
				local _ = nil
				local var1119, var1120 = protoModule.readVarInt(p59, var1103)
				var1103 = var1120 + var1119
			end
		elseif var1104 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1121, var1122 = protoModule.readFixed32(p59, var1103)
			local _ = var1121
			var1103 = var1122
		elseif var1104 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1123, var1124 = protoModule.readFixed64(p59, var1103)
			local _ = var1123
			var1103 = var1124
		else
			error("Unsupported wire type: " .. var1104)
		end
	end
	return var1102
end

function t_31:jsonEncode() --[[ line: 9798 ]]
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

function t_31:jsonDecode() --[[ line: 9820 ]]
	-- upvalues: t_31 (ref), propTypesModule (ref)
	local var1126 = t_31.new()
	
	if self.target_id ~= nil then
		var1126.target_id = propTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		var1126.target_id = propTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.abuse_vector ~= nil then
		var1126.abuse_vector = propTypesModule.StringProp.jsonDecode(self.abuse_vector)
	end
	if self.abuseVector ~= nil then
		var1126.abuse_vector = propTypesModule.StringProp.jsonDecode(self.abuseVector)
	end
	if self.asset_type_name ~= nil then
		var1126.asset_type_name = propTypesModule.StringProp.jsonDecode(self.asset_type_name)
	end
	if self.assetTypeName ~= nil then
		var1126.asset_type_name = propTypesModule.StringProp.jsonDecode(self.assetTypeName)
	end
	if self.universe_id ~= nil then
		var1126.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1126.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1126
end

t_31.descriptor = {
	name = "OpenAbuseReportAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAbuseReportAction_Params = t_31
typeRegistryModule.default:register(t.OpenAbuseReportAction_Params)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p60) --[[ line: 9877 ]]
	-- upvalues: t (ref), t_32 (ref)
	return setmetatable({
		action_type = if p60 == nil or p60.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p60.action_type,
		action_params = if p60 == nil or p60.action_params == nil then nil else p60.action_params
	}, t_32)
end

function t_32:encode() --[[ line: 9888 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1128 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1129, var1130 = protoModule.writeTag(buff, var1128, 1, protoModule.wireTypes.varint)
		var1129, var1130 = protoModule.writeVarInt(var1129, var1130, t.ActionType.toNumber(self.action_type))
		buff = var1129
		var1128 = var1130
	end
	if self.action_params ~= nil then
		local var1131 = self.action_params:encode()
		local var1132, var1133 = protoModule.writeTag(buff, var1128, 2, protoModule.wireTypes.lengthDelimited)
		var1132, var1133 = protoModule.writeBuffer(var1132, var1133, var1131, buffer.len(var1131))
		buff = var1132
		var1128 = var1133
	end
	local buff_1 = buffer.create(var1128)
	buffer.copy(buff_1, 0, buff, 0, var1128)
	
	return buff_1
end

function t_32.decode(p61) --[[ line: 9914 ]]
	-- upvalues: t_32 (ref), protoModule (ref), t (ref)
	local var1135 = t_32.new()
	local var1136 = 0
	while var1136 < buffer.len(p61) do
		local _ = nil
		local var1137 = nil
		local var1138, var1139, var1140 = protoModule.readTag(p61, var1136)
		local var1141 = var1138
		var1137 = var1139
		var1136 = var1140
		
		if var1137 == protoModule.wireTypes.varint then
			if var1141 == 1 then
				local _ = nil
				local var1142, var1143 = protoModule.readVarIntI32(p61, var1136)
				local var1144 = var1142
				var1136 = var1143
				var1135.action_type = t.ActionType.fromNumber(var1144) or var1144
			else
				local _ = nil
				local var1145, var1146 = protoModule.readVarInt(p61, var1136)
				local _ = var1145
				var1136 = var1146
			end
		end
		if var1137 == protoModule.wireTypes.lengthDelimited then
			if var1141 == 2 then
				local _ = nil
				local var1147, var1148 = protoModule.readBuffer(p61, var1136)
				var1136 = var1148
				var1135.action_params = t.RemoveBadgeFromInventoryAction_Params.decode(var1147)
			else
				local _ = nil
				local var1149, var1150 = protoModule.readVarInt(p61, var1136)
				var1136 = var1150 + var1149
			end
		elseif var1137 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1151, var1152 = protoModule.readFixed32(p61, var1136)
			local _ = var1151
			var1136 = var1152
		elseif var1137 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1153, var1154 = protoModule.readFixed64(p61, var1136)
			local _ = var1153
			var1136 = var1154
		else
			error("Unsupported wire type: " .. var1137)
		end
	end
	return var1135
end

function t_32:jsonEncode() --[[ line: 9962 ]]
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

function t_32:jsonDecode() --[[ line: 9984 ]]
	-- upvalues: t_32 (ref), t (ref)
	local var1156 = t_32.new()
	
	if self.action_type ~= nil then
		var1156.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1156.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1156.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1156.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.actionParams)
	end
	return var1156
end

t_32.descriptor = {
	name = "RemoveBadgeFromInventoryAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RemoveBadgeFromInventoryAction"
}
t.RemoveBadgeFromInventoryAction = t_32
typeRegistryModule.default:register(t.RemoveBadgeFromInventoryAction)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p62) --[[ line: 10024 ]]
	-- upvalues: t_33 (ref)
	return setmetatable({
		asset_id = if p62 == nil or p62.asset_id == nil then nil else p62.asset_id
	}, t_33)
end

function t_33:encode() --[[ line: 10032 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1158 = 0
	
	if self.asset_id ~= nil then
		local var1159 = self.asset_id:encode()
		local var1160, var1161 = protoModule.writeTag(buff, var1158, 1, protoModule.wireTypes.lengthDelimited)
		var1160, var1161 = protoModule.writeBuffer(var1160, var1161, var1159, buffer.len(var1159))
		buff = var1160
		var1158 = var1161
	end
	local buff_1 = buffer.create(var1158)
	buffer.copy(buff_1, 0, buff, 0, var1158)
	
	return buff_1
end

function t_33.decode(p63) --[[ line: 10047 ]]
	-- upvalues: t_33 (ref), protoModule (ref), propTypesModule (ref)
	local var1163 = t_33.new()
	local var1164 = 0
	while var1164 < buffer.len(p63) do
		local _ = nil
		local var1165 = nil
		local var1166, var1167, var1168 = protoModule.readTag(p63, var1164)
		local var1169 = var1166
		var1165 = var1167
		var1164 = var1168
		
		if var1165 == protoModule.wireTypes.varint then
			local _ = nil
			local var1170, var1171 = protoModule.readVarInt(p63, var1164)
			local _ = var1170
			var1164 = var1171
			continue
		end
		if var1165 == protoModule.wireTypes.lengthDelimited then
			if var1169 == 1 then
				local _ = nil
				local var1172, var1173 = protoModule.readBuffer(p63, var1164)
				var1164 = var1173
				var1163.asset_id = propTypesModule.StringProp.decode(var1172)
			else
				local _ = nil
				local var1174, var1175 = protoModule.readVarInt(p63, var1164)
				var1164 = var1175 + var1174
			end
		elseif var1165 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1176, var1177 = protoModule.readFixed32(p63, var1164)
			local _ = var1176
			var1164 = var1177
		elseif var1165 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1178, var1179 = protoModule.readFixed64(p63, var1164)
			local _ = var1178
			var1164 = var1179
		else
			error("Unsupported wire type: " .. var1165)
		end
	end
	return var1163
end

function t_33:jsonEncode() --[[ line: 10090 ]]
	local t = {}
	
	if self.asset_id ~= nil then
		t.assetId = self.asset_id:jsonEncode()
	end
	return t
end

function t_33:jsonDecode() --[[ line: 10100 ]]
	-- upvalues: t_33 (ref), propTypesModule (ref)
	local var1181 = t_33.new()
	
	if self.asset_id ~= nil then
		var1181.asset_id = propTypesModule.StringProp.jsonDecode(self.asset_id)
	end
	if self.assetId ~= nil then
		var1181.asset_id = propTypesModule.StringProp.jsonDecode(self.assetId)
	end
	return var1181
end

t_33.descriptor = {
	name = "RemoveBadgeFromInventoryAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RemoveBadgeFromInventoryAction_Params = t_33
typeRegistryModule.default:register(t.RemoveBadgeFromInventoryAction_Params)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p64) --[[ line: 10130 ]]
	-- upvalues: t (ref), t_34 (ref)
	return setmetatable({
		action_type = if p64 == nil or p64.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p64.action_type,
		action_params = if p64 == nil or p64.action_params == nil then nil else p64.action_params
	}, t_34)
end

function t_34:encode() --[[ line: 10139 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1183 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1184, var1185 = protoModule.writeTag(buff, var1183, 1, protoModule.wireTypes.varint)
		var1184, var1185 = protoModule.writeVarInt(var1184, var1185, t.ActionType.toNumber(self.action_type))
		buff = var1184
		var1183 = var1185
	end
	if self.action_params ~= nil then
		local var1186 = self.action_params:encode()
		local var1187, var1188 = protoModule.writeTag(buff, var1183, 2, protoModule.wireTypes.lengthDelimited)
		var1187, var1188 = protoModule.writeBuffer(var1187, var1188, var1186, buffer.len(var1186))
		buff = var1187
		var1183 = var1188
	end
	local buff_1 = buffer.create(var1183)
	buffer.copy(buff_1, 0, buff, 0, var1183)
	
	return buff_1
end

function t_34.decode(p65) --[[ line: 10165 ]]
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var1190 = t_34.new()
	local var1191 = 0
	while var1191 < buffer.len(p65) do
		local _ = nil
		local var1192 = nil
		local var1193, var1194, var1195 = protoModule.readTag(p65, var1191)
		local var1196 = var1193
		var1192 = var1194
		var1191 = var1195
		
		if var1192 == protoModule.wireTypes.varint then
			if var1196 == 1 then
				local _ = nil
				local var1197, var1198 = protoModule.readVarIntI32(p65, var1191)
				local var1199 = var1197
				var1191 = var1198
				var1190.action_type = t.ActionType.fromNumber(var1199) or var1199
			else
				local _ = nil
				local var1200, var1201 = protoModule.readVarInt(p65, var1191)
				local _ = var1200
				var1191 = var1201
			end
		end
		if var1192 == protoModule.wireTypes.lengthDelimited then
			if var1196 == 2 then
				local _ = nil
				local var1202, var1203 = protoModule.readBuffer(p65, var1191)
				var1191 = var1203
				var1190.action_params = t.OpenProfileAction_Params.decode(var1202)
			else
				local _ = nil
				local var1204, var1205 = protoModule.readVarInt(p65, var1191)
				var1191 = var1205 + var1204
			end
		elseif var1192 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1206, var1207 = protoModule.readFixed32(p65, var1191)
			local _ = var1206
			var1191 = var1207
		elseif var1192 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1208, var1209 = protoModule.readFixed64(p65, var1191)
			local _ = var1208
			var1191 = var1209
		else
			error("Unsupported wire type: " .. var1192)
		end
	end
	return var1190
end

function t_34:jsonEncode() --[[ line: 10213 ]]
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

function t_34:jsonDecode() --[[ line: 10235 ]]
	-- upvalues: t_34 (ref), t (ref)
	local var1211 = t_34.new()
	
	if self.action_type ~= nil then
		var1211.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1211.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1211.action_params = t.OpenProfileAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1211.action_params = t.OpenProfileAction_Params.jsonDecode(self.actionParams)
	end
	return var1211
end

t_34.descriptor = {
	name = "OpenProfileAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenProfileAction"
}
t.OpenProfileAction = t_34
typeRegistryModule.default:register(t.OpenProfileAction)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p66) --[[ line: 10275 ]]
	-- upvalues: t_35 (ref)
	return setmetatable({
		profile_id = if p66 == nil or p66.profile_id == nil then nil else p66.profile_id,
		profile_type = if p66 == nil or p66.profile_type == nil then nil else p66.profile_type,
		source = if p66 == nil or p66.source == nil then nil else p66.source
	}, t_35)
end

function t_35:encode() --[[ line: 10283 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1213 = 0
	
	if self.profile_id ~= nil then
		local var1214 = self.profile_id:encode()
		local var1215, var1216 = protoModule.writeTag(buff, var1213, 1, protoModule.wireTypes.lengthDelimited)
		var1215, var1216 = protoModule.writeBuffer(var1215, var1216, var1214, buffer.len(var1214))
		buff = var1215
		var1213 = var1216
	end
	if self.profile_type ~= nil then
		local var1217 = self.profile_type:encode()
		local var1218, var1219 = protoModule.writeTag(buff, var1213, 2, protoModule.wireTypes.lengthDelimited)
		var1218, var1219 = protoModule.writeBuffer(var1218, var1219, var1217, buffer.len(var1217))
		buff = var1218
		var1213 = var1219
	end
	if self.source ~= nil then
		local var1220 = self.source:encode()
		local var1221, var1222 = protoModule.writeTag(buff, var1213, 3, protoModule.wireTypes.lengthDelimited)
		var1221, var1222 = protoModule.writeBuffer(var1221, var1222, var1220, buffer.len(var1220))
		buff = var1221
		var1213 = var1222
	end
	local buff_1 = buffer.create(var1213)
	buffer.copy(buff_1, 0, buff, 0, var1213)
	
	return buff_1
end

function t_35.decode(p67) --[[ line: 10310 ]]
	-- upvalues: t_35 (ref), protoModule (ref), propTypesModule (ref)
	local var1224 = t_35.new()
	local var1225 = 0
	while var1225 < buffer.len(p67) do
		local _ = nil
		local var1226 = nil
		local var1227, var1228, var1229 = protoModule.readTag(p67, var1225)
		local var1230 = var1227
		var1226 = var1228
		var1225 = var1229
		
		if var1226 == protoModule.wireTypes.varint then
			local _ = nil
			local var1231, var1232 = protoModule.readVarInt(p67, var1225)
			local _ = var1231
			var1225 = var1232
			continue
		end
		if var1226 == protoModule.wireTypes.lengthDelimited then
			if var1230 == 1 then
				local _ = nil
				local var1233, var1234 = protoModule.readBuffer(p67, var1225)
				var1225 = var1234
				var1224.profile_id = propTypesModule.StringProp.decode(var1233)
			elseif var1230 == 2 then
				local _ = nil
				local var1235, var1236 = protoModule.readBuffer(p67, var1225)
				var1225 = var1236
				var1224.profile_type = propTypesModule.StringProp.decode(var1235)
			elseif var1230 == 3 then
				local _ = nil
				local var1237, var1238 = protoModule.readBuffer(p67, var1225)
				var1225 = var1238
				var1224.source = propTypesModule.StringProp.decode(var1237)
			else
				local _ = nil
				local var1239, var1240 = protoModule.readVarInt(p67, var1225)
				var1225 = var1240 + var1239
			end
		elseif var1226 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1241, var1242 = protoModule.readFixed32(p67, var1225)
			local _ = var1241
			var1225 = var1242
		elseif var1226 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1243, var1244 = protoModule.readFixed64(p67, var1225)
			local _ = var1243
			var1225 = var1244
		else
			error("Unsupported wire type: " .. var1226)
		end
	end
	return var1224
end

function t_35:jsonEncode() --[[ line: 10363 ]]
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

function t_35:jsonDecode() --[[ line: 10381 ]]
	-- upvalues: t_35 (ref), propTypesModule (ref)
	local var1246 = t_35.new()
	
	if self.profile_id ~= nil then
		var1246.profile_id = propTypesModule.StringProp.jsonDecode(self.profile_id)
	end
	if self.profileId ~= nil then
		var1246.profile_id = propTypesModule.StringProp.jsonDecode(self.profileId)
	end
	if self.profile_type ~= nil then
		var1246.profile_type = propTypesModule.StringProp.jsonDecode(self.profile_type)
	end
	if self.profileType ~= nil then
		var1246.profile_type = propTypesModule.StringProp.jsonDecode(self.profileType)
	end
	if self.source ~= nil then
		var1246.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var1246
end

t_35.descriptor = {
	name = "OpenProfileAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenProfileAction_Params = t_35
typeRegistryModule.default:register(t.OpenProfileAction_Params)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p68) --[[ line: 10423 ]]
	-- upvalues: t (ref), t_36 (ref)
	return setmetatable({
		action_type = if p68 == nil or p68.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p68.action_type,
		action_params = if p68 == nil or p68.action_params == nil then nil else p68.action_params
	}, t_36)
end

function t_36:encode() --[[ line: 10434 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1248 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1249, var1250 = protoModule.writeTag(buff, var1248, 1, protoModule.wireTypes.varint)
		var1249, var1250 = protoModule.writeVarInt(var1249, var1250, t.ActionType.toNumber(self.action_type))
		buff = var1249
		var1248 = var1250
	end
	if self.action_params ~= nil then
		local var1251 = self.action_params:encode()
		local var1252, var1253 = protoModule.writeTag(buff, var1248, 2, protoModule.wireTypes.lengthDelimited)
		var1252, var1253 = protoModule.writeBuffer(var1252, var1253, var1251, buffer.len(var1251))
		buff = var1252
		var1248 = var1253
	end
	local buff_1 = buffer.create(var1248)
	buffer.copy(buff_1, 0, buff, 0, var1248)
	
	return buff_1
end

function t_36.decode(p69) --[[ line: 10460 ]]
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1255 = t_36.new()
	local var1256 = 0
	while var1256 < buffer.len(p69) do
		local _ = nil
		local var1257 = nil
		local var1258, var1259, var1260 = protoModule.readTag(p69, var1256)
		local var1261 = var1258
		var1257 = var1259
		var1256 = var1260
		
		if var1257 == protoModule.wireTypes.varint then
			if var1261 == 1 then
				local _ = nil
				local var1262, var1263 = protoModule.readVarIntI32(p69, var1256)
				local var1264 = var1262
				var1256 = var1263
				var1255.action_type = t.ActionType.fromNumber(var1264) or var1264
			else
				local _ = nil
				local var1265, var1266 = protoModule.readVarInt(p69, var1256)
				local _ = var1265
				var1256 = var1266
			end
		end
		if var1257 == protoModule.wireTypes.lengthDelimited then
			if var1261 == 2 then
				local _ = nil
				local var1267, var1268 = protoModule.readBuffer(p69, var1256)
				var1256 = var1268
				var1255.action_params = t.OpenFacialAgeEstimationAction_Params.decode(var1267)
			else
				local _ = nil
				local var1269, var1270 = protoModule.readVarInt(p69, var1256)
				var1256 = var1270 + var1269
			end
		elseif var1257 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1271, var1272 = protoModule.readFixed32(p69, var1256)
			local _ = var1271
			var1256 = var1272
		elseif var1257 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1273, var1274 = protoModule.readFixed64(p69, var1256)
			local _ = var1273
			var1256 = var1274
		else
			error("Unsupported wire type: " .. var1257)
		end
	end
	return var1255
end

function t_36:jsonEncode() --[[ line: 10508 ]]
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

function t_36:jsonDecode() --[[ line: 10530 ]]
	-- upvalues: t_36 (ref), t (ref)
	local var1276 = t_36.new()
	
	if self.action_type ~= nil then
		var1276.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1276.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1276.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1276.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.actionParams)
	end
	return var1276
end

t_36.descriptor = {
	name = "OpenFacialAgeEstimationAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenFacialAgeEstimationAction"
}
t.OpenFacialAgeEstimationAction = t_36
typeRegistryModule.default:register(t.OpenFacialAgeEstimationAction)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p70) --[[ line: 10570 ]]
	-- upvalues: t_37 (ref)
	return setmetatable({
		user_id = if p70 == nil or p70.user_id == nil then nil else p70.user_id,
		source = if p70 == nil or p70.source == nil then nil else p70.source,
		context = if p70 == nil or p70.context == nil then nil else p70.context,
		is_in_experience = if p70 == nil or p70.is_in_experience == nil then nil else p70.is_in_experience,
		on_success = if p70 == nil or p70.on_success == nil then nil else p70.on_success,
		on_failure = if p70 == nil or p70.on_failure == nil then nil else p70.on_failure,
		should_include_vpc = if p70 == nil or p70.should_include_vpc == nil then nil else p70.should_include_vpc
	}, t_37)
end

function t_37:encode() --[[ line: 10584 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1278 = 0
	
	if self.user_id ~= nil then
		local var1279 = self.user_id:encode()
		local var1280, var1281 = protoModule.writeTag(buff, var1278, 1, protoModule.wireTypes.lengthDelimited)
		var1280, var1281 = protoModule.writeBuffer(var1280, var1281, var1279, buffer.len(var1279))
		buff = var1280
		var1278 = var1281
	end
	if self.source ~= nil then
		local var1282 = self.source:encode()
		local var1283, var1284 = protoModule.writeTag(buff, var1278, 2, protoModule.wireTypes.lengthDelimited)
		var1283, var1284 = protoModule.writeBuffer(var1283, var1284, var1282, buffer.len(var1282))
		buff = var1283
		var1278 = var1284
	end
	if self.context ~= nil then
		local var1285 = self.context:encode()
		local var1286, var1287 = protoModule.writeTag(buff, var1278, 3, protoModule.wireTypes.lengthDelimited)
		var1286, var1287 = protoModule.writeBuffer(var1286, var1287, var1285, buffer.len(var1285))
		buff = var1286
		var1278 = var1287
	end
	if self.is_in_experience ~= nil then
		local var1288 = self.is_in_experience:encode()
		local var1289, var1290 = protoModule.writeTag(buff, var1278, 4, protoModule.wireTypes.lengthDelimited)
		var1289, var1290 = protoModule.writeBuffer(var1289, var1290, var1288, buffer.len(var1288))
		buff = var1289
		var1278 = var1290
	end
	if self.on_success ~= nil then
		local var1291 = self.on_success:encode()
		local var1292, var1293 = protoModule.writeTag(buff, var1278, 5, protoModule.wireTypes.lengthDelimited)
		var1292, var1293 = protoModule.writeBuffer(var1292, var1293, var1291, buffer.len(var1291))
		buff = var1292
		var1278 = var1293
	end
	if self.on_failure ~= nil then
		local var1294 = self.on_failure:encode()
		local var1295, var1296 = protoModule.writeTag(buff, var1278, 6, protoModule.wireTypes.lengthDelimited)
		var1295, var1296 = protoModule.writeBuffer(var1295, var1296, var1294, buffer.len(var1294))
		buff = var1295
		var1278 = var1296
	end
	if self.should_include_vpc ~= nil then
		local var1297 = self.should_include_vpc:encode()
		local var1298, var1299 = protoModule.writeTag(buff, var1278, 7, protoModule.wireTypes.lengthDelimited)
		var1298, var1299 = protoModule.writeBuffer(var1298, var1299, var1297, buffer.len(var1297))
		buff = var1298
		var1278 = var1299
	end
	local buff_1 = buffer.create(var1278)
	buffer.copy(buff_1, 0, buff, 0, var1278)
	
	return buff_1
end

function t_37.decode(p71) --[[ line: 10635 ]]
	-- upvalues: t_37 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1301 = t_37.new()
	local var1302 = 0
	while var1302 < buffer.len(p71) do
		local _ = nil
		local var1303 = nil
		local var1304, var1305, var1306 = protoModule.readTag(p71, var1302)
		local var1307 = var1304
		var1303 = var1305
		var1302 = var1306
		
		if var1303 == protoModule.wireTypes.varint then
			local _ = nil
			local var1308, var1309 = protoModule.readVarInt(p71, var1302)
			local _ = var1308
			var1302 = var1309
			continue
		end
		if var1303 == protoModule.wireTypes.lengthDelimited then
			if var1307 == 1 then
				local _ = nil
				local var1310, var1311 = protoModule.readBuffer(p71, var1302)
				var1302 = var1311
				var1301.user_id = propTypesModule.StringProp.decode(var1310)
			elseif var1307 == 2 then
				local _ = nil
				local var1312, var1313 = protoModule.readBuffer(p71, var1302)
				var1302 = var1313
				var1301.source = propTypesModule.StringProp.decode(var1312)
			elseif var1307 == 3 then
				local _ = nil
				local var1314, var1315 = protoModule.readBuffer(p71, var1302)
				var1302 = var1315
				var1301.context = propTypesModule.StringProp.decode(var1314)
			elseif var1307 == 4 then
				local _ = nil
				local var1316, var1317 = protoModule.readBuffer(p71, var1302)
				var1302 = var1317
				var1301.is_in_experience = propTypesModule.BoolProp.decode(var1316)
			elseif var1307 == 5 then
				local _ = nil
				local var1318, var1319 = protoModule.readBuffer(p71, var1302)
				var1302 = var1319
				var1301.on_success = t.ActionProp.decode(var1318)
			elseif var1307 == 6 then
				local _ = nil
				local var1320, var1321 = protoModule.readBuffer(p71, var1302)
				var1302 = var1321
				var1301.on_failure = t.ActionProp.decode(var1320)
			elseif var1307 == 7 then
				local _ = nil
				local var1322, var1323 = protoModule.readBuffer(p71, var1302)
				var1302 = var1323
				var1301.should_include_vpc = propTypesModule.BoolProp.decode(var1322)
			else
				local _ = nil
				local var1324, var1325 = protoModule.readVarInt(p71, var1302)
				var1302 = var1325 + var1324
			end
		elseif var1303 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1326, var1327 = protoModule.readFixed32(p71, var1302)
			local _ = var1326
			var1302 = var1327
		elseif var1303 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1328, var1329 = protoModule.readFixed64(p71, var1302)
			local _ = var1328
			var1302 = var1329
		else
			error("Unsupported wire type: " .. var1303)
		end
	end
	return var1301
end

function t_37:jsonEncode() --[[ line: 10708 ]]
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
	if self.should_include_vpc ~= nil then
		t.shouldIncludeVpc = self.should_include_vpc:jsonEncode()
	end
	return t
end

function t_37:jsonDecode() --[[ line: 10742 ]]
	-- upvalues: t_37 (ref), propTypesModule (ref), t (ref)
	local var1331 = t_37.new()
	
	if self.user_id ~= nil then
		var1331.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1331.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var1331.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.context ~= nil then
		var1331.context = propTypesModule.StringProp.jsonDecode(self.context)
	end
	if self.is_in_experience ~= nil then
		var1331.is_in_experience = propTypesModule.BoolProp.jsonDecode(self.is_in_experience)
	end
	if self.isInExperience ~= nil then
		var1331.is_in_experience = propTypesModule.BoolProp.jsonDecode(self.isInExperience)
	end
	if self.on_success ~= nil then
		var1331.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var1331.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var1331.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var1331.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	if self.should_include_vpc ~= nil then
		var1331.should_include_vpc = propTypesModule.BoolProp.jsonDecode(self.should_include_vpc)
	end
	if self.shouldIncludeVpc ~= nil then
		var1331.should_include_vpc = propTypesModule.BoolProp.jsonDecode(self.shouldIncludeVpc)
	end
	return var1331
end

t_37.descriptor = {
	name = "OpenFacialAgeEstimationAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenFacialAgeEstimationAction_Params = t_37
typeRegistryModule.default:register(t.OpenFacialAgeEstimationAction_Params)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p72) --[[ line: 10816 ]]
	-- upvalues: t (ref), t_38 (ref)
	return setmetatable({
		action_type = if p72 == nil or p72.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p72.action_type,
		action_params = if p72 == nil or p72.action_params == nil then nil else p72.action_params
	}, t_38)
end

function t_38:encode() --[[ line: 10825 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1333 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1334, var1335 = protoModule.writeTag(buff, var1333, 1, protoModule.wireTypes.varint)
		var1334, var1335 = protoModule.writeVarInt(var1334, var1335, t.ActionType.toNumber(self.action_type))
		buff = var1334
		var1333 = var1335
	end
	if self.action_params ~= nil then
		local var1336 = self.action_params:encode()
		local var1337, var1338 = protoModule.writeTag(buff, var1333, 2, protoModule.wireTypes.lengthDelimited)
		var1337, var1338 = protoModule.writeBuffer(var1337, var1338, var1336, buffer.len(var1336))
		buff = var1337
		var1333 = var1338
	end
	local buff_1 = buffer.create(var1333)
	buffer.copy(buff_1, 0, buff, 0, var1333)
	
	return buff_1
end

function t_38.decode(p73) --[[ line: 10851 ]]
	-- upvalues: t_38 (ref), protoModule (ref), t (ref)
	local var1340 = t_38.new()
	local var1341 = 0
	while var1341 < buffer.len(p73) do
		local _ = nil
		local var1342 = nil
		local var1343, var1344, var1345 = protoModule.readTag(p73, var1341)
		local var1346 = var1343
		var1342 = var1344
		var1341 = var1345
		
		if var1342 == protoModule.wireTypes.varint then
			if var1346 == 1 then
				local _ = nil
				local var1347, var1348 = protoModule.readVarIntI32(p73, var1341)
				local var1349 = var1347
				var1341 = var1348
				var1340.action_type = t.ActionType.fromNumber(var1349) or var1349
			else
				local _ = nil
				local var1350, var1351 = protoModule.readVarInt(p73, var1341)
				local _ = var1350
				var1341 = var1351
			end
		end
		if var1342 == protoModule.wireTypes.lengthDelimited then
			if var1346 == 2 then
				local _ = nil
				local var1352, var1353 = protoModule.readBuffer(p73, var1341)
				var1341 = var1353
				var1340.action_params = t.ShowToastAction_Params.decode(var1352)
			else
				local _ = nil
				local var1354, var1355 = protoModule.readVarInt(p73, var1341)
				var1341 = var1355 + var1354
			end
		elseif var1342 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1356, var1357 = protoModule.readFixed32(p73, var1341)
			local _ = var1356
			var1341 = var1357
		elseif var1342 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1358, var1359 = protoModule.readFixed64(p73, var1341)
			local _ = var1358
			var1341 = var1359
		else
			error("Unsupported wire type: " .. var1342)
		end
	end
	return var1340
end

function t_38:jsonEncode() --[[ line: 10899 ]]
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

function t_38:jsonDecode() --[[ line: 10921 ]]
	-- upvalues: t_38 (ref), t (ref)
	local var1361 = t_38.new()
	
	if self.action_type ~= nil then
		var1361.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1361.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1361.action_params = t.ShowToastAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1361.action_params = t.ShowToastAction_Params.jsonDecode(self.actionParams)
	end
	return var1361
end

t_38.descriptor = {
	name = "ShowToastAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShowToastAction"
}
t.ShowToastAction = t_38
typeRegistryModule.default:register(t.ShowToastAction)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p74) --[[ line: 10961 ]]
	-- upvalues: t_39 (ref)
	return setmetatable({
		toast_message = if p74 == nil or p74.toast_message == nil then nil else p74.toast_message,
		toast_type = if p74 == nil or p74.toast_type == nil then nil else p74.toast_type,
		dismiss_prompt = if p74 == nil or p74.dismiss_prompt == nil then nil else p74.dismiss_prompt,
		prompt_type = if p74 == nil or p74.prompt_type == nil then nil else p74.prompt_type,
		prompt_id = if p74 == nil or p74.prompt_id == nil then nil else p74.prompt_id
	}, t_39)
end

function t_39:encode() --[[ line: 10971 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1363 = 0
	
	if self.toast_message ~= nil then
		local var1364 = self.toast_message:encode()
		local var1365, var1366 = protoModule.writeTag(buff, var1363, 1, protoModule.wireTypes.lengthDelimited)
		var1365, var1366 = protoModule.writeBuffer(var1365, var1366, var1364, buffer.len(var1364))
		buff = var1365
		var1363 = var1366
	end
	if self.toast_type ~= nil then
		local var1367 = self.toast_type:encode()
		local var1368, var1369 = protoModule.writeTag(buff, var1363, 2, protoModule.wireTypes.lengthDelimited)
		var1368, var1369 = protoModule.writeBuffer(var1368, var1369, var1367, buffer.len(var1367))
		buff = var1368
		var1363 = var1369
	end
	if self.dismiss_prompt ~= nil then
		local var1370 = self.dismiss_prompt:encode()
		local var1371, var1372 = protoModule.writeTag(buff, var1363, 3, protoModule.wireTypes.lengthDelimited)
		var1371, var1372 = protoModule.writeBuffer(var1371, var1372, var1370, buffer.len(var1370))
		buff = var1371
		var1363 = var1372
	end
	if self.prompt_type ~= nil then
		local var1373 = self.prompt_type:encode()
		local var1374, var1375 = protoModule.writeTag(buff, var1363, 4, protoModule.wireTypes.lengthDelimited)
		var1374, var1375 = protoModule.writeBuffer(var1374, var1375, var1373, buffer.len(var1373))
		buff = var1374
		var1363 = var1375
	end
	if self.prompt_id ~= nil then
		local var1376 = self.prompt_id:encode()
		local var1377, var1378 = protoModule.writeTag(buff, var1363, 5, protoModule.wireTypes.lengthDelimited)
		var1377, var1378 = protoModule.writeBuffer(var1377, var1378, var1376, buffer.len(var1376))
		buff = var1377
		var1363 = var1378
	end
	local buff_1 = buffer.create(var1363)
	buffer.copy(buff_1, 0, buff, 0, var1363)
	
	return buff_1
end

function t_39.decode(p75) --[[ line: 11010 ]]
	-- upvalues: t_39 (ref), protoModule (ref), propTypesModule (ref)
	local var1380 = t_39.new()
	local var1381 = 0
	while var1381 < buffer.len(p75) do
		local _ = nil
		local var1382 = nil
		local var1383, var1384, var1385 = protoModule.readTag(p75, var1381)
		local var1386 = var1383
		var1382 = var1384
		var1381 = var1385
		
		if var1382 == protoModule.wireTypes.varint then
			local _ = nil
			local var1387, var1388 = protoModule.readVarInt(p75, var1381)
			local _ = var1387
			var1381 = var1388
			continue
		end
		if var1382 == protoModule.wireTypes.lengthDelimited then
			if var1386 == 1 then
				local _ = nil
				local var1389, var1390 = protoModule.readBuffer(p75, var1381)
				var1381 = var1390
				var1380.toast_message = propTypesModule.StringProp.decode(var1389)
			elseif var1386 == 2 then
				local _ = nil
				local var1391, var1392 = protoModule.readBuffer(p75, var1381)
				var1381 = var1392
				var1380.toast_type = propTypesModule.StringProp.decode(var1391)
			elseif var1386 == 3 then
				local _ = nil
				local var1393, var1394 = protoModule.readBuffer(p75, var1381)
				var1381 = var1394
				var1380.dismiss_prompt = propTypesModule.BoolProp.decode(var1393)
			elseif var1386 == 4 then
				local _ = nil
				local var1395, var1396 = protoModule.readBuffer(p75, var1381)
				var1381 = var1396
				var1380.prompt_type = propTypesModule.StringProp.decode(var1395)
			elseif var1386 == 5 then
				local _ = nil
				local var1397, var1398 = protoModule.readBuffer(p75, var1381)
				var1381 = var1398
				var1380.prompt_id = propTypesModule.StringProp.decode(var1397)
			else
				local _ = nil
				local var1399, var1400 = protoModule.readVarInt(p75, var1381)
				var1381 = var1400 + var1399
			end
		elseif var1382 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1401, var1402 = protoModule.readFixed32(p75, var1381)
			local _ = var1401
			var1381 = var1402
		elseif var1382 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1403, var1404 = protoModule.readFixed64(p75, var1381)
			local _ = var1403
			var1381 = var1404
		else
			error("Unsupported wire type: " .. var1382)
		end
	end
	return var1380
end

function t_39:jsonEncode() --[[ line: 11073 ]]
	local t = {}
	
	if self.toast_message ~= nil then
		t.toastMessage = self.toast_message:jsonEncode()
	end
	if self.toast_type ~= nil then
		t.toastType = self.toast_type:jsonEncode()
	end
	if self.dismiss_prompt ~= nil then
		t.dismissPrompt = self.dismiss_prompt:jsonEncode()
	end
	if self.prompt_type ~= nil then
		t.promptType = self.prompt_type:jsonEncode()
	end
	if self.prompt_id ~= nil then
		t.promptId = self.prompt_id:jsonEncode()
	end
	return t
end

function t_39:jsonDecode() --[[ line: 11099 ]]
	-- upvalues: t_39 (ref), propTypesModule (ref)
	local var1406 = t_39.new()
	
	if self.toast_message ~= nil then
		var1406.toast_message = propTypesModule.StringProp.jsonDecode(self.toast_message)
	end
	if self.toastMessage ~= nil then
		var1406.toast_message = propTypesModule.StringProp.jsonDecode(self.toastMessage)
	end
	if self.toast_type ~= nil then
		var1406.toast_type = propTypesModule.StringProp.jsonDecode(self.toast_type)
	end
	if self.toastType ~= nil then
		var1406.toast_type = propTypesModule.StringProp.jsonDecode(self.toastType)
	end
	if self.dismiss_prompt ~= nil then
		var1406.dismiss_prompt = propTypesModule.BoolProp.jsonDecode(self.dismiss_prompt)
	end
	if self.dismissPrompt ~= nil then
		var1406.dismiss_prompt = propTypesModule.BoolProp.jsonDecode(self.dismissPrompt)
	end
	if self.prompt_type ~= nil then
		var1406.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1406.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var1406.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1406.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	return var1406
end

t_39.descriptor = {
	name = "ShowToastAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ShowToastAction_Params = t_39
typeRegistryModule.default:register(t.ShowToastAction_Params)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p76) --[[ line: 11164 ]]
	-- upvalues: t (ref), t_40 (ref)
	return setmetatable({
		action_type = if p76 == nil or p76.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p76.action_type,
		action_params = if p76 == nil or p76.action_params == nil then nil else p76.action_params
	}, t_40)
end

function t_40:encode() --[[ line: 11175 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1408 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1409, var1410 = protoModule.writeTag(buff, var1408, 1, protoModule.wireTypes.varint)
		var1409, var1410 = protoModule.writeVarInt(var1409, var1410, t.ActionType.toNumber(self.action_type))
		buff = var1409
		var1408 = var1410
	end
	if self.action_params ~= nil then
		local var1411 = self.action_params:encode()
		local var1412, var1413 = protoModule.writeTag(buff, var1408, 2, protoModule.wireTypes.lengthDelimited)
		var1412, var1413 = protoModule.writeBuffer(var1412, var1413, var1411, buffer.len(var1411))
		buff = var1412
		var1408 = var1413
	end
	local buff_1 = buffer.create(var1408)
	buffer.copy(buff_1, 0, buff, 0, var1408)
	
	return buff_1
end

function t_40.decode(p77) --[[ line: 11201 ]]
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var1415 = t_40.new()
	local var1416 = 0
	while var1416 < buffer.len(p77) do
		local _ = nil
		local var1417 = nil
		local var1418, var1419, var1420 = protoModule.readTag(p77, var1416)
		local var1421 = var1418
		var1417 = var1419
		var1416 = var1420
		
		if var1417 == protoModule.wireTypes.varint then
			if var1421 == 1 then
				local _ = nil
				local var1422, var1423 = protoModule.readVarIntI32(p77, var1416)
				local var1424 = var1422
				var1416 = var1423
				var1415.action_type = t.ActionType.fromNumber(var1424) or var1424
			else
				local _ = nil
				local var1425, var1426 = protoModule.readVarInt(p77, var1416)
				local _ = var1425
				var1416 = var1426
			end
		end
		if var1417 == protoModule.wireTypes.lengthDelimited then
			if var1421 == 2 then
				local _ = nil
				local var1427, var1428 = protoModule.readBuffer(p77, var1416)
				var1416 = var1428
				var1415.action_params = t.OpenPhoneUpsellModalAction_Params.decode(var1427)
			else
				local _ = nil
				local var1429, var1430 = protoModule.readVarInt(p77, var1416)
				var1416 = var1430 + var1429
			end
		elseif var1417 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1431, var1432 = protoModule.readFixed32(p77, var1416)
			local _ = var1431
			var1416 = var1432
		elseif var1417 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1433, var1434 = protoModule.readFixed64(p77, var1416)
			local _ = var1433
			var1416 = var1434
		else
			error("Unsupported wire type: " .. var1417)
		end
	end
	return var1415
end

function t_40:jsonEncode() --[[ line: 11249 ]]
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

function t_40:jsonDecode() --[[ line: 11271 ]]
	-- upvalues: t_40 (ref), t (ref)
	local var1436 = t_40.new()
	
	if self.action_type ~= nil then
		var1436.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1436.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1436.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1436.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var1436
end

t_40.descriptor = {
	name = "OpenPhoneUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenPhoneUpsellModalAction"
}
t.OpenPhoneUpsellModalAction = t_40
typeRegistryModule.default:register(t.OpenPhoneUpsellModalAction)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p78) --[[ line: 11311 ]]
	-- upvalues: t_41 (ref)
	return setmetatable({
		voice_opt_in = if p78 == nil or p78.voice_opt_in == nil then nil else p78.voice_opt_in,
		event_context = if p78 == nil or p78.event_context == nil then nil else p78.event_context,
		origin = if p78 == nil or p78.origin == nil then nil else p78.origin,
		should_autofill_android_phone_number_at_launch = if p78 == nil or p78.should_autofill_android_phone_number_at_launch == nil then nil else p78.should_autofill_android_phone_number_at_launch,
		add_phone_description_key = if p78 == nil or p78.add_phone_description_key == nil then nil else p78.add_phone_description_key,
		on_success = if p78 == nil or p78.on_success == nil then nil else p78.on_success,
		on_failure = if p78 == nil or p78.on_failure == nil then nil else p78.on_failure,
		on_cancelled = if p78 == nil or p78.on_cancelled == nil then nil else p78.on_cancelled
	}, t_41)
end

function t_41:encode() --[[ line: 11331 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1438 = 0
	
	if self.voice_opt_in ~= nil then
		local var1439 = self.voice_opt_in:encode()
		local var1440, var1441 = protoModule.writeTag(buff, var1438, 1, protoModule.wireTypes.lengthDelimited)
		var1440, var1441 = protoModule.writeBuffer(var1440, var1441, var1439, buffer.len(var1439))
		buff = var1440
		var1438 = var1441
	end
	if self.event_context ~= nil then
		local var1442 = self.event_context:encode()
		local var1443, var1444 = protoModule.writeTag(buff, var1438, 2, protoModule.wireTypes.lengthDelimited)
		var1443, var1444 = protoModule.writeBuffer(var1443, var1444, var1442, buffer.len(var1442))
		buff = var1443
		var1438 = var1444
	end
	if self.origin ~= nil then
		local var1445 = self.origin:encode()
		local var1446, var1447 = protoModule.writeTag(buff, var1438, 3, protoModule.wireTypes.lengthDelimited)
		var1446, var1447 = protoModule.writeBuffer(var1446, var1447, var1445, buffer.len(var1445))
		buff = var1446
		var1438 = var1447
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		local var1448 = self.should_autofill_android_phone_number_at_launch:encode()
		local var1449, var1450 = protoModule.writeTag(buff, var1438, 4, protoModule.wireTypes.lengthDelimited)
		var1449, var1450 = protoModule.writeBuffer(var1449, var1450, var1448, buffer.len(var1448))
		buff = var1449
		var1438 = var1450
	end
	if self.add_phone_description_key ~= nil then
		local var1451 = self.add_phone_description_key:encode()
		local var1452, var1453 = protoModule.writeTag(buff, var1438, 5, protoModule.wireTypes.lengthDelimited)
		var1452, var1453 = protoModule.writeBuffer(var1452, var1453, var1451, buffer.len(var1451))
		buff = var1452
		var1438 = var1453
	end
	if self.on_success ~= nil then
		local var1454 = self.on_success:encode()
		local var1455, var1456 = protoModule.writeTag(buff, var1438, 6, protoModule.wireTypes.lengthDelimited)
		var1455, var1456 = protoModule.writeBuffer(var1455, var1456, var1454, buffer.len(var1454))
		buff = var1455
		var1438 = var1456
	end
	if self.on_failure ~= nil then
		local var1457 = self.on_failure:encode()
		local var1458, var1459 = protoModule.writeTag(buff, var1438, 7, protoModule.wireTypes.lengthDelimited)
		var1458, var1459 = protoModule.writeBuffer(var1458, var1459, var1457, buffer.len(var1457))
		buff = var1458
		var1438 = var1459
	end
	if self.on_cancelled ~= nil then
		local var1460 = self.on_cancelled:encode()
		local var1461, var1462 = protoModule.writeTag(buff, var1438, 8, protoModule.wireTypes.lengthDelimited)
		var1461, var1462 = protoModule.writeBuffer(var1461, var1462, var1460, buffer.len(var1460))
		buff = var1461
		var1438 = var1462
	end
	local buff_1 = buffer.create(var1438)
	buffer.copy(buff_1, 0, buff, 0, var1438)
	
	return buff_1
end

function t_41.decode(p79) --[[ line: 11388 ]]
	-- upvalues: t_41 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1464 = t_41.new()
	local var1465 = 0
	while var1465 < buffer.len(p79) do
		local _ = nil
		local var1466 = nil
		local var1467, var1468, var1469 = protoModule.readTag(p79, var1465)
		local var1470 = var1467
		var1466 = var1468
		var1465 = var1469
		
		if var1466 == protoModule.wireTypes.varint then
			local _ = nil
			local var1471, var1472 = protoModule.readVarInt(p79, var1465)
			local _ = var1471
			var1465 = var1472
			continue
		end
		if var1466 == protoModule.wireTypes.lengthDelimited then
			if var1470 == 1 then
				local _ = nil
				local var1473, var1474 = protoModule.readBuffer(p79, var1465)
				var1465 = var1474
				var1464.voice_opt_in = propTypesModule.BoolProp.decode(var1473)
			elseif var1470 == 2 then
				local _ = nil
				local var1475, var1476 = protoModule.readBuffer(p79, var1465)
				var1465 = var1476
				var1464.event_context = propTypesModule.StringProp.decode(var1475)
			elseif var1470 == 3 then
				local _ = nil
				local var1477, var1478 = protoModule.readBuffer(p79, var1465)
				var1465 = var1478
				var1464.origin = propTypesModule.StringProp.decode(var1477)
			elseif var1470 == 4 then
				local _ = nil
				local var1479, var1480 = protoModule.readBuffer(p79, var1465)
				var1465 = var1480
				var1464.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.decode(var1479)
			elseif var1470 == 5 then
				local _ = nil
				local var1481, var1482 = protoModule.readBuffer(p79, var1465)
				var1465 = var1482
				var1464.add_phone_description_key = propTypesModule.StringProp.decode(var1481)
			elseif var1470 == 6 then
				local _ = nil
				local var1483, var1484 = protoModule.readBuffer(p79, var1465)
				var1465 = var1484
				var1464.on_success = t.ActionProp.decode(var1483)
			elseif var1470 == 7 then
				local _ = nil
				local var1485, var1486 = protoModule.readBuffer(p79, var1465)
				var1465 = var1486
				var1464.on_failure = t.ActionProp.decode(var1485)
			elseif var1470 == 8 then
				local _ = nil
				local var1487, var1488 = protoModule.readBuffer(p79, var1465)
				var1465 = var1488
				var1464.on_cancelled = t.ActionProp.decode(var1487)
			else
				local _ = nil
				local var1489, var1490 = protoModule.readVarInt(p79, var1465)
				var1465 = var1490 + var1489
			end
		elseif var1466 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1491, var1492 = protoModule.readFixed32(p79, var1465)
			local _ = var1491
			var1465 = var1492
		elseif var1466 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1493, var1494 = protoModule.readFixed64(p79, var1465)
			local _ = var1493
			var1465 = var1494
		else
			error("Unsupported wire type: " .. var1466)
		end
	end
	return var1464
end

function t_41:jsonEncode() --[[ line: 11468 ]]
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

function t_41:jsonDecode() --[[ line: 11507 ]]
	-- upvalues: t_41 (ref), propTypesModule (ref), t (ref)
	local var1496 = t_41.new()
	
	if self.voice_opt_in ~= nil then
		var1496.voice_opt_in = propTypesModule.BoolProp.jsonDecode(self.voice_opt_in)
	end
	if self.voiceOptIn ~= nil then
		var1496.voice_opt_in = propTypesModule.BoolProp.jsonDecode(self.voiceOptIn)
	end
	if self.event_context ~= nil then
		var1496.event_context = propTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		var1496.event_context = propTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		var1496.origin = propTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		var1496.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.jsonDecode(self.should_autofill_android_phone_number_at_launch)
	end
	if self.shouldAutofillAndroidPhoneNumberAtLaunch ~= nil then
		var1496.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.jsonDecode(self.shouldAutofillAndroidPhoneNumberAtLaunch)
	end
	if self.add_phone_description_key ~= nil then
		var1496.add_phone_description_key = propTypesModule.StringProp.jsonDecode(self.add_phone_description_key)
	end
	if self.addPhoneDescriptionKey ~= nil then
		var1496.add_phone_description_key = propTypesModule.StringProp.jsonDecode(self.addPhoneDescriptionKey)
	end
	if self.on_success ~= nil then
		var1496.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var1496.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var1496.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var1496.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	if self.on_cancelled ~= nil then
		var1496.on_cancelled = t.ActionProp.jsonDecode(self.on_cancelled)
	end
	if self.onCancelled ~= nil then
		var1496.on_cancelled = t.ActionProp.jsonDecode(self.onCancelled)
	end
	return var1496
end

t_41.descriptor = {
	name = "OpenPhoneUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenPhoneUpsellModalAction_Params = t_41
typeRegistryModule.default:register(t.OpenPhoneUpsellModalAction_Params)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p80) --[[ line: 11600 ]]
	-- upvalues: t (ref), t_42 (ref)
	return setmetatable({
		action_type = if p80 == nil or p80.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p80.action_type,
		action_params = if p80 == nil or p80.action_params == nil then nil else p80.action_params
	}, t_42)
end

function t_42:encode() --[[ line: 11611 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1498 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1499, var1500 = protoModule.writeTag(buff, var1498, 1, protoModule.wireTypes.varint)
		var1499, var1500 = protoModule.writeVarInt(var1499, var1500, t.ActionType.toNumber(self.action_type))
		buff = var1499
		var1498 = var1500
	end
	if self.action_params ~= nil then
		local var1501 = self.action_params:encode()
		local var1502, var1503 = protoModule.writeTag(buff, var1498, 2, protoModule.wireTypes.lengthDelimited)
		var1502, var1503 = protoModule.writeBuffer(var1502, var1503, var1501, buffer.len(var1501))
		buff = var1502
		var1498 = var1503
	end
	local buff_1 = buffer.create(var1498)
	buffer.copy(buff_1, 0, buff, 0, var1498)
	
	return buff_1
end

function t_42.decode(p81) --[[ line: 11637 ]]
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1505 = t_42.new()
	local var1506 = 0
	while var1506 < buffer.len(p81) do
		local _ = nil
		local var1507 = nil
		local var1508, var1509, var1510 = protoModule.readTag(p81, var1506)
		local var1511 = var1508
		var1507 = var1509
		var1506 = var1510
		
		if var1507 == protoModule.wireTypes.varint then
			if var1511 == 1 then
				local _ = nil
				local var1512, var1513 = protoModule.readVarIntI32(p81, var1506)
				local var1514 = var1512
				var1506 = var1513
				var1505.action_type = t.ActionType.fromNumber(var1514) or var1514
			else
				local _ = nil
				local var1515, var1516 = protoModule.readVarInt(p81, var1506)
				local _ = var1515
				var1506 = var1516
			end
		end
		if var1507 == protoModule.wireTypes.lengthDelimited then
			if var1511 == 2 then
				local _ = nil
				local var1517, var1518 = protoModule.readBuffer(p81, var1506)
				var1506 = var1518
				var1505.action_params = t.OpenEmailUpsellModalAction_Params.decode(var1517)
			else
				local _ = nil
				local var1519, var1520 = protoModule.readVarInt(p81, var1506)
				var1506 = var1520 + var1519
			end
		elseif var1507 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1521, var1522 = protoModule.readFixed32(p81, var1506)
			local _ = var1521
			var1506 = var1522
		elseif var1507 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1523, var1524 = protoModule.readFixed64(p81, var1506)
			local _ = var1523
			var1506 = var1524
		else
			error("Unsupported wire type: " .. var1507)
		end
	end
	return var1505
end

function t_42:jsonEncode() --[[ line: 11685 ]]
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

function t_42:jsonDecode() --[[ line: 11707 ]]
	-- upvalues: t_42 (ref), t (ref)
	local var1526 = t_42.new()
	
	if self.action_type ~= nil then
		var1526.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1526.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1526.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1526.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var1526
end

t_42.descriptor = {
	name = "OpenEmailUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenEmailUpsellModalAction"
}
t.OpenEmailUpsellModalAction = t_42
typeRegistryModule.default:register(t.OpenEmailUpsellModalAction)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p82) --[[ line: 11747 ]]
	-- upvalues: t_43 (ref)
	return setmetatable({
		add_email_over13_text_key = if p82 == nil or p82.add_email_over13_text_key == nil then nil else p82.add_email_over13_text_key,
		add_email_title_key = if p82 == nil or p82.add_email_title_key == nil then nil else p82.add_email_title_key,
		is_email_modal_called_from_home_page = if p82 == nil or p82.is_email_modal_called_from_home_page == nil then nil else p82.is_email_modal_called_from_home_page,
		event_context = if p82 == nil or p82.event_context == nil then nil else p82.event_context,
		origin = if p82 == nil or p82.origin == nil then nil else p82.origin,
		section = if p82 == nil or p82.section == nil then nil else p82.section,
		on_success = if p82 == nil or p82.on_success == nil then nil else p82.on_success,
		on_failure = if p82 == nil or p82.on_failure == nil then nil else p82.on_failure
	}, t_43)
end

function t_43:encode() --[[ line: 11769 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1528 = 0
	
	if self.add_email_over13_text_key ~= nil then
		local var1529 = self.add_email_over13_text_key:encode()
		local var1530, var1531 = protoModule.writeTag(buff, var1528, 1, protoModule.wireTypes.lengthDelimited)
		var1530, var1531 = protoModule.writeBuffer(var1530, var1531, var1529, buffer.len(var1529))
		buff = var1530
		var1528 = var1531
	end
	if self.add_email_title_key ~= nil then
		local var1532 = self.add_email_title_key:encode()
		local var1533, var1534 = protoModule.writeTag(buff, var1528, 2, protoModule.wireTypes.lengthDelimited)
		var1533, var1534 = protoModule.writeBuffer(var1533, var1534, var1532, buffer.len(var1532))
		buff = var1533
		var1528 = var1534
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		local var1535 = self.is_email_modal_called_from_home_page:encode()
		local var1536, var1537 = protoModule.writeTag(buff, var1528, 3, protoModule.wireTypes.lengthDelimited)
		var1536, var1537 = protoModule.writeBuffer(var1536, var1537, var1535, buffer.len(var1535))
		buff = var1536
		var1528 = var1537
	end
	if self.event_context ~= nil then
		local var1538 = self.event_context:encode()
		local var1539, var1540 = protoModule.writeTag(buff, var1528, 4, protoModule.wireTypes.lengthDelimited)
		var1539, var1540 = protoModule.writeBuffer(var1539, var1540, var1538, buffer.len(var1538))
		buff = var1539
		var1528 = var1540
	end
	if self.origin ~= nil then
		local var1541 = self.origin:encode()
		local var1542, var1543 = protoModule.writeTag(buff, var1528, 5, protoModule.wireTypes.lengthDelimited)
		var1542, var1543 = protoModule.writeBuffer(var1542, var1543, var1541, buffer.len(var1541))
		buff = var1542
		var1528 = var1543
	end
	if self.section ~= nil then
		local var1544 = self.section:encode()
		local var1545, var1546 = protoModule.writeTag(buff, var1528, 6, protoModule.wireTypes.lengthDelimited)
		var1545, var1546 = protoModule.writeBuffer(var1545, var1546, var1544, buffer.len(var1544))
		buff = var1545
		var1528 = var1546
	end
	if self.on_success ~= nil then
		local var1547 = self.on_success:encode()
		local var1548, var1549 = protoModule.writeTag(buff, var1528, 7, protoModule.wireTypes.lengthDelimited)
		var1548, var1549 = protoModule.writeBuffer(var1548, var1549, var1547, buffer.len(var1547))
		buff = var1548
		var1528 = var1549
	end
	if self.on_failure ~= nil then
		local var1550 = self.on_failure:encode()
		local var1551, var1552 = protoModule.writeTag(buff, var1528, 8, protoModule.wireTypes.lengthDelimited)
		var1551, var1552 = protoModule.writeBuffer(var1551, var1552, var1550, buffer.len(var1550))
		buff = var1551
		var1528 = var1552
	end
	local buff_1 = buffer.create(var1528)
	buffer.copy(buff_1, 0, buff, 0, var1528)
	
	return buff_1
end

function t_43.decode(p83) --[[ line: 11826 ]]
	-- upvalues: t_43 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1554 = t_43.new()
	local var1555 = 0
	while var1555 < buffer.len(p83) do
		local _ = nil
		local var1556 = nil
		local var1557, var1558, var1559 = protoModule.readTag(p83, var1555)
		local var1560 = var1557
		var1556 = var1558
		var1555 = var1559
		
		if var1556 == protoModule.wireTypes.varint then
			local _ = nil
			local var1561, var1562 = protoModule.readVarInt(p83, var1555)
			local _ = var1561
			var1555 = var1562
			continue
		end
		if var1556 == protoModule.wireTypes.lengthDelimited then
			if var1560 == 1 then
				local _ = nil
				local var1563, var1564 = protoModule.readBuffer(p83, var1555)
				var1555 = var1564
				var1554.add_email_over13_text_key = propTypesModule.StringProp.decode(var1563)
			elseif var1560 == 2 then
				local _ = nil
				local var1565, var1566 = protoModule.readBuffer(p83, var1555)
				var1555 = var1566
				var1554.add_email_title_key = propTypesModule.StringProp.decode(var1565)
			elseif var1560 == 3 then
				local _ = nil
				local var1567, var1568 = protoModule.readBuffer(p83, var1555)
				var1555 = var1568
				var1554.is_email_modal_called_from_home_page = propTypesModule.BoolProp.decode(var1567)
			elseif var1560 == 4 then
				local _ = nil
				local var1569, var1570 = protoModule.readBuffer(p83, var1555)
				var1555 = var1570
				var1554.event_context = propTypesModule.StringProp.decode(var1569)
			elseif var1560 == 5 then
				local _ = nil
				local var1571, var1572 = protoModule.readBuffer(p83, var1555)
				var1555 = var1572
				var1554.origin = propTypesModule.StringProp.decode(var1571)
			elseif var1560 == 6 then
				local _ = nil
				local var1573, var1574 = protoModule.readBuffer(p83, var1555)
				var1555 = var1574
				var1554.section = propTypesModule.StringProp.decode(var1573)
			elseif var1560 == 7 then
				local _ = nil
				local var1575, var1576 = protoModule.readBuffer(p83, var1555)
				var1555 = var1576
				var1554.on_success = t.ActionProp.decode(var1575)
			elseif var1560 == 8 then
				local _ = nil
				local var1577, var1578 = protoModule.readBuffer(p83, var1555)
				var1555 = var1578
				var1554.on_failure = t.ActionProp.decode(var1577)
			else
				local _ = nil
				local var1579, var1580 = protoModule.readVarInt(p83, var1555)
				var1555 = var1580 + var1579
			end
		elseif var1556 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1581, var1582 = protoModule.readFixed32(p83, var1555)
			local _ = var1581
			var1555 = var1582
		elseif var1556 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1583, var1584 = protoModule.readFixed64(p83, var1555)
			local _ = var1583
			var1555 = var1584
		else
			error("Unsupported wire type: " .. var1556)
		end
	end
	return var1554
end

function t_43:jsonEncode() --[[ line: 11907 ]]
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

function t_43:jsonDecode() --[[ line: 11945 ]]
	-- upvalues: t_43 (ref), propTypesModule (ref), t (ref)
	local var1586 = t_43.new()
	
	if self.add_email_over13_text_key ~= nil then
		var1586.add_email_over13_text_key = propTypesModule.StringProp.jsonDecode(self.add_email_over13_text_key)
	end
	if self.addEmailOver13TextKey ~= nil then
		var1586.add_email_over13_text_key = propTypesModule.StringProp.jsonDecode(self.addEmailOver13TextKey)
	end
	if self.add_email_title_key ~= nil then
		var1586.add_email_title_key = propTypesModule.StringProp.jsonDecode(self.add_email_title_key)
	end
	if self.addEmailTitleKey ~= nil then
		var1586.add_email_title_key = propTypesModule.StringProp.jsonDecode(self.addEmailTitleKey)
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		var1586.is_email_modal_called_from_home_page = propTypesModule.BoolProp.jsonDecode(self.is_email_modal_called_from_home_page)
	end
	if self.isEmailModalCalledFromHomePage ~= nil then
		var1586.is_email_modal_called_from_home_page = propTypesModule.BoolProp.jsonDecode(self.isEmailModalCalledFromHomePage)
	end
	if self.event_context ~= nil then
		var1586.event_context = propTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		var1586.event_context = propTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		var1586.origin = propTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.section ~= nil then
		var1586.section = propTypesModule.StringProp.jsonDecode(self.section)
	end
	if self.on_success ~= nil then
		var1586.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var1586.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var1586.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var1586.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	return var1586
end

t_43.descriptor = {
	name = "OpenEmailUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenEmailUpsellModalAction_Params = t_43
typeRegistryModule.default:register(t.OpenEmailUpsellModalAction_Params)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p84) --[[ line: 12035 ]]
	-- upvalues: t (ref), t_44 (ref)
	return setmetatable({
		action_type = if p84 == nil or p84.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p84.action_type,
		action_params = if p84 == nil or p84.action_params == nil then nil else p84.action_params
	}, t_44)
end

function t_44:encode() --[[ line: 12046 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1588 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1589, var1590 = protoModule.writeTag(buff, var1588, 1, protoModule.wireTypes.varint)
		var1589, var1590 = protoModule.writeVarInt(var1589, var1590, t.ActionType.toNumber(self.action_type))
		buff = var1589
		var1588 = var1590
	end
	if self.action_params ~= nil then
		local var1591 = self.action_params:encode()
		local var1592, var1593 = protoModule.writeTag(buff, var1588, 2, protoModule.wireTypes.lengthDelimited)
		var1592, var1593 = protoModule.writeBuffer(var1592, var1593, var1591, buffer.len(var1591))
		buff = var1592
		var1588 = var1593
	end
	local buff_1 = buffer.create(var1588)
	buffer.copy(buff_1, 0, buff, 0, var1588)
	
	return buff_1
end

function t_44.decode(p85) --[[ line: 12072 ]]
	-- upvalues: t_44 (ref), protoModule (ref), t (ref)
	local var1595 = t_44.new()
	local var1596 = 0
	while var1596 < buffer.len(p85) do
		local _ = nil
		local var1597 = nil
		local var1598, var1599, var1600 = protoModule.readTag(p85, var1596)
		local var1601 = var1598
		var1597 = var1599
		var1596 = var1600
		
		if var1597 == protoModule.wireTypes.varint then
			if var1601 == 1 then
				local _ = nil
				local var1602, var1603 = protoModule.readVarIntI32(p85, var1596)
				local var1604 = var1602
				var1596 = var1603
				var1595.action_type = t.ActionType.fromNumber(var1604) or var1604
			else
				local _ = nil
				local var1605, var1606 = protoModule.readVarInt(p85, var1596)
				local _ = var1605
				var1596 = var1606
			end
		end
		if var1597 == protoModule.wireTypes.lengthDelimited then
			if var1601 == 2 then
				local _ = nil
				local var1607, var1608 = protoModule.readBuffer(p85, var1596)
				var1596 = var1608
				var1595.action_params = t.OpenAddConnectionsPageAction_Params.decode(var1607)
			else
				local _ = nil
				local var1609, var1610 = protoModule.readVarInt(p85, var1596)
				var1596 = var1610 + var1609
			end
		elseif var1597 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1611, var1612 = protoModule.readFixed32(p85, var1596)
			local _ = var1611
			var1596 = var1612
		elseif var1597 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1613, var1614 = protoModule.readFixed64(p85, var1596)
			local _ = var1613
			var1596 = var1614
		else
			error("Unsupported wire type: " .. var1597)
		end
	end
	return var1595
end

function t_44:jsonEncode() --[[ line: 12120 ]]
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

function t_44:jsonDecode() --[[ line: 12142 ]]
	-- upvalues: t_44 (ref), t (ref)
	local var1616 = t_44.new()
	
	if self.action_type ~= nil then
		var1616.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1616.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1616.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1616.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.actionParams)
	end
	return var1616
end

t_44.descriptor = {
	name = "OpenAddConnectionsPageAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAddConnectionsPageAction"
}
t.OpenAddConnectionsPageAction = t_44
typeRegistryModule.default:register(t.OpenAddConnectionsPageAction)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p86) --[[ line: 12182 ]]
	-- upvalues: t_45 (ref)
	return setmetatable({
		user_id = if p86 == nil or p86.user_id == nil then nil else p86.user_id,
		source = if p86 == nil or p86.source == nil then nil else p86.source
	}, t_45)
end

function t_45:encode() --[[ line: 12191 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1618 = 0
	
	if self.user_id ~= nil then
		local var1619 = self.user_id:encode()
		local var1620, var1621 = protoModule.writeTag(buff, var1618, 1, protoModule.wireTypes.lengthDelimited)
		var1620, var1621 = protoModule.writeBuffer(var1620, var1621, var1619, buffer.len(var1619))
		buff = var1620
		var1618 = var1621
	end
	if self.source ~= nil then
		local var1622 = self.source:encode()
		local var1623, var1624 = protoModule.writeTag(buff, var1618, 2, protoModule.wireTypes.lengthDelimited)
		var1623, var1624 = protoModule.writeBuffer(var1623, var1624, var1622, buffer.len(var1622))
		buff = var1623
		var1618 = var1624
	end
	local buff_1 = buffer.create(var1618)
	buffer.copy(buff_1, 0, buff, 0, var1618)
	
	return buff_1
end

function t_45.decode(p87) --[[ line: 12212 ]]
	-- upvalues: t_45 (ref), protoModule (ref), propTypesModule (ref)
	local var1626 = t_45.new()
	local var1627 = 0
	while var1627 < buffer.len(p87) do
		local _ = nil
		local var1628 = nil
		local var1629, var1630, var1631 = protoModule.readTag(p87, var1627)
		local var1632 = var1629
		var1628 = var1630
		var1627 = var1631
		
		if var1628 == protoModule.wireTypes.varint then
			local _ = nil
			local var1633, var1634 = protoModule.readVarInt(p87, var1627)
			local _ = var1633
			var1627 = var1634
			continue
		end
		if var1628 == protoModule.wireTypes.lengthDelimited then
			if var1632 == 1 then
				local _ = nil
				local var1635, var1636 = protoModule.readBuffer(p87, var1627)
				var1627 = var1636
				var1626.user_id = propTypesModule.StringProp.decode(var1635)
			elseif var1632 == 2 then
				local _ = nil
				local var1637, var1638 = protoModule.readBuffer(p87, var1627)
				var1627 = var1638
				var1626.source = propTypesModule.StringProp.decode(var1637)
			else
				local _ = nil
				local var1639, var1640 = protoModule.readVarInt(p87, var1627)
				var1627 = var1640 + var1639
			end
		elseif var1628 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1641, var1642 = protoModule.readFixed32(p87, var1627)
			local _ = var1641
			var1627 = var1642
		elseif var1628 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1643, var1644 = protoModule.readFixed64(p87, var1627)
			local _ = var1643
			var1627 = var1644
		else
			error("Unsupported wire type: " .. var1628)
		end
	end
	return var1626
end

function t_45:jsonEncode() --[[ line: 12260 ]]
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_45:jsonDecode() --[[ line: 12274 ]]
	-- upvalues: t_45 (ref), propTypesModule (ref)
	local var1646 = t_45.new()
	
	if self.user_id ~= nil then
		var1646.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1646.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var1646.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var1646
end

t_45.descriptor = {
	name = "OpenAddConnectionsPageAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAddConnectionsPageAction_Params = t_45
typeRegistryModule.default:register(t.OpenAddConnectionsPageAction_Params)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p88) --[[ line: 12308 ]]
	-- upvalues: t (ref), t_46 (ref)
	return setmetatable({
		action_type = if p88 == nil or p88.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p88.action_type,
		action_params = if p88 == nil or p88.action_params == nil then nil else p88.action_params
	}, t_46)
end

function t_46:encode() --[[ line: 12317 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1648 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1649, var1650 = protoModule.writeTag(buff, var1648, 1, protoModule.wireTypes.varint)
		var1649, var1650 = protoModule.writeVarInt(var1649, var1650, t.ActionType.toNumber(self.action_type))
		buff = var1649
		var1648 = var1650
	end
	if self.action_params ~= nil then
		local var1651 = self.action_params:encode()
		local var1652, var1653 = protoModule.writeTag(buff, var1648, 2, protoModule.wireTypes.lengthDelimited)
		var1652, var1653 = protoModule.writeBuffer(var1652, var1653, var1651, buffer.len(var1651))
		buff = var1652
		var1648 = var1653
	end
	local buff_1 = buffer.create(var1648)
	buffer.copy(buff_1, 0, buff, 0, var1648)
	
	return buff_1
end

function t_46.decode(p89) --[[ line: 12343 ]]
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var1655 = t_46.new()
	local var1656 = 0
	while var1656 < buffer.len(p89) do
		local _ = nil
		local var1657 = nil
		local var1658, var1659, var1660 = protoModule.readTag(p89, var1656)
		local var1661 = var1658
		var1657 = var1659
		var1656 = var1660
		
		if var1657 == protoModule.wireTypes.varint then
			if var1661 == 1 then
				local _ = nil
				local var1662, var1663 = protoModule.readVarIntI32(p89, var1656)
				local var1664 = var1662
				var1656 = var1663
				var1655.action_type = t.ActionType.fromNumber(var1664) or var1664
			else
				local _ = nil
				local var1665, var1666 = protoModule.readVarInt(p89, var1656)
				local _ = var1665
				var1656 = var1666
			end
		end
		if var1657 == protoModule.wireTypes.lengthDelimited then
			if var1661 == 2 then
				local _ = nil
				local var1667, var1668 = protoModule.readBuffer(p89, var1656)
				var1656 = var1668
				var1655.action_params = t.OpenMarketplaceAction_Params.decode(var1667)
			else
				local _ = nil
				local var1669, var1670 = protoModule.readVarInt(p89, var1656)
				var1656 = var1670 + var1669
			end
		elseif var1657 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1671, var1672 = protoModule.readFixed32(p89, var1656)
			local _ = var1671
			var1656 = var1672
		elseif var1657 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1673, var1674 = protoModule.readFixed64(p89, var1656)
			local _ = var1673
			var1656 = var1674
		else
			error("Unsupported wire type: " .. var1657)
		end
	end
	return var1655
end

function t_46:jsonEncode() --[[ line: 12391 ]]
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

function t_46:jsonDecode() --[[ line: 12413 ]]
	-- upvalues: t_46 (ref), t (ref)
	local var1676 = t_46.new()
	
	if self.action_type ~= nil then
		var1676.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1676.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1676.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1676.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.actionParams)
	end
	return var1676
end

t_46.descriptor = {
	name = "OpenMarketplaceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceAction"
}
t.OpenMarketplaceAction = t_46
typeRegistryModule.default:register(t.OpenMarketplaceAction)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p90) --[[ line: 12453 ]]
	-- upvalues: t_47 (ref)
	return setmetatable({
		user_id = if p90 == nil or p90.user_id == nil then nil else p90.user_id,
		source = if p90 == nil or p90.source == nil then nil else p90.source
	}, t_47)
end

function t_47:encode() --[[ line: 12462 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1678 = 0
	
	if self.user_id ~= nil then
		local var1679 = self.user_id:encode()
		local var1680, var1681 = protoModule.writeTag(buff, var1678, 1, protoModule.wireTypes.lengthDelimited)
		var1680, var1681 = protoModule.writeBuffer(var1680, var1681, var1679, buffer.len(var1679))
		buff = var1680
		var1678 = var1681
	end
	if self.source ~= nil then
		local var1682 = self.source:encode()
		local var1683, var1684 = protoModule.writeTag(buff, var1678, 2, protoModule.wireTypes.lengthDelimited)
		var1683, var1684 = protoModule.writeBuffer(var1683, var1684, var1682, buffer.len(var1682))
		buff = var1683
		var1678 = var1684
	end
	local buff_1 = buffer.create(var1678)
	buffer.copy(buff_1, 0, buff, 0, var1678)
	
	return buff_1
end

function t_47.decode(p91) --[[ line: 12483 ]]
	-- upvalues: t_47 (ref), protoModule (ref), propTypesModule (ref)
	local var1686 = t_47.new()
	local var1687 = 0
	while var1687 < buffer.len(p91) do
		local _ = nil
		local var1688 = nil
		local var1689, var1690, var1691 = protoModule.readTag(p91, var1687)
		local var1692 = var1689
		var1688 = var1690
		var1687 = var1691
		
		if var1688 == protoModule.wireTypes.varint then
			local _ = nil
			local var1693, var1694 = protoModule.readVarInt(p91, var1687)
			local _ = var1693
			var1687 = var1694
			continue
		end
		if var1688 == protoModule.wireTypes.lengthDelimited then
			if var1692 == 1 then
				local _ = nil
				local var1695, var1696 = protoModule.readBuffer(p91, var1687)
				var1687 = var1696
				var1686.user_id = propTypesModule.StringProp.decode(var1695)
			elseif var1692 == 2 then
				local _ = nil
				local var1697, var1698 = protoModule.readBuffer(p91, var1687)
				var1687 = var1698
				var1686.source = propTypesModule.StringProp.decode(var1697)
			else
				local _ = nil
				local var1699, var1700 = protoModule.readVarInt(p91, var1687)
				var1687 = var1700 + var1699
			end
		elseif var1688 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1701, var1702 = protoModule.readFixed32(p91, var1687)
			local _ = var1701
			var1687 = var1702
		elseif var1688 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1703, var1704 = protoModule.readFixed64(p91, var1687)
			local _ = var1703
			var1687 = var1704
		else
			error("Unsupported wire type: " .. var1688)
		end
	end
	return var1686
end

function t_47:jsonEncode() --[[ line: 12531 ]]
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_47:jsonDecode() --[[ line: 12545 ]]
	-- upvalues: t_47 (ref), propTypesModule (ref)
	local var1706 = t_47.new()
	
	if self.user_id ~= nil then
		var1706.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1706.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var1706.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var1706
end

t_47.descriptor = {
	name = "OpenMarketplaceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceAction_Params = t_47
typeRegistryModule.default:register(t.OpenMarketplaceAction_Params)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p92) --[[ line: 12577 ]]
	-- upvalues: t (ref), t_48 (ref)
	return setmetatable({
		action_type = if p92 == nil or p92.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p92.action_type,
		action_params = if p92 == nil or p92.action_params == nil then nil else p92.action_params
	}, t_48)
end

function t_48:encode() --[[ line: 12588 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1708 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1709, var1710 = protoModule.writeTag(buff, var1708, 1, protoModule.wireTypes.varint)
		var1709, var1710 = protoModule.writeVarInt(var1709, var1710, t.ActionType.toNumber(self.action_type))
		buff = var1709
		var1708 = var1710
	end
	if self.action_params ~= nil then
		local var1711 = self.action_params:encode()
		local var1712, var1713 = protoModule.writeTag(buff, var1708, 2, protoModule.wireTypes.lengthDelimited)
		var1712, var1713 = protoModule.writeBuffer(var1712, var1713, var1711, buffer.len(var1711))
		buff = var1712
		var1708 = var1713
	end
	local buff_1 = buffer.create(var1708)
	buffer.copy(buff_1, 0, buff, 0, var1708)
	
	return buff_1
end

function t_48.decode(p93) --[[ line: 12614 ]]
	-- upvalues: t_48 (ref), protoModule (ref), t (ref)
	local var1715 = t_48.new()
	local var1716 = 0
	while var1716 < buffer.len(p93) do
		local _ = nil
		local var1717 = nil
		local var1718, var1719, var1720 = protoModule.readTag(p93, var1716)
		local var1721 = var1718
		var1717 = var1719
		var1716 = var1720
		
		if var1717 == protoModule.wireTypes.varint then
			if var1721 == 1 then
				local _ = nil
				local var1722, var1723 = protoModule.readVarIntI32(p93, var1716)
				local var1724 = var1722
				var1716 = var1723
				var1715.action_type = t.ActionType.fromNumber(var1724) or var1724
			else
				local _ = nil
				local var1725, var1726 = protoModule.readVarInt(p93, var1716)
				local _ = var1725
				var1716 = var1726
			end
		end
		if var1717 == protoModule.wireTypes.lengthDelimited then
			if var1721 == 2 then
				local _ = nil
				local var1727, var1728 = protoModule.readBuffer(p93, var1716)
				var1716 = var1728
				var1715.action_params = t.HideProfileCompletionAction_Params.decode(var1727)
			else
				local _ = nil
				local var1729, var1730 = protoModule.readVarInt(p93, var1716)
				var1716 = var1730 + var1729
			end
		elseif var1717 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1731, var1732 = protoModule.readFixed32(p93, var1716)
			local _ = var1731
			var1716 = var1732
		elseif var1717 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1733, var1734 = protoModule.readFixed64(p93, var1716)
			local _ = var1733
			var1716 = var1734
		else
			error("Unsupported wire type: " .. var1717)
		end
	end
	return var1715
end

function t_48:jsonEncode() --[[ line: 12662 ]]
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

function t_48:jsonDecode() --[[ line: 12684 ]]
	-- upvalues: t_48 (ref), t (ref)
	local var1736 = t_48.new()
	
	if self.action_type ~= nil then
		var1736.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1736.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1736.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1736.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.actionParams)
	end
	return var1736
end

t_48.descriptor = {
	name = "HideProfileCompletionAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.HideProfileCompletionAction"
}
t.HideProfileCompletionAction = t_48
typeRegistryModule.default:register(t.HideProfileCompletionAction)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p94) --[[ line: 12724 ]]
	-- upvalues: t_49 (ref)
	return setmetatable({
		user_id = if p94 == nil or p94.user_id == nil then nil else p94.user_id,
		prompt_id = if p94 == nil or p94.prompt_id == nil then nil else p94.prompt_id,
		source = if p94 == nil or p94.source == nil then nil else p94.source,
		prompt_type = if p94 == nil or p94.prompt_type == nil then nil else p94.prompt_type
	}, t_49)
end

function t_49:encode() --[[ line: 12735 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1738 = 0
	
	if self.user_id ~= nil then
		local var1739 = self.user_id:encode()
		local var1740, var1741 = protoModule.writeTag(buff, var1738, 1, protoModule.wireTypes.lengthDelimited)
		var1740, var1741 = protoModule.writeBuffer(var1740, var1741, var1739, buffer.len(var1739))
		buff = var1740
		var1738 = var1741
	end
	if self.prompt_id ~= nil then
		local var1742 = self.prompt_id:encode()
		local var1743, var1744 = protoModule.writeTag(buff, var1738, 2, protoModule.wireTypes.lengthDelimited)
		var1743, var1744 = protoModule.writeBuffer(var1743, var1744, var1742, buffer.len(var1742))
		buff = var1743
		var1738 = var1744
	end
	if self.source ~= nil then
		local var1745 = self.source:encode()
		local var1746, var1747 = protoModule.writeTag(buff, var1738, 3, protoModule.wireTypes.lengthDelimited)
		var1746, var1747 = protoModule.writeBuffer(var1746, var1747, var1745, buffer.len(var1745))
		buff = var1746
		var1738 = var1747
	end
	if self.prompt_type ~= nil then
		local var1748 = self.prompt_type:encode()
		local var1749, var1750 = protoModule.writeTag(buff, var1738, 4, protoModule.wireTypes.lengthDelimited)
		var1749, var1750 = protoModule.writeBuffer(var1749, var1750, var1748, buffer.len(var1748))
		buff = var1749
		var1738 = var1750
	end
	local buff_1 = buffer.create(var1738)
	buffer.copy(buff_1, 0, buff, 0, var1738)
	
	return buff_1
end

function t_49.decode(p95) --[[ line: 12768 ]]
	-- upvalues: t_49 (ref), protoModule (ref), propTypesModule (ref)
	local var1752 = t_49.new()
	local var1753 = 0
	while var1753 < buffer.len(p95) do
		local _ = nil
		local var1754 = nil
		local var1755, var1756, var1757 = protoModule.readTag(p95, var1753)
		local var1758 = var1755
		var1754 = var1756
		var1753 = var1757
		
		if var1754 == protoModule.wireTypes.varint then
			local _ = nil
			local var1759, var1760 = protoModule.readVarInt(p95, var1753)
			local _ = var1759
			var1753 = var1760
			continue
		end
		if var1754 == protoModule.wireTypes.lengthDelimited then
			if var1758 == 1 then
				local _ = nil
				local var1761, var1762 = protoModule.readBuffer(p95, var1753)
				var1753 = var1762
				var1752.user_id = propTypesModule.StringProp.decode(var1761)
			elseif var1758 == 2 then
				local _ = nil
				local var1763, var1764 = protoModule.readBuffer(p95, var1753)
				var1753 = var1764
				var1752.prompt_id = propTypesModule.StringProp.decode(var1763)
			elseif var1758 == 3 then
				local _ = nil
				local var1765, var1766 = protoModule.readBuffer(p95, var1753)
				var1753 = var1766
				var1752.source = propTypesModule.StringProp.decode(var1765)
			elseif var1758 == 4 then
				local _ = nil
				local var1767, var1768 = protoModule.readBuffer(p95, var1753)
				var1753 = var1768
				var1752.prompt_type = propTypesModule.StringProp.decode(var1767)
			else
				local _ = nil
				local var1769, var1770 = protoModule.readVarInt(p95, var1753)
				var1753 = var1770 + var1769
			end
		elseif var1754 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1771, var1772 = protoModule.readFixed32(p95, var1753)
			local _ = var1771
			var1753 = var1772
		elseif var1754 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1773, var1774 = protoModule.readFixed64(p95, var1753)
			local _ = var1773
			var1753 = var1774
		else
			error("Unsupported wire type: " .. var1754)
		end
	end
	return var1752
end

function t_49:jsonEncode() --[[ line: 12826 ]]
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

function t_49:jsonDecode() --[[ line: 12848 ]]
	-- upvalues: t_49 (ref), propTypesModule (ref)
	local var1776 = t_49.new()
	
	if self.user_id ~= nil then
		var1776.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1776.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.prompt_id ~= nil then
		var1776.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1776.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.source ~= nil then
		var1776.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.prompt_type ~= nil then
		var1776.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1776.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	return var1776
end

t_49.descriptor = {
	name = "HideProfileCompletionAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.HideProfileCompletionAction_Params = t_49
typeRegistryModule.default:register(t.HideProfileCompletionAction_Params)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p96) --[[ line: 12899 ]]
	-- upvalues: t (ref), t_50 (ref)
	return setmetatable({
		action_type = if p96 == nil or p96.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p96.action_type,
		action_params = if p96 == nil or p96.action_params == nil then nil else p96.action_params
	}, t_50)
end

function t_50:encode() --[[ line: 12910 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1778 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1779, var1780 = protoModule.writeTag(buff, var1778, 1, protoModule.wireTypes.varint)
		var1779, var1780 = protoModule.writeVarInt(var1779, var1780, t.ActionType.toNumber(self.action_type))
		buff = var1779
		var1778 = var1780
	end
	if self.action_params ~= nil then
		local var1781 = self.action_params:encode()
		local var1782, var1783 = protoModule.writeTag(buff, var1778, 2, protoModule.wireTypes.lengthDelimited)
		var1782, var1783 = protoModule.writeBuffer(var1782, var1783, var1781, buffer.len(var1781))
		buff = var1782
		var1778 = var1783
	end
	local buff_1 = buffer.create(var1778)
	buffer.copy(buff_1, 0, buff, 0, var1778)
	
	return buff_1
end

function t_50.decode(p97) --[[ line: 12936 ]]
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var1785 = t_50.new()
	local var1786 = 0
	while var1786 < buffer.len(p97) do
		local _ = nil
		local var1787 = nil
		local var1788, var1789, var1790 = protoModule.readTag(p97, var1786)
		local var1791 = var1788
		var1787 = var1789
		var1786 = var1790
		
		if var1787 == protoModule.wireTypes.varint then
			if var1791 == 1 then
				local _ = nil
				local var1792, var1793 = protoModule.readVarIntI32(p97, var1786)
				local var1794 = var1792
				var1786 = var1793
				var1785.action_type = t.ActionType.fromNumber(var1794) or var1794
			else
				local _ = nil
				local var1795, var1796 = protoModule.readVarInt(p97, var1786)
				local _ = var1795
				var1786 = var1796
			end
		end
		if var1787 == protoModule.wireTypes.lengthDelimited then
			if var1791 == 2 then
				local _ = nil
				local var1797, var1798 = protoModule.readBuffer(p97, var1786)
				var1786 = var1798
				var1785.action_params = t.SelectMarketplaceCatalogCategory_Params.decode(var1797)
			else
				local _ = nil
				local var1799, var1800 = protoModule.readVarInt(p97, var1786)
				var1786 = var1800 + var1799
			end
		elseif var1787 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1801, var1802 = protoModule.readFixed32(p97, var1786)
			local _ = var1801
			var1786 = var1802
		elseif var1787 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1803, var1804 = protoModule.readFixed64(p97, var1786)
			local _ = var1803
			var1786 = var1804
		else
			error("Unsupported wire type: " .. var1787)
		end
	end
	return var1785
end

function t_50:jsonEncode() --[[ line: 12984 ]]
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

function t_50:jsonDecode() --[[ line: 13006 ]]
	-- upvalues: t_50 (ref), t (ref)
	local var1806 = t_50.new()
	
	if self.action_type ~= nil then
		var1806.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1806.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1806.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1806.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.actionParams)
	end
	return var1806
end

t_50.descriptor = {
	name = "SelectMarketplaceCatalogCategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogCategory"
}
t.SelectMarketplaceCatalogCategory = t_50
typeRegistryModule.default:register(t.SelectMarketplaceCatalogCategory)
local t_51 = {}
t_51.__index = t_51

function t_51.new(p98) --[[ line: 13048 ]]
	-- upvalues: t_51 (ref)
	return setmetatable({
		category_id = if p98 == nil or p98.category_id == nil then nil else p98.category_id
	}, t_51)
end

function t_51:encode() --[[ line: 13056 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1808 = 0
	
	if self.category_id ~= nil then
		local var1809 = self.category_id:encode()
		local var1810, var1811 = protoModule.writeTag(buff, var1808, 1, protoModule.wireTypes.lengthDelimited)
		var1810, var1811 = protoModule.writeBuffer(var1810, var1811, var1809, buffer.len(var1809))
		buff = var1810
		var1808 = var1811
	end
	local buff_1 = buffer.create(var1808)
	buffer.copy(buff_1, 0, buff, 0, var1808)
	
	return buff_1
end

function t_51.decode(p99) --[[ line: 13071 ]]
	-- upvalues: t_51 (ref), protoModule (ref), propTypesModule (ref)
	local var1813 = t_51.new()
	local var1814 = 0
	while var1814 < buffer.len(p99) do
		local _ = nil
		local var1815 = nil
		local var1816, var1817, var1818 = protoModule.readTag(p99, var1814)
		local var1819 = var1816
		var1815 = var1817
		var1814 = var1818
		
		if var1815 == protoModule.wireTypes.varint then
			local _ = nil
			local var1820, var1821 = protoModule.readVarInt(p99, var1814)
			local _ = var1820
			var1814 = var1821
			continue
		end
		if var1815 == protoModule.wireTypes.lengthDelimited then
			if var1819 == 1 then
				local _ = nil
				local var1822, var1823 = protoModule.readBuffer(p99, var1814)
				var1814 = var1823
				var1813.category_id = propTypesModule.StringProp.decode(var1822)
			else
				local _ = nil
				local var1824, var1825 = protoModule.readVarInt(p99, var1814)
				var1814 = var1825 + var1824
			end
		elseif var1815 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1826, var1827 = protoModule.readFixed32(p99, var1814)
			local _ = var1826
			var1814 = var1827
		elseif var1815 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1828, var1829 = protoModule.readFixed64(p99, var1814)
			local _ = var1828
			var1814 = var1829
		else
			error("Unsupported wire type: " .. var1815)
		end
	end
	return var1813
end

function t_51:jsonEncode() --[[ line: 13114 ]]
	local t = {}
	
	if self.category_id ~= nil then
		t.categoryId = self.category_id:jsonEncode()
	end
	return t
end

function t_51:jsonDecode() --[[ line: 13124 ]]
	-- upvalues: t_51 (ref), propTypesModule (ref)
	local var1831 = t_51.new()
	
	if self.category_id ~= nil then
		var1831.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var1831.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	return var1831
end

t_51.descriptor = {
	name = "SelectMarketplaceCatalogCategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceCatalogCategory_Params = t_51
typeRegistryModule.default:register(t.SelectMarketplaceCatalogCategory_Params)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p100) --[[ line: 13155 ]]
	-- upvalues: t (ref), t_52 (ref)
	return setmetatable({
		action_type = if p100 == nil or p100.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p100.action_type,
		action_params = if p100 == nil or p100.action_params == nil then nil else p100.action_params
	}, t_52)
end

function t_52:encode() --[[ line: 13166 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1833 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1834, var1835 = protoModule.writeTag(buff, var1833, 1, protoModule.wireTypes.varint)
		var1834, var1835 = protoModule.writeVarInt(var1834, var1835, t.ActionType.toNumber(self.action_type))
		buff = var1834
		var1833 = var1835
	end
	if self.action_params ~= nil then
		local var1836 = self.action_params:encode()
		local var1837, var1838 = protoModule.writeTag(buff, var1833, 2, protoModule.wireTypes.lengthDelimited)
		var1837, var1838 = protoModule.writeBuffer(var1837, var1838, var1836, buffer.len(var1836))
		buff = var1837
		var1833 = var1838
	end
	local buff_1 = buffer.create(var1833)
	buffer.copy(buff_1, 0, buff, 0, var1833)
	
	return buff_1
end

function t_52.decode(p101) --[[ line: 13192 ]]
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1840 = t_52.new()
	local var1841 = 0
	while var1841 < buffer.len(p101) do
		local _ = nil
		local var1842 = nil
		local var1843, var1844, var1845 = protoModule.readTag(p101, var1841)
		local var1846 = var1843
		var1842 = var1844
		var1841 = var1845
		
		if var1842 == protoModule.wireTypes.varint then
			if var1846 == 1 then
				local _ = nil
				local var1847, var1848 = protoModule.readVarIntI32(p101, var1841)
				local var1849 = var1847
				var1841 = var1848
				var1840.action_type = t.ActionType.fromNumber(var1849) or var1849
			else
				local _ = nil
				local var1850, var1851 = protoModule.readVarInt(p101, var1841)
				local _ = var1850
				var1841 = var1851
			end
		end
		if var1842 == protoModule.wireTypes.lengthDelimited then
			if var1846 == 2 then
				local _ = nil
				local var1852, var1853 = protoModule.readBuffer(p101, var1841)
				var1841 = var1853
				var1840.action_params = t.SelectMarketplaceCatalogSubcategory_Params.decode(var1852)
			else
				local _ = nil
				local var1854, var1855 = protoModule.readVarInt(p101, var1841)
				var1841 = var1855 + var1854
			end
		elseif var1842 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1856, var1857 = protoModule.readFixed32(p101, var1841)
			local _ = var1856
			var1841 = var1857
		elseif var1842 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1858, var1859 = protoModule.readFixed64(p101, var1841)
			local _ = var1858
			var1841 = var1859
		else
			error("Unsupported wire type: " .. var1842)
		end
	end
	return var1840
end

function t_52:jsonEncode() --[[ line: 13240 ]]
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

function t_52:jsonDecode() --[[ line: 13262 ]]
	-- upvalues: t_52 (ref), t (ref)
	local var1861 = t_52.new()
	
	if self.action_type ~= nil then
		var1861.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1861.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1861.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1861.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.actionParams)
	end
	return var1861
end

t_52.descriptor = {
	name = "SelectMarketplaceCatalogSubcategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogSubcategory"
}
t.SelectMarketplaceCatalogSubcategory = t_52
typeRegistryModule.default:register(t.SelectMarketplaceCatalogSubcategory)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p102) --[[ line: 13304 ]]
	-- upvalues: t_53 (ref)
	return setmetatable({
		subcategory_id = if p102 == nil or p102.subcategory_id == nil then nil else p102.subcategory_id
	}, t_53)
end

function t_53:encode() --[[ line: 13312 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1863 = 0
	
	if self.subcategory_id ~= nil then
		local var1864 = self.subcategory_id:encode()
		local var1865, var1866 = protoModule.writeTag(buff, var1863, 1, protoModule.wireTypes.lengthDelimited)
		var1865, var1866 = protoModule.writeBuffer(var1865, var1866, var1864, buffer.len(var1864))
		buff = var1865
		var1863 = var1866
	end
	local buff_1 = buffer.create(var1863)
	buffer.copy(buff_1, 0, buff, 0, var1863)
	
	return buff_1
end

function t_53.decode(p103) --[[ line: 13329 ]]
	-- upvalues: t_53 (ref), protoModule (ref), propTypesModule (ref)
	local var1868 = t_53.new()
	local var1869 = 0
	while var1869 < buffer.len(p103) do
		local _ = nil
		local var1870 = nil
		local var1871, var1872, var1873 = protoModule.readTag(p103, var1869)
		local var1874 = var1871
		var1870 = var1872
		var1869 = var1873
		
		if var1870 == protoModule.wireTypes.varint then
			local _ = nil
			local var1875, var1876 = protoModule.readVarInt(p103, var1869)
			local _ = var1875
			var1869 = var1876
			continue
		end
		if var1870 == protoModule.wireTypes.lengthDelimited then
			if var1874 == 1 then
				local _ = nil
				local var1877, var1878 = protoModule.readBuffer(p103, var1869)
				var1869 = var1878
				var1868.subcategory_id = propTypesModule.StringProp.decode(var1877)
			else
				local _ = nil
				local var1879, var1880 = protoModule.readVarInt(p103, var1869)
				var1869 = var1880 + var1879
			end
		elseif var1870 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1881, var1882 = protoModule.readFixed32(p103, var1869)
			local _ = var1881
			var1869 = var1882
		elseif var1870 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1883, var1884 = protoModule.readFixed64(p103, var1869)
			local _ = var1883
			var1869 = var1884
		else
			error("Unsupported wire type: " .. var1870)
		end
	end
	return var1868
end

function t_53:jsonEncode() --[[ line: 13374 ]]
	local t = {}
	
	if self.subcategory_id ~= nil then
		t.subcategoryId = self.subcategory_id:jsonEncode()
	end
	return t
end

function t_53:jsonDecode() --[[ line: 13386 ]]
	-- upvalues: t_53 (ref), propTypesModule (ref)
	local var1886 = t_53.new()
	
	if self.subcategory_id ~= nil then
		var1886.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var1886.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	return var1886
end

t_53.descriptor = {
	name = "SelectMarketplaceCatalogSubcategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceCatalogSubcategory_Params = t_53
typeRegistryModule.default:register(t.SelectMarketplaceCatalogSubcategory_Params)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p104) --[[ line: 13418 ]]
	-- upvalues: t (ref), t_54 (ref)
	return setmetatable({
		action_type = if p104 == nil or p104.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p104.action_type,
		action_params = if p104 == nil or p104.action_params == nil then nil else p104.action_params
	}, t_54)
end

function t_54:encode() --[[ line: 13429 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1888 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1889, var1890 = protoModule.writeTag(buff, var1888, 1, protoModule.wireTypes.varint)
		var1889, var1890 = protoModule.writeVarInt(var1889, var1890, t.ActionType.toNumber(self.action_type))
		buff = var1889
		var1888 = var1890
	end
	if self.action_params ~= nil then
		local var1891 = self.action_params:encode()
		local var1892, var1893 = protoModule.writeTag(buff, var1888, 2, protoModule.wireTypes.lengthDelimited)
		var1892, var1893 = protoModule.writeBuffer(var1892, var1893, var1891, buffer.len(var1891))
		buff = var1892
		var1888 = var1893
	end
	local buff_1 = buffer.create(var1888)
	buffer.copy(buff_1, 0, buff, 0, var1888)
	
	return buff_1
end

function t_54.decode(p105) --[[ line: 13455 ]]
	-- upvalues: t_54 (ref), protoModule (ref), t (ref)
	local var1895 = t_54.new()
	local var1896 = 0
	while var1896 < buffer.len(p105) do
		local _ = nil
		local var1897 = nil
		local var1898, var1899, var1900 = protoModule.readTag(p105, var1896)
		local var1901 = var1898
		var1897 = var1899
		var1896 = var1900
		
		if var1897 == protoModule.wireTypes.varint then
			if var1901 == 1 then
				local _ = nil
				local var1902, var1903 = protoModule.readVarIntI32(p105, var1896)
				local var1904 = var1902
				var1896 = var1903
				var1895.action_type = t.ActionType.fromNumber(var1904) or var1904
			else
				local _ = nil
				local var1905, var1906 = protoModule.readVarInt(p105, var1896)
				local _ = var1905
				var1896 = var1906
			end
		end
		if var1897 == protoModule.wireTypes.lengthDelimited then
			if var1901 == 2 then
				local _ = nil
				local var1907, var1908 = protoModule.readBuffer(p105, var1896)
				var1896 = var1908
				var1895.action_params = t.OpenMarketplaceCatalogSeeAll_Params.decode(var1907)
			else
				local _ = nil
				local var1909, var1910 = protoModule.readVarInt(p105, var1896)
				var1896 = var1910 + var1909
			end
		elseif var1897 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1911, var1912 = protoModule.readFixed32(p105, var1896)
			local _ = var1911
			var1896 = var1912
		elseif var1897 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1913, var1914 = protoModule.readFixed64(p105, var1896)
			local _ = var1913
			var1896 = var1914
		else
			error("Unsupported wire type: " .. var1897)
		end
	end
	return var1895
end

function t_54:jsonEncode() --[[ line: 13503 ]]
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

function t_54:jsonDecode() --[[ line: 13525 ]]
	-- upvalues: t_54 (ref), t (ref)
	local var1916 = t_54.new()
	
	if self.action_type ~= nil then
		var1916.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1916.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1916.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1916.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.actionParams)
	end
	return var1916
end

t_54.descriptor = {
	name = "OpenMarketplaceCatalogSeeAll",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogSeeAll"
}
t.OpenMarketplaceCatalogSeeAll = t_54
typeRegistryModule.default:register(t.OpenMarketplaceCatalogSeeAll)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p106) --[[ line: 13565 ]]
	-- upvalues: t_55 (ref)
	return setmetatable({
		sort_id = if p106 == nil or p106.sort_id == nil then nil else p106.sort_id,
		title = if p106 == nil or p106.title == nil then nil else p106.title,
		description = if p106 == nil or p106.description == nil then nil else p106.description,
		tooltip_text = if p106 == nil or p106.tooltip_text == nil then nil else p106.tooltip_text
	}, t_55)
end

function t_55:encode() --[[ line: 13576 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1918 = 0
	
	if self.sort_id ~= nil then
		local var1919 = self.sort_id:encode()
		local var1920, var1921 = protoModule.writeTag(buff, var1918, 1, protoModule.wireTypes.lengthDelimited)
		var1920, var1921 = protoModule.writeBuffer(var1920, var1921, var1919, buffer.len(var1919))
		buff = var1920
		var1918 = var1921
	end
	if self.title ~= nil then
		local var1922 = self.title:encode()
		local var1923, var1924 = protoModule.writeTag(buff, var1918, 2, protoModule.wireTypes.lengthDelimited)
		var1923, var1924 = protoModule.writeBuffer(var1923, var1924, var1922, buffer.len(var1922))
		buff = var1923
		var1918 = var1924
	end
	if self.description ~= nil then
		local var1925 = self.description:encode()
		local var1926, var1927 = protoModule.writeTag(buff, var1918, 3, protoModule.wireTypes.lengthDelimited)
		var1926, var1927 = protoModule.writeBuffer(var1926, var1927, var1925, buffer.len(var1925))
		buff = var1926
		var1918 = var1927
	end
	if self.tooltip_text ~= nil then
		local var1928 = self.tooltip_text:encode()
		local var1929, var1930 = protoModule.writeTag(buff, var1918, 4, protoModule.wireTypes.lengthDelimited)
		var1929, var1930 = protoModule.writeBuffer(var1929, var1930, var1928, buffer.len(var1928))
		buff = var1929
		var1918 = var1930
	end
	local buff_1 = buffer.create(var1918)
	buffer.copy(buff_1, 0, buff, 0, var1918)
	
	return buff_1
end

function t_55.decode(p107) --[[ line: 13609 ]]
	-- upvalues: t_55 (ref), protoModule (ref), propTypesModule (ref)
	local var1932 = t_55.new()
	local var1933 = 0
	while var1933 < buffer.len(p107) do
		local _ = nil
		local var1934 = nil
		local var1935, var1936, var1937 = protoModule.readTag(p107, var1933)
		local var1938 = var1935
		var1934 = var1936
		var1933 = var1937
		
		if var1934 == protoModule.wireTypes.varint then
			local _ = nil
			local var1939, var1940 = protoModule.readVarInt(p107, var1933)
			local _ = var1939
			var1933 = var1940
			continue
		end
		if var1934 == protoModule.wireTypes.lengthDelimited then
			if var1938 == 1 then
				local _ = nil
				local var1941, var1942 = protoModule.readBuffer(p107, var1933)
				var1933 = var1942
				var1932.sort_id = propTypesModule.StringProp.decode(var1941)
			elseif var1938 == 2 then
				local _ = nil
				local var1943, var1944 = protoModule.readBuffer(p107, var1933)
				var1933 = var1944
				var1932.title = propTypesModule.StringProp.decode(var1943)
			elseif var1938 == 3 then
				local _ = nil
				local var1945, var1946 = protoModule.readBuffer(p107, var1933)
				var1933 = var1946
				var1932.description = propTypesModule.StringProp.decode(var1945)
			elseif var1938 == 4 then
				local _ = nil
				local var1947, var1948 = protoModule.readBuffer(p107, var1933)
				var1933 = var1948
				var1932.tooltip_text = propTypesModule.StringProp.decode(var1947)
			else
				local _ = nil
				local var1949, var1950 = protoModule.readVarInt(p107, var1933)
				var1933 = var1950 + var1949
			end
		elseif var1934 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1951, var1952 = protoModule.readFixed32(p107, var1933)
			local _ = var1951
			var1933 = var1952
		elseif var1934 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1953, var1954 = protoModule.readFixed64(p107, var1933)
			local _ = var1953
			var1933 = var1954
		else
			error("Unsupported wire type: " .. var1934)
		end
	end
	return var1932
end

function t_55:jsonEncode() --[[ line: 13667 ]]
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

function t_55:jsonDecode() --[[ line: 13689 ]]
	-- upvalues: t_55 (ref), propTypesModule (ref)
	local var1956 = t_55.new()
	
	if self.sort_id ~= nil then
		var1956.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var1956.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.title ~= nil then
		var1956.title = propTypesModule.StringProp.jsonDecode(self.title)
	end
	if self.description ~= nil then
		var1956.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.tooltip_text ~= nil then
		var1956.tooltip_text = propTypesModule.StringProp.jsonDecode(self.tooltip_text)
	end
	if self.tooltipText ~= nil then
		var1956.tooltip_text = propTypesModule.StringProp.jsonDecode(self.tooltipText)
	end
	return var1956
end

t_55.descriptor = {
	name = "OpenMarketplaceCatalogSeeAll_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceCatalogSeeAll_Params = t_55
typeRegistryModule.default:register(t.OpenMarketplaceCatalogSeeAll_Params)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p108) --[[ line: 13738 ]]
	-- upvalues: t (ref), t_56 (ref)
	return setmetatable({
		action_type = if p108 == nil or p108.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p108.action_type,
		action_params = if p108 == nil or p108.action_params == nil then nil else p108.action_params
	}, t_56)
end

function t_56:encode() --[[ line: 13749 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1958 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1959, var1960 = protoModule.writeTag(buff, var1958, 1, protoModule.wireTypes.varint)
		var1959, var1960 = protoModule.writeVarInt(var1959, var1960, t.ActionType.toNumber(self.action_type))
		buff = var1959
		var1958 = var1960
	end
	if self.action_params ~= nil then
		local var1961 = self.action_params:encode()
		local var1962, var1963 = protoModule.writeTag(buff, var1958, 2, protoModule.wireTypes.lengthDelimited)
		var1962, var1963 = protoModule.writeBuffer(var1962, var1963, var1961, buffer.len(var1961))
		buff = var1962
		var1958 = var1963
	end
	local buff_1 = buffer.create(var1958)
	buffer.copy(buff_1, 0, buff, 0, var1958)
	
	return buff_1
end

function t_56.decode(p109) --[[ line: 13775 ]]
	-- upvalues: t_56 (ref), protoModule (ref), t (ref)
	local var1965 = t_56.new()
	local var1966 = 0
	while var1966 < buffer.len(p109) do
		local _ = nil
		local var1967 = nil
		local var1968, var1969, var1970 = protoModule.readTag(p109, var1966)
		local var1971 = var1968
		var1967 = var1969
		var1966 = var1970
		
		if var1967 == protoModule.wireTypes.varint then
			if var1971 == 1 then
				local _ = nil
				local var1972, var1973 = protoModule.readVarIntI32(p109, var1966)
				local var1974 = var1972
				var1966 = var1973
				var1965.action_type = t.ActionType.fromNumber(var1974) or var1974
			else
				local _ = nil
				local var1975, var1976 = protoModule.readVarInt(p109, var1966)
				local _ = var1975
				var1966 = var1976
			end
		end
		if var1967 == protoModule.wireTypes.lengthDelimited then
			if var1971 == 2 then
				local _ = nil
				local var1977, var1978 = protoModule.readBuffer(p109, var1966)
				var1966 = var1978
				var1965.action_params = t.CloseMarketplaceCategoryTooltip_Params.decode(var1977)
			else
				local _ = nil
				local var1979, var1980 = protoModule.readVarInt(p109, var1966)
				var1966 = var1980 + var1979
			end
		elseif var1967 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1981, var1982 = protoModule.readFixed32(p109, var1966)
			local _ = var1981
			var1966 = var1982
		elseif var1967 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1983, var1984 = protoModule.readFixed64(p109, var1966)
			local _ = var1983
			var1966 = var1984
		else
			error("Unsupported wire type: " .. var1967)
		end
	end
	return var1965
end

function t_56:jsonEncode() --[[ line: 13823 ]]
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

function t_56:jsonDecode() --[[ line: 13845 ]]
	-- upvalues: t_56 (ref), t (ref)
	local var1986 = t_56.new()
	
	if self.action_type ~= nil then
		var1986.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1986.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1986.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1986.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.actionParams)
	end
	return var1986
end

t_56.descriptor = {
	name = "CloseMarketplaceCategoryTooltip",
	fullName = "roblox.apppageplatform.shared.v1beta1.CloseMarketplaceCategoryTooltip"
}
t.CloseMarketplaceCategoryTooltip = t_56
typeRegistryModule.default:register(t.CloseMarketplaceCategoryTooltip)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p110) --[[ line: 13885 ]]
	-- upvalues: t_57 (ref)
	return setmetatable({
		tooltip_id = if p110 == nil or p110.tooltip_id == nil then nil else p110.tooltip_id
	}, t_57)
end

function t_57:encode() --[[ line: 13893 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1988 = 0
	
	if self.tooltip_id ~= nil then
		local var1989 = self.tooltip_id:encode()
		local var1990, var1991 = protoModule.writeTag(buff, var1988, 1, protoModule.wireTypes.lengthDelimited)
		var1990, var1991 = protoModule.writeBuffer(var1990, var1991, var1989, buffer.len(var1989))
		buff = var1990
		var1988 = var1991
	end
	local buff_1 = buffer.create(var1988)
	buffer.copy(buff_1, 0, buff, 0, var1988)
	
	return buff_1
end

function t_57.decode(p111) --[[ line: 13908 ]]
	-- upvalues: t_57 (ref), protoModule (ref), propTypesModule (ref)
	local var1993 = t_57.new()
	local var1994 = 0
	while var1994 < buffer.len(p111) do
		local _ = nil
		local var1995 = nil
		local var1996, var1997, var1998 = protoModule.readTag(p111, var1994)
		local var1999 = var1996
		var1995 = var1997
		var1994 = var1998
		
		if var1995 == protoModule.wireTypes.varint then
			local _ = nil
			local var2000, var2001 = protoModule.readVarInt(p111, var1994)
			local _ = var2000
			var1994 = var2001
			continue
		end
		if var1995 == protoModule.wireTypes.lengthDelimited then
			if var1999 == 1 then
				local _ = nil
				local var2002, var2003 = protoModule.readBuffer(p111, var1994)
				var1994 = var2003
				var1993.tooltip_id = propTypesModule.StringProp.decode(var2002)
			else
				local _ = nil
				local var2004, var2005 = protoModule.readVarInt(p111, var1994)
				var1994 = var2005 + var2004
			end
		elseif var1995 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2006, var2007 = protoModule.readFixed32(p111, var1994)
			local _ = var2006
			var1994 = var2007
		elseif var1995 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2008, var2009 = protoModule.readFixed64(p111, var1994)
			local _ = var2008
			var1994 = var2009
		else
			error("Unsupported wire type: " .. var1995)
		end
	end
	return var1993
end

function t_57:jsonEncode() --[[ line: 13951 ]]
	local t = {}
	
	if self.tooltip_id ~= nil then
		t.tooltipId = self.tooltip_id:jsonEncode()
	end
	return t
end

function t_57:jsonDecode() --[[ line: 13961 ]]
	-- upvalues: t_57 (ref), propTypesModule (ref)
	local var2011 = t_57.new()
	
	if self.tooltip_id ~= nil then
		var2011.tooltip_id = propTypesModule.StringProp.jsonDecode(self.tooltip_id)
	end
	if self.tooltipId ~= nil then
		var2011.tooltip_id = propTypesModule.StringProp.jsonDecode(self.tooltipId)
	end
	return var2011
end

t_57.descriptor = {
	name = "CloseMarketplaceCategoryTooltip_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.CloseMarketplaceCategoryTooltip_Params = t_57
typeRegistryModule.default:register(t.CloseMarketplaceCategoryTooltip_Params)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p112) --[[ line: 13991 ]]
	-- upvalues: t (ref), t_58 (ref)
	return setmetatable({
		action_type = if p112 == nil or p112.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p112.action_type,
		action_params = if p112 == nil or p112.action_params == nil then nil else p112.action_params
	}, t_58)
end

function t_58:encode() --[[ line: 14000 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2013 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2014, var2015 = protoModule.writeTag(buff, var2013, 1, protoModule.wireTypes.varint)
		var2014, var2015 = protoModule.writeVarInt(var2014, var2015, t.ActionType.toNumber(self.action_type))
		buff = var2014
		var2013 = var2015
	end
	if self.action_params ~= nil then
		local var2016 = self.action_params:encode()
		local var2017, var2018 = protoModule.writeTag(buff, var2013, 2, protoModule.wireTypes.lengthDelimited)
		var2017, var2018 = protoModule.writeBuffer(var2017, var2018, var2016, buffer.len(var2016))
		buff = var2017
		var2013 = var2018
	end
	local buff_1 = buffer.create(var2013)
	buffer.copy(buff_1, 0, buff, 0, var2013)
	
	return buff_1
end

function t_58.decode(p113) --[[ line: 14026 ]]
	-- upvalues: t_58 (ref), protoModule (ref), t (ref)
	local var2020 = t_58.new()
	local var2021 = 0
	while var2021 < buffer.len(p113) do
		local _ = nil
		local var2022 = nil
		local var2023, var2024, var2025 = protoModule.readTag(p113, var2021)
		local var2026 = var2023
		var2022 = var2024
		var2021 = var2025
		
		if var2022 == protoModule.wireTypes.varint then
			if var2026 == 1 then
				local _ = nil
				local var2027, var2028 = protoModule.readVarIntI32(p113, var2021)
				local var2029 = var2027
				var2021 = var2028
				var2020.action_type = t.ActionType.fromNumber(var2029) or var2029
			else
				local _ = nil
				local var2030, var2031 = protoModule.readVarInt(p113, var2021)
				local _ = var2030
				var2021 = var2031
			end
		end
		if var2022 == protoModule.wireTypes.lengthDelimited then
			if var2026 == 2 then
				local _ = nil
				local var2032, var2033 = protoModule.readBuffer(p113, var2021)
				var2021 = var2033
				var2020.action_params = t.ResizeMarketplaceCatalog_Params.decode(var2032)
			else
				local _ = nil
				local var2034, var2035 = protoModule.readVarInt(p113, var2021)
				var2021 = var2035 + var2034
			end
		elseif var2022 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2036, var2037 = protoModule.readFixed32(p113, var2021)
			local _ = var2036
			var2021 = var2037
		elseif var2022 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2038, var2039 = protoModule.readFixed64(p113, var2021)
			local _ = var2038
			var2021 = var2039
		else
			error("Unsupported wire type: " .. var2022)
		end
	end
	return var2020
end

function t_58:jsonEncode() --[[ line: 14074 ]]
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

function t_58:jsonDecode() --[[ line: 14096 ]]
	-- upvalues: t_58 (ref), t (ref)
	local var2041 = t_58.new()
	
	if self.action_type ~= nil then
		var2041.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2041.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2041.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2041.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.actionParams)
	end
	return var2041
end

t_58.descriptor = {
	name = "ResizeMarketplaceCatalog",
	fullName = "roblox.apppageplatform.shared.v1beta1.ResizeMarketplaceCatalog"
}
t.ResizeMarketplaceCatalog = t_58
typeRegistryModule.default:register(t.ResizeMarketplaceCatalog)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p114) --[[ line: 14136 ]]
	-- upvalues: t_59 (ref)
	return setmetatable({
		category_id = if p114 == nil or p114.category_id == nil then nil else p114.category_id,
		subcategory_id = if p114 == nil or p114.subcategory_id == nil then nil else p114.subcategory_id,
		screen_size = if p114 == nil or p114.screen_size == nil then nil else p114.screen_size
	}, t_59)
end

function t_59:encode() --[[ line: 14146 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2043 = 0
	
	if self.category_id ~= nil then
		local var2044 = self.category_id:encode()
		local var2045, var2046 = protoModule.writeTag(buff, var2043, 1, protoModule.wireTypes.lengthDelimited)
		var2045, var2046 = protoModule.writeBuffer(var2045, var2046, var2044, buffer.len(var2044))
		buff = var2045
		var2043 = var2046
	end
	if self.subcategory_id ~= nil then
		local var2047 = self.subcategory_id:encode()
		local var2048, var2049 = protoModule.writeTag(buff, var2043, 2, protoModule.wireTypes.lengthDelimited)
		var2048, var2049 = protoModule.writeBuffer(var2048, var2049, var2047, buffer.len(var2047))
		buff = var2048
		var2043 = var2049
	end
	if self.screen_size ~= nil then
		local var2050 = self.screen_size:encode()
		local var2051, var2052 = protoModule.writeTag(buff, var2043, 3, protoModule.wireTypes.lengthDelimited)
		var2051, var2052 = protoModule.writeBuffer(var2051, var2052, var2050, buffer.len(var2050))
		buff = var2051
		var2043 = var2052
	end
	local buff_1 = buffer.create(var2043)
	buffer.copy(buff_1, 0, buff, 0, var2043)
	
	return buff_1
end

function t_59.decode(p115) --[[ line: 14173 ]]
	-- upvalues: t_59 (ref), protoModule (ref), propTypesModule (ref)
	local var2054 = t_59.new()
	local var2055 = 0
	while var2055 < buffer.len(p115) do
		local _ = nil
		local var2056 = nil
		local var2057, var2058, var2059 = protoModule.readTag(p115, var2055)
		local var2060 = var2057
		var2056 = var2058
		var2055 = var2059
		
		if var2056 == protoModule.wireTypes.varint then
			local _ = nil
			local var2061, var2062 = protoModule.readVarInt(p115, var2055)
			local _ = var2061
			var2055 = var2062
			continue
		end
		if var2056 == protoModule.wireTypes.lengthDelimited then
			if var2060 == 1 then
				local _ = nil
				local var2063, var2064 = protoModule.readBuffer(p115, var2055)
				var2055 = var2064
				var2054.category_id = propTypesModule.StringProp.decode(var2063)
			elseif var2060 == 2 then
				local _ = nil
				local var2065, var2066 = protoModule.readBuffer(p115, var2055)
				var2055 = var2066
				var2054.subcategory_id = propTypesModule.StringProp.decode(var2065)
			elseif var2060 == 3 then
				local _ = nil
				local var2067, var2068 = protoModule.readBuffer(p115, var2055)
				var2055 = var2068
				var2054.screen_size = propTypesModule.StringProp.decode(var2067)
			else
				local _ = nil
				local var2069, var2070 = protoModule.readVarInt(p115, var2055)
				var2055 = var2070 + var2069
			end
		elseif var2056 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2071, var2072 = protoModule.readFixed32(p115, var2055)
			local _ = var2071
			var2055 = var2072
		elseif var2056 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2073, var2074 = protoModule.readFixed64(p115, var2055)
			local _ = var2073
			var2055 = var2074
		else
			error("Unsupported wire type: " .. var2056)
		end
	end
	return var2054
end

function t_59:jsonEncode() --[[ line: 14226 ]]
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

function t_59:jsonDecode() --[[ line: 14244 ]]
	-- upvalues: t_59 (ref), propTypesModule (ref)
	local var2076 = t_59.new()
	
	if self.category_id ~= nil then
		var2076.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var2076.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	if self.subcategory_id ~= nil then
		var2076.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var2076.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	if self.screen_size ~= nil then
		var2076.screen_size = propTypesModule.StringProp.jsonDecode(self.screen_size)
	end
	if self.screenSize ~= nil then
		var2076.screen_size = propTypesModule.StringProp.jsonDecode(self.screenSize)
	end
	return var2076
end

t_59.descriptor = {
	name = "ResizeMarketplaceCatalog_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ResizeMarketplaceCatalog_Params = t_59
typeRegistryModule.default:register(t.ResizeMarketplaceCatalog_Params)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p116) --[[ line: 14292 ]]
	-- upvalues: t (ref), t_60 (ref)
	return setmetatable({
		action_type = if p116 == nil or p116.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p116.action_type,
		action_params = if p116 == nil or p116.action_params == nil then nil else p116.action_params
	}, t_60)
end

function t_60:encode() --[[ line: 14303 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2078 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2079, var2080 = protoModule.writeTag(buff, var2078, 1, protoModule.wireTypes.varint)
		var2079, var2080 = protoModule.writeVarInt(var2079, var2080, t.ActionType.toNumber(self.action_type))
		buff = var2079
		var2078 = var2080
	end
	if self.action_params ~= nil then
		local var2081 = self.action_params:encode()
		local var2082, var2083 = protoModule.writeTag(buff, var2078, 2, protoModule.wireTypes.lengthDelimited)
		var2082, var2083 = protoModule.writeBuffer(var2082, var2083, var2081, buffer.len(var2081))
		buff = var2082
		var2078 = var2083
	end
	local buff_1 = buffer.create(var2078)
	buffer.copy(buff_1, 0, buff, 0, var2078)
	
	return buff_1
end

function t_60.decode(p117) --[[ line: 14329 ]]
	-- upvalues: t_60 (ref), protoModule (ref), t (ref)
	local var2085 = t_60.new()
	local var2086 = 0
	while var2086 < buffer.len(p117) do
		local _ = nil
		local var2087 = nil
		local var2088, var2089, var2090 = protoModule.readTag(p117, var2086)
		local var2091 = var2088
		var2087 = var2089
		var2086 = var2090
		
		if var2087 == protoModule.wireTypes.varint then
			if var2091 == 1 then
				local _ = nil
				local var2092, var2093 = protoModule.readVarIntI32(p117, var2086)
				local var2094 = var2092
				var2086 = var2093
				var2085.action_type = t.ActionType.fromNumber(var2094) or var2094
			else
				local _ = nil
				local var2095, var2096 = protoModule.readVarInt(p117, var2086)
				local _ = var2095
				var2086 = var2096
			end
		end
		if var2087 == protoModule.wireTypes.lengthDelimited then
			if var2091 == 2 then
				local _ = nil
				local var2097, var2098 = protoModule.readBuffer(p117, var2086)
				var2086 = var2098
				var2085.action_params = t.OpenChartsSortDetailAction_Params.decode(var2097)
			else
				local _ = nil
				local var2099, var2100 = protoModule.readVarInt(p117, var2086)
				var2086 = var2100 + var2099
			end
		elseif var2087 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2101, var2102 = protoModule.readFixed32(p117, var2086)
			local _ = var2101
			var2086 = var2102
		elseif var2087 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2103, var2104 = protoModule.readFixed64(p117, var2086)
			local _ = var2103
			var2086 = var2104
		else
			error("Unsupported wire type: " .. var2087)
		end
	end
	return var2085
end

function t_60:jsonEncode() --[[ line: 14377 ]]
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

function t_60:jsonDecode() --[[ line: 14399 ]]
	-- upvalues: t_60 (ref), t (ref)
	local var2106 = t_60.new()
	
	if self.action_type ~= nil then
		var2106.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2106.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2106.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2106.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var2106
end

t_60.descriptor = {
	name = "OpenChartsSortDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenChartsSortDetailAction"
}
t.OpenChartsSortDetailAction = t_60
typeRegistryModule.default:register(t.OpenChartsSortDetailAction)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p118) --[[ line: 14439 ]]
	-- upvalues: t_61 (ref)
	return setmetatable({
		sort_id = if p118 == nil or p118.sort_id == nil then nil else p118.sort_id,
		secondary_sort_id = if p118 == nil or p118.secondary_sort_id == nil then nil else p118.secondary_sort_id
	}, t_61)
end

function t_61:encode() --[[ line: 14448 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2108 = 0
	
	if self.sort_id ~= nil then
		local var2109 = self.sort_id:encode()
		local var2110, var2111 = protoModule.writeTag(buff, var2108, 1, protoModule.wireTypes.lengthDelimited)
		var2110, var2111 = protoModule.writeBuffer(var2110, var2111, var2109, buffer.len(var2109))
		buff = var2110
		var2108 = var2111
	end
	if self.secondary_sort_id ~= nil then
		local var2112 = self.secondary_sort_id:encode()
		local var2113, var2114 = protoModule.writeTag(buff, var2108, 2, protoModule.wireTypes.lengthDelimited)
		var2113, var2114 = protoModule.writeBuffer(var2113, var2114, var2112, buffer.len(var2112))
		buff = var2113
		var2108 = var2114
	end
	local buff_1 = buffer.create(var2108)
	buffer.copy(buff_1, 0, buff, 0, var2108)
	
	return buff_1
end

function t_61.decode(p119) --[[ line: 14469 ]]
	-- upvalues: t_61 (ref), protoModule (ref), propTypesModule (ref)
	local var2116 = t_61.new()
	local var2117 = 0
	while var2117 < buffer.len(p119) do
		local _ = nil
		local var2118 = nil
		local var2119, var2120, var2121 = protoModule.readTag(p119, var2117)
		local var2122 = var2119
		var2118 = var2120
		var2117 = var2121
		
		if var2118 == protoModule.wireTypes.varint then
			local _ = nil
			local var2123, var2124 = protoModule.readVarInt(p119, var2117)
			local _ = var2123
			var2117 = var2124
			continue
		end
		if var2118 == protoModule.wireTypes.lengthDelimited then
			if var2122 == 1 then
				local _ = nil
				local var2125, var2126 = protoModule.readBuffer(p119, var2117)
				var2117 = var2126
				var2116.sort_id = propTypesModule.StringProp.decode(var2125)
			elseif var2122 == 2 then
				local _ = nil
				local var2127, var2128 = protoModule.readBuffer(p119, var2117)
				var2117 = var2128
				var2116.secondary_sort_id = propTypesModule.Int32Prop.decode(var2127)
			else
				local _ = nil
				local var2129, var2130 = protoModule.readVarInt(p119, var2117)
				var2117 = var2130 + var2129
			end
		elseif var2118 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2131, var2132 = protoModule.readFixed32(p119, var2117)
			local _ = var2131
			var2117 = var2132
		elseif var2118 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2133, var2134 = protoModule.readFixed64(p119, var2117)
			local _ = var2133
			var2117 = var2134
		else
			error("Unsupported wire type: " .. var2118)
		end
	end
	return var2116
end

function t_61:jsonEncode() --[[ line: 14517 ]]
	local t = {}
	
	if self.sort_id ~= nil then
		t.sortId = self.sort_id:jsonEncode()
	end
	if self.secondary_sort_id ~= nil then
		t.secondarySortId = self.secondary_sort_id:jsonEncode()
	end
	return t
end

function t_61:jsonDecode() --[[ line: 14531 ]]
	-- upvalues: t_61 (ref), propTypesModule (ref)
	local var2136 = t_61.new()
	
	if self.sort_id ~= nil then
		var2136.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var2136.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.secondary_sort_id ~= nil then
		var2136.secondary_sort_id = propTypesModule.Int32Prop.jsonDecode(self.secondary_sort_id)
	end
	if self.secondarySortId ~= nil then
		var2136.secondary_sort_id = propTypesModule.Int32Prop.jsonDecode(self.secondarySortId)
	end
	return var2136
end

t_61.descriptor = {
	name = "OpenChartsSortDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenChartsSortDetailAction_Params = t_61
typeRegistryModule.default:register(t.OpenChartsSortDetailAction_Params)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p120) --[[ line: 14571 ]]
	-- upvalues: t (ref), t_62 (ref)
	return setmetatable({
		action_type = if p120 == nil or p120.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p120.action_type,
		action_params = if p120 == nil or p120.action_params == nil then nil else p120.action_params
	}, t_62)
end

function t_62:encode() --[[ line: 14580 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2138 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2139, var2140 = protoModule.writeTag(buff, var2138, 1, protoModule.wireTypes.varint)
		var2139, var2140 = protoModule.writeVarInt(var2139, var2140, t.ActionType.toNumber(self.action_type))
		buff = var2139
		var2138 = var2140
	end
	if self.action_params ~= nil then
		local var2141 = self.action_params:encode()
		local var2142, var2143 = protoModule.writeTag(buff, var2138, 2, protoModule.wireTypes.lengthDelimited)
		var2142, var2143 = protoModule.writeBuffer(var2142, var2143, var2141, buffer.len(var2141))
		buff = var2142
		var2138 = var2143
	end
	local buff_1 = buffer.create(var2138)
	buffer.copy(buff_1, 0, buff, 0, var2138)
	
	return buff_1
end

function t_62.decode(p121) --[[ line: 14606 ]]
	-- upvalues: t_62 (ref), protoModule (ref), t (ref)
	local var2145 = t_62.new()
	local var2146 = 0
	while var2146 < buffer.len(p121) do
		local _ = nil
		local var2147 = nil
		local var2148, var2149, var2150 = protoModule.readTag(p121, var2146)
		local var2151 = var2148
		var2147 = var2149
		var2146 = var2150
		
		if var2147 == protoModule.wireTypes.varint then
			if var2151 == 1 then
				local _ = nil
				local var2152, var2153 = protoModule.readVarIntI32(p121, var2146)
				local var2154 = var2152
				var2146 = var2153
				var2145.action_type = t.ActionType.fromNumber(var2154) or var2154
			else
				local _ = nil
				local var2155, var2156 = protoModule.readVarInt(p121, var2146)
				local _ = var2155
				var2146 = var2156
			end
		end
		if var2147 == protoModule.wireTypes.lengthDelimited then
			if var2151 == 2 then
				local _ = nil
				local var2157, var2158 = protoModule.readBuffer(p121, var2146)
				var2146 = var2158
				var2145.action_params = t.OpenSongDetailAction_Params.decode(var2157)
			else
				local _ = nil
				local var2159, var2160 = protoModule.readVarInt(p121, var2146)
				var2146 = var2160 + var2159
			end
		elseif var2147 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2161, var2162 = protoModule.readFixed32(p121, var2146)
			local _ = var2161
			var2146 = var2162
		elseif var2147 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2163, var2164 = protoModule.readFixed64(p121, var2146)
			local _ = var2163
			var2146 = var2164
		else
			error("Unsupported wire type: " .. var2147)
		end
	end
	return var2145
end

function t_62:jsonEncode() --[[ line: 14654 ]]
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

function t_62:jsonDecode() --[[ line: 14676 ]]
	-- upvalues: t_62 (ref), t (ref)
	local var2166 = t_62.new()
	
	if self.action_type ~= nil then
		var2166.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2166.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2166.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2166.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var2166
end

t_62.descriptor = {
	name = "OpenSongDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSongDetailAction"
}
t.OpenSongDetailAction = t_62
typeRegistryModule.default:register(t.OpenSongDetailAction)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p122) --[[ line: 14716 ]]
	-- upvalues: t_63 (ref)
	return setmetatable({
		song_id = if p122 == nil or p122.song_id == nil then nil else p122.song_id
	}, t_63)
end

function t_63:encode() --[[ line: 14724 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2168 = 0
	
	if self.song_id ~= nil then
		local var2169 = self.song_id:encode()
		local var2170, var2171 = protoModule.writeTag(buff, var2168, 1, protoModule.wireTypes.lengthDelimited)
		var2170, var2171 = protoModule.writeBuffer(var2170, var2171, var2169, buffer.len(var2169))
		buff = var2170
		var2168 = var2171
	end
	local buff_1 = buffer.create(var2168)
	buffer.copy(buff_1, 0, buff, 0, var2168)
	
	return buff_1
end

function t_63.decode(p123) --[[ line: 14739 ]]
	-- upvalues: t_63 (ref), protoModule (ref), propTypesModule (ref)
	local var2173 = t_63.new()
	local var2174 = 0
	while var2174 < buffer.len(p123) do
		local _ = nil
		local var2175 = nil
		local var2176, var2177, var2178 = protoModule.readTag(p123, var2174)
		local var2179 = var2176
		var2175 = var2177
		var2174 = var2178
		
		if var2175 == protoModule.wireTypes.varint then
			local _ = nil
			local var2180, var2181 = protoModule.readVarInt(p123, var2174)
			local _ = var2180
			var2174 = var2181
			continue
		end
		if var2175 == protoModule.wireTypes.lengthDelimited then
			if var2179 == 1 then
				local _ = nil
				local var2182, var2183 = protoModule.readBuffer(p123, var2174)
				var2174 = var2183
				var2173.song_id = propTypesModule.StringProp.decode(var2182)
			else
				local _ = nil
				local var2184, var2185 = protoModule.readVarInt(p123, var2174)
				var2174 = var2185 + var2184
			end
		elseif var2175 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2186, var2187 = protoModule.readFixed32(p123, var2174)
			local _ = var2186
			var2174 = var2187
		elseif var2175 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2188, var2189 = protoModule.readFixed64(p123, var2174)
			local _ = var2188
			var2174 = var2189
		else
			error("Unsupported wire type: " .. var2175)
		end
	end
	return var2173
end

function t_63:jsonEncode() --[[ line: 14782 ]]
	local t = {}
	
	if self.song_id ~= nil then
		t.songId = self.song_id:jsonEncode()
	end
	return t
end

function t_63:jsonDecode() --[[ line: 14792 ]]
	-- upvalues: t_63 (ref), propTypesModule (ref)
	local var2191 = t_63.new()
	
	if self.song_id ~= nil then
		var2191.song_id = propTypesModule.StringProp.jsonDecode(self.song_id)
	end
	if self.songId ~= nil then
		var2191.song_id = propTypesModule.StringProp.jsonDecode(self.songId)
	end
	return var2191
end

t_63.descriptor = {
	name = "OpenSongDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSongDetailAction_Params = t_63
typeRegistryModule.default:register(t.OpenSongDetailAction_Params)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p124) --[[ line: 14820 ]]
	-- upvalues: t (ref), t_64 (ref)
	return setmetatable({
		action_type = if p124 == nil or p124.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p124.action_type,
		action_params = if p124 == nil or p124.action_params == nil then nil else p124.action_params
	}, t_64)
end

function t_64:encode() --[[ line: 14831 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2193 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2194, var2195 = protoModule.writeTag(buff, var2193, 1, protoModule.wireTypes.varint)
		var2194, var2195 = protoModule.writeVarInt(var2194, var2195, t.ActionType.toNumber(self.action_type))
		buff = var2194
		var2193 = var2195
	end
	if self.action_params ~= nil then
		local var2196 = self.action_params:encode()
		local var2197, var2198 = protoModule.writeTag(buff, var2193, 2, protoModule.wireTypes.lengthDelimited)
		var2197, var2198 = protoModule.writeBuffer(var2197, var2198, var2196, buffer.len(var2196))
		buff = var2197
		var2193 = var2198
	end
	local buff_1 = buffer.create(var2193)
	buffer.copy(buff_1, 0, buff, 0, var2193)
	
	return buff_1
end

function t_64.decode(p125) --[[ line: 14857 ]]
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var2200 = t_64.new()
	local var2201 = 0
	while var2201 < buffer.len(p125) do
		local _ = nil
		local var2202 = nil
		local var2203, var2204, var2205 = protoModule.readTag(p125, var2201)
		local var2206 = var2203
		var2202 = var2204
		var2201 = var2205
		
		if var2202 == protoModule.wireTypes.varint then
			if var2206 == 1 then
				local _ = nil
				local var2207, var2208 = protoModule.readVarIntI32(p125, var2201)
				local var2209 = var2207
				var2201 = var2208
				var2200.action_type = t.ActionType.fromNumber(var2209) or var2209
			else
				local _ = nil
				local var2210, var2211 = protoModule.readVarInt(p125, var2201)
				local _ = var2210
				var2201 = var2211
			end
		end
		if var2202 == protoModule.wireTypes.lengthDelimited then
			if var2206 == 2 then
				local _ = nil
				local var2212, var2213 = protoModule.readBuffer(p125, var2201)
				var2201 = var2213
				var2200.action_params = t.OpenMarketplaceCatalogFilters_Params.decode(var2212)
			else
				local _ = nil
				local var2214, var2215 = protoModule.readVarInt(p125, var2201)
				var2201 = var2215 + var2214
			end
		elseif var2202 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2216, var2217 = protoModule.readFixed32(p125, var2201)
			local _ = var2216
			var2201 = var2217
		elseif var2202 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2218, var2219 = protoModule.readFixed64(p125, var2201)
			local _ = var2218
			var2201 = var2219
		else
			error("Unsupported wire type: " .. var2202)
		end
	end
	return var2200
end

function t_64:jsonEncode() --[[ line: 14905 ]]
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

function t_64:jsonDecode() --[[ line: 14927 ]]
	-- upvalues: t_64 (ref), t (ref)
	local var2221 = t_64.new()
	
	if self.action_type ~= nil then
		var2221.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2221.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2221.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2221.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.actionParams)
	end
	return var2221
end

t_64.descriptor = {
	name = "OpenMarketplaceCatalogFilters",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogFilters"
}
t.OpenMarketplaceCatalogFilters = t_64
typeRegistryModule.default:register(t.OpenMarketplaceCatalogFilters)
local t_65 = {}
t_65.__index = t_65

function t_65.new(_) --[[ line: 14967 ]]
	-- upvalues: t_65 (ref)
	return setmetatable({}, t_65)
end

function t_65.encode(_) --[[ line: 14973 ]]
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_65.decode(p126) --[[ line: 14982 ]]
	-- upvalues: t_65 (ref), protoModule (ref)
	local var2223 = t_65.new()
	local var2224 = 0
	while var2224 < buffer.len(p126) do
		local var2225 = nil
		local _ = nil
		local var2226, var2227, var2228 = protoModule.readTag(p126, var2224)
		var2225 = var2226
		local var2229 = var2227
		var2224 = var2228
		
		if var2229 == protoModule.wireTypes.varint then
			local _ = nil
			local var2230, var2231 = protoModule.readVarInt(p126, var2224)
			local _ = var2230
			var2224 = var2231
		elseif var2229 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2232, var2233 = protoModule.readVarInt(p126, var2224)
			var2224 = var2233 + var2232
		elseif var2229 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2234, var2235 = protoModule.readFixed32(p126, var2224)
			local _ = var2234
			var2224 = var2235
		elseif var2229 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2236, var2237 = protoModule.readFixed64(p126, var2224)
			local _ = var2236
			var2224 = var2237
		else
			error("Unsupported wire type: " .. var2229)
		end
	end
	return var2223
end

function t_65.jsonEncode(_) --[[ line: 15020 ]]
	return {}
end

function t_65.jsonDecode(_) --[[ line: 15026 ]]
	-- upvalues: t_65 (ref)
	return t_65.new()
end

t_65.descriptor = {
	name = "OpenMarketplaceCatalogFilters_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceCatalogFilters_Params = t_65
typeRegistryModule.default:register(t.OpenMarketplaceCatalogFilters_Params)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p127) --[[ line: 15048 ]]
	-- upvalues: t (ref), t_66 (ref)
	return setmetatable({
		action_type = if p127 == nil or p127.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p127.action_type,
		action_params = if p127 == nil or p127.action_params == nil then nil else p127.action_params
	}, t_66)
end

function t_66:encode() --[[ line: 15057 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2239 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2240, var2241 = protoModule.writeTag(buff, var2239, 1, protoModule.wireTypes.varint)
		var2240, var2241 = protoModule.writeVarInt(var2240, var2241, t.ActionType.toNumber(self.action_type))
		buff = var2240
		var2239 = var2241
	end
	if self.action_params ~= nil then
		local var2242 = self.action_params:encode()
		local var2243, var2244 = protoModule.writeTag(buff, var2239, 2, protoModule.wireTypes.lengthDelimited)
		var2243, var2244 = protoModule.writeBuffer(var2243, var2244, var2242, buffer.len(var2242))
		buff = var2243
		var2239 = var2244
	end
	local buff_1 = buffer.create(var2239)
	buffer.copy(buff_1, 0, buff, 0, var2239)
	
	return buff_1
end

function t_66.decode(p128) --[[ line: 15083 ]]
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var2246 = t_66.new()
	local var2247 = 0
	while var2247 < buffer.len(p128) do
		local _ = nil
		local var2248 = nil
		local var2249, var2250, var2251 = protoModule.readTag(p128, var2247)
		local var2252 = var2249
		var2248 = var2250
		var2247 = var2251
		
		if var2248 == protoModule.wireTypes.varint then
			if var2252 == 1 then
				local _ = nil
				local var2253, var2254 = protoModule.readVarIntI32(p128, var2247)
				local var2255 = var2253
				var2247 = var2254
				var2246.action_type = t.ActionType.fromNumber(var2255) or var2255
			else
				local _ = nil
				local var2256, var2257 = protoModule.readVarInt(p128, var2247)
				local _ = var2256
				var2247 = var2257
			end
		end
		if var2248 == protoModule.wireTypes.lengthDelimited then
			if var2252 == 2 then
				local _ = nil
				local var2258, var2259 = protoModule.readBuffer(p128, var2247)
				var2247 = var2259
				var2246.action_params = t.RefreshFromApiAction_Params.decode(var2258)
			else
				local _ = nil
				local var2260, var2261 = protoModule.readVarInt(p128, var2247)
				var2247 = var2261 + var2260
			end
		elseif var2248 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2262, var2263 = protoModule.readFixed32(p128, var2247)
			local _ = var2262
			var2247 = var2263
		elseif var2248 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2264, var2265 = protoModule.readFixed64(p128, var2247)
			local _ = var2264
			var2247 = var2265
		else
			error("Unsupported wire type: " .. var2248)
		end
	end
	return var2246
end

function t_66:jsonEncode() --[[ line: 15131 ]]
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

function t_66:jsonDecode() --[[ line: 15153 ]]
	-- upvalues: t_66 (ref), t (ref)
	local var2267 = t_66.new()
	
	if self.action_type ~= nil then
		var2267.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2267.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2267.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2267.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var2267
end

t_66.descriptor = {
	name = "RefreshFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshFromApiAction"
}
t.RefreshFromApiAction = t_66
typeRegistryModule.default:register(t.RefreshFromApiAction)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p129) --[[ line: 15193 ]]
	-- upvalues: t_67 (ref)
	return setmetatable({
		surface_key = if p129 == nil or p129.surface_key == nil then nil else p129.surface_key,
		config_key = if p129 == nil or p129.config_key == nil then nil else p129.config_key
	}, t_67)
end

function t_67:encode() --[[ line: 15202 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2269 = 0
	
	if self.surface_key ~= nil then
		local var2270 = self.surface_key:encode()
		local var2271, var2272 = protoModule.writeTag(buff, var2269, 1, protoModule.wireTypes.lengthDelimited)
		var2271, var2272 = protoModule.writeBuffer(var2271, var2272, var2270, buffer.len(var2270))
		buff = var2271
		var2269 = var2272
	end
	if self.config_key ~= nil then
		local var2273 = self.config_key:encode()
		local var2274, var2275 = protoModule.writeTag(buff, var2269, 2, protoModule.wireTypes.lengthDelimited)
		var2274, var2275 = protoModule.writeBuffer(var2274, var2275, var2273, buffer.len(var2273))
		buff = var2274
		var2269 = var2275
	end
	local buff_1 = buffer.create(var2269)
	buffer.copy(buff_1, 0, buff, 0, var2269)
	
	return buff_1
end

function t_67.decode(p130) --[[ line: 15223 ]]
	-- upvalues: t_67 (ref), protoModule (ref), propTypesModule (ref)
	local var2277 = t_67.new()
	local var2278 = 0
	while var2278 < buffer.len(p130) do
		local _ = nil
		local var2279 = nil
		local var2280, var2281, var2282 = protoModule.readTag(p130, var2278)
		local var2283 = var2280
		var2279 = var2281
		var2278 = var2282
		
		if var2279 == protoModule.wireTypes.varint then
			local _ = nil
			local var2284, var2285 = protoModule.readVarInt(p130, var2278)
			local _ = var2284
			var2278 = var2285
			continue
		end
		if var2279 == protoModule.wireTypes.lengthDelimited then
			if var2283 == 1 then
				local _ = nil
				local var2286, var2287 = protoModule.readBuffer(p130, var2278)
				var2278 = var2287
				var2277.surface_key = propTypesModule.StringProp.decode(var2286)
			elseif var2283 == 2 then
				local _ = nil
				local var2288, var2289 = protoModule.readBuffer(p130, var2278)
				var2278 = var2289
				var2277.config_key = propTypesModule.StringProp.decode(var2288)
			else
				local _ = nil
				local var2290, var2291 = protoModule.readVarInt(p130, var2278)
				var2278 = var2291 + var2290
			end
		elseif var2279 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2292, var2293 = protoModule.readFixed32(p130, var2278)
			local _ = var2292
			var2278 = var2293
		elseif var2279 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2294, var2295 = protoModule.readFixed64(p130, var2278)
			local _ = var2294
			var2278 = var2295
		else
			error("Unsupported wire type: " .. var2279)
		end
	end
	return var2277
end

function t_67:jsonEncode() --[[ line: 15271 ]]
	local t = {}
	
	if self.surface_key ~= nil then
		t.surfaceKey = self.surface_key:jsonEncode()
	end
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	return t
end

function t_67:jsonDecode() --[[ line: 15285 ]]
	-- upvalues: t_67 (ref), propTypesModule (ref)
	local var2297 = t_67.new()
	
	if self.surface_key ~= nil then
		var2297.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var2297.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		var2297.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var2297.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return var2297
end

t_67.descriptor = {
	name = "RefreshFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshFromApiAction_Params = t_67
typeRegistryModule.default:register(t.RefreshFromApiAction_Params)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p131) --[[ line: 15322 ]]
	-- upvalues: t (ref), t_68 (ref)
	return setmetatable({
		action_type = if p131 == nil or p131.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p131.action_type,
		action_params = if p131 == nil or p131.action_params == nil then nil else p131.action_params
	}, t_68)
end

function t_68:encode() --[[ line: 15333 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2299 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2300, var2301 = protoModule.writeTag(buff, var2299, 1, protoModule.wireTypes.varint)
		var2300, var2301 = protoModule.writeVarInt(var2300, var2301, t.ActionType.toNumber(self.action_type))
		buff = var2300
		var2299 = var2301
	end
	if self.action_params ~= nil then
		local var2302 = self.action_params:encode()
		local var2303, var2304 = protoModule.writeTag(buff, var2299, 2, protoModule.wireTypes.lengthDelimited)
		var2303, var2304 = protoModule.writeBuffer(var2303, var2304, var2302, buffer.len(var2302))
		buff = var2303
		var2299 = var2304
	end
	local buff_1 = buffer.create(var2299)
	buffer.copy(buff_1, 0, buff, 0, var2299)
	
	return buff_1
end

function t_68.decode(p132) --[[ line: 15359 ]]
	-- upvalues: t_68 (ref), protoModule (ref), t (ref)
	local var2306 = t_68.new()
	local var2307 = 0
	while var2307 < buffer.len(p132) do
		local _ = nil
		local var2308 = nil
		local var2309, var2310, var2311 = protoModule.readTag(p132, var2307)
		local var2312 = var2309
		var2308 = var2310
		var2307 = var2311
		
		if var2308 == protoModule.wireTypes.varint then
			if var2312 == 1 then
				local _ = nil
				local var2313, var2314 = protoModule.readVarIntI32(p132, var2307)
				local var2315 = var2313
				var2307 = var2314
				var2306.action_type = t.ActionType.fromNumber(var2315) or var2315
			else
				local _ = nil
				local var2316, var2317 = protoModule.readVarInt(p132, var2307)
				local _ = var2316
				var2307 = var2317
			end
		end
		if var2308 == protoModule.wireTypes.lengthDelimited then
			if var2312 == 2 then
				local _ = nil
				local var2318, var2319 = protoModule.readBuffer(p132, var2307)
				var2307 = var2319
				var2306.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.decode(var2318)
			else
				local _ = nil
				local var2320, var2321 = protoModule.readVarInt(p132, var2307)
				var2307 = var2321 + var2320
			end
		elseif var2308 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2322, var2323 = protoModule.readFixed32(p132, var2307)
			local _ = var2322
			var2307 = var2323
		elseif var2308 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2324, var2325 = protoModule.readFixed64(p132, var2307)
			local _ = var2324
			var2307 = var2325
		else
			error("Unsupported wire type: " .. var2308)
		end
	end
	return var2306
end

function t_68:jsonEncode() --[[ line: 15407 ]]
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

function t_68:jsonDecode() --[[ line: 15429 ]]
	-- upvalues: t_68 (ref), t (ref)
	local var2327 = t_68.new()
	
	if self.action_type ~= nil then
		var2327.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2327.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2327.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2327.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.actionParams)
	end
	return var2327
end

t_68.descriptor = {
	name = "RefreshOmniRecommendationFeedItemAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshOmniRecommendationFeedItemAction"
}
t.RefreshOmniRecommendationFeedItemAction = t_68
typeRegistryModule.default:register(t.RefreshOmniRecommendationFeedItemAction)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p133) --[[ line: 15471 ]]
	-- upvalues: t_69 (ref)
	return setmetatable({
		topic_id = if p133 == nil or p133.topic_id == nil then nil else p133.topic_id,
		selected_option = if p133 == nil or p133.selected_option == nil then nil else p133.selected_option,
		request_intent = if p133 == nil or p133.request_intent == nil then nil else p133.request_intent,
		feed_item_key = if p133 == nil or p133.feed_item_key == nil then nil else p133.feed_item_key
	}, t_69)
end

function t_69:encode() --[[ line: 15482 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2329 = 0
	
	if self.topic_id ~= nil then
		local var2330 = self.topic_id:encode()
		local var2331, var2332 = protoModule.writeTag(buff, var2329, 1, protoModule.wireTypes.lengthDelimited)
		var2331, var2332 = protoModule.writeBuffer(var2331, var2332, var2330, buffer.len(var2330))
		buff = var2331
		var2329 = var2332
	end
	if self.selected_option ~= nil then
		local var2333 = self.selected_option:encode()
		local var2334, var2335 = protoModule.writeTag(buff, var2329, 2, protoModule.wireTypes.lengthDelimited)
		var2334, var2335 = protoModule.writeBuffer(var2334, var2335, var2333, buffer.len(var2333))
		buff = var2334
		var2329 = var2335
	end
	if self.request_intent ~= nil then
		local var2336 = self.request_intent:encode()
		local var2337, var2338 = protoModule.writeTag(buff, var2329, 3, protoModule.wireTypes.lengthDelimited)
		var2337, var2338 = protoModule.writeBuffer(var2337, var2338, var2336, buffer.len(var2336))
		buff = var2337
		var2329 = var2338
	end
	if self.feed_item_key ~= nil then
		local var2339 = self.feed_item_key:encode()
		local var2340, var2341 = protoModule.writeTag(buff, var2329, 4, protoModule.wireTypes.lengthDelimited)
		var2340, var2341 = protoModule.writeBuffer(var2340, var2341, var2339, buffer.len(var2339))
		buff = var2340
		var2329 = var2341
	end
	local buff_1 = buffer.create(var2329)
	buffer.copy(buff_1, 0, buff, 0, var2329)
	
	return buff_1
end

function t_69.decode(p134) --[[ line: 15517 ]]
	-- upvalues: t_69 (ref), protoModule (ref), propTypesModule (ref)
	local var2343 = t_69.new()
	local var2344 = 0
	while var2344 < buffer.len(p134) do
		local _ = nil
		local var2345 = nil
		local var2346, var2347, var2348 = protoModule.readTag(p134, var2344)
		local var2349 = var2346
		var2345 = var2347
		var2344 = var2348
		
		if var2345 == protoModule.wireTypes.varint then
			local _ = nil
			local var2350, var2351 = protoModule.readVarInt(p134, var2344)
			local _ = var2350
			var2344 = var2351
			continue
		end
		if var2345 == protoModule.wireTypes.lengthDelimited then
			if var2349 == 1 then
				local _ = nil
				local var2352, var2353 = protoModule.readBuffer(p134, var2344)
				var2344 = var2353
				var2343.topic_id = propTypesModule.StringProp.decode(var2352)
			elseif var2349 == 2 then
				local _ = nil
				local var2354, var2355 = protoModule.readBuffer(p134, var2344)
				var2344 = var2355
				var2343.selected_option = propTypesModule.StringProp.decode(var2354)
			elseif var2349 == 3 then
				local _ = nil
				local var2356, var2357 = protoModule.readBuffer(p134, var2344)
				var2344 = var2357
				var2343.request_intent = propTypesModule.StringProp.decode(var2356)
			elseif var2349 == 4 then
				local _ = nil
				local var2358, var2359 = protoModule.readBuffer(p134, var2344)
				var2344 = var2359
				var2343.feed_item_key = propTypesModule.StringProp.decode(var2358)
			else
				local _ = nil
				local var2360, var2361 = protoModule.readVarInt(p134, var2344)
				var2344 = var2361 + var2360
			end
		elseif var2345 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2362, var2363 = protoModule.readFixed32(p134, var2344)
			local _ = var2362
			var2344 = var2363
		elseif var2345 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2364, var2365 = protoModule.readFixed64(p134, var2344)
			local _ = var2364
			var2344 = var2365
		else
			error("Unsupported wire type: " .. var2345)
		end
	end
	return var2343
end

function t_69:jsonEncode() --[[ line: 15577 ]]
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

function t_69:jsonDecode() --[[ line: 15601 ]]
	-- upvalues: t_69 (ref), propTypesModule (ref)
	local var2367 = t_69.new()
	
	if self.topic_id ~= nil then
		var2367.topic_id = propTypesModule.StringProp.jsonDecode(self.topic_id)
	end
	if self.topicId ~= nil then
		var2367.topic_id = propTypesModule.StringProp.jsonDecode(self.topicId)
	end
	if self.selected_option ~= nil then
		var2367.selected_option = propTypesModule.StringProp.jsonDecode(self.selected_option)
	end
	if self.selectedOption ~= nil then
		var2367.selected_option = propTypesModule.StringProp.jsonDecode(self.selectedOption)
	end
	if self.request_intent ~= nil then
		var2367.request_intent = propTypesModule.StringProp.jsonDecode(self.request_intent)
	end
	if self.requestIntent ~= nil then
		var2367.request_intent = propTypesModule.StringProp.jsonDecode(self.requestIntent)
	end
	if self.feed_item_key ~= nil then
		var2367.feed_item_key = propTypesModule.StringProp.jsonDecode(self.feed_item_key)
	end
	if self.feedItemKey ~= nil then
		var2367.feed_item_key = propTypesModule.StringProp.jsonDecode(self.feedItemKey)
	end
	return var2367
end

t_69.descriptor = {
	name = "RefreshOmniRecommendationFeedItemAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshOmniRecommendationFeedItemAction_Params = t_69
typeRegistryModule.default:register(t.RefreshOmniRecommendationFeedItemAction_Params)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p135) --[[ line: 15661 ]]
	-- upvalues: t (ref), t_70 (ref)
	return setmetatable({
		action_type = if p135 == nil or p135.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p135.action_type,
		action_params = if p135 == nil or p135.action_params == nil then nil else p135.action_params
	}, t_70)
end

function t_70:encode() --[[ line: 15670 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2369 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2370, var2371 = protoModule.writeTag(buff, var2369, 1, protoModule.wireTypes.varint)
		var2370, var2371 = protoModule.writeVarInt(var2370, var2371, t.ActionType.toNumber(self.action_type))
		buff = var2370
		var2369 = var2371
	end
	if self.action_params ~= nil then
		local var2372 = self.action_params:encode()
		local var2373, var2374 = protoModule.writeTag(buff, var2369, 2, protoModule.wireTypes.lengthDelimited)
		var2373, var2374 = protoModule.writeBuffer(var2373, var2374, var2372, buffer.len(var2372))
		buff = var2373
		var2369 = var2374
	end
	local buff_1 = buffer.create(var2369)
	buffer.copy(buff_1, 0, buff, 0, var2369)
	
	return buff_1
end

function t_70.decode(p136) --[[ line: 15696 ]]
	-- upvalues: t_70 (ref), protoModule (ref), t (ref)
	local var2376 = t_70.new()
	local var2377 = 0
	while var2377 < buffer.len(p136) do
		local _ = nil
		local var2378 = nil
		local var2379, var2380, var2381 = protoModule.readTag(p136, var2377)
		local var2382 = var2379
		var2378 = var2380
		var2377 = var2381
		
		if var2378 == protoModule.wireTypes.varint then
			if var2382 == 1 then
				local _ = nil
				local var2383, var2384 = protoModule.readVarIntI32(p136, var2377)
				local var2385 = var2383
				var2377 = var2384
				var2376.action_type = t.ActionType.fromNumber(var2385) or var2385
			else
				local _ = nil
				local var2386, var2387 = protoModule.readVarInt(p136, var2377)
				local _ = var2386
				var2377 = var2387
			end
		end
		if var2378 == protoModule.wireTypes.lengthDelimited then
			if var2382 == 2 then
				local _ = nil
				local var2388, var2389 = protoModule.readBuffer(p136, var2377)
				var2377 = var2389
				var2376.action_params = t.RsvpToEventAction_Params.decode(var2388)
			else
				local _ = nil
				local var2390, var2391 = protoModule.readVarInt(p136, var2377)
				var2377 = var2391 + var2390
			end
		elseif var2378 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2392, var2393 = protoModule.readFixed32(p136, var2377)
			local _ = var2392
			var2377 = var2393
		elseif var2378 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2394, var2395 = protoModule.readFixed64(p136, var2377)
			local _ = var2394
			var2377 = var2395
		else
			error("Unsupported wire type: " .. var2378)
		end
	end
	return var2376
end

function t_70:jsonEncode() --[[ line: 15744 ]]
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

function t_70:jsonDecode() --[[ line: 15766 ]]
	-- upvalues: t_70 (ref), t (ref)
	local var2397 = t_70.new()
	
	if self.action_type ~= nil then
		var2397.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2397.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2397.action_params = t.RsvpToEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2397.action_params = t.RsvpToEventAction_Params.jsonDecode(self.actionParams)
	end
	return var2397
end

t_70.descriptor = {
	name = "RsvpToEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpToEventAction"
}
t.RsvpToEventAction = t_70
typeRegistryModule.default:register(t.RsvpToEventAction)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p137) --[[ line: 15806 ]]
	-- upvalues: t_71 (ref)
	return setmetatable({
		event_id = if p137 == nil or p137.event_id == nil then nil else p137.event_id,
		user_rsvp = if p137 == nil or p137.user_rsvp == nil then nil else p137.user_rsvp,
		notifications_modal_identifier = if p137 == nil or p137.notifications_modal_identifier == nil then nil else p137.notifications_modal_identifier
	}, t_71)
end

function t_71:encode() --[[ line: 15816 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2399 = 0
	
	if self.event_id ~= nil then
		local var2400 = self.event_id:encode()
		local var2401, var2402 = protoModule.writeTag(buff, var2399, 1, protoModule.wireTypes.lengthDelimited)
		var2401, var2402 = protoModule.writeBuffer(var2401, var2402, var2400, buffer.len(var2400))
		buff = var2401
		var2399 = var2402
	end
	if self.user_rsvp ~= nil then
		local var2403 = self.user_rsvp:encode()
		local var2404, var2405 = protoModule.writeTag(buff, var2399, 2, protoModule.wireTypes.lengthDelimited)
		var2404, var2405 = protoModule.writeBuffer(var2404, var2405, var2403, buffer.len(var2403))
		buff = var2404
		var2399 = var2405
	end
	if self.notifications_modal_identifier ~= nil then
		local var2406 = self.notifications_modal_identifier:encode()
		local var2407, var2408 = protoModule.writeTag(buff, var2399, 3, protoModule.wireTypes.lengthDelimited)
		var2407, var2408 = protoModule.writeBuffer(var2407, var2408, var2406, buffer.len(var2406))
		buff = var2407
		var2399 = var2408
	end
	local buff_1 = buffer.create(var2399)
	buffer.copy(buff_1, 0, buff, 0, var2399)
	
	return buff_1
end

function t_71.decode(p138) --[[ line: 15843 ]]
	-- upvalues: t_71 (ref), protoModule (ref), propTypesModule (ref)
	local var2410 = t_71.new()
	local var2411 = 0
	while var2411 < buffer.len(p138) do
		local _ = nil
		local var2412 = nil
		local var2413, var2414, var2415 = protoModule.readTag(p138, var2411)
		local var2416 = var2413
		var2412 = var2414
		var2411 = var2415
		
		if var2412 == protoModule.wireTypes.varint then
			local _ = nil
			local var2417, var2418 = protoModule.readVarInt(p138, var2411)
			local _ = var2417
			var2411 = var2418
			continue
		end
		if var2412 == protoModule.wireTypes.lengthDelimited then
			if var2416 == 1 then
				local _ = nil
				local var2419, var2420 = protoModule.readBuffer(p138, var2411)
				var2411 = var2420
				var2410.event_id = propTypesModule.StringProp.decode(var2419)
			elseif var2416 == 2 then
				local _ = nil
				local var2421, var2422 = protoModule.readBuffer(p138, var2411)
				var2411 = var2422
				var2410.user_rsvp = propTypesModule.BoolProp.decode(var2421)
			elseif var2416 == 3 then
				local _ = nil
				local var2423, var2424 = protoModule.readBuffer(p138, var2411)
				var2411 = var2424
				var2410.notifications_modal_identifier = propTypesModule.StringProp.decode(var2423)
			else
				local _ = nil
				local var2425, var2426 = protoModule.readVarInt(p138, var2411)
				var2411 = var2426 + var2425
			end
		elseif var2412 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2427, var2428 = protoModule.readFixed32(p138, var2411)
			local _ = var2427
			var2411 = var2428
		elseif var2412 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2429, var2430 = protoModule.readFixed64(p138, var2411)
			local _ = var2429
			var2411 = var2430
		else
			error("Unsupported wire type: " .. var2412)
		end
	end
	return var2410
end

function t_71:jsonEncode() --[[ line: 15897 ]]
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

function t_71:jsonDecode() --[[ line: 15915 ]]
	-- upvalues: t_71 (ref), propTypesModule (ref)
	local var2432 = t_71.new()
	
	if self.event_id ~= nil then
		var2432.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var2432.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.user_rsvp ~= nil then
		var2432.user_rsvp = propTypesModule.BoolProp.jsonDecode(self.user_rsvp)
	end
	if self.userRsvp ~= nil then
		var2432.user_rsvp = propTypesModule.BoolProp.jsonDecode(self.userRsvp)
	end
	if self.notifications_modal_identifier ~= nil then
		var2432.notifications_modal_identifier = propTypesModule.StringProp.jsonDecode(self.notifications_modal_identifier)
	end
	if self.notificationsModalIdentifier ~= nil then
		var2432.notifications_modal_identifier = propTypesModule.StringProp.jsonDecode(self.notificationsModalIdentifier)
	end
	return var2432
end

t_71.descriptor = {
	name = "RsvpToEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RsvpToEventAction_Params = t_71
typeRegistryModule.default:register(t.RsvpToEventAction_Params)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p139) --[[ line: 15965 ]]
	-- upvalues: t (ref), t_72 (ref)
	return setmetatable({
		action_type = if p139 == nil or p139.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p139.action_type,
		action_params = if p139 == nil or p139.action_params == nil then nil else p139.action_params
	}, t_72)
end

function t_72:encode() --[[ line: 15974 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2434 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2435, var2436 = protoModule.writeTag(buff, var2434, 1, protoModule.wireTypes.varint)
		var2435, var2436 = protoModule.writeVarInt(var2435, var2436, t.ActionType.toNumber(self.action_type))
		buff = var2435
		var2434 = var2436
	end
	if self.action_params ~= nil then
		local var2437 = self.action_params:encode()
		local var2438, var2439 = protoModule.writeTag(buff, var2434, 2, protoModule.wireTypes.lengthDelimited)
		var2438, var2439 = protoModule.writeBuffer(var2438, var2439, var2437, buffer.len(var2437))
		buff = var2438
		var2434 = var2439
	end
	local buff_1 = buffer.create(var2434)
	buffer.copy(buff_1, 0, buff, 0, var2434)
	
	return buff_1
end

function t_72.decode(p140) --[[ line: 16000 ]]
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var2441 = t_72.new()
	local var2442 = 0
	while var2442 < buffer.len(p140) do
		local _ = nil
		local var2443 = nil
		local var2444, var2445, var2446 = protoModule.readTag(p140, var2442)
		local var2447 = var2444
		var2443 = var2445
		var2442 = var2446
		
		if var2443 == protoModule.wireTypes.varint then
			if var2447 == 1 then
				local _ = nil
				local var2448, var2449 = protoModule.readVarIntI32(p140, var2442)
				local var2450 = var2448
				var2442 = var2449
				var2441.action_type = t.ActionType.fromNumber(var2450) or var2450
			else
				local _ = nil
				local var2451, var2452 = protoModule.readVarInt(p140, var2442)
				local _ = var2451
				var2442 = var2452
			end
		end
		if var2443 == protoModule.wireTypes.lengthDelimited then
			if var2447 == 2 then
				local _ = nil
				local var2453, var2454 = protoModule.readBuffer(p140, var2442)
				var2442 = var2454
				var2441.action_params = t.OpenEventDetailsAction_Params.decode(var2453)
			else
				local _ = nil
				local var2455, var2456 = protoModule.readVarInt(p140, var2442)
				var2442 = var2456 + var2455
			end
		elseif var2443 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2457, var2458 = protoModule.readFixed32(p140, var2442)
			local _ = var2457
			var2442 = var2458
		elseif var2443 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2459, var2460 = protoModule.readFixed64(p140, var2442)
			local _ = var2459
			var2442 = var2460
		else
			error("Unsupported wire type: " .. var2443)
		end
	end
	return var2441
end

function t_72:jsonEncode() --[[ line: 16048 ]]
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

function t_72:jsonDecode() --[[ line: 16070 ]]
	-- upvalues: t_72 (ref), t (ref)
	local var2462 = t_72.new()
	
	if self.action_type ~= nil then
		var2462.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2462.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2462.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2462.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var2462
end

t_72.descriptor = {
	name = "OpenEventDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenEventDetailsAction"
}
t.OpenEventDetailsAction = t_72
typeRegistryModule.default:register(t.OpenEventDetailsAction)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p141) --[[ line: 16110 ]]
	-- upvalues: t_73 (ref)
	return setmetatable({
		event_id = if p141 == nil or p141.event_id == nil then nil else p141.event_id
	}, t_73)
end

function t_73:encode() --[[ line: 16118 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2464 = 0
	
	if self.event_id ~= nil then
		local var2465 = self.event_id:encode()
		local var2466, var2467 = protoModule.writeTag(buff, var2464, 1, protoModule.wireTypes.lengthDelimited)
		var2466, var2467 = protoModule.writeBuffer(var2466, var2467, var2465, buffer.len(var2465))
		buff = var2466
		var2464 = var2467
	end
	local buff_1 = buffer.create(var2464)
	buffer.copy(buff_1, 0, buff, 0, var2464)
	
	return buff_1
end

function t_73.decode(p142) --[[ line: 16133 ]]
	-- upvalues: t_73 (ref), protoModule (ref), propTypesModule (ref)
	local var2469 = t_73.new()
	local var2470 = 0
	while var2470 < buffer.len(p142) do
		local _ = nil
		local var2471 = nil
		local var2472, var2473, var2474 = protoModule.readTag(p142, var2470)
		local var2475 = var2472
		var2471 = var2473
		var2470 = var2474
		
		if var2471 == protoModule.wireTypes.varint then
			local _ = nil
			local var2476, var2477 = protoModule.readVarInt(p142, var2470)
			local _ = var2476
			var2470 = var2477
			continue
		end
		if var2471 == protoModule.wireTypes.lengthDelimited then
			if var2475 == 1 then
				local _ = nil
				local var2478, var2479 = protoModule.readBuffer(p142, var2470)
				var2470 = var2479
				var2469.event_id = propTypesModule.StringProp.decode(var2478)
			else
				local _ = nil
				local var2480, var2481 = protoModule.readVarInt(p142, var2470)
				var2470 = var2481 + var2480
			end
		elseif var2471 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2482, var2483 = protoModule.readFixed32(p142, var2470)
			local _ = var2482
			var2470 = var2483
		elseif var2471 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2484, var2485 = protoModule.readFixed64(p142, var2470)
			local _ = var2484
			var2470 = var2485
		else
			error("Unsupported wire type: " .. var2471)
		end
	end
	return var2469
end

function t_73:jsonEncode() --[[ line: 16176 ]]
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_73:jsonDecode() --[[ line: 16186 ]]
	-- upvalues: t_73 (ref), propTypesModule (ref)
	local var2487 = t_73.new()
	
	if self.event_id ~= nil then
		var2487.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var2487.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var2487
end

t_73.descriptor = {
	name = "OpenEventDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenEventDetailsAction_Params = t_73
typeRegistryModule.default:register(t.OpenEventDetailsAction_Params)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p143) --[[ line: 16214 ]]
	-- upvalues: t (ref), t_74 (ref)
	return setmetatable({
		action_type = if p143 == nil or p143.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p143.action_type,
		action_params = if p143 == nil or p143.action_params == nil then nil else p143.action_params
	}, t_74)
end

function t_74:encode() --[[ line: 16223 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2489 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2490, var2491 = protoModule.writeTag(buff, var2489, 1, protoModule.wireTypes.varint)
		var2490, var2491 = protoModule.writeVarInt(var2490, var2491, t.ActionType.toNumber(self.action_type))
		buff = var2490
		var2489 = var2491
	end
	if self.action_params ~= nil then
		local var2492 = self.action_params:encode()
		local var2493, var2494 = protoModule.writeTag(buff, var2489, 2, protoModule.wireTypes.lengthDelimited)
		var2493, var2494 = protoModule.writeBuffer(var2493, var2494, var2492, buffer.len(var2492))
		buff = var2493
		var2489 = var2494
	end
	local buff_1 = buffer.create(var2489)
	buffer.copy(buff_1, 0, buff, 0, var2489)
	
	return buff_1
end

function t_74.decode(p144) --[[ line: 16249 ]]
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var2496 = t_74.new()
	local var2497 = 0
	while var2497 < buffer.len(p144) do
		local _ = nil
		local var2498 = nil
		local var2499, var2500, var2501 = protoModule.readTag(p144, var2497)
		local var2502 = var2499
		var2498 = var2500
		var2497 = var2501
		
		if var2498 == protoModule.wireTypes.varint then
			if var2502 == 1 then
				local _ = nil
				local var2503, var2504 = protoModule.readVarIntI32(p144, var2497)
				local var2505 = var2503
				var2497 = var2504
				var2496.action_type = t.ActionType.fromNumber(var2505) or var2505
			else
				local _ = nil
				local var2506, var2507 = protoModule.readVarInt(p144, var2497)
				local _ = var2506
				var2497 = var2507
			end
		end
		if var2498 == protoModule.wireTypes.lengthDelimited then
			if var2502 == 2 then
				local _ = nil
				local var2508, var2509 = protoModule.readBuffer(p144, var2497)
				var2497 = var2509
				var2496.action_params = t.OpenBadgesSeeAllAction_Params.decode(var2508)
			else
				local _ = nil
				local var2510, var2511 = protoModule.readVarInt(p144, var2497)
				var2497 = var2511 + var2510
			end
		elseif var2498 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2512, var2513 = protoModule.readFixed32(p144, var2497)
			local _ = var2512
			var2497 = var2513
		elseif var2498 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2514, var2515 = protoModule.readFixed64(p144, var2497)
			local _ = var2514
			var2497 = var2515
		else
			error("Unsupported wire type: " .. var2498)
		end
	end
	return var2496
end

function t_74:jsonEncode() --[[ line: 16297 ]]
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

function t_74:jsonDecode() --[[ line: 16319 ]]
	-- upvalues: t_74 (ref), t (ref)
	local var2517 = t_74.new()
	
	if self.action_type ~= nil then
		var2517.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2517.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2517.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2517.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var2517
end

t_74.descriptor = {
	name = "OpenBadgesSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgesSeeAllAction"
}
t.OpenBadgesSeeAllAction = t_74
typeRegistryModule.default:register(t.OpenBadgesSeeAllAction)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p145) --[[ line: 16359 ]]
	-- upvalues: t_75 (ref)
	return setmetatable({
		universe_id = if p145 == nil or p145.universe_id == nil then nil else p145.universe_id
	}, t_75)
end

function t_75:encode() --[[ line: 16367 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2519 = 0
	
	if self.universe_id ~= nil then
		local var2520 = self.universe_id:encode()
		local var2521, var2522 = protoModule.writeTag(buff, var2519, 1, protoModule.wireTypes.lengthDelimited)
		var2521, var2522 = protoModule.writeBuffer(var2521, var2522, var2520, buffer.len(var2520))
		buff = var2521
		var2519 = var2522
	end
	local buff_1 = buffer.create(var2519)
	buffer.copy(buff_1, 0, buff, 0, var2519)
	
	return buff_1
end

function t_75.decode(p146) --[[ line: 16382 ]]
	-- upvalues: t_75 (ref), protoModule (ref), propTypesModule (ref)
	local var2524 = t_75.new()
	local var2525 = 0
	while var2525 < buffer.len(p146) do
		local _ = nil
		local var2526 = nil
		local var2527, var2528, var2529 = protoModule.readTag(p146, var2525)
		local var2530 = var2527
		var2526 = var2528
		var2525 = var2529
		
		if var2526 == protoModule.wireTypes.varint then
			local _ = nil
			local var2531, var2532 = protoModule.readVarInt(p146, var2525)
			local _ = var2531
			var2525 = var2532
			continue
		end
		if var2526 == protoModule.wireTypes.lengthDelimited then
			if var2530 == 1 then
				local _ = nil
				local var2533, var2534 = protoModule.readBuffer(p146, var2525)
				var2525 = var2534
				var2524.universe_id = propTypesModule.StringProp.decode(var2533)
			else
				local _ = nil
				local var2535, var2536 = protoModule.readVarInt(p146, var2525)
				var2525 = var2536 + var2535
			end
		elseif var2526 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2537, var2538 = protoModule.readFixed32(p146, var2525)
			local _ = var2537
			var2525 = var2538
		elseif var2526 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2539, var2540 = protoModule.readFixed64(p146, var2525)
			local _ = var2539
			var2525 = var2540
		else
			error("Unsupported wire type: " .. var2526)
		end
	end
	return var2524
end

function t_75:jsonEncode() --[[ line: 16425 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_75:jsonDecode() --[[ line: 16435 ]]
	-- upvalues: t_75 (ref), propTypesModule (ref)
	local var2542 = t_75.new()
	
	if self.universe_id ~= nil then
		var2542.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2542.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var2542
end

t_75.descriptor = {
	name = "OpenBadgesSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenBadgesSeeAllAction_Params = t_75
typeRegistryModule.default:register(t.OpenBadgesSeeAllAction_Params)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p147) --[[ line: 16464 ]]
	-- upvalues: t (ref), t_76 (ref)
	return setmetatable({
		action_type = if p147 == nil or p147.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p147.action_type,
		action_params = if p147 == nil or p147.action_params == nil then nil else p147.action_params
	}, t_76)
end

function t_76:encode() --[[ line: 16475 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2544 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2545, var2546 = protoModule.writeTag(buff, var2544, 1, protoModule.wireTypes.varint)
		var2545, var2546 = protoModule.writeVarInt(var2545, var2546, t.ActionType.toNumber(self.action_type))
		buff = var2545
		var2544 = var2546
	end
	if self.action_params ~= nil then
		local var2547 = self.action_params:encode()
		local var2548, var2549 = protoModule.writeTag(buff, var2544, 2, protoModule.wireTypes.lengthDelimited)
		var2548, var2549 = protoModule.writeBuffer(var2548, var2549, var2547, buffer.len(var2547))
		buff = var2548
		var2544 = var2549
	end
	local buff_1 = buffer.create(var2544)
	buffer.copy(buff_1, 0, buff, 0, var2544)
	
	return buff_1
end

function t_76.decode(p148) --[[ line: 16501 ]]
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var2551 = t_76.new()
	local var2552 = 0
	while var2552 < buffer.len(p148) do
		local _ = nil
		local var2553 = nil
		local var2554, var2555, var2556 = protoModule.readTag(p148, var2552)
		local var2557 = var2554
		var2553 = var2555
		var2552 = var2556
		
		if var2553 == protoModule.wireTypes.varint then
			if var2557 == 1 then
				local _ = nil
				local var2558, var2559 = protoModule.readVarIntI32(p148, var2552)
				local var2560 = var2558
				var2552 = var2559
				var2551.action_type = t.ActionType.fromNumber(var2560) or var2560
			else
				local _ = nil
				local var2561, var2562 = protoModule.readVarInt(p148, var2552)
				local _ = var2561
				var2552 = var2562
			end
		end
		if var2553 == protoModule.wireTypes.lengthDelimited then
			if var2557 == 2 then
				local _ = nil
				local var2563, var2564 = protoModule.readBuffer(p148, var2552)
				var2552 = var2564
				var2551.action_params = t.OpenExperienceStoreSeeAllAction_Params.decode(var2563)
			else
				local _ = nil
				local var2565, var2566 = protoModule.readVarInt(p148, var2552)
				var2552 = var2566 + var2565
			end
		elseif var2553 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2567, var2568 = protoModule.readFixed32(p148, var2552)
			local _ = var2567
			var2552 = var2568
		elseif var2553 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2569, var2570 = protoModule.readFixed64(p148, var2552)
			local _ = var2569
			var2552 = var2570
		else
			error("Unsupported wire type: " .. var2553)
		end
	end
	return var2551
end

function t_76:jsonEncode() --[[ line: 16549 ]]
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

function t_76:jsonDecode() --[[ line: 16571 ]]
	-- upvalues: t_76 (ref), t (ref)
	local var2572 = t_76.new()
	
	if self.action_type ~= nil then
		var2572.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2572.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2572.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2572.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var2572
end

t_76.descriptor = {
	name = "OpenExperienceStoreSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenExperienceStoreSeeAllAction"
}
t.OpenExperienceStoreSeeAllAction = t_76
typeRegistryModule.default:register(t.OpenExperienceStoreSeeAllAction)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p149) --[[ line: 16611 ]]
	-- upvalues: t_77 (ref)
	return setmetatable({
		universe_id = if p149 == nil or p149.universe_id == nil then nil else p149.universe_id
	}, t_77)
end

function t_77:encode() --[[ line: 16619 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2574 = 0
	
	if self.universe_id ~= nil then
		local var2575 = self.universe_id:encode()
		local var2576, var2577 = protoModule.writeTag(buff, var2574, 1, protoModule.wireTypes.lengthDelimited)
		var2576, var2577 = protoModule.writeBuffer(var2576, var2577, var2575, buffer.len(var2575))
		buff = var2576
		var2574 = var2577
	end
	local buff_1 = buffer.create(var2574)
	buffer.copy(buff_1, 0, buff, 0, var2574)
	
	return buff_1
end

function t_77.decode(p150) --[[ line: 16634 ]]
	-- upvalues: t_77 (ref), protoModule (ref), propTypesModule (ref)
	local var2579 = t_77.new()
	local var2580 = 0
	while var2580 < buffer.len(p150) do
		local _ = nil
		local var2581 = nil
		local var2582, var2583, var2584 = protoModule.readTag(p150, var2580)
		local var2585 = var2582
		var2581 = var2583
		var2580 = var2584
		
		if var2581 == protoModule.wireTypes.varint then
			local _ = nil
			local var2586, var2587 = protoModule.readVarInt(p150, var2580)
			local _ = var2586
			var2580 = var2587
			continue
		end
		if var2581 == protoModule.wireTypes.lengthDelimited then
			if var2585 == 1 then
				local _ = nil
				local var2588, var2589 = protoModule.readBuffer(p150, var2580)
				var2580 = var2589
				var2579.universe_id = propTypesModule.StringProp.decode(var2588)
			else
				local _ = nil
				local var2590, var2591 = protoModule.readVarInt(p150, var2580)
				var2580 = var2591 + var2590
			end
		elseif var2581 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2592, var2593 = protoModule.readFixed32(p150, var2580)
			local _ = var2592
			var2580 = var2593
		elseif var2581 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2594, var2595 = protoModule.readFixed64(p150, var2580)
			local _ = var2594
			var2580 = var2595
		else
			error("Unsupported wire type: " .. var2581)
		end
	end
	return var2579
end

function t_77:jsonEncode() --[[ line: 16677 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_77:jsonDecode() --[[ line: 16687 ]]
	-- upvalues: t_77 (ref), propTypesModule (ref)
	local var2597 = t_77.new()
	
	if self.universe_id ~= nil then
		var2597.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2597.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var2597
end

t_77.descriptor = {
	name = "OpenExperienceStoreSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenExperienceStoreSeeAllAction_Params = t_77
typeRegistryModule.default:register(t.OpenExperienceStoreSeeAllAction_Params)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p151) --[[ line: 16718 ]]
	-- upvalues: t (ref), t_78 (ref)
	return setmetatable({
		action_type = if p151 == nil or p151.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p151.action_type,
		action_params = if p151 == nil or p151.action_params == nil then nil else p151.action_params
	}, t_78)
end

function t_78:encode() --[[ line: 16729 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2599 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2600, var2601 = protoModule.writeTag(buff, var2599, 1, protoModule.wireTypes.varint)
		var2600, var2601 = protoModule.writeVarInt(var2600, var2601, t.ActionType.toNumber(self.action_type))
		buff = var2600
		var2599 = var2601
	end
	if self.action_params ~= nil then
		local var2602 = self.action_params:encode()
		local var2603, var2604 = protoModule.writeTag(buff, var2599, 2, protoModule.wireTypes.lengthDelimited)
		var2603, var2604 = protoModule.writeBuffer(var2603, var2604, var2602, buffer.len(var2602))
		buff = var2603
		var2599 = var2604
	end
	local buff_1 = buffer.create(var2599)
	buffer.copy(buff_1, 0, buff, 0, var2599)
	
	return buff_1
end

function t_78.decode(p152) --[[ line: 16755 ]]
	-- upvalues: t_78 (ref), protoModule (ref), t (ref)
	local var2606 = t_78.new()
	local var2607 = 0
	while var2607 < buffer.len(p152) do
		local _ = nil
		local var2608 = nil
		local var2609, var2610, var2611 = protoModule.readTag(p152, var2607)
		local var2612 = var2609
		var2608 = var2610
		var2607 = var2611
		
		if var2608 == protoModule.wireTypes.varint then
			if var2612 == 1 then
				local _ = nil
				local var2613, var2614 = protoModule.readVarIntI32(p152, var2607)
				local var2615 = var2613
				var2607 = var2614
				var2606.action_type = t.ActionType.fromNumber(var2615) or var2615
			else
				local _ = nil
				local var2616, var2617 = protoModule.readVarInt(p152, var2607)
				local _ = var2616
				var2607 = var2617
			end
		end
		if var2608 == protoModule.wireTypes.lengthDelimited then
			if var2612 == 2 then
				local _ = nil
				local var2618, var2619 = protoModule.readBuffer(p152, var2607)
				var2607 = var2619
				var2606.action_params = t.OpenSubscriptionPurchasePageAction_Params.decode(var2618)
			else
				local _ = nil
				local var2620, var2621 = protoModule.readVarInt(p152, var2607)
				var2607 = var2621 + var2620
			end
		elseif var2608 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2622, var2623 = protoModule.readFixed32(p152, var2607)
			local _ = var2622
			var2607 = var2623
		elseif var2608 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2624, var2625 = protoModule.readFixed64(p152, var2607)
			local _ = var2624
			var2607 = var2625
		else
			error("Unsupported wire type: " .. var2608)
		end
	end
	return var2606
end

function t_78:jsonEncode() --[[ line: 16803 ]]
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

function t_78:jsonDecode() --[[ line: 16825 ]]
	-- upvalues: t_78 (ref), t (ref)
	local var2627 = t_78.new()
	
	if self.action_type ~= nil then
		var2627.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2627.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2627.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2627.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.actionParams)
	end
	return var2627
end

t_78.descriptor = {
	name = "OpenSubscriptionPurchasePageAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSubscriptionPurchasePageAction"
}
t.OpenSubscriptionPurchasePageAction = t_78
typeRegistryModule.default:register(t.OpenSubscriptionPurchasePageAction)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p153) --[[ line: 16867 ]]
	-- upvalues: t_79 (ref)
	return setmetatable({
		subscription_id = if p153 == nil or p153.subscription_id == nil then nil else p153.subscription_id,
		universe_id = if p153 == nil or p153.universe_id == nil then nil else p153.universe_id,
		creator_name = if p153 == nil or p153.creator_name == nil then nil else p153.creator_name,
		creator_verified = if p153 == nil or p153.creator_verified == nil then nil else p153.creator_verified,
		name = if p153 == nil or p153.name == nil then nil else p153.name,
		description = if p153 == nil or p153.description == nil then nil else p153.description,
		image_asset_id = if p153 == nil or p153.image_asset_id == nil then nil else p153.image_asset_id,
		period_type = if p153 == nil or p153.period_type == nil then nil else p153.period_type,
		is_subscribed = if p153 == nil or p153.is_subscribed == nil then nil else p153.is_subscribed,
		price_display = if p153 == nil or p153.price_display == nil then nil else p153.price_display,
		price_in_robux = if p153 == nil or p153.price_in_robux == nil then nil else p153.price_in_robux,
		price_tier = if p153 == nil or p153.price_tier == nil then nil else p153.price_tier,
		thumbnail_string = if p153 == nil or p153.thumbnail_string == nil then nil else p153.thumbnail_string
	}, t_79)
end

function t_79:encode() --[[ line: 16887 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2629 = 0
	
	if self.subscription_id ~= nil then
		local var2630 = self.subscription_id:encode()
		local var2631, var2632 = protoModule.writeTag(buff, var2629, 1, protoModule.wireTypes.lengthDelimited)
		var2631, var2632 = protoModule.writeBuffer(var2631, var2632, var2630, buffer.len(var2630))
		buff = var2631
		var2629 = var2632
	end
	if self.universe_id ~= nil then
		local var2633 = self.universe_id:encode()
		local var2634, var2635 = protoModule.writeTag(buff, var2629, 2, protoModule.wireTypes.lengthDelimited)
		var2634, var2635 = protoModule.writeBuffer(var2634, var2635, var2633, buffer.len(var2633))
		buff = var2634
		var2629 = var2635
	end
	if self.creator_name ~= nil then
		local var2636 = self.creator_name:encode()
		local var2637, var2638 = protoModule.writeTag(buff, var2629, 3, protoModule.wireTypes.lengthDelimited)
		var2637, var2638 = protoModule.writeBuffer(var2637, var2638, var2636, buffer.len(var2636))
		buff = var2637
		var2629 = var2638
	end
	if self.creator_verified ~= nil then
		local var2639 = self.creator_verified:encode()
		local var2640, var2641 = protoModule.writeTag(buff, var2629, 4, protoModule.wireTypes.lengthDelimited)
		var2640, var2641 = protoModule.writeBuffer(var2640, var2641, var2639, buffer.len(var2639))
		buff = var2640
		var2629 = var2641
	end
	if self.name ~= nil then
		local var2642 = self.name:encode()
		local var2643, var2644 = protoModule.writeTag(buff, var2629, 5, protoModule.wireTypes.lengthDelimited)
		var2643, var2644 = protoModule.writeBuffer(var2643, var2644, var2642, buffer.len(var2642))
		buff = var2643
		var2629 = var2644
	end
	if self.description ~= nil then
		local var2645 = self.description:encode()
		local var2646, var2647 = protoModule.writeTag(buff, var2629, 6, protoModule.wireTypes.lengthDelimited)
		var2646, var2647 = protoModule.writeBuffer(var2646, var2647, var2645, buffer.len(var2645))
		buff = var2646
		var2629 = var2647
	end
	if self.image_asset_id ~= nil then
		local var2648 = self.image_asset_id:encode()
		local var2649, var2650 = protoModule.writeTag(buff, var2629, 7, protoModule.wireTypes.lengthDelimited)
		var2649, var2650 = protoModule.writeBuffer(var2649, var2650, var2648, buffer.len(var2648))
		buff = var2649
		var2629 = var2650
	end
	if self.period_type ~= nil then
		local var2651 = self.period_type:encode()
		local var2652, var2653 = protoModule.writeTag(buff, var2629, 8, protoModule.wireTypes.lengthDelimited)
		var2652, var2653 = protoModule.writeBuffer(var2652, var2653, var2651, buffer.len(var2651))
		buff = var2652
		var2629 = var2653
	end
	if self.is_subscribed ~= nil then
		local var2654 = self.is_subscribed:encode()
		local var2655, var2656 = protoModule.writeTag(buff, var2629, 9, protoModule.wireTypes.lengthDelimited)
		var2655, var2656 = protoModule.writeBuffer(var2655, var2656, var2654, buffer.len(var2654))
		buff = var2655
		var2629 = var2656
	end
	if self.price_display ~= nil then
		local var2657 = self.price_display:encode()
		local var2658, var2659 = protoModule.writeTag(buff, var2629, 10, protoModule.wireTypes.lengthDelimited)
		var2658, var2659 = protoModule.writeBuffer(var2658, var2659, var2657, buffer.len(var2657))
		buff = var2658
		var2629 = var2659
	end
	if self.price_in_robux ~= nil then
		local var2660 = self.price_in_robux:encode()
		local var2661, var2662 = protoModule.writeTag(buff, var2629, 11, protoModule.wireTypes.lengthDelimited)
		var2661, var2662 = protoModule.writeBuffer(var2661, var2662, var2660, buffer.len(var2660))
		buff = var2661
		var2629 = var2662
	end
	if self.price_tier ~= nil then
		local var2663 = self.price_tier:encode()
		local var2664, var2665 = protoModule.writeTag(buff, var2629, 12, protoModule.wireTypes.lengthDelimited)
		var2664, var2665 = protoModule.writeBuffer(var2664, var2665, var2663, buffer.len(var2663))
		buff = var2664
		var2629 = var2665
	end
	if self.thumbnail_string ~= nil then
		local var2666 = self.thumbnail_string:encode()
		local var2667, var2668 = protoModule.writeTag(buff, var2629, 13, protoModule.wireTypes.lengthDelimited)
		var2667, var2668 = protoModule.writeBuffer(var2667, var2668, var2666, buffer.len(var2666))
		buff = var2667
		var2629 = var2668
	end
	local buff_1 = buffer.create(var2629)
	buffer.copy(buff_1, 0, buff, 0, var2629)
	
	return buff_1
end

function t_79.decode(p154) --[[ line: 16976 ]]
	-- upvalues: t_79 (ref), protoModule (ref), propTypesModule (ref)
	local var2670 = t_79.new()
	local var2671 = 0
	while var2671 < buffer.len(p154) do
		local _ = nil
		local var2672 = nil
		local var2673, var2674, var2675 = protoModule.readTag(p154, var2671)
		local var2676 = var2673
		var2672 = var2674
		var2671 = var2675
		
		if var2672 == protoModule.wireTypes.varint then
			local _ = nil
			local var2677, var2678 = protoModule.readVarInt(p154, var2671)
			local _ = var2677
			var2671 = var2678
			continue
		end
		if var2672 == protoModule.wireTypes.lengthDelimited then
			if var2676 == 1 then
				local _ = nil
				local var2679, var2680 = protoModule.readBuffer(p154, var2671)
				var2671 = var2680
				var2670.subscription_id = propTypesModule.StringProp.decode(var2679)
			elseif var2676 == 2 then
				local _ = nil
				local var2681, var2682 = protoModule.readBuffer(p154, var2671)
				var2671 = var2682
				var2670.universe_id = propTypesModule.StringProp.decode(var2681)
			elseif var2676 == 3 then
				local _ = nil
				local var2683, var2684 = protoModule.readBuffer(p154, var2671)
				var2671 = var2684
				var2670.creator_name = propTypesModule.StringProp.decode(var2683)
			elseif var2676 == 4 then
				local _ = nil
				local var2685, var2686 = protoModule.readBuffer(p154, var2671)
				var2671 = var2686
				var2670.creator_verified = propTypesModule.BoolProp.decode(var2685)
			elseif var2676 == 5 then
				local _ = nil
				local var2687, var2688 = protoModule.readBuffer(p154, var2671)
				var2671 = var2688
				var2670.name = propTypesModule.StringProp.decode(var2687)
			elseif var2676 == 6 then
				local _ = nil
				local var2689, var2690 = protoModule.readBuffer(p154, var2671)
				var2671 = var2690
				var2670.description = propTypesModule.StringProp.decode(var2689)
			elseif var2676 == 7 then
				local _ = nil
				local var2691, var2692 = protoModule.readBuffer(p154, var2671)
				var2671 = var2692
				var2670.image_asset_id = propTypesModule.Int64Prop.decode(var2691)
			elseif var2676 == 8 then
				local _ = nil
				local var2693, var2694 = protoModule.readBuffer(p154, var2671)
				var2671 = var2694
				var2670.period_type = propTypesModule.StringProp.decode(var2693)
			elseif var2676 == 9 then
				local _ = nil
				local var2695, var2696 = protoModule.readBuffer(p154, var2671)
				var2671 = var2696
				var2670.is_subscribed = propTypesModule.BoolProp.decode(var2695)
			elseif var2676 == 10 then
				local _ = nil
				local var2697, var2698 = protoModule.readBuffer(p154, var2671)
				var2671 = var2698
				var2670.price_display = propTypesModule.StringProp.decode(var2697)
			elseif var2676 == 11 then
				local _ = nil
				local var2699, var2700 = protoModule.readBuffer(p154, var2671)
				var2671 = var2700
				var2670.price_in_robux = propTypesModule.Int64Prop.decode(var2699)
			elseif var2676 == 12 then
				local _ = nil
				local var2701, var2702 = protoModule.readBuffer(p154, var2671)
				var2671 = var2702
				var2670.price_tier = propTypesModule.Int64Prop.decode(var2701)
			elseif var2676 == 13 then
				local _ = nil
				local var2703, var2704 = protoModule.readBuffer(p154, var2671)
				var2671 = var2704
				var2670.thumbnail_string = propTypesModule.StringProp.decode(var2703)
			else
				local _ = nil
				local var2705, var2706 = protoModule.readVarInt(p154, var2671)
				var2671 = var2706 + var2705
			end
		elseif var2672 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2707, var2708 = protoModule.readFixed32(p154, var2671)
			local _ = var2707
			var2671 = var2708
		elseif var2672 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2709, var2710 = protoModule.readFixed64(p154, var2671)
			local _ = var2709
			var2671 = var2710
		else
			error("Unsupported wire type: " .. var2672)
		end
	end
	return var2670
end

function t_79:jsonEncode() --[[ line: 17081 ]]
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

function t_79:jsonDecode() --[[ line: 17141 ]]
	-- upvalues: t_79 (ref), propTypesModule (ref)
	local var2712 = t_79.new()
	
	if self.subscription_id ~= nil then
		var2712.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		var2712.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		var2712.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2712.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.creator_name ~= nil then
		var2712.creator_name = propTypesModule.StringProp.jsonDecode(self.creator_name)
	end
	if self.creatorName ~= nil then
		var2712.creator_name = propTypesModule.StringProp.jsonDecode(self.creatorName)
	end
	if self.creator_verified ~= nil then
		var2712.creator_verified = propTypesModule.BoolProp.jsonDecode(self.creator_verified)
	end
	if self.creatorVerified ~= nil then
		var2712.creator_verified = propTypesModule.BoolProp.jsonDecode(self.creatorVerified)
	end
	if self.name ~= nil then
		var2712.name = propTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.description ~= nil then
		var2712.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_asset_id ~= nil then
		var2712.image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.image_asset_id)
	end
	if self.imageAssetId ~= nil then
		var2712.image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.imageAssetId)
	end
	if self.period_type ~= nil then
		var2712.period_type = propTypesModule.StringProp.jsonDecode(self.period_type)
	end
	if self.periodType ~= nil then
		var2712.period_type = propTypesModule.StringProp.jsonDecode(self.periodType)
	end
	if self.is_subscribed ~= nil then
		var2712.is_subscribed = propTypesModule.BoolProp.jsonDecode(self.is_subscribed)
	end
	if self.isSubscribed ~= nil then
		var2712.is_subscribed = propTypesModule.BoolProp.jsonDecode(self.isSubscribed)
	end
	if self.price_display ~= nil then
		var2712.price_display = propTypesModule.StringProp.jsonDecode(self.price_display)
	end
	if self.priceDisplay ~= nil then
		var2712.price_display = propTypesModule.StringProp.jsonDecode(self.priceDisplay)
	end
	if self.price_in_robux ~= nil then
		var2712.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		var2712.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.price_tier ~= nil then
		var2712.price_tier = propTypesModule.Int64Prop.jsonDecode(self.price_tier)
	end
	if self.priceTier ~= nil then
		var2712.price_tier = propTypesModule.Int64Prop.jsonDecode(self.priceTier)
	end
	if self.thumbnail_string ~= nil then
		var2712.thumbnail_string = propTypesModule.StringProp.jsonDecode(self.thumbnail_string)
	end
	if self.thumbnailString ~= nil then
		var2712.thumbnail_string = propTypesModule.StringProp.jsonDecode(self.thumbnailString)
	end
	return var2712
end

t_79.descriptor = {
	name = "OpenSubscriptionPurchasePageAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSubscriptionPurchasePageAction_Params = t_79
typeRegistryModule.default:register(t.OpenSubscriptionPurchasePageAction_Params)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p155) --[[ line: 17278 ]]
	-- upvalues: t (ref), t_80 (ref)
	return setmetatable({
		action_type = if p155 == nil or p155.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p155.action_type,
		action_params = if p155 == nil or p155.action_params == nil then nil else p155.action_params
	}, t_80)
end

function t_80:encode() --[[ line: 17287 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2714 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2715, var2716 = protoModule.writeTag(buff, var2714, 1, protoModule.wireTypes.varint)
		var2715, var2716 = protoModule.writeVarInt(var2715, var2716, t.ActionType.toNumber(self.action_type))
		buff = var2715
		var2714 = var2716
	end
	if self.action_params ~= nil then
		local var2717 = self.action_params:encode()
		local var2718, var2719 = protoModule.writeTag(buff, var2714, 2, protoModule.wireTypes.lengthDelimited)
		var2718, var2719 = protoModule.writeBuffer(var2718, var2719, var2717, buffer.len(var2717))
		buff = var2718
		var2714 = var2719
	end
	local buff_1 = buffer.create(var2714)
	buffer.copy(buff_1, 0, buff, 0, var2714)
	
	return buff_1
end

function t_80.decode(p156) --[[ line: 17313 ]]
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var2721 = t_80.new()
	local var2722 = 0
	while var2722 < buffer.len(p156) do
		local _ = nil
		local var2723 = nil
		local var2724, var2725, var2726 = protoModule.readTag(p156, var2722)
		local var2727 = var2724
		var2723 = var2725
		var2722 = var2726
		
		if var2723 == protoModule.wireTypes.varint then
			if var2727 == 1 then
				local _ = nil
				local var2728, var2729 = protoModule.readVarIntI32(p156, var2722)
				local var2730 = var2728
				var2722 = var2729
				var2721.action_type = t.ActionType.fromNumber(var2730) or var2730
			else
				local _ = nil
				local var2731, var2732 = protoModule.readVarInt(p156, var2722)
				local _ = var2731
				var2722 = var2732
			end
		end
		if var2723 == protoModule.wireTypes.lengthDelimited then
			if var2727 == 2 then
				local _ = nil
				local var2733, var2734 = protoModule.readBuffer(p156, var2722)
				var2722 = var2734
				var2721.action_params = t.RefreshGamePassesAction_Params.decode(var2733)
			else
				local _ = nil
				local var2735, var2736 = protoModule.readVarInt(p156, var2722)
				var2722 = var2736 + var2735
			end
		elseif var2723 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2737, var2738 = protoModule.readFixed32(p156, var2722)
			local _ = var2737
			var2722 = var2738
		elseif var2723 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2739, var2740 = protoModule.readFixed64(p156, var2722)
			local _ = var2739
			var2722 = var2740
		else
			error("Unsupported wire type: " .. var2723)
		end
	end
	return var2721
end

function t_80:jsonEncode() --[[ line: 17361 ]]
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

function t_80:jsonDecode() --[[ line: 17383 ]]
	-- upvalues: t_80 (ref), t (ref)
	local var2742 = t_80.new()
	
	if self.action_type ~= nil then
		var2742.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2742.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2742.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2742.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.actionParams)
	end
	return var2742
end

t_80.descriptor = {
	name = "RefreshGamePassesAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshGamePassesAction"
}
t.RefreshGamePassesAction = t_80
typeRegistryModule.default:register(t.RefreshGamePassesAction)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p157) --[[ line: 17423 ]]
	-- upvalues: t_81 (ref)
	return setmetatable({
		universe_id = if p157 == nil or p157.universe_id == nil then nil else p157.universe_id
	}, t_81)
end

function t_81:encode() --[[ line: 17431 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2744 = 0
	
	if self.universe_id ~= nil then
		local var2745 = self.universe_id:encode()
		local var2746, var2747 = protoModule.writeTag(buff, var2744, 1, protoModule.wireTypes.lengthDelimited)
		var2746, var2747 = protoModule.writeBuffer(var2746, var2747, var2745, buffer.len(var2745))
		buff = var2746
		var2744 = var2747
	end
	local buff_1 = buffer.create(var2744)
	buffer.copy(buff_1, 0, buff, 0, var2744)
	
	return buff_1
end

function t_81.decode(p158) --[[ line: 17446 ]]
	-- upvalues: t_81 (ref), protoModule (ref), propTypesModule (ref)
	local var2749 = t_81.new()
	local var2750 = 0
	while var2750 < buffer.len(p158) do
		local _ = nil
		local var2751 = nil
		local var2752, var2753, var2754 = protoModule.readTag(p158, var2750)
		local var2755 = var2752
		var2751 = var2753
		var2750 = var2754
		
		if var2751 == protoModule.wireTypes.varint then
			local _ = nil
			local var2756, var2757 = protoModule.readVarInt(p158, var2750)
			local _ = var2756
			var2750 = var2757
			continue
		end
		if var2751 == protoModule.wireTypes.lengthDelimited then
			if var2755 == 1 then
				local _ = nil
				local var2758, var2759 = protoModule.readBuffer(p158, var2750)
				var2750 = var2759
				var2749.universe_id = propTypesModule.StringProp.decode(var2758)
			else
				local _ = nil
				local var2760, var2761 = protoModule.readVarInt(p158, var2750)
				var2750 = var2761 + var2760
			end
		elseif var2751 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2762, var2763 = protoModule.readFixed32(p158, var2750)
			local _ = var2762
			var2750 = var2763
		elseif var2751 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2764, var2765 = protoModule.readFixed64(p158, var2750)
			local _ = var2764
			var2750 = var2765
		else
			error("Unsupported wire type: " .. var2751)
		end
	end
	return var2749
end

function t_81:jsonEncode() --[[ line: 17489 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_81:jsonDecode() --[[ line: 17499 ]]
	-- upvalues: t_81 (ref), propTypesModule (ref)
	local var2767 = t_81.new()
	
	if self.universe_id ~= nil then
		var2767.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2767.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var2767
end

t_81.descriptor = {
	name = "RefreshGamePassesAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshGamePassesAction_Params = t_81
typeRegistryModule.default:register(t.RefreshGamePassesAction_Params)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p159) --[[ line: 17528 ]]
	-- upvalues: t (ref), t_82 (ref)
	return setmetatable({
		action_type = if p159 == nil or p159.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p159.action_type,
		action_params = if p159 == nil or p159.action_params == nil then nil else p159.action_params
	}, t_82)
end

function t_82:encode() --[[ line: 17537 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2769 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2770, var2771 = protoModule.writeTag(buff, var2769, 1, protoModule.wireTypes.varint)
		var2770, var2771 = protoModule.writeVarInt(var2770, var2771, t.ActionType.toNumber(self.action_type))
		buff = var2770
		var2769 = var2771
	end
	if self.action_params ~= nil then
		local var2772 = self.action_params:encode()
		local var2773, var2774 = protoModule.writeTag(buff, var2769, 2, protoModule.wireTypes.lengthDelimited)
		var2773, var2774 = protoModule.writeBuffer(var2773, var2774, var2772, buffer.len(var2772))
		buff = var2773
		var2769 = var2774
	end
	local buff_1 = buffer.create(var2769)
	buffer.copy(buff_1, 0, buff, 0, var2769)
	
	return buff_1
end

function t_82.decode(p160) --[[ line: 17563 ]]
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var2776 = t_82.new()
	local var2777 = 0
	while var2777 < buffer.len(p160) do
		local _ = nil
		local var2778 = nil
		local var2779, var2780, var2781 = protoModule.readTag(p160, var2777)
		local var2782 = var2779
		var2778 = var2780
		var2777 = var2781
		
		if var2778 == protoModule.wireTypes.varint then
			if var2782 == 1 then
				local _ = nil
				local var2783, var2784 = protoModule.readVarIntI32(p160, var2777)
				local var2785 = var2783
				var2777 = var2784
				var2776.action_type = t.ActionType.fromNumber(var2785) or var2785
			else
				local _ = nil
				local var2786, var2787 = protoModule.readVarInt(p160, var2777)
				local _ = var2786
				var2777 = var2787
			end
		end
		if var2778 == protoModule.wireTypes.lengthDelimited then
			if var2782 == 2 then
				local _ = nil
				local var2788, var2789 = protoModule.readBuffer(p160, var2777)
				var2777 = var2789
				var2776.action_params = t.RefreshPlayabilityAction_Params.decode(var2788)
			else
				local _ = nil
				local var2790, var2791 = protoModule.readVarInt(p160, var2777)
				var2777 = var2791 + var2790
			end
		elseif var2778 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2792, var2793 = protoModule.readFixed32(p160, var2777)
			local _ = var2792
			var2777 = var2793
		elseif var2778 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2794, var2795 = protoModule.readFixed64(p160, var2777)
			local _ = var2794
			var2777 = var2795
		else
			error("Unsupported wire type: " .. var2778)
		end
	end
	return var2776
end

function t_82:jsonEncode() --[[ line: 17611 ]]
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

function t_82:jsonDecode() --[[ line: 17633 ]]
	-- upvalues: t_82 (ref), t (ref)
	local var2797 = t_82.new()
	
	if self.action_type ~= nil then
		var2797.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2797.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2797.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2797.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.actionParams)
	end
	return var2797
end

t_82.descriptor = {
	name = "RefreshPlayabilityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshPlayabilityAction"
}
t.RefreshPlayabilityAction = t_82
typeRegistryModule.default:register(t.RefreshPlayabilityAction)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p161) --[[ line: 17673 ]]
	-- upvalues: t_83 (ref)
	return setmetatable({
		universe_id = if p161 == nil or p161.universe_id == nil then nil else p161.universe_id
	}, t_83)
end

function t_83:encode() --[[ line: 17681 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2799 = 0
	
	if self.universe_id ~= nil then
		local var2800 = self.universe_id:encode()
		local var2801, var2802 = protoModule.writeTag(buff, var2799, 1, protoModule.wireTypes.lengthDelimited)
		var2801, var2802 = protoModule.writeBuffer(var2801, var2802, var2800, buffer.len(var2800))
		buff = var2801
		var2799 = var2802
	end
	local buff_1 = buffer.create(var2799)
	buffer.copy(buff_1, 0, buff, 0, var2799)
	
	return buff_1
end

function t_83.decode(p162) --[[ line: 17696 ]]
	-- upvalues: t_83 (ref), protoModule (ref), propTypesModule (ref)
	local var2804 = t_83.new()
	local var2805 = 0
	while var2805 < buffer.len(p162) do
		local _ = nil
		local var2806 = nil
		local var2807, var2808, var2809 = protoModule.readTag(p162, var2805)
		local var2810 = var2807
		var2806 = var2808
		var2805 = var2809
		
		if var2806 == protoModule.wireTypes.varint then
			local _ = nil
			local var2811, var2812 = protoModule.readVarInt(p162, var2805)
			local _ = var2811
			var2805 = var2812
			continue
		end
		if var2806 == protoModule.wireTypes.lengthDelimited then
			if var2810 == 1 then
				local _ = nil
				local var2813, var2814 = protoModule.readBuffer(p162, var2805)
				var2805 = var2814
				var2804.universe_id = propTypesModule.StringProp.decode(var2813)
			else
				local _ = nil
				local var2815, var2816 = protoModule.readVarInt(p162, var2805)
				var2805 = var2816 + var2815
			end
		elseif var2806 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2817, var2818 = protoModule.readFixed32(p162, var2805)
			local _ = var2817
			var2805 = var2818
		elseif var2806 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2819, var2820 = protoModule.readFixed64(p162, var2805)
			local _ = var2819
			var2805 = var2820
		else
			error("Unsupported wire type: " .. var2806)
		end
	end
	return var2804
end

function t_83:jsonEncode() --[[ line: 17739 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_83:jsonDecode() --[[ line: 17749 ]]
	-- upvalues: t_83 (ref), propTypesModule (ref)
	local var2822 = t_83.new()
	
	if self.universe_id ~= nil then
		var2822.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2822.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var2822
end

t_83.descriptor = {
	name = "RefreshPlayabilityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshPlayabilityAction_Params = t_83
typeRegistryModule.default:register(t.RefreshPlayabilityAction_Params)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p163) --[[ line: 17778 ]]
	-- upvalues: t (ref), t_84 (ref)
	return setmetatable({
		action_type = if p163 == nil or p163.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p163.action_type,
		action_params = if p163 == nil or p163.action_params == nil then nil else p163.action_params
	}, t_84)
end

function t_84:encode() --[[ line: 17789 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2824 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2825, var2826 = protoModule.writeTag(buff, var2824, 1, protoModule.wireTypes.varint)
		var2825, var2826 = protoModule.writeVarInt(var2825, var2826, t.ActionType.toNumber(self.action_type))
		buff = var2825
		var2824 = var2826
	end
	if self.action_params ~= nil then
		local var2827 = self.action_params:encode()
		local var2828, var2829 = protoModule.writeTag(buff, var2824, 2, protoModule.wireTypes.lengthDelimited)
		var2828, var2829 = protoModule.writeBuffer(var2828, var2829, var2827, buffer.len(var2827))
		buff = var2828
		var2824 = var2829
	end
	local buff_1 = buffer.create(var2824)
	buffer.copy(buff_1, 0, buff, 0, var2824)
	
	return buff_1
end

function t_84.decode(p164) --[[ line: 17815 ]]
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var2831 = t_84.new()
	local var2832 = 0
	while var2832 < buffer.len(p164) do
		local _ = nil
		local var2833 = nil
		local var2834, var2835, var2836 = protoModule.readTag(p164, var2832)
		local var2837 = var2834
		var2833 = var2835
		var2832 = var2836
		
		if var2833 == protoModule.wireTypes.varint then
			if var2837 == 1 then
				local _ = nil
				local var2838, var2839 = protoModule.readVarIntI32(p164, var2832)
				local var2840 = var2838
				var2832 = var2839
				var2831.action_type = t.ActionType.fromNumber(var2840) or var2840
			else
				local _ = nil
				local var2841, var2842 = protoModule.readVarInt(p164, var2832)
				local _ = var2841
				var2832 = var2842
			end
		end
		if var2833 == protoModule.wireTypes.lengthDelimited then
			if var2837 == 2 then
				local _ = nil
				local var2843, var2844 = protoModule.readBuffer(p164, var2832)
				var2832 = var2844
				var2831.action_params = t.RefreshDeveloperProductsAction_Params.decode(var2843)
			else
				local _ = nil
				local var2845, var2846 = protoModule.readVarInt(p164, var2832)
				var2832 = var2846 + var2845
			end
		elseif var2833 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2847, var2848 = protoModule.readFixed32(p164, var2832)
			local _ = var2847
			var2832 = var2848
		elseif var2833 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2849, var2850 = protoModule.readFixed64(p164, var2832)
			local _ = var2849
			var2832 = var2850
		else
			error("Unsupported wire type: " .. var2833)
		end
	end
	return var2831
end

function t_84:jsonEncode() --[[ line: 17863 ]]
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

function t_84:jsonDecode() --[[ line: 17885 ]]
	-- upvalues: t_84 (ref), t (ref)
	local var2852 = t_84.new()
	
	if self.action_type ~= nil then
		var2852.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2852.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2852.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2852.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.actionParams)
	end
	return var2852
end

t_84.descriptor = {
	name = "RefreshDeveloperProductsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshDeveloperProductsAction"
}
t.RefreshDeveloperProductsAction = t_84
typeRegistryModule.default:register(t.RefreshDeveloperProductsAction)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p165) --[[ line: 17925 ]]
	-- upvalues: t_85 (ref)
	return setmetatable({
		place_id = if p165 == nil or p165.place_id == nil then nil else p165.place_id
	}, t_85)
end

function t_85:encode() --[[ line: 17933 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2854 = 0
	
	if self.place_id ~= nil then
		local var2855 = self.place_id:encode()
		local var2856, var2857 = protoModule.writeTag(buff, var2854, 1, protoModule.wireTypes.lengthDelimited)
		var2856, var2857 = protoModule.writeBuffer(var2856, var2857, var2855, buffer.len(var2855))
		buff = var2856
		var2854 = var2857
	end
	local buff_1 = buffer.create(var2854)
	buffer.copy(buff_1, 0, buff, 0, var2854)
	
	return buff_1
end

function t_85.decode(p166) --[[ line: 17948 ]]
	-- upvalues: t_85 (ref), protoModule (ref), propTypesModule (ref)
	local var2859 = t_85.new()
	local var2860 = 0
	while var2860 < buffer.len(p166) do
		local _ = nil
		local var2861 = nil
		local var2862, var2863, var2864 = protoModule.readTag(p166, var2860)
		local var2865 = var2862
		var2861 = var2863
		var2860 = var2864
		
		if var2861 == protoModule.wireTypes.varint then
			local _ = nil
			local var2866, var2867 = protoModule.readVarInt(p166, var2860)
			local _ = var2866
			var2860 = var2867
			continue
		end
		if var2861 == protoModule.wireTypes.lengthDelimited then
			if var2865 == 1 then
				local _ = nil
				local var2868, var2869 = protoModule.readBuffer(p166, var2860)
				var2860 = var2869
				var2859.place_id = propTypesModule.StringProp.decode(var2868)
			else
				local _ = nil
				local var2870, var2871 = protoModule.readVarInt(p166, var2860)
				var2860 = var2871 + var2870
			end
		elseif var2861 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2872, var2873 = protoModule.readFixed32(p166, var2860)
			local _ = var2872
			var2860 = var2873
		elseif var2861 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2874, var2875 = protoModule.readFixed64(p166, var2860)
			local _ = var2874
			var2860 = var2875
		else
			error("Unsupported wire type: " .. var2861)
		end
	end
	return var2859
end

function t_85:jsonEncode() --[[ line: 17991 ]]
	local t = {}
	
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	return t
end

function t_85:jsonDecode() --[[ line: 18001 ]]
	-- upvalues: t_85 (ref), propTypesModule (ref)
	local var2877 = t_85.new()
	
	if self.place_id ~= nil then
		var2877.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var2877.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	return var2877
end

t_85.descriptor = {
	name = "RefreshDeveloperProductsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshDeveloperProductsAction_Params = t_85
typeRegistryModule.default:register(t.RefreshDeveloperProductsAction_Params)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p167) --[[ line: 18031 ]]
	-- upvalues: t (ref), t_86 (ref)
	return setmetatable({
		action_type = if p167 == nil or p167.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p167.action_type,
		action_params = if p167 == nil or p167.action_params == nil then nil else p167.action_params
	}, t_86)
end

function t_86:encode() --[[ line: 18040 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2879 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2880, var2881 = protoModule.writeTag(buff, var2879, 1, protoModule.wireTypes.varint)
		var2880, var2881 = protoModule.writeVarInt(var2880, var2881, t.ActionType.toNumber(self.action_type))
		buff = var2880
		var2879 = var2881
	end
	if self.action_params ~= nil then
		local var2882 = self.action_params:encode()
		local var2883, var2884 = protoModule.writeTag(buff, var2879, 2, protoModule.wireTypes.lengthDelimited)
		var2883, var2884 = protoModule.writeBuffer(var2883, var2884, var2882, buffer.len(var2882))
		buff = var2883
		var2879 = var2884
	end
	local buff_1 = buffer.create(var2879)
	buffer.copy(buff_1, 0, buff, 0, var2879)
	
	return buff_1
end

function t_86.decode(p168) --[[ line: 18066 ]]
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2886 = t_86.new()
	local var2887 = 0
	while var2887 < buffer.len(p168) do
		local _ = nil
		local var2888 = nil
		local var2889, var2890, var2891 = protoModule.readTag(p168, var2887)
		local var2892 = var2889
		var2888 = var2890
		var2887 = var2891
		
		if var2888 == protoModule.wireTypes.varint then
			if var2892 == 1 then
				local _ = nil
				local var2893, var2894 = protoModule.readVarIntI32(p168, var2887)
				local var2895 = var2893
				var2887 = var2894
				var2886.action_type = t.ActionType.fromNumber(var2895) or var2895
			else
				local _ = nil
				local var2896, var2897 = protoModule.readVarInt(p168, var2887)
				local _ = var2896
				var2887 = var2897
			end
		end
		if var2888 == protoModule.wireTypes.lengthDelimited then
			if var2892 == 2 then
				local _ = nil
				local var2898, var2899 = protoModule.readBuffer(p168, var2887)
				var2887 = var2899
				var2886.action_params = t.OpenFaeTrialUpsellAction_Params.decode(var2898)
			else
				local _ = nil
				local var2900, var2901 = protoModule.readVarInt(p168, var2887)
				var2887 = var2901 + var2900
			end
		elseif var2888 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2902, var2903 = protoModule.readFixed32(p168, var2887)
			local _ = var2902
			var2887 = var2903
		elseif var2888 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2904, var2905 = protoModule.readFixed64(p168, var2887)
			local _ = var2904
			var2887 = var2905
		else
			error("Unsupported wire type: " .. var2888)
		end
	end
	return var2886
end

function t_86:jsonEncode() --[[ line: 18114 ]]
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

function t_86:jsonDecode() --[[ line: 18136 ]]
	-- upvalues: t_86 (ref), t (ref)
	local var2907 = t_86.new()
	
	if self.action_type ~= nil then
		var2907.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2907.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2907.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2907.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.actionParams)
	end
	return var2907
end

t_86.descriptor = {
	name = "OpenFaeTrialUpsellAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenFaeTrialUpsellAction"
}
t.OpenFaeTrialUpsellAction = t_86
typeRegistryModule.default:register(t.OpenFaeTrialUpsellAction)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p169) --[[ line: 18176 ]]
	-- upvalues: t_87 (ref)
	return setmetatable({
		source = if p169 == nil or p169.source == nil then nil else p169.source,
		config_key = if p169 == nil or p169.config_key == nil then nil else p169.config_key,
		surface_key = if p169 == nil or p169.surface_key == nil then nil else p169.surface_key,
		prompt_type = if p169 == nil or p169.prompt_type == nil then nil else p169.prompt_type
	}, t_87)
end

function t_87:encode() --[[ line: 18187 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2909 = 0
	
	if self.source ~= nil then
		local var2910 = self.source:encode()
		local var2911, var2912 = protoModule.writeTag(buff, var2909, 1, protoModule.wireTypes.lengthDelimited)
		var2911, var2912 = protoModule.writeBuffer(var2911, var2912, var2910, buffer.len(var2910))
		buff = var2911
		var2909 = var2912
	end
	if self.config_key ~= nil then
		local var2913 = self.config_key:encode()
		local var2914, var2915 = protoModule.writeTag(buff, var2909, 2, protoModule.wireTypes.lengthDelimited)
		var2914, var2915 = protoModule.writeBuffer(var2914, var2915, var2913, buffer.len(var2913))
		buff = var2914
		var2909 = var2915
	end
	if self.surface_key ~= nil then
		local var2916 = self.surface_key:encode()
		local var2917, var2918 = protoModule.writeTag(buff, var2909, 3, protoModule.wireTypes.lengthDelimited)
		var2917, var2918 = protoModule.writeBuffer(var2917, var2918, var2916, buffer.len(var2916))
		buff = var2917
		var2909 = var2918
	end
	if self.prompt_type ~= nil then
		local var2919 = self.prompt_type:encode()
		local var2920, var2921 = protoModule.writeTag(buff, var2909, 4, protoModule.wireTypes.lengthDelimited)
		var2920, var2921 = protoModule.writeBuffer(var2920, var2921, var2919, buffer.len(var2919))
		buff = var2920
		var2909 = var2921
	end
	local buff_1 = buffer.create(var2909)
	buffer.copy(buff_1, 0, buff, 0, var2909)
	
	return buff_1
end

function t_87.decode(p170) --[[ line: 18220 ]]
	-- upvalues: t_87 (ref), protoModule (ref), propTypesModule (ref)
	local var2923 = t_87.new()
	local var2924 = 0
	while var2924 < buffer.len(p170) do
		local _ = nil
		local var2925 = nil
		local var2926, var2927, var2928 = protoModule.readTag(p170, var2924)
		local var2929 = var2926
		var2925 = var2927
		var2924 = var2928
		
		if var2925 == protoModule.wireTypes.varint then
			local _ = nil
			local var2930, var2931 = protoModule.readVarInt(p170, var2924)
			local _ = var2930
			var2924 = var2931
			continue
		end
		if var2925 == protoModule.wireTypes.lengthDelimited then
			if var2929 == 1 then
				local _ = nil
				local var2932, var2933 = protoModule.readBuffer(p170, var2924)
				var2924 = var2933
				var2923.source = propTypesModule.StringProp.decode(var2932)
			elseif var2929 == 2 then
				local _ = nil
				local var2934, var2935 = protoModule.readBuffer(p170, var2924)
				var2924 = var2935
				var2923.config_key = propTypesModule.StringProp.decode(var2934)
			elseif var2929 == 3 then
				local _ = nil
				local var2936, var2937 = protoModule.readBuffer(p170, var2924)
				var2924 = var2937
				var2923.surface_key = propTypesModule.StringProp.decode(var2936)
			elseif var2929 == 4 then
				local _ = nil
				local var2938, var2939 = protoModule.readBuffer(p170, var2924)
				var2924 = var2939
				var2923.prompt_type = propTypesModule.StringProp.decode(var2938)
			else
				local _ = nil
				local var2940, var2941 = protoModule.readVarInt(p170, var2924)
				var2924 = var2941 + var2940
			end
		elseif var2925 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2942, var2943 = protoModule.readFixed32(p170, var2924)
			local _ = var2942
			var2924 = var2943
		elseif var2925 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2944, var2945 = protoModule.readFixed64(p170, var2924)
			local _ = var2944
			var2924 = var2945
		else
			error("Unsupported wire type: " .. var2925)
		end
	end
	return var2923
end

function t_87:jsonEncode() --[[ line: 18278 ]]
	local t = {}
	
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	if self.surface_key ~= nil then
		t.surfaceKey = self.surface_key:jsonEncode()
	end
	if self.prompt_type ~= nil then
		t.promptType = self.prompt_type:jsonEncode()
	end
	return t
end

function t_87:jsonDecode() --[[ line: 18300 ]]
	-- upvalues: t_87 (ref), propTypesModule (ref)
	local var2947 = t_87.new()
	
	if self.source ~= nil then
		var2947.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.config_key ~= nil then
		var2947.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var2947.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.surface_key ~= nil then
		var2947.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var2947.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.prompt_type ~= nil then
		var2947.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var2947.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	return var2947
end

t_87.descriptor = {
	name = "OpenFaeTrialUpsellAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenFaeTrialUpsellAction_Params = t_87
typeRegistryModule.default:register(t.OpenFaeTrialUpsellAction_Params)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p171) --[[ line: 18350 ]]
	-- upvalues: t (ref), t_88 (ref)
	return setmetatable({
		action_type = if p171 == nil or p171.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p171.action_type,
		action_params = if p171 == nil or p171.action_params == nil then nil else p171.action_params
	}, t_88)
end

function t_88:encode() --[[ line: 18361 ]]
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

function t_88.decode(p172) --[[ line: 18387 ]]
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2956 = t_88.new()
	local var2957 = 0
	while var2957 < buffer.len(p172) do
		local _ = nil
		local var2958 = nil
		local var2959, var2960, var2961 = protoModule.readTag(p172, var2957)
		local var2962 = var2959
		var2958 = var2960
		var2957 = var2961
		
		if var2958 == protoModule.wireTypes.varint then
			if var2962 == 1 then
				local _ = nil
				local var2963, var2964 = protoModule.readVarIntI32(p172, var2957)
				local var2965 = var2963
				var2957 = var2964
				var2956.action_type = t.ActionType.fromNumber(var2965) or var2965
			else
				local _ = nil
				local var2966, var2967 = protoModule.readVarInt(p172, var2957)
				local _ = var2966
				var2957 = var2967
			end
		end
		if var2958 == protoModule.wireTypes.lengthDelimited then
			if var2962 == 2 then
				local _ = nil
				local var2968, var2969 = protoModule.readBuffer(p172, var2957)
				var2957 = var2969
				var2956.action_params = t.OpenIncomingTransferUpsellAction_Params.decode(var2968)
			else
				local _ = nil
				local var2970, var2971 = protoModule.readVarInt(p172, var2957)
				var2957 = var2971 + var2970
			end
		elseif var2958 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2972, var2973 = protoModule.readFixed32(p172, var2957)
			local _ = var2972
			var2957 = var2973
		elseif var2958 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2974, var2975 = protoModule.readFixed64(p172, var2957)
			local _ = var2974
			var2957 = var2975
		else
			error("Unsupported wire type: " .. var2958)
		end
	end
	return var2956
end

function t_88:jsonEncode() --[[ line: 18435 ]]
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

function t_88:jsonDecode() --[[ line: 18457 ]]
	-- upvalues: t_88 (ref), t (ref)
	local var2977 = t_88.new()
	
	if self.action_type ~= nil then
		var2977.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2977.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2977.action_params = t.OpenIncomingTransferUpsellAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2977.action_params = t.OpenIncomingTransferUpsellAction_Params.jsonDecode(self.actionParams)
	end
	return var2977
end

t_88.descriptor = {
	name = "OpenIncomingTransferUpsellAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenIncomingTransferUpsellAction"
}
t.OpenIncomingTransferUpsellAction = t_88
typeRegistryModule.default:register(t.OpenIncomingTransferUpsellAction)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p173) --[[ line: 18499 ]]
	-- upvalues: t_89 (ref)
	return setmetatable({
		url = if p173 == nil or p173.url == nil then nil else p173.url,
		prompt_type = if p173 == nil or p173.prompt_type == nil then nil else p173.prompt_type,
		prompt_id = if p173 == nil or p173.prompt_id == nil then nil else p173.prompt_id
	}, t_89)
end

function t_89:encode() --[[ line: 18509 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2979 = 0
	
	if self.url ~= nil then
		local var2980 = self.url:encode()
		local var2981, var2982 = protoModule.writeTag(buff, var2979, 1, protoModule.wireTypes.lengthDelimited)
		var2981, var2982 = protoModule.writeBuffer(var2981, var2982, var2980, buffer.len(var2980))
		buff = var2981
		var2979 = var2982
	end
	if self.prompt_type ~= nil then
		local var2983 = self.prompt_type:encode()
		local var2984, var2985 = protoModule.writeTag(buff, var2979, 2, protoModule.wireTypes.lengthDelimited)
		var2984, var2985 = protoModule.writeBuffer(var2984, var2985, var2983, buffer.len(var2983))
		buff = var2984
		var2979 = var2985
	end
	if self.prompt_id ~= nil then
		local var2986 = self.prompt_id:encode()
		local var2987, var2988 = protoModule.writeTag(buff, var2979, 3, protoModule.wireTypes.lengthDelimited)
		var2987, var2988 = protoModule.writeBuffer(var2987, var2988, var2986, buffer.len(var2986))
		buff = var2987
		var2979 = var2988
	end
	local buff_1 = buffer.create(var2979)
	buffer.copy(buff_1, 0, buff, 0, var2979)
	
	return buff_1
end

function t_89.decode(p174) --[[ line: 18536 ]]
	-- upvalues: t_89 (ref), protoModule (ref), propTypesModule (ref)
	local var2990 = t_89.new()
	local var2991 = 0
	while var2991 < buffer.len(p174) do
		local _ = nil
		local var2992 = nil
		local var2993, var2994, var2995 = protoModule.readTag(p174, var2991)
		local var2996 = var2993
		var2992 = var2994
		var2991 = var2995
		
		if var2992 == protoModule.wireTypes.varint then
			local _ = nil
			local var2997, var2998 = protoModule.readVarInt(p174, var2991)
			local _ = var2997
			var2991 = var2998
			continue
		end
		if var2992 == protoModule.wireTypes.lengthDelimited then
			if var2996 == 1 then
				local _ = nil
				local var2999, var3000 = protoModule.readBuffer(p174, var2991)
				var2991 = var3000
				var2990.url = propTypesModule.StringProp.decode(var2999)
			elseif var2996 == 2 then
				local _ = nil
				local var3001, var3002 = protoModule.readBuffer(p174, var2991)
				var2991 = var3002
				var2990.prompt_type = propTypesModule.StringProp.decode(var3001)
			elseif var2996 == 3 then
				local _ = nil
				local var3003, var3004 = protoModule.readBuffer(p174, var2991)
				var2991 = var3004
				var2990.prompt_id = propTypesModule.StringProp.decode(var3003)
			else
				local _ = nil
				local var3005, var3006 = protoModule.readVarInt(p174, var2991)
				var2991 = var3006 + var3005
			end
		elseif var2992 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3007, var3008 = protoModule.readFixed32(p174, var2991)
			local _ = var3007
			var2991 = var3008
		elseif var2992 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3009, var3010 = protoModule.readFixed64(p174, var2991)
			local _ = var3009
			var2991 = var3010
		else
			error("Unsupported wire type: " .. var2992)
		end
	end
	return var2990
end

function t_89:jsonEncode() --[[ line: 18589 ]]
	local t = {}
	
	if self.url ~= nil then
		t.url = self.url:jsonEncode()
	end
	if self.prompt_type ~= nil then
		t.promptType = self.prompt_type:jsonEncode()
	end
	if self.prompt_id ~= nil then
		t.promptId = self.prompt_id:jsonEncode()
	end
	return t
end

function t_89:jsonDecode() --[[ line: 18607 ]]
	-- upvalues: t_89 (ref), propTypesModule (ref)
	local var3012 = t_89.new()
	
	if self.url ~= nil then
		var3012.url = propTypesModule.StringProp.jsonDecode(self.url)
	end
	if self.prompt_type ~= nil then
		var3012.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var3012.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var3012.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var3012.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	return var3012
end

t_89.descriptor = {
	name = "OpenIncomingTransferUpsellAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenIncomingTransferUpsellAction_Params = t_89
typeRegistryModule.default:register(t.OpenIncomingTransferUpsellAction_Params)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p175) --[[ line: 18650 ]]
	-- upvalues: t (ref), t_90 (ref)
	return setmetatable({
		action_type = if p175 == nil or p175.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p175.action_type,
		action_params = if p175 == nil or p175.action_params == nil then nil else p175.action_params
	}, t_90)
end

function t_90:encode() --[[ line: 18659 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3014 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3015, var3016 = protoModule.writeTag(buff, var3014, 1, protoModule.wireTypes.varint)
		var3015, var3016 = protoModule.writeVarInt(var3015, var3016, t.ActionType.toNumber(self.action_type))
		buff = var3015
		var3014 = var3016
	end
	if self.action_params ~= nil then
		local var3017 = self.action_params:encode()
		local var3018, var3019 = protoModule.writeTag(buff, var3014, 2, protoModule.wireTypes.lengthDelimited)
		var3018, var3019 = protoModule.writeBuffer(var3018, var3019, var3017, buffer.len(var3017))
		buff = var3018
		var3014 = var3019
	end
	local buff_1 = buffer.create(var3014)
	buffer.copy(buff_1, 0, buff, 0, var3014)
	
	return buff_1
end

function t_90.decode(p176) --[[ line: 18685 ]]
	-- upvalues: t_90 (ref), protoModule (ref), t (ref)
	local var3021 = t_90.new()
	local var3022 = 0
	while var3022 < buffer.len(p176) do
		local _ = nil
		local var3023 = nil
		local var3024, var3025, var3026 = protoModule.readTag(p176, var3022)
		local var3027 = var3024
		var3023 = var3025
		var3022 = var3026
		
		if var3023 == protoModule.wireTypes.varint then
			if var3027 == 1 then
				local _ = nil
				local var3028, var3029 = protoModule.readVarIntI32(p176, var3022)
				local var3030 = var3028
				var3022 = var3029
				var3021.action_type = t.ActionType.fromNumber(var3030) or var3030
			else
				local _ = nil
				local var3031, var3032 = protoModule.readVarInt(p176, var3022)
				local _ = var3031
				var3022 = var3032
			end
		end
		if var3023 == protoModule.wireTypes.lengthDelimited then
			if var3027 == 2 then
				local _ = nil
				local var3033, var3034 = protoModule.readBuffer(p176, var3022)
				var3022 = var3034
				var3021.action_params = t.OpenSduiOverlayAction_Params.decode(var3033)
			else
				local _ = nil
				local var3035, var3036 = protoModule.readVarInt(p176, var3022)
				var3022 = var3036 + var3035
			end
		elseif var3023 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3037, var3038 = protoModule.readFixed32(p176, var3022)
			local _ = var3037
			var3022 = var3038
		elseif var3023 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3039, var3040 = protoModule.readFixed64(p176, var3022)
			local _ = var3039
			var3022 = var3040
		else
			error("Unsupported wire type: " .. var3023)
		end
	end
	return var3021
end

function t_90:jsonEncode() --[[ line: 18733 ]]
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

function t_90:jsonDecode() --[[ line: 18755 ]]
	-- upvalues: t_90 (ref), t (ref)
	local var3042 = t_90.new()
	
	if self.action_type ~= nil then
		var3042.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3042.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3042.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3042.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.actionParams)
	end
	return var3042
end

t_90.descriptor = {
	name = "OpenSduiOverlayAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSduiOverlayAction"
}
t.OpenSduiOverlayAction = t_90
typeRegistryModule.default:register(t.OpenSduiOverlayAction)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p177) --[[ line: 18795 ]]
	-- upvalues: t_91 (ref)
	return setmetatable({
		config_key = if p177 == nil or p177.config_key == nil then nil else p177.config_key,
		identifier = if p177 == nil or p177.identifier == nil then nil else p177.identifier
	}, t_91)
end

function t_91:encode() --[[ line: 18804 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3044 = 0
	
	if self.config_key ~= nil then
		local var3045 = self.config_key:encode()
		local var3046, var3047 = protoModule.writeTag(buff, var3044, 1, protoModule.wireTypes.lengthDelimited)
		var3046, var3047 = protoModule.writeBuffer(var3046, var3047, var3045, buffer.len(var3045))
		buff = var3046
		var3044 = var3047
	end
	if self.identifier ~= nil then
		local var3048 = self.identifier:encode()
		local var3049, var3050 = protoModule.writeTag(buff, var3044, 2, protoModule.wireTypes.lengthDelimited)
		var3049, var3050 = protoModule.writeBuffer(var3049, var3050, var3048, buffer.len(var3048))
		buff = var3049
		var3044 = var3050
	end
	local buff_1 = buffer.create(var3044)
	buffer.copy(buff_1, 0, buff, 0, var3044)
	
	return buff_1
end

function t_91.decode(p178) --[[ line: 18825 ]]
	-- upvalues: t_91 (ref), protoModule (ref), propTypesModule (ref)
	local var3052 = t_91.new()
	local var3053 = 0
	while var3053 < buffer.len(p178) do
		local _ = nil
		local var3054 = nil
		local var3055, var3056, var3057 = protoModule.readTag(p178, var3053)
		local var3058 = var3055
		var3054 = var3056
		var3053 = var3057
		
		if var3054 == protoModule.wireTypes.varint then
			local _ = nil
			local var3059, var3060 = protoModule.readVarInt(p178, var3053)
			local _ = var3059
			var3053 = var3060
			continue
		end
		if var3054 == protoModule.wireTypes.lengthDelimited then
			if var3058 == 1 then
				local _ = nil
				local var3061, var3062 = protoModule.readBuffer(p178, var3053)
				var3053 = var3062
				var3052.config_key = propTypesModule.StringProp.decode(var3061)
			elseif var3058 == 2 then
				local _ = nil
				local var3063, var3064 = protoModule.readBuffer(p178, var3053)
				var3053 = var3064
				var3052.identifier = propTypesModule.StringProp.decode(var3063)
			else
				local _ = nil
				local var3065, var3066 = protoModule.readVarInt(p178, var3053)
				var3053 = var3066 + var3065
			end
		elseif var3054 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3067, var3068 = protoModule.readFixed32(p178, var3053)
			local _ = var3067
			var3053 = var3068
		elseif var3054 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3069, var3070 = protoModule.readFixed64(p178, var3053)
			local _ = var3069
			var3053 = var3070
		else
			error("Unsupported wire type: " .. var3054)
		end
	end
	return var3052
end

function t_91:jsonEncode() --[[ line: 18873 ]]
	local t = {}
	
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	if self.identifier ~= nil then
		t.identifier = self.identifier:jsonEncode()
	end
	return t
end

function t_91:jsonDecode() --[[ line: 18887 ]]
	-- upvalues: t_91 (ref), propTypesModule (ref)
	local var3072 = t_91.new()
	
	if self.config_key ~= nil then
		var3072.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var3072.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.identifier ~= nil then
		var3072.identifier = propTypesModule.StringProp.jsonDecode(self.identifier)
	end
	return var3072
end

t_91.descriptor = {
	name = "OpenSduiOverlayAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSduiOverlayAction_Params = t_91
typeRegistryModule.default:register(t.OpenSduiOverlayAction_Params)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p179) --[[ line: 18919 ]]
	-- upvalues: t (ref), t_92 (ref)
	return setmetatable({
		action_type = if p179 == nil or p179.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p179.action_type,
		action_params = if p179 == nil or p179.action_params == nil then nil else p179.action_params
	}, t_92)
end

function t_92:encode() --[[ line: 18928 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3074 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3075, var3076 = protoModule.writeTag(buff, var3074, 1, protoModule.wireTypes.varint)
		var3075, var3076 = protoModule.writeVarInt(var3075, var3076, t.ActionType.toNumber(self.action_type))
		buff = var3075
		var3074 = var3076
	end
	if self.action_params ~= nil then
		local var3077 = self.action_params:encode()
		local var3078, var3079 = protoModule.writeTag(buff, var3074, 2, protoModule.wireTypes.lengthDelimited)
		var3078, var3079 = protoModule.writeBuffer(var3078, var3079, var3077, buffer.len(var3077))
		buff = var3078
		var3074 = var3079
	end
	local buff_1 = buffer.create(var3074)
	buffer.copy(buff_1, 0, buff, 0, var3074)
	
	return buff_1
end

function t_92.decode(p180) --[[ line: 18954 ]]
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var3081 = t_92.new()
	local var3082 = 0
	while var3082 < buffer.len(p180) do
		local _ = nil
		local var3083 = nil
		local var3084, var3085, var3086 = protoModule.readTag(p180, var3082)
		local var3087 = var3084
		var3083 = var3085
		var3082 = var3086
		
		if var3083 == protoModule.wireTypes.varint then
			if var3087 == 1 then
				local _ = nil
				local var3088, var3089 = protoModule.readVarIntI32(p180, var3082)
				local var3090 = var3088
				var3082 = var3089
				var3081.action_type = t.ActionType.fromNumber(var3090) or var3090
			else
				local _ = nil
				local var3091, var3092 = protoModule.readVarInt(p180, var3082)
				local _ = var3091
				var3082 = var3092
			end
		end
		if var3083 == protoModule.wireTypes.lengthDelimited then
			if var3087 == 2 then
				local _ = nil
				local var3093, var3094 = protoModule.readBuffer(p180, var3082)
				var3082 = var3094
				var3081.action_params = t.ApplyChartsFilterAction_Params.decode(var3093)
			else
				local _ = nil
				local var3095, var3096 = protoModule.readVarInt(p180, var3082)
				var3082 = var3096 + var3095
			end
		elseif var3083 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3097, var3098 = protoModule.readFixed32(p180, var3082)
			local _ = var3097
			var3082 = var3098
		elseif var3083 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3099, var3100 = protoModule.readFixed64(p180, var3082)
			local _ = var3099
			var3082 = var3100
		else
			error("Unsupported wire type: " .. var3083)
		end
	end
	return var3081
end

function t_92:jsonEncode() --[[ line: 19002 ]]
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

function t_92:jsonDecode() --[[ line: 19024 ]]
	-- upvalues: t_92 (ref), t (ref)
	local var3102 = t_92.new()
	
	if self.action_type ~= nil then
		var3102.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3102.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3102.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3102.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.actionParams)
	end
	return var3102
end

t_92.descriptor = {
	name = "ApplyChartsFilterAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ApplyChartsFilterAction"
}
t.ApplyChartsFilterAction = t_92
typeRegistryModule.default:register(t.ApplyChartsFilterAction)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p181) --[[ line: 19064 ]]
	-- upvalues: t_93 (ref)
	return setmetatable({
		session_id = if p181 == nil or p181.session_id == nil then nil else p181.session_id
	}, t_93)
end

function t_93:encode() --[[ line: 19072 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3104 = 0
	
	if self.session_id ~= nil then
		local var3105 = self.session_id:encode()
		local var3106, var3107 = protoModule.writeTag(buff, var3104, 1, protoModule.wireTypes.lengthDelimited)
		var3106, var3107 = protoModule.writeBuffer(var3106, var3107, var3105, buffer.len(var3105))
		buff = var3106
		var3104 = var3107
	end
	local buff_1 = buffer.create(var3104)
	buffer.copy(buff_1, 0, buff, 0, var3104)
	
	return buff_1
end

function t_93.decode(p182) --[[ line: 19087 ]]
	-- upvalues: t_93 (ref), protoModule (ref), propTypesModule (ref)
	local var3109 = t_93.new()
	local var3110 = 0
	while var3110 < buffer.len(p182) do
		local _ = nil
		local var3111 = nil
		local var3112, var3113, var3114 = protoModule.readTag(p182, var3110)
		local var3115 = var3112
		var3111 = var3113
		var3110 = var3114
		
		if var3111 == protoModule.wireTypes.varint then
			local _ = nil
			local var3116, var3117 = protoModule.readVarInt(p182, var3110)
			local _ = var3116
			var3110 = var3117
			continue
		end
		if var3111 == protoModule.wireTypes.lengthDelimited then
			if var3115 == 1 then
				local _ = nil
				local var3118, var3119 = protoModule.readBuffer(p182, var3110)
				var3110 = var3119
				var3109.session_id = propTypesModule.StringProp.decode(var3118)
			else
				local _ = nil
				local var3120, var3121 = protoModule.readVarInt(p182, var3110)
				var3110 = var3121 + var3120
			end
		elseif var3111 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3122, var3123 = protoModule.readFixed32(p182, var3110)
			local _ = var3122
			var3110 = var3123
		elseif var3111 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3124, var3125 = protoModule.readFixed64(p182, var3110)
			local _ = var3124
			var3110 = var3125
		else
			error("Unsupported wire type: " .. var3111)
		end
	end
	return var3109
end

function t_93:jsonEncode() --[[ line: 19130 ]]
	local t = {}
	
	if self.session_id ~= nil then
		t.sessionId = self.session_id:jsonEncode()
	end
	return t
end

function t_93:jsonDecode() --[[ line: 19140 ]]
	-- upvalues: t_93 (ref), propTypesModule (ref)
	local var3127 = t_93.new()
	
	if self.session_id ~= nil then
		var3127.session_id = propTypesModule.StringProp.jsonDecode(self.session_id)
	end
	if self.sessionId ~= nil then
		var3127.session_id = propTypesModule.StringProp.jsonDecode(self.sessionId)
	end
	return var3127
end

t_93.descriptor = {
	name = "ApplyChartsFilterAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ApplyChartsFilterAction_Params = t_93
typeRegistryModule.default:register(t.ApplyChartsFilterAction_Params)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p183) --[[ line: 19168 ]]
	-- upvalues: t (ref), t_94 (ref)
	return setmetatable({
		action_type = if p183 == nil or p183.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p183.action_type,
		action_params = if p183 == nil or p183.action_params == nil then nil else p183.action_params
	}, t_94)
end

function t_94:encode() --[[ line: 19179 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3129 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3130, var3131 = protoModule.writeTag(buff, var3129, 1, protoModule.wireTypes.varint)
		var3130, var3131 = protoModule.writeVarInt(var3130, var3131, t.ActionType.toNumber(self.action_type))
		buff = var3130
		var3129 = var3131
	end
	if self.action_params ~= nil then
		local var3132 = self.action_params:encode()
		local var3133, var3134 = protoModule.writeTag(buff, var3129, 2, protoModule.wireTypes.lengthDelimited)
		var3133, var3134 = protoModule.writeBuffer(var3133, var3134, var3132, buffer.len(var3132))
		buff = var3133
		var3129 = var3134
	end
	local buff_1 = buffer.create(var3129)
	buffer.copy(buff_1, 0, buff, 0, var3129)
	
	return buff_1
end

function t_94.decode(p184) --[[ line: 19205 ]]
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var3136 = t_94.new()
	local var3137 = 0
	while var3137 < buffer.len(p184) do
		local _ = nil
		local var3138 = nil
		local var3139, var3140, var3141 = protoModule.readTag(p184, var3137)
		local var3142 = var3139
		var3138 = var3140
		var3137 = var3141
		
		if var3138 == protoModule.wireTypes.varint then
			if var3142 == 1 then
				local _ = nil
				local var3143, var3144 = protoModule.readVarIntI32(p184, var3137)
				local var3145 = var3143
				var3137 = var3144
				var3136.action_type = t.ActionType.fromNumber(var3145) or var3145
			else
				local _ = nil
				local var3146, var3147 = protoModule.readVarInt(p184, var3137)
				local _ = var3146
				var3137 = var3147
			end
		end
		if var3138 == protoModule.wireTypes.lengthDelimited then
			if var3142 == 2 then
				local _ = nil
				local var3148, var3149 = protoModule.readBuffer(p184, var3137)
				var3137 = var3149
				var3136.action_params = t.RefreshChartsSortDetailAction_Params.decode(var3148)
			else
				local _ = nil
				local var3150, var3151 = protoModule.readVarInt(p184, var3137)
				var3137 = var3151 + var3150
			end
		elseif var3138 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3152, var3153 = protoModule.readFixed32(p184, var3137)
			local _ = var3152
			var3137 = var3153
		elseif var3138 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3154, var3155 = protoModule.readFixed64(p184, var3137)
			local _ = var3154
			var3137 = var3155
		else
			error("Unsupported wire type: " .. var3138)
		end
	end
	return var3136
end

function t_94:jsonEncode() --[[ line: 19253 ]]
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

function t_94:jsonDecode() --[[ line: 19275 ]]
	-- upvalues: t_94 (ref), t (ref)
	local var3157 = t_94.new()
	
	if self.action_type ~= nil then
		var3157.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3157.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3157.action_params = t.RefreshChartsSortDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3157.action_params = t.RefreshChartsSortDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var3157
end

t_94.descriptor = {
	name = "RefreshChartsSortDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshChartsSortDetailAction"
}
t.RefreshChartsSortDetailAction = t_94
typeRegistryModule.default:register(t.RefreshChartsSortDetailAction)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p185) --[[ line: 19315 ]]
	-- upvalues: t_95 (ref)
	return setmetatable({
		config_key = if p185 == nil or p185.config_key == nil then nil else p185.config_key,
		selected_option = if p185 == nil or p185.selected_option == nil then nil else p185.selected_option,
		surface_key = if p185 == nil or p185.surface_key == nil then nil else p185.surface_key,
		sort_id = if p185 == nil or p185.sort_id == nil then nil else p185.sort_id
	}, t_95)
end

function t_95:encode() --[[ line: 19326 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3159 = 0
	
	if self.config_key ~= nil then
		local var3160 = self.config_key:encode()
		local var3161, var3162 = protoModule.writeTag(buff, var3159, 1, protoModule.wireTypes.lengthDelimited)
		var3161, var3162 = protoModule.writeBuffer(var3161, var3162, var3160, buffer.len(var3160))
		buff = var3161
		var3159 = var3162
	end
	if self.selected_option ~= nil then
		local var3163 = self.selected_option:encode()
		local var3164, var3165 = protoModule.writeTag(buff, var3159, 2, protoModule.wireTypes.lengthDelimited)
		var3164, var3165 = protoModule.writeBuffer(var3164, var3165, var3163, buffer.len(var3163))
		buff = var3164
		var3159 = var3165
	end
	if self.surface_key ~= nil then
		local var3166 = self.surface_key:encode()
		local var3167, var3168 = protoModule.writeTag(buff, var3159, 3, protoModule.wireTypes.lengthDelimited)
		var3167, var3168 = protoModule.writeBuffer(var3167, var3168, var3166, buffer.len(var3166))
		buff = var3167
		var3159 = var3168
	end
	if self.sort_id ~= nil then
		local var3169 = self.sort_id:encode()
		local var3170, var3171 = protoModule.writeTag(buff, var3159, 4, protoModule.wireTypes.lengthDelimited)
		var3170, var3171 = protoModule.writeBuffer(var3170, var3171, var3169, buffer.len(var3169))
		buff = var3170
		var3159 = var3171
	end
	local buff_1 = buffer.create(var3159)
	buffer.copy(buff_1, 0, buff, 0, var3159)
	
	return buff_1
end

function t_95.decode(p186) --[[ line: 19359 ]]
	-- upvalues: t_95 (ref), protoModule (ref), propTypesModule (ref)
	local var3173 = t_95.new()
	local var3174 = 0
	while var3174 < buffer.len(p186) do
		local _ = nil
		local var3175 = nil
		local var3176, var3177, var3178 = protoModule.readTag(p186, var3174)
		local var3179 = var3176
		var3175 = var3177
		var3174 = var3178
		
		if var3175 == protoModule.wireTypes.varint then
			local _ = nil
			local var3180, var3181 = protoModule.readVarInt(p186, var3174)
			local _ = var3180
			var3174 = var3181
			continue
		end
		if var3175 == protoModule.wireTypes.lengthDelimited then
			if var3179 == 1 then
				local _ = nil
				local var3182, var3183 = protoModule.readBuffer(p186, var3174)
				var3174 = var3183
				var3173.config_key = propTypesModule.StringProp.decode(var3182)
			elseif var3179 == 2 then
				local _ = nil
				local var3184, var3185 = protoModule.readBuffer(p186, var3174)
				var3174 = var3185
				var3173.selected_option = propTypesModule.StringProp.decode(var3184)
			elseif var3179 == 3 then
				local _ = nil
				local var3186, var3187 = protoModule.readBuffer(p186, var3174)
				var3174 = var3187
				var3173.surface_key = propTypesModule.StringProp.decode(var3186)
			elseif var3179 == 4 then
				local _ = nil
				local var3188, var3189 = protoModule.readBuffer(p186, var3174)
				var3174 = var3189
				var3173.sort_id = propTypesModule.StringProp.decode(var3188)
			else
				local _ = nil
				local var3190, var3191 = protoModule.readVarInt(p186, var3174)
				var3174 = var3191 + var3190
			end
		elseif var3175 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3192, var3193 = protoModule.readFixed32(p186, var3174)
			local _ = var3192
			var3174 = var3193
		elseif var3175 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3194, var3195 = protoModule.readFixed64(p186, var3174)
			local _ = var3194
			var3174 = var3195
		else
			error("Unsupported wire type: " .. var3175)
		end
	end
	return var3173
end

function t_95:jsonEncode() --[[ line: 19417 ]]
	local t = {}
	
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	if self.selected_option ~= nil then
		t.selectedOption = self.selected_option:jsonEncode()
	end
	if self.surface_key ~= nil then
		t.surfaceKey = self.surface_key:jsonEncode()
	end
	if self.sort_id ~= nil then
		t.sortId = self.sort_id:jsonEncode()
	end
	return t
end

function t_95:jsonDecode() --[[ line: 19439 ]]
	-- upvalues: t_95 (ref), propTypesModule (ref)
	local var3197 = t_95.new()
	
	if self.config_key ~= nil then
		var3197.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var3197.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.selected_option ~= nil then
		var3197.selected_option = propTypesModule.StringProp.jsonDecode(self.selected_option)
	end
	if self.selectedOption ~= nil then
		var3197.selected_option = propTypesModule.StringProp.jsonDecode(self.selectedOption)
	end
	if self.surface_key ~= nil then
		var3197.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var3197.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.sort_id ~= nil then
		var3197.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var3197.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	return var3197
end

t_95.descriptor = {
	name = "RefreshChartsSortDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshChartsSortDetailAction_Params = t_95
typeRegistryModule.default:register(t.RefreshChartsSortDetailAction_Params)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p187) --[[ line: 19496 ]]
	-- upvalues: t (ref), t_96 (ref)
	return setmetatable({
		action_type = if p187 == nil or p187.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p187.action_type,
		action_params = if p187 == nil or p187.action_params == nil then nil else p187.action_params
	}, t_96)
end

function t_96:encode() --[[ line: 19505 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3199 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3200, var3201 = protoModule.writeTag(buff, var3199, 1, protoModule.wireTypes.varint)
		var3200, var3201 = protoModule.writeVarInt(var3200, var3201, t.ActionType.toNumber(self.action_type))
		buff = var3200
		var3199 = var3201
	end
	if self.action_params ~= nil then
		local var3202 = self.action_params:encode()
		local var3203, var3204 = protoModule.writeTag(buff, var3199, 2, protoModule.wireTypes.lengthDelimited)
		var3203, var3204 = protoModule.writeBuffer(var3203, var3204, var3202, buffer.len(var3202))
		buff = var3203
		var3199 = var3204
	end
	local buff_1 = buffer.create(var3199)
	buffer.copy(buff_1, 0, buff, 0, var3199)
	
	return buff_1
end

function t_96.decode(p188) --[[ line: 19531 ]]
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var3206 = t_96.new()
	local var3207 = 0
	while var3207 < buffer.len(p188) do
		local _ = nil
		local var3208 = nil
		local var3209, var3210, var3211 = protoModule.readTag(p188, var3207)
		local var3212 = var3209
		var3208 = var3210
		var3207 = var3211
		
		if var3208 == protoModule.wireTypes.varint then
			if var3212 == 1 then
				local _ = nil
				local var3213, var3214 = protoModule.readVarIntI32(p188, var3207)
				local var3215 = var3213
				var3207 = var3214
				var3206.action_type = t.ActionType.fromNumber(var3215) or var3215
			else
				local _ = nil
				local var3216, var3217 = protoModule.readVarInt(p188, var3207)
				local _ = var3216
				var3207 = var3217
			end
		end
		if var3208 == protoModule.wireTypes.lengthDelimited then
			if var3212 == 2 then
				local _ = nil
				local var3218, var3219 = protoModule.readBuffer(p188, var3207)
				var3207 = var3219
				var3206.action_params = t.JoinCommunityAction_Params.decode(var3218)
			else
				local _ = nil
				local var3220, var3221 = protoModule.readVarInt(p188, var3207)
				var3207 = var3221 + var3220
			end
		elseif var3208 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3222, var3223 = protoModule.readFixed32(p188, var3207)
			local _ = var3222
			var3207 = var3223
		elseif var3208 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3224, var3225 = protoModule.readFixed64(p188, var3207)
			local _ = var3224
			var3207 = var3225
		else
			error("Unsupported wire type: " .. var3208)
		end
	end
	return var3206
end

function t_96:jsonEncode() --[[ line: 19579 ]]
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

function t_96:jsonDecode() --[[ line: 19601 ]]
	-- upvalues: t_96 (ref), t (ref)
	local var3227 = t_96.new()
	
	if self.action_type ~= nil then
		var3227.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3227.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3227.action_params = t.JoinCommunityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3227.action_params = t.JoinCommunityAction_Params.jsonDecode(self.actionParams)
	end
	return var3227
end

t_96.descriptor = {
	name = "JoinCommunityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.JoinCommunityAction"
}
t.JoinCommunityAction = t_96
typeRegistryModule.default:register(t.JoinCommunityAction)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p189) --[[ line: 19641 ]]
	-- upvalues: t_97 (ref)
	return setmetatable({
		community_id = if p189 == nil or p189.community_id == nil then nil else p189.community_id
	}, t_97)
end

function t_97:encode() --[[ line: 19649 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3229 = 0
	
	if self.community_id ~= nil then
		local var3230 = self.community_id:encode()
		local var3231, var3232 = protoModule.writeTag(buff, var3229, 1, protoModule.wireTypes.lengthDelimited)
		var3231, var3232 = protoModule.writeBuffer(var3231, var3232, var3230, buffer.len(var3230))
		buff = var3231
		var3229 = var3232
	end
	local buff_1 = buffer.create(var3229)
	buffer.copy(buff_1, 0, buff, 0, var3229)
	
	return buff_1
end

function t_97.decode(p190) --[[ line: 19664 ]]
	-- upvalues: t_97 (ref), protoModule (ref), propTypesModule (ref)
	local var3234 = t_97.new()
	local var3235 = 0
	while var3235 < buffer.len(p190) do
		local _ = nil
		local var3236 = nil
		local var3237, var3238, var3239 = protoModule.readTag(p190, var3235)
		local var3240 = var3237
		var3236 = var3238
		var3235 = var3239
		
		if var3236 == protoModule.wireTypes.varint then
			local _ = nil
			local var3241, var3242 = protoModule.readVarInt(p190, var3235)
			local _ = var3241
			var3235 = var3242
			continue
		end
		if var3236 == protoModule.wireTypes.lengthDelimited then
			if var3240 == 1 then
				local _ = nil
				local var3243, var3244 = protoModule.readBuffer(p190, var3235)
				var3235 = var3244
				var3234.community_id = propTypesModule.StringProp.decode(var3243)
			else
				local _ = nil
				local var3245, var3246 = protoModule.readVarInt(p190, var3235)
				var3235 = var3246 + var3245
			end
		elseif var3236 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3247, var3248 = protoModule.readFixed32(p190, var3235)
			local _ = var3247
			var3235 = var3248
		elseif var3236 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3249, var3250 = protoModule.readFixed64(p190, var3235)
			local _ = var3249
			var3235 = var3250
		else
			error("Unsupported wire type: " .. var3236)
		end
	end
	return var3234
end

function t_97:jsonEncode() --[[ line: 19707 ]]
	local t = {}
	
	if self.community_id ~= nil then
		t.communityId = self.community_id:jsonEncode()
	end
	return t
end

function t_97:jsonDecode() --[[ line: 19717 ]]
	-- upvalues: t_97 (ref), propTypesModule (ref)
	local var3252 = t_97.new()
	
	if self.community_id ~= nil then
		var3252.community_id = propTypesModule.StringProp.jsonDecode(self.community_id)
	end
	if self.communityId ~= nil then
		var3252.community_id = propTypesModule.StringProp.jsonDecode(self.communityId)
	end
	return var3252
end

t_97.descriptor = {
	name = "JoinCommunityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.JoinCommunityAction_Params = t_97
typeRegistryModule.default:register(t.JoinCommunityAction_Params)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p191) --[[ line: 19747 ]]
	-- upvalues: t (ref), t_98 (ref)
	return setmetatable({
		action_type = if p191 == nil or p191.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p191.action_type,
		action_params = if p191 == nil or p191.action_params == nil then nil else p191.action_params
	}, t_98)
end

function t_98:encode() --[[ line: 19756 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3254 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3255, var3256 = protoModule.writeTag(buff, var3254, 1, protoModule.wireTypes.varint)
		var3255, var3256 = protoModule.writeVarInt(var3255, var3256, t.ActionType.toNumber(self.action_type))
		buff = var3255
		var3254 = var3256
	end
	if self.action_params ~= nil then
		local var3257 = self.action_params:encode()
		local var3258, var3259 = protoModule.writeTag(buff, var3254, 2, protoModule.wireTypes.lengthDelimited)
		var3258, var3259 = protoModule.writeBuffer(var3258, var3259, var3257, buffer.len(var3257))
		buff = var3258
		var3254 = var3259
	end
	local buff_1 = buffer.create(var3254)
	buffer.copy(buff_1, 0, buff, 0, var3254)
	
	return buff_1
end

function t_98.decode(p192) --[[ line: 19782 ]]
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var3261 = t_98.new()
	local var3262 = 0
	while var3262 < buffer.len(p192) do
		local _ = nil
		local var3263 = nil
		local var3264, var3265, var3266 = protoModule.readTag(p192, var3262)
		local var3267 = var3264
		var3263 = var3265
		var3262 = var3266
		
		if var3263 == protoModule.wireTypes.varint then
			if var3267 == 1 then
				local _ = nil
				local var3268, var3269 = protoModule.readVarIntI32(p192, var3262)
				local var3270 = var3268
				var3262 = var3269
				var3261.action_type = t.ActionType.fromNumber(var3270) or var3270
			else
				local _ = nil
				local var3271, var3272 = protoModule.readVarInt(p192, var3262)
				local _ = var3271
				var3262 = var3272
			end
		end
		if var3263 == protoModule.wireTypes.lengthDelimited then
			if var3267 == 2 then
				local _ = nil
				local var3273, var3274 = protoModule.readBuffer(p192, var3262)
				var3262 = var3274
				var3261.action_params = t.ViewCommunityAction_Params.decode(var3273)
			else
				local _ = nil
				local var3275, var3276 = protoModule.readVarInt(p192, var3262)
				var3262 = var3276 + var3275
			end
		elseif var3263 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3277, var3278 = protoModule.readFixed32(p192, var3262)
			local _ = var3277
			var3262 = var3278
		elseif var3263 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3279, var3280 = protoModule.readFixed64(p192, var3262)
			local _ = var3279
			var3262 = var3280
		else
			error("Unsupported wire type: " .. var3263)
		end
	end
	return var3261
end

function t_98:jsonEncode() --[[ line: 19830 ]]
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

function t_98:jsonDecode() --[[ line: 19852 ]]
	-- upvalues: t_98 (ref), t (ref)
	local var3282 = t_98.new()
	
	if self.action_type ~= nil then
		var3282.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3282.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3282.action_params = t.ViewCommunityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3282.action_params = t.ViewCommunityAction_Params.jsonDecode(self.actionParams)
	end
	return var3282
end

t_98.descriptor = {
	name = "ViewCommunityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ViewCommunityAction"
}
t.ViewCommunityAction = t_98
typeRegistryModule.default:register(t.ViewCommunityAction)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p193) --[[ line: 19892 ]]
	-- upvalues: t_99 (ref)
	return setmetatable({
		community_id = if p193 == nil or p193.community_id == nil then nil else p193.community_id
	}, t_99)
end

function t_99:encode() --[[ line: 19900 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3284 = 0
	
	if self.community_id ~= nil then
		local var3285 = self.community_id:encode()
		local var3286, var3287 = protoModule.writeTag(buff, var3284, 1, protoModule.wireTypes.lengthDelimited)
		var3286, var3287 = protoModule.writeBuffer(var3286, var3287, var3285, buffer.len(var3285))
		buff = var3286
		var3284 = var3287
	end
	local buff_1 = buffer.create(var3284)
	buffer.copy(buff_1, 0, buff, 0, var3284)
	
	return buff_1
end

function t_99.decode(p194) --[[ line: 19915 ]]
	-- upvalues: t_99 (ref), protoModule (ref), propTypesModule (ref)
	local var3289 = t_99.new()
	local var3290 = 0
	while var3290 < buffer.len(p194) do
		local _ = nil
		local var3291 = nil
		local var3292, var3293, var3294 = protoModule.readTag(p194, var3290)
		local var3295 = var3292
		var3291 = var3293
		var3290 = var3294
		
		if var3291 == protoModule.wireTypes.varint then
			local _ = nil
			local var3296, var3297 = protoModule.readVarInt(p194, var3290)
			local _ = var3296
			var3290 = var3297
			continue
		end
		if var3291 == protoModule.wireTypes.lengthDelimited then
			if var3295 == 1 then
				local _ = nil
				local var3298, var3299 = protoModule.readBuffer(p194, var3290)
				var3290 = var3299
				var3289.community_id = propTypesModule.StringProp.decode(var3298)
			else
				local _ = nil
				local var3300, var3301 = protoModule.readVarInt(p194, var3290)
				var3290 = var3301 + var3300
			end
		elseif var3291 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3302, var3303 = protoModule.readFixed32(p194, var3290)
			local _ = var3302
			var3290 = var3303
		elseif var3291 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3304, var3305 = protoModule.readFixed64(p194, var3290)
			local _ = var3304
			var3290 = var3305
		else
			error("Unsupported wire type: " .. var3291)
		end
	end
	return var3289
end

function t_99:jsonEncode() --[[ line: 19958 ]]
	local t = {}
	
	if self.community_id ~= nil then
		t.communityId = self.community_id:jsonEncode()
	end
	return t
end

function t_99:jsonDecode() --[[ line: 19968 ]]
	-- upvalues: t_99 (ref), propTypesModule (ref)
	local var3307 = t_99.new()
	
	if self.community_id ~= nil then
		var3307.community_id = propTypesModule.StringProp.jsonDecode(self.community_id)
	end
	if self.communityId ~= nil then
		var3307.community_id = propTypesModule.StringProp.jsonDecode(self.communityId)
	end
	return var3307
end

t_99.descriptor = {
	name = "ViewCommunityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ViewCommunityAction_Params = t_99
typeRegistryModule.default:register(t.ViewCommunityAction_Params)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p195) --[[ line: 19998 ]]
	-- upvalues: t (ref), t_100 (ref)
	return setmetatable({
		action_type = if p195 == nil or p195.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p195.action_type,
		action_params = if p195 == nil or p195.action_params == nil then nil else p195.action_params
	}, t_100)
end

function t_100:encode() --[[ line: 20007 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3309 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3310, var3311 = protoModule.writeTag(buff, var3309, 1, protoModule.wireTypes.varint)
		var3310, var3311 = protoModule.writeVarInt(var3310, var3311, t.ActionType.toNumber(self.action_type))
		buff = var3310
		var3309 = var3311
	end
	if self.action_params ~= nil then
		local var3312 = self.action_params:encode()
		local var3313, var3314 = protoModule.writeTag(buff, var3309, 2, protoModule.wireTypes.lengthDelimited)
		var3313, var3314 = protoModule.writeBuffer(var3313, var3314, var3312, buffer.len(var3312))
		buff = var3313
		var3309 = var3314
	end
	local buff_1 = buffer.create(var3309)
	buffer.copy(buff_1, 0, buff, 0, var3309)
	
	return buff_1
end

function t_100.decode(p196) --[[ line: 20033 ]]
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var3316 = t_100.new()
	local var3317 = 0
	while var3317 < buffer.len(p196) do
		local _ = nil
		local var3318 = nil
		local var3319, var3320, var3321 = protoModule.readTag(p196, var3317)
		local var3322 = var3319
		var3318 = var3320
		var3317 = var3321
		
		if var3318 == protoModule.wireTypes.varint then
			if var3322 == 1 then
				local _ = nil
				local var3323, var3324 = protoModule.readVarIntI32(p196, var3317)
				local var3325 = var3323
				var3317 = var3324
				var3316.action_type = t.ActionType.fromNumber(var3325) or var3325
			else
				local _ = nil
				local var3326, var3327 = protoModule.readVarInt(p196, var3317)
				local _ = var3326
				var3317 = var3327
			end
		end
		if var3318 == protoModule.wireTypes.lengthDelimited then
			if var3322 == 2 then
				local _ = nil
				local var3328, var3329 = protoModule.readBuffer(p196, var3317)
				var3317 = var3329
				var3316.action_params = t.AnalyticsEventAction_Params.decode(var3328)
			else
				local _ = nil
				local var3330, var3331 = protoModule.readVarInt(p196, var3317)
				var3317 = var3331 + var3330
			end
		elseif var3318 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3332, var3333 = protoModule.readFixed32(p196, var3317)
			local _ = var3332
			var3317 = var3333
		elseif var3318 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3334, var3335 = protoModule.readFixed64(p196, var3317)
			local _ = var3334
			var3317 = var3335
		else
			error("Unsupported wire type: " .. var3318)
		end
	end
	return var3316
end

function t_100:jsonEncode() --[[ line: 20081 ]]
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

function t_100:jsonDecode() --[[ line: 20103 ]]
	-- upvalues: t_100 (ref), t (ref)
	local var3337 = t_100.new()
	
	if self.action_type ~= nil then
		var3337.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3337.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3337.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3337.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return var3337
end

t_100.descriptor = {
	name = "AnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.AnalyticsEventAction"
}
t.AnalyticsEventAction = t_100
typeRegistryModule.default:register(t.AnalyticsEventAction)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p197) --[[ line: 20143 ]]
	-- upvalues: t_101 (ref)
	return setmetatable({
		event_name = if p197 == nil or p197.event_name == nil then nil else p197.event_name,
		event_fields = if p197 == nil or p197.event_fields == nil then nil else p197.event_fields
	}, t_101)
end

function t_101:encode() --[[ line: 20152 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3339 = 0
	
	if self.event_name ~= nil then
		local var3340 = self.event_name:encode()
		local var3341, var3342 = protoModule.writeTag(buff, var3339, 1, protoModule.wireTypes.lengthDelimited)
		var3341, var3342 = protoModule.writeBuffer(var3341, var3342, var3340, buffer.len(var3340))
		buff = var3341
		var3339 = var3342
	end
	if self.event_fields ~= nil then
		local var3343 = self.event_fields:encode()
		local var3344, var3345 = protoModule.writeTag(buff, var3339, 2, protoModule.wireTypes.lengthDelimited)
		var3344, var3345 = protoModule.writeBuffer(var3344, var3345, var3343, buffer.len(var3343))
		buff = var3344
		var3339 = var3345
	end
	local buff_1 = buffer.create(var3339)
	buffer.copy(buff_1, 0, buff, 0, var3339)
	
	return buff_1
end

function t_101.decode(p198) --[[ line: 20173 ]]
	-- upvalues: t_101 (ref), protoModule (ref), propTypesModule (ref)
	local var3347 = t_101.new()
	local var3348 = 0
	while var3348 < buffer.len(p198) do
		local _ = nil
		local var3349 = nil
		local var3350, var3351, var3352 = protoModule.readTag(p198, var3348)
		local var3353 = var3350
		var3349 = var3351
		var3348 = var3352
		
		if var3349 == protoModule.wireTypes.varint then
			local _ = nil
			local var3354, var3355 = protoModule.readVarInt(p198, var3348)
			local _ = var3354
			var3348 = var3355
			continue
		end
		if var3349 == protoModule.wireTypes.lengthDelimited then
			if var3353 == 1 then
				local _ = nil
				local var3356, var3357 = protoModule.readBuffer(p198, var3348)
				var3348 = var3357
				var3347.event_name = propTypesModule.StringProp.decode(var3356)
			elseif var3353 == 2 then
				local _ = nil
				local var3358, var3359 = protoModule.readBuffer(p198, var3348)
				var3348 = var3359
				var3347.event_fields = propTypesModule.StructProp.decode(var3358)
			else
				local _ = nil
				local var3360, var3361 = protoModule.readVarInt(p198, var3348)
				var3348 = var3361 + var3360
			end
		elseif var3349 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3362, var3363 = protoModule.readFixed32(p198, var3348)
			local _ = var3362
			var3348 = var3363
		elseif var3349 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3364, var3365 = protoModule.readFixed64(p198, var3348)
			local _ = var3364
			var3348 = var3365
		else
			error("Unsupported wire type: " .. var3349)
		end
	end
	return var3347
end

function t_101:jsonEncode() --[[ line: 20221 ]]
	local t = {}
	
	if self.event_name ~= nil then
		t.eventName = self.event_name:jsonEncode()
	end
	if self.event_fields ~= nil then
		t.eventFields = self.event_fields:jsonEncode()
	end
	return t
end

function t_101:jsonDecode() --[[ line: 20235 ]]
	-- upvalues: t_101 (ref), propTypesModule (ref)
	local var3367 = t_101.new()
	
	if self.event_name ~= nil then
		var3367.event_name = propTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		var3367.event_name = propTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		var3367.event_fields = propTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		var3367.event_fields = propTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return var3367
end

t_101.descriptor = {
	name = "AnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.AnalyticsEventAction_Params = t_101
typeRegistryModule.default:register(t.AnalyticsEventAction_Params)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p199) --[[ line: 20273 ]]
	-- upvalues: t (ref), t_102 (ref)
	return setmetatable({
		action_type = if p199 == nil or p199.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p199.action_type,
		action_params = if p199 == nil or p199.action_params == nil then nil else p199.action_params
	}, t_102)
end

function t_102:encode() --[[ line: 20284 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3369 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3370, var3371 = protoModule.writeTag(buff, var3369, 1, protoModule.wireTypes.varint)
		var3370, var3371 = protoModule.writeVarInt(var3370, var3371, t.ActionType.toNumber(self.action_type))
		buff = var3370
		var3369 = var3371
	end
	if self.action_params ~= nil then
		local var3372 = self.action_params:encode()
		local var3373, var3374 = protoModule.writeTag(buff, var3369, 2, protoModule.wireTypes.lengthDelimited)
		var3373, var3374 = protoModule.writeBuffer(var3373, var3374, var3372, buffer.len(var3372))
		buff = var3373
		var3369 = var3374
	end
	local buff_1 = buffer.create(var3369)
	buffer.copy(buff_1, 0, buff, 0, var3369)
	
	return buff_1
end

function t_102.decode(p200) --[[ line: 20310 ]]
	-- upvalues: t_102 (ref), protoModule (ref), t (ref)
	local var3376 = t_102.new()
	local var3377 = 0
	while var3377 < buffer.len(p200) do
		local _ = nil
		local var3378 = nil
		local var3379, var3380, var3381 = protoModule.readTag(p200, var3377)
		local var3382 = var3379
		var3378 = var3380
		var3377 = var3381
		
		if var3378 == protoModule.wireTypes.varint then
			if var3382 == 1 then
				local _ = nil
				local var3383, var3384 = protoModule.readVarIntI32(p200, var3377)
				local var3385 = var3383
				var3377 = var3384
				var3376.action_type = t.ActionType.fromNumber(var3385) or var3385
			else
				local _ = nil
				local var3386, var3387 = protoModule.readVarInt(p200, var3377)
				local _ = var3386
				var3377 = var3387
			end
		end
		if var3378 == protoModule.wireTypes.lengthDelimited then
			if var3382 == 2 then
				local _ = nil
				local var3388, var3389 = protoModule.readBuffer(p200, var3377)
				var3377 = var3389
				var3376.action_params = t.CustomAnalyticsEventAction_Params.decode(var3388)
			else
				local _ = nil
				local var3390, var3391 = protoModule.readVarInt(p200, var3377)
				var3377 = var3391 + var3390
			end
		elseif var3378 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3392, var3393 = protoModule.readFixed32(p200, var3377)
			local _ = var3392
			var3377 = var3393
		elseif var3378 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3394, var3395 = protoModule.readFixed64(p200, var3377)
			local _ = var3394
			var3377 = var3395
		else
			error("Unsupported wire type: " .. var3378)
		end
	end
	return var3376
end

function t_102:jsonEncode() --[[ line: 20358 ]]
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

function t_102:jsonDecode() --[[ line: 20380 ]]
	-- upvalues: t_102 (ref), t (ref)
	local var3397 = t_102.new()
	
	if self.action_type ~= nil then
		var3397.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3397.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3397.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3397.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return var3397
end

t_102.descriptor = {
	name = "CustomAnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomAnalyticsEventAction"
}
t.CustomAnalyticsEventAction = t_102
typeRegistryModule.default:register(t.CustomAnalyticsEventAction)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p201) --[[ line: 20420 ]]
	-- upvalues: t_103 (ref)
	return setmetatable({
		event_name = if p201 == nil or p201.event_name == nil then nil else p201.event_name,
		event_fields = if p201 == nil or p201.event_fields == nil then nil else p201.event_fields
	}, t_103)
end

function t_103:encode() --[[ line: 20429 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3399 = 0
	
	if self.event_name ~= nil then
		local var3400 = self.event_name:encode()
		local var3401, var3402 = protoModule.writeTag(buff, var3399, 1, protoModule.wireTypes.lengthDelimited)
		var3401, var3402 = protoModule.writeBuffer(var3401, var3402, var3400, buffer.len(var3400))
		buff = var3401
		var3399 = var3402
	end
	if self.event_fields ~= nil then
		local var3403 = self.event_fields:encode()
		local var3404, var3405 = protoModule.writeTag(buff, var3399, 2, protoModule.wireTypes.lengthDelimited)
		var3404, var3405 = protoModule.writeBuffer(var3404, var3405, var3403, buffer.len(var3403))
		buff = var3404
		var3399 = var3405
	end
	local buff_1 = buffer.create(var3399)
	buffer.copy(buff_1, 0, buff, 0, var3399)
	
	return buff_1
end

function t_103.decode(p202) --[[ line: 20450 ]]
	-- upvalues: t_103 (ref), protoModule (ref), propTypesModule (ref)
	local var3407 = t_103.new()
	local var3408 = 0
	while var3408 < buffer.len(p202) do
		local _ = nil
		local var3409 = nil
		local var3410, var3411, var3412 = protoModule.readTag(p202, var3408)
		local var3413 = var3410
		var3409 = var3411
		var3408 = var3412
		
		if var3409 == protoModule.wireTypes.varint then
			local _ = nil
			local var3414, var3415 = protoModule.readVarInt(p202, var3408)
			local _ = var3414
			var3408 = var3415
			continue
		end
		if var3409 == protoModule.wireTypes.lengthDelimited then
			if var3413 == 1 then
				local _ = nil
				local var3416, var3417 = protoModule.readBuffer(p202, var3408)
				var3408 = var3417
				var3407.event_name = propTypesModule.StringProp.decode(var3416)
			elseif var3413 == 2 then
				local _ = nil
				local var3418, var3419 = protoModule.readBuffer(p202, var3408)
				var3408 = var3419
				var3407.event_fields = propTypesModule.StructProp.decode(var3418)
			else
				local _ = nil
				local var3420, var3421 = protoModule.readVarInt(p202, var3408)
				var3408 = var3421 + var3420
			end
		elseif var3409 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3422, var3423 = protoModule.readFixed32(p202, var3408)
			local _ = var3422
			var3408 = var3423
		elseif var3409 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3424, var3425 = protoModule.readFixed64(p202, var3408)
			local _ = var3424
			var3408 = var3425
		else
			error("Unsupported wire type: " .. var3409)
		end
	end
	return var3407
end

function t_103:jsonEncode() --[[ line: 20498 ]]
	local t = {}
	
	if self.event_name ~= nil then
		t.eventName = self.event_name:jsonEncode()
	end
	if self.event_fields ~= nil then
		t.eventFields = self.event_fields:jsonEncode()
	end
	return t
end

function t_103:jsonDecode() --[[ line: 20512 ]]
	-- upvalues: t_103 (ref), propTypesModule (ref)
	local var3427 = t_103.new()
	
	if self.event_name ~= nil then
		var3427.event_name = propTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		var3427.event_name = propTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		var3427.event_fields = propTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		var3427.event_fields = propTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return var3427
end

t_103.descriptor = {
	name = "CustomAnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.CustomAnalyticsEventAction_Params = t_103
typeRegistryModule.default:register(t.CustomAnalyticsEventAction_Params)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p203) --[[ line: 20552 ]]
	-- upvalues: t (ref), t_104 (ref)
	return setmetatable({
		action_type = if p203 == nil or p203.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p203.action_type,
		action_params = if p203 == nil or p203.action_params == nil then nil else p203.action_params
	}, t_104)
end

function t_104:encode() --[[ line: 20561 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3429 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3430, var3431 = protoModule.writeTag(buff, var3429, 1, protoModule.wireTypes.varint)
		var3430, var3431 = protoModule.writeVarInt(var3430, var3431, t.ActionType.toNumber(self.action_type))
		buff = var3430
		var3429 = var3431
	end
	if self.action_params ~= nil then
		local var3432 = self.action_params:encode()
		local var3433, var3434 = protoModule.writeTag(buff, var3429, 2, protoModule.wireTypes.lengthDelimited)
		var3433, var3434 = protoModule.writeBuffer(var3433, var3434, var3432, buffer.len(var3432))
		buff = var3433
		var3429 = var3434
	end
	local buff_1 = buffer.create(var3429)
	buffer.copy(buff_1, 0, buff, 0, var3429)
	
	return buff_1
end

function t_104.decode(p204) --[[ line: 20587 ]]
	-- upvalues: t_104 (ref), protoModule (ref), t (ref)
	local var3436 = t_104.new()
	local var3437 = 0
	while var3437 < buffer.len(p204) do
		local _ = nil
		local var3438 = nil
		local var3439, var3440, var3441 = protoModule.readTag(p204, var3437)
		local var3442 = var3439
		var3438 = var3440
		var3437 = var3441
		
		if var3438 == protoModule.wireTypes.varint then
			if var3442 == 1 then
				local _ = nil
				local var3443, var3444 = protoModule.readVarIntI32(p204, var3437)
				local var3445 = var3443
				var3437 = var3444
				var3436.action_type = t.ActionType.fromNumber(var3445) or var3445
			else
				local _ = nil
				local var3446, var3447 = protoModule.readVarInt(p204, var3437)
				local _ = var3446
				var3437 = var3447
			end
		end
		if var3438 == protoModule.wireTypes.lengthDelimited then
			if var3442 == 2 then
				local _ = nil
				local var3448, var3449 = protoModule.readBuffer(p204, var3437)
				var3437 = var3449
				var3436.action_params = t.OpenGameInviteAction_Params.decode(var3448)
			else
				local _ = nil
				local var3450, var3451 = protoModule.readVarInt(p204, var3437)
				var3437 = var3451 + var3450
			end
		elseif var3438 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3452, var3453 = protoModule.readFixed32(p204, var3437)
			local _ = var3452
			var3437 = var3453
		elseif var3438 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3454, var3455 = protoModule.readFixed64(p204, var3437)
			local _ = var3454
			var3437 = var3455
		else
			error("Unsupported wire type: " .. var3438)
		end
	end
	return var3436
end

function t_104:jsonEncode() --[[ line: 20635 ]]
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

function t_104:jsonDecode() --[[ line: 20657 ]]
	-- upvalues: t_104 (ref), t (ref)
	local var3457 = t_104.new()
	
	if self.action_type ~= nil then
		var3457.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3457.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3457.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3457.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.actionParams)
	end
	return var3457
end

t_104.descriptor = {
	name = "OpenGameInviteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameInviteAction"
}
t.OpenGameInviteAction = t_104
typeRegistryModule.default:register(t.OpenGameInviteAction)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p205) --[[ line: 20697 ]]
	-- upvalues: t_105 (ref)
	return setmetatable({
		universe_id = if p205 == nil or p205.universe_id == nil then nil else p205.universe_id,
		root_place_id = if p205 == nil or p205.root_place_id == nil then nil else p205.root_place_id,
		trigger = if p205 == nil or p205.trigger == nil then nil else p205.trigger,
		button_name = if p205 == nil or p205.button_name == nil then nil else p205.button_name
	}, t_105)
end

function t_105:encode() --[[ line: 20708 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3459 = 0
	
	if self.universe_id ~= nil then
		local var3460 = self.universe_id:encode()
		local var3461, var3462 = protoModule.writeTag(buff, var3459, 1, protoModule.wireTypes.lengthDelimited)
		var3461, var3462 = protoModule.writeBuffer(var3461, var3462, var3460, buffer.len(var3460))
		buff = var3461
		var3459 = var3462
	end
	if self.root_place_id ~= nil then
		local var3463 = self.root_place_id:encode()
		local var3464, var3465 = protoModule.writeTag(buff, var3459, 2, protoModule.wireTypes.lengthDelimited)
		var3464, var3465 = protoModule.writeBuffer(var3464, var3465, var3463, buffer.len(var3463))
		buff = var3464
		var3459 = var3465
	end
	if self.trigger ~= nil then
		local var3466 = self.trigger:encode()
		local var3467, var3468 = protoModule.writeTag(buff, var3459, 3, protoModule.wireTypes.lengthDelimited)
		var3467, var3468 = protoModule.writeBuffer(var3467, var3468, var3466, buffer.len(var3466))
		buff = var3467
		var3459 = var3468
	end
	if self.button_name ~= nil then
		local var3469 = self.button_name:encode()
		local var3470, var3471 = protoModule.writeTag(buff, var3459, 4, protoModule.wireTypes.lengthDelimited)
		var3470, var3471 = protoModule.writeBuffer(var3470, var3471, var3469, buffer.len(var3469))
		buff = var3470
		var3459 = var3471
	end
	local buff_1 = buffer.create(var3459)
	buffer.copy(buff_1, 0, buff, 0, var3459)
	
	return buff_1
end

function t_105.decode(p206) --[[ line: 20741 ]]
	-- upvalues: t_105 (ref), protoModule (ref), propTypesModule (ref)
	local var3473 = t_105.new()
	local var3474 = 0
	while var3474 < buffer.len(p206) do
		local _ = nil
		local var3475 = nil
		local var3476, var3477, var3478 = protoModule.readTag(p206, var3474)
		local var3479 = var3476
		var3475 = var3477
		var3474 = var3478
		
		if var3475 == protoModule.wireTypes.varint then
			local _ = nil
			local var3480, var3481 = protoModule.readVarInt(p206, var3474)
			local _ = var3480
			var3474 = var3481
			continue
		end
		if var3475 == protoModule.wireTypes.lengthDelimited then
			if var3479 == 1 then
				local _ = nil
				local var3482, var3483 = protoModule.readBuffer(p206, var3474)
				var3474 = var3483
				var3473.universe_id = propTypesModule.StringProp.decode(var3482)
			elseif var3479 == 2 then
				local _ = nil
				local var3484, var3485 = protoModule.readBuffer(p206, var3474)
				var3474 = var3485
				var3473.root_place_id = propTypesModule.StringProp.decode(var3484)
			elseif var3479 == 3 then
				local _ = nil
				local var3486, var3487 = protoModule.readBuffer(p206, var3474)
				var3474 = var3487
				var3473.trigger = propTypesModule.StringProp.decode(var3486)
			elseif var3479 == 4 then
				local _ = nil
				local var3488, var3489 = protoModule.readBuffer(p206, var3474)
				var3474 = var3489
				var3473.button_name = propTypesModule.StringProp.decode(var3488)
			else
				local _ = nil
				local var3490, var3491 = protoModule.readVarInt(p206, var3474)
				var3474 = var3491 + var3490
			end
		elseif var3475 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3492, var3493 = protoModule.readFixed32(p206, var3474)
			local _ = var3492
			var3474 = var3493
		elseif var3475 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3494, var3495 = protoModule.readFixed64(p206, var3474)
			local _ = var3494
			var3474 = var3495
		else
			error("Unsupported wire type: " .. var3475)
		end
	end
	return var3473
end

function t_105:jsonEncode() --[[ line: 20799 ]]
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

function t_105:jsonDecode() --[[ line: 20821 ]]
	-- upvalues: t_105 (ref), propTypesModule (ref)
	local var3497 = t_105.new()
	
	if self.universe_id ~= nil then
		var3497.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3497.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		var3497.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var3497.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	if self.trigger ~= nil then
		var3497.trigger = propTypesModule.StringProp.jsonDecode(self.trigger)
	end
	if self.button_name ~= nil then
		var3497.button_name = propTypesModule.StringProp.jsonDecode(self.button_name)
	end
	if self.buttonName ~= nil then
		var3497.button_name = propTypesModule.StringProp.jsonDecode(self.buttonName)
	end
	return var3497
end

t_105.descriptor = {
	name = "OpenGameInviteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameInviteAction_Params = t_105
typeRegistryModule.default:register(t.OpenGameInviteAction_Params)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p207) --[[ line: 20873 ]]
	-- upvalues: t (ref), t_106 (ref)
	return setmetatable({
		action_type = if p207 == nil or p207.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p207.action_type,
		action_params = if p207 == nil or p207.action_params == nil then nil else p207.action_params
	}, t_106)
end

function t_106:encode() --[[ line: 20882 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3499 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3500, var3501 = protoModule.writeTag(buff, var3499, 1, protoModule.wireTypes.varint)
		var3500, var3501 = protoModule.writeVarInt(var3500, var3501, t.ActionType.toNumber(self.action_type))
		buff = var3500
		var3499 = var3501
	end
	if self.action_params ~= nil then
		local var3502 = self.action_params:encode()
		local var3503, var3504 = protoModule.writeTag(buff, var3499, 2, protoModule.wireTypes.lengthDelimited)
		var3503, var3504 = protoModule.writeBuffer(var3503, var3504, var3502, buffer.len(var3502))
		buff = var3503
		var3499 = var3504
	end
	local buff_1 = buffer.create(var3499)
	buffer.copy(buff_1, 0, buff, 0, var3499)
	
	return buff_1
end

function t_106.decode(p208) --[[ line: 20908 ]]
	-- upvalues: t_106 (ref), protoModule (ref), t (ref)
	local var3506 = t_106.new()
	local var3507 = 0
	while var3507 < buffer.len(p208) do
		local _ = nil
		local var3508 = nil
		local var3509, var3510, var3511 = protoModule.readTag(p208, var3507)
		local var3512 = var3509
		var3508 = var3510
		var3507 = var3511
		
		if var3508 == protoModule.wireTypes.varint then
			if var3512 == 1 then
				local _ = nil
				local var3513, var3514 = protoModule.readVarIntI32(p208, var3507)
				local var3515 = var3513
				var3507 = var3514
				var3506.action_type = t.ActionType.fromNumber(var3515) or var3515
			else
				local _ = nil
				local var3516, var3517 = protoModule.readVarInt(p208, var3507)
				local _ = var3516
				var3507 = var3517
			end
		end
		if var3508 == protoModule.wireTypes.lengthDelimited then
			if var3512 == 2 then
				local _ = nil
				local var3518, var3519 = protoModule.readBuffer(p208, var3507)
				var3507 = var3519
				var3506.action_params = t.LaunchExperienceAction_Params.decode(var3518)
			else
				local _ = nil
				local var3520, var3521 = protoModule.readVarInt(p208, var3507)
				var3507 = var3521 + var3520
			end
		elseif var3508 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3522, var3523 = protoModule.readFixed32(p208, var3507)
			local _ = var3522
			var3507 = var3523
		elseif var3508 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3524, var3525 = protoModule.readFixed64(p208, var3507)
			local _ = var3524
			var3507 = var3525
		else
			error("Unsupported wire type: " .. var3508)
		end
	end
	return var3506
end

function t_106:jsonEncode() --[[ line: 20956 ]]
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

function t_106:jsonDecode() --[[ line: 20978 ]]
	-- upvalues: t_106 (ref), t (ref)
	local var3527 = t_106.new()
	
	if self.action_type ~= nil then
		var3527.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3527.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3527.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3527.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.actionParams)
	end
	return var3527
end

t_106.descriptor = {
	name = "LaunchExperienceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LaunchExperienceAction"
}
t.LaunchExperienceAction = t_106
typeRegistryModule.default:register(t.LaunchExperienceAction)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p209) --[[ line: 21018 ]]
	-- upvalues: t_107 (ref)
	return setmetatable({
		kind = if p209 == nil or p209.kind == nil then nil else p209.kind
	}, t_107)
end

function t_107:encode() --[[ line: 21026 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3529 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3530 = self.kind.value:encode()
			local var3531, var3532 = protoModule.writeTag(buff, var3529, 1, protoModule.wireTypes.lengthDelimited)
			var3531, var3532 = protoModule.writeBuffer(var3531, var3532, var3530, buffer.len(var3530))
			buff = var3531
			var3529 = var3532
		elseif self.kind.type == "binding_path" then
			local var3533, var3534 = protoModule.writeTag(buff, var3529, 2, protoModule.wireTypes.lengthDelimited)
			var3533, var3534 = protoModule.writeString(var3533, var3534, self.kind.value)
			buff = var3533
			var3529 = var3534
		end
	end
	local buff_1 = buffer.create(var3529)
	buffer.copy(buff_1, 0, buff, 0, var3529)
	
	return buff_1
end

function t_107.decode(p210) --[[ line: 21048 ]]
	-- upvalues: t_107 (ref), protoModule (ref), t (ref)
	local var3536 = t_107.new()
	local var3537 = 0
	while var3537 < buffer.len(p210) do
		local _ = nil
		local var3538 = nil
		local var3539, var3540, var3541 = protoModule.readTag(p210, var3537)
		local var3542 = var3539
		var3538 = var3540
		var3537 = var3541
		
		if var3538 == protoModule.wireTypes.varint then
			local _ = nil
			local var3543, var3544 = protoModule.readVarInt(p210, var3537)
			local _ = var3543
			var3537 = var3544
			continue
		end
		if var3538 == protoModule.wireTypes.lengthDelimited then
			if var3542 == 1 then
				local _ = nil
				local var3545, var3546 = protoModule.readBuffer(p210, var3537)
				var3537 = var3546
				var3536.kind = {
					type = "literal",
					value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.decode(var3545)
				}
			elseif var3542 == 2 then
				local _ = nil
				local var3547, var3548 = protoModule.readBuffer(p210, var3537)
				var3537 = var3548
				var3536.kind = { type = "binding_path", value = buffer.tostring(var3547) }
			else
				local _ = nil
				local var3549, var3550 = protoModule.readVarInt(p210, var3537)
				var3537 = var3550 + var3549
			end
		elseif var3538 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3551, var3552 = protoModule.readFixed32(p210, var3537)
			local _ = var3551
			var3537 = var3552
		elseif var3538 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3553, var3554 = protoModule.readFixed64(p210, var3537)
			local _ = var3553
			var3537 = var3554
		else
			error("Unsupported wire type: " .. var3538)
		end
	end
	return var3536
end

function t_107:jsonEncode() --[[ line: 21103 ]]
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

function t_107:jsonDecode() --[[ line: 21119 ]]
	-- upvalues: t_107 (ref), t (ref)
	local var3556 = t_107.new()
	
	if self.literal ~= nil then
		var3556.kind = {
			type = "literal",
			value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3556.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3556.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3556
end

t_107.descriptor = {
	name = "LaunchExperienceAction_ExperienceJoinData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceJoinData"
}
t.LaunchExperienceAction_ExperienceJoinData = t_107
typeRegistryModule.default:register(t.LaunchExperienceAction_ExperienceJoinData)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p211) --[[ line: 21159 ]]
	-- upvalues: t_108 (ref)
	return setmetatable({
		launch_data = if p211 == nil or p211.launch_data == nil then nil else p211.launch_data,
		event_id = if p211 == nil or p211.event_id == nil then nil else p211.event_id
	}, t_108)
end

function t_108:encode() --[[ line: 21171 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3558 = 0
	
	if self.launch_data ~= nil then
		local var3559 = self.launch_data:encode()
		local var3560, var3561 = protoModule.writeTag(buff, var3558, 1, protoModule.wireTypes.lengthDelimited)
		var3560, var3561 = protoModule.writeBuffer(var3560, var3561, var3559, buffer.len(var3559))
		buff = var3560
		var3558 = var3561
	end
	if self.event_id ~= nil then
		local var3562 = self.event_id:encode()
		local var3563, var3564 = protoModule.writeTag(buff, var3558, 2, protoModule.wireTypes.lengthDelimited)
		var3563, var3564 = protoModule.writeBuffer(var3563, var3564, var3562, buffer.len(var3562))
		buff = var3563
		var3558 = var3564
	end
	local buff_1 = buffer.create(var3558)
	buffer.copy(buff_1, 0, buff, 0, var3558)
	
	return buff_1
end

function t_108.decode(p212) --[[ line: 21194 ]]
	-- upvalues: t_108 (ref), protoModule (ref), propTypesModule (ref)
	local var3566 = t_108.new()
	local var3567 = 0
	while var3567 < buffer.len(p212) do
		local _ = nil
		local var3568 = nil
		local var3569, var3570, var3571 = protoModule.readTag(p212, var3567)
		local var3572 = var3569
		var3568 = var3570
		var3567 = var3571
		
		if var3568 == protoModule.wireTypes.varint then
			local _ = nil
			local var3573, var3574 = protoModule.readVarInt(p212, var3567)
			local _ = var3573
			var3567 = var3574
			continue
		end
		if var3568 == protoModule.wireTypes.lengthDelimited then
			if var3572 == 1 then
				local _ = nil
				local var3575, var3576 = protoModule.readBuffer(p212, var3567)
				var3567 = var3576
				var3566.launch_data = propTypesModule.StringProp.decode(var3575)
			elseif var3572 == 2 then
				local _ = nil
				local var3577, var3578 = protoModule.readBuffer(p212, var3567)
				var3567 = var3578
				var3566.event_id = propTypesModule.StringProp.decode(var3577)
			else
				local _ = nil
				local var3579, var3580 = protoModule.readVarInt(p212, var3567)
				var3567 = var3580 + var3579
			end
		elseif var3568 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3581, var3582 = protoModule.readFixed32(p212, var3567)
			local _ = var3581
			var3567 = var3582
		elseif var3568 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3583, var3584 = protoModule.readFixed64(p212, var3567)
			local _ = var3583
			var3567 = var3584
		else
			error("Unsupported wire type: " .. var3568)
		end
	end
	return var3566
end

function t_108:jsonEncode() --[[ line: 21244 ]]
	local t = {}
	
	if self.launch_data ~= nil then
		t.launchData = self.launch_data:jsonEncode()
	end
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_108:jsonDecode() --[[ line: 21260 ]]
	-- upvalues: t_108 (ref), propTypesModule (ref)
	local var3586 = t_108.new()
	
	if self.launch_data ~= nil then
		var3586.launch_data = propTypesModule.StringProp.jsonDecode(self.launch_data)
	end
	if self.launchData ~= nil then
		var3586.launch_data = propTypesModule.StringProp.jsonDecode(self.launchData)
	end
	if self.event_id ~= nil then
		var3586.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var3586.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var3586
end

t_108.descriptor = {
	name = "LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceJoinDataLiteral"
}
t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral = t_108
typeRegistryModule.default:register(t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p213) --[[ line: 21300 ]]
	-- upvalues: t_109 (ref)
	return setmetatable({
		place_id = if p213 == nil or p213.place_id == nil then nil else p213.place_id,
		universe_id = if p213 == nil or p213.universe_id == nil then nil else p213.universe_id,
		launch_source = if p213 == nil or p213.launch_source == nil then nil else p213.launch_source,
		experience_join_data = if p213 == nil or p213.experience_join_data == nil then nil else p213.experience_join_data
	}, t_109)
end

function t_109:encode() --[[ line: 21313 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3588 = 0
	
	if self.place_id ~= nil then
		local var3589 = self.place_id:encode()
		local var3590, var3591 = protoModule.writeTag(buff, var3588, 1, protoModule.wireTypes.lengthDelimited)
		var3590, var3591 = protoModule.writeBuffer(var3590, var3591, var3589, buffer.len(var3589))
		buff = var3590
		var3588 = var3591
	end
	if self.universe_id ~= nil then
		local var3592 = self.universe_id:encode()
		local var3593, var3594 = protoModule.writeTag(buff, var3588, 2, protoModule.wireTypes.lengthDelimited)
		var3593, var3594 = protoModule.writeBuffer(var3593, var3594, var3592, buffer.len(var3592))
		buff = var3593
		var3588 = var3594
	end
	if self.launch_source ~= nil then
		local var3595 = self.launch_source:encode()
		local var3596, var3597 = protoModule.writeTag(buff, var3588, 3, protoModule.wireTypes.lengthDelimited)
		var3596, var3597 = protoModule.writeBuffer(var3596, var3597, var3595, buffer.len(var3595))
		buff = var3596
		var3588 = var3597
	end
	if self.experience_join_data ~= nil then
		local var3598 = self.experience_join_data:encode()
		local var3599, var3600 = protoModule.writeTag(buff, var3588, 4, protoModule.wireTypes.lengthDelimited)
		var3599, var3600 = protoModule.writeBuffer(var3599, var3600, var3598, buffer.len(var3598))
		buff = var3599
		var3588 = var3600
	end
	local buff_1 = buffer.create(var3588)
	buffer.copy(buff_1, 0, buff, 0, var3588)
	
	return buff_1
end

function t_109.decode(p214) --[[ line: 21346 ]]
	-- upvalues: t_109 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var3602 = t_109.new()
	local var3603 = 0
	while var3603 < buffer.len(p214) do
		local _ = nil
		local var3604 = nil
		local var3605, var3606, var3607 = protoModule.readTag(p214, var3603)
		local var3608 = var3605
		var3604 = var3606
		var3603 = var3607
		
		if var3604 == protoModule.wireTypes.varint then
			local _ = nil
			local var3609, var3610 = protoModule.readVarInt(p214, var3603)
			local _ = var3609
			var3603 = var3610
			continue
		end
		if var3604 == protoModule.wireTypes.lengthDelimited then
			if var3608 == 1 then
				local _ = nil
				local var3611, var3612 = protoModule.readBuffer(p214, var3603)
				var3603 = var3612
				var3602.place_id = propTypesModule.StringProp.decode(var3611)
			elseif var3608 == 2 then
				local _ = nil
				local var3613, var3614 = protoModule.readBuffer(p214, var3603)
				var3603 = var3614
				var3602.universe_id = propTypesModule.StringProp.decode(var3613)
			elseif var3608 == 3 then
				local _ = nil
				local var3615, var3616 = protoModule.readBuffer(p214, var3603)
				var3603 = var3616
				var3602.launch_source = propTypesModule.StringProp.decode(var3615)
			elseif var3608 == 4 then
				local _ = nil
				local var3617, var3618 = protoModule.readBuffer(p214, var3603)
				var3603 = var3618
				var3602.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.decode(var3617)
			else
				local _ = nil
				local var3619, var3620 = protoModule.readVarInt(p214, var3603)
				var3603 = var3620 + var3619
			end
		elseif var3604 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3621, var3622 = protoModule.readFixed32(p214, var3603)
			local _ = var3621
			var3603 = var3622
		elseif var3604 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3623, var3624 = protoModule.readFixed64(p214, var3603)
			local _ = var3623
			var3603 = var3624
		else
			error("Unsupported wire type: " .. var3604)
		end
	end
	return var3602
end

function t_109:jsonEncode() --[[ line: 21404 ]]
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

function t_109:jsonDecode() --[[ line: 21426 ]]
	-- upvalues: t_109 (ref), propTypesModule (ref), t (ref)
	local var3626 = t_109.new()
	
	if self.place_id ~= nil then
		var3626.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var3626.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var3626.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3626.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.launch_source ~= nil then
		var3626.launch_source = propTypesModule.StringProp.jsonDecode(self.launch_source)
	end
	if self.launchSource ~= nil then
		var3626.launch_source = propTypesModule.StringProp.jsonDecode(self.launchSource)
	end
	if self.experience_join_data ~= nil then
		var3626.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experience_join_data)
	end
	if self.experienceJoinData ~= nil then
		var3626.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experienceJoinData)
	end
	return var3626
end

t_109.descriptor = {
	name = "LaunchExperienceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LaunchExperienceAction_Params = t_109
typeRegistryModule.default:register(t.LaunchExperienceAction_Params)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p215) --[[ line: 21483 ]]
	-- upvalues: t (ref), t_110 (ref)
	return setmetatable({
		action_type = if p215 == nil or p215.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p215.action_type,
		action_params = if p215 == nil or p215.action_params == nil then nil else p215.action_params
	}, t_110)
end

function t_110:encode() --[[ line: 21494 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3628 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3629, var3630 = protoModule.writeTag(buff, var3628, 1, protoModule.wireTypes.varint)
		var3629, var3630 = protoModule.writeVarInt(var3629, var3630, t.ActionType.toNumber(self.action_type))
		buff = var3629
		var3628 = var3630
	end
	if self.action_params ~= nil then
		local var3631 = self.action_params:encode()
		local var3632, var3633 = protoModule.writeTag(buff, var3628, 2, protoModule.wireTypes.lengthDelimited)
		var3632, var3633 = protoModule.writeBuffer(var3632, var3633, var3631, buffer.len(var3631))
		buff = var3632
		var3628 = var3633
	end
	local buff_1 = buffer.create(var3628)
	buffer.copy(buff_1, 0, buff, 0, var3628)
	
	return buff_1
end

function t_110.decode(p216) --[[ line: 21520 ]]
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var3635 = t_110.new()
	local var3636 = 0
	while var3636 < buffer.len(p216) do
		local _ = nil
		local var3637 = nil
		local var3638, var3639, var3640 = protoModule.readTag(p216, var3636)
		local var3641 = var3638
		var3637 = var3639
		var3636 = var3640
		
		if var3637 == protoModule.wireTypes.varint then
			if var3641 == 1 then
				local _ = nil
				local var3642, var3643 = protoModule.readVarIntI32(p216, var3636)
				local var3644 = var3642
				var3636 = var3643
				var3635.action_type = t.ActionType.fromNumber(var3644) or var3644
			else
				local _ = nil
				local var3645, var3646 = protoModule.readVarInt(p216, var3636)
				local _ = var3645
				var3636 = var3646
			end
		end
		if var3637 == protoModule.wireTypes.lengthDelimited then
			if var3641 == 2 then
				local _ = nil
				local var3647, var3648 = protoModule.readBuffer(p216, var3636)
				var3636 = var3648
				var3635.action_params = t.ToggleExperienceFavoriteAction_Params.decode(var3647)
			else
				local _ = nil
				local var3649, var3650 = protoModule.readVarInt(p216, var3636)
				var3636 = var3650 + var3649
			end
		elseif var3637 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3651, var3652 = protoModule.readFixed32(p216, var3636)
			local _ = var3651
			var3636 = var3652
		elseif var3637 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3653, var3654 = protoModule.readFixed64(p216, var3636)
			local _ = var3653
			var3636 = var3654
		else
			error("Unsupported wire type: " .. var3637)
		end
	end
	return var3635
end

function t_110:jsonEncode() --[[ line: 21568 ]]
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

function t_110:jsonDecode() --[[ line: 21590 ]]
	-- upvalues: t_110 (ref), t (ref)
	local var3656 = t_110.new()
	
	if self.action_type ~= nil then
		var3656.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3656.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3656.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3656.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.actionParams)
	end
	return var3656
end

t_110.descriptor = {
	name = "ToggleExperienceFavoriteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceFavoriteAction"
}
t.ToggleExperienceFavoriteAction = t_110
typeRegistryModule.default:register(t.ToggleExperienceFavoriteAction)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p217) --[[ line: 21630 ]]
	-- upvalues: t_111 (ref)
	return setmetatable({
		universe_id = if p217 == nil or p217.universe_id == nil then nil else p217.universe_id,
		place_id = if p217 == nil or p217.place_id == nil then nil else p217.place_id,
		ctx = if p217 == nil or p217.ctx == nil then nil else p217.ctx
	}, t_111)
end

function t_111:encode() --[[ line: 21640 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3658 = 0
	
	if self.universe_id ~= nil then
		local var3659 = self.universe_id:encode()
		local var3660, var3661 = protoModule.writeTag(buff, var3658, 1, protoModule.wireTypes.lengthDelimited)
		var3660, var3661 = protoModule.writeBuffer(var3660, var3661, var3659, buffer.len(var3659))
		buff = var3660
		var3658 = var3661
	end
	if self.place_id ~= nil then
		local var3662 = self.place_id:encode()
		local var3663, var3664 = protoModule.writeTag(buff, var3658, 2, protoModule.wireTypes.lengthDelimited)
		var3663, var3664 = protoModule.writeBuffer(var3663, var3664, var3662, buffer.len(var3662))
		buff = var3663
		var3658 = var3664
	end
	if self.ctx ~= nil then
		local var3665 = self.ctx:encode()
		local var3666, var3667 = protoModule.writeTag(buff, var3658, 3, protoModule.wireTypes.lengthDelimited)
		var3666, var3667 = protoModule.writeBuffer(var3666, var3667, var3665, buffer.len(var3665))
		buff = var3666
		var3658 = var3667
	end
	local buff_1 = buffer.create(var3658)
	buffer.copy(buff_1, 0, buff, 0, var3658)
	
	return buff_1
end

function t_111.decode(p218) --[[ line: 21667 ]]
	-- upvalues: t_111 (ref), protoModule (ref), propTypesModule (ref)
	local var3669 = t_111.new()
	local var3670 = 0
	while var3670 < buffer.len(p218) do
		local _ = nil
		local var3671 = nil
		local var3672, var3673, var3674 = protoModule.readTag(p218, var3670)
		local var3675 = var3672
		var3671 = var3673
		var3670 = var3674
		
		if var3671 == protoModule.wireTypes.varint then
			local _ = nil
			local var3676, var3677 = protoModule.readVarInt(p218, var3670)
			local _ = var3676
			var3670 = var3677
			continue
		end
		if var3671 == protoModule.wireTypes.lengthDelimited then
			if var3675 == 1 then
				local _ = nil
				local var3678, var3679 = protoModule.readBuffer(p218, var3670)
				var3670 = var3679
				var3669.universe_id = propTypesModule.StringProp.decode(var3678)
			elseif var3675 == 2 then
				local _ = nil
				local var3680, var3681 = protoModule.readBuffer(p218, var3670)
				var3670 = var3681
				var3669.place_id = propTypesModule.StringProp.decode(var3680)
			elseif var3675 == 3 then
				local _ = nil
				local var3682, var3683 = protoModule.readBuffer(p218, var3670)
				var3670 = var3683
				var3669.ctx = propTypesModule.StringProp.decode(var3682)
			else
				local _ = nil
				local var3684, var3685 = protoModule.readVarInt(p218, var3670)
				var3670 = var3685 + var3684
			end
		elseif var3671 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3686, var3687 = protoModule.readFixed32(p218, var3670)
			local _ = var3686
			var3670 = var3687
		elseif var3671 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3688, var3689 = protoModule.readFixed64(p218, var3670)
			local _ = var3688
			var3670 = var3689
		else
			error("Unsupported wire type: " .. var3671)
		end
	end
	return var3669
end

function t_111:jsonEncode() --[[ line: 21720 ]]
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

function t_111:jsonDecode() --[[ line: 21738 ]]
	-- upvalues: t_111 (ref), propTypesModule (ref)
	local var3691 = t_111.new()
	
	if self.universe_id ~= nil then
		var3691.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3691.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var3691.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var3691.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		var3691.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var3691
end

t_111.descriptor = {
	name = "ToggleExperienceFavoriteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceFavoriteAction_Params = t_111
typeRegistryModule.default:register(t.ToggleExperienceFavoriteAction_Params)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p219) --[[ line: 21781 ]]
	-- upvalues: t (ref), t_112 (ref)
	return setmetatable({
		action_type = if p219 == nil or p219.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p219.action_type,
		action_params = if p219 == nil or p219.action_params == nil then nil else p219.action_params
	}, t_112)
end

function t_112:encode() --[[ line: 21792 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3693 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3694, var3695 = protoModule.writeTag(buff, var3693, 1, protoModule.wireTypes.varint)
		var3694, var3695 = protoModule.writeVarInt(var3694, var3695, t.ActionType.toNumber(self.action_type))
		buff = var3694
		var3693 = var3695
	end
	if self.action_params ~= nil then
		local var3696 = self.action_params:encode()
		local var3697, var3698 = protoModule.writeTag(buff, var3693, 2, protoModule.wireTypes.lengthDelimited)
		var3697, var3698 = protoModule.writeBuffer(var3697, var3698, var3696, buffer.len(var3696))
		buff = var3697
		var3693 = var3698
	end
	local buff_1 = buffer.create(var3693)
	buffer.copy(buff_1, 0, buff, 0, var3693)
	
	return buff_1
end

function t_112.decode(p220) --[[ line: 21818 ]]
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var3700 = t_112.new()
	local var3701 = 0
	while var3701 < buffer.len(p220) do
		local _ = nil
		local var3702 = nil
		local var3703, var3704, var3705 = protoModule.readTag(p220, var3701)
		local var3706 = var3703
		var3702 = var3704
		var3701 = var3705
		
		if var3702 == protoModule.wireTypes.varint then
			if var3706 == 1 then
				local _ = nil
				local var3707, var3708 = protoModule.readVarIntI32(p220, var3701)
				local var3709 = var3707
				var3701 = var3708
				var3700.action_type = t.ActionType.fromNumber(var3709) or var3709
			else
				local _ = nil
				local var3710, var3711 = protoModule.readVarInt(p220, var3701)
				local _ = var3710
				var3701 = var3711
			end
		end
		if var3702 == protoModule.wireTypes.lengthDelimited then
			if var3706 == 2 then
				local _ = nil
				local var3712, var3713 = protoModule.readBuffer(p220, var3701)
				var3701 = var3713
				var3700.action_params = t.ToggleExperienceFollowAction_Params.decode(var3712)
			else
				local _ = nil
				local var3714, var3715 = protoModule.readVarInt(p220, var3701)
				var3701 = var3715 + var3714
			end
		elseif var3702 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3716, var3717 = protoModule.readFixed32(p220, var3701)
			local _ = var3716
			var3701 = var3717
		elseif var3702 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3718, var3719 = protoModule.readFixed64(p220, var3701)
			local _ = var3718
			var3701 = var3719
		else
			error("Unsupported wire type: " .. var3702)
		end
	end
	return var3700
end

function t_112:jsonEncode() --[[ line: 21866 ]]
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

function t_112:jsonDecode() --[[ line: 21888 ]]
	-- upvalues: t_112 (ref), t (ref)
	local var3721 = t_112.new()
	
	if self.action_type ~= nil then
		var3721.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3721.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3721.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3721.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.actionParams)
	end
	return var3721
end

t_112.descriptor = {
	name = "ToggleExperienceFollowAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceFollowAction"
}
t.ToggleExperienceFollowAction = t_112
typeRegistryModule.default:register(t.ToggleExperienceFollowAction)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p221) --[[ line: 21928 ]]
	-- upvalues: t_113 (ref)
	return setmetatable({
		universe_id = if p221 == nil or p221.universe_id == nil then nil else p221.universe_id,
		game_name = if p221 == nil or p221.game_name == nil then nil else p221.game_name,
		ctx = if p221 == nil or p221.ctx == nil then nil else p221.ctx
	}, t_113)
end

function t_113:encode() --[[ line: 21938 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3723 = 0
	
	if self.universe_id ~= nil then
		local var3724 = self.universe_id:encode()
		local var3725, var3726 = protoModule.writeTag(buff, var3723, 1, protoModule.wireTypes.lengthDelimited)
		var3725, var3726 = protoModule.writeBuffer(var3725, var3726, var3724, buffer.len(var3724))
		buff = var3725
		var3723 = var3726
	end
	if self.game_name ~= nil then
		local var3727 = self.game_name:encode()
		local var3728, var3729 = protoModule.writeTag(buff, var3723, 2, protoModule.wireTypes.lengthDelimited)
		var3728, var3729 = protoModule.writeBuffer(var3728, var3729, var3727, buffer.len(var3727))
		buff = var3728
		var3723 = var3729
	end
	if self.ctx ~= nil then
		local var3730 = self.ctx:encode()
		local var3731, var3732 = protoModule.writeTag(buff, var3723, 3, protoModule.wireTypes.lengthDelimited)
		var3731, var3732 = protoModule.writeBuffer(var3731, var3732, var3730, buffer.len(var3730))
		buff = var3731
		var3723 = var3732
	end
	local buff_1 = buffer.create(var3723)
	buffer.copy(buff_1, 0, buff, 0, var3723)
	
	return buff_1
end

function t_113.decode(p222) --[[ line: 21965 ]]
	-- upvalues: t_113 (ref), protoModule (ref), propTypesModule (ref)
	local var3734 = t_113.new()
	local var3735 = 0
	while var3735 < buffer.len(p222) do
		local _ = nil
		local var3736 = nil
		local var3737, var3738, var3739 = protoModule.readTag(p222, var3735)
		local var3740 = var3737
		var3736 = var3738
		var3735 = var3739
		
		if var3736 == protoModule.wireTypes.varint then
			local _ = nil
			local var3741, var3742 = protoModule.readVarInt(p222, var3735)
			local _ = var3741
			var3735 = var3742
			continue
		end
		if var3736 == protoModule.wireTypes.lengthDelimited then
			if var3740 == 1 then
				local _ = nil
				local var3743, var3744 = protoModule.readBuffer(p222, var3735)
				var3735 = var3744
				var3734.universe_id = propTypesModule.StringProp.decode(var3743)
			elseif var3740 == 2 then
				local _ = nil
				local var3745, var3746 = protoModule.readBuffer(p222, var3735)
				var3735 = var3746
				var3734.game_name = propTypesModule.StringProp.decode(var3745)
			elseif var3740 == 3 then
				local _ = nil
				local var3747, var3748 = protoModule.readBuffer(p222, var3735)
				var3735 = var3748
				var3734.ctx = propTypesModule.StringProp.decode(var3747)
			else
				local _ = nil
				local var3749, var3750 = protoModule.readVarInt(p222, var3735)
				var3735 = var3750 + var3749
			end
		elseif var3736 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3751, var3752 = protoModule.readFixed32(p222, var3735)
			local _ = var3751
			var3735 = var3752
		elseif var3736 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3753, var3754 = protoModule.readFixed64(p222, var3735)
			local _ = var3753
			var3735 = var3754
		else
			error("Unsupported wire type: " .. var3736)
		end
	end
	return var3734
end

function t_113:jsonEncode() --[[ line: 22018 ]]
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

function t_113:jsonDecode() --[[ line: 22036 ]]
	-- upvalues: t_113 (ref), propTypesModule (ref)
	local var3756 = t_113.new()
	
	if self.universe_id ~= nil then
		var3756.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3756.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.game_name ~= nil then
		var3756.game_name = propTypesModule.StringProp.jsonDecode(self.game_name)
	end
	if self.gameName ~= nil then
		var3756.game_name = propTypesModule.StringProp.jsonDecode(self.gameName)
	end
	if self.ctx ~= nil then
		var3756.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var3756
end

t_113.descriptor = {
	name = "ToggleExperienceFollowAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceFollowAction_Params = t_113
typeRegistryModule.default:register(t.ToggleExperienceFollowAction_Params)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p223) --[[ line: 22079 ]]
	-- upvalues: t (ref), t_114 (ref)
	return setmetatable({
		action_type = if p223 == nil or p223.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p223.action_type,
		action_params = if p223 == nil or p223.action_params == nil then nil else p223.action_params
	}, t_114)
end

function t_114:encode() --[[ line: 22090 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3758 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3759, var3760 = protoModule.writeTag(buff, var3758, 1, protoModule.wireTypes.varint)
		var3759, var3760 = protoModule.writeVarInt(var3759, var3760, t.ActionType.toNumber(self.action_type))
		buff = var3759
		var3758 = var3760
	end
	if self.action_params ~= nil then
		local var3761 = self.action_params:encode()
		local var3762, var3763 = protoModule.writeTag(buff, var3758, 2, protoModule.wireTypes.lengthDelimited)
		var3762, var3763 = protoModule.writeBuffer(var3762, var3763, var3761, buffer.len(var3761))
		buff = var3762
		var3758 = var3763
	end
	local buff_1 = buffer.create(var3758)
	buffer.copy(buff_1, 0, buff, 0, var3758)
	
	return buff_1
end

function t_114.decode(p224) --[[ line: 22116 ]]
	-- upvalues: t_114 (ref), protoModule (ref), t (ref)
	local var3765 = t_114.new()
	local var3766 = 0
	while var3766 < buffer.len(p224) do
		local _ = nil
		local var3767 = nil
		local var3768, var3769, var3770 = protoModule.readTag(p224, var3766)
		local var3771 = var3768
		var3767 = var3769
		var3766 = var3770
		
		if var3767 == protoModule.wireTypes.varint then
			if var3771 == 1 then
				local _ = nil
				local var3772, var3773 = protoModule.readVarIntI32(p224, var3766)
				local var3774 = var3772
				var3766 = var3773
				var3765.action_type = t.ActionType.fromNumber(var3774) or var3774
			else
				local _ = nil
				local var3775, var3776 = protoModule.readVarInt(p224, var3766)
				local _ = var3775
				var3766 = var3776
			end
		end
		if var3767 == protoModule.wireTypes.lengthDelimited then
			if var3771 == 2 then
				local _ = nil
				local var3777, var3778 = protoModule.readBuffer(p224, var3766)
				var3766 = var3778
				var3765.action_params = t.ToggleExperienceVoteAction_Params.decode(var3777)
			else
				local _ = nil
				local var3779, var3780 = protoModule.readVarInt(p224, var3766)
				var3766 = var3780 + var3779
			end
		elseif var3767 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3781, var3782 = protoModule.readFixed32(p224, var3766)
			local _ = var3781
			var3766 = var3782
		elseif var3767 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3783, var3784 = protoModule.readFixed64(p224, var3766)
			local _ = var3783
			var3766 = var3784
		else
			error("Unsupported wire type: " .. var3767)
		end
	end
	return var3765
end

function t_114:jsonEncode() --[[ line: 22164 ]]
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

function t_114:jsonDecode() --[[ line: 22186 ]]
	-- upvalues: t_114 (ref), t (ref)
	local var3786 = t_114.new()
	
	if self.action_type ~= nil then
		var3786.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3786.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3786.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3786.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.actionParams)
	end
	return var3786
end

t_114.descriptor = {
	name = "ToggleExperienceVoteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceVoteAction"
}
t.ToggleExperienceVoteAction = t_114
typeRegistryModule.default:register(t.ToggleExperienceVoteAction)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p225) --[[ line: 22226 ]]
	-- upvalues: t_115 (ref)
	return setmetatable({
		universe_id = if p225 == nil or p225.universe_id == nil then nil else p225.universe_id,
		vote_direction = if p225 == nil or p225.vote_direction == nil then nil else p225.vote_direction,
		place_id = if p225 == nil or p225.place_id == nil then nil else p225.place_id,
		ctx = if p225 == nil or p225.ctx == nil then nil else p225.ctx
	}, t_115)
end

function t_115:encode() --[[ line: 22237 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3788 = 0
	
	if self.universe_id ~= nil then
		local var3789 = self.universe_id:encode()
		local var3790, var3791 = protoModule.writeTag(buff, var3788, 1, protoModule.wireTypes.lengthDelimited)
		var3790, var3791 = protoModule.writeBuffer(var3790, var3791, var3789, buffer.len(var3789))
		buff = var3790
		var3788 = var3791
	end
	if self.vote_direction ~= nil then
		local var3792 = self.vote_direction:encode()
		local var3793, var3794 = protoModule.writeTag(buff, var3788, 2, protoModule.wireTypes.lengthDelimited)
		var3793, var3794 = protoModule.writeBuffer(var3793, var3794, var3792, buffer.len(var3792))
		buff = var3793
		var3788 = var3794
	end
	if self.place_id ~= nil then
		local var3795 = self.place_id:encode()
		local var3796, var3797 = protoModule.writeTag(buff, var3788, 3, protoModule.wireTypes.lengthDelimited)
		var3796, var3797 = protoModule.writeBuffer(var3796, var3797, var3795, buffer.len(var3795))
		buff = var3796
		var3788 = var3797
	end
	if self.ctx ~= nil then
		local var3798 = self.ctx:encode()
		local var3799, var3800 = protoModule.writeTag(buff, var3788, 4, protoModule.wireTypes.lengthDelimited)
		var3799, var3800 = protoModule.writeBuffer(var3799, var3800, var3798, buffer.len(var3798))
		buff = var3799
		var3788 = var3800
	end
	local buff_1 = buffer.create(var3788)
	buffer.copy(buff_1, 0, buff, 0, var3788)
	
	return buff_1
end

function t_115.decode(p226) --[[ line: 22270 ]]
	-- upvalues: t_115 (ref), protoModule (ref), propTypesModule (ref)
	local var3802 = t_115.new()
	local var3803 = 0
	while var3803 < buffer.len(p226) do
		local _ = nil
		local var3804 = nil
		local var3805, var3806, var3807 = protoModule.readTag(p226, var3803)
		local var3808 = var3805
		var3804 = var3806
		var3803 = var3807
		
		if var3804 == protoModule.wireTypes.varint then
			local _ = nil
			local var3809, var3810 = protoModule.readVarInt(p226, var3803)
			local _ = var3809
			var3803 = var3810
			continue
		end
		if var3804 == protoModule.wireTypes.lengthDelimited then
			if var3808 == 1 then
				local _ = nil
				local var3811, var3812 = protoModule.readBuffer(p226, var3803)
				var3803 = var3812
				var3802.universe_id = propTypesModule.StringProp.decode(var3811)
			elseif var3808 == 2 then
				local _ = nil
				local var3813, var3814 = protoModule.readBuffer(p226, var3803)
				var3803 = var3814
				var3802.vote_direction = propTypesModule.BoolProp.decode(var3813)
			elseif var3808 == 3 then
				local _ = nil
				local var3815, var3816 = protoModule.readBuffer(p226, var3803)
				var3803 = var3816
				var3802.place_id = propTypesModule.StringProp.decode(var3815)
			elseif var3808 == 4 then
				local _ = nil
				local var3817, var3818 = protoModule.readBuffer(p226, var3803)
				var3803 = var3818
				var3802.ctx = propTypesModule.StringProp.decode(var3817)
			else
				local _ = nil
				local var3819, var3820 = protoModule.readVarInt(p226, var3803)
				var3803 = var3820 + var3819
			end
		elseif var3804 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3821, var3822 = protoModule.readFixed32(p226, var3803)
			local _ = var3821
			var3803 = var3822
		elseif var3804 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3823, var3824 = protoModule.readFixed64(p226, var3803)
			local _ = var3823
			var3803 = var3824
		else
			error("Unsupported wire type: " .. var3804)
		end
	end
	return var3802
end

function t_115:jsonEncode() --[[ line: 22328 ]]
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

function t_115:jsonDecode() --[[ line: 22350 ]]
	-- upvalues: t_115 (ref), propTypesModule (ref)
	local var3826 = t_115.new()
	
	if self.universe_id ~= nil then
		var3826.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3826.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.vote_direction ~= nil then
		var3826.vote_direction = propTypesModule.BoolProp.jsonDecode(self.vote_direction)
	end
	if self.voteDirection ~= nil then
		var3826.vote_direction = propTypesModule.BoolProp.jsonDecode(self.voteDirection)
	end
	if self.place_id ~= nil then
		var3826.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var3826.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		var3826.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var3826
end

t_115.descriptor = {
	name = "ToggleExperienceVoteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceVoteAction_Params = t_115
typeRegistryModule.default:register(t.ToggleExperienceVoteAction_Params)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p227) --[[ line: 22403 ]]
	-- upvalues: t (ref), t_116 (ref)
	return setmetatable({
		action_type = if p227 == nil or p227.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p227.action_type,
		action_params = if p227 == nil or p227.action_params == nil then nil else p227.action_params
	}, t_116)
end

function t_116:encode() --[[ line: 22412 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3828 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3829, var3830 = protoModule.writeTag(buff, var3828, 1, protoModule.wireTypes.varint)
		var3829, var3830 = protoModule.writeVarInt(var3829, var3830, t.ActionType.toNumber(self.action_type))
		buff = var3829
		var3828 = var3830
	end
	if self.action_params ~= nil then
		local var3831 = self.action_params:encode()
		local var3832, var3833 = protoModule.writeTag(buff, var3828, 2, protoModule.wireTypes.lengthDelimited)
		var3832, var3833 = protoModule.writeBuffer(var3832, var3833, var3831, buffer.len(var3831))
		buff = var3832
		var3828 = var3833
	end
	local buff_1 = buffer.create(var3828)
	buffer.copy(buff_1, 0, buff, 0, var3828)
	
	return buff_1
end

function t_116.decode(p228) --[[ line: 22438 ]]
	-- upvalues: t_116 (ref), protoModule (ref), t (ref)
	local var3835 = t_116.new()
	local var3836 = 0
	while var3836 < buffer.len(p228) do
		local _ = nil
		local var3837 = nil
		local var3838, var3839, var3840 = protoModule.readTag(p228, var3836)
		local var3841 = var3838
		var3837 = var3839
		var3836 = var3840
		
		if var3837 == protoModule.wireTypes.varint then
			if var3841 == 1 then
				local _ = nil
				local var3842, var3843 = protoModule.readVarIntI32(p228, var3836)
				local var3844 = var3842
				var3836 = var3843
				var3835.action_type = t.ActionType.fromNumber(var3844) or var3844
			else
				local _ = nil
				local var3845, var3846 = protoModule.readVarInt(p228, var3836)
				local _ = var3845
				var3836 = var3846
			end
		end
		if var3837 == protoModule.wireTypes.lengthDelimited then
			if var3841 == 2 then
				local _ = nil
				local var3847, var3848 = protoModule.readBuffer(p228, var3836)
				var3836 = var3848
				var3835.action_params = t.OpenPurchasePromptAction_Params.decode(var3847)
			else
				local _ = nil
				local var3849, var3850 = protoModule.readVarInt(p228, var3836)
				var3836 = var3850 + var3849
			end
		elseif var3837 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3851, var3852 = protoModule.readFixed32(p228, var3836)
			local _ = var3851
			var3836 = var3852
		elseif var3837 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3853, var3854 = protoModule.readFixed64(p228, var3836)
			local _ = var3853
			var3836 = var3854
		else
			error("Unsupported wire type: " .. var3837)
		end
	end
	return var3835
end

function t_116:jsonEncode() --[[ line: 22486 ]]
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

function t_116:jsonDecode() --[[ line: 22508 ]]
	-- upvalues: t_116 (ref), t (ref)
	local var3856 = t_116.new()
	
	if self.action_type ~= nil then
		var3856.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3856.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3856.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3856.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.actionParams)
	end
	return var3856
end

t_116.descriptor = {
	name = "OpenPurchasePromptAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenPurchasePromptAction"
}
t.OpenPurchasePromptAction = t_116
typeRegistryModule.default:register(t.OpenPurchasePromptAction)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p229) --[[ line: 22548 ]]
	-- upvalues: t_117 (ref)
	return setmetatable({
		kind = if p229 == nil or p229.kind == nil then nil else p229.kind
	}, t_117)
end

function t_117:encode() --[[ line: 22556 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3858 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3859 = self.kind.value:encode()
			local var3860, var3861 = protoModule.writeTag(buff, var3858, 1, protoModule.wireTypes.lengthDelimited)
			var3860, var3861 = protoModule.writeBuffer(var3860, var3861, var3859, buffer.len(var3859))
			buff = var3860
			var3858 = var3861
		elseif self.kind.type == "binding_path" then
			local var3862, var3863 = protoModule.writeTag(buff, var3858, 2, protoModule.wireTypes.lengthDelimited)
			var3862, var3863 = protoModule.writeString(var3862, var3863, self.kind.value)
			buff = var3862
			var3858 = var3863
		end
	end
	local buff_1 = buffer.create(var3858)
	buffer.copy(buff_1, 0, buff, 0, var3858)
	
	return buff_1
end

function t_117.decode(p230) --[[ line: 22576 ]]
	-- upvalues: t_117 (ref), protoModule (ref), t (ref)
	local var3865 = t_117.new()
	local var3866 = 0
	while var3866 < buffer.len(p230) do
		local _ = nil
		local var3867 = nil
		local var3868, var3869, var3870 = protoModule.readTag(p230, var3866)
		local var3871 = var3868
		var3867 = var3869
		var3866 = var3870
		
		if var3867 == protoModule.wireTypes.varint then
			local _ = nil
			local var3872, var3873 = protoModule.readVarInt(p230, var3866)
			local _ = var3872
			var3866 = var3873
			continue
		end
		if var3867 == protoModule.wireTypes.lengthDelimited then
			if var3871 == 1 then
				local _ = nil
				local var3874, var3875 = protoModule.readBuffer(p230, var3866)
				var3866 = var3875
				var3865.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.decode(var3874)
				}
			elseif var3871 == 2 then
				local _ = nil
				local var3876, var3877 = protoModule.readBuffer(p230, var3866)
				var3866 = var3877
				var3865.kind = { type = "binding_path", value = buffer.tostring(var3876) }
			else
				local _ = nil
				local var3878, var3879 = protoModule.readVarInt(p230, var3866)
				var3866 = var3879 + var3878
			end
		elseif var3867 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3880, var3881 = protoModule.readFixed32(p230, var3866)
			local _ = var3880
			var3866 = var3881
		elseif var3867 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3882, var3883 = protoModule.readFixed64(p230, var3866)
			local _ = var3882
			var3866 = var3883
		else
			error("Unsupported wire type: " .. var3867)
		end
	end
	return var3865
end

function t_117:jsonEncode() --[[ line: 22627 ]]
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

function t_117:jsonDecode() --[[ line: 22641 ]]
	-- upvalues: t_117 (ref), t (ref)
	local var3885 = t_117.new()
	
	if self.literal ~= nil then
		var3885.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3885.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3885.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3885
end

t_117.descriptor = {
	name = "OpenPurchasePromptAction_ProductPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ProductPayload"
}
t.OpenPurchasePromptAction_ProductPayload = t_117
typeRegistryModule.default:register(t.OpenPurchasePromptAction_ProductPayload)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p231) --[[ line: 22681 ]]
	-- upvalues: t_118 (ref)
	return setmetatable({
		kind = if p231 == nil or p231.kind == nil then nil else p231.kind,
		id = if p231 == nil or p231.id == nil then nil else p231.id,
		subscription_id = if p231 == nil or p231.subscription_id == nil then nil else p231.subscription_id,
		universe_id = if p231 == nil or p231.universe_id == nil then nil else p231.universe_id,
		equip_if_purchased = if p231 == nil or p231.equip_if_purchased == nil then nil else p231.equip_if_purchased,
		name = if p231 == nil or p231.name == nil then nil else p231.name,
		expected_price = if p231 == nil or p231.expected_price == nil then nil else p231.expected_price,
		icon_image_asset_id = if p231 == nil or p231.icon_image_asset_id == nil then nil else p231.icon_image_asset_id,
		is_subscription_in_robux = if p231 == nil or p231.is_subscription_in_robux == nil then nil else p231.is_subscription_in_robux,
		display_price = if p231 == nil or p231.display_price == nil then nil else p231.display_price
	}, t_118)
end

function t_118:encode() --[[ line: 22707 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3887 = 0
	
	if self.kind ~= nil then
		local var3888 = self.kind:encode()
		local var3889, var3890 = protoModule.writeTag(buff, var3887, 1, protoModule.wireTypes.lengthDelimited)
		var3889, var3890 = protoModule.writeBuffer(var3889, var3890, var3888, buffer.len(var3888))
		buff = var3889
		var3887 = var3890
	end
	if self.id ~= nil then
		local var3891 = self.id:encode()
		local var3892, var3893 = protoModule.writeTag(buff, var3887, 2, protoModule.wireTypes.lengthDelimited)
		var3892, var3893 = protoModule.writeBuffer(var3892, var3893, var3891, buffer.len(var3891))
		buff = var3892
		var3887 = var3893
	end
	if self.subscription_id ~= nil then
		local var3894 = self.subscription_id:encode()
		local var3895, var3896 = protoModule.writeTag(buff, var3887, 3, protoModule.wireTypes.lengthDelimited)
		var3895, var3896 = protoModule.writeBuffer(var3895, var3896, var3894, buffer.len(var3894))
		buff = var3895
		var3887 = var3896
	end
	if self.universe_id ~= nil then
		local var3897 = self.universe_id:encode()
		local var3898, var3899 = protoModule.writeTag(buff, var3887, 4, protoModule.wireTypes.lengthDelimited)
		var3898, var3899 = protoModule.writeBuffer(var3898, var3899, var3897, buffer.len(var3897))
		buff = var3898
		var3887 = var3899
	end
	if self.equip_if_purchased ~= nil then
		local var3900 = self.equip_if_purchased:encode()
		local var3901, var3902 = protoModule.writeTag(buff, var3887, 5, protoModule.wireTypes.lengthDelimited)
		var3901, var3902 = protoModule.writeBuffer(var3901, var3902, var3900, buffer.len(var3900))
		buff = var3901
		var3887 = var3902
	end
	if self.name ~= nil then
		local var3903 = self.name:encode()
		local var3904, var3905 = protoModule.writeTag(buff, var3887, 6, protoModule.wireTypes.lengthDelimited)
		var3904, var3905 = protoModule.writeBuffer(var3904, var3905, var3903, buffer.len(var3903))
		buff = var3904
		var3887 = var3905
	end
	if self.expected_price ~= nil then
		local var3906 = self.expected_price:encode()
		local var3907, var3908 = protoModule.writeTag(buff, var3887, 7, protoModule.wireTypes.lengthDelimited)
		var3907, var3908 = protoModule.writeBuffer(var3907, var3908, var3906, buffer.len(var3906))
		buff = var3907
		var3887 = var3908
	end
	if self.icon_image_asset_id ~= nil then
		local var3909 = self.icon_image_asset_id:encode()
		local var3910, var3911 = protoModule.writeTag(buff, var3887, 8, protoModule.wireTypes.lengthDelimited)
		var3910, var3911 = protoModule.writeBuffer(var3910, var3911, var3909, buffer.len(var3909))
		buff = var3910
		var3887 = var3911
	end
	if self.is_subscription_in_robux ~= nil then
		local var3912 = self.is_subscription_in_robux:encode()
		local var3913, var3914 = protoModule.writeTag(buff, var3887, 9, protoModule.wireTypes.lengthDelimited)
		var3913, var3914 = protoModule.writeBuffer(var3913, var3914, var3912, buffer.len(var3912))
		buff = var3913
		var3887 = var3914
	end
	if self.display_price ~= nil then
		local var3915 = self.display_price:encode()
		local var3916, var3917 = protoModule.writeTag(buff, var3887, 10, protoModule.wireTypes.lengthDelimited)
		var3916, var3917 = protoModule.writeBuffer(var3916, var3917, var3915, buffer.len(var3915))
		buff = var3916
		var3887 = var3917
	end
	local buff_1 = buffer.create(var3887)
	buffer.copy(buff_1, 0, buff, 0, var3887)
	
	return buff_1
end

function t_118.decode(p232) --[[ line: 22778 ]]
	-- upvalues: t_118 (ref), protoModule (ref), propTypesModule (ref)
	local var3919 = t_118.new()
	local var3920 = 0
	while var3920 < buffer.len(p232) do
		local _ = nil
		local var3921 = nil
		local var3922, var3923, var3924 = protoModule.readTag(p232, var3920)
		local var3925 = var3922
		var3921 = var3923
		var3920 = var3924
		
		if var3921 == protoModule.wireTypes.varint then
			local _ = nil
			local var3926, var3927 = protoModule.readVarInt(p232, var3920)
			local _ = var3926
			var3920 = var3927
			continue
		end
		if var3921 == protoModule.wireTypes.lengthDelimited then
			if var3925 == 1 then
				local _ = nil
				local var3928, var3929 = protoModule.readBuffer(p232, var3920)
				var3920 = var3929
				var3919.kind = propTypesModule.StringProp.decode(var3928)
			elseif var3925 == 2 then
				local _ = nil
				local var3930, var3931 = protoModule.readBuffer(p232, var3920)
				var3920 = var3931
				var3919.id = propTypesModule.StringProp.decode(var3930)
			elseif var3925 == 3 then
				local _ = nil
				local var3932, var3933 = protoModule.readBuffer(p232, var3920)
				var3920 = var3933
				var3919.subscription_id = propTypesModule.StringProp.decode(var3932)
			elseif var3925 == 4 then
				local _ = nil
				local var3934, var3935 = protoModule.readBuffer(p232, var3920)
				var3920 = var3935
				var3919.universe_id = propTypesModule.StringProp.decode(var3934)
			elseif var3925 == 5 then
				local _ = nil
				local var3936, var3937 = protoModule.readBuffer(p232, var3920)
				var3920 = var3937
				var3919.equip_if_purchased = propTypesModule.BoolProp.decode(var3936)
			elseif var3925 == 6 then
				local _ = nil
				local var3938, var3939 = protoModule.readBuffer(p232, var3920)
				var3920 = var3939
				var3919.name = propTypesModule.StringProp.decode(var3938)
			elseif var3925 == 7 then
				local _ = nil
				local var3940, var3941 = protoModule.readBuffer(p232, var3920)
				var3920 = var3941
				var3919.expected_price = propTypesModule.Int64Prop.decode(var3940)
			elseif var3925 == 8 then
				local _ = nil
				local var3942, var3943 = protoModule.readBuffer(p232, var3920)
				var3920 = var3943
				var3919.icon_image_asset_id = propTypesModule.Int64Prop.decode(var3942)
			elseif var3925 == 9 then
				local _ = nil
				local var3944, var3945 = protoModule.readBuffer(p232, var3920)
				var3920 = var3945
				var3919.is_subscription_in_robux = propTypesModule.BoolProp.decode(var3944)
			elseif var3925 == 10 then
				local _ = nil
				local var3946, var3947 = protoModule.readBuffer(p232, var3920)
				var3920 = var3947
				var3919.display_price = propTypesModule.StringProp.decode(var3946)
			else
				local _ = nil
				local var3948, var3949 = protoModule.readVarInt(p232, var3920)
				var3920 = var3949 + var3948
			end
		elseif var3921 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3950, var3951 = protoModule.readFixed32(p232, var3920)
			local _ = var3950
			var3920 = var3951
		elseif var3921 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3952, var3953 = protoModule.readFixed64(p232, var3920)
			local _ = var3952
			var3920 = var3953
		else
			error("Unsupported wire type: " .. var3921)
		end
	end
	return var3919
end

function t_118:jsonEncode() --[[ line: 22869 ]]
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

function t_118:jsonDecode() --[[ line: 22917 ]]
	-- upvalues: t_118 (ref), propTypesModule (ref)
	local var3955 = t_118.new()
	
	if self.kind ~= nil then
		var3955.kind = propTypesModule.StringProp.jsonDecode(self.kind)
	end
	if self.id ~= nil then
		var3955.id = propTypesModule.StringProp.jsonDecode(self.id)
	end
	if self.subscription_id ~= nil then
		var3955.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		var3955.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		var3955.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3955.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.equip_if_purchased ~= nil then
		var3955.equip_if_purchased = propTypesModule.BoolProp.jsonDecode(self.equip_if_purchased)
	end
	if self.equipIfPurchased ~= nil then
		var3955.equip_if_purchased = propTypesModule.BoolProp.jsonDecode(self.equipIfPurchased)
	end
	if self.name ~= nil then
		var3955.name = propTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.expected_price ~= nil then
		var3955.expected_price = propTypesModule.Int64Prop.jsonDecode(self.expected_price)
	end
	if self.expectedPrice ~= nil then
		var3955.expected_price = propTypesModule.Int64Prop.jsonDecode(self.expectedPrice)
	end
	if self.icon_image_asset_id ~= nil then
		var3955.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		var3955.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.is_subscription_in_robux ~= nil then
		var3955.is_subscription_in_robux = propTypesModule.BoolProp.jsonDecode(self.is_subscription_in_robux)
	end
	if self.isSubscriptionInRobux ~= nil then
		var3955.is_subscription_in_robux = propTypesModule.BoolProp.jsonDecode(self.isSubscriptionInRobux)
	end
	if self.display_price ~= nil then
		var3955.display_price = propTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		var3955.display_price = propTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	return var3955
end

t_118.descriptor = {
	name = "OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.ProductPayloadLiteral"
}
t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral = t_118
typeRegistryModule.default:register(t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p233) --[[ line: 23021 ]]
	-- upvalues: t_119 (ref)
	return setmetatable({
		kind = if p233 == nil or p233.kind == nil then nil else p233.kind
	}, t_119)
end

function t_119:encode() --[[ line: 23029 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3957 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3958 = self.kind.value:encode()
			local var3959, var3960 = protoModule.writeTag(buff, var3957, 1, protoModule.wireTypes.lengthDelimited)
			var3959, var3960 = protoModule.writeBuffer(var3959, var3960, var3958, buffer.len(var3958))
			buff = var3959
			var3957 = var3960
		elseif self.kind.type == "binding_path" then
			local var3961, var3962 = protoModule.writeTag(buff, var3957, 2, protoModule.wireTypes.lengthDelimited)
			var3961, var3962 = protoModule.writeString(var3961, var3962, self.kind.value)
			buff = var3961
			var3957 = var3962
		end
	end
	local buff_1 = buffer.create(var3957)
	buffer.copy(buff_1, 0, buff, 0, var3957)
	
	return buff_1
end

function t_119.decode(p234) --[[ line: 23049 ]]
	-- upvalues: t_119 (ref), protoModule (ref), t (ref)
	local var3964 = t_119.new()
	local var3965 = 0
	while var3965 < buffer.len(p234) do
		local _ = nil
		local var3966 = nil
		local var3967, var3968, var3969 = protoModule.readTag(p234, var3965)
		local var3970 = var3967
		var3966 = var3968
		var3965 = var3969
		
		if var3966 == protoModule.wireTypes.varint then
			local _ = nil
			local var3971, var3972 = protoModule.readVarInt(p234, var3965)
			local _ = var3971
			var3965 = var3972
			continue
		end
		if var3966 == protoModule.wireTypes.lengthDelimited then
			if var3970 == 1 then
				local _ = nil
				local var3973, var3974 = protoModule.readBuffer(p234, var3965)
				var3965 = var3974
				var3964.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.decode(var3973)
				}
			elseif var3970 == 2 then
				local _ = nil
				local var3975, var3976 = protoModule.readBuffer(p234, var3965)
				var3965 = var3976
				var3964.kind = { type = "binding_path", value = buffer.tostring(var3975) }
			else
				local _ = nil
				local var3977, var3978 = protoModule.readVarInt(p234, var3965)
				var3965 = var3978 + var3977
			end
		elseif var3966 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3979, var3980 = protoModule.readFixed32(p234, var3965)
			local _ = var3979
			var3965 = var3980
		elseif var3966 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3981, var3982 = protoModule.readFixed64(p234, var3965)
			local _ = var3981
			var3965 = var3982
		else
			error("Unsupported wire type: " .. var3966)
		end
	end
	return var3964
end

function t_119:jsonEncode() --[[ line: 23100 ]]
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

function t_119:jsonDecode() --[[ line: 23114 ]]
	-- upvalues: t_119 (ref), t (ref)
	local var3984 = t_119.new()
	
	if self.literal ~= nil then
		var3984.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3984.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3984.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3984
end

t_119.descriptor = {
	name = "OpenPurchasePromptAction_DisplayInfo",
	fullName = "roblox.apppageplatform.shared.v1beta1.DisplayInfo"
}
t.OpenPurchasePromptAction_DisplayInfo = t_119
typeRegistryModule.default:register(t.OpenPurchasePromptAction_DisplayInfo)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p235) --[[ line: 23152 ]]
	-- upvalues: t_120 (ref)
	return setmetatable({
		product_name = if p235 == nil or p235.product_name == nil then nil else p235.product_name,
		description = if p235 == nil or p235.description == nil then nil else p235.description,
		image_url = if p235 == nil or p235.image_url == nil then nil else p235.image_url,
		price_in_robux = if p235 == nil or p235.price_in_robux == nil then nil else p235.price_in_robux,
		display_price = if p235 == nil or p235.display_price == nil then nil else p235.display_price,
		icon_image_asset_id = if p235 == nil or p235.icon_image_asset_id == nil then nil else p235.icon_image_asset_id,
		product_id = if p235 == nil or p235.product_id == nil then nil else p235.product_id,
		target_id = if p235 == nil or p235.target_id == nil then nil else p235.target_id,
		is_for_sale = if p235 == nil or p235.is_for_sale == nil then nil else p235.is_for_sale,
		product_type = if p235 == nil or p235.product_type == nil then nil else p235.product_type,
		base_price_in_robux = if p235 == nil or p235.base_price_in_robux == nil then nil else p235.base_price_in_robux,
		price_discount_details = if p235 == nil or p235.price_discount_details == nil then nil else p235.price_discount_details
	}, t_120)
end

function t_120:encode() --[[ line: 23180 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3986 = 0
	
	if self.product_name ~= nil then
		local var3987 = self.product_name:encode()
		local var3988, var3989 = protoModule.writeTag(buff, var3986, 1, protoModule.wireTypes.lengthDelimited)
		var3988, var3989 = protoModule.writeBuffer(var3988, var3989, var3987, buffer.len(var3987))
		buff = var3988
		var3986 = var3989
	end
	if self.description ~= nil then
		local var3990 = self.description:encode()
		local var3991, var3992 = protoModule.writeTag(buff, var3986, 2, protoModule.wireTypes.lengthDelimited)
		var3991, var3992 = protoModule.writeBuffer(var3991, var3992, var3990, buffer.len(var3990))
		buff = var3991
		var3986 = var3992
	end
	if self.image_url ~= nil then
		local var3993 = self.image_url:encode()
		local var3994, var3995 = protoModule.writeTag(buff, var3986, 3, protoModule.wireTypes.lengthDelimited)
		var3994, var3995 = protoModule.writeBuffer(var3994, var3995, var3993, buffer.len(var3993))
		buff = var3994
		var3986 = var3995
	end
	if self.price_in_robux ~= nil then
		local var3996 = self.price_in_robux:encode()
		local var3997, var3998 = protoModule.writeTag(buff, var3986, 4, protoModule.wireTypes.lengthDelimited)
		var3997, var3998 = protoModule.writeBuffer(var3997, var3998, var3996, buffer.len(var3996))
		buff = var3997
		var3986 = var3998
	end
	if self.display_price ~= nil then
		local var3999 = self.display_price:encode()
		local var4000, var4001 = protoModule.writeTag(buff, var3986, 5, protoModule.wireTypes.lengthDelimited)
		var4000, var4001 = protoModule.writeBuffer(var4000, var4001, var3999, buffer.len(var3999))
		buff = var4000
		var3986 = var4001
	end
	if self.icon_image_asset_id ~= nil then
		local var4002 = self.icon_image_asset_id:encode()
		local var4003, var4004 = protoModule.writeTag(buff, var3986, 6, protoModule.wireTypes.lengthDelimited)
		var4003, var4004 = protoModule.writeBuffer(var4003, var4004, var4002, buffer.len(var4002))
		buff = var4003
		var3986 = var4004
	end
	if self.product_id ~= nil then
		local var4005 = self.product_id:encode()
		local var4006, var4007 = protoModule.writeTag(buff, var3986, 7, protoModule.wireTypes.lengthDelimited)
		var4006, var4007 = protoModule.writeBuffer(var4006, var4007, var4005, buffer.len(var4005))
		buff = var4006
		var3986 = var4007
	end
	if self.target_id ~= nil then
		local var4008 = self.target_id:encode()
		local var4009, var4010 = protoModule.writeTag(buff, var3986, 8, protoModule.wireTypes.lengthDelimited)
		var4009, var4010 = protoModule.writeBuffer(var4009, var4010, var4008, buffer.len(var4008))
		buff = var4009
		var3986 = var4010
	end
	if self.is_for_sale ~= nil then
		local var4011 = self.is_for_sale:encode()
		local var4012, var4013 = protoModule.writeTag(buff, var3986, 9, protoModule.wireTypes.lengthDelimited)
		var4012, var4013 = protoModule.writeBuffer(var4012, var4013, var4011, buffer.len(var4011))
		buff = var4012
		var3986 = var4013
	end
	if self.product_type ~= nil then
		local var4014 = self.product_type:encode()
		local var4015, var4016 = protoModule.writeTag(buff, var3986, 10, protoModule.wireTypes.lengthDelimited)
		var4015, var4016 = protoModule.writeBuffer(var4015, var4016, var4014, buffer.len(var4014))
		buff = var4015
		var3986 = var4016
	end
	if self.base_price_in_robux ~= nil then
		local var4017 = self.base_price_in_robux:encode()
		local var4018, var4019 = protoModule.writeTag(buff, var3986, 11, protoModule.wireTypes.lengthDelimited)
		var4018, var4019 = protoModule.writeBuffer(var4018, var4019, var4017, buffer.len(var4017))
		buff = var4018
		var3986 = var4019
	end
	if self.price_discount_details ~= nil then
		local var4020 = self.price_discount_details:encode()
		local var4021, var4022 = protoModule.writeTag(buff, var3986, 12, protoModule.wireTypes.lengthDelimited)
		var4021, var4022 = protoModule.writeBuffer(var4021, var4022, var4020, buffer.len(var4020))
		buff = var4021
		var3986 = var4022
	end
	local buff_1 = buffer.create(var3986)
	buffer.copy(buff_1, 0, buff, 0, var3986)
	
	return buff_1
end

function t_120.decode(p236) --[[ line: 23263 ]]
	-- upvalues: t_120 (ref), protoModule (ref), propTypesModule (ref)
	local var4024 = t_120.new()
	local var4025 = 0
	while var4025 < buffer.len(p236) do
		local _ = nil
		local var4026 = nil
		local var4027, var4028, var4029 = protoModule.readTag(p236, var4025)
		local var4030 = var4027
		var4026 = var4028
		var4025 = var4029
		
		if var4026 == protoModule.wireTypes.varint then
			local _ = nil
			local var4031, var4032 = protoModule.readVarInt(p236, var4025)
			local _ = var4031
			var4025 = var4032
			continue
		end
		if var4026 == protoModule.wireTypes.lengthDelimited then
			if var4030 == 1 then
				local _ = nil
				local var4033, var4034 = protoModule.readBuffer(p236, var4025)
				var4025 = var4034
				var4024.product_name = propTypesModule.StringProp.decode(var4033)
			elseif var4030 == 2 then
				local _ = nil
				local var4035, var4036 = protoModule.readBuffer(p236, var4025)
				var4025 = var4036
				var4024.description = propTypesModule.StringProp.decode(var4035)
			elseif var4030 == 3 then
				local _ = nil
				local var4037, var4038 = protoModule.readBuffer(p236, var4025)
				var4025 = var4038
				var4024.image_url = propTypesModule.StringProp.decode(var4037)
			elseif var4030 == 4 then
				local _ = nil
				local var4039, var4040 = protoModule.readBuffer(p236, var4025)
				var4025 = var4040
				var4024.price_in_robux = propTypesModule.Int64Prop.decode(var4039)
			elseif var4030 == 5 then
				local _ = nil
				local var4041, var4042 = protoModule.readBuffer(p236, var4025)
				var4025 = var4042
				var4024.display_price = propTypesModule.StringProp.decode(var4041)
			elseif var4030 == 6 then
				local _ = nil
				local var4043, var4044 = protoModule.readBuffer(p236, var4025)
				var4025 = var4044
				var4024.icon_image_asset_id = propTypesModule.Int64Prop.decode(var4043)
			elseif var4030 == 7 then
				local _ = nil
				local var4045, var4046 = protoModule.readBuffer(p236, var4025)
				var4025 = var4046
				var4024.product_id = propTypesModule.Int64Prop.decode(var4045)
			elseif var4030 == 8 then
				local _ = nil
				local var4047, var4048 = protoModule.readBuffer(p236, var4025)
				var4025 = var4048
				var4024.target_id = propTypesModule.StringProp.decode(var4047)
			elseif var4030 == 9 then
				local _ = nil
				local var4049, var4050 = protoModule.readBuffer(p236, var4025)
				var4025 = var4050
				var4024.is_for_sale = propTypesModule.BoolProp.decode(var4049)
			elseif var4030 == 10 then
				local _ = nil
				local var4051, var4052 = protoModule.readBuffer(p236, var4025)
				var4025 = var4052
				var4024.product_type = propTypesModule.StringProp.decode(var4051)
			elseif var4030 == 11 then
				local _ = nil
				local var4053, var4054 = protoModule.readBuffer(p236, var4025)
				var4025 = var4054
				var4024.base_price_in_robux = propTypesModule.Int64Prop.decode(var4053)
			elseif var4030 == 12 then
				local _ = nil
				local var4055, var4056 = protoModule.readBuffer(p236, var4025)
				var4025 = var4056
				var4024.price_discount_details = propTypesModule.ArrayOfStructProp.decode(var4055)
			else
				local _ = nil
				local var4057, var4058 = protoModule.readVarInt(p236, var4025)
				var4025 = var4058 + var4057
			end
		elseif var4026 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4059, var4060 = protoModule.readFixed32(p236, var4025)
			local _ = var4059
			var4025 = var4060
		elseif var4026 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4061, var4062 = protoModule.readFixed64(p236, var4025)
			local _ = var4061
			var4025 = var4062
		else
			error("Unsupported wire type: " .. var4026)
		end
	end
	return var4024
end

function t_120:jsonEncode() --[[ line: 23364 ]]
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

function t_120:jsonDecode() --[[ line: 23420 ]]
	-- upvalues: t_120 (ref), propTypesModule (ref)
	local var4064 = t_120.new()
	
	if self.product_name ~= nil then
		var4064.product_name = propTypesModule.StringProp.jsonDecode(self.product_name)
	end
	if self.productName ~= nil then
		var4064.product_name = propTypesModule.StringProp.jsonDecode(self.productName)
	end
	if self.description ~= nil then
		var4064.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_url ~= nil then
		var4064.image_url = propTypesModule.StringProp.jsonDecode(self.image_url)
	end
	if self.imageUrl ~= nil then
		var4064.image_url = propTypesModule.StringProp.jsonDecode(self.imageUrl)
	end
	if self.price_in_robux ~= nil then
		var4064.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		var4064.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.display_price ~= nil then
		var4064.display_price = propTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		var4064.display_price = propTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	if self.icon_image_asset_id ~= nil then
		var4064.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		var4064.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.product_id ~= nil then
		var4064.product_id = propTypesModule.Int64Prop.jsonDecode(self.product_id)
	end
	if self.productId ~= nil then
		var4064.product_id = propTypesModule.Int64Prop.jsonDecode(self.productId)
	end
	if self.target_id ~= nil then
		var4064.target_id = propTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		var4064.target_id = propTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.is_for_sale ~= nil then
		var4064.is_for_sale = propTypesModule.BoolProp.jsonDecode(self.is_for_sale)
	end
	if self.isForSale ~= nil then
		var4064.is_for_sale = propTypesModule.BoolProp.jsonDecode(self.isForSale)
	end
	if self.product_type ~= nil then
		var4064.product_type = propTypesModule.StringProp.jsonDecode(self.product_type)
	end
	if self.productType ~= nil then
		var4064.product_type = propTypesModule.StringProp.jsonDecode(self.productType)
	end
	if self.base_price_in_robux ~= nil then
		var4064.base_price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.base_price_in_robux)
	end
	if self.basePriceInRobux ~= nil then
		var4064.base_price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.basePriceInRobux)
	end
	if self.price_discount_details ~= nil then
		var4064.price_discount_details = propTypesModule.ArrayOfStructProp.jsonDecode(self.price_discount_details)
	end
	if self.priceDiscountDetails ~= nil then
		var4064.price_discount_details = propTypesModule.ArrayOfStructProp.jsonDecode(self.priceDiscountDetails)
	end
	return var4064
end

t_120.descriptor = {
	name = "OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.DisplayInfoLiteral"
}
t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral = t_120
typeRegistryModule.default:register(t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p237) --[[ line: 23554 ]]
	-- upvalues: t_121 (ref)
	return setmetatable({
		kind = if p237 == nil or p237.kind == nil then nil else p237.kind
	}, t_121)
end

function t_121:encode() --[[ line: 23562 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4066 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var4067 = self.kind.value:encode()
			local var4068, var4069 = protoModule.writeTag(buff, var4066, 1, protoModule.wireTypes.lengthDelimited)
			var4068, var4069 = protoModule.writeBuffer(var4068, var4069, var4067, buffer.len(var4067))
			buff = var4068
			var4066 = var4069
		elseif self.kind.type == "binding_path" then
			local var4070, var4071 = protoModule.writeTag(buff, var4066, 2, protoModule.wireTypes.lengthDelimited)
			var4070, var4071 = protoModule.writeString(var4070, var4071, self.kind.value)
			buff = var4070
			var4066 = var4071
		end
	end
	local buff_1 = buffer.create(var4066)
	buffer.copy(buff_1, 0, buff, 0, var4066)
	
	return buff_1
end

function t_121.decode(p238) --[[ line: 23584 ]]
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var4073 = t_121.new()
	local var4074 = 0
	while var4074 < buffer.len(p238) do
		local _ = nil
		local var4075 = nil
		local var4076, var4077, var4078 = protoModule.readTag(p238, var4074)
		local var4079 = var4076
		var4075 = var4077
		var4074 = var4078
		
		if var4075 == protoModule.wireTypes.varint then
			local _ = nil
			local var4080, var4081 = protoModule.readVarInt(p238, var4074)
			local _ = var4080
			var4074 = var4081
			continue
		end
		if var4075 == protoModule.wireTypes.lengthDelimited then
			if var4079 == 1 then
				local _ = nil
				local var4082, var4083 = protoModule.readBuffer(p238, var4074)
				var4074 = var4083
				var4073.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.decode(var4082)
				}
			elseif var4079 == 2 then
				local _ = nil
				local var4084, var4085 = protoModule.readBuffer(p238, var4074)
				var4074 = var4085
				var4073.kind = { type = "binding_path", value = buffer.tostring(var4084) }
			else
				local _ = nil
				local var4086, var4087 = protoModule.readVarInt(p238, var4074)
				var4074 = var4087 + var4086
			end
		elseif var4075 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4088, var4089 = protoModule.readFixed32(p238, var4074)
			local _ = var4088
			var4074 = var4089
		elseif var4075 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4090, var4091 = protoModule.readFixed64(p238, var4074)
			local _ = var4090
			var4074 = var4091
		else
			error("Unsupported wire type: " .. var4075)
		end
	end
	return var4073
end

function t_121:jsonEncode() --[[ line: 23637 ]]
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

function t_121:jsonDecode() --[[ line: 23653 ]]
	-- upvalues: t_121 (ref), t (ref)
	local var4093 = t_121.new()
	
	if self.literal ~= nil then
		var4093.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var4093.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var4093.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var4093
end

t_121.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseOptions"
}
t.OpenPurchasePromptAction_PurchaseOptions = t_121
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseOptions)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p239) --[[ line: 23693 ]]
	-- upvalues: t_122 (ref)
	return setmetatable({
		should_skip_ownership_check = if p239 == nil or p239.should_skip_ownership_check == nil then nil else p239.should_skip_ownership_check,
		enable_preloaded_purchase_ui = if p239 == nil or p239.enable_preloaded_purchase_ui == nil then nil else p239.enable_preloaded_purchase_ui,
		completion_message = if p239 == nil or p239.completion_message == nil then nil else p239.completion_message,
		completion_button_text = if p239 == nil or p239.completion_button_text == nil then nil else p239.completion_button_text,
		prevent_double_confirm = if p239 == nil or p239.prevent_double_confirm == nil then nil else p239.prevent_double_confirm,
		provided_robux_balance = if p239 == nil or p239.provided_robux_balance == nil then nil else p239.provided_robux_balance
	}, t_122)
end

function t_122:encode() --[[ line: 23721 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4095 = 0
	
	if self.should_skip_ownership_check ~= nil then
		local var4096 = self.should_skip_ownership_check:encode()
		local var4097, var4098 = protoModule.writeTag(buff, var4095, 1, protoModule.wireTypes.lengthDelimited)
		var4097, var4098 = protoModule.writeBuffer(var4097, var4098, var4096, buffer.len(var4096))
		buff = var4097
		var4095 = var4098
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		local var4099 = self.enable_preloaded_purchase_ui:encode()
		local var4100, var4101 = protoModule.writeTag(buff, var4095, 2, protoModule.wireTypes.lengthDelimited)
		var4100, var4101 = protoModule.writeBuffer(var4100, var4101, var4099, buffer.len(var4099))
		buff = var4100
		var4095 = var4101
	end
	if self.completion_message ~= nil then
		local var4102 = self.completion_message:encode()
		local var4103, var4104 = protoModule.writeTag(buff, var4095, 3, protoModule.wireTypes.lengthDelimited)
		var4103, var4104 = protoModule.writeBuffer(var4103, var4104, var4102, buffer.len(var4102))
		buff = var4103
		var4095 = var4104
	end
	if self.completion_button_text ~= nil then
		local var4105 = self.completion_button_text:encode()
		local var4106, var4107 = protoModule.writeTag(buff, var4095, 4, protoModule.wireTypes.lengthDelimited)
		var4106, var4107 = protoModule.writeBuffer(var4106, var4107, var4105, buffer.len(var4105))
		buff = var4106
		var4095 = var4107
	end
	if self.prevent_double_confirm ~= nil then
		local var4108 = self.prevent_double_confirm:encode()
		local var4109, var4110 = protoModule.writeTag(buff, var4095, 5, protoModule.wireTypes.lengthDelimited)
		var4109, var4110 = protoModule.writeBuffer(var4109, var4110, var4108, buffer.len(var4108))
		buff = var4109
		var4095 = var4110
	end
	if self.provided_robux_balance ~= nil then
		local var4111 = self.provided_robux_balance:encode()
		local var4112, var4113 = protoModule.writeTag(buff, var4095, 6, protoModule.wireTypes.lengthDelimited)
		var4112, var4113 = protoModule.writeBuffer(var4112, var4113, var4111, buffer.len(var4111))
		buff = var4112
		var4095 = var4113
	end
	local buff_1 = buffer.create(var4095)
	buffer.copy(buff_1, 0, buff, 0, var4095)
	
	return buff_1
end

function t_122.decode(p240) --[[ line: 23768 ]]
	-- upvalues: t_122 (ref), protoModule (ref), propTypesModule (ref)
	local var4115 = t_122.new()
	local var4116 = 0
	while var4116 < buffer.len(p240) do
		local _ = nil
		local var4117 = nil
		local var4118, var4119, var4120 = protoModule.readTag(p240, var4116)
		local var4121 = var4118
		var4117 = var4119
		var4116 = var4120
		
		if var4117 == protoModule.wireTypes.varint then
			local _ = nil
			local var4122, var4123 = protoModule.readVarInt(p240, var4116)
			local _ = var4122
			var4116 = var4123
			continue
		end
		if var4117 == protoModule.wireTypes.lengthDelimited then
			if var4121 == 1 then
				local _ = nil
				local var4124, var4125 = protoModule.readBuffer(p240, var4116)
				var4116 = var4125
				var4115.should_skip_ownership_check = propTypesModule.BoolProp.decode(var4124)
			elseif var4121 == 2 then
				local _ = nil
				local var4126, var4127 = protoModule.readBuffer(p240, var4116)
				var4116 = var4127
				var4115.enable_preloaded_purchase_ui = propTypesModule.BoolProp.decode(var4126)
			elseif var4121 == 3 then
				local _ = nil
				local var4128, var4129 = protoModule.readBuffer(p240, var4116)
				var4116 = var4129
				var4115.completion_message = propTypesModule.StringProp.decode(var4128)
			elseif var4121 == 4 then
				local _ = nil
				local var4130, var4131 = protoModule.readBuffer(p240, var4116)
				var4116 = var4131
				var4115.completion_button_text = propTypesModule.StringProp.decode(var4130)
			elseif var4121 == 5 then
				local _ = nil
				local var4132, var4133 = protoModule.readBuffer(p240, var4116)
				var4116 = var4133
				var4115.prevent_double_confirm = propTypesModule.BoolProp.decode(var4132)
			elseif var4121 == 6 then
				local _ = nil
				local var4134, var4135 = protoModule.readBuffer(p240, var4116)
				var4116 = var4135
				var4115.provided_robux_balance = propTypesModule.Int64Prop.decode(var4134)
			else
				local _ = nil
				local var4136, var4137 = protoModule.readVarInt(p240, var4116)
				var4116 = var4137 + var4136
			end
		elseif var4117 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4138, var4139 = protoModule.readFixed32(p240, var4116)
			local _ = var4138
			var4116 = var4139
		elseif var4117 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4140, var4141 = protoModule.readFixed64(p240, var4116)
			local _ = var4140
			var4116 = var4141
		else
			error("Unsupported wire type: " .. var4117)
		end
	end
	return var4115
end

function t_122:jsonEncode() --[[ line: 23843 ]]
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

function t_122:jsonDecode() --[[ line: 23875 ]]
	-- upvalues: t_122 (ref), propTypesModule (ref)
	local var4143 = t_122.new()
	
	if self.should_skip_ownership_check ~= nil then
		var4143.should_skip_ownership_check = propTypesModule.BoolProp.jsonDecode(self.should_skip_ownership_check)
	end
	if self.shouldSkipOwnershipCheck ~= nil then
		var4143.should_skip_ownership_check = propTypesModule.BoolProp.jsonDecode(self.shouldSkipOwnershipCheck)
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		var4143.enable_preloaded_purchase_ui = propTypesModule.BoolProp.jsonDecode(self.enable_preloaded_purchase_ui)
	end
	if self.enablePreloadedPurchaseUi ~= nil then
		var4143.enable_preloaded_purchase_ui = propTypesModule.BoolProp.jsonDecode(self.enablePreloadedPurchaseUi)
	end
	if self.completion_message ~= nil then
		var4143.completion_message = propTypesModule.StringProp.jsonDecode(self.completion_message)
	end
	if self.completionMessage ~= nil then
		var4143.completion_message = propTypesModule.StringProp.jsonDecode(self.completionMessage)
	end
	if self.completion_button_text ~= nil then
		var4143.completion_button_text = propTypesModule.StringProp.jsonDecode(self.completion_button_text)
	end
	if self.completionButtonText ~= nil then
		var4143.completion_button_text = propTypesModule.StringProp.jsonDecode(self.completionButtonText)
	end
	if self.prevent_double_confirm ~= nil then
		var4143.prevent_double_confirm = propTypesModule.BoolProp.jsonDecode(self.prevent_double_confirm)
	end
	if self.preventDoubleConfirm ~= nil then
		var4143.prevent_double_confirm = propTypesModule.BoolProp.jsonDecode(self.preventDoubleConfirm)
	end
	if self.provided_robux_balance ~= nil then
		var4143.provided_robux_balance = propTypesModule.Int64Prop.jsonDecode(self.provided_robux_balance)
	end
	if self.providedRobuxBalance ~= nil then
		var4143.provided_robux_balance = propTypesModule.Int64Prop.jsonDecode(self.providedRobuxBalance)
	end
	return var4143
end

t_122.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseOptionsLiteral"
}
t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral = t_122
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p241) --[[ line: 23960 ]]
	-- upvalues: t_123 (ref)
	return setmetatable({
		kind = if p241 == nil or p241.kind == nil then nil else p241.kind
	}, t_123)
end

function t_123:encode() --[[ line: 23971 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4145 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var4146 = self.kind.value:encode()
			local var4147, var4148 = protoModule.writeTag(buff, var4145, 1, protoModule.wireTypes.lengthDelimited)
			var4147, var4148 = protoModule.writeBuffer(var4147, var4148, var4146, buffer.len(var4146))
			buff = var4147
			var4145 = var4148
		elseif self.kind.type == "binding_path" then
			local var4149, var4150 = protoModule.writeTag(buff, var4145, 2, protoModule.wireTypes.lengthDelimited)
			var4149, var4150 = protoModule.writeString(var4149, var4150, self.kind.value)
			buff = var4149
			var4145 = var4150
		end
	end
	local buff_1 = buffer.create(var4145)
	buffer.copy(buff_1, 0, buff, 0, var4145)
	
	return buff_1
end

function t_123.decode(p242) --[[ line: 23993 ]]
	-- upvalues: t_123 (ref), protoModule (ref), t (ref)
	local var4152 = t_123.new()
	local var4153 = 0
	while var4153 < buffer.len(p242) do
		local _ = nil
		local var4154 = nil
		local var4155, var4156, var4157 = protoModule.readTag(p242, var4153)
		local var4158 = var4155
		var4154 = var4156
		var4153 = var4157
		
		if var4154 == protoModule.wireTypes.varint then
			local _ = nil
			local var4159, var4160 = protoModule.readVarInt(p242, var4153)
			local _ = var4159
			var4153 = var4160
			continue
		end
		if var4154 == protoModule.wireTypes.lengthDelimited then
			if var4158 == 1 then
				local _ = nil
				local var4161, var4162 = protoModule.readBuffer(p242, var4153)
				var4153 = var4162
				var4152.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.decode(var4161)
				}
			elseif var4158 == 2 then
				local _ = nil
				local var4163, var4164 = protoModule.readBuffer(p242, var4153)
				var4153 = var4164
				var4152.kind = { type = "binding_path", value = buffer.tostring(var4163) }
			else
				local _ = nil
				local var4165, var4166 = protoModule.readVarInt(p242, var4153)
				var4153 = var4166 + var4165
			end
		elseif var4154 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4167, var4168 = protoModule.readFixed32(p242, var4153)
			local _ = var4167
			var4153 = var4168
		elseif var4154 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4169, var4170 = protoModule.readFixed64(p242, var4153)
			local _ = var4169
			var4153 = var4170
		else
			error("Unsupported wire type: " .. var4154)
		end
	end
	return var4152
end

function t_123:jsonEncode() --[[ line: 24048 ]]
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

function t_123:jsonDecode() --[[ line: 24064 ]]
	-- upvalues: t_123 (ref), t (ref)
	local var4172 = t_123.new()
	
	if self.literal ~= nil then
		var4172.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var4172.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var4172.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var4172
end

t_123.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseAnalyticsMetadata",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseAnalyticsMetadata"
}
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata = t_123
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p243) --[[ line: 24105 ]]
	-- upvalues: t_124 (ref)
	return setmetatable({
		surface = if p243 == nil or p243.surface == nil then nil else p243.surface,
		product_universe_id = if p243 == nil or p243.product_universe_id == nil then nil else p243.product_universe_id
	}, t_124)
end

function t_124:encode() --[[ line: 24119 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4174 = 0
	
	if self.surface ~= nil then
		local var4175 = self.surface:encode()
		local var4176, var4177 = protoModule.writeTag(buff, var4174, 1, protoModule.wireTypes.lengthDelimited)
		var4176, var4177 = protoModule.writeBuffer(var4176, var4177, var4175, buffer.len(var4175))
		buff = var4176
		var4174 = var4177
	end
	if self.product_universe_id ~= nil then
		local var4178 = self.product_universe_id:encode()
		local var4179, var4180 = protoModule.writeTag(buff, var4174, 2, protoModule.wireTypes.lengthDelimited)
		var4179, var4180 = protoModule.writeBuffer(var4179, var4180, var4178, buffer.len(var4178))
		buff = var4179
		var4174 = var4180
	end
	local buff_1 = buffer.create(var4174)
	buffer.copy(buff_1, 0, buff, 0, var4174)
	
	return buff_1
end

function t_124.decode(p244) --[[ line: 24142 ]]
	-- upvalues: t_124 (ref), protoModule (ref), propTypesModule (ref)
	local var4182 = t_124.new()
	local var4183 = 0
	while var4183 < buffer.len(p244) do
		local _ = nil
		local var4184 = nil
		local var4185, var4186, var4187 = protoModule.readTag(p244, var4183)
		local var4188 = var4185
		var4184 = var4186
		var4183 = var4187
		
		if var4184 == protoModule.wireTypes.varint then
			local _ = nil
			local var4189, var4190 = protoModule.readVarInt(p244, var4183)
			local _ = var4189
			var4183 = var4190
			continue
		end
		if var4184 == protoModule.wireTypes.lengthDelimited then
			if var4188 == 1 then
				local _ = nil
				local var4191, var4192 = protoModule.readBuffer(p244, var4183)
				var4183 = var4192
				var4182.surface = propTypesModule.StringProp.decode(var4191)
			elseif var4188 == 2 then
				local _ = nil
				local var4193, var4194 = protoModule.readBuffer(p244, var4183)
				var4183 = var4194
				var4182.product_universe_id = propTypesModule.StringProp.decode(var4193)
			else
				local _ = nil
				local var4195, var4196 = protoModule.readVarInt(p244, var4183)
				var4183 = var4196 + var4195
			end
		elseif var4184 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4197, var4198 = protoModule.readFixed32(p244, var4183)
			local _ = var4197
			var4183 = var4198
		elseif var4184 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4199, var4200 = protoModule.readFixed64(p244, var4183)
			local _ = var4199
			var4183 = var4200
		else
			error("Unsupported wire type: " .. var4184)
		end
	end
	return var4182
end

function t_124:jsonEncode() --[[ line: 24193 ]]
	local t = {}
	
	if self.surface ~= nil then
		t.surface = self.surface:jsonEncode()
	end
	if self.product_universe_id ~= nil then
		t.productUniverseId = self.product_universe_id:jsonEncode()
	end
	return t
end

function t_124:jsonDecode() --[[ line: 24209 ]]
	-- upvalues: t_124 (ref), propTypesModule (ref)
	local var4202 = t_124.new()
	
	if self.surface ~= nil then
		var4202.surface = propTypesModule.StringProp.jsonDecode(self.surface)
	end
	if self.product_universe_id ~= nil then
		var4202.product_universe_id = propTypesModule.StringProp.jsonDecode(self.product_universe_id)
	end
	if self.productUniverseId ~= nil then
		var4202.product_universe_id = propTypesModule.StringProp.jsonDecode(self.productUniverseId)
	end
	return var4202
end

t_124.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseAnalyticsMetadataLiteral"
}
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral = t_124
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p245) --[[ line: 24250 ]]
	-- upvalues: t_125 (ref)
	return setmetatable({
		product_payload = if p245 == nil or p245.product_payload == nil then nil else p245.product_payload,
		display_info = if p245 == nil or p245.display_info == nil then nil else p245.display_info,
		purchase_options = if p245 == nil or p245.purchase_options == nil then nil else p245.purchase_options,
		purchase_analytics_metadata = if p245 == nil or p245.purchase_analytics_metadata == nil then nil else p245.purchase_analytics_metadata,
		root_place_id = if p245 == nil or p245.root_place_id == nil then nil else p245.root_place_id
	}, t_125)
end

function t_125:encode() --[[ line: 24264 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4204 = 0
	
	if self.product_payload ~= nil then
		local var4205 = self.product_payload:encode()
		local var4206, var4207 = protoModule.writeTag(buff, var4204, 1, protoModule.wireTypes.lengthDelimited)
		var4206, var4207 = protoModule.writeBuffer(var4206, var4207, var4205, buffer.len(var4205))
		buff = var4206
		var4204 = var4207
	end
	if self.display_info ~= nil then
		local var4208 = self.display_info:encode()
		local var4209, var4210 = protoModule.writeTag(buff, var4204, 2, protoModule.wireTypes.lengthDelimited)
		var4209, var4210 = protoModule.writeBuffer(var4209, var4210, var4208, buffer.len(var4208))
		buff = var4209
		var4204 = var4210
	end
	if self.purchase_options ~= nil then
		local var4211 = self.purchase_options:encode()
		local var4212, var4213 = protoModule.writeTag(buff, var4204, 3, protoModule.wireTypes.lengthDelimited)
		var4212, var4213 = protoModule.writeBuffer(var4212, var4213, var4211, buffer.len(var4211))
		buff = var4212
		var4204 = var4213
	end
	if self.purchase_analytics_metadata ~= nil then
		local var4214 = self.purchase_analytics_metadata:encode()
		local var4215, var4216 = protoModule.writeTag(buff, var4204, 4, protoModule.wireTypes.lengthDelimited)
		var4215, var4216 = protoModule.writeBuffer(var4215, var4216, var4214, buffer.len(var4214))
		buff = var4215
		var4204 = var4216
	end
	if self.root_place_id ~= nil then
		local var4217 = self.root_place_id:encode()
		local var4218, var4219 = protoModule.writeTag(buff, var4204, 5, protoModule.wireTypes.lengthDelimited)
		var4218, var4219 = protoModule.writeBuffer(var4218, var4219, var4217, buffer.len(var4217))
		buff = var4218
		var4204 = var4219
	end
	local buff_1 = buffer.create(var4204)
	buffer.copy(buff_1, 0, buff, 0, var4204)
	
	return buff_1
end

function t_125.decode(p246) --[[ line: 24303 ]]
	-- upvalues: t_125 (ref), protoModule (ref), t (ref), propTypesModule (ref)
	local var4221 = t_125.new()
	local var4222 = 0
	while var4222 < buffer.len(p246) do
		local _ = nil
		local var4223 = nil
		local var4224, var4225, var4226 = protoModule.readTag(p246, var4222)
		local var4227 = var4224
		var4223 = var4225
		var4222 = var4226
		
		if var4223 == protoModule.wireTypes.varint then
			local _ = nil
			local var4228, var4229 = protoModule.readVarInt(p246, var4222)
			local _ = var4228
			var4222 = var4229
			continue
		end
		if var4223 == protoModule.wireTypes.lengthDelimited then
			if var4227 == 1 then
				local _ = nil
				local var4230, var4231 = protoModule.readBuffer(p246, var4222)
				var4222 = var4231
				var4221.product_payload = t.OpenPurchasePromptAction_ProductPayload.decode(var4230)
			elseif var4227 == 2 then
				local _ = nil
				local var4232, var4233 = protoModule.readBuffer(p246, var4222)
				var4222 = var4233
				var4221.display_info = t.OpenPurchasePromptAction_DisplayInfo.decode(var4232)
			elseif var4227 == 3 then
				local _ = nil
				local var4234, var4235 = protoModule.readBuffer(p246, var4222)
				var4222 = var4235
				var4221.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.decode(var4234)
			elseif var4227 == 4 then
				local _ = nil
				local var4236, var4237 = protoModule.readBuffer(p246, var4222)
				var4222 = var4237
				var4221.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.decode(var4236)
			elseif var4227 == 5 then
				local _ = nil
				local var4238, var4239 = protoModule.readBuffer(p246, var4222)
				var4222 = var4239
				var4221.root_place_id = propTypesModule.StringProp.decode(var4238)
			else
				local _ = nil
				local var4240, var4241 = protoModule.readVarInt(p246, var4222)
				var4222 = var4241 + var4240
			end
		elseif var4223 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4242, var4243 = protoModule.readFixed32(p246, var4222)
			local _ = var4242
			var4222 = var4243
		elseif var4223 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4244, var4245 = protoModule.readFixed64(p246, var4222)
			local _ = var4244
			var4222 = var4245
		else
			error("Unsupported wire type: " .. var4223)
		end
	end
	return var4221
end

function t_125:jsonEncode() --[[ line: 24367 ]]
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

function t_125:jsonDecode() --[[ line: 24393 ]]
	-- upvalues: t_125 (ref), t (ref), propTypesModule (ref)
	local var4247 = t_125.new()
	
	if self.product_payload ~= nil then
		var4247.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.product_payload)
	end
	if self.productPayload ~= nil then
		var4247.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.productPayload)
	end
	if self.display_info ~= nil then
		var4247.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.display_info)
	end
	if self.displayInfo ~= nil then
		var4247.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.displayInfo)
	end
	if self.purchase_options ~= nil then
		var4247.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchase_options)
	end
	if self.purchaseOptions ~= nil then
		var4247.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchaseOptions)
	end
	if self.purchase_analytics_metadata ~= nil then
		var4247.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchase_analytics_metadata)
	end
	if self.purchaseAnalyticsMetadata ~= nil then
		var4247.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchaseAnalyticsMetadata)
	end
	if self.root_place_id ~= nil then
		var4247.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var4247.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var4247
end

t_125.descriptor = {
	name = "OpenPurchasePromptAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenPurchasePromptAction_Params = t_125
typeRegistryModule.default:register(t.OpenPurchasePromptAction_Params)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p247) --[[ line: 24458 ]]
	-- upvalues: t (ref), t_126 (ref)
	return setmetatable({
		action_type = if p247 == nil or p247.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p247.action_type,
		action_params = if p247 == nil or p247.action_params == nil then nil else p247.action_params
	}, t_126)
end

function t_126:encode() --[[ line: 24469 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4249 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4250, var4251 = protoModule.writeTag(buff, var4249, 1, protoModule.wireTypes.varint)
		var4250, var4251 = protoModule.writeVarInt(var4250, var4251, t.ActionType.toNumber(self.action_type))
		buff = var4250
		var4249 = var4251
	end
	if self.action_params ~= nil then
		local var4252 = self.action_params:encode()
		local var4253, var4254 = protoModule.writeTag(buff, var4249, 2, protoModule.wireTypes.lengthDelimited)
		var4253, var4254 = protoModule.writeBuffer(var4253, var4254, var4252, buffer.len(var4252))
		buff = var4253
		var4249 = var4254
	end
	local buff_1 = buffer.create(var4249)
	buffer.copy(buff_1, 0, buff, 0, var4249)
	
	return buff_1
end

function t_126.decode(p248) --[[ line: 24495 ]]
	-- upvalues: t_126 (ref), protoModule (ref), t (ref)
	local var4256 = t_126.new()
	local var4257 = 0
	while var4257 < buffer.len(p248) do
		local _ = nil
		local var4258 = nil
		local var4259, var4260, var4261 = protoModule.readTag(p248, var4257)
		local var4262 = var4259
		var4258 = var4260
		var4257 = var4261
		
		if var4258 == protoModule.wireTypes.varint then
			if var4262 == 1 then
				local _ = nil
				local var4263, var4264 = protoModule.readVarIntI32(p248, var4257)
				local var4265 = var4263
				var4257 = var4264
				var4256.action_type = t.ActionType.fromNumber(var4265) or var4265
			else
				local _ = nil
				local var4266, var4267 = protoModule.readVarInt(p248, var4257)
				local _ = var4266
				var4257 = var4267
			end
		end
		if var4258 == protoModule.wireTypes.lengthDelimited then
			if var4262 == 2 then
				local _ = nil
				local var4268, var4269 = protoModule.readBuffer(p248, var4257)
				var4257 = var4269
				var4256.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.decode(var4268)
			else
				local _ = nil
				local var4270, var4271 = protoModule.readVarInt(p248, var4257)
				var4257 = var4271 + var4270
			end
		elseif var4258 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4272, var4273 = protoModule.readFixed32(p248, var4257)
			local _ = var4272
			var4257 = var4273
		elseif var4258 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4274, var4275 = protoModule.readFixed64(p248, var4257)
			local _ = var4274
			var4257 = var4275
		else
			error("Unsupported wire type: " .. var4258)
		end
	end
	return var4256
end

function t_126:jsonEncode() --[[ line: 24543 ]]
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

function t_126:jsonDecode() --[[ line: 24565 ]]
	-- upvalues: t_126 (ref), t (ref)
	local var4277 = t_126.new()
	
	if self.action_type ~= nil then
		var4277.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4277.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4277.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4277.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.actionParams)
	end
	return var4277
end

t_126.descriptor = {
	name = "ReportSurfaceLoadTimeMilestoneAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ReportSurfaceLoadTimeMilestoneAction"
}
t.ReportSurfaceLoadTimeMilestoneAction = t_126
typeRegistryModule.default:register(t.ReportSurfaceLoadTimeMilestoneAction)
local t_127 = {}
t_127.__index = t_127

function t_127.new(p249) --[[ line: 24607 ]]
	-- upvalues: t_127 (ref)
	return setmetatable({
		milestone = if p249 == nil or p249.milestone == nil then nil else p249.milestone,
		metadata = if p249 == nil or p249.metadata == nil then nil else p249.metadata
	}, t_127)
end

function t_127:encode() --[[ line: 24616 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4279 = 0
	
	if self.milestone ~= nil then
		local var4280 = self.milestone:encode()
		local var4281, var4282 = protoModule.writeTag(buff, var4279, 1, protoModule.wireTypes.lengthDelimited)
		var4281, var4282 = protoModule.writeBuffer(var4281, var4282, var4280, buffer.len(var4280))
		buff = var4281
		var4279 = var4282
	end
	if self.metadata ~= nil then
		local var4283 = self.metadata:encode()
		local var4284, var4285 = protoModule.writeTag(buff, var4279, 3, protoModule.wireTypes.lengthDelimited)
		var4284, var4285 = protoModule.writeBuffer(var4284, var4285, var4283, buffer.len(var4283))
		buff = var4284
		var4279 = var4285
	end
	local buff_1 = buffer.create(var4279)
	buffer.copy(buff_1, 0, buff, 0, var4279)
	
	return buff_1
end

function t_127.decode(p250) --[[ line: 24639 ]]
	-- upvalues: t_127 (ref), protoModule (ref), propTypesModule (ref)
	local var4287 = t_127.new()
	local var4288 = 0
	while var4288 < buffer.len(p250) do
		local _ = nil
		local var4289 = nil
		local var4290, var4291, var4292 = protoModule.readTag(p250, var4288)
		local var4293 = var4290
		var4289 = var4291
		var4288 = var4292
		
		if var4289 == protoModule.wireTypes.varint then
			local _ = nil
			local var4294, var4295 = protoModule.readVarInt(p250, var4288)
			local _ = var4294
			var4288 = var4295
			continue
		end
		if var4289 == protoModule.wireTypes.lengthDelimited then
			if var4293 == 1 then
				local _ = nil
				local var4296, var4297 = protoModule.readBuffer(p250, var4288)
				var4288 = var4297
				var4287.milestone = propTypesModule.StringProp.decode(var4296)
			elseif var4293 == 3 then
				local _ = nil
				local var4298, var4299 = protoModule.readBuffer(p250, var4288)
				var4288 = var4299
				var4287.metadata = propTypesModule.StructProp.decode(var4298)
			else
				local _ = nil
				local var4300, var4301 = protoModule.readVarInt(p250, var4288)
				var4288 = var4301 + var4300
			end
		elseif var4289 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4302, var4303 = protoModule.readFixed32(p250, var4288)
			local _ = var4302
			var4288 = var4303
		elseif var4289 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4304, var4305 = protoModule.readFixed64(p250, var4288)
			local _ = var4304
			var4288 = var4305
		else
			error("Unsupported wire type: " .. var4289)
		end
	end
	return var4287
end

function t_127:jsonEncode() --[[ line: 24689 ]]
	local t = {}
	
	if self.milestone ~= nil then
		t.milestone = self.milestone:jsonEncode()
	end
	if self.metadata ~= nil then
		t.metadata = self.metadata:jsonEncode()
	end
	return t
end

function t_127:jsonDecode() --[[ line: 24705 ]]
	-- upvalues: t_127 (ref), propTypesModule (ref)
	local var4307 = t_127.new()
	
	if self.milestone ~= nil then
		var4307.milestone = propTypesModule.StringProp.jsonDecode(self.milestone)
	end
	if self.metadata ~= nil then
		var4307.metadata = propTypesModule.StructProp.jsonDecode(self.metadata)
	end
	return var4307
end

t_127.descriptor = {
	name = "ReportSurfaceLoadTimeMilestoneAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ReportSurfaceLoadTimeMilestoneAction_Params = t_127
typeRegistryModule.default:register(t.ReportSurfaceLoadTimeMilestoneAction_Params)
local t_128 = {}
t_128.__index = t_128

function t_128.new(p251) --[[ line: 24735 ]]
	-- upvalues: t (ref), t_128 (ref)
	return setmetatable({
		action_type = if p251 == nil or p251.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p251.action_type,
		action_params = if p251 == nil or p251.action_params == nil then nil else p251.action_params
	}, t_128)
end

function t_128:encode() --[[ line: 24746 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4309 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4310, var4311 = protoModule.writeTag(buff, var4309, 1, protoModule.wireTypes.varint)
		var4310, var4311 = protoModule.writeVarInt(var4310, var4311, t.ActionType.toNumber(self.action_type))
		buff = var4310
		var4309 = var4311
	end
	if self.action_params ~= nil then
		local var4312 = self.action_params:encode()
		local var4313, var4314 = protoModule.writeTag(buff, var4309, 2, protoModule.wireTypes.lengthDelimited)
		var4313, var4314 = protoModule.writeBuffer(var4313, var4314, var4312, buffer.len(var4312))
		buff = var4313
		var4309 = var4314
	end
	local buff_1 = buffer.create(var4309)
	buffer.copy(buff_1, 0, buff, 0, var4309)
	
	return buff_1
end

function t_128.decode(p252) --[[ line: 24772 ]]
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var4316 = t_128.new()
	local var4317 = 0
	while var4317 < buffer.len(p252) do
		local _ = nil
		local var4318 = nil
		local var4319, var4320, var4321 = protoModule.readTag(p252, var4317)
		local var4322 = var4319
		var4318 = var4320
		var4317 = var4321
		
		if var4318 == protoModule.wireTypes.varint then
			if var4322 == 1 then
				local _ = nil
				local var4323, var4324 = protoModule.readVarIntI32(p252, var4317)
				local var4325 = var4323
				var4317 = var4324
				var4316.action_type = t.ActionType.fromNumber(var4325) or var4325
			else
				local _ = nil
				local var4326, var4327 = protoModule.readVarInt(p252, var4317)
				local _ = var4326
				var4317 = var4327
			end
		end
		if var4318 == protoModule.wireTypes.lengthDelimited then
			if var4322 == 2 then
				local _ = nil
				local var4328, var4329 = protoModule.readBuffer(p252, var4317)
				var4317 = var4329
				var4316.action_params = t.DismissGameFeedbackAction_Params.decode(var4328)
			else
				local _ = nil
				local var4330, var4331 = protoModule.readVarInt(p252, var4317)
				var4317 = var4331 + var4330
			end
		elseif var4318 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4332, var4333 = protoModule.readFixed32(p252, var4317)
			local _ = var4332
			var4317 = var4333
		elseif var4318 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4334, var4335 = protoModule.readFixed64(p252, var4317)
			local _ = var4334
			var4317 = var4335
		else
			error("Unsupported wire type: " .. var4318)
		end
	end
	return var4316
end

function t_128:jsonEncode() --[[ line: 24820 ]]
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

function t_128:jsonDecode() --[[ line: 24842 ]]
	-- upvalues: t_128 (ref), t (ref)
	local var4337 = t_128.new()
	
	if self.action_type ~= nil then
		var4337.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4337.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4337.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4337.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return var4337
end

t_128.descriptor = {
	name = "DismissGameFeedbackAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissGameFeedbackAction"
}
t.DismissGameFeedbackAction = t_128
typeRegistryModule.default:register(t.DismissGameFeedbackAction)
local t_129 = {}
t_129.__index = t_129

function t_129.new(p253) --[[ line: 24882 ]]
	-- upvalues: t_129 (ref)
	return setmetatable({
		root_place_id = if p253 == nil or p253.root_place_id == nil then nil else p253.root_place_id
	}, t_129)
end

function t_129:encode() --[[ line: 24890 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4339 = 0
	
	if self.root_place_id ~= nil then
		local var4340 = self.root_place_id:encode()
		local var4341, var4342 = protoModule.writeTag(buff, var4339, 1, protoModule.wireTypes.lengthDelimited)
		var4341, var4342 = protoModule.writeBuffer(var4341, var4342, var4340, buffer.len(var4340))
		buff = var4341
		var4339 = var4342
	end
	local buff_1 = buffer.create(var4339)
	buffer.copy(buff_1, 0, buff, 0, var4339)
	
	return buff_1
end

function t_129.decode(p254) --[[ line: 24905 ]]
	-- upvalues: t_129 (ref), protoModule (ref), propTypesModule (ref)
	local var4344 = t_129.new()
	local var4345 = 0
	while var4345 < buffer.len(p254) do
		local _ = nil
		local var4346 = nil
		local var4347, var4348, var4349 = protoModule.readTag(p254, var4345)
		local var4350 = var4347
		var4346 = var4348
		var4345 = var4349
		
		if var4346 == protoModule.wireTypes.varint then
			local _ = nil
			local var4351, var4352 = protoModule.readVarInt(p254, var4345)
			local _ = var4351
			var4345 = var4352
			continue
		end
		if var4346 == protoModule.wireTypes.lengthDelimited then
			if var4350 == 1 then
				local _ = nil
				local var4353, var4354 = protoModule.readBuffer(p254, var4345)
				var4345 = var4354
				var4344.root_place_id = propTypesModule.StringProp.decode(var4353)
			else
				local _ = nil
				local var4355, var4356 = protoModule.readVarInt(p254, var4345)
				var4345 = var4356 + var4355
			end
		elseif var4346 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4357, var4358 = protoModule.readFixed32(p254, var4345)
			local _ = var4357
			var4345 = var4358
		elseif var4346 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4359, var4360 = protoModule.readFixed64(p254, var4345)
			local _ = var4359
			var4345 = var4360
		else
			error("Unsupported wire type: " .. var4346)
		end
	end
	return var4344
end

function t_129:jsonEncode() --[[ line: 24948 ]]
	local t = {}
	
	if self.root_place_id ~= nil then
		t.rootPlaceId = self.root_place_id:jsonEncode()
	end
	return t
end

function t_129:jsonDecode() --[[ line: 24958 ]]
	-- upvalues: t_129 (ref), propTypesModule (ref)
	local var4362 = t_129.new()
	
	if self.root_place_id ~= nil then
		var4362.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var4362.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var4362
end

t_129.descriptor = {
	name = "DismissGameFeedbackAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissGameFeedbackAction_Params = t_129
typeRegistryModule.default:register(t.DismissGameFeedbackAction_Params)
local t_130 = {}
t_130.__index = t_130

function t_130.new(p255) --[[ line: 24990 ]]
	-- upvalues: t (ref), t_130 (ref)
	return setmetatable({
		action_type = if p255 == nil or p255.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p255.action_type,
		action_params = if p255 == nil or p255.action_params == nil then nil else p255.action_params
	}, t_130)
end

function t_130:encode() --[[ line: 25001 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4364 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4365, var4366 = protoModule.writeTag(buff, var4364, 1, protoModule.wireTypes.varint)
		var4365, var4366 = protoModule.writeVarInt(var4365, var4366, t.ActionType.toNumber(self.action_type))
		buff = var4365
		var4364 = var4366
	end
	if self.action_params ~= nil then
		local var4367 = self.action_params:encode()
		local var4368, var4369 = protoModule.writeTag(buff, var4364, 2, protoModule.wireTypes.lengthDelimited)
		var4368, var4369 = protoModule.writeBuffer(var4368, var4369, var4367, buffer.len(var4367))
		buff = var4368
		var4364 = var4369
	end
	local buff_1 = buffer.create(var4364)
	buffer.copy(buff_1, 0, buff, 0, var4364)
	
	return buff_1
end

function t_130.decode(p256) --[[ line: 25027 ]]
	-- upvalues: t_130 (ref), protoModule (ref), t (ref)
	local var4371 = t_130.new()
	local var4372 = 0
	while var4372 < buffer.len(p256) do
		local _ = nil
		local var4373 = nil
		local var4374, var4375, var4376 = protoModule.readTag(p256, var4372)
		local var4377 = var4374
		var4373 = var4375
		var4372 = var4376
		
		if var4373 == protoModule.wireTypes.varint then
			if var4377 == 1 then
				local _ = nil
				local var4378, var4379 = protoModule.readVarIntI32(p256, var4372)
				local var4380 = var4378
				var4372 = var4379
				var4371.action_type = t.ActionType.fromNumber(var4380) or var4380
			else
				local _ = nil
				local var4381, var4382 = protoModule.readVarInt(p256, var4372)
				local _ = var4381
				var4372 = var4382
			end
		end
		if var4373 == protoModule.wireTypes.lengthDelimited then
			if var4377 == 2 then
				local _ = nil
				local var4383, var4384 = protoModule.readBuffer(p256, var4372)
				var4372 = var4384
				var4371.action_params = t.OpenGameFeedbackFormAction_Params.decode(var4383)
			else
				local _ = nil
				local var4385, var4386 = protoModule.readVarInt(p256, var4372)
				var4372 = var4386 + var4385
			end
		elseif var4373 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4387, var4388 = protoModule.readFixed32(p256, var4372)
			local _ = var4387
			var4372 = var4388
		elseif var4373 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4389, var4390 = protoModule.readFixed64(p256, var4372)
			local _ = var4389
			var4372 = var4390
		else
			error("Unsupported wire type: " .. var4373)
		end
	end
	return var4371
end

function t_130:jsonEncode() --[[ line: 25075 ]]
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

function t_130:jsonDecode() --[[ line: 25097 ]]
	-- upvalues: t_130 (ref), t (ref)
	local var4392 = t_130.new()
	
	if self.action_type ~= nil then
		var4392.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4392.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4392.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4392.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.actionParams)
	end
	return var4392
end

t_130.descriptor = {
	name = "OpenGameFeedbackFormAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameFeedbackFormAction"
}
t.OpenGameFeedbackFormAction = t_130
typeRegistryModule.default:register(t.OpenGameFeedbackFormAction)
local t_131 = {}
t_131.__index = t_131

function t_131.new(p257) --[[ line: 25137 ]]
	-- upvalues: t_131 (ref)
	return setmetatable({
		universe_id = if p257 == nil or p257.universe_id == nil then nil else p257.universe_id,
		root_place_id = if p257 == nil or p257.root_place_id == nil then nil else p257.root_place_id
	}, t_131)
end

function t_131:encode() --[[ line: 25146 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4394 = 0
	
	if self.universe_id ~= nil then
		local var4395 = self.universe_id:encode()
		local var4396, var4397 = protoModule.writeTag(buff, var4394, 1, protoModule.wireTypes.lengthDelimited)
		var4396, var4397 = protoModule.writeBuffer(var4396, var4397, var4395, buffer.len(var4395))
		buff = var4396
		var4394 = var4397
	end
	if self.root_place_id ~= nil then
		local var4398 = self.root_place_id:encode()
		local var4399, var4400 = protoModule.writeTag(buff, var4394, 2, protoModule.wireTypes.lengthDelimited)
		var4399, var4400 = protoModule.writeBuffer(var4399, var4400, var4398, buffer.len(var4398))
		buff = var4399
		var4394 = var4400
	end
	local buff_1 = buffer.create(var4394)
	buffer.copy(buff_1, 0, buff, 0, var4394)
	
	return buff_1
end

function t_131.decode(p258) --[[ line: 25167 ]]
	-- upvalues: t_131 (ref), protoModule (ref), propTypesModule (ref)
	local var4402 = t_131.new()
	local var4403 = 0
	while var4403 < buffer.len(p258) do
		local _ = nil
		local var4404 = nil
		local var4405, var4406, var4407 = protoModule.readTag(p258, var4403)
		local var4408 = var4405
		var4404 = var4406
		var4403 = var4407
		
		if var4404 == protoModule.wireTypes.varint then
			local _ = nil
			local var4409, var4410 = protoModule.readVarInt(p258, var4403)
			local _ = var4409
			var4403 = var4410
			continue
		end
		if var4404 == protoModule.wireTypes.lengthDelimited then
			if var4408 == 1 then
				local _ = nil
				local var4411, var4412 = protoModule.readBuffer(p258, var4403)
				var4403 = var4412
				var4402.universe_id = propTypesModule.StringProp.decode(var4411)
			elseif var4408 == 2 then
				local _ = nil
				local var4413, var4414 = protoModule.readBuffer(p258, var4403)
				var4403 = var4414
				var4402.root_place_id = propTypesModule.StringProp.decode(var4413)
			else
				local _ = nil
				local var4415, var4416 = protoModule.readVarInt(p258, var4403)
				var4403 = var4416 + var4415
			end
		elseif var4404 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4417, var4418 = protoModule.readFixed32(p258, var4403)
			local _ = var4417
			var4403 = var4418
		elseif var4404 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4419, var4420 = protoModule.readFixed64(p258, var4403)
			local _ = var4419
			var4403 = var4420
		else
			error("Unsupported wire type: " .. var4404)
		end
	end
	return var4402
end

function t_131:jsonEncode() --[[ line: 25215 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.root_place_id ~= nil then
		t.rootPlaceId = self.root_place_id:jsonEncode()
	end
	return t
end

function t_131:jsonDecode() --[[ line: 25229 ]]
	-- upvalues: t_131 (ref), propTypesModule (ref)
	local var4422 = t_131.new()
	
	if self.universe_id ~= nil then
		var4422.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var4422.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		var4422.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var4422.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var4422
end

t_131.descriptor = {
	name = "OpenGameFeedbackFormAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameFeedbackFormAction_Params = t_131
typeRegistryModule.default:register(t.OpenGameFeedbackFormAction_Params)
local t_132 = {}
t_132.__index = t_132

function t_132.new(p259) --[[ line: 25270 ]]
	-- upvalues: t (ref), t_132 (ref)
	return setmetatable({
		action_type = if p259 == nil or p259.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p259.action_type,
		action_params = if p259 == nil or p259.action_params == nil then nil else p259.action_params
	}, t_132)
end

function t_132:encode() --[[ line: 25279 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4424 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4425, var4426 = protoModule.writeTag(buff, var4424, 1, protoModule.wireTypes.varint)
		var4425, var4426 = protoModule.writeVarInt(var4425, var4426, t.ActionType.toNumber(self.action_type))
		buff = var4425
		var4424 = var4426
	end
	if self.action_params ~= nil then
		local var4427 = self.action_params:encode()
		local var4428, var4429 = protoModule.writeTag(buff, var4424, 2, protoModule.wireTypes.lengthDelimited)
		var4428, var4429 = protoModule.writeBuffer(var4428, var4429, var4427, buffer.len(var4427))
		buff = var4428
		var4424 = var4429
	end
	local buff_1 = buffer.create(var4424)
	buffer.copy(buff_1, 0, buff, 0, var4424)
	
	return buff_1
end

function t_132.decode(p260) --[[ line: 25305 ]]
	-- upvalues: t_132 (ref), protoModule (ref), t (ref)
	local var4431 = t_132.new()
	local var4432 = 0
	while var4432 < buffer.len(p260) do
		local _ = nil
		local var4433 = nil
		local var4434, var4435, var4436 = protoModule.readTag(p260, var4432)
		local var4437 = var4434
		var4433 = var4435
		var4432 = var4436
		
		if var4433 == protoModule.wireTypes.varint then
			if var4437 == 1 then
				local _ = nil
				local var4438, var4439 = protoModule.readVarIntI32(p260, var4432)
				local var4440 = var4438
				var4432 = var4439
				var4431.action_type = t.ActionType.fromNumber(var4440) or var4440
			else
				local _ = nil
				local var4441, var4442 = protoModule.readVarInt(p260, var4432)
				local _ = var4441
				var4432 = var4442
			end
		end
		if var4433 == protoModule.wireTypes.lengthDelimited then
			if var4437 == 2 then
				local _ = nil
				local var4443, var4444 = protoModule.readBuffer(p260, var4432)
				var4432 = var4444
				var4431.action_params = t.AiOverviewFeedbackAction_Params.decode(var4443)
			else
				local _ = nil
				local var4445, var4446 = protoModule.readVarInt(p260, var4432)
				var4432 = var4446 + var4445
			end
		elseif var4433 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4447, var4448 = protoModule.readFixed32(p260, var4432)
			local _ = var4447
			var4432 = var4448
		elseif var4433 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4449, var4450 = protoModule.readFixed64(p260, var4432)
			local _ = var4449
			var4432 = var4450
		else
			error("Unsupported wire type: " .. var4433)
		end
	end
	return var4431
end

function t_132:jsonEncode() --[[ line: 25353 ]]
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

function t_132:jsonDecode() --[[ line: 25375 ]]
	-- upvalues: t_132 (ref), t (ref)
	local var4452 = t_132.new()
	
	if self.action_type ~= nil then
		var4452.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4452.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4452.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4452.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return var4452
end

t_132.descriptor = {
	name = "AiOverviewFeedbackAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.AiOverviewFeedbackAction"
}
t.AiOverviewFeedbackAction = t_132
typeRegistryModule.default:register(t.AiOverviewFeedbackAction)
local t_133 = {}
t_133.__index = t_133

function t_133.new(p261) --[[ line: 25415 ]]
	-- upvalues: t_133 (ref)
	return setmetatable({
		sentiment = if p261 == nil or p261.sentiment == nil then nil else p261.sentiment,
		dialog_title = if p261 == nil or p261.dialog_title == nil then nil else p261.dialog_title,
		dialog_text = if p261 == nil or p261.dialog_text == nil then nil else p261.dialog_text,
		placeholder_text = if p261 == nil or p261.placeholder_text == nil then nil else p261.placeholder_text
	}, t_133)
end

function t_133:encode() --[[ line: 25426 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4454 = 0
	
	if self.sentiment ~= nil then
		local var4455 = self.sentiment:encode()
		local var4456, var4457 = protoModule.writeTag(buff, var4454, 1, protoModule.wireTypes.lengthDelimited)
		var4456, var4457 = protoModule.writeBuffer(var4456, var4457, var4455, buffer.len(var4455))
		buff = var4456
		var4454 = var4457
	end
	if self.dialog_title ~= nil then
		local var4458 = self.dialog_title:encode()
		local var4459, var4460 = protoModule.writeTag(buff, var4454, 2, protoModule.wireTypes.lengthDelimited)
		var4459, var4460 = protoModule.writeBuffer(var4459, var4460, var4458, buffer.len(var4458))
		buff = var4459
		var4454 = var4460
	end
	if self.dialog_text ~= nil then
		local var4461 = self.dialog_text:encode()
		local var4462, var4463 = protoModule.writeTag(buff, var4454, 3, protoModule.wireTypes.lengthDelimited)
		var4462, var4463 = protoModule.writeBuffer(var4462, var4463, var4461, buffer.len(var4461))
		buff = var4462
		var4454 = var4463
	end
	if self.placeholder_text ~= nil then
		local var4464 = self.placeholder_text:encode()
		local var4465, var4466 = protoModule.writeTag(buff, var4454, 4, protoModule.wireTypes.lengthDelimited)
		var4465, var4466 = protoModule.writeBuffer(var4465, var4466, var4464, buffer.len(var4464))
		buff = var4465
		var4454 = var4466
	end
	local buff_1 = buffer.create(var4454)
	buffer.copy(buff_1, 0, buff, 0, var4454)
	
	return buff_1
end

function t_133.decode(p262) --[[ line: 25459 ]]
	-- upvalues: t_133 (ref), protoModule (ref), propTypesModule (ref)
	local var4468 = t_133.new()
	local var4469 = 0
	while var4469 < buffer.len(p262) do
		local _ = nil
		local var4470 = nil
		local var4471, var4472, var4473 = protoModule.readTag(p262, var4469)
		local var4474 = var4471
		var4470 = var4472
		var4469 = var4473
		
		if var4470 == protoModule.wireTypes.varint then
			local _ = nil
			local var4475, var4476 = protoModule.readVarInt(p262, var4469)
			local _ = var4475
			var4469 = var4476
			continue
		end
		if var4470 == protoModule.wireTypes.lengthDelimited then
			if var4474 == 1 then
				local _ = nil
				local var4477, var4478 = protoModule.readBuffer(p262, var4469)
				var4469 = var4478
				var4468.sentiment = propTypesModule.StringProp.decode(var4477)
			elseif var4474 == 2 then
				local _ = nil
				local var4479, var4480 = protoModule.readBuffer(p262, var4469)
				var4469 = var4480
				var4468.dialog_title = propTypesModule.StringProp.decode(var4479)
			elseif var4474 == 3 then
				local _ = nil
				local var4481, var4482 = protoModule.readBuffer(p262, var4469)
				var4469 = var4482
				var4468.dialog_text = propTypesModule.StringProp.decode(var4481)
			elseif var4474 == 4 then
				local _ = nil
				local var4483, var4484 = protoModule.readBuffer(p262, var4469)
				var4469 = var4484
				var4468.placeholder_text = propTypesModule.StringProp.decode(var4483)
			else
				local _ = nil
				local var4485, var4486 = protoModule.readVarInt(p262, var4469)
				var4469 = var4486 + var4485
			end
		elseif var4470 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4487, var4488 = protoModule.readFixed32(p262, var4469)
			local _ = var4487
			var4469 = var4488
		elseif var4470 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4489, var4490 = protoModule.readFixed64(p262, var4469)
			local _ = var4489
			var4469 = var4490
		else
			error("Unsupported wire type: " .. var4470)
		end
	end
	return var4468
end

function t_133:jsonEncode() --[[ line: 25517 ]]
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

function t_133:jsonDecode() --[[ line: 25539 ]]
	-- upvalues: t_133 (ref), propTypesModule (ref)
	local var4492 = t_133.new()
	
	if self.sentiment ~= nil then
		var4492.sentiment = propTypesModule.StringProp.jsonDecode(self.sentiment)
	end
	if self.dialog_title ~= nil then
		var4492.dialog_title = propTypesModule.StringProp.jsonDecode(self.dialog_title)
	end
	if self.dialogTitle ~= nil then
		var4492.dialog_title = propTypesModule.StringProp.jsonDecode(self.dialogTitle)
	end
	if self.dialog_text ~= nil then
		var4492.dialog_text = propTypesModule.StringProp.jsonDecode(self.dialog_text)
	end
	if self.dialogText ~= nil then
		var4492.dialog_text = propTypesModule.StringProp.jsonDecode(self.dialogText)
	end
	if self.placeholder_text ~= nil then
		var4492.placeholder_text = propTypesModule.StringProp.jsonDecode(self.placeholder_text)
	end
	if self.placeholderText ~= nil then
		var4492.placeholder_text = propTypesModule.StringProp.jsonDecode(self.placeholderText)
	end
	return var4492
end

t_133.descriptor = {
	name = "AiOverviewFeedbackAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.AiOverviewFeedbackAction_Params = t_133
typeRegistryModule.default:register(t.AiOverviewFeedbackAction_Params)
local t_134 = {}
t_134.__index = t_134

function t_134.new(p263) --[[ line: 25592 ]]
	-- upvalues: t (ref), t_134 (ref)
	return setmetatable({
		action_type = if p263 == nil or p263.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p263.action_type,
		action_params = if p263 == nil or p263.action_params == nil then nil else p263.action_params
	}, t_134)
end

function t_134:encode() --[[ line: 25603 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4494 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4495, var4496 = protoModule.writeTag(buff, var4494, 1, protoModule.wireTypes.varint)
		var4495, var4496 = protoModule.writeVarInt(var4495, var4496, t.ActionType.toNumber(self.action_type))
		buff = var4495
		var4494 = var4496
	end
	if self.action_params ~= nil then
		local var4497 = self.action_params:encode()
		local var4498, var4499 = protoModule.writeTag(buff, var4494, 2, protoModule.wireTypes.lengthDelimited)
		var4498, var4499 = protoModule.writeBuffer(var4498, var4499, var4497, buffer.len(var4497))
		buff = var4498
		var4494 = var4499
	end
	local buff_1 = buffer.create(var4494)
	buffer.copy(buff_1, 0, buff, 0, var4494)
	
	return buff_1
end

function t_134.decode(p264) --[[ line: 25629 ]]
	-- upvalues: t_134 (ref), protoModule (ref), t (ref)
	local var4501 = t_134.new()
	local var4502 = 0
	while var4502 < buffer.len(p264) do
		local _ = nil
		local var4503 = nil
		local var4504, var4505, var4506 = protoModule.readTag(p264, var4502)
		local var4507 = var4504
		var4503 = var4505
		var4502 = var4506
		
		if var4503 == protoModule.wireTypes.varint then
			if var4507 == 1 then
				local _ = nil
				local var4508, var4509 = protoModule.readVarIntI32(p264, var4502)
				local var4510 = var4508
				var4502 = var4509
				var4501.action_type = t.ActionType.fromNumber(var4510) or var4510
			else
				local _ = nil
				local var4511, var4512 = protoModule.readVarInt(p264, var4502)
				local _ = var4511
				var4502 = var4512
			end
		end
		if var4503 == protoModule.wireTypes.lengthDelimited then
			if var4507 == 2 then
				local _ = nil
				local var4513, var4514 = protoModule.readBuffer(p264, var4502)
				var4502 = var4514
				var4501.action_params = t.EnableEventNotificationsAction_Params.decode(var4513)
			else
				local _ = nil
				local var4515, var4516 = protoModule.readVarInt(p264, var4502)
				var4502 = var4516 + var4515
			end
		elseif var4503 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4517, var4518 = protoModule.readFixed32(p264, var4502)
			local _ = var4517
			var4502 = var4518
		elseif var4503 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4519, var4520 = protoModule.readFixed64(p264, var4502)
			local _ = var4519
			var4502 = var4520
		else
			error("Unsupported wire type: " .. var4503)
		end
	end
	return var4501
end

function t_134:jsonEncode() --[[ line: 25677 ]]
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

function t_134:jsonDecode() --[[ line: 25699 ]]
	-- upvalues: t_134 (ref), t (ref)
	local var4522 = t_134.new()
	
	if self.action_type ~= nil then
		var4522.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4522.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4522.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4522.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.actionParams)
	end
	return var4522
end

t_134.descriptor = {
	name = "EnableEventNotificationsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.EnableEventNotificationsAction"
}
t.EnableEventNotificationsAction = t_134
typeRegistryModule.default:register(t.EnableEventNotificationsAction)
local t_135 = {}
t_135.__index = t_135

function t_135.new(p265) --[[ line: 25739 ]]
	-- upvalues: t_135 (ref)
	return setmetatable({
		event_id = if p265 == nil or p265.event_id == nil then nil else p265.event_id,
		universe_id = if p265 == nil or p265.universe_id == nil then nil else p265.universe_id,
		channel = if p265 == nil or p265.channel == nil then nil else p265.channel
	}, t_135)
end

function t_135:encode() --[[ line: 25749 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4524 = 0
	
	if self.event_id ~= nil then
		local var4525 = self.event_id:encode()
		local var4526, var4527 = protoModule.writeTag(buff, var4524, 1, protoModule.wireTypes.lengthDelimited)
		var4526, var4527 = protoModule.writeBuffer(var4526, var4527, var4525, buffer.len(var4525))
		buff = var4526
		var4524 = var4527
	end
	if self.universe_id ~= nil then
		local var4528 = self.universe_id:encode()
		local var4529, var4530 = protoModule.writeTag(buff, var4524, 2, protoModule.wireTypes.lengthDelimited)
		var4529, var4530 = protoModule.writeBuffer(var4529, var4530, var4528, buffer.len(var4528))
		buff = var4529
		var4524 = var4530
	end
	if self.channel ~= nil then
		local var4531 = self.channel:encode()
		local var4532, var4533 = protoModule.writeTag(buff, var4524, 3, protoModule.wireTypes.lengthDelimited)
		var4532, var4533 = protoModule.writeBuffer(var4532, var4533, var4531, buffer.len(var4531))
		buff = var4532
		var4524 = var4533
	end
	local buff_1 = buffer.create(var4524)
	buffer.copy(buff_1, 0, buff, 0, var4524)
	
	return buff_1
end

function t_135.decode(p266) --[[ line: 25776 ]]
	-- upvalues: t_135 (ref), protoModule (ref), propTypesModule (ref)
	local var4535 = t_135.new()
	local var4536 = 0
	while var4536 < buffer.len(p266) do
		local _ = nil
		local var4537 = nil
		local var4538, var4539, var4540 = protoModule.readTag(p266, var4536)
		local var4541 = var4538
		var4537 = var4539
		var4536 = var4540
		
		if var4537 == protoModule.wireTypes.varint then
			local _ = nil
			local var4542, var4543 = protoModule.readVarInt(p266, var4536)
			local _ = var4542
			var4536 = var4543
			continue
		end
		if var4537 == protoModule.wireTypes.lengthDelimited then
			if var4541 == 1 then
				local _ = nil
				local var4544, var4545 = protoModule.readBuffer(p266, var4536)
				var4536 = var4545
				var4535.event_id = propTypesModule.StringProp.decode(var4544)
			elseif var4541 == 2 then
				local _ = nil
				local var4546, var4547 = protoModule.readBuffer(p266, var4536)
				var4536 = var4547
				var4535.universe_id = propTypesModule.StringProp.decode(var4546)
			elseif var4541 == 3 then
				local _ = nil
				local var4548, var4549 = protoModule.readBuffer(p266, var4536)
				var4536 = var4549
				var4535.channel = propTypesModule.StringProp.decode(var4548)
			else
				local _ = nil
				local var4550, var4551 = protoModule.readVarInt(p266, var4536)
				var4536 = var4551 + var4550
			end
		elseif var4537 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4552, var4553 = protoModule.readFixed32(p266, var4536)
			local _ = var4552
			var4536 = var4553
		elseif var4537 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4554, var4555 = protoModule.readFixed64(p266, var4536)
			local _ = var4554
			var4536 = var4555
		else
			error("Unsupported wire type: " .. var4537)
		end
	end
	return var4535
end

function t_135:jsonEncode() --[[ line: 25829 ]]
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

function t_135:jsonDecode() --[[ line: 25847 ]]
	-- upvalues: t_135 (ref), propTypesModule (ref)
	local var4557 = t_135.new()
	
	if self.event_id ~= nil then
		var4557.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var4557.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.universe_id ~= nil then
		var4557.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var4557.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.channel ~= nil then
		var4557.channel = propTypesModule.StringProp.jsonDecode(self.channel)
	end
	return var4557
end

t_135.descriptor = {
	name = "EnableEventNotificationsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.EnableEventNotificationsAction_Params = t_135
typeRegistryModule.default:register(t.EnableEventNotificationsAction_Params)
local t_136 = {}
t_136.__index = t_136

function t_136.new(p267) --[[ line: 25890 ]]
	-- upvalues: t (ref), t_136 (ref)
	return setmetatable({
		action_type = if p267 == nil or p267.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p267.action_type,
		action_params = if p267 == nil or p267.action_params == nil then nil else p267.action_params
	}, t_136)
end

function t_136:encode() --[[ line: 25901 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4559 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4560, var4561 = protoModule.writeTag(buff, var4559, 1, protoModule.wireTypes.varint)
		var4560, var4561 = protoModule.writeVarInt(var4560, var4561, t.ActionType.toNumber(self.action_type))
		buff = var4560
		var4559 = var4561
	end
	if self.action_params ~= nil then
		local var4562 = self.action_params:encode()
		local var4563, var4564 = protoModule.writeTag(buff, var4559, 2, protoModule.wireTypes.lengthDelimited)
		var4563, var4564 = protoModule.writeBuffer(var4563, var4564, var4562, buffer.len(var4562))
		buff = var4563
		var4559 = var4564
	end
	local buff_1 = buffer.create(var4559)
	buffer.copy(buff_1, 0, buff, 0, var4559)
	
	return buff_1
end

function t_136.decode(p268) --[[ line: 25927 ]]
	-- upvalues: t_136 (ref), protoModule (ref), t (ref)
	local var4566 = t_136.new()
	local var4567 = 0
	while var4567 < buffer.len(p268) do
		local _ = nil
		local var4568 = nil
		local var4569, var4570, var4571 = protoModule.readTag(p268, var4567)
		local var4572 = var4569
		var4568 = var4570
		var4567 = var4571
		
		if var4568 == protoModule.wireTypes.varint then
			if var4572 == 1 then
				local _ = nil
				local var4573, var4574 = protoModule.readVarIntI32(p268, var4567)
				local var4575 = var4573
				var4567 = var4574
				var4566.action_type = t.ActionType.fromNumber(var4575) or var4575
			else
				local _ = nil
				local var4576, var4577 = protoModule.readVarInt(p268, var4567)
				local _ = var4576
				var4567 = var4577
			end
		end
		if var4568 == protoModule.wireTypes.lengthDelimited then
			if var4572 == 2 then
				local _ = nil
				local var4578, var4579 = protoModule.readBuffer(p268, var4567)
				var4567 = var4579
				var4566.action_params = t.DismissEventNotificationsModalAction_Params.decode(var4578)
			else
				local _ = nil
				local var4580, var4581 = protoModule.readVarInt(p268, var4567)
				var4567 = var4581 + var4580
			end
		elseif var4568 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4582, var4583 = protoModule.readFixed32(p268, var4567)
			local _ = var4582
			var4567 = var4583
		elseif var4568 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4584, var4585 = protoModule.readFixed64(p268, var4567)
			local _ = var4584
			var4567 = var4585
		else
			error("Unsupported wire type: " .. var4568)
		end
	end
	return var4566
end

function t_136:jsonEncode() --[[ line: 25975 ]]
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

function t_136:jsonDecode() --[[ line: 25997 ]]
	-- upvalues: t_136 (ref), t (ref)
	local var4587 = t_136.new()
	
	if self.action_type ~= nil then
		var4587.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4587.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4587.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4587.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.actionParams)
	end
	return var4587
end

t_136.descriptor = {
	name = "DismissEventNotificationsModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissEventNotificationsModalAction"
}
t.DismissEventNotificationsModalAction = t_136
typeRegistryModule.default:register(t.DismissEventNotificationsModalAction)
local t_137 = {}
t_137.__index = t_137

function t_137.new(p269) --[[ line: 26039 ]]
	-- upvalues: t_137 (ref)
	return setmetatable({
		event_id = if p269 == nil or p269.event_id == nil then nil else p269.event_id
	}, t_137)
end

function t_137:encode() --[[ line: 26047 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4589 = 0
	
	if self.event_id ~= nil then
		local var4590 = self.event_id:encode()
		local var4591, var4592 = protoModule.writeTag(buff, var4589, 1, protoModule.wireTypes.lengthDelimited)
		var4591, var4592 = protoModule.writeBuffer(var4591, var4592, var4590, buffer.len(var4590))
		buff = var4591
		var4589 = var4592
	end
	local buff_1 = buffer.create(var4589)
	buffer.copy(buff_1, 0, buff, 0, var4589)
	
	return buff_1
end

function t_137.decode(p270) --[[ line: 26064 ]]
	-- upvalues: t_137 (ref), protoModule (ref), propTypesModule (ref)
	local var4594 = t_137.new()
	local var4595 = 0
	while var4595 < buffer.len(p270) do
		local _ = nil
		local var4596 = nil
		local var4597, var4598, var4599 = protoModule.readTag(p270, var4595)
		local var4600 = var4597
		var4596 = var4598
		var4595 = var4599
		
		if var4596 == protoModule.wireTypes.varint then
			local _ = nil
			local var4601, var4602 = protoModule.readVarInt(p270, var4595)
			local _ = var4601
			var4595 = var4602
			continue
		end
		if var4596 == protoModule.wireTypes.lengthDelimited then
			if var4600 == 1 then
				local _ = nil
				local var4603, var4604 = protoModule.readBuffer(p270, var4595)
				var4595 = var4604
				var4594.event_id = propTypesModule.StringProp.decode(var4603)
			else
				local _ = nil
				local var4605, var4606 = protoModule.readVarInt(p270, var4595)
				var4595 = var4606 + var4605
			end
		elseif var4596 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4607, var4608 = protoModule.readFixed32(p270, var4595)
			local _ = var4607
			var4595 = var4608
		elseif var4596 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4609, var4610 = protoModule.readFixed64(p270, var4595)
			local _ = var4609
			var4595 = var4610
		else
			error("Unsupported wire type: " .. var4596)
		end
	end
	return var4594
end

function t_137:jsonEncode() --[[ line: 26109 ]]
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_137:jsonDecode() --[[ line: 26121 ]]
	-- upvalues: t_137 (ref), propTypesModule (ref)
	local var4612 = t_137.new()
	
	if self.event_id ~= nil then
		var4612.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var4612.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var4612
end

t_137.descriptor = {
	name = "DismissEventNotificationsModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissEventNotificationsModalAction_Params = t_137
typeRegistryModule.default:register(t.DismissEventNotificationsModalAction_Params)
local t_138 = {}
t_138.__index = t_138

function t_138.new(p271) --[[ line: 26151 ]]
	-- upvalues: t (ref), t_138 (ref)
	return setmetatable({
		action_type = if p271 == nil or p271.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p271.action_type,
		action_params = if p271 == nil or p271.action_params == nil then nil else p271.action_params
	}, t_138)
end

function t_138:encode() --[[ line: 26160 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4614 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4615, var4616 = protoModule.writeTag(buff, var4614, 1, protoModule.wireTypes.varint)
		var4615, var4616 = protoModule.writeVarInt(var4615, var4616, t.ActionType.toNumber(self.action_type))
		buff = var4615
		var4614 = var4616
	end
	if self.action_params ~= nil then
		local var4617 = self.action_params:encode()
		local var4618, var4619 = protoModule.writeTag(buff, var4614, 2, protoModule.wireTypes.lengthDelimited)
		var4618, var4619 = protoModule.writeBuffer(var4618, var4619, var4617, buffer.len(var4617))
		buff = var4618
		var4614 = var4619
	end
	local buff_1 = buffer.create(var4614)
	buffer.copy(buff_1, 0, buff, 0, var4614)
	
	return buff_1
end

function t_138.decode(p272) --[[ line: 26186 ]]
	-- upvalues: t_138 (ref), protoModule (ref), t (ref)
	local var4621 = t_138.new()
	local var4622 = 0
	while var4622 < buffer.len(p272) do
		local _ = nil
		local var4623 = nil
		local var4624, var4625, var4626 = protoModule.readTag(p272, var4622)
		local var4627 = var4624
		var4623 = var4625
		var4622 = var4626
		
		if var4623 == protoModule.wireTypes.varint then
			if var4627 == 1 then
				local _ = nil
				local var4628, var4629 = protoModule.readVarIntI32(p272, var4622)
				local var4630 = var4628
				var4622 = var4629
				var4621.action_type = t.ActionType.fromNumber(var4630) or var4630
			else
				local _ = nil
				local var4631, var4632 = protoModule.readVarInt(p272, var4622)
				local _ = var4631
				var4622 = var4632
			end
		end
		if var4623 == protoModule.wireTypes.lengthDelimited then
			if var4627 == 2 then
				local _ = nil
				local var4633, var4634 = protoModule.readBuffer(p272, var4622)
				var4622 = var4634
				var4621.action_params = t.OpenAmpWizardAction_Params.decode(var4633)
			else
				local _ = nil
				local var4635, var4636 = protoModule.readVarInt(p272, var4622)
				var4622 = var4636 + var4635
			end
		elseif var4623 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4637, var4638 = protoModule.readFixed32(p272, var4622)
			local _ = var4637
			var4622 = var4638
		elseif var4623 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4639, var4640 = protoModule.readFixed64(p272, var4622)
			local _ = var4639
			var4622 = var4640
		else
			error("Unsupported wire type: " .. var4623)
		end
	end
	return var4621
end

function t_138:jsonEncode() --[[ line: 26234 ]]
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

function t_138:jsonDecode() --[[ line: 26256 ]]
	-- upvalues: t_138 (ref), t (ref)
	local var4642 = t_138.new()
	
	if self.action_type ~= nil then
		var4642.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4642.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4642.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4642.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.actionParams)
	end
	return var4642
end

t_138.descriptor = {
	name = "OpenAmpWizardAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAmpWizardAction"
}
t.OpenAmpWizardAction = t_138
typeRegistryModule.default:register(t.OpenAmpWizardAction)
local t_139 = {}
t_139.__index = t_139

function t_139.new(p273) --[[ line: 26296 ]]
	-- upvalues: t_139 (ref)
	return setmetatable({
		feature_name = if p273 == nil or p273.feature_name == nil then nil else p273.feature_name,
		name_space = if p273 == nil or p273.name_space == nil then nil else p273.name_space,
		entry_point_event_ctx = if p273 == nil or p273.entry_point_event_ctx == nil then nil else p273.entry_point_event_ctx,
		skip_facial_age_estimation_web_link_modal = if p273 == nil or p273.skip_facial_age_estimation_web_link_modal == nil then nil else p273.skip_facial_age_estimation_web_link_modal
	}, t_139)
end

function t_139:encode() --[[ line: 26312 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4644 = 0
	
	if self.feature_name ~= nil then
		local var4645 = self.feature_name:encode()
		local var4646, var4647 = protoModule.writeTag(buff, var4644, 1, protoModule.wireTypes.lengthDelimited)
		var4646, var4647 = protoModule.writeBuffer(var4646, var4647, var4645, buffer.len(var4645))
		buff = var4646
		var4644 = var4647
	end
	if self.name_space ~= nil then
		local var4648 = self.name_space:encode()
		local var4649, var4650 = protoModule.writeTag(buff, var4644, 2, protoModule.wireTypes.lengthDelimited)
		var4649, var4650 = protoModule.writeBuffer(var4649, var4650, var4648, buffer.len(var4648))
		buff = var4649
		var4644 = var4650
	end
	if self.entry_point_event_ctx ~= nil then
		local var4651 = self.entry_point_event_ctx:encode()
		local var4652, var4653 = protoModule.writeTag(buff, var4644, 3, protoModule.wireTypes.lengthDelimited)
		var4652, var4653 = protoModule.writeBuffer(var4652, var4653, var4651, buffer.len(var4651))
		buff = var4652
		var4644 = var4653
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		local var4654 = self.skip_facial_age_estimation_web_link_modal:encode()
		local var4655, var4656 = protoModule.writeTag(buff, var4644, 4, protoModule.wireTypes.lengthDelimited)
		var4655, var4656 = protoModule.writeBuffer(var4655, var4656, var4654, buffer.len(var4654))
		buff = var4655
		var4644 = var4656
	end
	local buff_1 = buffer.create(var4644)
	buffer.copy(buff_1, 0, buff, 0, var4644)
	
	return buff_1
end

function t_139.decode(p274) --[[ line: 26345 ]]
	-- upvalues: t_139 (ref), protoModule (ref), propTypesModule (ref)
	local var4658 = t_139.new()
	local var4659 = 0
	while var4659 < buffer.len(p274) do
		local _ = nil
		local var4660 = nil
		local var4661, var4662, var4663 = protoModule.readTag(p274, var4659)
		local var4664 = var4661
		var4660 = var4662
		var4659 = var4663
		
		if var4660 == protoModule.wireTypes.varint then
			local _ = nil
			local var4665, var4666 = protoModule.readVarInt(p274, var4659)
			local _ = var4665
			var4659 = var4666
			continue
		end
		if var4660 == protoModule.wireTypes.lengthDelimited then
			if var4664 == 1 then
				local _ = nil
				local var4667, var4668 = protoModule.readBuffer(p274, var4659)
				var4659 = var4668
				var4658.feature_name = propTypesModule.StringProp.decode(var4667)
			elseif var4664 == 2 then
				local _ = nil
				local var4669, var4670 = protoModule.readBuffer(p274, var4659)
				var4659 = var4670
				var4658.name_space = propTypesModule.StringProp.decode(var4669)
			elseif var4664 == 3 then
				local _ = nil
				local var4671, var4672 = protoModule.readBuffer(p274, var4659)
				var4659 = var4672
				var4658.entry_point_event_ctx = propTypesModule.StringProp.decode(var4671)
			elseif var4664 == 4 then
				local _ = nil
				local var4673, var4674 = protoModule.readBuffer(p274, var4659)
				var4659 = var4674
				var4658.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.decode(var4673)
			else
				local _ = nil
				local var4675, var4676 = protoModule.readVarInt(p274, var4659)
				var4659 = var4676 + var4675
			end
		elseif var4660 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4677, var4678 = protoModule.readFixed32(p274, var4659)
			local _ = var4677
			var4659 = var4678
		elseif var4660 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4679, var4680 = protoModule.readFixed64(p274, var4659)
			local _ = var4679
			var4659 = var4680
		else
			error("Unsupported wire type: " .. var4660)
		end
	end
	return var4658
end

function t_139:jsonEncode() --[[ line: 26405 ]]
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

function t_139:jsonDecode() --[[ line: 26427 ]]
	-- upvalues: t_139 (ref), propTypesModule (ref)
	local var4682 = t_139.new()
	
	if self.feature_name ~= nil then
		var4682.feature_name = propTypesModule.StringProp.jsonDecode(self.feature_name)
	end
	if self.featureName ~= nil then
		var4682.feature_name = propTypesModule.StringProp.jsonDecode(self.featureName)
	end
	if self.name_space ~= nil then
		var4682.name_space = propTypesModule.StringProp.jsonDecode(self.name_space)
	end
	if self.nameSpace ~= nil then
		var4682.name_space = propTypesModule.StringProp.jsonDecode(self.nameSpace)
	end
	if self.entry_point_event_ctx ~= nil then
		var4682.entry_point_event_ctx = propTypesModule.StringProp.jsonDecode(self.entry_point_event_ctx)
	end
	if self.entryPointEventCtx ~= nil then
		var4682.entry_point_event_ctx = propTypesModule.StringProp.jsonDecode(self.entryPointEventCtx)
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		var4682.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.jsonDecode(self.skip_facial_age_estimation_web_link_modal)
	end
	if self.skipFacialAgeEstimationWebLinkModal ~= nil then
		var4682.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.jsonDecode(self.skipFacialAgeEstimationWebLinkModal)
	end
	return var4682
end

t_139.descriptor = {
	name = "OpenAmpWizardAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAmpWizardAction_Params = t_139
typeRegistryModule.default:register(t.OpenAmpWizardAction_Params)
local t_140 = {}
t_140.__index = t_140

function t_140.new(p275) --[[ line: 26489 ]]
	-- upvalues: t (ref), t_140 (ref)
	return setmetatable({
		action_type = if p275 == nil or p275.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p275.action_type,
		action_params = if p275 == nil or p275.action_params == nil then nil else p275.action_params
	}, t_140)
end

function t_140:encode() --[[ line: 26500 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4684 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4685, var4686 = protoModule.writeTag(buff, var4684, 1, protoModule.wireTypes.varint)
		var4685, var4686 = protoModule.writeVarInt(var4685, var4686, t.ActionType.toNumber(self.action_type))
		buff = var4685
		var4684 = var4686
	end
	if self.action_params ~= nil then
		local var4687 = self.action_params:encode()
		local var4688, var4689 = protoModule.writeTag(buff, var4684, 2, protoModule.wireTypes.lengthDelimited)
		var4688, var4689 = protoModule.writeBuffer(var4688, var4689, var4687, buffer.len(var4687))
		buff = var4688
		var4684 = var4689
	end
	local buff_1 = buffer.create(var4684)
	buffer.copy(buff_1, 0, buff, 0, var4684)
	
	return buff_1
end

function t_140.decode(p276) --[[ line: 26526 ]]
	-- upvalues: t_140 (ref), protoModule (ref), t (ref)
	local var4691 = t_140.new()
	local var4692 = 0
	while var4692 < buffer.len(p276) do
		local _ = nil
		local var4693 = nil
		local var4694, var4695, var4696 = protoModule.readTag(p276, var4692)
		local var4697 = var4694
		var4693 = var4695
		var4692 = var4696
		
		if var4693 == protoModule.wireTypes.varint then
			if var4697 == 1 then
				local _ = nil
				local var4698, var4699 = protoModule.readVarIntI32(p276, var4692)
				local var4700 = var4698
				var4692 = var4699
				var4691.action_type = t.ActionType.fromNumber(var4700) or var4700
			else
				local _ = nil
				local var4701, var4702 = protoModule.readVarInt(p276, var4692)
				local _ = var4701
				var4692 = var4702
			end
		end
		if var4693 == protoModule.wireTypes.lengthDelimited then
			if var4697 == 2 then
				local _ = nil
				local var4703, var4704 = protoModule.readBuffer(p276, var4692)
				var4692 = var4704
				var4691.action_params = t.OpenSocialProofUserListSheetAction_Params.decode(var4703)
			else
				local _ = nil
				local var4705, var4706 = protoModule.readVarInt(p276, var4692)
				var4692 = var4706 + var4705
			end
		elseif var4693 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4707, var4708 = protoModule.readFixed32(p276, var4692)
			local _ = var4707
			var4692 = var4708
		elseif var4693 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4709, var4710 = protoModule.readFixed64(p276, var4692)
			local _ = var4709
			var4692 = var4710
		else
			error("Unsupported wire type: " .. var4693)
		end
	end
	return var4691
end

function t_140:jsonEncode() --[[ line: 26574 ]]
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

function t_140:jsonDecode() --[[ line: 26596 ]]
	-- upvalues: t_140 (ref), t (ref)
	local var4712 = t_140.new()
	
	if self.action_type ~= nil then
		var4712.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4712.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4712.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4712.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.actionParams)
	end
	return var4712
end

t_140.descriptor = {
	name = "OpenSocialProofUserListSheetAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSocialProofUserListSheetAction"
}
t.OpenSocialProofUserListSheetAction = t_140
typeRegistryModule.default:register(t.OpenSocialProofUserListSheetAction)
local t_141 = {}
t_141.__index = t_141

function t_141.new(p277) --[[ line: 26638 ]]
	-- upvalues: t_141 (ref)
	return setmetatable({
		universe_id = if p277 == nil or p277.universe_id == nil then nil else p277.universe_id,
		place_id = if p277 == nil or p277.place_id == nil then nil else p277.place_id,
		total_connections = if p277 == nil or p277.total_connections == nil then nil else p277.total_connections,
		user_ids = if p277 == nil or p277.user_ids == nil then nil else p277.user_ids,
		sheet_title = if p277 == nil or p277.sheet_title == nil then nil else p277.sheet_title
	}, t_141)
end

function t_141:encode() --[[ line: 26650 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4714 = 0
	
	if self.universe_id ~= nil then
		local var4715 = self.universe_id:encode()
		local var4716, var4717 = protoModule.writeTag(buff, var4714, 1, protoModule.wireTypes.lengthDelimited)
		var4716, var4717 = protoModule.writeBuffer(var4716, var4717, var4715, buffer.len(var4715))
		buff = var4716
		var4714 = var4717
	end
	if self.place_id ~= nil then
		local var4718 = self.place_id:encode()
		local var4719, var4720 = protoModule.writeTag(buff, var4714, 2, protoModule.wireTypes.lengthDelimited)
		var4719, var4720 = protoModule.writeBuffer(var4719, var4720, var4718, buffer.len(var4718))
		buff = var4719
		var4714 = var4720
	end
	if self.total_connections ~= nil then
		local var4721 = self.total_connections:encode()
		local var4722, var4723 = protoModule.writeTag(buff, var4714, 3, protoModule.wireTypes.lengthDelimited)
		var4722, var4723 = protoModule.writeBuffer(var4722, var4723, var4721, buffer.len(var4721))
		buff = var4722
		var4714 = var4723
	end
	if self.user_ids ~= nil then
		local var4724 = self.user_ids:encode()
		local var4725, var4726 = protoModule.writeTag(buff, var4714, 4, protoModule.wireTypes.lengthDelimited)
		var4725, var4726 = protoModule.writeBuffer(var4725, var4726, var4724, buffer.len(var4724))
		buff = var4725
		var4714 = var4726
	end
	if self.sheet_title ~= nil then
		local var4727 = self.sheet_title:encode()
		local var4728, var4729 = protoModule.writeTag(buff, var4714, 5, protoModule.wireTypes.lengthDelimited)
		var4728, var4729 = protoModule.writeBuffer(var4728, var4729, var4727, buffer.len(var4727))
		buff = var4728
		var4714 = var4729
	end
	local buff_1 = buffer.create(var4714)
	buffer.copy(buff_1, 0, buff, 0, var4714)
	
	return buff_1
end

function t_141.decode(p278) --[[ line: 26691 ]]
	-- upvalues: t_141 (ref), protoModule (ref), propTypesModule (ref)
	local var4731 = t_141.new()
	local var4732 = 0
	while var4732 < buffer.len(p278) do
		local _ = nil
		local var4733 = nil
		local var4734, var4735, var4736 = protoModule.readTag(p278, var4732)
		local var4737 = var4734
		var4733 = var4735
		var4732 = var4736
		
		if var4733 == protoModule.wireTypes.varint then
			local _ = nil
			local var4738, var4739 = protoModule.readVarInt(p278, var4732)
			local _ = var4738
			var4732 = var4739
			continue
		end
		if var4733 == protoModule.wireTypes.lengthDelimited then
			if var4737 == 1 then
				local _ = nil
				local var4740, var4741 = protoModule.readBuffer(p278, var4732)
				var4732 = var4741
				var4731.universe_id = propTypesModule.StringProp.decode(var4740)
			elseif var4737 == 2 then
				local _ = nil
				local var4742, var4743 = protoModule.readBuffer(p278, var4732)
				var4732 = var4743
				var4731.place_id = propTypesModule.StringProp.decode(var4742)
			elseif var4737 == 3 then
				local _ = nil
				local var4744, var4745 = protoModule.readBuffer(p278, var4732)
				var4732 = var4745
				var4731.total_connections = propTypesModule.Int32Prop.decode(var4744)
			elseif var4737 == 4 then
				local _ = nil
				local var4746, var4747 = protoModule.readBuffer(p278, var4732)
				var4732 = var4747
				var4731.user_ids = propTypesModule.ArrayOfAvatarProp.decode(var4746)
			elseif var4737 == 5 then
				local _ = nil
				local var4748, var4749 = protoModule.readBuffer(p278, var4732)
				var4732 = var4749
				var4731.sheet_title = propTypesModule.StringProp.decode(var4748)
			else
				local _ = nil
				local var4750, var4751 = protoModule.readVarInt(p278, var4732)
				var4732 = var4751 + var4750
			end
		elseif var4733 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4752, var4753 = protoModule.readFixed32(p278, var4732)
			local _ = var4752
			var4732 = var4753
		elseif var4733 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4754, var4755 = protoModule.readFixed64(p278, var4732)
			local _ = var4754
			var4732 = var4755
		else
			error("Unsupported wire type: " .. var4733)
		end
	end
	return var4731
end

function t_141:jsonEncode() --[[ line: 26756 ]]
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

function t_141:jsonDecode() --[[ line: 26784 ]]
	-- upvalues: t_141 (ref), propTypesModule (ref)
	local var4757 = t_141.new()
	
	if self.universe_id ~= nil then
		var4757.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var4757.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var4757.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var4757.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.total_connections ~= nil then
		var4757.total_connections = propTypesModule.Int32Prop.jsonDecode(self.total_connections)
	end
	if self.totalConnections ~= nil then
		var4757.total_connections = propTypesModule.Int32Prop.jsonDecode(self.totalConnections)
	end
	if self.user_ids ~= nil then
		var4757.user_ids = propTypesModule.ArrayOfAvatarProp.jsonDecode(self.user_ids)
	end
	if self.userIds ~= nil then
		var4757.user_ids = propTypesModule.ArrayOfAvatarProp.jsonDecode(self.userIds)
	end
	if self.sheet_title ~= nil then
		var4757.sheet_title = propTypesModule.StringProp.jsonDecode(self.sheet_title)
	end
	if self.sheetTitle ~= nil then
		var4757.sheet_title = propTypesModule.StringProp.jsonDecode(self.sheetTitle)
	end
	return var4757
end

t_141.descriptor = {
	name = "OpenSocialProofUserListSheetAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSocialProofUserListSheetAction_Params = t_141
typeRegistryModule.default:register(t.OpenSocialProofUserListSheetAction_Params)
local t_142 = {}
t_142.__index = t_142

function t_142.new(p279) --[[ line: 26852 ]]
	-- upvalues: t (ref), t_142 (ref)
	return setmetatable({
		action_type = if p279 == nil or p279.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p279.action_type,
		action_params = if p279 == nil or p279.action_params == nil then nil else p279.action_params
	}, t_142)
end

function t_142:encode() --[[ line: 26863 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4759 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4760, var4761 = protoModule.writeTag(buff, var4759, 1, protoModule.wireTypes.varint)
		var4760, var4761 = protoModule.writeVarInt(var4760, var4761, t.ActionType.toNumber(self.action_type))
		buff = var4760
		var4759 = var4761
	end
	if self.action_params ~= nil then
		local var4762 = self.action_params:encode()
		local var4763, var4764 = protoModule.writeTag(buff, var4759, 2, protoModule.wireTypes.lengthDelimited)
		var4763, var4764 = protoModule.writeBuffer(var4763, var4764, var4762, buffer.len(var4762))
		buff = var4763
		var4759 = var4764
	end
	local buff_1 = buffer.create(var4759)
	buffer.copy(buff_1, 0, buff, 0, var4759)
	
	return buff_1
end

function t_142.decode(p280) --[[ line: 26889 ]]
	-- upvalues: t_142 (ref), protoModule (ref), t (ref)
	local var4766 = t_142.new()
	local var4767 = 0
	while var4767 < buffer.len(p280) do
		local _ = nil
		local var4768 = nil
		local var4769, var4770, var4771 = protoModule.readTag(p280, var4767)
		local var4772 = var4769
		var4768 = var4770
		var4767 = var4771
		
		if var4768 == protoModule.wireTypes.varint then
			if var4772 == 1 then
				local _ = nil
				local var4773, var4774 = protoModule.readVarIntI32(p280, var4767)
				local var4775 = var4773
				var4767 = var4774
				var4766.action_type = t.ActionType.fromNumber(var4775) or var4775
			else
				local _ = nil
				local var4776, var4777 = protoModule.readVarInt(p280, var4767)
				local _ = var4776
				var4767 = var4777
			end
		end
		if var4768 == protoModule.wireTypes.lengthDelimited then
			if var4772 == 2 then
				local _ = nil
				local var4778, var4779 = protoModule.readBuffer(p280, var4767)
				var4767 = var4779
				var4766.action_params = t.OpenSearchResultsTabAction_Params.decode(var4778)
			else
				local _ = nil
				local var4780, var4781 = protoModule.readVarInt(p280, var4767)
				var4767 = var4781 + var4780
			end
		elseif var4768 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4782, var4783 = protoModule.readFixed32(p280, var4767)
			local _ = var4782
			var4767 = var4783
		elseif var4768 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4784, var4785 = protoModule.readFixed64(p280, var4767)
			local _ = var4784
			var4767 = var4785
		else
			error("Unsupported wire type: " .. var4768)
		end
	end
	return var4766
end

function t_142:jsonEncode() --[[ line: 26937 ]]
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

function t_142:jsonDecode() --[[ line: 26959 ]]
	-- upvalues: t_142 (ref), t (ref)
	local var4787 = t_142.new()
	
	if self.action_type ~= nil then
		var4787.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4787.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4787.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4787.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.actionParams)
	end
	return var4787
end

t_142.descriptor = {
	name = "OpenSearchResultsTabAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSearchResultsTabAction"
}
t.OpenSearchResultsTabAction = t_142
typeRegistryModule.default:register(t.OpenSearchResultsTabAction)
local t_143 = {}
t_143.__index = t_143

function t_143.new(p281) --[[ line: 26999 ]]
	-- upvalues: t_143 (ref)
	return setmetatable({
		search_type = if p281 == nil or p281.search_type == nil then nil else p281.search_type
	}, t_143)
end

function t_143:encode() --[[ line: 27007 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4789 = 0
	
	if self.search_type ~= nil then
		local var4790 = self.search_type:encode()
		local var4791, var4792 = protoModule.writeTag(buff, var4789, 1, protoModule.wireTypes.lengthDelimited)
		var4791, var4792 = protoModule.writeBuffer(var4791, var4792, var4790, buffer.len(var4790))
		buff = var4791
		var4789 = var4792
	end
	local buff_1 = buffer.create(var4789)
	buffer.copy(buff_1, 0, buff, 0, var4789)
	
	return buff_1
end

function t_143.decode(p282) --[[ line: 27022 ]]
	-- upvalues: t_143 (ref), protoModule (ref), propTypesModule (ref)
	local var4794 = t_143.new()
	local var4795 = 0
	while var4795 < buffer.len(p282) do
		local _ = nil
		local var4796 = nil
		local var4797, var4798, var4799 = protoModule.readTag(p282, var4795)
		local var4800 = var4797
		var4796 = var4798
		var4795 = var4799
		
		if var4796 == protoModule.wireTypes.varint then
			local _ = nil
			local var4801, var4802 = protoModule.readVarInt(p282, var4795)
			local _ = var4801
			var4795 = var4802
			continue
		end
		if var4796 == protoModule.wireTypes.lengthDelimited then
			if var4800 == 1 then
				local _ = nil
				local var4803, var4804 = protoModule.readBuffer(p282, var4795)
				var4795 = var4804
				var4794.search_type = propTypesModule.StringProp.decode(var4803)
			else
				local _ = nil
				local var4805, var4806 = protoModule.readVarInt(p282, var4795)
				var4795 = var4806 + var4805
			end
		elseif var4796 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4807, var4808 = protoModule.readFixed32(p282, var4795)
			local _ = var4807
			var4795 = var4808
		elseif var4796 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4809, var4810 = protoModule.readFixed64(p282, var4795)
			local _ = var4809
			var4795 = var4810
		else
			error("Unsupported wire type: " .. var4796)
		end
	end
	return var4794
end

function t_143:jsonEncode() --[[ line: 27065 ]]
	local t = {}
	
	if self.search_type ~= nil then
		t.searchType = self.search_type:jsonEncode()
	end
	return t
end

function t_143:jsonDecode() --[[ line: 27075 ]]
	-- upvalues: t_143 (ref), propTypesModule (ref)
	local var4812 = t_143.new()
	
	if self.search_type ~= nil then
		var4812.search_type = propTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		var4812.search_type = propTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return var4812
end

t_143.descriptor = {
	name = "OpenSearchResultsTabAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSearchResultsTabAction_Params = t_143
typeRegistryModule.default:register(t.OpenSearchResultsTabAction_Params)
local t_144 = {}
t_144.__index = t_144

function t_144.new(p283) --[[ line: 27106 ]]
	-- upvalues: t (ref), t_144 (ref)
	return setmetatable({
		action_type = if p283 == nil or p283.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p283.action_type,
		action_params = if p283 == nil or p283.action_params == nil then nil else p283.action_params
	}, t_144)
end

function t_144:encode() --[[ line: 27115 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4814 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4815, var4816 = protoModule.writeTag(buff, var4814, 1, protoModule.wireTypes.varint)
		var4815, var4816 = protoModule.writeVarInt(var4815, var4816, t.ActionType.toNumber(self.action_type))
		buff = var4815
		var4814 = var4816
	end
	if self.action_params ~= nil then
		local var4817 = self.action_params:encode()
		local var4818, var4819 = protoModule.writeTag(buff, var4814, 2, protoModule.wireTypes.lengthDelimited)
		var4818, var4819 = protoModule.writeBuffer(var4818, var4819, var4817, buffer.len(var4817))
		buff = var4818
		var4814 = var4819
	end
	local buff_1 = buffer.create(var4814)
	buffer.copy(buff_1, 0, buff, 0, var4814)
	
	return buff_1
end

function t_144.decode(p284) --[[ line: 27141 ]]
	-- upvalues: t_144 (ref), protoModule (ref), t (ref)
	local var4821 = t_144.new()
	local var4822 = 0
	while var4822 < buffer.len(p284) do
		local _ = nil
		local var4823 = nil
		local var4824, var4825, var4826 = protoModule.readTag(p284, var4822)
		local var4827 = var4824
		var4823 = var4825
		var4822 = var4826
		
		if var4823 == protoModule.wireTypes.varint then
			if var4827 == 1 then
				local _ = nil
				local var4828, var4829 = protoModule.readVarIntI32(p284, var4822)
				local var4830 = var4828
				var4822 = var4829
				var4821.action_type = t.ActionType.fromNumber(var4830) or var4830
			else
				local _ = nil
				local var4831, var4832 = protoModule.readVarInt(p284, var4822)
				local _ = var4831
				var4822 = var4832
			end
		end
		if var4823 == protoModule.wireTypes.lengthDelimited then
			if var4827 == 2 then
				local _ = nil
				local var4833, var4834 = protoModule.readBuffer(p284, var4822)
				var4822 = var4834
				var4821.action_params = t.DismissPromptAction_Params.decode(var4833)
			else
				local _ = nil
				local var4835, var4836 = protoModule.readVarInt(p284, var4822)
				var4822 = var4836 + var4835
			end
		elseif var4823 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4837, var4838 = protoModule.readFixed32(p284, var4822)
			local _ = var4837
			var4822 = var4838
		elseif var4823 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4839, var4840 = protoModule.readFixed64(p284, var4822)
			local _ = var4839
			var4822 = var4840
		else
			error("Unsupported wire type: " .. var4823)
		end
	end
	return var4821
end

function t_144:jsonEncode() --[[ line: 27189 ]]
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

function t_144:jsonDecode() --[[ line: 27211 ]]
	-- upvalues: t_144 (ref), t (ref)
	local var4842 = t_144.new()
	
	if self.action_type ~= nil then
		var4842.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4842.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4842.action_params = t.DismissPromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4842.action_params = t.DismissPromptAction_Params.jsonDecode(self.actionParams)
	end
	return var4842
end

t_144.descriptor = {
	name = "DismissPromptAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissPromptAction"
}
t.DismissPromptAction = t_144
typeRegistryModule.default:register(t.DismissPromptAction)
local t_145 = {}
t_145.__index = t_145

function t_145.new(p285) --[[ line: 27251 ]]
	-- upvalues: t_145 (ref)
	return setmetatable({
		prompt_type = if p285 == nil or p285.prompt_type == nil then nil else p285.prompt_type,
		prompt_id = if p285 == nil or p285.prompt_id == nil then nil else p285.prompt_id,
		entity_type = if p285 == nil or p285.entity_type == nil then nil else p285.entity_type,
		entity_id = if p285 == nil or p285.entity_id == nil then nil else p285.entity_id
	}, t_145)
end

function t_145:encode() --[[ line: 27262 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4844 = 0
	
	if self.prompt_type ~= nil then
		local var4845 = self.prompt_type:encode()
		local var4846, var4847 = protoModule.writeTag(buff, var4844, 1, protoModule.wireTypes.lengthDelimited)
		var4846, var4847 = protoModule.writeBuffer(var4846, var4847, var4845, buffer.len(var4845))
		buff = var4846
		var4844 = var4847
	end
	if self.prompt_id ~= nil then
		local var4848 = self.prompt_id:encode()
		local var4849, var4850 = protoModule.writeTag(buff, var4844, 2, protoModule.wireTypes.lengthDelimited)
		var4849, var4850 = protoModule.writeBuffer(var4849, var4850, var4848, buffer.len(var4848))
		buff = var4849
		var4844 = var4850
	end
	if self.entity_type ~= nil then
		local var4851 = self.entity_type:encode()
		local var4852, var4853 = protoModule.writeTag(buff, var4844, 3, protoModule.wireTypes.lengthDelimited)
		var4852, var4853 = protoModule.writeBuffer(var4852, var4853, var4851, buffer.len(var4851))
		buff = var4852
		var4844 = var4853
	end
	if self.entity_id ~= nil then
		local var4854 = self.entity_id:encode()
		local var4855, var4856 = protoModule.writeTag(buff, var4844, 4, protoModule.wireTypes.lengthDelimited)
		var4855, var4856 = protoModule.writeBuffer(var4855, var4856, var4854, buffer.len(var4854))
		buff = var4855
		var4844 = var4856
	end
	local buff_1 = buffer.create(var4844)
	buffer.copy(buff_1, 0, buff, 0, var4844)
	
	return buff_1
end

function t_145.decode(p286) --[[ line: 27295 ]]
	-- upvalues: t_145 (ref), protoModule (ref), propTypesModule (ref)
	local var4858 = t_145.new()
	local var4859 = 0
	while var4859 < buffer.len(p286) do
		local _ = nil
		local var4860 = nil
		local var4861, var4862, var4863 = protoModule.readTag(p286, var4859)
		local var4864 = var4861
		var4860 = var4862
		var4859 = var4863
		
		if var4860 == protoModule.wireTypes.varint then
			local _ = nil
			local var4865, var4866 = protoModule.readVarInt(p286, var4859)
			local _ = var4865
			var4859 = var4866
			continue
		end
		if var4860 == protoModule.wireTypes.lengthDelimited then
			if var4864 == 1 then
				local _ = nil
				local var4867, var4868 = protoModule.readBuffer(p286, var4859)
				var4859 = var4868
				var4858.prompt_type = propTypesModule.StringProp.decode(var4867)
			elseif var4864 == 2 then
				local _ = nil
				local var4869, var4870 = protoModule.readBuffer(p286, var4859)
				var4859 = var4870
				var4858.prompt_id = propTypesModule.StringProp.decode(var4869)
			elseif var4864 == 3 then
				local _ = nil
				local var4871, var4872 = protoModule.readBuffer(p286, var4859)
				var4859 = var4872
				var4858.entity_type = propTypesModule.StringProp.decode(var4871)
			elseif var4864 == 4 then
				local _ = nil
				local var4873, var4874 = protoModule.readBuffer(p286, var4859)
				var4859 = var4874
				var4858.entity_id = propTypesModule.StringProp.decode(var4873)
			else
				local _ = nil
				local var4875, var4876 = protoModule.readVarInt(p286, var4859)
				var4859 = var4876 + var4875
			end
		elseif var4860 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4877, var4878 = protoModule.readFixed32(p286, var4859)
			local _ = var4877
			var4859 = var4878
		elseif var4860 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4879, var4880 = protoModule.readFixed64(p286, var4859)
			local _ = var4879
			var4859 = var4880
		else
			error("Unsupported wire type: " .. var4860)
		end
	end
	return var4858
end

function t_145:jsonEncode() --[[ line: 27353 ]]
	local t = {}
	
	if self.prompt_type ~= nil then
		t.promptType = self.prompt_type:jsonEncode()
	end
	if self.prompt_id ~= nil then
		t.promptId = self.prompt_id:jsonEncode()
	end
	if self.entity_type ~= nil then
		t.entityType = self.entity_type:jsonEncode()
	end
	if self.entity_id ~= nil then
		t.entityId = self.entity_id:jsonEncode()
	end
	return t
end

function t_145:jsonDecode() --[[ line: 27375 ]]
	-- upvalues: t_145 (ref), propTypesModule (ref)
	local var4882 = t_145.new()
	
	if self.prompt_type ~= nil then
		var4882.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var4882.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var4882.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var4882.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.entity_type ~= nil then
		var4882.entity_type = propTypesModule.StringProp.jsonDecode(self.entity_type)
	end
	if self.entityType ~= nil then
		var4882.entity_type = propTypesModule.StringProp.jsonDecode(self.entityType)
	end
	if self.entity_id ~= nil then
		var4882.entity_id = propTypesModule.StringProp.jsonDecode(self.entity_id)
	end
	if self.entityId ~= nil then
		var4882.entity_id = propTypesModule.StringProp.jsonDecode(self.entityId)
	end
	return var4882
end

t_145.descriptor = {
	name = "DismissPromptAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissPromptAction_Params = t_145
typeRegistryModule.default:register(t.DismissPromptAction_Params)
local t_146 = {}
t_146.__index = t_146

function t_146.new(p287) --[[ line: 27430 ]]
	-- upvalues: t (ref), t_146 (ref)
	return setmetatable({
		action_type = if p287 == nil or p287.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p287.action_type,
		action_params = if p287 == nil or p287.action_params == nil then nil else p287.action_params
	}, t_146)
end

function t_146:encode() --[[ line: 27444 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4884 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4885, var4886 = protoModule.writeTag(buff, var4884, 1, protoModule.wireTypes.varint)
		var4885, var4886 = protoModule.writeVarInt(var4885, var4886, t.ActionType.toNumber(self.action_type))
		buff = var4885
		var4884 = var4886
	end
	if self.action_params ~= nil then
		local var4887 = self.action_params:encode()
		local var4888, var4889 = protoModule.writeTag(buff, var4884, 2, protoModule.wireTypes.lengthDelimited)
		var4888, var4889 = protoModule.writeBuffer(var4888, var4889, var4887, buffer.len(var4887))
		buff = var4888
		var4884 = var4889
	end
	local buff_1 = buffer.create(var4884)
	buffer.copy(buff_1, 0, buff, 0, var4884)
	
	return buff_1
end

function t_146.decode(p288) --[[ line: 27472 ]]
	-- upvalues: t_146 (ref), protoModule (ref), t (ref)
	local var4891 = t_146.new()
	local var4892 = 0
	while var4892 < buffer.len(p288) do
		local _ = nil
		local var4893 = nil
		local var4894, var4895, var4896 = protoModule.readTag(p288, var4892)
		local var4897 = var4894
		var4893 = var4895
		var4892 = var4896
		
		if var4893 == protoModule.wireTypes.varint then
			if var4897 == 1 then
				local _ = nil
				local var4898, var4899 = protoModule.readVarIntI32(p288, var4892)
				local var4900 = var4898
				var4892 = var4899
				var4891.action_type = t.ActionType.fromNumber(var4900) or var4900
			else
				local _ = nil
				local var4901, var4902 = protoModule.readVarInt(p288, var4892)
				local _ = var4901
				var4892 = var4902
			end
		end
		if var4893 == protoModule.wireTypes.lengthDelimited then
			if var4897 == 2 then
				local _ = nil
				local var4903, var4904 = protoModule.readBuffer(p288, var4892)
				var4892 = var4904
				var4891.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.decode(var4903)
			else
				local _ = nil
				local var4905, var4906 = protoModule.readVarInt(p288, var4892)
				var4892 = var4906 + var4905
			end
		elseif var4893 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4907, var4908 = protoModule.readFixed32(p288, var4892)
			local _ = var4907
			var4892 = var4908
		elseif var4893 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4909, var4910 = protoModule.readFixed64(p288, var4892)
			local _ = var4909
			var4892 = var4910
		else
			error("Unsupported wire type: " .. var4893)
		end
	end
	return var4891
end

function t_146:jsonEncode() --[[ line: 27523 ]]
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

function t_146:jsonDecode() --[[ line: 27547 ]]
	-- upvalues: t_146 (ref), t (ref)
	local var4912 = t_146.new()
	
	if self.action_type ~= nil then
		var4912.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4912.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4912.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4912.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.actionParams)
	end
	return var4912
end

t_146.descriptor = {
	name = "RecordPartyChatConversationUpsellAcknowledgementAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecordPartyChatConversationUpsellAcknowledgementAction"
}
t.RecordPartyChatConversationUpsellAcknowledgementAction = t_146
typeRegistryModule.default:register(t.RecordPartyChatConversationUpsellAcknowledgementAction)
local t_147 = {}
t_147.__index = t_147

function t_147.new(p289) --[[ line: 27593 ]]
	-- upvalues: t_147 (ref)
	return setmetatable({
		modal_action = if p289 == nil or p289.modal_action == nil then nil else p289.modal_action,
		modal_variant = if p289 == nil or p289.modal_variant == nil then nil else p289.modal_variant,
		modal_sequence = if p289 == nil or p289.modal_sequence == nil then nil else p289.modal_sequence,
		conversation_id = if p289 == nil or p289.conversation_id == nil then nil else p289.conversation_id,
		friend_id = if p289 == nil or p289.friend_id == nil then nil else p289.friend_id
	}, t_147)
end

function t_147:encode() --[[ line: 27608 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4914 = 0
	
	if self.modal_action ~= nil then
		local var4915 = self.modal_action:encode()
		local var4916, var4917 = protoModule.writeTag(buff, var4914, 1, protoModule.wireTypes.lengthDelimited)
		var4916, var4917 = protoModule.writeBuffer(var4916, var4917, var4915, buffer.len(var4915))
		buff = var4916
		var4914 = var4917
	end
	if self.modal_variant ~= nil then
		local var4918 = self.modal_variant:encode()
		local var4919, var4920 = protoModule.writeTag(buff, var4914, 2, protoModule.wireTypes.lengthDelimited)
		var4919, var4920 = protoModule.writeBuffer(var4919, var4920, var4918, buffer.len(var4918))
		buff = var4919
		var4914 = var4920
	end
	if self.modal_sequence ~= nil then
		local var4921 = self.modal_sequence:encode()
		local var4922, var4923 = protoModule.writeTag(buff, var4914, 3, protoModule.wireTypes.lengthDelimited)
		var4922, var4923 = protoModule.writeBuffer(var4922, var4923, var4921, buffer.len(var4921))
		buff = var4922
		var4914 = var4923
	end
	if self.conversation_id ~= nil then
		local var4924 = self.conversation_id:encode()
		local var4925, var4926 = protoModule.writeTag(buff, var4914, 4, protoModule.wireTypes.lengthDelimited)
		var4925, var4926 = protoModule.writeBuffer(var4925, var4926, var4924, buffer.len(var4924))
		buff = var4925
		var4914 = var4926
	end
	if self.friend_id ~= nil then
		local var4927 = self.friend_id:encode()
		local var4928, var4929 = protoModule.writeTag(buff, var4914, 5, protoModule.wireTypes.lengthDelimited)
		var4928, var4929 = protoModule.writeBuffer(var4928, var4929, var4927, buffer.len(var4927))
		buff = var4928
		var4914 = var4929
	end
	local buff_1 = buffer.create(var4914)
	buffer.copy(buff_1, 0, buff, 0, var4914)
	
	return buff_1
end

function t_147.decode(p290) --[[ line: 27649 ]]
	-- upvalues: t_147 (ref), protoModule (ref), propTypesModule (ref)
	local var4931 = t_147.new()
	local var4932 = 0
	while var4932 < buffer.len(p290) do
		local _ = nil
		local var4933 = nil
		local var4934, var4935, var4936 = protoModule.readTag(p290, var4932)
		local var4937 = var4934
		var4933 = var4935
		var4932 = var4936
		
		if var4933 == protoModule.wireTypes.varint then
			local _ = nil
			local var4938, var4939 = protoModule.readVarInt(p290, var4932)
			local _ = var4938
			var4932 = var4939
			continue
		end
		if var4933 == protoModule.wireTypes.lengthDelimited then
			if var4937 == 1 then
				local _ = nil
				local var4940, var4941 = protoModule.readBuffer(p290, var4932)
				var4932 = var4941
				var4931.modal_action = propTypesModule.StringProp.decode(var4940)
			elseif var4937 == 2 then
				local _ = nil
				local var4942, var4943 = protoModule.readBuffer(p290, var4932)
				var4932 = var4943
				var4931.modal_variant = propTypesModule.StringProp.decode(var4942)
			elseif var4937 == 3 then
				local _ = nil
				local var4944, var4945 = protoModule.readBuffer(p290, var4932)
				var4932 = var4945
				var4931.modal_sequence = propTypesModule.StringProp.decode(var4944)
			elseif var4937 == 4 then
				local _ = nil
				local var4946, var4947 = protoModule.readBuffer(p290, var4932)
				var4932 = var4947
				var4931.conversation_id = propTypesModule.StringProp.decode(var4946)
			elseif var4937 == 5 then
				local _ = nil
				local var4948, var4949 = protoModule.readBuffer(p290, var4932)
				var4932 = var4949
				var4931.friend_id = propTypesModule.StringProp.decode(var4948)
			else
				local _ = nil
				local var4950, var4951 = protoModule.readVarInt(p290, var4932)
				var4932 = var4951 + var4950
			end
		elseif var4933 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4952, var4953 = protoModule.readFixed32(p290, var4932)
			local _ = var4952
			var4932 = var4953
		elseif var4933 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4954, var4955 = protoModule.readFixed64(p290, var4932)
			local _ = var4954
			var4932 = var4955
		else
			error("Unsupported wire type: " .. var4933)
		end
	end
	return var4931
end

function t_147:jsonEncode() --[[ line: 27714 ]]
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

function t_147:jsonDecode() --[[ line: 27742 ]]
	-- upvalues: t_147 (ref), propTypesModule (ref)
	local var4957 = t_147.new()
	
	if self.modal_action ~= nil then
		var4957.modal_action = propTypesModule.StringProp.jsonDecode(self.modal_action)
	end
	if self.modalAction ~= nil then
		var4957.modal_action = propTypesModule.StringProp.jsonDecode(self.modalAction)
	end
	if self.modal_variant ~= nil then
		var4957.modal_variant = propTypesModule.StringProp.jsonDecode(self.modal_variant)
	end
	if self.modalVariant ~= nil then
		var4957.modal_variant = propTypesModule.StringProp.jsonDecode(self.modalVariant)
	end
	if self.modal_sequence ~= nil then
		var4957.modal_sequence = propTypesModule.StringProp.jsonDecode(self.modal_sequence)
	end
	if self.modalSequence ~= nil then
		var4957.modal_sequence = propTypesModule.StringProp.jsonDecode(self.modalSequence)
	end
	if self.conversation_id ~= nil then
		var4957.conversation_id = propTypesModule.StringProp.jsonDecode(self.conversation_id)
	end
	if self.conversationId ~= nil then
		var4957.conversation_id = propTypesModule.StringProp.jsonDecode(self.conversationId)
	end
	if self.friend_id ~= nil then
		var4957.friend_id = propTypesModule.StringProp.jsonDecode(self.friend_id)
	end
	if self.friendId ~= nil then
		var4957.friend_id = propTypesModule.StringProp.jsonDecode(self.friendId)
	end
	return var4957
end

t_147.descriptor = {
	name = "RecordPartyChatConversationUpsellAcknowledgementAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RecordPartyChatConversationUpsellAcknowledgementAction_Params = t_147
typeRegistryModule.default:register(t.RecordPartyChatConversationUpsellAcknowledgementAction_Params)
local t_148 = {}
t_148.__index = t_148

function t_148.new(p291) --[[ line: 27813 ]]
	-- upvalues: t (ref), t_148 (ref)
	return setmetatable({
		action_type = if p291 == nil or p291.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p291.action_type,
		action_params = if p291 == nil or p291.action_params == nil then nil else p291.action_params
	}, t_148)
end

function t_148:encode() --[[ line: 27822 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4959 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4960, var4961 = protoModule.writeTag(buff, var4959, 1, protoModule.wireTypes.varint)
		var4960, var4961 = protoModule.writeVarInt(var4960, var4961, t.ActionType.toNumber(self.action_type))
		buff = var4960
		var4959 = var4961
	end
	if self.action_params ~= nil then
		local var4962 = self.action_params:encode()
		local var4963, var4964 = protoModule.writeTag(buff, var4959, 2, protoModule.wireTypes.lengthDelimited)
		var4963, var4964 = protoModule.writeBuffer(var4963, var4964, var4962, buffer.len(var4962))
		buff = var4963
		var4959 = var4964
	end
	local buff_1 = buffer.create(var4959)
	buffer.copy(buff_1, 0, buff, 0, var4959)
	
	return buff_1
end

function t_148.decode(p292) --[[ line: 27848 ]]
	-- upvalues: t_148 (ref), protoModule (ref), t (ref)
	local var4966 = t_148.new()
	local var4967 = 0
	while var4967 < buffer.len(p292) do
		local _ = nil
		local var4968 = nil
		local var4969, var4970, var4971 = protoModule.readTag(p292, var4967)
		local var4972 = var4969
		var4968 = var4970
		var4967 = var4971
		
		if var4968 == protoModule.wireTypes.varint then
			if var4972 == 1 then
				local _ = nil
				local var4973, var4974 = protoModule.readVarIntI32(p292, var4967)
				local var4975 = var4973
				var4967 = var4974
				var4966.action_type = t.ActionType.fromNumber(var4975) or var4975
			else
				local _ = nil
				local var4976, var4977 = protoModule.readVarInt(p292, var4967)
				local _ = var4976
				var4967 = var4977
			end
		end
		if var4968 == protoModule.wireTypes.lengthDelimited then
			if var4972 == 2 then
				local _ = nil
				local var4978, var4979 = protoModule.readBuffer(p292, var4967)
				var4967 = var4979
				var4966.action_params = t.RequestFriendshipAction_Params.decode(var4978)
			else
				local _ = nil
				local var4980, var4981 = protoModule.readVarInt(p292, var4967)
				var4967 = var4981 + var4980
			end
		elseif var4968 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4982, var4983 = protoModule.readFixed32(p292, var4967)
			local _ = var4982
			var4967 = var4983
		elseif var4968 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4984, var4985 = protoModule.readFixed64(p292, var4967)
			local _ = var4984
			var4967 = var4985
		else
			error("Unsupported wire type: " .. var4968)
		end
	end
	return var4966
end

function t_148:jsonEncode() --[[ line: 27896 ]]
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

function t_148:jsonDecode() --[[ line: 27918 ]]
	-- upvalues: t_148 (ref), t (ref)
	local var4987 = t_148.new()
	
	if self.action_type ~= nil then
		var4987.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4987.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4987.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4987.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.actionParams)
	end
	return var4987
end

t_148.descriptor = {
	name = "RequestFriendshipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RequestFriendshipAction"
}
t.RequestFriendshipAction = t_148
typeRegistryModule.default:register(t.RequestFriendshipAction)
local t_149 = {}
t_149.__index = t_149

function t_149.new(p293) --[[ line: 27958 ]]
	-- upvalues: t_149 (ref)
	return setmetatable({
		target_user_id = if p293 == nil or p293.target_user_id == nil then nil else p293.target_user_id,
		source = if p293 == nil or p293.source == nil then nil else p293.source
	}, t_149)
end

function t_149:encode() --[[ line: 27967 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4989 = 0
	
	if self.target_user_id ~= nil then
		local var4990 = self.target_user_id:encode()
		local var4991, var4992 = protoModule.writeTag(buff, var4989, 1, protoModule.wireTypes.lengthDelimited)
		var4991, var4992 = protoModule.writeBuffer(var4991, var4992, var4990, buffer.len(var4990))
		buff = var4991
		var4989 = var4992
	end
	if self.source ~= nil then
		local var4993 = self.source:encode()
		local var4994, var4995 = protoModule.writeTag(buff, var4989, 2, protoModule.wireTypes.lengthDelimited)
		var4994, var4995 = protoModule.writeBuffer(var4994, var4995, var4993, buffer.len(var4993))
		buff = var4994
		var4989 = var4995
	end
	local buff_1 = buffer.create(var4989)
	buffer.copy(buff_1, 0, buff, 0, var4989)
	
	return buff_1
end

function t_149.decode(p294) --[[ line: 27988 ]]
	-- upvalues: t_149 (ref), protoModule (ref), propTypesModule (ref)
	local var4997 = t_149.new()
	local var4998 = 0
	while var4998 < buffer.len(p294) do
		local _ = nil
		local var4999 = nil
		local var5000, var5001, var5002 = protoModule.readTag(p294, var4998)
		local var5003 = var5000
		var4999 = var5001
		var4998 = var5002
		
		if var4999 == protoModule.wireTypes.varint then
			local _ = nil
			local var5004, var5005 = protoModule.readVarInt(p294, var4998)
			local _ = var5004
			var4998 = var5005
			continue
		end
		if var4999 == protoModule.wireTypes.lengthDelimited then
			if var5003 == 1 then
				local _ = nil
				local var5006, var5007 = protoModule.readBuffer(p294, var4998)
				var4998 = var5007
				var4997.target_user_id = propTypesModule.StringProp.decode(var5006)
			elseif var5003 == 2 then
				local _ = nil
				local var5008, var5009 = protoModule.readBuffer(p294, var4998)
				var4998 = var5009
				var4997.source = propTypesModule.StringProp.decode(var5008)
			else
				local _ = nil
				local var5010, var5011 = protoModule.readVarInt(p294, var4998)
				var4998 = var5011 + var5010
			end
		elseif var4999 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5012, var5013 = protoModule.readFixed32(p294, var4998)
			local _ = var5012
			var4998 = var5013
		elseif var4999 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5014, var5015 = protoModule.readFixed64(p294, var4998)
			local _ = var5014
			var4998 = var5015
		else
			error("Unsupported wire type: " .. var4999)
		end
	end
	return var4997
end

function t_149:jsonEncode() --[[ line: 28036 ]]
	local t = {}
	
	if self.target_user_id ~= nil then
		t.targetUserId = self.target_user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_149:jsonDecode() --[[ line: 28050 ]]
	-- upvalues: t_149 (ref), propTypesModule (ref)
	local var5017 = t_149.new()
	
	if self.target_user_id ~= nil then
		var5017.target_user_id = propTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		var5017.target_user_id = propTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	if self.source ~= nil then
		var5017.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var5017
end

t_149.descriptor = {
	name = "RequestFriendshipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RequestFriendshipAction_Params = t_149
typeRegistryModule.default:register(t.RequestFriendshipAction_Params)
local t_150 = {}
t_150.__index = t_150

function t_150.new(p295) --[[ line: 28084 ]]
	-- upvalues: t (ref), t_150 (ref)
	return setmetatable({
		action_type = if p295 == nil or p295.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p295.action_type,
		action_params = if p295 == nil or p295.action_params == nil then nil else p295.action_params
	}, t_150)
end

function t_150:encode() --[[ line: 28095 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5019 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5020, var5021 = protoModule.writeTag(buff, var5019, 1, protoModule.wireTypes.varint)
		var5020, var5021 = protoModule.writeVarInt(var5020, var5021, t.ActionType.toNumber(self.action_type))
		buff = var5020
		var5019 = var5021
	end
	if self.action_params ~= nil then
		local var5022 = self.action_params:encode()
		local var5023, var5024 = protoModule.writeTag(buff, var5019, 2, protoModule.wireTypes.lengthDelimited)
		var5023, var5024 = protoModule.writeBuffer(var5023, var5024, var5022, buffer.len(var5022))
		buff = var5023
		var5019 = var5024
	end
	local buff_1 = buffer.create(var5019)
	buffer.copy(buff_1, 0, buff, 0, var5019)
	
	return buff_1
end

function t_150.decode(p296) --[[ line: 28121 ]]
	-- upvalues: t_150 (ref), protoModule (ref), t (ref)
	local var5026 = t_150.new()
	local var5027 = 0
	while var5027 < buffer.len(p296) do
		local _ = nil
		local var5028 = nil
		local var5029, var5030, var5031 = protoModule.readTag(p296, var5027)
		local var5032 = var5029
		var5028 = var5030
		var5027 = var5031
		
		if var5028 == protoModule.wireTypes.varint then
			if var5032 == 1 then
				local _ = nil
				local var5033, var5034 = protoModule.readVarIntI32(p296, var5027)
				local var5035 = var5033
				var5027 = var5034
				var5026.action_type = t.ActionType.fromNumber(var5035) or var5035
			else
				local _ = nil
				local var5036, var5037 = protoModule.readVarInt(p296, var5027)
				local _ = var5036
				var5027 = var5037
			end
		end
		if var5028 == protoModule.wireTypes.lengthDelimited then
			if var5032 == 2 then
				local _ = nil
				local var5038, var5039 = protoModule.readBuffer(p296, var5027)
				var5027 = var5039
				var5026.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.decode(var5038)
			else
				local _ = nil
				local var5040, var5041 = protoModule.readVarInt(p296, var5027)
				var5027 = var5041 + var5040
			end
		elseif var5028 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5042, var5043 = protoModule.readFixed32(p296, var5027)
			local _ = var5042
			var5027 = var5043
		elseif var5028 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5044, var5045 = protoModule.readFixed64(p296, var5027)
			local _ = var5044
			var5027 = var5045
		else
			error("Unsupported wire type: " .. var5028)
		end
	end
	return var5026
end

function t_150:jsonEncode() --[[ line: 28169 ]]
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

function t_150:jsonDecode() --[[ line: 28191 ]]
	-- upvalues: t_150 (ref), t (ref)
	local var5047 = t_150.new()
	
	if self.action_type ~= nil then
		var5047.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5047.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5047.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5047.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var5047
end

t_150.descriptor = {
	name = "OpenTrustedFriendsUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenTrustedFriendsUpsellModalAction"
}
t.OpenTrustedFriendsUpsellModalAction = t_150
typeRegistryModule.default:register(t.OpenTrustedFriendsUpsellModalAction)
local t_151 = {}
t_151.__index = t_151

function t_151.new(p297) --[[ line: 28233 ]]
	-- upvalues: t_151 (ref)
	return setmetatable({
		target_user_id = if p297 == nil or p297.target_user_id == nil then nil else p297.target_user_id
	}, t_151)
end

function t_151:encode() --[[ line: 28241 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5049 = 0
	
	if self.target_user_id ~= nil then
		local var5050 = self.target_user_id:encode()
		local var5051, var5052 = protoModule.writeTag(buff, var5049, 1, protoModule.wireTypes.lengthDelimited)
		var5051, var5052 = protoModule.writeBuffer(var5051, var5052, var5050, buffer.len(var5050))
		buff = var5051
		var5049 = var5052
	end
	local buff_1 = buffer.create(var5049)
	buffer.copy(buff_1, 0, buff, 0, var5049)
	
	return buff_1
end

function t_151.decode(p298) --[[ line: 28258 ]]
	-- upvalues: t_151 (ref), protoModule (ref), propTypesModule (ref)
	local var5054 = t_151.new()
	local var5055 = 0
	while var5055 < buffer.len(p298) do
		local _ = nil
		local var5056 = nil
		local var5057, var5058, var5059 = protoModule.readTag(p298, var5055)
		local var5060 = var5057
		var5056 = var5058
		var5055 = var5059
		
		if var5056 == protoModule.wireTypes.varint then
			local _ = nil
			local var5061, var5062 = protoModule.readVarInt(p298, var5055)
			local _ = var5061
			var5055 = var5062
			continue
		end
		if var5056 == protoModule.wireTypes.lengthDelimited then
			if var5060 == 1 then
				local _ = nil
				local var5063, var5064 = protoModule.readBuffer(p298, var5055)
				var5055 = var5064
				var5054.target_user_id = propTypesModule.StringProp.decode(var5063)
			else
				local _ = nil
				local var5065, var5066 = protoModule.readVarInt(p298, var5055)
				var5055 = var5066 + var5065
			end
		elseif var5056 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5067, var5068 = protoModule.readFixed32(p298, var5055)
			local _ = var5067
			var5055 = var5068
		elseif var5056 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5069, var5070 = protoModule.readFixed64(p298, var5055)
			local _ = var5069
			var5055 = var5070
		else
			error("Unsupported wire type: " .. var5056)
		end
	end
	return var5054
end

function t_151:jsonEncode() --[[ line: 28303 ]]
	local t = {}
	
	if self.target_user_id ~= nil then
		t.targetUserId = self.target_user_id:jsonEncode()
	end
	return t
end

function t_151:jsonDecode() --[[ line: 28315 ]]
	-- upvalues: t_151 (ref), propTypesModule (ref)
	local var5072 = t_151.new()
	
	if self.target_user_id ~= nil then
		var5072.target_user_id = propTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		var5072.target_user_id = propTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	return var5072
end

t_151.descriptor = {
	name = "OpenTrustedFriendsUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenTrustedFriendsUpsellModalAction_Params = t_151
typeRegistryModule.default:register(t.OpenTrustedFriendsUpsellModalAction_Params)
local t_152 = {}
t_152.__index = t_152

function t_152.new(p299) --[[ line: 28347 ]]
	-- upvalues: t (ref), t_152 (ref)
	return setmetatable({
		action_type = if p299 == nil or p299.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p299.action_type,
		action_params = if p299 == nil or p299.action_params == nil then nil else p299.action_params
	}, t_152)
end

function t_152:encode() --[[ line: 28358 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5074 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5075, var5076 = protoModule.writeTag(buff, var5074, 1, protoModule.wireTypes.varint)
		var5075, var5076 = protoModule.writeVarInt(var5075, var5076, t.ActionType.toNumber(self.action_type))
		buff = var5075
		var5074 = var5076
	end
	if self.action_params ~= nil then
		local var5077 = self.action_params:encode()
		local var5078, var5079 = protoModule.writeTag(buff, var5074, 2, protoModule.wireTypes.lengthDelimited)
		var5078, var5079 = protoModule.writeBuffer(var5078, var5079, var5077, buffer.len(var5077))
		buff = var5078
		var5074 = var5079
	end
	local buff_1 = buffer.create(var5074)
	buffer.copy(buff_1, 0, buff, 0, var5074)
	
	return buff_1
end

function t_152.decode(p300) --[[ line: 28384 ]]
	-- upvalues: t_152 (ref), protoModule (ref), t (ref)
	local var5081 = t_152.new()
	local var5082 = 0
	while var5082 < buffer.len(p300) do
		local _ = nil
		local var5083 = nil
		local var5084, var5085, var5086 = protoModule.readTag(p300, var5082)
		local var5087 = var5084
		var5083 = var5085
		var5082 = var5086
		
		if var5083 == protoModule.wireTypes.varint then
			if var5087 == 1 then
				local _ = nil
				local var5088, var5089 = protoModule.readVarIntI32(p300, var5082)
				local var5090 = var5088
				var5082 = var5089
				var5081.action_type = t.ActionType.fromNumber(var5090) or var5090
			else
				local _ = nil
				local var5091, var5092 = protoModule.readVarInt(p300, var5082)
				local _ = var5091
				var5082 = var5092
			end
		end
		if var5083 == protoModule.wireTypes.lengthDelimited then
			if var5087 == 2 then
				local _ = nil
				local var5093, var5094 = protoModule.readBuffer(p300, var5082)
				var5082 = var5094
				var5081.action_params = t.OpenSearchResultsWithQueryAction_Params.decode(var5093)
			else
				local _ = nil
				local var5095, var5096 = protoModule.readVarInt(p300, var5082)
				var5082 = var5096 + var5095
			end
		elseif var5083 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5097, var5098 = protoModule.readFixed32(p300, var5082)
			local _ = var5097
			var5082 = var5098
		elseif var5083 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5099, var5100 = protoModule.readFixed64(p300, var5082)
			local _ = var5099
			var5082 = var5100
		else
			error("Unsupported wire type: " .. var5083)
		end
	end
	return var5081
end

function t_152:jsonEncode() --[[ line: 28432 ]]
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

function t_152:jsonDecode() --[[ line: 28454 ]]
	-- upvalues: t_152 (ref), t (ref)
	local var5102 = t_152.new()
	
	if self.action_type ~= nil then
		var5102.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5102.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5102.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5102.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.actionParams)
	end
	return var5102
end

t_152.descriptor = {
	name = "OpenSearchResultsWithQueryAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSearchResultsWithQueryAction"
}
t.OpenSearchResultsWithQueryAction = t_152
typeRegistryModule.default:register(t.OpenSearchResultsWithQueryAction)
local t_153 = {}
t_153.__index = t_153

function t_153.new(p301) --[[ line: 28496 ]]
	-- upvalues: t_153 (ref)
	return setmetatable({
		search_query = if p301 == nil or p301.search_query == nil then nil else p301.search_query,
		search_type = if p301 == nil or p301.search_type == nil then nil else p301.search_type
	}, t_153)
end

function t_153:encode() --[[ line: 28505 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5104 = 0
	
	if self.search_query ~= nil then
		local var5105 = self.search_query:encode()
		local var5106, var5107 = protoModule.writeTag(buff, var5104, 1, protoModule.wireTypes.lengthDelimited)
		var5106, var5107 = protoModule.writeBuffer(var5106, var5107, var5105, buffer.len(var5105))
		buff = var5106
		var5104 = var5107
	end
	if self.search_type ~= nil then
		local var5108 = self.search_type:encode()
		local var5109, var5110 = protoModule.writeTag(buff, var5104, 2, protoModule.wireTypes.lengthDelimited)
		var5109, var5110 = protoModule.writeBuffer(var5109, var5110, var5108, buffer.len(var5108))
		buff = var5109
		var5104 = var5110
	end
	local buff_1 = buffer.create(var5104)
	buffer.copy(buff_1, 0, buff, 0, var5104)
	
	return buff_1
end

function t_153.decode(p302) --[[ line: 28526 ]]
	-- upvalues: t_153 (ref), protoModule (ref), propTypesModule (ref)
	local var5112 = t_153.new()
	local var5113 = 0
	while var5113 < buffer.len(p302) do
		local _ = nil
		local var5114 = nil
		local var5115, var5116, var5117 = protoModule.readTag(p302, var5113)
		local var5118 = var5115
		var5114 = var5116
		var5113 = var5117
		
		if var5114 == protoModule.wireTypes.varint then
			local _ = nil
			local var5119, var5120 = protoModule.readVarInt(p302, var5113)
			local _ = var5119
			var5113 = var5120
			continue
		end
		if var5114 == protoModule.wireTypes.lengthDelimited then
			if var5118 == 1 then
				local _ = nil
				local var5121, var5122 = protoModule.readBuffer(p302, var5113)
				var5113 = var5122
				var5112.search_query = propTypesModule.StringProp.decode(var5121)
			elseif var5118 == 2 then
				local _ = nil
				local var5123, var5124 = protoModule.readBuffer(p302, var5113)
				var5113 = var5124
				var5112.search_type = propTypesModule.StringProp.decode(var5123)
			else
				local _ = nil
				local var5125, var5126 = protoModule.readVarInt(p302, var5113)
				var5113 = var5126 + var5125
			end
		elseif var5114 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5127, var5128 = protoModule.readFixed32(p302, var5113)
			local _ = var5127
			var5113 = var5128
		elseif var5114 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5129, var5130 = protoModule.readFixed64(p302, var5113)
			local _ = var5129
			var5113 = var5130
		else
			error("Unsupported wire type: " .. var5114)
		end
	end
	return var5112
end

function t_153:jsonEncode() --[[ line: 28574 ]]
	local t = {}
	
	if self.search_query ~= nil then
		t.searchQuery = self.search_query:jsonEncode()
	end
	if self.search_type ~= nil then
		t.searchType = self.search_type:jsonEncode()
	end
	return t
end

function t_153:jsonDecode() --[[ line: 28588 ]]
	-- upvalues: t_153 (ref), propTypesModule (ref)
	local var5132 = t_153.new()
	
	if self.search_query ~= nil then
		var5132.search_query = propTypesModule.StringProp.jsonDecode(self.search_query)
	end
	if self.searchQuery ~= nil then
		var5132.search_query = propTypesModule.StringProp.jsonDecode(self.searchQuery)
	end
	if self.search_type ~= nil then
		var5132.search_type = propTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		var5132.search_type = propTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return var5132
end

t_153.descriptor = {
	name = "OpenSearchResultsWithQueryAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSearchResultsWithQueryAction_Params = t_153
typeRegistryModule.default:register(t.OpenSearchResultsWithQueryAction_Params)
local t_154 = {}
t_154.__index = t_154

function t_154.new(p303) --[[ line: 28629 ]]
	-- upvalues: t (ref), t_154 (ref)
	return setmetatable({
		action_type = if p303 == nil or p303.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p303.action_type,
		action_params = if p303 == nil or p303.action_params == nil then nil else p303.action_params
	}, t_154)
end

function t_154:encode() --[[ line: 28640 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5134 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5135, var5136 = protoModule.writeTag(buff, var5134, 1, protoModule.wireTypes.varint)
		var5135, var5136 = protoModule.writeVarInt(var5135, var5136, t.ActionType.toNumber(self.action_type))
		buff = var5135
		var5134 = var5136
	end
	if self.action_params ~= nil then
		local var5137 = self.action_params:encode()
		local var5138, var5139 = protoModule.writeTag(buff, var5134, 2, protoModule.wireTypes.lengthDelimited)
		var5138, var5139 = protoModule.writeBuffer(var5138, var5139, var5137, buffer.len(var5137))
		buff = var5138
		var5134 = var5139
	end
	local buff_1 = buffer.create(var5134)
	buffer.copy(buff_1, 0, buff, 0, var5134)
	
	return buff_1
end

function t_154.decode(p304) --[[ line: 28666 ]]
	-- upvalues: t_154 (ref), protoModule (ref), t (ref)
	local var5141 = t_154.new()
	local var5142 = 0
	while var5142 < buffer.len(p304) do
		local _ = nil
		local var5143 = nil
		local var5144, var5145, var5146 = protoModule.readTag(p304, var5142)
		local var5147 = var5144
		var5143 = var5145
		var5142 = var5146
		
		if var5143 == protoModule.wireTypes.varint then
			if var5147 == 1 then
				local _ = nil
				local var5148, var5149 = protoModule.readVarIntI32(p304, var5142)
				local var5150 = var5148
				var5142 = var5149
				var5141.action_type = t.ActionType.fromNumber(var5150) or var5150
			else
				local _ = nil
				local var5151, var5152 = protoModule.readVarInt(p304, var5142)
				local _ = var5151
				var5142 = var5152
			end
		end
		if var5143 == protoModule.wireTypes.lengthDelimited then
			if var5147 == 2 then
				local _ = nil
				local var5153, var5154 = protoModule.readBuffer(p304, var5142)
				var5142 = var5154
				var5141.action_params = t.SelectMarketplaceFavoritesCategory_Params.decode(var5153)
			else
				local _ = nil
				local var5155, var5156 = protoModule.readVarInt(p304, var5142)
				var5142 = var5156 + var5155
			end
		elseif var5143 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5157, var5158 = protoModule.readFixed32(p304, var5142)
			local _ = var5157
			var5142 = var5158
		elseif var5143 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5159, var5160 = protoModule.readFixed64(p304, var5142)
			local _ = var5159
			var5142 = var5160
		else
			error("Unsupported wire type: " .. var5143)
		end
	end
	return var5141
end

function t_154:jsonEncode() --[[ line: 28714 ]]
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

function t_154:jsonDecode() --[[ line: 28736 ]]
	-- upvalues: t_154 (ref), t (ref)
	local var5162 = t_154.new()
	
	if self.action_type ~= nil then
		var5162.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5162.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5162.action_params = t.SelectMarketplaceFavoritesCategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5162.action_params = t.SelectMarketplaceFavoritesCategory_Params.jsonDecode(self.actionParams)
	end
	return var5162
end

t_154.descriptor = {
	name = "SelectMarketplaceFavoritesCategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceFavoritesCategory"
}
t.SelectMarketplaceFavoritesCategory = t_154
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesCategory)
local t_155 = {}
t_155.__index = t_155

function t_155.new(p305) --[[ line: 28778 ]]
	-- upvalues: t_155 (ref)
	return setmetatable({
		category_id = if p305 == nil or p305.category_id == nil then nil else p305.category_id
	}, t_155)
end

function t_155:encode() --[[ line: 28786 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5164 = 0
	
	if self.category_id ~= nil then
		local var5165 = self.category_id:encode()
		local var5166, var5167 = protoModule.writeTag(buff, var5164, 1, protoModule.wireTypes.lengthDelimited)
		var5166, var5167 = protoModule.writeBuffer(var5166, var5167, var5165, buffer.len(var5165))
		buff = var5166
		var5164 = var5167
	end
	local buff_1 = buffer.create(var5164)
	buffer.copy(buff_1, 0, buff, 0, var5164)
	
	return buff_1
end

function t_155.decode(p306) --[[ line: 28803 ]]
	-- upvalues: t_155 (ref), protoModule (ref), propTypesModule (ref)
	local var5169 = t_155.new()
	local var5170 = 0
	while var5170 < buffer.len(p306) do
		local _ = nil
		local var5171 = nil
		local var5172, var5173, var5174 = protoModule.readTag(p306, var5170)
		local var5175 = var5172
		var5171 = var5173
		var5170 = var5174
		
		if var5171 == protoModule.wireTypes.varint then
			local _ = nil
			local var5176, var5177 = protoModule.readVarInt(p306, var5170)
			local _ = var5176
			var5170 = var5177
			continue
		end
		if var5171 == protoModule.wireTypes.lengthDelimited then
			if var5175 == 1 then
				local _ = nil
				local var5178, var5179 = protoModule.readBuffer(p306, var5170)
				var5170 = var5179
				var5169.category_id = propTypesModule.StringProp.decode(var5178)
			else
				local _ = nil
				local var5180, var5181 = protoModule.readVarInt(p306, var5170)
				var5170 = var5181 + var5180
			end
		elseif var5171 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5182, var5183 = protoModule.readFixed32(p306, var5170)
			local _ = var5182
			var5170 = var5183
		elseif var5171 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5184, var5185 = protoModule.readFixed64(p306, var5170)
			local _ = var5184
			var5170 = var5185
		else
			error("Unsupported wire type: " .. var5171)
		end
	end
	return var5169
end

function t_155:jsonEncode() --[[ line: 28848 ]]
	local t = {}
	
	if self.category_id ~= nil then
		t.categoryId = self.category_id:jsonEncode()
	end
	return t
end

function t_155:jsonDecode() --[[ line: 28860 ]]
	-- upvalues: t_155 (ref), propTypesModule (ref)
	local var5187 = t_155.new()
	
	if self.category_id ~= nil then
		var5187.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var5187.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	return var5187
end

t_155.descriptor = {
	name = "SelectMarketplaceFavoritesCategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceFavoritesCategory_Params = t_155
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesCategory_Params)
local t_156 = {}
t_156.__index = t_156

function t_156.new(p307) --[[ line: 28891 ]]
	-- upvalues: t (ref), t_156 (ref)
	return setmetatable({
		action_type = if p307 == nil or p307.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p307.action_type,
		action_params = if p307 == nil or p307.action_params == nil then nil else p307.action_params
	}, t_156)
end

function t_156:encode() --[[ line: 28902 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5189 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5190, var5191 = protoModule.writeTag(buff, var5189, 1, protoModule.wireTypes.varint)
		var5190, var5191 = protoModule.writeVarInt(var5190, var5191, t.ActionType.toNumber(self.action_type))
		buff = var5190
		var5189 = var5191
	end
	if self.action_params ~= nil then
		local var5192 = self.action_params:encode()
		local var5193, var5194 = protoModule.writeTag(buff, var5189, 2, protoModule.wireTypes.lengthDelimited)
		var5193, var5194 = protoModule.writeBuffer(var5193, var5194, var5192, buffer.len(var5192))
		buff = var5193
		var5189 = var5194
	end
	local buff_1 = buffer.create(var5189)
	buffer.copy(buff_1, 0, buff, 0, var5189)
	
	return buff_1
end

function t_156.decode(p308) --[[ line: 28928 ]]
	-- upvalues: t_156 (ref), protoModule (ref), t (ref)
	local var5196 = t_156.new()
	local var5197 = 0
	while var5197 < buffer.len(p308) do
		local _ = nil
		local var5198 = nil
		local var5199, var5200, var5201 = protoModule.readTag(p308, var5197)
		local var5202 = var5199
		var5198 = var5200
		var5197 = var5201
		
		if var5198 == protoModule.wireTypes.varint then
			if var5202 == 1 then
				local _ = nil
				local var5203, var5204 = protoModule.readVarIntI32(p308, var5197)
				local var5205 = var5203
				var5197 = var5204
				var5196.action_type = t.ActionType.fromNumber(var5205) or var5205
			else
				local _ = nil
				local var5206, var5207 = protoModule.readVarInt(p308, var5197)
				local _ = var5206
				var5197 = var5207
			end
		end
		if var5198 == protoModule.wireTypes.lengthDelimited then
			if var5202 == 2 then
				local _ = nil
				local var5208, var5209 = protoModule.readBuffer(p308, var5197)
				var5197 = var5209
				var5196.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.decode(var5208)
			else
				local _ = nil
				local var5210, var5211 = protoModule.readVarInt(p308, var5197)
				var5197 = var5211 + var5210
			end
		elseif var5198 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5212, var5213 = protoModule.readFixed32(p308, var5197)
			local _ = var5212
			var5197 = var5213
		elseif var5198 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5214, var5215 = protoModule.readFixed64(p308, var5197)
			local _ = var5214
			var5197 = var5215
		else
			error("Unsupported wire type: " .. var5198)
		end
	end
	return var5196
end

function t_156:jsonEncode() --[[ line: 28976 ]]
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

function t_156:jsonDecode() --[[ line: 28998 ]]
	-- upvalues: t_156 (ref), t (ref)
	local var5217 = t_156.new()
	
	if self.action_type ~= nil then
		var5217.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5217.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5217.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5217.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.jsonDecode(self.actionParams)
	end
	return var5217
end

t_156.descriptor = {
	name = "SelectMarketplaceFavoritesSubcategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceFavoritesSubcategory"
}
t.SelectMarketplaceFavoritesSubcategory = t_156
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesSubcategory)
local t_157 = {}
t_157.__index = t_157

function t_157.new(p309) --[[ line: 29040 ]]
	-- upvalues: t_157 (ref)
	return setmetatable({
		subcategory_id = if p309 == nil or p309.subcategory_id == nil then nil else p309.subcategory_id
	}, t_157)
end

function t_157:encode() --[[ line: 29048 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5219 = 0
	
	if self.subcategory_id ~= nil then
		local var5220 = self.subcategory_id:encode()
		local var5221, var5222 = protoModule.writeTag(buff, var5219, 1, protoModule.wireTypes.lengthDelimited)
		var5221, var5222 = protoModule.writeBuffer(var5221, var5222, var5220, buffer.len(var5220))
		buff = var5221
		var5219 = var5222
	end
	local buff_1 = buffer.create(var5219)
	buffer.copy(buff_1, 0, buff, 0, var5219)
	
	return buff_1
end

function t_157.decode(p310) --[[ line: 29065 ]]
	-- upvalues: t_157 (ref), protoModule (ref), propTypesModule (ref)
	local var5224 = t_157.new()
	local var5225 = 0
	while var5225 < buffer.len(p310) do
		local _ = nil
		local var5226 = nil
		local var5227, var5228, var5229 = protoModule.readTag(p310, var5225)
		local var5230 = var5227
		var5226 = var5228
		var5225 = var5229
		
		if var5226 == protoModule.wireTypes.varint then
			local _ = nil
			local var5231, var5232 = protoModule.readVarInt(p310, var5225)
			local _ = var5231
			var5225 = var5232
			continue
		end
		if var5226 == protoModule.wireTypes.lengthDelimited then
			if var5230 == 1 then
				local _ = nil
				local var5233, var5234 = protoModule.readBuffer(p310, var5225)
				var5225 = var5234
				var5224.subcategory_id = propTypesModule.StringProp.decode(var5233)
			else
				local _ = nil
				local var5235, var5236 = protoModule.readVarInt(p310, var5225)
				var5225 = var5236 + var5235
			end
		elseif var5226 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5237, var5238 = protoModule.readFixed32(p310, var5225)
			local _ = var5237
			var5225 = var5238
		elseif var5226 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5239, var5240 = protoModule.readFixed64(p310, var5225)
			local _ = var5239
			var5225 = var5240
		else
			error("Unsupported wire type: " .. var5226)
		end
	end
	return var5224
end

function t_157:jsonEncode() --[[ line: 29110 ]]
	local t = {}
	
	if self.subcategory_id ~= nil then
		t.subcategoryId = self.subcategory_id:jsonEncode()
	end
	return t
end

function t_157:jsonDecode() --[[ line: 29122 ]]
	-- upvalues: t_157 (ref), propTypesModule (ref)
	local var5242 = t_157.new()
	
	if self.subcategory_id ~= nil then
		var5242.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var5242.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	return var5242
end

t_157.descriptor = {
	name = "SelectMarketplaceFavoritesSubcategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceFavoritesSubcategory_Params = t_157
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesSubcategory_Params)
local t_158 = {}
t_158.__index = t_158

function t_158.new(p311) --[[ line: 29154 ]]
	-- upvalues: t (ref), t_158 (ref)
	return setmetatable({
		action_type = if p311 == nil or p311.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p311.action_type,
		action_params = if p311 == nil or p311.action_params == nil then nil else p311.action_params
	}, t_158)
end

function t_158:encode() --[[ line: 29165 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5244 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5245, var5246 = protoModule.writeTag(buff, var5244, 1, protoModule.wireTypes.varint)
		var5245, var5246 = protoModule.writeVarInt(var5245, var5246, t.ActionType.toNumber(self.action_type))
		buff = var5245
		var5244 = var5246
	end
	if self.action_params ~= nil then
		local var5247 = self.action_params:encode()
		local var5248, var5249 = protoModule.writeTag(buff, var5244, 2, protoModule.wireTypes.lengthDelimited)
		var5248, var5249 = protoModule.writeBuffer(var5248, var5249, var5247, buffer.len(var5247))
		buff = var5248
		var5244 = var5249
	end
	local buff_1 = buffer.create(var5244)
	buffer.copy(buff_1, 0, buff, 0, var5244)
	
	return buff_1
end

function t_158.decode(p312) --[[ line: 29191 ]]
	-- upvalues: t_158 (ref), protoModule (ref), t (ref)
	local var5251 = t_158.new()
	local var5252 = 0
	while var5252 < buffer.len(p312) do
		local _ = nil
		local var5253 = nil
		local var5254, var5255, var5256 = protoModule.readTag(p312, var5252)
		local var5257 = var5254
		var5253 = var5255
		var5252 = var5256
		
		if var5253 == protoModule.wireTypes.varint then
			if var5257 == 1 then
				local _ = nil
				local var5258, var5259 = protoModule.readVarIntI32(p312, var5252)
				local var5260 = var5258
				var5252 = var5259
				var5251.action_type = t.ActionType.fromNumber(var5260) or var5260
			else
				local _ = nil
				local var5261, var5262 = protoModule.readVarInt(p312, var5252)
				local _ = var5261
				var5252 = var5262
			end
		end
		if var5253 == protoModule.wireTypes.lengthDelimited then
			if var5257 == 2 then
				local _ = nil
				local var5263, var5264 = protoModule.readBuffer(p312, var5252)
				var5252 = var5264
				var5251.action_params = t.PinExperienceShortcutAction_Params.decode(var5263)
			else
				local _ = nil
				local var5265, var5266 = protoModule.readVarInt(p312, var5252)
				var5252 = var5266 + var5265
			end
		elseif var5253 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5267, var5268 = protoModule.readFixed32(p312, var5252)
			local _ = var5267
			var5252 = var5268
		elseif var5253 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5269, var5270 = protoModule.readFixed64(p312, var5252)
			local _ = var5269
			var5252 = var5270
		else
			error("Unsupported wire type: " .. var5253)
		end
	end
	return var5251
end

function t_158:jsonEncode() --[[ line: 29239 ]]
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

function t_158:jsonDecode() --[[ line: 29261 ]]
	-- upvalues: t_158 (ref), t (ref)
	local var5272 = t_158.new()
	
	if self.action_type ~= nil then
		var5272.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5272.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5272.action_params = t.PinExperienceShortcutAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5272.action_params = t.PinExperienceShortcutAction_Params.jsonDecode(self.actionParams)
	end
	return var5272
end

t_158.descriptor = {
	name = "PinExperienceShortcutAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.PinExperienceShortcutAction"
}
t.PinExperienceShortcutAction = t_158
typeRegistryModule.default:register(t.PinExperienceShortcutAction)
local t_159 = {}
t_159.__index = t_159

function t_159.new(p313) --[[ line: 29301 ]]
	-- upvalues: t_159 (ref)
	return setmetatable({
		place_id = if p313 == nil or p313.place_id == nil then nil else p313.place_id,
		universe_id = if p313 == nil or p313.universe_id == nil then nil else p313.universe_id,
		game_name = if p313 == nil or p313.game_name == nil then nil else p313.game_name
	}, t_159)
end

function t_159:encode() --[[ line: 29311 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5274 = 0
	
	if self.place_id ~= nil then
		local var5275 = self.place_id:encode()
		local var5276, var5277 = protoModule.writeTag(buff, var5274, 1, protoModule.wireTypes.lengthDelimited)
		var5276, var5277 = protoModule.writeBuffer(var5276, var5277, var5275, buffer.len(var5275))
		buff = var5276
		var5274 = var5277
	end
	if self.universe_id ~= nil then
		local var5278 = self.universe_id:encode()
		local var5279, var5280 = protoModule.writeTag(buff, var5274, 2, protoModule.wireTypes.lengthDelimited)
		var5279, var5280 = protoModule.writeBuffer(var5279, var5280, var5278, buffer.len(var5278))
		buff = var5279
		var5274 = var5280
	end
	if self.game_name ~= nil then
		local var5281 = self.game_name:encode()
		local var5282, var5283 = protoModule.writeTag(buff, var5274, 3, protoModule.wireTypes.lengthDelimited)
		var5282, var5283 = protoModule.writeBuffer(var5282, var5283, var5281, buffer.len(var5281))
		buff = var5282
		var5274 = var5283
	end
	local buff_1 = buffer.create(var5274)
	buffer.copy(buff_1, 0, buff, 0, var5274)
	
	return buff_1
end

function t_159.decode(p314) --[[ line: 29338 ]]
	-- upvalues: t_159 (ref), protoModule (ref), propTypesModule (ref)
	local var5285 = t_159.new()
	local var5286 = 0
	while var5286 < buffer.len(p314) do
		local _ = nil
		local var5287 = nil
		local var5288, var5289, var5290 = protoModule.readTag(p314, var5286)
		local var5291 = var5288
		var5287 = var5289
		var5286 = var5290
		
		if var5287 == protoModule.wireTypes.varint then
			local _ = nil
			local var5292, var5293 = protoModule.readVarInt(p314, var5286)
			local _ = var5292
			var5286 = var5293
			continue
		end
		if var5287 == protoModule.wireTypes.lengthDelimited then
			if var5291 == 1 then
				local _ = nil
				local var5294, var5295 = protoModule.readBuffer(p314, var5286)
				var5286 = var5295
				var5285.place_id = propTypesModule.StringProp.decode(var5294)
			elseif var5291 == 2 then
				local _ = nil
				local var5296, var5297 = protoModule.readBuffer(p314, var5286)
				var5286 = var5297
				var5285.universe_id = propTypesModule.StringProp.decode(var5296)
			elseif var5291 == 3 then
				local _ = nil
				local var5298, var5299 = protoModule.readBuffer(p314, var5286)
				var5286 = var5299
				var5285.game_name = propTypesModule.StringProp.decode(var5298)
			else
				local _ = nil
				local var5300, var5301 = protoModule.readVarInt(p314, var5286)
				var5286 = var5301 + var5300
			end
		elseif var5287 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5302, var5303 = protoModule.readFixed32(p314, var5286)
			local _ = var5302
			var5286 = var5303
		elseif var5287 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5304, var5305 = protoModule.readFixed64(p314, var5286)
			local _ = var5304
			var5286 = var5305
		else
			error("Unsupported wire type: " .. var5287)
		end
	end
	return var5285
end

function t_159:jsonEncode() --[[ line: 29391 ]]
	local t = {}
	
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.game_name ~= nil then
		t.gameName = self.game_name:jsonEncode()
	end
	return t
end

function t_159:jsonDecode() --[[ line: 29409 ]]
	-- upvalues: t_159 (ref), propTypesModule (ref)
	local var5307 = t_159.new()
	
	if self.place_id ~= nil then
		var5307.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var5307.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var5307.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var5307.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.game_name ~= nil then
		var5307.game_name = propTypesModule.StringProp.jsonDecode(self.game_name)
	end
	if self.gameName ~= nil then
		var5307.game_name = propTypesModule.StringProp.jsonDecode(self.gameName)
	end
	return var5307
end

t_159.descriptor = {
	name = "PinExperienceShortcutAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.PinExperienceShortcutAction_Params = t_159
typeRegistryModule.default:register(t.PinExperienceShortcutAction_Params)
local t_160 = {}
t_160.__index = t_160

function t_160.new(p315) --[[ line: 29456 ]]
	-- upvalues: t (ref), t_160 (ref)
	return setmetatable({
		action_type = if p315 == nil or p315.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p315.action_type,
		action_params = if p315 == nil or p315.action_params == nil then nil else p315.action_params
	}, t_160)
end

function t_160:encode() --[[ line: 29465 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5309 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5310, var5311 = protoModule.writeTag(buff, var5309, 1, protoModule.wireTypes.varint)
		var5310, var5311 = protoModule.writeVarInt(var5310, var5311, t.ActionType.toNumber(self.action_type))
		buff = var5310
		var5309 = var5311
	end
	if self.action_params ~= nil then
		local var5312 = self.action_params:encode()
		local var5313, var5314 = protoModule.writeTag(buff, var5309, 2, protoModule.wireTypes.lengthDelimited)
		var5313, var5314 = protoModule.writeBuffer(var5313, var5314, var5312, buffer.len(var5312))
		buff = var5313
		var5309 = var5314
	end
	local buff_1 = buffer.create(var5309)
	buffer.copy(buff_1, 0, buff, 0, var5309)
	
	return buff_1
end

function t_160.decode(p316) --[[ line: 29491 ]]
	-- upvalues: t_160 (ref), protoModule (ref), t (ref)
	local var5316 = t_160.new()
	local var5317 = 0
	while var5317 < buffer.len(p316) do
		local _ = nil
		local var5318 = nil
		local var5319, var5320, var5321 = protoModule.readTag(p316, var5317)
		local var5322 = var5319
		var5318 = var5320
		var5317 = var5321
		
		if var5318 == protoModule.wireTypes.varint then
			if var5322 == 1 then
				local _ = nil
				local var5323, var5324 = protoModule.readVarIntI32(p316, var5317)
				local var5325 = var5323
				var5317 = var5324
				var5316.action_type = t.ActionType.fromNumber(var5325) or var5325
			else
				local _ = nil
				local var5326, var5327 = protoModule.readVarInt(p316, var5317)
				local _ = var5326
				var5317 = var5327
			end
		end
		if var5318 == protoModule.wireTypes.lengthDelimited then
			if var5322 == 2 then
				local _ = nil
				local var5328, var5329 = protoModule.readBuffer(p316, var5317)
				var5317 = var5329
				var5316.action_params = t.DownloadAppAction_Params.decode(var5328)
			else
				local _ = nil
				local var5330, var5331 = protoModule.readVarInt(p316, var5317)
				var5317 = var5331 + var5330
			end
		elseif var5318 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5332, var5333 = protoModule.readFixed32(p316, var5317)
			local _ = var5332
			var5317 = var5333
		elseif var5318 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5334, var5335 = protoModule.readFixed64(p316, var5317)
			local _ = var5334
			var5317 = var5335
		else
			error("Unsupported wire type: " .. var5318)
		end
	end
	return var5316
end

function t_160:jsonEncode() --[[ line: 29539 ]]
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

function t_160:jsonDecode() --[[ line: 29561 ]]
	-- upvalues: t_160 (ref), t (ref)
	local var5337 = t_160.new()
	
	if self.action_type ~= nil then
		var5337.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5337.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5337.action_params = t.DownloadAppAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5337.action_params = t.DownloadAppAction_Params.jsonDecode(self.actionParams)
	end
	return var5337
end

t_160.descriptor = {
	name = "DownloadAppAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DownloadAppAction"
}
t.DownloadAppAction = t_160
typeRegistryModule.default:register(t.DownloadAppAction)
local t_161 = {}
t_161.__index = t_161

function t_161.new(p317) --[[ line: 29601 ]]
	-- upvalues: t_161 (ref)
	return setmetatable({
		source = if p317 == nil or p317.source == nil then nil else p317.source,
		download_type = if p317 == nil or p317.download_type == nil then nil else p317.download_type
	}, t_161)
end

function t_161:encode() --[[ line: 29608 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5339 = 0
	
	if self.source ~= nil then
		local var5340 = self.source:encode()
		local var5341, var5342 = protoModule.writeTag(buff, var5339, 1, protoModule.wireTypes.lengthDelimited)
		var5341, var5342 = protoModule.writeBuffer(var5341, var5342, var5340, buffer.len(var5340))
		buff = var5341
		var5339 = var5342
	end
	if self.download_type ~= nil then
		local var5343 = self.download_type:encode()
		local var5344, var5345 = protoModule.writeTag(buff, var5339, 2, protoModule.wireTypes.lengthDelimited)
		var5344, var5345 = protoModule.writeBuffer(var5344, var5345, var5343, buffer.len(var5343))
		buff = var5344
		var5339 = var5345
	end
	local buff_1 = buffer.create(var5339)
	buffer.copy(buff_1, 0, buff, 0, var5339)
	
	return buff_1
end

function t_161.decode(p318) --[[ line: 29629 ]]
	-- upvalues: t_161 (ref), protoModule (ref), propTypesModule (ref)
	local var5347 = t_161.new()
	local var5348 = 0
	while var5348 < buffer.len(p318) do
		local _ = nil
		local var5349 = nil
		local var5350, var5351, var5352 = protoModule.readTag(p318, var5348)
		local var5353 = var5350
		var5349 = var5351
		var5348 = var5352
		
		if var5349 == protoModule.wireTypes.varint then
			local _ = nil
			local var5354, var5355 = protoModule.readVarInt(p318, var5348)
			local _ = var5354
			var5348 = var5355
			continue
		end
		if var5349 == protoModule.wireTypes.lengthDelimited then
			if var5353 == 1 then
				local _ = nil
				local var5356, var5357 = protoModule.readBuffer(p318, var5348)
				var5348 = var5357
				var5347.source = propTypesModule.StringProp.decode(var5356)
			elseif var5353 == 2 then
				local _ = nil
				local var5358, var5359 = protoModule.readBuffer(p318, var5348)
				var5348 = var5359
				var5347.download_type = propTypesModule.StringProp.decode(var5358)
			else
				local _ = nil
				local var5360, var5361 = protoModule.readVarInt(p318, var5348)
				var5348 = var5361 + var5360
			end
		elseif var5349 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5362, var5363 = protoModule.readFixed32(p318, var5348)
			local _ = var5362
			var5348 = var5363
		elseif var5349 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5364, var5365 = protoModule.readFixed64(p318, var5348)
			local _ = var5364
			var5348 = var5365
		else
			error("Unsupported wire type: " .. var5349)
		end
	end
	return var5347
end

function t_161:jsonEncode() --[[ line: 29677 ]]
	local t = {}
	
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	if self.download_type ~= nil then
		t.downloadType = self.download_type:jsonEncode()
	end
	return t
end

function t_161:jsonDecode() --[[ line: 29691 ]]
	-- upvalues: t_161 (ref), propTypesModule (ref)
	local var5367 = t_161.new()
	
	if self.source ~= nil then
		var5367.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.download_type ~= nil then
		var5367.download_type = propTypesModule.StringProp.jsonDecode(self.download_type)
	end
	if self.downloadType ~= nil then
		var5367.download_type = propTypesModule.StringProp.jsonDecode(self.downloadType)
	end
	return var5367
end

t_161.descriptor = {
	name = "DownloadAppAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DownloadAppAction_Params = t_161
typeRegistryModule.default:register(t.DownloadAppAction_Params)
local t_162 = {}
t_162.__index = t_162

function t_162.new(p319) --[[ line: 29725 ]]
	-- upvalues: t (ref), t_162 (ref)
	return setmetatable({
		action_type = if p319 == nil or p319.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p319.action_type,
		action_params = if p319 == nil or p319.action_params == nil then nil else p319.action_params
	}, t_162)
end

function t_162:encode() --[[ line: 29734 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5369 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5370, var5371 = protoModule.writeTag(buff, var5369, 1, protoModule.wireTypes.varint)
		var5370, var5371 = protoModule.writeVarInt(var5370, var5371, t.ActionType.toNumber(self.action_type))
		buff = var5370
		var5369 = var5371
	end
	if self.action_params ~= nil then
		local var5372 = self.action_params:encode()
		local var5373, var5374 = protoModule.writeTag(buff, var5369, 2, protoModule.wireTypes.lengthDelimited)
		var5373, var5374 = protoModule.writeBuffer(var5373, var5374, var5372, buffer.len(var5372))
		buff = var5373
		var5369 = var5374
	end
	local buff_1 = buffer.create(var5369)
	buffer.copy(buff_1, 0, buff, 0, var5369)
	
	return buff_1
end

function t_162.decode(p320) --[[ line: 29760 ]]
	-- upvalues: t_162 (ref), protoModule (ref), t (ref)
	local var5376 = t_162.new()
	local var5377 = 0
	while var5377 < buffer.len(p320) do
		local _ = nil
		local var5378 = nil
		local var5379, var5380, var5381 = protoModule.readTag(p320, var5377)
		local var5382 = var5379
		var5378 = var5380
		var5377 = var5381
		
		if var5378 == protoModule.wireTypes.varint then
			if var5382 == 1 then
				local _ = nil
				local var5383, var5384 = protoModule.readVarIntI32(p320, var5377)
				local var5385 = var5383
				var5377 = var5384
				var5376.action_type = t.ActionType.fromNumber(var5385) or var5385
			else
				local _ = nil
				local var5386, var5387 = protoModule.readVarInt(p320, var5377)
				local _ = var5386
				var5377 = var5387
			end
		end
		if var5378 == protoModule.wireTypes.lengthDelimited then
			if var5382 == 2 then
				local _ = nil
				local var5388, var5389 = protoModule.readBuffer(p320, var5377)
				var5377 = var5389
				var5376.action_params = t.ActionSequenceAction_Params.decode(var5388)
			else
				local _ = nil
				local var5390, var5391 = protoModule.readVarInt(p320, var5377)
				var5377 = var5391 + var5390
			end
		elseif var5378 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5392, var5393 = protoModule.readFixed32(p320, var5377)
			local _ = var5392
			var5377 = var5393
		elseif var5378 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5394, var5395 = protoModule.readFixed64(p320, var5377)
			local _ = var5394
			var5377 = var5395
		else
			error("Unsupported wire type: " .. var5378)
		end
	end
	return var5376
end

function t_162:jsonEncode() --[[ line: 29808 ]]
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

function t_162:jsonDecode() --[[ line: 29830 ]]
	-- upvalues: t_162 (ref), t (ref)
	local var5397 = t_162.new()
	
	if self.action_type ~= nil then
		var5397.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5397.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5397.action_params = t.ActionSequenceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5397.action_params = t.ActionSequenceAction_Params.jsonDecode(self.actionParams)
	end
	return var5397
end

t_162.descriptor = {
	name = "ActionSequenceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionSequenceAction"
}
t.ActionSequenceAction = t_162
typeRegistryModule.default:register(t.ActionSequenceAction)
local t_163 = {}
t_163.__index = t_163

function t_163.new(p321) --[[ line: 29870 ]]
	-- upvalues: t_163 (ref)
	return setmetatable({
		actions = if p321 == nil or p321.actions == nil then {} else p321.actions
	}, t_163)
end

function t_163:encode() --[[ line: 29878 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5399 = 0
	
	if self.actions ~= nil and #self.actions > 0 then
		for i, v in self.actions do
			local var5400 = v:encode()
			local var5401, var5402 = protoModule.writeTag(buff, var5399, 1, protoModule.wireTypes.lengthDelimited)
			var5401, var5402 = protoModule.writeBuffer(var5401, var5402, var5400, buffer.len(var5400))
			buff = var5401
			var5399 = var5402
		end
	end
	local buff_1 = buffer.create(var5399)
	buffer.copy(buff_1, 0, buff, 0, var5399)
	
	return buff_1
end

function t_163.decode(p322) --[[ line: 29895 ]]
	-- upvalues: t_163 (ref), protoModule (ref), t (ref)
	local var5404 = t_163.new()
	local var5405 = 0
	while var5405 < buffer.len(p322) do
		local _ = nil
		local var5406 = nil
		local var5407, var5408, var5409 = protoModule.readTag(p322, var5405)
		local var5410 = var5407
		var5406 = var5408
		var5405 = var5409
		
		if var5406 == protoModule.wireTypes.varint then
			local _ = nil
			local var5411, var5412 = protoModule.readVarInt(p322, var5405)
			local _ = var5411
			var5405 = var5412
			continue
		end
		if var5406 == protoModule.wireTypes.lengthDelimited then
			if var5410 == 1 then
				local _ = nil
				local var5413, var5414 = protoModule.readBuffer(p322, var5405)
				var5405 = var5414
				table.insert(var5404.actions, t.ActionProp.decode(var5413))
			else
				local _ = nil
				local var5415, var5416 = protoModule.readVarInt(p322, var5405)
				var5405 = var5416 + var5415
			end
		elseif var5406 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5417, var5418 = protoModule.readFixed32(p322, var5405)
			local _ = var5417
			var5405 = var5418
		elseif var5406 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5419, var5420 = protoModule.readFixed64(p322, var5405)
			local _ = var5419
			var5405 = var5420
		else
			error("Unsupported wire type: " .. var5406)
		end
	end
	return var5404
end

function t_163:jsonEncode() --[[ line: 29938 ]]
	local t = {}
	
	if self.actions ~= nil and #self.actions > 0 then
		local t_1 = {}
		
		for i, v in self.actions do
			table.insert(t_1, v:jsonEncode())
		end
		t.actions = t_1
	end
	return t
end

function t_163:jsonDecode() --[[ line: 29952 ]]
	-- upvalues: t_163 (ref), t (ref)
	local var5423 = t_163.new()
	
	if self.actions ~= nil then
		local t_1 = {}
		
		for i, v in self.actions do
			table.insert(t_1, t.ActionProp.jsonDecode(v))
		end
		var5423.actions = t_1
	end
	return var5423
end

t_163.descriptor = {
	name = "ActionSequenceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ActionSequenceAction_Params = t_163
typeRegistryModule.default:register(t.ActionSequenceAction_Params)
local t_164 = {}
t_164.__index = t_164

function t_164.new(p323) --[[ line: 29981 ]]
	-- upvalues: t_164 (ref)
	return setmetatable({
		kind = if p323 == nil or p323.kind == nil then nil else p323.kind,
		telemetry_handler = if p323 == nil or p323.telemetry_handler == nil then nil else p323.telemetry_handler,
		accessibility_label = if p323 == nil or p323.accessibility_label == nil then nil else p323.accessibility_label,
		skip_unified_logging = if p323 == nil or p323.skip_unified_logging == nil then nil else p323.skip_unified_logging
	}, t_164)
end

function t_164:encode() --[[ line: 29994 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5426 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "dismiss_dialog_action" then
			local var5427 = self.kind.value:encode()
			local var5428, var5429 = protoModule.writeTag(buff, var5426, 1, protoModule.wireTypes.lengthDelimited)
			var5428, var5429 = protoModule.writeBuffer(var5428, var5429, var5427, buffer.len(var5427))
			buff = var5428
			var5426 = var5429
		elseif self.kind.type == "link_action" then
			local var5430 = self.kind.value:encode()
			local var5431, var5432 = protoModule.writeTag(buff, var5426, 2, protoModule.wireTypes.lengthDelimited)
			var5431, var5432 = protoModule.writeBuffer(var5431, var5432, var5430, buffer.len(var5430))
			buff = var5431
			var5426 = var5432
		elseif self.kind.type == "open_game_details_action" then
			local var5433 = self.kind.value:encode()
			local var5434, var5435 = protoModule.writeTag(buff, var5426, 3, protoModule.wireTypes.lengthDelimited)
			var5434, var5435 = protoModule.writeBuffer(var5434, var5435, var5433, buffer.len(var5433))
			buff = var5434
			var5426 = var5435
		elseif self.kind.type == "open_join_friends_action" then
			local var5436 = self.kind.value:encode()
			local var5437, var5438 = protoModule.writeTag(buff, var5426, 4, protoModule.wireTypes.lengthDelimited)
			var5437, var5438 = protoModule.writeBuffer(var5437, var5438, var5436, buffer.len(var5436))
			buff = var5437
			var5426 = var5438
		elseif self.kind.type == "open_marketplace_try_on_action" then
			local var5439 = self.kind.value:encode()
			local var5440, var5441 = protoModule.writeTag(buff, var5426, 5, protoModule.wireTypes.lengthDelimited)
			var5440, var5441 = protoModule.writeBuffer(var5440, var5441, var5439, buffer.len(var5439))
			buff = var5440
			var5426 = var5441
		elseif self.kind.type == "open_see_all_action" then
			local var5442 = self.kind.value:encode()
			local var5443, var5444 = protoModule.writeTag(buff, var5426, 6, protoModule.wireTypes.lengthDelimited)
			var5443, var5444 = protoModule.writeBuffer(var5443, var5444, var5442, buffer.len(var5442))
			buff = var5443
			var5426 = var5444
		elseif self.kind.type == "open_sponsored_tooltip_action" then
			local var5445 = self.kind.value:encode()
			local var5446, var5447 = protoModule.writeTag(buff, var5426, 7, protoModule.wireTypes.lengthDelimited)
			var5446, var5447 = protoModule.writeBuffer(var5446, var5447, var5445, buffer.len(var5445))
			buff = var5446
			var5426 = var5447
		elseif self.kind.type == "play_button_click_action" then
			local var5448 = self.kind.value:encode()
			local var5449, var5450 = protoModule.writeTag(buff, var5426, 8, protoModule.wireTypes.lengthDelimited)
			var5449, var5450 = protoModule.writeBuffer(var5449, var5450, var5448, buffer.len(var5448))
			buff = var5449
			var5426 = var5450
		elseif self.kind.type == "update_user_settings_action" then
			local var5451 = self.kind.value:encode()
			local var5452, var5453 = protoModule.writeTag(buff, var5426, 9, protoModule.wireTypes.lengthDelimited)
			var5452, var5453 = protoModule.writeBuffer(var5452, var5453, var5451, buffer.len(var5451))
			buff = var5452
			var5426 = var5453
		elseif self.kind.type == "open_tooltip_action" then
			local var5454 = self.kind.value:encode()
			local var5455, var5456 = protoModule.writeTag(buff, var5426, 10, protoModule.wireTypes.lengthDelimited)
			var5455, var5456 = protoModule.writeBuffer(var5455, var5456, var5454, buffer.len(var5454))
			buff = var5455
			var5426 = var5456
		elseif self.kind.type == "open_badge_details_action" then
			local var5457 = self.kind.value:encode()
			local var5458, var5459 = protoModule.writeTag(buff, var5426, 11, protoModule.wireTypes.lengthDelimited)
			var5458, var5459 = protoModule.writeBuffer(var5458, var5459, var5457, buffer.len(var5457))
			buff = var5458
			var5426 = var5459
		elseif self.kind.type == "load_more_from_api_action" then
			local var5460 = self.kind.value:encode()
			local var5461, var5462 = protoModule.writeTag(buff, var5426, 12, protoModule.wireTypes.lengthDelimited)
			var5461, var5462 = protoModule.writeBuffer(var5461, var5462, var5460, buffer.len(var5460))
			buff = var5461
			var5426 = var5462
		elseif self.kind.type == "share_action" then
			local var5463 = self.kind.value:encode()
			local var5464, var5465 = protoModule.writeTag(buff, var5426, 13, protoModule.wireTypes.lengthDelimited)
			var5464, var5465 = protoModule.writeBuffer(var5464, var5465, var5463, buffer.len(var5463))
			buff = var5464
			var5426 = var5465
		elseif self.kind.type == "open_abuse_report_action" then
			local var5466 = self.kind.value:encode()
			local var5467, var5468 = protoModule.writeTag(buff, var5426, 14, protoModule.wireTypes.lengthDelimited)
			var5467, var5468 = protoModule.writeBuffer(var5467, var5468, var5466, buffer.len(var5466))
			buff = var5467
			var5426 = var5468
		elseif self.kind.type == "remove_badge_from_inventory_action" then
			local var5469 = self.kind.value:encode()
			local var5470, var5471 = protoModule.writeTag(buff, var5426, 15, protoModule.wireTypes.lengthDelimited)
			var5470, var5471 = protoModule.writeBuffer(var5470, var5471, var5469, buffer.len(var5469))
			buff = var5470
			var5426 = var5471
		elseif self.kind.type == "open_profile_action" then
			local var5472 = self.kind.value:encode()
			local var5473, var5474 = protoModule.writeTag(buff, var5426, 16, protoModule.wireTypes.lengthDelimited)
			var5473, var5474 = protoModule.writeBuffer(var5473, var5474, var5472, buffer.len(var5472))
			buff = var5473
			var5426 = var5474
		elseif self.kind.type == "open_facial_age_estimation_action" then
			local var5475 = self.kind.value:encode()
			local var5476, var5477 = protoModule.writeTag(buff, var5426, 17, protoModule.wireTypes.lengthDelimited)
			var5476, var5477 = protoModule.writeBuffer(var5476, var5477, var5475, buffer.len(var5475))
			buff = var5476
			var5426 = var5477
		elseif self.kind.type == "open_add_connections_page_action" then
			local var5478 = self.kind.value:encode()
			local var5479, var5480 = protoModule.writeTag(buff, var5426, 18, protoModule.wireTypes.lengthDelimited)
			var5479, var5480 = protoModule.writeBuffer(var5479, var5480, var5478, buffer.len(var5478))
			buff = var5479
			var5426 = var5480
		elseif self.kind.type == "open_marketplace_action" then
			local var5481 = self.kind.value:encode()
			local var5482, var5483 = protoModule.writeTag(buff, var5426, 19, protoModule.wireTypes.lengthDelimited)
			var5482, var5483 = protoModule.writeBuffer(var5482, var5483, var5481, buffer.len(var5481))
			buff = var5482
			var5426 = var5483
		elseif self.kind.type == "hide_profile_completion_action" then
			local var5484 = self.kind.value:encode()
			local var5485, var5486 = protoModule.writeTag(buff, var5426, 20, protoModule.wireTypes.lengthDelimited)
			var5485, var5486 = protoModule.writeBuffer(var5485, var5486, var5484, buffer.len(var5484))
			buff = var5485
			var5426 = var5486
		elseif self.kind.type == "select_marketplace_catalog_category" then
			local var5487 = self.kind.value:encode()
			local var5488, var5489 = protoModule.writeTag(buff, var5426, 21, protoModule.wireTypes.lengthDelimited)
			var5488, var5489 = protoModule.writeBuffer(var5488, var5489, var5487, buffer.len(var5487))
			buff = var5488
			var5426 = var5489
		elseif self.kind.type == "select_marketplace_catalog_subcategory" then
			local var5490 = self.kind.value:encode()
			local var5491, var5492 = protoModule.writeTag(buff, var5426, 22, protoModule.wireTypes.lengthDelimited)
			var5491, var5492 = protoModule.writeBuffer(var5491, var5492, var5490, buffer.len(var5490))
			buff = var5491
			var5426 = var5492
		elseif self.kind.type == "open_marketplace_catalog_see_all" then
			local var5493 = self.kind.value:encode()
			local var5494, var5495 = protoModule.writeTag(buff, var5426, 23, protoModule.wireTypes.lengthDelimited)
			var5494, var5495 = protoModule.writeBuffer(var5494, var5495, var5493, buffer.len(var5493))
			buff = var5494
			var5426 = var5495
		elseif self.kind.type == "close_marketplace_category_tooltip" then
			local var5496 = self.kind.value:encode()
			local var5497, var5498 = protoModule.writeTag(buff, var5426, 24, protoModule.wireTypes.lengthDelimited)
			var5497, var5498 = protoModule.writeBuffer(var5497, var5498, var5496, buffer.len(var5496))
			buff = var5497
			var5426 = var5498
		elseif self.kind.type == "resize_marketplace_catalog" then
			local var5499 = self.kind.value:encode()
			local var5500, var5501 = protoModule.writeTag(buff, var5426, 25, protoModule.wireTypes.lengthDelimited)
			var5500, var5501 = protoModule.writeBuffer(var5500, var5501, var5499, buffer.len(var5499))
			buff = var5500
			var5426 = var5501
		elseif self.kind.type == "open_marketplace_catalog_filters" then
			local var5502 = self.kind.value:encode()
			local var5503, var5504 = protoModule.writeTag(buff, var5426, 26, protoModule.wireTypes.lengthDelimited)
			var5503, var5504 = protoModule.writeBuffer(var5503, var5504, var5502, buffer.len(var5502))
			buff = var5503
			var5426 = var5504
		elseif self.kind.type == "open_social_link_action" then
			local var5505 = self.kind.value:encode()
			local var5506, var5507 = protoModule.writeTag(buff, var5426, 27, protoModule.wireTypes.lengthDelimited)
			var5506, var5507 = protoModule.writeBuffer(var5506, var5507, var5505, buffer.len(var5505))
			buff = var5506
			var5426 = var5507
		elseif self.kind.type == "open_charts_sort_detail_action" then
			local var5508 = self.kind.value:encode()
			local var5509, var5510 = protoModule.writeTag(buff, var5426, 28, protoModule.wireTypes.lengthDelimited)
			var5509, var5510 = protoModule.writeBuffer(var5509, var5510, var5508, buffer.len(var5508))
			buff = var5509
			var5426 = var5510
		elseif self.kind.type == "open_song_detail_action" then
			local var5511 = self.kind.value:encode()
			local var5512, var5513 = protoModule.writeTag(buff, var5426, 29, protoModule.wireTypes.lengthDelimited)
			var5512, var5513 = protoModule.writeBuffer(var5512, var5513, var5511, buffer.len(var5511))
			buff = var5512
			var5426 = var5513
		elseif self.kind.type == "refresh_from_api_action" then
			local var5514 = self.kind.value:encode()
			local var5515, var5516 = protoModule.writeTag(buff, var5426, 30, protoModule.wireTypes.lengthDelimited)
			var5515, var5516 = protoModule.writeBuffer(var5515, var5516, var5514, buffer.len(var5514))
			buff = var5515
			var5426 = var5516
		elseif self.kind.type == "rsvp_to_event_action" then
			local var5517 = self.kind.value:encode()
			local var5518, var5519 = protoModule.writeTag(buff, var5426, 31, protoModule.wireTypes.lengthDelimited)
			var5518, var5519 = protoModule.writeBuffer(var5518, var5519, var5517, buffer.len(var5517))
			buff = var5518
			var5426 = var5519
		elseif self.kind.type == "apply_charts_filter_action" then
			local var5520 = self.kind.value:encode()
			local var5521, var5522 = protoModule.writeTag(buff, var5426, 32, protoModule.wireTypes.lengthDelimited)
			var5521, var5522 = protoModule.writeBuffer(var5521, var5522, var5520, buffer.len(var5520))
			buff = var5521
			var5426 = var5522
		elseif self.kind.type == "analytics_event_action" then
			local var5523 = self.kind.value:encode()
			local var5524, var5525 = protoModule.writeTag(buff, var5426, 33, protoModule.wireTypes.lengthDelimited)
			var5524, var5525 = protoModule.writeBuffer(var5524, var5525, var5523, buffer.len(var5523))
			buff = var5524
			var5426 = var5525
		elseif self.kind.type == "custom_analytics_event_action" then
			local var5526 = self.kind.value:encode()
			local var5527, var5528 = protoModule.writeTag(buff, var5426, 34, protoModule.wireTypes.lengthDelimited)
			var5527, var5528 = protoModule.writeBuffer(var5527, var5528, var5526, buffer.len(var5526))
			buff = var5527
			var5426 = var5528
		elseif self.kind.type == "open_game_invite_action" then
			local var5529 = self.kind.value:encode()
			local var5530, var5531 = protoModule.writeTag(buff, var5426, 35, protoModule.wireTypes.lengthDelimited)
			var5530, var5531 = protoModule.writeBuffer(var5530, var5531, var5529, buffer.len(var5529))
			buff = var5530
			var5426 = var5531
		elseif self.kind.type == "open_event_details_action" then
			local var5532 = self.kind.value:encode()
			local var5533, var5534 = protoModule.writeTag(buff, var5426, 36, protoModule.wireTypes.lengthDelimited)
			var5533, var5534 = protoModule.writeBuffer(var5533, var5534, var5532, buffer.len(var5532))
			buff = var5533
			var5426 = var5534
		elseif self.kind.type == "launch_experience_action" then
			local var5535 = self.kind.value:encode()
			local var5536, var5537 = protoModule.writeTag(buff, var5426, 37, protoModule.wireTypes.lengthDelimited)
			var5536, var5537 = protoModule.writeBuffer(var5536, var5537, var5535, buffer.len(var5535))
			buff = var5536
			var5426 = var5537
		elseif self.kind.type == "toggle_experience_favorite_action" then
			local var5538 = self.kind.value:encode()
			local var5539, var5540 = protoModule.writeTag(buff, var5426, 38, protoModule.wireTypes.lengthDelimited)
			var5539, var5540 = protoModule.writeBuffer(var5539, var5540, var5538, buffer.len(var5538))
			buff = var5539
			var5426 = var5540
		elseif self.kind.type == "toggle_experience_follow_action" then
			local var5541 = self.kind.value:encode()
			local var5542, var5543 = protoModule.writeTag(buff, var5426, 39, protoModule.wireTypes.lengthDelimited)
			var5542, var5543 = protoModule.writeBuffer(var5542, var5543, var5541, buffer.len(var5541))
			buff = var5542
			var5426 = var5543
		elseif self.kind.type == "toggle_experience_vote_action" then
			local var5544 = self.kind.value:encode()
			local var5545, var5546 = protoModule.writeTag(buff, var5426, 40, protoModule.wireTypes.lengthDelimited)
			var5545, var5546 = protoModule.writeBuffer(var5545, var5546, var5544, buffer.len(var5544))
			buff = var5545
			var5426 = var5546
		elseif self.kind.type == "open_purchase_prompt_action" then
			local var5547 = self.kind.value:encode()
			local var5548, var5549 = protoModule.writeTag(buff, var5426, 41, protoModule.wireTypes.lengthDelimited)
			var5548, var5549 = protoModule.writeBuffer(var5548, var5549, var5547, buffer.len(var5547))
			buff = var5548
			var5426 = var5549
		elseif self.kind.type == "open_sdui_overlay_action" then
			local var5550 = self.kind.value:encode()
			local var5551, var5552 = protoModule.writeTag(buff, var5426, 42, protoModule.wireTypes.lengthDelimited)
			var5551, var5552 = protoModule.writeBuffer(var5551, var5552, var5550, buffer.len(var5550))
			buff = var5551
			var5426 = var5552
		elseif self.kind.type == "open_badges_see_all_action" then
			local var5553 = self.kind.value:encode()
			local var5554, var5555 = protoModule.writeTag(buff, var5426, 43, protoModule.wireTypes.lengthDelimited)
			var5554, var5555 = protoModule.writeBuffer(var5554, var5555, var5553, buffer.len(var5553))
			buff = var5554
			var5426 = var5555
		elseif self.kind.type == "open_experience_store_see_all_action" then
			local var5556 = self.kind.value:encode()
			local var5557, var5558 = protoModule.writeTag(buff, var5426, 44, protoModule.wireTypes.lengthDelimited)
			var5557, var5558 = protoModule.writeBuffer(var5557, var5558, var5556, buffer.len(var5556))
			buff = var5557
			var5426 = var5558
		elseif self.kind.type == "dismiss_game_feedback_action" then
			local var5559 = self.kind.value:encode()
			local var5560, var5561 = protoModule.writeTag(buff, var5426, 45, protoModule.wireTypes.lengthDelimited)
			var5560, var5561 = protoModule.writeBuffer(var5560, var5561, var5559, buffer.len(var5559))
			buff = var5560
			var5426 = var5561
		elseif self.kind.type == "open_game_feedback_form_action" then
			local var5562 = self.kind.value:encode()
			local var5563, var5564 = protoModule.writeTag(buff, var5426, 46, protoModule.wireTypes.lengthDelimited)
			var5563, var5564 = protoModule.writeBuffer(var5563, var5564, var5562, buffer.len(var5562))
			buff = var5563
			var5426 = var5564
		elseif self.kind.type == "enable_event_notifications_action" then
			local var5565 = self.kind.value:encode()
			local var5566, var5567 = protoModule.writeTag(buff, var5426, 47, protoModule.wireTypes.lengthDelimited)
			var5566, var5567 = protoModule.writeBuffer(var5566, var5567, var5565, buffer.len(var5565))
			buff = var5566
			var5426 = var5567
		elseif self.kind.type == "dismiss_event_notifications_modal_action" then
			local var5568 = self.kind.value:encode()
			local var5569, var5570 = protoModule.writeTag(buff, var5426, 48, protoModule.wireTypes.lengthDelimited)
			var5569, var5570 = protoModule.writeBuffer(var5569, var5570, var5568, buffer.len(var5568))
			buff = var5569
			var5426 = var5570
		elseif self.kind.type == "open_amp_wizard_action" then
			local var5571 = self.kind.value:encode()
			local var5572, var5573 = protoModule.writeTag(buff, var5426, 49, protoModule.wireTypes.lengthDelimited)
			var5572, var5573 = protoModule.writeBuffer(var5572, var5573, var5571, buffer.len(var5571))
			buff = var5572
			var5426 = var5573
		elseif self.kind.type == "open_subscription_purchase_page_action" then
			local var5574 = self.kind.value:encode()
			local var5575, var5576 = protoModule.writeTag(buff, var5426, 50, protoModule.wireTypes.lengthDelimited)
			var5575, var5576 = protoModule.writeBuffer(var5575, var5576, var5574, buffer.len(var5574))
			buff = var5575
			var5426 = var5576
		elseif self.kind.type == "refresh_game_passes_action" then
			local var5577 = self.kind.value:encode()
			local var5578, var5579 = protoModule.writeTag(buff, var5426, 51, protoModule.wireTypes.lengthDelimited)
			var5578, var5579 = protoModule.writeBuffer(var5578, var5579, var5577, buffer.len(var5577))
			buff = var5578
			var5426 = var5579
		elseif self.kind.type == "refresh_playability_action" then
			local var5580 = self.kind.value:encode()
			local var5581, var5582 = protoModule.writeTag(buff, var5426, 52, protoModule.wireTypes.lengthDelimited)
			var5581, var5582 = protoModule.writeBuffer(var5581, var5582, var5580, buffer.len(var5580))
			buff = var5581
			var5426 = var5582
		elseif self.kind.type == "open_social_proof_user_list_sheet_action" then
			local var5583 = self.kind.value:encode()
			local var5584, var5585 = protoModule.writeTag(buff, var5426, 53, protoModule.wireTypes.lengthDelimited)
			var5584, var5585 = protoModule.writeBuffer(var5584, var5585, var5583, buffer.len(var5583))
			buff = var5584
			var5426 = var5585
		elseif self.kind.type == "report_surface_load_time_milestone_action" then
			local var5586 = self.kind.value:encode()
			local var5587, var5588 = protoModule.writeTag(buff, var5426, 54, protoModule.wireTypes.lengthDelimited)
			var5587, var5588 = protoModule.writeBuffer(var5587, var5588, var5586, buffer.len(var5586))
			buff = var5587
			var5426 = var5588
		elseif self.kind.type == "open_search_results_tab_action" then
			local var5589 = self.kind.value:encode()
			local var5590, var5591 = protoModule.writeTag(buff, var5426, 55, protoModule.wireTypes.lengthDelimited)
			var5590, var5591 = protoModule.writeBuffer(var5590, var5591, var5589, buffer.len(var5589))
			buff = var5590
			var5426 = var5591
		elseif self.kind.type == "open_phone_upsell_modal_action" then
			local var5592 = self.kind.value:encode()
			local var5593, var5594 = protoModule.writeTag(buff, var5426, 56, protoModule.wireTypes.lengthDelimited)
			var5593, var5594 = protoModule.writeBuffer(var5593, var5594, var5592, buffer.len(var5592))
			buff = var5593
			var5426 = var5594
		elseif self.kind.type == "open_email_upsell_modal_action" then
			local var5595 = self.kind.value:encode()
			local var5596, var5597 = protoModule.writeTag(buff, var5426, 57, protoModule.wireTypes.lengthDelimited)
			var5596, var5597 = protoModule.writeBuffer(var5596, var5597, var5595, buffer.len(var5595))
			buff = var5596
			var5426 = var5597
		elseif self.kind.type == "dismiss_prompt_action" then
			local var5598 = self.kind.value:encode()
			local var5599, var5600 = protoModule.writeTag(buff, var5426, 58, protoModule.wireTypes.lengthDelimited)
			var5599, var5600 = protoModule.writeBuffer(var5599, var5600, var5598, buffer.len(var5598))
			buff = var5599
			var5426 = var5600
		elseif self.kind.type == "request_friendship_action" then
			local var5601 = self.kind.value:encode()
			local var5602, var5603 = protoModule.writeTag(buff, var5426, 59, protoModule.wireTypes.lengthDelimited)
			var5602, var5603 = protoModule.writeBuffer(var5602, var5603, var5601, buffer.len(var5601))
			buff = var5602
			var5426 = var5603
		elseif self.kind.type == "refresh_developer_products_action" then
			local var5604 = self.kind.value:encode()
			local var5605, var5606 = protoModule.writeTag(buff, var5426, 60, protoModule.wireTypes.lengthDelimited)
			var5605, var5606 = protoModule.writeBuffer(var5605, var5606, var5604, buffer.len(var5604))
			buff = var5605
			var5426 = var5606
		elseif self.kind.type == "open_fae_trial_upsell_action" then
			local var5607 = self.kind.value:encode()
			local var5608, var5609 = protoModule.writeTag(buff, var5426, 61, protoModule.wireTypes.lengthDelimited)
			var5608, var5609 = protoModule.writeBuffer(var5608, var5609, var5607, buffer.len(var5607))
			buff = var5608
			var5426 = var5609
		elseif self.kind.type == "refresh_omni_recommendation_feed_item_action" then
			local var5610 = self.kind.value:encode()
			local var5611, var5612 = protoModule.writeTag(buff, var5426, 62, protoModule.wireTypes.lengthDelimited)
			var5611, var5612 = protoModule.writeBuffer(var5611, var5612, var5610, buffer.len(var5610))
			buff = var5611
			var5426 = var5612
		elseif self.kind.type == "ai_overview_feedback_action" then
			local var5613 = self.kind.value:encode()
			local var5614, var5615 = protoModule.writeTag(buff, var5426, 63, protoModule.wireTypes.lengthDelimited)
			var5614, var5615 = protoModule.writeBuffer(var5614, var5615, var5613, buffer.len(var5613))
			buff = var5614
			var5426 = var5615
		elseif self.kind.type == "open_trusted_friends_upsell_modal_action" then
			local var5616 = self.kind.value:encode()
			local var5617, var5618 = protoModule.writeTag(buff, var5426, 64, protoModule.wireTypes.lengthDelimited)
			var5617, var5618 = protoModule.writeBuffer(var5617, var5618, var5616, buffer.len(var5616))
			buff = var5617
			var5426 = var5618
		elseif self.kind.type == "record_party_chat_conversation_upsell_acknowledgement_action" then
			local var5619 = self.kind.value:encode()
			local var5620, var5621 = protoModule.writeTag(buff, var5426, 65, protoModule.wireTypes.lengthDelimited)
			var5620, var5621 = protoModule.writeBuffer(var5620, var5621, var5619, buffer.len(var5619))
			buff = var5620
			var5426 = var5621
		elseif self.kind.type == "open_search_results_with_query_action" then
			local var5622 = self.kind.value:encode()
			local var5623, var5624 = protoModule.writeTag(buff, var5426, 66, protoModule.wireTypes.lengthDelimited)
			var5623, var5624 = protoModule.writeBuffer(var5623, var5624, var5622, buffer.len(var5622))
			buff = var5623
			var5426 = var5624
		elseif self.kind.type == "select_marketplace_favorites_category" then
			local var5625 = self.kind.value:encode()
			local var5626, var5627 = protoModule.writeTag(buff, var5426, 67, protoModule.wireTypes.lengthDelimited)
			var5626, var5627 = protoModule.writeBuffer(var5626, var5627, var5625, buffer.len(var5625))
			buff = var5626
			var5426 = var5627
		elseif self.kind.type == "download_app_action" then
			local var5628 = self.kind.value:encode()
			local var5629, var5630 = protoModule.writeTag(buff, var5426, 68, protoModule.wireTypes.lengthDelimited)
			var5629, var5630 = protoModule.writeBuffer(var5629, var5630, var5628, buffer.len(var5628))
			buff = var5629
			var5426 = var5630
		elseif self.kind.type == "refresh_charts_sort_detail_action" then
			local var5631 = self.kind.value:encode()
			local var5632, var5633 = protoModule.writeTag(buff, var5426, 69, protoModule.wireTypes.lengthDelimited)
			var5632, var5633 = protoModule.writeBuffer(var5632, var5633, var5631, buffer.len(var5631))
			buff = var5632
			var5426 = var5633
		elseif self.kind.type == "join_community_action" then
			local var5634 = self.kind.value:encode()
			local var5635, var5636 = protoModule.writeTag(buff, var5426, 70, protoModule.wireTypes.lengthDelimited)
			var5635, var5636 = protoModule.writeBuffer(var5635, var5636, var5634, buffer.len(var5634))
			buff = var5635
			var5426 = var5636
		elseif self.kind.type == "view_community_action" then
			local var5637 = self.kind.value:encode()
			local var5638, var5639 = protoModule.writeTag(buff, var5426, 71, protoModule.wireTypes.lengthDelimited)
			var5638, var5639 = protoModule.writeBuffer(var5638, var5639, var5637, buffer.len(var5637))
			buff = var5638
			var5426 = var5639
		elseif self.kind.type == "pin_experience_shortcut_action" then
			local var5640 = self.kind.value:encode()
			local var5641, var5642 = protoModule.writeTag(buff, var5426, 72, protoModule.wireTypes.lengthDelimited)
			var5641, var5642 = protoModule.writeBuffer(var5641, var5642, var5640, buffer.len(var5640))
			buff = var5641
			var5426 = var5642
		elseif self.kind.type == "select_marketplace_favorites_subcategory" then
			local var5643 = self.kind.value:encode()
			local var5644, var5645 = protoModule.writeTag(buff, var5426, 73, protoModule.wireTypes.lengthDelimited)
			var5644, var5645 = protoModule.writeBuffer(var5644, var5645, var5643, buffer.len(var5643))
			buff = var5644
			var5426 = var5645
		elseif self.kind.type == "show_toast_action" then
			local var5646 = self.kind.value:encode()
			local var5647, var5648 = protoModule.writeTag(buff, var5426, 74, protoModule.wireTypes.lengthDelimited)
			var5647, var5648 = protoModule.writeBuffer(var5647, var5648, var5646, buffer.len(var5646))
			buff = var5647
			var5426 = var5648
		elseif self.kind.type == "open_incoming_transfer_upsell_action" then
			local var5649 = self.kind.value:encode()
			local var5650, var5651 = protoModule.writeTag(buff, var5426, 75, protoModule.wireTypes.lengthDelimited)
			var5650, var5651 = protoModule.writeBuffer(var5650, var5651, var5649, buffer.len(var5649))
			buff = var5650
			var5426 = var5651
		elseif self.kind.type == "action_sequence_action" then
			local var5652 = self.kind.value:encode()
			local var5653, var5654 = protoModule.writeTag(buff, var5426, 76, protoModule.wireTypes.lengthDelimited)
			var5653, var5654 = protoModule.writeBuffer(var5653, var5654, var5652, buffer.len(var5652))
			buff = var5653
			var5426 = var5654
		end
	end
	if self.telemetry_handler ~= nil then
		local var5655 = self.telemetry_handler:encode()
		local var5656, var5657 = protoModule.writeTag(buff, var5426, 1000, protoModule.wireTypes.lengthDelimited)
		var5656, var5657 = protoModule.writeBuffer(var5656, var5657, var5655, buffer.len(var5655))
		buff = var5656
		var5426 = var5657
	end
	if self.accessibility_label ~= nil then
		local var5658 = self.accessibility_label:encode()
		local var5659, var5660 = protoModule.writeTag(buff, var5426, 1001, protoModule.wireTypes.lengthDelimited)
		var5659, var5660 = protoModule.writeBuffer(var5659, var5660, var5658, buffer.len(var5658))
		buff = var5659
		var5426 = var5660
	end
	if self.skip_unified_logging ~= nil then
		local var5661 = self.skip_unified_logging:encode()
		local var5662, var5663 = protoModule.writeTag(buff, var5426, 1002, protoModule.wireTypes.lengthDelimited)
		var5662, var5663 = protoModule.writeBuffer(var5662, var5663, var5661, buffer.len(var5661))
		buff = var5662
		var5426 = var5663
	end
	local buff_1 = buffer.create(var5426)
	buffer.copy(buff_1, 0, buff, 0, var5426)
	
	return buff_1
end

function t_164.decode(p324) --[[ line: 30329 ]]
	-- upvalues: t_164 (ref), protoModule (ref), t (ref), propTypesModule (ref)
	local var5665 = t_164.new()
	local var5666 = 0
	while var5666 < buffer.len(p324) do
		local _ = nil
		local var5667 = nil
		local var5668, var5669, var5670 = protoModule.readTag(p324, var5666)
		local var5671 = var5668
		var5667 = var5669
		var5666 = var5670
		
		if var5667 == protoModule.wireTypes.varint then
			local _ = nil
			local var5672, var5673 = protoModule.readVarInt(p324, var5666)
			local _ = var5672
			var5666 = var5673
			continue
		end
		if var5667 == protoModule.wireTypes.lengthDelimited then
			if var5671 == 1 then
				local _ = nil
				local var5674, var5675 = protoModule.readBuffer(p324, var5666)
				var5666 = var5675
				var5665.kind = {
					type = "dismiss_dialog_action",
					value = t.DismissDialogAction.decode(var5674)
				}
			elseif var5671 == 2 then
				local _ = nil
				local var5676, var5677 = protoModule.readBuffer(p324, var5666)
				var5666 = var5677
				var5665.kind = {
					type = "link_action",
					value = t.LinkAction.decode(var5676)
				}
			elseif var5671 == 3 then
				local _ = nil
				local var5678, var5679 = protoModule.readBuffer(p324, var5666)
				var5666 = var5679
				var5665.kind = {
					type = "open_game_details_action",
					value = t.OpenGameDetailsAction.decode(var5678)
				}
			elseif var5671 == 4 then
				local _ = nil
				local var5680, var5681 = protoModule.readBuffer(p324, var5666)
				var5666 = var5681
				var5665.kind = {
					type = "open_join_friends_action",
					value = t.OpenJoinFriendsAction.decode(var5680)
				}
			elseif var5671 == 5 then
				local _ = nil
				local var5682, var5683 = protoModule.readBuffer(p324, var5666)
				var5666 = var5683
				var5665.kind = {
					type = "open_marketplace_try_on_action",
					value = t.OpenMarketplaceTryOnAction.decode(var5682)
				}
			elseif var5671 == 6 then
				local _ = nil
				local var5684, var5685 = protoModule.readBuffer(p324, var5666)
				var5666 = var5685
				var5665.kind = {
					type = "open_see_all_action",
					value = t.OpenSeeAllAction.decode(var5684)
				}
			elseif var5671 == 7 then
				local _ = nil
				local var5686, var5687 = protoModule.readBuffer(p324, var5666)
				var5666 = var5687
				var5665.kind = {
					type = "open_sponsored_tooltip_action",
					value = t.OpenSponsoredTooltipAction.decode(var5686)
				}
			elseif var5671 == 8 then
				local _ = nil
				local var5688, var5689 = protoModule.readBuffer(p324, var5666)
				var5666 = var5689
				var5665.kind = {
					type = "play_button_click_action",
					value = t.PlayButtonClickAction.decode(var5688)
				}
			elseif var5671 == 9 then
				local _ = nil
				local var5690, var5691 = protoModule.readBuffer(p324, var5666)
				var5666 = var5691
				var5665.kind = {
					type = "update_user_settings_action",
					value = t.UpdateUserSettingsAction.decode(var5690)
				}
			elseif var5671 == 10 then
				local _ = nil
				local var5692, var5693 = protoModule.readBuffer(p324, var5666)
				var5666 = var5693
				var5665.kind = {
					type = "open_tooltip_action",
					value = t.OpenTooltipAction.decode(var5692)
				}
			elseif var5671 == 11 then
				local _ = nil
				local var5694, var5695 = protoModule.readBuffer(p324, var5666)
				var5666 = var5695
				var5665.kind = {
					type = "open_badge_details_action",
					value = t.OpenBadgeDetailsAction.decode(var5694)
				}
			elseif var5671 == 12 then
				local _ = nil
				local var5696, var5697 = protoModule.readBuffer(p324, var5666)
				var5666 = var5697
				var5665.kind = {
					type = "load_more_from_api_action",
					value = t.LoadMoreFromApiAction.decode(var5696)
				}
			elseif var5671 == 13 then
				local _ = nil
				local var5698, var5699 = protoModule.readBuffer(p324, var5666)
				var5666 = var5699
				var5665.kind = {
					type = "share_action",
					value = t.ShareAction.decode(var5698)
				}
			elseif var5671 == 14 then
				local _ = nil
				local var5700, var5701 = protoModule.readBuffer(p324, var5666)
				var5666 = var5701
				var5665.kind = {
					type = "open_abuse_report_action",
					value = t.OpenAbuseReportAction.decode(var5700)
				}
			elseif var5671 == 15 then
				local _ = nil
				local var5702, var5703 = protoModule.readBuffer(p324, var5666)
				var5666 = var5703
				var5665.kind = {
					type = "remove_badge_from_inventory_action",
					value = t.RemoveBadgeFromInventoryAction.decode(var5702)
				}
			elseif var5671 == 16 then
				local _ = nil
				local var5704, var5705 = protoModule.readBuffer(p324, var5666)
				var5666 = var5705
				var5665.kind = {
					type = "open_profile_action",
					value = t.OpenProfileAction.decode(var5704)
				}
			elseif var5671 == 17 then
				local _ = nil
				local var5706, var5707 = protoModule.readBuffer(p324, var5666)
				var5666 = var5707
				var5665.kind = {
					type = "open_facial_age_estimation_action",
					value = t.OpenFacialAgeEstimationAction.decode(var5706)
				}
			elseif var5671 == 18 then
				local _ = nil
				local var5708, var5709 = protoModule.readBuffer(p324, var5666)
				var5666 = var5709
				var5665.kind = {
					type = "open_add_connections_page_action",
					value = t.OpenAddConnectionsPageAction.decode(var5708)
				}
			elseif var5671 == 19 then
				local _ = nil
				local var5710, var5711 = protoModule.readBuffer(p324, var5666)
				var5666 = var5711
				var5665.kind = {
					type = "open_marketplace_action",
					value = t.OpenMarketplaceAction.decode(var5710)
				}
			elseif var5671 == 20 then
				local _ = nil
				local var5712, var5713 = protoModule.readBuffer(p324, var5666)
				var5666 = var5713
				var5665.kind = {
					type = "hide_profile_completion_action",
					value = t.HideProfileCompletionAction.decode(var5712)
				}
			elseif var5671 == 21 then
				local _ = nil
				local var5714, var5715 = protoModule.readBuffer(p324, var5666)
				var5666 = var5715
				var5665.kind = {
					type = "select_marketplace_catalog_category",
					value = t.SelectMarketplaceCatalogCategory.decode(var5714)
				}
			elseif var5671 == 22 then
				local _ = nil
				local var5716, var5717 = protoModule.readBuffer(p324, var5666)
				var5666 = var5717
				var5665.kind = {
					type = "select_marketplace_catalog_subcategory",
					value = t.SelectMarketplaceCatalogSubcategory.decode(var5716)
				}
			elseif var5671 == 23 then
				local _ = nil
				local var5718, var5719 = protoModule.readBuffer(p324, var5666)
				var5666 = var5719
				var5665.kind = {
					type = "open_marketplace_catalog_see_all",
					value = t.OpenMarketplaceCatalogSeeAll.decode(var5718)
				}
			elseif var5671 == 24 then
				local _ = nil
				local var5720, var5721 = protoModule.readBuffer(p324, var5666)
				var5666 = var5721
				var5665.kind = {
					type = "close_marketplace_category_tooltip",
					value = t.CloseMarketplaceCategoryTooltip.decode(var5720)
				}
			elseif var5671 == 25 then
				local _ = nil
				local var5722, var5723 = protoModule.readBuffer(p324, var5666)
				var5666 = var5723
				var5665.kind = {
					type = "resize_marketplace_catalog",
					value = t.ResizeMarketplaceCatalog.decode(var5722)
				}
			elseif var5671 == 26 then
				local _ = nil
				local var5724, var5725 = protoModule.readBuffer(p324, var5666)
				var5666 = var5725
				var5665.kind = {
					type = "open_marketplace_catalog_filters",
					value = t.OpenMarketplaceCatalogFilters.decode(var5724)
				}
			elseif var5671 == 27 then
				local _ = nil
				local var5726, var5727 = protoModule.readBuffer(p324, var5666)
				var5666 = var5727
				var5665.kind = {
					type = "open_social_link_action",
					value = t.OpenSocialLinkAction.decode(var5726)
				}
			elseif var5671 == 28 then
				local _ = nil
				local var5728, var5729 = protoModule.readBuffer(p324, var5666)
				var5666 = var5729
				var5665.kind = {
					type = "open_charts_sort_detail_action",
					value = t.OpenChartsSortDetailAction.decode(var5728)
				}
			elseif var5671 == 29 then
				local _ = nil
				local var5730, var5731 = protoModule.readBuffer(p324, var5666)
				var5666 = var5731
				var5665.kind = {
					type = "open_song_detail_action",
					value = t.OpenSongDetailAction.decode(var5730)
				}
			elseif var5671 == 30 then
				local _ = nil
				local var5732, var5733 = protoModule.readBuffer(p324, var5666)
				var5666 = var5733
				var5665.kind = {
					type = "refresh_from_api_action",
					value = t.RefreshFromApiAction.decode(var5732)
				}
			elseif var5671 == 31 then
				local _ = nil
				local var5734, var5735 = protoModule.readBuffer(p324, var5666)
				var5666 = var5735
				var5665.kind = {
					type = "rsvp_to_event_action",
					value = t.RsvpToEventAction.decode(var5734)
				}
			elseif var5671 == 32 then
				local _ = nil
				local var5736, var5737 = protoModule.readBuffer(p324, var5666)
				var5666 = var5737
				var5665.kind = {
					type = "apply_charts_filter_action",
					value = t.ApplyChartsFilterAction.decode(var5736)
				}
			elseif var5671 == 33 then
				local _ = nil
				local var5738, var5739 = protoModule.readBuffer(p324, var5666)
				var5666 = var5739
				var5665.kind = {
					type = "analytics_event_action",
					value = t.AnalyticsEventAction.decode(var5738)
				}
			elseif var5671 == 34 then
				local _ = nil
				local var5740, var5741 = protoModule.readBuffer(p324, var5666)
				var5666 = var5741
				var5665.kind = {
					type = "custom_analytics_event_action",
					value = t.CustomAnalyticsEventAction.decode(var5740)
				}
			elseif var5671 == 35 then
				local _ = nil
				local var5742, var5743 = protoModule.readBuffer(p324, var5666)
				var5666 = var5743
				var5665.kind = {
					type = "open_game_invite_action",
					value = t.OpenGameInviteAction.decode(var5742)
				}
			elseif var5671 == 36 then
				local _ = nil
				local var5744, var5745 = protoModule.readBuffer(p324, var5666)
				var5666 = var5745
				var5665.kind = {
					type = "open_event_details_action",
					value = t.OpenEventDetailsAction.decode(var5744)
				}
			elseif var5671 == 37 then
				local _ = nil
				local var5746, var5747 = protoModule.readBuffer(p324, var5666)
				var5666 = var5747
				var5665.kind = {
					type = "launch_experience_action",
					value = t.LaunchExperienceAction.decode(var5746)
				}
			elseif var5671 == 38 then
				local _ = nil
				local var5748, var5749 = protoModule.readBuffer(p324, var5666)
				var5666 = var5749
				var5665.kind = {
					type = "toggle_experience_favorite_action",
					value = t.ToggleExperienceFavoriteAction.decode(var5748)
				}
			elseif var5671 == 39 then
				local _ = nil
				local var5750, var5751 = protoModule.readBuffer(p324, var5666)
				var5666 = var5751
				var5665.kind = {
					type = "toggle_experience_follow_action",
					value = t.ToggleExperienceFollowAction.decode(var5750)
				}
			elseif var5671 == 40 then
				local _ = nil
				local var5752, var5753 = protoModule.readBuffer(p324, var5666)
				var5666 = var5753
				var5665.kind = {
					type = "toggle_experience_vote_action",
					value = t.ToggleExperienceVoteAction.decode(var5752)
				}
			elseif var5671 == 41 then
				local _ = nil
				local var5754, var5755 = protoModule.readBuffer(p324, var5666)
				var5666 = var5755
				var5665.kind = {
					type = "open_purchase_prompt_action",
					value = t.OpenPurchasePromptAction.decode(var5754)
				}
			elseif var5671 == 42 then
				local _ = nil
				local var5756, var5757 = protoModule.readBuffer(p324, var5666)
				var5666 = var5757
				var5665.kind = {
					type = "open_sdui_overlay_action",
					value = t.OpenSduiOverlayAction.decode(var5756)
				}
			elseif var5671 == 43 then
				local _ = nil
				local var5758, var5759 = protoModule.readBuffer(p324, var5666)
				var5666 = var5759
				var5665.kind = {
					type = "open_badges_see_all_action",
					value = t.OpenBadgesSeeAllAction.decode(var5758)
				}
			elseif var5671 == 44 then
				local _ = nil
				local var5760, var5761 = protoModule.readBuffer(p324, var5666)
				var5666 = var5761
				var5665.kind = {
					type = "open_experience_store_see_all_action",
					value = t.OpenExperienceStoreSeeAllAction.decode(var5760)
				}
			elseif var5671 == 45 then
				local _ = nil
				local var5762, var5763 = protoModule.readBuffer(p324, var5666)
				var5666 = var5763
				var5665.kind = {
					type = "dismiss_game_feedback_action",
					value = t.DismissGameFeedbackAction.decode(var5762)
				}
			elseif var5671 == 46 then
				local _ = nil
				local var5764, var5765 = protoModule.readBuffer(p324, var5666)
				var5666 = var5765
				var5665.kind = {
					type = "open_game_feedback_form_action",
					value = t.OpenGameFeedbackFormAction.decode(var5764)
				}
			elseif var5671 == 47 then
				local _ = nil
				local var5766, var5767 = protoModule.readBuffer(p324, var5666)
				var5666 = var5767
				var5665.kind = {
					type = "enable_event_notifications_action",
					value = t.EnableEventNotificationsAction.decode(var5766)
				}
			elseif var5671 == 48 then
				local _ = nil
				local var5768, var5769 = protoModule.readBuffer(p324, var5666)
				var5666 = var5769
				var5665.kind = {
					type = "dismiss_event_notifications_modal_action",
					value = t.DismissEventNotificationsModalAction.decode(var5768)
				}
			elseif var5671 == 49 then
				local _ = nil
				local var5770, var5771 = protoModule.readBuffer(p324, var5666)
				var5666 = var5771
				var5665.kind = {
					type = "open_amp_wizard_action",
					value = t.OpenAmpWizardAction.decode(var5770)
				}
			elseif var5671 == 50 then
				local _ = nil
				local var5772, var5773 = protoModule.readBuffer(p324, var5666)
				var5666 = var5773
				var5665.kind = {
					type = "open_subscription_purchase_page_action",
					value = t.OpenSubscriptionPurchasePageAction.decode(var5772)
				}
			elseif var5671 == 51 then
				local _ = nil
				local var5774, var5775 = protoModule.readBuffer(p324, var5666)
				var5666 = var5775
				var5665.kind = {
					type = "refresh_game_passes_action",
					value = t.RefreshGamePassesAction.decode(var5774)
				}
			elseif var5671 == 52 then
				local _ = nil
				local var5776, var5777 = protoModule.readBuffer(p324, var5666)
				var5666 = var5777
				var5665.kind = {
					type = "refresh_playability_action",
					value = t.RefreshPlayabilityAction.decode(var5776)
				}
			elseif var5671 == 53 then
				local _ = nil
				local var5778, var5779 = protoModule.readBuffer(p324, var5666)
				var5666 = var5779
				var5665.kind = {
					type = "open_social_proof_user_list_sheet_action",
					value = t.OpenSocialProofUserListSheetAction.decode(var5778)
				}
			elseif var5671 == 54 then
				local _ = nil
				local var5780, var5781 = protoModule.readBuffer(p324, var5666)
				var5666 = var5781
				var5665.kind = {
					type = "report_surface_load_time_milestone_action",
					value = t.ReportSurfaceLoadTimeMilestoneAction.decode(var5780)
				}
			elseif var5671 == 55 then
				local _ = nil
				local var5782, var5783 = protoModule.readBuffer(p324, var5666)
				var5666 = var5783
				var5665.kind = {
					type = "open_search_results_tab_action",
					value = t.OpenSearchResultsTabAction.decode(var5782)
				}
			elseif var5671 == 56 then
				local _ = nil
				local var5784, var5785 = protoModule.readBuffer(p324, var5666)
				var5666 = var5785
				var5665.kind = {
					type = "open_phone_upsell_modal_action",
					value = t.OpenPhoneUpsellModalAction.decode(var5784)
				}
			elseif var5671 == 57 then
				local _ = nil
				local var5786, var5787 = protoModule.readBuffer(p324, var5666)
				var5666 = var5787
				var5665.kind = {
					type = "open_email_upsell_modal_action",
					value = t.OpenEmailUpsellModalAction.decode(var5786)
				}
			elseif var5671 == 58 then
				local _ = nil
				local var5788, var5789 = protoModule.readBuffer(p324, var5666)
				var5666 = var5789
				var5665.kind = {
					type = "dismiss_prompt_action",
					value = t.DismissPromptAction.decode(var5788)
				}
			elseif var5671 == 59 then
				local _ = nil
				local var5790, var5791 = protoModule.readBuffer(p324, var5666)
				var5666 = var5791
				var5665.kind = {
					type = "request_friendship_action",
					value = t.RequestFriendshipAction.decode(var5790)
				}
			elseif var5671 == 60 then
				local _ = nil
				local var5792, var5793 = protoModule.readBuffer(p324, var5666)
				var5666 = var5793
				var5665.kind = {
					type = "refresh_developer_products_action",
					value = t.RefreshDeveloperProductsAction.decode(var5792)
				}
			elseif var5671 == 61 then
				local _ = nil
				local var5794, var5795 = protoModule.readBuffer(p324, var5666)
				var5666 = var5795
				var5665.kind = {
					type = "open_fae_trial_upsell_action",
					value = t.OpenFaeTrialUpsellAction.decode(var5794)
				}
			elseif var5671 == 62 then
				local _ = nil
				local var5796, var5797 = protoModule.readBuffer(p324, var5666)
				var5666 = var5797
				var5665.kind = {
					type = "refresh_omni_recommendation_feed_item_action",
					value = t.RefreshOmniRecommendationFeedItemAction.decode(var5796)
				}
			elseif var5671 == 63 then
				local _ = nil
				local var5798, var5799 = protoModule.readBuffer(p324, var5666)
				var5666 = var5799
				var5665.kind = {
					type = "ai_overview_feedback_action",
					value = t.AiOverviewFeedbackAction.decode(var5798)
				}
			elseif var5671 == 64 then
				local _ = nil
				local var5800, var5801 = protoModule.readBuffer(p324, var5666)
				var5666 = var5801
				var5665.kind = {
					type = "open_trusted_friends_upsell_modal_action",
					value = t.OpenTrustedFriendsUpsellModalAction.decode(var5800)
				}
			elseif var5671 == 65 then
				local _ = nil
				local var5802, var5803 = protoModule.readBuffer(p324, var5666)
				var5666 = var5803
				var5665.kind = {
					type = "record_party_chat_conversation_upsell_acknowledgement_action",
					value = t.RecordPartyChatConversationUpsellAcknowledgementAction.decode(var5802)
				}
			elseif var5671 == 66 then
				local _ = nil
				local var5804, var5805 = protoModule.readBuffer(p324, var5666)
				var5666 = var5805
				var5665.kind = {
					type = "open_search_results_with_query_action",
					value = t.OpenSearchResultsWithQueryAction.decode(var5804)
				}
			elseif var5671 == 67 then
				local _ = nil
				local var5806, var5807 = protoModule.readBuffer(p324, var5666)
				var5666 = var5807
				var5665.kind = {
					type = "select_marketplace_favorites_category",
					value = t.SelectMarketplaceFavoritesCategory.decode(var5806)
				}
			elseif var5671 == 68 then
				local _ = nil
				local var5808, var5809 = protoModule.readBuffer(p324, var5666)
				var5666 = var5809
				var5665.kind = {
					type = "download_app_action",
					value = t.DownloadAppAction.decode(var5808)
				}
			elseif var5671 == 69 then
				local _ = nil
				local var5810, var5811 = protoModule.readBuffer(p324, var5666)
				var5666 = var5811
				var5665.kind = {
					type = "refresh_charts_sort_detail_action",
					value = t.RefreshChartsSortDetailAction.decode(var5810)
				}
			elseif var5671 == 70 then
				local _ = nil
				local var5812, var5813 = protoModule.readBuffer(p324, var5666)
				var5666 = var5813
				var5665.kind = {
					type = "join_community_action",
					value = t.JoinCommunityAction.decode(var5812)
				}
			elseif var5671 == 71 then
				local _ = nil
				local var5814, var5815 = protoModule.readBuffer(p324, var5666)
				var5666 = var5815
				var5665.kind = {
					type = "view_community_action",
					value = t.ViewCommunityAction.decode(var5814)
				}
			elseif var5671 == 72 then
				local _ = nil
				local var5816, var5817 = protoModule.readBuffer(p324, var5666)
				var5666 = var5817
				var5665.kind = {
					type = "pin_experience_shortcut_action",
					value = t.PinExperienceShortcutAction.decode(var5816)
				}
			elseif var5671 == 73 then
				local _ = nil
				local var5818, var5819 = protoModule.readBuffer(p324, var5666)
				var5666 = var5819
				var5665.kind = {
					type = "select_marketplace_favorites_subcategory",
					value = t.SelectMarketplaceFavoritesSubcategory.decode(var5818)
				}
			elseif var5671 == 74 then
				local _ = nil
				local var5820, var5821 = protoModule.readBuffer(p324, var5666)
				var5666 = var5821
				var5665.kind = {
					type = "show_toast_action",
					value = t.ShowToastAction.decode(var5820)
				}
			elseif var5671 == 75 then
				local _ = nil
				local var5822, var5823 = protoModule.readBuffer(p324, var5666)
				var5666 = var5823
				var5665.kind = {
					type = "open_incoming_transfer_upsell_action",
					value = t.OpenIncomingTransferUpsellAction.decode(var5822)
				}
			elseif var5671 == 76 then
				local _ = nil
				local var5824, var5825 = protoModule.readBuffer(p324, var5666)
				var5666 = var5825
				var5665.kind = {
					type = "action_sequence_action",
					value = t.ActionSequenceAction.decode(var5824)
				}
			elseif var5671 == 1000 then
				local _ = nil
				local var5826, var5827 = protoModule.readBuffer(p324, var5666)
				var5666 = var5827
				var5665.telemetry_handler = propTypesModule.StringProp.decode(var5826)
			elseif var5671 == 1001 then
				local _ = nil
				local var5828, var5829 = protoModule.readBuffer(p324, var5666)
				var5666 = var5829
				var5665.accessibility_label = propTypesModule.StringFormat.decode(var5828)
			elseif var5671 == 1002 then
				local _ = nil
				local var5830, var5831 = protoModule.readBuffer(p324, var5666)
				var5666 = var5831
				var5665.skip_unified_logging = propTypesModule.BoolProp.decode(var5830)
			else
				local _ = nil
				local var5832, var5833 = protoModule.readVarInt(p324, var5666)
				var5666 = var5833 + var5832
			end
		elseif var5667 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5834, var5835 = protoModule.readFixed32(p324, var5666)
			local _ = var5834
			var5666 = var5835
		elseif var5667 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5836, var5837 = protoModule.readFixed64(p324, var5666)
			local _ = var5836
			var5666 = var5837
		else
			error("Unsupported wire type: " .. var5667)
		end
	end
	return var5665
end

function t_164:jsonEncode() --[[ line: 30906 ]]
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
		elseif self.kind.type == "select_marketplace_favorites_category" then
			t.selectMarketplaceFavoritesCategory = self.kind.value:jsonEncode()
		elseif self.kind.type == "download_app_action" then
			t.downloadAppAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "refresh_charts_sort_detail_action" then
			t.refreshChartsSortDetailAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "join_community_action" then
			t.joinCommunityAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "view_community_action" then
			t.viewCommunityAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "pin_experience_shortcut_action" then
			t.pinExperienceShortcutAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "select_marketplace_favorites_subcategory" then
			t.selectMarketplaceFavoritesSubcategory = self.kind.value:jsonEncode()
		elseif self.kind.type == "show_toast_action" then
			t.showToastAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_incoming_transfer_upsell_action" then
			t.openIncomingTransferUpsellAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "action_sequence_action" then
			t.actionSequenceAction = self.kind.value:jsonEncode()
		end
	end
	if self.telemetry_handler ~= nil then
		t.telemetryHandler = self.telemetry_handler:jsonEncode()
	end
	if self.accessibility_label ~= nil then
		t.accessibilityLabel = self.accessibility_label:jsonEncode()
	end
	if self.skip_unified_logging ~= nil then
		t.skipUnifiedLogging = self.skip_unified_logging:jsonEncode()
	end
	return t
end

function t_164:jsonDecode() --[[ line: 31080 ]]
	-- upvalues: t_164 (ref), t (ref), propTypesModule (ref)
	local var5839 = t_164.new()
	
	if self.dismiss_dialog_action ~= nil then
		var5839.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismiss_dialog_action)
		}
	end
	if self.dismissDialogAction ~= nil then
		var5839.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismissDialogAction)
		}
	end
	if self.link_action ~= nil then
		var5839.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.link_action)
		}
	end
	if self.linkAction ~= nil then
		var5839.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.linkAction)
		}
	end
	if self.open_game_details_action ~= nil then
		var5839.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.open_game_details_action)
		}
	end
	if self.openGameDetailsAction ~= nil then
		var5839.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.openGameDetailsAction)
		}
	end
	if self.open_join_friends_action ~= nil then
		var5839.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.open_join_friends_action)
		}
	end
	if self.openJoinFriendsAction ~= nil then
		var5839.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.openJoinFriendsAction)
		}
	end
	if self.open_marketplace_try_on_action ~= nil then
		var5839.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.open_marketplace_try_on_action)
		}
	end
	if self.openMarketplaceTryOnAction ~= nil then
		var5839.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.openMarketplaceTryOnAction)
		}
	end
	if self.open_see_all_action ~= nil then
		var5839.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.open_see_all_action)
		}
	end
	if self.openSeeAllAction ~= nil then
		var5839.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.openSeeAllAction)
		}
	end
	if self.open_sponsored_tooltip_action ~= nil then
		var5839.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.open_sponsored_tooltip_action)
		}
	end
	if self.openSponsoredTooltipAction ~= nil then
		var5839.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.openSponsoredTooltipAction)
		}
	end
	if self.play_button_click_action ~= nil then
		var5839.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.play_button_click_action)
		}
	end
	if self.playButtonClickAction ~= nil then
		var5839.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.playButtonClickAction)
		}
	end
	if self.update_user_settings_action ~= nil then
		var5839.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.update_user_settings_action)
		}
	end
	if self.updateUserSettingsAction ~= nil then
		var5839.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.updateUserSettingsAction)
		}
	end
	if self.open_tooltip_action ~= nil then
		var5839.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.open_tooltip_action)
		}
	end
	if self.openTooltipAction ~= nil then
		var5839.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.openTooltipAction)
		}
	end
	if self.open_badge_details_action ~= nil then
		var5839.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.open_badge_details_action)
		}
	end
	if self.openBadgeDetailsAction ~= nil then
		var5839.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.openBadgeDetailsAction)
		}
	end
	if self.load_more_from_api_action ~= nil then
		var5839.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.load_more_from_api_action)
		}
	end
	if self.loadMoreFromApiAction ~= nil then
		var5839.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.loadMoreFromApiAction)
		}
	end
	if self.share_action ~= nil then
		var5839.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.share_action)
		}
	end
	if self.shareAction ~= nil then
		var5839.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.shareAction)
		}
	end
	if self.open_abuse_report_action ~= nil then
		var5839.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.open_abuse_report_action)
		}
	end
	if self.openAbuseReportAction ~= nil then
		var5839.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.openAbuseReportAction)
		}
	end
	if self.remove_badge_from_inventory_action ~= nil then
		var5839.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.remove_badge_from_inventory_action)
		}
	end
	if self.removeBadgeFromInventoryAction ~= nil then
		var5839.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.removeBadgeFromInventoryAction)
		}
	end
	if self.open_profile_action ~= nil then
		var5839.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.open_profile_action)
		}
	end
	if self.openProfileAction ~= nil then
		var5839.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.openProfileAction)
		}
	end
	if self.open_facial_age_estimation_action ~= nil then
		var5839.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.open_facial_age_estimation_action)
		}
	end
	if self.openFacialAgeEstimationAction ~= nil then
		var5839.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.openFacialAgeEstimationAction)
		}
	end
	if self.open_add_connections_page_action ~= nil then
		var5839.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.open_add_connections_page_action)
		}
	end
	if self.openAddConnectionsPageAction ~= nil then
		var5839.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.openAddConnectionsPageAction)
		}
	end
	if self.open_marketplace_action ~= nil then
		var5839.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.open_marketplace_action)
		}
	end
	if self.openMarketplaceAction ~= nil then
		var5839.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.openMarketplaceAction)
		}
	end
	if self.hide_profile_completion_action ~= nil then
		var5839.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hide_profile_completion_action)
		}
	end
	if self.hideProfileCompletionAction ~= nil then
		var5839.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hideProfileCompletionAction)
		}
	end
	if self.select_marketplace_catalog_category ~= nil then
		var5839.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.select_marketplace_catalog_category)
		}
	end
	if self.selectMarketplaceCatalogCategory ~= nil then
		var5839.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.selectMarketplaceCatalogCategory)
		}
	end
	if self.select_marketplace_catalog_subcategory ~= nil then
		var5839.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.select_marketplace_catalog_subcategory)
		}
	end
	if self.selectMarketplaceCatalogSubcategory ~= nil then
		var5839.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.selectMarketplaceCatalogSubcategory)
		}
	end
	if self.open_marketplace_catalog_see_all ~= nil then
		var5839.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.open_marketplace_catalog_see_all)
		}
	end
	if self.openMarketplaceCatalogSeeAll ~= nil then
		var5839.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.openMarketplaceCatalogSeeAll)
		}
	end
	if self.close_marketplace_category_tooltip ~= nil then
		var5839.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.close_marketplace_category_tooltip)
		}
	end
	if self.closeMarketplaceCategoryTooltip ~= nil then
		var5839.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.closeMarketplaceCategoryTooltip)
		}
	end
	if self.resize_marketplace_catalog ~= nil then
		var5839.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resize_marketplace_catalog)
		}
	end
	if self.resizeMarketplaceCatalog ~= nil then
		var5839.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resizeMarketplaceCatalog)
		}
	end
	if self.open_marketplace_catalog_filters ~= nil then
		var5839.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.open_marketplace_catalog_filters)
		}
	end
	if self.openMarketplaceCatalogFilters ~= nil then
		var5839.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.openMarketplaceCatalogFilters)
		}
	end
	if self.open_social_link_action ~= nil then
		var5839.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.open_social_link_action)
		}
	end
	if self.openSocialLinkAction ~= nil then
		var5839.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.openSocialLinkAction)
		}
	end
	if self.open_charts_sort_detail_action ~= nil then
		var5839.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.open_charts_sort_detail_action)
		}
	end
	if self.openChartsSortDetailAction ~= nil then
		var5839.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.openChartsSortDetailAction)
		}
	end
	if self.open_song_detail_action ~= nil then
		var5839.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.open_song_detail_action)
		}
	end
	if self.openSongDetailAction ~= nil then
		var5839.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.openSongDetailAction)
		}
	end
	if self.refresh_from_api_action ~= nil then
		var5839.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refresh_from_api_action)
		}
	end
	if self.refreshFromApiAction ~= nil then
		var5839.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refreshFromApiAction)
		}
	end
	if self.rsvp_to_event_action ~= nil then
		var5839.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvp_to_event_action)
		}
	end
	if self.rsvpToEventAction ~= nil then
		var5839.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvpToEventAction)
		}
	end
	if self.apply_charts_filter_action ~= nil then
		var5839.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.apply_charts_filter_action)
		}
	end
	if self.applyChartsFilterAction ~= nil then
		var5839.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.applyChartsFilterAction)
		}
	end
	if self.analytics_event_action ~= nil then
		var5839.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analytics_event_action)
		}
	end
	if self.analyticsEventAction ~= nil then
		var5839.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analyticsEventAction)
		}
	end
	if self.custom_analytics_event_action ~= nil then
		var5839.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.custom_analytics_event_action)
		}
	end
	if self.customAnalyticsEventAction ~= nil then
		var5839.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.customAnalyticsEventAction)
		}
	end
	if self.open_game_invite_action ~= nil then
		var5839.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.open_game_invite_action)
		}
	end
	if self.openGameInviteAction ~= nil then
		var5839.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.openGameInviteAction)
		}
	end
	if self.open_event_details_action ~= nil then
		var5839.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.open_event_details_action)
		}
	end
	if self.openEventDetailsAction ~= nil then
		var5839.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.openEventDetailsAction)
		}
	end
	if self.launch_experience_action ~= nil then
		var5839.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launch_experience_action)
		}
	end
	if self.launchExperienceAction ~= nil then
		var5839.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launchExperienceAction)
		}
	end
	if self.toggle_experience_favorite_action ~= nil then
		var5839.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggle_experience_favorite_action)
		}
	end
	if self.toggleExperienceFavoriteAction ~= nil then
		var5839.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggleExperienceFavoriteAction)
		}
	end
	if self.toggle_experience_follow_action ~= nil then
		var5839.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggle_experience_follow_action)
		}
	end
	if self.toggleExperienceFollowAction ~= nil then
		var5839.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggleExperienceFollowAction)
		}
	end
	if self.toggle_experience_vote_action ~= nil then
		var5839.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggle_experience_vote_action)
		}
	end
	if self.toggleExperienceVoteAction ~= nil then
		var5839.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggleExperienceVoteAction)
		}
	end
	if self.open_purchase_prompt_action ~= nil then
		var5839.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.open_purchase_prompt_action)
		}
	end
	if self.openPurchasePromptAction ~= nil then
		var5839.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.openPurchasePromptAction)
		}
	end
	if self.open_sdui_overlay_action ~= nil then
		var5839.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.open_sdui_overlay_action)
		}
	end
	if self.openSduiOverlayAction ~= nil then
		var5839.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.openSduiOverlayAction)
		}
	end
	if self.open_badges_see_all_action ~= nil then
		var5839.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.open_badges_see_all_action)
		}
	end
	if self.openBadgesSeeAllAction ~= nil then
		var5839.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.openBadgesSeeAllAction)
		}
	end
	if self.open_experience_store_see_all_action ~= nil then
		var5839.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.open_experience_store_see_all_action)
		}
	end
	if self.openExperienceStoreSeeAllAction ~= nil then
		var5839.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.openExperienceStoreSeeAllAction)
		}
	end
	if self.dismiss_game_feedback_action ~= nil then
		var5839.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismiss_game_feedback_action)
		}
	end
	if self.dismissGameFeedbackAction ~= nil then
		var5839.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismissGameFeedbackAction)
		}
	end
	if self.open_game_feedback_form_action ~= nil then
		var5839.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.open_game_feedback_form_action)
		}
	end
	if self.openGameFeedbackFormAction ~= nil then
		var5839.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.openGameFeedbackFormAction)
		}
	end
	if self.enable_event_notifications_action ~= nil then
		var5839.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enable_event_notifications_action)
		}
	end
	if self.enableEventNotificationsAction ~= nil then
		var5839.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enableEventNotificationsAction)
		}
	end
	if self.dismiss_event_notifications_modal_action ~= nil then
		var5839.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismiss_event_notifications_modal_action)
		}
	end
	if self.dismissEventNotificationsModalAction ~= nil then
		var5839.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismissEventNotificationsModalAction)
		}
	end
	if self.open_amp_wizard_action ~= nil then
		var5839.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.open_amp_wizard_action)
		}
	end
	if self.openAmpWizardAction ~= nil then
		var5839.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.openAmpWizardAction)
		}
	end
	if self.open_subscription_purchase_page_action ~= nil then
		var5839.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.open_subscription_purchase_page_action)
		}
	end
	if self.openSubscriptionPurchasePageAction ~= nil then
		var5839.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.openSubscriptionPurchasePageAction)
		}
	end
	if self.refresh_game_passes_action ~= nil then
		var5839.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refresh_game_passes_action)
		}
	end
	if self.refreshGamePassesAction ~= nil then
		var5839.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refreshGamePassesAction)
		}
	end
	if self.refresh_playability_action ~= nil then
		var5839.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refresh_playability_action)
		}
	end
	if self.refreshPlayabilityAction ~= nil then
		var5839.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refreshPlayabilityAction)
		}
	end
	if self.open_social_proof_user_list_sheet_action ~= nil then
		var5839.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.open_social_proof_user_list_sheet_action)
		}
	end
	if self.openSocialProofUserListSheetAction ~= nil then
		var5839.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.openSocialProofUserListSheetAction)
		}
	end
	if self.report_surface_load_time_milestone_action ~= nil then
		var5839.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.report_surface_load_time_milestone_action)
		}
	end
	if self.reportSurfaceLoadTimeMilestoneAction ~= nil then
		var5839.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.reportSurfaceLoadTimeMilestoneAction)
		}
	end
	if self.open_search_results_tab_action ~= nil then
		var5839.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.open_search_results_tab_action)
		}
	end
	if self.openSearchResultsTabAction ~= nil then
		var5839.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.openSearchResultsTabAction)
		}
	end
	if self.open_phone_upsell_modal_action ~= nil then
		var5839.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.open_phone_upsell_modal_action)
		}
	end
	if self.openPhoneUpsellModalAction ~= nil then
		var5839.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.openPhoneUpsellModalAction)
		}
	end
	if self.open_email_upsell_modal_action ~= nil then
		var5839.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.open_email_upsell_modal_action)
		}
	end
	if self.openEmailUpsellModalAction ~= nil then
		var5839.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.openEmailUpsellModalAction)
		}
	end
	if self.dismiss_prompt_action ~= nil then
		var5839.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismiss_prompt_action)
		}
	end
	if self.dismissPromptAction ~= nil then
		var5839.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismissPromptAction)
		}
	end
	if self.request_friendship_action ~= nil then
		var5839.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.request_friendship_action)
		}
	end
	if self.requestFriendshipAction ~= nil then
		var5839.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.requestFriendshipAction)
		}
	end
	if self.refresh_developer_products_action ~= nil then
		var5839.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refresh_developer_products_action)
		}
	end
	if self.refreshDeveloperProductsAction ~= nil then
		var5839.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refreshDeveloperProductsAction)
		}
	end
	if self.open_fae_trial_upsell_action ~= nil then
		var5839.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.open_fae_trial_upsell_action)
		}
	end
	if self.openFaeTrialUpsellAction ~= nil then
		var5839.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.openFaeTrialUpsellAction)
		}
	end
	if self.refresh_omni_recommendation_feed_item_action ~= nil then
		var5839.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refresh_omni_recommendation_feed_item_action)
		}
	end
	if self.refreshOmniRecommendationFeedItemAction ~= nil then
		var5839.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refreshOmniRecommendationFeedItemAction)
		}
	end
	if self.ai_overview_feedback_action ~= nil then
		var5839.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.ai_overview_feedback_action)
		}
	end
	if self.aiOverviewFeedbackAction ~= nil then
		var5839.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.aiOverviewFeedbackAction)
		}
	end
	if self.open_trusted_friends_upsell_modal_action ~= nil then
		var5839.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.open_trusted_friends_upsell_modal_action)
		}
	end
	if self.openTrustedFriendsUpsellModalAction ~= nil then
		var5839.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.openTrustedFriendsUpsellModalAction)
		}
	end
	if self.record_party_chat_conversation_upsell_acknowledgement_action ~= nil then
		var5839.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.record_party_chat_conversation_upsell_acknowledgement_action)
		}
	end
	if self.recordPartyChatConversationUpsellAcknowledgementAction ~= nil then
		var5839.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.recordPartyChatConversationUpsellAcknowledgementAction)
		}
	end
	if self.open_search_results_with_query_action ~= nil then
		var5839.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.open_search_results_with_query_action)
		}
	end
	if self.openSearchResultsWithQueryAction ~= nil then
		var5839.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.openSearchResultsWithQueryAction)
		}
	end
	if self.select_marketplace_favorites_category ~= nil then
		var5839.kind = {
			type = "select_marketplace_favorites_category",
			value = t.SelectMarketplaceFavoritesCategory.jsonDecode(self.select_marketplace_favorites_category)
		}
	end
	if self.selectMarketplaceFavoritesCategory ~= nil then
		var5839.kind = {
			type = "select_marketplace_favorites_category",
			value = t.SelectMarketplaceFavoritesCategory.jsonDecode(self.selectMarketplaceFavoritesCategory)
		}
	end
	if self.download_app_action ~= nil then
		var5839.kind = {
			type = "download_app_action",
			value = t.DownloadAppAction.jsonDecode(self.download_app_action)
		}
	end
	if self.downloadAppAction ~= nil then
		var5839.kind = {
			type = "download_app_action",
			value = t.DownloadAppAction.jsonDecode(self.downloadAppAction)
		}
	end
	if self.refresh_charts_sort_detail_action ~= nil then
		var5839.kind = {
			type = "refresh_charts_sort_detail_action",
			value = t.RefreshChartsSortDetailAction.jsonDecode(self.refresh_charts_sort_detail_action)
		}
	end
	if self.refreshChartsSortDetailAction ~= nil then
		var5839.kind = {
			type = "refresh_charts_sort_detail_action",
			value = t.RefreshChartsSortDetailAction.jsonDecode(self.refreshChartsSortDetailAction)
		}
	end
	if self.join_community_action ~= nil then
		var5839.kind = {
			type = "join_community_action",
			value = t.JoinCommunityAction.jsonDecode(self.join_community_action)
		}
	end
	if self.joinCommunityAction ~= nil then
		var5839.kind = {
			type = "join_community_action",
			value = t.JoinCommunityAction.jsonDecode(self.joinCommunityAction)
		}
	end
	if self.view_community_action ~= nil then
		var5839.kind = {
			type = "view_community_action",
			value = t.ViewCommunityAction.jsonDecode(self.view_community_action)
		}
	end
	if self.viewCommunityAction ~= nil then
		var5839.kind = {
			type = "view_community_action",
			value = t.ViewCommunityAction.jsonDecode(self.viewCommunityAction)
		}
	end
	if self.pin_experience_shortcut_action ~= nil then
		var5839.kind = {
			type = "pin_experience_shortcut_action",
			value = t.PinExperienceShortcutAction.jsonDecode(self.pin_experience_shortcut_action)
		}
	end
	if self.pinExperienceShortcutAction ~= nil then
		var5839.kind = {
			type = "pin_experience_shortcut_action",
			value = t.PinExperienceShortcutAction.jsonDecode(self.pinExperienceShortcutAction)
		}
	end
	if self.select_marketplace_favorites_subcategory ~= nil then
		var5839.kind = {
			type = "select_marketplace_favorites_subcategory",
			value = t.SelectMarketplaceFavoritesSubcategory.jsonDecode(self.select_marketplace_favorites_subcategory)
		}
	end
	if self.selectMarketplaceFavoritesSubcategory ~= nil then
		var5839.kind = {
			type = "select_marketplace_favorites_subcategory",
			value = t.SelectMarketplaceFavoritesSubcategory.jsonDecode(self.selectMarketplaceFavoritesSubcategory)
		}
	end
	if self.show_toast_action ~= nil then
		var5839.kind = {
			type = "show_toast_action",
			value = t.ShowToastAction.jsonDecode(self.show_toast_action)
		}
	end
	if self.showToastAction ~= nil then
		var5839.kind = {
			type = "show_toast_action",
			value = t.ShowToastAction.jsonDecode(self.showToastAction)
		}
	end
	if self.open_incoming_transfer_upsell_action ~= nil then
		var5839.kind = {
			type = "open_incoming_transfer_upsell_action",
			value = t.OpenIncomingTransferUpsellAction.jsonDecode(self.open_incoming_transfer_upsell_action)
		}
	end
	if self.openIncomingTransferUpsellAction ~= nil then
		var5839.kind = {
			type = "open_incoming_transfer_upsell_action",
			value = t.OpenIncomingTransferUpsellAction.jsonDecode(self.openIncomingTransferUpsellAction)
		}
	end
	if self.action_sequence_action ~= nil then
		var5839.kind = {
			type = "action_sequence_action",
			value = t.ActionSequenceAction.jsonDecode(self.action_sequence_action)
		}
	end
	if self.actionSequenceAction ~= nil then
		var5839.kind = {
			type = "action_sequence_action",
			value = t.ActionSequenceAction.jsonDecode(self.actionSequenceAction)
		}
	end
	if self.telemetry_handler ~= nil then
		var5839.telemetry_handler = propTypesModule.StringProp.jsonDecode(self.telemetry_handler)
	end
	if self.telemetryHandler ~= nil then
		var5839.telemetry_handler = propTypesModule.StringProp.jsonDecode(self.telemetryHandler)
	end
	if self.accessibility_label ~= nil then
		var5839.accessibility_label = propTypesModule.StringFormat.jsonDecode(self.accessibility_label)
	end
	if self.accessibilityLabel ~= nil then
		var5839.accessibility_label = propTypesModule.StringFormat.jsonDecode(self.accessibilityLabel)
	end
	if self.skip_unified_logging ~= nil then
		var5839.skip_unified_logging = propTypesModule.BoolProp.jsonDecode(self.skip_unified_logging)
	end
	if self.skipUnifiedLogging ~= nil then
		var5839.skip_unified_logging = propTypesModule.BoolProp.jsonDecode(self.skipUnifiedLogging)
	end
	return var5839
end

t_164.descriptor = {
	name = "Action",
	fullName = "roblox.apppageplatform.shared.v1beta1.Action"
}
t.Action = t_164
typeRegistryModule.default:register(t.Action)
local t_165 = {}
t_165.__index = t_165

function t_165.new(p325) --[[ line: 32214 ]]
	-- upvalues: t_165 (ref)
	return setmetatable({
		kind = if p325 == nil or p325.kind == nil then nil else p325.kind
	}, t_165)
end

function t_165:encode() --[[ line: 32220 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5841 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "value" then
			local var5842 = self.kind.value:encode()
			local var5843, var5844 = protoModule.writeTag(buff, var5841, 1, protoModule.wireTypes.lengthDelimited)
			var5843, var5844 = protoModule.writeBuffer(var5843, var5844, var5842, buffer.len(var5842))
			buff = var5843
			var5841 = var5844
		elseif self.kind.type == "conditional" then
			local var5845 = self.kind.value:encode()
			local var5846, var5847 = protoModule.writeTag(buff, var5841, 2, protoModule.wireTypes.lengthDelimited)
			var5846, var5847 = protoModule.writeBuffer(var5846, var5847, var5845, buffer.len(var5845))
			buff = var5846
			var5841 = var5847
		end
	end
	local buff_1 = buffer.create(var5841)
	buffer.copy(buff_1, 0, buff, 0, var5841)
	
	return buff_1
end

function t_165.decode(p326) --[[ line: 32241 ]]
	-- upvalues: t_165 (ref), protoModule (ref), t (ref)
	local var5849 = t_165.new()
	local var5850 = 0
	while var5850 < buffer.len(p326) do
		local _ = nil
		local var5851 = nil
		local var5852, var5853, var5854 = protoModule.readTag(p326, var5850)
		local var5855 = var5852
		var5851 = var5853
		var5850 = var5854
		
		if var5851 == protoModule.wireTypes.varint then
			local _ = nil
			local var5856, var5857 = protoModule.readVarInt(p326, var5850)
			local _ = var5856
			var5850 = var5857
			continue
		end
		if var5851 == protoModule.wireTypes.lengthDelimited then
			if var5855 == 1 then
				local _ = nil
				local var5858, var5859 = protoModule.readBuffer(p326, var5850)
				var5850 = var5859
				var5849.kind = { type = "value", value = t.Action.decode(var5858) }
			elseif var5855 == 2 then
				local _ = nil
				local var5860, var5861 = protoModule.readBuffer(p326, var5850)
				var5850 = var5861
				var5849.kind = {
					type = "conditional",
					value = t.ActionProp_ConditionalOptions.decode(var5860)
				}
			else
				local _ = nil
				local var5862, var5863 = protoModule.readVarInt(p326, var5850)
				var5850 = var5863 + var5862
			end
		elseif var5851 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5864, var5865 = protoModule.readFixed32(p326, var5850)
			local _ = var5864
			var5850 = var5865
		elseif var5851 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5866, var5867 = protoModule.readFixed64(p326, var5850)
			local _ = var5866
			var5850 = var5867
		else
			error("Unsupported wire type: " .. var5851)
		end
	end
	return var5849
end

function t_165:jsonEncode() --[[ line: 32289 ]]
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

function t_165:jsonDecode() --[[ line: 32303 ]]
	-- upvalues: t_165 (ref), t (ref)
	local var5869 = t_165.new()
	
	if self.value ~= nil then
		var5869.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	if self.conditional ~= nil then
		var5869.kind = {
			type = "conditional",
			value = t.ActionProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var5869
end

t_165.descriptor = {
	name = "ActionProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionProp"
}
t.ActionProp = t_165
typeRegistryModule.default:register(t.ActionProp)
local t_166 = {}
t_166.__index = t_166

function t_166.new(p327) --[[ line: 32332 ]]
	-- upvalues: t_166 (ref)
	return setmetatable({
		condition = if p327 == nil or p327.condition == nil then nil else p327.condition,
		kind = if p327 == nil or p327.kind == nil then nil else p327.kind
	}, t_166)
end

function t_166:encode() --[[ line: 32341 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5871 = 0
	
	if self.condition ~= nil then
		local var5872 = self.condition:encode()
		local var5873, var5874 = protoModule.writeTag(buff, var5871, 1, protoModule.wireTypes.lengthDelimited)
		var5873, var5874 = protoModule.writeBuffer(var5873, var5874, var5872, buffer.len(var5872))
		buff = var5873
		var5871 = var5874
	end
	if self.kind ~= nil and self.kind.type == "value" then
		local var5875 = self.kind.value:encode()
		local var5876, var5877 = protoModule.writeTag(buff, var5871, 3, protoModule.wireTypes.lengthDelimited)
		var5876, var5877 = protoModule.writeBuffer(var5876, var5877, var5875, buffer.len(var5875))
		buff = var5876
		var5871 = var5877
	end
	local buff_1 = buffer.create(var5871)
	buffer.copy(buff_1, 0, buff, 0, var5871)
	
	return buff_1
end

function t_166.decode(p328) --[[ line: 32364 ]]
	-- upvalues: t_166 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var5879 = t_166.new()
	local var5880 = 0
	while var5880 < buffer.len(p328) do
		local _ = nil
		local var5881 = nil
		local var5882, var5883, var5884 = protoModule.readTag(p328, var5880)
		local var5885 = var5882
		var5881 = var5883
		var5880 = var5884
		
		if var5881 == protoModule.wireTypes.varint then
			local _ = nil
			local var5886, var5887 = protoModule.readVarInt(p328, var5880)
			local _ = var5886
			var5880 = var5887
			continue
		end
		if var5881 == protoModule.wireTypes.lengthDelimited then
			if var5885 == 1 then
				local _ = nil
				local var5888, var5889 = protoModule.readBuffer(p328, var5880)
				var5880 = var5889
				var5879.condition = propConditionModule.PropCondition.decode(var5888)
			elseif var5885 == 3 then
				local _ = nil
				local var5890, var5891 = protoModule.readBuffer(p328, var5880)
				var5880 = var5891
				var5879.kind = { type = "value", value = t.Action.decode(var5890) }
			else
				local _ = nil
				local var5892, var5893 = protoModule.readVarInt(p328, var5880)
				var5880 = var5893 + var5892
			end
		elseif var5881 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5894, var5895 = protoModule.readFixed32(p328, var5880)
			local _ = var5894
			var5880 = var5895
		elseif var5881 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5896, var5897 = protoModule.readFixed64(p328, var5880)
			local _ = var5896
			var5880 = var5897
		else
			error("Unsupported wire type: " .. var5881)
		end
	end
	return var5879
end

function t_166:jsonEncode() --[[ line: 32412 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "value" then
		t.value = self.kind.value:jsonEncode()
	end
	return t
end

function t_166:jsonDecode() --[[ line: 32428 ]]
	-- upvalues: t_166 (ref), propConditionModule (ref), t (ref)
	local var5899 = t_166.new()
	
	if self.condition ~= nil then
		var5899.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.value ~= nil then
		var5899.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	return var5899
end

t_166.descriptor = {
	name = "ActionProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ActionProp_ConditionalOption = t_166
typeRegistryModule.default:register(t.ActionProp_ConditionalOption)
local t_167 = {}
t_167.__index = t_167

function t_167.new(p329) --[[ line: 32457 ]]
	-- upvalues: t_167 (ref)
	return setmetatable({
		options = if p329 == nil or p329.options == nil then {} else p329.options
	}, t_167)
end

function t_167:encode() --[[ line: 32465 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5901 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var5902 = v:encode()
			local var5903, var5904 = protoModule.writeTag(buff, var5901, 1, protoModule.wireTypes.lengthDelimited)
			var5903, var5904 = protoModule.writeBuffer(var5903, var5904, var5902, buffer.len(var5902))
			buff = var5903
			var5901 = var5904
		end
	end
	local buff_1 = buffer.create(var5901)
	buffer.copy(buff_1, 0, buff, 0, var5901)
	
	return buff_1
end

function t_167.decode(p330) --[[ line: 32482 ]]
	-- upvalues: t_167 (ref), protoModule (ref), t (ref)
	local var5906 = t_167.new()
	local var5907 = 0
	while var5907 < buffer.len(p330) do
		local _ = nil
		local var5908 = nil
		local var5909, var5910, var5911 = protoModule.readTag(p330, var5907)
		local var5912 = var5909
		var5908 = var5910
		var5907 = var5911
		
		if var5908 == protoModule.wireTypes.varint then
			local _ = nil
			local var5913, var5914 = protoModule.readVarInt(p330, var5907)
			local _ = var5913
			var5907 = var5914
			continue
		end
		if var5908 == protoModule.wireTypes.lengthDelimited then
			if var5912 == 1 then
				local _ = nil
				local var5915, var5916 = protoModule.readBuffer(p330, var5907)
				var5907 = var5916
				table.insert(var5906.options, t.ActionProp_ConditionalOption.decode(var5915))
			else
				local _ = nil
				local var5917, var5918 = protoModule.readVarInt(p330, var5907)
				var5907 = var5918 + var5917
			end
		elseif var5908 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5919, var5920 = protoModule.readFixed32(p330, var5907)
			local _ = var5919
			var5907 = var5920
		elseif var5908 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5921, var5922 = protoModule.readFixed64(p330, var5907)
			local _ = var5921
			var5907 = var5922
		else
			error("Unsupported wire type: " .. var5908)
		end
	end
	return var5906
end

function t_167:jsonEncode() --[[ line: 32525 ]]
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

function t_167:jsonDecode() --[[ line: 32539 ]]
	-- upvalues: t_167 (ref), t (ref)
	local var5925 = t_167.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ActionProp_ConditionalOption.jsonDecode(v))
		end
		var5925.options = t_1
	end
	return var5925
end

t_167.descriptor = {
	name = "ActionProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ActionProp_ConditionalOptions = t_167
typeRegistryModule.default:register(t.ActionProp_ConditionalOptions)
local t_168 = {}
t_168.__index = t_168

function t_168.new(p331) --[[ line: 32568 ]]
	-- upvalues: t_168 (ref)
	return setmetatable({
		kind = if p331 == nil or p331.kind == nil then nil else p331.kind
	}, t_168)
end

function t_168:encode() --[[ line: 32574 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5928 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var5929 = self.kind.value:encode()
			local var5930, var5931 = protoModule.writeTag(buff, var5928, 1, protoModule.wireTypes.lengthDelimited)
			var5930, var5931 = protoModule.writeBuffer(var5930, var5931, var5929, buffer.len(var5929))
			buff = var5930
			var5928 = var5931
		elseif self.kind.type == "conditional" then
			local var5932 = self.kind.value:encode()
			local var5933, var5934 = protoModule.writeTag(buff, var5928, 2, protoModule.wireTypes.lengthDelimited)
			var5933, var5934 = protoModule.writeBuffer(var5933, var5934, var5932, buffer.len(var5932))
			buff = var5933
			var5928 = var5934
		elseif self.kind.type == "binding_path" then
			local var5935, var5936 = protoModule.writeTag(buff, var5928, 3, protoModule.wireTypes.lengthDelimited)
			var5935, var5936 = protoModule.writeString(var5935, var5936, self.kind.value)
			buff = var5935
			var5928 = var5936
		end
	end
	local buff_1 = buffer.create(var5928)
	buffer.copy(buff_1, 0, buff, 0, var5928)
	
	return buff_1
end

function t_168.decode(p332) --[[ line: 32598 ]]
	-- upvalues: t_168 (ref), protoModule (ref), t (ref)
	local var5938 = t_168.new()
	local var5939 = 0
	while var5939 < buffer.len(p332) do
		local _ = nil
		local var5940 = nil
		local var5941, var5942, var5943 = protoModule.readTag(p332, var5939)
		local var5944 = var5941
		var5940 = var5942
		var5939 = var5943
		
		if var5940 == protoModule.wireTypes.varint then
			local _ = nil
			local var5945, var5946 = protoModule.readVarInt(p332, var5939)
			local _ = var5945
			var5939 = var5946
			continue
		end
		if var5940 == protoModule.wireTypes.lengthDelimited then
			if var5944 == 1 then
				local _ = nil
				local var5947, var5948 = protoModule.readBuffer(p332, var5939)
				var5939 = var5948
				var5938.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(var5947)
				}
			elseif var5944 == 2 then
				local _ = nil
				local var5949, var5950 = protoModule.readBuffer(p332, var5939)
				var5939 = var5950
				var5938.kind = {
					type = "conditional",
					value = t.FocusNavActionsProp_ConditionalOptions.decode(var5949)
				}
			elseif var5944 == 3 then
				local _ = nil
				local var5951, var5952 = protoModule.readBuffer(p332, var5939)
				var5939 = var5952
				var5938.kind = { type = "binding_path", value = buffer.tostring(var5951) }
			else
				local _ = nil
				local var5953, var5954 = protoModule.readVarInt(p332, var5939)
				var5939 = var5954 + var5953
			end
		elseif var5940 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5955, var5956 = protoModule.readFixed32(p332, var5939)
			local _ = var5955
			var5939 = var5956
		elseif var5940 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5957, var5958 = protoModule.readFixed64(p332, var5939)
			local _ = var5957
			var5939 = var5958
		else
			error("Unsupported wire type: " .. var5940)
		end
	end
	return var5938
end

function t_168:jsonEncode() --[[ line: 32652 ]]
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

function t_168:jsonDecode() --[[ line: 32668 ]]
	-- upvalues: t_168 (ref), t (ref)
	local var5960 = t_168.new()
	
	if self.literal ~= nil then
		var5960.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
		}
	end
	if self.conditional ~= nil then
		var5960.kind = {
			type = "conditional",
			value = t.FocusNavActionsProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var5960.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var5960.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var5960
end

t_168.descriptor = {
	name = "FocusNavActionsProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavActionsProp"
}
t.FocusNavActionsProp = t_168
typeRegistryModule.default:register(t.FocusNavActionsProp)
local t_169 = {}
t_169.__index = t_169

function t_169.new(p333) --[[ line: 32708 ]]
	-- upvalues: t_169 (ref)
	return setmetatable({
		condition = if p333 == nil or p333.condition == nil then nil else p333.condition,
		kind = if p333 == nil or p333.kind == nil then nil else p333.kind
	}, t_169)
end

function t_169:encode() --[[ line: 32717 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5962 = 0
	
	if self.condition ~= nil then
		local var5963 = self.condition:encode()
		local var5964, var5965 = protoModule.writeTag(buff, var5962, 1, protoModule.wireTypes.lengthDelimited)
		var5964, var5965 = protoModule.writeBuffer(var5964, var5965, var5963, buffer.len(var5963))
		buff = var5964
		var5962 = var5965
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var5966 = self.kind.value:encode()
			local var5967, var5968 = protoModule.writeTag(buff, var5962, 3, protoModule.wireTypes.lengthDelimited)
			var5967, var5968 = protoModule.writeBuffer(var5967, var5968, var5966, buffer.len(var5966))
			buff = var5967
			var5962 = var5968
		elseif self.kind.type == "binding_path" then
			local var5969, var5970 = protoModule.writeTag(buff, var5962, 4, protoModule.wireTypes.lengthDelimited)
			var5969, var5970 = protoModule.writeString(var5969, var5970, self.kind.value)
			buff = var5969
			var5962 = var5970
		end
	end
	local buff_1 = buffer.create(var5962)
	buffer.copy(buff_1, 0, buff, 0, var5962)
	
	return buff_1
end

function t_169.decode(p334) --[[ line: 32743 ]]
	-- upvalues: t_169 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var5972 = t_169.new()
	local var5973 = 0
	while var5973 < buffer.len(p334) do
		local _ = nil
		local var5974 = nil
		local var5975, var5976, var5977 = protoModule.readTag(p334, var5973)
		local var5978 = var5975
		var5974 = var5976
		var5973 = var5977
		
		if var5974 == protoModule.wireTypes.varint then
			local _ = nil
			local var5979, var5980 = protoModule.readVarInt(p334, var5973)
			local _ = var5979
			var5973 = var5980
			continue
		end
		if var5974 == protoModule.wireTypes.lengthDelimited then
			if var5978 == 1 then
				local _ = nil
				local var5981, var5982 = protoModule.readBuffer(p334, var5973)
				var5973 = var5982
				var5972.condition = propConditionModule.PropCondition.decode(var5981)
			elseif var5978 == 3 then
				local _ = nil
				local var5983, var5984 = protoModule.readBuffer(p334, var5973)
				var5973 = var5984
				var5972.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(var5983)
				}
			elseif var5978 == 4 then
				local _ = nil
				local var5985, var5986 = protoModule.readBuffer(p334, var5973)
				var5973 = var5986
				var5972.kind = { type = "binding_path", value = buffer.tostring(var5985) }
			else
				local _ = nil
				local var5987, var5988 = protoModule.readVarInt(p334, var5973)
				var5973 = var5988 + var5987
			end
		elseif var5974 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5989, var5990 = protoModule.readFixed32(p334, var5973)
			local _ = var5989
			var5973 = var5990
		elseif var5974 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5991, var5992 = protoModule.readFixed64(p334, var5973)
			local _ = var5991
			var5973 = var5992
		else
			error("Unsupported wire type: " .. var5974)
		end
	end
	return var5972
end

function t_169:jsonEncode() --[[ line: 32796 ]]
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

function t_169:jsonDecode() --[[ line: 32814 ]]
	-- upvalues: t_169 (ref), propConditionModule (ref), t (ref)
	local var5994 = t_169.new()
	
	if self.condition ~= nil then
		var5994.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var5994.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var5994.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var5994.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var5994
end

t_169.descriptor = {
	name = "FocusNavActionsProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FocusNavActionsProp_ConditionalOption = t_169
typeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOption)
local t_170 = {}
t_170.__index = t_170

function t_170.new(p335) --[[ line: 32854 ]]
	-- upvalues: t_170 (ref)
	return setmetatable({
		options = if p335 == nil or p335.options == nil then {} else p335.options
	}, t_170)
end

function t_170:encode() --[[ line: 32862 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5996 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var5997 = v:encode()
			local var5998, var5999 = protoModule.writeTag(buff, var5996, 1, protoModule.wireTypes.lengthDelimited)
			var5998, var5999 = protoModule.writeBuffer(var5998, var5999, var5997, buffer.len(var5997))
			buff = var5998
			var5996 = var5999
		end
	end
	local buff_1 = buffer.create(var5996)
	buffer.copy(buff_1, 0, buff, 0, var5996)
	
	return buff_1
end

function t_170.decode(p336) --[[ line: 32879 ]]
	-- upvalues: t_170 (ref), protoModule (ref), t (ref)
	local var6001 = t_170.new()
	local var6002 = 0
	while var6002 < buffer.len(p336) do
		local _ = nil
		local var6003 = nil
		local var6004, var6005, var6006 = protoModule.readTag(p336, var6002)
		local var6007 = var6004
		var6003 = var6005
		var6002 = var6006
		
		if var6003 == protoModule.wireTypes.varint then
			local _ = nil
			local var6008, var6009 = protoModule.readVarInt(p336, var6002)
			local _ = var6008
			var6002 = var6009
			continue
		end
		if var6003 == protoModule.wireTypes.lengthDelimited then
			if var6007 == 1 then
				local _ = nil
				local var6010, var6011 = protoModule.readBuffer(p336, var6002)
				var6002 = var6011
				table.insert(var6001.options, t.FocusNavActionsProp_ConditionalOption.decode(var6010))
			else
				local _ = nil
				local var6012, var6013 = protoModule.readVarInt(p336, var6002)
				var6002 = var6013 + var6012
			end
		elseif var6003 == protoModule.wireTypes.i32 then
			local _ = nil
			local var6014, var6015 = protoModule.readFixed32(p336, var6002)
			local _ = var6014
			var6002 = var6015
		elseif var6003 == protoModule.wireTypes.i64 then
			local _ = nil
			local var6016, var6017 = protoModule.readFixed64(p336, var6002)
			local _ = var6016
			var6002 = var6017
		else
			error("Unsupported wire type: " .. var6003)
		end
	end
	return var6001
end

function t_170:jsonEncode() --[[ line: 32922 ]]
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

function t_170:jsonDecode() --[[ line: 32936 ]]
	-- upvalues: t_170 (ref), t (ref)
	local var6020 = t_170.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FocusNavActionsProp_ConditionalOption.jsonDecode(v))
		end
		var6020.options = t_1
	end
	return var6020
end

t_170.descriptor = {
	name = "FocusNavActionsProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FocusNavActionsProp_ConditionalOptions = t_170
typeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOptions)
local t_171 = {}
t_171.__index = t_171

function t_171.new(p337) --[[ line: 32967 ]]
	-- upvalues: t_171 (ref)
	return setmetatable({
		keys = if p337 == nil or p337.keys == nil then {} else p337.keys,
		events = if p337 == nil or p337.events == nil then {} else p337.events
	}, t_171)
end

function t_171:encode() --[[ line: 32976 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6023 = 0
	
	if self.keys ~= nil and next(self.keys) ~= nil then
		for i, v in self.keys do
			local var6024, var6025 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var6024, var6025 = protoModule.writeString(var6024, var6025, i)
			local var6026 = v:encode()
			var6025, var6027 = protoModule.writeTag(var6024, var6025, 2, protoModule.wireTypes.lengthDelimited)
			var6025, var6027 = protoModule.writeBuffer(var6025, var6027, var6026, buffer.len(var6026))
			local var6028 = var6025
			local var6029 = var6027
			local var6030, var6031 = protoModule.writeTag(buff, var6023, 3, protoModule.wireTypes.lengthDelimited)
			var6030, var6031 = protoModule.writeBuffer(var6030, var6031, var6028, var6029)
			buff = var6030
			var6023 = var6031
		end
	end
	if self.events ~= nil and next(self.events) ~= nil then
		for i, v in self.events do
			local var6032, var6033 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var6032, var6033 = protoModule.writeString(var6032, var6033, i)
			local var6034 = v:encode()
			var6033, var6035 = protoModule.writeTag(var6032, var6033, 2, protoModule.wireTypes.lengthDelimited)
			var6033, var6035 = protoModule.writeBuffer(var6033, var6035, var6034, buffer.len(var6034))
			local var6036 = var6033
			local var6037 = var6035
			local var6038, var6039 = protoModule.writeTag(buff, var6023, 4, protoModule.wireTypes.lengthDelimited)
			var6038, var6039 = protoModule.writeBuffer(var6038, var6039, var6036, var6037)
			buff = var6038
			var6023 = var6039
		end
	end
	local buff_1 = buffer.create(var6023)
	buffer.copy(buff_1, 0, buff, 0, var6023)
	
	return buff_1
end

function t_171.decode(p338) --[[ line: 33013 ]]
	-- upvalues: t_171 (ref), protoModule (ref), t (ref), propTypesEngineModule (ref)
	local var6041 = t_171.new()
	local var6042 = 0
	while var6042 < buffer.len(p338) do
		local _ = nil
		local var6043 = nil
		local var6044, var6045, var6046 = protoModule.readTag(p338, var6042)
		local var6047 = var6044
		var6043 = var6045
		var6042 = var6046
		
		if var6043 == protoModule.wireTypes.varint then
			local _ = nil
			local var6048, var6049 = protoModule.readVarInt(p338, var6042)
			local _ = var6048
			var6042 = var6049
			continue
		end
		if var6043 == protoModule.wireTypes.lengthDelimited then
			if var6047 == 3 then
				local _ = nil
				local var6050, var6051 = protoModule.readBuffer(p338, var6042)
				var6042 = var6051
				var6050 = t.FocusNavActionsProp_FocusNavData_KeysEntry.decode(var6050)
				var6041.keys[var6050.key or ""] = var6050.value or propTypesEngineModule.KeyCodeProp.new()
			elseif var6047 == 4 then
				local _ = nil
				local var6052, var6053 = protoModule.readBuffer(p338, var6042)
				var6042 = var6053
				var6052 = t.FocusNavActionsProp_FocusNavData_EventsEntry.decode(var6052)
				var6041.events[var6052.key or ""] = var6052.value or t.ActionProp.new()
			else
				local _ = nil
				local var6054, var6055 = protoModule.readVarInt(p338, var6042)
				var6042 = var6055 + var6054
			end
		elseif var6043 == protoModule.wireTypes.i32 then
			local _ = nil
			local var6056, var6057 = protoModule.readFixed32(p338, var6042)
			local _ = var6056
			var6042 = var6057
		elseif var6043 == protoModule.wireTypes.i64 then
			local _ = nil
			local var6058, var6059 = protoModule.readFixed64(p338, var6042)
			local _ = var6058
			var6042 = var6059
		else
			error("Unsupported wire type: " .. var6043)
		end
	end
	return var6041
end

function t_171:jsonEncode() --[[ line: 33075 ]]
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

function t_171:jsonDecode() --[[ line: 33097 ]]
	-- upvalues: t_171 (ref), propTypesEngineModule (ref), t (ref)
	local var6063 = t_171.new()
	
	if self.keys ~= nil then
		local t_1 = {}
		
		for i, v in self.keys do
			t_1[i] = propTypesEngineModule.KeyCodeProp.jsonDecode(v)
		end
		var6063.keys = t_1
	end
	if self.events ~= nil then
		local t_1 = {}
		
		for i, v in self.events do
			t_1[i] = t.ActionProp.jsonDecode(v)
		end
		var6063.events = t_1
	end
	return var6063
end

t_171.descriptor = {
	name = "FocusNavActionsProp_FocusNavData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavData"
}
t.FocusNavActionsProp_FocusNavData = t_171
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData)
local t_172 = {}
t_172.__index = t_172

function t_172.new(p339) --[[ line: 33137 ]]
	-- upvalues: t_172 (ref)
	return setmetatable({
		key = if p339 == nil or p339.key == nil then "" else p339.key,
		value = if p339 == nil or p339.value == nil then nil else p339.value
	}, t_172)
end

function t_172:encode() --[[ line: 33146 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6067 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var6068, var6069 = protoModule.writeTag(buff, var6067, 1, protoModule.wireTypes.lengthDelimited)
		var6068, var6069 = protoModule.writeString(var6068, var6069, self.key)
		buff = var6068
		var6067 = var6069
	end
	if self.value ~= nil then
		local var6070 = self.value:encode()
		local var6071, var6072 = protoModule.writeTag(buff, var6067, 2, protoModule.wireTypes.lengthDelimited)
		var6071, var6072 = protoModule.writeBuffer(var6071, var6072, var6070, buffer.len(var6070))
		buff = var6071
		var6067 = var6072
	end
	local buff_1 = buffer.create(var6067)
	buffer.copy(buff_1, 0, buff, 0, var6067)
	
	return buff_1
end

function t_172.decode(p340) --[[ line: 33168 ]]
	-- upvalues: t_172 (ref), protoModule (ref), propTypesEngineModule (ref)
	local var6074 = t_172.new()
	local var6075 = 0
	while var6075 < buffer.len(p340) do
		local _ = nil
		local var6076 = nil
		local var6077, var6078, var6079 = protoModule.readTag(p340, var6075)
		local var6080 = var6077
		var6076 = var6078
		var6075 = var6079
		
		if var6076 == protoModule.wireTypes.varint then
			local _ = nil
			local var6081, var6082 = protoModule.readVarInt(p340, var6075)
			local _ = var6081
			var6075 = var6082
			continue
		end
		if var6076 == protoModule.wireTypes.lengthDelimited then
			if var6080 == 1 then
				local _ = nil
				local var6083, var6084 = protoModule.readBuffer(p340, var6075)
				var6075 = var6084
				var6074.key = buffer.tostring(var6083)
			elseif var6080 == 2 then
				local _ = nil
				local var6085, var6086 = protoModule.readBuffer(p340, var6075)
				var6075 = var6086
				var6074.value = propTypesEngineModule.KeyCodeProp.decode(var6085)
			else
				local _ = nil
				local var6087, var6088 = protoModule.readVarInt(p340, var6075)
				var6075 = var6088 + var6087
			end
		elseif var6076 == protoModule.wireTypes.i32 then
			local _ = nil
			local var6089, var6090 = protoModule.readFixed32(p340, var6075)
			local _ = var6089
			var6075 = var6090
		elseif var6076 == protoModule.wireTypes.i64 then
			local _ = nil
			local var6091, var6092 = protoModule.readFixed64(p340, var6075)
			local _ = var6091
			var6075 = var6092
		else
			error("Unsupported wire type: " .. var6076)
		end
	end
	return var6074
end

function t_172:jsonEncode() --[[ line: 33218 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_172:jsonDecode() --[[ line: 33234 ]]
	-- upvalues: t_172 (ref), propTypesEngineModule (ref)
	local var6094 = t_172.new()
	
	if self.key ~= nil then
		var6094.key = self.key
	end
	if self.value ~= nil then
		var6094.value = propTypesEngineModule.KeyCodeProp.jsonDecode(self.value)
	end
	return var6094
end

t_172.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_KeysEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.KeysEntry"
}
t.FocusNavActionsProp_FocusNavData_KeysEntry = t_172
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_KeysEntry)
local t_173 = {}
t_173.__index = t_173

function t_173.new(p341) --[[ line: 33264 ]]
	-- upvalues: t_173 (ref)
	return setmetatable({
		key = if p341 == nil or p341.key == nil then "" else p341.key,
		value = if p341 == nil or p341.value == nil then nil else p341.value
	}, t_173)
end

function t_173:encode() --[[ line: 33273 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6096 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var6097, var6098 = protoModule.writeTag(buff, var6096, 1, protoModule.wireTypes.lengthDelimited)
		var6097, var6098 = protoModule.writeString(var6097, var6098, self.key)
		buff = var6097
		var6096 = var6098
	end
	if self.value ~= nil then
		local var6099 = self.value:encode()
		local var6100, var6101 = protoModule.writeTag(buff, var6096, 2, protoModule.wireTypes.lengthDelimited)
		var6100, var6101 = protoModule.writeBuffer(var6100, var6101, var6099, buffer.len(var6099))
		buff = var6100
		var6096 = var6101
	end
	local buff_1 = buffer.create(var6096)
	buffer.copy(buff_1, 0, buff, 0, var6096)
	
	return buff_1
end

function t_173.decode(p342) --[[ line: 33295 ]]
	-- upvalues: t_173 (ref), protoModule (ref), t (ref)
	local var6103 = t_173.new()
	local var6104 = 0
	while var6104 < buffer.len(p342) do
		local _ = nil
		local var6105 = nil
		local var6106, var6107, var6108 = protoModule.readTag(p342, var6104)
		local var6109 = var6106
		var6105 = var6107
		var6104 = var6108
		
		if var6105 == protoModule.wireTypes.varint then
			local _ = nil
			local var6110, var6111 = protoModule.readVarInt(p342, var6104)
			local _ = var6110
			var6104 = var6111
			continue
		end
		if var6105 == protoModule.wireTypes.lengthDelimited then
			if var6109 == 1 then
				local _ = nil
				local var6112, var6113 = protoModule.readBuffer(p342, var6104)
				var6104 = var6113
				var6103.key = buffer.tostring(var6112)
			elseif var6109 == 2 then
				local _ = nil
				local var6114, var6115 = protoModule.readBuffer(p342, var6104)
				var6104 = var6115
				var6103.value = t.ActionProp.decode(var6114)
			else
				local _ = nil
				local var6116, var6117 = protoModule.readVarInt(p342, var6104)
				var6104 = var6117 + var6116
			end
		elseif var6105 == protoModule.wireTypes.i32 then
			local _ = nil
			local var6118, var6119 = protoModule.readFixed32(p342, var6104)
			local _ = var6118
			var6104 = var6119
		elseif var6105 == protoModule.wireTypes.i64 then
			local _ = nil
			local var6120, var6121 = protoModule.readFixed64(p342, var6104)
			local _ = var6120
			var6104 = var6121
		else
			error("Unsupported wire type: " .. var6105)
		end
	end
	return var6103
end

function t_173:jsonEncode() --[[ line: 33345 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_173:jsonDecode() --[[ line: 33361 ]]
	-- upvalues: t_173 (ref), t (ref)
	local var6123 = t_173.new()
	
	if self.key ~= nil then
		var6123.key = self.key
	end
	if self.value ~= nil then
		var6123.value = t.ActionProp.jsonDecode(self.value)
	end
	return var6123
end

t_173.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_EventsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsEntry"
}
t.FocusNavActionsProp_FocusNavData_EventsEntry = t_173
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_EventsEntry)
t.ActionType = {
	fromNumber = function(p343) --[[ line: 33388 ]]
		return if p343 == 0 then "ACTION_TYPE_INVALID" elseif p343 == 1 then "ACTION_TYPE_DISMISS_DIALOG" elseif p343 == 2 then "ACTION_TYPE_LINK" elseif p343 == 3 then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p343 == 4 then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p343 == 5 then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p343 == 6 then "ACTION_TYPE_OPEN_SEE_ALL" elseif p343 == 7 then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p343 == 8 then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p343 == 9 then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p343 == 10 then "ACTION_TYPE_OPEN_TOOLTIP" elseif p343 == 11 then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p343 == 12 then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p343 == 13 then "ACTION_TYPE_SHARE" elseif p343 == 14 then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p343 == 15 then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p343 == 16 then "ACTION_TYPE_OPEN_PROFILE" elseif p343 == 17 then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p343 == 18 then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p343 == 19 then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p343 == 20 then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p343 == 21 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p343 == 22 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p343 == 23 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p343 == 24 then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p343 == 25 then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p343 == 26 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p343 == 27 then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p343 == 28 then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p343 == 29 then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p343 == 30 then "ACTION_TYPE_REFRESH_FROM_API" elseif p343 == 31 then "ACTION_TYPE_RSVP_TO_EVENT" elseif p343 == 32 then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p343 == 33 then "ACTION_TYPE_ANALYTICS_EVENT" elseif p343 == 34 then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p343 == 35 then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p343 == 36 then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p343 == 37 then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p343 == 38 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p343 == 39 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p343 == 40 then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p343 == 41 then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p343 == 42 then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p343 == 43 then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p343 == 44 then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p343 == 45 then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p343 == 46 then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p343 == 47 then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p343 == 48 then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p343 == 49 then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p343 == 50 then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p343 == 51 then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p343 == 52 then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p343 == 53 then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p343 == 54 then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p343 == 55 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p343 == 56 then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p343 == 57 then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p343 == 58 then "ACTION_TYPE_DISMISS_PROMPT" elseif p343 == 59 then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p343 == 60 then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p343 == 61 then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p343 == 62 then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p343 == 63 then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p343 == 64 then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p343 == 65 then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p343 == 66 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" elseif p343 == 67 then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" elseif p343 == 68 then "ACTION_TYPE_DOWNLOAD_APP" elseif p343 == 69 then "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" elseif p343 == 70 then "ACTION_TYPE_JOIN_COMMUNITY" elseif p343 == 71 then "ACTION_TYPE_VIEW_COMMUNITY" elseif p343 == 72 then "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" elseif p343 == 73 then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" elseif p343 == 74 then "ACTION_TYPE_SHOW_TOAST" elseif p343 == 75 then "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" elseif p343 == 76 then "ACTION_TYPE_ACTION_SEQUENCE" else nil
	end,
	toNumber = function(p344) --[[ line: 33548 ]]
		return if p344 == "ACTION_TYPE_INVALID" then 0 elseif p344 == "ACTION_TYPE_DISMISS_DIALOG" then 1 elseif p344 == "ACTION_TYPE_LINK" then 2 elseif p344 == "ACTION_TYPE_OPEN_GAME_DETAILS" then 3 elseif p344 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then 4 elseif p344 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then 5 elseif p344 == "ACTION_TYPE_OPEN_SEE_ALL" then 6 elseif p344 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then 7 elseif p344 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then 8 elseif p344 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then 9 elseif p344 == "ACTION_TYPE_OPEN_TOOLTIP" then 10 elseif p344 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then 11 elseif p344 == "ACTION_TYPE_LOAD_MORE_FROM_API" then 12 elseif p344 == "ACTION_TYPE_SHARE" then 13 elseif p344 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then 14 elseif p344 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then 15 elseif p344 == "ACTION_TYPE_OPEN_PROFILE" then 16 elseif p344 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then 17 elseif p344 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then 18 elseif p344 == "ACTION_TYPE_OPEN_MARKETPLACE" then 19 elseif p344 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then 20 elseif p344 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then 21 elseif p344 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then 22 elseif p344 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then 23 elseif p344 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then 24 elseif p344 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then 25 elseif p344 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then 26 elseif p344 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then 27 elseif p344 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then 28 elseif p344 == "ACTION_TYPE_OPEN_SONG_DETAIL" then 29 elseif p344 == "ACTION_TYPE_REFRESH_FROM_API" then 30 elseif p344 == "ACTION_TYPE_RSVP_TO_EVENT" then 31 elseif p344 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then 32 elseif p344 == "ACTION_TYPE_ANALYTICS_EVENT" then 33 elseif p344 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then 34 elseif p344 == "ACTION_TYPE_OPEN_GAME_INVITE" then 35 elseif p344 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then 36 elseif p344 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then 37 elseif p344 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then 38 elseif p344 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then 39 elseif p344 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then 40 elseif p344 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then 41 elseif p344 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then 42 elseif p344 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then 43 elseif p344 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then 44 elseif p344 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then 45 elseif p344 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then 46 elseif p344 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then 47 elseif p344 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then 48 elseif p344 == "ACTION_TYPE_OPEN_AMP_WIZARD" then 49 elseif p344 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then 50 elseif p344 == "ACTION_TYPE_REFRESH_GAME_PASSES" then 51 elseif p344 == "ACTION_TYPE_REFRESH_PLAYABILITY" then 52 elseif p344 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then 53 elseif p344 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then 54 elseif p344 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then 55 elseif p344 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then 56 elseif p344 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then 57 elseif p344 == "ACTION_TYPE_DISMISS_PROMPT" then 58 elseif p344 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then 59 elseif p344 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then 60 elseif p344 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then 61 elseif p344 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then 62 elseif p344 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then 63 elseif p344 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then 64 elseif p344 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then 65 elseif p344 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then 66 elseif p344 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" then 67 elseif p344 == "ACTION_TYPE_DOWNLOAD_APP" then 68 elseif p344 == "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" then 69 elseif p344 == "ACTION_TYPE_JOIN_COMMUNITY" then 70 elseif p344 == "ACTION_TYPE_VIEW_COMMUNITY" then 71 elseif p344 == "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" then 72 elseif p344 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" then 73 elseif p344 == "ACTION_TYPE_SHOW_TOAST" then 74 elseif p344 == "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" then 75 elseif p344 == "ACTION_TYPE_ACTION_SEQUENCE" then 76 else p344
	end,
	fromName = function(p345) --[[ line: 33708 ]]
		return if p345 == "ACTION_TYPE_INVALID" then "ACTION_TYPE_INVALID" elseif p345 == "ACTION_TYPE_DISMISS_DIALOG" then "ACTION_TYPE_DISMISS_DIALOG" elseif p345 == "ACTION_TYPE_LINK" then "ACTION_TYPE_LINK" elseif p345 == "ACTION_TYPE_OPEN_GAME_DETAILS" then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p345 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p345 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p345 == "ACTION_TYPE_OPEN_SEE_ALL" then "ACTION_TYPE_OPEN_SEE_ALL" elseif p345 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p345 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p345 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p345 == "ACTION_TYPE_OPEN_TOOLTIP" then "ACTION_TYPE_OPEN_TOOLTIP" elseif p345 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p345 == "ACTION_TYPE_LOAD_MORE_FROM_API" then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p345 == "ACTION_TYPE_SHARE" then "ACTION_TYPE_SHARE" elseif p345 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p345 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p345 == "ACTION_TYPE_OPEN_PROFILE" then "ACTION_TYPE_OPEN_PROFILE" elseif p345 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p345 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p345 == "ACTION_TYPE_OPEN_MARKETPLACE" then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p345 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p345 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p345 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p345 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p345 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p345 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p345 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p345 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p345 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p345 == "ACTION_TYPE_OPEN_SONG_DETAIL" then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p345 == "ACTION_TYPE_REFRESH_FROM_API" then "ACTION_TYPE_REFRESH_FROM_API" elseif p345 == "ACTION_TYPE_RSVP_TO_EVENT" then "ACTION_TYPE_RSVP_TO_EVENT" elseif p345 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p345 == "ACTION_TYPE_ANALYTICS_EVENT" then "ACTION_TYPE_ANALYTICS_EVENT" elseif p345 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p345 == "ACTION_TYPE_OPEN_GAME_INVITE" then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p345 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p345 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p345 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p345 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p345 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p345 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p345 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p345 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p345 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p345 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p345 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p345 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p345 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p345 == "ACTION_TYPE_OPEN_AMP_WIZARD" then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p345 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p345 == "ACTION_TYPE_REFRESH_GAME_PASSES" then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p345 == "ACTION_TYPE_REFRESH_PLAYABILITY" then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p345 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p345 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p345 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p345 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p345 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p345 == "ACTION_TYPE_DISMISS_PROMPT" then "ACTION_TYPE_DISMISS_PROMPT" elseif p345 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p345 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p345 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p345 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p345 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p345 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p345 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p345 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" elseif p345 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" elseif p345 == "ACTION_TYPE_DOWNLOAD_APP" then "ACTION_TYPE_DOWNLOAD_APP" elseif p345 == "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" then "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" elseif p345 == "ACTION_TYPE_JOIN_COMMUNITY" then "ACTION_TYPE_JOIN_COMMUNITY" elseif p345 == "ACTION_TYPE_VIEW_COMMUNITY" then "ACTION_TYPE_VIEW_COMMUNITY" elseif p345 == "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" then "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" elseif p345 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" elseif p345 == "ACTION_TYPE_SHOW_TOAST" then "ACTION_TYPE_SHOW_TOAST" elseif p345 == "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" then "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" elseif p345 == "ACTION_TYPE_ACTION_SEQUENCE" then "ACTION_TYPE_ACTION_SEQUENCE" else nil
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
	ShowToastAction = t.ShowToastAction,
	ShowToastAction_Params = t.ShowToastAction_Params,
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
	OpenIncomingTransferUpsellAction = t.OpenIncomingTransferUpsellAction,
	OpenIncomingTransferUpsellAction_Params = t.OpenIncomingTransferUpsellAction_Params,
	OpenSduiOverlayAction = t.OpenSduiOverlayAction,
	OpenSduiOverlayAction_Params = t.OpenSduiOverlayAction_Params,
	ApplyChartsFilterAction = t.ApplyChartsFilterAction,
	ApplyChartsFilterAction_Params = t.ApplyChartsFilterAction_Params,
	RefreshChartsSortDetailAction = t.RefreshChartsSortDetailAction,
	RefreshChartsSortDetailAction_Params = t.RefreshChartsSortDetailAction_Params,
	JoinCommunityAction = t.JoinCommunityAction,
	JoinCommunityAction_Params = t.JoinCommunityAction_Params,
	ViewCommunityAction = t.ViewCommunityAction,
	ViewCommunityAction_Params = t.ViewCommunityAction_Params,
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
	SelectMarketplaceFavoritesCategory = t.SelectMarketplaceFavoritesCategory,
	SelectMarketplaceFavoritesCategory_Params = t.SelectMarketplaceFavoritesCategory_Params,
	SelectMarketplaceFavoritesSubcategory = t.SelectMarketplaceFavoritesSubcategory,
	SelectMarketplaceFavoritesSubcategory_Params = t.SelectMarketplaceFavoritesSubcategory_Params,
	PinExperienceShortcutAction = t.PinExperienceShortcutAction,
	PinExperienceShortcutAction_Params = t.PinExperienceShortcutAction_Params,
	DownloadAppAction = t.DownloadAppAction,
	DownloadAppAction_Params = t.DownloadAppAction_Params,
	ActionSequenceAction = t.ActionSequenceAction,
	ActionSequenceAction_Params = t.ActionSequenceAction_Params,
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