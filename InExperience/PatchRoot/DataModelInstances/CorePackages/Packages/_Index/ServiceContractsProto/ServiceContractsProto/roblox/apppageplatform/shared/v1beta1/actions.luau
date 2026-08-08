local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local propConditionModule = require(script.Parent.prop_condition)
local propTypesModule = require(script.Parent.prop_types)
local propTypesEngineModule = require(script.Parent.prop_types_engine)
local shareLinkDataModule = require(script.Parent.share_link_data)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 5603 ]]
	-- upvalues: t (ref), t_1 (ref)
	return setmetatable({
		action_type = if p0 == nil or p0.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p0.action_type,
		action_params = if p0 == nil or p0.action_params == nil then nil else p0.action_params
	}, t_1)
end

function t_1:encode() --[[ line: 5612 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var185 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var186, var187 = protoModule.writeTag(buff, var185, 1, protoModule.wireTypes.varint)
		var186, var187 = protoModule.writeVarInt(var186, var187, t.ActionType.toNumber(self.action_type))
		buff = var186
		var185 = var187
	end
	if self.action_params ~= nil then
		local var188 = self.action_params:encode()
		local var189, var190 = protoModule.writeTag(buff, var185, 2, protoModule.wireTypes.lengthDelimited)
		var189, var190 = protoModule.writeBuffer(var189, var190, var188, buffer.len(var188))
		buff = var189
		var185 = var190
	end
	local buff_1 = buffer.create(var185)
	buffer.copy(buff_1, 0, buff, 0, var185)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 5638 ]]
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var192 = t_1.new()
	local var193 = 0
	while var193 < buffer.len(p1) do
		local _ = nil
		local var194 = nil
		local var195, var196, var197 = protoModule.readTag(p1, var193)
		local var198 = var195
		var194 = var196
		var193 = var197
		
		if var194 == protoModule.wireTypes.varint then
			if var198 == 1 then
				local _ = nil
				local var199, var200 = protoModule.readVarIntI32(p1, var193)
				local var201 = var199
				var193 = var200
				var192.action_type = t.ActionType.fromNumber(var201) or var201
			else
				local _ = nil
				local var202, var203 = protoModule.readVarInt(p1, var193)
				local _ = var202
				var193 = var203
			end
		end
		if var194 == protoModule.wireTypes.lengthDelimited then
			if var198 == 2 then
				local _ = nil
				local var204, var205 = protoModule.readBuffer(p1, var193)
				var193 = var205
				var192.action_params = t.DismissDialogAction_Params.decode(var204)
			else
				local _ = nil
				local var206, var207 = protoModule.readVarInt(p1, var193)
				var193 = var207 + var206
			end
		elseif var194 == protoModule.wireTypes.i32 then
			local _ = nil
			local var208, var209 = protoModule.readFixed32(p1, var193)
			local _ = var208
			var193 = var209
		elseif var194 == protoModule.wireTypes.i64 then
			local _ = nil
			local var210, var211 = protoModule.readFixed64(p1, var193)
			local _ = var210
			var193 = var211
		else
			error("Unsupported wire type: " .. var194)
		end
	end
	return var192
end

function t_1:jsonEncode() --[[ line: 5686 ]]
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

function t_1:jsonDecode() --[[ line: 5708 ]]
	-- upvalues: t_1 (ref), t (ref)
	local var213 = t_1.new()
	
	if self.action_type ~= nil then
		var213.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var213.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var213.action_params = t.DismissDialogAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var213.action_params = t.DismissDialogAction_Params.jsonDecode(self.actionParams)
	end
	return var213
end

t_1.descriptor = {
	name = "DismissDialogAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissDialogAction"
}
t.DismissDialogAction = t_1
typeRegistryModule.default:register(t.DismissDialogAction)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 5748 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		dialog_type = if p2 == nil or p2.dialog_type == nil then nil else p2.dialog_type
	}, t_2)
end

function t_2:encode() --[[ line: 5756 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var215 = 0
	
	if self.dialog_type ~= nil then
		local var216 = self.dialog_type:encode()
		local var217, var218 = protoModule.writeTag(buff, var215, 1, protoModule.wireTypes.lengthDelimited)
		var217, var218 = protoModule.writeBuffer(var217, var218, var216, buffer.len(var216))
		buff = var217
		var215 = var218
	end
	local buff_1 = buffer.create(var215)
	buffer.copy(buff_1, 0, buff, 0, var215)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 5771 ]]
	-- upvalues: t_2 (ref), protoModule (ref), propTypesModule (ref)
	local var220 = t_2.new()
	local var221 = 0
	while var221 < buffer.len(p3) do
		local _ = nil
		local var222 = nil
		local var223, var224, var225 = protoModule.readTag(p3, var221)
		local var226 = var223
		var222 = var224
		var221 = var225
		
		if var222 == protoModule.wireTypes.varint then
			local _ = nil
			local var227, var228 = protoModule.readVarInt(p3, var221)
			local _ = var227
			var221 = var228
			continue
		end
		if var222 == protoModule.wireTypes.lengthDelimited then
			if var226 == 1 then
				local _ = nil
				local var229, var230 = protoModule.readBuffer(p3, var221)
				var221 = var230
				var220.dialog_type = propTypesModule.StringProp.decode(var229)
			else
				local _ = nil
				local var231, var232 = protoModule.readVarInt(p3, var221)
				var221 = var232 + var231
			end
		elseif var222 == protoModule.wireTypes.i32 then
			local _ = nil
			local var233, var234 = protoModule.readFixed32(p3, var221)
			local _ = var233
			var221 = var234
		elseif var222 == protoModule.wireTypes.i64 then
			local _ = nil
			local var235, var236 = protoModule.readFixed64(p3, var221)
			local _ = var235
			var221 = var236
		else
			error("Unsupported wire type: " .. var222)
		end
	end
	return var220
end

function t_2:jsonEncode() --[[ line: 5814 ]]
	local t = {}
	
	if self.dialog_type ~= nil then
		t.dialogType = self.dialog_type:jsonEncode()
	end
	return t
end

function t_2:jsonDecode() --[[ line: 5824 ]]
	-- upvalues: t_2 (ref), propTypesModule (ref)
	local var238 = t_2.new()
	
	if self.dialog_type ~= nil then
		var238.dialog_type = propTypesModule.StringProp.jsonDecode(self.dialog_type)
	end
	if self.dialogType ~= nil then
		var238.dialog_type = propTypesModule.StringProp.jsonDecode(self.dialogType)
	end
	return var238
end

t_2.descriptor = {
	name = "DismissDialogAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissDialogAction_Params = t_2
typeRegistryModule.default:register(t.DismissDialogAction_Params)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 5853 ]]
	-- upvalues: t (ref), t_3 (ref)
	return setmetatable({
		action_type = if p4 == nil or p4.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p4.action_type,
		action_params = if p4 == nil or p4.action_params == nil then nil else p4.action_params
	}, t_3)
end

function t_3:encode() --[[ line: 5862 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var240 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var241, var242 = protoModule.writeTag(buff, var240, 1, protoModule.wireTypes.varint)
		var241, var242 = protoModule.writeVarInt(var241, var242, t.ActionType.toNumber(self.action_type))
		buff = var241
		var240 = var242
	end
	if self.action_params ~= nil then
		local var243 = self.action_params:encode()
		local var244, var245 = protoModule.writeTag(buff, var240, 2, protoModule.wireTypes.lengthDelimited)
		var244, var245 = protoModule.writeBuffer(var244, var245, var243, buffer.len(var243))
		buff = var244
		var240 = var245
	end
	local buff_1 = buffer.create(var240)
	buffer.copy(buff_1, 0, buff, 0, var240)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 5888 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var247 = t_3.new()
	local var248 = 0
	while var248 < buffer.len(p5) do
		local _ = nil
		local var249 = nil
		local var250, var251, var252 = protoModule.readTag(p5, var248)
		local var253 = var250
		var249 = var251
		var248 = var252
		
		if var249 == protoModule.wireTypes.varint then
			if var253 == 1 then
				local _ = nil
				local var254, var255 = protoModule.readVarIntI32(p5, var248)
				local var256 = var254
				var248 = var255
				var247.action_type = t.ActionType.fromNumber(var256) or var256
			else
				local _ = nil
				local var257, var258 = protoModule.readVarInt(p5, var248)
				local _ = var257
				var248 = var258
			end
		end
		if var249 == protoModule.wireTypes.lengthDelimited then
			if var253 == 2 then
				local _ = nil
				local var259, var260 = protoModule.readBuffer(p5, var248)
				var248 = var260
				var247.action_params = t.LinkAction_Params.decode(var259)
			else
				local _ = nil
				local var261, var262 = protoModule.readVarInt(p5, var248)
				var248 = var262 + var261
			end
		elseif var249 == protoModule.wireTypes.i32 then
			local _ = nil
			local var263, var264 = protoModule.readFixed32(p5, var248)
			local _ = var263
			var248 = var264
		elseif var249 == protoModule.wireTypes.i64 then
			local _ = nil
			local var265, var266 = protoModule.readFixed64(p5, var248)
			local _ = var265
			var248 = var266
		else
			error("Unsupported wire type: " .. var249)
		end
	end
	return var247
end

function t_3:jsonEncode() --[[ line: 5936 ]]
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

function t_3:jsonDecode() --[[ line: 5958 ]]
	-- upvalues: t_3 (ref), t (ref)
	local var268 = t_3.new()
	
	if self.action_type ~= nil then
		var268.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var268.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var268.action_params = t.LinkAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var268.action_params = t.LinkAction_Params.jsonDecode(self.actionParams)
	end
	return var268
end

t_3.descriptor = {
	name = "LinkAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LinkAction"
}
t.LinkAction = t_3
typeRegistryModule.default:register(t.LinkAction)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 5998 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		url = if p6 == nil or p6.url == nil then nil else p6.url,
		title_key = if p6 == nil or p6.title_key == nil then nil else p6.title_key,
		on_webview_close = if p6 == nil or p6.on_webview_close == nil then nil else p6.on_webview_close
	}, t_4)
end

function t_4:encode() --[[ line: 6006 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var270 = 0
	
	if self.url ~= nil then
		local var271 = self.url:encode()
		local var272, var273 = protoModule.writeTag(buff, var270, 1, protoModule.wireTypes.lengthDelimited)
		var272, var273 = protoModule.writeBuffer(var272, var273, var271, buffer.len(var271))
		buff = var272
		var270 = var273
	end
	if self.title_key ~= nil then
		local var274 = self.title_key:encode()
		local var275, var276 = protoModule.writeTag(buff, var270, 2, protoModule.wireTypes.lengthDelimited)
		var275, var276 = protoModule.writeBuffer(var275, var276, var274, buffer.len(var274))
		buff = var275
		var270 = var276
	end
	if self.on_webview_close ~= nil then
		local var277 = self.on_webview_close:encode()
		local var278, var279 = protoModule.writeTag(buff, var270, 4, protoModule.wireTypes.lengthDelimited)
		var278, var279 = protoModule.writeBuffer(var278, var279, var277, buffer.len(var277))
		buff = var278
		var270 = var279
	end
	local buff_1 = buffer.create(var270)
	buffer.copy(buff_1, 0, buff, 0, var270)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 6033 ]]
	-- upvalues: t_4 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var281 = t_4.new()
	local var282 = 0
	while var282 < buffer.len(p7) do
		local _ = nil
		local var283 = nil
		local var284, var285, var286 = protoModule.readTag(p7, var282)
		local var287 = var284
		var283 = var285
		var282 = var286
		
		if var283 == protoModule.wireTypes.varint then
			local _ = nil
			local var288, var289 = protoModule.readVarInt(p7, var282)
			local _ = var288
			var282 = var289
			continue
		end
		if var283 == protoModule.wireTypes.lengthDelimited then
			if var287 == 1 then
				local _ = nil
				local var290, var291 = protoModule.readBuffer(p7, var282)
				var282 = var291
				var281.url = propTypesModule.StringProp.decode(var290)
			elseif var287 == 2 then
				local _ = nil
				local var292, var293 = protoModule.readBuffer(p7, var282)
				var282 = var293
				var281.title_key = propTypesModule.StringProp.decode(var292)
			elseif var287 == 4 then
				local _ = nil
				local var294, var295 = protoModule.readBuffer(p7, var282)
				var282 = var295
				var281.on_webview_close = t.ActionProp.decode(var294)
			else
				local _ = nil
				local var296, var297 = protoModule.readVarInt(p7, var282)
				var282 = var297 + var296
			end
		elseif var283 == protoModule.wireTypes.i32 then
			local _ = nil
			local var298, var299 = protoModule.readFixed32(p7, var282)
			local _ = var298
			var282 = var299
		elseif var283 == protoModule.wireTypes.i64 then
			local _ = nil
			local var300, var301 = protoModule.readFixed64(p7, var282)
			local _ = var300
			var282 = var301
		else
			error("Unsupported wire type: " .. var283)
		end
	end
	return var281
end

function t_4:jsonEncode() --[[ line: 6086 ]]
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

function t_4:jsonDecode() --[[ line: 6104 ]]
	-- upvalues: t_4 (ref), propTypesModule (ref), t (ref)
	local var303 = t_4.new()
	
	if self.url ~= nil then
		var303.url = propTypesModule.StringProp.jsonDecode(self.url)
	end
	if self.title_key ~= nil then
		var303.title_key = propTypesModule.StringProp.jsonDecode(self.title_key)
	end
	if self.titleKey ~= nil then
		var303.title_key = propTypesModule.StringProp.jsonDecode(self.titleKey)
	end
	if self.on_webview_close ~= nil then
		var303.on_webview_close = t.ActionProp.jsonDecode(self.on_webview_close)
	end
	if self.onWebviewClose ~= nil then
		var303.on_webview_close = t.ActionProp.jsonDecode(self.onWebviewClose)
	end
	return var303
end

t_4.descriptor = {
	name = "LinkAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LinkAction_Params = t_4
typeRegistryModule.default:register(t.LinkAction_Params)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 6144 ]]
	-- upvalues: t (ref), t_5 (ref)
	return setmetatable({
		action_type = if p8 == nil or p8.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p8.action_type,
		action_params = if p8 == nil or p8.action_params == nil then nil else p8.action_params
	}, t_5)
end

function t_5:encode() --[[ line: 6153 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var305 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var306, var307 = protoModule.writeTag(buff, var305, 1, protoModule.wireTypes.varint)
		var306, var307 = protoModule.writeVarInt(var306, var307, t.ActionType.toNumber(self.action_type))
		buff = var306
		var305 = var307
	end
	if self.action_params ~= nil then
		local var308 = self.action_params:encode()
		local var309, var310 = protoModule.writeTag(buff, var305, 2, protoModule.wireTypes.lengthDelimited)
		var309, var310 = protoModule.writeBuffer(var309, var310, var308, buffer.len(var308))
		buff = var309
		var305 = var310
	end
	local buff_1 = buffer.create(var305)
	buffer.copy(buff_1, 0, buff, 0, var305)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 6179 ]]
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var312 = t_5.new()
	local var313 = 0
	while var313 < buffer.len(p9) do
		local _ = nil
		local var314 = nil
		local var315, var316, var317 = protoModule.readTag(p9, var313)
		local var318 = var315
		var314 = var316
		var313 = var317
		
		if var314 == protoModule.wireTypes.varint then
			if var318 == 1 then
				local _ = nil
				local var319, var320 = protoModule.readVarIntI32(p9, var313)
				local var321 = var319
				var313 = var320
				var312.action_type = t.ActionType.fromNumber(var321) or var321
			else
				local _ = nil
				local var322, var323 = protoModule.readVarInt(p9, var313)
				local _ = var322
				var313 = var323
			end
		end
		if var314 == protoModule.wireTypes.lengthDelimited then
			if var318 == 2 then
				local _ = nil
				local var324, var325 = protoModule.readBuffer(p9, var313)
				var313 = var325
				var312.action_params = t.OpenSocialLinkAction_Params.decode(var324)
			else
				local _ = nil
				local var326, var327 = protoModule.readVarInt(p9, var313)
				var313 = var327 + var326
			end
		elseif var314 == protoModule.wireTypes.i32 then
			local _ = nil
			local var328, var329 = protoModule.readFixed32(p9, var313)
			local _ = var328
			var313 = var329
		elseif var314 == protoModule.wireTypes.i64 then
			local _ = nil
			local var330, var331 = protoModule.readFixed64(p9, var313)
			local _ = var330
			var313 = var331
		else
			error("Unsupported wire type: " .. var314)
		end
	end
	return var312
end

function t_5:jsonEncode() --[[ line: 6227 ]]
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

function t_5:jsonDecode() --[[ line: 6249 ]]
	-- upvalues: t_5 (ref), t (ref)
	local var333 = t_5.new()
	
	if self.action_type ~= nil then
		var333.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var333.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var333.action_params = t.OpenSocialLinkAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var333.action_params = t.OpenSocialLinkAction_Params.jsonDecode(self.actionParams)
	end
	return var333
end

t_5.descriptor = {
	name = "OpenSocialLinkAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSocialLinkAction"
}
t.OpenSocialLinkAction = t_5
typeRegistryModule.default:register(t.OpenSocialLinkAction)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 6289 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		assignment_id = if p10 == nil or p10.assignment_id == nil then nil else p10.assignment_id,
		assignment_type = if p10 == nil or p10.assignment_type == nil then nil else p10.assignment_type,
		social_link_type = if p10 == nil or p10.social_link_type == nil then nil else p10.social_link_type,
		social_link_url = if p10 == nil or p10.social_link_url == nil then nil else p10.social_link_url,
		social_link_display_type = if p10 == nil or p10.social_link_display_type == nil then nil else p10.social_link_display_type
	}, t_6)
end

function t_6:encode() --[[ line: 6303 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var335 = 0
	
	if self.assignment_id ~= nil then
		local var336 = self.assignment_id:encode()
		local var337, var338 = protoModule.writeTag(buff, var335, 1, protoModule.wireTypes.lengthDelimited)
		var337, var338 = protoModule.writeBuffer(var337, var338, var336, buffer.len(var336))
		buff = var337
		var335 = var338
	end
	if self.assignment_type ~= nil then
		local var339 = self.assignment_type:encode()
		local var340, var341 = protoModule.writeTag(buff, var335, 2, protoModule.wireTypes.lengthDelimited)
		var340, var341 = protoModule.writeBuffer(var340, var341, var339, buffer.len(var339))
		buff = var340
		var335 = var341
	end
	if self.social_link_type ~= nil then
		local var342 = self.social_link_type:encode()
		local var343, var344 = protoModule.writeTag(buff, var335, 3, protoModule.wireTypes.lengthDelimited)
		var343, var344 = protoModule.writeBuffer(var343, var344, var342, buffer.len(var342))
		buff = var343
		var335 = var344
	end
	if self.social_link_url ~= nil then
		local var345 = self.social_link_url:encode()
		local var346, var347 = protoModule.writeTag(buff, var335, 4, protoModule.wireTypes.lengthDelimited)
		var346, var347 = protoModule.writeBuffer(var346, var347, var345, buffer.len(var345))
		buff = var346
		var335 = var347
	end
	if self.social_link_display_type ~= nil then
		local var348 = self.social_link_display_type:encode()
		local var349, var350 = protoModule.writeTag(buff, var335, 5, protoModule.wireTypes.lengthDelimited)
		var349, var350 = protoModule.writeBuffer(var349, var350, var348, buffer.len(var348))
		buff = var349
		var335 = var350
	end
	local buff_1 = buffer.create(var335)
	buffer.copy(buff_1, 0, buff, 0, var335)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 6342 ]]
	-- upvalues: t_6 (ref), protoModule (ref), propTypesModule (ref)
	local var352 = t_6.new()
	local var353 = 0
	while var353 < buffer.len(p11) do
		local _ = nil
		local var354 = nil
		local var355, var356, var357 = protoModule.readTag(p11, var353)
		local var358 = var355
		var354 = var356
		var353 = var357
		
		if var354 == protoModule.wireTypes.varint then
			local _ = nil
			local var359, var360 = protoModule.readVarInt(p11, var353)
			local _ = var359
			var353 = var360
			continue
		end
		if var354 == protoModule.wireTypes.lengthDelimited then
			if var358 == 1 then
				local _ = nil
				local var361, var362 = protoModule.readBuffer(p11, var353)
				var353 = var362
				var352.assignment_id = propTypesModule.StringProp.decode(var361)
			elseif var358 == 2 then
				local _ = nil
				local var363, var364 = protoModule.readBuffer(p11, var353)
				var353 = var364
				var352.assignment_type = propTypesModule.StringProp.decode(var363)
			elseif var358 == 3 then
				local _ = nil
				local var365, var366 = protoModule.readBuffer(p11, var353)
				var353 = var366
				var352.social_link_type = propTypesModule.StringProp.decode(var365)
			elseif var358 == 4 then
				local _ = nil
				local var367, var368 = protoModule.readBuffer(p11, var353)
				var353 = var368
				var352.social_link_url = propTypesModule.StringProp.decode(var367)
			elseif var358 == 5 then
				local _ = nil
				local var369, var370 = protoModule.readBuffer(p11, var353)
				var353 = var370
				var352.social_link_display_type = propTypesModule.StringProp.decode(var369)
			else
				local _ = nil
				local var371, var372 = protoModule.readVarInt(p11, var353)
				var353 = var372 + var371
			end
		elseif var354 == protoModule.wireTypes.i32 then
			local _ = nil
			local var373, var374 = protoModule.readFixed32(p11, var353)
			local _ = var373
			var353 = var374
		elseif var354 == protoModule.wireTypes.i64 then
			local _ = nil
			local var375, var376 = protoModule.readFixed64(p11, var353)
			local _ = var375
			var353 = var376
		else
			error("Unsupported wire type: " .. var354)
		end
	end
	return var352
end

function t_6:jsonEncode() --[[ line: 6406 ]]
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

function t_6:jsonDecode() --[[ line: 6432 ]]
	-- upvalues: t_6 (ref), propTypesModule (ref)
	local var378 = t_6.new()
	
	if self.assignment_id ~= nil then
		var378.assignment_id = propTypesModule.StringProp.jsonDecode(self.assignment_id)
	end
	if self.assignmentId ~= nil then
		var378.assignment_id = propTypesModule.StringProp.jsonDecode(self.assignmentId)
	end
	if self.assignment_type ~= nil then
		var378.assignment_type = propTypesModule.StringProp.jsonDecode(self.assignment_type)
	end
	if self.assignmentType ~= nil then
		var378.assignment_type = propTypesModule.StringProp.jsonDecode(self.assignmentType)
	end
	if self.social_link_type ~= nil then
		var378.social_link_type = propTypesModule.StringProp.jsonDecode(self.social_link_type)
	end
	if self.socialLinkType ~= nil then
		var378.social_link_type = propTypesModule.StringProp.jsonDecode(self.socialLinkType)
	end
	if self.social_link_url ~= nil then
		var378.social_link_url = propTypesModule.StringProp.jsonDecode(self.social_link_url)
	end
	if self.socialLinkUrl ~= nil then
		var378.social_link_url = propTypesModule.StringProp.jsonDecode(self.socialLinkUrl)
	end
	if self.social_link_display_type ~= nil then
		var378.social_link_display_type = propTypesModule.StringProp.jsonDecode(self.social_link_display_type)
	end
	if self.socialLinkDisplayType ~= nil then
		var378.social_link_display_type = propTypesModule.StringProp.jsonDecode(self.socialLinkDisplayType)
	end
	return var378
end

t_6.descriptor = {
	name = "OpenSocialLinkAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSocialLinkAction_Params = t_6
typeRegistryModule.default:register(t.OpenSocialLinkAction_Params)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12) --[[ line: 6502 ]]
	-- upvalues: t (ref), t_7 (ref)
	return setmetatable({
		action_type = if p12 == nil or p12.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p12.action_type,
		action_params = if p12 == nil or p12.action_params == nil then nil else p12.action_params
	}, t_7)
end

function t_7:encode() --[[ line: 6511 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var380 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var381, var382 = protoModule.writeTag(buff, var380, 1, protoModule.wireTypes.varint)
		var381, var382 = protoModule.writeVarInt(var381, var382, t.ActionType.toNumber(self.action_type))
		buff = var381
		var380 = var382
	end
	if self.action_params ~= nil then
		local var383 = self.action_params:encode()
		local var384, var385 = protoModule.writeTag(buff, var380, 2, protoModule.wireTypes.lengthDelimited)
		var384, var385 = protoModule.writeBuffer(var384, var385, var383, buffer.len(var383))
		buff = var384
		var380 = var385
	end
	local buff_1 = buffer.create(var380)
	buffer.copy(buff_1, 0, buff, 0, var380)
	
	return buff_1
end

function t_7.decode(p13) --[[ line: 6537 ]]
	-- upvalues: t_7 (ref), protoModule (ref), t (ref)
	local var387 = t_7.new()
	local var388 = 0
	while var388 < buffer.len(p13) do
		local _ = nil
		local var389 = nil
		local var390, var391, var392 = protoModule.readTag(p13, var388)
		local var393 = var390
		var389 = var391
		var388 = var392
		
		if var389 == protoModule.wireTypes.varint then
			if var393 == 1 then
				local _ = nil
				local var394, var395 = protoModule.readVarIntI32(p13, var388)
				local var396 = var394
				var388 = var395
				var387.action_type = t.ActionType.fromNumber(var396) or var396
			else
				local _ = nil
				local var397, var398 = protoModule.readVarInt(p13, var388)
				local _ = var397
				var388 = var398
			end
		end
		if var389 == protoModule.wireTypes.lengthDelimited then
			if var393 == 2 then
				local _ = nil
				local var399, var400 = protoModule.readBuffer(p13, var388)
				var388 = var400
				var387.action_params = t.OpenGameDetailsAction_Params.decode(var399)
			else
				local _ = nil
				local var401, var402 = protoModule.readVarInt(p13, var388)
				var388 = var402 + var401
			end
		elseif var389 == protoModule.wireTypes.i32 then
			local _ = nil
			local var403, var404 = protoModule.readFixed32(p13, var388)
			local _ = var403
			var388 = var404
		elseif var389 == protoModule.wireTypes.i64 then
			local _ = nil
			local var405, var406 = protoModule.readFixed64(p13, var388)
			local _ = var405
			var388 = var406
		else
			error("Unsupported wire type: " .. var389)
		end
	end
	return var387
end

function t_7:jsonEncode() --[[ line: 6585 ]]
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

function t_7:jsonDecode() --[[ line: 6607 ]]
	-- upvalues: t_7 (ref), t (ref)
	local var408 = t_7.new()
	
	if self.action_type ~= nil then
		var408.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var408.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var408.action_params = t.OpenGameDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var408.action_params = t.OpenGameDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var408
end

t_7.descriptor = {
	name = "OpenGameDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameDetailsAction"
}
t.OpenGameDetailsAction = t_7
typeRegistryModule.default:register(t.OpenGameDetailsAction)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14) --[[ line: 6647 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		place_id = if p14 == nil or p14.place_id == nil then nil else p14.place_id,
		universe_id = if p14 == nil or p14.universe_id == nil then nil else p14.universe_id,
		inherit_referral_session = if p14 == nil or p14.inherit_referral_session == nil then nil else p14.inherit_referral_session
	}, t_8)
end

function t_8:encode() --[[ line: 6659 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var410 = 0
	
	if self.place_id ~= nil then
		local var411 = self.place_id:encode()
		local var412, var413 = protoModule.writeTag(buff, var410, 1, protoModule.wireTypes.lengthDelimited)
		var412, var413 = protoModule.writeBuffer(var412, var413, var411, buffer.len(var411))
		buff = var412
		var410 = var413
	end
	if self.universe_id ~= nil then
		local var414 = self.universe_id:encode()
		local var415, var416 = protoModule.writeTag(buff, var410, 2, protoModule.wireTypes.lengthDelimited)
		var415, var416 = protoModule.writeBuffer(var415, var416, var414, buffer.len(var414))
		buff = var415
		var410 = var416
	end
	if self.inherit_referral_session ~= nil then
		local var417 = self.inherit_referral_session:encode()
		local var418, var419 = protoModule.writeTag(buff, var410, 3, protoModule.wireTypes.lengthDelimited)
		var418, var419 = protoModule.writeBuffer(var418, var419, var417, buffer.len(var417))
		buff = var418
		var410 = var419
	end
	local buff_1 = buffer.create(var410)
	buffer.copy(buff_1, 0, buff, 0, var410)
	
	return buff_1
end

function t_8.decode(p15) --[[ line: 6686 ]]
	-- upvalues: t_8 (ref), protoModule (ref), propTypesModule (ref)
	local var421 = t_8.new()
	local var422 = 0
	while var422 < buffer.len(p15) do
		local _ = nil
		local var423 = nil
		local var424, var425, var426 = protoModule.readTag(p15, var422)
		local var427 = var424
		var423 = var425
		var422 = var426
		
		if var423 == protoModule.wireTypes.varint then
			local _ = nil
			local var428, var429 = protoModule.readVarInt(p15, var422)
			local _ = var428
			var422 = var429
			continue
		end
		if var423 == protoModule.wireTypes.lengthDelimited then
			if var427 == 1 then
				local _ = nil
				local var430, var431 = protoModule.readBuffer(p15, var422)
				var422 = var431
				var421.place_id = propTypesModule.StringProp.decode(var430)
			elseif var427 == 2 then
				local _ = nil
				local var432, var433 = protoModule.readBuffer(p15, var422)
				var422 = var433
				var421.universe_id = propTypesModule.StringProp.decode(var432)
			elseif var427 == 3 then
				local _ = nil
				local var434, var435 = protoModule.readBuffer(p15, var422)
				var422 = var435
				var421.inherit_referral_session = propTypesModule.BoolProp.decode(var434)
			else
				local _ = nil
				local var436, var437 = protoModule.readVarInt(p15, var422)
				var422 = var437 + var436
			end
		elseif var423 == protoModule.wireTypes.i32 then
			local _ = nil
			local var438, var439 = protoModule.readFixed32(p15, var422)
			local _ = var438
			var422 = var439
		elseif var423 == protoModule.wireTypes.i64 then
			local _ = nil
			local var440, var441 = protoModule.readFixed64(p15, var422)
			local _ = var440
			var422 = var441
		else
			error("Unsupported wire type: " .. var423)
		end
	end
	return var421
end

function t_8:jsonEncode() --[[ line: 6740 ]]
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

function t_8:jsonDecode() --[[ line: 6758 ]]
	-- upvalues: t_8 (ref), propTypesModule (ref)
	local var443 = t_8.new()
	
	if self.place_id ~= nil then
		var443.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var443.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var443.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var443.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.inherit_referral_session ~= nil then
		var443.inherit_referral_session = propTypesModule.BoolProp.jsonDecode(self.inherit_referral_session)
	end
	if self.inheritReferralSession ~= nil then
		var443.inherit_referral_session = propTypesModule.BoolProp.jsonDecode(self.inheritReferralSession)
	end
	return var443
end

t_8.descriptor = {
	name = "OpenGameDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameDetailsAction_Params = t_8
typeRegistryModule.default:register(t.OpenGameDetailsAction_Params)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16) --[[ line: 6805 ]]
	-- upvalues: t (ref), t_9 (ref)
	return setmetatable({
		action_type = if p16 == nil or p16.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p16.action_type,
		action_params = if p16 == nil or p16.action_params == nil then nil else p16.action_params
	}, t_9)
end

function t_9:encode() --[[ line: 6814 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var445 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var446, var447 = protoModule.writeTag(buff, var445, 1, protoModule.wireTypes.varint)
		var446, var447 = protoModule.writeVarInt(var446, var447, t.ActionType.toNumber(self.action_type))
		buff = var446
		var445 = var447
	end
	if self.action_params ~= nil then
		local var448 = self.action_params:encode()
		local var449, var450 = protoModule.writeTag(buff, var445, 2, protoModule.wireTypes.lengthDelimited)
		var449, var450 = protoModule.writeBuffer(var449, var450, var448, buffer.len(var448))
		buff = var449
		var445 = var450
	end
	local buff_1 = buffer.create(var445)
	buffer.copy(buff_1, 0, buff, 0, var445)
	
	return buff_1
end

function t_9.decode(p17) --[[ line: 6840 ]]
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var452 = t_9.new()
	local var453 = 0
	while var453 < buffer.len(p17) do
		local _ = nil
		local var454 = nil
		local var455, var456, var457 = protoModule.readTag(p17, var453)
		local var458 = var455
		var454 = var456
		var453 = var457
		
		if var454 == protoModule.wireTypes.varint then
			if var458 == 1 then
				local _ = nil
				local var459, var460 = protoModule.readVarIntI32(p17, var453)
				local var461 = var459
				var453 = var460
				var452.action_type = t.ActionType.fromNumber(var461) or var461
			else
				local _ = nil
				local var462, var463 = protoModule.readVarInt(p17, var453)
				local _ = var462
				var453 = var463
			end
		end
		if var454 == protoModule.wireTypes.lengthDelimited then
			if var458 == 2 then
				local _ = nil
				local var464, var465 = protoModule.readBuffer(p17, var453)
				var453 = var465
				var452.action_params = t.OpenJoinFriendsAction_Params.decode(var464)
			else
				local _ = nil
				local var466, var467 = protoModule.readVarInt(p17, var453)
				var453 = var467 + var466
			end
		elseif var454 == protoModule.wireTypes.i32 then
			local _ = nil
			local var468, var469 = protoModule.readFixed32(p17, var453)
			local _ = var468
			var453 = var469
		elseif var454 == protoModule.wireTypes.i64 then
			local _ = nil
			local var470, var471 = protoModule.readFixed64(p17, var453)
			local _ = var470
			var453 = var471
		else
			error("Unsupported wire type: " .. var454)
		end
	end
	return var452
end

function t_9:jsonEncode() --[[ line: 6888 ]]
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

function t_9:jsonDecode() --[[ line: 6910 ]]
	-- upvalues: t_9 (ref), t (ref)
	local var473 = t_9.new()
	
	if self.action_type ~= nil then
		var473.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var473.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var473.action_params = t.OpenJoinFriendsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var473.action_params = t.OpenJoinFriendsAction_Params.jsonDecode(self.actionParams)
	end
	return var473
end

t_9.descriptor = {
	name = "OpenJoinFriendsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenJoinFriendsAction"
}
t.OpenJoinFriendsAction = t_9
typeRegistryModule.default:register(t.OpenJoinFriendsAction)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p18) --[[ line: 6950 ]]
	-- upvalues: t_10 (ref)
	return setmetatable({
		place_id = if p18 == nil or p18.place_id == nil then nil else p18.place_id,
		universe_id = if p18 == nil or p18.universe_id == nil then nil else p18.universe_id
	}, t_10)
end

function t_10:encode() --[[ line: 6959 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var475 = 0
	
	if self.place_id ~= nil then
		local var476 = self.place_id:encode()
		local var477, var478 = protoModule.writeTag(buff, var475, 1, protoModule.wireTypes.lengthDelimited)
		var477, var478 = protoModule.writeBuffer(var477, var478, var476, buffer.len(var476))
		buff = var477
		var475 = var478
	end
	if self.universe_id ~= nil then
		local var479 = self.universe_id:encode()
		local var480, var481 = protoModule.writeTag(buff, var475, 2, protoModule.wireTypes.lengthDelimited)
		var480, var481 = protoModule.writeBuffer(var480, var481, var479, buffer.len(var479))
		buff = var480
		var475 = var481
	end
	local buff_1 = buffer.create(var475)
	buffer.copy(buff_1, 0, buff, 0, var475)
	
	return buff_1
end

function t_10.decode(p19) --[[ line: 6980 ]]
	-- upvalues: t_10 (ref), protoModule (ref), propTypesModule (ref)
	local var483 = t_10.new()
	local var484 = 0
	while var484 < buffer.len(p19) do
		local _ = nil
		local var485 = nil
		local var486, var487, var488 = protoModule.readTag(p19, var484)
		local var489 = var486
		var485 = var487
		var484 = var488
		
		if var485 == protoModule.wireTypes.varint then
			local _ = nil
			local var490, var491 = protoModule.readVarInt(p19, var484)
			local _ = var490
			var484 = var491
			continue
		end
		if var485 == protoModule.wireTypes.lengthDelimited then
			if var489 == 1 then
				local _ = nil
				local var492, var493 = protoModule.readBuffer(p19, var484)
				var484 = var493
				var483.place_id = propTypesModule.StringProp.decode(var492)
			elseif var489 == 2 then
				local _ = nil
				local var494, var495 = protoModule.readBuffer(p19, var484)
				var484 = var495
				var483.universe_id = propTypesModule.StringProp.decode(var494)
			else
				local _ = nil
				local var496, var497 = protoModule.readVarInt(p19, var484)
				var484 = var497 + var496
			end
		elseif var485 == protoModule.wireTypes.i32 then
			local _ = nil
			local var498, var499 = protoModule.readFixed32(p19, var484)
			local _ = var498
			var484 = var499
		elseif var485 == protoModule.wireTypes.i64 then
			local _ = nil
			local var500, var501 = protoModule.readFixed64(p19, var484)
			local _ = var500
			var484 = var501
		else
			error("Unsupported wire type: " .. var485)
		end
	end
	return var483
end

function t_10:jsonEncode() --[[ line: 7028 ]]
	local t = {}
	
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_10:jsonDecode() --[[ line: 7042 ]]
	-- upvalues: t_10 (ref), propTypesModule (ref)
	local var503 = t_10.new()
	
	if self.place_id ~= nil then
		var503.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var503.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var503.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var503.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var503
end

t_10.descriptor = {
	name = "OpenJoinFriendsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenJoinFriendsAction_Params = t_10
typeRegistryModule.default:register(t.OpenJoinFriendsAction_Params)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p20) --[[ line: 7079 ]]
	-- upvalues: t (ref), t_11 (ref)
	return setmetatable({
		action_type = if p20 == nil or p20.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p20.action_type,
		action_params = if p20 == nil or p20.action_params == nil then nil else p20.action_params
	}, t_11)
end

function t_11:encode() --[[ line: 7090 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var505 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var506, var507 = protoModule.writeTag(buff, var505, 1, protoModule.wireTypes.varint)
		var506, var507 = protoModule.writeVarInt(var506, var507, t.ActionType.toNumber(self.action_type))
		buff = var506
		var505 = var507
	end
	if self.action_params ~= nil then
		local var508 = self.action_params:encode()
		local var509, var510 = protoModule.writeTag(buff, var505, 2, protoModule.wireTypes.lengthDelimited)
		var509, var510 = protoModule.writeBuffer(var509, var510, var508, buffer.len(var508))
		buff = var509
		var505 = var510
	end
	local buff_1 = buffer.create(var505)
	buffer.copy(buff_1, 0, buff, 0, var505)
	
	return buff_1
end

function t_11.decode(p21) --[[ line: 7116 ]]
	-- upvalues: t_11 (ref), protoModule (ref), t (ref)
	local var512 = t_11.new()
	local var513 = 0
	while var513 < buffer.len(p21) do
		local _ = nil
		local var514 = nil
		local var515, var516, var517 = protoModule.readTag(p21, var513)
		local var518 = var515
		var514 = var516
		var513 = var517
		
		if var514 == protoModule.wireTypes.varint then
			if var518 == 1 then
				local _ = nil
				local var519, var520 = protoModule.readVarIntI32(p21, var513)
				local var521 = var519
				var513 = var520
				var512.action_type = t.ActionType.fromNumber(var521) or var521
			else
				local _ = nil
				local var522, var523 = protoModule.readVarInt(p21, var513)
				local _ = var522
				var513 = var523
			end
		end
		if var514 == protoModule.wireTypes.lengthDelimited then
			if var518 == 2 then
				local _ = nil
				local var524, var525 = protoModule.readBuffer(p21, var513)
				var513 = var525
				var512.action_params = t.OpenMarketplaceTryOnAction_Params.decode(var524)
			else
				local _ = nil
				local var526, var527 = protoModule.readVarInt(p21, var513)
				var513 = var527 + var526
			end
		elseif var514 == protoModule.wireTypes.i32 then
			local _ = nil
			local var528, var529 = protoModule.readFixed32(p21, var513)
			local _ = var528
			var513 = var529
		elseif var514 == protoModule.wireTypes.i64 then
			local _ = nil
			local var530, var531 = protoModule.readFixed64(p21, var513)
			local _ = var530
			var513 = var531
		else
			error("Unsupported wire type: " .. var514)
		end
	end
	return var512
end

function t_11:jsonEncode() --[[ line: 7164 ]]
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

function t_11:jsonDecode() --[[ line: 7186 ]]
	-- upvalues: t_11 (ref), t (ref)
	local var533 = t_11.new()
	
	if self.action_type ~= nil then
		var533.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var533.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var533.action_params = t.OpenMarketplaceTryOnAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var533.action_params = t.OpenMarketplaceTryOnAction_Params.jsonDecode(self.actionParams)
	end
	return var533
end

t_11.descriptor = {
	name = "OpenMarketplaceTryOnAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceTryOnAction"
}
t.OpenMarketplaceTryOnAction = t_11
typeRegistryModule.default:register(t.OpenMarketplaceTryOnAction)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p22) --[[ line: 7226 ]]
	-- upvalues: t_12 (ref)
	return setmetatable({
		item_id = if p22 == nil or p22.item_id == nil then nil else p22.item_id,
		item_type = if p22 == nil or p22.item_type == nil then nil else p22.item_type,
		item_sub_type_name = if p22 == nil or p22.item_sub_type_name == nil then nil else p22.item_sub_type_name
	}, t_12)
end

function t_12:encode() --[[ line: 7236 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var535 = 0
	
	if self.item_id ~= nil then
		local var536 = self.item_id:encode()
		local var537, var538 = protoModule.writeTag(buff, var535, 1, protoModule.wireTypes.lengthDelimited)
		var537, var538 = protoModule.writeBuffer(var537, var538, var536, buffer.len(var536))
		buff = var537
		var535 = var538
	end
	if self.item_type ~= nil then
		local var539 = self.item_type:encode()
		local var540, var541 = protoModule.writeTag(buff, var535, 2, protoModule.wireTypes.lengthDelimited)
		var540, var541 = protoModule.writeBuffer(var540, var541, var539, buffer.len(var539))
		buff = var540
		var535 = var541
	end
	if self.item_sub_type_name ~= nil then
		local var542 = self.item_sub_type_name:encode()
		local var543, var544 = protoModule.writeTag(buff, var535, 3, protoModule.wireTypes.lengthDelimited)
		var543, var544 = protoModule.writeBuffer(var543, var544, var542, buffer.len(var542))
		buff = var543
		var535 = var544
	end
	local buff_1 = buffer.create(var535)
	buffer.copy(buff_1, 0, buff, 0, var535)
	
	return buff_1
end

function t_12.decode(p23) --[[ line: 7263 ]]
	-- upvalues: t_12 (ref), protoModule (ref), propTypesModule (ref)
	local var546 = t_12.new()
	local var547 = 0
	while var547 < buffer.len(p23) do
		local _ = nil
		local var548 = nil
		local var549, var550, var551 = protoModule.readTag(p23, var547)
		local var552 = var549
		var548 = var550
		var547 = var551
		
		if var548 == protoModule.wireTypes.varint then
			local _ = nil
			local var553, var554 = protoModule.readVarInt(p23, var547)
			local _ = var553
			var547 = var554
			continue
		end
		if var548 == protoModule.wireTypes.lengthDelimited then
			if var552 == 1 then
				local _ = nil
				local var555, var556 = protoModule.readBuffer(p23, var547)
				var547 = var556
				var546.item_id = propTypesModule.StringProp.decode(var555)
			elseif var552 == 2 then
				local _ = nil
				local var557, var558 = protoModule.readBuffer(p23, var547)
				var547 = var558
				var546.item_type = propTypesModule.StringProp.decode(var557)
			elseif var552 == 3 then
				local _ = nil
				local var559, var560 = protoModule.readBuffer(p23, var547)
				var547 = var560
				var546.item_sub_type_name = propTypesModule.StringProp.decode(var559)
			else
				local _ = nil
				local var561, var562 = protoModule.readVarInt(p23, var547)
				var547 = var562 + var561
			end
		elseif var548 == protoModule.wireTypes.i32 then
			local _ = nil
			local var563, var564 = protoModule.readFixed32(p23, var547)
			local _ = var563
			var547 = var564
		elseif var548 == protoModule.wireTypes.i64 then
			local _ = nil
			local var565, var566 = protoModule.readFixed64(p23, var547)
			local _ = var565
			var547 = var566
		else
			error("Unsupported wire type: " .. var548)
		end
	end
	return var546
end

function t_12:jsonEncode() --[[ line: 7316 ]]
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

function t_12:jsonDecode() --[[ line: 7334 ]]
	-- upvalues: t_12 (ref), propTypesModule (ref)
	local var568 = t_12.new()
	
	if self.item_id ~= nil then
		var568.item_id = propTypesModule.StringProp.jsonDecode(self.item_id)
	end
	if self.itemId ~= nil then
		var568.item_id = propTypesModule.StringProp.jsonDecode(self.itemId)
	end
	if self.item_type ~= nil then
		var568.item_type = propTypesModule.StringProp.jsonDecode(self.item_type)
	end
	if self.itemType ~= nil then
		var568.item_type = propTypesModule.StringProp.jsonDecode(self.itemType)
	end
	if self.item_sub_type_name ~= nil then
		var568.item_sub_type_name = propTypesModule.StringProp.jsonDecode(self.item_sub_type_name)
	end
	if self.itemSubTypeName ~= nil then
		var568.item_sub_type_name = propTypesModule.StringProp.jsonDecode(self.itemSubTypeName)
	end
	return var568
end

t_12.descriptor = {
	name = "OpenMarketplaceTryOnAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceTryOnAction_Params = t_12
typeRegistryModule.default:register(t.OpenMarketplaceTryOnAction_Params)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p24) --[[ line: 7382 ]]
	-- upvalues: t (ref), t_13 (ref)
	return setmetatable({
		action_type = if p24 == nil or p24.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p24.action_type,
		action_params = if p24 == nil or p24.action_params == nil then nil else p24.action_params
	}, t_13)
end

function t_13:encode() --[[ line: 7391 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var570 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var571, var572 = protoModule.writeTag(buff, var570, 1, protoModule.wireTypes.varint)
		var571, var572 = protoModule.writeVarInt(var571, var572, t.ActionType.toNumber(self.action_type))
		buff = var571
		var570 = var572
	end
	if self.action_params ~= nil then
		local var573 = self.action_params:encode()
		local var574, var575 = protoModule.writeTag(buff, var570, 2, protoModule.wireTypes.lengthDelimited)
		var574, var575 = protoModule.writeBuffer(var574, var575, var573, buffer.len(var573))
		buff = var574
		var570 = var575
	end
	local buff_1 = buffer.create(var570)
	buffer.copy(buff_1, 0, buff, 0, var570)
	
	return buff_1
end

function t_13.decode(p25) --[[ line: 7417 ]]
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var577 = t_13.new()
	local var578 = 0
	while var578 < buffer.len(p25) do
		local _ = nil
		local var579 = nil
		local var580, var581, var582 = protoModule.readTag(p25, var578)
		local var583 = var580
		var579 = var581
		var578 = var582
		
		if var579 == protoModule.wireTypes.varint then
			if var583 == 1 then
				local _ = nil
				local var584, var585 = protoModule.readVarIntI32(p25, var578)
				local var586 = var584
				var578 = var585
				var577.action_type = t.ActionType.fromNumber(var586) or var586
			else
				local _ = nil
				local var587, var588 = protoModule.readVarInt(p25, var578)
				local _ = var587
				var578 = var588
			end
		end
		if var579 == protoModule.wireTypes.lengthDelimited then
			if var583 == 2 then
				local _ = nil
				local var589, var590 = protoModule.readBuffer(p25, var578)
				var578 = var590
				var577.action_params = t.OpenSeeAllAction_Params.decode(var589)
			else
				local _ = nil
				local var591, var592 = protoModule.readVarInt(p25, var578)
				var578 = var592 + var591
			end
		elseif var579 == protoModule.wireTypes.i32 then
			local _ = nil
			local var593, var594 = protoModule.readFixed32(p25, var578)
			local _ = var593
			var578 = var594
		elseif var579 == protoModule.wireTypes.i64 then
			local _ = nil
			local var595, var596 = protoModule.readFixed64(p25, var578)
			local _ = var595
			var578 = var596
		else
			error("Unsupported wire type: " .. var579)
		end
	end
	return var577
end

function t_13:jsonEncode() --[[ line: 7465 ]]
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

function t_13:jsonDecode() --[[ line: 7487 ]]
	-- upvalues: t_13 (ref), t (ref)
	local var598 = t_13.new()
	
	if self.action_type ~= nil then
		var598.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var598.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var598.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var598.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var598
end

t_13.descriptor = {
	name = "OpenSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSeeAllAction"
}
t.OpenSeeAllAction = t_13
typeRegistryModule.default:register(t.OpenSeeAllAction)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p26) --[[ line: 7527 ]]
	-- upvalues: t_14 (ref)
	return setmetatable({
		collection_id = if p26 == nil or p26.collection_id == nil then nil else p26.collection_id,
		game_set_target_id = if p26 == nil or p26.game_set_target_id == nil then nil else p26.game_set_target_id,
		collection_position = if p26 == nil or p26.collection_position == nil then nil else p26.collection_position
	}, t_14)
end

function t_14:encode() --[[ line: 7537 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var600 = 0
	
	if self.collection_id ~= nil then
		local var601 = self.collection_id:encode()
		local var602, var603 = protoModule.writeTag(buff, var600, 1, protoModule.wireTypes.lengthDelimited)
		var602, var603 = protoModule.writeBuffer(var602, var603, var601, buffer.len(var601))
		buff = var602
		var600 = var603
	end
	if self.game_set_target_id ~= nil then
		local var604 = self.game_set_target_id:encode()
		local var605, var606 = protoModule.writeTag(buff, var600, 2, protoModule.wireTypes.lengthDelimited)
		var605, var606 = protoModule.writeBuffer(var605, var606, var604, buffer.len(var604))
		buff = var605
		var600 = var606
	end
	if self.collection_position ~= nil then
		local var607 = self.collection_position:encode()
		local var608, var609 = protoModule.writeTag(buff, var600, 3, protoModule.wireTypes.lengthDelimited)
		var608, var609 = protoModule.writeBuffer(var608, var609, var607, buffer.len(var607))
		buff = var608
		var600 = var609
	end
	local buff_1 = buffer.create(var600)
	buffer.copy(buff_1, 0, buff, 0, var600)
	
	return buff_1
end

function t_14.decode(p27) --[[ line: 7564 ]]
	-- upvalues: t_14 (ref), protoModule (ref), propTypesModule (ref)
	local var611 = t_14.new()
	local var612 = 0
	while var612 < buffer.len(p27) do
		local _ = nil
		local var613 = nil
		local var614, var615, var616 = protoModule.readTag(p27, var612)
		local var617 = var614
		var613 = var615
		var612 = var616
		
		if var613 == protoModule.wireTypes.varint then
			local _ = nil
			local var618, var619 = protoModule.readVarInt(p27, var612)
			local _ = var618
			var612 = var619
			continue
		end
		if var613 == protoModule.wireTypes.lengthDelimited then
			if var617 == 1 then
				local _ = nil
				local var620, var621 = protoModule.readBuffer(p27, var612)
				var612 = var621
				var611.collection_id = propTypesModule.StringProp.decode(var620)
			elseif var617 == 2 then
				local _ = nil
				local var622, var623 = protoModule.readBuffer(p27, var612)
				var612 = var623
				var611.game_set_target_id = propTypesModule.StringProp.decode(var622)
			elseif var617 == 3 then
				local _ = nil
				local var624, var625 = protoModule.readBuffer(p27, var612)
				var612 = var625
				var611.collection_position = propTypesModule.StringProp.decode(var624)
			else
				local _ = nil
				local var626, var627 = protoModule.readVarInt(p27, var612)
				var612 = var627 + var626
			end
		elseif var613 == protoModule.wireTypes.i32 then
			local _ = nil
			local var628, var629 = protoModule.readFixed32(p27, var612)
			local _ = var628
			var612 = var629
		elseif var613 == protoModule.wireTypes.i64 then
			local _ = nil
			local var630, var631 = protoModule.readFixed64(p27, var612)
			local _ = var630
			var612 = var631
		else
			error("Unsupported wire type: " .. var613)
		end
	end
	return var611
end

function t_14:jsonEncode() --[[ line: 7618 ]]
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

function t_14:jsonDecode() --[[ line: 7636 ]]
	-- upvalues: t_14 (ref), propTypesModule (ref)
	local var633 = t_14.new()
	
	if self.collection_id ~= nil then
		var633.collection_id = propTypesModule.StringProp.jsonDecode(self.collection_id)
	end
	if self.collectionId ~= nil then
		var633.collection_id = propTypesModule.StringProp.jsonDecode(self.collectionId)
	end
	if self.game_set_target_id ~= nil then
		var633.game_set_target_id = propTypesModule.StringProp.jsonDecode(self.game_set_target_id)
	end
	if self.gameSetTargetId ~= nil then
		var633.game_set_target_id = propTypesModule.StringProp.jsonDecode(self.gameSetTargetId)
	end
	if self.collection_position ~= nil then
		var633.collection_position = propTypesModule.StringProp.jsonDecode(self.collection_position)
	end
	if self.collectionPosition ~= nil then
		var633.collection_position = propTypesModule.StringProp.jsonDecode(self.collectionPosition)
	end
	return var633
end

t_14.descriptor = {
	name = "OpenSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSeeAllAction_Params = t_14
typeRegistryModule.default:register(t.OpenSeeAllAction_Params)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p28) --[[ line: 7686 ]]
	-- upvalues: t (ref), t_15 (ref)
	return setmetatable({
		action_type = if p28 == nil or p28.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p28.action_type,
		action_params = if p28 == nil or p28.action_params == nil then nil else p28.action_params
	}, t_15)
end

function t_15:encode() --[[ line: 7697 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var635 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var636, var637 = protoModule.writeTag(buff, var635, 1, protoModule.wireTypes.varint)
		var636, var637 = protoModule.writeVarInt(var636, var637, t.ActionType.toNumber(self.action_type))
		buff = var636
		var635 = var637
	end
	if self.action_params ~= nil then
		local var638 = self.action_params:encode()
		local var639, var640 = protoModule.writeTag(buff, var635, 2, protoModule.wireTypes.lengthDelimited)
		var639, var640 = protoModule.writeBuffer(var639, var640, var638, buffer.len(var638))
		buff = var639
		var635 = var640
	end
	local buff_1 = buffer.create(var635)
	buffer.copy(buff_1, 0, buff, 0, var635)
	
	return buff_1
end

function t_15.decode(p29) --[[ line: 7723 ]]
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var642 = t_15.new()
	local var643 = 0
	while var643 < buffer.len(p29) do
		local _ = nil
		local var644 = nil
		local var645, var646, var647 = protoModule.readTag(p29, var643)
		local var648 = var645
		var644 = var646
		var643 = var647
		
		if var644 == protoModule.wireTypes.varint then
			if var648 == 1 then
				local _ = nil
				local var649, var650 = protoModule.readVarIntI32(p29, var643)
				local var651 = var649
				var643 = var650
				var642.action_type = t.ActionType.fromNumber(var651) or var651
			else
				local _ = nil
				local var652, var653 = protoModule.readVarInt(p29, var643)
				local _ = var652
				var643 = var653
			end
		end
		if var644 == protoModule.wireTypes.lengthDelimited then
			if var648 == 2 then
				local _ = nil
				local var654, var655 = protoModule.readBuffer(p29, var643)
				var643 = var655
				var642.action_params = t.OpenSponsoredTooltipAction_Params.decode(var654)
			else
				local _ = nil
				local var656, var657 = protoModule.readVarInt(p29, var643)
				var643 = var657 + var656
			end
		elseif var644 == protoModule.wireTypes.i32 then
			local _ = nil
			local var658, var659 = protoModule.readFixed32(p29, var643)
			local _ = var658
			var643 = var659
		elseif var644 == protoModule.wireTypes.i64 then
			local _ = nil
			local var660, var661 = protoModule.readFixed64(p29, var643)
			local _ = var660
			var643 = var661
		else
			error("Unsupported wire type: " .. var644)
		end
	end
	return var642
end

function t_15:jsonEncode() --[[ line: 7771 ]]
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

function t_15:jsonDecode() --[[ line: 7793 ]]
	-- upvalues: t_15 (ref), t (ref)
	local var663 = t_15.new()
	
	if self.action_type ~= nil then
		var663.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var663.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var663.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var663.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return var663
end

t_15.descriptor = {
	name = "OpenSponsoredTooltipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSponsoredTooltipAction"
}
t.OpenSponsoredTooltipAction = t_15
typeRegistryModule.default:register(t.OpenSponsoredTooltipAction)
local t_16 = {}
t_16.__index = t_16

function t_16.new(_) --[[ line: 7833 ]]
	-- upvalues: t_16 (ref)
	return setmetatable({}, t_16)
end

function t_16.encode(_) --[[ line: 7839 ]]
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_16.decode(p30) --[[ line: 7848 ]]
	-- upvalues: t_16 (ref), protoModule (ref)
	local var665 = t_16.new()
	local var666 = 0
	while var666 < buffer.len(p30) do
		local var667 = nil
		local _ = nil
		local var668, var669, var670 = protoModule.readTag(p30, var666)
		var667 = var668
		local var671 = var669
		var666 = var670
		
		if var671 == protoModule.wireTypes.varint then
			local _ = nil
			local var672, var673 = protoModule.readVarInt(p30, var666)
			local _ = var672
			var666 = var673
		elseif var671 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var674, var675 = protoModule.readVarInt(p30, var666)
			var666 = var675 + var674
		elseif var671 == protoModule.wireTypes.i32 then
			local _ = nil
			local var676, var677 = protoModule.readFixed32(p30, var666)
			local _ = var676
			var666 = var677
		elseif var671 == protoModule.wireTypes.i64 then
			local _ = nil
			local var678, var679 = protoModule.readFixed64(p30, var666)
			local _ = var678
			var666 = var679
		else
			error("Unsupported wire type: " .. var671)
		end
	end
	return var665
end

function t_16.jsonEncode(_) --[[ line: 7886 ]]
	return {}
end

function t_16.jsonDecode(_) --[[ line: 7892 ]]
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

function t_17.new(p31) --[[ line: 7914 ]]
	-- upvalues: t (ref), t_17 (ref)
	return setmetatable({
		action_type = if p31 == nil or p31.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p31.action_type,
		action_params = if p31 == nil or p31.action_params == nil then nil else p31.action_params
	}, t_17)
end

function t_17:encode() --[[ line: 7923 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var681 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var682, var683 = protoModule.writeTag(buff, var681, 1, protoModule.wireTypes.varint)
		var682, var683 = protoModule.writeVarInt(var682, var683, t.ActionType.toNumber(self.action_type))
		buff = var682
		var681 = var683
	end
	if self.action_params ~= nil then
		local var684 = self.action_params:encode()
		local var685, var686 = protoModule.writeTag(buff, var681, 2, protoModule.wireTypes.lengthDelimited)
		var685, var686 = protoModule.writeBuffer(var685, var686, var684, buffer.len(var684))
		buff = var685
		var681 = var686
	end
	local buff_1 = buffer.create(var681)
	buffer.copy(buff_1, 0, buff, 0, var681)
	
	return buff_1
end

function t_17.decode(p32) --[[ line: 7949 ]]
	-- upvalues: t_17 (ref), protoModule (ref), t (ref)
	local var688 = t_17.new()
	local var689 = 0
	while var689 < buffer.len(p32) do
		local _ = nil
		local var690 = nil
		local var691, var692, var693 = protoModule.readTag(p32, var689)
		local var694 = var691
		var690 = var692
		var689 = var693
		
		if var690 == protoModule.wireTypes.varint then
			if var694 == 1 then
				local _ = nil
				local var695, var696 = protoModule.readVarIntI32(p32, var689)
				local var697 = var695
				var689 = var696
				var688.action_type = t.ActionType.fromNumber(var697) or var697
			else
				local _ = nil
				local var698, var699 = protoModule.readVarInt(p32, var689)
				local _ = var698
				var689 = var699
			end
		end
		if var690 == protoModule.wireTypes.lengthDelimited then
			if var694 == 2 then
				local _ = nil
				local var700, var701 = protoModule.readBuffer(p32, var689)
				var689 = var701
				var688.action_params = t.PlayButtonClickAction_Params.decode(var700)
			else
				local _ = nil
				local var702, var703 = protoModule.readVarInt(p32, var689)
				var689 = var703 + var702
			end
		elseif var690 == protoModule.wireTypes.i32 then
			local _ = nil
			local var704, var705 = protoModule.readFixed32(p32, var689)
			local _ = var704
			var689 = var705
		elseif var690 == protoModule.wireTypes.i64 then
			local _ = nil
			local var706, var707 = protoModule.readFixed64(p32, var689)
			local _ = var706
			var689 = var707
		else
			error("Unsupported wire type: " .. var690)
		end
	end
	return var688
end

function t_17:jsonEncode() --[[ line: 7997 ]]
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

function t_17:jsonDecode() --[[ line: 8019 ]]
	-- upvalues: t_17 (ref), t (ref)
	local var709 = t_17.new()
	
	if self.action_type ~= nil then
		var709.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var709.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var709.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var709.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.actionParams)
	end
	return var709
end

t_17.descriptor = {
	name = "PlayButtonClickAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.PlayButtonClickAction"
}
t.PlayButtonClickAction = t_17
typeRegistryModule.default:register(t.PlayButtonClickAction)
local t_18 = {}
t_18.__index = t_18

function t_18.new(_) --[[ line: 8059 ]]
	-- upvalues: t_18 (ref)
	return setmetatable({}, t_18)
end

function t_18.encode(_) --[[ line: 8065 ]]
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_18.decode(p33) --[[ line: 8074 ]]
	-- upvalues: t_18 (ref), protoModule (ref)
	local var711 = t_18.new()
	local var712 = 0
	while var712 < buffer.len(p33) do
		local var713 = nil
		local _ = nil
		local var714, var715, var716 = protoModule.readTag(p33, var712)
		var713 = var714
		local var717 = var715
		var712 = var716
		
		if var717 == protoModule.wireTypes.varint then
			local _ = nil
			local var718, var719 = protoModule.readVarInt(p33, var712)
			local _ = var718
			var712 = var719
		elseif var717 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var720, var721 = protoModule.readVarInt(p33, var712)
			var712 = var721 + var720
		elseif var717 == protoModule.wireTypes.i32 then
			local _ = nil
			local var722, var723 = protoModule.readFixed32(p33, var712)
			local _ = var722
			var712 = var723
		elseif var717 == protoModule.wireTypes.i64 then
			local _ = nil
			local var724, var725 = protoModule.readFixed64(p33, var712)
			local _ = var724
			var712 = var725
		else
			error("Unsupported wire type: " .. var717)
		end
	end
	return var711
end

function t_18.jsonEncode(_) --[[ line: 8112 ]]
	return {}
end

function t_18.jsonDecode(_) --[[ line: 8118 ]]
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

function t_19.new(p34) --[[ line: 8138 ]]
	-- upvalues: t (ref), t_19 (ref)
	return setmetatable({
		action_type = if p34 == nil or p34.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p34.action_type,
		action_params = if p34 == nil or p34.action_params == nil then nil else p34.action_params
	}, t_19)
end

function t_19:encode() --[[ line: 8147 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var727 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var728, var729 = protoModule.writeTag(buff, var727, 1, protoModule.wireTypes.varint)
		var728, var729 = protoModule.writeVarInt(var728, var729, t.ActionType.toNumber(self.action_type))
		buff = var728
		var727 = var729
	end
	if self.action_params ~= nil then
		local var730 = self.action_params:encode()
		local var731, var732 = protoModule.writeTag(buff, var727, 2, protoModule.wireTypes.lengthDelimited)
		var731, var732 = protoModule.writeBuffer(var731, var732, var730, buffer.len(var730))
		buff = var731
		var727 = var732
	end
	local buff_1 = buffer.create(var727)
	buffer.copy(buff_1, 0, buff, 0, var727)
	
	return buff_1
end

function t_19.decode(p35) --[[ line: 8173 ]]
	-- upvalues: t_19 (ref), protoModule (ref), t (ref)
	local var734 = t_19.new()
	local var735 = 0
	while var735 < buffer.len(p35) do
		local _ = nil
		local var736 = nil
		local var737, var738, var739 = protoModule.readTag(p35, var735)
		local var740 = var737
		var736 = var738
		var735 = var739
		
		if var736 == protoModule.wireTypes.varint then
			if var740 == 1 then
				local _ = nil
				local var741, var742 = protoModule.readVarIntI32(p35, var735)
				local var743 = var741
				var735 = var742
				var734.action_type = t.ActionType.fromNumber(var743) or var743
			else
				local _ = nil
				local var744, var745 = protoModule.readVarInt(p35, var735)
				local _ = var744
				var735 = var745
			end
		end
		if var736 == protoModule.wireTypes.lengthDelimited then
			if var740 == 2 then
				local _ = nil
				local var746, var747 = protoModule.readBuffer(p35, var735)
				var735 = var747
				var734.action_params = t.UpdateUserSettingsAction_Params.decode(var746)
			else
				local _ = nil
				local var748, var749 = protoModule.readVarInt(p35, var735)
				var735 = var749 + var748
			end
		elseif var736 == protoModule.wireTypes.i32 then
			local _ = nil
			local var750, var751 = protoModule.readFixed32(p35, var735)
			local _ = var750
			var735 = var751
		elseif var736 == protoModule.wireTypes.i64 then
			local _ = nil
			local var752, var753 = protoModule.readFixed64(p35, var735)
			local _ = var752
			var735 = var753
		else
			error("Unsupported wire type: " .. var736)
		end
	end
	return var734
end

function t_19:jsonEncode() --[[ line: 8221 ]]
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

function t_19:jsonDecode() --[[ line: 8243 ]]
	-- upvalues: t_19 (ref), t (ref)
	local var755 = t_19.new()
	
	if self.action_type ~= nil then
		var755.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var755.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var755.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var755.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.actionParams)
	end
	return var755
end

t_19.descriptor = {
	name = "UpdateUserSettingsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.UpdateUserSettingsAction"
}
t.UpdateUserSettingsAction = t_19
typeRegistryModule.default:register(t.UpdateUserSettingsAction)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p36) --[[ line: 8283 ]]
	-- upvalues: t_20 (ref)
	return setmetatable({
		settings = if p36 == nil or p36.settings == nil then nil else p36.settings,
		audit_data = if p36 == nil or p36.audit_data == nil then nil else p36.audit_data
	}, t_20)
end

function t_20:encode() --[[ line: 8292 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var757 = 0
	
	if self.settings ~= nil then
		local var758 = self.settings:encode()
		local var759, var760 = protoModule.writeTag(buff, var757, 1, protoModule.wireTypes.lengthDelimited)
		var759, var760 = protoModule.writeBuffer(var759, var760, var758, buffer.len(var758))
		buff = var759
		var757 = var760
	end
	if self.audit_data ~= nil then
		local var761 = self.audit_data:encode()
		local var762, var763 = protoModule.writeTag(buff, var757, 2, protoModule.wireTypes.lengthDelimited)
		var762, var763 = protoModule.writeBuffer(var762, var763, var761, buffer.len(var761))
		buff = var762
		var757 = var763
	end
	local buff_1 = buffer.create(var757)
	buffer.copy(buff_1, 0, buff, 0, var757)
	
	return buff_1
end

function t_20.decode(p37) --[[ line: 8313 ]]
	-- upvalues: t_20 (ref), protoModule (ref), propTypesModule (ref)
	local var765 = t_20.new()
	local var766 = 0
	while var766 < buffer.len(p37) do
		local _ = nil
		local var767 = nil
		local var768, var769, var770 = protoModule.readTag(p37, var766)
		local var771 = var768
		var767 = var769
		var766 = var770
		
		if var767 == protoModule.wireTypes.varint then
			local _ = nil
			local var772, var773 = protoModule.readVarInt(p37, var766)
			local _ = var772
			var766 = var773
			continue
		end
		if var767 == protoModule.wireTypes.lengthDelimited then
			if var771 == 1 then
				local _ = nil
				local var774, var775 = protoModule.readBuffer(p37, var766)
				var766 = var775
				var765.settings = propTypesModule.StructProp.decode(var774)
			elseif var771 == 2 then
				local _ = nil
				local var776, var777 = protoModule.readBuffer(p37, var766)
				var766 = var777
				var765.audit_data = propTypesModule.StringProp.decode(var776)
			else
				local _ = nil
				local var778, var779 = protoModule.readVarInt(p37, var766)
				var766 = var779 + var778
			end
		elseif var767 == protoModule.wireTypes.i32 then
			local _ = nil
			local var780, var781 = protoModule.readFixed32(p37, var766)
			local _ = var780
			var766 = var781
		elseif var767 == protoModule.wireTypes.i64 then
			local _ = nil
			local var782, var783 = protoModule.readFixed64(p37, var766)
			local _ = var782
			var766 = var783
		else
			error("Unsupported wire type: " .. var767)
		end
	end
	return var765
end

function t_20:jsonEncode() --[[ line: 8361 ]]
	local t = {}
	
	if self.settings ~= nil then
		t.settings = self.settings:jsonEncode()
	end
	if self.audit_data ~= nil then
		t.auditData = self.audit_data:jsonEncode()
	end
	return t
end

function t_20:jsonDecode() --[[ line: 8375 ]]
	-- upvalues: t_20 (ref), propTypesModule (ref)
	local var785 = t_20.new()
	
	if self.settings ~= nil then
		var785.settings = propTypesModule.StructProp.jsonDecode(self.settings)
	end
	if self.audit_data ~= nil then
		var785.audit_data = propTypesModule.StringProp.jsonDecode(self.audit_data)
	end
	if self.auditData ~= nil then
		var785.audit_data = propTypesModule.StringProp.jsonDecode(self.auditData)
	end
	return var785
end

t_20.descriptor = {
	name = "UpdateUserSettingsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.UpdateUserSettingsAction_Params = t_20
typeRegistryModule.default:register(t.UpdateUserSettingsAction_Params)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p38) --[[ line: 8407 ]]
	-- upvalues: t (ref), t_21 (ref)
	return setmetatable({
		action_type = if p38 == nil or p38.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p38.action_type,
		action_params = if p38 == nil or p38.action_params == nil then nil else p38.action_params
	}, t_21)
end

function t_21:encode() --[[ line: 8416 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var787 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var788, var789 = protoModule.writeTag(buff, var787, 1, protoModule.wireTypes.varint)
		var788, var789 = protoModule.writeVarInt(var788, var789, t.ActionType.toNumber(self.action_type))
		buff = var788
		var787 = var789
	end
	if self.action_params ~= nil then
		local var790 = self.action_params:encode()
		local var791, var792 = protoModule.writeTag(buff, var787, 2, protoModule.wireTypes.lengthDelimited)
		var791, var792 = protoModule.writeBuffer(var791, var792, var790, buffer.len(var790))
		buff = var791
		var787 = var792
	end
	local buff_1 = buffer.create(var787)
	buffer.copy(buff_1, 0, buff, 0, var787)
	
	return buff_1
end

function t_21.decode(p39) --[[ line: 8442 ]]
	-- upvalues: t_21 (ref), protoModule (ref), t (ref)
	local var794 = t_21.new()
	local var795 = 0
	while var795 < buffer.len(p39) do
		local _ = nil
		local var796 = nil
		local var797, var798, var799 = protoModule.readTag(p39, var795)
		local var800 = var797
		var796 = var798
		var795 = var799
		
		if var796 == protoModule.wireTypes.varint then
			if var800 == 1 then
				local _ = nil
				local var801, var802 = protoModule.readVarIntI32(p39, var795)
				local var803 = var801
				var795 = var802
				var794.action_type = t.ActionType.fromNumber(var803) or var803
			else
				local _ = nil
				local var804, var805 = protoModule.readVarInt(p39, var795)
				local _ = var804
				var795 = var805
			end
		end
		if var796 == protoModule.wireTypes.lengthDelimited then
			if var800 == 2 then
				local _ = nil
				local var806, var807 = protoModule.readBuffer(p39, var795)
				var795 = var807
				var794.action_params = t.OpenTooltipAction_Params.decode(var806)
			else
				local _ = nil
				local var808, var809 = protoModule.readVarInt(p39, var795)
				var795 = var809 + var808
			end
		elseif var796 == protoModule.wireTypes.i32 then
			local _ = nil
			local var810, var811 = protoModule.readFixed32(p39, var795)
			local _ = var810
			var795 = var811
		elseif var796 == protoModule.wireTypes.i64 then
			local _ = nil
			local var812, var813 = protoModule.readFixed64(p39, var795)
			local _ = var812
			var795 = var813
		else
			error("Unsupported wire type: " .. var796)
		end
	end
	return var794
end

function t_21:jsonEncode() --[[ line: 8490 ]]
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

function t_21:jsonDecode() --[[ line: 8512 ]]
	-- upvalues: t_21 (ref), t (ref)
	local var815 = t_21.new()
	
	if self.action_type ~= nil then
		var815.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var815.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var815.action_params = t.OpenTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var815.action_params = t.OpenTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return var815
end

t_21.descriptor = {
	name = "OpenTooltipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenTooltipAction"
}
t.OpenTooltipAction = t_21
typeRegistryModule.default:register(t.OpenTooltipAction)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p40) --[[ line: 8552 ]]
	-- upvalues: t_22 (ref)
	return setmetatable({
		tooltip_title = if p40 == nil or p40.tooltip_title == nil then nil else p40.tooltip_title,
		tooltip_info_text = if p40 == nil or p40.tooltip_info_text == nil then nil else p40.tooltip_info_text
	}, t_22)
end

function t_22:encode() --[[ line: 8559 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var817 = 0
	
	if self.tooltip_title ~= nil then
		local var818 = self.tooltip_title:encode()
		local var819, var820 = protoModule.writeTag(buff, var817, 1, protoModule.wireTypes.lengthDelimited)
		var819, var820 = protoModule.writeBuffer(var819, var820, var818, buffer.len(var818))
		buff = var819
		var817 = var820
	end
	if self.tooltip_info_text ~= nil then
		local var821 = self.tooltip_info_text:encode()
		local var822, var823 = protoModule.writeTag(buff, var817, 2, protoModule.wireTypes.lengthDelimited)
		var822, var823 = protoModule.writeBuffer(var822, var823, var821, buffer.len(var821))
		buff = var822
		var817 = var823
	end
	local buff_1 = buffer.create(var817)
	buffer.copy(buff_1, 0, buff, 0, var817)
	
	return buff_1
end

function t_22.decode(p41) --[[ line: 8580 ]]
	-- upvalues: t_22 (ref), protoModule (ref), propTypesModule (ref)
	local var825 = t_22.new()
	local var826 = 0
	while var826 < buffer.len(p41) do
		local _ = nil
		local var827 = nil
		local var828, var829, var830 = protoModule.readTag(p41, var826)
		local var831 = var828
		var827 = var829
		var826 = var830
		
		if var827 == protoModule.wireTypes.varint then
			local _ = nil
			local var832, var833 = protoModule.readVarInt(p41, var826)
			local _ = var832
			var826 = var833
			continue
		end
		if var827 == protoModule.wireTypes.lengthDelimited then
			if var831 == 1 then
				local _ = nil
				local var834, var835 = protoModule.readBuffer(p41, var826)
				var826 = var835
				var825.tooltip_title = propTypesModule.StringProp.decode(var834)
			elseif var831 == 2 then
				local _ = nil
				local var836, var837 = protoModule.readBuffer(p41, var826)
				var826 = var837
				var825.tooltip_info_text = propTypesModule.StringProp.decode(var836)
			else
				local _ = nil
				local var838, var839 = protoModule.readVarInt(p41, var826)
				var826 = var839 + var838
			end
		elseif var827 == protoModule.wireTypes.i32 then
			local _ = nil
			local var840, var841 = protoModule.readFixed32(p41, var826)
			local _ = var840
			var826 = var841
		elseif var827 == protoModule.wireTypes.i64 then
			local _ = nil
			local var842, var843 = protoModule.readFixed64(p41, var826)
			local _ = var842
			var826 = var843
		else
			error("Unsupported wire type: " .. var827)
		end
	end
	return var825
end

function t_22:jsonEncode() --[[ line: 8628 ]]
	local t = {}
	
	if self.tooltip_title ~= nil then
		t.tooltipTitle = self.tooltip_title:jsonEncode()
	end
	if self.tooltip_info_text ~= nil then
		t.tooltipInfoText = self.tooltip_info_text:jsonEncode()
	end
	return t
end

function t_22:jsonDecode() --[[ line: 8642 ]]
	-- upvalues: t_22 (ref), propTypesModule (ref)
	local var845 = t_22.new()
	
	if self.tooltip_title ~= nil then
		var845.tooltip_title = propTypesModule.StringProp.jsonDecode(self.tooltip_title)
	end
	if self.tooltipTitle ~= nil then
		var845.tooltip_title = propTypesModule.StringProp.jsonDecode(self.tooltipTitle)
	end
	if self.tooltip_info_text ~= nil then
		var845.tooltip_info_text = propTypesModule.StringProp.jsonDecode(self.tooltip_info_text)
	end
	if self.tooltipInfoText ~= nil then
		var845.tooltip_info_text = propTypesModule.StringProp.jsonDecode(self.tooltipInfoText)
	end
	return var845
end

t_22.descriptor = {
	name = "OpenTooltipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenTooltipAction_Params = t_22
typeRegistryModule.default:register(t.OpenTooltipAction_Params)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p42) --[[ line: 8682 ]]
	-- upvalues: t (ref), t_23 (ref)
	return setmetatable({
		action_type = if p42 == nil or p42.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p42.action_type,
		action_params = if p42 == nil or p42.action_params == nil then nil else p42.action_params
	}, t_23)
end

function t_23:encode() --[[ line: 8691 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var847 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var848, var849 = protoModule.writeTag(buff, var847, 1, protoModule.wireTypes.varint)
		var848, var849 = protoModule.writeVarInt(var848, var849, t.ActionType.toNumber(self.action_type))
		buff = var848
		var847 = var849
	end
	if self.action_params ~= nil then
		local var850 = self.action_params:encode()
		local var851, var852 = protoModule.writeTag(buff, var847, 2, protoModule.wireTypes.lengthDelimited)
		var851, var852 = protoModule.writeBuffer(var851, var852, var850, buffer.len(var850))
		buff = var851
		var847 = var852
	end
	local buff_1 = buffer.create(var847)
	buffer.copy(buff_1, 0, buff, 0, var847)
	
	return buff_1
end

function t_23.decode(p43) --[[ line: 8717 ]]
	-- upvalues: t_23 (ref), protoModule (ref), t (ref)
	local var854 = t_23.new()
	local var855 = 0
	while var855 < buffer.len(p43) do
		local _ = nil
		local var856 = nil
		local var857, var858, var859 = protoModule.readTag(p43, var855)
		local var860 = var857
		var856 = var858
		var855 = var859
		
		if var856 == protoModule.wireTypes.varint then
			if var860 == 1 then
				local _ = nil
				local var861, var862 = protoModule.readVarIntI32(p43, var855)
				local var863 = var861
				var855 = var862
				var854.action_type = t.ActionType.fromNumber(var863) or var863
			else
				local _ = nil
				local var864, var865 = protoModule.readVarInt(p43, var855)
				local _ = var864
				var855 = var865
			end
		end
		if var856 == protoModule.wireTypes.lengthDelimited then
			if var860 == 2 then
				local _ = nil
				local var866, var867 = protoModule.readBuffer(p43, var855)
				var855 = var867
				var854.action_params = t.OpenBadgeDetailsAction_Params.decode(var866)
			else
				local _ = nil
				local var868, var869 = protoModule.readVarInt(p43, var855)
				var855 = var869 + var868
			end
		elseif var856 == protoModule.wireTypes.i32 then
			local _ = nil
			local var870, var871 = protoModule.readFixed32(p43, var855)
			local _ = var870
			var855 = var871
		elseif var856 == protoModule.wireTypes.i64 then
			local _ = nil
			local var872, var873 = protoModule.readFixed64(p43, var855)
			local _ = var872
			var855 = var873
		else
			error("Unsupported wire type: " .. var856)
		end
	end
	return var854
end

function t_23:jsonEncode() --[[ line: 8765 ]]
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

function t_23:jsonDecode() --[[ line: 8787 ]]
	-- upvalues: t_23 (ref), t (ref)
	local var875 = t_23.new()
	
	if self.action_type ~= nil then
		var875.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var875.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var875.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var875.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var875
end

t_23.descriptor = {
	name = "OpenBadgeDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgeDetailsAction"
}
t.OpenBadgeDetailsAction = t_23
typeRegistryModule.default:register(t.OpenBadgeDetailsAction)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p44) --[[ line: 8827 ]]
	-- upvalues: t_24 (ref)
	return setmetatable({
		badge_id = if p44 == nil or p44.badge_id == nil then nil else p44.badge_id,
		title_text = if p44 == nil or p44.title_text == nil then nil else p44.title_text
	}, t_24)
end

function t_24:encode() --[[ line: 8836 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var877 = 0
	
	if self.badge_id ~= nil then
		local var878 = self.badge_id:encode()
		local var879, var880 = protoModule.writeTag(buff, var877, 1, protoModule.wireTypes.lengthDelimited)
		var879, var880 = protoModule.writeBuffer(var879, var880, var878, buffer.len(var878))
		buff = var879
		var877 = var880
	end
	if self.title_text ~= nil then
		local var881 = self.title_text:encode()
		local var882, var883 = protoModule.writeTag(buff, var877, 2, protoModule.wireTypes.lengthDelimited)
		var882, var883 = protoModule.writeBuffer(var882, var883, var881, buffer.len(var881))
		buff = var882
		var877 = var883
	end
	local buff_1 = buffer.create(var877)
	buffer.copy(buff_1, 0, buff, 0, var877)
	
	return buff_1
end

function t_24.decode(p45) --[[ line: 8857 ]]
	-- upvalues: t_24 (ref), protoModule (ref), propTypesModule (ref)
	local var885 = t_24.new()
	local var886 = 0
	while var886 < buffer.len(p45) do
		local _ = nil
		local var887 = nil
		local var888, var889, var890 = protoModule.readTag(p45, var886)
		local var891 = var888
		var887 = var889
		var886 = var890
		
		if var887 == protoModule.wireTypes.varint then
			local _ = nil
			local var892, var893 = protoModule.readVarInt(p45, var886)
			local _ = var892
			var886 = var893
			continue
		end
		if var887 == protoModule.wireTypes.lengthDelimited then
			if var891 == 1 then
				local _ = nil
				local var894, var895 = protoModule.readBuffer(p45, var886)
				var886 = var895
				var885.badge_id = propTypesModule.StringProp.decode(var894)
			elseif var891 == 2 then
				local _ = nil
				local var896, var897 = protoModule.readBuffer(p45, var886)
				var886 = var897
				var885.title_text = propTypesModule.StringProp.decode(var896)
			else
				local _ = nil
				local var898, var899 = protoModule.readVarInt(p45, var886)
				var886 = var899 + var898
			end
		elseif var887 == protoModule.wireTypes.i32 then
			local _ = nil
			local var900, var901 = protoModule.readFixed32(p45, var886)
			local _ = var900
			var886 = var901
		elseif var887 == protoModule.wireTypes.i64 then
			local _ = nil
			local var902, var903 = protoModule.readFixed64(p45, var886)
			local _ = var902
			var886 = var903
		else
			error("Unsupported wire type: " .. var887)
		end
	end
	return var885
end

function t_24:jsonEncode() --[[ line: 8905 ]]
	local t = {}
	
	if self.badge_id ~= nil then
		t.badgeId = self.badge_id:jsonEncode()
	end
	if self.title_text ~= nil then
		t.titleText = self.title_text:jsonEncode()
	end
	return t
end

function t_24:jsonDecode() --[[ line: 8919 ]]
	-- upvalues: t_24 (ref), propTypesModule (ref)
	local var905 = t_24.new()
	
	if self.badge_id ~= nil then
		var905.badge_id = propTypesModule.StringProp.jsonDecode(self.badge_id)
	end
	if self.badgeId ~= nil then
		var905.badge_id = propTypesModule.StringProp.jsonDecode(self.badgeId)
	end
	if self.title_text ~= nil then
		var905.title_text = propTypesModule.StringProp.jsonDecode(self.title_text)
	end
	if self.titleText ~= nil then
		var905.title_text = propTypesModule.StringProp.jsonDecode(self.titleText)
	end
	return var905
end

t_24.descriptor = {
	name = "OpenBadgeDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenBadgeDetailsAction_Params = t_24
typeRegistryModule.default:register(t.OpenBadgeDetailsAction_Params)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p46) --[[ line: 8955 ]]
	-- upvalues: t (ref), t_25 (ref)
	return setmetatable({
		action_type = if p46 == nil or p46.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p46.action_type,
		action_params = if p46 == nil or p46.action_params == nil then nil else p46.action_params
	}, t_25)
end

function t_25:encode() --[[ line: 8964 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var907 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var908, var909 = protoModule.writeTag(buff, var907, 1, protoModule.wireTypes.varint)
		var908, var909 = protoModule.writeVarInt(var908, var909, t.ActionType.toNumber(self.action_type))
		buff = var908
		var907 = var909
	end
	if self.action_params ~= nil then
		local var910 = self.action_params:encode()
		local var911, var912 = protoModule.writeTag(buff, var907, 2, protoModule.wireTypes.lengthDelimited)
		var911, var912 = protoModule.writeBuffer(var911, var912, var910, buffer.len(var910))
		buff = var911
		var907 = var912
	end
	local buff_1 = buffer.create(var907)
	buffer.copy(buff_1, 0, buff, 0, var907)
	
	return buff_1
end

function t_25.decode(p47) --[[ line: 8990 ]]
	-- upvalues: t_25 (ref), protoModule (ref), t (ref)
	local var914 = t_25.new()
	local var915 = 0
	while var915 < buffer.len(p47) do
		local _ = nil
		local var916 = nil
		local var917, var918, var919 = protoModule.readTag(p47, var915)
		local var920 = var917
		var916 = var918
		var915 = var919
		
		if var916 == protoModule.wireTypes.varint then
			if var920 == 1 then
				local _ = nil
				local var921, var922 = protoModule.readVarIntI32(p47, var915)
				local var923 = var921
				var915 = var922
				var914.action_type = t.ActionType.fromNumber(var923) or var923
			else
				local _ = nil
				local var924, var925 = protoModule.readVarInt(p47, var915)
				local _ = var924
				var915 = var925
			end
		end
		if var916 == protoModule.wireTypes.lengthDelimited then
			if var920 == 2 then
				local _ = nil
				local var926, var927 = protoModule.readBuffer(p47, var915)
				var915 = var927
				var914.action_params = t.LoadMoreFromApiAction_Params.decode(var926)
			else
				local _ = nil
				local var928, var929 = protoModule.readVarInt(p47, var915)
				var915 = var929 + var928
			end
		elseif var916 == protoModule.wireTypes.i32 then
			local _ = nil
			local var930, var931 = protoModule.readFixed32(p47, var915)
			local _ = var930
			var915 = var931
		elseif var916 == protoModule.wireTypes.i64 then
			local _ = nil
			local var932, var933 = protoModule.readFixed64(p47, var915)
			local _ = var932
			var915 = var933
		else
			error("Unsupported wire type: " .. var916)
		end
	end
	return var914
end

function t_25:jsonEncode() --[[ line: 9038 ]]
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

function t_25:jsonDecode() --[[ line: 9060 ]]
	-- upvalues: t_25 (ref), t (ref)
	local var935 = t_25.new()
	
	if self.action_type ~= nil then
		var935.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var935.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var935.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var935.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var935
end

t_25.descriptor = {
	name = "LoadMoreFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LoadMoreFromApiAction"
}
t.LoadMoreFromApiAction = t_25
typeRegistryModule.default:register(t.LoadMoreFromApiAction)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p48) --[[ line: 9100 ]]
	-- upvalues: t_26 (ref)
	return setmetatable({
		surface_key = if p48 == nil or p48.surface_key == nil then nil else p48.surface_key,
		config_key = if p48 == nil or p48.config_key == nil then nil else p48.config_key
	}, t_26)
end

function t_26:encode() --[[ line: 9109 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var937 = 0
	
	if self.surface_key ~= nil then
		local var938 = self.surface_key:encode()
		local var939, var940 = protoModule.writeTag(buff, var937, 1, protoModule.wireTypes.lengthDelimited)
		var939, var940 = protoModule.writeBuffer(var939, var940, var938, buffer.len(var938))
		buff = var939
		var937 = var940
	end
	if self.config_key ~= nil then
		local var941 = self.config_key:encode()
		local var942, var943 = protoModule.writeTag(buff, var937, 2, protoModule.wireTypes.lengthDelimited)
		var942, var943 = protoModule.writeBuffer(var942, var943, var941, buffer.len(var941))
		buff = var942
		var937 = var943
	end
	local buff_1 = buffer.create(var937)
	buffer.copy(buff_1, 0, buff, 0, var937)
	
	return buff_1
end

function t_26.decode(p49) --[[ line: 9130 ]]
	-- upvalues: t_26 (ref), protoModule (ref), propTypesModule (ref)
	local var945 = t_26.new()
	local var946 = 0
	while var946 < buffer.len(p49) do
		local _ = nil
		local var947 = nil
		local var948, var949, var950 = protoModule.readTag(p49, var946)
		local var951 = var948
		var947 = var949
		var946 = var950
		
		if var947 == protoModule.wireTypes.varint then
			local _ = nil
			local var952, var953 = protoModule.readVarInt(p49, var946)
			local _ = var952
			var946 = var953
			continue
		end
		if var947 == protoModule.wireTypes.lengthDelimited then
			if var951 == 1 then
				local _ = nil
				local var954, var955 = protoModule.readBuffer(p49, var946)
				var946 = var955
				var945.surface_key = propTypesModule.StringProp.decode(var954)
			elseif var951 == 2 then
				local _ = nil
				local var956, var957 = protoModule.readBuffer(p49, var946)
				var946 = var957
				var945.config_key = propTypesModule.StringProp.decode(var956)
			else
				local _ = nil
				local var958, var959 = protoModule.readVarInt(p49, var946)
				var946 = var959 + var958
			end
		elseif var947 == protoModule.wireTypes.i32 then
			local _ = nil
			local var960, var961 = protoModule.readFixed32(p49, var946)
			local _ = var960
			var946 = var961
		elseif var947 == protoModule.wireTypes.i64 then
			local _ = nil
			local var962, var963 = protoModule.readFixed64(p49, var946)
			local _ = var962
			var946 = var963
		else
			error("Unsupported wire type: " .. var947)
		end
	end
	return var945
end

function t_26:jsonEncode() --[[ line: 9178 ]]
	local t = {}
	
	if self.surface_key ~= nil then
		t.surfaceKey = self.surface_key:jsonEncode()
	end
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	return t
end

function t_26:jsonDecode() --[[ line: 9192 ]]
	-- upvalues: t_26 (ref), propTypesModule (ref)
	local var965 = t_26.new()
	
	if self.surface_key ~= nil then
		var965.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var965.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		var965.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var965.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return var965
end

t_26.descriptor = {
	name = "LoadMoreFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LoadMoreFromApiAction_Params = t_26
typeRegistryModule.default:register(t.LoadMoreFromApiAction_Params)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p50) --[[ line: 9229 ]]
	-- upvalues: t (ref), t_27 (ref)
	return setmetatable({
		action_type = if p50 == nil or p50.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p50.action_type,
		action_params = if p50 == nil or p50.action_params == nil then nil else p50.action_params
	}, t_27)
end

function t_27:encode() --[[ line: 9238 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var967 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var968, var969 = protoModule.writeTag(buff, var967, 1, protoModule.wireTypes.varint)
		var968, var969 = protoModule.writeVarInt(var968, var969, t.ActionType.toNumber(self.action_type))
		buff = var968
		var967 = var969
	end
	if self.action_params ~= nil then
		local var970 = self.action_params:encode()
		local var971, var972 = protoModule.writeTag(buff, var967, 2, protoModule.wireTypes.lengthDelimited)
		var971, var972 = protoModule.writeBuffer(var971, var972, var970, buffer.len(var970))
		buff = var971
		var967 = var972
	end
	local buff_1 = buffer.create(var967)
	buffer.copy(buff_1, 0, buff, 0, var967)
	
	return buff_1
end

function t_27.decode(p51) --[[ line: 9264 ]]
	-- upvalues: t_27 (ref), protoModule (ref), t (ref)
	local var974 = t_27.new()
	local var975 = 0
	while var975 < buffer.len(p51) do
		local _ = nil
		local var976 = nil
		local var977, var978, var979 = protoModule.readTag(p51, var975)
		local var980 = var977
		var976 = var978
		var975 = var979
		
		if var976 == protoModule.wireTypes.varint then
			if var980 == 1 then
				local _ = nil
				local var981, var982 = protoModule.readVarIntI32(p51, var975)
				local var983 = var981
				var975 = var982
				var974.action_type = t.ActionType.fromNumber(var983) or var983
			else
				local _ = nil
				local var984, var985 = protoModule.readVarInt(p51, var975)
				local _ = var984
				var975 = var985
			end
		end
		if var976 == protoModule.wireTypes.lengthDelimited then
			if var980 == 2 then
				local _ = nil
				local var986, var987 = protoModule.readBuffer(p51, var975)
				var975 = var987
				var974.action_params = t.ShareAction_Params.decode(var986)
			else
				local _ = nil
				local var988, var989 = protoModule.readVarInt(p51, var975)
				var975 = var989 + var988
			end
		elseif var976 == protoModule.wireTypes.i32 then
			local _ = nil
			local var990, var991 = protoModule.readFixed32(p51, var975)
			local _ = var990
			var975 = var991
		elseif var976 == protoModule.wireTypes.i64 then
			local _ = nil
			local var992, var993 = protoModule.readFixed64(p51, var975)
			local _ = var992
			var975 = var993
		else
			error("Unsupported wire type: " .. var976)
		end
	end
	return var974
end

function t_27:jsonEncode() --[[ line: 9312 ]]
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

function t_27:jsonDecode() --[[ line: 9334 ]]
	-- upvalues: t_27 (ref), t (ref)
	local var995 = t_27.new()
	
	if self.action_type ~= nil then
		var995.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var995.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var995.action_params = t.ShareAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var995.action_params = t.ShareAction_Params.jsonDecode(self.actionParams)
	end
	return var995
end

t_27.descriptor = {
	name = "ShareAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareAction"
}
t.ShareAction = t_27
typeRegistryModule.default:register(t.ShareAction)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p52) --[[ line: 9374 ]]
	-- upvalues: t_28 (ref)
	return setmetatable({
		oneof_prop = if p52 == nil or p52.oneof_prop == nil then nil else p52.oneof_prop
	}, t_28)
end

function t_28:encode() --[[ line: 9382 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var997 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "generic_share_link_data" then
			local var998 = self.oneof_prop.value:encode()
			local var999, var1000 = protoModule.writeTag(buff, var997, 1, protoModule.wireTypes.lengthDelimited)
			var999, var1000 = protoModule.writeBuffer(var999, var1000, var998, buffer.len(var998))
			buff = var999
			var997 = var1000
		elseif self.oneof_prop.type == "share_link_fetch_data" then
			local var1001 = self.oneof_prop.value:encode()
			local var1002, var1003 = protoModule.writeTag(buff, var997, 2, protoModule.wireTypes.lengthDelimited)
			var1002, var1003 = protoModule.writeBuffer(var1002, var1003, var1001, buffer.len(var1001))
			buff = var1002
			var997 = var1003
		end
	end
	local buff_1 = buffer.create(var997)
	buffer.copy(buff_1, 0, buff, 0, var997)
	
	return buff_1
end

function t_28.decode(p53) --[[ line: 9403 ]]
	-- upvalues: t_28 (ref), protoModule (ref), shareLinkDataModule (ref)
	local var1005 = t_28.new()
	local var1006 = 0
	while var1006 < buffer.len(p53) do
		local _ = nil
		local var1007 = nil
		local var1008, var1009, var1010 = protoModule.readTag(p53, var1006)
		local var1011 = var1008
		var1007 = var1009
		var1006 = var1010
		
		if var1007 == protoModule.wireTypes.varint then
			local _ = nil
			local var1012, var1013 = protoModule.readVarInt(p53, var1006)
			local _ = var1012
			var1006 = var1013
			continue
		end
		if var1007 == protoModule.wireTypes.lengthDelimited then
			if var1011 == 1 then
				local _ = nil
				local var1014, var1015 = protoModule.readBuffer(p53, var1006)
				var1006 = var1015
				var1005.oneof_prop = {
					type = "generic_share_link_data",
					value = shareLinkDataModule.GenericShareLinkData.decode(var1014)
				}
			elseif var1011 == 2 then
				local _ = nil
				local var1016, var1017 = protoModule.readBuffer(p53, var1006)
				var1006 = var1017
				var1005.oneof_prop = {
					type = "share_link_fetch_data",
					value = shareLinkDataModule.ShareLinkFetchData.decode(var1016)
				}
			else
				local _ = nil
				local var1018, var1019 = protoModule.readVarInt(p53, var1006)
				var1006 = var1019 + var1018
			end
		elseif var1007 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1020, var1021 = protoModule.readFixed32(p53, var1006)
			local _ = var1020
			var1006 = var1021
		elseif var1007 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1022, var1023 = protoModule.readFixed64(p53, var1006)
			local _ = var1022
			var1006 = var1023
		else
			error("Unsupported wire type: " .. var1007)
		end
	end
	return var1005
end

function t_28:jsonEncode() --[[ line: 9459 ]]
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

function t_28:jsonDecode() --[[ line: 9473 ]]
	-- upvalues: t_28 (ref), shareLinkDataModule (ref)
	local var1025 = t_28.new()
	
	if self.generic_share_link_data ~= nil then
		var1025.oneof_prop = {
			type = "generic_share_link_data",
			value = shareLinkDataModule.GenericShareLinkData.jsonDecode(self.generic_share_link_data)
		}
	end
	if self.genericShareLinkData ~= nil then
		var1025.oneof_prop = {
			type = "generic_share_link_data",
			value = shareLinkDataModule.GenericShareLinkData.jsonDecode(self.genericShareLinkData)
		}
	end
	if self.share_link_fetch_data ~= nil then
		var1025.oneof_prop = {
			type = "share_link_fetch_data",
			value = shareLinkDataModule.ShareLinkFetchData.jsonDecode(self.share_link_fetch_data)
		}
	end
	if self.shareLinkFetchData ~= nil then
		var1025.oneof_prop = {
			type = "share_link_fetch_data",
			value = shareLinkDataModule.ShareLinkFetchData.jsonDecode(self.shareLinkFetchData)
		}
	end
	return var1025
end

t_28.descriptor = {
	name = "ShareAction_ShareLinkData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkData"
}
t.ShareAction_ShareLinkData = t_28
typeRegistryModule.default:register(t.ShareAction_ShareLinkData)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p54) --[[ line: 9529 ]]
	-- upvalues: t_29 (ref)
	return setmetatable({
		share_link_type = if p54 == nil or p54.share_link_type == nil then nil else p54.share_link_type,
		share_link_data = if p54 == nil or p54.share_link_data == nil then nil else p54.share_link_data,
		entry_point_key = if p54 == nil or p54.entry_point_key == nil then nil else p54.entry_point_key
	}, t_29)
end

function t_29:encode() --[[ line: 9537 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1027 = 0
	
	if self.share_link_type ~= nil then
		local var1028 = self.share_link_type:encode()
		local var1029, var1030 = protoModule.writeTag(buff, var1027, 1, protoModule.wireTypes.lengthDelimited)
		var1029, var1030 = protoModule.writeBuffer(var1029, var1030, var1028, buffer.len(var1028))
		buff = var1029
		var1027 = var1030
	end
	if self.share_link_data ~= nil then
		local var1031 = self.share_link_data:encode()
		local var1032, var1033 = protoModule.writeTag(buff, var1027, 2, protoModule.wireTypes.lengthDelimited)
		var1032, var1033 = protoModule.writeBuffer(var1032, var1033, var1031, buffer.len(var1031))
		buff = var1032
		var1027 = var1033
	end
	if self.entry_point_key ~= nil then
		local var1034 = self.entry_point_key:encode()
		local var1035, var1036 = protoModule.writeTag(buff, var1027, 3, protoModule.wireTypes.lengthDelimited)
		var1035, var1036 = protoModule.writeBuffer(var1035, var1036, var1034, buffer.len(var1034))
		buff = var1035
		var1027 = var1036
	end
	local buff_1 = buffer.create(var1027)
	buffer.copy(buff_1, 0, buff, 0, var1027)
	
	return buff_1
end

function t_29.decode(p55) --[[ line: 9564 ]]
	-- upvalues: t_29 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1038 = t_29.new()
	local var1039 = 0
	while var1039 < buffer.len(p55) do
		local _ = nil
		local var1040 = nil
		local var1041, var1042, var1043 = protoModule.readTag(p55, var1039)
		local var1044 = var1041
		var1040 = var1042
		var1039 = var1043
		
		if var1040 == protoModule.wireTypes.varint then
			local _ = nil
			local var1045, var1046 = protoModule.readVarInt(p55, var1039)
			local _ = var1045
			var1039 = var1046
			continue
		end
		if var1040 == protoModule.wireTypes.lengthDelimited then
			if var1044 == 1 then
				local _ = nil
				local var1047, var1048 = protoModule.readBuffer(p55, var1039)
				var1039 = var1048
				var1038.share_link_type = propTypesModule.StringProp.decode(var1047)
			elseif var1044 == 2 then
				local _ = nil
				local var1049, var1050 = protoModule.readBuffer(p55, var1039)
				var1039 = var1050
				var1038.share_link_data = t.ShareAction_ShareLinkData.decode(var1049)
			elseif var1044 == 3 then
				local _ = nil
				local var1051, var1052 = protoModule.readBuffer(p55, var1039)
				var1039 = var1052
				var1038.entry_point_key = propTypesModule.StringProp.decode(var1051)
			else
				local _ = nil
				local var1053, var1054 = protoModule.readVarInt(p55, var1039)
				var1039 = var1054 + var1053
			end
		elseif var1040 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1055, var1056 = protoModule.readFixed32(p55, var1039)
			local _ = var1055
			var1039 = var1056
		elseif var1040 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1057, var1058 = protoModule.readFixed64(p55, var1039)
			local _ = var1057
			var1039 = var1058
		else
			error("Unsupported wire type: " .. var1040)
		end
	end
	return var1038
end

function t_29:jsonEncode() --[[ line: 9617 ]]
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

function t_29:jsonDecode() --[[ line: 9635 ]]
	-- upvalues: t_29 (ref), propTypesModule (ref), t (ref)
	local var1060 = t_29.new()
	
	if self.share_link_type ~= nil then
		var1060.share_link_type = propTypesModule.StringProp.jsonDecode(self.share_link_type)
	end
	if self.shareLinkType ~= nil then
		var1060.share_link_type = propTypesModule.StringProp.jsonDecode(self.shareLinkType)
	end
	if self.share_link_data ~= nil then
		var1060.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.share_link_data)
	end
	if self.shareLinkData ~= nil then
		var1060.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.shareLinkData)
	end
	if self.entry_point_key ~= nil then
		var1060.entry_point_key = propTypesModule.StringProp.jsonDecode(self.entry_point_key)
	end
	if self.entryPointKey ~= nil then
		var1060.entry_point_key = propTypesModule.StringProp.jsonDecode(self.entryPointKey)
	end
	return var1060
end

t_29.descriptor = {
	name = "ShareAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ShareAction_Params = t_29
typeRegistryModule.default:register(t.ShareAction_Params)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p56) --[[ line: 9683 ]]
	-- upvalues: t (ref), t_30 (ref)
	return setmetatable({
		action_type = if p56 == nil or p56.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p56.action_type,
		action_params = if p56 == nil or p56.action_params == nil then nil else p56.action_params
	}, t_30)
end

function t_30:encode() --[[ line: 9692 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1062 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1063, var1064 = protoModule.writeTag(buff, var1062, 1, protoModule.wireTypes.varint)
		var1063, var1064 = protoModule.writeVarInt(var1063, var1064, t.ActionType.toNumber(self.action_type))
		buff = var1063
		var1062 = var1064
	end
	if self.action_params ~= nil then
		local var1065 = self.action_params:encode()
		local var1066, var1067 = protoModule.writeTag(buff, var1062, 2, protoModule.wireTypes.lengthDelimited)
		var1066, var1067 = protoModule.writeBuffer(var1066, var1067, var1065, buffer.len(var1065))
		buff = var1066
		var1062 = var1067
	end
	local buff_1 = buffer.create(var1062)
	buffer.copy(buff_1, 0, buff, 0, var1062)
	
	return buff_1
end

function t_30.decode(p57) --[[ line: 9718 ]]
	-- upvalues: t_30 (ref), protoModule (ref), t (ref)
	local var1069 = t_30.new()
	local var1070 = 0
	while var1070 < buffer.len(p57) do
		local _ = nil
		local var1071 = nil
		local var1072, var1073, var1074 = protoModule.readTag(p57, var1070)
		local var1075 = var1072
		var1071 = var1073
		var1070 = var1074
		
		if var1071 == protoModule.wireTypes.varint then
			if var1075 == 1 then
				local _ = nil
				local var1076, var1077 = protoModule.readVarIntI32(p57, var1070)
				local var1078 = var1076
				var1070 = var1077
				var1069.action_type = t.ActionType.fromNumber(var1078) or var1078
			else
				local _ = nil
				local var1079, var1080 = protoModule.readVarInt(p57, var1070)
				local _ = var1079
				var1070 = var1080
			end
		end
		if var1071 == protoModule.wireTypes.lengthDelimited then
			if var1075 == 2 then
				local _ = nil
				local var1081, var1082 = protoModule.readBuffer(p57, var1070)
				var1070 = var1082
				var1069.action_params = t.OpenAbuseReportAction_Params.decode(var1081)
			else
				local _ = nil
				local var1083, var1084 = protoModule.readVarInt(p57, var1070)
				var1070 = var1084 + var1083
			end
		elseif var1071 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1085, var1086 = protoModule.readFixed32(p57, var1070)
			local _ = var1085
			var1070 = var1086
		elseif var1071 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1087, var1088 = protoModule.readFixed64(p57, var1070)
			local _ = var1087
			var1070 = var1088
		else
			error("Unsupported wire type: " .. var1071)
		end
	end
	return var1069
end

function t_30:jsonEncode() --[[ line: 9766 ]]
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

function t_30:jsonDecode() --[[ line: 9788 ]]
	-- upvalues: t_30 (ref), t (ref)
	local var1090 = t_30.new()
	
	if self.action_type ~= nil then
		var1090.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1090.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1090.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1090.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.actionParams)
	end
	return var1090
end

t_30.descriptor = {
	name = "OpenAbuseReportAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAbuseReportAction"
}
t.OpenAbuseReportAction = t_30
typeRegistryModule.default:register(t.OpenAbuseReportAction)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p58) --[[ line: 9828 ]]
	-- upvalues: t_31 (ref)
	return setmetatable({
		target_id = if p58 == nil or p58.target_id == nil then nil else p58.target_id,
		abuse_vector = if p58 == nil or p58.abuse_vector == nil then nil else p58.abuse_vector,
		asset_type_name = if p58 == nil or p58.asset_type_name == nil then nil else p58.asset_type_name,
		universe_id = if p58 == nil or p58.universe_id == nil then nil else p58.universe_id
	}, t_31)
end

function t_31:encode() --[[ line: 9839 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1092 = 0
	
	if self.target_id ~= nil then
		local var1093 = self.target_id:encode()
		local var1094, var1095 = protoModule.writeTag(buff, var1092, 1, protoModule.wireTypes.lengthDelimited)
		var1094, var1095 = protoModule.writeBuffer(var1094, var1095, var1093, buffer.len(var1093))
		buff = var1094
		var1092 = var1095
	end
	if self.abuse_vector ~= nil then
		local var1096 = self.abuse_vector:encode()
		local var1097, var1098 = protoModule.writeTag(buff, var1092, 2, protoModule.wireTypes.lengthDelimited)
		var1097, var1098 = protoModule.writeBuffer(var1097, var1098, var1096, buffer.len(var1096))
		buff = var1097
		var1092 = var1098
	end
	if self.asset_type_name ~= nil then
		local var1099 = self.asset_type_name:encode()
		local var1100, var1101 = protoModule.writeTag(buff, var1092, 3, protoModule.wireTypes.lengthDelimited)
		var1100, var1101 = protoModule.writeBuffer(var1100, var1101, var1099, buffer.len(var1099))
		buff = var1100
		var1092 = var1101
	end
	if self.universe_id ~= nil then
		local var1102 = self.universe_id:encode()
		local var1103, var1104 = protoModule.writeTag(buff, var1092, 4, protoModule.wireTypes.lengthDelimited)
		var1103, var1104 = protoModule.writeBuffer(var1103, var1104, var1102, buffer.len(var1102))
		buff = var1103
		var1092 = var1104
	end
	local buff_1 = buffer.create(var1092)
	buffer.copy(buff_1, 0, buff, 0, var1092)
	
	return buff_1
end

function t_31.decode(p59) --[[ line: 9872 ]]
	-- upvalues: t_31 (ref), protoModule (ref), propTypesModule (ref)
	local var1106 = t_31.new()
	local var1107 = 0
	while var1107 < buffer.len(p59) do
		local _ = nil
		local var1108 = nil
		local var1109, var1110, var1111 = protoModule.readTag(p59, var1107)
		local var1112 = var1109
		var1108 = var1110
		var1107 = var1111
		
		if var1108 == protoModule.wireTypes.varint then
			local _ = nil
			local var1113, var1114 = protoModule.readVarInt(p59, var1107)
			local _ = var1113
			var1107 = var1114
			continue
		end
		if var1108 == protoModule.wireTypes.lengthDelimited then
			if var1112 == 1 then
				local _ = nil
				local var1115, var1116 = protoModule.readBuffer(p59, var1107)
				var1107 = var1116
				var1106.target_id = propTypesModule.StringProp.decode(var1115)
			elseif var1112 == 2 then
				local _ = nil
				local var1117, var1118 = protoModule.readBuffer(p59, var1107)
				var1107 = var1118
				var1106.abuse_vector = propTypesModule.StringProp.decode(var1117)
			elseif var1112 == 3 then
				local _ = nil
				local var1119, var1120 = protoModule.readBuffer(p59, var1107)
				var1107 = var1120
				var1106.asset_type_name = propTypesModule.StringProp.decode(var1119)
			elseif var1112 == 4 then
				local _ = nil
				local var1121, var1122 = protoModule.readBuffer(p59, var1107)
				var1107 = var1122
				var1106.universe_id = propTypesModule.StringProp.decode(var1121)
			else
				local _ = nil
				local var1123, var1124 = protoModule.readVarInt(p59, var1107)
				var1107 = var1124 + var1123
			end
		elseif var1108 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1125, var1126 = protoModule.readFixed32(p59, var1107)
			local _ = var1125
			var1107 = var1126
		elseif var1108 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1127, var1128 = protoModule.readFixed64(p59, var1107)
			local _ = var1127
			var1107 = var1128
		else
			error("Unsupported wire type: " .. var1108)
		end
	end
	return var1106
end

function t_31:jsonEncode() --[[ line: 9930 ]]
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

function t_31:jsonDecode() --[[ line: 9952 ]]
	-- upvalues: t_31 (ref), propTypesModule (ref)
	local var1130 = t_31.new()
	
	if self.target_id ~= nil then
		var1130.target_id = propTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		var1130.target_id = propTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.abuse_vector ~= nil then
		var1130.abuse_vector = propTypesModule.StringProp.jsonDecode(self.abuse_vector)
	end
	if self.abuseVector ~= nil then
		var1130.abuse_vector = propTypesModule.StringProp.jsonDecode(self.abuseVector)
	end
	if self.asset_type_name ~= nil then
		var1130.asset_type_name = propTypesModule.StringProp.jsonDecode(self.asset_type_name)
	end
	if self.assetTypeName ~= nil then
		var1130.asset_type_name = propTypesModule.StringProp.jsonDecode(self.assetTypeName)
	end
	if self.universe_id ~= nil then
		var1130.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1130.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1130
end

t_31.descriptor = {
	name = "OpenAbuseReportAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAbuseReportAction_Params = t_31
typeRegistryModule.default:register(t.OpenAbuseReportAction_Params)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p60) --[[ line: 10009 ]]
	-- upvalues: t (ref), t_32 (ref)
	return setmetatable({
		action_type = if p60 == nil or p60.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p60.action_type,
		action_params = if p60 == nil or p60.action_params == nil then nil else p60.action_params
	}, t_32)
end

function t_32:encode() --[[ line: 10020 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1132 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1133, var1134 = protoModule.writeTag(buff, var1132, 1, protoModule.wireTypes.varint)
		var1133, var1134 = protoModule.writeVarInt(var1133, var1134, t.ActionType.toNumber(self.action_type))
		buff = var1133
		var1132 = var1134
	end
	if self.action_params ~= nil then
		local var1135 = self.action_params:encode()
		local var1136, var1137 = protoModule.writeTag(buff, var1132, 2, protoModule.wireTypes.lengthDelimited)
		var1136, var1137 = protoModule.writeBuffer(var1136, var1137, var1135, buffer.len(var1135))
		buff = var1136
		var1132 = var1137
	end
	local buff_1 = buffer.create(var1132)
	buffer.copy(buff_1, 0, buff, 0, var1132)
	
	return buff_1
end

function t_32.decode(p61) --[[ line: 10046 ]]
	-- upvalues: t_32 (ref), protoModule (ref), t (ref)
	local var1139 = t_32.new()
	local var1140 = 0
	while var1140 < buffer.len(p61) do
		local _ = nil
		local var1141 = nil
		local var1142, var1143, var1144 = protoModule.readTag(p61, var1140)
		local var1145 = var1142
		var1141 = var1143
		var1140 = var1144
		
		if var1141 == protoModule.wireTypes.varint then
			if var1145 == 1 then
				local _ = nil
				local var1146, var1147 = protoModule.readVarIntI32(p61, var1140)
				local var1148 = var1146
				var1140 = var1147
				var1139.action_type = t.ActionType.fromNumber(var1148) or var1148
			else
				local _ = nil
				local var1149, var1150 = protoModule.readVarInt(p61, var1140)
				local _ = var1149
				var1140 = var1150
			end
		end
		if var1141 == protoModule.wireTypes.lengthDelimited then
			if var1145 == 2 then
				local _ = nil
				local var1151, var1152 = protoModule.readBuffer(p61, var1140)
				var1140 = var1152
				var1139.action_params = t.RemoveBadgeFromInventoryAction_Params.decode(var1151)
			else
				local _ = nil
				local var1153, var1154 = protoModule.readVarInt(p61, var1140)
				var1140 = var1154 + var1153
			end
		elseif var1141 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1155, var1156 = protoModule.readFixed32(p61, var1140)
			local _ = var1155
			var1140 = var1156
		elseif var1141 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1157, var1158 = protoModule.readFixed64(p61, var1140)
			local _ = var1157
			var1140 = var1158
		else
			error("Unsupported wire type: " .. var1141)
		end
	end
	return var1139
end

function t_32:jsonEncode() --[[ line: 10094 ]]
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

function t_32:jsonDecode() --[[ line: 10116 ]]
	-- upvalues: t_32 (ref), t (ref)
	local var1160 = t_32.new()
	
	if self.action_type ~= nil then
		var1160.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1160.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1160.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1160.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.actionParams)
	end
	return var1160
end

t_32.descriptor = {
	name = "RemoveBadgeFromInventoryAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RemoveBadgeFromInventoryAction"
}
t.RemoveBadgeFromInventoryAction = t_32
typeRegistryModule.default:register(t.RemoveBadgeFromInventoryAction)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p62) --[[ line: 10156 ]]
	-- upvalues: t_33 (ref)
	return setmetatable({
		asset_id = if p62 == nil or p62.asset_id == nil then nil else p62.asset_id
	}, t_33)
end

function t_33:encode() --[[ line: 10164 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1162 = 0
	
	if self.asset_id ~= nil then
		local var1163 = self.asset_id:encode()
		local var1164, var1165 = protoModule.writeTag(buff, var1162, 1, protoModule.wireTypes.lengthDelimited)
		var1164, var1165 = protoModule.writeBuffer(var1164, var1165, var1163, buffer.len(var1163))
		buff = var1164
		var1162 = var1165
	end
	local buff_1 = buffer.create(var1162)
	buffer.copy(buff_1, 0, buff, 0, var1162)
	
	return buff_1
end

function t_33.decode(p63) --[[ line: 10179 ]]
	-- upvalues: t_33 (ref), protoModule (ref), propTypesModule (ref)
	local var1167 = t_33.new()
	local var1168 = 0
	while var1168 < buffer.len(p63) do
		local _ = nil
		local var1169 = nil
		local var1170, var1171, var1172 = protoModule.readTag(p63, var1168)
		local var1173 = var1170
		var1169 = var1171
		var1168 = var1172
		
		if var1169 == protoModule.wireTypes.varint then
			local _ = nil
			local var1174, var1175 = protoModule.readVarInt(p63, var1168)
			local _ = var1174
			var1168 = var1175
			continue
		end
		if var1169 == protoModule.wireTypes.lengthDelimited then
			if var1173 == 1 then
				local _ = nil
				local var1176, var1177 = protoModule.readBuffer(p63, var1168)
				var1168 = var1177
				var1167.asset_id = propTypesModule.StringProp.decode(var1176)
			else
				local _ = nil
				local var1178, var1179 = protoModule.readVarInt(p63, var1168)
				var1168 = var1179 + var1178
			end
		elseif var1169 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1180, var1181 = protoModule.readFixed32(p63, var1168)
			local _ = var1180
			var1168 = var1181
		elseif var1169 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1182, var1183 = protoModule.readFixed64(p63, var1168)
			local _ = var1182
			var1168 = var1183
		else
			error("Unsupported wire type: " .. var1169)
		end
	end
	return var1167
end

function t_33:jsonEncode() --[[ line: 10222 ]]
	local t = {}
	
	if self.asset_id ~= nil then
		t.assetId = self.asset_id:jsonEncode()
	end
	return t
end

function t_33:jsonDecode() --[[ line: 10232 ]]
	-- upvalues: t_33 (ref), propTypesModule (ref)
	local var1185 = t_33.new()
	
	if self.asset_id ~= nil then
		var1185.asset_id = propTypesModule.StringProp.jsonDecode(self.asset_id)
	end
	if self.assetId ~= nil then
		var1185.asset_id = propTypesModule.StringProp.jsonDecode(self.assetId)
	end
	return var1185
end

t_33.descriptor = {
	name = "RemoveBadgeFromInventoryAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RemoveBadgeFromInventoryAction_Params = t_33
typeRegistryModule.default:register(t.RemoveBadgeFromInventoryAction_Params)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p64) --[[ line: 10262 ]]
	-- upvalues: t (ref), t_34 (ref)
	return setmetatable({
		action_type = if p64 == nil or p64.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p64.action_type,
		action_params = if p64 == nil or p64.action_params == nil then nil else p64.action_params
	}, t_34)
end

function t_34:encode() --[[ line: 10271 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1187 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1188, var1189 = protoModule.writeTag(buff, var1187, 1, protoModule.wireTypes.varint)
		var1188, var1189 = protoModule.writeVarInt(var1188, var1189, t.ActionType.toNumber(self.action_type))
		buff = var1188
		var1187 = var1189
	end
	if self.action_params ~= nil then
		local var1190 = self.action_params:encode()
		local var1191, var1192 = protoModule.writeTag(buff, var1187, 2, protoModule.wireTypes.lengthDelimited)
		var1191, var1192 = protoModule.writeBuffer(var1191, var1192, var1190, buffer.len(var1190))
		buff = var1191
		var1187 = var1192
	end
	local buff_1 = buffer.create(var1187)
	buffer.copy(buff_1, 0, buff, 0, var1187)
	
	return buff_1
end

function t_34.decode(p65) --[[ line: 10297 ]]
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var1194 = t_34.new()
	local var1195 = 0
	while var1195 < buffer.len(p65) do
		local _ = nil
		local var1196 = nil
		local var1197, var1198, var1199 = protoModule.readTag(p65, var1195)
		local var1200 = var1197
		var1196 = var1198
		var1195 = var1199
		
		if var1196 == protoModule.wireTypes.varint then
			if var1200 == 1 then
				local _ = nil
				local var1201, var1202 = protoModule.readVarIntI32(p65, var1195)
				local var1203 = var1201
				var1195 = var1202
				var1194.action_type = t.ActionType.fromNumber(var1203) or var1203
			else
				local _ = nil
				local var1204, var1205 = protoModule.readVarInt(p65, var1195)
				local _ = var1204
				var1195 = var1205
			end
		end
		if var1196 == protoModule.wireTypes.lengthDelimited then
			if var1200 == 2 then
				local _ = nil
				local var1206, var1207 = protoModule.readBuffer(p65, var1195)
				var1195 = var1207
				var1194.action_params = t.OpenProfileAction_Params.decode(var1206)
			else
				local _ = nil
				local var1208, var1209 = protoModule.readVarInt(p65, var1195)
				var1195 = var1209 + var1208
			end
		elseif var1196 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1210, var1211 = protoModule.readFixed32(p65, var1195)
			local _ = var1210
			var1195 = var1211
		elseif var1196 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1212, var1213 = protoModule.readFixed64(p65, var1195)
			local _ = var1212
			var1195 = var1213
		else
			error("Unsupported wire type: " .. var1196)
		end
	end
	return var1194
end

function t_34:jsonEncode() --[[ line: 10345 ]]
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

function t_34:jsonDecode() --[[ line: 10367 ]]
	-- upvalues: t_34 (ref), t (ref)
	local var1215 = t_34.new()
	
	if self.action_type ~= nil then
		var1215.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1215.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1215.action_params = t.OpenProfileAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1215.action_params = t.OpenProfileAction_Params.jsonDecode(self.actionParams)
	end
	return var1215
end

t_34.descriptor = {
	name = "OpenProfileAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenProfileAction"
}
t.OpenProfileAction = t_34
typeRegistryModule.default:register(t.OpenProfileAction)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p66) --[[ line: 10407 ]]
	-- upvalues: t_35 (ref)
	return setmetatable({
		profile_id = if p66 == nil or p66.profile_id == nil then nil else p66.profile_id,
		profile_type = if p66 == nil or p66.profile_type == nil then nil else p66.profile_type,
		source = if p66 == nil or p66.source == nil then nil else p66.source
	}, t_35)
end

function t_35:encode() --[[ line: 10415 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1217 = 0
	
	if self.profile_id ~= nil then
		local var1218 = self.profile_id:encode()
		local var1219, var1220 = protoModule.writeTag(buff, var1217, 1, protoModule.wireTypes.lengthDelimited)
		var1219, var1220 = protoModule.writeBuffer(var1219, var1220, var1218, buffer.len(var1218))
		buff = var1219
		var1217 = var1220
	end
	if self.profile_type ~= nil then
		local var1221 = self.profile_type:encode()
		local var1222, var1223 = protoModule.writeTag(buff, var1217, 2, protoModule.wireTypes.lengthDelimited)
		var1222, var1223 = protoModule.writeBuffer(var1222, var1223, var1221, buffer.len(var1221))
		buff = var1222
		var1217 = var1223
	end
	if self.source ~= nil then
		local var1224 = self.source:encode()
		local var1225, var1226 = protoModule.writeTag(buff, var1217, 3, protoModule.wireTypes.lengthDelimited)
		var1225, var1226 = protoModule.writeBuffer(var1225, var1226, var1224, buffer.len(var1224))
		buff = var1225
		var1217 = var1226
	end
	local buff_1 = buffer.create(var1217)
	buffer.copy(buff_1, 0, buff, 0, var1217)
	
	return buff_1
end

function t_35.decode(p67) --[[ line: 10442 ]]
	-- upvalues: t_35 (ref), protoModule (ref), propTypesModule (ref)
	local var1228 = t_35.new()
	local var1229 = 0
	while var1229 < buffer.len(p67) do
		local _ = nil
		local var1230 = nil
		local var1231, var1232, var1233 = protoModule.readTag(p67, var1229)
		local var1234 = var1231
		var1230 = var1232
		var1229 = var1233
		
		if var1230 == protoModule.wireTypes.varint then
			local _ = nil
			local var1235, var1236 = protoModule.readVarInt(p67, var1229)
			local _ = var1235
			var1229 = var1236
			continue
		end
		if var1230 == protoModule.wireTypes.lengthDelimited then
			if var1234 == 1 then
				local _ = nil
				local var1237, var1238 = protoModule.readBuffer(p67, var1229)
				var1229 = var1238
				var1228.profile_id = propTypesModule.StringProp.decode(var1237)
			elseif var1234 == 2 then
				local _ = nil
				local var1239, var1240 = protoModule.readBuffer(p67, var1229)
				var1229 = var1240
				var1228.profile_type = propTypesModule.StringProp.decode(var1239)
			elseif var1234 == 3 then
				local _ = nil
				local var1241, var1242 = protoModule.readBuffer(p67, var1229)
				var1229 = var1242
				var1228.source = propTypesModule.StringProp.decode(var1241)
			else
				local _ = nil
				local var1243, var1244 = protoModule.readVarInt(p67, var1229)
				var1229 = var1244 + var1243
			end
		elseif var1230 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1245, var1246 = protoModule.readFixed32(p67, var1229)
			local _ = var1245
			var1229 = var1246
		elseif var1230 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1247, var1248 = protoModule.readFixed64(p67, var1229)
			local _ = var1247
			var1229 = var1248
		else
			error("Unsupported wire type: " .. var1230)
		end
	end
	return var1228
end

function t_35:jsonEncode() --[[ line: 10495 ]]
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

function t_35:jsonDecode() --[[ line: 10513 ]]
	-- upvalues: t_35 (ref), propTypesModule (ref)
	local var1250 = t_35.new()
	
	if self.profile_id ~= nil then
		var1250.profile_id = propTypesModule.StringProp.jsonDecode(self.profile_id)
	end
	if self.profileId ~= nil then
		var1250.profile_id = propTypesModule.StringProp.jsonDecode(self.profileId)
	end
	if self.profile_type ~= nil then
		var1250.profile_type = propTypesModule.StringProp.jsonDecode(self.profile_type)
	end
	if self.profileType ~= nil then
		var1250.profile_type = propTypesModule.StringProp.jsonDecode(self.profileType)
	end
	if self.source ~= nil then
		var1250.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var1250
end

t_35.descriptor = {
	name = "OpenProfileAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenProfileAction_Params = t_35
typeRegistryModule.default:register(t.OpenProfileAction_Params)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p68) --[[ line: 10555 ]]
	-- upvalues: t (ref), t_36 (ref)
	return setmetatable({
		action_type = if p68 == nil or p68.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p68.action_type,
		action_params = if p68 == nil or p68.action_params == nil then nil else p68.action_params
	}, t_36)
end

function t_36:encode() --[[ line: 10566 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1252 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1253, var1254 = protoModule.writeTag(buff, var1252, 1, protoModule.wireTypes.varint)
		var1253, var1254 = protoModule.writeVarInt(var1253, var1254, t.ActionType.toNumber(self.action_type))
		buff = var1253
		var1252 = var1254
	end
	if self.action_params ~= nil then
		local var1255 = self.action_params:encode()
		local var1256, var1257 = protoModule.writeTag(buff, var1252, 2, protoModule.wireTypes.lengthDelimited)
		var1256, var1257 = protoModule.writeBuffer(var1256, var1257, var1255, buffer.len(var1255))
		buff = var1256
		var1252 = var1257
	end
	local buff_1 = buffer.create(var1252)
	buffer.copy(buff_1, 0, buff, 0, var1252)
	
	return buff_1
end

function t_36.decode(p69) --[[ line: 10592 ]]
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1259 = t_36.new()
	local var1260 = 0
	while var1260 < buffer.len(p69) do
		local _ = nil
		local var1261 = nil
		local var1262, var1263, var1264 = protoModule.readTag(p69, var1260)
		local var1265 = var1262
		var1261 = var1263
		var1260 = var1264
		
		if var1261 == protoModule.wireTypes.varint then
			if var1265 == 1 then
				local _ = nil
				local var1266, var1267 = protoModule.readVarIntI32(p69, var1260)
				local var1268 = var1266
				var1260 = var1267
				var1259.action_type = t.ActionType.fromNumber(var1268) or var1268
			else
				local _ = nil
				local var1269, var1270 = protoModule.readVarInt(p69, var1260)
				local _ = var1269
				var1260 = var1270
			end
		end
		if var1261 == protoModule.wireTypes.lengthDelimited then
			if var1265 == 2 then
				local _ = nil
				local var1271, var1272 = protoModule.readBuffer(p69, var1260)
				var1260 = var1272
				var1259.action_params = t.OpenFacialAgeEstimationAction_Params.decode(var1271)
			else
				local _ = nil
				local var1273, var1274 = protoModule.readVarInt(p69, var1260)
				var1260 = var1274 + var1273
			end
		elseif var1261 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1275, var1276 = protoModule.readFixed32(p69, var1260)
			local _ = var1275
			var1260 = var1276
		elseif var1261 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1277, var1278 = protoModule.readFixed64(p69, var1260)
			local _ = var1277
			var1260 = var1278
		else
			error("Unsupported wire type: " .. var1261)
		end
	end
	return var1259
end

function t_36:jsonEncode() --[[ line: 10640 ]]
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

function t_36:jsonDecode() --[[ line: 10662 ]]
	-- upvalues: t_36 (ref), t (ref)
	local var1280 = t_36.new()
	
	if self.action_type ~= nil then
		var1280.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1280.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1280.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1280.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.actionParams)
	end
	return var1280
end

t_36.descriptor = {
	name = "OpenFacialAgeEstimationAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenFacialAgeEstimationAction"
}
t.OpenFacialAgeEstimationAction = t_36
typeRegistryModule.default:register(t.OpenFacialAgeEstimationAction)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p70) --[[ line: 10702 ]]
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

function t_37:encode() --[[ line: 10716 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1282 = 0
	
	if self.user_id ~= nil then
		local var1283 = self.user_id:encode()
		local var1284, var1285 = protoModule.writeTag(buff, var1282, 1, protoModule.wireTypes.lengthDelimited)
		var1284, var1285 = protoModule.writeBuffer(var1284, var1285, var1283, buffer.len(var1283))
		buff = var1284
		var1282 = var1285
	end
	if self.source ~= nil then
		local var1286 = self.source:encode()
		local var1287, var1288 = protoModule.writeTag(buff, var1282, 2, protoModule.wireTypes.lengthDelimited)
		var1287, var1288 = protoModule.writeBuffer(var1287, var1288, var1286, buffer.len(var1286))
		buff = var1287
		var1282 = var1288
	end
	if self.context ~= nil then
		local var1289 = self.context:encode()
		local var1290, var1291 = protoModule.writeTag(buff, var1282, 3, protoModule.wireTypes.lengthDelimited)
		var1290, var1291 = protoModule.writeBuffer(var1290, var1291, var1289, buffer.len(var1289))
		buff = var1290
		var1282 = var1291
	end
	if self.is_in_experience ~= nil then
		local var1292 = self.is_in_experience:encode()
		local var1293, var1294 = protoModule.writeTag(buff, var1282, 4, protoModule.wireTypes.lengthDelimited)
		var1293, var1294 = protoModule.writeBuffer(var1293, var1294, var1292, buffer.len(var1292))
		buff = var1293
		var1282 = var1294
	end
	if self.on_success ~= nil then
		local var1295 = self.on_success:encode()
		local var1296, var1297 = protoModule.writeTag(buff, var1282, 5, protoModule.wireTypes.lengthDelimited)
		var1296, var1297 = protoModule.writeBuffer(var1296, var1297, var1295, buffer.len(var1295))
		buff = var1296
		var1282 = var1297
	end
	if self.on_failure ~= nil then
		local var1298 = self.on_failure:encode()
		local var1299, var1300 = protoModule.writeTag(buff, var1282, 6, protoModule.wireTypes.lengthDelimited)
		var1299, var1300 = protoModule.writeBuffer(var1299, var1300, var1298, buffer.len(var1298))
		buff = var1299
		var1282 = var1300
	end
	if self.should_include_vpc ~= nil then
		local var1301 = self.should_include_vpc:encode()
		local var1302, var1303 = protoModule.writeTag(buff, var1282, 7, protoModule.wireTypes.lengthDelimited)
		var1302, var1303 = protoModule.writeBuffer(var1302, var1303, var1301, buffer.len(var1301))
		buff = var1302
		var1282 = var1303
	end
	local buff_1 = buffer.create(var1282)
	buffer.copy(buff_1, 0, buff, 0, var1282)
	
	return buff_1
end

function t_37.decode(p71) --[[ line: 10767 ]]
	-- upvalues: t_37 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1305 = t_37.new()
	local var1306 = 0
	while var1306 < buffer.len(p71) do
		local _ = nil
		local var1307 = nil
		local var1308, var1309, var1310 = protoModule.readTag(p71, var1306)
		local var1311 = var1308
		var1307 = var1309
		var1306 = var1310
		
		if var1307 == protoModule.wireTypes.varint then
			local _ = nil
			local var1312, var1313 = protoModule.readVarInt(p71, var1306)
			local _ = var1312
			var1306 = var1313
			continue
		end
		if var1307 == protoModule.wireTypes.lengthDelimited then
			if var1311 == 1 then
				local _ = nil
				local var1314, var1315 = protoModule.readBuffer(p71, var1306)
				var1306 = var1315
				var1305.user_id = propTypesModule.StringProp.decode(var1314)
			elseif var1311 == 2 then
				local _ = nil
				local var1316, var1317 = protoModule.readBuffer(p71, var1306)
				var1306 = var1317
				var1305.source = propTypesModule.StringProp.decode(var1316)
			elseif var1311 == 3 then
				local _ = nil
				local var1318, var1319 = protoModule.readBuffer(p71, var1306)
				var1306 = var1319
				var1305.context = propTypesModule.StringProp.decode(var1318)
			elseif var1311 == 4 then
				local _ = nil
				local var1320, var1321 = protoModule.readBuffer(p71, var1306)
				var1306 = var1321
				var1305.is_in_experience = propTypesModule.BoolProp.decode(var1320)
			elseif var1311 == 5 then
				local _ = nil
				local var1322, var1323 = protoModule.readBuffer(p71, var1306)
				var1306 = var1323
				var1305.on_success = t.ActionProp.decode(var1322)
			elseif var1311 == 6 then
				local _ = nil
				local var1324, var1325 = protoModule.readBuffer(p71, var1306)
				var1306 = var1325
				var1305.on_failure = t.ActionProp.decode(var1324)
			elseif var1311 == 7 then
				local _ = nil
				local var1326, var1327 = protoModule.readBuffer(p71, var1306)
				var1306 = var1327
				var1305.should_include_vpc = propTypesModule.BoolProp.decode(var1326)
			else
				local _ = nil
				local var1328, var1329 = protoModule.readVarInt(p71, var1306)
				var1306 = var1329 + var1328
			end
		elseif var1307 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1330, var1331 = protoModule.readFixed32(p71, var1306)
			local _ = var1330
			var1306 = var1331
		elseif var1307 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1332, var1333 = protoModule.readFixed64(p71, var1306)
			local _ = var1332
			var1306 = var1333
		else
			error("Unsupported wire type: " .. var1307)
		end
	end
	return var1305
end

function t_37:jsonEncode() --[[ line: 10840 ]]
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

function t_37:jsonDecode() --[[ line: 10874 ]]
	-- upvalues: t_37 (ref), propTypesModule (ref), t (ref)
	local var1335 = t_37.new()
	
	if self.user_id ~= nil then
		var1335.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1335.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var1335.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.context ~= nil then
		var1335.context = propTypesModule.StringProp.jsonDecode(self.context)
	end
	if self.is_in_experience ~= nil then
		var1335.is_in_experience = propTypesModule.BoolProp.jsonDecode(self.is_in_experience)
	end
	if self.isInExperience ~= nil then
		var1335.is_in_experience = propTypesModule.BoolProp.jsonDecode(self.isInExperience)
	end
	if self.on_success ~= nil then
		var1335.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var1335.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var1335.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var1335.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	if self.should_include_vpc ~= nil then
		var1335.should_include_vpc = propTypesModule.BoolProp.jsonDecode(self.should_include_vpc)
	end
	if self.shouldIncludeVpc ~= nil then
		var1335.should_include_vpc = propTypesModule.BoolProp.jsonDecode(self.shouldIncludeVpc)
	end
	return var1335
end

t_37.descriptor = {
	name = "OpenFacialAgeEstimationAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenFacialAgeEstimationAction_Params = t_37
typeRegistryModule.default:register(t.OpenFacialAgeEstimationAction_Params)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p72) --[[ line: 10948 ]]
	-- upvalues: t (ref), t_38 (ref)
	return setmetatable({
		action_type = if p72 == nil or p72.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p72.action_type,
		action_params = if p72 == nil or p72.action_params == nil then nil else p72.action_params
	}, t_38)
end

function t_38:encode() --[[ line: 10957 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1337 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1338, var1339 = protoModule.writeTag(buff, var1337, 1, protoModule.wireTypes.varint)
		var1338, var1339 = protoModule.writeVarInt(var1338, var1339, t.ActionType.toNumber(self.action_type))
		buff = var1338
		var1337 = var1339
	end
	if self.action_params ~= nil then
		local var1340 = self.action_params:encode()
		local var1341, var1342 = protoModule.writeTag(buff, var1337, 2, protoModule.wireTypes.lengthDelimited)
		var1341, var1342 = protoModule.writeBuffer(var1341, var1342, var1340, buffer.len(var1340))
		buff = var1341
		var1337 = var1342
	end
	local buff_1 = buffer.create(var1337)
	buffer.copy(buff_1, 0, buff, 0, var1337)
	
	return buff_1
end

function t_38.decode(p73) --[[ line: 10983 ]]
	-- upvalues: t_38 (ref), protoModule (ref), t (ref)
	local var1344 = t_38.new()
	local var1345 = 0
	while var1345 < buffer.len(p73) do
		local _ = nil
		local var1346 = nil
		local var1347, var1348, var1349 = protoModule.readTag(p73, var1345)
		local var1350 = var1347
		var1346 = var1348
		var1345 = var1349
		
		if var1346 == protoModule.wireTypes.varint then
			if var1350 == 1 then
				local _ = nil
				local var1351, var1352 = protoModule.readVarIntI32(p73, var1345)
				local var1353 = var1351
				var1345 = var1352
				var1344.action_type = t.ActionType.fromNumber(var1353) or var1353
			else
				local _ = nil
				local var1354, var1355 = protoModule.readVarInt(p73, var1345)
				local _ = var1354
				var1345 = var1355
			end
		end
		if var1346 == protoModule.wireTypes.lengthDelimited then
			if var1350 == 2 then
				local _ = nil
				local var1356, var1357 = protoModule.readBuffer(p73, var1345)
				var1345 = var1357
				var1344.action_params = t.ShowToastAction_Params.decode(var1356)
			else
				local _ = nil
				local var1358, var1359 = protoModule.readVarInt(p73, var1345)
				var1345 = var1359 + var1358
			end
		elseif var1346 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1360, var1361 = protoModule.readFixed32(p73, var1345)
			local _ = var1360
			var1345 = var1361
		elseif var1346 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1362, var1363 = protoModule.readFixed64(p73, var1345)
			local _ = var1362
			var1345 = var1363
		else
			error("Unsupported wire type: " .. var1346)
		end
	end
	return var1344
end

function t_38:jsonEncode() --[[ line: 11031 ]]
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

function t_38:jsonDecode() --[[ line: 11053 ]]
	-- upvalues: t_38 (ref), t (ref)
	local var1365 = t_38.new()
	
	if self.action_type ~= nil then
		var1365.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1365.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1365.action_params = t.ShowToastAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1365.action_params = t.ShowToastAction_Params.jsonDecode(self.actionParams)
	end
	return var1365
end

t_38.descriptor = {
	name = "ShowToastAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShowToastAction"
}
t.ShowToastAction = t_38
typeRegistryModule.default:register(t.ShowToastAction)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p74) --[[ line: 11093 ]]
	-- upvalues: t_39 (ref)
	return setmetatable({
		toast_message = if p74 == nil or p74.toast_message == nil then nil else p74.toast_message,
		toast_type = if p74 == nil or p74.toast_type == nil then nil else p74.toast_type,
		dismiss_prompt = if p74 == nil or p74.dismiss_prompt == nil then nil else p74.dismiss_prompt,
		prompt_type = if p74 == nil or p74.prompt_type == nil then nil else p74.prompt_type,
		prompt_id = if p74 == nil or p74.prompt_id == nil then nil else p74.prompt_id
	}, t_39)
end

function t_39:encode() --[[ line: 11103 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1367 = 0
	
	if self.toast_message ~= nil then
		local var1368 = self.toast_message:encode()
		local var1369, var1370 = protoModule.writeTag(buff, var1367, 1, protoModule.wireTypes.lengthDelimited)
		var1369, var1370 = protoModule.writeBuffer(var1369, var1370, var1368, buffer.len(var1368))
		buff = var1369
		var1367 = var1370
	end
	if self.toast_type ~= nil then
		local var1371 = self.toast_type:encode()
		local var1372, var1373 = protoModule.writeTag(buff, var1367, 2, protoModule.wireTypes.lengthDelimited)
		var1372, var1373 = protoModule.writeBuffer(var1372, var1373, var1371, buffer.len(var1371))
		buff = var1372
		var1367 = var1373
	end
	if self.dismiss_prompt ~= nil then
		local var1374 = self.dismiss_prompt:encode()
		local var1375, var1376 = protoModule.writeTag(buff, var1367, 3, protoModule.wireTypes.lengthDelimited)
		var1375, var1376 = protoModule.writeBuffer(var1375, var1376, var1374, buffer.len(var1374))
		buff = var1375
		var1367 = var1376
	end
	if self.prompt_type ~= nil then
		local var1377 = self.prompt_type:encode()
		local var1378, var1379 = protoModule.writeTag(buff, var1367, 4, protoModule.wireTypes.lengthDelimited)
		var1378, var1379 = protoModule.writeBuffer(var1378, var1379, var1377, buffer.len(var1377))
		buff = var1378
		var1367 = var1379
	end
	if self.prompt_id ~= nil then
		local var1380 = self.prompt_id:encode()
		local var1381, var1382 = protoModule.writeTag(buff, var1367, 5, protoModule.wireTypes.lengthDelimited)
		var1381, var1382 = protoModule.writeBuffer(var1381, var1382, var1380, buffer.len(var1380))
		buff = var1381
		var1367 = var1382
	end
	local buff_1 = buffer.create(var1367)
	buffer.copy(buff_1, 0, buff, 0, var1367)
	
	return buff_1
end

function t_39.decode(p75) --[[ line: 11142 ]]
	-- upvalues: t_39 (ref), protoModule (ref), propTypesModule (ref)
	local var1384 = t_39.new()
	local var1385 = 0
	while var1385 < buffer.len(p75) do
		local _ = nil
		local var1386 = nil
		local var1387, var1388, var1389 = protoModule.readTag(p75, var1385)
		local var1390 = var1387
		var1386 = var1388
		var1385 = var1389
		
		if var1386 == protoModule.wireTypes.varint then
			local _ = nil
			local var1391, var1392 = protoModule.readVarInt(p75, var1385)
			local _ = var1391
			var1385 = var1392
			continue
		end
		if var1386 == protoModule.wireTypes.lengthDelimited then
			if var1390 == 1 then
				local _ = nil
				local var1393, var1394 = protoModule.readBuffer(p75, var1385)
				var1385 = var1394
				var1384.toast_message = propTypesModule.StringProp.decode(var1393)
			elseif var1390 == 2 then
				local _ = nil
				local var1395, var1396 = protoModule.readBuffer(p75, var1385)
				var1385 = var1396
				var1384.toast_type = propTypesModule.StringProp.decode(var1395)
			elseif var1390 == 3 then
				local _ = nil
				local var1397, var1398 = protoModule.readBuffer(p75, var1385)
				var1385 = var1398
				var1384.dismiss_prompt = propTypesModule.BoolProp.decode(var1397)
			elseif var1390 == 4 then
				local _ = nil
				local var1399, var1400 = protoModule.readBuffer(p75, var1385)
				var1385 = var1400
				var1384.prompt_type = propTypesModule.StringProp.decode(var1399)
			elseif var1390 == 5 then
				local _ = nil
				local var1401, var1402 = protoModule.readBuffer(p75, var1385)
				var1385 = var1402
				var1384.prompt_id = propTypesModule.StringProp.decode(var1401)
			else
				local _ = nil
				local var1403, var1404 = protoModule.readVarInt(p75, var1385)
				var1385 = var1404 + var1403
			end
		elseif var1386 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1405, var1406 = protoModule.readFixed32(p75, var1385)
			local _ = var1405
			var1385 = var1406
		elseif var1386 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1407, var1408 = protoModule.readFixed64(p75, var1385)
			local _ = var1407
			var1385 = var1408
		else
			error("Unsupported wire type: " .. var1386)
		end
	end
	return var1384
end

function t_39:jsonEncode() --[[ line: 11205 ]]
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

function t_39:jsonDecode() --[[ line: 11231 ]]
	-- upvalues: t_39 (ref), propTypesModule (ref)
	local var1410 = t_39.new()
	
	if self.toast_message ~= nil then
		var1410.toast_message = propTypesModule.StringProp.jsonDecode(self.toast_message)
	end
	if self.toastMessage ~= nil then
		var1410.toast_message = propTypesModule.StringProp.jsonDecode(self.toastMessage)
	end
	if self.toast_type ~= nil then
		var1410.toast_type = propTypesModule.StringProp.jsonDecode(self.toast_type)
	end
	if self.toastType ~= nil then
		var1410.toast_type = propTypesModule.StringProp.jsonDecode(self.toastType)
	end
	if self.dismiss_prompt ~= nil then
		var1410.dismiss_prompt = propTypesModule.BoolProp.jsonDecode(self.dismiss_prompt)
	end
	if self.dismissPrompt ~= nil then
		var1410.dismiss_prompt = propTypesModule.BoolProp.jsonDecode(self.dismissPrompt)
	end
	if self.prompt_type ~= nil then
		var1410.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1410.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var1410.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1410.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	return var1410
end

t_39.descriptor = {
	name = "ShowToastAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ShowToastAction_Params = t_39
typeRegistryModule.default:register(t.ShowToastAction_Params)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p76) --[[ line: 11296 ]]
	-- upvalues: t (ref), t_40 (ref)
	return setmetatable({
		action_type = if p76 == nil or p76.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p76.action_type,
		action_params = if p76 == nil or p76.action_params == nil then nil else p76.action_params
	}, t_40)
end

function t_40:encode() --[[ line: 11307 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1412 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1413, var1414 = protoModule.writeTag(buff, var1412, 1, protoModule.wireTypes.varint)
		var1413, var1414 = protoModule.writeVarInt(var1413, var1414, t.ActionType.toNumber(self.action_type))
		buff = var1413
		var1412 = var1414
	end
	if self.action_params ~= nil then
		local var1415 = self.action_params:encode()
		local var1416, var1417 = protoModule.writeTag(buff, var1412, 2, protoModule.wireTypes.lengthDelimited)
		var1416, var1417 = protoModule.writeBuffer(var1416, var1417, var1415, buffer.len(var1415))
		buff = var1416
		var1412 = var1417
	end
	local buff_1 = buffer.create(var1412)
	buffer.copy(buff_1, 0, buff, 0, var1412)
	
	return buff_1
end

function t_40.decode(p77) --[[ line: 11333 ]]
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var1419 = t_40.new()
	local var1420 = 0
	while var1420 < buffer.len(p77) do
		local _ = nil
		local var1421 = nil
		local var1422, var1423, var1424 = protoModule.readTag(p77, var1420)
		local var1425 = var1422
		var1421 = var1423
		var1420 = var1424
		
		if var1421 == protoModule.wireTypes.varint then
			if var1425 == 1 then
				local _ = nil
				local var1426, var1427 = protoModule.readVarIntI32(p77, var1420)
				local var1428 = var1426
				var1420 = var1427
				var1419.action_type = t.ActionType.fromNumber(var1428) or var1428
			else
				local _ = nil
				local var1429, var1430 = protoModule.readVarInt(p77, var1420)
				local _ = var1429
				var1420 = var1430
			end
		end
		if var1421 == protoModule.wireTypes.lengthDelimited then
			if var1425 == 2 then
				local _ = nil
				local var1431, var1432 = protoModule.readBuffer(p77, var1420)
				var1420 = var1432
				var1419.action_params = t.OpenPhoneUpsellModalAction_Params.decode(var1431)
			else
				local _ = nil
				local var1433, var1434 = protoModule.readVarInt(p77, var1420)
				var1420 = var1434 + var1433
			end
		elseif var1421 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1435, var1436 = protoModule.readFixed32(p77, var1420)
			local _ = var1435
			var1420 = var1436
		elseif var1421 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1437, var1438 = protoModule.readFixed64(p77, var1420)
			local _ = var1437
			var1420 = var1438
		else
			error("Unsupported wire type: " .. var1421)
		end
	end
	return var1419
end

function t_40:jsonEncode() --[[ line: 11381 ]]
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

function t_40:jsonDecode() --[[ line: 11403 ]]
	-- upvalues: t_40 (ref), t (ref)
	local var1440 = t_40.new()
	
	if self.action_type ~= nil then
		var1440.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1440.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1440.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1440.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var1440
end

t_40.descriptor = {
	name = "OpenPhoneUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenPhoneUpsellModalAction"
}
t.OpenPhoneUpsellModalAction = t_40
typeRegistryModule.default:register(t.OpenPhoneUpsellModalAction)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p78) --[[ line: 11443 ]]
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

function t_41:encode() --[[ line: 11463 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1442 = 0
	
	if self.voice_opt_in ~= nil then
		local var1443 = self.voice_opt_in:encode()
		local var1444, var1445 = protoModule.writeTag(buff, var1442, 1, protoModule.wireTypes.lengthDelimited)
		var1444, var1445 = protoModule.writeBuffer(var1444, var1445, var1443, buffer.len(var1443))
		buff = var1444
		var1442 = var1445
	end
	if self.event_context ~= nil then
		local var1446 = self.event_context:encode()
		local var1447, var1448 = protoModule.writeTag(buff, var1442, 2, protoModule.wireTypes.lengthDelimited)
		var1447, var1448 = protoModule.writeBuffer(var1447, var1448, var1446, buffer.len(var1446))
		buff = var1447
		var1442 = var1448
	end
	if self.origin ~= nil then
		local var1449 = self.origin:encode()
		local var1450, var1451 = protoModule.writeTag(buff, var1442, 3, protoModule.wireTypes.lengthDelimited)
		var1450, var1451 = protoModule.writeBuffer(var1450, var1451, var1449, buffer.len(var1449))
		buff = var1450
		var1442 = var1451
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		local var1452 = self.should_autofill_android_phone_number_at_launch:encode()
		local var1453, var1454 = protoModule.writeTag(buff, var1442, 4, protoModule.wireTypes.lengthDelimited)
		var1453, var1454 = protoModule.writeBuffer(var1453, var1454, var1452, buffer.len(var1452))
		buff = var1453
		var1442 = var1454
	end
	if self.add_phone_description_key ~= nil then
		local var1455 = self.add_phone_description_key:encode()
		local var1456, var1457 = protoModule.writeTag(buff, var1442, 5, protoModule.wireTypes.lengthDelimited)
		var1456, var1457 = protoModule.writeBuffer(var1456, var1457, var1455, buffer.len(var1455))
		buff = var1456
		var1442 = var1457
	end
	if self.on_success ~= nil then
		local var1458 = self.on_success:encode()
		local var1459, var1460 = protoModule.writeTag(buff, var1442, 6, protoModule.wireTypes.lengthDelimited)
		var1459, var1460 = protoModule.writeBuffer(var1459, var1460, var1458, buffer.len(var1458))
		buff = var1459
		var1442 = var1460
	end
	if self.on_failure ~= nil then
		local var1461 = self.on_failure:encode()
		local var1462, var1463 = protoModule.writeTag(buff, var1442, 7, protoModule.wireTypes.lengthDelimited)
		var1462, var1463 = protoModule.writeBuffer(var1462, var1463, var1461, buffer.len(var1461))
		buff = var1462
		var1442 = var1463
	end
	if self.on_cancelled ~= nil then
		local var1464 = self.on_cancelled:encode()
		local var1465, var1466 = protoModule.writeTag(buff, var1442, 8, protoModule.wireTypes.lengthDelimited)
		var1465, var1466 = protoModule.writeBuffer(var1465, var1466, var1464, buffer.len(var1464))
		buff = var1465
		var1442 = var1466
	end
	local buff_1 = buffer.create(var1442)
	buffer.copy(buff_1, 0, buff, 0, var1442)
	
	return buff_1
end

function t_41.decode(p79) --[[ line: 11520 ]]
	-- upvalues: t_41 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1468 = t_41.new()
	local var1469 = 0
	while var1469 < buffer.len(p79) do
		local _ = nil
		local var1470 = nil
		local var1471, var1472, var1473 = protoModule.readTag(p79, var1469)
		local var1474 = var1471
		var1470 = var1472
		var1469 = var1473
		
		if var1470 == protoModule.wireTypes.varint then
			local _ = nil
			local var1475, var1476 = protoModule.readVarInt(p79, var1469)
			local _ = var1475
			var1469 = var1476
			continue
		end
		if var1470 == protoModule.wireTypes.lengthDelimited then
			if var1474 == 1 then
				local _ = nil
				local var1477, var1478 = protoModule.readBuffer(p79, var1469)
				var1469 = var1478
				var1468.voice_opt_in = propTypesModule.BoolProp.decode(var1477)
			elseif var1474 == 2 then
				local _ = nil
				local var1479, var1480 = protoModule.readBuffer(p79, var1469)
				var1469 = var1480
				var1468.event_context = propTypesModule.StringProp.decode(var1479)
			elseif var1474 == 3 then
				local _ = nil
				local var1481, var1482 = protoModule.readBuffer(p79, var1469)
				var1469 = var1482
				var1468.origin = propTypesModule.StringProp.decode(var1481)
			elseif var1474 == 4 then
				local _ = nil
				local var1483, var1484 = protoModule.readBuffer(p79, var1469)
				var1469 = var1484
				var1468.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.decode(var1483)
			elseif var1474 == 5 then
				local _ = nil
				local var1485, var1486 = protoModule.readBuffer(p79, var1469)
				var1469 = var1486
				var1468.add_phone_description_key = propTypesModule.StringProp.decode(var1485)
			elseif var1474 == 6 then
				local _ = nil
				local var1487, var1488 = protoModule.readBuffer(p79, var1469)
				var1469 = var1488
				var1468.on_success = t.ActionProp.decode(var1487)
			elseif var1474 == 7 then
				local _ = nil
				local var1489, var1490 = protoModule.readBuffer(p79, var1469)
				var1469 = var1490
				var1468.on_failure = t.ActionProp.decode(var1489)
			elseif var1474 == 8 then
				local _ = nil
				local var1491, var1492 = protoModule.readBuffer(p79, var1469)
				var1469 = var1492
				var1468.on_cancelled = t.ActionProp.decode(var1491)
			else
				local _ = nil
				local var1493, var1494 = protoModule.readVarInt(p79, var1469)
				var1469 = var1494 + var1493
			end
		elseif var1470 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1495, var1496 = protoModule.readFixed32(p79, var1469)
			local _ = var1495
			var1469 = var1496
		elseif var1470 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1497, var1498 = protoModule.readFixed64(p79, var1469)
			local _ = var1497
			var1469 = var1498
		else
			error("Unsupported wire type: " .. var1470)
		end
	end
	return var1468
end

function t_41:jsonEncode() --[[ line: 11600 ]]
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

function t_41:jsonDecode() --[[ line: 11639 ]]
	-- upvalues: t_41 (ref), propTypesModule (ref), t (ref)
	local var1500 = t_41.new()
	
	if self.voice_opt_in ~= nil then
		var1500.voice_opt_in = propTypesModule.BoolProp.jsonDecode(self.voice_opt_in)
	end
	if self.voiceOptIn ~= nil then
		var1500.voice_opt_in = propTypesModule.BoolProp.jsonDecode(self.voiceOptIn)
	end
	if self.event_context ~= nil then
		var1500.event_context = propTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		var1500.event_context = propTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		var1500.origin = propTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		var1500.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.jsonDecode(self.should_autofill_android_phone_number_at_launch)
	end
	if self.shouldAutofillAndroidPhoneNumberAtLaunch ~= nil then
		var1500.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.jsonDecode(self.shouldAutofillAndroidPhoneNumberAtLaunch)
	end
	if self.add_phone_description_key ~= nil then
		var1500.add_phone_description_key = propTypesModule.StringProp.jsonDecode(self.add_phone_description_key)
	end
	if self.addPhoneDescriptionKey ~= nil then
		var1500.add_phone_description_key = propTypesModule.StringProp.jsonDecode(self.addPhoneDescriptionKey)
	end
	if self.on_success ~= nil then
		var1500.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var1500.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var1500.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var1500.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	if self.on_cancelled ~= nil then
		var1500.on_cancelled = t.ActionProp.jsonDecode(self.on_cancelled)
	end
	if self.onCancelled ~= nil then
		var1500.on_cancelled = t.ActionProp.jsonDecode(self.onCancelled)
	end
	return var1500
end

t_41.descriptor = {
	name = "OpenPhoneUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenPhoneUpsellModalAction_Params = t_41
typeRegistryModule.default:register(t.OpenPhoneUpsellModalAction_Params)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p80) --[[ line: 11732 ]]
	-- upvalues: t (ref), t_42 (ref)
	return setmetatable({
		action_type = if p80 == nil or p80.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p80.action_type,
		action_params = if p80 == nil or p80.action_params == nil then nil else p80.action_params
	}, t_42)
end

function t_42:encode() --[[ line: 11743 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1502 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1503, var1504 = protoModule.writeTag(buff, var1502, 1, protoModule.wireTypes.varint)
		var1503, var1504 = protoModule.writeVarInt(var1503, var1504, t.ActionType.toNumber(self.action_type))
		buff = var1503
		var1502 = var1504
	end
	if self.action_params ~= nil then
		local var1505 = self.action_params:encode()
		local var1506, var1507 = protoModule.writeTag(buff, var1502, 2, protoModule.wireTypes.lengthDelimited)
		var1506, var1507 = protoModule.writeBuffer(var1506, var1507, var1505, buffer.len(var1505))
		buff = var1506
		var1502 = var1507
	end
	local buff_1 = buffer.create(var1502)
	buffer.copy(buff_1, 0, buff, 0, var1502)
	
	return buff_1
end

function t_42.decode(p81) --[[ line: 11769 ]]
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1509 = t_42.new()
	local var1510 = 0
	while var1510 < buffer.len(p81) do
		local _ = nil
		local var1511 = nil
		local var1512, var1513, var1514 = protoModule.readTag(p81, var1510)
		local var1515 = var1512
		var1511 = var1513
		var1510 = var1514
		
		if var1511 == protoModule.wireTypes.varint then
			if var1515 == 1 then
				local _ = nil
				local var1516, var1517 = protoModule.readVarIntI32(p81, var1510)
				local var1518 = var1516
				var1510 = var1517
				var1509.action_type = t.ActionType.fromNumber(var1518) or var1518
			else
				local _ = nil
				local var1519, var1520 = protoModule.readVarInt(p81, var1510)
				local _ = var1519
				var1510 = var1520
			end
		end
		if var1511 == protoModule.wireTypes.lengthDelimited then
			if var1515 == 2 then
				local _ = nil
				local var1521, var1522 = protoModule.readBuffer(p81, var1510)
				var1510 = var1522
				var1509.action_params = t.OpenEmailUpsellModalAction_Params.decode(var1521)
			else
				local _ = nil
				local var1523, var1524 = protoModule.readVarInt(p81, var1510)
				var1510 = var1524 + var1523
			end
		elseif var1511 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1525, var1526 = protoModule.readFixed32(p81, var1510)
			local _ = var1525
			var1510 = var1526
		elseif var1511 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1527, var1528 = protoModule.readFixed64(p81, var1510)
			local _ = var1527
			var1510 = var1528
		else
			error("Unsupported wire type: " .. var1511)
		end
	end
	return var1509
end

function t_42:jsonEncode() --[[ line: 11817 ]]
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

function t_42:jsonDecode() --[[ line: 11839 ]]
	-- upvalues: t_42 (ref), t (ref)
	local var1530 = t_42.new()
	
	if self.action_type ~= nil then
		var1530.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1530.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1530.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1530.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var1530
end

t_42.descriptor = {
	name = "OpenEmailUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenEmailUpsellModalAction"
}
t.OpenEmailUpsellModalAction = t_42
typeRegistryModule.default:register(t.OpenEmailUpsellModalAction)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p82) --[[ line: 11879 ]]
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

function t_43:encode() --[[ line: 11901 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1532 = 0
	
	if self.add_email_over13_text_key ~= nil then
		local var1533 = self.add_email_over13_text_key:encode()
		local var1534, var1535 = protoModule.writeTag(buff, var1532, 1, protoModule.wireTypes.lengthDelimited)
		var1534, var1535 = protoModule.writeBuffer(var1534, var1535, var1533, buffer.len(var1533))
		buff = var1534
		var1532 = var1535
	end
	if self.add_email_title_key ~= nil then
		local var1536 = self.add_email_title_key:encode()
		local var1537, var1538 = protoModule.writeTag(buff, var1532, 2, protoModule.wireTypes.lengthDelimited)
		var1537, var1538 = protoModule.writeBuffer(var1537, var1538, var1536, buffer.len(var1536))
		buff = var1537
		var1532 = var1538
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		local var1539 = self.is_email_modal_called_from_home_page:encode()
		local var1540, var1541 = protoModule.writeTag(buff, var1532, 3, protoModule.wireTypes.lengthDelimited)
		var1540, var1541 = protoModule.writeBuffer(var1540, var1541, var1539, buffer.len(var1539))
		buff = var1540
		var1532 = var1541
	end
	if self.event_context ~= nil then
		local var1542 = self.event_context:encode()
		local var1543, var1544 = protoModule.writeTag(buff, var1532, 4, protoModule.wireTypes.lengthDelimited)
		var1543, var1544 = protoModule.writeBuffer(var1543, var1544, var1542, buffer.len(var1542))
		buff = var1543
		var1532 = var1544
	end
	if self.origin ~= nil then
		local var1545 = self.origin:encode()
		local var1546, var1547 = protoModule.writeTag(buff, var1532, 5, protoModule.wireTypes.lengthDelimited)
		var1546, var1547 = protoModule.writeBuffer(var1546, var1547, var1545, buffer.len(var1545))
		buff = var1546
		var1532 = var1547
	end
	if self.section ~= nil then
		local var1548 = self.section:encode()
		local var1549, var1550 = protoModule.writeTag(buff, var1532, 6, protoModule.wireTypes.lengthDelimited)
		var1549, var1550 = protoModule.writeBuffer(var1549, var1550, var1548, buffer.len(var1548))
		buff = var1549
		var1532 = var1550
	end
	if self.on_success ~= nil then
		local var1551 = self.on_success:encode()
		local var1552, var1553 = protoModule.writeTag(buff, var1532, 7, protoModule.wireTypes.lengthDelimited)
		var1552, var1553 = protoModule.writeBuffer(var1552, var1553, var1551, buffer.len(var1551))
		buff = var1552
		var1532 = var1553
	end
	if self.on_failure ~= nil then
		local var1554 = self.on_failure:encode()
		local var1555, var1556 = protoModule.writeTag(buff, var1532, 8, protoModule.wireTypes.lengthDelimited)
		var1555, var1556 = protoModule.writeBuffer(var1555, var1556, var1554, buffer.len(var1554))
		buff = var1555
		var1532 = var1556
	end
	local buff_1 = buffer.create(var1532)
	buffer.copy(buff_1, 0, buff, 0, var1532)
	
	return buff_1
end

function t_43.decode(p83) --[[ line: 11958 ]]
	-- upvalues: t_43 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1558 = t_43.new()
	local var1559 = 0
	while var1559 < buffer.len(p83) do
		local _ = nil
		local var1560 = nil
		local var1561, var1562, var1563 = protoModule.readTag(p83, var1559)
		local var1564 = var1561
		var1560 = var1562
		var1559 = var1563
		
		if var1560 == protoModule.wireTypes.varint then
			local _ = nil
			local var1565, var1566 = protoModule.readVarInt(p83, var1559)
			local _ = var1565
			var1559 = var1566
			continue
		end
		if var1560 == protoModule.wireTypes.lengthDelimited then
			if var1564 == 1 then
				local _ = nil
				local var1567, var1568 = protoModule.readBuffer(p83, var1559)
				var1559 = var1568
				var1558.add_email_over13_text_key = propTypesModule.StringProp.decode(var1567)
			elseif var1564 == 2 then
				local _ = nil
				local var1569, var1570 = protoModule.readBuffer(p83, var1559)
				var1559 = var1570
				var1558.add_email_title_key = propTypesModule.StringProp.decode(var1569)
			elseif var1564 == 3 then
				local _ = nil
				local var1571, var1572 = protoModule.readBuffer(p83, var1559)
				var1559 = var1572
				var1558.is_email_modal_called_from_home_page = propTypesModule.BoolProp.decode(var1571)
			elseif var1564 == 4 then
				local _ = nil
				local var1573, var1574 = protoModule.readBuffer(p83, var1559)
				var1559 = var1574
				var1558.event_context = propTypesModule.StringProp.decode(var1573)
			elseif var1564 == 5 then
				local _ = nil
				local var1575, var1576 = protoModule.readBuffer(p83, var1559)
				var1559 = var1576
				var1558.origin = propTypesModule.StringProp.decode(var1575)
			elseif var1564 == 6 then
				local _ = nil
				local var1577, var1578 = protoModule.readBuffer(p83, var1559)
				var1559 = var1578
				var1558.section = propTypesModule.StringProp.decode(var1577)
			elseif var1564 == 7 then
				local _ = nil
				local var1579, var1580 = protoModule.readBuffer(p83, var1559)
				var1559 = var1580
				var1558.on_success = t.ActionProp.decode(var1579)
			elseif var1564 == 8 then
				local _ = nil
				local var1581, var1582 = protoModule.readBuffer(p83, var1559)
				var1559 = var1582
				var1558.on_failure = t.ActionProp.decode(var1581)
			else
				local _ = nil
				local var1583, var1584 = protoModule.readVarInt(p83, var1559)
				var1559 = var1584 + var1583
			end
		elseif var1560 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1585, var1586 = protoModule.readFixed32(p83, var1559)
			local _ = var1585
			var1559 = var1586
		elseif var1560 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1587, var1588 = protoModule.readFixed64(p83, var1559)
			local _ = var1587
			var1559 = var1588
		else
			error("Unsupported wire type: " .. var1560)
		end
	end
	return var1558
end

function t_43:jsonEncode() --[[ line: 12039 ]]
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

function t_43:jsonDecode() --[[ line: 12077 ]]
	-- upvalues: t_43 (ref), propTypesModule (ref), t (ref)
	local var1590 = t_43.new()
	
	if self.add_email_over13_text_key ~= nil then
		var1590.add_email_over13_text_key = propTypesModule.StringProp.jsonDecode(self.add_email_over13_text_key)
	end
	if self.addEmailOver13TextKey ~= nil then
		var1590.add_email_over13_text_key = propTypesModule.StringProp.jsonDecode(self.addEmailOver13TextKey)
	end
	if self.add_email_title_key ~= nil then
		var1590.add_email_title_key = propTypesModule.StringProp.jsonDecode(self.add_email_title_key)
	end
	if self.addEmailTitleKey ~= nil then
		var1590.add_email_title_key = propTypesModule.StringProp.jsonDecode(self.addEmailTitleKey)
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		var1590.is_email_modal_called_from_home_page = propTypesModule.BoolProp.jsonDecode(self.is_email_modal_called_from_home_page)
	end
	if self.isEmailModalCalledFromHomePage ~= nil then
		var1590.is_email_modal_called_from_home_page = propTypesModule.BoolProp.jsonDecode(self.isEmailModalCalledFromHomePage)
	end
	if self.event_context ~= nil then
		var1590.event_context = propTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		var1590.event_context = propTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		var1590.origin = propTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.section ~= nil then
		var1590.section = propTypesModule.StringProp.jsonDecode(self.section)
	end
	if self.on_success ~= nil then
		var1590.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var1590.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var1590.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var1590.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	return var1590
end

t_43.descriptor = {
	name = "OpenEmailUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenEmailUpsellModalAction_Params = t_43
typeRegistryModule.default:register(t.OpenEmailUpsellModalAction_Params)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p84) --[[ line: 12167 ]]
	-- upvalues: t (ref), t_44 (ref)
	return setmetatable({
		action_type = if p84 == nil or p84.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p84.action_type,
		action_params = if p84 == nil or p84.action_params == nil then nil else p84.action_params
	}, t_44)
end

function t_44:encode() --[[ line: 12178 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1592 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1593, var1594 = protoModule.writeTag(buff, var1592, 1, protoModule.wireTypes.varint)
		var1593, var1594 = protoModule.writeVarInt(var1593, var1594, t.ActionType.toNumber(self.action_type))
		buff = var1593
		var1592 = var1594
	end
	if self.action_params ~= nil then
		local var1595 = self.action_params:encode()
		local var1596, var1597 = protoModule.writeTag(buff, var1592, 2, protoModule.wireTypes.lengthDelimited)
		var1596, var1597 = protoModule.writeBuffer(var1596, var1597, var1595, buffer.len(var1595))
		buff = var1596
		var1592 = var1597
	end
	local buff_1 = buffer.create(var1592)
	buffer.copy(buff_1, 0, buff, 0, var1592)
	
	return buff_1
end

function t_44.decode(p85) --[[ line: 12204 ]]
	-- upvalues: t_44 (ref), protoModule (ref), t (ref)
	local var1599 = t_44.new()
	local var1600 = 0
	while var1600 < buffer.len(p85) do
		local _ = nil
		local var1601 = nil
		local var1602, var1603, var1604 = protoModule.readTag(p85, var1600)
		local var1605 = var1602
		var1601 = var1603
		var1600 = var1604
		
		if var1601 == protoModule.wireTypes.varint then
			if var1605 == 1 then
				local _ = nil
				local var1606, var1607 = protoModule.readVarIntI32(p85, var1600)
				local var1608 = var1606
				var1600 = var1607
				var1599.action_type = t.ActionType.fromNumber(var1608) or var1608
			else
				local _ = nil
				local var1609, var1610 = protoModule.readVarInt(p85, var1600)
				local _ = var1609
				var1600 = var1610
			end
		end
		if var1601 == protoModule.wireTypes.lengthDelimited then
			if var1605 == 2 then
				local _ = nil
				local var1611, var1612 = protoModule.readBuffer(p85, var1600)
				var1600 = var1612
				var1599.action_params = t.OpenAddConnectionsPageAction_Params.decode(var1611)
			else
				local _ = nil
				local var1613, var1614 = protoModule.readVarInt(p85, var1600)
				var1600 = var1614 + var1613
			end
		elseif var1601 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1615, var1616 = protoModule.readFixed32(p85, var1600)
			local _ = var1615
			var1600 = var1616
		elseif var1601 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1617, var1618 = protoModule.readFixed64(p85, var1600)
			local _ = var1617
			var1600 = var1618
		else
			error("Unsupported wire type: " .. var1601)
		end
	end
	return var1599
end

function t_44:jsonEncode() --[[ line: 12252 ]]
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

function t_44:jsonDecode() --[[ line: 12274 ]]
	-- upvalues: t_44 (ref), t (ref)
	local var1620 = t_44.new()
	
	if self.action_type ~= nil then
		var1620.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1620.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1620.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1620.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.actionParams)
	end
	return var1620
end

t_44.descriptor = {
	name = "OpenAddConnectionsPageAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAddConnectionsPageAction"
}
t.OpenAddConnectionsPageAction = t_44
typeRegistryModule.default:register(t.OpenAddConnectionsPageAction)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p86) --[[ line: 12314 ]]
	-- upvalues: t_45 (ref)
	return setmetatable({
		user_id = if p86 == nil or p86.user_id == nil then nil else p86.user_id,
		source = if p86 == nil or p86.source == nil then nil else p86.source
	}, t_45)
end

function t_45:encode() --[[ line: 12323 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1622 = 0
	
	if self.user_id ~= nil then
		local var1623 = self.user_id:encode()
		local var1624, var1625 = protoModule.writeTag(buff, var1622, 1, protoModule.wireTypes.lengthDelimited)
		var1624, var1625 = protoModule.writeBuffer(var1624, var1625, var1623, buffer.len(var1623))
		buff = var1624
		var1622 = var1625
	end
	if self.source ~= nil then
		local var1626 = self.source:encode()
		local var1627, var1628 = protoModule.writeTag(buff, var1622, 2, protoModule.wireTypes.lengthDelimited)
		var1627, var1628 = protoModule.writeBuffer(var1627, var1628, var1626, buffer.len(var1626))
		buff = var1627
		var1622 = var1628
	end
	local buff_1 = buffer.create(var1622)
	buffer.copy(buff_1, 0, buff, 0, var1622)
	
	return buff_1
end

function t_45.decode(p87) --[[ line: 12344 ]]
	-- upvalues: t_45 (ref), protoModule (ref), propTypesModule (ref)
	local var1630 = t_45.new()
	local var1631 = 0
	while var1631 < buffer.len(p87) do
		local _ = nil
		local var1632 = nil
		local var1633, var1634, var1635 = protoModule.readTag(p87, var1631)
		local var1636 = var1633
		var1632 = var1634
		var1631 = var1635
		
		if var1632 == protoModule.wireTypes.varint then
			local _ = nil
			local var1637, var1638 = protoModule.readVarInt(p87, var1631)
			local _ = var1637
			var1631 = var1638
			continue
		end
		if var1632 == protoModule.wireTypes.lengthDelimited then
			if var1636 == 1 then
				local _ = nil
				local var1639, var1640 = protoModule.readBuffer(p87, var1631)
				var1631 = var1640
				var1630.user_id = propTypesModule.StringProp.decode(var1639)
			elseif var1636 == 2 then
				local _ = nil
				local var1641, var1642 = protoModule.readBuffer(p87, var1631)
				var1631 = var1642
				var1630.source = propTypesModule.StringProp.decode(var1641)
			else
				local _ = nil
				local var1643, var1644 = protoModule.readVarInt(p87, var1631)
				var1631 = var1644 + var1643
			end
		elseif var1632 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1645, var1646 = protoModule.readFixed32(p87, var1631)
			local _ = var1645
			var1631 = var1646
		elseif var1632 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1647, var1648 = protoModule.readFixed64(p87, var1631)
			local _ = var1647
			var1631 = var1648
		else
			error("Unsupported wire type: " .. var1632)
		end
	end
	return var1630
end

function t_45:jsonEncode() --[[ line: 12392 ]]
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_45:jsonDecode() --[[ line: 12406 ]]
	-- upvalues: t_45 (ref), propTypesModule (ref)
	local var1650 = t_45.new()
	
	if self.user_id ~= nil then
		var1650.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1650.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var1650.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var1650
end

t_45.descriptor = {
	name = "OpenAddConnectionsPageAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAddConnectionsPageAction_Params = t_45
typeRegistryModule.default:register(t.OpenAddConnectionsPageAction_Params)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p88) --[[ line: 12440 ]]
	-- upvalues: t (ref), t_46 (ref)
	return setmetatable({
		action_type = if p88 == nil or p88.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p88.action_type,
		action_params = if p88 == nil or p88.action_params == nil then nil else p88.action_params
	}, t_46)
end

function t_46:encode() --[[ line: 12449 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1652 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1653, var1654 = protoModule.writeTag(buff, var1652, 1, protoModule.wireTypes.varint)
		var1653, var1654 = protoModule.writeVarInt(var1653, var1654, t.ActionType.toNumber(self.action_type))
		buff = var1653
		var1652 = var1654
	end
	if self.action_params ~= nil then
		local var1655 = self.action_params:encode()
		local var1656, var1657 = protoModule.writeTag(buff, var1652, 2, protoModule.wireTypes.lengthDelimited)
		var1656, var1657 = protoModule.writeBuffer(var1656, var1657, var1655, buffer.len(var1655))
		buff = var1656
		var1652 = var1657
	end
	local buff_1 = buffer.create(var1652)
	buffer.copy(buff_1, 0, buff, 0, var1652)
	
	return buff_1
end

function t_46.decode(p89) --[[ line: 12475 ]]
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var1659 = t_46.new()
	local var1660 = 0
	while var1660 < buffer.len(p89) do
		local _ = nil
		local var1661 = nil
		local var1662, var1663, var1664 = protoModule.readTag(p89, var1660)
		local var1665 = var1662
		var1661 = var1663
		var1660 = var1664
		
		if var1661 == protoModule.wireTypes.varint then
			if var1665 == 1 then
				local _ = nil
				local var1666, var1667 = protoModule.readVarIntI32(p89, var1660)
				local var1668 = var1666
				var1660 = var1667
				var1659.action_type = t.ActionType.fromNumber(var1668) or var1668
			else
				local _ = nil
				local var1669, var1670 = protoModule.readVarInt(p89, var1660)
				local _ = var1669
				var1660 = var1670
			end
		end
		if var1661 == protoModule.wireTypes.lengthDelimited then
			if var1665 == 2 then
				local _ = nil
				local var1671, var1672 = protoModule.readBuffer(p89, var1660)
				var1660 = var1672
				var1659.action_params = t.OpenMarketplaceAction_Params.decode(var1671)
			else
				local _ = nil
				local var1673, var1674 = protoModule.readVarInt(p89, var1660)
				var1660 = var1674 + var1673
			end
		elseif var1661 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1675, var1676 = protoModule.readFixed32(p89, var1660)
			local _ = var1675
			var1660 = var1676
		elseif var1661 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1677, var1678 = protoModule.readFixed64(p89, var1660)
			local _ = var1677
			var1660 = var1678
		else
			error("Unsupported wire type: " .. var1661)
		end
	end
	return var1659
end

function t_46:jsonEncode() --[[ line: 12523 ]]
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

function t_46:jsonDecode() --[[ line: 12545 ]]
	-- upvalues: t_46 (ref), t (ref)
	local var1680 = t_46.new()
	
	if self.action_type ~= nil then
		var1680.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1680.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1680.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1680.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.actionParams)
	end
	return var1680
end

t_46.descriptor = {
	name = "OpenMarketplaceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceAction"
}
t.OpenMarketplaceAction = t_46
typeRegistryModule.default:register(t.OpenMarketplaceAction)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p90) --[[ line: 12585 ]]
	-- upvalues: t_47 (ref)
	return setmetatable({
		user_id = if p90 == nil or p90.user_id == nil then nil else p90.user_id,
		source = if p90 == nil or p90.source == nil then nil else p90.source
	}, t_47)
end

function t_47:encode() --[[ line: 12594 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1682 = 0
	
	if self.user_id ~= nil then
		local var1683 = self.user_id:encode()
		local var1684, var1685 = protoModule.writeTag(buff, var1682, 1, protoModule.wireTypes.lengthDelimited)
		var1684, var1685 = protoModule.writeBuffer(var1684, var1685, var1683, buffer.len(var1683))
		buff = var1684
		var1682 = var1685
	end
	if self.source ~= nil then
		local var1686 = self.source:encode()
		local var1687, var1688 = protoModule.writeTag(buff, var1682, 2, protoModule.wireTypes.lengthDelimited)
		var1687, var1688 = protoModule.writeBuffer(var1687, var1688, var1686, buffer.len(var1686))
		buff = var1687
		var1682 = var1688
	end
	local buff_1 = buffer.create(var1682)
	buffer.copy(buff_1, 0, buff, 0, var1682)
	
	return buff_1
end

function t_47.decode(p91) --[[ line: 12615 ]]
	-- upvalues: t_47 (ref), protoModule (ref), propTypesModule (ref)
	local var1690 = t_47.new()
	local var1691 = 0
	while var1691 < buffer.len(p91) do
		local _ = nil
		local var1692 = nil
		local var1693, var1694, var1695 = protoModule.readTag(p91, var1691)
		local var1696 = var1693
		var1692 = var1694
		var1691 = var1695
		
		if var1692 == protoModule.wireTypes.varint then
			local _ = nil
			local var1697, var1698 = protoModule.readVarInt(p91, var1691)
			local _ = var1697
			var1691 = var1698
			continue
		end
		if var1692 == protoModule.wireTypes.lengthDelimited then
			if var1696 == 1 then
				local _ = nil
				local var1699, var1700 = protoModule.readBuffer(p91, var1691)
				var1691 = var1700
				var1690.user_id = propTypesModule.StringProp.decode(var1699)
			elseif var1696 == 2 then
				local _ = nil
				local var1701, var1702 = protoModule.readBuffer(p91, var1691)
				var1691 = var1702
				var1690.source = propTypesModule.StringProp.decode(var1701)
			else
				local _ = nil
				local var1703, var1704 = protoModule.readVarInt(p91, var1691)
				var1691 = var1704 + var1703
			end
		elseif var1692 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1705, var1706 = protoModule.readFixed32(p91, var1691)
			local _ = var1705
			var1691 = var1706
		elseif var1692 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1707, var1708 = protoModule.readFixed64(p91, var1691)
			local _ = var1707
			var1691 = var1708
		else
			error("Unsupported wire type: " .. var1692)
		end
	end
	return var1690
end

function t_47:jsonEncode() --[[ line: 12663 ]]
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_47:jsonDecode() --[[ line: 12677 ]]
	-- upvalues: t_47 (ref), propTypesModule (ref)
	local var1710 = t_47.new()
	
	if self.user_id ~= nil then
		var1710.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1710.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var1710.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var1710
end

t_47.descriptor = {
	name = "OpenMarketplaceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceAction_Params = t_47
typeRegistryModule.default:register(t.OpenMarketplaceAction_Params)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p92) --[[ line: 12709 ]]
	-- upvalues: t (ref), t_48 (ref)
	return setmetatable({
		action_type = if p92 == nil or p92.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p92.action_type,
		action_params = if p92 == nil or p92.action_params == nil then nil else p92.action_params
	}, t_48)
end

function t_48:encode() --[[ line: 12720 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1712 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1713, var1714 = protoModule.writeTag(buff, var1712, 1, protoModule.wireTypes.varint)
		var1713, var1714 = protoModule.writeVarInt(var1713, var1714, t.ActionType.toNumber(self.action_type))
		buff = var1713
		var1712 = var1714
	end
	if self.action_params ~= nil then
		local var1715 = self.action_params:encode()
		local var1716, var1717 = protoModule.writeTag(buff, var1712, 2, protoModule.wireTypes.lengthDelimited)
		var1716, var1717 = protoModule.writeBuffer(var1716, var1717, var1715, buffer.len(var1715))
		buff = var1716
		var1712 = var1717
	end
	local buff_1 = buffer.create(var1712)
	buffer.copy(buff_1, 0, buff, 0, var1712)
	
	return buff_1
end

function t_48.decode(p93) --[[ line: 12746 ]]
	-- upvalues: t_48 (ref), protoModule (ref), t (ref)
	local var1719 = t_48.new()
	local var1720 = 0
	while var1720 < buffer.len(p93) do
		local _ = nil
		local var1721 = nil
		local var1722, var1723, var1724 = protoModule.readTag(p93, var1720)
		local var1725 = var1722
		var1721 = var1723
		var1720 = var1724
		
		if var1721 == protoModule.wireTypes.varint then
			if var1725 == 1 then
				local _ = nil
				local var1726, var1727 = protoModule.readVarIntI32(p93, var1720)
				local var1728 = var1726
				var1720 = var1727
				var1719.action_type = t.ActionType.fromNumber(var1728) or var1728
			else
				local _ = nil
				local var1729, var1730 = protoModule.readVarInt(p93, var1720)
				local _ = var1729
				var1720 = var1730
			end
		end
		if var1721 == protoModule.wireTypes.lengthDelimited then
			if var1725 == 2 then
				local _ = nil
				local var1731, var1732 = protoModule.readBuffer(p93, var1720)
				var1720 = var1732
				var1719.action_params = t.HideProfileCompletionAction_Params.decode(var1731)
			else
				local _ = nil
				local var1733, var1734 = protoModule.readVarInt(p93, var1720)
				var1720 = var1734 + var1733
			end
		elseif var1721 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1735, var1736 = protoModule.readFixed32(p93, var1720)
			local _ = var1735
			var1720 = var1736
		elseif var1721 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1737, var1738 = protoModule.readFixed64(p93, var1720)
			local _ = var1737
			var1720 = var1738
		else
			error("Unsupported wire type: " .. var1721)
		end
	end
	return var1719
end

function t_48:jsonEncode() --[[ line: 12794 ]]
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

function t_48:jsonDecode() --[[ line: 12816 ]]
	-- upvalues: t_48 (ref), t (ref)
	local var1740 = t_48.new()
	
	if self.action_type ~= nil then
		var1740.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1740.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1740.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1740.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.actionParams)
	end
	return var1740
end

t_48.descriptor = {
	name = "HideProfileCompletionAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.HideProfileCompletionAction"
}
t.HideProfileCompletionAction = t_48
typeRegistryModule.default:register(t.HideProfileCompletionAction)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p94) --[[ line: 12856 ]]
	-- upvalues: t_49 (ref)
	return setmetatable({
		user_id = if p94 == nil or p94.user_id == nil then nil else p94.user_id,
		prompt_id = if p94 == nil or p94.prompt_id == nil then nil else p94.prompt_id,
		source = if p94 == nil or p94.source == nil then nil else p94.source,
		prompt_type = if p94 == nil or p94.prompt_type == nil then nil else p94.prompt_type
	}, t_49)
end

function t_49:encode() --[[ line: 12867 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1742 = 0
	
	if self.user_id ~= nil then
		local var1743 = self.user_id:encode()
		local var1744, var1745 = protoModule.writeTag(buff, var1742, 1, protoModule.wireTypes.lengthDelimited)
		var1744, var1745 = protoModule.writeBuffer(var1744, var1745, var1743, buffer.len(var1743))
		buff = var1744
		var1742 = var1745
	end
	if self.prompt_id ~= nil then
		local var1746 = self.prompt_id:encode()
		local var1747, var1748 = protoModule.writeTag(buff, var1742, 2, protoModule.wireTypes.lengthDelimited)
		var1747, var1748 = protoModule.writeBuffer(var1747, var1748, var1746, buffer.len(var1746))
		buff = var1747
		var1742 = var1748
	end
	if self.source ~= nil then
		local var1749 = self.source:encode()
		local var1750, var1751 = protoModule.writeTag(buff, var1742, 3, protoModule.wireTypes.lengthDelimited)
		var1750, var1751 = protoModule.writeBuffer(var1750, var1751, var1749, buffer.len(var1749))
		buff = var1750
		var1742 = var1751
	end
	if self.prompt_type ~= nil then
		local var1752 = self.prompt_type:encode()
		local var1753, var1754 = protoModule.writeTag(buff, var1742, 4, protoModule.wireTypes.lengthDelimited)
		var1753, var1754 = protoModule.writeBuffer(var1753, var1754, var1752, buffer.len(var1752))
		buff = var1753
		var1742 = var1754
	end
	local buff_1 = buffer.create(var1742)
	buffer.copy(buff_1, 0, buff, 0, var1742)
	
	return buff_1
end

function t_49.decode(p95) --[[ line: 12900 ]]
	-- upvalues: t_49 (ref), protoModule (ref), propTypesModule (ref)
	local var1756 = t_49.new()
	local var1757 = 0
	while var1757 < buffer.len(p95) do
		local _ = nil
		local var1758 = nil
		local var1759, var1760, var1761 = protoModule.readTag(p95, var1757)
		local var1762 = var1759
		var1758 = var1760
		var1757 = var1761
		
		if var1758 == protoModule.wireTypes.varint then
			local _ = nil
			local var1763, var1764 = protoModule.readVarInt(p95, var1757)
			local _ = var1763
			var1757 = var1764
			continue
		end
		if var1758 == protoModule.wireTypes.lengthDelimited then
			if var1762 == 1 then
				local _ = nil
				local var1765, var1766 = protoModule.readBuffer(p95, var1757)
				var1757 = var1766
				var1756.user_id = propTypesModule.StringProp.decode(var1765)
			elseif var1762 == 2 then
				local _ = nil
				local var1767, var1768 = protoModule.readBuffer(p95, var1757)
				var1757 = var1768
				var1756.prompt_id = propTypesModule.StringProp.decode(var1767)
			elseif var1762 == 3 then
				local _ = nil
				local var1769, var1770 = protoModule.readBuffer(p95, var1757)
				var1757 = var1770
				var1756.source = propTypesModule.StringProp.decode(var1769)
			elseif var1762 == 4 then
				local _ = nil
				local var1771, var1772 = protoModule.readBuffer(p95, var1757)
				var1757 = var1772
				var1756.prompt_type = propTypesModule.StringProp.decode(var1771)
			else
				local _ = nil
				local var1773, var1774 = protoModule.readVarInt(p95, var1757)
				var1757 = var1774 + var1773
			end
		elseif var1758 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1775, var1776 = protoModule.readFixed32(p95, var1757)
			local _ = var1775
			var1757 = var1776
		elseif var1758 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1777, var1778 = protoModule.readFixed64(p95, var1757)
			local _ = var1777
			var1757 = var1778
		else
			error("Unsupported wire type: " .. var1758)
		end
	end
	return var1756
end

function t_49:jsonEncode() --[[ line: 12958 ]]
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

function t_49:jsonDecode() --[[ line: 12980 ]]
	-- upvalues: t_49 (ref), propTypesModule (ref)
	local var1780 = t_49.new()
	
	if self.user_id ~= nil then
		var1780.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1780.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.prompt_id ~= nil then
		var1780.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1780.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.source ~= nil then
		var1780.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.prompt_type ~= nil then
		var1780.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1780.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	return var1780
end

t_49.descriptor = {
	name = "HideProfileCompletionAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.HideProfileCompletionAction_Params = t_49
typeRegistryModule.default:register(t.HideProfileCompletionAction_Params)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p96) --[[ line: 13031 ]]
	-- upvalues: t (ref), t_50 (ref)
	return setmetatable({
		action_type = if p96 == nil or p96.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p96.action_type,
		action_params = if p96 == nil or p96.action_params == nil then nil else p96.action_params
	}, t_50)
end

function t_50:encode() --[[ line: 13042 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1782 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1783, var1784 = protoModule.writeTag(buff, var1782, 1, protoModule.wireTypes.varint)
		var1783, var1784 = protoModule.writeVarInt(var1783, var1784, t.ActionType.toNumber(self.action_type))
		buff = var1783
		var1782 = var1784
	end
	if self.action_params ~= nil then
		local var1785 = self.action_params:encode()
		local var1786, var1787 = protoModule.writeTag(buff, var1782, 2, protoModule.wireTypes.lengthDelimited)
		var1786, var1787 = protoModule.writeBuffer(var1786, var1787, var1785, buffer.len(var1785))
		buff = var1786
		var1782 = var1787
	end
	local buff_1 = buffer.create(var1782)
	buffer.copy(buff_1, 0, buff, 0, var1782)
	
	return buff_1
end

function t_50.decode(p97) --[[ line: 13068 ]]
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var1789 = t_50.new()
	local var1790 = 0
	while var1790 < buffer.len(p97) do
		local _ = nil
		local var1791 = nil
		local var1792, var1793, var1794 = protoModule.readTag(p97, var1790)
		local var1795 = var1792
		var1791 = var1793
		var1790 = var1794
		
		if var1791 == protoModule.wireTypes.varint then
			if var1795 == 1 then
				local _ = nil
				local var1796, var1797 = protoModule.readVarIntI32(p97, var1790)
				local var1798 = var1796
				var1790 = var1797
				var1789.action_type = t.ActionType.fromNumber(var1798) or var1798
			else
				local _ = nil
				local var1799, var1800 = protoModule.readVarInt(p97, var1790)
				local _ = var1799
				var1790 = var1800
			end
		end
		if var1791 == protoModule.wireTypes.lengthDelimited then
			if var1795 == 2 then
				local _ = nil
				local var1801, var1802 = protoModule.readBuffer(p97, var1790)
				var1790 = var1802
				var1789.action_params = t.SelectMarketplaceCatalogCategory_Params.decode(var1801)
			else
				local _ = nil
				local var1803, var1804 = protoModule.readVarInt(p97, var1790)
				var1790 = var1804 + var1803
			end
		elseif var1791 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1805, var1806 = protoModule.readFixed32(p97, var1790)
			local _ = var1805
			var1790 = var1806
		elseif var1791 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1807, var1808 = protoModule.readFixed64(p97, var1790)
			local _ = var1807
			var1790 = var1808
		else
			error("Unsupported wire type: " .. var1791)
		end
	end
	return var1789
end

function t_50:jsonEncode() --[[ line: 13116 ]]
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

function t_50:jsonDecode() --[[ line: 13138 ]]
	-- upvalues: t_50 (ref), t (ref)
	local var1810 = t_50.new()
	
	if self.action_type ~= nil then
		var1810.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1810.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1810.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1810.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.actionParams)
	end
	return var1810
end

t_50.descriptor = {
	name = "SelectMarketplaceCatalogCategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogCategory"
}
t.SelectMarketplaceCatalogCategory = t_50
typeRegistryModule.default:register(t.SelectMarketplaceCatalogCategory)
local t_51 = {}
t_51.__index = t_51

function t_51.new(p98) --[[ line: 13180 ]]
	-- upvalues: t_51 (ref)
	return setmetatable({
		category_id = if p98 == nil or p98.category_id == nil then nil else p98.category_id
	}, t_51)
end

function t_51:encode() --[[ line: 13188 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1812 = 0
	
	if self.category_id ~= nil then
		local var1813 = self.category_id:encode()
		local var1814, var1815 = protoModule.writeTag(buff, var1812, 1, protoModule.wireTypes.lengthDelimited)
		var1814, var1815 = protoModule.writeBuffer(var1814, var1815, var1813, buffer.len(var1813))
		buff = var1814
		var1812 = var1815
	end
	local buff_1 = buffer.create(var1812)
	buffer.copy(buff_1, 0, buff, 0, var1812)
	
	return buff_1
end

function t_51.decode(p99) --[[ line: 13203 ]]
	-- upvalues: t_51 (ref), protoModule (ref), propTypesModule (ref)
	local var1817 = t_51.new()
	local var1818 = 0
	while var1818 < buffer.len(p99) do
		local _ = nil
		local var1819 = nil
		local var1820, var1821, var1822 = protoModule.readTag(p99, var1818)
		local var1823 = var1820
		var1819 = var1821
		var1818 = var1822
		
		if var1819 == protoModule.wireTypes.varint then
			local _ = nil
			local var1824, var1825 = protoModule.readVarInt(p99, var1818)
			local _ = var1824
			var1818 = var1825
			continue
		end
		if var1819 == protoModule.wireTypes.lengthDelimited then
			if var1823 == 1 then
				local _ = nil
				local var1826, var1827 = protoModule.readBuffer(p99, var1818)
				var1818 = var1827
				var1817.category_id = propTypesModule.StringProp.decode(var1826)
			else
				local _ = nil
				local var1828, var1829 = protoModule.readVarInt(p99, var1818)
				var1818 = var1829 + var1828
			end
		elseif var1819 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1830, var1831 = protoModule.readFixed32(p99, var1818)
			local _ = var1830
			var1818 = var1831
		elseif var1819 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1832, var1833 = protoModule.readFixed64(p99, var1818)
			local _ = var1832
			var1818 = var1833
		else
			error("Unsupported wire type: " .. var1819)
		end
	end
	return var1817
end

function t_51:jsonEncode() --[[ line: 13246 ]]
	local t = {}
	
	if self.category_id ~= nil then
		t.categoryId = self.category_id:jsonEncode()
	end
	return t
end

function t_51:jsonDecode() --[[ line: 13256 ]]
	-- upvalues: t_51 (ref), propTypesModule (ref)
	local var1835 = t_51.new()
	
	if self.category_id ~= nil then
		var1835.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var1835.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	return var1835
end

t_51.descriptor = {
	name = "SelectMarketplaceCatalogCategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceCatalogCategory_Params = t_51
typeRegistryModule.default:register(t.SelectMarketplaceCatalogCategory_Params)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p100) --[[ line: 13287 ]]
	-- upvalues: t (ref), t_52 (ref)
	return setmetatable({
		action_type = if p100 == nil or p100.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p100.action_type,
		action_params = if p100 == nil or p100.action_params == nil then nil else p100.action_params
	}, t_52)
end

function t_52:encode() --[[ line: 13298 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1837 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1838, var1839 = protoModule.writeTag(buff, var1837, 1, protoModule.wireTypes.varint)
		var1838, var1839 = protoModule.writeVarInt(var1838, var1839, t.ActionType.toNumber(self.action_type))
		buff = var1838
		var1837 = var1839
	end
	if self.action_params ~= nil then
		local var1840 = self.action_params:encode()
		local var1841, var1842 = protoModule.writeTag(buff, var1837, 2, protoModule.wireTypes.lengthDelimited)
		var1841, var1842 = protoModule.writeBuffer(var1841, var1842, var1840, buffer.len(var1840))
		buff = var1841
		var1837 = var1842
	end
	local buff_1 = buffer.create(var1837)
	buffer.copy(buff_1, 0, buff, 0, var1837)
	
	return buff_1
end

function t_52.decode(p101) --[[ line: 13324 ]]
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1844 = t_52.new()
	local var1845 = 0
	while var1845 < buffer.len(p101) do
		local _ = nil
		local var1846 = nil
		local var1847, var1848, var1849 = protoModule.readTag(p101, var1845)
		local var1850 = var1847
		var1846 = var1848
		var1845 = var1849
		
		if var1846 == protoModule.wireTypes.varint then
			if var1850 == 1 then
				local _ = nil
				local var1851, var1852 = protoModule.readVarIntI32(p101, var1845)
				local var1853 = var1851
				var1845 = var1852
				var1844.action_type = t.ActionType.fromNumber(var1853) or var1853
			else
				local _ = nil
				local var1854, var1855 = protoModule.readVarInt(p101, var1845)
				local _ = var1854
				var1845 = var1855
			end
		end
		if var1846 == protoModule.wireTypes.lengthDelimited then
			if var1850 == 2 then
				local _ = nil
				local var1856, var1857 = protoModule.readBuffer(p101, var1845)
				var1845 = var1857
				var1844.action_params = t.SelectMarketplaceCatalogSubcategory_Params.decode(var1856)
			else
				local _ = nil
				local var1858, var1859 = protoModule.readVarInt(p101, var1845)
				var1845 = var1859 + var1858
			end
		elseif var1846 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1860, var1861 = protoModule.readFixed32(p101, var1845)
			local _ = var1860
			var1845 = var1861
		elseif var1846 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1862, var1863 = protoModule.readFixed64(p101, var1845)
			local _ = var1862
			var1845 = var1863
		else
			error("Unsupported wire type: " .. var1846)
		end
	end
	return var1844
end

function t_52:jsonEncode() --[[ line: 13372 ]]
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

function t_52:jsonDecode() --[[ line: 13394 ]]
	-- upvalues: t_52 (ref), t (ref)
	local var1865 = t_52.new()
	
	if self.action_type ~= nil then
		var1865.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1865.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1865.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1865.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.actionParams)
	end
	return var1865
end

t_52.descriptor = {
	name = "SelectMarketplaceCatalogSubcategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogSubcategory"
}
t.SelectMarketplaceCatalogSubcategory = t_52
typeRegistryModule.default:register(t.SelectMarketplaceCatalogSubcategory)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p102) --[[ line: 13436 ]]
	-- upvalues: t_53 (ref)
	return setmetatable({
		subcategory_id = if p102 == nil or p102.subcategory_id == nil then nil else p102.subcategory_id
	}, t_53)
end

function t_53:encode() --[[ line: 13444 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1867 = 0
	
	if self.subcategory_id ~= nil then
		local var1868 = self.subcategory_id:encode()
		local var1869, var1870 = protoModule.writeTag(buff, var1867, 1, protoModule.wireTypes.lengthDelimited)
		var1869, var1870 = protoModule.writeBuffer(var1869, var1870, var1868, buffer.len(var1868))
		buff = var1869
		var1867 = var1870
	end
	local buff_1 = buffer.create(var1867)
	buffer.copy(buff_1, 0, buff, 0, var1867)
	
	return buff_1
end

function t_53.decode(p103) --[[ line: 13461 ]]
	-- upvalues: t_53 (ref), protoModule (ref), propTypesModule (ref)
	local var1872 = t_53.new()
	local var1873 = 0
	while var1873 < buffer.len(p103) do
		local _ = nil
		local var1874 = nil
		local var1875, var1876, var1877 = protoModule.readTag(p103, var1873)
		local var1878 = var1875
		var1874 = var1876
		var1873 = var1877
		
		if var1874 == protoModule.wireTypes.varint then
			local _ = nil
			local var1879, var1880 = protoModule.readVarInt(p103, var1873)
			local _ = var1879
			var1873 = var1880
			continue
		end
		if var1874 == protoModule.wireTypes.lengthDelimited then
			if var1878 == 1 then
				local _ = nil
				local var1881, var1882 = protoModule.readBuffer(p103, var1873)
				var1873 = var1882
				var1872.subcategory_id = propTypesModule.StringProp.decode(var1881)
			else
				local _ = nil
				local var1883, var1884 = protoModule.readVarInt(p103, var1873)
				var1873 = var1884 + var1883
			end
		elseif var1874 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1885, var1886 = protoModule.readFixed32(p103, var1873)
			local _ = var1885
			var1873 = var1886
		elseif var1874 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1887, var1888 = protoModule.readFixed64(p103, var1873)
			local _ = var1887
			var1873 = var1888
		else
			error("Unsupported wire type: " .. var1874)
		end
	end
	return var1872
end

function t_53:jsonEncode() --[[ line: 13506 ]]
	local t = {}
	
	if self.subcategory_id ~= nil then
		t.subcategoryId = self.subcategory_id:jsonEncode()
	end
	return t
end

function t_53:jsonDecode() --[[ line: 13518 ]]
	-- upvalues: t_53 (ref), propTypesModule (ref)
	local var1890 = t_53.new()
	
	if self.subcategory_id ~= nil then
		var1890.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var1890.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	return var1890
end

t_53.descriptor = {
	name = "SelectMarketplaceCatalogSubcategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceCatalogSubcategory_Params = t_53
typeRegistryModule.default:register(t.SelectMarketplaceCatalogSubcategory_Params)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p104) --[[ line: 13550 ]]
	-- upvalues: t (ref), t_54 (ref)
	return setmetatable({
		action_type = if p104 == nil or p104.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p104.action_type,
		action_params = if p104 == nil or p104.action_params == nil then nil else p104.action_params
	}, t_54)
end

function t_54:encode() --[[ line: 13561 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1892 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1893, var1894 = protoModule.writeTag(buff, var1892, 1, protoModule.wireTypes.varint)
		var1893, var1894 = protoModule.writeVarInt(var1893, var1894, t.ActionType.toNumber(self.action_type))
		buff = var1893
		var1892 = var1894
	end
	if self.action_params ~= nil then
		local var1895 = self.action_params:encode()
		local var1896, var1897 = protoModule.writeTag(buff, var1892, 2, protoModule.wireTypes.lengthDelimited)
		var1896, var1897 = protoModule.writeBuffer(var1896, var1897, var1895, buffer.len(var1895))
		buff = var1896
		var1892 = var1897
	end
	local buff_1 = buffer.create(var1892)
	buffer.copy(buff_1, 0, buff, 0, var1892)
	
	return buff_1
end

function t_54.decode(p105) --[[ line: 13587 ]]
	-- upvalues: t_54 (ref), protoModule (ref), t (ref)
	local var1899 = t_54.new()
	local var1900 = 0
	while var1900 < buffer.len(p105) do
		local _ = nil
		local var1901 = nil
		local var1902, var1903, var1904 = protoModule.readTag(p105, var1900)
		local var1905 = var1902
		var1901 = var1903
		var1900 = var1904
		
		if var1901 == protoModule.wireTypes.varint then
			if var1905 == 1 then
				local _ = nil
				local var1906, var1907 = protoModule.readVarIntI32(p105, var1900)
				local var1908 = var1906
				var1900 = var1907
				var1899.action_type = t.ActionType.fromNumber(var1908) or var1908
			else
				local _ = nil
				local var1909, var1910 = protoModule.readVarInt(p105, var1900)
				local _ = var1909
				var1900 = var1910
			end
		end
		if var1901 == protoModule.wireTypes.lengthDelimited then
			if var1905 == 2 then
				local _ = nil
				local var1911, var1912 = protoModule.readBuffer(p105, var1900)
				var1900 = var1912
				var1899.action_params = t.OpenMarketplaceCatalogSeeAll_Params.decode(var1911)
			else
				local _ = nil
				local var1913, var1914 = protoModule.readVarInt(p105, var1900)
				var1900 = var1914 + var1913
			end
		elseif var1901 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1915, var1916 = protoModule.readFixed32(p105, var1900)
			local _ = var1915
			var1900 = var1916
		elseif var1901 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1917, var1918 = protoModule.readFixed64(p105, var1900)
			local _ = var1917
			var1900 = var1918
		else
			error("Unsupported wire type: " .. var1901)
		end
	end
	return var1899
end

function t_54:jsonEncode() --[[ line: 13635 ]]
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

function t_54:jsonDecode() --[[ line: 13657 ]]
	-- upvalues: t_54 (ref), t (ref)
	local var1920 = t_54.new()
	
	if self.action_type ~= nil then
		var1920.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1920.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1920.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1920.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.actionParams)
	end
	return var1920
end

t_54.descriptor = {
	name = "OpenMarketplaceCatalogSeeAll",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogSeeAll"
}
t.OpenMarketplaceCatalogSeeAll = t_54
typeRegistryModule.default:register(t.OpenMarketplaceCatalogSeeAll)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p106) --[[ line: 13697 ]]
	-- upvalues: t_55 (ref)
	return setmetatable({
		sort_id = if p106 == nil or p106.sort_id == nil then nil else p106.sort_id,
		title = if p106 == nil or p106.title == nil then nil else p106.title,
		description = if p106 == nil or p106.description == nil then nil else p106.description,
		tooltip_text = if p106 == nil or p106.tooltip_text == nil then nil else p106.tooltip_text
	}, t_55)
end

function t_55:encode() --[[ line: 13708 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1922 = 0
	
	if self.sort_id ~= nil then
		local var1923 = self.sort_id:encode()
		local var1924, var1925 = protoModule.writeTag(buff, var1922, 1, protoModule.wireTypes.lengthDelimited)
		var1924, var1925 = protoModule.writeBuffer(var1924, var1925, var1923, buffer.len(var1923))
		buff = var1924
		var1922 = var1925
	end
	if self.title ~= nil then
		local var1926 = self.title:encode()
		local var1927, var1928 = protoModule.writeTag(buff, var1922, 2, protoModule.wireTypes.lengthDelimited)
		var1927, var1928 = protoModule.writeBuffer(var1927, var1928, var1926, buffer.len(var1926))
		buff = var1927
		var1922 = var1928
	end
	if self.description ~= nil then
		local var1929 = self.description:encode()
		local var1930, var1931 = protoModule.writeTag(buff, var1922, 3, protoModule.wireTypes.lengthDelimited)
		var1930, var1931 = protoModule.writeBuffer(var1930, var1931, var1929, buffer.len(var1929))
		buff = var1930
		var1922 = var1931
	end
	if self.tooltip_text ~= nil then
		local var1932 = self.tooltip_text:encode()
		local var1933, var1934 = protoModule.writeTag(buff, var1922, 4, protoModule.wireTypes.lengthDelimited)
		var1933, var1934 = protoModule.writeBuffer(var1933, var1934, var1932, buffer.len(var1932))
		buff = var1933
		var1922 = var1934
	end
	local buff_1 = buffer.create(var1922)
	buffer.copy(buff_1, 0, buff, 0, var1922)
	
	return buff_1
end

function t_55.decode(p107) --[[ line: 13741 ]]
	-- upvalues: t_55 (ref), protoModule (ref), propTypesModule (ref)
	local var1936 = t_55.new()
	local var1937 = 0
	while var1937 < buffer.len(p107) do
		local _ = nil
		local var1938 = nil
		local var1939, var1940, var1941 = protoModule.readTag(p107, var1937)
		local var1942 = var1939
		var1938 = var1940
		var1937 = var1941
		
		if var1938 == protoModule.wireTypes.varint then
			local _ = nil
			local var1943, var1944 = protoModule.readVarInt(p107, var1937)
			local _ = var1943
			var1937 = var1944
			continue
		end
		if var1938 == protoModule.wireTypes.lengthDelimited then
			if var1942 == 1 then
				local _ = nil
				local var1945, var1946 = protoModule.readBuffer(p107, var1937)
				var1937 = var1946
				var1936.sort_id = propTypesModule.StringProp.decode(var1945)
			elseif var1942 == 2 then
				local _ = nil
				local var1947, var1948 = protoModule.readBuffer(p107, var1937)
				var1937 = var1948
				var1936.title = propTypesModule.StringProp.decode(var1947)
			elseif var1942 == 3 then
				local _ = nil
				local var1949, var1950 = protoModule.readBuffer(p107, var1937)
				var1937 = var1950
				var1936.description = propTypesModule.StringProp.decode(var1949)
			elseif var1942 == 4 then
				local _ = nil
				local var1951, var1952 = protoModule.readBuffer(p107, var1937)
				var1937 = var1952
				var1936.tooltip_text = propTypesModule.StringProp.decode(var1951)
			else
				local _ = nil
				local var1953, var1954 = protoModule.readVarInt(p107, var1937)
				var1937 = var1954 + var1953
			end
		elseif var1938 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1955, var1956 = protoModule.readFixed32(p107, var1937)
			local _ = var1955
			var1937 = var1956
		elseif var1938 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1957, var1958 = protoModule.readFixed64(p107, var1937)
			local _ = var1957
			var1937 = var1958
		else
			error("Unsupported wire type: " .. var1938)
		end
	end
	return var1936
end

function t_55:jsonEncode() --[[ line: 13799 ]]
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

function t_55:jsonDecode() --[[ line: 13821 ]]
	-- upvalues: t_55 (ref), propTypesModule (ref)
	local var1960 = t_55.new()
	
	if self.sort_id ~= nil then
		var1960.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var1960.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.title ~= nil then
		var1960.title = propTypesModule.StringProp.jsonDecode(self.title)
	end
	if self.description ~= nil then
		var1960.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.tooltip_text ~= nil then
		var1960.tooltip_text = propTypesModule.StringProp.jsonDecode(self.tooltip_text)
	end
	if self.tooltipText ~= nil then
		var1960.tooltip_text = propTypesModule.StringProp.jsonDecode(self.tooltipText)
	end
	return var1960
end

t_55.descriptor = {
	name = "OpenMarketplaceCatalogSeeAll_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceCatalogSeeAll_Params = t_55
typeRegistryModule.default:register(t.OpenMarketplaceCatalogSeeAll_Params)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p108) --[[ line: 13870 ]]
	-- upvalues: t (ref), t_56 (ref)
	return setmetatable({
		action_type = if p108 == nil or p108.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p108.action_type,
		action_params = if p108 == nil or p108.action_params == nil then nil else p108.action_params
	}, t_56)
end

function t_56:encode() --[[ line: 13881 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1962 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1963, var1964 = protoModule.writeTag(buff, var1962, 1, protoModule.wireTypes.varint)
		var1963, var1964 = protoModule.writeVarInt(var1963, var1964, t.ActionType.toNumber(self.action_type))
		buff = var1963
		var1962 = var1964
	end
	if self.action_params ~= nil then
		local var1965 = self.action_params:encode()
		local var1966, var1967 = protoModule.writeTag(buff, var1962, 2, protoModule.wireTypes.lengthDelimited)
		var1966, var1967 = protoModule.writeBuffer(var1966, var1967, var1965, buffer.len(var1965))
		buff = var1966
		var1962 = var1967
	end
	local buff_1 = buffer.create(var1962)
	buffer.copy(buff_1, 0, buff, 0, var1962)
	
	return buff_1
end

function t_56.decode(p109) --[[ line: 13907 ]]
	-- upvalues: t_56 (ref), protoModule (ref), t (ref)
	local var1969 = t_56.new()
	local var1970 = 0
	while var1970 < buffer.len(p109) do
		local _ = nil
		local var1971 = nil
		local var1972, var1973, var1974 = protoModule.readTag(p109, var1970)
		local var1975 = var1972
		var1971 = var1973
		var1970 = var1974
		
		if var1971 == protoModule.wireTypes.varint then
			if var1975 == 1 then
				local _ = nil
				local var1976, var1977 = protoModule.readVarIntI32(p109, var1970)
				local var1978 = var1976
				var1970 = var1977
				var1969.action_type = t.ActionType.fromNumber(var1978) or var1978
			else
				local _ = nil
				local var1979, var1980 = protoModule.readVarInt(p109, var1970)
				local _ = var1979
				var1970 = var1980
			end
		end
		if var1971 == protoModule.wireTypes.lengthDelimited then
			if var1975 == 2 then
				local _ = nil
				local var1981, var1982 = protoModule.readBuffer(p109, var1970)
				var1970 = var1982
				var1969.action_params = t.CloseMarketplaceCategoryTooltip_Params.decode(var1981)
			else
				local _ = nil
				local var1983, var1984 = protoModule.readVarInt(p109, var1970)
				var1970 = var1984 + var1983
			end
		elseif var1971 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1985, var1986 = protoModule.readFixed32(p109, var1970)
			local _ = var1985
			var1970 = var1986
		elseif var1971 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1987, var1988 = protoModule.readFixed64(p109, var1970)
			local _ = var1987
			var1970 = var1988
		else
			error("Unsupported wire type: " .. var1971)
		end
	end
	return var1969
end

function t_56:jsonEncode() --[[ line: 13955 ]]
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

function t_56:jsonDecode() --[[ line: 13977 ]]
	-- upvalues: t_56 (ref), t (ref)
	local var1990 = t_56.new()
	
	if self.action_type ~= nil then
		var1990.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1990.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1990.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1990.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.actionParams)
	end
	return var1990
end

t_56.descriptor = {
	name = "CloseMarketplaceCategoryTooltip",
	fullName = "roblox.apppageplatform.shared.v1beta1.CloseMarketplaceCategoryTooltip"
}
t.CloseMarketplaceCategoryTooltip = t_56
typeRegistryModule.default:register(t.CloseMarketplaceCategoryTooltip)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p110) --[[ line: 14017 ]]
	-- upvalues: t_57 (ref)
	return setmetatable({
		tooltip_id = if p110 == nil or p110.tooltip_id == nil then nil else p110.tooltip_id
	}, t_57)
end

function t_57:encode() --[[ line: 14025 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1992 = 0
	
	if self.tooltip_id ~= nil then
		local var1993 = self.tooltip_id:encode()
		local var1994, var1995 = protoModule.writeTag(buff, var1992, 1, protoModule.wireTypes.lengthDelimited)
		var1994, var1995 = protoModule.writeBuffer(var1994, var1995, var1993, buffer.len(var1993))
		buff = var1994
		var1992 = var1995
	end
	local buff_1 = buffer.create(var1992)
	buffer.copy(buff_1, 0, buff, 0, var1992)
	
	return buff_1
end

function t_57.decode(p111) --[[ line: 14040 ]]
	-- upvalues: t_57 (ref), protoModule (ref), propTypesModule (ref)
	local var1997 = t_57.new()
	local var1998 = 0
	while var1998 < buffer.len(p111) do
		local _ = nil
		local var1999 = nil
		local var2000, var2001, var2002 = protoModule.readTag(p111, var1998)
		local var2003 = var2000
		var1999 = var2001
		var1998 = var2002
		
		if var1999 == protoModule.wireTypes.varint then
			local _ = nil
			local var2004, var2005 = protoModule.readVarInt(p111, var1998)
			local _ = var2004
			var1998 = var2005
			continue
		end
		if var1999 == protoModule.wireTypes.lengthDelimited then
			if var2003 == 1 then
				local _ = nil
				local var2006, var2007 = protoModule.readBuffer(p111, var1998)
				var1998 = var2007
				var1997.tooltip_id = propTypesModule.StringProp.decode(var2006)
			else
				local _ = nil
				local var2008, var2009 = protoModule.readVarInt(p111, var1998)
				var1998 = var2009 + var2008
			end
		elseif var1999 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2010, var2011 = protoModule.readFixed32(p111, var1998)
			local _ = var2010
			var1998 = var2011
		elseif var1999 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2012, var2013 = protoModule.readFixed64(p111, var1998)
			local _ = var2012
			var1998 = var2013
		else
			error("Unsupported wire type: " .. var1999)
		end
	end
	return var1997
end

function t_57:jsonEncode() --[[ line: 14083 ]]
	local t = {}
	
	if self.tooltip_id ~= nil then
		t.tooltipId = self.tooltip_id:jsonEncode()
	end
	return t
end

function t_57:jsonDecode() --[[ line: 14093 ]]
	-- upvalues: t_57 (ref), propTypesModule (ref)
	local var2015 = t_57.new()
	
	if self.tooltip_id ~= nil then
		var2015.tooltip_id = propTypesModule.StringProp.jsonDecode(self.tooltip_id)
	end
	if self.tooltipId ~= nil then
		var2015.tooltip_id = propTypesModule.StringProp.jsonDecode(self.tooltipId)
	end
	return var2015
end

t_57.descriptor = {
	name = "CloseMarketplaceCategoryTooltip_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.CloseMarketplaceCategoryTooltip_Params = t_57
typeRegistryModule.default:register(t.CloseMarketplaceCategoryTooltip_Params)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p112) --[[ line: 14123 ]]
	-- upvalues: t (ref), t_58 (ref)
	return setmetatable({
		action_type = if p112 == nil or p112.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p112.action_type,
		action_params = if p112 == nil or p112.action_params == nil then nil else p112.action_params
	}, t_58)
end

function t_58:encode() --[[ line: 14132 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2017 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2018, var2019 = protoModule.writeTag(buff, var2017, 1, protoModule.wireTypes.varint)
		var2018, var2019 = protoModule.writeVarInt(var2018, var2019, t.ActionType.toNumber(self.action_type))
		buff = var2018
		var2017 = var2019
	end
	if self.action_params ~= nil then
		local var2020 = self.action_params:encode()
		local var2021, var2022 = protoModule.writeTag(buff, var2017, 2, protoModule.wireTypes.lengthDelimited)
		var2021, var2022 = protoModule.writeBuffer(var2021, var2022, var2020, buffer.len(var2020))
		buff = var2021
		var2017 = var2022
	end
	local buff_1 = buffer.create(var2017)
	buffer.copy(buff_1, 0, buff, 0, var2017)
	
	return buff_1
end

function t_58.decode(p113) --[[ line: 14158 ]]
	-- upvalues: t_58 (ref), protoModule (ref), t (ref)
	local var2024 = t_58.new()
	local var2025 = 0
	while var2025 < buffer.len(p113) do
		local _ = nil
		local var2026 = nil
		local var2027, var2028, var2029 = protoModule.readTag(p113, var2025)
		local var2030 = var2027
		var2026 = var2028
		var2025 = var2029
		
		if var2026 == protoModule.wireTypes.varint then
			if var2030 == 1 then
				local _ = nil
				local var2031, var2032 = protoModule.readVarIntI32(p113, var2025)
				local var2033 = var2031
				var2025 = var2032
				var2024.action_type = t.ActionType.fromNumber(var2033) or var2033
			else
				local _ = nil
				local var2034, var2035 = protoModule.readVarInt(p113, var2025)
				local _ = var2034
				var2025 = var2035
			end
		end
		if var2026 == protoModule.wireTypes.lengthDelimited then
			if var2030 == 2 then
				local _ = nil
				local var2036, var2037 = protoModule.readBuffer(p113, var2025)
				var2025 = var2037
				var2024.action_params = t.ResizeMarketplaceCatalog_Params.decode(var2036)
			else
				local _ = nil
				local var2038, var2039 = protoModule.readVarInt(p113, var2025)
				var2025 = var2039 + var2038
			end
		elseif var2026 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2040, var2041 = protoModule.readFixed32(p113, var2025)
			local _ = var2040
			var2025 = var2041
		elseif var2026 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2042, var2043 = protoModule.readFixed64(p113, var2025)
			local _ = var2042
			var2025 = var2043
		else
			error("Unsupported wire type: " .. var2026)
		end
	end
	return var2024
end

function t_58:jsonEncode() --[[ line: 14206 ]]
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

function t_58:jsonDecode() --[[ line: 14228 ]]
	-- upvalues: t_58 (ref), t (ref)
	local var2045 = t_58.new()
	
	if self.action_type ~= nil then
		var2045.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2045.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2045.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2045.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.actionParams)
	end
	return var2045
end

t_58.descriptor = {
	name = "ResizeMarketplaceCatalog",
	fullName = "roblox.apppageplatform.shared.v1beta1.ResizeMarketplaceCatalog"
}
t.ResizeMarketplaceCatalog = t_58
typeRegistryModule.default:register(t.ResizeMarketplaceCatalog)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p114) --[[ line: 14268 ]]
	-- upvalues: t_59 (ref)
	return setmetatable({
		category_id = if p114 == nil or p114.category_id == nil then nil else p114.category_id,
		subcategory_id = if p114 == nil or p114.subcategory_id == nil then nil else p114.subcategory_id,
		screen_size = if p114 == nil or p114.screen_size == nil then nil else p114.screen_size
	}, t_59)
end

function t_59:encode() --[[ line: 14278 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2047 = 0
	
	if self.category_id ~= nil then
		local var2048 = self.category_id:encode()
		local var2049, var2050 = protoModule.writeTag(buff, var2047, 1, protoModule.wireTypes.lengthDelimited)
		var2049, var2050 = protoModule.writeBuffer(var2049, var2050, var2048, buffer.len(var2048))
		buff = var2049
		var2047 = var2050
	end
	if self.subcategory_id ~= nil then
		local var2051 = self.subcategory_id:encode()
		local var2052, var2053 = protoModule.writeTag(buff, var2047, 2, protoModule.wireTypes.lengthDelimited)
		var2052, var2053 = protoModule.writeBuffer(var2052, var2053, var2051, buffer.len(var2051))
		buff = var2052
		var2047 = var2053
	end
	if self.screen_size ~= nil then
		local var2054 = self.screen_size:encode()
		local var2055, var2056 = protoModule.writeTag(buff, var2047, 3, protoModule.wireTypes.lengthDelimited)
		var2055, var2056 = protoModule.writeBuffer(var2055, var2056, var2054, buffer.len(var2054))
		buff = var2055
		var2047 = var2056
	end
	local buff_1 = buffer.create(var2047)
	buffer.copy(buff_1, 0, buff, 0, var2047)
	
	return buff_1
end

function t_59.decode(p115) --[[ line: 14305 ]]
	-- upvalues: t_59 (ref), protoModule (ref), propTypesModule (ref)
	local var2058 = t_59.new()
	local var2059 = 0
	while var2059 < buffer.len(p115) do
		local _ = nil
		local var2060 = nil
		local var2061, var2062, var2063 = protoModule.readTag(p115, var2059)
		local var2064 = var2061
		var2060 = var2062
		var2059 = var2063
		
		if var2060 == protoModule.wireTypes.varint then
			local _ = nil
			local var2065, var2066 = protoModule.readVarInt(p115, var2059)
			local _ = var2065
			var2059 = var2066
			continue
		end
		if var2060 == protoModule.wireTypes.lengthDelimited then
			if var2064 == 1 then
				local _ = nil
				local var2067, var2068 = protoModule.readBuffer(p115, var2059)
				var2059 = var2068
				var2058.category_id = propTypesModule.StringProp.decode(var2067)
			elseif var2064 == 2 then
				local _ = nil
				local var2069, var2070 = protoModule.readBuffer(p115, var2059)
				var2059 = var2070
				var2058.subcategory_id = propTypesModule.StringProp.decode(var2069)
			elseif var2064 == 3 then
				local _ = nil
				local var2071, var2072 = protoModule.readBuffer(p115, var2059)
				var2059 = var2072
				var2058.screen_size = propTypesModule.StringProp.decode(var2071)
			else
				local _ = nil
				local var2073, var2074 = protoModule.readVarInt(p115, var2059)
				var2059 = var2074 + var2073
			end
		elseif var2060 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2075, var2076 = protoModule.readFixed32(p115, var2059)
			local _ = var2075
			var2059 = var2076
		elseif var2060 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2077, var2078 = protoModule.readFixed64(p115, var2059)
			local _ = var2077
			var2059 = var2078
		else
			error("Unsupported wire type: " .. var2060)
		end
	end
	return var2058
end

function t_59:jsonEncode() --[[ line: 14358 ]]
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

function t_59:jsonDecode() --[[ line: 14376 ]]
	-- upvalues: t_59 (ref), propTypesModule (ref)
	local var2080 = t_59.new()
	
	if self.category_id ~= nil then
		var2080.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var2080.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	if self.subcategory_id ~= nil then
		var2080.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var2080.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	if self.screen_size ~= nil then
		var2080.screen_size = propTypesModule.StringProp.jsonDecode(self.screen_size)
	end
	if self.screenSize ~= nil then
		var2080.screen_size = propTypesModule.StringProp.jsonDecode(self.screenSize)
	end
	return var2080
end

t_59.descriptor = {
	name = "ResizeMarketplaceCatalog_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ResizeMarketplaceCatalog_Params = t_59
typeRegistryModule.default:register(t.ResizeMarketplaceCatalog_Params)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p116) --[[ line: 14424 ]]
	-- upvalues: t (ref), t_60 (ref)
	return setmetatable({
		action_type = if p116 == nil or p116.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p116.action_type,
		action_params = if p116 == nil or p116.action_params == nil then nil else p116.action_params
	}, t_60)
end

function t_60:encode() --[[ line: 14435 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2082 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2083, var2084 = protoModule.writeTag(buff, var2082, 1, protoModule.wireTypes.varint)
		var2083, var2084 = protoModule.writeVarInt(var2083, var2084, t.ActionType.toNumber(self.action_type))
		buff = var2083
		var2082 = var2084
	end
	if self.action_params ~= nil then
		local var2085 = self.action_params:encode()
		local var2086, var2087 = protoModule.writeTag(buff, var2082, 2, protoModule.wireTypes.lengthDelimited)
		var2086, var2087 = protoModule.writeBuffer(var2086, var2087, var2085, buffer.len(var2085))
		buff = var2086
		var2082 = var2087
	end
	local buff_1 = buffer.create(var2082)
	buffer.copy(buff_1, 0, buff, 0, var2082)
	
	return buff_1
end

function t_60.decode(p117) --[[ line: 14461 ]]
	-- upvalues: t_60 (ref), protoModule (ref), t (ref)
	local var2089 = t_60.new()
	local var2090 = 0
	while var2090 < buffer.len(p117) do
		local _ = nil
		local var2091 = nil
		local var2092, var2093, var2094 = protoModule.readTag(p117, var2090)
		local var2095 = var2092
		var2091 = var2093
		var2090 = var2094
		
		if var2091 == protoModule.wireTypes.varint then
			if var2095 == 1 then
				local _ = nil
				local var2096, var2097 = protoModule.readVarIntI32(p117, var2090)
				local var2098 = var2096
				var2090 = var2097
				var2089.action_type = t.ActionType.fromNumber(var2098) or var2098
			else
				local _ = nil
				local var2099, var2100 = protoModule.readVarInt(p117, var2090)
				local _ = var2099
				var2090 = var2100
			end
		end
		if var2091 == protoModule.wireTypes.lengthDelimited then
			if var2095 == 2 then
				local _ = nil
				local var2101, var2102 = protoModule.readBuffer(p117, var2090)
				var2090 = var2102
				var2089.action_params = t.OpenChartsSortDetailAction_Params.decode(var2101)
			else
				local _ = nil
				local var2103, var2104 = protoModule.readVarInt(p117, var2090)
				var2090 = var2104 + var2103
			end
		elseif var2091 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2105, var2106 = protoModule.readFixed32(p117, var2090)
			local _ = var2105
			var2090 = var2106
		elseif var2091 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2107, var2108 = protoModule.readFixed64(p117, var2090)
			local _ = var2107
			var2090 = var2108
		else
			error("Unsupported wire type: " .. var2091)
		end
	end
	return var2089
end

function t_60:jsonEncode() --[[ line: 14509 ]]
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

function t_60:jsonDecode() --[[ line: 14531 ]]
	-- upvalues: t_60 (ref), t (ref)
	local var2110 = t_60.new()
	
	if self.action_type ~= nil then
		var2110.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2110.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2110.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2110.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var2110
end

t_60.descriptor = {
	name = "OpenChartsSortDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenChartsSortDetailAction"
}
t.OpenChartsSortDetailAction = t_60
typeRegistryModule.default:register(t.OpenChartsSortDetailAction)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p118) --[[ line: 14571 ]]
	-- upvalues: t_61 (ref)
	return setmetatable({
		sort_id = if p118 == nil or p118.sort_id == nil then nil else p118.sort_id,
		secondary_sort_id = if p118 == nil or p118.secondary_sort_id == nil then nil else p118.secondary_sort_id
	}, t_61)
end

function t_61:encode() --[[ line: 14580 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2112 = 0
	
	if self.sort_id ~= nil then
		local var2113 = self.sort_id:encode()
		local var2114, var2115 = protoModule.writeTag(buff, var2112, 1, protoModule.wireTypes.lengthDelimited)
		var2114, var2115 = protoModule.writeBuffer(var2114, var2115, var2113, buffer.len(var2113))
		buff = var2114
		var2112 = var2115
	end
	if self.secondary_sort_id ~= nil then
		local var2116 = self.secondary_sort_id:encode()
		local var2117, var2118 = protoModule.writeTag(buff, var2112, 2, protoModule.wireTypes.lengthDelimited)
		var2117, var2118 = protoModule.writeBuffer(var2117, var2118, var2116, buffer.len(var2116))
		buff = var2117
		var2112 = var2118
	end
	local buff_1 = buffer.create(var2112)
	buffer.copy(buff_1, 0, buff, 0, var2112)
	
	return buff_1
end

function t_61.decode(p119) --[[ line: 14601 ]]
	-- upvalues: t_61 (ref), protoModule (ref), propTypesModule (ref)
	local var2120 = t_61.new()
	local var2121 = 0
	while var2121 < buffer.len(p119) do
		local _ = nil
		local var2122 = nil
		local var2123, var2124, var2125 = protoModule.readTag(p119, var2121)
		local var2126 = var2123
		var2122 = var2124
		var2121 = var2125
		
		if var2122 == protoModule.wireTypes.varint then
			local _ = nil
			local var2127, var2128 = protoModule.readVarInt(p119, var2121)
			local _ = var2127
			var2121 = var2128
			continue
		end
		if var2122 == protoModule.wireTypes.lengthDelimited then
			if var2126 == 1 then
				local _ = nil
				local var2129, var2130 = protoModule.readBuffer(p119, var2121)
				var2121 = var2130
				var2120.sort_id = propTypesModule.StringProp.decode(var2129)
			elseif var2126 == 2 then
				local _ = nil
				local var2131, var2132 = protoModule.readBuffer(p119, var2121)
				var2121 = var2132
				var2120.secondary_sort_id = propTypesModule.Int32Prop.decode(var2131)
			else
				local _ = nil
				local var2133, var2134 = protoModule.readVarInt(p119, var2121)
				var2121 = var2134 + var2133
			end
		elseif var2122 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2135, var2136 = protoModule.readFixed32(p119, var2121)
			local _ = var2135
			var2121 = var2136
		elseif var2122 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2137, var2138 = protoModule.readFixed64(p119, var2121)
			local _ = var2137
			var2121 = var2138
		else
			error("Unsupported wire type: " .. var2122)
		end
	end
	return var2120
end

function t_61:jsonEncode() --[[ line: 14649 ]]
	local t = {}
	
	if self.sort_id ~= nil then
		t.sortId = self.sort_id:jsonEncode()
	end
	if self.secondary_sort_id ~= nil then
		t.secondarySortId = self.secondary_sort_id:jsonEncode()
	end
	return t
end

function t_61:jsonDecode() --[[ line: 14663 ]]
	-- upvalues: t_61 (ref), propTypesModule (ref)
	local var2140 = t_61.new()
	
	if self.sort_id ~= nil then
		var2140.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var2140.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.secondary_sort_id ~= nil then
		var2140.secondary_sort_id = propTypesModule.Int32Prop.jsonDecode(self.secondary_sort_id)
	end
	if self.secondarySortId ~= nil then
		var2140.secondary_sort_id = propTypesModule.Int32Prop.jsonDecode(self.secondarySortId)
	end
	return var2140
end

t_61.descriptor = {
	name = "OpenChartsSortDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenChartsSortDetailAction_Params = t_61
typeRegistryModule.default:register(t.OpenChartsSortDetailAction_Params)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p120) --[[ line: 14703 ]]
	-- upvalues: t (ref), t_62 (ref)
	return setmetatable({
		action_type = if p120 == nil or p120.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p120.action_type,
		action_params = if p120 == nil or p120.action_params == nil then nil else p120.action_params
	}, t_62)
end

function t_62:encode() --[[ line: 14712 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2142 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2143, var2144 = protoModule.writeTag(buff, var2142, 1, protoModule.wireTypes.varint)
		var2143, var2144 = protoModule.writeVarInt(var2143, var2144, t.ActionType.toNumber(self.action_type))
		buff = var2143
		var2142 = var2144
	end
	if self.action_params ~= nil then
		local var2145 = self.action_params:encode()
		local var2146, var2147 = protoModule.writeTag(buff, var2142, 2, protoModule.wireTypes.lengthDelimited)
		var2146, var2147 = protoModule.writeBuffer(var2146, var2147, var2145, buffer.len(var2145))
		buff = var2146
		var2142 = var2147
	end
	local buff_1 = buffer.create(var2142)
	buffer.copy(buff_1, 0, buff, 0, var2142)
	
	return buff_1
end

function t_62.decode(p121) --[[ line: 14738 ]]
	-- upvalues: t_62 (ref), protoModule (ref), t (ref)
	local var2149 = t_62.new()
	local var2150 = 0
	while var2150 < buffer.len(p121) do
		local _ = nil
		local var2151 = nil
		local var2152, var2153, var2154 = protoModule.readTag(p121, var2150)
		local var2155 = var2152
		var2151 = var2153
		var2150 = var2154
		
		if var2151 == protoModule.wireTypes.varint then
			if var2155 == 1 then
				local _ = nil
				local var2156, var2157 = protoModule.readVarIntI32(p121, var2150)
				local var2158 = var2156
				var2150 = var2157
				var2149.action_type = t.ActionType.fromNumber(var2158) or var2158
			else
				local _ = nil
				local var2159, var2160 = protoModule.readVarInt(p121, var2150)
				local _ = var2159
				var2150 = var2160
			end
		end
		if var2151 == protoModule.wireTypes.lengthDelimited then
			if var2155 == 2 then
				local _ = nil
				local var2161, var2162 = protoModule.readBuffer(p121, var2150)
				var2150 = var2162
				var2149.action_params = t.OpenSongDetailAction_Params.decode(var2161)
			else
				local _ = nil
				local var2163, var2164 = protoModule.readVarInt(p121, var2150)
				var2150 = var2164 + var2163
			end
		elseif var2151 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2165, var2166 = protoModule.readFixed32(p121, var2150)
			local _ = var2165
			var2150 = var2166
		elseif var2151 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2167, var2168 = protoModule.readFixed64(p121, var2150)
			local _ = var2167
			var2150 = var2168
		else
			error("Unsupported wire type: " .. var2151)
		end
	end
	return var2149
end

function t_62:jsonEncode() --[[ line: 14786 ]]
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

function t_62:jsonDecode() --[[ line: 14808 ]]
	-- upvalues: t_62 (ref), t (ref)
	local var2170 = t_62.new()
	
	if self.action_type ~= nil then
		var2170.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2170.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2170.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2170.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var2170
end

t_62.descriptor = {
	name = "OpenSongDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSongDetailAction"
}
t.OpenSongDetailAction = t_62
typeRegistryModule.default:register(t.OpenSongDetailAction)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p122) --[[ line: 14848 ]]
	-- upvalues: t_63 (ref)
	return setmetatable({
		song_id = if p122 == nil or p122.song_id == nil then nil else p122.song_id
	}, t_63)
end

function t_63:encode() --[[ line: 14856 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2172 = 0
	
	if self.song_id ~= nil then
		local var2173 = self.song_id:encode()
		local var2174, var2175 = protoModule.writeTag(buff, var2172, 1, protoModule.wireTypes.lengthDelimited)
		var2174, var2175 = protoModule.writeBuffer(var2174, var2175, var2173, buffer.len(var2173))
		buff = var2174
		var2172 = var2175
	end
	local buff_1 = buffer.create(var2172)
	buffer.copy(buff_1, 0, buff, 0, var2172)
	
	return buff_1
end

function t_63.decode(p123) --[[ line: 14871 ]]
	-- upvalues: t_63 (ref), protoModule (ref), propTypesModule (ref)
	local var2177 = t_63.new()
	local var2178 = 0
	while var2178 < buffer.len(p123) do
		local _ = nil
		local var2179 = nil
		local var2180, var2181, var2182 = protoModule.readTag(p123, var2178)
		local var2183 = var2180
		var2179 = var2181
		var2178 = var2182
		
		if var2179 == protoModule.wireTypes.varint then
			local _ = nil
			local var2184, var2185 = protoModule.readVarInt(p123, var2178)
			local _ = var2184
			var2178 = var2185
			continue
		end
		if var2179 == protoModule.wireTypes.lengthDelimited then
			if var2183 == 1 then
				local _ = nil
				local var2186, var2187 = protoModule.readBuffer(p123, var2178)
				var2178 = var2187
				var2177.song_id = propTypesModule.StringProp.decode(var2186)
			else
				local _ = nil
				local var2188, var2189 = protoModule.readVarInt(p123, var2178)
				var2178 = var2189 + var2188
			end
		elseif var2179 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2190, var2191 = protoModule.readFixed32(p123, var2178)
			local _ = var2190
			var2178 = var2191
		elseif var2179 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2192, var2193 = protoModule.readFixed64(p123, var2178)
			local _ = var2192
			var2178 = var2193
		else
			error("Unsupported wire type: " .. var2179)
		end
	end
	return var2177
end

function t_63:jsonEncode() --[[ line: 14914 ]]
	local t = {}
	
	if self.song_id ~= nil then
		t.songId = self.song_id:jsonEncode()
	end
	return t
end

function t_63:jsonDecode() --[[ line: 14924 ]]
	-- upvalues: t_63 (ref), propTypesModule (ref)
	local var2195 = t_63.new()
	
	if self.song_id ~= nil then
		var2195.song_id = propTypesModule.StringProp.jsonDecode(self.song_id)
	end
	if self.songId ~= nil then
		var2195.song_id = propTypesModule.StringProp.jsonDecode(self.songId)
	end
	return var2195
end

t_63.descriptor = {
	name = "OpenSongDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSongDetailAction_Params = t_63
typeRegistryModule.default:register(t.OpenSongDetailAction_Params)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p124) --[[ line: 14952 ]]
	-- upvalues: t (ref), t_64 (ref)
	return setmetatable({
		action_type = if p124 == nil or p124.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p124.action_type,
		action_params = if p124 == nil or p124.action_params == nil then nil else p124.action_params
	}, t_64)
end

function t_64:encode() --[[ line: 14963 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2197 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2198, var2199 = protoModule.writeTag(buff, var2197, 1, protoModule.wireTypes.varint)
		var2198, var2199 = protoModule.writeVarInt(var2198, var2199, t.ActionType.toNumber(self.action_type))
		buff = var2198
		var2197 = var2199
	end
	if self.action_params ~= nil then
		local var2200 = self.action_params:encode()
		local var2201, var2202 = protoModule.writeTag(buff, var2197, 2, protoModule.wireTypes.lengthDelimited)
		var2201, var2202 = protoModule.writeBuffer(var2201, var2202, var2200, buffer.len(var2200))
		buff = var2201
		var2197 = var2202
	end
	local buff_1 = buffer.create(var2197)
	buffer.copy(buff_1, 0, buff, 0, var2197)
	
	return buff_1
end

function t_64.decode(p125) --[[ line: 14989 ]]
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var2204 = t_64.new()
	local var2205 = 0
	while var2205 < buffer.len(p125) do
		local _ = nil
		local var2206 = nil
		local var2207, var2208, var2209 = protoModule.readTag(p125, var2205)
		local var2210 = var2207
		var2206 = var2208
		var2205 = var2209
		
		if var2206 == protoModule.wireTypes.varint then
			if var2210 == 1 then
				local _ = nil
				local var2211, var2212 = protoModule.readVarIntI32(p125, var2205)
				local var2213 = var2211
				var2205 = var2212
				var2204.action_type = t.ActionType.fromNumber(var2213) or var2213
			else
				local _ = nil
				local var2214, var2215 = protoModule.readVarInt(p125, var2205)
				local _ = var2214
				var2205 = var2215
			end
		end
		if var2206 == protoModule.wireTypes.lengthDelimited then
			if var2210 == 2 then
				local _ = nil
				local var2216, var2217 = protoModule.readBuffer(p125, var2205)
				var2205 = var2217
				var2204.action_params = t.OpenMarketplaceCatalogFilters_Params.decode(var2216)
			else
				local _ = nil
				local var2218, var2219 = protoModule.readVarInt(p125, var2205)
				var2205 = var2219 + var2218
			end
		elseif var2206 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2220, var2221 = protoModule.readFixed32(p125, var2205)
			local _ = var2220
			var2205 = var2221
		elseif var2206 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2222, var2223 = protoModule.readFixed64(p125, var2205)
			local _ = var2222
			var2205 = var2223
		else
			error("Unsupported wire type: " .. var2206)
		end
	end
	return var2204
end

function t_64:jsonEncode() --[[ line: 15037 ]]
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

function t_64:jsonDecode() --[[ line: 15059 ]]
	-- upvalues: t_64 (ref), t (ref)
	local var2225 = t_64.new()
	
	if self.action_type ~= nil then
		var2225.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2225.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2225.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2225.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.actionParams)
	end
	return var2225
end

t_64.descriptor = {
	name = "OpenMarketplaceCatalogFilters",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogFilters"
}
t.OpenMarketplaceCatalogFilters = t_64
typeRegistryModule.default:register(t.OpenMarketplaceCatalogFilters)
local t_65 = {}
t_65.__index = t_65

function t_65.new(_) --[[ line: 15099 ]]
	-- upvalues: t_65 (ref)
	return setmetatable({}, t_65)
end

function t_65.encode(_) --[[ line: 15105 ]]
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_65.decode(p126) --[[ line: 15114 ]]
	-- upvalues: t_65 (ref), protoModule (ref)
	local var2227 = t_65.new()
	local var2228 = 0
	while var2228 < buffer.len(p126) do
		local var2229 = nil
		local _ = nil
		local var2230, var2231, var2232 = protoModule.readTag(p126, var2228)
		var2229 = var2230
		local var2233 = var2231
		var2228 = var2232
		
		if var2233 == protoModule.wireTypes.varint then
			local _ = nil
			local var2234, var2235 = protoModule.readVarInt(p126, var2228)
			local _ = var2234
			var2228 = var2235
		elseif var2233 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2236, var2237 = protoModule.readVarInt(p126, var2228)
			var2228 = var2237 + var2236
		elseif var2233 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2238, var2239 = protoModule.readFixed32(p126, var2228)
			local _ = var2238
			var2228 = var2239
		elseif var2233 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2240, var2241 = protoModule.readFixed64(p126, var2228)
			local _ = var2240
			var2228 = var2241
		else
			error("Unsupported wire type: " .. var2233)
		end
	end
	return var2227
end

function t_65.jsonEncode(_) --[[ line: 15152 ]]
	return {}
end

function t_65.jsonDecode(_) --[[ line: 15158 ]]
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

function t_66.new(p127) --[[ line: 15180 ]]
	-- upvalues: t (ref), t_66 (ref)
	return setmetatable({
		action_type = if p127 == nil or p127.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p127.action_type,
		action_params = if p127 == nil or p127.action_params == nil then nil else p127.action_params
	}, t_66)
end

function t_66:encode() --[[ line: 15189 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2243 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2244, var2245 = protoModule.writeTag(buff, var2243, 1, protoModule.wireTypes.varint)
		var2244, var2245 = protoModule.writeVarInt(var2244, var2245, t.ActionType.toNumber(self.action_type))
		buff = var2244
		var2243 = var2245
	end
	if self.action_params ~= nil then
		local var2246 = self.action_params:encode()
		local var2247, var2248 = protoModule.writeTag(buff, var2243, 2, protoModule.wireTypes.lengthDelimited)
		var2247, var2248 = protoModule.writeBuffer(var2247, var2248, var2246, buffer.len(var2246))
		buff = var2247
		var2243 = var2248
	end
	local buff_1 = buffer.create(var2243)
	buffer.copy(buff_1, 0, buff, 0, var2243)
	
	return buff_1
end

function t_66.decode(p128) --[[ line: 15215 ]]
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var2250 = t_66.new()
	local var2251 = 0
	while var2251 < buffer.len(p128) do
		local _ = nil
		local var2252 = nil
		local var2253, var2254, var2255 = protoModule.readTag(p128, var2251)
		local var2256 = var2253
		var2252 = var2254
		var2251 = var2255
		
		if var2252 == protoModule.wireTypes.varint then
			if var2256 == 1 then
				local _ = nil
				local var2257, var2258 = protoModule.readVarIntI32(p128, var2251)
				local var2259 = var2257
				var2251 = var2258
				var2250.action_type = t.ActionType.fromNumber(var2259) or var2259
			else
				local _ = nil
				local var2260, var2261 = protoModule.readVarInt(p128, var2251)
				local _ = var2260
				var2251 = var2261
			end
		end
		if var2252 == protoModule.wireTypes.lengthDelimited then
			if var2256 == 2 then
				local _ = nil
				local var2262, var2263 = protoModule.readBuffer(p128, var2251)
				var2251 = var2263
				var2250.action_params = t.RefreshFromApiAction_Params.decode(var2262)
			else
				local _ = nil
				local var2264, var2265 = protoModule.readVarInt(p128, var2251)
				var2251 = var2265 + var2264
			end
		elseif var2252 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2266, var2267 = protoModule.readFixed32(p128, var2251)
			local _ = var2266
			var2251 = var2267
		elseif var2252 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2268, var2269 = protoModule.readFixed64(p128, var2251)
			local _ = var2268
			var2251 = var2269
		else
			error("Unsupported wire type: " .. var2252)
		end
	end
	return var2250
end

function t_66:jsonEncode() --[[ line: 15263 ]]
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

function t_66:jsonDecode() --[[ line: 15285 ]]
	-- upvalues: t_66 (ref), t (ref)
	local var2271 = t_66.new()
	
	if self.action_type ~= nil then
		var2271.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2271.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2271.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2271.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var2271
end

t_66.descriptor = {
	name = "RefreshFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshFromApiAction"
}
t.RefreshFromApiAction = t_66
typeRegistryModule.default:register(t.RefreshFromApiAction)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p129) --[[ line: 15325 ]]
	-- upvalues: t_67 (ref)
	return setmetatable({
		surface_key = if p129 == nil or p129.surface_key == nil then nil else p129.surface_key,
		config_key = if p129 == nil or p129.config_key == nil then nil else p129.config_key
	}, t_67)
end

function t_67:encode() --[[ line: 15334 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2273 = 0
	
	if self.surface_key ~= nil then
		local var2274 = self.surface_key:encode()
		local var2275, var2276 = protoModule.writeTag(buff, var2273, 1, protoModule.wireTypes.lengthDelimited)
		var2275, var2276 = protoModule.writeBuffer(var2275, var2276, var2274, buffer.len(var2274))
		buff = var2275
		var2273 = var2276
	end
	if self.config_key ~= nil then
		local var2277 = self.config_key:encode()
		local var2278, var2279 = protoModule.writeTag(buff, var2273, 2, protoModule.wireTypes.lengthDelimited)
		var2278, var2279 = protoModule.writeBuffer(var2278, var2279, var2277, buffer.len(var2277))
		buff = var2278
		var2273 = var2279
	end
	local buff_1 = buffer.create(var2273)
	buffer.copy(buff_1, 0, buff, 0, var2273)
	
	return buff_1
end

function t_67.decode(p130) --[[ line: 15355 ]]
	-- upvalues: t_67 (ref), protoModule (ref), propTypesModule (ref)
	local var2281 = t_67.new()
	local var2282 = 0
	while var2282 < buffer.len(p130) do
		local _ = nil
		local var2283 = nil
		local var2284, var2285, var2286 = protoModule.readTag(p130, var2282)
		local var2287 = var2284
		var2283 = var2285
		var2282 = var2286
		
		if var2283 == protoModule.wireTypes.varint then
			local _ = nil
			local var2288, var2289 = protoModule.readVarInt(p130, var2282)
			local _ = var2288
			var2282 = var2289
			continue
		end
		if var2283 == protoModule.wireTypes.lengthDelimited then
			if var2287 == 1 then
				local _ = nil
				local var2290, var2291 = protoModule.readBuffer(p130, var2282)
				var2282 = var2291
				var2281.surface_key = propTypesModule.StringProp.decode(var2290)
			elseif var2287 == 2 then
				local _ = nil
				local var2292, var2293 = protoModule.readBuffer(p130, var2282)
				var2282 = var2293
				var2281.config_key = propTypesModule.StringProp.decode(var2292)
			else
				local _ = nil
				local var2294, var2295 = protoModule.readVarInt(p130, var2282)
				var2282 = var2295 + var2294
			end
		elseif var2283 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2296, var2297 = protoModule.readFixed32(p130, var2282)
			local _ = var2296
			var2282 = var2297
		elseif var2283 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2298, var2299 = protoModule.readFixed64(p130, var2282)
			local _ = var2298
			var2282 = var2299
		else
			error("Unsupported wire type: " .. var2283)
		end
	end
	return var2281
end

function t_67:jsonEncode() --[[ line: 15403 ]]
	local t = {}
	
	if self.surface_key ~= nil then
		t.surfaceKey = self.surface_key:jsonEncode()
	end
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	return t
end

function t_67:jsonDecode() --[[ line: 15417 ]]
	-- upvalues: t_67 (ref), propTypesModule (ref)
	local var2301 = t_67.new()
	
	if self.surface_key ~= nil then
		var2301.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var2301.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		var2301.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var2301.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return var2301
end

t_67.descriptor = {
	name = "RefreshFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshFromApiAction_Params = t_67
typeRegistryModule.default:register(t.RefreshFromApiAction_Params)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p131) --[[ line: 15454 ]]
	-- upvalues: t (ref), t_68 (ref)
	return setmetatable({
		action_type = if p131 == nil or p131.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p131.action_type,
		action_params = if p131 == nil or p131.action_params == nil then nil else p131.action_params
	}, t_68)
end

function t_68:encode() --[[ line: 15465 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2303 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2304, var2305 = protoModule.writeTag(buff, var2303, 1, protoModule.wireTypes.varint)
		var2304, var2305 = protoModule.writeVarInt(var2304, var2305, t.ActionType.toNumber(self.action_type))
		buff = var2304
		var2303 = var2305
	end
	if self.action_params ~= nil then
		local var2306 = self.action_params:encode()
		local var2307, var2308 = protoModule.writeTag(buff, var2303, 2, protoModule.wireTypes.lengthDelimited)
		var2307, var2308 = protoModule.writeBuffer(var2307, var2308, var2306, buffer.len(var2306))
		buff = var2307
		var2303 = var2308
	end
	local buff_1 = buffer.create(var2303)
	buffer.copy(buff_1, 0, buff, 0, var2303)
	
	return buff_1
end

function t_68.decode(p132) --[[ line: 15491 ]]
	-- upvalues: t_68 (ref), protoModule (ref), t (ref)
	local var2310 = t_68.new()
	local var2311 = 0
	while var2311 < buffer.len(p132) do
		local _ = nil
		local var2312 = nil
		local var2313, var2314, var2315 = protoModule.readTag(p132, var2311)
		local var2316 = var2313
		var2312 = var2314
		var2311 = var2315
		
		if var2312 == protoModule.wireTypes.varint then
			if var2316 == 1 then
				local _ = nil
				local var2317, var2318 = protoModule.readVarIntI32(p132, var2311)
				local var2319 = var2317
				var2311 = var2318
				var2310.action_type = t.ActionType.fromNumber(var2319) or var2319
			else
				local _ = nil
				local var2320, var2321 = protoModule.readVarInt(p132, var2311)
				local _ = var2320
				var2311 = var2321
			end
		end
		if var2312 == protoModule.wireTypes.lengthDelimited then
			if var2316 == 2 then
				local _ = nil
				local var2322, var2323 = protoModule.readBuffer(p132, var2311)
				var2311 = var2323
				var2310.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.decode(var2322)
			else
				local _ = nil
				local var2324, var2325 = protoModule.readVarInt(p132, var2311)
				var2311 = var2325 + var2324
			end
		elseif var2312 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2326, var2327 = protoModule.readFixed32(p132, var2311)
			local _ = var2326
			var2311 = var2327
		elseif var2312 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2328, var2329 = protoModule.readFixed64(p132, var2311)
			local _ = var2328
			var2311 = var2329
		else
			error("Unsupported wire type: " .. var2312)
		end
	end
	return var2310
end

function t_68:jsonEncode() --[[ line: 15539 ]]
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

function t_68:jsonDecode() --[[ line: 15561 ]]
	-- upvalues: t_68 (ref), t (ref)
	local var2331 = t_68.new()
	
	if self.action_type ~= nil then
		var2331.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2331.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2331.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2331.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.actionParams)
	end
	return var2331
end

t_68.descriptor = {
	name = "RefreshOmniRecommendationFeedItemAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshOmniRecommendationFeedItemAction"
}
t.RefreshOmniRecommendationFeedItemAction = t_68
typeRegistryModule.default:register(t.RefreshOmniRecommendationFeedItemAction)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p133) --[[ line: 15603 ]]
	-- upvalues: t_69 (ref)
	return setmetatable({
		topic_id = if p133 == nil or p133.topic_id == nil then nil else p133.topic_id,
		selected_option = if p133 == nil or p133.selected_option == nil then nil else p133.selected_option,
		request_intent = if p133 == nil or p133.request_intent == nil then nil else p133.request_intent,
		feed_item_key = if p133 == nil or p133.feed_item_key == nil then nil else p133.feed_item_key
	}, t_69)
end

function t_69:encode() --[[ line: 15614 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2333 = 0
	
	if self.topic_id ~= nil then
		local var2334 = self.topic_id:encode()
		local var2335, var2336 = protoModule.writeTag(buff, var2333, 1, protoModule.wireTypes.lengthDelimited)
		var2335, var2336 = protoModule.writeBuffer(var2335, var2336, var2334, buffer.len(var2334))
		buff = var2335
		var2333 = var2336
	end
	if self.selected_option ~= nil then
		local var2337 = self.selected_option:encode()
		local var2338, var2339 = protoModule.writeTag(buff, var2333, 2, protoModule.wireTypes.lengthDelimited)
		var2338, var2339 = protoModule.writeBuffer(var2338, var2339, var2337, buffer.len(var2337))
		buff = var2338
		var2333 = var2339
	end
	if self.request_intent ~= nil then
		local var2340 = self.request_intent:encode()
		local var2341, var2342 = protoModule.writeTag(buff, var2333, 3, protoModule.wireTypes.lengthDelimited)
		var2341, var2342 = protoModule.writeBuffer(var2341, var2342, var2340, buffer.len(var2340))
		buff = var2341
		var2333 = var2342
	end
	if self.feed_item_key ~= nil then
		local var2343 = self.feed_item_key:encode()
		local var2344, var2345 = protoModule.writeTag(buff, var2333, 4, protoModule.wireTypes.lengthDelimited)
		var2344, var2345 = protoModule.writeBuffer(var2344, var2345, var2343, buffer.len(var2343))
		buff = var2344
		var2333 = var2345
	end
	local buff_1 = buffer.create(var2333)
	buffer.copy(buff_1, 0, buff, 0, var2333)
	
	return buff_1
end

function t_69.decode(p134) --[[ line: 15649 ]]
	-- upvalues: t_69 (ref), protoModule (ref), propTypesModule (ref)
	local var2347 = t_69.new()
	local var2348 = 0
	while var2348 < buffer.len(p134) do
		local _ = nil
		local var2349 = nil
		local var2350, var2351, var2352 = protoModule.readTag(p134, var2348)
		local var2353 = var2350
		var2349 = var2351
		var2348 = var2352
		
		if var2349 == protoModule.wireTypes.varint then
			local _ = nil
			local var2354, var2355 = protoModule.readVarInt(p134, var2348)
			local _ = var2354
			var2348 = var2355
			continue
		end
		if var2349 == protoModule.wireTypes.lengthDelimited then
			if var2353 == 1 then
				local _ = nil
				local var2356, var2357 = protoModule.readBuffer(p134, var2348)
				var2348 = var2357
				var2347.topic_id = propTypesModule.StringProp.decode(var2356)
			elseif var2353 == 2 then
				local _ = nil
				local var2358, var2359 = protoModule.readBuffer(p134, var2348)
				var2348 = var2359
				var2347.selected_option = propTypesModule.StringProp.decode(var2358)
			elseif var2353 == 3 then
				local _ = nil
				local var2360, var2361 = protoModule.readBuffer(p134, var2348)
				var2348 = var2361
				var2347.request_intent = propTypesModule.StringProp.decode(var2360)
			elseif var2353 == 4 then
				local _ = nil
				local var2362, var2363 = protoModule.readBuffer(p134, var2348)
				var2348 = var2363
				var2347.feed_item_key = propTypesModule.StringProp.decode(var2362)
			else
				local _ = nil
				local var2364, var2365 = protoModule.readVarInt(p134, var2348)
				var2348 = var2365 + var2364
			end
		elseif var2349 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2366, var2367 = protoModule.readFixed32(p134, var2348)
			local _ = var2366
			var2348 = var2367
		elseif var2349 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2368, var2369 = protoModule.readFixed64(p134, var2348)
			local _ = var2368
			var2348 = var2369
		else
			error("Unsupported wire type: " .. var2349)
		end
	end
	return var2347
end

function t_69:jsonEncode() --[[ line: 15709 ]]
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

function t_69:jsonDecode() --[[ line: 15733 ]]
	-- upvalues: t_69 (ref), propTypesModule (ref)
	local var2371 = t_69.new()
	
	if self.topic_id ~= nil then
		var2371.topic_id = propTypesModule.StringProp.jsonDecode(self.topic_id)
	end
	if self.topicId ~= nil then
		var2371.topic_id = propTypesModule.StringProp.jsonDecode(self.topicId)
	end
	if self.selected_option ~= nil then
		var2371.selected_option = propTypesModule.StringProp.jsonDecode(self.selected_option)
	end
	if self.selectedOption ~= nil then
		var2371.selected_option = propTypesModule.StringProp.jsonDecode(self.selectedOption)
	end
	if self.request_intent ~= nil then
		var2371.request_intent = propTypesModule.StringProp.jsonDecode(self.request_intent)
	end
	if self.requestIntent ~= nil then
		var2371.request_intent = propTypesModule.StringProp.jsonDecode(self.requestIntent)
	end
	if self.feed_item_key ~= nil then
		var2371.feed_item_key = propTypesModule.StringProp.jsonDecode(self.feed_item_key)
	end
	if self.feedItemKey ~= nil then
		var2371.feed_item_key = propTypesModule.StringProp.jsonDecode(self.feedItemKey)
	end
	return var2371
end

t_69.descriptor = {
	name = "RefreshOmniRecommendationFeedItemAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshOmniRecommendationFeedItemAction_Params = t_69
typeRegistryModule.default:register(t.RefreshOmniRecommendationFeedItemAction_Params)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p135) --[[ line: 15793 ]]
	-- upvalues: t (ref), t_70 (ref)
	return setmetatable({
		action_type = if p135 == nil or p135.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p135.action_type,
		action_params = if p135 == nil or p135.action_params == nil then nil else p135.action_params
	}, t_70)
end

function t_70:encode() --[[ line: 15802 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2373 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2374, var2375 = protoModule.writeTag(buff, var2373, 1, protoModule.wireTypes.varint)
		var2374, var2375 = protoModule.writeVarInt(var2374, var2375, t.ActionType.toNumber(self.action_type))
		buff = var2374
		var2373 = var2375
	end
	if self.action_params ~= nil then
		local var2376 = self.action_params:encode()
		local var2377, var2378 = protoModule.writeTag(buff, var2373, 2, protoModule.wireTypes.lengthDelimited)
		var2377, var2378 = protoModule.writeBuffer(var2377, var2378, var2376, buffer.len(var2376))
		buff = var2377
		var2373 = var2378
	end
	local buff_1 = buffer.create(var2373)
	buffer.copy(buff_1, 0, buff, 0, var2373)
	
	return buff_1
end

function t_70.decode(p136) --[[ line: 15828 ]]
	-- upvalues: t_70 (ref), protoModule (ref), t (ref)
	local var2380 = t_70.new()
	local var2381 = 0
	while var2381 < buffer.len(p136) do
		local _ = nil
		local var2382 = nil
		local var2383, var2384, var2385 = protoModule.readTag(p136, var2381)
		local var2386 = var2383
		var2382 = var2384
		var2381 = var2385
		
		if var2382 == protoModule.wireTypes.varint then
			if var2386 == 1 then
				local _ = nil
				local var2387, var2388 = protoModule.readVarIntI32(p136, var2381)
				local var2389 = var2387
				var2381 = var2388
				var2380.action_type = t.ActionType.fromNumber(var2389) or var2389
			else
				local _ = nil
				local var2390, var2391 = protoModule.readVarInt(p136, var2381)
				local _ = var2390
				var2381 = var2391
			end
		end
		if var2382 == protoModule.wireTypes.lengthDelimited then
			if var2386 == 2 then
				local _ = nil
				local var2392, var2393 = protoModule.readBuffer(p136, var2381)
				var2381 = var2393
				var2380.action_params = t.RsvpToEventAction_Params.decode(var2392)
			else
				local _ = nil
				local var2394, var2395 = protoModule.readVarInt(p136, var2381)
				var2381 = var2395 + var2394
			end
		elseif var2382 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2396, var2397 = protoModule.readFixed32(p136, var2381)
			local _ = var2396
			var2381 = var2397
		elseif var2382 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2398, var2399 = protoModule.readFixed64(p136, var2381)
			local _ = var2398
			var2381 = var2399
		else
			error("Unsupported wire type: " .. var2382)
		end
	end
	return var2380
end

function t_70:jsonEncode() --[[ line: 15876 ]]
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

function t_70:jsonDecode() --[[ line: 15898 ]]
	-- upvalues: t_70 (ref), t (ref)
	local var2401 = t_70.new()
	
	if self.action_type ~= nil then
		var2401.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2401.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2401.action_params = t.RsvpToEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2401.action_params = t.RsvpToEventAction_Params.jsonDecode(self.actionParams)
	end
	return var2401
end

t_70.descriptor = {
	name = "RsvpToEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpToEventAction"
}
t.RsvpToEventAction = t_70
typeRegistryModule.default:register(t.RsvpToEventAction)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p137) --[[ line: 15938 ]]
	-- upvalues: t_71 (ref)
	return setmetatable({
		event_id = if p137 == nil or p137.event_id == nil then nil else p137.event_id,
		user_rsvp = if p137 == nil or p137.user_rsvp == nil then nil else p137.user_rsvp,
		notifications_modal_identifier = if p137 == nil or p137.notifications_modal_identifier == nil then nil else p137.notifications_modal_identifier
	}, t_71)
end

function t_71:encode() --[[ line: 15948 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2403 = 0
	
	if self.event_id ~= nil then
		local var2404 = self.event_id:encode()
		local var2405, var2406 = protoModule.writeTag(buff, var2403, 1, protoModule.wireTypes.lengthDelimited)
		var2405, var2406 = protoModule.writeBuffer(var2405, var2406, var2404, buffer.len(var2404))
		buff = var2405
		var2403 = var2406
	end
	if self.user_rsvp ~= nil then
		local var2407 = self.user_rsvp:encode()
		local var2408, var2409 = protoModule.writeTag(buff, var2403, 2, protoModule.wireTypes.lengthDelimited)
		var2408, var2409 = protoModule.writeBuffer(var2408, var2409, var2407, buffer.len(var2407))
		buff = var2408
		var2403 = var2409
	end
	if self.notifications_modal_identifier ~= nil then
		local var2410 = self.notifications_modal_identifier:encode()
		local var2411, var2412 = protoModule.writeTag(buff, var2403, 3, protoModule.wireTypes.lengthDelimited)
		var2411, var2412 = protoModule.writeBuffer(var2411, var2412, var2410, buffer.len(var2410))
		buff = var2411
		var2403 = var2412
	end
	local buff_1 = buffer.create(var2403)
	buffer.copy(buff_1, 0, buff, 0, var2403)
	
	return buff_1
end

function t_71.decode(p138) --[[ line: 15975 ]]
	-- upvalues: t_71 (ref), protoModule (ref), propTypesModule (ref)
	local var2414 = t_71.new()
	local var2415 = 0
	while var2415 < buffer.len(p138) do
		local _ = nil
		local var2416 = nil
		local var2417, var2418, var2419 = protoModule.readTag(p138, var2415)
		local var2420 = var2417
		var2416 = var2418
		var2415 = var2419
		
		if var2416 == protoModule.wireTypes.varint then
			local _ = nil
			local var2421, var2422 = protoModule.readVarInt(p138, var2415)
			local _ = var2421
			var2415 = var2422
			continue
		end
		if var2416 == protoModule.wireTypes.lengthDelimited then
			if var2420 == 1 then
				local _ = nil
				local var2423, var2424 = protoModule.readBuffer(p138, var2415)
				var2415 = var2424
				var2414.event_id = propTypesModule.StringProp.decode(var2423)
			elseif var2420 == 2 then
				local _ = nil
				local var2425, var2426 = protoModule.readBuffer(p138, var2415)
				var2415 = var2426
				var2414.user_rsvp = propTypesModule.BoolProp.decode(var2425)
			elseif var2420 == 3 then
				local _ = nil
				local var2427, var2428 = protoModule.readBuffer(p138, var2415)
				var2415 = var2428
				var2414.notifications_modal_identifier = propTypesModule.StringProp.decode(var2427)
			else
				local _ = nil
				local var2429, var2430 = protoModule.readVarInt(p138, var2415)
				var2415 = var2430 + var2429
			end
		elseif var2416 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2431, var2432 = protoModule.readFixed32(p138, var2415)
			local _ = var2431
			var2415 = var2432
		elseif var2416 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2433, var2434 = protoModule.readFixed64(p138, var2415)
			local _ = var2433
			var2415 = var2434
		else
			error("Unsupported wire type: " .. var2416)
		end
	end
	return var2414
end

function t_71:jsonEncode() --[[ line: 16029 ]]
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

function t_71:jsonDecode() --[[ line: 16047 ]]
	-- upvalues: t_71 (ref), propTypesModule (ref)
	local var2436 = t_71.new()
	
	if self.event_id ~= nil then
		var2436.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var2436.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.user_rsvp ~= nil then
		var2436.user_rsvp = propTypesModule.BoolProp.jsonDecode(self.user_rsvp)
	end
	if self.userRsvp ~= nil then
		var2436.user_rsvp = propTypesModule.BoolProp.jsonDecode(self.userRsvp)
	end
	if self.notifications_modal_identifier ~= nil then
		var2436.notifications_modal_identifier = propTypesModule.StringProp.jsonDecode(self.notifications_modal_identifier)
	end
	if self.notificationsModalIdentifier ~= nil then
		var2436.notifications_modal_identifier = propTypesModule.StringProp.jsonDecode(self.notificationsModalIdentifier)
	end
	return var2436
end

t_71.descriptor = {
	name = "RsvpToEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RsvpToEventAction_Params = t_71
typeRegistryModule.default:register(t.RsvpToEventAction_Params)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p139) --[[ line: 16097 ]]
	-- upvalues: t (ref), t_72 (ref)
	return setmetatable({
		action_type = if p139 == nil or p139.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p139.action_type,
		action_params = if p139 == nil or p139.action_params == nil then nil else p139.action_params
	}, t_72)
end

function t_72:encode() --[[ line: 16106 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2438 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2439, var2440 = protoModule.writeTag(buff, var2438, 1, protoModule.wireTypes.varint)
		var2439, var2440 = protoModule.writeVarInt(var2439, var2440, t.ActionType.toNumber(self.action_type))
		buff = var2439
		var2438 = var2440
	end
	if self.action_params ~= nil then
		local var2441 = self.action_params:encode()
		local var2442, var2443 = protoModule.writeTag(buff, var2438, 2, protoModule.wireTypes.lengthDelimited)
		var2442, var2443 = protoModule.writeBuffer(var2442, var2443, var2441, buffer.len(var2441))
		buff = var2442
		var2438 = var2443
	end
	local buff_1 = buffer.create(var2438)
	buffer.copy(buff_1, 0, buff, 0, var2438)
	
	return buff_1
end

function t_72.decode(p140) --[[ line: 16132 ]]
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var2445 = t_72.new()
	local var2446 = 0
	while var2446 < buffer.len(p140) do
		local _ = nil
		local var2447 = nil
		local var2448, var2449, var2450 = protoModule.readTag(p140, var2446)
		local var2451 = var2448
		var2447 = var2449
		var2446 = var2450
		
		if var2447 == protoModule.wireTypes.varint then
			if var2451 == 1 then
				local _ = nil
				local var2452, var2453 = protoModule.readVarIntI32(p140, var2446)
				local var2454 = var2452
				var2446 = var2453
				var2445.action_type = t.ActionType.fromNumber(var2454) or var2454
			else
				local _ = nil
				local var2455, var2456 = protoModule.readVarInt(p140, var2446)
				local _ = var2455
				var2446 = var2456
			end
		end
		if var2447 == protoModule.wireTypes.lengthDelimited then
			if var2451 == 2 then
				local _ = nil
				local var2457, var2458 = protoModule.readBuffer(p140, var2446)
				var2446 = var2458
				var2445.action_params = t.OpenEventDetailsAction_Params.decode(var2457)
			else
				local _ = nil
				local var2459, var2460 = protoModule.readVarInt(p140, var2446)
				var2446 = var2460 + var2459
			end
		elseif var2447 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2461, var2462 = protoModule.readFixed32(p140, var2446)
			local _ = var2461
			var2446 = var2462
		elseif var2447 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2463, var2464 = protoModule.readFixed64(p140, var2446)
			local _ = var2463
			var2446 = var2464
		else
			error("Unsupported wire type: " .. var2447)
		end
	end
	return var2445
end

function t_72:jsonEncode() --[[ line: 16180 ]]
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

function t_72:jsonDecode() --[[ line: 16202 ]]
	-- upvalues: t_72 (ref), t (ref)
	local var2466 = t_72.new()
	
	if self.action_type ~= nil then
		var2466.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2466.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2466.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2466.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var2466
end

t_72.descriptor = {
	name = "OpenEventDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenEventDetailsAction"
}
t.OpenEventDetailsAction = t_72
typeRegistryModule.default:register(t.OpenEventDetailsAction)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p141) --[[ line: 16242 ]]
	-- upvalues: t_73 (ref)
	return setmetatable({
		event_id = if p141 == nil or p141.event_id == nil then nil else p141.event_id
	}, t_73)
end

function t_73:encode() --[[ line: 16250 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2468 = 0
	
	if self.event_id ~= nil then
		local var2469 = self.event_id:encode()
		local var2470, var2471 = protoModule.writeTag(buff, var2468, 1, protoModule.wireTypes.lengthDelimited)
		var2470, var2471 = protoModule.writeBuffer(var2470, var2471, var2469, buffer.len(var2469))
		buff = var2470
		var2468 = var2471
	end
	local buff_1 = buffer.create(var2468)
	buffer.copy(buff_1, 0, buff, 0, var2468)
	
	return buff_1
end

function t_73.decode(p142) --[[ line: 16265 ]]
	-- upvalues: t_73 (ref), protoModule (ref), propTypesModule (ref)
	local var2473 = t_73.new()
	local var2474 = 0
	while var2474 < buffer.len(p142) do
		local _ = nil
		local var2475 = nil
		local var2476, var2477, var2478 = protoModule.readTag(p142, var2474)
		local var2479 = var2476
		var2475 = var2477
		var2474 = var2478
		
		if var2475 == protoModule.wireTypes.varint then
			local _ = nil
			local var2480, var2481 = protoModule.readVarInt(p142, var2474)
			local _ = var2480
			var2474 = var2481
			continue
		end
		if var2475 == protoModule.wireTypes.lengthDelimited then
			if var2479 == 1 then
				local _ = nil
				local var2482, var2483 = protoModule.readBuffer(p142, var2474)
				var2474 = var2483
				var2473.event_id = propTypesModule.StringProp.decode(var2482)
			else
				local _ = nil
				local var2484, var2485 = protoModule.readVarInt(p142, var2474)
				var2474 = var2485 + var2484
			end
		elseif var2475 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2486, var2487 = protoModule.readFixed32(p142, var2474)
			local _ = var2486
			var2474 = var2487
		elseif var2475 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2488, var2489 = protoModule.readFixed64(p142, var2474)
			local _ = var2488
			var2474 = var2489
		else
			error("Unsupported wire type: " .. var2475)
		end
	end
	return var2473
end

function t_73:jsonEncode() --[[ line: 16308 ]]
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_73:jsonDecode() --[[ line: 16318 ]]
	-- upvalues: t_73 (ref), propTypesModule (ref)
	local var2491 = t_73.new()
	
	if self.event_id ~= nil then
		var2491.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var2491.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var2491
end

t_73.descriptor = {
	name = "OpenEventDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenEventDetailsAction_Params = t_73
typeRegistryModule.default:register(t.OpenEventDetailsAction_Params)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p143) --[[ line: 16346 ]]
	-- upvalues: t (ref), t_74 (ref)
	return setmetatable({
		action_type = if p143 == nil or p143.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p143.action_type,
		action_params = if p143 == nil or p143.action_params == nil then nil else p143.action_params
	}, t_74)
end

function t_74:encode() --[[ line: 16355 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2493 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2494, var2495 = protoModule.writeTag(buff, var2493, 1, protoModule.wireTypes.varint)
		var2494, var2495 = protoModule.writeVarInt(var2494, var2495, t.ActionType.toNumber(self.action_type))
		buff = var2494
		var2493 = var2495
	end
	if self.action_params ~= nil then
		local var2496 = self.action_params:encode()
		local var2497, var2498 = protoModule.writeTag(buff, var2493, 2, protoModule.wireTypes.lengthDelimited)
		var2497, var2498 = protoModule.writeBuffer(var2497, var2498, var2496, buffer.len(var2496))
		buff = var2497
		var2493 = var2498
	end
	local buff_1 = buffer.create(var2493)
	buffer.copy(buff_1, 0, buff, 0, var2493)
	
	return buff_1
end

function t_74.decode(p144) --[[ line: 16381 ]]
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var2500 = t_74.new()
	local var2501 = 0
	while var2501 < buffer.len(p144) do
		local _ = nil
		local var2502 = nil
		local var2503, var2504, var2505 = protoModule.readTag(p144, var2501)
		local var2506 = var2503
		var2502 = var2504
		var2501 = var2505
		
		if var2502 == protoModule.wireTypes.varint then
			if var2506 == 1 then
				local _ = nil
				local var2507, var2508 = protoModule.readVarIntI32(p144, var2501)
				local var2509 = var2507
				var2501 = var2508
				var2500.action_type = t.ActionType.fromNumber(var2509) or var2509
			else
				local _ = nil
				local var2510, var2511 = protoModule.readVarInt(p144, var2501)
				local _ = var2510
				var2501 = var2511
			end
		end
		if var2502 == protoModule.wireTypes.lengthDelimited then
			if var2506 == 2 then
				local _ = nil
				local var2512, var2513 = protoModule.readBuffer(p144, var2501)
				var2501 = var2513
				var2500.action_params = t.OpenBadgesSeeAllAction_Params.decode(var2512)
			else
				local _ = nil
				local var2514, var2515 = protoModule.readVarInt(p144, var2501)
				var2501 = var2515 + var2514
			end
		elseif var2502 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2516, var2517 = protoModule.readFixed32(p144, var2501)
			local _ = var2516
			var2501 = var2517
		elseif var2502 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2518, var2519 = protoModule.readFixed64(p144, var2501)
			local _ = var2518
			var2501 = var2519
		else
			error("Unsupported wire type: " .. var2502)
		end
	end
	return var2500
end

function t_74:jsonEncode() --[[ line: 16429 ]]
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

function t_74:jsonDecode() --[[ line: 16451 ]]
	-- upvalues: t_74 (ref), t (ref)
	local var2521 = t_74.new()
	
	if self.action_type ~= nil then
		var2521.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2521.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2521.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2521.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var2521
end

t_74.descriptor = {
	name = "OpenBadgesSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgesSeeAllAction"
}
t.OpenBadgesSeeAllAction = t_74
typeRegistryModule.default:register(t.OpenBadgesSeeAllAction)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p145) --[[ line: 16491 ]]
	-- upvalues: t_75 (ref)
	return setmetatable({
		universe_id = if p145 == nil or p145.universe_id == nil then nil else p145.universe_id
	}, t_75)
end

function t_75:encode() --[[ line: 16499 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2523 = 0
	
	if self.universe_id ~= nil then
		local var2524 = self.universe_id:encode()
		local var2525, var2526 = protoModule.writeTag(buff, var2523, 1, protoModule.wireTypes.lengthDelimited)
		var2525, var2526 = protoModule.writeBuffer(var2525, var2526, var2524, buffer.len(var2524))
		buff = var2525
		var2523 = var2526
	end
	local buff_1 = buffer.create(var2523)
	buffer.copy(buff_1, 0, buff, 0, var2523)
	
	return buff_1
end

function t_75.decode(p146) --[[ line: 16514 ]]
	-- upvalues: t_75 (ref), protoModule (ref), propTypesModule (ref)
	local var2528 = t_75.new()
	local var2529 = 0
	while var2529 < buffer.len(p146) do
		local _ = nil
		local var2530 = nil
		local var2531, var2532, var2533 = protoModule.readTag(p146, var2529)
		local var2534 = var2531
		var2530 = var2532
		var2529 = var2533
		
		if var2530 == protoModule.wireTypes.varint then
			local _ = nil
			local var2535, var2536 = protoModule.readVarInt(p146, var2529)
			local _ = var2535
			var2529 = var2536
			continue
		end
		if var2530 == protoModule.wireTypes.lengthDelimited then
			if var2534 == 1 then
				local _ = nil
				local var2537, var2538 = protoModule.readBuffer(p146, var2529)
				var2529 = var2538
				var2528.universe_id = propTypesModule.StringProp.decode(var2537)
			else
				local _ = nil
				local var2539, var2540 = protoModule.readVarInt(p146, var2529)
				var2529 = var2540 + var2539
			end
		elseif var2530 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2541, var2542 = protoModule.readFixed32(p146, var2529)
			local _ = var2541
			var2529 = var2542
		elseif var2530 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2543, var2544 = protoModule.readFixed64(p146, var2529)
			local _ = var2543
			var2529 = var2544
		else
			error("Unsupported wire type: " .. var2530)
		end
	end
	return var2528
end

function t_75:jsonEncode() --[[ line: 16557 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_75:jsonDecode() --[[ line: 16567 ]]
	-- upvalues: t_75 (ref), propTypesModule (ref)
	local var2546 = t_75.new()
	
	if self.universe_id ~= nil then
		var2546.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2546.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var2546
end

t_75.descriptor = {
	name = "OpenBadgesSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenBadgesSeeAllAction_Params = t_75
typeRegistryModule.default:register(t.OpenBadgesSeeAllAction_Params)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p147) --[[ line: 16596 ]]
	-- upvalues: t (ref), t_76 (ref)
	return setmetatable({
		action_type = if p147 == nil or p147.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p147.action_type,
		action_params = if p147 == nil or p147.action_params == nil then nil else p147.action_params
	}, t_76)
end

function t_76:encode() --[[ line: 16607 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2548 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2549, var2550 = protoModule.writeTag(buff, var2548, 1, protoModule.wireTypes.varint)
		var2549, var2550 = protoModule.writeVarInt(var2549, var2550, t.ActionType.toNumber(self.action_type))
		buff = var2549
		var2548 = var2550
	end
	if self.action_params ~= nil then
		local var2551 = self.action_params:encode()
		local var2552, var2553 = protoModule.writeTag(buff, var2548, 2, protoModule.wireTypes.lengthDelimited)
		var2552, var2553 = protoModule.writeBuffer(var2552, var2553, var2551, buffer.len(var2551))
		buff = var2552
		var2548 = var2553
	end
	local buff_1 = buffer.create(var2548)
	buffer.copy(buff_1, 0, buff, 0, var2548)
	
	return buff_1
end

function t_76.decode(p148) --[[ line: 16633 ]]
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var2555 = t_76.new()
	local var2556 = 0
	while var2556 < buffer.len(p148) do
		local _ = nil
		local var2557 = nil
		local var2558, var2559, var2560 = protoModule.readTag(p148, var2556)
		local var2561 = var2558
		var2557 = var2559
		var2556 = var2560
		
		if var2557 == protoModule.wireTypes.varint then
			if var2561 == 1 then
				local _ = nil
				local var2562, var2563 = protoModule.readVarIntI32(p148, var2556)
				local var2564 = var2562
				var2556 = var2563
				var2555.action_type = t.ActionType.fromNumber(var2564) or var2564
			else
				local _ = nil
				local var2565, var2566 = protoModule.readVarInt(p148, var2556)
				local _ = var2565
				var2556 = var2566
			end
		end
		if var2557 == protoModule.wireTypes.lengthDelimited then
			if var2561 == 2 then
				local _ = nil
				local var2567, var2568 = protoModule.readBuffer(p148, var2556)
				var2556 = var2568
				var2555.action_params = t.OpenExperienceStoreSeeAllAction_Params.decode(var2567)
			else
				local _ = nil
				local var2569, var2570 = protoModule.readVarInt(p148, var2556)
				var2556 = var2570 + var2569
			end
		elseif var2557 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2571, var2572 = protoModule.readFixed32(p148, var2556)
			local _ = var2571
			var2556 = var2572
		elseif var2557 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2573, var2574 = protoModule.readFixed64(p148, var2556)
			local _ = var2573
			var2556 = var2574
		else
			error("Unsupported wire type: " .. var2557)
		end
	end
	return var2555
end

function t_76:jsonEncode() --[[ line: 16681 ]]
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

function t_76:jsonDecode() --[[ line: 16703 ]]
	-- upvalues: t_76 (ref), t (ref)
	local var2576 = t_76.new()
	
	if self.action_type ~= nil then
		var2576.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2576.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2576.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2576.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var2576
end

t_76.descriptor = {
	name = "OpenExperienceStoreSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenExperienceStoreSeeAllAction"
}
t.OpenExperienceStoreSeeAllAction = t_76
typeRegistryModule.default:register(t.OpenExperienceStoreSeeAllAction)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p149) --[[ line: 16743 ]]
	-- upvalues: t_77 (ref)
	return setmetatable({
		universe_id = if p149 == nil or p149.universe_id == nil then nil else p149.universe_id
	}, t_77)
end

function t_77:encode() --[[ line: 16751 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2578 = 0
	
	if self.universe_id ~= nil then
		local var2579 = self.universe_id:encode()
		local var2580, var2581 = protoModule.writeTag(buff, var2578, 1, protoModule.wireTypes.lengthDelimited)
		var2580, var2581 = protoModule.writeBuffer(var2580, var2581, var2579, buffer.len(var2579))
		buff = var2580
		var2578 = var2581
	end
	local buff_1 = buffer.create(var2578)
	buffer.copy(buff_1, 0, buff, 0, var2578)
	
	return buff_1
end

function t_77.decode(p150) --[[ line: 16766 ]]
	-- upvalues: t_77 (ref), protoModule (ref), propTypesModule (ref)
	local var2583 = t_77.new()
	local var2584 = 0
	while var2584 < buffer.len(p150) do
		local _ = nil
		local var2585 = nil
		local var2586, var2587, var2588 = protoModule.readTag(p150, var2584)
		local var2589 = var2586
		var2585 = var2587
		var2584 = var2588
		
		if var2585 == protoModule.wireTypes.varint then
			local _ = nil
			local var2590, var2591 = protoModule.readVarInt(p150, var2584)
			local _ = var2590
			var2584 = var2591
			continue
		end
		if var2585 == protoModule.wireTypes.lengthDelimited then
			if var2589 == 1 then
				local _ = nil
				local var2592, var2593 = protoModule.readBuffer(p150, var2584)
				var2584 = var2593
				var2583.universe_id = propTypesModule.StringProp.decode(var2592)
			else
				local _ = nil
				local var2594, var2595 = protoModule.readVarInt(p150, var2584)
				var2584 = var2595 + var2594
			end
		elseif var2585 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2596, var2597 = protoModule.readFixed32(p150, var2584)
			local _ = var2596
			var2584 = var2597
		elseif var2585 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2598, var2599 = protoModule.readFixed64(p150, var2584)
			local _ = var2598
			var2584 = var2599
		else
			error("Unsupported wire type: " .. var2585)
		end
	end
	return var2583
end

function t_77:jsonEncode() --[[ line: 16809 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_77:jsonDecode() --[[ line: 16819 ]]
	-- upvalues: t_77 (ref), propTypesModule (ref)
	local var2601 = t_77.new()
	
	if self.universe_id ~= nil then
		var2601.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2601.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var2601
end

t_77.descriptor = {
	name = "OpenExperienceStoreSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenExperienceStoreSeeAllAction_Params = t_77
typeRegistryModule.default:register(t.OpenExperienceStoreSeeAllAction_Params)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p151) --[[ line: 16850 ]]
	-- upvalues: t (ref), t_78 (ref)
	return setmetatable({
		action_type = if p151 == nil or p151.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p151.action_type,
		action_params = if p151 == nil or p151.action_params == nil then nil else p151.action_params
	}, t_78)
end

function t_78:encode() --[[ line: 16861 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2603 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2604, var2605 = protoModule.writeTag(buff, var2603, 1, protoModule.wireTypes.varint)
		var2604, var2605 = protoModule.writeVarInt(var2604, var2605, t.ActionType.toNumber(self.action_type))
		buff = var2604
		var2603 = var2605
	end
	if self.action_params ~= nil then
		local var2606 = self.action_params:encode()
		local var2607, var2608 = protoModule.writeTag(buff, var2603, 2, protoModule.wireTypes.lengthDelimited)
		var2607, var2608 = protoModule.writeBuffer(var2607, var2608, var2606, buffer.len(var2606))
		buff = var2607
		var2603 = var2608
	end
	local buff_1 = buffer.create(var2603)
	buffer.copy(buff_1, 0, buff, 0, var2603)
	
	return buff_1
end

function t_78.decode(p152) --[[ line: 16887 ]]
	-- upvalues: t_78 (ref), protoModule (ref), t (ref)
	local var2610 = t_78.new()
	local var2611 = 0
	while var2611 < buffer.len(p152) do
		local _ = nil
		local var2612 = nil
		local var2613, var2614, var2615 = protoModule.readTag(p152, var2611)
		local var2616 = var2613
		var2612 = var2614
		var2611 = var2615
		
		if var2612 == protoModule.wireTypes.varint then
			if var2616 == 1 then
				local _ = nil
				local var2617, var2618 = protoModule.readVarIntI32(p152, var2611)
				local var2619 = var2617
				var2611 = var2618
				var2610.action_type = t.ActionType.fromNumber(var2619) or var2619
			else
				local _ = nil
				local var2620, var2621 = protoModule.readVarInt(p152, var2611)
				local _ = var2620
				var2611 = var2621
			end
		end
		if var2612 == protoModule.wireTypes.lengthDelimited then
			if var2616 == 2 then
				local _ = nil
				local var2622, var2623 = protoModule.readBuffer(p152, var2611)
				var2611 = var2623
				var2610.action_params = t.OpenSubscriptionPurchasePageAction_Params.decode(var2622)
			else
				local _ = nil
				local var2624, var2625 = protoModule.readVarInt(p152, var2611)
				var2611 = var2625 + var2624
			end
		elseif var2612 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2626, var2627 = protoModule.readFixed32(p152, var2611)
			local _ = var2626
			var2611 = var2627
		elseif var2612 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2628, var2629 = protoModule.readFixed64(p152, var2611)
			local _ = var2628
			var2611 = var2629
		else
			error("Unsupported wire type: " .. var2612)
		end
	end
	return var2610
end

function t_78:jsonEncode() --[[ line: 16935 ]]
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

function t_78:jsonDecode() --[[ line: 16957 ]]
	-- upvalues: t_78 (ref), t (ref)
	local var2631 = t_78.new()
	
	if self.action_type ~= nil then
		var2631.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2631.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2631.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2631.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.actionParams)
	end
	return var2631
end

t_78.descriptor = {
	name = "OpenSubscriptionPurchasePageAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSubscriptionPurchasePageAction"
}
t.OpenSubscriptionPurchasePageAction = t_78
typeRegistryModule.default:register(t.OpenSubscriptionPurchasePageAction)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p153) --[[ line: 16999 ]]
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

function t_79:encode() --[[ line: 17019 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2633 = 0
	
	if self.subscription_id ~= nil then
		local var2634 = self.subscription_id:encode()
		local var2635, var2636 = protoModule.writeTag(buff, var2633, 1, protoModule.wireTypes.lengthDelimited)
		var2635, var2636 = protoModule.writeBuffer(var2635, var2636, var2634, buffer.len(var2634))
		buff = var2635
		var2633 = var2636
	end
	if self.universe_id ~= nil then
		local var2637 = self.universe_id:encode()
		local var2638, var2639 = protoModule.writeTag(buff, var2633, 2, protoModule.wireTypes.lengthDelimited)
		var2638, var2639 = protoModule.writeBuffer(var2638, var2639, var2637, buffer.len(var2637))
		buff = var2638
		var2633 = var2639
	end
	if self.creator_name ~= nil then
		local var2640 = self.creator_name:encode()
		local var2641, var2642 = protoModule.writeTag(buff, var2633, 3, protoModule.wireTypes.lengthDelimited)
		var2641, var2642 = protoModule.writeBuffer(var2641, var2642, var2640, buffer.len(var2640))
		buff = var2641
		var2633 = var2642
	end
	if self.creator_verified ~= nil then
		local var2643 = self.creator_verified:encode()
		local var2644, var2645 = protoModule.writeTag(buff, var2633, 4, protoModule.wireTypes.lengthDelimited)
		var2644, var2645 = protoModule.writeBuffer(var2644, var2645, var2643, buffer.len(var2643))
		buff = var2644
		var2633 = var2645
	end
	if self.name ~= nil then
		local var2646 = self.name:encode()
		local var2647, var2648 = protoModule.writeTag(buff, var2633, 5, protoModule.wireTypes.lengthDelimited)
		var2647, var2648 = protoModule.writeBuffer(var2647, var2648, var2646, buffer.len(var2646))
		buff = var2647
		var2633 = var2648
	end
	if self.description ~= nil then
		local var2649 = self.description:encode()
		local var2650, var2651 = protoModule.writeTag(buff, var2633, 6, protoModule.wireTypes.lengthDelimited)
		var2650, var2651 = protoModule.writeBuffer(var2650, var2651, var2649, buffer.len(var2649))
		buff = var2650
		var2633 = var2651
	end
	if self.image_asset_id ~= nil then
		local var2652 = self.image_asset_id:encode()
		local var2653, var2654 = protoModule.writeTag(buff, var2633, 7, protoModule.wireTypes.lengthDelimited)
		var2653, var2654 = protoModule.writeBuffer(var2653, var2654, var2652, buffer.len(var2652))
		buff = var2653
		var2633 = var2654
	end
	if self.period_type ~= nil then
		local var2655 = self.period_type:encode()
		local var2656, var2657 = protoModule.writeTag(buff, var2633, 8, protoModule.wireTypes.lengthDelimited)
		var2656, var2657 = protoModule.writeBuffer(var2656, var2657, var2655, buffer.len(var2655))
		buff = var2656
		var2633 = var2657
	end
	if self.is_subscribed ~= nil then
		local var2658 = self.is_subscribed:encode()
		local var2659, var2660 = protoModule.writeTag(buff, var2633, 9, protoModule.wireTypes.lengthDelimited)
		var2659, var2660 = protoModule.writeBuffer(var2659, var2660, var2658, buffer.len(var2658))
		buff = var2659
		var2633 = var2660
	end
	if self.price_display ~= nil then
		local var2661 = self.price_display:encode()
		local var2662, var2663 = protoModule.writeTag(buff, var2633, 10, protoModule.wireTypes.lengthDelimited)
		var2662, var2663 = protoModule.writeBuffer(var2662, var2663, var2661, buffer.len(var2661))
		buff = var2662
		var2633 = var2663
	end
	if self.price_in_robux ~= nil then
		local var2664 = self.price_in_robux:encode()
		local var2665, var2666 = protoModule.writeTag(buff, var2633, 11, protoModule.wireTypes.lengthDelimited)
		var2665, var2666 = protoModule.writeBuffer(var2665, var2666, var2664, buffer.len(var2664))
		buff = var2665
		var2633 = var2666
	end
	if self.price_tier ~= nil then
		local var2667 = self.price_tier:encode()
		local var2668, var2669 = protoModule.writeTag(buff, var2633, 12, protoModule.wireTypes.lengthDelimited)
		var2668, var2669 = protoModule.writeBuffer(var2668, var2669, var2667, buffer.len(var2667))
		buff = var2668
		var2633 = var2669
	end
	if self.thumbnail_string ~= nil then
		local var2670 = self.thumbnail_string:encode()
		local var2671, var2672 = protoModule.writeTag(buff, var2633, 13, protoModule.wireTypes.lengthDelimited)
		var2671, var2672 = protoModule.writeBuffer(var2671, var2672, var2670, buffer.len(var2670))
		buff = var2671
		var2633 = var2672
	end
	local buff_1 = buffer.create(var2633)
	buffer.copy(buff_1, 0, buff, 0, var2633)
	
	return buff_1
end

function t_79.decode(p154) --[[ line: 17108 ]]
	-- upvalues: t_79 (ref), protoModule (ref), propTypesModule (ref)
	local var2674 = t_79.new()
	local var2675 = 0
	while var2675 < buffer.len(p154) do
		local _ = nil
		local var2676 = nil
		local var2677, var2678, var2679 = protoModule.readTag(p154, var2675)
		local var2680 = var2677
		var2676 = var2678
		var2675 = var2679
		
		if var2676 == protoModule.wireTypes.varint then
			local _ = nil
			local var2681, var2682 = protoModule.readVarInt(p154, var2675)
			local _ = var2681
			var2675 = var2682
			continue
		end
		if var2676 == protoModule.wireTypes.lengthDelimited then
			if var2680 == 1 then
				local _ = nil
				local var2683, var2684 = protoModule.readBuffer(p154, var2675)
				var2675 = var2684
				var2674.subscription_id = propTypesModule.StringProp.decode(var2683)
			elseif var2680 == 2 then
				local _ = nil
				local var2685, var2686 = protoModule.readBuffer(p154, var2675)
				var2675 = var2686
				var2674.universe_id = propTypesModule.StringProp.decode(var2685)
			elseif var2680 == 3 then
				local _ = nil
				local var2687, var2688 = protoModule.readBuffer(p154, var2675)
				var2675 = var2688
				var2674.creator_name = propTypesModule.StringProp.decode(var2687)
			elseif var2680 == 4 then
				local _ = nil
				local var2689, var2690 = protoModule.readBuffer(p154, var2675)
				var2675 = var2690
				var2674.creator_verified = propTypesModule.BoolProp.decode(var2689)
			elseif var2680 == 5 then
				local _ = nil
				local var2691, var2692 = protoModule.readBuffer(p154, var2675)
				var2675 = var2692
				var2674.name = propTypesModule.StringProp.decode(var2691)
			elseif var2680 == 6 then
				local _ = nil
				local var2693, var2694 = protoModule.readBuffer(p154, var2675)
				var2675 = var2694
				var2674.description = propTypesModule.StringProp.decode(var2693)
			elseif var2680 == 7 then
				local _ = nil
				local var2695, var2696 = protoModule.readBuffer(p154, var2675)
				var2675 = var2696
				var2674.image_asset_id = propTypesModule.Int64Prop.decode(var2695)
			elseif var2680 == 8 then
				local _ = nil
				local var2697, var2698 = protoModule.readBuffer(p154, var2675)
				var2675 = var2698
				var2674.period_type = propTypesModule.StringProp.decode(var2697)
			elseif var2680 == 9 then
				local _ = nil
				local var2699, var2700 = protoModule.readBuffer(p154, var2675)
				var2675 = var2700
				var2674.is_subscribed = propTypesModule.BoolProp.decode(var2699)
			elseif var2680 == 10 then
				local _ = nil
				local var2701, var2702 = protoModule.readBuffer(p154, var2675)
				var2675 = var2702
				var2674.price_display = propTypesModule.StringProp.decode(var2701)
			elseif var2680 == 11 then
				local _ = nil
				local var2703, var2704 = protoModule.readBuffer(p154, var2675)
				var2675 = var2704
				var2674.price_in_robux = propTypesModule.Int64Prop.decode(var2703)
			elseif var2680 == 12 then
				local _ = nil
				local var2705, var2706 = protoModule.readBuffer(p154, var2675)
				var2675 = var2706
				var2674.price_tier = propTypesModule.Int64Prop.decode(var2705)
			elseif var2680 == 13 then
				local _ = nil
				local var2707, var2708 = protoModule.readBuffer(p154, var2675)
				var2675 = var2708
				var2674.thumbnail_string = propTypesModule.StringProp.decode(var2707)
			else
				local _ = nil
				local var2709, var2710 = protoModule.readVarInt(p154, var2675)
				var2675 = var2710 + var2709
			end
		elseif var2676 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2711, var2712 = protoModule.readFixed32(p154, var2675)
			local _ = var2711
			var2675 = var2712
		elseif var2676 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2713, var2714 = protoModule.readFixed64(p154, var2675)
			local _ = var2713
			var2675 = var2714
		else
			error("Unsupported wire type: " .. var2676)
		end
	end
	return var2674
end

function t_79:jsonEncode() --[[ line: 17213 ]]
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

function t_79:jsonDecode() --[[ line: 17273 ]]
	-- upvalues: t_79 (ref), propTypesModule (ref)
	local var2716 = t_79.new()
	
	if self.subscription_id ~= nil then
		var2716.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		var2716.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		var2716.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2716.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.creator_name ~= nil then
		var2716.creator_name = propTypesModule.StringProp.jsonDecode(self.creator_name)
	end
	if self.creatorName ~= nil then
		var2716.creator_name = propTypesModule.StringProp.jsonDecode(self.creatorName)
	end
	if self.creator_verified ~= nil then
		var2716.creator_verified = propTypesModule.BoolProp.jsonDecode(self.creator_verified)
	end
	if self.creatorVerified ~= nil then
		var2716.creator_verified = propTypesModule.BoolProp.jsonDecode(self.creatorVerified)
	end
	if self.name ~= nil then
		var2716.name = propTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.description ~= nil then
		var2716.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_asset_id ~= nil then
		var2716.image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.image_asset_id)
	end
	if self.imageAssetId ~= nil then
		var2716.image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.imageAssetId)
	end
	if self.period_type ~= nil then
		var2716.period_type = propTypesModule.StringProp.jsonDecode(self.period_type)
	end
	if self.periodType ~= nil then
		var2716.period_type = propTypesModule.StringProp.jsonDecode(self.periodType)
	end
	if self.is_subscribed ~= nil then
		var2716.is_subscribed = propTypesModule.BoolProp.jsonDecode(self.is_subscribed)
	end
	if self.isSubscribed ~= nil then
		var2716.is_subscribed = propTypesModule.BoolProp.jsonDecode(self.isSubscribed)
	end
	if self.price_display ~= nil then
		var2716.price_display = propTypesModule.StringProp.jsonDecode(self.price_display)
	end
	if self.priceDisplay ~= nil then
		var2716.price_display = propTypesModule.StringProp.jsonDecode(self.priceDisplay)
	end
	if self.price_in_robux ~= nil then
		var2716.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		var2716.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.price_tier ~= nil then
		var2716.price_tier = propTypesModule.Int64Prop.jsonDecode(self.price_tier)
	end
	if self.priceTier ~= nil then
		var2716.price_tier = propTypesModule.Int64Prop.jsonDecode(self.priceTier)
	end
	if self.thumbnail_string ~= nil then
		var2716.thumbnail_string = propTypesModule.StringProp.jsonDecode(self.thumbnail_string)
	end
	if self.thumbnailString ~= nil then
		var2716.thumbnail_string = propTypesModule.StringProp.jsonDecode(self.thumbnailString)
	end
	return var2716
end

t_79.descriptor = {
	name = "OpenSubscriptionPurchasePageAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSubscriptionPurchasePageAction_Params = t_79
typeRegistryModule.default:register(t.OpenSubscriptionPurchasePageAction_Params)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p155) --[[ line: 17410 ]]
	-- upvalues: t (ref), t_80 (ref)
	return setmetatable({
		action_type = if p155 == nil or p155.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p155.action_type,
		action_params = if p155 == nil or p155.action_params == nil then nil else p155.action_params
	}, t_80)
end

function t_80:encode() --[[ line: 17419 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2718 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2719, var2720 = protoModule.writeTag(buff, var2718, 1, protoModule.wireTypes.varint)
		var2719, var2720 = protoModule.writeVarInt(var2719, var2720, t.ActionType.toNumber(self.action_type))
		buff = var2719
		var2718 = var2720
	end
	if self.action_params ~= nil then
		local var2721 = self.action_params:encode()
		local var2722, var2723 = protoModule.writeTag(buff, var2718, 2, protoModule.wireTypes.lengthDelimited)
		var2722, var2723 = protoModule.writeBuffer(var2722, var2723, var2721, buffer.len(var2721))
		buff = var2722
		var2718 = var2723
	end
	local buff_1 = buffer.create(var2718)
	buffer.copy(buff_1, 0, buff, 0, var2718)
	
	return buff_1
end

function t_80.decode(p156) --[[ line: 17445 ]]
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var2725 = t_80.new()
	local var2726 = 0
	while var2726 < buffer.len(p156) do
		local _ = nil
		local var2727 = nil
		local var2728, var2729, var2730 = protoModule.readTag(p156, var2726)
		local var2731 = var2728
		var2727 = var2729
		var2726 = var2730
		
		if var2727 == protoModule.wireTypes.varint then
			if var2731 == 1 then
				local _ = nil
				local var2732, var2733 = protoModule.readVarIntI32(p156, var2726)
				local var2734 = var2732
				var2726 = var2733
				var2725.action_type = t.ActionType.fromNumber(var2734) or var2734
			else
				local _ = nil
				local var2735, var2736 = protoModule.readVarInt(p156, var2726)
				local _ = var2735
				var2726 = var2736
			end
		end
		if var2727 == protoModule.wireTypes.lengthDelimited then
			if var2731 == 2 then
				local _ = nil
				local var2737, var2738 = protoModule.readBuffer(p156, var2726)
				var2726 = var2738
				var2725.action_params = t.RefreshGamePassesAction_Params.decode(var2737)
			else
				local _ = nil
				local var2739, var2740 = protoModule.readVarInt(p156, var2726)
				var2726 = var2740 + var2739
			end
		elseif var2727 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2741, var2742 = protoModule.readFixed32(p156, var2726)
			local _ = var2741
			var2726 = var2742
		elseif var2727 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2743, var2744 = protoModule.readFixed64(p156, var2726)
			local _ = var2743
			var2726 = var2744
		else
			error("Unsupported wire type: " .. var2727)
		end
	end
	return var2725
end

function t_80:jsonEncode() --[[ line: 17493 ]]
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

function t_80:jsonDecode() --[[ line: 17515 ]]
	-- upvalues: t_80 (ref), t (ref)
	local var2746 = t_80.new()
	
	if self.action_type ~= nil then
		var2746.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2746.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2746.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2746.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.actionParams)
	end
	return var2746
end

t_80.descriptor = {
	name = "RefreshGamePassesAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshGamePassesAction"
}
t.RefreshGamePassesAction = t_80
typeRegistryModule.default:register(t.RefreshGamePassesAction)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p157) --[[ line: 17555 ]]
	-- upvalues: t_81 (ref)
	return setmetatable({
		universe_id = if p157 == nil or p157.universe_id == nil then nil else p157.universe_id
	}, t_81)
end

function t_81:encode() --[[ line: 17563 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2748 = 0
	
	if self.universe_id ~= nil then
		local var2749 = self.universe_id:encode()
		local var2750, var2751 = protoModule.writeTag(buff, var2748, 1, protoModule.wireTypes.lengthDelimited)
		var2750, var2751 = protoModule.writeBuffer(var2750, var2751, var2749, buffer.len(var2749))
		buff = var2750
		var2748 = var2751
	end
	local buff_1 = buffer.create(var2748)
	buffer.copy(buff_1, 0, buff, 0, var2748)
	
	return buff_1
end

function t_81.decode(p158) --[[ line: 17578 ]]
	-- upvalues: t_81 (ref), protoModule (ref), propTypesModule (ref)
	local var2753 = t_81.new()
	local var2754 = 0
	while var2754 < buffer.len(p158) do
		local _ = nil
		local var2755 = nil
		local var2756, var2757, var2758 = protoModule.readTag(p158, var2754)
		local var2759 = var2756
		var2755 = var2757
		var2754 = var2758
		
		if var2755 == protoModule.wireTypes.varint then
			local _ = nil
			local var2760, var2761 = protoModule.readVarInt(p158, var2754)
			local _ = var2760
			var2754 = var2761
			continue
		end
		if var2755 == protoModule.wireTypes.lengthDelimited then
			if var2759 == 1 then
				local _ = nil
				local var2762, var2763 = protoModule.readBuffer(p158, var2754)
				var2754 = var2763
				var2753.universe_id = propTypesModule.StringProp.decode(var2762)
			else
				local _ = nil
				local var2764, var2765 = protoModule.readVarInt(p158, var2754)
				var2754 = var2765 + var2764
			end
		elseif var2755 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2766, var2767 = protoModule.readFixed32(p158, var2754)
			local _ = var2766
			var2754 = var2767
		elseif var2755 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2768, var2769 = protoModule.readFixed64(p158, var2754)
			local _ = var2768
			var2754 = var2769
		else
			error("Unsupported wire type: " .. var2755)
		end
	end
	return var2753
end

function t_81:jsonEncode() --[[ line: 17621 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_81:jsonDecode() --[[ line: 17631 ]]
	-- upvalues: t_81 (ref), propTypesModule (ref)
	local var2771 = t_81.new()
	
	if self.universe_id ~= nil then
		var2771.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2771.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var2771
end

t_81.descriptor = {
	name = "RefreshGamePassesAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshGamePassesAction_Params = t_81
typeRegistryModule.default:register(t.RefreshGamePassesAction_Params)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p159) --[[ line: 17660 ]]
	-- upvalues: t (ref), t_82 (ref)
	return setmetatable({
		action_type = if p159 == nil or p159.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p159.action_type,
		action_params = if p159 == nil or p159.action_params == nil then nil else p159.action_params
	}, t_82)
end

function t_82:encode() --[[ line: 17669 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2773 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2774, var2775 = protoModule.writeTag(buff, var2773, 1, protoModule.wireTypes.varint)
		var2774, var2775 = protoModule.writeVarInt(var2774, var2775, t.ActionType.toNumber(self.action_type))
		buff = var2774
		var2773 = var2775
	end
	if self.action_params ~= nil then
		local var2776 = self.action_params:encode()
		local var2777, var2778 = protoModule.writeTag(buff, var2773, 2, protoModule.wireTypes.lengthDelimited)
		var2777, var2778 = protoModule.writeBuffer(var2777, var2778, var2776, buffer.len(var2776))
		buff = var2777
		var2773 = var2778
	end
	local buff_1 = buffer.create(var2773)
	buffer.copy(buff_1, 0, buff, 0, var2773)
	
	return buff_1
end

function t_82.decode(p160) --[[ line: 17695 ]]
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var2780 = t_82.new()
	local var2781 = 0
	while var2781 < buffer.len(p160) do
		local _ = nil
		local var2782 = nil
		local var2783, var2784, var2785 = protoModule.readTag(p160, var2781)
		local var2786 = var2783
		var2782 = var2784
		var2781 = var2785
		
		if var2782 == protoModule.wireTypes.varint then
			if var2786 == 1 then
				local _ = nil
				local var2787, var2788 = protoModule.readVarIntI32(p160, var2781)
				local var2789 = var2787
				var2781 = var2788
				var2780.action_type = t.ActionType.fromNumber(var2789) or var2789
			else
				local _ = nil
				local var2790, var2791 = protoModule.readVarInt(p160, var2781)
				local _ = var2790
				var2781 = var2791
			end
		end
		if var2782 == protoModule.wireTypes.lengthDelimited then
			if var2786 == 2 then
				local _ = nil
				local var2792, var2793 = protoModule.readBuffer(p160, var2781)
				var2781 = var2793
				var2780.action_params = t.RefreshPlayabilityAction_Params.decode(var2792)
			else
				local _ = nil
				local var2794, var2795 = protoModule.readVarInt(p160, var2781)
				var2781 = var2795 + var2794
			end
		elseif var2782 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2796, var2797 = protoModule.readFixed32(p160, var2781)
			local _ = var2796
			var2781 = var2797
		elseif var2782 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2798, var2799 = protoModule.readFixed64(p160, var2781)
			local _ = var2798
			var2781 = var2799
		else
			error("Unsupported wire type: " .. var2782)
		end
	end
	return var2780
end

function t_82:jsonEncode() --[[ line: 17743 ]]
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

function t_82:jsonDecode() --[[ line: 17765 ]]
	-- upvalues: t_82 (ref), t (ref)
	local var2801 = t_82.new()
	
	if self.action_type ~= nil then
		var2801.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2801.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2801.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2801.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.actionParams)
	end
	return var2801
end

t_82.descriptor = {
	name = "RefreshPlayabilityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshPlayabilityAction"
}
t.RefreshPlayabilityAction = t_82
typeRegistryModule.default:register(t.RefreshPlayabilityAction)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p161) --[[ line: 17805 ]]
	-- upvalues: t_83 (ref)
	return setmetatable({
		universe_id = if p161 == nil or p161.universe_id == nil then nil else p161.universe_id
	}, t_83)
end

function t_83:encode() --[[ line: 17813 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2803 = 0
	
	if self.universe_id ~= nil then
		local var2804 = self.universe_id:encode()
		local var2805, var2806 = protoModule.writeTag(buff, var2803, 1, protoModule.wireTypes.lengthDelimited)
		var2805, var2806 = protoModule.writeBuffer(var2805, var2806, var2804, buffer.len(var2804))
		buff = var2805
		var2803 = var2806
	end
	local buff_1 = buffer.create(var2803)
	buffer.copy(buff_1, 0, buff, 0, var2803)
	
	return buff_1
end

function t_83.decode(p162) --[[ line: 17828 ]]
	-- upvalues: t_83 (ref), protoModule (ref), propTypesModule (ref)
	local var2808 = t_83.new()
	local var2809 = 0
	while var2809 < buffer.len(p162) do
		local _ = nil
		local var2810 = nil
		local var2811, var2812, var2813 = protoModule.readTag(p162, var2809)
		local var2814 = var2811
		var2810 = var2812
		var2809 = var2813
		
		if var2810 == protoModule.wireTypes.varint then
			local _ = nil
			local var2815, var2816 = protoModule.readVarInt(p162, var2809)
			local _ = var2815
			var2809 = var2816
			continue
		end
		if var2810 == protoModule.wireTypes.lengthDelimited then
			if var2814 == 1 then
				local _ = nil
				local var2817, var2818 = protoModule.readBuffer(p162, var2809)
				var2809 = var2818
				var2808.universe_id = propTypesModule.StringProp.decode(var2817)
			else
				local _ = nil
				local var2819, var2820 = protoModule.readVarInt(p162, var2809)
				var2809 = var2820 + var2819
			end
		elseif var2810 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2821, var2822 = protoModule.readFixed32(p162, var2809)
			local _ = var2821
			var2809 = var2822
		elseif var2810 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2823, var2824 = protoModule.readFixed64(p162, var2809)
			local _ = var2823
			var2809 = var2824
		else
			error("Unsupported wire type: " .. var2810)
		end
	end
	return var2808
end

function t_83:jsonEncode() --[[ line: 17871 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_83:jsonDecode() --[[ line: 17881 ]]
	-- upvalues: t_83 (ref), propTypesModule (ref)
	local var2826 = t_83.new()
	
	if self.universe_id ~= nil then
		var2826.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2826.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var2826
end

t_83.descriptor = {
	name = "RefreshPlayabilityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshPlayabilityAction_Params = t_83
typeRegistryModule.default:register(t.RefreshPlayabilityAction_Params)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p163) --[[ line: 17910 ]]
	-- upvalues: t (ref), t_84 (ref)
	return setmetatable({
		action_type = if p163 == nil or p163.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p163.action_type,
		action_params = if p163 == nil or p163.action_params == nil then nil else p163.action_params
	}, t_84)
end

function t_84:encode() --[[ line: 17921 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2828 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2829, var2830 = protoModule.writeTag(buff, var2828, 1, protoModule.wireTypes.varint)
		var2829, var2830 = protoModule.writeVarInt(var2829, var2830, t.ActionType.toNumber(self.action_type))
		buff = var2829
		var2828 = var2830
	end
	if self.action_params ~= nil then
		local var2831 = self.action_params:encode()
		local var2832, var2833 = protoModule.writeTag(buff, var2828, 2, protoModule.wireTypes.lengthDelimited)
		var2832, var2833 = protoModule.writeBuffer(var2832, var2833, var2831, buffer.len(var2831))
		buff = var2832
		var2828 = var2833
	end
	local buff_1 = buffer.create(var2828)
	buffer.copy(buff_1, 0, buff, 0, var2828)
	
	return buff_1
end

function t_84.decode(p164) --[[ line: 17947 ]]
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var2835 = t_84.new()
	local var2836 = 0
	while var2836 < buffer.len(p164) do
		local _ = nil
		local var2837 = nil
		local var2838, var2839, var2840 = protoModule.readTag(p164, var2836)
		local var2841 = var2838
		var2837 = var2839
		var2836 = var2840
		
		if var2837 == protoModule.wireTypes.varint then
			if var2841 == 1 then
				local _ = nil
				local var2842, var2843 = protoModule.readVarIntI32(p164, var2836)
				local var2844 = var2842
				var2836 = var2843
				var2835.action_type = t.ActionType.fromNumber(var2844) or var2844
			else
				local _ = nil
				local var2845, var2846 = protoModule.readVarInt(p164, var2836)
				local _ = var2845
				var2836 = var2846
			end
		end
		if var2837 == protoModule.wireTypes.lengthDelimited then
			if var2841 == 2 then
				local _ = nil
				local var2847, var2848 = protoModule.readBuffer(p164, var2836)
				var2836 = var2848
				var2835.action_params = t.RefreshDeveloperProductsAction_Params.decode(var2847)
			else
				local _ = nil
				local var2849, var2850 = protoModule.readVarInt(p164, var2836)
				var2836 = var2850 + var2849
			end
		elseif var2837 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2851, var2852 = protoModule.readFixed32(p164, var2836)
			local _ = var2851
			var2836 = var2852
		elseif var2837 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2853, var2854 = protoModule.readFixed64(p164, var2836)
			local _ = var2853
			var2836 = var2854
		else
			error("Unsupported wire type: " .. var2837)
		end
	end
	return var2835
end

function t_84:jsonEncode() --[[ line: 17995 ]]
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

function t_84:jsonDecode() --[[ line: 18017 ]]
	-- upvalues: t_84 (ref), t (ref)
	local var2856 = t_84.new()
	
	if self.action_type ~= nil then
		var2856.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2856.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2856.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2856.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.actionParams)
	end
	return var2856
end

t_84.descriptor = {
	name = "RefreshDeveloperProductsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshDeveloperProductsAction"
}
t.RefreshDeveloperProductsAction = t_84
typeRegistryModule.default:register(t.RefreshDeveloperProductsAction)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p165) --[[ line: 18057 ]]
	-- upvalues: t_85 (ref)
	return setmetatable({
		place_id = if p165 == nil or p165.place_id == nil then nil else p165.place_id
	}, t_85)
end

function t_85:encode() --[[ line: 18065 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2858 = 0
	
	if self.place_id ~= nil then
		local var2859 = self.place_id:encode()
		local var2860, var2861 = protoModule.writeTag(buff, var2858, 1, protoModule.wireTypes.lengthDelimited)
		var2860, var2861 = protoModule.writeBuffer(var2860, var2861, var2859, buffer.len(var2859))
		buff = var2860
		var2858 = var2861
	end
	local buff_1 = buffer.create(var2858)
	buffer.copy(buff_1, 0, buff, 0, var2858)
	
	return buff_1
end

function t_85.decode(p166) --[[ line: 18080 ]]
	-- upvalues: t_85 (ref), protoModule (ref), propTypesModule (ref)
	local var2863 = t_85.new()
	local var2864 = 0
	while var2864 < buffer.len(p166) do
		local _ = nil
		local var2865 = nil
		local var2866, var2867, var2868 = protoModule.readTag(p166, var2864)
		local var2869 = var2866
		var2865 = var2867
		var2864 = var2868
		
		if var2865 == protoModule.wireTypes.varint then
			local _ = nil
			local var2870, var2871 = protoModule.readVarInt(p166, var2864)
			local _ = var2870
			var2864 = var2871
			continue
		end
		if var2865 == protoModule.wireTypes.lengthDelimited then
			if var2869 == 1 then
				local _ = nil
				local var2872, var2873 = protoModule.readBuffer(p166, var2864)
				var2864 = var2873
				var2863.place_id = propTypesModule.StringProp.decode(var2872)
			else
				local _ = nil
				local var2874, var2875 = protoModule.readVarInt(p166, var2864)
				var2864 = var2875 + var2874
			end
		elseif var2865 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2876, var2877 = protoModule.readFixed32(p166, var2864)
			local _ = var2876
			var2864 = var2877
		elseif var2865 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2878, var2879 = protoModule.readFixed64(p166, var2864)
			local _ = var2878
			var2864 = var2879
		else
			error("Unsupported wire type: " .. var2865)
		end
	end
	return var2863
end

function t_85:jsonEncode() --[[ line: 18123 ]]
	local t = {}
	
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	return t
end

function t_85:jsonDecode() --[[ line: 18133 ]]
	-- upvalues: t_85 (ref), propTypesModule (ref)
	local var2881 = t_85.new()
	
	if self.place_id ~= nil then
		var2881.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var2881.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	return var2881
end

t_85.descriptor = {
	name = "RefreshDeveloperProductsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshDeveloperProductsAction_Params = t_85
typeRegistryModule.default:register(t.RefreshDeveloperProductsAction_Params)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p167) --[[ line: 18163 ]]
	-- upvalues: t (ref), t_86 (ref)
	return setmetatable({
		action_type = if p167 == nil or p167.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p167.action_type,
		action_params = if p167 == nil or p167.action_params == nil then nil else p167.action_params
	}, t_86)
end

function t_86:encode() --[[ line: 18172 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2883 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2884, var2885 = protoModule.writeTag(buff, var2883, 1, protoModule.wireTypes.varint)
		var2884, var2885 = protoModule.writeVarInt(var2884, var2885, t.ActionType.toNumber(self.action_type))
		buff = var2884
		var2883 = var2885
	end
	if self.action_params ~= nil then
		local var2886 = self.action_params:encode()
		local var2887, var2888 = protoModule.writeTag(buff, var2883, 2, protoModule.wireTypes.lengthDelimited)
		var2887, var2888 = protoModule.writeBuffer(var2887, var2888, var2886, buffer.len(var2886))
		buff = var2887
		var2883 = var2888
	end
	local buff_1 = buffer.create(var2883)
	buffer.copy(buff_1, 0, buff, 0, var2883)
	
	return buff_1
end

function t_86.decode(p168) --[[ line: 18198 ]]
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2890 = t_86.new()
	local var2891 = 0
	while var2891 < buffer.len(p168) do
		local _ = nil
		local var2892 = nil
		local var2893, var2894, var2895 = protoModule.readTag(p168, var2891)
		local var2896 = var2893
		var2892 = var2894
		var2891 = var2895
		
		if var2892 == protoModule.wireTypes.varint then
			if var2896 == 1 then
				local _ = nil
				local var2897, var2898 = protoModule.readVarIntI32(p168, var2891)
				local var2899 = var2897
				var2891 = var2898
				var2890.action_type = t.ActionType.fromNumber(var2899) or var2899
			else
				local _ = nil
				local var2900, var2901 = protoModule.readVarInt(p168, var2891)
				local _ = var2900
				var2891 = var2901
			end
		end
		if var2892 == protoModule.wireTypes.lengthDelimited then
			if var2896 == 2 then
				local _ = nil
				local var2902, var2903 = protoModule.readBuffer(p168, var2891)
				var2891 = var2903
				var2890.action_params = t.OpenFaeTrialUpsellAction_Params.decode(var2902)
			else
				local _ = nil
				local var2904, var2905 = protoModule.readVarInt(p168, var2891)
				var2891 = var2905 + var2904
			end
		elseif var2892 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2906, var2907 = protoModule.readFixed32(p168, var2891)
			local _ = var2906
			var2891 = var2907
		elseif var2892 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2908, var2909 = protoModule.readFixed64(p168, var2891)
			local _ = var2908
			var2891 = var2909
		else
			error("Unsupported wire type: " .. var2892)
		end
	end
	return var2890
end

function t_86:jsonEncode() --[[ line: 18246 ]]
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

function t_86:jsonDecode() --[[ line: 18268 ]]
	-- upvalues: t_86 (ref), t (ref)
	local var2911 = t_86.new()
	
	if self.action_type ~= nil then
		var2911.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2911.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2911.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2911.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.actionParams)
	end
	return var2911
end

t_86.descriptor = {
	name = "OpenFaeTrialUpsellAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenFaeTrialUpsellAction"
}
t.OpenFaeTrialUpsellAction = t_86
typeRegistryModule.default:register(t.OpenFaeTrialUpsellAction)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p169) --[[ line: 18308 ]]
	-- upvalues: t_87 (ref)
	return setmetatable({
		source = if p169 == nil or p169.source == nil then nil else p169.source,
		config_key = if p169 == nil or p169.config_key == nil then nil else p169.config_key,
		surface_key = if p169 == nil or p169.surface_key == nil then nil else p169.surface_key,
		prompt_type = if p169 == nil or p169.prompt_type == nil then nil else p169.prompt_type
	}, t_87)
end

function t_87:encode() --[[ line: 18319 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2913 = 0
	
	if self.source ~= nil then
		local var2914 = self.source:encode()
		local var2915, var2916 = protoModule.writeTag(buff, var2913, 1, protoModule.wireTypes.lengthDelimited)
		var2915, var2916 = protoModule.writeBuffer(var2915, var2916, var2914, buffer.len(var2914))
		buff = var2915
		var2913 = var2916
	end
	if self.config_key ~= nil then
		local var2917 = self.config_key:encode()
		local var2918, var2919 = protoModule.writeTag(buff, var2913, 2, protoModule.wireTypes.lengthDelimited)
		var2918, var2919 = protoModule.writeBuffer(var2918, var2919, var2917, buffer.len(var2917))
		buff = var2918
		var2913 = var2919
	end
	if self.surface_key ~= nil then
		local var2920 = self.surface_key:encode()
		local var2921, var2922 = protoModule.writeTag(buff, var2913, 3, protoModule.wireTypes.lengthDelimited)
		var2921, var2922 = protoModule.writeBuffer(var2921, var2922, var2920, buffer.len(var2920))
		buff = var2921
		var2913 = var2922
	end
	if self.prompt_type ~= nil then
		local var2923 = self.prompt_type:encode()
		local var2924, var2925 = protoModule.writeTag(buff, var2913, 4, protoModule.wireTypes.lengthDelimited)
		var2924, var2925 = protoModule.writeBuffer(var2924, var2925, var2923, buffer.len(var2923))
		buff = var2924
		var2913 = var2925
	end
	local buff_1 = buffer.create(var2913)
	buffer.copy(buff_1, 0, buff, 0, var2913)
	
	return buff_1
end

function t_87.decode(p170) --[[ line: 18352 ]]
	-- upvalues: t_87 (ref), protoModule (ref), propTypesModule (ref)
	local var2927 = t_87.new()
	local var2928 = 0
	while var2928 < buffer.len(p170) do
		local _ = nil
		local var2929 = nil
		local var2930, var2931, var2932 = protoModule.readTag(p170, var2928)
		local var2933 = var2930
		var2929 = var2931
		var2928 = var2932
		
		if var2929 == protoModule.wireTypes.varint then
			local _ = nil
			local var2934, var2935 = protoModule.readVarInt(p170, var2928)
			local _ = var2934
			var2928 = var2935
			continue
		end
		if var2929 == protoModule.wireTypes.lengthDelimited then
			if var2933 == 1 then
				local _ = nil
				local var2936, var2937 = protoModule.readBuffer(p170, var2928)
				var2928 = var2937
				var2927.source = propTypesModule.StringProp.decode(var2936)
			elseif var2933 == 2 then
				local _ = nil
				local var2938, var2939 = protoModule.readBuffer(p170, var2928)
				var2928 = var2939
				var2927.config_key = propTypesModule.StringProp.decode(var2938)
			elseif var2933 == 3 then
				local _ = nil
				local var2940, var2941 = protoModule.readBuffer(p170, var2928)
				var2928 = var2941
				var2927.surface_key = propTypesModule.StringProp.decode(var2940)
			elseif var2933 == 4 then
				local _ = nil
				local var2942, var2943 = protoModule.readBuffer(p170, var2928)
				var2928 = var2943
				var2927.prompt_type = propTypesModule.StringProp.decode(var2942)
			else
				local _ = nil
				local var2944, var2945 = protoModule.readVarInt(p170, var2928)
				var2928 = var2945 + var2944
			end
		elseif var2929 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2946, var2947 = protoModule.readFixed32(p170, var2928)
			local _ = var2946
			var2928 = var2947
		elseif var2929 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2948, var2949 = protoModule.readFixed64(p170, var2928)
			local _ = var2948
			var2928 = var2949
		else
			error("Unsupported wire type: " .. var2929)
		end
	end
	return var2927
end

function t_87:jsonEncode() --[[ line: 18410 ]]
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

function t_87:jsonDecode() --[[ line: 18432 ]]
	-- upvalues: t_87 (ref), propTypesModule (ref)
	local var2951 = t_87.new()
	
	if self.source ~= nil then
		var2951.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.config_key ~= nil then
		var2951.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var2951.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.surface_key ~= nil then
		var2951.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var2951.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.prompt_type ~= nil then
		var2951.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var2951.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	return var2951
end

t_87.descriptor = {
	name = "OpenFaeTrialUpsellAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenFaeTrialUpsellAction_Params = t_87
typeRegistryModule.default:register(t.OpenFaeTrialUpsellAction_Params)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p171) --[[ line: 18482 ]]
	-- upvalues: t (ref), t_88 (ref)
	return setmetatable({
		action_type = if p171 == nil or p171.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p171.action_type,
		action_params = if p171 == nil or p171.action_params == nil then nil else p171.action_params
	}, t_88)
end

function t_88:encode() --[[ line: 18493 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2953 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2954, var2955 = protoModule.writeTag(buff, var2953, 1, protoModule.wireTypes.varint)
		var2954, var2955 = protoModule.writeVarInt(var2954, var2955, t.ActionType.toNumber(self.action_type))
		buff = var2954
		var2953 = var2955
	end
	if self.action_params ~= nil then
		local var2956 = self.action_params:encode()
		local var2957, var2958 = protoModule.writeTag(buff, var2953, 2, protoModule.wireTypes.lengthDelimited)
		var2957, var2958 = protoModule.writeBuffer(var2957, var2958, var2956, buffer.len(var2956))
		buff = var2957
		var2953 = var2958
	end
	local buff_1 = buffer.create(var2953)
	buffer.copy(buff_1, 0, buff, 0, var2953)
	
	return buff_1
end

function t_88.decode(p172) --[[ line: 18519 ]]
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2960 = t_88.new()
	local var2961 = 0
	while var2961 < buffer.len(p172) do
		local _ = nil
		local var2962 = nil
		local var2963, var2964, var2965 = protoModule.readTag(p172, var2961)
		local var2966 = var2963
		var2962 = var2964
		var2961 = var2965
		
		if var2962 == protoModule.wireTypes.varint then
			if var2966 == 1 then
				local _ = nil
				local var2967, var2968 = protoModule.readVarIntI32(p172, var2961)
				local var2969 = var2967
				var2961 = var2968
				var2960.action_type = t.ActionType.fromNumber(var2969) or var2969
			else
				local _ = nil
				local var2970, var2971 = protoModule.readVarInt(p172, var2961)
				local _ = var2970
				var2961 = var2971
			end
		end
		if var2962 == protoModule.wireTypes.lengthDelimited then
			if var2966 == 2 then
				local _ = nil
				local var2972, var2973 = protoModule.readBuffer(p172, var2961)
				var2961 = var2973
				var2960.action_params = t.OpenIncomingTransferUpsellAction_Params.decode(var2972)
			else
				local _ = nil
				local var2974, var2975 = protoModule.readVarInt(p172, var2961)
				var2961 = var2975 + var2974
			end
		elseif var2962 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2976, var2977 = protoModule.readFixed32(p172, var2961)
			local _ = var2976
			var2961 = var2977
		elseif var2962 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2978, var2979 = protoModule.readFixed64(p172, var2961)
			local _ = var2978
			var2961 = var2979
		else
			error("Unsupported wire type: " .. var2962)
		end
	end
	return var2960
end

function t_88:jsonEncode() --[[ line: 18567 ]]
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

function t_88:jsonDecode() --[[ line: 18589 ]]
	-- upvalues: t_88 (ref), t (ref)
	local var2981 = t_88.new()
	
	if self.action_type ~= nil then
		var2981.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2981.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2981.action_params = t.OpenIncomingTransferUpsellAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2981.action_params = t.OpenIncomingTransferUpsellAction_Params.jsonDecode(self.actionParams)
	end
	return var2981
end

t_88.descriptor = {
	name = "OpenIncomingTransferUpsellAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenIncomingTransferUpsellAction"
}
t.OpenIncomingTransferUpsellAction = t_88
typeRegistryModule.default:register(t.OpenIncomingTransferUpsellAction)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p173) --[[ line: 18631 ]]
	-- upvalues: t_89 (ref)
	return setmetatable({
		url = if p173 == nil or p173.url == nil then nil else p173.url,
		prompt_type = if p173 == nil or p173.prompt_type == nil then nil else p173.prompt_type,
		prompt_id = if p173 == nil or p173.prompt_id == nil then nil else p173.prompt_id
	}, t_89)
end

function t_89:encode() --[[ line: 18641 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2983 = 0
	
	if self.url ~= nil then
		local var2984 = self.url:encode()
		local var2985, var2986 = protoModule.writeTag(buff, var2983, 1, protoModule.wireTypes.lengthDelimited)
		var2985, var2986 = protoModule.writeBuffer(var2985, var2986, var2984, buffer.len(var2984))
		buff = var2985
		var2983 = var2986
	end
	if self.prompt_type ~= nil then
		local var2987 = self.prompt_type:encode()
		local var2988, var2989 = protoModule.writeTag(buff, var2983, 2, protoModule.wireTypes.lengthDelimited)
		var2988, var2989 = protoModule.writeBuffer(var2988, var2989, var2987, buffer.len(var2987))
		buff = var2988
		var2983 = var2989
	end
	if self.prompt_id ~= nil then
		local var2990 = self.prompt_id:encode()
		local var2991, var2992 = protoModule.writeTag(buff, var2983, 3, protoModule.wireTypes.lengthDelimited)
		var2991, var2992 = protoModule.writeBuffer(var2991, var2992, var2990, buffer.len(var2990))
		buff = var2991
		var2983 = var2992
	end
	local buff_1 = buffer.create(var2983)
	buffer.copy(buff_1, 0, buff, 0, var2983)
	
	return buff_1
end

function t_89.decode(p174) --[[ line: 18668 ]]
	-- upvalues: t_89 (ref), protoModule (ref), propTypesModule (ref)
	local var2994 = t_89.new()
	local var2995 = 0
	while var2995 < buffer.len(p174) do
		local _ = nil
		local var2996 = nil
		local var2997, var2998, var2999 = protoModule.readTag(p174, var2995)
		local var3000 = var2997
		var2996 = var2998
		var2995 = var2999
		
		if var2996 == protoModule.wireTypes.varint then
			local _ = nil
			local var3001, var3002 = protoModule.readVarInt(p174, var2995)
			local _ = var3001
			var2995 = var3002
			continue
		end
		if var2996 == protoModule.wireTypes.lengthDelimited then
			if var3000 == 1 then
				local _ = nil
				local var3003, var3004 = protoModule.readBuffer(p174, var2995)
				var2995 = var3004
				var2994.url = propTypesModule.StringProp.decode(var3003)
			elseif var3000 == 2 then
				local _ = nil
				local var3005, var3006 = protoModule.readBuffer(p174, var2995)
				var2995 = var3006
				var2994.prompt_type = propTypesModule.StringProp.decode(var3005)
			elseif var3000 == 3 then
				local _ = nil
				local var3007, var3008 = protoModule.readBuffer(p174, var2995)
				var2995 = var3008
				var2994.prompt_id = propTypesModule.StringProp.decode(var3007)
			else
				local _ = nil
				local var3009, var3010 = protoModule.readVarInt(p174, var2995)
				var2995 = var3010 + var3009
			end
		elseif var2996 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3011, var3012 = protoModule.readFixed32(p174, var2995)
			local _ = var3011
			var2995 = var3012
		elseif var2996 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3013, var3014 = protoModule.readFixed64(p174, var2995)
			local _ = var3013
			var2995 = var3014
		else
			error("Unsupported wire type: " .. var2996)
		end
	end
	return var2994
end

function t_89:jsonEncode() --[[ line: 18721 ]]
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

function t_89:jsonDecode() --[[ line: 18739 ]]
	-- upvalues: t_89 (ref), propTypesModule (ref)
	local var3016 = t_89.new()
	
	if self.url ~= nil then
		var3016.url = propTypesModule.StringProp.jsonDecode(self.url)
	end
	if self.prompt_type ~= nil then
		var3016.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var3016.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var3016.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var3016.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	return var3016
end

t_89.descriptor = {
	name = "OpenIncomingTransferUpsellAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenIncomingTransferUpsellAction_Params = t_89
typeRegistryModule.default:register(t.OpenIncomingTransferUpsellAction_Params)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p175) --[[ line: 18782 ]]
	-- upvalues: t (ref), t_90 (ref)
	return setmetatable({
		action_type = if p175 == nil or p175.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p175.action_type,
		action_params = if p175 == nil or p175.action_params == nil then nil else p175.action_params
	}, t_90)
end

function t_90:encode() --[[ line: 18791 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3018 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3019, var3020 = protoModule.writeTag(buff, var3018, 1, protoModule.wireTypes.varint)
		var3019, var3020 = protoModule.writeVarInt(var3019, var3020, t.ActionType.toNumber(self.action_type))
		buff = var3019
		var3018 = var3020
	end
	if self.action_params ~= nil then
		local var3021 = self.action_params:encode()
		local var3022, var3023 = protoModule.writeTag(buff, var3018, 2, protoModule.wireTypes.lengthDelimited)
		var3022, var3023 = protoModule.writeBuffer(var3022, var3023, var3021, buffer.len(var3021))
		buff = var3022
		var3018 = var3023
	end
	local buff_1 = buffer.create(var3018)
	buffer.copy(buff_1, 0, buff, 0, var3018)
	
	return buff_1
end

function t_90.decode(p176) --[[ line: 18817 ]]
	-- upvalues: t_90 (ref), protoModule (ref), t (ref)
	local var3025 = t_90.new()
	local var3026 = 0
	while var3026 < buffer.len(p176) do
		local _ = nil
		local var3027 = nil
		local var3028, var3029, var3030 = protoModule.readTag(p176, var3026)
		local var3031 = var3028
		var3027 = var3029
		var3026 = var3030
		
		if var3027 == protoModule.wireTypes.varint then
			if var3031 == 1 then
				local _ = nil
				local var3032, var3033 = protoModule.readVarIntI32(p176, var3026)
				local var3034 = var3032
				var3026 = var3033
				var3025.action_type = t.ActionType.fromNumber(var3034) or var3034
			else
				local _ = nil
				local var3035, var3036 = protoModule.readVarInt(p176, var3026)
				local _ = var3035
				var3026 = var3036
			end
		end
		if var3027 == protoModule.wireTypes.lengthDelimited then
			if var3031 == 2 then
				local _ = nil
				local var3037, var3038 = protoModule.readBuffer(p176, var3026)
				var3026 = var3038
				var3025.action_params = t.OpenSduiOverlayAction_Params.decode(var3037)
			else
				local _ = nil
				local var3039, var3040 = protoModule.readVarInt(p176, var3026)
				var3026 = var3040 + var3039
			end
		elseif var3027 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3041, var3042 = protoModule.readFixed32(p176, var3026)
			local _ = var3041
			var3026 = var3042
		elseif var3027 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3043, var3044 = protoModule.readFixed64(p176, var3026)
			local _ = var3043
			var3026 = var3044
		else
			error("Unsupported wire type: " .. var3027)
		end
	end
	return var3025
end

function t_90:jsonEncode() --[[ line: 18865 ]]
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

function t_90:jsonDecode() --[[ line: 18887 ]]
	-- upvalues: t_90 (ref), t (ref)
	local var3046 = t_90.new()
	
	if self.action_type ~= nil then
		var3046.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3046.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3046.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3046.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.actionParams)
	end
	return var3046
end

t_90.descriptor = {
	name = "OpenSduiOverlayAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSduiOverlayAction"
}
t.OpenSduiOverlayAction = t_90
typeRegistryModule.default:register(t.OpenSduiOverlayAction)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p177) --[[ line: 18927 ]]
	-- upvalues: t_91 (ref)
	return setmetatable({
		config_key = if p177 == nil or p177.config_key == nil then nil else p177.config_key,
		identifier = if p177 == nil or p177.identifier == nil then nil else p177.identifier
	}, t_91)
end

function t_91:encode() --[[ line: 18936 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3048 = 0
	
	if self.config_key ~= nil then
		local var3049 = self.config_key:encode()
		local var3050, var3051 = protoModule.writeTag(buff, var3048, 1, protoModule.wireTypes.lengthDelimited)
		var3050, var3051 = protoModule.writeBuffer(var3050, var3051, var3049, buffer.len(var3049))
		buff = var3050
		var3048 = var3051
	end
	if self.identifier ~= nil then
		local var3052 = self.identifier:encode()
		local var3053, var3054 = protoModule.writeTag(buff, var3048, 2, protoModule.wireTypes.lengthDelimited)
		var3053, var3054 = protoModule.writeBuffer(var3053, var3054, var3052, buffer.len(var3052))
		buff = var3053
		var3048 = var3054
	end
	local buff_1 = buffer.create(var3048)
	buffer.copy(buff_1, 0, buff, 0, var3048)
	
	return buff_1
end

function t_91.decode(p178) --[[ line: 18957 ]]
	-- upvalues: t_91 (ref), protoModule (ref), propTypesModule (ref)
	local var3056 = t_91.new()
	local var3057 = 0
	while var3057 < buffer.len(p178) do
		local _ = nil
		local var3058 = nil
		local var3059, var3060, var3061 = protoModule.readTag(p178, var3057)
		local var3062 = var3059
		var3058 = var3060
		var3057 = var3061
		
		if var3058 == protoModule.wireTypes.varint then
			local _ = nil
			local var3063, var3064 = protoModule.readVarInt(p178, var3057)
			local _ = var3063
			var3057 = var3064
			continue
		end
		if var3058 == protoModule.wireTypes.lengthDelimited then
			if var3062 == 1 then
				local _ = nil
				local var3065, var3066 = protoModule.readBuffer(p178, var3057)
				var3057 = var3066
				var3056.config_key = propTypesModule.StringProp.decode(var3065)
			elseif var3062 == 2 then
				local _ = nil
				local var3067, var3068 = protoModule.readBuffer(p178, var3057)
				var3057 = var3068
				var3056.identifier = propTypesModule.StringProp.decode(var3067)
			else
				local _ = nil
				local var3069, var3070 = protoModule.readVarInt(p178, var3057)
				var3057 = var3070 + var3069
			end
		elseif var3058 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3071, var3072 = protoModule.readFixed32(p178, var3057)
			local _ = var3071
			var3057 = var3072
		elseif var3058 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3073, var3074 = protoModule.readFixed64(p178, var3057)
			local _ = var3073
			var3057 = var3074
		else
			error("Unsupported wire type: " .. var3058)
		end
	end
	return var3056
end

function t_91:jsonEncode() --[[ line: 19005 ]]
	local t = {}
	
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	if self.identifier ~= nil then
		t.identifier = self.identifier:jsonEncode()
	end
	return t
end

function t_91:jsonDecode() --[[ line: 19019 ]]
	-- upvalues: t_91 (ref), propTypesModule (ref)
	local var3076 = t_91.new()
	
	if self.config_key ~= nil then
		var3076.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var3076.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.identifier ~= nil then
		var3076.identifier = propTypesModule.StringProp.jsonDecode(self.identifier)
	end
	return var3076
end

t_91.descriptor = {
	name = "OpenSduiOverlayAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSduiOverlayAction_Params = t_91
typeRegistryModule.default:register(t.OpenSduiOverlayAction_Params)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p179) --[[ line: 19051 ]]
	-- upvalues: t (ref), t_92 (ref)
	return setmetatable({
		action_type = if p179 == nil or p179.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p179.action_type,
		action_params = if p179 == nil or p179.action_params == nil then nil else p179.action_params
	}, t_92)
end

function t_92:encode() --[[ line: 19060 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3078 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3079, var3080 = protoModule.writeTag(buff, var3078, 1, protoModule.wireTypes.varint)
		var3079, var3080 = protoModule.writeVarInt(var3079, var3080, t.ActionType.toNumber(self.action_type))
		buff = var3079
		var3078 = var3080
	end
	if self.action_params ~= nil then
		local var3081 = self.action_params:encode()
		local var3082, var3083 = protoModule.writeTag(buff, var3078, 2, protoModule.wireTypes.lengthDelimited)
		var3082, var3083 = protoModule.writeBuffer(var3082, var3083, var3081, buffer.len(var3081))
		buff = var3082
		var3078 = var3083
	end
	local buff_1 = buffer.create(var3078)
	buffer.copy(buff_1, 0, buff, 0, var3078)
	
	return buff_1
end

function t_92.decode(p180) --[[ line: 19086 ]]
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var3085 = t_92.new()
	local var3086 = 0
	while var3086 < buffer.len(p180) do
		local _ = nil
		local var3087 = nil
		local var3088, var3089, var3090 = protoModule.readTag(p180, var3086)
		local var3091 = var3088
		var3087 = var3089
		var3086 = var3090
		
		if var3087 == protoModule.wireTypes.varint then
			if var3091 == 1 then
				local _ = nil
				local var3092, var3093 = protoModule.readVarIntI32(p180, var3086)
				local var3094 = var3092
				var3086 = var3093
				var3085.action_type = t.ActionType.fromNumber(var3094) or var3094
			else
				local _ = nil
				local var3095, var3096 = protoModule.readVarInt(p180, var3086)
				local _ = var3095
				var3086 = var3096
			end
		end
		if var3087 == protoModule.wireTypes.lengthDelimited then
			if var3091 == 2 then
				local _ = nil
				local var3097, var3098 = protoModule.readBuffer(p180, var3086)
				var3086 = var3098
				var3085.action_params = t.ApplyChartsFilterAction_Params.decode(var3097)
			else
				local _ = nil
				local var3099, var3100 = protoModule.readVarInt(p180, var3086)
				var3086 = var3100 + var3099
			end
		elseif var3087 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3101, var3102 = protoModule.readFixed32(p180, var3086)
			local _ = var3101
			var3086 = var3102
		elseif var3087 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3103, var3104 = protoModule.readFixed64(p180, var3086)
			local _ = var3103
			var3086 = var3104
		else
			error("Unsupported wire type: " .. var3087)
		end
	end
	return var3085
end

function t_92:jsonEncode() --[[ line: 19134 ]]
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

function t_92:jsonDecode() --[[ line: 19156 ]]
	-- upvalues: t_92 (ref), t (ref)
	local var3106 = t_92.new()
	
	if self.action_type ~= nil then
		var3106.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3106.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3106.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3106.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.actionParams)
	end
	return var3106
end

t_92.descriptor = {
	name = "ApplyChartsFilterAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ApplyChartsFilterAction"
}
t.ApplyChartsFilterAction = t_92
typeRegistryModule.default:register(t.ApplyChartsFilterAction)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p181) --[[ line: 19196 ]]
	-- upvalues: t_93 (ref)
	return setmetatable({
		session_id = if p181 == nil or p181.session_id == nil then nil else p181.session_id
	}, t_93)
end

function t_93:encode() --[[ line: 19204 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3108 = 0
	
	if self.session_id ~= nil then
		local var3109 = self.session_id:encode()
		local var3110, var3111 = protoModule.writeTag(buff, var3108, 1, protoModule.wireTypes.lengthDelimited)
		var3110, var3111 = protoModule.writeBuffer(var3110, var3111, var3109, buffer.len(var3109))
		buff = var3110
		var3108 = var3111
	end
	local buff_1 = buffer.create(var3108)
	buffer.copy(buff_1, 0, buff, 0, var3108)
	
	return buff_1
end

function t_93.decode(p182) --[[ line: 19219 ]]
	-- upvalues: t_93 (ref), protoModule (ref), propTypesModule (ref)
	local var3113 = t_93.new()
	local var3114 = 0
	while var3114 < buffer.len(p182) do
		local _ = nil
		local var3115 = nil
		local var3116, var3117, var3118 = protoModule.readTag(p182, var3114)
		local var3119 = var3116
		var3115 = var3117
		var3114 = var3118
		
		if var3115 == protoModule.wireTypes.varint then
			local _ = nil
			local var3120, var3121 = protoModule.readVarInt(p182, var3114)
			local _ = var3120
			var3114 = var3121
			continue
		end
		if var3115 == protoModule.wireTypes.lengthDelimited then
			if var3119 == 1 then
				local _ = nil
				local var3122, var3123 = protoModule.readBuffer(p182, var3114)
				var3114 = var3123
				var3113.session_id = propTypesModule.StringProp.decode(var3122)
			else
				local _ = nil
				local var3124, var3125 = protoModule.readVarInt(p182, var3114)
				var3114 = var3125 + var3124
			end
		elseif var3115 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3126, var3127 = protoModule.readFixed32(p182, var3114)
			local _ = var3126
			var3114 = var3127
		elseif var3115 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3128, var3129 = protoModule.readFixed64(p182, var3114)
			local _ = var3128
			var3114 = var3129
		else
			error("Unsupported wire type: " .. var3115)
		end
	end
	return var3113
end

function t_93:jsonEncode() --[[ line: 19262 ]]
	local t = {}
	
	if self.session_id ~= nil then
		t.sessionId = self.session_id:jsonEncode()
	end
	return t
end

function t_93:jsonDecode() --[[ line: 19272 ]]
	-- upvalues: t_93 (ref), propTypesModule (ref)
	local var3131 = t_93.new()
	
	if self.session_id ~= nil then
		var3131.session_id = propTypesModule.StringProp.jsonDecode(self.session_id)
	end
	if self.sessionId ~= nil then
		var3131.session_id = propTypesModule.StringProp.jsonDecode(self.sessionId)
	end
	return var3131
end

t_93.descriptor = {
	name = "ApplyChartsFilterAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ApplyChartsFilterAction_Params = t_93
typeRegistryModule.default:register(t.ApplyChartsFilterAction_Params)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p183) --[[ line: 19300 ]]
	-- upvalues: t (ref), t_94 (ref)
	return setmetatable({
		action_type = if p183 == nil or p183.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p183.action_type,
		action_params = if p183 == nil or p183.action_params == nil then nil else p183.action_params
	}, t_94)
end

function t_94:encode() --[[ line: 19311 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3133 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3134, var3135 = protoModule.writeTag(buff, var3133, 1, protoModule.wireTypes.varint)
		var3134, var3135 = protoModule.writeVarInt(var3134, var3135, t.ActionType.toNumber(self.action_type))
		buff = var3134
		var3133 = var3135
	end
	if self.action_params ~= nil then
		local var3136 = self.action_params:encode()
		local var3137, var3138 = protoModule.writeTag(buff, var3133, 2, protoModule.wireTypes.lengthDelimited)
		var3137, var3138 = protoModule.writeBuffer(var3137, var3138, var3136, buffer.len(var3136))
		buff = var3137
		var3133 = var3138
	end
	local buff_1 = buffer.create(var3133)
	buffer.copy(buff_1, 0, buff, 0, var3133)
	
	return buff_1
end

function t_94.decode(p184) --[[ line: 19337 ]]
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var3140 = t_94.new()
	local var3141 = 0
	while var3141 < buffer.len(p184) do
		local _ = nil
		local var3142 = nil
		local var3143, var3144, var3145 = protoModule.readTag(p184, var3141)
		local var3146 = var3143
		var3142 = var3144
		var3141 = var3145
		
		if var3142 == protoModule.wireTypes.varint then
			if var3146 == 1 then
				local _ = nil
				local var3147, var3148 = protoModule.readVarIntI32(p184, var3141)
				local var3149 = var3147
				var3141 = var3148
				var3140.action_type = t.ActionType.fromNumber(var3149) or var3149
			else
				local _ = nil
				local var3150, var3151 = protoModule.readVarInt(p184, var3141)
				local _ = var3150
				var3141 = var3151
			end
		end
		if var3142 == protoModule.wireTypes.lengthDelimited then
			if var3146 == 2 then
				local _ = nil
				local var3152, var3153 = protoModule.readBuffer(p184, var3141)
				var3141 = var3153
				var3140.action_params = t.RefreshChartsSortDetailAction_Params.decode(var3152)
			else
				local _ = nil
				local var3154, var3155 = protoModule.readVarInt(p184, var3141)
				var3141 = var3155 + var3154
			end
		elseif var3142 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3156, var3157 = protoModule.readFixed32(p184, var3141)
			local _ = var3156
			var3141 = var3157
		elseif var3142 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3158, var3159 = protoModule.readFixed64(p184, var3141)
			local _ = var3158
			var3141 = var3159
		else
			error("Unsupported wire type: " .. var3142)
		end
	end
	return var3140
end

function t_94:jsonEncode() --[[ line: 19385 ]]
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

function t_94:jsonDecode() --[[ line: 19407 ]]
	-- upvalues: t_94 (ref), t (ref)
	local var3161 = t_94.new()
	
	if self.action_type ~= nil then
		var3161.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3161.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3161.action_params = t.RefreshChartsSortDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3161.action_params = t.RefreshChartsSortDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var3161
end

t_94.descriptor = {
	name = "RefreshChartsSortDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshChartsSortDetailAction"
}
t.RefreshChartsSortDetailAction = t_94
typeRegistryModule.default:register(t.RefreshChartsSortDetailAction)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p185) --[[ line: 19447 ]]
	-- upvalues: t_95 (ref)
	return setmetatable({
		config_key = if p185 == nil or p185.config_key == nil then nil else p185.config_key,
		selected_option = if p185 == nil or p185.selected_option == nil then nil else p185.selected_option,
		surface_key = if p185 == nil or p185.surface_key == nil then nil else p185.surface_key,
		sort_id = if p185 == nil or p185.sort_id == nil then nil else p185.sort_id
	}, t_95)
end

function t_95:encode() --[[ line: 19458 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3163 = 0
	
	if self.config_key ~= nil then
		local var3164 = self.config_key:encode()
		local var3165, var3166 = protoModule.writeTag(buff, var3163, 1, protoModule.wireTypes.lengthDelimited)
		var3165, var3166 = protoModule.writeBuffer(var3165, var3166, var3164, buffer.len(var3164))
		buff = var3165
		var3163 = var3166
	end
	if self.selected_option ~= nil then
		local var3167 = self.selected_option:encode()
		local var3168, var3169 = protoModule.writeTag(buff, var3163, 2, protoModule.wireTypes.lengthDelimited)
		var3168, var3169 = protoModule.writeBuffer(var3168, var3169, var3167, buffer.len(var3167))
		buff = var3168
		var3163 = var3169
	end
	if self.surface_key ~= nil then
		local var3170 = self.surface_key:encode()
		local var3171, var3172 = protoModule.writeTag(buff, var3163, 3, protoModule.wireTypes.lengthDelimited)
		var3171, var3172 = protoModule.writeBuffer(var3171, var3172, var3170, buffer.len(var3170))
		buff = var3171
		var3163 = var3172
	end
	if self.sort_id ~= nil then
		local var3173 = self.sort_id:encode()
		local var3174, var3175 = protoModule.writeTag(buff, var3163, 4, protoModule.wireTypes.lengthDelimited)
		var3174, var3175 = protoModule.writeBuffer(var3174, var3175, var3173, buffer.len(var3173))
		buff = var3174
		var3163 = var3175
	end
	local buff_1 = buffer.create(var3163)
	buffer.copy(buff_1, 0, buff, 0, var3163)
	
	return buff_1
end

function t_95.decode(p186) --[[ line: 19491 ]]
	-- upvalues: t_95 (ref), protoModule (ref), propTypesModule (ref)
	local var3177 = t_95.new()
	local var3178 = 0
	while var3178 < buffer.len(p186) do
		local _ = nil
		local var3179 = nil
		local var3180, var3181, var3182 = protoModule.readTag(p186, var3178)
		local var3183 = var3180
		var3179 = var3181
		var3178 = var3182
		
		if var3179 == protoModule.wireTypes.varint then
			local _ = nil
			local var3184, var3185 = protoModule.readVarInt(p186, var3178)
			local _ = var3184
			var3178 = var3185
			continue
		end
		if var3179 == protoModule.wireTypes.lengthDelimited then
			if var3183 == 1 then
				local _ = nil
				local var3186, var3187 = protoModule.readBuffer(p186, var3178)
				var3178 = var3187
				var3177.config_key = propTypesModule.StringProp.decode(var3186)
			elseif var3183 == 2 then
				local _ = nil
				local var3188, var3189 = protoModule.readBuffer(p186, var3178)
				var3178 = var3189
				var3177.selected_option = propTypesModule.StringProp.decode(var3188)
			elseif var3183 == 3 then
				local _ = nil
				local var3190, var3191 = protoModule.readBuffer(p186, var3178)
				var3178 = var3191
				var3177.surface_key = propTypesModule.StringProp.decode(var3190)
			elseif var3183 == 4 then
				local _ = nil
				local var3192, var3193 = protoModule.readBuffer(p186, var3178)
				var3178 = var3193
				var3177.sort_id = propTypesModule.StringProp.decode(var3192)
			else
				local _ = nil
				local var3194, var3195 = protoModule.readVarInt(p186, var3178)
				var3178 = var3195 + var3194
			end
		elseif var3179 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3196, var3197 = protoModule.readFixed32(p186, var3178)
			local _ = var3196
			var3178 = var3197
		elseif var3179 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3198, var3199 = protoModule.readFixed64(p186, var3178)
			local _ = var3198
			var3178 = var3199
		else
			error("Unsupported wire type: " .. var3179)
		end
	end
	return var3177
end

function t_95:jsonEncode() --[[ line: 19549 ]]
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

function t_95:jsonDecode() --[[ line: 19571 ]]
	-- upvalues: t_95 (ref), propTypesModule (ref)
	local var3201 = t_95.new()
	
	if self.config_key ~= nil then
		var3201.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var3201.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.selected_option ~= nil then
		var3201.selected_option = propTypesModule.StringProp.jsonDecode(self.selected_option)
	end
	if self.selectedOption ~= nil then
		var3201.selected_option = propTypesModule.StringProp.jsonDecode(self.selectedOption)
	end
	if self.surface_key ~= nil then
		var3201.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var3201.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.sort_id ~= nil then
		var3201.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var3201.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	return var3201
end

t_95.descriptor = {
	name = "RefreshChartsSortDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshChartsSortDetailAction_Params = t_95
typeRegistryModule.default:register(t.RefreshChartsSortDetailAction_Params)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p187) --[[ line: 19628 ]]
	-- upvalues: t (ref), t_96 (ref)
	return setmetatable({
		action_type = if p187 == nil or p187.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p187.action_type,
		action_params = if p187 == nil or p187.action_params == nil then nil else p187.action_params
	}, t_96)
end

function t_96:encode() --[[ line: 19637 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3203 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3204, var3205 = protoModule.writeTag(buff, var3203, 1, protoModule.wireTypes.varint)
		var3204, var3205 = protoModule.writeVarInt(var3204, var3205, t.ActionType.toNumber(self.action_type))
		buff = var3204
		var3203 = var3205
	end
	if self.action_params ~= nil then
		local var3206 = self.action_params:encode()
		local var3207, var3208 = protoModule.writeTag(buff, var3203, 2, protoModule.wireTypes.lengthDelimited)
		var3207, var3208 = protoModule.writeBuffer(var3207, var3208, var3206, buffer.len(var3206))
		buff = var3207
		var3203 = var3208
	end
	local buff_1 = buffer.create(var3203)
	buffer.copy(buff_1, 0, buff, 0, var3203)
	
	return buff_1
end

function t_96.decode(p188) --[[ line: 19663 ]]
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var3210 = t_96.new()
	local var3211 = 0
	while var3211 < buffer.len(p188) do
		local _ = nil
		local var3212 = nil
		local var3213, var3214, var3215 = protoModule.readTag(p188, var3211)
		local var3216 = var3213
		var3212 = var3214
		var3211 = var3215
		
		if var3212 == protoModule.wireTypes.varint then
			if var3216 == 1 then
				local _ = nil
				local var3217, var3218 = protoModule.readVarIntI32(p188, var3211)
				local var3219 = var3217
				var3211 = var3218
				var3210.action_type = t.ActionType.fromNumber(var3219) or var3219
			else
				local _ = nil
				local var3220, var3221 = protoModule.readVarInt(p188, var3211)
				local _ = var3220
				var3211 = var3221
			end
		end
		if var3212 == protoModule.wireTypes.lengthDelimited then
			if var3216 == 2 then
				local _ = nil
				local var3222, var3223 = protoModule.readBuffer(p188, var3211)
				var3211 = var3223
				var3210.action_params = t.JoinCommunityAction_Params.decode(var3222)
			else
				local _ = nil
				local var3224, var3225 = protoModule.readVarInt(p188, var3211)
				var3211 = var3225 + var3224
			end
		elseif var3212 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3226, var3227 = protoModule.readFixed32(p188, var3211)
			local _ = var3226
			var3211 = var3227
		elseif var3212 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3228, var3229 = protoModule.readFixed64(p188, var3211)
			local _ = var3228
			var3211 = var3229
		else
			error("Unsupported wire type: " .. var3212)
		end
	end
	return var3210
end

function t_96:jsonEncode() --[[ line: 19711 ]]
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

function t_96:jsonDecode() --[[ line: 19733 ]]
	-- upvalues: t_96 (ref), t (ref)
	local var3231 = t_96.new()
	
	if self.action_type ~= nil then
		var3231.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3231.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3231.action_params = t.JoinCommunityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3231.action_params = t.JoinCommunityAction_Params.jsonDecode(self.actionParams)
	end
	return var3231
end

t_96.descriptor = {
	name = "JoinCommunityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.JoinCommunityAction"
}
t.JoinCommunityAction = t_96
typeRegistryModule.default:register(t.JoinCommunityAction)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p189) --[[ line: 19773 ]]
	-- upvalues: t_97 (ref)
	return setmetatable({
		community_id = if p189 == nil or p189.community_id == nil then nil else p189.community_id
	}, t_97)
end

function t_97:encode() --[[ line: 19781 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3233 = 0
	
	if self.community_id ~= nil then
		local var3234 = self.community_id:encode()
		local var3235, var3236 = protoModule.writeTag(buff, var3233, 1, protoModule.wireTypes.lengthDelimited)
		var3235, var3236 = protoModule.writeBuffer(var3235, var3236, var3234, buffer.len(var3234))
		buff = var3235
		var3233 = var3236
	end
	local buff_1 = buffer.create(var3233)
	buffer.copy(buff_1, 0, buff, 0, var3233)
	
	return buff_1
end

function t_97.decode(p190) --[[ line: 19796 ]]
	-- upvalues: t_97 (ref), protoModule (ref), propTypesModule (ref)
	local var3238 = t_97.new()
	local var3239 = 0
	while var3239 < buffer.len(p190) do
		local _ = nil
		local var3240 = nil
		local var3241, var3242, var3243 = protoModule.readTag(p190, var3239)
		local var3244 = var3241
		var3240 = var3242
		var3239 = var3243
		
		if var3240 == protoModule.wireTypes.varint then
			local _ = nil
			local var3245, var3246 = protoModule.readVarInt(p190, var3239)
			local _ = var3245
			var3239 = var3246
			continue
		end
		if var3240 == protoModule.wireTypes.lengthDelimited then
			if var3244 == 1 then
				local _ = nil
				local var3247, var3248 = protoModule.readBuffer(p190, var3239)
				var3239 = var3248
				var3238.community_id = propTypesModule.StringProp.decode(var3247)
			else
				local _ = nil
				local var3249, var3250 = protoModule.readVarInt(p190, var3239)
				var3239 = var3250 + var3249
			end
		elseif var3240 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3251, var3252 = protoModule.readFixed32(p190, var3239)
			local _ = var3251
			var3239 = var3252
		elseif var3240 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3253, var3254 = protoModule.readFixed64(p190, var3239)
			local _ = var3253
			var3239 = var3254
		else
			error("Unsupported wire type: " .. var3240)
		end
	end
	return var3238
end

function t_97:jsonEncode() --[[ line: 19839 ]]
	local t = {}
	
	if self.community_id ~= nil then
		t.communityId = self.community_id:jsonEncode()
	end
	return t
end

function t_97:jsonDecode() --[[ line: 19849 ]]
	-- upvalues: t_97 (ref), propTypesModule (ref)
	local var3256 = t_97.new()
	
	if self.community_id ~= nil then
		var3256.community_id = propTypesModule.StringProp.jsonDecode(self.community_id)
	end
	if self.communityId ~= nil then
		var3256.community_id = propTypesModule.StringProp.jsonDecode(self.communityId)
	end
	return var3256
end

t_97.descriptor = {
	name = "JoinCommunityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.JoinCommunityAction_Params = t_97
typeRegistryModule.default:register(t.JoinCommunityAction_Params)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p191) --[[ line: 19879 ]]
	-- upvalues: t (ref), t_98 (ref)
	return setmetatable({
		action_type = if p191 == nil or p191.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p191.action_type,
		action_params = if p191 == nil or p191.action_params == nil then nil else p191.action_params
	}, t_98)
end

function t_98:encode() --[[ line: 19888 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3258 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3259, var3260 = protoModule.writeTag(buff, var3258, 1, protoModule.wireTypes.varint)
		var3259, var3260 = protoModule.writeVarInt(var3259, var3260, t.ActionType.toNumber(self.action_type))
		buff = var3259
		var3258 = var3260
	end
	if self.action_params ~= nil then
		local var3261 = self.action_params:encode()
		local var3262, var3263 = protoModule.writeTag(buff, var3258, 2, protoModule.wireTypes.lengthDelimited)
		var3262, var3263 = protoModule.writeBuffer(var3262, var3263, var3261, buffer.len(var3261))
		buff = var3262
		var3258 = var3263
	end
	local buff_1 = buffer.create(var3258)
	buffer.copy(buff_1, 0, buff, 0, var3258)
	
	return buff_1
end

function t_98.decode(p192) --[[ line: 19914 ]]
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var3265 = t_98.new()
	local var3266 = 0
	while var3266 < buffer.len(p192) do
		local _ = nil
		local var3267 = nil
		local var3268, var3269, var3270 = protoModule.readTag(p192, var3266)
		local var3271 = var3268
		var3267 = var3269
		var3266 = var3270
		
		if var3267 == protoModule.wireTypes.varint then
			if var3271 == 1 then
				local _ = nil
				local var3272, var3273 = protoModule.readVarIntI32(p192, var3266)
				local var3274 = var3272
				var3266 = var3273
				var3265.action_type = t.ActionType.fromNumber(var3274) or var3274
			else
				local _ = nil
				local var3275, var3276 = protoModule.readVarInt(p192, var3266)
				local _ = var3275
				var3266 = var3276
			end
		end
		if var3267 == protoModule.wireTypes.lengthDelimited then
			if var3271 == 2 then
				local _ = nil
				local var3277, var3278 = protoModule.readBuffer(p192, var3266)
				var3266 = var3278
				var3265.action_params = t.ViewCommunityAction_Params.decode(var3277)
			else
				local _ = nil
				local var3279, var3280 = protoModule.readVarInt(p192, var3266)
				var3266 = var3280 + var3279
			end
		elseif var3267 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3281, var3282 = protoModule.readFixed32(p192, var3266)
			local _ = var3281
			var3266 = var3282
		elseif var3267 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3283, var3284 = protoModule.readFixed64(p192, var3266)
			local _ = var3283
			var3266 = var3284
		else
			error("Unsupported wire type: " .. var3267)
		end
	end
	return var3265
end

function t_98:jsonEncode() --[[ line: 19962 ]]
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

function t_98:jsonDecode() --[[ line: 19984 ]]
	-- upvalues: t_98 (ref), t (ref)
	local var3286 = t_98.new()
	
	if self.action_type ~= nil then
		var3286.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3286.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3286.action_params = t.ViewCommunityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3286.action_params = t.ViewCommunityAction_Params.jsonDecode(self.actionParams)
	end
	return var3286
end

t_98.descriptor = {
	name = "ViewCommunityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ViewCommunityAction"
}
t.ViewCommunityAction = t_98
typeRegistryModule.default:register(t.ViewCommunityAction)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p193) --[[ line: 20024 ]]
	-- upvalues: t_99 (ref)
	return setmetatable({
		community_id = if p193 == nil or p193.community_id == nil then nil else p193.community_id
	}, t_99)
end

function t_99:encode() --[[ line: 20032 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3288 = 0
	
	if self.community_id ~= nil then
		local var3289 = self.community_id:encode()
		local var3290, var3291 = protoModule.writeTag(buff, var3288, 1, protoModule.wireTypes.lengthDelimited)
		var3290, var3291 = protoModule.writeBuffer(var3290, var3291, var3289, buffer.len(var3289))
		buff = var3290
		var3288 = var3291
	end
	local buff_1 = buffer.create(var3288)
	buffer.copy(buff_1, 0, buff, 0, var3288)
	
	return buff_1
end

function t_99.decode(p194) --[[ line: 20047 ]]
	-- upvalues: t_99 (ref), protoModule (ref), propTypesModule (ref)
	local var3293 = t_99.new()
	local var3294 = 0
	while var3294 < buffer.len(p194) do
		local _ = nil
		local var3295 = nil
		local var3296, var3297, var3298 = protoModule.readTag(p194, var3294)
		local var3299 = var3296
		var3295 = var3297
		var3294 = var3298
		
		if var3295 == protoModule.wireTypes.varint then
			local _ = nil
			local var3300, var3301 = protoModule.readVarInt(p194, var3294)
			local _ = var3300
			var3294 = var3301
			continue
		end
		if var3295 == protoModule.wireTypes.lengthDelimited then
			if var3299 == 1 then
				local _ = nil
				local var3302, var3303 = protoModule.readBuffer(p194, var3294)
				var3294 = var3303
				var3293.community_id = propTypesModule.StringProp.decode(var3302)
			else
				local _ = nil
				local var3304, var3305 = protoModule.readVarInt(p194, var3294)
				var3294 = var3305 + var3304
			end
		elseif var3295 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3306, var3307 = protoModule.readFixed32(p194, var3294)
			local _ = var3306
			var3294 = var3307
		elseif var3295 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3308, var3309 = protoModule.readFixed64(p194, var3294)
			local _ = var3308
			var3294 = var3309
		else
			error("Unsupported wire type: " .. var3295)
		end
	end
	return var3293
end

function t_99:jsonEncode() --[[ line: 20090 ]]
	local t = {}
	
	if self.community_id ~= nil then
		t.communityId = self.community_id:jsonEncode()
	end
	return t
end

function t_99:jsonDecode() --[[ line: 20100 ]]
	-- upvalues: t_99 (ref), propTypesModule (ref)
	local var3311 = t_99.new()
	
	if self.community_id ~= nil then
		var3311.community_id = propTypesModule.StringProp.jsonDecode(self.community_id)
	end
	if self.communityId ~= nil then
		var3311.community_id = propTypesModule.StringProp.jsonDecode(self.communityId)
	end
	return var3311
end

t_99.descriptor = {
	name = "ViewCommunityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ViewCommunityAction_Params = t_99
typeRegistryModule.default:register(t.ViewCommunityAction_Params)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p195) --[[ line: 20130 ]]
	-- upvalues: t (ref), t_100 (ref)
	return setmetatable({
		action_type = if p195 == nil or p195.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p195.action_type,
		action_params = if p195 == nil or p195.action_params == nil then nil else p195.action_params
	}, t_100)
end

function t_100:encode() --[[ line: 20139 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3313 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3314, var3315 = protoModule.writeTag(buff, var3313, 1, protoModule.wireTypes.varint)
		var3314, var3315 = protoModule.writeVarInt(var3314, var3315, t.ActionType.toNumber(self.action_type))
		buff = var3314
		var3313 = var3315
	end
	if self.action_params ~= nil then
		local var3316 = self.action_params:encode()
		local var3317, var3318 = protoModule.writeTag(buff, var3313, 2, protoModule.wireTypes.lengthDelimited)
		var3317, var3318 = protoModule.writeBuffer(var3317, var3318, var3316, buffer.len(var3316))
		buff = var3317
		var3313 = var3318
	end
	local buff_1 = buffer.create(var3313)
	buffer.copy(buff_1, 0, buff, 0, var3313)
	
	return buff_1
end

function t_100.decode(p196) --[[ line: 20165 ]]
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var3320 = t_100.new()
	local var3321 = 0
	while var3321 < buffer.len(p196) do
		local _ = nil
		local var3322 = nil
		local var3323, var3324, var3325 = protoModule.readTag(p196, var3321)
		local var3326 = var3323
		var3322 = var3324
		var3321 = var3325
		
		if var3322 == protoModule.wireTypes.varint then
			if var3326 == 1 then
				local _ = nil
				local var3327, var3328 = protoModule.readVarIntI32(p196, var3321)
				local var3329 = var3327
				var3321 = var3328
				var3320.action_type = t.ActionType.fromNumber(var3329) or var3329
			else
				local _ = nil
				local var3330, var3331 = protoModule.readVarInt(p196, var3321)
				local _ = var3330
				var3321 = var3331
			end
		end
		if var3322 == protoModule.wireTypes.lengthDelimited then
			if var3326 == 2 then
				local _ = nil
				local var3332, var3333 = protoModule.readBuffer(p196, var3321)
				var3321 = var3333
				var3320.action_params = t.AnalyticsEventAction_Params.decode(var3332)
			else
				local _ = nil
				local var3334, var3335 = protoModule.readVarInt(p196, var3321)
				var3321 = var3335 + var3334
			end
		elseif var3322 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3336, var3337 = protoModule.readFixed32(p196, var3321)
			local _ = var3336
			var3321 = var3337
		elseif var3322 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3338, var3339 = protoModule.readFixed64(p196, var3321)
			local _ = var3338
			var3321 = var3339
		else
			error("Unsupported wire type: " .. var3322)
		end
	end
	return var3320
end

function t_100:jsonEncode() --[[ line: 20213 ]]
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

function t_100:jsonDecode() --[[ line: 20235 ]]
	-- upvalues: t_100 (ref), t (ref)
	local var3341 = t_100.new()
	
	if self.action_type ~= nil then
		var3341.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3341.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3341.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3341.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return var3341
end

t_100.descriptor = {
	name = "AnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.AnalyticsEventAction"
}
t.AnalyticsEventAction = t_100
typeRegistryModule.default:register(t.AnalyticsEventAction)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p197) --[[ line: 20275 ]]
	-- upvalues: t_101 (ref)
	return setmetatable({
		event_name = if p197 == nil or p197.event_name == nil then nil else p197.event_name,
		event_fields = if p197 == nil or p197.event_fields == nil then nil else p197.event_fields
	}, t_101)
end

function t_101:encode() --[[ line: 20284 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3343 = 0
	
	if self.event_name ~= nil then
		local var3344 = self.event_name:encode()
		local var3345, var3346 = protoModule.writeTag(buff, var3343, 1, protoModule.wireTypes.lengthDelimited)
		var3345, var3346 = protoModule.writeBuffer(var3345, var3346, var3344, buffer.len(var3344))
		buff = var3345
		var3343 = var3346
	end
	if self.event_fields ~= nil then
		local var3347 = self.event_fields:encode()
		local var3348, var3349 = protoModule.writeTag(buff, var3343, 2, protoModule.wireTypes.lengthDelimited)
		var3348, var3349 = protoModule.writeBuffer(var3348, var3349, var3347, buffer.len(var3347))
		buff = var3348
		var3343 = var3349
	end
	local buff_1 = buffer.create(var3343)
	buffer.copy(buff_1, 0, buff, 0, var3343)
	
	return buff_1
end

function t_101.decode(p198) --[[ line: 20305 ]]
	-- upvalues: t_101 (ref), protoModule (ref), propTypesModule (ref)
	local var3351 = t_101.new()
	local var3352 = 0
	while var3352 < buffer.len(p198) do
		local _ = nil
		local var3353 = nil
		local var3354, var3355, var3356 = protoModule.readTag(p198, var3352)
		local var3357 = var3354
		var3353 = var3355
		var3352 = var3356
		
		if var3353 == protoModule.wireTypes.varint then
			local _ = nil
			local var3358, var3359 = protoModule.readVarInt(p198, var3352)
			local _ = var3358
			var3352 = var3359
			continue
		end
		if var3353 == protoModule.wireTypes.lengthDelimited then
			if var3357 == 1 then
				local _ = nil
				local var3360, var3361 = protoModule.readBuffer(p198, var3352)
				var3352 = var3361
				var3351.event_name = propTypesModule.StringProp.decode(var3360)
			elseif var3357 == 2 then
				local _ = nil
				local var3362, var3363 = protoModule.readBuffer(p198, var3352)
				var3352 = var3363
				var3351.event_fields = propTypesModule.StructProp.decode(var3362)
			else
				local _ = nil
				local var3364, var3365 = protoModule.readVarInt(p198, var3352)
				var3352 = var3365 + var3364
			end
		elseif var3353 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3366, var3367 = protoModule.readFixed32(p198, var3352)
			local _ = var3366
			var3352 = var3367
		elseif var3353 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3368, var3369 = protoModule.readFixed64(p198, var3352)
			local _ = var3368
			var3352 = var3369
		else
			error("Unsupported wire type: " .. var3353)
		end
	end
	return var3351
end

function t_101:jsonEncode() --[[ line: 20353 ]]
	local t = {}
	
	if self.event_name ~= nil then
		t.eventName = self.event_name:jsonEncode()
	end
	if self.event_fields ~= nil then
		t.eventFields = self.event_fields:jsonEncode()
	end
	return t
end

function t_101:jsonDecode() --[[ line: 20367 ]]
	-- upvalues: t_101 (ref), propTypesModule (ref)
	local var3371 = t_101.new()
	
	if self.event_name ~= nil then
		var3371.event_name = propTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		var3371.event_name = propTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		var3371.event_fields = propTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		var3371.event_fields = propTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return var3371
end

t_101.descriptor = {
	name = "AnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.AnalyticsEventAction_Params = t_101
typeRegistryModule.default:register(t.AnalyticsEventAction_Params)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p199) --[[ line: 20405 ]]
	-- upvalues: t (ref), t_102 (ref)
	return setmetatable({
		action_type = if p199 == nil or p199.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p199.action_type,
		action_params = if p199 == nil or p199.action_params == nil then nil else p199.action_params
	}, t_102)
end

function t_102:encode() --[[ line: 20416 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3373 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3374, var3375 = protoModule.writeTag(buff, var3373, 1, protoModule.wireTypes.varint)
		var3374, var3375 = protoModule.writeVarInt(var3374, var3375, t.ActionType.toNumber(self.action_type))
		buff = var3374
		var3373 = var3375
	end
	if self.action_params ~= nil then
		local var3376 = self.action_params:encode()
		local var3377, var3378 = protoModule.writeTag(buff, var3373, 2, protoModule.wireTypes.lengthDelimited)
		var3377, var3378 = protoModule.writeBuffer(var3377, var3378, var3376, buffer.len(var3376))
		buff = var3377
		var3373 = var3378
	end
	local buff_1 = buffer.create(var3373)
	buffer.copy(buff_1, 0, buff, 0, var3373)
	
	return buff_1
end

function t_102.decode(p200) --[[ line: 20442 ]]
	-- upvalues: t_102 (ref), protoModule (ref), t (ref)
	local var3380 = t_102.new()
	local var3381 = 0
	while var3381 < buffer.len(p200) do
		local _ = nil
		local var3382 = nil
		local var3383, var3384, var3385 = protoModule.readTag(p200, var3381)
		local var3386 = var3383
		var3382 = var3384
		var3381 = var3385
		
		if var3382 == protoModule.wireTypes.varint then
			if var3386 == 1 then
				local _ = nil
				local var3387, var3388 = protoModule.readVarIntI32(p200, var3381)
				local var3389 = var3387
				var3381 = var3388
				var3380.action_type = t.ActionType.fromNumber(var3389) or var3389
			else
				local _ = nil
				local var3390, var3391 = protoModule.readVarInt(p200, var3381)
				local _ = var3390
				var3381 = var3391
			end
		end
		if var3382 == protoModule.wireTypes.lengthDelimited then
			if var3386 == 2 then
				local _ = nil
				local var3392, var3393 = protoModule.readBuffer(p200, var3381)
				var3381 = var3393
				var3380.action_params = t.CustomAnalyticsEventAction_Params.decode(var3392)
			else
				local _ = nil
				local var3394, var3395 = protoModule.readVarInt(p200, var3381)
				var3381 = var3395 + var3394
			end
		elseif var3382 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3396, var3397 = protoModule.readFixed32(p200, var3381)
			local _ = var3396
			var3381 = var3397
		elseif var3382 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3398, var3399 = protoModule.readFixed64(p200, var3381)
			local _ = var3398
			var3381 = var3399
		else
			error("Unsupported wire type: " .. var3382)
		end
	end
	return var3380
end

function t_102:jsonEncode() --[[ line: 20490 ]]
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

function t_102:jsonDecode() --[[ line: 20512 ]]
	-- upvalues: t_102 (ref), t (ref)
	local var3401 = t_102.new()
	
	if self.action_type ~= nil then
		var3401.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3401.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3401.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3401.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return var3401
end

t_102.descriptor = {
	name = "CustomAnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomAnalyticsEventAction"
}
t.CustomAnalyticsEventAction = t_102
typeRegistryModule.default:register(t.CustomAnalyticsEventAction)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p201) --[[ line: 20552 ]]
	-- upvalues: t_103 (ref)
	return setmetatable({
		event_name = if p201 == nil or p201.event_name == nil then nil else p201.event_name,
		event_fields = if p201 == nil or p201.event_fields == nil then nil else p201.event_fields
	}, t_103)
end

function t_103:encode() --[[ line: 20561 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3403 = 0
	
	if self.event_name ~= nil then
		local var3404 = self.event_name:encode()
		local var3405, var3406 = protoModule.writeTag(buff, var3403, 1, protoModule.wireTypes.lengthDelimited)
		var3405, var3406 = protoModule.writeBuffer(var3405, var3406, var3404, buffer.len(var3404))
		buff = var3405
		var3403 = var3406
	end
	if self.event_fields ~= nil then
		local var3407 = self.event_fields:encode()
		local var3408, var3409 = protoModule.writeTag(buff, var3403, 2, protoModule.wireTypes.lengthDelimited)
		var3408, var3409 = protoModule.writeBuffer(var3408, var3409, var3407, buffer.len(var3407))
		buff = var3408
		var3403 = var3409
	end
	local buff_1 = buffer.create(var3403)
	buffer.copy(buff_1, 0, buff, 0, var3403)
	
	return buff_1
end

function t_103.decode(p202) --[[ line: 20582 ]]
	-- upvalues: t_103 (ref), protoModule (ref), propTypesModule (ref)
	local var3411 = t_103.new()
	local var3412 = 0
	while var3412 < buffer.len(p202) do
		local _ = nil
		local var3413 = nil
		local var3414, var3415, var3416 = protoModule.readTag(p202, var3412)
		local var3417 = var3414
		var3413 = var3415
		var3412 = var3416
		
		if var3413 == protoModule.wireTypes.varint then
			local _ = nil
			local var3418, var3419 = protoModule.readVarInt(p202, var3412)
			local _ = var3418
			var3412 = var3419
			continue
		end
		if var3413 == protoModule.wireTypes.lengthDelimited then
			if var3417 == 1 then
				local _ = nil
				local var3420, var3421 = protoModule.readBuffer(p202, var3412)
				var3412 = var3421
				var3411.event_name = propTypesModule.StringProp.decode(var3420)
			elseif var3417 == 2 then
				local _ = nil
				local var3422, var3423 = protoModule.readBuffer(p202, var3412)
				var3412 = var3423
				var3411.event_fields = propTypesModule.StructProp.decode(var3422)
			else
				local _ = nil
				local var3424, var3425 = protoModule.readVarInt(p202, var3412)
				var3412 = var3425 + var3424
			end
		elseif var3413 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3426, var3427 = protoModule.readFixed32(p202, var3412)
			local _ = var3426
			var3412 = var3427
		elseif var3413 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3428, var3429 = protoModule.readFixed64(p202, var3412)
			local _ = var3428
			var3412 = var3429
		else
			error("Unsupported wire type: " .. var3413)
		end
	end
	return var3411
end

function t_103:jsonEncode() --[[ line: 20630 ]]
	local t = {}
	
	if self.event_name ~= nil then
		t.eventName = self.event_name:jsonEncode()
	end
	if self.event_fields ~= nil then
		t.eventFields = self.event_fields:jsonEncode()
	end
	return t
end

function t_103:jsonDecode() --[[ line: 20644 ]]
	-- upvalues: t_103 (ref), propTypesModule (ref)
	local var3431 = t_103.new()
	
	if self.event_name ~= nil then
		var3431.event_name = propTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		var3431.event_name = propTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		var3431.event_fields = propTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		var3431.event_fields = propTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return var3431
end

t_103.descriptor = {
	name = "CustomAnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.CustomAnalyticsEventAction_Params = t_103
typeRegistryModule.default:register(t.CustomAnalyticsEventAction_Params)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p203) --[[ line: 20684 ]]
	-- upvalues: t (ref), t_104 (ref)
	return setmetatable({
		action_type = if p203 == nil or p203.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p203.action_type,
		action_params = if p203 == nil or p203.action_params == nil then nil else p203.action_params
	}, t_104)
end

function t_104:encode() --[[ line: 20693 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3433 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3434, var3435 = protoModule.writeTag(buff, var3433, 1, protoModule.wireTypes.varint)
		var3434, var3435 = protoModule.writeVarInt(var3434, var3435, t.ActionType.toNumber(self.action_type))
		buff = var3434
		var3433 = var3435
	end
	if self.action_params ~= nil then
		local var3436 = self.action_params:encode()
		local var3437, var3438 = protoModule.writeTag(buff, var3433, 2, protoModule.wireTypes.lengthDelimited)
		var3437, var3438 = protoModule.writeBuffer(var3437, var3438, var3436, buffer.len(var3436))
		buff = var3437
		var3433 = var3438
	end
	local buff_1 = buffer.create(var3433)
	buffer.copy(buff_1, 0, buff, 0, var3433)
	
	return buff_1
end

function t_104.decode(p204) --[[ line: 20719 ]]
	-- upvalues: t_104 (ref), protoModule (ref), t (ref)
	local var3440 = t_104.new()
	local var3441 = 0
	while var3441 < buffer.len(p204) do
		local _ = nil
		local var3442 = nil
		local var3443, var3444, var3445 = protoModule.readTag(p204, var3441)
		local var3446 = var3443
		var3442 = var3444
		var3441 = var3445
		
		if var3442 == protoModule.wireTypes.varint then
			if var3446 == 1 then
				local _ = nil
				local var3447, var3448 = protoModule.readVarIntI32(p204, var3441)
				local var3449 = var3447
				var3441 = var3448
				var3440.action_type = t.ActionType.fromNumber(var3449) or var3449
			else
				local _ = nil
				local var3450, var3451 = protoModule.readVarInt(p204, var3441)
				local _ = var3450
				var3441 = var3451
			end
		end
		if var3442 == protoModule.wireTypes.lengthDelimited then
			if var3446 == 2 then
				local _ = nil
				local var3452, var3453 = protoModule.readBuffer(p204, var3441)
				var3441 = var3453
				var3440.action_params = t.OpenGameInviteAction_Params.decode(var3452)
			else
				local _ = nil
				local var3454, var3455 = protoModule.readVarInt(p204, var3441)
				var3441 = var3455 + var3454
			end
		elseif var3442 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3456, var3457 = protoModule.readFixed32(p204, var3441)
			local _ = var3456
			var3441 = var3457
		elseif var3442 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3458, var3459 = protoModule.readFixed64(p204, var3441)
			local _ = var3458
			var3441 = var3459
		else
			error("Unsupported wire type: " .. var3442)
		end
	end
	return var3440
end

function t_104:jsonEncode() --[[ line: 20767 ]]
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

function t_104:jsonDecode() --[[ line: 20789 ]]
	-- upvalues: t_104 (ref), t (ref)
	local var3461 = t_104.new()
	
	if self.action_type ~= nil then
		var3461.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3461.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3461.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3461.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.actionParams)
	end
	return var3461
end

t_104.descriptor = {
	name = "OpenGameInviteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameInviteAction"
}
t.OpenGameInviteAction = t_104
typeRegistryModule.default:register(t.OpenGameInviteAction)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p205) --[[ line: 20829 ]]
	-- upvalues: t_105 (ref)
	return setmetatable({
		universe_id = if p205 == nil or p205.universe_id == nil then nil else p205.universe_id,
		root_place_id = if p205 == nil or p205.root_place_id == nil then nil else p205.root_place_id,
		trigger = if p205 == nil or p205.trigger == nil then nil else p205.trigger,
		button_name = if p205 == nil or p205.button_name == nil then nil else p205.button_name
	}, t_105)
end

function t_105:encode() --[[ line: 20840 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3463 = 0
	
	if self.universe_id ~= nil then
		local var3464 = self.universe_id:encode()
		local var3465, var3466 = protoModule.writeTag(buff, var3463, 1, protoModule.wireTypes.lengthDelimited)
		var3465, var3466 = protoModule.writeBuffer(var3465, var3466, var3464, buffer.len(var3464))
		buff = var3465
		var3463 = var3466
	end
	if self.root_place_id ~= nil then
		local var3467 = self.root_place_id:encode()
		local var3468, var3469 = protoModule.writeTag(buff, var3463, 2, protoModule.wireTypes.lengthDelimited)
		var3468, var3469 = protoModule.writeBuffer(var3468, var3469, var3467, buffer.len(var3467))
		buff = var3468
		var3463 = var3469
	end
	if self.trigger ~= nil then
		local var3470 = self.trigger:encode()
		local var3471, var3472 = protoModule.writeTag(buff, var3463, 3, protoModule.wireTypes.lengthDelimited)
		var3471, var3472 = protoModule.writeBuffer(var3471, var3472, var3470, buffer.len(var3470))
		buff = var3471
		var3463 = var3472
	end
	if self.button_name ~= nil then
		local var3473 = self.button_name:encode()
		local var3474, var3475 = protoModule.writeTag(buff, var3463, 4, protoModule.wireTypes.lengthDelimited)
		var3474, var3475 = protoModule.writeBuffer(var3474, var3475, var3473, buffer.len(var3473))
		buff = var3474
		var3463 = var3475
	end
	local buff_1 = buffer.create(var3463)
	buffer.copy(buff_1, 0, buff, 0, var3463)
	
	return buff_1
end

function t_105.decode(p206) --[[ line: 20873 ]]
	-- upvalues: t_105 (ref), protoModule (ref), propTypesModule (ref)
	local var3477 = t_105.new()
	local var3478 = 0
	while var3478 < buffer.len(p206) do
		local _ = nil
		local var3479 = nil
		local var3480, var3481, var3482 = protoModule.readTag(p206, var3478)
		local var3483 = var3480
		var3479 = var3481
		var3478 = var3482
		
		if var3479 == protoModule.wireTypes.varint then
			local _ = nil
			local var3484, var3485 = protoModule.readVarInt(p206, var3478)
			local _ = var3484
			var3478 = var3485
			continue
		end
		if var3479 == protoModule.wireTypes.lengthDelimited then
			if var3483 == 1 then
				local _ = nil
				local var3486, var3487 = protoModule.readBuffer(p206, var3478)
				var3478 = var3487
				var3477.universe_id = propTypesModule.StringProp.decode(var3486)
			elseif var3483 == 2 then
				local _ = nil
				local var3488, var3489 = protoModule.readBuffer(p206, var3478)
				var3478 = var3489
				var3477.root_place_id = propTypesModule.StringProp.decode(var3488)
			elseif var3483 == 3 then
				local _ = nil
				local var3490, var3491 = protoModule.readBuffer(p206, var3478)
				var3478 = var3491
				var3477.trigger = propTypesModule.StringProp.decode(var3490)
			elseif var3483 == 4 then
				local _ = nil
				local var3492, var3493 = protoModule.readBuffer(p206, var3478)
				var3478 = var3493
				var3477.button_name = propTypesModule.StringProp.decode(var3492)
			else
				local _ = nil
				local var3494, var3495 = protoModule.readVarInt(p206, var3478)
				var3478 = var3495 + var3494
			end
		elseif var3479 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3496, var3497 = protoModule.readFixed32(p206, var3478)
			local _ = var3496
			var3478 = var3497
		elseif var3479 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3498, var3499 = protoModule.readFixed64(p206, var3478)
			local _ = var3498
			var3478 = var3499
		else
			error("Unsupported wire type: " .. var3479)
		end
	end
	return var3477
end

function t_105:jsonEncode() --[[ line: 20931 ]]
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

function t_105:jsonDecode() --[[ line: 20953 ]]
	-- upvalues: t_105 (ref), propTypesModule (ref)
	local var3501 = t_105.new()
	
	if self.universe_id ~= nil then
		var3501.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3501.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		var3501.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var3501.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	if self.trigger ~= nil then
		var3501.trigger = propTypesModule.StringProp.jsonDecode(self.trigger)
	end
	if self.button_name ~= nil then
		var3501.button_name = propTypesModule.StringProp.jsonDecode(self.button_name)
	end
	if self.buttonName ~= nil then
		var3501.button_name = propTypesModule.StringProp.jsonDecode(self.buttonName)
	end
	return var3501
end

t_105.descriptor = {
	name = "OpenGameInviteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameInviteAction_Params = t_105
typeRegistryModule.default:register(t.OpenGameInviteAction_Params)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p207) --[[ line: 21005 ]]
	-- upvalues: t (ref), t_106 (ref)
	return setmetatable({
		action_type = if p207 == nil or p207.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p207.action_type,
		action_params = if p207 == nil or p207.action_params == nil then nil else p207.action_params
	}, t_106)
end

function t_106:encode() --[[ line: 21014 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3503 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3504, var3505 = protoModule.writeTag(buff, var3503, 1, protoModule.wireTypes.varint)
		var3504, var3505 = protoModule.writeVarInt(var3504, var3505, t.ActionType.toNumber(self.action_type))
		buff = var3504
		var3503 = var3505
	end
	if self.action_params ~= nil then
		local var3506 = self.action_params:encode()
		local var3507, var3508 = protoModule.writeTag(buff, var3503, 2, protoModule.wireTypes.lengthDelimited)
		var3507, var3508 = protoModule.writeBuffer(var3507, var3508, var3506, buffer.len(var3506))
		buff = var3507
		var3503 = var3508
	end
	local buff_1 = buffer.create(var3503)
	buffer.copy(buff_1, 0, buff, 0, var3503)
	
	return buff_1
end

function t_106.decode(p208) --[[ line: 21040 ]]
	-- upvalues: t_106 (ref), protoModule (ref), t (ref)
	local var3510 = t_106.new()
	local var3511 = 0
	while var3511 < buffer.len(p208) do
		local _ = nil
		local var3512 = nil
		local var3513, var3514, var3515 = protoModule.readTag(p208, var3511)
		local var3516 = var3513
		var3512 = var3514
		var3511 = var3515
		
		if var3512 == protoModule.wireTypes.varint then
			if var3516 == 1 then
				local _ = nil
				local var3517, var3518 = protoModule.readVarIntI32(p208, var3511)
				local var3519 = var3517
				var3511 = var3518
				var3510.action_type = t.ActionType.fromNumber(var3519) or var3519
			else
				local _ = nil
				local var3520, var3521 = protoModule.readVarInt(p208, var3511)
				local _ = var3520
				var3511 = var3521
			end
		end
		if var3512 == protoModule.wireTypes.lengthDelimited then
			if var3516 == 2 then
				local _ = nil
				local var3522, var3523 = protoModule.readBuffer(p208, var3511)
				var3511 = var3523
				var3510.action_params = t.LaunchExperienceAction_Params.decode(var3522)
			else
				local _ = nil
				local var3524, var3525 = protoModule.readVarInt(p208, var3511)
				var3511 = var3525 + var3524
			end
		elseif var3512 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3526, var3527 = protoModule.readFixed32(p208, var3511)
			local _ = var3526
			var3511 = var3527
		elseif var3512 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3528, var3529 = protoModule.readFixed64(p208, var3511)
			local _ = var3528
			var3511 = var3529
		else
			error("Unsupported wire type: " .. var3512)
		end
	end
	return var3510
end

function t_106:jsonEncode() --[[ line: 21088 ]]
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

function t_106:jsonDecode() --[[ line: 21110 ]]
	-- upvalues: t_106 (ref), t (ref)
	local var3531 = t_106.new()
	
	if self.action_type ~= nil then
		var3531.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3531.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3531.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3531.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.actionParams)
	end
	return var3531
end

t_106.descriptor = {
	name = "LaunchExperienceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LaunchExperienceAction"
}
t.LaunchExperienceAction = t_106
typeRegistryModule.default:register(t.LaunchExperienceAction)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p209) --[[ line: 21150 ]]
	-- upvalues: t_107 (ref)
	return setmetatable({
		kind = if p209 == nil or p209.kind == nil then nil else p209.kind
	}, t_107)
end

function t_107:encode() --[[ line: 21158 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3533 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3534 = self.kind.value:encode()
			local var3535, var3536 = protoModule.writeTag(buff, var3533, 1, protoModule.wireTypes.lengthDelimited)
			var3535, var3536 = protoModule.writeBuffer(var3535, var3536, var3534, buffer.len(var3534))
			buff = var3535
			var3533 = var3536
		elseif self.kind.type == "binding_path" then
			local var3537, var3538 = protoModule.writeTag(buff, var3533, 2, protoModule.wireTypes.lengthDelimited)
			var3537, var3538 = protoModule.writeString(var3537, var3538, self.kind.value)
			buff = var3537
			var3533 = var3538
		end
	end
	local buff_1 = buffer.create(var3533)
	buffer.copy(buff_1, 0, buff, 0, var3533)
	
	return buff_1
end

function t_107.decode(p210) --[[ line: 21180 ]]
	-- upvalues: t_107 (ref), protoModule (ref), t (ref)
	local var3540 = t_107.new()
	local var3541 = 0
	while var3541 < buffer.len(p210) do
		local _ = nil
		local var3542 = nil
		local var3543, var3544, var3545 = protoModule.readTag(p210, var3541)
		local var3546 = var3543
		var3542 = var3544
		var3541 = var3545
		
		if var3542 == protoModule.wireTypes.varint then
			local _ = nil
			local var3547, var3548 = protoModule.readVarInt(p210, var3541)
			local _ = var3547
			var3541 = var3548
			continue
		end
		if var3542 == protoModule.wireTypes.lengthDelimited then
			if var3546 == 1 then
				local _ = nil
				local var3549, var3550 = protoModule.readBuffer(p210, var3541)
				var3541 = var3550
				var3540.kind = {
					type = "literal",
					value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.decode(var3549)
				}
			elseif var3546 == 2 then
				local _ = nil
				local var3551, var3552 = protoModule.readBuffer(p210, var3541)
				var3541 = var3552
				var3540.kind = { type = "binding_path", value = buffer.tostring(var3551) }
			else
				local _ = nil
				local var3553, var3554 = protoModule.readVarInt(p210, var3541)
				var3541 = var3554 + var3553
			end
		elseif var3542 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3555, var3556 = protoModule.readFixed32(p210, var3541)
			local _ = var3555
			var3541 = var3556
		elseif var3542 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3557, var3558 = protoModule.readFixed64(p210, var3541)
			local _ = var3557
			var3541 = var3558
		else
			error("Unsupported wire type: " .. var3542)
		end
	end
	return var3540
end

function t_107:jsonEncode() --[[ line: 21235 ]]
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

function t_107:jsonDecode() --[[ line: 21251 ]]
	-- upvalues: t_107 (ref), t (ref)
	local var3560 = t_107.new()
	
	if self.literal ~= nil then
		var3560.kind = {
			type = "literal",
			value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3560.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3560.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3560
end

t_107.descriptor = {
	name = "LaunchExperienceAction_ExperienceJoinData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceJoinData"
}
t.LaunchExperienceAction_ExperienceJoinData = t_107
typeRegistryModule.default:register(t.LaunchExperienceAction_ExperienceJoinData)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p211) --[[ line: 21291 ]]
	-- upvalues: t_108 (ref)
	return setmetatable({
		launch_data = if p211 == nil or p211.launch_data == nil then nil else p211.launch_data,
		event_id = if p211 == nil or p211.event_id == nil then nil else p211.event_id
	}, t_108)
end

function t_108:encode() --[[ line: 21303 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3562 = 0
	
	if self.launch_data ~= nil then
		local var3563 = self.launch_data:encode()
		local var3564, var3565 = protoModule.writeTag(buff, var3562, 1, protoModule.wireTypes.lengthDelimited)
		var3564, var3565 = protoModule.writeBuffer(var3564, var3565, var3563, buffer.len(var3563))
		buff = var3564
		var3562 = var3565
	end
	if self.event_id ~= nil then
		local var3566 = self.event_id:encode()
		local var3567, var3568 = protoModule.writeTag(buff, var3562, 2, protoModule.wireTypes.lengthDelimited)
		var3567, var3568 = protoModule.writeBuffer(var3567, var3568, var3566, buffer.len(var3566))
		buff = var3567
		var3562 = var3568
	end
	local buff_1 = buffer.create(var3562)
	buffer.copy(buff_1, 0, buff, 0, var3562)
	
	return buff_1
end

function t_108.decode(p212) --[[ line: 21326 ]]
	-- upvalues: t_108 (ref), protoModule (ref), propTypesModule (ref)
	local var3570 = t_108.new()
	local var3571 = 0
	while var3571 < buffer.len(p212) do
		local _ = nil
		local var3572 = nil
		local var3573, var3574, var3575 = protoModule.readTag(p212, var3571)
		local var3576 = var3573
		var3572 = var3574
		var3571 = var3575
		
		if var3572 == protoModule.wireTypes.varint then
			local _ = nil
			local var3577, var3578 = protoModule.readVarInt(p212, var3571)
			local _ = var3577
			var3571 = var3578
			continue
		end
		if var3572 == protoModule.wireTypes.lengthDelimited then
			if var3576 == 1 then
				local _ = nil
				local var3579, var3580 = protoModule.readBuffer(p212, var3571)
				var3571 = var3580
				var3570.launch_data = propTypesModule.StringProp.decode(var3579)
			elseif var3576 == 2 then
				local _ = nil
				local var3581, var3582 = protoModule.readBuffer(p212, var3571)
				var3571 = var3582
				var3570.event_id = propTypesModule.StringProp.decode(var3581)
			else
				local _ = nil
				local var3583, var3584 = protoModule.readVarInt(p212, var3571)
				var3571 = var3584 + var3583
			end
		elseif var3572 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3585, var3586 = protoModule.readFixed32(p212, var3571)
			local _ = var3585
			var3571 = var3586
		elseif var3572 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3587, var3588 = protoModule.readFixed64(p212, var3571)
			local _ = var3587
			var3571 = var3588
		else
			error("Unsupported wire type: " .. var3572)
		end
	end
	return var3570
end

function t_108:jsonEncode() --[[ line: 21376 ]]
	local t = {}
	
	if self.launch_data ~= nil then
		t.launchData = self.launch_data:jsonEncode()
	end
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_108:jsonDecode() --[[ line: 21392 ]]
	-- upvalues: t_108 (ref), propTypesModule (ref)
	local var3590 = t_108.new()
	
	if self.launch_data ~= nil then
		var3590.launch_data = propTypesModule.StringProp.jsonDecode(self.launch_data)
	end
	if self.launchData ~= nil then
		var3590.launch_data = propTypesModule.StringProp.jsonDecode(self.launchData)
	end
	if self.event_id ~= nil then
		var3590.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var3590.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var3590
end

t_108.descriptor = {
	name = "LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceJoinDataLiteral"
}
t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral = t_108
typeRegistryModule.default:register(t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p213) --[[ line: 21432 ]]
	-- upvalues: t_109 (ref)
	return setmetatable({
		place_id = if p213 == nil or p213.place_id == nil then nil else p213.place_id,
		universe_id = if p213 == nil or p213.universe_id == nil then nil else p213.universe_id,
		launch_source = if p213 == nil or p213.launch_source == nil then nil else p213.launch_source,
		experience_join_data = if p213 == nil or p213.experience_join_data == nil then nil else p213.experience_join_data
	}, t_109)
end

function t_109:encode() --[[ line: 21445 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3592 = 0
	
	if self.place_id ~= nil then
		local var3593 = self.place_id:encode()
		local var3594, var3595 = protoModule.writeTag(buff, var3592, 1, protoModule.wireTypes.lengthDelimited)
		var3594, var3595 = protoModule.writeBuffer(var3594, var3595, var3593, buffer.len(var3593))
		buff = var3594
		var3592 = var3595
	end
	if self.universe_id ~= nil then
		local var3596 = self.universe_id:encode()
		local var3597, var3598 = protoModule.writeTag(buff, var3592, 2, protoModule.wireTypes.lengthDelimited)
		var3597, var3598 = protoModule.writeBuffer(var3597, var3598, var3596, buffer.len(var3596))
		buff = var3597
		var3592 = var3598
	end
	if self.launch_source ~= nil then
		local var3599 = self.launch_source:encode()
		local var3600, var3601 = protoModule.writeTag(buff, var3592, 3, protoModule.wireTypes.lengthDelimited)
		var3600, var3601 = protoModule.writeBuffer(var3600, var3601, var3599, buffer.len(var3599))
		buff = var3600
		var3592 = var3601
	end
	if self.experience_join_data ~= nil then
		local var3602 = self.experience_join_data:encode()
		local var3603, var3604 = protoModule.writeTag(buff, var3592, 4, protoModule.wireTypes.lengthDelimited)
		var3603, var3604 = protoModule.writeBuffer(var3603, var3604, var3602, buffer.len(var3602))
		buff = var3603
		var3592 = var3604
	end
	local buff_1 = buffer.create(var3592)
	buffer.copy(buff_1, 0, buff, 0, var3592)
	
	return buff_1
end

function t_109.decode(p214) --[[ line: 21478 ]]
	-- upvalues: t_109 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var3606 = t_109.new()
	local var3607 = 0
	while var3607 < buffer.len(p214) do
		local _ = nil
		local var3608 = nil
		local var3609, var3610, var3611 = protoModule.readTag(p214, var3607)
		local var3612 = var3609
		var3608 = var3610
		var3607 = var3611
		
		if var3608 == protoModule.wireTypes.varint then
			local _ = nil
			local var3613, var3614 = protoModule.readVarInt(p214, var3607)
			local _ = var3613
			var3607 = var3614
			continue
		end
		if var3608 == protoModule.wireTypes.lengthDelimited then
			if var3612 == 1 then
				local _ = nil
				local var3615, var3616 = protoModule.readBuffer(p214, var3607)
				var3607 = var3616
				var3606.place_id = propTypesModule.StringProp.decode(var3615)
			elseif var3612 == 2 then
				local _ = nil
				local var3617, var3618 = protoModule.readBuffer(p214, var3607)
				var3607 = var3618
				var3606.universe_id = propTypesModule.StringProp.decode(var3617)
			elseif var3612 == 3 then
				local _ = nil
				local var3619, var3620 = protoModule.readBuffer(p214, var3607)
				var3607 = var3620
				var3606.launch_source = propTypesModule.StringProp.decode(var3619)
			elseif var3612 == 4 then
				local _ = nil
				local var3621, var3622 = protoModule.readBuffer(p214, var3607)
				var3607 = var3622
				var3606.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.decode(var3621)
			else
				local _ = nil
				local var3623, var3624 = protoModule.readVarInt(p214, var3607)
				var3607 = var3624 + var3623
			end
		elseif var3608 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3625, var3626 = protoModule.readFixed32(p214, var3607)
			local _ = var3625
			var3607 = var3626
		elseif var3608 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3627, var3628 = protoModule.readFixed64(p214, var3607)
			local _ = var3627
			var3607 = var3628
		else
			error("Unsupported wire type: " .. var3608)
		end
	end
	return var3606
end

function t_109:jsonEncode() --[[ line: 21536 ]]
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

function t_109:jsonDecode() --[[ line: 21558 ]]
	-- upvalues: t_109 (ref), propTypesModule (ref), t (ref)
	local var3630 = t_109.new()
	
	if self.place_id ~= nil then
		var3630.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var3630.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var3630.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3630.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.launch_source ~= nil then
		var3630.launch_source = propTypesModule.StringProp.jsonDecode(self.launch_source)
	end
	if self.launchSource ~= nil then
		var3630.launch_source = propTypesModule.StringProp.jsonDecode(self.launchSource)
	end
	if self.experience_join_data ~= nil then
		var3630.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experience_join_data)
	end
	if self.experienceJoinData ~= nil then
		var3630.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experienceJoinData)
	end
	return var3630
end

t_109.descriptor = {
	name = "LaunchExperienceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LaunchExperienceAction_Params = t_109
typeRegistryModule.default:register(t.LaunchExperienceAction_Params)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p215) --[[ line: 21615 ]]
	-- upvalues: t (ref), t_110 (ref)
	return setmetatable({
		action_type = if p215 == nil or p215.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p215.action_type,
		action_params = if p215 == nil or p215.action_params == nil then nil else p215.action_params
	}, t_110)
end

function t_110:encode() --[[ line: 21626 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3632 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3633, var3634 = protoModule.writeTag(buff, var3632, 1, protoModule.wireTypes.varint)
		var3633, var3634 = protoModule.writeVarInt(var3633, var3634, t.ActionType.toNumber(self.action_type))
		buff = var3633
		var3632 = var3634
	end
	if self.action_params ~= nil then
		local var3635 = self.action_params:encode()
		local var3636, var3637 = protoModule.writeTag(buff, var3632, 2, protoModule.wireTypes.lengthDelimited)
		var3636, var3637 = protoModule.writeBuffer(var3636, var3637, var3635, buffer.len(var3635))
		buff = var3636
		var3632 = var3637
	end
	local buff_1 = buffer.create(var3632)
	buffer.copy(buff_1, 0, buff, 0, var3632)
	
	return buff_1
end

function t_110.decode(p216) --[[ line: 21652 ]]
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var3639 = t_110.new()
	local var3640 = 0
	while var3640 < buffer.len(p216) do
		local _ = nil
		local var3641 = nil
		local var3642, var3643, var3644 = protoModule.readTag(p216, var3640)
		local var3645 = var3642
		var3641 = var3643
		var3640 = var3644
		
		if var3641 == protoModule.wireTypes.varint then
			if var3645 == 1 then
				local _ = nil
				local var3646, var3647 = protoModule.readVarIntI32(p216, var3640)
				local var3648 = var3646
				var3640 = var3647
				var3639.action_type = t.ActionType.fromNumber(var3648) or var3648
			else
				local _ = nil
				local var3649, var3650 = protoModule.readVarInt(p216, var3640)
				local _ = var3649
				var3640 = var3650
			end
		end
		if var3641 == protoModule.wireTypes.lengthDelimited then
			if var3645 == 2 then
				local _ = nil
				local var3651, var3652 = protoModule.readBuffer(p216, var3640)
				var3640 = var3652
				var3639.action_params = t.ToggleExperienceFavoriteAction_Params.decode(var3651)
			else
				local _ = nil
				local var3653, var3654 = protoModule.readVarInt(p216, var3640)
				var3640 = var3654 + var3653
			end
		elseif var3641 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3655, var3656 = protoModule.readFixed32(p216, var3640)
			local _ = var3655
			var3640 = var3656
		elseif var3641 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3657, var3658 = protoModule.readFixed64(p216, var3640)
			local _ = var3657
			var3640 = var3658
		else
			error("Unsupported wire type: " .. var3641)
		end
	end
	return var3639
end

function t_110:jsonEncode() --[[ line: 21700 ]]
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

function t_110:jsonDecode() --[[ line: 21722 ]]
	-- upvalues: t_110 (ref), t (ref)
	local var3660 = t_110.new()
	
	if self.action_type ~= nil then
		var3660.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3660.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3660.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3660.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.actionParams)
	end
	return var3660
end

t_110.descriptor = {
	name = "ToggleExperienceFavoriteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceFavoriteAction"
}
t.ToggleExperienceFavoriteAction = t_110
typeRegistryModule.default:register(t.ToggleExperienceFavoriteAction)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p217) --[[ line: 21762 ]]
	-- upvalues: t_111 (ref)
	return setmetatable({
		universe_id = if p217 == nil or p217.universe_id == nil then nil else p217.universe_id,
		place_id = if p217 == nil or p217.place_id == nil then nil else p217.place_id,
		ctx = if p217 == nil or p217.ctx == nil then nil else p217.ctx
	}, t_111)
end

function t_111:encode() --[[ line: 21772 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3662 = 0
	
	if self.universe_id ~= nil then
		local var3663 = self.universe_id:encode()
		local var3664, var3665 = protoModule.writeTag(buff, var3662, 1, protoModule.wireTypes.lengthDelimited)
		var3664, var3665 = protoModule.writeBuffer(var3664, var3665, var3663, buffer.len(var3663))
		buff = var3664
		var3662 = var3665
	end
	if self.place_id ~= nil then
		local var3666 = self.place_id:encode()
		local var3667, var3668 = protoModule.writeTag(buff, var3662, 2, protoModule.wireTypes.lengthDelimited)
		var3667, var3668 = protoModule.writeBuffer(var3667, var3668, var3666, buffer.len(var3666))
		buff = var3667
		var3662 = var3668
	end
	if self.ctx ~= nil then
		local var3669 = self.ctx:encode()
		local var3670, var3671 = protoModule.writeTag(buff, var3662, 3, protoModule.wireTypes.lengthDelimited)
		var3670, var3671 = protoModule.writeBuffer(var3670, var3671, var3669, buffer.len(var3669))
		buff = var3670
		var3662 = var3671
	end
	local buff_1 = buffer.create(var3662)
	buffer.copy(buff_1, 0, buff, 0, var3662)
	
	return buff_1
end

function t_111.decode(p218) --[[ line: 21799 ]]
	-- upvalues: t_111 (ref), protoModule (ref), propTypesModule (ref)
	local var3673 = t_111.new()
	local var3674 = 0
	while var3674 < buffer.len(p218) do
		local _ = nil
		local var3675 = nil
		local var3676, var3677, var3678 = protoModule.readTag(p218, var3674)
		local var3679 = var3676
		var3675 = var3677
		var3674 = var3678
		
		if var3675 == protoModule.wireTypes.varint then
			local _ = nil
			local var3680, var3681 = protoModule.readVarInt(p218, var3674)
			local _ = var3680
			var3674 = var3681
			continue
		end
		if var3675 == protoModule.wireTypes.lengthDelimited then
			if var3679 == 1 then
				local _ = nil
				local var3682, var3683 = protoModule.readBuffer(p218, var3674)
				var3674 = var3683
				var3673.universe_id = propTypesModule.StringProp.decode(var3682)
			elseif var3679 == 2 then
				local _ = nil
				local var3684, var3685 = protoModule.readBuffer(p218, var3674)
				var3674 = var3685
				var3673.place_id = propTypesModule.StringProp.decode(var3684)
			elseif var3679 == 3 then
				local _ = nil
				local var3686, var3687 = protoModule.readBuffer(p218, var3674)
				var3674 = var3687
				var3673.ctx = propTypesModule.StringProp.decode(var3686)
			else
				local _ = nil
				local var3688, var3689 = protoModule.readVarInt(p218, var3674)
				var3674 = var3689 + var3688
			end
		elseif var3675 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3690, var3691 = protoModule.readFixed32(p218, var3674)
			local _ = var3690
			var3674 = var3691
		elseif var3675 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3692, var3693 = protoModule.readFixed64(p218, var3674)
			local _ = var3692
			var3674 = var3693
		else
			error("Unsupported wire type: " .. var3675)
		end
	end
	return var3673
end

function t_111:jsonEncode() --[[ line: 21852 ]]
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

function t_111:jsonDecode() --[[ line: 21870 ]]
	-- upvalues: t_111 (ref), propTypesModule (ref)
	local var3695 = t_111.new()
	
	if self.universe_id ~= nil then
		var3695.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3695.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var3695.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var3695.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		var3695.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var3695
end

t_111.descriptor = {
	name = "ToggleExperienceFavoriteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceFavoriteAction_Params = t_111
typeRegistryModule.default:register(t.ToggleExperienceFavoriteAction_Params)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p219) --[[ line: 21913 ]]
	-- upvalues: t (ref), t_112 (ref)
	return setmetatable({
		action_type = if p219 == nil or p219.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p219.action_type,
		action_params = if p219 == nil or p219.action_params == nil then nil else p219.action_params
	}, t_112)
end

function t_112:encode() --[[ line: 21924 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3697 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3698, var3699 = protoModule.writeTag(buff, var3697, 1, protoModule.wireTypes.varint)
		var3698, var3699 = protoModule.writeVarInt(var3698, var3699, t.ActionType.toNumber(self.action_type))
		buff = var3698
		var3697 = var3699
	end
	if self.action_params ~= nil then
		local var3700 = self.action_params:encode()
		local var3701, var3702 = protoModule.writeTag(buff, var3697, 2, protoModule.wireTypes.lengthDelimited)
		var3701, var3702 = protoModule.writeBuffer(var3701, var3702, var3700, buffer.len(var3700))
		buff = var3701
		var3697 = var3702
	end
	local buff_1 = buffer.create(var3697)
	buffer.copy(buff_1, 0, buff, 0, var3697)
	
	return buff_1
end

function t_112.decode(p220) --[[ line: 21950 ]]
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var3704 = t_112.new()
	local var3705 = 0
	while var3705 < buffer.len(p220) do
		local _ = nil
		local var3706 = nil
		local var3707, var3708, var3709 = protoModule.readTag(p220, var3705)
		local var3710 = var3707
		var3706 = var3708
		var3705 = var3709
		
		if var3706 == protoModule.wireTypes.varint then
			if var3710 == 1 then
				local _ = nil
				local var3711, var3712 = protoModule.readVarIntI32(p220, var3705)
				local var3713 = var3711
				var3705 = var3712
				var3704.action_type = t.ActionType.fromNumber(var3713) or var3713
			else
				local _ = nil
				local var3714, var3715 = protoModule.readVarInt(p220, var3705)
				local _ = var3714
				var3705 = var3715
			end
		end
		if var3706 == protoModule.wireTypes.lengthDelimited then
			if var3710 == 2 then
				local _ = nil
				local var3716, var3717 = protoModule.readBuffer(p220, var3705)
				var3705 = var3717
				var3704.action_params = t.ToggleExperienceFollowAction_Params.decode(var3716)
			else
				local _ = nil
				local var3718, var3719 = protoModule.readVarInt(p220, var3705)
				var3705 = var3719 + var3718
			end
		elseif var3706 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3720, var3721 = protoModule.readFixed32(p220, var3705)
			local _ = var3720
			var3705 = var3721
		elseif var3706 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3722, var3723 = protoModule.readFixed64(p220, var3705)
			local _ = var3722
			var3705 = var3723
		else
			error("Unsupported wire type: " .. var3706)
		end
	end
	return var3704
end

function t_112:jsonEncode() --[[ line: 21998 ]]
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

function t_112:jsonDecode() --[[ line: 22020 ]]
	-- upvalues: t_112 (ref), t (ref)
	local var3725 = t_112.new()
	
	if self.action_type ~= nil then
		var3725.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3725.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3725.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3725.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.actionParams)
	end
	return var3725
end

t_112.descriptor = {
	name = "ToggleExperienceFollowAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceFollowAction"
}
t.ToggleExperienceFollowAction = t_112
typeRegistryModule.default:register(t.ToggleExperienceFollowAction)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p221) --[[ line: 22060 ]]
	-- upvalues: t_113 (ref)
	return setmetatable({
		universe_id = if p221 == nil or p221.universe_id == nil then nil else p221.universe_id,
		game_name = if p221 == nil or p221.game_name == nil then nil else p221.game_name,
		ctx = if p221 == nil or p221.ctx == nil then nil else p221.ctx
	}, t_113)
end

function t_113:encode() --[[ line: 22070 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3727 = 0
	
	if self.universe_id ~= nil then
		local var3728 = self.universe_id:encode()
		local var3729, var3730 = protoModule.writeTag(buff, var3727, 1, protoModule.wireTypes.lengthDelimited)
		var3729, var3730 = protoModule.writeBuffer(var3729, var3730, var3728, buffer.len(var3728))
		buff = var3729
		var3727 = var3730
	end
	if self.game_name ~= nil then
		local var3731 = self.game_name:encode()
		local var3732, var3733 = protoModule.writeTag(buff, var3727, 2, protoModule.wireTypes.lengthDelimited)
		var3732, var3733 = protoModule.writeBuffer(var3732, var3733, var3731, buffer.len(var3731))
		buff = var3732
		var3727 = var3733
	end
	if self.ctx ~= nil then
		local var3734 = self.ctx:encode()
		local var3735, var3736 = protoModule.writeTag(buff, var3727, 3, protoModule.wireTypes.lengthDelimited)
		var3735, var3736 = protoModule.writeBuffer(var3735, var3736, var3734, buffer.len(var3734))
		buff = var3735
		var3727 = var3736
	end
	local buff_1 = buffer.create(var3727)
	buffer.copy(buff_1, 0, buff, 0, var3727)
	
	return buff_1
end

function t_113.decode(p222) --[[ line: 22097 ]]
	-- upvalues: t_113 (ref), protoModule (ref), propTypesModule (ref)
	local var3738 = t_113.new()
	local var3739 = 0
	while var3739 < buffer.len(p222) do
		local _ = nil
		local var3740 = nil
		local var3741, var3742, var3743 = protoModule.readTag(p222, var3739)
		local var3744 = var3741
		var3740 = var3742
		var3739 = var3743
		
		if var3740 == protoModule.wireTypes.varint then
			local _ = nil
			local var3745, var3746 = protoModule.readVarInt(p222, var3739)
			local _ = var3745
			var3739 = var3746
			continue
		end
		if var3740 == protoModule.wireTypes.lengthDelimited then
			if var3744 == 1 then
				local _ = nil
				local var3747, var3748 = protoModule.readBuffer(p222, var3739)
				var3739 = var3748
				var3738.universe_id = propTypesModule.StringProp.decode(var3747)
			elseif var3744 == 2 then
				local _ = nil
				local var3749, var3750 = protoModule.readBuffer(p222, var3739)
				var3739 = var3750
				var3738.game_name = propTypesModule.StringProp.decode(var3749)
			elseif var3744 == 3 then
				local _ = nil
				local var3751, var3752 = protoModule.readBuffer(p222, var3739)
				var3739 = var3752
				var3738.ctx = propTypesModule.StringProp.decode(var3751)
			else
				local _ = nil
				local var3753, var3754 = protoModule.readVarInt(p222, var3739)
				var3739 = var3754 + var3753
			end
		elseif var3740 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3755, var3756 = protoModule.readFixed32(p222, var3739)
			local _ = var3755
			var3739 = var3756
		elseif var3740 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3757, var3758 = protoModule.readFixed64(p222, var3739)
			local _ = var3757
			var3739 = var3758
		else
			error("Unsupported wire type: " .. var3740)
		end
	end
	return var3738
end

function t_113:jsonEncode() --[[ line: 22150 ]]
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

function t_113:jsonDecode() --[[ line: 22168 ]]
	-- upvalues: t_113 (ref), propTypesModule (ref)
	local var3760 = t_113.new()
	
	if self.universe_id ~= nil then
		var3760.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3760.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.game_name ~= nil then
		var3760.game_name = propTypesModule.StringProp.jsonDecode(self.game_name)
	end
	if self.gameName ~= nil then
		var3760.game_name = propTypesModule.StringProp.jsonDecode(self.gameName)
	end
	if self.ctx ~= nil then
		var3760.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var3760
end

t_113.descriptor = {
	name = "ToggleExperienceFollowAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceFollowAction_Params = t_113
typeRegistryModule.default:register(t.ToggleExperienceFollowAction_Params)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p223) --[[ line: 22211 ]]
	-- upvalues: t (ref), t_114 (ref)
	return setmetatable({
		action_type = if p223 == nil or p223.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p223.action_type,
		action_params = if p223 == nil or p223.action_params == nil then nil else p223.action_params
	}, t_114)
end

function t_114:encode() --[[ line: 22222 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3762 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3763, var3764 = protoModule.writeTag(buff, var3762, 1, protoModule.wireTypes.varint)
		var3763, var3764 = protoModule.writeVarInt(var3763, var3764, t.ActionType.toNumber(self.action_type))
		buff = var3763
		var3762 = var3764
	end
	if self.action_params ~= nil then
		local var3765 = self.action_params:encode()
		local var3766, var3767 = protoModule.writeTag(buff, var3762, 2, protoModule.wireTypes.lengthDelimited)
		var3766, var3767 = protoModule.writeBuffer(var3766, var3767, var3765, buffer.len(var3765))
		buff = var3766
		var3762 = var3767
	end
	local buff_1 = buffer.create(var3762)
	buffer.copy(buff_1, 0, buff, 0, var3762)
	
	return buff_1
end

function t_114.decode(p224) --[[ line: 22248 ]]
	-- upvalues: t_114 (ref), protoModule (ref), t (ref)
	local var3769 = t_114.new()
	local var3770 = 0
	while var3770 < buffer.len(p224) do
		local _ = nil
		local var3771 = nil
		local var3772, var3773, var3774 = protoModule.readTag(p224, var3770)
		local var3775 = var3772
		var3771 = var3773
		var3770 = var3774
		
		if var3771 == protoModule.wireTypes.varint then
			if var3775 == 1 then
				local _ = nil
				local var3776, var3777 = protoModule.readVarIntI32(p224, var3770)
				local var3778 = var3776
				var3770 = var3777
				var3769.action_type = t.ActionType.fromNumber(var3778) or var3778
			else
				local _ = nil
				local var3779, var3780 = protoModule.readVarInt(p224, var3770)
				local _ = var3779
				var3770 = var3780
			end
		end
		if var3771 == protoModule.wireTypes.lengthDelimited then
			if var3775 == 2 then
				local _ = nil
				local var3781, var3782 = protoModule.readBuffer(p224, var3770)
				var3770 = var3782
				var3769.action_params = t.ToggleExperienceVoteAction_Params.decode(var3781)
			else
				local _ = nil
				local var3783, var3784 = protoModule.readVarInt(p224, var3770)
				var3770 = var3784 + var3783
			end
		elseif var3771 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3785, var3786 = protoModule.readFixed32(p224, var3770)
			local _ = var3785
			var3770 = var3786
		elseif var3771 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3787, var3788 = protoModule.readFixed64(p224, var3770)
			local _ = var3787
			var3770 = var3788
		else
			error("Unsupported wire type: " .. var3771)
		end
	end
	return var3769
end

function t_114:jsonEncode() --[[ line: 22296 ]]
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

function t_114:jsonDecode() --[[ line: 22318 ]]
	-- upvalues: t_114 (ref), t (ref)
	local var3790 = t_114.new()
	
	if self.action_type ~= nil then
		var3790.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3790.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3790.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3790.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.actionParams)
	end
	return var3790
end

t_114.descriptor = {
	name = "ToggleExperienceVoteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceVoteAction"
}
t.ToggleExperienceVoteAction = t_114
typeRegistryModule.default:register(t.ToggleExperienceVoteAction)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p225) --[[ line: 22358 ]]
	-- upvalues: t_115 (ref)
	return setmetatable({
		universe_id = if p225 == nil or p225.universe_id == nil then nil else p225.universe_id,
		vote_direction = if p225 == nil or p225.vote_direction == nil then nil else p225.vote_direction,
		place_id = if p225 == nil or p225.place_id == nil then nil else p225.place_id,
		ctx = if p225 == nil or p225.ctx == nil then nil else p225.ctx
	}, t_115)
end

function t_115:encode() --[[ line: 22369 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3792 = 0
	
	if self.universe_id ~= nil then
		local var3793 = self.universe_id:encode()
		local var3794, var3795 = protoModule.writeTag(buff, var3792, 1, protoModule.wireTypes.lengthDelimited)
		var3794, var3795 = protoModule.writeBuffer(var3794, var3795, var3793, buffer.len(var3793))
		buff = var3794
		var3792 = var3795
	end
	if self.vote_direction ~= nil then
		local var3796 = self.vote_direction:encode()
		local var3797, var3798 = protoModule.writeTag(buff, var3792, 2, protoModule.wireTypes.lengthDelimited)
		var3797, var3798 = protoModule.writeBuffer(var3797, var3798, var3796, buffer.len(var3796))
		buff = var3797
		var3792 = var3798
	end
	if self.place_id ~= nil then
		local var3799 = self.place_id:encode()
		local var3800, var3801 = protoModule.writeTag(buff, var3792, 3, protoModule.wireTypes.lengthDelimited)
		var3800, var3801 = protoModule.writeBuffer(var3800, var3801, var3799, buffer.len(var3799))
		buff = var3800
		var3792 = var3801
	end
	if self.ctx ~= nil then
		local var3802 = self.ctx:encode()
		local var3803, var3804 = protoModule.writeTag(buff, var3792, 4, protoModule.wireTypes.lengthDelimited)
		var3803, var3804 = protoModule.writeBuffer(var3803, var3804, var3802, buffer.len(var3802))
		buff = var3803
		var3792 = var3804
	end
	local buff_1 = buffer.create(var3792)
	buffer.copy(buff_1, 0, buff, 0, var3792)
	
	return buff_1
end

function t_115.decode(p226) --[[ line: 22402 ]]
	-- upvalues: t_115 (ref), protoModule (ref), propTypesModule (ref)
	local var3806 = t_115.new()
	local var3807 = 0
	while var3807 < buffer.len(p226) do
		local _ = nil
		local var3808 = nil
		local var3809, var3810, var3811 = protoModule.readTag(p226, var3807)
		local var3812 = var3809
		var3808 = var3810
		var3807 = var3811
		
		if var3808 == protoModule.wireTypes.varint then
			local _ = nil
			local var3813, var3814 = protoModule.readVarInt(p226, var3807)
			local _ = var3813
			var3807 = var3814
			continue
		end
		if var3808 == protoModule.wireTypes.lengthDelimited then
			if var3812 == 1 then
				local _ = nil
				local var3815, var3816 = protoModule.readBuffer(p226, var3807)
				var3807 = var3816
				var3806.universe_id = propTypesModule.StringProp.decode(var3815)
			elseif var3812 == 2 then
				local _ = nil
				local var3817, var3818 = protoModule.readBuffer(p226, var3807)
				var3807 = var3818
				var3806.vote_direction = propTypesModule.BoolProp.decode(var3817)
			elseif var3812 == 3 then
				local _ = nil
				local var3819, var3820 = protoModule.readBuffer(p226, var3807)
				var3807 = var3820
				var3806.place_id = propTypesModule.StringProp.decode(var3819)
			elseif var3812 == 4 then
				local _ = nil
				local var3821, var3822 = protoModule.readBuffer(p226, var3807)
				var3807 = var3822
				var3806.ctx = propTypesModule.StringProp.decode(var3821)
			else
				local _ = nil
				local var3823, var3824 = protoModule.readVarInt(p226, var3807)
				var3807 = var3824 + var3823
			end
		elseif var3808 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3825, var3826 = protoModule.readFixed32(p226, var3807)
			local _ = var3825
			var3807 = var3826
		elseif var3808 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3827, var3828 = protoModule.readFixed64(p226, var3807)
			local _ = var3827
			var3807 = var3828
		else
			error("Unsupported wire type: " .. var3808)
		end
	end
	return var3806
end

function t_115:jsonEncode() --[[ line: 22460 ]]
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

function t_115:jsonDecode() --[[ line: 22482 ]]
	-- upvalues: t_115 (ref), propTypesModule (ref)
	local var3830 = t_115.new()
	
	if self.universe_id ~= nil then
		var3830.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3830.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.vote_direction ~= nil then
		var3830.vote_direction = propTypesModule.BoolProp.jsonDecode(self.vote_direction)
	end
	if self.voteDirection ~= nil then
		var3830.vote_direction = propTypesModule.BoolProp.jsonDecode(self.voteDirection)
	end
	if self.place_id ~= nil then
		var3830.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var3830.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		var3830.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var3830
end

t_115.descriptor = {
	name = "ToggleExperienceVoteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceVoteAction_Params = t_115
typeRegistryModule.default:register(t.ToggleExperienceVoteAction_Params)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p227) --[[ line: 22535 ]]
	-- upvalues: t (ref), t_116 (ref)
	return setmetatable({
		action_type = if p227 == nil or p227.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p227.action_type,
		action_params = if p227 == nil or p227.action_params == nil then nil else p227.action_params
	}, t_116)
end

function t_116:encode() --[[ line: 22544 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3832 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3833, var3834 = protoModule.writeTag(buff, var3832, 1, protoModule.wireTypes.varint)
		var3833, var3834 = protoModule.writeVarInt(var3833, var3834, t.ActionType.toNumber(self.action_type))
		buff = var3833
		var3832 = var3834
	end
	if self.action_params ~= nil then
		local var3835 = self.action_params:encode()
		local var3836, var3837 = protoModule.writeTag(buff, var3832, 2, protoModule.wireTypes.lengthDelimited)
		var3836, var3837 = protoModule.writeBuffer(var3836, var3837, var3835, buffer.len(var3835))
		buff = var3836
		var3832 = var3837
	end
	local buff_1 = buffer.create(var3832)
	buffer.copy(buff_1, 0, buff, 0, var3832)
	
	return buff_1
end

function t_116.decode(p228) --[[ line: 22570 ]]
	-- upvalues: t_116 (ref), protoModule (ref), t (ref)
	local var3839 = t_116.new()
	local var3840 = 0
	while var3840 < buffer.len(p228) do
		local _ = nil
		local var3841 = nil
		local var3842, var3843, var3844 = protoModule.readTag(p228, var3840)
		local var3845 = var3842
		var3841 = var3843
		var3840 = var3844
		
		if var3841 == protoModule.wireTypes.varint then
			if var3845 == 1 then
				local _ = nil
				local var3846, var3847 = protoModule.readVarIntI32(p228, var3840)
				local var3848 = var3846
				var3840 = var3847
				var3839.action_type = t.ActionType.fromNumber(var3848) or var3848
			else
				local _ = nil
				local var3849, var3850 = protoModule.readVarInt(p228, var3840)
				local _ = var3849
				var3840 = var3850
			end
		end
		if var3841 == protoModule.wireTypes.lengthDelimited then
			if var3845 == 2 then
				local _ = nil
				local var3851, var3852 = protoModule.readBuffer(p228, var3840)
				var3840 = var3852
				var3839.action_params = t.OpenPurchasePromptAction_Params.decode(var3851)
			else
				local _ = nil
				local var3853, var3854 = protoModule.readVarInt(p228, var3840)
				var3840 = var3854 + var3853
			end
		elseif var3841 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3855, var3856 = protoModule.readFixed32(p228, var3840)
			local _ = var3855
			var3840 = var3856
		elseif var3841 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3857, var3858 = protoModule.readFixed64(p228, var3840)
			local _ = var3857
			var3840 = var3858
		else
			error("Unsupported wire type: " .. var3841)
		end
	end
	return var3839
end

function t_116:jsonEncode() --[[ line: 22618 ]]
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

function t_116:jsonDecode() --[[ line: 22640 ]]
	-- upvalues: t_116 (ref), t (ref)
	local var3860 = t_116.new()
	
	if self.action_type ~= nil then
		var3860.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3860.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3860.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3860.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.actionParams)
	end
	return var3860
end

t_116.descriptor = {
	name = "OpenPurchasePromptAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenPurchasePromptAction"
}
t.OpenPurchasePromptAction = t_116
typeRegistryModule.default:register(t.OpenPurchasePromptAction)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p229) --[[ line: 22680 ]]
	-- upvalues: t_117 (ref)
	return setmetatable({
		kind = if p229 == nil or p229.kind == nil then nil else p229.kind
	}, t_117)
end

function t_117:encode() --[[ line: 22688 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3862 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3863 = self.kind.value:encode()
			local var3864, var3865 = protoModule.writeTag(buff, var3862, 1, protoModule.wireTypes.lengthDelimited)
			var3864, var3865 = protoModule.writeBuffer(var3864, var3865, var3863, buffer.len(var3863))
			buff = var3864
			var3862 = var3865
		elseif self.kind.type == "binding_path" then
			local var3866, var3867 = protoModule.writeTag(buff, var3862, 2, protoModule.wireTypes.lengthDelimited)
			var3866, var3867 = protoModule.writeString(var3866, var3867, self.kind.value)
			buff = var3866
			var3862 = var3867
		end
	end
	local buff_1 = buffer.create(var3862)
	buffer.copy(buff_1, 0, buff, 0, var3862)
	
	return buff_1
end

function t_117.decode(p230) --[[ line: 22708 ]]
	-- upvalues: t_117 (ref), protoModule (ref), t (ref)
	local var3869 = t_117.new()
	local var3870 = 0
	while var3870 < buffer.len(p230) do
		local _ = nil
		local var3871 = nil
		local var3872, var3873, var3874 = protoModule.readTag(p230, var3870)
		local var3875 = var3872
		var3871 = var3873
		var3870 = var3874
		
		if var3871 == protoModule.wireTypes.varint then
			local _ = nil
			local var3876, var3877 = protoModule.readVarInt(p230, var3870)
			local _ = var3876
			var3870 = var3877
			continue
		end
		if var3871 == protoModule.wireTypes.lengthDelimited then
			if var3875 == 1 then
				local _ = nil
				local var3878, var3879 = protoModule.readBuffer(p230, var3870)
				var3870 = var3879
				var3869.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.decode(var3878)
				}
			elseif var3875 == 2 then
				local _ = nil
				local var3880, var3881 = protoModule.readBuffer(p230, var3870)
				var3870 = var3881
				var3869.kind = { type = "binding_path", value = buffer.tostring(var3880) }
			else
				local _ = nil
				local var3882, var3883 = protoModule.readVarInt(p230, var3870)
				var3870 = var3883 + var3882
			end
		elseif var3871 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3884, var3885 = protoModule.readFixed32(p230, var3870)
			local _ = var3884
			var3870 = var3885
		elseif var3871 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3886, var3887 = protoModule.readFixed64(p230, var3870)
			local _ = var3886
			var3870 = var3887
		else
			error("Unsupported wire type: " .. var3871)
		end
	end
	return var3869
end

function t_117:jsonEncode() --[[ line: 22759 ]]
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

function t_117:jsonDecode() --[[ line: 22773 ]]
	-- upvalues: t_117 (ref), t (ref)
	local var3889 = t_117.new()
	
	if self.literal ~= nil then
		var3889.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3889.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3889.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3889
end

t_117.descriptor = {
	name = "OpenPurchasePromptAction_ProductPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ProductPayload"
}
t.OpenPurchasePromptAction_ProductPayload = t_117
typeRegistryModule.default:register(t.OpenPurchasePromptAction_ProductPayload)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p231) --[[ line: 22813 ]]
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

function t_118:encode() --[[ line: 22839 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3891 = 0
	
	if self.kind ~= nil then
		local var3892 = self.kind:encode()
		local var3893, var3894 = protoModule.writeTag(buff, var3891, 1, protoModule.wireTypes.lengthDelimited)
		var3893, var3894 = protoModule.writeBuffer(var3893, var3894, var3892, buffer.len(var3892))
		buff = var3893
		var3891 = var3894
	end
	if self.id ~= nil then
		local var3895 = self.id:encode()
		local var3896, var3897 = protoModule.writeTag(buff, var3891, 2, protoModule.wireTypes.lengthDelimited)
		var3896, var3897 = protoModule.writeBuffer(var3896, var3897, var3895, buffer.len(var3895))
		buff = var3896
		var3891 = var3897
	end
	if self.subscription_id ~= nil then
		local var3898 = self.subscription_id:encode()
		local var3899, var3900 = protoModule.writeTag(buff, var3891, 3, protoModule.wireTypes.lengthDelimited)
		var3899, var3900 = protoModule.writeBuffer(var3899, var3900, var3898, buffer.len(var3898))
		buff = var3899
		var3891 = var3900
	end
	if self.universe_id ~= nil then
		local var3901 = self.universe_id:encode()
		local var3902, var3903 = protoModule.writeTag(buff, var3891, 4, protoModule.wireTypes.lengthDelimited)
		var3902, var3903 = protoModule.writeBuffer(var3902, var3903, var3901, buffer.len(var3901))
		buff = var3902
		var3891 = var3903
	end
	if self.equip_if_purchased ~= nil then
		local var3904 = self.equip_if_purchased:encode()
		local var3905, var3906 = protoModule.writeTag(buff, var3891, 5, protoModule.wireTypes.lengthDelimited)
		var3905, var3906 = protoModule.writeBuffer(var3905, var3906, var3904, buffer.len(var3904))
		buff = var3905
		var3891 = var3906
	end
	if self.name ~= nil then
		local var3907 = self.name:encode()
		local var3908, var3909 = protoModule.writeTag(buff, var3891, 6, protoModule.wireTypes.lengthDelimited)
		var3908, var3909 = protoModule.writeBuffer(var3908, var3909, var3907, buffer.len(var3907))
		buff = var3908
		var3891 = var3909
	end
	if self.expected_price ~= nil then
		local var3910 = self.expected_price:encode()
		local var3911, var3912 = protoModule.writeTag(buff, var3891, 7, protoModule.wireTypes.lengthDelimited)
		var3911, var3912 = protoModule.writeBuffer(var3911, var3912, var3910, buffer.len(var3910))
		buff = var3911
		var3891 = var3912
	end
	if self.icon_image_asset_id ~= nil then
		local var3913 = self.icon_image_asset_id:encode()
		local var3914, var3915 = protoModule.writeTag(buff, var3891, 8, protoModule.wireTypes.lengthDelimited)
		var3914, var3915 = protoModule.writeBuffer(var3914, var3915, var3913, buffer.len(var3913))
		buff = var3914
		var3891 = var3915
	end
	if self.is_subscription_in_robux ~= nil then
		local var3916 = self.is_subscription_in_robux:encode()
		local var3917, var3918 = protoModule.writeTag(buff, var3891, 9, protoModule.wireTypes.lengthDelimited)
		var3917, var3918 = protoModule.writeBuffer(var3917, var3918, var3916, buffer.len(var3916))
		buff = var3917
		var3891 = var3918
	end
	if self.display_price ~= nil then
		local var3919 = self.display_price:encode()
		local var3920, var3921 = protoModule.writeTag(buff, var3891, 10, protoModule.wireTypes.lengthDelimited)
		var3920, var3921 = protoModule.writeBuffer(var3920, var3921, var3919, buffer.len(var3919))
		buff = var3920
		var3891 = var3921
	end
	local buff_1 = buffer.create(var3891)
	buffer.copy(buff_1, 0, buff, 0, var3891)
	
	return buff_1
end

function t_118.decode(p232) --[[ line: 22910 ]]
	-- upvalues: t_118 (ref), protoModule (ref), propTypesModule (ref)
	local var3923 = t_118.new()
	local var3924 = 0
	while var3924 < buffer.len(p232) do
		local _ = nil
		local var3925 = nil
		local var3926, var3927, var3928 = protoModule.readTag(p232, var3924)
		local var3929 = var3926
		var3925 = var3927
		var3924 = var3928
		
		if var3925 == protoModule.wireTypes.varint then
			local _ = nil
			local var3930, var3931 = protoModule.readVarInt(p232, var3924)
			local _ = var3930
			var3924 = var3931
			continue
		end
		if var3925 == protoModule.wireTypes.lengthDelimited then
			if var3929 == 1 then
				local _ = nil
				local var3932, var3933 = protoModule.readBuffer(p232, var3924)
				var3924 = var3933
				var3923.kind = propTypesModule.StringProp.decode(var3932)
			elseif var3929 == 2 then
				local _ = nil
				local var3934, var3935 = protoModule.readBuffer(p232, var3924)
				var3924 = var3935
				var3923.id = propTypesModule.StringProp.decode(var3934)
			elseif var3929 == 3 then
				local _ = nil
				local var3936, var3937 = protoModule.readBuffer(p232, var3924)
				var3924 = var3937
				var3923.subscription_id = propTypesModule.StringProp.decode(var3936)
			elseif var3929 == 4 then
				local _ = nil
				local var3938, var3939 = protoModule.readBuffer(p232, var3924)
				var3924 = var3939
				var3923.universe_id = propTypesModule.StringProp.decode(var3938)
			elseif var3929 == 5 then
				local _ = nil
				local var3940, var3941 = protoModule.readBuffer(p232, var3924)
				var3924 = var3941
				var3923.equip_if_purchased = propTypesModule.BoolProp.decode(var3940)
			elseif var3929 == 6 then
				local _ = nil
				local var3942, var3943 = protoModule.readBuffer(p232, var3924)
				var3924 = var3943
				var3923.name = propTypesModule.StringProp.decode(var3942)
			elseif var3929 == 7 then
				local _ = nil
				local var3944, var3945 = protoModule.readBuffer(p232, var3924)
				var3924 = var3945
				var3923.expected_price = propTypesModule.Int64Prop.decode(var3944)
			elseif var3929 == 8 then
				local _ = nil
				local var3946, var3947 = protoModule.readBuffer(p232, var3924)
				var3924 = var3947
				var3923.icon_image_asset_id = propTypesModule.Int64Prop.decode(var3946)
			elseif var3929 == 9 then
				local _ = nil
				local var3948, var3949 = protoModule.readBuffer(p232, var3924)
				var3924 = var3949
				var3923.is_subscription_in_robux = propTypesModule.BoolProp.decode(var3948)
			elseif var3929 == 10 then
				local _ = nil
				local var3950, var3951 = protoModule.readBuffer(p232, var3924)
				var3924 = var3951
				var3923.display_price = propTypesModule.StringProp.decode(var3950)
			else
				local _ = nil
				local var3952, var3953 = protoModule.readVarInt(p232, var3924)
				var3924 = var3953 + var3952
			end
		elseif var3925 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3954, var3955 = protoModule.readFixed32(p232, var3924)
			local _ = var3954
			var3924 = var3955
		elseif var3925 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3956, var3957 = protoModule.readFixed64(p232, var3924)
			local _ = var3956
			var3924 = var3957
		else
			error("Unsupported wire type: " .. var3925)
		end
	end
	return var3923
end

function t_118:jsonEncode() --[[ line: 23001 ]]
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

function t_118:jsonDecode() --[[ line: 23049 ]]
	-- upvalues: t_118 (ref), propTypesModule (ref)
	local var3959 = t_118.new()
	
	if self.kind ~= nil then
		var3959.kind = propTypesModule.StringProp.jsonDecode(self.kind)
	end
	if self.id ~= nil then
		var3959.id = propTypesModule.StringProp.jsonDecode(self.id)
	end
	if self.subscription_id ~= nil then
		var3959.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		var3959.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		var3959.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3959.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.equip_if_purchased ~= nil then
		var3959.equip_if_purchased = propTypesModule.BoolProp.jsonDecode(self.equip_if_purchased)
	end
	if self.equipIfPurchased ~= nil then
		var3959.equip_if_purchased = propTypesModule.BoolProp.jsonDecode(self.equipIfPurchased)
	end
	if self.name ~= nil then
		var3959.name = propTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.expected_price ~= nil then
		var3959.expected_price = propTypesModule.Int64Prop.jsonDecode(self.expected_price)
	end
	if self.expectedPrice ~= nil then
		var3959.expected_price = propTypesModule.Int64Prop.jsonDecode(self.expectedPrice)
	end
	if self.icon_image_asset_id ~= nil then
		var3959.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		var3959.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.is_subscription_in_robux ~= nil then
		var3959.is_subscription_in_robux = propTypesModule.BoolProp.jsonDecode(self.is_subscription_in_robux)
	end
	if self.isSubscriptionInRobux ~= nil then
		var3959.is_subscription_in_robux = propTypesModule.BoolProp.jsonDecode(self.isSubscriptionInRobux)
	end
	if self.display_price ~= nil then
		var3959.display_price = propTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		var3959.display_price = propTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	return var3959
end

t_118.descriptor = {
	name = "OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.ProductPayloadLiteral"
}
t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral = t_118
typeRegistryModule.default:register(t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p233) --[[ line: 23153 ]]
	-- upvalues: t_119 (ref)
	return setmetatable({
		kind = if p233 == nil or p233.kind == nil then nil else p233.kind
	}, t_119)
end

function t_119:encode() --[[ line: 23161 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3961 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3962 = self.kind.value:encode()
			local var3963, var3964 = protoModule.writeTag(buff, var3961, 1, protoModule.wireTypes.lengthDelimited)
			var3963, var3964 = protoModule.writeBuffer(var3963, var3964, var3962, buffer.len(var3962))
			buff = var3963
			var3961 = var3964
		elseif self.kind.type == "binding_path" then
			local var3965, var3966 = protoModule.writeTag(buff, var3961, 2, protoModule.wireTypes.lengthDelimited)
			var3965, var3966 = protoModule.writeString(var3965, var3966, self.kind.value)
			buff = var3965
			var3961 = var3966
		end
	end
	local buff_1 = buffer.create(var3961)
	buffer.copy(buff_1, 0, buff, 0, var3961)
	
	return buff_1
end

function t_119.decode(p234) --[[ line: 23181 ]]
	-- upvalues: t_119 (ref), protoModule (ref), t (ref)
	local var3968 = t_119.new()
	local var3969 = 0
	while var3969 < buffer.len(p234) do
		local _ = nil
		local var3970 = nil
		local var3971, var3972, var3973 = protoModule.readTag(p234, var3969)
		local var3974 = var3971
		var3970 = var3972
		var3969 = var3973
		
		if var3970 == protoModule.wireTypes.varint then
			local _ = nil
			local var3975, var3976 = protoModule.readVarInt(p234, var3969)
			local _ = var3975
			var3969 = var3976
			continue
		end
		if var3970 == protoModule.wireTypes.lengthDelimited then
			if var3974 == 1 then
				local _ = nil
				local var3977, var3978 = protoModule.readBuffer(p234, var3969)
				var3969 = var3978
				var3968.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.decode(var3977)
				}
			elseif var3974 == 2 then
				local _ = nil
				local var3979, var3980 = protoModule.readBuffer(p234, var3969)
				var3969 = var3980
				var3968.kind = { type = "binding_path", value = buffer.tostring(var3979) }
			else
				local _ = nil
				local var3981, var3982 = protoModule.readVarInt(p234, var3969)
				var3969 = var3982 + var3981
			end
		elseif var3970 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3983, var3984 = protoModule.readFixed32(p234, var3969)
			local _ = var3983
			var3969 = var3984
		elseif var3970 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3985, var3986 = protoModule.readFixed64(p234, var3969)
			local _ = var3985
			var3969 = var3986
		else
			error("Unsupported wire type: " .. var3970)
		end
	end
	return var3968
end

function t_119:jsonEncode() --[[ line: 23232 ]]
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

function t_119:jsonDecode() --[[ line: 23246 ]]
	-- upvalues: t_119 (ref), t (ref)
	local var3988 = t_119.new()
	
	if self.literal ~= nil then
		var3988.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3988.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3988.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3988
end

t_119.descriptor = {
	name = "OpenPurchasePromptAction_DisplayInfo",
	fullName = "roblox.apppageplatform.shared.v1beta1.DisplayInfo"
}
t.OpenPurchasePromptAction_DisplayInfo = t_119
typeRegistryModule.default:register(t.OpenPurchasePromptAction_DisplayInfo)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p235) --[[ line: 23284 ]]
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

function t_120:encode() --[[ line: 23312 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3990 = 0
	
	if self.product_name ~= nil then
		local var3991 = self.product_name:encode()
		local var3992, var3993 = protoModule.writeTag(buff, var3990, 1, protoModule.wireTypes.lengthDelimited)
		var3992, var3993 = protoModule.writeBuffer(var3992, var3993, var3991, buffer.len(var3991))
		buff = var3992
		var3990 = var3993
	end
	if self.description ~= nil then
		local var3994 = self.description:encode()
		local var3995, var3996 = protoModule.writeTag(buff, var3990, 2, protoModule.wireTypes.lengthDelimited)
		var3995, var3996 = protoModule.writeBuffer(var3995, var3996, var3994, buffer.len(var3994))
		buff = var3995
		var3990 = var3996
	end
	if self.image_url ~= nil then
		local var3997 = self.image_url:encode()
		local var3998, var3999 = protoModule.writeTag(buff, var3990, 3, protoModule.wireTypes.lengthDelimited)
		var3998, var3999 = protoModule.writeBuffer(var3998, var3999, var3997, buffer.len(var3997))
		buff = var3998
		var3990 = var3999
	end
	if self.price_in_robux ~= nil then
		local var4000 = self.price_in_robux:encode()
		local var4001, var4002 = protoModule.writeTag(buff, var3990, 4, protoModule.wireTypes.lengthDelimited)
		var4001, var4002 = protoModule.writeBuffer(var4001, var4002, var4000, buffer.len(var4000))
		buff = var4001
		var3990 = var4002
	end
	if self.display_price ~= nil then
		local var4003 = self.display_price:encode()
		local var4004, var4005 = protoModule.writeTag(buff, var3990, 5, protoModule.wireTypes.lengthDelimited)
		var4004, var4005 = protoModule.writeBuffer(var4004, var4005, var4003, buffer.len(var4003))
		buff = var4004
		var3990 = var4005
	end
	if self.icon_image_asset_id ~= nil then
		local var4006 = self.icon_image_asset_id:encode()
		local var4007, var4008 = protoModule.writeTag(buff, var3990, 6, protoModule.wireTypes.lengthDelimited)
		var4007, var4008 = protoModule.writeBuffer(var4007, var4008, var4006, buffer.len(var4006))
		buff = var4007
		var3990 = var4008
	end
	if self.product_id ~= nil then
		local var4009 = self.product_id:encode()
		local var4010, var4011 = protoModule.writeTag(buff, var3990, 7, protoModule.wireTypes.lengthDelimited)
		var4010, var4011 = protoModule.writeBuffer(var4010, var4011, var4009, buffer.len(var4009))
		buff = var4010
		var3990 = var4011
	end
	if self.target_id ~= nil then
		local var4012 = self.target_id:encode()
		local var4013, var4014 = protoModule.writeTag(buff, var3990, 8, protoModule.wireTypes.lengthDelimited)
		var4013, var4014 = protoModule.writeBuffer(var4013, var4014, var4012, buffer.len(var4012))
		buff = var4013
		var3990 = var4014
	end
	if self.is_for_sale ~= nil then
		local var4015 = self.is_for_sale:encode()
		local var4016, var4017 = protoModule.writeTag(buff, var3990, 9, protoModule.wireTypes.lengthDelimited)
		var4016, var4017 = protoModule.writeBuffer(var4016, var4017, var4015, buffer.len(var4015))
		buff = var4016
		var3990 = var4017
	end
	if self.product_type ~= nil then
		local var4018 = self.product_type:encode()
		local var4019, var4020 = protoModule.writeTag(buff, var3990, 10, protoModule.wireTypes.lengthDelimited)
		var4019, var4020 = protoModule.writeBuffer(var4019, var4020, var4018, buffer.len(var4018))
		buff = var4019
		var3990 = var4020
	end
	if self.base_price_in_robux ~= nil then
		local var4021 = self.base_price_in_robux:encode()
		local var4022, var4023 = protoModule.writeTag(buff, var3990, 11, protoModule.wireTypes.lengthDelimited)
		var4022, var4023 = protoModule.writeBuffer(var4022, var4023, var4021, buffer.len(var4021))
		buff = var4022
		var3990 = var4023
	end
	if self.price_discount_details ~= nil then
		local var4024 = self.price_discount_details:encode()
		local var4025, var4026 = protoModule.writeTag(buff, var3990, 12, protoModule.wireTypes.lengthDelimited)
		var4025, var4026 = protoModule.writeBuffer(var4025, var4026, var4024, buffer.len(var4024))
		buff = var4025
		var3990 = var4026
	end
	local buff_1 = buffer.create(var3990)
	buffer.copy(buff_1, 0, buff, 0, var3990)
	
	return buff_1
end

function t_120.decode(p236) --[[ line: 23395 ]]
	-- upvalues: t_120 (ref), protoModule (ref), propTypesModule (ref)
	local var4028 = t_120.new()
	local var4029 = 0
	while var4029 < buffer.len(p236) do
		local _ = nil
		local var4030 = nil
		local var4031, var4032, var4033 = protoModule.readTag(p236, var4029)
		local var4034 = var4031
		var4030 = var4032
		var4029 = var4033
		
		if var4030 == protoModule.wireTypes.varint then
			local _ = nil
			local var4035, var4036 = protoModule.readVarInt(p236, var4029)
			local _ = var4035
			var4029 = var4036
			continue
		end
		if var4030 == protoModule.wireTypes.lengthDelimited then
			if var4034 == 1 then
				local _ = nil
				local var4037, var4038 = protoModule.readBuffer(p236, var4029)
				var4029 = var4038
				var4028.product_name = propTypesModule.StringProp.decode(var4037)
			elseif var4034 == 2 then
				local _ = nil
				local var4039, var4040 = protoModule.readBuffer(p236, var4029)
				var4029 = var4040
				var4028.description = propTypesModule.StringProp.decode(var4039)
			elseif var4034 == 3 then
				local _ = nil
				local var4041, var4042 = protoModule.readBuffer(p236, var4029)
				var4029 = var4042
				var4028.image_url = propTypesModule.StringProp.decode(var4041)
			elseif var4034 == 4 then
				local _ = nil
				local var4043, var4044 = protoModule.readBuffer(p236, var4029)
				var4029 = var4044
				var4028.price_in_robux = propTypesModule.Int64Prop.decode(var4043)
			elseif var4034 == 5 then
				local _ = nil
				local var4045, var4046 = protoModule.readBuffer(p236, var4029)
				var4029 = var4046
				var4028.display_price = propTypesModule.StringProp.decode(var4045)
			elseif var4034 == 6 then
				local _ = nil
				local var4047, var4048 = protoModule.readBuffer(p236, var4029)
				var4029 = var4048
				var4028.icon_image_asset_id = propTypesModule.Int64Prop.decode(var4047)
			elseif var4034 == 7 then
				local _ = nil
				local var4049, var4050 = protoModule.readBuffer(p236, var4029)
				var4029 = var4050
				var4028.product_id = propTypesModule.Int64Prop.decode(var4049)
			elseif var4034 == 8 then
				local _ = nil
				local var4051, var4052 = protoModule.readBuffer(p236, var4029)
				var4029 = var4052
				var4028.target_id = propTypesModule.StringProp.decode(var4051)
			elseif var4034 == 9 then
				local _ = nil
				local var4053, var4054 = protoModule.readBuffer(p236, var4029)
				var4029 = var4054
				var4028.is_for_sale = propTypesModule.BoolProp.decode(var4053)
			elseif var4034 == 10 then
				local _ = nil
				local var4055, var4056 = protoModule.readBuffer(p236, var4029)
				var4029 = var4056
				var4028.product_type = propTypesModule.StringProp.decode(var4055)
			elseif var4034 == 11 then
				local _ = nil
				local var4057, var4058 = protoModule.readBuffer(p236, var4029)
				var4029 = var4058
				var4028.base_price_in_robux = propTypesModule.Int64Prop.decode(var4057)
			elseif var4034 == 12 then
				local _ = nil
				local var4059, var4060 = protoModule.readBuffer(p236, var4029)
				var4029 = var4060
				var4028.price_discount_details = propTypesModule.ArrayOfStructProp.decode(var4059)
			else
				local _ = nil
				local var4061, var4062 = protoModule.readVarInt(p236, var4029)
				var4029 = var4062 + var4061
			end
		elseif var4030 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4063, var4064 = protoModule.readFixed32(p236, var4029)
			local _ = var4063
			var4029 = var4064
		elseif var4030 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4065, var4066 = protoModule.readFixed64(p236, var4029)
			local _ = var4065
			var4029 = var4066
		else
			error("Unsupported wire type: " .. var4030)
		end
	end
	return var4028
end

function t_120:jsonEncode() --[[ line: 23496 ]]
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

function t_120:jsonDecode() --[[ line: 23552 ]]
	-- upvalues: t_120 (ref), propTypesModule (ref)
	local var4068 = t_120.new()
	
	if self.product_name ~= nil then
		var4068.product_name = propTypesModule.StringProp.jsonDecode(self.product_name)
	end
	if self.productName ~= nil then
		var4068.product_name = propTypesModule.StringProp.jsonDecode(self.productName)
	end
	if self.description ~= nil then
		var4068.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_url ~= nil then
		var4068.image_url = propTypesModule.StringProp.jsonDecode(self.image_url)
	end
	if self.imageUrl ~= nil then
		var4068.image_url = propTypesModule.StringProp.jsonDecode(self.imageUrl)
	end
	if self.price_in_robux ~= nil then
		var4068.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		var4068.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.display_price ~= nil then
		var4068.display_price = propTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		var4068.display_price = propTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	if self.icon_image_asset_id ~= nil then
		var4068.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		var4068.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.product_id ~= nil then
		var4068.product_id = propTypesModule.Int64Prop.jsonDecode(self.product_id)
	end
	if self.productId ~= nil then
		var4068.product_id = propTypesModule.Int64Prop.jsonDecode(self.productId)
	end
	if self.target_id ~= nil then
		var4068.target_id = propTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		var4068.target_id = propTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.is_for_sale ~= nil then
		var4068.is_for_sale = propTypesModule.BoolProp.jsonDecode(self.is_for_sale)
	end
	if self.isForSale ~= nil then
		var4068.is_for_sale = propTypesModule.BoolProp.jsonDecode(self.isForSale)
	end
	if self.product_type ~= nil then
		var4068.product_type = propTypesModule.StringProp.jsonDecode(self.product_type)
	end
	if self.productType ~= nil then
		var4068.product_type = propTypesModule.StringProp.jsonDecode(self.productType)
	end
	if self.base_price_in_robux ~= nil then
		var4068.base_price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.base_price_in_robux)
	end
	if self.basePriceInRobux ~= nil then
		var4068.base_price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.basePriceInRobux)
	end
	if self.price_discount_details ~= nil then
		var4068.price_discount_details = propTypesModule.ArrayOfStructProp.jsonDecode(self.price_discount_details)
	end
	if self.priceDiscountDetails ~= nil then
		var4068.price_discount_details = propTypesModule.ArrayOfStructProp.jsonDecode(self.priceDiscountDetails)
	end
	return var4068
end

t_120.descriptor = {
	name = "OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.DisplayInfoLiteral"
}
t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral = t_120
typeRegistryModule.default:register(t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p237) --[[ line: 23686 ]]
	-- upvalues: t_121 (ref)
	return setmetatable({
		kind = if p237 == nil or p237.kind == nil then nil else p237.kind
	}, t_121)
end

function t_121:encode() --[[ line: 23694 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4070 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var4071 = self.kind.value:encode()
			local var4072, var4073 = protoModule.writeTag(buff, var4070, 1, protoModule.wireTypes.lengthDelimited)
			var4072, var4073 = protoModule.writeBuffer(var4072, var4073, var4071, buffer.len(var4071))
			buff = var4072
			var4070 = var4073
		elseif self.kind.type == "binding_path" then
			local var4074, var4075 = protoModule.writeTag(buff, var4070, 2, protoModule.wireTypes.lengthDelimited)
			var4074, var4075 = protoModule.writeString(var4074, var4075, self.kind.value)
			buff = var4074
			var4070 = var4075
		end
	end
	local buff_1 = buffer.create(var4070)
	buffer.copy(buff_1, 0, buff, 0, var4070)
	
	return buff_1
end

function t_121.decode(p238) --[[ line: 23716 ]]
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var4077 = t_121.new()
	local var4078 = 0
	while var4078 < buffer.len(p238) do
		local _ = nil
		local var4079 = nil
		local var4080, var4081, var4082 = protoModule.readTag(p238, var4078)
		local var4083 = var4080
		var4079 = var4081
		var4078 = var4082
		
		if var4079 == protoModule.wireTypes.varint then
			local _ = nil
			local var4084, var4085 = protoModule.readVarInt(p238, var4078)
			local _ = var4084
			var4078 = var4085
			continue
		end
		if var4079 == protoModule.wireTypes.lengthDelimited then
			if var4083 == 1 then
				local _ = nil
				local var4086, var4087 = protoModule.readBuffer(p238, var4078)
				var4078 = var4087
				var4077.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.decode(var4086)
				}
			elseif var4083 == 2 then
				local _ = nil
				local var4088, var4089 = protoModule.readBuffer(p238, var4078)
				var4078 = var4089
				var4077.kind = { type = "binding_path", value = buffer.tostring(var4088) }
			else
				local _ = nil
				local var4090, var4091 = protoModule.readVarInt(p238, var4078)
				var4078 = var4091 + var4090
			end
		elseif var4079 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4092, var4093 = protoModule.readFixed32(p238, var4078)
			local _ = var4092
			var4078 = var4093
		elseif var4079 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4094, var4095 = protoModule.readFixed64(p238, var4078)
			local _ = var4094
			var4078 = var4095
		else
			error("Unsupported wire type: " .. var4079)
		end
	end
	return var4077
end

function t_121:jsonEncode() --[[ line: 23769 ]]
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

function t_121:jsonDecode() --[[ line: 23785 ]]
	-- upvalues: t_121 (ref), t (ref)
	local var4097 = t_121.new()
	
	if self.literal ~= nil then
		var4097.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var4097.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var4097.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var4097
end

t_121.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseOptions"
}
t.OpenPurchasePromptAction_PurchaseOptions = t_121
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseOptions)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p239) --[[ line: 23825 ]]
	-- upvalues: t_122 (ref)
	return setmetatable({
		should_skip_ownership_check = if p239 == nil or p239.should_skip_ownership_check == nil then nil else p239.should_skip_ownership_check,
		enable_preloaded_purchase_ui = if p239 == nil or p239.enable_preloaded_purchase_ui == nil then nil else p239.enable_preloaded_purchase_ui,
		completion_message = if p239 == nil or p239.completion_message == nil then nil else p239.completion_message,
		completion_button_text = if p239 == nil or p239.completion_button_text == nil then nil else p239.completion_button_text,
		prevent_double_confirm = if p239 == nil or p239.prevent_double_confirm == nil then nil else p239.prevent_double_confirm,
		provided_robux_balance = if p239 == nil or p239.provided_robux_balance == nil then nil else p239.provided_robux_balance,
		launch_after_purchase_root_place_id = if p239 == nil or p239.launch_after_purchase_root_place_id == nil then nil else p239.launch_after_purchase_root_place_id
	}, t_122)
end

function t_122:encode() --[[ line: 23857 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4099 = 0
	
	if self.should_skip_ownership_check ~= nil then
		local var4100 = self.should_skip_ownership_check:encode()
		local var4101, var4102 = protoModule.writeTag(buff, var4099, 1, protoModule.wireTypes.lengthDelimited)
		var4101, var4102 = protoModule.writeBuffer(var4101, var4102, var4100, buffer.len(var4100))
		buff = var4101
		var4099 = var4102
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		local var4103 = self.enable_preloaded_purchase_ui:encode()
		local var4104, var4105 = protoModule.writeTag(buff, var4099, 2, protoModule.wireTypes.lengthDelimited)
		var4104, var4105 = protoModule.writeBuffer(var4104, var4105, var4103, buffer.len(var4103))
		buff = var4104
		var4099 = var4105
	end
	if self.completion_message ~= nil then
		local var4106 = self.completion_message:encode()
		local var4107, var4108 = protoModule.writeTag(buff, var4099, 3, protoModule.wireTypes.lengthDelimited)
		var4107, var4108 = protoModule.writeBuffer(var4107, var4108, var4106, buffer.len(var4106))
		buff = var4107
		var4099 = var4108
	end
	if self.completion_button_text ~= nil then
		local var4109 = self.completion_button_text:encode()
		local var4110, var4111 = protoModule.writeTag(buff, var4099, 4, protoModule.wireTypes.lengthDelimited)
		var4110, var4111 = protoModule.writeBuffer(var4110, var4111, var4109, buffer.len(var4109))
		buff = var4110
		var4099 = var4111
	end
	if self.prevent_double_confirm ~= nil then
		local var4112 = self.prevent_double_confirm:encode()
		local var4113, var4114 = protoModule.writeTag(buff, var4099, 5, protoModule.wireTypes.lengthDelimited)
		var4113, var4114 = protoModule.writeBuffer(var4113, var4114, var4112, buffer.len(var4112))
		buff = var4113
		var4099 = var4114
	end
	if self.provided_robux_balance ~= nil then
		local var4115 = self.provided_robux_balance:encode()
		local var4116, var4117 = protoModule.writeTag(buff, var4099, 6, protoModule.wireTypes.lengthDelimited)
		var4116, var4117 = protoModule.writeBuffer(var4116, var4117, var4115, buffer.len(var4115))
		buff = var4116
		var4099 = var4117
	end
	if self.launch_after_purchase_root_place_id ~= nil then
		local var4118 = self.launch_after_purchase_root_place_id:encode()
		local var4119, var4120 = protoModule.writeTag(buff, var4099, 7, protoModule.wireTypes.lengthDelimited)
		var4119, var4120 = protoModule.writeBuffer(var4119, var4120, var4118, buffer.len(var4118))
		buff = var4119
		var4099 = var4120
	end
	local buff_1 = buffer.create(var4099)
	buffer.copy(buff_1, 0, buff, 0, var4099)
	
	return buff_1
end

function t_122.decode(p240) --[[ line: 23910 ]]
	-- upvalues: t_122 (ref), protoModule (ref), propTypesModule (ref)
	local var4122 = t_122.new()
	local var4123 = 0
	while var4123 < buffer.len(p240) do
		local _ = nil
		local var4124 = nil
		local var4125, var4126, var4127 = protoModule.readTag(p240, var4123)
		local var4128 = var4125
		var4124 = var4126
		var4123 = var4127
		
		if var4124 == protoModule.wireTypes.varint then
			local _ = nil
			local var4129, var4130 = protoModule.readVarInt(p240, var4123)
			local _ = var4129
			var4123 = var4130
			continue
		end
		if var4124 == protoModule.wireTypes.lengthDelimited then
			if var4128 == 1 then
				local _ = nil
				local var4131, var4132 = protoModule.readBuffer(p240, var4123)
				var4123 = var4132
				var4122.should_skip_ownership_check = propTypesModule.BoolProp.decode(var4131)
			elseif var4128 == 2 then
				local _ = nil
				local var4133, var4134 = protoModule.readBuffer(p240, var4123)
				var4123 = var4134
				var4122.enable_preloaded_purchase_ui = propTypesModule.BoolProp.decode(var4133)
			elseif var4128 == 3 then
				local _ = nil
				local var4135, var4136 = protoModule.readBuffer(p240, var4123)
				var4123 = var4136
				var4122.completion_message = propTypesModule.StringProp.decode(var4135)
			elseif var4128 == 4 then
				local _ = nil
				local var4137, var4138 = protoModule.readBuffer(p240, var4123)
				var4123 = var4138
				var4122.completion_button_text = propTypesModule.StringProp.decode(var4137)
			elseif var4128 == 5 then
				local _ = nil
				local var4139, var4140 = protoModule.readBuffer(p240, var4123)
				var4123 = var4140
				var4122.prevent_double_confirm = propTypesModule.BoolProp.decode(var4139)
			elseif var4128 == 6 then
				local _ = nil
				local var4141, var4142 = protoModule.readBuffer(p240, var4123)
				var4123 = var4142
				var4122.provided_robux_balance = propTypesModule.Int64Prop.decode(var4141)
			elseif var4128 == 7 then
				local _ = nil
				local var4143, var4144 = protoModule.readBuffer(p240, var4123)
				var4123 = var4144
				var4122.launch_after_purchase_root_place_id = propTypesModule.StringProp.decode(var4143)
			else
				local _ = nil
				local var4145, var4146 = protoModule.readVarInt(p240, var4123)
				var4123 = var4146 + var4145
			end
		elseif var4124 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4147, var4148 = protoModule.readFixed32(p240, var4123)
			local _ = var4147
			var4123 = var4148
		elseif var4124 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4149, var4150 = protoModule.readFixed64(p240, var4123)
			local _ = var4149
			var4123 = var4150
		else
			error("Unsupported wire type: " .. var4124)
		end
	end
	return var4122
end

function t_122:jsonEncode() --[[ line: 23991 ]]
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
	if self.launch_after_purchase_root_place_id ~= nil then
		t.launchAfterPurchaseRootPlaceId = self.launch_after_purchase_root_place_id:jsonEncode()
	end
	return t
end

function t_122:jsonDecode() --[[ line: 24027 ]]
	-- upvalues: t_122 (ref), propTypesModule (ref)
	local var4152 = t_122.new()
	
	if self.should_skip_ownership_check ~= nil then
		var4152.should_skip_ownership_check = propTypesModule.BoolProp.jsonDecode(self.should_skip_ownership_check)
	end
	if self.shouldSkipOwnershipCheck ~= nil then
		var4152.should_skip_ownership_check = propTypesModule.BoolProp.jsonDecode(self.shouldSkipOwnershipCheck)
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		var4152.enable_preloaded_purchase_ui = propTypesModule.BoolProp.jsonDecode(self.enable_preloaded_purchase_ui)
	end
	if self.enablePreloadedPurchaseUi ~= nil then
		var4152.enable_preloaded_purchase_ui = propTypesModule.BoolProp.jsonDecode(self.enablePreloadedPurchaseUi)
	end
	if self.completion_message ~= nil then
		var4152.completion_message = propTypesModule.StringProp.jsonDecode(self.completion_message)
	end
	if self.completionMessage ~= nil then
		var4152.completion_message = propTypesModule.StringProp.jsonDecode(self.completionMessage)
	end
	if self.completion_button_text ~= nil then
		var4152.completion_button_text = propTypesModule.StringProp.jsonDecode(self.completion_button_text)
	end
	if self.completionButtonText ~= nil then
		var4152.completion_button_text = propTypesModule.StringProp.jsonDecode(self.completionButtonText)
	end
	if self.prevent_double_confirm ~= nil then
		var4152.prevent_double_confirm = propTypesModule.BoolProp.jsonDecode(self.prevent_double_confirm)
	end
	if self.preventDoubleConfirm ~= nil then
		var4152.prevent_double_confirm = propTypesModule.BoolProp.jsonDecode(self.preventDoubleConfirm)
	end
	if self.provided_robux_balance ~= nil then
		var4152.provided_robux_balance = propTypesModule.Int64Prop.jsonDecode(self.provided_robux_balance)
	end
	if self.providedRobuxBalance ~= nil then
		var4152.provided_robux_balance = propTypesModule.Int64Prop.jsonDecode(self.providedRobuxBalance)
	end
	if self.launch_after_purchase_root_place_id ~= nil then
		var4152.launch_after_purchase_root_place_id = propTypesModule.StringProp.jsonDecode(self.launch_after_purchase_root_place_id)
	end
	if self.launchAfterPurchaseRootPlaceId ~= nil then
		var4152.launch_after_purchase_root_place_id = propTypesModule.StringProp.jsonDecode(self.launchAfterPurchaseRootPlaceId)
	end
	return var4152
end

t_122.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseOptionsLiteral"
}
t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral = t_122
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p241) --[[ line: 24126 ]]
	-- upvalues: t_123 (ref)
	return setmetatable({
		kind = if p241 == nil or p241.kind == nil then nil else p241.kind
	}, t_123)
end

function t_123:encode() --[[ line: 24137 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4154 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var4155 = self.kind.value:encode()
			local var4156, var4157 = protoModule.writeTag(buff, var4154, 1, protoModule.wireTypes.lengthDelimited)
			var4156, var4157 = protoModule.writeBuffer(var4156, var4157, var4155, buffer.len(var4155))
			buff = var4156
			var4154 = var4157
		elseif self.kind.type == "binding_path" then
			local var4158, var4159 = protoModule.writeTag(buff, var4154, 2, protoModule.wireTypes.lengthDelimited)
			var4158, var4159 = protoModule.writeString(var4158, var4159, self.kind.value)
			buff = var4158
			var4154 = var4159
		end
	end
	local buff_1 = buffer.create(var4154)
	buffer.copy(buff_1, 0, buff, 0, var4154)
	
	return buff_1
end

function t_123.decode(p242) --[[ line: 24159 ]]
	-- upvalues: t_123 (ref), protoModule (ref), t (ref)
	local var4161 = t_123.new()
	local var4162 = 0
	while var4162 < buffer.len(p242) do
		local _ = nil
		local var4163 = nil
		local var4164, var4165, var4166 = protoModule.readTag(p242, var4162)
		local var4167 = var4164
		var4163 = var4165
		var4162 = var4166
		
		if var4163 == protoModule.wireTypes.varint then
			local _ = nil
			local var4168, var4169 = protoModule.readVarInt(p242, var4162)
			local _ = var4168
			var4162 = var4169
			continue
		end
		if var4163 == protoModule.wireTypes.lengthDelimited then
			if var4167 == 1 then
				local _ = nil
				local var4170, var4171 = protoModule.readBuffer(p242, var4162)
				var4162 = var4171
				var4161.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.decode(var4170)
				}
			elseif var4167 == 2 then
				local _ = nil
				local var4172, var4173 = protoModule.readBuffer(p242, var4162)
				var4162 = var4173
				var4161.kind = { type = "binding_path", value = buffer.tostring(var4172) }
			else
				local _ = nil
				local var4174, var4175 = protoModule.readVarInt(p242, var4162)
				var4162 = var4175 + var4174
			end
		elseif var4163 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4176, var4177 = protoModule.readFixed32(p242, var4162)
			local _ = var4176
			var4162 = var4177
		elseif var4163 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4178, var4179 = protoModule.readFixed64(p242, var4162)
			local _ = var4178
			var4162 = var4179
		else
			error("Unsupported wire type: " .. var4163)
		end
	end
	return var4161
end

function t_123:jsonEncode() --[[ line: 24214 ]]
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

function t_123:jsonDecode() --[[ line: 24230 ]]
	-- upvalues: t_123 (ref), t (ref)
	local var4181 = t_123.new()
	
	if self.literal ~= nil then
		var4181.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var4181.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var4181.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var4181
end

t_123.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseAnalyticsMetadata",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseAnalyticsMetadata"
}
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata = t_123
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p243) --[[ line: 24271 ]]
	-- upvalues: t_124 (ref)
	return setmetatable({
		surface = if p243 == nil or p243.surface == nil then nil else p243.surface,
		product_universe_id = if p243 == nil or p243.product_universe_id == nil then nil else p243.product_universe_id
	}, t_124)
end

function t_124:encode() --[[ line: 24285 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4183 = 0
	
	if self.surface ~= nil then
		local var4184 = self.surface:encode()
		local var4185, var4186 = protoModule.writeTag(buff, var4183, 1, protoModule.wireTypes.lengthDelimited)
		var4185, var4186 = protoModule.writeBuffer(var4185, var4186, var4184, buffer.len(var4184))
		buff = var4185
		var4183 = var4186
	end
	if self.product_universe_id ~= nil then
		local var4187 = self.product_universe_id:encode()
		local var4188, var4189 = protoModule.writeTag(buff, var4183, 2, protoModule.wireTypes.lengthDelimited)
		var4188, var4189 = protoModule.writeBuffer(var4188, var4189, var4187, buffer.len(var4187))
		buff = var4188
		var4183 = var4189
	end
	local buff_1 = buffer.create(var4183)
	buffer.copy(buff_1, 0, buff, 0, var4183)
	
	return buff_1
end

function t_124.decode(p244) --[[ line: 24308 ]]
	-- upvalues: t_124 (ref), protoModule (ref), propTypesModule (ref)
	local var4191 = t_124.new()
	local var4192 = 0
	while var4192 < buffer.len(p244) do
		local _ = nil
		local var4193 = nil
		local var4194, var4195, var4196 = protoModule.readTag(p244, var4192)
		local var4197 = var4194
		var4193 = var4195
		var4192 = var4196
		
		if var4193 == protoModule.wireTypes.varint then
			local _ = nil
			local var4198, var4199 = protoModule.readVarInt(p244, var4192)
			local _ = var4198
			var4192 = var4199
			continue
		end
		if var4193 == protoModule.wireTypes.lengthDelimited then
			if var4197 == 1 then
				local _ = nil
				local var4200, var4201 = protoModule.readBuffer(p244, var4192)
				var4192 = var4201
				var4191.surface = propTypesModule.StringProp.decode(var4200)
			elseif var4197 == 2 then
				local _ = nil
				local var4202, var4203 = protoModule.readBuffer(p244, var4192)
				var4192 = var4203
				var4191.product_universe_id = propTypesModule.StringProp.decode(var4202)
			else
				local _ = nil
				local var4204, var4205 = protoModule.readVarInt(p244, var4192)
				var4192 = var4205 + var4204
			end
		elseif var4193 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4206, var4207 = protoModule.readFixed32(p244, var4192)
			local _ = var4206
			var4192 = var4207
		elseif var4193 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4208, var4209 = protoModule.readFixed64(p244, var4192)
			local _ = var4208
			var4192 = var4209
		else
			error("Unsupported wire type: " .. var4193)
		end
	end
	return var4191
end

function t_124:jsonEncode() --[[ line: 24359 ]]
	local t = {}
	
	if self.surface ~= nil then
		t.surface = self.surface:jsonEncode()
	end
	if self.product_universe_id ~= nil then
		t.productUniverseId = self.product_universe_id:jsonEncode()
	end
	return t
end

function t_124:jsonDecode() --[[ line: 24375 ]]
	-- upvalues: t_124 (ref), propTypesModule (ref)
	local var4211 = t_124.new()
	
	if self.surface ~= nil then
		var4211.surface = propTypesModule.StringProp.jsonDecode(self.surface)
	end
	if self.product_universe_id ~= nil then
		var4211.product_universe_id = propTypesModule.StringProp.jsonDecode(self.product_universe_id)
	end
	if self.productUniverseId ~= nil then
		var4211.product_universe_id = propTypesModule.StringProp.jsonDecode(self.productUniverseId)
	end
	return var4211
end

t_124.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseAnalyticsMetadataLiteral"
}
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral = t_124
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p245) --[[ line: 24416 ]]
	-- upvalues: t_125 (ref)
	return setmetatable({
		product_payload = if p245 == nil or p245.product_payload == nil then nil else p245.product_payload,
		display_info = if p245 == nil or p245.display_info == nil then nil else p245.display_info,
		purchase_options = if p245 == nil or p245.purchase_options == nil then nil else p245.purchase_options,
		purchase_analytics_metadata = if p245 == nil or p245.purchase_analytics_metadata == nil then nil else p245.purchase_analytics_metadata,
		root_place_id = if p245 == nil or p245.root_place_id == nil then nil else p245.root_place_id
	}, t_125)
end

function t_125:encode() --[[ line: 24430 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4213 = 0
	
	if self.product_payload ~= nil then
		local var4214 = self.product_payload:encode()
		local var4215, var4216 = protoModule.writeTag(buff, var4213, 1, protoModule.wireTypes.lengthDelimited)
		var4215, var4216 = protoModule.writeBuffer(var4215, var4216, var4214, buffer.len(var4214))
		buff = var4215
		var4213 = var4216
	end
	if self.display_info ~= nil then
		local var4217 = self.display_info:encode()
		local var4218, var4219 = protoModule.writeTag(buff, var4213, 2, protoModule.wireTypes.lengthDelimited)
		var4218, var4219 = protoModule.writeBuffer(var4218, var4219, var4217, buffer.len(var4217))
		buff = var4218
		var4213 = var4219
	end
	if self.purchase_options ~= nil then
		local var4220 = self.purchase_options:encode()
		local var4221, var4222 = protoModule.writeTag(buff, var4213, 3, protoModule.wireTypes.lengthDelimited)
		var4221, var4222 = protoModule.writeBuffer(var4221, var4222, var4220, buffer.len(var4220))
		buff = var4221
		var4213 = var4222
	end
	if self.purchase_analytics_metadata ~= nil then
		local var4223 = self.purchase_analytics_metadata:encode()
		local var4224, var4225 = protoModule.writeTag(buff, var4213, 4, protoModule.wireTypes.lengthDelimited)
		var4224, var4225 = protoModule.writeBuffer(var4224, var4225, var4223, buffer.len(var4223))
		buff = var4224
		var4213 = var4225
	end
	if self.root_place_id ~= nil then
		local var4226 = self.root_place_id:encode()
		local var4227, var4228 = protoModule.writeTag(buff, var4213, 5, protoModule.wireTypes.lengthDelimited)
		var4227, var4228 = protoModule.writeBuffer(var4227, var4228, var4226, buffer.len(var4226))
		buff = var4227
		var4213 = var4228
	end
	local buff_1 = buffer.create(var4213)
	buffer.copy(buff_1, 0, buff, 0, var4213)
	
	return buff_1
end

function t_125.decode(p246) --[[ line: 24469 ]]
	-- upvalues: t_125 (ref), protoModule (ref), t (ref), propTypesModule (ref)
	local var4230 = t_125.new()
	local var4231 = 0
	while var4231 < buffer.len(p246) do
		local _ = nil
		local var4232 = nil
		local var4233, var4234, var4235 = protoModule.readTag(p246, var4231)
		local var4236 = var4233
		var4232 = var4234
		var4231 = var4235
		
		if var4232 == protoModule.wireTypes.varint then
			local _ = nil
			local var4237, var4238 = protoModule.readVarInt(p246, var4231)
			local _ = var4237
			var4231 = var4238
			continue
		end
		if var4232 == protoModule.wireTypes.lengthDelimited then
			if var4236 == 1 then
				local _ = nil
				local var4239, var4240 = protoModule.readBuffer(p246, var4231)
				var4231 = var4240
				var4230.product_payload = t.OpenPurchasePromptAction_ProductPayload.decode(var4239)
			elseif var4236 == 2 then
				local _ = nil
				local var4241, var4242 = protoModule.readBuffer(p246, var4231)
				var4231 = var4242
				var4230.display_info = t.OpenPurchasePromptAction_DisplayInfo.decode(var4241)
			elseif var4236 == 3 then
				local _ = nil
				local var4243, var4244 = protoModule.readBuffer(p246, var4231)
				var4231 = var4244
				var4230.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.decode(var4243)
			elseif var4236 == 4 then
				local _ = nil
				local var4245, var4246 = protoModule.readBuffer(p246, var4231)
				var4231 = var4246
				var4230.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.decode(var4245)
			elseif var4236 == 5 then
				local _ = nil
				local var4247, var4248 = protoModule.readBuffer(p246, var4231)
				var4231 = var4248
				var4230.root_place_id = propTypesModule.StringProp.decode(var4247)
			else
				local _ = nil
				local var4249, var4250 = protoModule.readVarInt(p246, var4231)
				var4231 = var4250 + var4249
			end
		elseif var4232 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4251, var4252 = protoModule.readFixed32(p246, var4231)
			local _ = var4251
			var4231 = var4252
		elseif var4232 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4253, var4254 = protoModule.readFixed64(p246, var4231)
			local _ = var4253
			var4231 = var4254
		else
			error("Unsupported wire type: " .. var4232)
		end
	end
	return var4230
end

function t_125:jsonEncode() --[[ line: 24533 ]]
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

function t_125:jsonDecode() --[[ line: 24559 ]]
	-- upvalues: t_125 (ref), t (ref), propTypesModule (ref)
	local var4256 = t_125.new()
	
	if self.product_payload ~= nil then
		var4256.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.product_payload)
	end
	if self.productPayload ~= nil then
		var4256.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.productPayload)
	end
	if self.display_info ~= nil then
		var4256.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.display_info)
	end
	if self.displayInfo ~= nil then
		var4256.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.displayInfo)
	end
	if self.purchase_options ~= nil then
		var4256.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchase_options)
	end
	if self.purchaseOptions ~= nil then
		var4256.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchaseOptions)
	end
	if self.purchase_analytics_metadata ~= nil then
		var4256.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchase_analytics_metadata)
	end
	if self.purchaseAnalyticsMetadata ~= nil then
		var4256.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchaseAnalyticsMetadata)
	end
	if self.root_place_id ~= nil then
		var4256.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var4256.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var4256
end

t_125.descriptor = {
	name = "OpenPurchasePromptAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenPurchasePromptAction_Params = t_125
typeRegistryModule.default:register(t.OpenPurchasePromptAction_Params)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p247) --[[ line: 24624 ]]
	-- upvalues: t (ref), t_126 (ref)
	return setmetatable({
		action_type = if p247 == nil or p247.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p247.action_type,
		action_params = if p247 == nil or p247.action_params == nil then nil else p247.action_params
	}, t_126)
end

function t_126:encode() --[[ line: 24635 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4258 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4259, var4260 = protoModule.writeTag(buff, var4258, 1, protoModule.wireTypes.varint)
		var4259, var4260 = protoModule.writeVarInt(var4259, var4260, t.ActionType.toNumber(self.action_type))
		buff = var4259
		var4258 = var4260
	end
	if self.action_params ~= nil then
		local var4261 = self.action_params:encode()
		local var4262, var4263 = protoModule.writeTag(buff, var4258, 2, protoModule.wireTypes.lengthDelimited)
		var4262, var4263 = protoModule.writeBuffer(var4262, var4263, var4261, buffer.len(var4261))
		buff = var4262
		var4258 = var4263
	end
	local buff_1 = buffer.create(var4258)
	buffer.copy(buff_1, 0, buff, 0, var4258)
	
	return buff_1
end

function t_126.decode(p248) --[[ line: 24661 ]]
	-- upvalues: t_126 (ref), protoModule (ref), t (ref)
	local var4265 = t_126.new()
	local var4266 = 0
	while var4266 < buffer.len(p248) do
		local _ = nil
		local var4267 = nil
		local var4268, var4269, var4270 = protoModule.readTag(p248, var4266)
		local var4271 = var4268
		var4267 = var4269
		var4266 = var4270
		
		if var4267 == protoModule.wireTypes.varint then
			if var4271 == 1 then
				local _ = nil
				local var4272, var4273 = protoModule.readVarIntI32(p248, var4266)
				local var4274 = var4272
				var4266 = var4273
				var4265.action_type = t.ActionType.fromNumber(var4274) or var4274
			else
				local _ = nil
				local var4275, var4276 = protoModule.readVarInt(p248, var4266)
				local _ = var4275
				var4266 = var4276
			end
		end
		if var4267 == protoModule.wireTypes.lengthDelimited then
			if var4271 == 2 then
				local _ = nil
				local var4277, var4278 = protoModule.readBuffer(p248, var4266)
				var4266 = var4278
				var4265.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.decode(var4277)
			else
				local _ = nil
				local var4279, var4280 = protoModule.readVarInt(p248, var4266)
				var4266 = var4280 + var4279
			end
		elseif var4267 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4281, var4282 = protoModule.readFixed32(p248, var4266)
			local _ = var4281
			var4266 = var4282
		elseif var4267 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4283, var4284 = protoModule.readFixed64(p248, var4266)
			local _ = var4283
			var4266 = var4284
		else
			error("Unsupported wire type: " .. var4267)
		end
	end
	return var4265
end

function t_126:jsonEncode() --[[ line: 24709 ]]
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

function t_126:jsonDecode() --[[ line: 24731 ]]
	-- upvalues: t_126 (ref), t (ref)
	local var4286 = t_126.new()
	
	if self.action_type ~= nil then
		var4286.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4286.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4286.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4286.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.actionParams)
	end
	return var4286
end

t_126.descriptor = {
	name = "ReportSurfaceLoadTimeMilestoneAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ReportSurfaceLoadTimeMilestoneAction"
}
t.ReportSurfaceLoadTimeMilestoneAction = t_126
typeRegistryModule.default:register(t.ReportSurfaceLoadTimeMilestoneAction)
local t_127 = {}
t_127.__index = t_127

function t_127.new(p249) --[[ line: 24773 ]]
	-- upvalues: t_127 (ref)
	return setmetatable({
		milestone = if p249 == nil or p249.milestone == nil then nil else p249.milestone,
		metadata = if p249 == nil or p249.metadata == nil then nil else p249.metadata
	}, t_127)
end

function t_127:encode() --[[ line: 24782 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4288 = 0
	
	if self.milestone ~= nil then
		local var4289 = self.milestone:encode()
		local var4290, var4291 = protoModule.writeTag(buff, var4288, 1, protoModule.wireTypes.lengthDelimited)
		var4290, var4291 = protoModule.writeBuffer(var4290, var4291, var4289, buffer.len(var4289))
		buff = var4290
		var4288 = var4291
	end
	if self.metadata ~= nil then
		local var4292 = self.metadata:encode()
		local var4293, var4294 = protoModule.writeTag(buff, var4288, 3, protoModule.wireTypes.lengthDelimited)
		var4293, var4294 = protoModule.writeBuffer(var4293, var4294, var4292, buffer.len(var4292))
		buff = var4293
		var4288 = var4294
	end
	local buff_1 = buffer.create(var4288)
	buffer.copy(buff_1, 0, buff, 0, var4288)
	
	return buff_1
end

function t_127.decode(p250) --[[ line: 24805 ]]
	-- upvalues: t_127 (ref), protoModule (ref), propTypesModule (ref)
	local var4296 = t_127.new()
	local var4297 = 0
	while var4297 < buffer.len(p250) do
		local _ = nil
		local var4298 = nil
		local var4299, var4300, var4301 = protoModule.readTag(p250, var4297)
		local var4302 = var4299
		var4298 = var4300
		var4297 = var4301
		
		if var4298 == protoModule.wireTypes.varint then
			local _ = nil
			local var4303, var4304 = protoModule.readVarInt(p250, var4297)
			local _ = var4303
			var4297 = var4304
			continue
		end
		if var4298 == protoModule.wireTypes.lengthDelimited then
			if var4302 == 1 then
				local _ = nil
				local var4305, var4306 = protoModule.readBuffer(p250, var4297)
				var4297 = var4306
				var4296.milestone = propTypesModule.StringProp.decode(var4305)
			elseif var4302 == 3 then
				local _ = nil
				local var4307, var4308 = protoModule.readBuffer(p250, var4297)
				var4297 = var4308
				var4296.metadata = propTypesModule.StructProp.decode(var4307)
			else
				local _ = nil
				local var4309, var4310 = protoModule.readVarInt(p250, var4297)
				var4297 = var4310 + var4309
			end
		elseif var4298 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4311, var4312 = protoModule.readFixed32(p250, var4297)
			local _ = var4311
			var4297 = var4312
		elseif var4298 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4313, var4314 = protoModule.readFixed64(p250, var4297)
			local _ = var4313
			var4297 = var4314
		else
			error("Unsupported wire type: " .. var4298)
		end
	end
	return var4296
end

function t_127:jsonEncode() --[[ line: 24855 ]]
	local t = {}
	
	if self.milestone ~= nil then
		t.milestone = self.milestone:jsonEncode()
	end
	if self.metadata ~= nil then
		t.metadata = self.metadata:jsonEncode()
	end
	return t
end

function t_127:jsonDecode() --[[ line: 24871 ]]
	-- upvalues: t_127 (ref), propTypesModule (ref)
	local var4316 = t_127.new()
	
	if self.milestone ~= nil then
		var4316.milestone = propTypesModule.StringProp.jsonDecode(self.milestone)
	end
	if self.metadata ~= nil then
		var4316.metadata = propTypesModule.StructProp.jsonDecode(self.metadata)
	end
	return var4316
end

t_127.descriptor = {
	name = "ReportSurfaceLoadTimeMilestoneAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ReportSurfaceLoadTimeMilestoneAction_Params = t_127
typeRegistryModule.default:register(t.ReportSurfaceLoadTimeMilestoneAction_Params)
local t_128 = {}
t_128.__index = t_128

function t_128.new(p251) --[[ line: 24901 ]]
	-- upvalues: t (ref), t_128 (ref)
	return setmetatable({
		action_type = if p251 == nil or p251.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p251.action_type,
		action_params = if p251 == nil or p251.action_params == nil then nil else p251.action_params
	}, t_128)
end

function t_128:encode() --[[ line: 24912 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4318 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4319, var4320 = protoModule.writeTag(buff, var4318, 1, protoModule.wireTypes.varint)
		var4319, var4320 = protoModule.writeVarInt(var4319, var4320, t.ActionType.toNumber(self.action_type))
		buff = var4319
		var4318 = var4320
	end
	if self.action_params ~= nil then
		local var4321 = self.action_params:encode()
		local var4322, var4323 = protoModule.writeTag(buff, var4318, 2, protoModule.wireTypes.lengthDelimited)
		var4322, var4323 = protoModule.writeBuffer(var4322, var4323, var4321, buffer.len(var4321))
		buff = var4322
		var4318 = var4323
	end
	local buff_1 = buffer.create(var4318)
	buffer.copy(buff_1, 0, buff, 0, var4318)
	
	return buff_1
end

function t_128.decode(p252) --[[ line: 24938 ]]
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var4325 = t_128.new()
	local var4326 = 0
	while var4326 < buffer.len(p252) do
		local _ = nil
		local var4327 = nil
		local var4328, var4329, var4330 = protoModule.readTag(p252, var4326)
		local var4331 = var4328
		var4327 = var4329
		var4326 = var4330
		
		if var4327 == protoModule.wireTypes.varint then
			if var4331 == 1 then
				local _ = nil
				local var4332, var4333 = protoModule.readVarIntI32(p252, var4326)
				local var4334 = var4332
				var4326 = var4333
				var4325.action_type = t.ActionType.fromNumber(var4334) or var4334
			else
				local _ = nil
				local var4335, var4336 = protoModule.readVarInt(p252, var4326)
				local _ = var4335
				var4326 = var4336
			end
		end
		if var4327 == protoModule.wireTypes.lengthDelimited then
			if var4331 == 2 then
				local _ = nil
				local var4337, var4338 = protoModule.readBuffer(p252, var4326)
				var4326 = var4338
				var4325.action_params = t.DismissGameFeedbackAction_Params.decode(var4337)
			else
				local _ = nil
				local var4339, var4340 = protoModule.readVarInt(p252, var4326)
				var4326 = var4340 + var4339
			end
		elseif var4327 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4341, var4342 = protoModule.readFixed32(p252, var4326)
			local _ = var4341
			var4326 = var4342
		elseif var4327 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4343, var4344 = protoModule.readFixed64(p252, var4326)
			local _ = var4343
			var4326 = var4344
		else
			error("Unsupported wire type: " .. var4327)
		end
	end
	return var4325
end

function t_128:jsonEncode() --[[ line: 24986 ]]
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

function t_128:jsonDecode() --[[ line: 25008 ]]
	-- upvalues: t_128 (ref), t (ref)
	local var4346 = t_128.new()
	
	if self.action_type ~= nil then
		var4346.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4346.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4346.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4346.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return var4346
end

t_128.descriptor = {
	name = "DismissGameFeedbackAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissGameFeedbackAction"
}
t.DismissGameFeedbackAction = t_128
typeRegistryModule.default:register(t.DismissGameFeedbackAction)
local t_129 = {}
t_129.__index = t_129

function t_129.new(p253) --[[ line: 25048 ]]
	-- upvalues: t_129 (ref)
	return setmetatable({
		root_place_id = if p253 == nil or p253.root_place_id == nil then nil else p253.root_place_id
	}, t_129)
end

function t_129:encode() --[[ line: 25056 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4348 = 0
	
	if self.root_place_id ~= nil then
		local var4349 = self.root_place_id:encode()
		local var4350, var4351 = protoModule.writeTag(buff, var4348, 1, protoModule.wireTypes.lengthDelimited)
		var4350, var4351 = protoModule.writeBuffer(var4350, var4351, var4349, buffer.len(var4349))
		buff = var4350
		var4348 = var4351
	end
	local buff_1 = buffer.create(var4348)
	buffer.copy(buff_1, 0, buff, 0, var4348)
	
	return buff_1
end

function t_129.decode(p254) --[[ line: 25071 ]]
	-- upvalues: t_129 (ref), protoModule (ref), propTypesModule (ref)
	local var4353 = t_129.new()
	local var4354 = 0
	while var4354 < buffer.len(p254) do
		local _ = nil
		local var4355 = nil
		local var4356, var4357, var4358 = protoModule.readTag(p254, var4354)
		local var4359 = var4356
		var4355 = var4357
		var4354 = var4358
		
		if var4355 == protoModule.wireTypes.varint then
			local _ = nil
			local var4360, var4361 = protoModule.readVarInt(p254, var4354)
			local _ = var4360
			var4354 = var4361
			continue
		end
		if var4355 == protoModule.wireTypes.lengthDelimited then
			if var4359 == 1 then
				local _ = nil
				local var4362, var4363 = protoModule.readBuffer(p254, var4354)
				var4354 = var4363
				var4353.root_place_id = propTypesModule.StringProp.decode(var4362)
			else
				local _ = nil
				local var4364, var4365 = protoModule.readVarInt(p254, var4354)
				var4354 = var4365 + var4364
			end
		elseif var4355 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4366, var4367 = protoModule.readFixed32(p254, var4354)
			local _ = var4366
			var4354 = var4367
		elseif var4355 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4368, var4369 = protoModule.readFixed64(p254, var4354)
			local _ = var4368
			var4354 = var4369
		else
			error("Unsupported wire type: " .. var4355)
		end
	end
	return var4353
end

function t_129:jsonEncode() --[[ line: 25114 ]]
	local t = {}
	
	if self.root_place_id ~= nil then
		t.rootPlaceId = self.root_place_id:jsonEncode()
	end
	return t
end

function t_129:jsonDecode() --[[ line: 25124 ]]
	-- upvalues: t_129 (ref), propTypesModule (ref)
	local var4371 = t_129.new()
	
	if self.root_place_id ~= nil then
		var4371.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var4371.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var4371
end

t_129.descriptor = {
	name = "DismissGameFeedbackAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissGameFeedbackAction_Params = t_129
typeRegistryModule.default:register(t.DismissGameFeedbackAction_Params)
local t_130 = {}
t_130.__index = t_130

function t_130.new(p255) --[[ line: 25156 ]]
	-- upvalues: t (ref), t_130 (ref)
	return setmetatable({
		action_type = if p255 == nil or p255.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p255.action_type,
		action_params = if p255 == nil or p255.action_params == nil then nil else p255.action_params
	}, t_130)
end

function t_130:encode() --[[ line: 25167 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4373 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4374, var4375 = protoModule.writeTag(buff, var4373, 1, protoModule.wireTypes.varint)
		var4374, var4375 = protoModule.writeVarInt(var4374, var4375, t.ActionType.toNumber(self.action_type))
		buff = var4374
		var4373 = var4375
	end
	if self.action_params ~= nil then
		local var4376 = self.action_params:encode()
		local var4377, var4378 = protoModule.writeTag(buff, var4373, 2, protoModule.wireTypes.lengthDelimited)
		var4377, var4378 = protoModule.writeBuffer(var4377, var4378, var4376, buffer.len(var4376))
		buff = var4377
		var4373 = var4378
	end
	local buff_1 = buffer.create(var4373)
	buffer.copy(buff_1, 0, buff, 0, var4373)
	
	return buff_1
end

function t_130.decode(p256) --[[ line: 25193 ]]
	-- upvalues: t_130 (ref), protoModule (ref), t (ref)
	local var4380 = t_130.new()
	local var4381 = 0
	while var4381 < buffer.len(p256) do
		local _ = nil
		local var4382 = nil
		local var4383, var4384, var4385 = protoModule.readTag(p256, var4381)
		local var4386 = var4383
		var4382 = var4384
		var4381 = var4385
		
		if var4382 == protoModule.wireTypes.varint then
			if var4386 == 1 then
				local _ = nil
				local var4387, var4388 = protoModule.readVarIntI32(p256, var4381)
				local var4389 = var4387
				var4381 = var4388
				var4380.action_type = t.ActionType.fromNumber(var4389) or var4389
			else
				local _ = nil
				local var4390, var4391 = protoModule.readVarInt(p256, var4381)
				local _ = var4390
				var4381 = var4391
			end
		end
		if var4382 == protoModule.wireTypes.lengthDelimited then
			if var4386 == 2 then
				local _ = nil
				local var4392, var4393 = protoModule.readBuffer(p256, var4381)
				var4381 = var4393
				var4380.action_params = t.OpenGameFeedbackFormAction_Params.decode(var4392)
			else
				local _ = nil
				local var4394, var4395 = protoModule.readVarInt(p256, var4381)
				var4381 = var4395 + var4394
			end
		elseif var4382 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4396, var4397 = protoModule.readFixed32(p256, var4381)
			local _ = var4396
			var4381 = var4397
		elseif var4382 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4398, var4399 = protoModule.readFixed64(p256, var4381)
			local _ = var4398
			var4381 = var4399
		else
			error("Unsupported wire type: " .. var4382)
		end
	end
	return var4380
end

function t_130:jsonEncode() --[[ line: 25241 ]]
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

function t_130:jsonDecode() --[[ line: 25263 ]]
	-- upvalues: t_130 (ref), t (ref)
	local var4401 = t_130.new()
	
	if self.action_type ~= nil then
		var4401.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4401.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4401.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4401.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.actionParams)
	end
	return var4401
end

t_130.descriptor = {
	name = "OpenGameFeedbackFormAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameFeedbackFormAction"
}
t.OpenGameFeedbackFormAction = t_130
typeRegistryModule.default:register(t.OpenGameFeedbackFormAction)
local t_131 = {}
t_131.__index = t_131

function t_131.new(p257) --[[ line: 25303 ]]
	-- upvalues: t_131 (ref)
	return setmetatable({
		universe_id = if p257 == nil or p257.universe_id == nil then nil else p257.universe_id,
		root_place_id = if p257 == nil or p257.root_place_id == nil then nil else p257.root_place_id
	}, t_131)
end

function t_131:encode() --[[ line: 25312 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4403 = 0
	
	if self.universe_id ~= nil then
		local var4404 = self.universe_id:encode()
		local var4405, var4406 = protoModule.writeTag(buff, var4403, 1, protoModule.wireTypes.lengthDelimited)
		var4405, var4406 = protoModule.writeBuffer(var4405, var4406, var4404, buffer.len(var4404))
		buff = var4405
		var4403 = var4406
	end
	if self.root_place_id ~= nil then
		local var4407 = self.root_place_id:encode()
		local var4408, var4409 = protoModule.writeTag(buff, var4403, 2, protoModule.wireTypes.lengthDelimited)
		var4408, var4409 = protoModule.writeBuffer(var4408, var4409, var4407, buffer.len(var4407))
		buff = var4408
		var4403 = var4409
	end
	local buff_1 = buffer.create(var4403)
	buffer.copy(buff_1, 0, buff, 0, var4403)
	
	return buff_1
end

function t_131.decode(p258) --[[ line: 25333 ]]
	-- upvalues: t_131 (ref), protoModule (ref), propTypesModule (ref)
	local var4411 = t_131.new()
	local var4412 = 0
	while var4412 < buffer.len(p258) do
		local _ = nil
		local var4413 = nil
		local var4414, var4415, var4416 = protoModule.readTag(p258, var4412)
		local var4417 = var4414
		var4413 = var4415
		var4412 = var4416
		
		if var4413 == protoModule.wireTypes.varint then
			local _ = nil
			local var4418, var4419 = protoModule.readVarInt(p258, var4412)
			local _ = var4418
			var4412 = var4419
			continue
		end
		if var4413 == protoModule.wireTypes.lengthDelimited then
			if var4417 == 1 then
				local _ = nil
				local var4420, var4421 = protoModule.readBuffer(p258, var4412)
				var4412 = var4421
				var4411.universe_id = propTypesModule.StringProp.decode(var4420)
			elseif var4417 == 2 then
				local _ = nil
				local var4422, var4423 = protoModule.readBuffer(p258, var4412)
				var4412 = var4423
				var4411.root_place_id = propTypesModule.StringProp.decode(var4422)
			else
				local _ = nil
				local var4424, var4425 = protoModule.readVarInt(p258, var4412)
				var4412 = var4425 + var4424
			end
		elseif var4413 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4426, var4427 = protoModule.readFixed32(p258, var4412)
			local _ = var4426
			var4412 = var4427
		elseif var4413 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4428, var4429 = protoModule.readFixed64(p258, var4412)
			local _ = var4428
			var4412 = var4429
		else
			error("Unsupported wire type: " .. var4413)
		end
	end
	return var4411
end

function t_131:jsonEncode() --[[ line: 25381 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.root_place_id ~= nil then
		t.rootPlaceId = self.root_place_id:jsonEncode()
	end
	return t
end

function t_131:jsonDecode() --[[ line: 25395 ]]
	-- upvalues: t_131 (ref), propTypesModule (ref)
	local var4431 = t_131.new()
	
	if self.universe_id ~= nil then
		var4431.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var4431.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		var4431.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var4431.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var4431
end

t_131.descriptor = {
	name = "OpenGameFeedbackFormAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameFeedbackFormAction_Params = t_131
typeRegistryModule.default:register(t.OpenGameFeedbackFormAction_Params)
local t_132 = {}
t_132.__index = t_132

function t_132.new(p259) --[[ line: 25436 ]]
	-- upvalues: t (ref), t_132 (ref)
	return setmetatable({
		action_type = if p259 == nil or p259.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p259.action_type,
		action_params = if p259 == nil or p259.action_params == nil then nil else p259.action_params
	}, t_132)
end

function t_132:encode() --[[ line: 25445 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4433 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4434, var4435 = protoModule.writeTag(buff, var4433, 1, protoModule.wireTypes.varint)
		var4434, var4435 = protoModule.writeVarInt(var4434, var4435, t.ActionType.toNumber(self.action_type))
		buff = var4434
		var4433 = var4435
	end
	if self.action_params ~= nil then
		local var4436 = self.action_params:encode()
		local var4437, var4438 = protoModule.writeTag(buff, var4433, 2, protoModule.wireTypes.lengthDelimited)
		var4437, var4438 = protoModule.writeBuffer(var4437, var4438, var4436, buffer.len(var4436))
		buff = var4437
		var4433 = var4438
	end
	local buff_1 = buffer.create(var4433)
	buffer.copy(buff_1, 0, buff, 0, var4433)
	
	return buff_1
end

function t_132.decode(p260) --[[ line: 25471 ]]
	-- upvalues: t_132 (ref), protoModule (ref), t (ref)
	local var4440 = t_132.new()
	local var4441 = 0
	while var4441 < buffer.len(p260) do
		local _ = nil
		local var4442 = nil
		local var4443, var4444, var4445 = protoModule.readTag(p260, var4441)
		local var4446 = var4443
		var4442 = var4444
		var4441 = var4445
		
		if var4442 == protoModule.wireTypes.varint then
			if var4446 == 1 then
				local _ = nil
				local var4447, var4448 = protoModule.readVarIntI32(p260, var4441)
				local var4449 = var4447
				var4441 = var4448
				var4440.action_type = t.ActionType.fromNumber(var4449) or var4449
			else
				local _ = nil
				local var4450, var4451 = protoModule.readVarInt(p260, var4441)
				local _ = var4450
				var4441 = var4451
			end
		end
		if var4442 == protoModule.wireTypes.lengthDelimited then
			if var4446 == 2 then
				local _ = nil
				local var4452, var4453 = protoModule.readBuffer(p260, var4441)
				var4441 = var4453
				var4440.action_params = t.AiOverviewFeedbackAction_Params.decode(var4452)
			else
				local _ = nil
				local var4454, var4455 = protoModule.readVarInt(p260, var4441)
				var4441 = var4455 + var4454
			end
		elseif var4442 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4456, var4457 = protoModule.readFixed32(p260, var4441)
			local _ = var4456
			var4441 = var4457
		elseif var4442 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4458, var4459 = protoModule.readFixed64(p260, var4441)
			local _ = var4458
			var4441 = var4459
		else
			error("Unsupported wire type: " .. var4442)
		end
	end
	return var4440
end

function t_132:jsonEncode() --[[ line: 25519 ]]
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

function t_132:jsonDecode() --[[ line: 25541 ]]
	-- upvalues: t_132 (ref), t (ref)
	local var4461 = t_132.new()
	
	if self.action_type ~= nil then
		var4461.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4461.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4461.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4461.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return var4461
end

t_132.descriptor = {
	name = "AiOverviewFeedbackAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.AiOverviewFeedbackAction"
}
t.AiOverviewFeedbackAction = t_132
typeRegistryModule.default:register(t.AiOverviewFeedbackAction)
local t_133 = {}
t_133.__index = t_133

function t_133.new(p261) --[[ line: 25581 ]]
	-- upvalues: t_133 (ref)
	return setmetatable({
		sentiment = if p261 == nil or p261.sentiment == nil then nil else p261.sentiment,
		dialog_title = if p261 == nil or p261.dialog_title == nil then nil else p261.dialog_title,
		dialog_text = if p261 == nil or p261.dialog_text == nil then nil else p261.dialog_text,
		placeholder_text = if p261 == nil or p261.placeholder_text == nil then nil else p261.placeholder_text
	}, t_133)
end

function t_133:encode() --[[ line: 25592 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4463 = 0
	
	if self.sentiment ~= nil then
		local var4464 = self.sentiment:encode()
		local var4465, var4466 = protoModule.writeTag(buff, var4463, 1, protoModule.wireTypes.lengthDelimited)
		var4465, var4466 = protoModule.writeBuffer(var4465, var4466, var4464, buffer.len(var4464))
		buff = var4465
		var4463 = var4466
	end
	if self.dialog_title ~= nil then
		local var4467 = self.dialog_title:encode()
		local var4468, var4469 = protoModule.writeTag(buff, var4463, 2, protoModule.wireTypes.lengthDelimited)
		var4468, var4469 = protoModule.writeBuffer(var4468, var4469, var4467, buffer.len(var4467))
		buff = var4468
		var4463 = var4469
	end
	if self.dialog_text ~= nil then
		local var4470 = self.dialog_text:encode()
		local var4471, var4472 = protoModule.writeTag(buff, var4463, 3, protoModule.wireTypes.lengthDelimited)
		var4471, var4472 = protoModule.writeBuffer(var4471, var4472, var4470, buffer.len(var4470))
		buff = var4471
		var4463 = var4472
	end
	if self.placeholder_text ~= nil then
		local var4473 = self.placeholder_text:encode()
		local var4474, var4475 = protoModule.writeTag(buff, var4463, 4, protoModule.wireTypes.lengthDelimited)
		var4474, var4475 = protoModule.writeBuffer(var4474, var4475, var4473, buffer.len(var4473))
		buff = var4474
		var4463 = var4475
	end
	local buff_1 = buffer.create(var4463)
	buffer.copy(buff_1, 0, buff, 0, var4463)
	
	return buff_1
end

function t_133.decode(p262) --[[ line: 25625 ]]
	-- upvalues: t_133 (ref), protoModule (ref), propTypesModule (ref)
	local var4477 = t_133.new()
	local var4478 = 0
	while var4478 < buffer.len(p262) do
		local _ = nil
		local var4479 = nil
		local var4480, var4481, var4482 = protoModule.readTag(p262, var4478)
		local var4483 = var4480
		var4479 = var4481
		var4478 = var4482
		
		if var4479 == protoModule.wireTypes.varint then
			local _ = nil
			local var4484, var4485 = protoModule.readVarInt(p262, var4478)
			local _ = var4484
			var4478 = var4485
			continue
		end
		if var4479 == protoModule.wireTypes.lengthDelimited then
			if var4483 == 1 then
				local _ = nil
				local var4486, var4487 = protoModule.readBuffer(p262, var4478)
				var4478 = var4487
				var4477.sentiment = propTypesModule.StringProp.decode(var4486)
			elseif var4483 == 2 then
				local _ = nil
				local var4488, var4489 = protoModule.readBuffer(p262, var4478)
				var4478 = var4489
				var4477.dialog_title = propTypesModule.StringProp.decode(var4488)
			elseif var4483 == 3 then
				local _ = nil
				local var4490, var4491 = protoModule.readBuffer(p262, var4478)
				var4478 = var4491
				var4477.dialog_text = propTypesModule.StringProp.decode(var4490)
			elseif var4483 == 4 then
				local _ = nil
				local var4492, var4493 = protoModule.readBuffer(p262, var4478)
				var4478 = var4493
				var4477.placeholder_text = propTypesModule.StringProp.decode(var4492)
			else
				local _ = nil
				local var4494, var4495 = protoModule.readVarInt(p262, var4478)
				var4478 = var4495 + var4494
			end
		elseif var4479 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4496, var4497 = protoModule.readFixed32(p262, var4478)
			local _ = var4496
			var4478 = var4497
		elseif var4479 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4498, var4499 = protoModule.readFixed64(p262, var4478)
			local _ = var4498
			var4478 = var4499
		else
			error("Unsupported wire type: " .. var4479)
		end
	end
	return var4477
end

function t_133:jsonEncode() --[[ line: 25683 ]]
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

function t_133:jsonDecode() --[[ line: 25705 ]]
	-- upvalues: t_133 (ref), propTypesModule (ref)
	local var4501 = t_133.new()
	
	if self.sentiment ~= nil then
		var4501.sentiment = propTypesModule.StringProp.jsonDecode(self.sentiment)
	end
	if self.dialog_title ~= nil then
		var4501.dialog_title = propTypesModule.StringProp.jsonDecode(self.dialog_title)
	end
	if self.dialogTitle ~= nil then
		var4501.dialog_title = propTypesModule.StringProp.jsonDecode(self.dialogTitle)
	end
	if self.dialog_text ~= nil then
		var4501.dialog_text = propTypesModule.StringProp.jsonDecode(self.dialog_text)
	end
	if self.dialogText ~= nil then
		var4501.dialog_text = propTypesModule.StringProp.jsonDecode(self.dialogText)
	end
	if self.placeholder_text ~= nil then
		var4501.placeholder_text = propTypesModule.StringProp.jsonDecode(self.placeholder_text)
	end
	if self.placeholderText ~= nil then
		var4501.placeholder_text = propTypesModule.StringProp.jsonDecode(self.placeholderText)
	end
	return var4501
end

t_133.descriptor = {
	name = "AiOverviewFeedbackAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.AiOverviewFeedbackAction_Params = t_133
typeRegistryModule.default:register(t.AiOverviewFeedbackAction_Params)
local t_134 = {}
t_134.__index = t_134

function t_134.new(p263) --[[ line: 25758 ]]
	-- upvalues: t (ref), t_134 (ref)
	return setmetatable({
		action_type = if p263 == nil or p263.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p263.action_type,
		action_params = if p263 == nil or p263.action_params == nil then nil else p263.action_params
	}, t_134)
end

function t_134:encode() --[[ line: 25769 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4503 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4504, var4505 = protoModule.writeTag(buff, var4503, 1, protoModule.wireTypes.varint)
		var4504, var4505 = protoModule.writeVarInt(var4504, var4505, t.ActionType.toNumber(self.action_type))
		buff = var4504
		var4503 = var4505
	end
	if self.action_params ~= nil then
		local var4506 = self.action_params:encode()
		local var4507, var4508 = protoModule.writeTag(buff, var4503, 2, protoModule.wireTypes.lengthDelimited)
		var4507, var4508 = protoModule.writeBuffer(var4507, var4508, var4506, buffer.len(var4506))
		buff = var4507
		var4503 = var4508
	end
	local buff_1 = buffer.create(var4503)
	buffer.copy(buff_1, 0, buff, 0, var4503)
	
	return buff_1
end

function t_134.decode(p264) --[[ line: 25795 ]]
	-- upvalues: t_134 (ref), protoModule (ref), t (ref)
	local var4510 = t_134.new()
	local var4511 = 0
	while var4511 < buffer.len(p264) do
		local _ = nil
		local var4512 = nil
		local var4513, var4514, var4515 = protoModule.readTag(p264, var4511)
		local var4516 = var4513
		var4512 = var4514
		var4511 = var4515
		
		if var4512 == protoModule.wireTypes.varint then
			if var4516 == 1 then
				local _ = nil
				local var4517, var4518 = protoModule.readVarIntI32(p264, var4511)
				local var4519 = var4517
				var4511 = var4518
				var4510.action_type = t.ActionType.fromNumber(var4519) or var4519
			else
				local _ = nil
				local var4520, var4521 = protoModule.readVarInt(p264, var4511)
				local _ = var4520
				var4511 = var4521
			end
		end
		if var4512 == protoModule.wireTypes.lengthDelimited then
			if var4516 == 2 then
				local _ = nil
				local var4522, var4523 = protoModule.readBuffer(p264, var4511)
				var4511 = var4523
				var4510.action_params = t.EnableEventNotificationsAction_Params.decode(var4522)
			else
				local _ = nil
				local var4524, var4525 = protoModule.readVarInt(p264, var4511)
				var4511 = var4525 + var4524
			end
		elseif var4512 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4526, var4527 = protoModule.readFixed32(p264, var4511)
			local _ = var4526
			var4511 = var4527
		elseif var4512 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4528, var4529 = protoModule.readFixed64(p264, var4511)
			local _ = var4528
			var4511 = var4529
		else
			error("Unsupported wire type: " .. var4512)
		end
	end
	return var4510
end

function t_134:jsonEncode() --[[ line: 25843 ]]
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

function t_134:jsonDecode() --[[ line: 25865 ]]
	-- upvalues: t_134 (ref), t (ref)
	local var4531 = t_134.new()
	
	if self.action_type ~= nil then
		var4531.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4531.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4531.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4531.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.actionParams)
	end
	return var4531
end

t_134.descriptor = {
	name = "EnableEventNotificationsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.EnableEventNotificationsAction"
}
t.EnableEventNotificationsAction = t_134
typeRegistryModule.default:register(t.EnableEventNotificationsAction)
local t_135 = {}
t_135.__index = t_135

function t_135.new(p265) --[[ line: 25905 ]]
	-- upvalues: t_135 (ref)
	return setmetatable({
		event_id = if p265 == nil or p265.event_id == nil then nil else p265.event_id,
		universe_id = if p265 == nil or p265.universe_id == nil then nil else p265.universe_id,
		channel = if p265 == nil or p265.channel == nil then nil else p265.channel
	}, t_135)
end

function t_135:encode() --[[ line: 25915 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4533 = 0
	
	if self.event_id ~= nil then
		local var4534 = self.event_id:encode()
		local var4535, var4536 = protoModule.writeTag(buff, var4533, 1, protoModule.wireTypes.lengthDelimited)
		var4535, var4536 = protoModule.writeBuffer(var4535, var4536, var4534, buffer.len(var4534))
		buff = var4535
		var4533 = var4536
	end
	if self.universe_id ~= nil then
		local var4537 = self.universe_id:encode()
		local var4538, var4539 = protoModule.writeTag(buff, var4533, 2, protoModule.wireTypes.lengthDelimited)
		var4538, var4539 = protoModule.writeBuffer(var4538, var4539, var4537, buffer.len(var4537))
		buff = var4538
		var4533 = var4539
	end
	if self.channel ~= nil then
		local var4540 = self.channel:encode()
		local var4541, var4542 = protoModule.writeTag(buff, var4533, 3, protoModule.wireTypes.lengthDelimited)
		var4541, var4542 = protoModule.writeBuffer(var4541, var4542, var4540, buffer.len(var4540))
		buff = var4541
		var4533 = var4542
	end
	local buff_1 = buffer.create(var4533)
	buffer.copy(buff_1, 0, buff, 0, var4533)
	
	return buff_1
end

function t_135.decode(p266) --[[ line: 25942 ]]
	-- upvalues: t_135 (ref), protoModule (ref), propTypesModule (ref)
	local var4544 = t_135.new()
	local var4545 = 0
	while var4545 < buffer.len(p266) do
		local _ = nil
		local var4546 = nil
		local var4547, var4548, var4549 = protoModule.readTag(p266, var4545)
		local var4550 = var4547
		var4546 = var4548
		var4545 = var4549
		
		if var4546 == protoModule.wireTypes.varint then
			local _ = nil
			local var4551, var4552 = protoModule.readVarInt(p266, var4545)
			local _ = var4551
			var4545 = var4552
			continue
		end
		if var4546 == protoModule.wireTypes.lengthDelimited then
			if var4550 == 1 then
				local _ = nil
				local var4553, var4554 = protoModule.readBuffer(p266, var4545)
				var4545 = var4554
				var4544.event_id = propTypesModule.StringProp.decode(var4553)
			elseif var4550 == 2 then
				local _ = nil
				local var4555, var4556 = protoModule.readBuffer(p266, var4545)
				var4545 = var4556
				var4544.universe_id = propTypesModule.StringProp.decode(var4555)
			elseif var4550 == 3 then
				local _ = nil
				local var4557, var4558 = protoModule.readBuffer(p266, var4545)
				var4545 = var4558
				var4544.channel = propTypesModule.StringProp.decode(var4557)
			else
				local _ = nil
				local var4559, var4560 = protoModule.readVarInt(p266, var4545)
				var4545 = var4560 + var4559
			end
		elseif var4546 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4561, var4562 = protoModule.readFixed32(p266, var4545)
			local _ = var4561
			var4545 = var4562
		elseif var4546 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4563, var4564 = protoModule.readFixed64(p266, var4545)
			local _ = var4563
			var4545 = var4564
		else
			error("Unsupported wire type: " .. var4546)
		end
	end
	return var4544
end

function t_135:jsonEncode() --[[ line: 25995 ]]
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

function t_135:jsonDecode() --[[ line: 26013 ]]
	-- upvalues: t_135 (ref), propTypesModule (ref)
	local var4566 = t_135.new()
	
	if self.event_id ~= nil then
		var4566.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var4566.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.universe_id ~= nil then
		var4566.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var4566.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.channel ~= nil then
		var4566.channel = propTypesModule.StringProp.jsonDecode(self.channel)
	end
	return var4566
end

t_135.descriptor = {
	name = "EnableEventNotificationsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.EnableEventNotificationsAction_Params = t_135
typeRegistryModule.default:register(t.EnableEventNotificationsAction_Params)
local t_136 = {}
t_136.__index = t_136

function t_136.new(p267) --[[ line: 26056 ]]
	-- upvalues: t (ref), t_136 (ref)
	return setmetatable({
		action_type = if p267 == nil or p267.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p267.action_type,
		action_params = if p267 == nil or p267.action_params == nil then nil else p267.action_params
	}, t_136)
end

function t_136:encode() --[[ line: 26067 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4568 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4569, var4570 = protoModule.writeTag(buff, var4568, 1, protoModule.wireTypes.varint)
		var4569, var4570 = protoModule.writeVarInt(var4569, var4570, t.ActionType.toNumber(self.action_type))
		buff = var4569
		var4568 = var4570
	end
	if self.action_params ~= nil then
		local var4571 = self.action_params:encode()
		local var4572, var4573 = protoModule.writeTag(buff, var4568, 2, protoModule.wireTypes.lengthDelimited)
		var4572, var4573 = protoModule.writeBuffer(var4572, var4573, var4571, buffer.len(var4571))
		buff = var4572
		var4568 = var4573
	end
	local buff_1 = buffer.create(var4568)
	buffer.copy(buff_1, 0, buff, 0, var4568)
	
	return buff_1
end

function t_136.decode(p268) --[[ line: 26093 ]]
	-- upvalues: t_136 (ref), protoModule (ref), t (ref)
	local var4575 = t_136.new()
	local var4576 = 0
	while var4576 < buffer.len(p268) do
		local _ = nil
		local var4577 = nil
		local var4578, var4579, var4580 = protoModule.readTag(p268, var4576)
		local var4581 = var4578
		var4577 = var4579
		var4576 = var4580
		
		if var4577 == protoModule.wireTypes.varint then
			if var4581 == 1 then
				local _ = nil
				local var4582, var4583 = protoModule.readVarIntI32(p268, var4576)
				local var4584 = var4582
				var4576 = var4583
				var4575.action_type = t.ActionType.fromNumber(var4584) or var4584
			else
				local _ = nil
				local var4585, var4586 = protoModule.readVarInt(p268, var4576)
				local _ = var4585
				var4576 = var4586
			end
		end
		if var4577 == protoModule.wireTypes.lengthDelimited then
			if var4581 == 2 then
				local _ = nil
				local var4587, var4588 = protoModule.readBuffer(p268, var4576)
				var4576 = var4588
				var4575.action_params = t.DismissEventNotificationsModalAction_Params.decode(var4587)
			else
				local _ = nil
				local var4589, var4590 = protoModule.readVarInt(p268, var4576)
				var4576 = var4590 + var4589
			end
		elseif var4577 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4591, var4592 = protoModule.readFixed32(p268, var4576)
			local _ = var4591
			var4576 = var4592
		elseif var4577 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4593, var4594 = protoModule.readFixed64(p268, var4576)
			local _ = var4593
			var4576 = var4594
		else
			error("Unsupported wire type: " .. var4577)
		end
	end
	return var4575
end

function t_136:jsonEncode() --[[ line: 26141 ]]
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

function t_136:jsonDecode() --[[ line: 26163 ]]
	-- upvalues: t_136 (ref), t (ref)
	local var4596 = t_136.new()
	
	if self.action_type ~= nil then
		var4596.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4596.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4596.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4596.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.actionParams)
	end
	return var4596
end

t_136.descriptor = {
	name = "DismissEventNotificationsModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissEventNotificationsModalAction"
}
t.DismissEventNotificationsModalAction = t_136
typeRegistryModule.default:register(t.DismissEventNotificationsModalAction)
local t_137 = {}
t_137.__index = t_137

function t_137.new(p269) --[[ line: 26205 ]]
	-- upvalues: t_137 (ref)
	return setmetatable({
		event_id = if p269 == nil or p269.event_id == nil then nil else p269.event_id
	}, t_137)
end

function t_137:encode() --[[ line: 26213 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4598 = 0
	
	if self.event_id ~= nil then
		local var4599 = self.event_id:encode()
		local var4600, var4601 = protoModule.writeTag(buff, var4598, 1, protoModule.wireTypes.lengthDelimited)
		var4600, var4601 = protoModule.writeBuffer(var4600, var4601, var4599, buffer.len(var4599))
		buff = var4600
		var4598 = var4601
	end
	local buff_1 = buffer.create(var4598)
	buffer.copy(buff_1, 0, buff, 0, var4598)
	
	return buff_1
end

function t_137.decode(p270) --[[ line: 26230 ]]
	-- upvalues: t_137 (ref), protoModule (ref), propTypesModule (ref)
	local var4603 = t_137.new()
	local var4604 = 0
	while var4604 < buffer.len(p270) do
		local _ = nil
		local var4605 = nil
		local var4606, var4607, var4608 = protoModule.readTag(p270, var4604)
		local var4609 = var4606
		var4605 = var4607
		var4604 = var4608
		
		if var4605 == protoModule.wireTypes.varint then
			local _ = nil
			local var4610, var4611 = protoModule.readVarInt(p270, var4604)
			local _ = var4610
			var4604 = var4611
			continue
		end
		if var4605 == protoModule.wireTypes.lengthDelimited then
			if var4609 == 1 then
				local _ = nil
				local var4612, var4613 = protoModule.readBuffer(p270, var4604)
				var4604 = var4613
				var4603.event_id = propTypesModule.StringProp.decode(var4612)
			else
				local _ = nil
				local var4614, var4615 = protoModule.readVarInt(p270, var4604)
				var4604 = var4615 + var4614
			end
		elseif var4605 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4616, var4617 = protoModule.readFixed32(p270, var4604)
			local _ = var4616
			var4604 = var4617
		elseif var4605 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4618, var4619 = protoModule.readFixed64(p270, var4604)
			local _ = var4618
			var4604 = var4619
		else
			error("Unsupported wire type: " .. var4605)
		end
	end
	return var4603
end

function t_137:jsonEncode() --[[ line: 26275 ]]
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_137:jsonDecode() --[[ line: 26287 ]]
	-- upvalues: t_137 (ref), propTypesModule (ref)
	local var4621 = t_137.new()
	
	if self.event_id ~= nil then
		var4621.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var4621.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var4621
end

t_137.descriptor = {
	name = "DismissEventNotificationsModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissEventNotificationsModalAction_Params = t_137
typeRegistryModule.default:register(t.DismissEventNotificationsModalAction_Params)
local t_138 = {}
t_138.__index = t_138

function t_138.new(p271) --[[ line: 26317 ]]
	-- upvalues: t (ref), t_138 (ref)
	return setmetatable({
		action_type = if p271 == nil or p271.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p271.action_type,
		action_params = if p271 == nil or p271.action_params == nil then nil else p271.action_params
	}, t_138)
end

function t_138:encode() --[[ line: 26326 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4623 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4624, var4625 = protoModule.writeTag(buff, var4623, 1, protoModule.wireTypes.varint)
		var4624, var4625 = protoModule.writeVarInt(var4624, var4625, t.ActionType.toNumber(self.action_type))
		buff = var4624
		var4623 = var4625
	end
	if self.action_params ~= nil then
		local var4626 = self.action_params:encode()
		local var4627, var4628 = protoModule.writeTag(buff, var4623, 2, protoModule.wireTypes.lengthDelimited)
		var4627, var4628 = protoModule.writeBuffer(var4627, var4628, var4626, buffer.len(var4626))
		buff = var4627
		var4623 = var4628
	end
	local buff_1 = buffer.create(var4623)
	buffer.copy(buff_1, 0, buff, 0, var4623)
	
	return buff_1
end

function t_138.decode(p272) --[[ line: 26352 ]]
	-- upvalues: t_138 (ref), protoModule (ref), t (ref)
	local var4630 = t_138.new()
	local var4631 = 0
	while var4631 < buffer.len(p272) do
		local _ = nil
		local var4632 = nil
		local var4633, var4634, var4635 = protoModule.readTag(p272, var4631)
		local var4636 = var4633
		var4632 = var4634
		var4631 = var4635
		
		if var4632 == protoModule.wireTypes.varint then
			if var4636 == 1 then
				local _ = nil
				local var4637, var4638 = protoModule.readVarIntI32(p272, var4631)
				local var4639 = var4637
				var4631 = var4638
				var4630.action_type = t.ActionType.fromNumber(var4639) or var4639
			else
				local _ = nil
				local var4640, var4641 = protoModule.readVarInt(p272, var4631)
				local _ = var4640
				var4631 = var4641
			end
		end
		if var4632 == protoModule.wireTypes.lengthDelimited then
			if var4636 == 2 then
				local _ = nil
				local var4642, var4643 = protoModule.readBuffer(p272, var4631)
				var4631 = var4643
				var4630.action_params = t.OpenAmpWizardAction_Params.decode(var4642)
			else
				local _ = nil
				local var4644, var4645 = protoModule.readVarInt(p272, var4631)
				var4631 = var4645 + var4644
			end
		elseif var4632 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4646, var4647 = protoModule.readFixed32(p272, var4631)
			local _ = var4646
			var4631 = var4647
		elseif var4632 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4648, var4649 = protoModule.readFixed64(p272, var4631)
			local _ = var4648
			var4631 = var4649
		else
			error("Unsupported wire type: " .. var4632)
		end
	end
	return var4630
end

function t_138:jsonEncode() --[[ line: 26400 ]]
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

function t_138:jsonDecode() --[[ line: 26422 ]]
	-- upvalues: t_138 (ref), t (ref)
	local var4651 = t_138.new()
	
	if self.action_type ~= nil then
		var4651.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4651.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4651.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4651.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.actionParams)
	end
	return var4651
end

t_138.descriptor = {
	name = "OpenAmpWizardAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAmpWizardAction"
}
t.OpenAmpWizardAction = t_138
typeRegistryModule.default:register(t.OpenAmpWizardAction)
local t_139 = {}
t_139.__index = t_139

function t_139.new(p273) --[[ line: 26462 ]]
	-- upvalues: t_139 (ref)
	return setmetatable({
		feature_name = if p273 == nil or p273.feature_name == nil then nil else p273.feature_name,
		name_space = if p273 == nil or p273.name_space == nil then nil else p273.name_space,
		entry_point_event_ctx = if p273 == nil or p273.entry_point_event_ctx == nil then nil else p273.entry_point_event_ctx,
		skip_facial_age_estimation_web_link_modal = if p273 == nil or p273.skip_facial_age_estimation_web_link_modal == nil then nil else p273.skip_facial_age_estimation_web_link_modal
	}, t_139)
end

function t_139:encode() --[[ line: 26478 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4653 = 0
	
	if self.feature_name ~= nil then
		local var4654 = self.feature_name:encode()
		local var4655, var4656 = protoModule.writeTag(buff, var4653, 1, protoModule.wireTypes.lengthDelimited)
		var4655, var4656 = protoModule.writeBuffer(var4655, var4656, var4654, buffer.len(var4654))
		buff = var4655
		var4653 = var4656
	end
	if self.name_space ~= nil then
		local var4657 = self.name_space:encode()
		local var4658, var4659 = protoModule.writeTag(buff, var4653, 2, protoModule.wireTypes.lengthDelimited)
		var4658, var4659 = protoModule.writeBuffer(var4658, var4659, var4657, buffer.len(var4657))
		buff = var4658
		var4653 = var4659
	end
	if self.entry_point_event_ctx ~= nil then
		local var4660 = self.entry_point_event_ctx:encode()
		local var4661, var4662 = protoModule.writeTag(buff, var4653, 3, protoModule.wireTypes.lengthDelimited)
		var4661, var4662 = protoModule.writeBuffer(var4661, var4662, var4660, buffer.len(var4660))
		buff = var4661
		var4653 = var4662
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		local var4663 = self.skip_facial_age_estimation_web_link_modal:encode()
		local var4664, var4665 = protoModule.writeTag(buff, var4653, 4, protoModule.wireTypes.lengthDelimited)
		var4664, var4665 = protoModule.writeBuffer(var4664, var4665, var4663, buffer.len(var4663))
		buff = var4664
		var4653 = var4665
	end
	local buff_1 = buffer.create(var4653)
	buffer.copy(buff_1, 0, buff, 0, var4653)
	
	return buff_1
end

function t_139.decode(p274) --[[ line: 26511 ]]
	-- upvalues: t_139 (ref), protoModule (ref), propTypesModule (ref)
	local var4667 = t_139.new()
	local var4668 = 0
	while var4668 < buffer.len(p274) do
		local _ = nil
		local var4669 = nil
		local var4670, var4671, var4672 = protoModule.readTag(p274, var4668)
		local var4673 = var4670
		var4669 = var4671
		var4668 = var4672
		
		if var4669 == protoModule.wireTypes.varint then
			local _ = nil
			local var4674, var4675 = protoModule.readVarInt(p274, var4668)
			local _ = var4674
			var4668 = var4675
			continue
		end
		if var4669 == protoModule.wireTypes.lengthDelimited then
			if var4673 == 1 then
				local _ = nil
				local var4676, var4677 = protoModule.readBuffer(p274, var4668)
				var4668 = var4677
				var4667.feature_name = propTypesModule.StringProp.decode(var4676)
			elseif var4673 == 2 then
				local _ = nil
				local var4678, var4679 = protoModule.readBuffer(p274, var4668)
				var4668 = var4679
				var4667.name_space = propTypesModule.StringProp.decode(var4678)
			elseif var4673 == 3 then
				local _ = nil
				local var4680, var4681 = protoModule.readBuffer(p274, var4668)
				var4668 = var4681
				var4667.entry_point_event_ctx = propTypesModule.StringProp.decode(var4680)
			elseif var4673 == 4 then
				local _ = nil
				local var4682, var4683 = protoModule.readBuffer(p274, var4668)
				var4668 = var4683
				var4667.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.decode(var4682)
			else
				local _ = nil
				local var4684, var4685 = protoModule.readVarInt(p274, var4668)
				var4668 = var4685 + var4684
			end
		elseif var4669 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4686, var4687 = protoModule.readFixed32(p274, var4668)
			local _ = var4686
			var4668 = var4687
		elseif var4669 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4688, var4689 = protoModule.readFixed64(p274, var4668)
			local _ = var4688
			var4668 = var4689
		else
			error("Unsupported wire type: " .. var4669)
		end
	end
	return var4667
end

function t_139:jsonEncode() --[[ line: 26571 ]]
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

function t_139:jsonDecode() --[[ line: 26593 ]]
	-- upvalues: t_139 (ref), propTypesModule (ref)
	local var4691 = t_139.new()
	
	if self.feature_name ~= nil then
		var4691.feature_name = propTypesModule.StringProp.jsonDecode(self.feature_name)
	end
	if self.featureName ~= nil then
		var4691.feature_name = propTypesModule.StringProp.jsonDecode(self.featureName)
	end
	if self.name_space ~= nil then
		var4691.name_space = propTypesModule.StringProp.jsonDecode(self.name_space)
	end
	if self.nameSpace ~= nil then
		var4691.name_space = propTypesModule.StringProp.jsonDecode(self.nameSpace)
	end
	if self.entry_point_event_ctx ~= nil then
		var4691.entry_point_event_ctx = propTypesModule.StringProp.jsonDecode(self.entry_point_event_ctx)
	end
	if self.entryPointEventCtx ~= nil then
		var4691.entry_point_event_ctx = propTypesModule.StringProp.jsonDecode(self.entryPointEventCtx)
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		var4691.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.jsonDecode(self.skip_facial_age_estimation_web_link_modal)
	end
	if self.skipFacialAgeEstimationWebLinkModal ~= nil then
		var4691.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.jsonDecode(self.skipFacialAgeEstimationWebLinkModal)
	end
	return var4691
end

t_139.descriptor = {
	name = "OpenAmpWizardAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAmpWizardAction_Params = t_139
typeRegistryModule.default:register(t.OpenAmpWizardAction_Params)
local t_140 = {}
t_140.__index = t_140

function t_140.new(p275) --[[ line: 26655 ]]
	-- upvalues: t (ref), t_140 (ref)
	return setmetatable({
		action_type = if p275 == nil or p275.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p275.action_type,
		action_params = if p275 == nil or p275.action_params == nil then nil else p275.action_params
	}, t_140)
end

function t_140:encode() --[[ line: 26666 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4693 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4694, var4695 = protoModule.writeTag(buff, var4693, 1, protoModule.wireTypes.varint)
		var4694, var4695 = protoModule.writeVarInt(var4694, var4695, t.ActionType.toNumber(self.action_type))
		buff = var4694
		var4693 = var4695
	end
	if self.action_params ~= nil then
		local var4696 = self.action_params:encode()
		local var4697, var4698 = protoModule.writeTag(buff, var4693, 2, protoModule.wireTypes.lengthDelimited)
		var4697, var4698 = protoModule.writeBuffer(var4697, var4698, var4696, buffer.len(var4696))
		buff = var4697
		var4693 = var4698
	end
	local buff_1 = buffer.create(var4693)
	buffer.copy(buff_1, 0, buff, 0, var4693)
	
	return buff_1
end

function t_140.decode(p276) --[[ line: 26692 ]]
	-- upvalues: t_140 (ref), protoModule (ref), t (ref)
	local var4700 = t_140.new()
	local var4701 = 0
	while var4701 < buffer.len(p276) do
		local _ = nil
		local var4702 = nil
		local var4703, var4704, var4705 = protoModule.readTag(p276, var4701)
		local var4706 = var4703
		var4702 = var4704
		var4701 = var4705
		
		if var4702 == protoModule.wireTypes.varint then
			if var4706 == 1 then
				local _ = nil
				local var4707, var4708 = protoModule.readVarIntI32(p276, var4701)
				local var4709 = var4707
				var4701 = var4708
				var4700.action_type = t.ActionType.fromNumber(var4709) or var4709
			else
				local _ = nil
				local var4710, var4711 = protoModule.readVarInt(p276, var4701)
				local _ = var4710
				var4701 = var4711
			end
		end
		if var4702 == protoModule.wireTypes.lengthDelimited then
			if var4706 == 2 then
				local _ = nil
				local var4712, var4713 = protoModule.readBuffer(p276, var4701)
				var4701 = var4713
				var4700.action_params = t.OpenSocialProofUserListSheetAction_Params.decode(var4712)
			else
				local _ = nil
				local var4714, var4715 = protoModule.readVarInt(p276, var4701)
				var4701 = var4715 + var4714
			end
		elseif var4702 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4716, var4717 = protoModule.readFixed32(p276, var4701)
			local _ = var4716
			var4701 = var4717
		elseif var4702 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4718, var4719 = protoModule.readFixed64(p276, var4701)
			local _ = var4718
			var4701 = var4719
		else
			error("Unsupported wire type: " .. var4702)
		end
	end
	return var4700
end

function t_140:jsonEncode() --[[ line: 26740 ]]
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

function t_140:jsonDecode() --[[ line: 26762 ]]
	-- upvalues: t_140 (ref), t (ref)
	local var4721 = t_140.new()
	
	if self.action_type ~= nil then
		var4721.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4721.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4721.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4721.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.actionParams)
	end
	return var4721
end

t_140.descriptor = {
	name = "OpenSocialProofUserListSheetAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSocialProofUserListSheetAction"
}
t.OpenSocialProofUserListSheetAction = t_140
typeRegistryModule.default:register(t.OpenSocialProofUserListSheetAction)
local t_141 = {}
t_141.__index = t_141

function t_141.new(p277) --[[ line: 26804 ]]
	-- upvalues: t_141 (ref)
	return setmetatable({
		universe_id = if p277 == nil or p277.universe_id == nil then nil else p277.universe_id,
		place_id = if p277 == nil or p277.place_id == nil then nil else p277.place_id,
		total_connections = if p277 == nil or p277.total_connections == nil then nil else p277.total_connections,
		user_ids = if p277 == nil or p277.user_ids == nil then nil else p277.user_ids,
		sheet_title = if p277 == nil or p277.sheet_title == nil then nil else p277.sheet_title
	}, t_141)
end

function t_141:encode() --[[ line: 26816 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4723 = 0
	
	if self.universe_id ~= nil then
		local var4724 = self.universe_id:encode()
		local var4725, var4726 = protoModule.writeTag(buff, var4723, 1, protoModule.wireTypes.lengthDelimited)
		var4725, var4726 = protoModule.writeBuffer(var4725, var4726, var4724, buffer.len(var4724))
		buff = var4725
		var4723 = var4726
	end
	if self.place_id ~= nil then
		local var4727 = self.place_id:encode()
		local var4728, var4729 = protoModule.writeTag(buff, var4723, 2, protoModule.wireTypes.lengthDelimited)
		var4728, var4729 = protoModule.writeBuffer(var4728, var4729, var4727, buffer.len(var4727))
		buff = var4728
		var4723 = var4729
	end
	if self.total_connections ~= nil then
		local var4730 = self.total_connections:encode()
		local var4731, var4732 = protoModule.writeTag(buff, var4723, 3, protoModule.wireTypes.lengthDelimited)
		var4731, var4732 = protoModule.writeBuffer(var4731, var4732, var4730, buffer.len(var4730))
		buff = var4731
		var4723 = var4732
	end
	if self.user_ids ~= nil then
		local var4733 = self.user_ids:encode()
		local var4734, var4735 = protoModule.writeTag(buff, var4723, 4, protoModule.wireTypes.lengthDelimited)
		var4734, var4735 = protoModule.writeBuffer(var4734, var4735, var4733, buffer.len(var4733))
		buff = var4734
		var4723 = var4735
	end
	if self.sheet_title ~= nil then
		local var4736 = self.sheet_title:encode()
		local var4737, var4738 = protoModule.writeTag(buff, var4723, 5, protoModule.wireTypes.lengthDelimited)
		var4737, var4738 = protoModule.writeBuffer(var4737, var4738, var4736, buffer.len(var4736))
		buff = var4737
		var4723 = var4738
	end
	local buff_1 = buffer.create(var4723)
	buffer.copy(buff_1, 0, buff, 0, var4723)
	
	return buff_1
end

function t_141.decode(p278) --[[ line: 26857 ]]
	-- upvalues: t_141 (ref), protoModule (ref), propTypesModule (ref)
	local var4740 = t_141.new()
	local var4741 = 0
	while var4741 < buffer.len(p278) do
		local _ = nil
		local var4742 = nil
		local var4743, var4744, var4745 = protoModule.readTag(p278, var4741)
		local var4746 = var4743
		var4742 = var4744
		var4741 = var4745
		
		if var4742 == protoModule.wireTypes.varint then
			local _ = nil
			local var4747, var4748 = protoModule.readVarInt(p278, var4741)
			local _ = var4747
			var4741 = var4748
			continue
		end
		if var4742 == protoModule.wireTypes.lengthDelimited then
			if var4746 == 1 then
				local _ = nil
				local var4749, var4750 = protoModule.readBuffer(p278, var4741)
				var4741 = var4750
				var4740.universe_id = propTypesModule.StringProp.decode(var4749)
			elseif var4746 == 2 then
				local _ = nil
				local var4751, var4752 = protoModule.readBuffer(p278, var4741)
				var4741 = var4752
				var4740.place_id = propTypesModule.StringProp.decode(var4751)
			elseif var4746 == 3 then
				local _ = nil
				local var4753, var4754 = protoModule.readBuffer(p278, var4741)
				var4741 = var4754
				var4740.total_connections = propTypesModule.Int32Prop.decode(var4753)
			elseif var4746 == 4 then
				local _ = nil
				local var4755, var4756 = protoModule.readBuffer(p278, var4741)
				var4741 = var4756
				var4740.user_ids = propTypesModule.ArrayOfAvatarProp.decode(var4755)
			elseif var4746 == 5 then
				local _ = nil
				local var4757, var4758 = protoModule.readBuffer(p278, var4741)
				var4741 = var4758
				var4740.sheet_title = propTypesModule.StringProp.decode(var4757)
			else
				local _ = nil
				local var4759, var4760 = protoModule.readVarInt(p278, var4741)
				var4741 = var4760 + var4759
			end
		elseif var4742 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4761, var4762 = protoModule.readFixed32(p278, var4741)
			local _ = var4761
			var4741 = var4762
		elseif var4742 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4763, var4764 = protoModule.readFixed64(p278, var4741)
			local _ = var4763
			var4741 = var4764
		else
			error("Unsupported wire type: " .. var4742)
		end
	end
	return var4740
end

function t_141:jsonEncode() --[[ line: 26922 ]]
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

function t_141:jsonDecode() --[[ line: 26950 ]]
	-- upvalues: t_141 (ref), propTypesModule (ref)
	local var4766 = t_141.new()
	
	if self.universe_id ~= nil then
		var4766.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var4766.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var4766.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var4766.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.total_connections ~= nil then
		var4766.total_connections = propTypesModule.Int32Prop.jsonDecode(self.total_connections)
	end
	if self.totalConnections ~= nil then
		var4766.total_connections = propTypesModule.Int32Prop.jsonDecode(self.totalConnections)
	end
	if self.user_ids ~= nil then
		var4766.user_ids = propTypesModule.ArrayOfAvatarProp.jsonDecode(self.user_ids)
	end
	if self.userIds ~= nil then
		var4766.user_ids = propTypesModule.ArrayOfAvatarProp.jsonDecode(self.userIds)
	end
	if self.sheet_title ~= nil then
		var4766.sheet_title = propTypesModule.StringProp.jsonDecode(self.sheet_title)
	end
	if self.sheetTitle ~= nil then
		var4766.sheet_title = propTypesModule.StringProp.jsonDecode(self.sheetTitle)
	end
	return var4766
end

t_141.descriptor = {
	name = "OpenSocialProofUserListSheetAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSocialProofUserListSheetAction_Params = t_141
typeRegistryModule.default:register(t.OpenSocialProofUserListSheetAction_Params)
local t_142 = {}
t_142.__index = t_142

function t_142.new(p279) --[[ line: 27018 ]]
	-- upvalues: t (ref), t_142 (ref)
	return setmetatable({
		action_type = if p279 == nil or p279.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p279.action_type,
		action_params = if p279 == nil or p279.action_params == nil then nil else p279.action_params
	}, t_142)
end

function t_142:encode() --[[ line: 27029 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4768 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4769, var4770 = protoModule.writeTag(buff, var4768, 1, protoModule.wireTypes.varint)
		var4769, var4770 = protoModule.writeVarInt(var4769, var4770, t.ActionType.toNumber(self.action_type))
		buff = var4769
		var4768 = var4770
	end
	if self.action_params ~= nil then
		local var4771 = self.action_params:encode()
		local var4772, var4773 = protoModule.writeTag(buff, var4768, 2, protoModule.wireTypes.lengthDelimited)
		var4772, var4773 = protoModule.writeBuffer(var4772, var4773, var4771, buffer.len(var4771))
		buff = var4772
		var4768 = var4773
	end
	local buff_1 = buffer.create(var4768)
	buffer.copy(buff_1, 0, buff, 0, var4768)
	
	return buff_1
end

function t_142.decode(p280) --[[ line: 27055 ]]
	-- upvalues: t_142 (ref), protoModule (ref), t (ref)
	local var4775 = t_142.new()
	local var4776 = 0
	while var4776 < buffer.len(p280) do
		local _ = nil
		local var4777 = nil
		local var4778, var4779, var4780 = protoModule.readTag(p280, var4776)
		local var4781 = var4778
		var4777 = var4779
		var4776 = var4780
		
		if var4777 == protoModule.wireTypes.varint then
			if var4781 == 1 then
				local _ = nil
				local var4782, var4783 = protoModule.readVarIntI32(p280, var4776)
				local var4784 = var4782
				var4776 = var4783
				var4775.action_type = t.ActionType.fromNumber(var4784) or var4784
			else
				local _ = nil
				local var4785, var4786 = protoModule.readVarInt(p280, var4776)
				local _ = var4785
				var4776 = var4786
			end
		end
		if var4777 == protoModule.wireTypes.lengthDelimited then
			if var4781 == 2 then
				local _ = nil
				local var4787, var4788 = protoModule.readBuffer(p280, var4776)
				var4776 = var4788
				var4775.action_params = t.OpenSearchResultsTabAction_Params.decode(var4787)
			else
				local _ = nil
				local var4789, var4790 = protoModule.readVarInt(p280, var4776)
				var4776 = var4790 + var4789
			end
		elseif var4777 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4791, var4792 = protoModule.readFixed32(p280, var4776)
			local _ = var4791
			var4776 = var4792
		elseif var4777 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4793, var4794 = protoModule.readFixed64(p280, var4776)
			local _ = var4793
			var4776 = var4794
		else
			error("Unsupported wire type: " .. var4777)
		end
	end
	return var4775
end

function t_142:jsonEncode() --[[ line: 27103 ]]
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

function t_142:jsonDecode() --[[ line: 27125 ]]
	-- upvalues: t_142 (ref), t (ref)
	local var4796 = t_142.new()
	
	if self.action_type ~= nil then
		var4796.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4796.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4796.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4796.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.actionParams)
	end
	return var4796
end

t_142.descriptor = {
	name = "OpenSearchResultsTabAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSearchResultsTabAction"
}
t.OpenSearchResultsTabAction = t_142
typeRegistryModule.default:register(t.OpenSearchResultsTabAction)
local t_143 = {}
t_143.__index = t_143

function t_143.new(p281) --[[ line: 27165 ]]
	-- upvalues: t_143 (ref)
	return setmetatable({
		search_type = if p281 == nil or p281.search_type == nil then nil else p281.search_type
	}, t_143)
end

function t_143:encode() --[[ line: 27173 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4798 = 0
	
	if self.search_type ~= nil then
		local var4799 = self.search_type:encode()
		local var4800, var4801 = protoModule.writeTag(buff, var4798, 1, protoModule.wireTypes.lengthDelimited)
		var4800, var4801 = protoModule.writeBuffer(var4800, var4801, var4799, buffer.len(var4799))
		buff = var4800
		var4798 = var4801
	end
	local buff_1 = buffer.create(var4798)
	buffer.copy(buff_1, 0, buff, 0, var4798)
	
	return buff_1
end

function t_143.decode(p282) --[[ line: 27188 ]]
	-- upvalues: t_143 (ref), protoModule (ref), propTypesModule (ref)
	local var4803 = t_143.new()
	local var4804 = 0
	while var4804 < buffer.len(p282) do
		local _ = nil
		local var4805 = nil
		local var4806, var4807, var4808 = protoModule.readTag(p282, var4804)
		local var4809 = var4806
		var4805 = var4807
		var4804 = var4808
		
		if var4805 == protoModule.wireTypes.varint then
			local _ = nil
			local var4810, var4811 = protoModule.readVarInt(p282, var4804)
			local _ = var4810
			var4804 = var4811
			continue
		end
		if var4805 == protoModule.wireTypes.lengthDelimited then
			if var4809 == 1 then
				local _ = nil
				local var4812, var4813 = protoModule.readBuffer(p282, var4804)
				var4804 = var4813
				var4803.search_type = propTypesModule.StringProp.decode(var4812)
			else
				local _ = nil
				local var4814, var4815 = protoModule.readVarInt(p282, var4804)
				var4804 = var4815 + var4814
			end
		elseif var4805 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4816, var4817 = protoModule.readFixed32(p282, var4804)
			local _ = var4816
			var4804 = var4817
		elseif var4805 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4818, var4819 = protoModule.readFixed64(p282, var4804)
			local _ = var4818
			var4804 = var4819
		else
			error("Unsupported wire type: " .. var4805)
		end
	end
	return var4803
end

function t_143:jsonEncode() --[[ line: 27231 ]]
	local t = {}
	
	if self.search_type ~= nil then
		t.searchType = self.search_type:jsonEncode()
	end
	return t
end

function t_143:jsonDecode() --[[ line: 27241 ]]
	-- upvalues: t_143 (ref), propTypesModule (ref)
	local var4821 = t_143.new()
	
	if self.search_type ~= nil then
		var4821.search_type = propTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		var4821.search_type = propTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return var4821
end

t_143.descriptor = {
	name = "OpenSearchResultsTabAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSearchResultsTabAction_Params = t_143
typeRegistryModule.default:register(t.OpenSearchResultsTabAction_Params)
local t_144 = {}
t_144.__index = t_144

function t_144.new(p283) --[[ line: 27272 ]]
	-- upvalues: t (ref), t_144 (ref)
	return setmetatable({
		action_type = if p283 == nil or p283.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p283.action_type,
		action_params = if p283 == nil or p283.action_params == nil then nil else p283.action_params
	}, t_144)
end

function t_144:encode() --[[ line: 27281 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4823 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4824, var4825 = protoModule.writeTag(buff, var4823, 1, protoModule.wireTypes.varint)
		var4824, var4825 = protoModule.writeVarInt(var4824, var4825, t.ActionType.toNumber(self.action_type))
		buff = var4824
		var4823 = var4825
	end
	if self.action_params ~= nil then
		local var4826 = self.action_params:encode()
		local var4827, var4828 = protoModule.writeTag(buff, var4823, 2, protoModule.wireTypes.lengthDelimited)
		var4827, var4828 = protoModule.writeBuffer(var4827, var4828, var4826, buffer.len(var4826))
		buff = var4827
		var4823 = var4828
	end
	local buff_1 = buffer.create(var4823)
	buffer.copy(buff_1, 0, buff, 0, var4823)
	
	return buff_1
end

function t_144.decode(p284) --[[ line: 27307 ]]
	-- upvalues: t_144 (ref), protoModule (ref), t (ref)
	local var4830 = t_144.new()
	local var4831 = 0
	while var4831 < buffer.len(p284) do
		local _ = nil
		local var4832 = nil
		local var4833, var4834, var4835 = protoModule.readTag(p284, var4831)
		local var4836 = var4833
		var4832 = var4834
		var4831 = var4835
		
		if var4832 == protoModule.wireTypes.varint then
			if var4836 == 1 then
				local _ = nil
				local var4837, var4838 = protoModule.readVarIntI32(p284, var4831)
				local var4839 = var4837
				var4831 = var4838
				var4830.action_type = t.ActionType.fromNumber(var4839) or var4839
			else
				local _ = nil
				local var4840, var4841 = protoModule.readVarInt(p284, var4831)
				local _ = var4840
				var4831 = var4841
			end
		end
		if var4832 == protoModule.wireTypes.lengthDelimited then
			if var4836 == 2 then
				local _ = nil
				local var4842, var4843 = protoModule.readBuffer(p284, var4831)
				var4831 = var4843
				var4830.action_params = t.DismissPromptAction_Params.decode(var4842)
			else
				local _ = nil
				local var4844, var4845 = protoModule.readVarInt(p284, var4831)
				var4831 = var4845 + var4844
			end
		elseif var4832 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4846, var4847 = protoModule.readFixed32(p284, var4831)
			local _ = var4846
			var4831 = var4847
		elseif var4832 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4848, var4849 = protoModule.readFixed64(p284, var4831)
			local _ = var4848
			var4831 = var4849
		else
			error("Unsupported wire type: " .. var4832)
		end
	end
	return var4830
end

function t_144:jsonEncode() --[[ line: 27355 ]]
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

function t_144:jsonDecode() --[[ line: 27377 ]]
	-- upvalues: t_144 (ref), t (ref)
	local var4851 = t_144.new()
	
	if self.action_type ~= nil then
		var4851.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4851.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4851.action_params = t.DismissPromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4851.action_params = t.DismissPromptAction_Params.jsonDecode(self.actionParams)
	end
	return var4851
end

t_144.descriptor = {
	name = "DismissPromptAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissPromptAction"
}
t.DismissPromptAction = t_144
typeRegistryModule.default:register(t.DismissPromptAction)
local t_145 = {}
t_145.__index = t_145

function t_145.new(p285) --[[ line: 27417 ]]
	-- upvalues: t_145 (ref)
	return setmetatable({
		prompt_type = if p285 == nil or p285.prompt_type == nil then nil else p285.prompt_type,
		prompt_id = if p285 == nil or p285.prompt_id == nil then nil else p285.prompt_id,
		entity_type = if p285 == nil or p285.entity_type == nil then nil else p285.entity_type,
		entity_id = if p285 == nil or p285.entity_id == nil then nil else p285.entity_id
	}, t_145)
end

function t_145:encode() --[[ line: 27428 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4853 = 0
	
	if self.prompt_type ~= nil then
		local var4854 = self.prompt_type:encode()
		local var4855, var4856 = protoModule.writeTag(buff, var4853, 1, protoModule.wireTypes.lengthDelimited)
		var4855, var4856 = protoModule.writeBuffer(var4855, var4856, var4854, buffer.len(var4854))
		buff = var4855
		var4853 = var4856
	end
	if self.prompt_id ~= nil then
		local var4857 = self.prompt_id:encode()
		local var4858, var4859 = protoModule.writeTag(buff, var4853, 2, protoModule.wireTypes.lengthDelimited)
		var4858, var4859 = protoModule.writeBuffer(var4858, var4859, var4857, buffer.len(var4857))
		buff = var4858
		var4853 = var4859
	end
	if self.entity_type ~= nil then
		local var4860 = self.entity_type:encode()
		local var4861, var4862 = protoModule.writeTag(buff, var4853, 3, protoModule.wireTypes.lengthDelimited)
		var4861, var4862 = protoModule.writeBuffer(var4861, var4862, var4860, buffer.len(var4860))
		buff = var4861
		var4853 = var4862
	end
	if self.entity_id ~= nil then
		local var4863 = self.entity_id:encode()
		local var4864, var4865 = protoModule.writeTag(buff, var4853, 4, protoModule.wireTypes.lengthDelimited)
		var4864, var4865 = protoModule.writeBuffer(var4864, var4865, var4863, buffer.len(var4863))
		buff = var4864
		var4853 = var4865
	end
	local buff_1 = buffer.create(var4853)
	buffer.copy(buff_1, 0, buff, 0, var4853)
	
	return buff_1
end

function t_145.decode(p286) --[[ line: 27461 ]]
	-- upvalues: t_145 (ref), protoModule (ref), propTypesModule (ref)
	local var4867 = t_145.new()
	local var4868 = 0
	while var4868 < buffer.len(p286) do
		local _ = nil
		local var4869 = nil
		local var4870, var4871, var4872 = protoModule.readTag(p286, var4868)
		local var4873 = var4870
		var4869 = var4871
		var4868 = var4872
		
		if var4869 == protoModule.wireTypes.varint then
			local _ = nil
			local var4874, var4875 = protoModule.readVarInt(p286, var4868)
			local _ = var4874
			var4868 = var4875
			continue
		end
		if var4869 == protoModule.wireTypes.lengthDelimited then
			if var4873 == 1 then
				local _ = nil
				local var4876, var4877 = protoModule.readBuffer(p286, var4868)
				var4868 = var4877
				var4867.prompt_type = propTypesModule.StringProp.decode(var4876)
			elseif var4873 == 2 then
				local _ = nil
				local var4878, var4879 = protoModule.readBuffer(p286, var4868)
				var4868 = var4879
				var4867.prompt_id = propTypesModule.StringProp.decode(var4878)
			elseif var4873 == 3 then
				local _ = nil
				local var4880, var4881 = protoModule.readBuffer(p286, var4868)
				var4868 = var4881
				var4867.entity_type = propTypesModule.StringProp.decode(var4880)
			elseif var4873 == 4 then
				local _ = nil
				local var4882, var4883 = protoModule.readBuffer(p286, var4868)
				var4868 = var4883
				var4867.entity_id = propTypesModule.StringProp.decode(var4882)
			else
				local _ = nil
				local var4884, var4885 = protoModule.readVarInt(p286, var4868)
				var4868 = var4885 + var4884
			end
		elseif var4869 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4886, var4887 = protoModule.readFixed32(p286, var4868)
			local _ = var4886
			var4868 = var4887
		elseif var4869 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4888, var4889 = protoModule.readFixed64(p286, var4868)
			local _ = var4888
			var4868 = var4889
		else
			error("Unsupported wire type: " .. var4869)
		end
	end
	return var4867
end

function t_145:jsonEncode() --[[ line: 27519 ]]
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

function t_145:jsonDecode() --[[ line: 27541 ]]
	-- upvalues: t_145 (ref), propTypesModule (ref)
	local var4891 = t_145.new()
	
	if self.prompt_type ~= nil then
		var4891.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var4891.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var4891.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var4891.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.entity_type ~= nil then
		var4891.entity_type = propTypesModule.StringProp.jsonDecode(self.entity_type)
	end
	if self.entityType ~= nil then
		var4891.entity_type = propTypesModule.StringProp.jsonDecode(self.entityType)
	end
	if self.entity_id ~= nil then
		var4891.entity_id = propTypesModule.StringProp.jsonDecode(self.entity_id)
	end
	if self.entityId ~= nil then
		var4891.entity_id = propTypesModule.StringProp.jsonDecode(self.entityId)
	end
	return var4891
end

t_145.descriptor = {
	name = "DismissPromptAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissPromptAction_Params = t_145
typeRegistryModule.default:register(t.DismissPromptAction_Params)
local t_146 = {}
t_146.__index = t_146

function t_146.new(p287) --[[ line: 27596 ]]
	-- upvalues: t (ref), t_146 (ref)
	return setmetatable({
		action_type = if p287 == nil or p287.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p287.action_type,
		action_params = if p287 == nil or p287.action_params == nil then nil else p287.action_params
	}, t_146)
end

function t_146:encode() --[[ line: 27610 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4893 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4894, var4895 = protoModule.writeTag(buff, var4893, 1, protoModule.wireTypes.varint)
		var4894, var4895 = protoModule.writeVarInt(var4894, var4895, t.ActionType.toNumber(self.action_type))
		buff = var4894
		var4893 = var4895
	end
	if self.action_params ~= nil then
		local var4896 = self.action_params:encode()
		local var4897, var4898 = protoModule.writeTag(buff, var4893, 2, protoModule.wireTypes.lengthDelimited)
		var4897, var4898 = protoModule.writeBuffer(var4897, var4898, var4896, buffer.len(var4896))
		buff = var4897
		var4893 = var4898
	end
	local buff_1 = buffer.create(var4893)
	buffer.copy(buff_1, 0, buff, 0, var4893)
	
	return buff_1
end

function t_146.decode(p288) --[[ line: 27638 ]]
	-- upvalues: t_146 (ref), protoModule (ref), t (ref)
	local var4900 = t_146.new()
	local var4901 = 0
	while var4901 < buffer.len(p288) do
		local _ = nil
		local var4902 = nil
		local var4903, var4904, var4905 = protoModule.readTag(p288, var4901)
		local var4906 = var4903
		var4902 = var4904
		var4901 = var4905
		
		if var4902 == protoModule.wireTypes.varint then
			if var4906 == 1 then
				local _ = nil
				local var4907, var4908 = protoModule.readVarIntI32(p288, var4901)
				local var4909 = var4907
				var4901 = var4908
				var4900.action_type = t.ActionType.fromNumber(var4909) or var4909
			else
				local _ = nil
				local var4910, var4911 = protoModule.readVarInt(p288, var4901)
				local _ = var4910
				var4901 = var4911
			end
		end
		if var4902 == protoModule.wireTypes.lengthDelimited then
			if var4906 == 2 then
				local _ = nil
				local var4912, var4913 = protoModule.readBuffer(p288, var4901)
				var4901 = var4913
				var4900.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.decode(var4912)
			else
				local _ = nil
				local var4914, var4915 = protoModule.readVarInt(p288, var4901)
				var4901 = var4915 + var4914
			end
		elseif var4902 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4916, var4917 = protoModule.readFixed32(p288, var4901)
			local _ = var4916
			var4901 = var4917
		elseif var4902 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4918, var4919 = protoModule.readFixed64(p288, var4901)
			local _ = var4918
			var4901 = var4919
		else
			error("Unsupported wire type: " .. var4902)
		end
	end
	return var4900
end

function t_146:jsonEncode() --[[ line: 27689 ]]
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

function t_146:jsonDecode() --[[ line: 27713 ]]
	-- upvalues: t_146 (ref), t (ref)
	local var4921 = t_146.new()
	
	if self.action_type ~= nil then
		var4921.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4921.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4921.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4921.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.actionParams)
	end
	return var4921
end

t_146.descriptor = {
	name = "RecordPartyChatConversationUpsellAcknowledgementAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecordPartyChatConversationUpsellAcknowledgementAction"
}
t.RecordPartyChatConversationUpsellAcknowledgementAction = t_146
typeRegistryModule.default:register(t.RecordPartyChatConversationUpsellAcknowledgementAction)
local t_147 = {}
t_147.__index = t_147

function t_147.new(p289) --[[ line: 27759 ]]
	-- upvalues: t_147 (ref)
	return setmetatable({
		modal_action = if p289 == nil or p289.modal_action == nil then nil else p289.modal_action,
		modal_variant = if p289 == nil or p289.modal_variant == nil then nil else p289.modal_variant,
		modal_sequence = if p289 == nil or p289.modal_sequence == nil then nil else p289.modal_sequence,
		conversation_id = if p289 == nil or p289.conversation_id == nil then nil else p289.conversation_id,
		friend_id = if p289 == nil or p289.friend_id == nil then nil else p289.friend_id
	}, t_147)
end

function t_147:encode() --[[ line: 27774 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4923 = 0
	
	if self.modal_action ~= nil then
		local var4924 = self.modal_action:encode()
		local var4925, var4926 = protoModule.writeTag(buff, var4923, 1, protoModule.wireTypes.lengthDelimited)
		var4925, var4926 = protoModule.writeBuffer(var4925, var4926, var4924, buffer.len(var4924))
		buff = var4925
		var4923 = var4926
	end
	if self.modal_variant ~= nil then
		local var4927 = self.modal_variant:encode()
		local var4928, var4929 = protoModule.writeTag(buff, var4923, 2, protoModule.wireTypes.lengthDelimited)
		var4928, var4929 = protoModule.writeBuffer(var4928, var4929, var4927, buffer.len(var4927))
		buff = var4928
		var4923 = var4929
	end
	if self.modal_sequence ~= nil then
		local var4930 = self.modal_sequence:encode()
		local var4931, var4932 = protoModule.writeTag(buff, var4923, 3, protoModule.wireTypes.lengthDelimited)
		var4931, var4932 = protoModule.writeBuffer(var4931, var4932, var4930, buffer.len(var4930))
		buff = var4931
		var4923 = var4932
	end
	if self.conversation_id ~= nil then
		local var4933 = self.conversation_id:encode()
		local var4934, var4935 = protoModule.writeTag(buff, var4923, 4, protoModule.wireTypes.lengthDelimited)
		var4934, var4935 = protoModule.writeBuffer(var4934, var4935, var4933, buffer.len(var4933))
		buff = var4934
		var4923 = var4935
	end
	if self.friend_id ~= nil then
		local var4936 = self.friend_id:encode()
		local var4937, var4938 = protoModule.writeTag(buff, var4923, 5, protoModule.wireTypes.lengthDelimited)
		var4937, var4938 = protoModule.writeBuffer(var4937, var4938, var4936, buffer.len(var4936))
		buff = var4937
		var4923 = var4938
	end
	local buff_1 = buffer.create(var4923)
	buffer.copy(buff_1, 0, buff, 0, var4923)
	
	return buff_1
end

function t_147.decode(p290) --[[ line: 27815 ]]
	-- upvalues: t_147 (ref), protoModule (ref), propTypesModule (ref)
	local var4940 = t_147.new()
	local var4941 = 0
	while var4941 < buffer.len(p290) do
		local _ = nil
		local var4942 = nil
		local var4943, var4944, var4945 = protoModule.readTag(p290, var4941)
		local var4946 = var4943
		var4942 = var4944
		var4941 = var4945
		
		if var4942 == protoModule.wireTypes.varint then
			local _ = nil
			local var4947, var4948 = protoModule.readVarInt(p290, var4941)
			local _ = var4947
			var4941 = var4948
			continue
		end
		if var4942 == protoModule.wireTypes.lengthDelimited then
			if var4946 == 1 then
				local _ = nil
				local var4949, var4950 = protoModule.readBuffer(p290, var4941)
				var4941 = var4950
				var4940.modal_action = propTypesModule.StringProp.decode(var4949)
			elseif var4946 == 2 then
				local _ = nil
				local var4951, var4952 = protoModule.readBuffer(p290, var4941)
				var4941 = var4952
				var4940.modal_variant = propTypesModule.StringProp.decode(var4951)
			elseif var4946 == 3 then
				local _ = nil
				local var4953, var4954 = protoModule.readBuffer(p290, var4941)
				var4941 = var4954
				var4940.modal_sequence = propTypesModule.StringProp.decode(var4953)
			elseif var4946 == 4 then
				local _ = nil
				local var4955, var4956 = protoModule.readBuffer(p290, var4941)
				var4941 = var4956
				var4940.conversation_id = propTypesModule.StringProp.decode(var4955)
			elseif var4946 == 5 then
				local _ = nil
				local var4957, var4958 = protoModule.readBuffer(p290, var4941)
				var4941 = var4958
				var4940.friend_id = propTypesModule.StringProp.decode(var4957)
			else
				local _ = nil
				local var4959, var4960 = protoModule.readVarInt(p290, var4941)
				var4941 = var4960 + var4959
			end
		elseif var4942 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4961, var4962 = protoModule.readFixed32(p290, var4941)
			local _ = var4961
			var4941 = var4962
		elseif var4942 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4963, var4964 = protoModule.readFixed64(p290, var4941)
			local _ = var4963
			var4941 = var4964
		else
			error("Unsupported wire type: " .. var4942)
		end
	end
	return var4940
end

function t_147:jsonEncode() --[[ line: 27880 ]]
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

function t_147:jsonDecode() --[[ line: 27908 ]]
	-- upvalues: t_147 (ref), propTypesModule (ref)
	local var4966 = t_147.new()
	
	if self.modal_action ~= nil then
		var4966.modal_action = propTypesModule.StringProp.jsonDecode(self.modal_action)
	end
	if self.modalAction ~= nil then
		var4966.modal_action = propTypesModule.StringProp.jsonDecode(self.modalAction)
	end
	if self.modal_variant ~= nil then
		var4966.modal_variant = propTypesModule.StringProp.jsonDecode(self.modal_variant)
	end
	if self.modalVariant ~= nil then
		var4966.modal_variant = propTypesModule.StringProp.jsonDecode(self.modalVariant)
	end
	if self.modal_sequence ~= nil then
		var4966.modal_sequence = propTypesModule.StringProp.jsonDecode(self.modal_sequence)
	end
	if self.modalSequence ~= nil then
		var4966.modal_sequence = propTypesModule.StringProp.jsonDecode(self.modalSequence)
	end
	if self.conversation_id ~= nil then
		var4966.conversation_id = propTypesModule.StringProp.jsonDecode(self.conversation_id)
	end
	if self.conversationId ~= nil then
		var4966.conversation_id = propTypesModule.StringProp.jsonDecode(self.conversationId)
	end
	if self.friend_id ~= nil then
		var4966.friend_id = propTypesModule.StringProp.jsonDecode(self.friend_id)
	end
	if self.friendId ~= nil then
		var4966.friend_id = propTypesModule.StringProp.jsonDecode(self.friendId)
	end
	return var4966
end

t_147.descriptor = {
	name = "RecordPartyChatConversationUpsellAcknowledgementAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RecordPartyChatConversationUpsellAcknowledgementAction_Params = t_147
typeRegistryModule.default:register(t.RecordPartyChatConversationUpsellAcknowledgementAction_Params)
local t_148 = {}
t_148.__index = t_148

function t_148.new(p291) --[[ line: 27979 ]]
	-- upvalues: t (ref), t_148 (ref)
	return setmetatable({
		action_type = if p291 == nil or p291.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p291.action_type,
		action_params = if p291 == nil or p291.action_params == nil then nil else p291.action_params
	}, t_148)
end

function t_148:encode() --[[ line: 27988 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var4968 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var4969, var4970 = protoModule.writeTag(buff, var4968, 1, protoModule.wireTypes.varint)
		var4969, var4970 = protoModule.writeVarInt(var4969, var4970, t.ActionType.toNumber(self.action_type))
		buff = var4969
		var4968 = var4970
	end
	if self.action_params ~= nil then
		local var4971 = self.action_params:encode()
		local var4972, var4973 = protoModule.writeTag(buff, var4968, 2, protoModule.wireTypes.lengthDelimited)
		var4972, var4973 = protoModule.writeBuffer(var4972, var4973, var4971, buffer.len(var4971))
		buff = var4972
		var4968 = var4973
	end
	local buff_1 = buffer.create(var4968)
	buffer.copy(buff_1, 0, buff, 0, var4968)
	
	return buff_1
end

function t_148.decode(p292) --[[ line: 28014 ]]
	-- upvalues: t_148 (ref), protoModule (ref), t (ref)
	local var4975 = t_148.new()
	local var4976 = 0
	while var4976 < buffer.len(p292) do
		local _ = nil
		local var4977 = nil
		local var4978, var4979, var4980 = protoModule.readTag(p292, var4976)
		local var4981 = var4978
		var4977 = var4979
		var4976 = var4980
		
		if var4977 == protoModule.wireTypes.varint then
			if var4981 == 1 then
				local _ = nil
				local var4982, var4983 = protoModule.readVarIntI32(p292, var4976)
				local var4984 = var4982
				var4976 = var4983
				var4975.action_type = t.ActionType.fromNumber(var4984) or var4984
			else
				local _ = nil
				local var4985, var4986 = protoModule.readVarInt(p292, var4976)
				local _ = var4985
				var4976 = var4986
			end
		end
		if var4977 == protoModule.wireTypes.lengthDelimited then
			if var4981 == 2 then
				local _ = nil
				local var4987, var4988 = protoModule.readBuffer(p292, var4976)
				var4976 = var4988
				var4975.action_params = t.RequestFriendshipAction_Params.decode(var4987)
			else
				local _ = nil
				local var4989, var4990 = protoModule.readVarInt(p292, var4976)
				var4976 = var4990 + var4989
			end
		elseif var4977 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4991, var4992 = protoModule.readFixed32(p292, var4976)
			local _ = var4991
			var4976 = var4992
		elseif var4977 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4993, var4994 = protoModule.readFixed64(p292, var4976)
			local _ = var4993
			var4976 = var4994
		else
			error("Unsupported wire type: " .. var4977)
		end
	end
	return var4975
end

function t_148:jsonEncode() --[[ line: 28062 ]]
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

function t_148:jsonDecode() --[[ line: 28084 ]]
	-- upvalues: t_148 (ref), t (ref)
	local var4996 = t_148.new()
	
	if self.action_type ~= nil then
		var4996.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var4996.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var4996.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var4996.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.actionParams)
	end
	return var4996
end

t_148.descriptor = {
	name = "RequestFriendshipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RequestFriendshipAction"
}
t.RequestFriendshipAction = t_148
typeRegistryModule.default:register(t.RequestFriendshipAction)
local t_149 = {}
t_149.__index = t_149

function t_149.new(p293) --[[ line: 28124 ]]
	-- upvalues: t_149 (ref)
	return setmetatable({
		target_user_id = if p293 == nil or p293.target_user_id == nil then nil else p293.target_user_id,
		source = if p293 == nil or p293.source == nil then nil else p293.source
	}, t_149)
end

function t_149:encode() --[[ line: 28133 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4998 = 0
	
	if self.target_user_id ~= nil then
		local var4999 = self.target_user_id:encode()
		local var5000, var5001 = protoModule.writeTag(buff, var4998, 1, protoModule.wireTypes.lengthDelimited)
		var5000, var5001 = protoModule.writeBuffer(var5000, var5001, var4999, buffer.len(var4999))
		buff = var5000
		var4998 = var5001
	end
	if self.source ~= nil then
		local var5002 = self.source:encode()
		local var5003, var5004 = protoModule.writeTag(buff, var4998, 2, protoModule.wireTypes.lengthDelimited)
		var5003, var5004 = protoModule.writeBuffer(var5003, var5004, var5002, buffer.len(var5002))
		buff = var5003
		var4998 = var5004
	end
	local buff_1 = buffer.create(var4998)
	buffer.copy(buff_1, 0, buff, 0, var4998)
	
	return buff_1
end

function t_149.decode(p294) --[[ line: 28154 ]]
	-- upvalues: t_149 (ref), protoModule (ref), propTypesModule (ref)
	local var5006 = t_149.new()
	local var5007 = 0
	while var5007 < buffer.len(p294) do
		local _ = nil
		local var5008 = nil
		local var5009, var5010, var5011 = protoModule.readTag(p294, var5007)
		local var5012 = var5009
		var5008 = var5010
		var5007 = var5011
		
		if var5008 == protoModule.wireTypes.varint then
			local _ = nil
			local var5013, var5014 = protoModule.readVarInt(p294, var5007)
			local _ = var5013
			var5007 = var5014
			continue
		end
		if var5008 == protoModule.wireTypes.lengthDelimited then
			if var5012 == 1 then
				local _ = nil
				local var5015, var5016 = protoModule.readBuffer(p294, var5007)
				var5007 = var5016
				var5006.target_user_id = propTypesModule.StringProp.decode(var5015)
			elseif var5012 == 2 then
				local _ = nil
				local var5017, var5018 = protoModule.readBuffer(p294, var5007)
				var5007 = var5018
				var5006.source = propTypesModule.StringProp.decode(var5017)
			else
				local _ = nil
				local var5019, var5020 = protoModule.readVarInt(p294, var5007)
				var5007 = var5020 + var5019
			end
		elseif var5008 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5021, var5022 = protoModule.readFixed32(p294, var5007)
			local _ = var5021
			var5007 = var5022
		elseif var5008 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5023, var5024 = protoModule.readFixed64(p294, var5007)
			local _ = var5023
			var5007 = var5024
		else
			error("Unsupported wire type: " .. var5008)
		end
	end
	return var5006
end

function t_149:jsonEncode() --[[ line: 28202 ]]
	local t = {}
	
	if self.target_user_id ~= nil then
		t.targetUserId = self.target_user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_149:jsonDecode() --[[ line: 28216 ]]
	-- upvalues: t_149 (ref), propTypesModule (ref)
	local var5026 = t_149.new()
	
	if self.target_user_id ~= nil then
		var5026.target_user_id = propTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		var5026.target_user_id = propTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	if self.source ~= nil then
		var5026.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var5026
end

t_149.descriptor = {
	name = "RequestFriendshipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RequestFriendshipAction_Params = t_149
typeRegistryModule.default:register(t.RequestFriendshipAction_Params)
local t_150 = {}
t_150.__index = t_150

function t_150.new(p295) --[[ line: 28250 ]]
	-- upvalues: t (ref), t_150 (ref)
	return setmetatable({
		action_type = if p295 == nil or p295.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p295.action_type,
		action_params = if p295 == nil or p295.action_params == nil then nil else p295.action_params
	}, t_150)
end

function t_150:encode() --[[ line: 28261 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5028 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5029, var5030 = protoModule.writeTag(buff, var5028, 1, protoModule.wireTypes.varint)
		var5029, var5030 = protoModule.writeVarInt(var5029, var5030, t.ActionType.toNumber(self.action_type))
		buff = var5029
		var5028 = var5030
	end
	if self.action_params ~= nil then
		local var5031 = self.action_params:encode()
		local var5032, var5033 = protoModule.writeTag(buff, var5028, 2, protoModule.wireTypes.lengthDelimited)
		var5032, var5033 = protoModule.writeBuffer(var5032, var5033, var5031, buffer.len(var5031))
		buff = var5032
		var5028 = var5033
	end
	local buff_1 = buffer.create(var5028)
	buffer.copy(buff_1, 0, buff, 0, var5028)
	
	return buff_1
end

function t_150.decode(p296) --[[ line: 28287 ]]
	-- upvalues: t_150 (ref), protoModule (ref), t (ref)
	local var5035 = t_150.new()
	local var5036 = 0
	while var5036 < buffer.len(p296) do
		local _ = nil
		local var5037 = nil
		local var5038, var5039, var5040 = protoModule.readTag(p296, var5036)
		local var5041 = var5038
		var5037 = var5039
		var5036 = var5040
		
		if var5037 == protoModule.wireTypes.varint then
			if var5041 == 1 then
				local _ = nil
				local var5042, var5043 = protoModule.readVarIntI32(p296, var5036)
				local var5044 = var5042
				var5036 = var5043
				var5035.action_type = t.ActionType.fromNumber(var5044) or var5044
			else
				local _ = nil
				local var5045, var5046 = protoModule.readVarInt(p296, var5036)
				local _ = var5045
				var5036 = var5046
			end
		end
		if var5037 == protoModule.wireTypes.lengthDelimited then
			if var5041 == 2 then
				local _ = nil
				local var5047, var5048 = protoModule.readBuffer(p296, var5036)
				var5036 = var5048
				var5035.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.decode(var5047)
			else
				local _ = nil
				local var5049, var5050 = protoModule.readVarInt(p296, var5036)
				var5036 = var5050 + var5049
			end
		elseif var5037 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5051, var5052 = protoModule.readFixed32(p296, var5036)
			local _ = var5051
			var5036 = var5052
		elseif var5037 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5053, var5054 = protoModule.readFixed64(p296, var5036)
			local _ = var5053
			var5036 = var5054
		else
			error("Unsupported wire type: " .. var5037)
		end
	end
	return var5035
end

function t_150:jsonEncode() --[[ line: 28335 ]]
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

function t_150:jsonDecode() --[[ line: 28357 ]]
	-- upvalues: t_150 (ref), t (ref)
	local var5056 = t_150.new()
	
	if self.action_type ~= nil then
		var5056.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5056.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5056.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5056.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var5056
end

t_150.descriptor = {
	name = "OpenTrustedFriendsUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenTrustedFriendsUpsellModalAction"
}
t.OpenTrustedFriendsUpsellModalAction = t_150
typeRegistryModule.default:register(t.OpenTrustedFriendsUpsellModalAction)
local t_151 = {}
t_151.__index = t_151

function t_151.new(p297) --[[ line: 28399 ]]
	-- upvalues: t_151 (ref)
	return setmetatable({
		target_user_id = if p297 == nil or p297.target_user_id == nil then nil else p297.target_user_id
	}, t_151)
end

function t_151:encode() --[[ line: 28407 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5058 = 0
	
	if self.target_user_id ~= nil then
		local var5059 = self.target_user_id:encode()
		local var5060, var5061 = protoModule.writeTag(buff, var5058, 1, protoModule.wireTypes.lengthDelimited)
		var5060, var5061 = protoModule.writeBuffer(var5060, var5061, var5059, buffer.len(var5059))
		buff = var5060
		var5058 = var5061
	end
	local buff_1 = buffer.create(var5058)
	buffer.copy(buff_1, 0, buff, 0, var5058)
	
	return buff_1
end

function t_151.decode(p298) --[[ line: 28424 ]]
	-- upvalues: t_151 (ref), protoModule (ref), propTypesModule (ref)
	local var5063 = t_151.new()
	local var5064 = 0
	while var5064 < buffer.len(p298) do
		local _ = nil
		local var5065 = nil
		local var5066, var5067, var5068 = protoModule.readTag(p298, var5064)
		local var5069 = var5066
		var5065 = var5067
		var5064 = var5068
		
		if var5065 == protoModule.wireTypes.varint then
			local _ = nil
			local var5070, var5071 = protoModule.readVarInt(p298, var5064)
			local _ = var5070
			var5064 = var5071
			continue
		end
		if var5065 == protoModule.wireTypes.lengthDelimited then
			if var5069 == 1 then
				local _ = nil
				local var5072, var5073 = protoModule.readBuffer(p298, var5064)
				var5064 = var5073
				var5063.target_user_id = propTypesModule.StringProp.decode(var5072)
			else
				local _ = nil
				local var5074, var5075 = protoModule.readVarInt(p298, var5064)
				var5064 = var5075 + var5074
			end
		elseif var5065 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5076, var5077 = protoModule.readFixed32(p298, var5064)
			local _ = var5076
			var5064 = var5077
		elseif var5065 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5078, var5079 = protoModule.readFixed64(p298, var5064)
			local _ = var5078
			var5064 = var5079
		else
			error("Unsupported wire type: " .. var5065)
		end
	end
	return var5063
end

function t_151:jsonEncode() --[[ line: 28469 ]]
	local t = {}
	
	if self.target_user_id ~= nil then
		t.targetUserId = self.target_user_id:jsonEncode()
	end
	return t
end

function t_151:jsonDecode() --[[ line: 28481 ]]
	-- upvalues: t_151 (ref), propTypesModule (ref)
	local var5081 = t_151.new()
	
	if self.target_user_id ~= nil then
		var5081.target_user_id = propTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		var5081.target_user_id = propTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	return var5081
end

t_151.descriptor = {
	name = "OpenTrustedFriendsUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenTrustedFriendsUpsellModalAction_Params = t_151
typeRegistryModule.default:register(t.OpenTrustedFriendsUpsellModalAction_Params)
local t_152 = {}
t_152.__index = t_152

function t_152.new(p299) --[[ line: 28513 ]]
	-- upvalues: t (ref), t_152 (ref)
	return setmetatable({
		action_type = if p299 == nil or p299.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p299.action_type,
		action_params = if p299 == nil or p299.action_params == nil then nil else p299.action_params
	}, t_152)
end

function t_152:encode() --[[ line: 28524 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5083 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5084, var5085 = protoModule.writeTag(buff, var5083, 1, protoModule.wireTypes.varint)
		var5084, var5085 = protoModule.writeVarInt(var5084, var5085, t.ActionType.toNumber(self.action_type))
		buff = var5084
		var5083 = var5085
	end
	if self.action_params ~= nil then
		local var5086 = self.action_params:encode()
		local var5087, var5088 = protoModule.writeTag(buff, var5083, 2, protoModule.wireTypes.lengthDelimited)
		var5087, var5088 = protoModule.writeBuffer(var5087, var5088, var5086, buffer.len(var5086))
		buff = var5087
		var5083 = var5088
	end
	local buff_1 = buffer.create(var5083)
	buffer.copy(buff_1, 0, buff, 0, var5083)
	
	return buff_1
end

function t_152.decode(p300) --[[ line: 28550 ]]
	-- upvalues: t_152 (ref), protoModule (ref), t (ref)
	local var5090 = t_152.new()
	local var5091 = 0
	while var5091 < buffer.len(p300) do
		local _ = nil
		local var5092 = nil
		local var5093, var5094, var5095 = protoModule.readTag(p300, var5091)
		local var5096 = var5093
		var5092 = var5094
		var5091 = var5095
		
		if var5092 == protoModule.wireTypes.varint then
			if var5096 == 1 then
				local _ = nil
				local var5097, var5098 = protoModule.readVarIntI32(p300, var5091)
				local var5099 = var5097
				var5091 = var5098
				var5090.action_type = t.ActionType.fromNumber(var5099) or var5099
			else
				local _ = nil
				local var5100, var5101 = protoModule.readVarInt(p300, var5091)
				local _ = var5100
				var5091 = var5101
			end
		end
		if var5092 == protoModule.wireTypes.lengthDelimited then
			if var5096 == 2 then
				local _ = nil
				local var5102, var5103 = protoModule.readBuffer(p300, var5091)
				var5091 = var5103
				var5090.action_params = t.OpenSearchResultsWithQueryAction_Params.decode(var5102)
			else
				local _ = nil
				local var5104, var5105 = protoModule.readVarInt(p300, var5091)
				var5091 = var5105 + var5104
			end
		elseif var5092 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5106, var5107 = protoModule.readFixed32(p300, var5091)
			local _ = var5106
			var5091 = var5107
		elseif var5092 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5108, var5109 = protoModule.readFixed64(p300, var5091)
			local _ = var5108
			var5091 = var5109
		else
			error("Unsupported wire type: " .. var5092)
		end
	end
	return var5090
end

function t_152:jsonEncode() --[[ line: 28598 ]]
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

function t_152:jsonDecode() --[[ line: 28620 ]]
	-- upvalues: t_152 (ref), t (ref)
	local var5111 = t_152.new()
	
	if self.action_type ~= nil then
		var5111.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5111.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5111.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5111.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.actionParams)
	end
	return var5111
end

t_152.descriptor = {
	name = "OpenSearchResultsWithQueryAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSearchResultsWithQueryAction"
}
t.OpenSearchResultsWithQueryAction = t_152
typeRegistryModule.default:register(t.OpenSearchResultsWithQueryAction)
local t_153 = {}
t_153.__index = t_153

function t_153.new(p301) --[[ line: 28662 ]]
	-- upvalues: t_153 (ref)
	return setmetatable({
		search_query = if p301 == nil or p301.search_query == nil then nil else p301.search_query,
		search_type = if p301 == nil or p301.search_type == nil then nil else p301.search_type
	}, t_153)
end

function t_153:encode() --[[ line: 28671 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5113 = 0
	
	if self.search_query ~= nil then
		local var5114 = self.search_query:encode()
		local var5115, var5116 = protoModule.writeTag(buff, var5113, 1, protoModule.wireTypes.lengthDelimited)
		var5115, var5116 = protoModule.writeBuffer(var5115, var5116, var5114, buffer.len(var5114))
		buff = var5115
		var5113 = var5116
	end
	if self.search_type ~= nil then
		local var5117 = self.search_type:encode()
		local var5118, var5119 = protoModule.writeTag(buff, var5113, 2, protoModule.wireTypes.lengthDelimited)
		var5118, var5119 = protoModule.writeBuffer(var5118, var5119, var5117, buffer.len(var5117))
		buff = var5118
		var5113 = var5119
	end
	local buff_1 = buffer.create(var5113)
	buffer.copy(buff_1, 0, buff, 0, var5113)
	
	return buff_1
end

function t_153.decode(p302) --[[ line: 28692 ]]
	-- upvalues: t_153 (ref), protoModule (ref), propTypesModule (ref)
	local var5121 = t_153.new()
	local var5122 = 0
	while var5122 < buffer.len(p302) do
		local _ = nil
		local var5123 = nil
		local var5124, var5125, var5126 = protoModule.readTag(p302, var5122)
		local var5127 = var5124
		var5123 = var5125
		var5122 = var5126
		
		if var5123 == protoModule.wireTypes.varint then
			local _ = nil
			local var5128, var5129 = protoModule.readVarInt(p302, var5122)
			local _ = var5128
			var5122 = var5129
			continue
		end
		if var5123 == protoModule.wireTypes.lengthDelimited then
			if var5127 == 1 then
				local _ = nil
				local var5130, var5131 = protoModule.readBuffer(p302, var5122)
				var5122 = var5131
				var5121.search_query = propTypesModule.StringProp.decode(var5130)
			elseif var5127 == 2 then
				local _ = nil
				local var5132, var5133 = protoModule.readBuffer(p302, var5122)
				var5122 = var5133
				var5121.search_type = propTypesModule.StringProp.decode(var5132)
			else
				local _ = nil
				local var5134, var5135 = protoModule.readVarInt(p302, var5122)
				var5122 = var5135 + var5134
			end
		elseif var5123 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5136, var5137 = protoModule.readFixed32(p302, var5122)
			local _ = var5136
			var5122 = var5137
		elseif var5123 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5138, var5139 = protoModule.readFixed64(p302, var5122)
			local _ = var5138
			var5122 = var5139
		else
			error("Unsupported wire type: " .. var5123)
		end
	end
	return var5121
end

function t_153:jsonEncode() --[[ line: 28740 ]]
	local t = {}
	
	if self.search_query ~= nil then
		t.searchQuery = self.search_query:jsonEncode()
	end
	if self.search_type ~= nil then
		t.searchType = self.search_type:jsonEncode()
	end
	return t
end

function t_153:jsonDecode() --[[ line: 28754 ]]
	-- upvalues: t_153 (ref), propTypesModule (ref)
	local var5141 = t_153.new()
	
	if self.search_query ~= nil then
		var5141.search_query = propTypesModule.StringProp.jsonDecode(self.search_query)
	end
	if self.searchQuery ~= nil then
		var5141.search_query = propTypesModule.StringProp.jsonDecode(self.searchQuery)
	end
	if self.search_type ~= nil then
		var5141.search_type = propTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		var5141.search_type = propTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return var5141
end

t_153.descriptor = {
	name = "OpenSearchResultsWithQueryAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSearchResultsWithQueryAction_Params = t_153
typeRegistryModule.default:register(t.OpenSearchResultsWithQueryAction_Params)
local t_154 = {}
t_154.__index = t_154

function t_154.new(p303) --[[ line: 28795 ]]
	-- upvalues: t (ref), t_154 (ref)
	return setmetatable({
		action_type = if p303 == nil or p303.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p303.action_type,
		action_params = if p303 == nil or p303.action_params == nil then nil else p303.action_params
	}, t_154)
end

function t_154:encode() --[[ line: 28806 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5143 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5144, var5145 = protoModule.writeTag(buff, var5143, 1, protoModule.wireTypes.varint)
		var5144, var5145 = protoModule.writeVarInt(var5144, var5145, t.ActionType.toNumber(self.action_type))
		buff = var5144
		var5143 = var5145
	end
	if self.action_params ~= nil then
		local var5146 = self.action_params:encode()
		local var5147, var5148 = protoModule.writeTag(buff, var5143, 2, protoModule.wireTypes.lengthDelimited)
		var5147, var5148 = protoModule.writeBuffer(var5147, var5148, var5146, buffer.len(var5146))
		buff = var5147
		var5143 = var5148
	end
	local buff_1 = buffer.create(var5143)
	buffer.copy(buff_1, 0, buff, 0, var5143)
	
	return buff_1
end

function t_154.decode(p304) --[[ line: 28832 ]]
	-- upvalues: t_154 (ref), protoModule (ref), t (ref)
	local var5150 = t_154.new()
	local var5151 = 0
	while var5151 < buffer.len(p304) do
		local _ = nil
		local var5152 = nil
		local var5153, var5154, var5155 = protoModule.readTag(p304, var5151)
		local var5156 = var5153
		var5152 = var5154
		var5151 = var5155
		
		if var5152 == protoModule.wireTypes.varint then
			if var5156 == 1 then
				local _ = nil
				local var5157, var5158 = protoModule.readVarIntI32(p304, var5151)
				local var5159 = var5157
				var5151 = var5158
				var5150.action_type = t.ActionType.fromNumber(var5159) or var5159
			else
				local _ = nil
				local var5160, var5161 = protoModule.readVarInt(p304, var5151)
				local _ = var5160
				var5151 = var5161
			end
		end
		if var5152 == protoModule.wireTypes.lengthDelimited then
			if var5156 == 2 then
				local _ = nil
				local var5162, var5163 = protoModule.readBuffer(p304, var5151)
				var5151 = var5163
				var5150.action_params = t.SelectMarketplaceFavoritesCategory_Params.decode(var5162)
			else
				local _ = nil
				local var5164, var5165 = protoModule.readVarInt(p304, var5151)
				var5151 = var5165 + var5164
			end
		elseif var5152 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5166, var5167 = protoModule.readFixed32(p304, var5151)
			local _ = var5166
			var5151 = var5167
		elseif var5152 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5168, var5169 = protoModule.readFixed64(p304, var5151)
			local _ = var5168
			var5151 = var5169
		else
			error("Unsupported wire type: " .. var5152)
		end
	end
	return var5150
end

function t_154:jsonEncode() --[[ line: 28880 ]]
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

function t_154:jsonDecode() --[[ line: 28902 ]]
	-- upvalues: t_154 (ref), t (ref)
	local var5171 = t_154.new()
	
	if self.action_type ~= nil then
		var5171.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5171.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5171.action_params = t.SelectMarketplaceFavoritesCategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5171.action_params = t.SelectMarketplaceFavoritesCategory_Params.jsonDecode(self.actionParams)
	end
	return var5171
end

t_154.descriptor = {
	name = "SelectMarketplaceFavoritesCategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceFavoritesCategory"
}
t.SelectMarketplaceFavoritesCategory = t_154
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesCategory)
local t_155 = {}
t_155.__index = t_155

function t_155.new(p305) --[[ line: 28944 ]]
	-- upvalues: t_155 (ref)
	return setmetatable({
		category_id = if p305 == nil or p305.category_id == nil then nil else p305.category_id
	}, t_155)
end

function t_155:encode() --[[ line: 28952 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5173 = 0
	
	if self.category_id ~= nil then
		local var5174 = self.category_id:encode()
		local var5175, var5176 = protoModule.writeTag(buff, var5173, 1, protoModule.wireTypes.lengthDelimited)
		var5175, var5176 = protoModule.writeBuffer(var5175, var5176, var5174, buffer.len(var5174))
		buff = var5175
		var5173 = var5176
	end
	local buff_1 = buffer.create(var5173)
	buffer.copy(buff_1, 0, buff, 0, var5173)
	
	return buff_1
end

function t_155.decode(p306) --[[ line: 28969 ]]
	-- upvalues: t_155 (ref), protoModule (ref), propTypesModule (ref)
	local var5178 = t_155.new()
	local var5179 = 0
	while var5179 < buffer.len(p306) do
		local _ = nil
		local var5180 = nil
		local var5181, var5182, var5183 = protoModule.readTag(p306, var5179)
		local var5184 = var5181
		var5180 = var5182
		var5179 = var5183
		
		if var5180 == protoModule.wireTypes.varint then
			local _ = nil
			local var5185, var5186 = protoModule.readVarInt(p306, var5179)
			local _ = var5185
			var5179 = var5186
			continue
		end
		if var5180 == protoModule.wireTypes.lengthDelimited then
			if var5184 == 1 then
				local _ = nil
				local var5187, var5188 = protoModule.readBuffer(p306, var5179)
				var5179 = var5188
				var5178.category_id = propTypesModule.StringProp.decode(var5187)
			else
				local _ = nil
				local var5189, var5190 = protoModule.readVarInt(p306, var5179)
				var5179 = var5190 + var5189
			end
		elseif var5180 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5191, var5192 = protoModule.readFixed32(p306, var5179)
			local _ = var5191
			var5179 = var5192
		elseif var5180 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5193, var5194 = protoModule.readFixed64(p306, var5179)
			local _ = var5193
			var5179 = var5194
		else
			error("Unsupported wire type: " .. var5180)
		end
	end
	return var5178
end

function t_155:jsonEncode() --[[ line: 29014 ]]
	local t = {}
	
	if self.category_id ~= nil then
		t.categoryId = self.category_id:jsonEncode()
	end
	return t
end

function t_155:jsonDecode() --[[ line: 29026 ]]
	-- upvalues: t_155 (ref), propTypesModule (ref)
	local var5196 = t_155.new()
	
	if self.category_id ~= nil then
		var5196.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var5196.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	return var5196
end

t_155.descriptor = {
	name = "SelectMarketplaceFavoritesCategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceFavoritesCategory_Params = t_155
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesCategory_Params)
local t_156 = {}
t_156.__index = t_156

function t_156.new(p307) --[[ line: 29057 ]]
	-- upvalues: t (ref), t_156 (ref)
	return setmetatable({
		action_type = if p307 == nil or p307.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p307.action_type,
		action_params = if p307 == nil or p307.action_params == nil then nil else p307.action_params
	}, t_156)
end

function t_156:encode() --[[ line: 29068 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5198 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5199, var5200 = protoModule.writeTag(buff, var5198, 1, protoModule.wireTypes.varint)
		var5199, var5200 = protoModule.writeVarInt(var5199, var5200, t.ActionType.toNumber(self.action_type))
		buff = var5199
		var5198 = var5200
	end
	if self.action_params ~= nil then
		local var5201 = self.action_params:encode()
		local var5202, var5203 = protoModule.writeTag(buff, var5198, 2, protoModule.wireTypes.lengthDelimited)
		var5202, var5203 = protoModule.writeBuffer(var5202, var5203, var5201, buffer.len(var5201))
		buff = var5202
		var5198 = var5203
	end
	local buff_1 = buffer.create(var5198)
	buffer.copy(buff_1, 0, buff, 0, var5198)
	
	return buff_1
end

function t_156.decode(p308) --[[ line: 29094 ]]
	-- upvalues: t_156 (ref), protoModule (ref), t (ref)
	local var5205 = t_156.new()
	local var5206 = 0
	while var5206 < buffer.len(p308) do
		local _ = nil
		local var5207 = nil
		local var5208, var5209, var5210 = protoModule.readTag(p308, var5206)
		local var5211 = var5208
		var5207 = var5209
		var5206 = var5210
		
		if var5207 == protoModule.wireTypes.varint then
			if var5211 == 1 then
				local _ = nil
				local var5212, var5213 = protoModule.readVarIntI32(p308, var5206)
				local var5214 = var5212
				var5206 = var5213
				var5205.action_type = t.ActionType.fromNumber(var5214) or var5214
			else
				local _ = nil
				local var5215, var5216 = protoModule.readVarInt(p308, var5206)
				local _ = var5215
				var5206 = var5216
			end
		end
		if var5207 == protoModule.wireTypes.lengthDelimited then
			if var5211 == 2 then
				local _ = nil
				local var5217, var5218 = protoModule.readBuffer(p308, var5206)
				var5206 = var5218
				var5205.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.decode(var5217)
			else
				local _ = nil
				local var5219, var5220 = protoModule.readVarInt(p308, var5206)
				var5206 = var5220 + var5219
			end
		elseif var5207 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5221, var5222 = protoModule.readFixed32(p308, var5206)
			local _ = var5221
			var5206 = var5222
		elseif var5207 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5223, var5224 = protoModule.readFixed64(p308, var5206)
			local _ = var5223
			var5206 = var5224
		else
			error("Unsupported wire type: " .. var5207)
		end
	end
	return var5205
end

function t_156:jsonEncode() --[[ line: 29142 ]]
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

function t_156:jsonDecode() --[[ line: 29164 ]]
	-- upvalues: t_156 (ref), t (ref)
	local var5226 = t_156.new()
	
	if self.action_type ~= nil then
		var5226.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5226.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5226.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5226.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.jsonDecode(self.actionParams)
	end
	return var5226
end

t_156.descriptor = {
	name = "SelectMarketplaceFavoritesSubcategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceFavoritesSubcategory"
}
t.SelectMarketplaceFavoritesSubcategory = t_156
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesSubcategory)
local t_157 = {}
t_157.__index = t_157

function t_157.new(p309) --[[ line: 29206 ]]
	-- upvalues: t_157 (ref)
	return setmetatable({
		subcategory_id = if p309 == nil or p309.subcategory_id == nil then nil else p309.subcategory_id
	}, t_157)
end

function t_157:encode() --[[ line: 29214 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5228 = 0
	
	if self.subcategory_id ~= nil then
		local var5229 = self.subcategory_id:encode()
		local var5230, var5231 = protoModule.writeTag(buff, var5228, 1, protoModule.wireTypes.lengthDelimited)
		var5230, var5231 = protoModule.writeBuffer(var5230, var5231, var5229, buffer.len(var5229))
		buff = var5230
		var5228 = var5231
	end
	local buff_1 = buffer.create(var5228)
	buffer.copy(buff_1, 0, buff, 0, var5228)
	
	return buff_1
end

function t_157.decode(p310) --[[ line: 29231 ]]
	-- upvalues: t_157 (ref), protoModule (ref), propTypesModule (ref)
	local var5233 = t_157.new()
	local var5234 = 0
	while var5234 < buffer.len(p310) do
		local _ = nil
		local var5235 = nil
		local var5236, var5237, var5238 = protoModule.readTag(p310, var5234)
		local var5239 = var5236
		var5235 = var5237
		var5234 = var5238
		
		if var5235 == protoModule.wireTypes.varint then
			local _ = nil
			local var5240, var5241 = protoModule.readVarInt(p310, var5234)
			local _ = var5240
			var5234 = var5241
			continue
		end
		if var5235 == protoModule.wireTypes.lengthDelimited then
			if var5239 == 1 then
				local _ = nil
				local var5242, var5243 = protoModule.readBuffer(p310, var5234)
				var5234 = var5243
				var5233.subcategory_id = propTypesModule.StringProp.decode(var5242)
			else
				local _ = nil
				local var5244, var5245 = protoModule.readVarInt(p310, var5234)
				var5234 = var5245 + var5244
			end
		elseif var5235 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5246, var5247 = protoModule.readFixed32(p310, var5234)
			local _ = var5246
			var5234 = var5247
		elseif var5235 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5248, var5249 = protoModule.readFixed64(p310, var5234)
			local _ = var5248
			var5234 = var5249
		else
			error("Unsupported wire type: " .. var5235)
		end
	end
	return var5233
end

function t_157:jsonEncode() --[[ line: 29276 ]]
	local t = {}
	
	if self.subcategory_id ~= nil then
		t.subcategoryId = self.subcategory_id:jsonEncode()
	end
	return t
end

function t_157:jsonDecode() --[[ line: 29288 ]]
	-- upvalues: t_157 (ref), propTypesModule (ref)
	local var5251 = t_157.new()
	
	if self.subcategory_id ~= nil then
		var5251.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var5251.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	return var5251
end

t_157.descriptor = {
	name = "SelectMarketplaceFavoritesSubcategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceFavoritesSubcategory_Params = t_157
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesSubcategory_Params)
local t_158 = {}
t_158.__index = t_158

function t_158.new(p311) --[[ line: 29320 ]]
	-- upvalues: t (ref), t_158 (ref)
	return setmetatable({
		action_type = if p311 == nil or p311.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p311.action_type,
		action_params = if p311 == nil or p311.action_params == nil then nil else p311.action_params
	}, t_158)
end

function t_158:encode() --[[ line: 29331 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5253 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5254, var5255 = protoModule.writeTag(buff, var5253, 1, protoModule.wireTypes.varint)
		var5254, var5255 = protoModule.writeVarInt(var5254, var5255, t.ActionType.toNumber(self.action_type))
		buff = var5254
		var5253 = var5255
	end
	if self.action_params ~= nil then
		local var5256 = self.action_params:encode()
		local var5257, var5258 = protoModule.writeTag(buff, var5253, 2, protoModule.wireTypes.lengthDelimited)
		var5257, var5258 = protoModule.writeBuffer(var5257, var5258, var5256, buffer.len(var5256))
		buff = var5257
		var5253 = var5258
	end
	local buff_1 = buffer.create(var5253)
	buffer.copy(buff_1, 0, buff, 0, var5253)
	
	return buff_1
end

function t_158.decode(p312) --[[ line: 29357 ]]
	-- upvalues: t_158 (ref), protoModule (ref), t (ref)
	local var5260 = t_158.new()
	local var5261 = 0
	while var5261 < buffer.len(p312) do
		local _ = nil
		local var5262 = nil
		local var5263, var5264, var5265 = protoModule.readTag(p312, var5261)
		local var5266 = var5263
		var5262 = var5264
		var5261 = var5265
		
		if var5262 == protoModule.wireTypes.varint then
			if var5266 == 1 then
				local _ = nil
				local var5267, var5268 = protoModule.readVarIntI32(p312, var5261)
				local var5269 = var5267
				var5261 = var5268
				var5260.action_type = t.ActionType.fromNumber(var5269) or var5269
			else
				local _ = nil
				local var5270, var5271 = protoModule.readVarInt(p312, var5261)
				local _ = var5270
				var5261 = var5271
			end
		end
		if var5262 == protoModule.wireTypes.lengthDelimited then
			if var5266 == 2 then
				local _ = nil
				local var5272, var5273 = protoModule.readBuffer(p312, var5261)
				var5261 = var5273
				var5260.action_params = t.PinExperienceShortcutAction_Params.decode(var5272)
			else
				local _ = nil
				local var5274, var5275 = protoModule.readVarInt(p312, var5261)
				var5261 = var5275 + var5274
			end
		elseif var5262 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5276, var5277 = protoModule.readFixed32(p312, var5261)
			local _ = var5276
			var5261 = var5277
		elseif var5262 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5278, var5279 = protoModule.readFixed64(p312, var5261)
			local _ = var5278
			var5261 = var5279
		else
			error("Unsupported wire type: " .. var5262)
		end
	end
	return var5260
end

function t_158:jsonEncode() --[[ line: 29405 ]]
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

function t_158:jsonDecode() --[[ line: 29427 ]]
	-- upvalues: t_158 (ref), t (ref)
	local var5281 = t_158.new()
	
	if self.action_type ~= nil then
		var5281.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5281.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5281.action_params = t.PinExperienceShortcutAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5281.action_params = t.PinExperienceShortcutAction_Params.jsonDecode(self.actionParams)
	end
	return var5281
end

t_158.descriptor = {
	name = "PinExperienceShortcutAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.PinExperienceShortcutAction"
}
t.PinExperienceShortcutAction = t_158
typeRegistryModule.default:register(t.PinExperienceShortcutAction)
local t_159 = {}
t_159.__index = t_159

function t_159.new(p313) --[[ line: 29467 ]]
	-- upvalues: t_159 (ref)
	return setmetatable({
		place_id = if p313 == nil or p313.place_id == nil then nil else p313.place_id,
		universe_id = if p313 == nil or p313.universe_id == nil then nil else p313.universe_id,
		game_name = if p313 == nil or p313.game_name == nil then nil else p313.game_name
	}, t_159)
end

function t_159:encode() --[[ line: 29477 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5283 = 0
	
	if self.place_id ~= nil then
		local var5284 = self.place_id:encode()
		local var5285, var5286 = protoModule.writeTag(buff, var5283, 1, protoModule.wireTypes.lengthDelimited)
		var5285, var5286 = protoModule.writeBuffer(var5285, var5286, var5284, buffer.len(var5284))
		buff = var5285
		var5283 = var5286
	end
	if self.universe_id ~= nil then
		local var5287 = self.universe_id:encode()
		local var5288, var5289 = protoModule.writeTag(buff, var5283, 2, protoModule.wireTypes.lengthDelimited)
		var5288, var5289 = protoModule.writeBuffer(var5288, var5289, var5287, buffer.len(var5287))
		buff = var5288
		var5283 = var5289
	end
	if self.game_name ~= nil then
		local var5290 = self.game_name:encode()
		local var5291, var5292 = protoModule.writeTag(buff, var5283, 3, protoModule.wireTypes.lengthDelimited)
		var5291, var5292 = protoModule.writeBuffer(var5291, var5292, var5290, buffer.len(var5290))
		buff = var5291
		var5283 = var5292
	end
	local buff_1 = buffer.create(var5283)
	buffer.copy(buff_1, 0, buff, 0, var5283)
	
	return buff_1
end

function t_159.decode(p314) --[[ line: 29504 ]]
	-- upvalues: t_159 (ref), protoModule (ref), propTypesModule (ref)
	local var5294 = t_159.new()
	local var5295 = 0
	while var5295 < buffer.len(p314) do
		local _ = nil
		local var5296 = nil
		local var5297, var5298, var5299 = protoModule.readTag(p314, var5295)
		local var5300 = var5297
		var5296 = var5298
		var5295 = var5299
		
		if var5296 == protoModule.wireTypes.varint then
			local _ = nil
			local var5301, var5302 = protoModule.readVarInt(p314, var5295)
			local _ = var5301
			var5295 = var5302
			continue
		end
		if var5296 == protoModule.wireTypes.lengthDelimited then
			if var5300 == 1 then
				local _ = nil
				local var5303, var5304 = protoModule.readBuffer(p314, var5295)
				var5295 = var5304
				var5294.place_id = propTypesModule.StringProp.decode(var5303)
			elseif var5300 == 2 then
				local _ = nil
				local var5305, var5306 = protoModule.readBuffer(p314, var5295)
				var5295 = var5306
				var5294.universe_id = propTypesModule.StringProp.decode(var5305)
			elseif var5300 == 3 then
				local _ = nil
				local var5307, var5308 = protoModule.readBuffer(p314, var5295)
				var5295 = var5308
				var5294.game_name = propTypesModule.StringProp.decode(var5307)
			else
				local _ = nil
				local var5309, var5310 = protoModule.readVarInt(p314, var5295)
				var5295 = var5310 + var5309
			end
		elseif var5296 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5311, var5312 = protoModule.readFixed32(p314, var5295)
			local _ = var5311
			var5295 = var5312
		elseif var5296 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5313, var5314 = protoModule.readFixed64(p314, var5295)
			local _ = var5313
			var5295 = var5314
		else
			error("Unsupported wire type: " .. var5296)
		end
	end
	return var5294
end

function t_159:jsonEncode() --[[ line: 29557 ]]
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

function t_159:jsonDecode() --[[ line: 29575 ]]
	-- upvalues: t_159 (ref), propTypesModule (ref)
	local var5316 = t_159.new()
	
	if self.place_id ~= nil then
		var5316.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var5316.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var5316.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var5316.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.game_name ~= nil then
		var5316.game_name = propTypesModule.StringProp.jsonDecode(self.game_name)
	end
	if self.gameName ~= nil then
		var5316.game_name = propTypesModule.StringProp.jsonDecode(self.gameName)
	end
	return var5316
end

t_159.descriptor = {
	name = "PinExperienceShortcutAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.PinExperienceShortcutAction_Params = t_159
typeRegistryModule.default:register(t.PinExperienceShortcutAction_Params)
local t_160 = {}
t_160.__index = t_160

function t_160.new(p315) --[[ line: 29622 ]]
	-- upvalues: t (ref), t_160 (ref)
	return setmetatable({
		action_type = if p315 == nil or p315.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p315.action_type,
		action_params = if p315 == nil or p315.action_params == nil then nil else p315.action_params
	}, t_160)
end

function t_160:encode() --[[ line: 29631 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5318 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5319, var5320 = protoModule.writeTag(buff, var5318, 1, protoModule.wireTypes.varint)
		var5319, var5320 = protoModule.writeVarInt(var5319, var5320, t.ActionType.toNumber(self.action_type))
		buff = var5319
		var5318 = var5320
	end
	if self.action_params ~= nil then
		local var5321 = self.action_params:encode()
		local var5322, var5323 = protoModule.writeTag(buff, var5318, 2, protoModule.wireTypes.lengthDelimited)
		var5322, var5323 = protoModule.writeBuffer(var5322, var5323, var5321, buffer.len(var5321))
		buff = var5322
		var5318 = var5323
	end
	local buff_1 = buffer.create(var5318)
	buffer.copy(buff_1, 0, buff, 0, var5318)
	
	return buff_1
end

function t_160.decode(p316) --[[ line: 29657 ]]
	-- upvalues: t_160 (ref), protoModule (ref), t (ref)
	local var5325 = t_160.new()
	local var5326 = 0
	while var5326 < buffer.len(p316) do
		local _ = nil
		local var5327 = nil
		local var5328, var5329, var5330 = protoModule.readTag(p316, var5326)
		local var5331 = var5328
		var5327 = var5329
		var5326 = var5330
		
		if var5327 == protoModule.wireTypes.varint then
			if var5331 == 1 then
				local _ = nil
				local var5332, var5333 = protoModule.readVarIntI32(p316, var5326)
				local var5334 = var5332
				var5326 = var5333
				var5325.action_type = t.ActionType.fromNumber(var5334) or var5334
			else
				local _ = nil
				local var5335, var5336 = protoModule.readVarInt(p316, var5326)
				local _ = var5335
				var5326 = var5336
			end
		end
		if var5327 == protoModule.wireTypes.lengthDelimited then
			if var5331 == 2 then
				local _ = nil
				local var5337, var5338 = protoModule.readBuffer(p316, var5326)
				var5326 = var5338
				var5325.action_params = t.DownloadAppAction_Params.decode(var5337)
			else
				local _ = nil
				local var5339, var5340 = protoModule.readVarInt(p316, var5326)
				var5326 = var5340 + var5339
			end
		elseif var5327 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5341, var5342 = protoModule.readFixed32(p316, var5326)
			local _ = var5341
			var5326 = var5342
		elseif var5327 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5343, var5344 = protoModule.readFixed64(p316, var5326)
			local _ = var5343
			var5326 = var5344
		else
			error("Unsupported wire type: " .. var5327)
		end
	end
	return var5325
end

function t_160:jsonEncode() --[[ line: 29705 ]]
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

function t_160:jsonDecode() --[[ line: 29727 ]]
	-- upvalues: t_160 (ref), t (ref)
	local var5346 = t_160.new()
	
	if self.action_type ~= nil then
		var5346.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5346.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5346.action_params = t.DownloadAppAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5346.action_params = t.DownloadAppAction_Params.jsonDecode(self.actionParams)
	end
	return var5346
end

t_160.descriptor = {
	name = "DownloadAppAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DownloadAppAction"
}
t.DownloadAppAction = t_160
typeRegistryModule.default:register(t.DownloadAppAction)
local t_161 = {}
t_161.__index = t_161

function t_161.new(p317) --[[ line: 29767 ]]
	-- upvalues: t_161 (ref)
	return setmetatable({
		source = if p317 == nil or p317.source == nil then nil else p317.source,
		download_type = if p317 == nil or p317.download_type == nil then nil else p317.download_type
	}, t_161)
end

function t_161:encode() --[[ line: 29774 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5348 = 0
	
	if self.source ~= nil then
		local var5349 = self.source:encode()
		local var5350, var5351 = protoModule.writeTag(buff, var5348, 1, protoModule.wireTypes.lengthDelimited)
		var5350, var5351 = protoModule.writeBuffer(var5350, var5351, var5349, buffer.len(var5349))
		buff = var5350
		var5348 = var5351
	end
	if self.download_type ~= nil then
		local var5352 = self.download_type:encode()
		local var5353, var5354 = protoModule.writeTag(buff, var5348, 2, protoModule.wireTypes.lengthDelimited)
		var5353, var5354 = protoModule.writeBuffer(var5353, var5354, var5352, buffer.len(var5352))
		buff = var5353
		var5348 = var5354
	end
	local buff_1 = buffer.create(var5348)
	buffer.copy(buff_1, 0, buff, 0, var5348)
	
	return buff_1
end

function t_161.decode(p318) --[[ line: 29795 ]]
	-- upvalues: t_161 (ref), protoModule (ref), propTypesModule (ref)
	local var5356 = t_161.new()
	local var5357 = 0
	while var5357 < buffer.len(p318) do
		local _ = nil
		local var5358 = nil
		local var5359, var5360, var5361 = protoModule.readTag(p318, var5357)
		local var5362 = var5359
		var5358 = var5360
		var5357 = var5361
		
		if var5358 == protoModule.wireTypes.varint then
			local _ = nil
			local var5363, var5364 = protoModule.readVarInt(p318, var5357)
			local _ = var5363
			var5357 = var5364
			continue
		end
		if var5358 == protoModule.wireTypes.lengthDelimited then
			if var5362 == 1 then
				local _ = nil
				local var5365, var5366 = protoModule.readBuffer(p318, var5357)
				var5357 = var5366
				var5356.source = propTypesModule.StringProp.decode(var5365)
			elseif var5362 == 2 then
				local _ = nil
				local var5367, var5368 = protoModule.readBuffer(p318, var5357)
				var5357 = var5368
				var5356.download_type = propTypesModule.StringProp.decode(var5367)
			else
				local _ = nil
				local var5369, var5370 = protoModule.readVarInt(p318, var5357)
				var5357 = var5370 + var5369
			end
		elseif var5358 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5371, var5372 = protoModule.readFixed32(p318, var5357)
			local _ = var5371
			var5357 = var5372
		elseif var5358 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5373, var5374 = protoModule.readFixed64(p318, var5357)
			local _ = var5373
			var5357 = var5374
		else
			error("Unsupported wire type: " .. var5358)
		end
	end
	return var5356
end

function t_161:jsonEncode() --[[ line: 29843 ]]
	local t = {}
	
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	if self.download_type ~= nil then
		t.downloadType = self.download_type:jsonEncode()
	end
	return t
end

function t_161:jsonDecode() --[[ line: 29857 ]]
	-- upvalues: t_161 (ref), propTypesModule (ref)
	local var5376 = t_161.new()
	
	if self.source ~= nil then
		var5376.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.download_type ~= nil then
		var5376.download_type = propTypesModule.StringProp.jsonDecode(self.download_type)
	end
	if self.downloadType ~= nil then
		var5376.download_type = propTypesModule.StringProp.jsonDecode(self.downloadType)
	end
	return var5376
end

t_161.descriptor = {
	name = "DownloadAppAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DownloadAppAction_Params = t_161
typeRegistryModule.default:register(t.DownloadAppAction_Params)
local t_162 = {}
t_162.__index = t_162

function t_162.new(p319) --[[ line: 29891 ]]
	-- upvalues: t (ref), t_162 (ref)
	return setmetatable({
		action_type = if p319 == nil or p319.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p319.action_type,
		action_params = if p319 == nil or p319.action_params == nil then nil else p319.action_params
	}, t_162)
end

function t_162:encode() --[[ line: 29900 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5378 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5379, var5380 = protoModule.writeTag(buff, var5378, 1, protoModule.wireTypes.varint)
		var5379, var5380 = protoModule.writeVarInt(var5379, var5380, t.ActionType.toNumber(self.action_type))
		buff = var5379
		var5378 = var5380
	end
	if self.action_params ~= nil then
		local var5381 = self.action_params:encode()
		local var5382, var5383 = protoModule.writeTag(buff, var5378, 2, protoModule.wireTypes.lengthDelimited)
		var5382, var5383 = protoModule.writeBuffer(var5382, var5383, var5381, buffer.len(var5381))
		buff = var5382
		var5378 = var5383
	end
	local buff_1 = buffer.create(var5378)
	buffer.copy(buff_1, 0, buff, 0, var5378)
	
	return buff_1
end

function t_162.decode(p320) --[[ line: 29926 ]]
	-- upvalues: t_162 (ref), protoModule (ref), t (ref)
	local var5385 = t_162.new()
	local var5386 = 0
	while var5386 < buffer.len(p320) do
		local _ = nil
		local var5387 = nil
		local var5388, var5389, var5390 = protoModule.readTag(p320, var5386)
		local var5391 = var5388
		var5387 = var5389
		var5386 = var5390
		
		if var5387 == protoModule.wireTypes.varint then
			if var5391 == 1 then
				local _ = nil
				local var5392, var5393 = protoModule.readVarIntI32(p320, var5386)
				local var5394 = var5392
				var5386 = var5393
				var5385.action_type = t.ActionType.fromNumber(var5394) or var5394
			else
				local _ = nil
				local var5395, var5396 = protoModule.readVarInt(p320, var5386)
				local _ = var5395
				var5386 = var5396
			end
		end
		if var5387 == protoModule.wireTypes.lengthDelimited then
			if var5391 == 2 then
				local _ = nil
				local var5397, var5398 = protoModule.readBuffer(p320, var5386)
				var5386 = var5398
				var5385.action_params = t.ActionSequenceAction_Params.decode(var5397)
			else
				local _ = nil
				local var5399, var5400 = protoModule.readVarInt(p320, var5386)
				var5386 = var5400 + var5399
			end
		elseif var5387 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5401, var5402 = protoModule.readFixed32(p320, var5386)
			local _ = var5401
			var5386 = var5402
		elseif var5387 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5403, var5404 = protoModule.readFixed64(p320, var5386)
			local _ = var5403
			var5386 = var5404
		else
			error("Unsupported wire type: " .. var5387)
		end
	end
	return var5385
end

function t_162:jsonEncode() --[[ line: 29974 ]]
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

function t_162:jsonDecode() --[[ line: 29996 ]]
	-- upvalues: t_162 (ref), t (ref)
	local var5406 = t_162.new()
	
	if self.action_type ~= nil then
		var5406.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5406.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5406.action_params = t.ActionSequenceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5406.action_params = t.ActionSequenceAction_Params.jsonDecode(self.actionParams)
	end
	return var5406
end

t_162.descriptor = {
	name = "ActionSequenceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionSequenceAction"
}
t.ActionSequenceAction = t_162
typeRegistryModule.default:register(t.ActionSequenceAction)
local t_163 = {}
t_163.__index = t_163

function t_163.new(p321) --[[ line: 30036 ]]
	-- upvalues: t_163 (ref)
	return setmetatable({
		actions = if p321 == nil or p321.actions == nil then {} else p321.actions
	}, t_163)
end

function t_163:encode() --[[ line: 30044 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5408 = 0
	
	if self.actions ~= nil and #self.actions > 0 then
		for i, v in self.actions do
			local var5409 = v:encode()
			local var5410, var5411 = protoModule.writeTag(buff, var5408, 1, protoModule.wireTypes.lengthDelimited)
			var5410, var5411 = protoModule.writeBuffer(var5410, var5411, var5409, buffer.len(var5409))
			buff = var5410
			var5408 = var5411
		end
	end
	local buff_1 = buffer.create(var5408)
	buffer.copy(buff_1, 0, buff, 0, var5408)
	
	return buff_1
end

function t_163.decode(p322) --[[ line: 30061 ]]
	-- upvalues: t_163 (ref), protoModule (ref), t (ref)
	local var5413 = t_163.new()
	local var5414 = 0
	while var5414 < buffer.len(p322) do
		local _ = nil
		local var5415 = nil
		local var5416, var5417, var5418 = protoModule.readTag(p322, var5414)
		local var5419 = var5416
		var5415 = var5417
		var5414 = var5418
		
		if var5415 == protoModule.wireTypes.varint then
			local _ = nil
			local var5420, var5421 = protoModule.readVarInt(p322, var5414)
			local _ = var5420
			var5414 = var5421
			continue
		end
		if var5415 == protoModule.wireTypes.lengthDelimited then
			if var5419 == 1 then
				local _ = nil
				local var5422, var5423 = protoModule.readBuffer(p322, var5414)
				var5414 = var5423
				table.insert(var5413.actions, t.ActionProp.decode(var5422))
			else
				local _ = nil
				local var5424, var5425 = protoModule.readVarInt(p322, var5414)
				var5414 = var5425 + var5424
			end
		elseif var5415 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5426, var5427 = protoModule.readFixed32(p322, var5414)
			local _ = var5426
			var5414 = var5427
		elseif var5415 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5428, var5429 = protoModule.readFixed64(p322, var5414)
			local _ = var5428
			var5414 = var5429
		else
			error("Unsupported wire type: " .. var5415)
		end
	end
	return var5413
end

function t_163:jsonEncode() --[[ line: 30104 ]]
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

function t_163:jsonDecode() --[[ line: 30118 ]]
	-- upvalues: t_163 (ref), t (ref)
	local var5432 = t_163.new()
	
	if self.actions ~= nil then
		local t_1 = {}
		
		for i, v in self.actions do
			table.insert(t_1, t.ActionProp.jsonDecode(v))
		end
		var5432.actions = t_1
	end
	return var5432
end

t_163.descriptor = {
	name = "ActionSequenceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ActionSequenceAction_Params = t_163
typeRegistryModule.default:register(t.ActionSequenceAction_Params)
local t_164 = {}
t_164.__index = t_164

function t_164.new(p323) --[[ line: 30147 ]]
	-- upvalues: t (ref), t_164 (ref)
	return setmetatable({
		action_type = if p323 == nil or p323.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p323.action_type,
		action_params = if p323 == nil or p323.action_params == nil then nil else p323.action_params
	}, t_164)
end

function t_164:encode() --[[ line: 30158 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5435 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5436, var5437 = protoModule.writeTag(buff, var5435, 1, protoModule.wireTypes.varint)
		var5436, var5437 = protoModule.writeVarInt(var5436, var5437, t.ActionType.toNumber(self.action_type))
		buff = var5436
		var5435 = var5437
	end
	if self.action_params ~= nil then
		local var5438 = self.action_params:encode()
		local var5439, var5440 = protoModule.writeTag(buff, var5435, 2, protoModule.wireTypes.lengthDelimited)
		var5439, var5440 = protoModule.writeBuffer(var5439, var5440, var5438, buffer.len(var5438))
		buff = var5439
		var5435 = var5440
	end
	local buff_1 = buffer.create(var5435)
	buffer.copy(buff_1, 0, buff, 0, var5435)
	
	return buff_1
end

function t_164.decode(p324) --[[ line: 30184 ]]
	-- upvalues: t_164 (ref), protoModule (ref), t (ref)
	local var5442 = t_164.new()
	local var5443 = 0
	while var5443 < buffer.len(p324) do
		local _ = nil
		local var5444 = nil
		local var5445, var5446, var5447 = protoModule.readTag(p324, var5443)
		local var5448 = var5445
		var5444 = var5446
		var5443 = var5447
		
		if var5444 == protoModule.wireTypes.varint then
			if var5448 == 1 then
				local _ = nil
				local var5449, var5450 = protoModule.readVarIntI32(p324, var5443)
				local var5451 = var5449
				var5443 = var5450
				var5442.action_type = t.ActionType.fromNumber(var5451) or var5451
			else
				local _ = nil
				local var5452, var5453 = protoModule.readVarInt(p324, var5443)
				local _ = var5452
				var5443 = var5453
			end
		end
		if var5444 == protoModule.wireTypes.lengthDelimited then
			if var5448 == 2 then
				local _ = nil
				local var5454, var5455 = protoModule.readBuffer(p324, var5443)
				var5443 = var5455
				var5442.action_params = t.RefreshFeedEntryFromApiAction_Params.decode(var5454)
			else
				local _ = nil
				local var5456, var5457 = protoModule.readVarInt(p324, var5443)
				var5443 = var5457 + var5456
			end
		elseif var5444 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5458, var5459 = protoModule.readFixed32(p324, var5443)
			local _ = var5458
			var5443 = var5459
		elseif var5444 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5460, var5461 = protoModule.readFixed64(p324, var5443)
			local _ = var5460
			var5443 = var5461
		else
			error("Unsupported wire type: " .. var5444)
		end
	end
	return var5442
end

function t_164:jsonEncode() --[[ line: 30232 ]]
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

function t_164:jsonDecode() --[[ line: 30254 ]]
	-- upvalues: t_164 (ref), t (ref)
	local var5463 = t_164.new()
	
	if self.action_type ~= nil then
		var5463.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5463.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5463.action_params = t.RefreshFeedEntryFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5463.action_params = t.RefreshFeedEntryFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var5463
end

t_164.descriptor = {
	name = "RefreshFeedEntryFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshFeedEntryFromApiAction"
}
t.RefreshFeedEntryFromApiAction = t_164
typeRegistryModule.default:register(t.RefreshFeedEntryFromApiAction)
local t_165 = {}
t_165.__index = t_165

function t_165.new(p325) --[[ line: 30294 ]]
	-- upvalues: t_165 (ref)
	return setmetatable({
		page_entry_identifier = if p325 == nil or p325.page_entry_identifier == nil then nil else p325.page_entry_identifier,
		feed_entry_identifier = if p325 == nil or p325.feed_entry_identifier == nil then nil else p325.feed_entry_identifier,
		selected_option_ids = if p325 == nil or p325.selected_option_ids == nil then nil else p325.selected_option_ids
	}, t_165)
end

function t_165:encode() --[[ line: 30310 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5465 = 0
	
	if self.page_entry_identifier ~= nil then
		local var5466 = self.page_entry_identifier:encode()
		local var5467, var5468 = protoModule.writeTag(buff, var5465, 1, protoModule.wireTypes.lengthDelimited)
		var5467, var5468 = protoModule.writeBuffer(var5467, var5468, var5466, buffer.len(var5466))
		buff = var5467
		var5465 = var5468
	end
	if self.feed_entry_identifier ~= nil then
		local var5469 = self.feed_entry_identifier:encode()
		local var5470, var5471 = protoModule.writeTag(buff, var5465, 2, protoModule.wireTypes.lengthDelimited)
		var5470, var5471 = protoModule.writeBuffer(var5470, var5471, var5469, buffer.len(var5469))
		buff = var5470
		var5465 = var5471
	end
	if self.selected_option_ids ~= nil then
		local var5472 = self.selected_option_ids:encode()
		local var5473, var5474 = protoModule.writeTag(buff, var5465, 3, protoModule.wireTypes.lengthDelimited)
		var5473, var5474 = protoModule.writeBuffer(var5473, var5474, var5472, buffer.len(var5472))
		buff = var5473
		var5465 = var5474
	end
	local buff_1 = buffer.create(var5465)
	buffer.copy(buff_1, 0, buff, 0, var5465)
	
	return buff_1
end

function t_165.decode(p326) --[[ line: 30337 ]]
	-- upvalues: t_165 (ref), protoModule (ref), propTypesModule (ref)
	local var5476 = t_165.new()
	local var5477 = 0
	while var5477 < buffer.len(p326) do
		local _ = nil
		local var5478 = nil
		local var5479, var5480, var5481 = protoModule.readTag(p326, var5477)
		local var5482 = var5479
		var5478 = var5480
		var5477 = var5481
		
		if var5478 == protoModule.wireTypes.varint then
			local _ = nil
			local var5483, var5484 = protoModule.readVarInt(p326, var5477)
			local _ = var5483
			var5477 = var5484
			continue
		end
		if var5478 == protoModule.wireTypes.lengthDelimited then
			if var5482 == 1 then
				local _ = nil
				local var5485, var5486 = protoModule.readBuffer(p326, var5477)
				var5477 = var5486
				var5476.page_entry_identifier = propTypesModule.StringProp.decode(var5485)
			elseif var5482 == 2 then
				local _ = nil
				local var5487, var5488 = protoModule.readBuffer(p326, var5477)
				var5477 = var5488
				var5476.feed_entry_identifier = propTypesModule.StringProp.decode(var5487)
			elseif var5482 == 3 then
				local _ = nil
				local var5489, var5490 = protoModule.readBuffer(p326, var5477)
				var5477 = var5490
				var5476.selected_option_ids = propTypesModule.StringArrayProp.decode(var5489)
			else
				local _ = nil
				local var5491, var5492 = protoModule.readVarInt(p326, var5477)
				var5477 = var5492 + var5491
			end
		elseif var5478 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5493, var5494 = protoModule.readFixed32(p326, var5477)
			local _ = var5493
			var5477 = var5494
		elseif var5478 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5495, var5496 = protoModule.readFixed64(p326, var5477)
			local _ = var5495
			var5477 = var5496
		else
			error("Unsupported wire type: " .. var5478)
		end
	end
	return var5476
end

function t_165:jsonEncode() --[[ line: 30393 ]]
	local t = {}
	
	if self.page_entry_identifier ~= nil then
		t.pageEntryIdentifier = self.page_entry_identifier:jsonEncode()
	end
	if self.feed_entry_identifier ~= nil then
		t.feedEntryIdentifier = self.feed_entry_identifier:jsonEncode()
	end
	if self.selected_option_ids ~= nil then
		t.selectedOptionIds = self.selected_option_ids:jsonEncode()
	end
	return t
end

function t_165:jsonDecode() --[[ line: 30411 ]]
	-- upvalues: t_165 (ref), propTypesModule (ref)
	local var5498 = t_165.new()
	
	if self.page_entry_identifier ~= nil then
		var5498.page_entry_identifier = propTypesModule.StringProp.jsonDecode(self.page_entry_identifier)
	end
	if self.pageEntryIdentifier ~= nil then
		var5498.page_entry_identifier = propTypesModule.StringProp.jsonDecode(self.pageEntryIdentifier)
	end
	if self.feed_entry_identifier ~= nil then
		var5498.feed_entry_identifier = propTypesModule.StringProp.jsonDecode(self.feed_entry_identifier)
	end
	if self.feedEntryIdentifier ~= nil then
		var5498.feed_entry_identifier = propTypesModule.StringProp.jsonDecode(self.feedEntryIdentifier)
	end
	if self.selected_option_ids ~= nil then
		var5498.selected_option_ids = propTypesModule.StringArrayProp.jsonDecode(self.selected_option_ids)
	end
	if self.selectedOptionIds ~= nil then
		var5498.selected_option_ids = propTypesModule.StringArrayProp.jsonDecode(self.selectedOptionIds)
	end
	return var5498
end

t_165.descriptor = {
	name = "RefreshFeedEntryFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshFeedEntryFromApiAction_Params = t_165
typeRegistryModule.default:register(t.RefreshFeedEntryFromApiAction_Params)
local t_166 = {}
t_166.__index = t_166

function t_166.new(p327) --[[ line: 30463 ]]
	-- upvalues: t (ref), t_166 (ref)
	return setmetatable({
		action_type = if p327 == nil or p327.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p327.action_type,
		action_params = if p327 == nil or p327.action_params == nil then nil else p327.action_params
	}, t_166)
end

function t_166:encode() --[[ line: 30474 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var5500 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var5501, var5502 = protoModule.writeTag(buff, var5500, 1, protoModule.wireTypes.varint)
		var5501, var5502 = protoModule.writeVarInt(var5501, var5502, t.ActionType.toNumber(self.action_type))
		buff = var5501
		var5500 = var5502
	end
	if self.action_params ~= nil then
		local var5503 = self.action_params:encode()
		local var5504, var5505 = protoModule.writeTag(buff, var5500, 2, protoModule.wireTypes.lengthDelimited)
		var5504, var5505 = protoModule.writeBuffer(var5504, var5505, var5503, buffer.len(var5503))
		buff = var5504
		var5500 = var5505
	end
	local buff_1 = buffer.create(var5500)
	buffer.copy(buff_1, 0, buff, 0, var5500)
	
	return buff_1
end

function t_166.decode(p328) --[[ line: 30500 ]]
	-- upvalues: t_166 (ref), protoModule (ref), t (ref)
	local var5507 = t_166.new()
	local var5508 = 0
	while var5508 < buffer.len(p328) do
		local _ = nil
		local var5509 = nil
		local var5510, var5511, var5512 = protoModule.readTag(p328, var5508)
		local var5513 = var5510
		var5509 = var5511
		var5508 = var5512
		
		if var5509 == protoModule.wireTypes.varint then
			if var5513 == 1 then
				local _ = nil
				local var5514, var5515 = protoModule.readVarIntI32(p328, var5508)
				local var5516 = var5514
				var5508 = var5515
				var5507.action_type = t.ActionType.fromNumber(var5516) or var5516
			else
				local _ = nil
				local var5517, var5518 = protoModule.readVarInt(p328, var5508)
				local _ = var5517
				var5508 = var5518
			end
		end
		if var5509 == protoModule.wireTypes.lengthDelimited then
			if var5513 == 2 then
				local _ = nil
				local var5519, var5520 = protoModule.readBuffer(p328, var5508)
				var5508 = var5520
				var5507.action_params = t.OpenProfileFramesEditorAction_Params.decode(var5519)
			else
				local _ = nil
				local var5521, var5522 = protoModule.readVarInt(p328, var5508)
				var5508 = var5522 + var5521
			end
		elseif var5509 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5523, var5524 = protoModule.readFixed32(p328, var5508)
			local _ = var5523
			var5508 = var5524
		elseif var5509 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5525, var5526 = protoModule.readFixed64(p328, var5508)
			local _ = var5525
			var5508 = var5526
		else
			error("Unsupported wire type: " .. var5509)
		end
	end
	return var5507
end

function t_166:jsonEncode() --[[ line: 30548 ]]
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

function t_166:jsonDecode() --[[ line: 30570 ]]
	-- upvalues: t_166 (ref), t (ref)
	local var5528 = t_166.new()
	
	if self.action_type ~= nil then
		var5528.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var5528.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var5528.action_params = t.OpenProfileFramesEditorAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var5528.action_params = t.OpenProfileFramesEditorAction_Params.jsonDecode(self.actionParams)
	end
	return var5528
end

t_166.descriptor = {
	name = "OpenProfileFramesEditorAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenProfileFramesEditorAction"
}
t.OpenProfileFramesEditorAction = t_166
typeRegistryModule.default:register(t.OpenProfileFramesEditorAction)
local t_167 = {}
t_167.__index = t_167

function t_167.new(p329) --[[ line: 30610 ]]
	-- upvalues: t_167 (ref)
	return setmetatable({
		prompt_id = if p329 == nil or p329.prompt_id == nil then nil else p329.prompt_id,
		prompt_type = if p329 == nil or p329.prompt_type == nil then nil else p329.prompt_type,
		source = if p329 == nil or p329.source == nil then nil else p329.source
	}, t_167)
end

function t_167:encode() --[[ line: 30620 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5530 = 0
	
	if self.prompt_id ~= nil then
		local var5531 = self.prompt_id:encode()
		local var5532, var5533 = protoModule.writeTag(buff, var5530, 1, protoModule.wireTypes.lengthDelimited)
		var5532, var5533 = protoModule.writeBuffer(var5532, var5533, var5531, buffer.len(var5531))
		buff = var5532
		var5530 = var5533
	end
	if self.prompt_type ~= nil then
		local var5534 = self.prompt_type:encode()
		local var5535, var5536 = protoModule.writeTag(buff, var5530, 2, protoModule.wireTypes.lengthDelimited)
		var5535, var5536 = protoModule.writeBuffer(var5535, var5536, var5534, buffer.len(var5534))
		buff = var5535
		var5530 = var5536
	end
	if self.source ~= nil then
		local var5537 = self.source:encode()
		local var5538, var5539 = protoModule.writeTag(buff, var5530, 3, protoModule.wireTypes.lengthDelimited)
		var5538, var5539 = protoModule.writeBuffer(var5538, var5539, var5537, buffer.len(var5537))
		buff = var5538
		var5530 = var5539
	end
	local buff_1 = buffer.create(var5530)
	buffer.copy(buff_1, 0, buff, 0, var5530)
	
	return buff_1
end

function t_167.decode(p330) --[[ line: 30647 ]]
	-- upvalues: t_167 (ref), protoModule (ref), propTypesModule (ref)
	local var5541 = t_167.new()
	local var5542 = 0
	while var5542 < buffer.len(p330) do
		local _ = nil
		local var5543 = nil
		local var5544, var5545, var5546 = protoModule.readTag(p330, var5542)
		local var5547 = var5544
		var5543 = var5545
		var5542 = var5546
		
		if var5543 == protoModule.wireTypes.varint then
			local _ = nil
			local var5548, var5549 = protoModule.readVarInt(p330, var5542)
			local _ = var5548
			var5542 = var5549
			continue
		end
		if var5543 == protoModule.wireTypes.lengthDelimited then
			if var5547 == 1 then
				local _ = nil
				local var5550, var5551 = protoModule.readBuffer(p330, var5542)
				var5542 = var5551
				var5541.prompt_id = propTypesModule.StringProp.decode(var5550)
			elseif var5547 == 2 then
				local _ = nil
				local var5552, var5553 = protoModule.readBuffer(p330, var5542)
				var5542 = var5553
				var5541.prompt_type = propTypesModule.StringProp.decode(var5552)
			elseif var5547 == 3 then
				local _ = nil
				local var5554, var5555 = protoModule.readBuffer(p330, var5542)
				var5542 = var5555
				var5541.source = propTypesModule.StringProp.decode(var5554)
			else
				local _ = nil
				local var5556, var5557 = protoModule.readVarInt(p330, var5542)
				var5542 = var5557 + var5556
			end
		elseif var5543 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5558, var5559 = protoModule.readFixed32(p330, var5542)
			local _ = var5558
			var5542 = var5559
		elseif var5543 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5560, var5561 = protoModule.readFixed64(p330, var5542)
			local _ = var5560
			var5542 = var5561
		else
			error("Unsupported wire type: " .. var5543)
		end
	end
	return var5541
end

function t_167:jsonEncode() --[[ line: 30700 ]]
	local t = {}
	
	if self.prompt_id ~= nil then
		t.promptId = self.prompt_id:jsonEncode()
	end
	if self.prompt_type ~= nil then
		t.promptType = self.prompt_type:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_167:jsonDecode() --[[ line: 30718 ]]
	-- upvalues: t_167 (ref), propTypesModule (ref)
	local var5563 = t_167.new()
	
	if self.prompt_id ~= nil then
		var5563.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var5563.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.prompt_type ~= nil then
		var5563.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var5563.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.source ~= nil then
		var5563.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var5563
end

t_167.descriptor = {
	name = "OpenProfileFramesEditorAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenProfileFramesEditorAction_Params = t_167
typeRegistryModule.default:register(t.OpenProfileFramesEditorAction_Params)
local t_168 = {}
t_168.__index = t_168

function t_168.new(p331) --[[ line: 30761 ]]
	-- upvalues: t_168 (ref)
	return setmetatable({
		kind = if p331 == nil or p331.kind == nil then nil else p331.kind,
		telemetry_handler = if p331 == nil or p331.telemetry_handler == nil then nil else p331.telemetry_handler,
		accessibility_label = if p331 == nil or p331.accessibility_label == nil then nil else p331.accessibility_label,
		skip_unified_logging = if p331 == nil or p331.skip_unified_logging == nil then nil else p331.skip_unified_logging
	}, t_168)
end

function t_168:encode() --[[ line: 30774 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5565 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "dismiss_dialog_action" then
			local var5566 = self.kind.value:encode()
			local var5567, var5568 = protoModule.writeTag(buff, var5565, 1, protoModule.wireTypes.lengthDelimited)
			var5567, var5568 = protoModule.writeBuffer(var5567, var5568, var5566, buffer.len(var5566))
			buff = var5567
			var5565 = var5568
		elseif self.kind.type == "link_action" then
			local var5569 = self.kind.value:encode()
			local var5570, var5571 = protoModule.writeTag(buff, var5565, 2, protoModule.wireTypes.lengthDelimited)
			var5570, var5571 = protoModule.writeBuffer(var5570, var5571, var5569, buffer.len(var5569))
			buff = var5570
			var5565 = var5571
		elseif self.kind.type == "open_game_details_action" then
			local var5572 = self.kind.value:encode()
			local var5573, var5574 = protoModule.writeTag(buff, var5565, 3, protoModule.wireTypes.lengthDelimited)
			var5573, var5574 = protoModule.writeBuffer(var5573, var5574, var5572, buffer.len(var5572))
			buff = var5573
			var5565 = var5574
		elseif self.kind.type == "open_join_friends_action" then
			local var5575 = self.kind.value:encode()
			local var5576, var5577 = protoModule.writeTag(buff, var5565, 4, protoModule.wireTypes.lengthDelimited)
			var5576, var5577 = protoModule.writeBuffer(var5576, var5577, var5575, buffer.len(var5575))
			buff = var5576
			var5565 = var5577
		elseif self.kind.type == "open_marketplace_try_on_action" then
			local var5578 = self.kind.value:encode()
			local var5579, var5580 = protoModule.writeTag(buff, var5565, 5, protoModule.wireTypes.lengthDelimited)
			var5579, var5580 = protoModule.writeBuffer(var5579, var5580, var5578, buffer.len(var5578))
			buff = var5579
			var5565 = var5580
		elseif self.kind.type == "open_see_all_action" then
			local var5581 = self.kind.value:encode()
			local var5582, var5583 = protoModule.writeTag(buff, var5565, 6, protoModule.wireTypes.lengthDelimited)
			var5582, var5583 = protoModule.writeBuffer(var5582, var5583, var5581, buffer.len(var5581))
			buff = var5582
			var5565 = var5583
		elseif self.kind.type == "open_sponsored_tooltip_action" then
			local var5584 = self.kind.value:encode()
			local var5585, var5586 = protoModule.writeTag(buff, var5565, 7, protoModule.wireTypes.lengthDelimited)
			var5585, var5586 = protoModule.writeBuffer(var5585, var5586, var5584, buffer.len(var5584))
			buff = var5585
			var5565 = var5586
		elseif self.kind.type == "play_button_click_action" then
			local var5587 = self.kind.value:encode()
			local var5588, var5589 = protoModule.writeTag(buff, var5565, 8, protoModule.wireTypes.lengthDelimited)
			var5588, var5589 = protoModule.writeBuffer(var5588, var5589, var5587, buffer.len(var5587))
			buff = var5588
			var5565 = var5589
		elseif self.kind.type == "update_user_settings_action" then
			local var5590 = self.kind.value:encode()
			local var5591, var5592 = protoModule.writeTag(buff, var5565, 9, protoModule.wireTypes.lengthDelimited)
			var5591, var5592 = protoModule.writeBuffer(var5591, var5592, var5590, buffer.len(var5590))
			buff = var5591
			var5565 = var5592
		elseif self.kind.type == "open_tooltip_action" then
			local var5593 = self.kind.value:encode()
			local var5594, var5595 = protoModule.writeTag(buff, var5565, 10, protoModule.wireTypes.lengthDelimited)
			var5594, var5595 = protoModule.writeBuffer(var5594, var5595, var5593, buffer.len(var5593))
			buff = var5594
			var5565 = var5595
		elseif self.kind.type == "open_badge_details_action" then
			local var5596 = self.kind.value:encode()
			local var5597, var5598 = protoModule.writeTag(buff, var5565, 11, protoModule.wireTypes.lengthDelimited)
			var5597, var5598 = protoModule.writeBuffer(var5597, var5598, var5596, buffer.len(var5596))
			buff = var5597
			var5565 = var5598
		elseif self.kind.type == "load_more_from_api_action" then
			local var5599 = self.kind.value:encode()
			local var5600, var5601 = protoModule.writeTag(buff, var5565, 12, protoModule.wireTypes.lengthDelimited)
			var5600, var5601 = protoModule.writeBuffer(var5600, var5601, var5599, buffer.len(var5599))
			buff = var5600
			var5565 = var5601
		elseif self.kind.type == "share_action" then
			local var5602 = self.kind.value:encode()
			local var5603, var5604 = protoModule.writeTag(buff, var5565, 13, protoModule.wireTypes.lengthDelimited)
			var5603, var5604 = protoModule.writeBuffer(var5603, var5604, var5602, buffer.len(var5602))
			buff = var5603
			var5565 = var5604
		elseif self.kind.type == "open_abuse_report_action" then
			local var5605 = self.kind.value:encode()
			local var5606, var5607 = protoModule.writeTag(buff, var5565, 14, protoModule.wireTypes.lengthDelimited)
			var5606, var5607 = protoModule.writeBuffer(var5606, var5607, var5605, buffer.len(var5605))
			buff = var5606
			var5565 = var5607
		elseif self.kind.type == "remove_badge_from_inventory_action" then
			local var5608 = self.kind.value:encode()
			local var5609, var5610 = protoModule.writeTag(buff, var5565, 15, protoModule.wireTypes.lengthDelimited)
			var5609, var5610 = protoModule.writeBuffer(var5609, var5610, var5608, buffer.len(var5608))
			buff = var5609
			var5565 = var5610
		elseif self.kind.type == "open_profile_action" then
			local var5611 = self.kind.value:encode()
			local var5612, var5613 = protoModule.writeTag(buff, var5565, 16, protoModule.wireTypes.lengthDelimited)
			var5612, var5613 = protoModule.writeBuffer(var5612, var5613, var5611, buffer.len(var5611))
			buff = var5612
			var5565 = var5613
		elseif self.kind.type == "open_facial_age_estimation_action" then
			local var5614 = self.kind.value:encode()
			local var5615, var5616 = protoModule.writeTag(buff, var5565, 17, protoModule.wireTypes.lengthDelimited)
			var5615, var5616 = protoModule.writeBuffer(var5615, var5616, var5614, buffer.len(var5614))
			buff = var5615
			var5565 = var5616
		elseif self.kind.type == "open_add_connections_page_action" then
			local var5617 = self.kind.value:encode()
			local var5618, var5619 = protoModule.writeTag(buff, var5565, 18, protoModule.wireTypes.lengthDelimited)
			var5618, var5619 = protoModule.writeBuffer(var5618, var5619, var5617, buffer.len(var5617))
			buff = var5618
			var5565 = var5619
		elseif self.kind.type == "open_marketplace_action" then
			local var5620 = self.kind.value:encode()
			local var5621, var5622 = protoModule.writeTag(buff, var5565, 19, protoModule.wireTypes.lengthDelimited)
			var5621, var5622 = protoModule.writeBuffer(var5621, var5622, var5620, buffer.len(var5620))
			buff = var5621
			var5565 = var5622
		elseif self.kind.type == "hide_profile_completion_action" then
			local var5623 = self.kind.value:encode()
			local var5624, var5625 = protoModule.writeTag(buff, var5565, 20, protoModule.wireTypes.lengthDelimited)
			var5624, var5625 = protoModule.writeBuffer(var5624, var5625, var5623, buffer.len(var5623))
			buff = var5624
			var5565 = var5625
		elseif self.kind.type == "select_marketplace_catalog_category" then
			local var5626 = self.kind.value:encode()
			local var5627, var5628 = protoModule.writeTag(buff, var5565, 21, protoModule.wireTypes.lengthDelimited)
			var5627, var5628 = protoModule.writeBuffer(var5627, var5628, var5626, buffer.len(var5626))
			buff = var5627
			var5565 = var5628
		elseif self.kind.type == "select_marketplace_catalog_subcategory" then
			local var5629 = self.kind.value:encode()
			local var5630, var5631 = protoModule.writeTag(buff, var5565, 22, protoModule.wireTypes.lengthDelimited)
			var5630, var5631 = protoModule.writeBuffer(var5630, var5631, var5629, buffer.len(var5629))
			buff = var5630
			var5565 = var5631
		elseif self.kind.type == "open_marketplace_catalog_see_all" then
			local var5632 = self.kind.value:encode()
			local var5633, var5634 = protoModule.writeTag(buff, var5565, 23, protoModule.wireTypes.lengthDelimited)
			var5633, var5634 = protoModule.writeBuffer(var5633, var5634, var5632, buffer.len(var5632))
			buff = var5633
			var5565 = var5634
		elseif self.kind.type == "close_marketplace_category_tooltip" then
			local var5635 = self.kind.value:encode()
			local var5636, var5637 = protoModule.writeTag(buff, var5565, 24, protoModule.wireTypes.lengthDelimited)
			var5636, var5637 = protoModule.writeBuffer(var5636, var5637, var5635, buffer.len(var5635))
			buff = var5636
			var5565 = var5637
		elseif self.kind.type == "resize_marketplace_catalog" then
			local var5638 = self.kind.value:encode()
			local var5639, var5640 = protoModule.writeTag(buff, var5565, 25, protoModule.wireTypes.lengthDelimited)
			var5639, var5640 = protoModule.writeBuffer(var5639, var5640, var5638, buffer.len(var5638))
			buff = var5639
			var5565 = var5640
		elseif self.kind.type == "open_marketplace_catalog_filters" then
			local var5641 = self.kind.value:encode()
			local var5642, var5643 = protoModule.writeTag(buff, var5565, 26, protoModule.wireTypes.lengthDelimited)
			var5642, var5643 = protoModule.writeBuffer(var5642, var5643, var5641, buffer.len(var5641))
			buff = var5642
			var5565 = var5643
		elseif self.kind.type == "open_social_link_action" then
			local var5644 = self.kind.value:encode()
			local var5645, var5646 = protoModule.writeTag(buff, var5565, 27, protoModule.wireTypes.lengthDelimited)
			var5645, var5646 = protoModule.writeBuffer(var5645, var5646, var5644, buffer.len(var5644))
			buff = var5645
			var5565 = var5646
		elseif self.kind.type == "open_charts_sort_detail_action" then
			local var5647 = self.kind.value:encode()
			local var5648, var5649 = protoModule.writeTag(buff, var5565, 28, protoModule.wireTypes.lengthDelimited)
			var5648, var5649 = protoModule.writeBuffer(var5648, var5649, var5647, buffer.len(var5647))
			buff = var5648
			var5565 = var5649
		elseif self.kind.type == "open_song_detail_action" then
			local var5650 = self.kind.value:encode()
			local var5651, var5652 = protoModule.writeTag(buff, var5565, 29, protoModule.wireTypes.lengthDelimited)
			var5651, var5652 = protoModule.writeBuffer(var5651, var5652, var5650, buffer.len(var5650))
			buff = var5651
			var5565 = var5652
		elseif self.kind.type == "refresh_from_api_action" then
			local var5653 = self.kind.value:encode()
			local var5654, var5655 = protoModule.writeTag(buff, var5565, 30, protoModule.wireTypes.lengthDelimited)
			var5654, var5655 = protoModule.writeBuffer(var5654, var5655, var5653, buffer.len(var5653))
			buff = var5654
			var5565 = var5655
		elseif self.kind.type == "rsvp_to_event_action" then
			local var5656 = self.kind.value:encode()
			local var5657, var5658 = protoModule.writeTag(buff, var5565, 31, protoModule.wireTypes.lengthDelimited)
			var5657, var5658 = protoModule.writeBuffer(var5657, var5658, var5656, buffer.len(var5656))
			buff = var5657
			var5565 = var5658
		elseif self.kind.type == "apply_charts_filter_action" then
			local var5659 = self.kind.value:encode()
			local var5660, var5661 = protoModule.writeTag(buff, var5565, 32, protoModule.wireTypes.lengthDelimited)
			var5660, var5661 = protoModule.writeBuffer(var5660, var5661, var5659, buffer.len(var5659))
			buff = var5660
			var5565 = var5661
		elseif self.kind.type == "analytics_event_action" then
			local var5662 = self.kind.value:encode()
			local var5663, var5664 = protoModule.writeTag(buff, var5565, 33, protoModule.wireTypes.lengthDelimited)
			var5663, var5664 = protoModule.writeBuffer(var5663, var5664, var5662, buffer.len(var5662))
			buff = var5663
			var5565 = var5664
		elseif self.kind.type == "custom_analytics_event_action" then
			local var5665 = self.kind.value:encode()
			local var5666, var5667 = protoModule.writeTag(buff, var5565, 34, protoModule.wireTypes.lengthDelimited)
			var5666, var5667 = protoModule.writeBuffer(var5666, var5667, var5665, buffer.len(var5665))
			buff = var5666
			var5565 = var5667
		elseif self.kind.type == "open_game_invite_action" then
			local var5668 = self.kind.value:encode()
			local var5669, var5670 = protoModule.writeTag(buff, var5565, 35, protoModule.wireTypes.lengthDelimited)
			var5669, var5670 = protoModule.writeBuffer(var5669, var5670, var5668, buffer.len(var5668))
			buff = var5669
			var5565 = var5670
		elseif self.kind.type == "open_event_details_action" then
			local var5671 = self.kind.value:encode()
			local var5672, var5673 = protoModule.writeTag(buff, var5565, 36, protoModule.wireTypes.lengthDelimited)
			var5672, var5673 = protoModule.writeBuffer(var5672, var5673, var5671, buffer.len(var5671))
			buff = var5672
			var5565 = var5673
		elseif self.kind.type == "launch_experience_action" then
			local var5674 = self.kind.value:encode()
			local var5675, var5676 = protoModule.writeTag(buff, var5565, 37, protoModule.wireTypes.lengthDelimited)
			var5675, var5676 = protoModule.writeBuffer(var5675, var5676, var5674, buffer.len(var5674))
			buff = var5675
			var5565 = var5676
		elseif self.kind.type == "toggle_experience_favorite_action" then
			local var5677 = self.kind.value:encode()
			local var5678, var5679 = protoModule.writeTag(buff, var5565, 38, protoModule.wireTypes.lengthDelimited)
			var5678, var5679 = protoModule.writeBuffer(var5678, var5679, var5677, buffer.len(var5677))
			buff = var5678
			var5565 = var5679
		elseif self.kind.type == "toggle_experience_follow_action" then
			local var5680 = self.kind.value:encode()
			local var5681, var5682 = protoModule.writeTag(buff, var5565, 39, protoModule.wireTypes.lengthDelimited)
			var5681, var5682 = protoModule.writeBuffer(var5681, var5682, var5680, buffer.len(var5680))
			buff = var5681
			var5565 = var5682
		elseif self.kind.type == "toggle_experience_vote_action" then
			local var5683 = self.kind.value:encode()
			local var5684, var5685 = protoModule.writeTag(buff, var5565, 40, protoModule.wireTypes.lengthDelimited)
			var5684, var5685 = protoModule.writeBuffer(var5684, var5685, var5683, buffer.len(var5683))
			buff = var5684
			var5565 = var5685
		elseif self.kind.type == "open_purchase_prompt_action" then
			local var5686 = self.kind.value:encode()
			local var5687, var5688 = protoModule.writeTag(buff, var5565, 41, protoModule.wireTypes.lengthDelimited)
			var5687, var5688 = protoModule.writeBuffer(var5687, var5688, var5686, buffer.len(var5686))
			buff = var5687
			var5565 = var5688
		elseif self.kind.type == "open_sdui_overlay_action" then
			local var5689 = self.kind.value:encode()
			local var5690, var5691 = protoModule.writeTag(buff, var5565, 42, protoModule.wireTypes.lengthDelimited)
			var5690, var5691 = protoModule.writeBuffer(var5690, var5691, var5689, buffer.len(var5689))
			buff = var5690
			var5565 = var5691
		elseif self.kind.type == "open_badges_see_all_action" then
			local var5692 = self.kind.value:encode()
			local var5693, var5694 = protoModule.writeTag(buff, var5565, 43, protoModule.wireTypes.lengthDelimited)
			var5693, var5694 = protoModule.writeBuffer(var5693, var5694, var5692, buffer.len(var5692))
			buff = var5693
			var5565 = var5694
		elseif self.kind.type == "open_experience_store_see_all_action" then
			local var5695 = self.kind.value:encode()
			local var5696, var5697 = protoModule.writeTag(buff, var5565, 44, protoModule.wireTypes.lengthDelimited)
			var5696, var5697 = protoModule.writeBuffer(var5696, var5697, var5695, buffer.len(var5695))
			buff = var5696
			var5565 = var5697
		elseif self.kind.type == "dismiss_game_feedback_action" then
			local var5698 = self.kind.value:encode()
			local var5699, var5700 = protoModule.writeTag(buff, var5565, 45, protoModule.wireTypes.lengthDelimited)
			var5699, var5700 = protoModule.writeBuffer(var5699, var5700, var5698, buffer.len(var5698))
			buff = var5699
			var5565 = var5700
		elseif self.kind.type == "open_game_feedback_form_action" then
			local var5701 = self.kind.value:encode()
			local var5702, var5703 = protoModule.writeTag(buff, var5565, 46, protoModule.wireTypes.lengthDelimited)
			var5702, var5703 = protoModule.writeBuffer(var5702, var5703, var5701, buffer.len(var5701))
			buff = var5702
			var5565 = var5703
		elseif self.kind.type == "enable_event_notifications_action" then
			local var5704 = self.kind.value:encode()
			local var5705, var5706 = protoModule.writeTag(buff, var5565, 47, protoModule.wireTypes.lengthDelimited)
			var5705, var5706 = protoModule.writeBuffer(var5705, var5706, var5704, buffer.len(var5704))
			buff = var5705
			var5565 = var5706
		elseif self.kind.type == "dismiss_event_notifications_modal_action" then
			local var5707 = self.kind.value:encode()
			local var5708, var5709 = protoModule.writeTag(buff, var5565, 48, protoModule.wireTypes.lengthDelimited)
			var5708, var5709 = protoModule.writeBuffer(var5708, var5709, var5707, buffer.len(var5707))
			buff = var5708
			var5565 = var5709
		elseif self.kind.type == "open_amp_wizard_action" then
			local var5710 = self.kind.value:encode()
			local var5711, var5712 = protoModule.writeTag(buff, var5565, 49, protoModule.wireTypes.lengthDelimited)
			var5711, var5712 = protoModule.writeBuffer(var5711, var5712, var5710, buffer.len(var5710))
			buff = var5711
			var5565 = var5712
		elseif self.kind.type == "open_subscription_purchase_page_action" then
			local var5713 = self.kind.value:encode()
			local var5714, var5715 = protoModule.writeTag(buff, var5565, 50, protoModule.wireTypes.lengthDelimited)
			var5714, var5715 = protoModule.writeBuffer(var5714, var5715, var5713, buffer.len(var5713))
			buff = var5714
			var5565 = var5715
		elseif self.kind.type == "refresh_game_passes_action" then
			local var5716 = self.kind.value:encode()
			local var5717, var5718 = protoModule.writeTag(buff, var5565, 51, protoModule.wireTypes.lengthDelimited)
			var5717, var5718 = protoModule.writeBuffer(var5717, var5718, var5716, buffer.len(var5716))
			buff = var5717
			var5565 = var5718
		elseif self.kind.type == "refresh_playability_action" then
			local var5719 = self.kind.value:encode()
			local var5720, var5721 = protoModule.writeTag(buff, var5565, 52, protoModule.wireTypes.lengthDelimited)
			var5720, var5721 = protoModule.writeBuffer(var5720, var5721, var5719, buffer.len(var5719))
			buff = var5720
			var5565 = var5721
		elseif self.kind.type == "open_social_proof_user_list_sheet_action" then
			local var5722 = self.kind.value:encode()
			local var5723, var5724 = protoModule.writeTag(buff, var5565, 53, protoModule.wireTypes.lengthDelimited)
			var5723, var5724 = protoModule.writeBuffer(var5723, var5724, var5722, buffer.len(var5722))
			buff = var5723
			var5565 = var5724
		elseif self.kind.type == "report_surface_load_time_milestone_action" then
			local var5725 = self.kind.value:encode()
			local var5726, var5727 = protoModule.writeTag(buff, var5565, 54, protoModule.wireTypes.lengthDelimited)
			var5726, var5727 = protoModule.writeBuffer(var5726, var5727, var5725, buffer.len(var5725))
			buff = var5726
			var5565 = var5727
		elseif self.kind.type == "open_search_results_tab_action" then
			local var5728 = self.kind.value:encode()
			local var5729, var5730 = protoModule.writeTag(buff, var5565, 55, protoModule.wireTypes.lengthDelimited)
			var5729, var5730 = protoModule.writeBuffer(var5729, var5730, var5728, buffer.len(var5728))
			buff = var5729
			var5565 = var5730
		elseif self.kind.type == "open_phone_upsell_modal_action" then
			local var5731 = self.kind.value:encode()
			local var5732, var5733 = protoModule.writeTag(buff, var5565, 56, protoModule.wireTypes.lengthDelimited)
			var5732, var5733 = protoModule.writeBuffer(var5732, var5733, var5731, buffer.len(var5731))
			buff = var5732
			var5565 = var5733
		elseif self.kind.type == "open_email_upsell_modal_action" then
			local var5734 = self.kind.value:encode()
			local var5735, var5736 = protoModule.writeTag(buff, var5565, 57, protoModule.wireTypes.lengthDelimited)
			var5735, var5736 = protoModule.writeBuffer(var5735, var5736, var5734, buffer.len(var5734))
			buff = var5735
			var5565 = var5736
		elseif self.kind.type == "dismiss_prompt_action" then
			local var5737 = self.kind.value:encode()
			local var5738, var5739 = protoModule.writeTag(buff, var5565, 58, protoModule.wireTypes.lengthDelimited)
			var5738, var5739 = protoModule.writeBuffer(var5738, var5739, var5737, buffer.len(var5737))
			buff = var5738
			var5565 = var5739
		elseif self.kind.type == "request_friendship_action" then
			local var5740 = self.kind.value:encode()
			local var5741, var5742 = protoModule.writeTag(buff, var5565, 59, protoModule.wireTypes.lengthDelimited)
			var5741, var5742 = protoModule.writeBuffer(var5741, var5742, var5740, buffer.len(var5740))
			buff = var5741
			var5565 = var5742
		elseif self.kind.type == "refresh_developer_products_action" then
			local var5743 = self.kind.value:encode()
			local var5744, var5745 = protoModule.writeTag(buff, var5565, 60, protoModule.wireTypes.lengthDelimited)
			var5744, var5745 = protoModule.writeBuffer(var5744, var5745, var5743, buffer.len(var5743))
			buff = var5744
			var5565 = var5745
		elseif self.kind.type == "open_fae_trial_upsell_action" then
			local var5746 = self.kind.value:encode()
			local var5747, var5748 = protoModule.writeTag(buff, var5565, 61, protoModule.wireTypes.lengthDelimited)
			var5747, var5748 = protoModule.writeBuffer(var5747, var5748, var5746, buffer.len(var5746))
			buff = var5747
			var5565 = var5748
		elseif self.kind.type == "refresh_omni_recommendation_feed_item_action" then
			local var5749 = self.kind.value:encode()
			local var5750, var5751 = protoModule.writeTag(buff, var5565, 62, protoModule.wireTypes.lengthDelimited)
			var5750, var5751 = protoModule.writeBuffer(var5750, var5751, var5749, buffer.len(var5749))
			buff = var5750
			var5565 = var5751
		elseif self.kind.type == "ai_overview_feedback_action" then
			local var5752 = self.kind.value:encode()
			local var5753, var5754 = protoModule.writeTag(buff, var5565, 63, protoModule.wireTypes.lengthDelimited)
			var5753, var5754 = protoModule.writeBuffer(var5753, var5754, var5752, buffer.len(var5752))
			buff = var5753
			var5565 = var5754
		elseif self.kind.type == "open_trusted_friends_upsell_modal_action" then
			local var5755 = self.kind.value:encode()
			local var5756, var5757 = protoModule.writeTag(buff, var5565, 64, protoModule.wireTypes.lengthDelimited)
			var5756, var5757 = protoModule.writeBuffer(var5756, var5757, var5755, buffer.len(var5755))
			buff = var5756
			var5565 = var5757
		elseif self.kind.type == "record_party_chat_conversation_upsell_acknowledgement_action" then
			local var5758 = self.kind.value:encode()
			local var5759, var5760 = protoModule.writeTag(buff, var5565, 65, protoModule.wireTypes.lengthDelimited)
			var5759, var5760 = protoModule.writeBuffer(var5759, var5760, var5758, buffer.len(var5758))
			buff = var5759
			var5565 = var5760
		elseif self.kind.type == "open_search_results_with_query_action" then
			local var5761 = self.kind.value:encode()
			local var5762, var5763 = protoModule.writeTag(buff, var5565, 66, protoModule.wireTypes.lengthDelimited)
			var5762, var5763 = protoModule.writeBuffer(var5762, var5763, var5761, buffer.len(var5761))
			buff = var5762
			var5565 = var5763
		elseif self.kind.type == "select_marketplace_favorites_category" then
			local var5764 = self.kind.value:encode()
			local var5765, var5766 = protoModule.writeTag(buff, var5565, 67, protoModule.wireTypes.lengthDelimited)
			var5765, var5766 = protoModule.writeBuffer(var5765, var5766, var5764, buffer.len(var5764))
			buff = var5765
			var5565 = var5766
		elseif self.kind.type == "download_app_action" then
			local var5767 = self.kind.value:encode()
			local var5768, var5769 = protoModule.writeTag(buff, var5565, 68, protoModule.wireTypes.lengthDelimited)
			var5768, var5769 = protoModule.writeBuffer(var5768, var5769, var5767, buffer.len(var5767))
			buff = var5768
			var5565 = var5769
		elseif self.kind.type == "refresh_charts_sort_detail_action" then
			local var5770 = self.kind.value:encode()
			local var5771, var5772 = protoModule.writeTag(buff, var5565, 69, protoModule.wireTypes.lengthDelimited)
			var5771, var5772 = protoModule.writeBuffer(var5771, var5772, var5770, buffer.len(var5770))
			buff = var5771
			var5565 = var5772
		elseif self.kind.type == "join_community_action" then
			local var5773 = self.kind.value:encode()
			local var5774, var5775 = protoModule.writeTag(buff, var5565, 70, protoModule.wireTypes.lengthDelimited)
			var5774, var5775 = protoModule.writeBuffer(var5774, var5775, var5773, buffer.len(var5773))
			buff = var5774
			var5565 = var5775
		elseif self.kind.type == "view_community_action" then
			local var5776 = self.kind.value:encode()
			local var5777, var5778 = protoModule.writeTag(buff, var5565, 71, protoModule.wireTypes.lengthDelimited)
			var5777, var5778 = protoModule.writeBuffer(var5777, var5778, var5776, buffer.len(var5776))
			buff = var5777
			var5565 = var5778
		elseif self.kind.type == "pin_experience_shortcut_action" then
			local var5779 = self.kind.value:encode()
			local var5780, var5781 = protoModule.writeTag(buff, var5565, 72, protoModule.wireTypes.lengthDelimited)
			var5780, var5781 = protoModule.writeBuffer(var5780, var5781, var5779, buffer.len(var5779))
			buff = var5780
			var5565 = var5781
		elseif self.kind.type == "select_marketplace_favorites_subcategory" then
			local var5782 = self.kind.value:encode()
			local var5783, var5784 = protoModule.writeTag(buff, var5565, 73, protoModule.wireTypes.lengthDelimited)
			var5783, var5784 = protoModule.writeBuffer(var5783, var5784, var5782, buffer.len(var5782))
			buff = var5783
			var5565 = var5784
		elseif self.kind.type == "show_toast_action" then
			local var5785 = self.kind.value:encode()
			local var5786, var5787 = protoModule.writeTag(buff, var5565, 74, protoModule.wireTypes.lengthDelimited)
			var5786, var5787 = protoModule.writeBuffer(var5786, var5787, var5785, buffer.len(var5785))
			buff = var5786
			var5565 = var5787
		elseif self.kind.type == "open_incoming_transfer_upsell_action" then
			local var5788 = self.kind.value:encode()
			local var5789, var5790 = protoModule.writeTag(buff, var5565, 75, protoModule.wireTypes.lengthDelimited)
			var5789, var5790 = protoModule.writeBuffer(var5789, var5790, var5788, buffer.len(var5788))
			buff = var5789
			var5565 = var5790
		elseif self.kind.type == "action_sequence_action" then
			local var5791 = self.kind.value:encode()
			local var5792, var5793 = protoModule.writeTag(buff, var5565, 76, protoModule.wireTypes.lengthDelimited)
			var5792, var5793 = protoModule.writeBuffer(var5792, var5793, var5791, buffer.len(var5791))
			buff = var5792
			var5565 = var5793
		elseif self.kind.type == "refresh_feed_entry_from_api_action" then
			local var5794 = self.kind.value:encode()
			local var5795, var5796 = protoModule.writeTag(buff, var5565, 77, protoModule.wireTypes.lengthDelimited)
			var5795, var5796 = protoModule.writeBuffer(var5795, var5796, var5794, buffer.len(var5794))
			buff = var5795
			var5565 = var5796
		elseif self.kind.type == "open_profile_frames_editor_action" then
			local var5797 = self.kind.value:encode()
			local var5798, var5799 = protoModule.writeTag(buff, var5565, 78, protoModule.wireTypes.lengthDelimited)
			var5798, var5799 = protoModule.writeBuffer(var5798, var5799, var5797, buffer.len(var5797))
			buff = var5798
			var5565 = var5799
		end
	end
	if self.telemetry_handler ~= nil then
		local var5800 = self.telemetry_handler:encode()
		local var5801, var5802 = protoModule.writeTag(buff, var5565, 1000, protoModule.wireTypes.lengthDelimited)
		var5801, var5802 = protoModule.writeBuffer(var5801, var5802, var5800, buffer.len(var5800))
		buff = var5801
		var5565 = var5802
	end
	if self.accessibility_label ~= nil then
		local var5803 = self.accessibility_label:encode()
		local var5804, var5805 = protoModule.writeTag(buff, var5565, 1001, protoModule.wireTypes.lengthDelimited)
		var5804, var5805 = protoModule.writeBuffer(var5804, var5805, var5803, buffer.len(var5803))
		buff = var5804
		var5565 = var5805
	end
	if self.skip_unified_logging ~= nil then
		local var5806 = self.skip_unified_logging:encode()
		local var5807, var5808 = protoModule.writeTag(buff, var5565, 1002, protoModule.wireTypes.lengthDelimited)
		var5807, var5808 = protoModule.writeBuffer(var5807, var5808, var5806, buffer.len(var5806))
		buff = var5807
		var5565 = var5808
	end
	local buff_1 = buffer.create(var5565)
	buffer.copy(buff_1, 0, buff, 0, var5565)
	
	return buff_1
end

function t_168.decode(p332) --[[ line: 31117 ]]
	-- upvalues: t_168 (ref), protoModule (ref), t (ref), propTypesModule (ref)
	local var5810 = t_168.new()
	local var5811 = 0
	while var5811 < buffer.len(p332) do
		local _ = nil
		local var5812 = nil
		local var5813, var5814, var5815 = protoModule.readTag(p332, var5811)
		local var5816 = var5813
		var5812 = var5814
		var5811 = var5815
		
		if var5812 == protoModule.wireTypes.varint then
			local _ = nil
			local var5817, var5818 = protoModule.readVarInt(p332, var5811)
			local _ = var5817
			var5811 = var5818
			continue
		end
		if var5812 == protoModule.wireTypes.lengthDelimited then
			if var5816 == 1 then
				local _ = nil
				local var5819, var5820 = protoModule.readBuffer(p332, var5811)
				var5811 = var5820
				var5810.kind = {
					type = "dismiss_dialog_action",
					value = t.DismissDialogAction.decode(var5819)
				}
			elseif var5816 == 2 then
				local _ = nil
				local var5821, var5822 = protoModule.readBuffer(p332, var5811)
				var5811 = var5822
				var5810.kind = {
					type = "link_action",
					value = t.LinkAction.decode(var5821)
				}
			elseif var5816 == 3 then
				local _ = nil
				local var5823, var5824 = protoModule.readBuffer(p332, var5811)
				var5811 = var5824
				var5810.kind = {
					type = "open_game_details_action",
					value = t.OpenGameDetailsAction.decode(var5823)
				}
			elseif var5816 == 4 then
				local _ = nil
				local var5825, var5826 = protoModule.readBuffer(p332, var5811)
				var5811 = var5826
				var5810.kind = {
					type = "open_join_friends_action",
					value = t.OpenJoinFriendsAction.decode(var5825)
				}
			elseif var5816 == 5 then
				local _ = nil
				local var5827, var5828 = protoModule.readBuffer(p332, var5811)
				var5811 = var5828
				var5810.kind = {
					type = "open_marketplace_try_on_action",
					value = t.OpenMarketplaceTryOnAction.decode(var5827)
				}
			elseif var5816 == 6 then
				local _ = nil
				local var5829, var5830 = protoModule.readBuffer(p332, var5811)
				var5811 = var5830
				var5810.kind = {
					type = "open_see_all_action",
					value = t.OpenSeeAllAction.decode(var5829)
				}
			elseif var5816 == 7 then
				local _ = nil
				local var5831, var5832 = protoModule.readBuffer(p332, var5811)
				var5811 = var5832
				var5810.kind = {
					type = "open_sponsored_tooltip_action",
					value = t.OpenSponsoredTooltipAction.decode(var5831)
				}
			elseif var5816 == 8 then
				local _ = nil
				local var5833, var5834 = protoModule.readBuffer(p332, var5811)
				var5811 = var5834
				var5810.kind = {
					type = "play_button_click_action",
					value = t.PlayButtonClickAction.decode(var5833)
				}
			elseif var5816 == 9 then
				local _ = nil
				local var5835, var5836 = protoModule.readBuffer(p332, var5811)
				var5811 = var5836
				var5810.kind = {
					type = "update_user_settings_action",
					value = t.UpdateUserSettingsAction.decode(var5835)
				}
			elseif var5816 == 10 then
				local _ = nil
				local var5837, var5838 = protoModule.readBuffer(p332, var5811)
				var5811 = var5838
				var5810.kind = {
					type = "open_tooltip_action",
					value = t.OpenTooltipAction.decode(var5837)
				}
			elseif var5816 == 11 then
				local _ = nil
				local var5839, var5840 = protoModule.readBuffer(p332, var5811)
				var5811 = var5840
				var5810.kind = {
					type = "open_badge_details_action",
					value = t.OpenBadgeDetailsAction.decode(var5839)
				}
			elseif var5816 == 12 then
				local _ = nil
				local var5841, var5842 = protoModule.readBuffer(p332, var5811)
				var5811 = var5842
				var5810.kind = {
					type = "load_more_from_api_action",
					value = t.LoadMoreFromApiAction.decode(var5841)
				}
			elseif var5816 == 13 then
				local _ = nil
				local var5843, var5844 = protoModule.readBuffer(p332, var5811)
				var5811 = var5844
				var5810.kind = {
					type = "share_action",
					value = t.ShareAction.decode(var5843)
				}
			elseif var5816 == 14 then
				local _ = nil
				local var5845, var5846 = protoModule.readBuffer(p332, var5811)
				var5811 = var5846
				var5810.kind = {
					type = "open_abuse_report_action",
					value = t.OpenAbuseReportAction.decode(var5845)
				}
			elseif var5816 == 15 then
				local _ = nil
				local var5847, var5848 = protoModule.readBuffer(p332, var5811)
				var5811 = var5848
				var5810.kind = {
					type = "remove_badge_from_inventory_action",
					value = t.RemoveBadgeFromInventoryAction.decode(var5847)
				}
			elseif var5816 == 16 then
				local _ = nil
				local var5849, var5850 = protoModule.readBuffer(p332, var5811)
				var5811 = var5850
				var5810.kind = {
					type = "open_profile_action",
					value = t.OpenProfileAction.decode(var5849)
				}
			elseif var5816 == 17 then
				local _ = nil
				local var5851, var5852 = protoModule.readBuffer(p332, var5811)
				var5811 = var5852
				var5810.kind = {
					type = "open_facial_age_estimation_action",
					value = t.OpenFacialAgeEstimationAction.decode(var5851)
				}
			elseif var5816 == 18 then
				local _ = nil
				local var5853, var5854 = protoModule.readBuffer(p332, var5811)
				var5811 = var5854
				var5810.kind = {
					type = "open_add_connections_page_action",
					value = t.OpenAddConnectionsPageAction.decode(var5853)
				}
			elseif var5816 == 19 then
				local _ = nil
				local var5855, var5856 = protoModule.readBuffer(p332, var5811)
				var5811 = var5856
				var5810.kind = {
					type = "open_marketplace_action",
					value = t.OpenMarketplaceAction.decode(var5855)
				}
			elseif var5816 == 20 then
				local _ = nil
				local var5857, var5858 = protoModule.readBuffer(p332, var5811)
				var5811 = var5858
				var5810.kind = {
					type = "hide_profile_completion_action",
					value = t.HideProfileCompletionAction.decode(var5857)
				}
			elseif var5816 == 21 then
				local _ = nil
				local var5859, var5860 = protoModule.readBuffer(p332, var5811)
				var5811 = var5860
				var5810.kind = {
					type = "select_marketplace_catalog_category",
					value = t.SelectMarketplaceCatalogCategory.decode(var5859)
				}
			elseif var5816 == 22 then
				local _ = nil
				local var5861, var5862 = protoModule.readBuffer(p332, var5811)
				var5811 = var5862
				var5810.kind = {
					type = "select_marketplace_catalog_subcategory",
					value = t.SelectMarketplaceCatalogSubcategory.decode(var5861)
				}
			elseif var5816 == 23 then
				local _ = nil
				local var5863, var5864 = protoModule.readBuffer(p332, var5811)
				var5811 = var5864
				var5810.kind = {
					type = "open_marketplace_catalog_see_all",
					value = t.OpenMarketplaceCatalogSeeAll.decode(var5863)
				}
			elseif var5816 == 24 then
				local _ = nil
				local var5865, var5866 = protoModule.readBuffer(p332, var5811)
				var5811 = var5866
				var5810.kind = {
					type = "close_marketplace_category_tooltip",
					value = t.CloseMarketplaceCategoryTooltip.decode(var5865)
				}
			elseif var5816 == 25 then
				local _ = nil
				local var5867, var5868 = protoModule.readBuffer(p332, var5811)
				var5811 = var5868
				var5810.kind = {
					type = "resize_marketplace_catalog",
					value = t.ResizeMarketplaceCatalog.decode(var5867)
				}
			elseif var5816 == 26 then
				local _ = nil
				local var5869, var5870 = protoModule.readBuffer(p332, var5811)
				var5811 = var5870
				var5810.kind = {
					type = "open_marketplace_catalog_filters",
					value = t.OpenMarketplaceCatalogFilters.decode(var5869)
				}
			elseif var5816 == 27 then
				local _ = nil
				local var5871, var5872 = protoModule.readBuffer(p332, var5811)
				var5811 = var5872
				var5810.kind = {
					type = "open_social_link_action",
					value = t.OpenSocialLinkAction.decode(var5871)
				}
			elseif var5816 == 28 then
				local _ = nil
				local var5873, var5874 = protoModule.readBuffer(p332, var5811)
				var5811 = var5874
				var5810.kind = {
					type = "open_charts_sort_detail_action",
					value = t.OpenChartsSortDetailAction.decode(var5873)
				}
			elseif var5816 == 29 then
				local _ = nil
				local var5875, var5876 = protoModule.readBuffer(p332, var5811)
				var5811 = var5876
				var5810.kind = {
					type = "open_song_detail_action",
					value = t.OpenSongDetailAction.decode(var5875)
				}
			elseif var5816 == 30 then
				local _ = nil
				local var5877, var5878 = protoModule.readBuffer(p332, var5811)
				var5811 = var5878
				var5810.kind = {
					type = "refresh_from_api_action",
					value = t.RefreshFromApiAction.decode(var5877)
				}
			elseif var5816 == 31 then
				local _ = nil
				local var5879, var5880 = protoModule.readBuffer(p332, var5811)
				var5811 = var5880
				var5810.kind = {
					type = "rsvp_to_event_action",
					value = t.RsvpToEventAction.decode(var5879)
				}
			elseif var5816 == 32 then
				local _ = nil
				local var5881, var5882 = protoModule.readBuffer(p332, var5811)
				var5811 = var5882
				var5810.kind = {
					type = "apply_charts_filter_action",
					value = t.ApplyChartsFilterAction.decode(var5881)
				}
			elseif var5816 == 33 then
				local _ = nil
				local var5883, var5884 = protoModule.readBuffer(p332, var5811)
				var5811 = var5884
				var5810.kind = {
					type = "analytics_event_action",
					value = t.AnalyticsEventAction.decode(var5883)
				}
			elseif var5816 == 34 then
				local _ = nil
				local var5885, var5886 = protoModule.readBuffer(p332, var5811)
				var5811 = var5886
				var5810.kind = {
					type = "custom_analytics_event_action",
					value = t.CustomAnalyticsEventAction.decode(var5885)
				}
			elseif var5816 == 35 then
				local _ = nil
				local var5887, var5888 = protoModule.readBuffer(p332, var5811)
				var5811 = var5888
				var5810.kind = {
					type = "open_game_invite_action",
					value = t.OpenGameInviteAction.decode(var5887)
				}
			elseif var5816 == 36 then
				local _ = nil
				local var5889, var5890 = protoModule.readBuffer(p332, var5811)
				var5811 = var5890
				var5810.kind = {
					type = "open_event_details_action",
					value = t.OpenEventDetailsAction.decode(var5889)
				}
			elseif var5816 == 37 then
				local _ = nil
				local var5891, var5892 = protoModule.readBuffer(p332, var5811)
				var5811 = var5892
				var5810.kind = {
					type = "launch_experience_action",
					value = t.LaunchExperienceAction.decode(var5891)
				}
			elseif var5816 == 38 then
				local _ = nil
				local var5893, var5894 = protoModule.readBuffer(p332, var5811)
				var5811 = var5894
				var5810.kind = {
					type = "toggle_experience_favorite_action",
					value = t.ToggleExperienceFavoriteAction.decode(var5893)
				}
			elseif var5816 == 39 then
				local _ = nil
				local var5895, var5896 = protoModule.readBuffer(p332, var5811)
				var5811 = var5896
				var5810.kind = {
					type = "toggle_experience_follow_action",
					value = t.ToggleExperienceFollowAction.decode(var5895)
				}
			elseif var5816 == 40 then
				local _ = nil
				local var5897, var5898 = protoModule.readBuffer(p332, var5811)
				var5811 = var5898
				var5810.kind = {
					type = "toggle_experience_vote_action",
					value = t.ToggleExperienceVoteAction.decode(var5897)
				}
			elseif var5816 == 41 then
				local _ = nil
				local var5899, var5900 = protoModule.readBuffer(p332, var5811)
				var5811 = var5900
				var5810.kind = {
					type = "open_purchase_prompt_action",
					value = t.OpenPurchasePromptAction.decode(var5899)
				}
			elseif var5816 == 42 then
				local _ = nil
				local var5901, var5902 = protoModule.readBuffer(p332, var5811)
				var5811 = var5902
				var5810.kind = {
					type = "open_sdui_overlay_action",
					value = t.OpenSduiOverlayAction.decode(var5901)
				}
			elseif var5816 == 43 then
				local _ = nil
				local var5903, var5904 = protoModule.readBuffer(p332, var5811)
				var5811 = var5904
				var5810.kind = {
					type = "open_badges_see_all_action",
					value = t.OpenBadgesSeeAllAction.decode(var5903)
				}
			elseif var5816 == 44 then
				local _ = nil
				local var5905, var5906 = protoModule.readBuffer(p332, var5811)
				var5811 = var5906
				var5810.kind = {
					type = "open_experience_store_see_all_action",
					value = t.OpenExperienceStoreSeeAllAction.decode(var5905)
				}
			elseif var5816 == 45 then
				local _ = nil
				local var5907, var5908 = protoModule.readBuffer(p332, var5811)
				var5811 = var5908
				var5810.kind = {
					type = "dismiss_game_feedback_action",
					value = t.DismissGameFeedbackAction.decode(var5907)
				}
			elseif var5816 == 46 then
				local _ = nil
				local var5909, var5910 = protoModule.readBuffer(p332, var5811)
				var5811 = var5910
				var5810.kind = {
					type = "open_game_feedback_form_action",
					value = t.OpenGameFeedbackFormAction.decode(var5909)
				}
			elseif var5816 == 47 then
				local _ = nil
				local var5911, var5912 = protoModule.readBuffer(p332, var5811)
				var5811 = var5912
				var5810.kind = {
					type = "enable_event_notifications_action",
					value = t.EnableEventNotificationsAction.decode(var5911)
				}
			elseif var5816 == 48 then
				local _ = nil
				local var5913, var5914 = protoModule.readBuffer(p332, var5811)
				var5811 = var5914
				var5810.kind = {
					type = "dismiss_event_notifications_modal_action",
					value = t.DismissEventNotificationsModalAction.decode(var5913)
				}
			elseif var5816 == 49 then
				local _ = nil
				local var5915, var5916 = protoModule.readBuffer(p332, var5811)
				var5811 = var5916
				var5810.kind = {
					type = "open_amp_wizard_action",
					value = t.OpenAmpWizardAction.decode(var5915)
				}
			elseif var5816 == 50 then
				local _ = nil
				local var5917, var5918 = protoModule.readBuffer(p332, var5811)
				var5811 = var5918
				var5810.kind = {
					type = "open_subscription_purchase_page_action",
					value = t.OpenSubscriptionPurchasePageAction.decode(var5917)
				}
			elseif var5816 == 51 then
				local _ = nil
				local var5919, var5920 = protoModule.readBuffer(p332, var5811)
				var5811 = var5920
				var5810.kind = {
					type = "refresh_game_passes_action",
					value = t.RefreshGamePassesAction.decode(var5919)
				}
			elseif var5816 == 52 then
				local _ = nil
				local var5921, var5922 = protoModule.readBuffer(p332, var5811)
				var5811 = var5922
				var5810.kind = {
					type = "refresh_playability_action",
					value = t.RefreshPlayabilityAction.decode(var5921)
				}
			elseif var5816 == 53 then
				local _ = nil
				local var5923, var5924 = protoModule.readBuffer(p332, var5811)
				var5811 = var5924
				var5810.kind = {
					type = "open_social_proof_user_list_sheet_action",
					value = t.OpenSocialProofUserListSheetAction.decode(var5923)
				}
			elseif var5816 == 54 then
				local _ = nil
				local var5925, var5926 = protoModule.readBuffer(p332, var5811)
				var5811 = var5926
				var5810.kind = {
					type = "report_surface_load_time_milestone_action",
					value = t.ReportSurfaceLoadTimeMilestoneAction.decode(var5925)
				}
			elseif var5816 == 55 then
				local _ = nil
				local var5927, var5928 = protoModule.readBuffer(p332, var5811)
				var5811 = var5928
				var5810.kind = {
					type = "open_search_results_tab_action",
					value = t.OpenSearchResultsTabAction.decode(var5927)
				}
			elseif var5816 == 56 then
				local _ = nil
				local var5929, var5930 = protoModule.readBuffer(p332, var5811)
				var5811 = var5930
				var5810.kind = {
					type = "open_phone_upsell_modal_action",
					value = t.OpenPhoneUpsellModalAction.decode(var5929)
				}
			elseif var5816 == 57 then
				local _ = nil
				local var5931, var5932 = protoModule.readBuffer(p332, var5811)
				var5811 = var5932
				var5810.kind = {
					type = "open_email_upsell_modal_action",
					value = t.OpenEmailUpsellModalAction.decode(var5931)
				}
			elseif var5816 == 58 then
				local _ = nil
				local var5933, var5934 = protoModule.readBuffer(p332, var5811)
				var5811 = var5934
				var5810.kind = {
					type = "dismiss_prompt_action",
					value = t.DismissPromptAction.decode(var5933)
				}
			elseif var5816 == 59 then
				local _ = nil
				local var5935, var5936 = protoModule.readBuffer(p332, var5811)
				var5811 = var5936
				var5810.kind = {
					type = "request_friendship_action",
					value = t.RequestFriendshipAction.decode(var5935)
				}
			elseif var5816 == 60 then
				local _ = nil
				local var5937, var5938 = protoModule.readBuffer(p332, var5811)
				var5811 = var5938
				var5810.kind = {
					type = "refresh_developer_products_action",
					value = t.RefreshDeveloperProductsAction.decode(var5937)
				}
			elseif var5816 == 61 then
				local _ = nil
				local var5939, var5940 = protoModule.readBuffer(p332, var5811)
				var5811 = var5940
				var5810.kind = {
					type = "open_fae_trial_upsell_action",
					value = t.OpenFaeTrialUpsellAction.decode(var5939)
				}
			elseif var5816 == 62 then
				local _ = nil
				local var5941, var5942 = protoModule.readBuffer(p332, var5811)
				var5811 = var5942
				var5810.kind = {
					type = "refresh_omni_recommendation_feed_item_action",
					value = t.RefreshOmniRecommendationFeedItemAction.decode(var5941)
				}
			elseif var5816 == 63 then
				local _ = nil
				local var5943, var5944 = protoModule.readBuffer(p332, var5811)
				var5811 = var5944
				var5810.kind = {
					type = "ai_overview_feedback_action",
					value = t.AiOverviewFeedbackAction.decode(var5943)
				}
			elseif var5816 == 64 then
				local _ = nil
				local var5945, var5946 = protoModule.readBuffer(p332, var5811)
				var5811 = var5946
				var5810.kind = {
					type = "open_trusted_friends_upsell_modal_action",
					value = t.OpenTrustedFriendsUpsellModalAction.decode(var5945)
				}
			elseif var5816 == 65 then
				local _ = nil
				local var5947, var5948 = protoModule.readBuffer(p332, var5811)
				var5811 = var5948
				var5810.kind = {
					type = "record_party_chat_conversation_upsell_acknowledgement_action",
					value = t.RecordPartyChatConversationUpsellAcknowledgementAction.decode(var5947)
				}
			elseif var5816 == 66 then
				local _ = nil
				local var5949, var5950 = protoModule.readBuffer(p332, var5811)
				var5811 = var5950
				var5810.kind = {
					type = "open_search_results_with_query_action",
					value = t.OpenSearchResultsWithQueryAction.decode(var5949)
				}
			elseif var5816 == 67 then
				local _ = nil
				local var5951, var5952 = protoModule.readBuffer(p332, var5811)
				var5811 = var5952
				var5810.kind = {
					type = "select_marketplace_favorites_category",
					value = t.SelectMarketplaceFavoritesCategory.decode(var5951)
				}
			elseif var5816 == 68 then
				local _ = nil
				local var5953, var5954 = protoModule.readBuffer(p332, var5811)
				var5811 = var5954
				var5810.kind = {
					type = "download_app_action",
					value = t.DownloadAppAction.decode(var5953)
				}
			elseif var5816 == 69 then
				local _ = nil
				local var5955, var5956 = protoModule.readBuffer(p332, var5811)
				var5811 = var5956
				var5810.kind = {
					type = "refresh_charts_sort_detail_action",
					value = t.RefreshChartsSortDetailAction.decode(var5955)
				}
			elseif var5816 == 70 then
				local _ = nil
				local var5957, var5958 = protoModule.readBuffer(p332, var5811)
				var5811 = var5958
				var5810.kind = {
					type = "join_community_action",
					value = t.JoinCommunityAction.decode(var5957)
				}
			elseif var5816 == 71 then
				local _ = nil
				local var5959, var5960 = protoModule.readBuffer(p332, var5811)
				var5811 = var5960
				var5810.kind = {
					type = "view_community_action",
					value = t.ViewCommunityAction.decode(var5959)
				}
			elseif var5816 == 72 then
				local _ = nil
				local var5961, var5962 = protoModule.readBuffer(p332, var5811)
				var5811 = var5962
				var5810.kind = {
					type = "pin_experience_shortcut_action",
					value = t.PinExperienceShortcutAction.decode(var5961)
				}
			elseif var5816 == 73 then
				local _ = nil
				local var5963, var5964 = protoModule.readBuffer(p332, var5811)
				var5811 = var5964
				var5810.kind = {
					type = "select_marketplace_favorites_subcategory",
					value = t.SelectMarketplaceFavoritesSubcategory.decode(var5963)
				}
			elseif var5816 == 74 then
				local _ = nil
				local var5965, var5966 = protoModule.readBuffer(p332, var5811)
				var5811 = var5966
				var5810.kind = {
					type = "show_toast_action",
					value = t.ShowToastAction.decode(var5965)
				}
			elseif var5816 == 75 then
				local _ = nil
				local var5967, var5968 = protoModule.readBuffer(p332, var5811)
				var5811 = var5968
				var5810.kind = {
					type = "open_incoming_transfer_upsell_action",
					value = t.OpenIncomingTransferUpsellAction.decode(var5967)
				}
			elseif var5816 == 76 then
				local _ = nil
				local var5969, var5970 = protoModule.readBuffer(p332, var5811)
				var5811 = var5970
				var5810.kind = {
					type = "action_sequence_action",
					value = t.ActionSequenceAction.decode(var5969)
				}
			elseif var5816 == 77 then
				local _ = nil
				local var5971, var5972 = protoModule.readBuffer(p332, var5811)
				var5811 = var5972
				var5810.kind = {
					type = "refresh_feed_entry_from_api_action",
					value = t.RefreshFeedEntryFromApiAction.decode(var5971)
				}
			elseif var5816 == 78 then
				local _ = nil
				local var5973, var5974 = protoModule.readBuffer(p332, var5811)
				var5811 = var5974
				var5810.kind = {
					type = "open_profile_frames_editor_action",
					value = t.OpenProfileFramesEditorAction.decode(var5973)
				}
			elseif var5816 == 1000 then
				local _ = nil
				local var5975, var5976 = protoModule.readBuffer(p332, var5811)
				var5811 = var5976
				var5810.telemetry_handler = propTypesModule.StringProp.decode(var5975)
			elseif var5816 == 1001 then
				local _ = nil
				local var5977, var5978 = protoModule.readBuffer(p332, var5811)
				var5811 = var5978
				var5810.accessibility_label = propTypesModule.StringFormat.decode(var5977)
			elseif var5816 == 1002 then
				local _ = nil
				local var5979, var5980 = protoModule.readBuffer(p332, var5811)
				var5811 = var5980
				var5810.skip_unified_logging = propTypesModule.BoolProp.decode(var5979)
			else
				local _ = nil
				local var5981, var5982 = protoModule.readVarInt(p332, var5811)
				var5811 = var5982 + var5981
			end
		elseif var5812 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5983, var5984 = protoModule.readFixed32(p332, var5811)
			local _ = var5983
			var5811 = var5984
		elseif var5812 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5985, var5986 = protoModule.readFixed64(p332, var5811)
			local _ = var5985
			var5811 = var5986
		else
			error("Unsupported wire type: " .. var5812)
		end
	end
	return var5810
end

function t_168:jsonEncode() --[[ line: 31710 ]]
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
		elseif self.kind.type == "refresh_feed_entry_from_api_action" then
			t.refreshFeedEntryFromApiAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_profile_frames_editor_action" then
			t.openProfileFramesEditorAction = self.kind.value:jsonEncode()
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

function t_168:jsonDecode() --[[ line: 31888 ]]
	-- upvalues: t_168 (ref), t (ref), propTypesModule (ref)
	local var5988 = t_168.new()
	
	if self.dismiss_dialog_action ~= nil then
		var5988.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismiss_dialog_action)
		}
	end
	if self.dismissDialogAction ~= nil then
		var5988.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismissDialogAction)
		}
	end
	if self.link_action ~= nil then
		var5988.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.link_action)
		}
	end
	if self.linkAction ~= nil then
		var5988.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.linkAction)
		}
	end
	if self.open_game_details_action ~= nil then
		var5988.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.open_game_details_action)
		}
	end
	if self.openGameDetailsAction ~= nil then
		var5988.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.openGameDetailsAction)
		}
	end
	if self.open_join_friends_action ~= nil then
		var5988.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.open_join_friends_action)
		}
	end
	if self.openJoinFriendsAction ~= nil then
		var5988.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.openJoinFriendsAction)
		}
	end
	if self.open_marketplace_try_on_action ~= nil then
		var5988.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.open_marketplace_try_on_action)
		}
	end
	if self.openMarketplaceTryOnAction ~= nil then
		var5988.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.openMarketplaceTryOnAction)
		}
	end
	if self.open_see_all_action ~= nil then
		var5988.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.open_see_all_action)
		}
	end
	if self.openSeeAllAction ~= nil then
		var5988.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.openSeeAllAction)
		}
	end
	if self.open_sponsored_tooltip_action ~= nil then
		var5988.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.open_sponsored_tooltip_action)
		}
	end
	if self.openSponsoredTooltipAction ~= nil then
		var5988.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.openSponsoredTooltipAction)
		}
	end
	if self.play_button_click_action ~= nil then
		var5988.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.play_button_click_action)
		}
	end
	if self.playButtonClickAction ~= nil then
		var5988.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.playButtonClickAction)
		}
	end
	if self.update_user_settings_action ~= nil then
		var5988.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.update_user_settings_action)
		}
	end
	if self.updateUserSettingsAction ~= nil then
		var5988.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.updateUserSettingsAction)
		}
	end
	if self.open_tooltip_action ~= nil then
		var5988.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.open_tooltip_action)
		}
	end
	if self.openTooltipAction ~= nil then
		var5988.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.openTooltipAction)
		}
	end
	if self.open_badge_details_action ~= nil then
		var5988.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.open_badge_details_action)
		}
	end
	if self.openBadgeDetailsAction ~= nil then
		var5988.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.openBadgeDetailsAction)
		}
	end
	if self.load_more_from_api_action ~= nil then
		var5988.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.load_more_from_api_action)
		}
	end
	if self.loadMoreFromApiAction ~= nil then
		var5988.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.loadMoreFromApiAction)
		}
	end
	if self.share_action ~= nil then
		var5988.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.share_action)
		}
	end
	if self.shareAction ~= nil then
		var5988.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.shareAction)
		}
	end
	if self.open_abuse_report_action ~= nil then
		var5988.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.open_abuse_report_action)
		}
	end
	if self.openAbuseReportAction ~= nil then
		var5988.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.openAbuseReportAction)
		}
	end
	if self.remove_badge_from_inventory_action ~= nil then
		var5988.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.remove_badge_from_inventory_action)
		}
	end
	if self.removeBadgeFromInventoryAction ~= nil then
		var5988.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.removeBadgeFromInventoryAction)
		}
	end
	if self.open_profile_action ~= nil then
		var5988.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.open_profile_action)
		}
	end
	if self.openProfileAction ~= nil then
		var5988.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.openProfileAction)
		}
	end
	if self.open_facial_age_estimation_action ~= nil then
		var5988.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.open_facial_age_estimation_action)
		}
	end
	if self.openFacialAgeEstimationAction ~= nil then
		var5988.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.openFacialAgeEstimationAction)
		}
	end
	if self.open_add_connections_page_action ~= nil then
		var5988.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.open_add_connections_page_action)
		}
	end
	if self.openAddConnectionsPageAction ~= nil then
		var5988.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.openAddConnectionsPageAction)
		}
	end
	if self.open_marketplace_action ~= nil then
		var5988.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.open_marketplace_action)
		}
	end
	if self.openMarketplaceAction ~= nil then
		var5988.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.openMarketplaceAction)
		}
	end
	if self.hide_profile_completion_action ~= nil then
		var5988.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hide_profile_completion_action)
		}
	end
	if self.hideProfileCompletionAction ~= nil then
		var5988.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hideProfileCompletionAction)
		}
	end
	if self.select_marketplace_catalog_category ~= nil then
		var5988.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.select_marketplace_catalog_category)
		}
	end
	if self.selectMarketplaceCatalogCategory ~= nil then
		var5988.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.selectMarketplaceCatalogCategory)
		}
	end
	if self.select_marketplace_catalog_subcategory ~= nil then
		var5988.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.select_marketplace_catalog_subcategory)
		}
	end
	if self.selectMarketplaceCatalogSubcategory ~= nil then
		var5988.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.selectMarketplaceCatalogSubcategory)
		}
	end
	if self.open_marketplace_catalog_see_all ~= nil then
		var5988.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.open_marketplace_catalog_see_all)
		}
	end
	if self.openMarketplaceCatalogSeeAll ~= nil then
		var5988.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.openMarketplaceCatalogSeeAll)
		}
	end
	if self.close_marketplace_category_tooltip ~= nil then
		var5988.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.close_marketplace_category_tooltip)
		}
	end
	if self.closeMarketplaceCategoryTooltip ~= nil then
		var5988.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.closeMarketplaceCategoryTooltip)
		}
	end
	if self.resize_marketplace_catalog ~= nil then
		var5988.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resize_marketplace_catalog)
		}
	end
	if self.resizeMarketplaceCatalog ~= nil then
		var5988.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resizeMarketplaceCatalog)
		}
	end
	if self.open_marketplace_catalog_filters ~= nil then
		var5988.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.open_marketplace_catalog_filters)
		}
	end
	if self.openMarketplaceCatalogFilters ~= nil then
		var5988.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.openMarketplaceCatalogFilters)
		}
	end
	if self.open_social_link_action ~= nil then
		var5988.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.open_social_link_action)
		}
	end
	if self.openSocialLinkAction ~= nil then
		var5988.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.openSocialLinkAction)
		}
	end
	if self.open_charts_sort_detail_action ~= nil then
		var5988.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.open_charts_sort_detail_action)
		}
	end
	if self.openChartsSortDetailAction ~= nil then
		var5988.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.openChartsSortDetailAction)
		}
	end
	if self.open_song_detail_action ~= nil then
		var5988.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.open_song_detail_action)
		}
	end
	if self.openSongDetailAction ~= nil then
		var5988.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.openSongDetailAction)
		}
	end
	if self.refresh_from_api_action ~= nil then
		var5988.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refresh_from_api_action)
		}
	end
	if self.refreshFromApiAction ~= nil then
		var5988.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refreshFromApiAction)
		}
	end
	if self.rsvp_to_event_action ~= nil then
		var5988.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvp_to_event_action)
		}
	end
	if self.rsvpToEventAction ~= nil then
		var5988.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvpToEventAction)
		}
	end
	if self.apply_charts_filter_action ~= nil then
		var5988.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.apply_charts_filter_action)
		}
	end
	if self.applyChartsFilterAction ~= nil then
		var5988.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.applyChartsFilterAction)
		}
	end
	if self.analytics_event_action ~= nil then
		var5988.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analytics_event_action)
		}
	end
	if self.analyticsEventAction ~= nil then
		var5988.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analyticsEventAction)
		}
	end
	if self.custom_analytics_event_action ~= nil then
		var5988.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.custom_analytics_event_action)
		}
	end
	if self.customAnalyticsEventAction ~= nil then
		var5988.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.customAnalyticsEventAction)
		}
	end
	if self.open_game_invite_action ~= nil then
		var5988.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.open_game_invite_action)
		}
	end
	if self.openGameInviteAction ~= nil then
		var5988.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.openGameInviteAction)
		}
	end
	if self.open_event_details_action ~= nil then
		var5988.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.open_event_details_action)
		}
	end
	if self.openEventDetailsAction ~= nil then
		var5988.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.openEventDetailsAction)
		}
	end
	if self.launch_experience_action ~= nil then
		var5988.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launch_experience_action)
		}
	end
	if self.launchExperienceAction ~= nil then
		var5988.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launchExperienceAction)
		}
	end
	if self.toggle_experience_favorite_action ~= nil then
		var5988.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggle_experience_favorite_action)
		}
	end
	if self.toggleExperienceFavoriteAction ~= nil then
		var5988.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggleExperienceFavoriteAction)
		}
	end
	if self.toggle_experience_follow_action ~= nil then
		var5988.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggle_experience_follow_action)
		}
	end
	if self.toggleExperienceFollowAction ~= nil then
		var5988.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggleExperienceFollowAction)
		}
	end
	if self.toggle_experience_vote_action ~= nil then
		var5988.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggle_experience_vote_action)
		}
	end
	if self.toggleExperienceVoteAction ~= nil then
		var5988.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggleExperienceVoteAction)
		}
	end
	if self.open_purchase_prompt_action ~= nil then
		var5988.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.open_purchase_prompt_action)
		}
	end
	if self.openPurchasePromptAction ~= nil then
		var5988.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.openPurchasePromptAction)
		}
	end
	if self.open_sdui_overlay_action ~= nil then
		var5988.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.open_sdui_overlay_action)
		}
	end
	if self.openSduiOverlayAction ~= nil then
		var5988.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.openSduiOverlayAction)
		}
	end
	if self.open_badges_see_all_action ~= nil then
		var5988.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.open_badges_see_all_action)
		}
	end
	if self.openBadgesSeeAllAction ~= nil then
		var5988.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.openBadgesSeeAllAction)
		}
	end
	if self.open_experience_store_see_all_action ~= nil then
		var5988.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.open_experience_store_see_all_action)
		}
	end
	if self.openExperienceStoreSeeAllAction ~= nil then
		var5988.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.openExperienceStoreSeeAllAction)
		}
	end
	if self.dismiss_game_feedback_action ~= nil then
		var5988.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismiss_game_feedback_action)
		}
	end
	if self.dismissGameFeedbackAction ~= nil then
		var5988.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismissGameFeedbackAction)
		}
	end
	if self.open_game_feedback_form_action ~= nil then
		var5988.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.open_game_feedback_form_action)
		}
	end
	if self.openGameFeedbackFormAction ~= nil then
		var5988.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.openGameFeedbackFormAction)
		}
	end
	if self.enable_event_notifications_action ~= nil then
		var5988.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enable_event_notifications_action)
		}
	end
	if self.enableEventNotificationsAction ~= nil then
		var5988.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enableEventNotificationsAction)
		}
	end
	if self.dismiss_event_notifications_modal_action ~= nil then
		var5988.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismiss_event_notifications_modal_action)
		}
	end
	if self.dismissEventNotificationsModalAction ~= nil then
		var5988.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismissEventNotificationsModalAction)
		}
	end
	if self.open_amp_wizard_action ~= nil then
		var5988.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.open_amp_wizard_action)
		}
	end
	if self.openAmpWizardAction ~= nil then
		var5988.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.openAmpWizardAction)
		}
	end
	if self.open_subscription_purchase_page_action ~= nil then
		var5988.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.open_subscription_purchase_page_action)
		}
	end
	if self.openSubscriptionPurchasePageAction ~= nil then
		var5988.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.openSubscriptionPurchasePageAction)
		}
	end
	if self.refresh_game_passes_action ~= nil then
		var5988.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refresh_game_passes_action)
		}
	end
	if self.refreshGamePassesAction ~= nil then
		var5988.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refreshGamePassesAction)
		}
	end
	if self.refresh_playability_action ~= nil then
		var5988.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refresh_playability_action)
		}
	end
	if self.refreshPlayabilityAction ~= nil then
		var5988.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refreshPlayabilityAction)
		}
	end
	if self.open_social_proof_user_list_sheet_action ~= nil then
		var5988.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.open_social_proof_user_list_sheet_action)
		}
	end
	if self.openSocialProofUserListSheetAction ~= nil then
		var5988.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.openSocialProofUserListSheetAction)
		}
	end
	if self.report_surface_load_time_milestone_action ~= nil then
		var5988.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.report_surface_load_time_milestone_action)
		}
	end
	if self.reportSurfaceLoadTimeMilestoneAction ~= nil then
		var5988.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.reportSurfaceLoadTimeMilestoneAction)
		}
	end
	if self.open_search_results_tab_action ~= nil then
		var5988.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.open_search_results_tab_action)
		}
	end
	if self.openSearchResultsTabAction ~= nil then
		var5988.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.openSearchResultsTabAction)
		}
	end
	if self.open_phone_upsell_modal_action ~= nil then
		var5988.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.open_phone_upsell_modal_action)
		}
	end
	if self.openPhoneUpsellModalAction ~= nil then
		var5988.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.openPhoneUpsellModalAction)
		}
	end
	if self.open_email_upsell_modal_action ~= nil then
		var5988.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.open_email_upsell_modal_action)
		}
	end
	if self.openEmailUpsellModalAction ~= nil then
		var5988.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.openEmailUpsellModalAction)
		}
	end
	if self.dismiss_prompt_action ~= nil then
		var5988.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismiss_prompt_action)
		}
	end
	if self.dismissPromptAction ~= nil then
		var5988.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismissPromptAction)
		}
	end
	if self.request_friendship_action ~= nil then
		var5988.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.request_friendship_action)
		}
	end
	if self.requestFriendshipAction ~= nil then
		var5988.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.requestFriendshipAction)
		}
	end
	if self.refresh_developer_products_action ~= nil then
		var5988.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refresh_developer_products_action)
		}
	end
	if self.refreshDeveloperProductsAction ~= nil then
		var5988.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refreshDeveloperProductsAction)
		}
	end
	if self.open_fae_trial_upsell_action ~= nil then
		var5988.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.open_fae_trial_upsell_action)
		}
	end
	if self.openFaeTrialUpsellAction ~= nil then
		var5988.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.openFaeTrialUpsellAction)
		}
	end
	if self.refresh_omni_recommendation_feed_item_action ~= nil then
		var5988.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refresh_omni_recommendation_feed_item_action)
		}
	end
	if self.refreshOmniRecommendationFeedItemAction ~= nil then
		var5988.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refreshOmniRecommendationFeedItemAction)
		}
	end
	if self.ai_overview_feedback_action ~= nil then
		var5988.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.ai_overview_feedback_action)
		}
	end
	if self.aiOverviewFeedbackAction ~= nil then
		var5988.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.aiOverviewFeedbackAction)
		}
	end
	if self.open_trusted_friends_upsell_modal_action ~= nil then
		var5988.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.open_trusted_friends_upsell_modal_action)
		}
	end
	if self.openTrustedFriendsUpsellModalAction ~= nil then
		var5988.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.openTrustedFriendsUpsellModalAction)
		}
	end
	if self.record_party_chat_conversation_upsell_acknowledgement_action ~= nil then
		var5988.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.record_party_chat_conversation_upsell_acknowledgement_action)
		}
	end
	if self.recordPartyChatConversationUpsellAcknowledgementAction ~= nil then
		var5988.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.recordPartyChatConversationUpsellAcknowledgementAction)
		}
	end
	if self.open_search_results_with_query_action ~= nil then
		var5988.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.open_search_results_with_query_action)
		}
	end
	if self.openSearchResultsWithQueryAction ~= nil then
		var5988.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.openSearchResultsWithQueryAction)
		}
	end
	if self.select_marketplace_favorites_category ~= nil then
		var5988.kind = {
			type = "select_marketplace_favorites_category",
			value = t.SelectMarketplaceFavoritesCategory.jsonDecode(self.select_marketplace_favorites_category)
		}
	end
	if self.selectMarketplaceFavoritesCategory ~= nil then
		var5988.kind = {
			type = "select_marketplace_favorites_category",
			value = t.SelectMarketplaceFavoritesCategory.jsonDecode(self.selectMarketplaceFavoritesCategory)
		}
	end
	if self.download_app_action ~= nil then
		var5988.kind = {
			type = "download_app_action",
			value = t.DownloadAppAction.jsonDecode(self.download_app_action)
		}
	end
	if self.downloadAppAction ~= nil then
		var5988.kind = {
			type = "download_app_action",
			value = t.DownloadAppAction.jsonDecode(self.downloadAppAction)
		}
	end
	if self.refresh_charts_sort_detail_action ~= nil then
		var5988.kind = {
			type = "refresh_charts_sort_detail_action",
			value = t.RefreshChartsSortDetailAction.jsonDecode(self.refresh_charts_sort_detail_action)
		}
	end
	if self.refreshChartsSortDetailAction ~= nil then
		var5988.kind = {
			type = "refresh_charts_sort_detail_action",
			value = t.RefreshChartsSortDetailAction.jsonDecode(self.refreshChartsSortDetailAction)
		}
	end
	if self.join_community_action ~= nil then
		var5988.kind = {
			type = "join_community_action",
			value = t.JoinCommunityAction.jsonDecode(self.join_community_action)
		}
	end
	if self.joinCommunityAction ~= nil then
		var5988.kind = {
			type = "join_community_action",
			value = t.JoinCommunityAction.jsonDecode(self.joinCommunityAction)
		}
	end
	if self.view_community_action ~= nil then
		var5988.kind = {
			type = "view_community_action",
			value = t.ViewCommunityAction.jsonDecode(self.view_community_action)
		}
	end
	if self.viewCommunityAction ~= nil then
		var5988.kind = {
			type = "view_community_action",
			value = t.ViewCommunityAction.jsonDecode(self.viewCommunityAction)
		}
	end
	if self.pin_experience_shortcut_action ~= nil then
		var5988.kind = {
			type = "pin_experience_shortcut_action",
			value = t.PinExperienceShortcutAction.jsonDecode(self.pin_experience_shortcut_action)
		}
	end
	if self.pinExperienceShortcutAction ~= nil then
		var5988.kind = {
			type = "pin_experience_shortcut_action",
			value = t.PinExperienceShortcutAction.jsonDecode(self.pinExperienceShortcutAction)
		}
	end
	if self.select_marketplace_favorites_subcategory ~= nil then
		var5988.kind = {
			type = "select_marketplace_favorites_subcategory",
			value = t.SelectMarketplaceFavoritesSubcategory.jsonDecode(self.select_marketplace_favorites_subcategory)
		}
	end
	if self.selectMarketplaceFavoritesSubcategory ~= nil then
		var5988.kind = {
			type = "select_marketplace_favorites_subcategory",
			value = t.SelectMarketplaceFavoritesSubcategory.jsonDecode(self.selectMarketplaceFavoritesSubcategory)
		}
	end
	if self.show_toast_action ~= nil then
		var5988.kind = {
			type = "show_toast_action",
			value = t.ShowToastAction.jsonDecode(self.show_toast_action)
		}
	end
	if self.showToastAction ~= nil then
		var5988.kind = {
			type = "show_toast_action",
			value = t.ShowToastAction.jsonDecode(self.showToastAction)
		}
	end
	if self.open_incoming_transfer_upsell_action ~= nil then
		var5988.kind = {
			type = "open_incoming_transfer_upsell_action",
			value = t.OpenIncomingTransferUpsellAction.jsonDecode(self.open_incoming_transfer_upsell_action)
		}
	end
	if self.openIncomingTransferUpsellAction ~= nil then
		var5988.kind = {
			type = "open_incoming_transfer_upsell_action",
			value = t.OpenIncomingTransferUpsellAction.jsonDecode(self.openIncomingTransferUpsellAction)
		}
	end
	if self.action_sequence_action ~= nil then
		var5988.kind = {
			type = "action_sequence_action",
			value = t.ActionSequenceAction.jsonDecode(self.action_sequence_action)
		}
	end
	if self.actionSequenceAction ~= nil then
		var5988.kind = {
			type = "action_sequence_action",
			value = t.ActionSequenceAction.jsonDecode(self.actionSequenceAction)
		}
	end
	if self.refresh_feed_entry_from_api_action ~= nil then
		var5988.kind = {
			type = "refresh_feed_entry_from_api_action",
			value = t.RefreshFeedEntryFromApiAction.jsonDecode(self.refresh_feed_entry_from_api_action)
		}
	end
	if self.refreshFeedEntryFromApiAction ~= nil then
		var5988.kind = {
			type = "refresh_feed_entry_from_api_action",
			value = t.RefreshFeedEntryFromApiAction.jsonDecode(self.refreshFeedEntryFromApiAction)
		}
	end
	if self.open_profile_frames_editor_action ~= nil then
		var5988.kind = {
			type = "open_profile_frames_editor_action",
			value = t.OpenProfileFramesEditorAction.jsonDecode(self.open_profile_frames_editor_action)
		}
	end
	if self.openProfileFramesEditorAction ~= nil then
		var5988.kind = {
			type = "open_profile_frames_editor_action",
			value = t.OpenProfileFramesEditorAction.jsonDecode(self.openProfileFramesEditorAction)
		}
	end
	if self.telemetry_handler ~= nil then
		var5988.telemetry_handler = propTypesModule.StringProp.jsonDecode(self.telemetry_handler)
	end
	if self.telemetryHandler ~= nil then
		var5988.telemetry_handler = propTypesModule.StringProp.jsonDecode(self.telemetryHandler)
	end
	if self.accessibility_label ~= nil then
		var5988.accessibility_label = propTypesModule.StringFormat.jsonDecode(self.accessibility_label)
	end
	if self.accessibilityLabel ~= nil then
		var5988.accessibility_label = propTypesModule.StringFormat.jsonDecode(self.accessibilityLabel)
	end
	if self.skip_unified_logging ~= nil then
		var5988.skip_unified_logging = propTypesModule.BoolProp.jsonDecode(self.skip_unified_logging)
	end
	if self.skipUnifiedLogging ~= nil then
		var5988.skip_unified_logging = propTypesModule.BoolProp.jsonDecode(self.skipUnifiedLogging)
	end
	return var5988
end

t_168.descriptor = {
	name = "Action",
	fullName = "roblox.apppageplatform.shared.v1beta1.Action"
}
t.Action = t_168
typeRegistryModule.default:register(t.Action)
local t_169 = {}
t_169.__index = t_169

function t_169.new(p333) --[[ line: 33050 ]]
	-- upvalues: t_169 (ref)
	return setmetatable({
		kind = if p333 == nil or p333.kind == nil then nil else p333.kind
	}, t_169)
end

function t_169:encode() --[[ line: 33056 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5990 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "value" then
			local var5991 = self.kind.value:encode()
			local var5992, var5993 = protoModule.writeTag(buff, var5990, 1, protoModule.wireTypes.lengthDelimited)
			var5992, var5993 = protoModule.writeBuffer(var5992, var5993, var5991, buffer.len(var5991))
			buff = var5992
			var5990 = var5993
		elseif self.kind.type == "conditional" then
			local var5994 = self.kind.value:encode()
			local var5995, var5996 = protoModule.writeTag(buff, var5990, 2, protoModule.wireTypes.lengthDelimited)
			var5995, var5996 = protoModule.writeBuffer(var5995, var5996, var5994, buffer.len(var5994))
			buff = var5995
			var5990 = var5996
		end
	end
	local buff_1 = buffer.create(var5990)
	buffer.copy(buff_1, 0, buff, 0, var5990)
	
	return buff_1
end

function t_169.decode(p334) --[[ line: 33077 ]]
	-- upvalues: t_169 (ref), protoModule (ref), t (ref)
	local var5998 = t_169.new()
	local var5999 = 0
	while var5999 < buffer.len(p334) do
		local _ = nil
		local var6000 = nil
		local var6001, var6002, var6003 = protoModule.readTag(p334, var5999)
		local var6004 = var6001
		var6000 = var6002
		var5999 = var6003
		
		if var6000 == protoModule.wireTypes.varint then
			local _ = nil
			local var6005, var6006 = protoModule.readVarInt(p334, var5999)
			local _ = var6005
			var5999 = var6006
			continue
		end
		if var6000 == protoModule.wireTypes.lengthDelimited then
			if var6004 == 1 then
				local _ = nil
				local var6007, var6008 = protoModule.readBuffer(p334, var5999)
				var5999 = var6008
				var5998.kind = { type = "value", value = t.Action.decode(var6007) }
			elseif var6004 == 2 then
				local _ = nil
				local var6009, var6010 = protoModule.readBuffer(p334, var5999)
				var5999 = var6010
				var5998.kind = {
					type = "conditional",
					value = t.ActionProp_ConditionalOptions.decode(var6009)
				}
			else
				local _ = nil
				local var6011, var6012 = protoModule.readVarInt(p334, var5999)
				var5999 = var6012 + var6011
			end
		elseif var6000 == protoModule.wireTypes.i32 then
			local _ = nil
			local var6013, var6014 = protoModule.readFixed32(p334, var5999)
			local _ = var6013
			var5999 = var6014
		elseif var6000 == protoModule.wireTypes.i64 then
			local _ = nil
			local var6015, var6016 = protoModule.readFixed64(p334, var5999)
			local _ = var6015
			var5999 = var6016
		else
			error("Unsupported wire type: " .. var6000)
		end
	end
	return var5998
end

function t_169:jsonEncode() --[[ line: 33125 ]]
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

function t_169:jsonDecode() --[[ line: 33139 ]]
	-- upvalues: t_169 (ref), t (ref)
	local var6018 = t_169.new()
	
	if self.value ~= nil then
		var6018.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	if self.conditional ~= nil then
		var6018.kind = {
			type = "conditional",
			value = t.ActionProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var6018
end

t_169.descriptor = {
	name = "ActionProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionProp"
}
t.ActionProp = t_169
typeRegistryModule.default:register(t.ActionProp)
local t_170 = {}
t_170.__index = t_170

function t_170.new(p335) --[[ line: 33168 ]]
	-- upvalues: t_170 (ref)
	return setmetatable({
		condition = if p335 == nil or p335.condition == nil then nil else p335.condition,
		kind = if p335 == nil or p335.kind == nil then nil else p335.kind
	}, t_170)
end

function t_170:encode() --[[ line: 33177 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6020 = 0
	
	if self.condition ~= nil then
		local var6021 = self.condition:encode()
		local var6022, var6023 = protoModule.writeTag(buff, var6020, 1, protoModule.wireTypes.lengthDelimited)
		var6022, var6023 = protoModule.writeBuffer(var6022, var6023, var6021, buffer.len(var6021))
		buff = var6022
		var6020 = var6023
	end
	if self.kind ~= nil and self.kind.type == "value" then
		local var6024 = self.kind.value:encode()
		local var6025, var6026 = protoModule.writeTag(buff, var6020, 3, protoModule.wireTypes.lengthDelimited)
		var6025, var6026 = protoModule.writeBuffer(var6025, var6026, var6024, buffer.len(var6024))
		buff = var6025
		var6020 = var6026
	end
	local buff_1 = buffer.create(var6020)
	buffer.copy(buff_1, 0, buff, 0, var6020)
	
	return buff_1
end

function t_170.decode(p336) --[[ line: 33200 ]]
	-- upvalues: t_170 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var6028 = t_170.new()
	local var6029 = 0
	while var6029 < buffer.len(p336) do
		local _ = nil
		local var6030 = nil
		local var6031, var6032, var6033 = protoModule.readTag(p336, var6029)
		local var6034 = var6031
		var6030 = var6032
		var6029 = var6033
		
		if var6030 == protoModule.wireTypes.varint then
			local _ = nil
			local var6035, var6036 = protoModule.readVarInt(p336, var6029)
			local _ = var6035
			var6029 = var6036
			continue
		end
		if var6030 == protoModule.wireTypes.lengthDelimited then
			if var6034 == 1 then
				local _ = nil
				local var6037, var6038 = protoModule.readBuffer(p336, var6029)
				var6029 = var6038
				var6028.condition = propConditionModule.PropCondition.decode(var6037)
			elseif var6034 == 3 then
				local _ = nil
				local var6039, var6040 = protoModule.readBuffer(p336, var6029)
				var6029 = var6040
				var6028.kind = { type = "value", value = t.Action.decode(var6039) }
			else
				local _ = nil
				local var6041, var6042 = protoModule.readVarInt(p336, var6029)
				var6029 = var6042 + var6041
			end
		elseif var6030 == protoModule.wireTypes.i32 then
			local _ = nil
			local var6043, var6044 = protoModule.readFixed32(p336, var6029)
			local _ = var6043
			var6029 = var6044
		elseif var6030 == protoModule.wireTypes.i64 then
			local _ = nil
			local var6045, var6046 = protoModule.readFixed64(p336, var6029)
			local _ = var6045
			var6029 = var6046
		else
			error("Unsupported wire type: " .. var6030)
		end
	end
	return var6028
end

function t_170:jsonEncode() --[[ line: 33248 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "value" then
		t.value = self.kind.value:jsonEncode()
	end
	return t
end

function t_170:jsonDecode() --[[ line: 33264 ]]
	-- upvalues: t_170 (ref), propConditionModule (ref), t (ref)
	local var6048 = t_170.new()
	
	if self.condition ~= nil then
		var6048.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.value ~= nil then
		var6048.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	return var6048
end

t_170.descriptor = {
	name = "ActionProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ActionProp_ConditionalOption = t_170
typeRegistryModule.default:register(t.ActionProp_ConditionalOption)
local t_171 = {}
t_171.__index = t_171

function t_171.new(p337) --[[ line: 33293 ]]
	-- upvalues: t_171 (ref)
	return setmetatable({
		options = if p337 == nil or p337.options == nil then {} else p337.options
	}, t_171)
end

function t_171:encode() --[[ line: 33301 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6050 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var6051 = v:encode()
			local var6052, var6053 = protoModule.writeTag(buff, var6050, 1, protoModule.wireTypes.lengthDelimited)
			var6052, var6053 = protoModule.writeBuffer(var6052, var6053, var6051, buffer.len(var6051))
			buff = var6052
			var6050 = var6053
		end
	end
	local buff_1 = buffer.create(var6050)
	buffer.copy(buff_1, 0, buff, 0, var6050)
	
	return buff_1
end

function t_171.decode(p338) --[[ line: 33318 ]]
	-- upvalues: t_171 (ref), protoModule (ref), t (ref)
	local var6055 = t_171.new()
	local var6056 = 0
	while var6056 < buffer.len(p338) do
		local _ = nil
		local var6057 = nil
		local var6058, var6059, var6060 = protoModule.readTag(p338, var6056)
		local var6061 = var6058
		var6057 = var6059
		var6056 = var6060
		
		if var6057 == protoModule.wireTypes.varint then
			local _ = nil
			local var6062, var6063 = protoModule.readVarInt(p338, var6056)
			local _ = var6062
			var6056 = var6063
			continue
		end
		if var6057 == protoModule.wireTypes.lengthDelimited then
			if var6061 == 1 then
				local _ = nil
				local var6064, var6065 = protoModule.readBuffer(p338, var6056)
				var6056 = var6065
				table.insert(var6055.options, t.ActionProp_ConditionalOption.decode(var6064))
			else
				local _ = nil
				local var6066, var6067 = protoModule.readVarInt(p338, var6056)
				var6056 = var6067 + var6066
			end
		elseif var6057 == protoModule.wireTypes.i32 then
			local _ = nil
			local var6068, var6069 = protoModule.readFixed32(p338, var6056)
			local _ = var6068
			var6056 = var6069
		elseif var6057 == protoModule.wireTypes.i64 then
			local _ = nil
			local var6070, var6071 = protoModule.readFixed64(p338, var6056)
			local _ = var6070
			var6056 = var6071
		else
			error("Unsupported wire type: " .. var6057)
		end
	end
	return var6055
end

function t_171:jsonEncode() --[[ line: 33361 ]]
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

function t_171:jsonDecode() --[[ line: 33375 ]]
	-- upvalues: t_171 (ref), t (ref)
	local var6074 = t_171.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ActionProp_ConditionalOption.jsonDecode(v))
		end
		var6074.options = t_1
	end
	return var6074
end

t_171.descriptor = {
	name = "ActionProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ActionProp_ConditionalOptions = t_171
typeRegistryModule.default:register(t.ActionProp_ConditionalOptions)
local t_172 = {}
t_172.__index = t_172

function t_172.new(p339) --[[ line: 33404 ]]
	-- upvalues: t_172 (ref)
	return setmetatable({
		kind = if p339 == nil or p339.kind == nil then nil else p339.kind
	}, t_172)
end

function t_172:encode() --[[ line: 33410 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6077 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var6078 = self.kind.value:encode()
			local var6079, var6080 = protoModule.writeTag(buff, var6077, 1, protoModule.wireTypes.lengthDelimited)
			var6079, var6080 = protoModule.writeBuffer(var6079, var6080, var6078, buffer.len(var6078))
			buff = var6079
			var6077 = var6080
		elseif self.kind.type == "conditional" then
			local var6081 = self.kind.value:encode()
			local var6082, var6083 = protoModule.writeTag(buff, var6077, 2, protoModule.wireTypes.lengthDelimited)
			var6082, var6083 = protoModule.writeBuffer(var6082, var6083, var6081, buffer.len(var6081))
			buff = var6082
			var6077 = var6083
		elseif self.kind.type == "binding_path" then
			local var6084, var6085 = protoModule.writeTag(buff, var6077, 3, protoModule.wireTypes.lengthDelimited)
			var6084, var6085 = protoModule.writeString(var6084, var6085, self.kind.value)
			buff = var6084
			var6077 = var6085
		end
	end
	local buff_1 = buffer.create(var6077)
	buffer.copy(buff_1, 0, buff, 0, var6077)
	
	return buff_1
end

function t_172.decode(p340) --[[ line: 33434 ]]
	-- upvalues: t_172 (ref), protoModule (ref), t (ref)
	local var6087 = t_172.new()
	local var6088 = 0
	while var6088 < buffer.len(p340) do
		local _ = nil
		local var6089 = nil
		local var6090, var6091, var6092 = protoModule.readTag(p340, var6088)
		local var6093 = var6090
		var6089 = var6091
		var6088 = var6092
		
		if var6089 == protoModule.wireTypes.varint then
			local _ = nil
			local var6094, var6095 = protoModule.readVarInt(p340, var6088)
			local _ = var6094
			var6088 = var6095
			continue
		end
		if var6089 == protoModule.wireTypes.lengthDelimited then
			if var6093 == 1 then
				local _ = nil
				local var6096, var6097 = protoModule.readBuffer(p340, var6088)
				var6088 = var6097
				var6087.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(var6096)
				}
			elseif var6093 == 2 then
				local _ = nil
				local var6098, var6099 = protoModule.readBuffer(p340, var6088)
				var6088 = var6099
				var6087.kind = {
					type = "conditional",
					value = t.FocusNavActionsProp_ConditionalOptions.decode(var6098)
				}
			elseif var6093 == 3 then
				local _ = nil
				local var6100, var6101 = protoModule.readBuffer(p340, var6088)
				var6088 = var6101
				var6087.kind = { type = "binding_path", value = buffer.tostring(var6100) }
			else
				local _ = nil
				local var6102, var6103 = protoModule.readVarInt(p340, var6088)
				var6088 = var6103 + var6102
			end
		elseif var6089 == protoModule.wireTypes.i32 then
			local _ = nil
			local var6104, var6105 = protoModule.readFixed32(p340, var6088)
			local _ = var6104
			var6088 = var6105
		elseif var6089 == protoModule.wireTypes.i64 then
			local _ = nil
			local var6106, var6107 = protoModule.readFixed64(p340, var6088)
			local _ = var6106
			var6088 = var6107
		else
			error("Unsupported wire type: " .. var6089)
		end
	end
	return var6087
end

function t_172:jsonEncode() --[[ line: 33488 ]]
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

function t_172:jsonDecode() --[[ line: 33504 ]]
	-- upvalues: t_172 (ref), t (ref)
	local var6109 = t_172.new()
	
	if self.literal ~= nil then
		var6109.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
		}
	end
	if self.conditional ~= nil then
		var6109.kind = {
			type = "conditional",
			value = t.FocusNavActionsProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var6109.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var6109.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var6109
end

t_172.descriptor = {
	name = "FocusNavActionsProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavActionsProp"
}
t.FocusNavActionsProp = t_172
typeRegistryModule.default:register(t.FocusNavActionsProp)
local t_173 = {}
t_173.__index = t_173

function t_173.new(p341) --[[ line: 33544 ]]
	-- upvalues: t_173 (ref)
	return setmetatable({
		condition = if p341 == nil or p341.condition == nil then nil else p341.condition,
		kind = if p341 == nil or p341.kind == nil then nil else p341.kind
	}, t_173)
end

function t_173:encode() --[[ line: 33553 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6111 = 0
	
	if self.condition ~= nil then
		local var6112 = self.condition:encode()
		local var6113, var6114 = protoModule.writeTag(buff, var6111, 1, protoModule.wireTypes.lengthDelimited)
		var6113, var6114 = protoModule.writeBuffer(var6113, var6114, var6112, buffer.len(var6112))
		buff = var6113
		var6111 = var6114
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var6115 = self.kind.value:encode()
			local var6116, var6117 = protoModule.writeTag(buff, var6111, 3, protoModule.wireTypes.lengthDelimited)
			var6116, var6117 = protoModule.writeBuffer(var6116, var6117, var6115, buffer.len(var6115))
			buff = var6116
			var6111 = var6117
		elseif self.kind.type == "binding_path" then
			local var6118, var6119 = protoModule.writeTag(buff, var6111, 4, protoModule.wireTypes.lengthDelimited)
			var6118, var6119 = protoModule.writeString(var6118, var6119, self.kind.value)
			buff = var6118
			var6111 = var6119
		end
	end
	local buff_1 = buffer.create(var6111)
	buffer.copy(buff_1, 0, buff, 0, var6111)
	
	return buff_1
end

function t_173.decode(p342) --[[ line: 33579 ]]
	-- upvalues: t_173 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var6121 = t_173.new()
	local var6122 = 0
	while var6122 < buffer.len(p342) do
		local _ = nil
		local var6123 = nil
		local var6124, var6125, var6126 = protoModule.readTag(p342, var6122)
		local var6127 = var6124
		var6123 = var6125
		var6122 = var6126
		
		if var6123 == protoModule.wireTypes.varint then
			local _ = nil
			local var6128, var6129 = protoModule.readVarInt(p342, var6122)
			local _ = var6128
			var6122 = var6129
			continue
		end
		if var6123 == protoModule.wireTypes.lengthDelimited then
			if var6127 == 1 then
				local _ = nil
				local var6130, var6131 = protoModule.readBuffer(p342, var6122)
				var6122 = var6131
				var6121.condition = propConditionModule.PropCondition.decode(var6130)
			elseif var6127 == 3 then
				local _ = nil
				local var6132, var6133 = protoModule.readBuffer(p342, var6122)
				var6122 = var6133
				var6121.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(var6132)
				}
			elseif var6127 == 4 then
				local _ = nil
				local var6134, var6135 = protoModule.readBuffer(p342, var6122)
				var6122 = var6135
				var6121.kind = { type = "binding_path", value = buffer.tostring(var6134) }
			else
				local _ = nil
				local var6136, var6137 = protoModule.readVarInt(p342, var6122)
				var6122 = var6137 + var6136
			end
		elseif var6123 == protoModule.wireTypes.i32 then
			local _ = nil
			local var6138, var6139 = protoModule.readFixed32(p342, var6122)
			local _ = var6138
			var6122 = var6139
		elseif var6123 == protoModule.wireTypes.i64 then
			local _ = nil
			local var6140, var6141 = protoModule.readFixed64(p342, var6122)
			local _ = var6140
			var6122 = var6141
		else
			error("Unsupported wire type: " .. var6123)
		end
	end
	return var6121
end

function t_173:jsonEncode() --[[ line: 33632 ]]
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

function t_173:jsonDecode() --[[ line: 33650 ]]
	-- upvalues: t_173 (ref), propConditionModule (ref), t (ref)
	local var6143 = t_173.new()
	
	if self.condition ~= nil then
		var6143.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var6143.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var6143.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var6143.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var6143
end

t_173.descriptor = {
	name = "FocusNavActionsProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FocusNavActionsProp_ConditionalOption = t_173
typeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOption)
local t_174 = {}
t_174.__index = t_174

function t_174.new(p343) --[[ line: 33690 ]]
	-- upvalues: t_174 (ref)
	return setmetatable({
		options = if p343 == nil or p343.options == nil then {} else p343.options
	}, t_174)
end

function t_174:encode() --[[ line: 33698 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6145 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var6146 = v:encode()
			local var6147, var6148 = protoModule.writeTag(buff, var6145, 1, protoModule.wireTypes.lengthDelimited)
			var6147, var6148 = protoModule.writeBuffer(var6147, var6148, var6146, buffer.len(var6146))
			buff = var6147
			var6145 = var6148
		end
	end
	local buff_1 = buffer.create(var6145)
	buffer.copy(buff_1, 0, buff, 0, var6145)
	
	return buff_1
end

function t_174.decode(p344) --[[ line: 33715 ]]
	-- upvalues: t_174 (ref), protoModule (ref), t (ref)
	local var6150 = t_174.new()
	local var6151 = 0
	while var6151 < buffer.len(p344) do
		local _ = nil
		local var6152 = nil
		local var6153, var6154, var6155 = protoModule.readTag(p344, var6151)
		local var6156 = var6153
		var6152 = var6154
		var6151 = var6155
		
		if var6152 == protoModule.wireTypes.varint then
			local _ = nil
			local var6157, var6158 = protoModule.readVarInt(p344, var6151)
			local _ = var6157
			var6151 = var6158
			continue
		end
		if var6152 == protoModule.wireTypes.lengthDelimited then
			if var6156 == 1 then
				local _ = nil
				local var6159, var6160 = protoModule.readBuffer(p344, var6151)
				var6151 = var6160
				table.insert(var6150.options, t.FocusNavActionsProp_ConditionalOption.decode(var6159))
			else
				local _ = nil
				local var6161, var6162 = protoModule.readVarInt(p344, var6151)
				var6151 = var6162 + var6161
			end
		elseif var6152 == protoModule.wireTypes.i32 then
			local _ = nil
			local var6163, var6164 = protoModule.readFixed32(p344, var6151)
			local _ = var6163
			var6151 = var6164
		elseif var6152 == protoModule.wireTypes.i64 then
			local _ = nil
			local var6165, var6166 = protoModule.readFixed64(p344, var6151)
			local _ = var6165
			var6151 = var6166
		else
			error("Unsupported wire type: " .. var6152)
		end
	end
	return var6150
end

function t_174:jsonEncode() --[[ line: 33758 ]]
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

function t_174:jsonDecode() --[[ line: 33772 ]]
	-- upvalues: t_174 (ref), t (ref)
	local var6169 = t_174.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FocusNavActionsProp_ConditionalOption.jsonDecode(v))
		end
		var6169.options = t_1
	end
	return var6169
end

t_174.descriptor = {
	name = "FocusNavActionsProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FocusNavActionsProp_ConditionalOptions = t_174
typeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOptions)
local t_175 = {}
t_175.__index = t_175

function t_175.new(p345) --[[ line: 33803 ]]
	-- upvalues: t_175 (ref)
	return setmetatable({
		keys = if p345 == nil or p345.keys == nil then {} else p345.keys,
		events = if p345 == nil or p345.events == nil then {} else p345.events
	}, t_175)
end

function t_175:encode() --[[ line: 33812 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6172 = 0
	
	if self.keys ~= nil and next(self.keys) ~= nil then
		for i, v in self.keys do
			local var6173, var6174 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var6173, var6174 = protoModule.writeString(var6173, var6174, i)
			local var6175 = v:encode()
			var6174, var6176 = protoModule.writeTag(var6173, var6174, 2, protoModule.wireTypes.lengthDelimited)
			var6174, var6176 = protoModule.writeBuffer(var6174, var6176, var6175, buffer.len(var6175))
			local var6177 = var6174
			local var6178 = var6176
			local var6179, var6180 = protoModule.writeTag(buff, var6172, 3, protoModule.wireTypes.lengthDelimited)
			var6179, var6180 = protoModule.writeBuffer(var6179, var6180, var6177, var6178)
			buff = var6179
			var6172 = var6180
		end
	end
	if self.events ~= nil and next(self.events) ~= nil then
		for i, v in self.events do
			local var6181, var6182 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var6181, var6182 = protoModule.writeString(var6181, var6182, i)
			local var6183 = v:encode()
			var6182, var6184 = protoModule.writeTag(var6181, var6182, 2, protoModule.wireTypes.lengthDelimited)
			var6182, var6184 = protoModule.writeBuffer(var6182, var6184, var6183, buffer.len(var6183))
			local var6185 = var6182
			local var6186 = var6184
			local var6187, var6188 = protoModule.writeTag(buff, var6172, 4, protoModule.wireTypes.lengthDelimited)
			var6187, var6188 = protoModule.writeBuffer(var6187, var6188, var6185, var6186)
			buff = var6187
			var6172 = var6188
		end
	end
	local buff_1 = buffer.create(var6172)
	buffer.copy(buff_1, 0, buff, 0, var6172)
	
	return buff_1
end

function t_175.decode(p346) --[[ line: 33849 ]]
	-- upvalues: t_175 (ref), protoModule (ref), t (ref), propTypesEngineModule (ref)
	local var6190 = t_175.new()
	local var6191 = 0
	while var6191 < buffer.len(p346) do
		local _ = nil
		local var6192 = nil
		local var6193, var6194, var6195 = protoModule.readTag(p346, var6191)
		local var6196 = var6193
		var6192 = var6194
		var6191 = var6195
		
		if var6192 == protoModule.wireTypes.varint then
			local _ = nil
			local var6197, var6198 = protoModule.readVarInt(p346, var6191)
			local _ = var6197
			var6191 = var6198
			continue
		end
		if var6192 == protoModule.wireTypes.lengthDelimited then
			if var6196 == 3 then
				local _ = nil
				local var6199, var6200 = protoModule.readBuffer(p346, var6191)
				var6191 = var6200
				var6199 = t.FocusNavActionsProp_FocusNavData_KeysEntry.decode(var6199)
				var6190.keys[var6199.key or ""] = var6199.value or propTypesEngineModule.KeyCodeProp.new()
			elseif var6196 == 4 then
				local _ = nil
				local var6201, var6202 = protoModule.readBuffer(p346, var6191)
				var6191 = var6202
				var6201 = t.FocusNavActionsProp_FocusNavData_EventsEntry.decode(var6201)
				var6190.events[var6201.key or ""] = var6201.value or t.ActionProp.new()
			else
				local _ = nil
				local var6203, var6204 = protoModule.readVarInt(p346, var6191)
				var6191 = var6204 + var6203
			end
		elseif var6192 == protoModule.wireTypes.i32 then
			local _ = nil
			local var6205, var6206 = protoModule.readFixed32(p346, var6191)
			local _ = var6205
			var6191 = var6206
		elseif var6192 == protoModule.wireTypes.i64 then
			local _ = nil
			local var6207, var6208 = protoModule.readFixed64(p346, var6191)
			local _ = var6207
			var6191 = var6208
		else
			error("Unsupported wire type: " .. var6192)
		end
	end
	return var6190
end

function t_175:jsonEncode() --[[ line: 33911 ]]
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

function t_175:jsonDecode() --[[ line: 33933 ]]
	-- upvalues: t_175 (ref), propTypesEngineModule (ref), t (ref)
	local var6212 = t_175.new()
	
	if self.keys ~= nil then
		local t_1 = {}
		
		for i, v in self.keys do
			t_1[i] = propTypesEngineModule.KeyCodeProp.jsonDecode(v)
		end
		var6212.keys = t_1
	end
	if self.events ~= nil then
		local t_1 = {}
		
		for i, v in self.events do
			t_1[i] = t.ActionProp.jsonDecode(v)
		end
		var6212.events = t_1
	end
	return var6212
end

t_175.descriptor = {
	name = "FocusNavActionsProp_FocusNavData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavData"
}
t.FocusNavActionsProp_FocusNavData = t_175
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData)
local t_176 = {}
t_176.__index = t_176

function t_176.new(p347) --[[ line: 33973 ]]
	-- upvalues: t_176 (ref)
	return setmetatable({
		key = if p347 == nil or p347.key == nil then "" else p347.key,
		value = if p347 == nil or p347.value == nil then nil else p347.value
	}, t_176)
end

function t_176:encode() --[[ line: 33982 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6216 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var6217, var6218 = protoModule.writeTag(buff, var6216, 1, protoModule.wireTypes.lengthDelimited)
		var6217, var6218 = protoModule.writeString(var6217, var6218, self.key)
		buff = var6217
		var6216 = var6218
	end
	if self.value ~= nil then
		local var6219 = self.value:encode()
		local var6220, var6221 = protoModule.writeTag(buff, var6216, 2, protoModule.wireTypes.lengthDelimited)
		var6220, var6221 = protoModule.writeBuffer(var6220, var6221, var6219, buffer.len(var6219))
		buff = var6220
		var6216 = var6221
	end
	local buff_1 = buffer.create(var6216)
	buffer.copy(buff_1, 0, buff, 0, var6216)
	
	return buff_1
end

function t_176.decode(p348) --[[ line: 34004 ]]
	-- upvalues: t_176 (ref), protoModule (ref), propTypesEngineModule (ref)
	local var6223 = t_176.new()
	local var6224 = 0
	while var6224 < buffer.len(p348) do
		local _ = nil
		local var6225 = nil
		local var6226, var6227, var6228 = protoModule.readTag(p348, var6224)
		local var6229 = var6226
		var6225 = var6227
		var6224 = var6228
		
		if var6225 == protoModule.wireTypes.varint then
			local _ = nil
			local var6230, var6231 = protoModule.readVarInt(p348, var6224)
			local _ = var6230
			var6224 = var6231
			continue
		end
		if var6225 == protoModule.wireTypes.lengthDelimited then
			if var6229 == 1 then
				local _ = nil
				local var6232, var6233 = protoModule.readBuffer(p348, var6224)
				var6224 = var6233
				var6223.key = buffer.tostring(var6232)
			elseif var6229 == 2 then
				local _ = nil
				local var6234, var6235 = protoModule.readBuffer(p348, var6224)
				var6224 = var6235
				var6223.value = propTypesEngineModule.KeyCodeProp.decode(var6234)
			else
				local _ = nil
				local var6236, var6237 = protoModule.readVarInt(p348, var6224)
				var6224 = var6237 + var6236
			end
		elseif var6225 == protoModule.wireTypes.i32 then
			local _ = nil
			local var6238, var6239 = protoModule.readFixed32(p348, var6224)
			local _ = var6238
			var6224 = var6239
		elseif var6225 == protoModule.wireTypes.i64 then
			local _ = nil
			local var6240, var6241 = protoModule.readFixed64(p348, var6224)
			local _ = var6240
			var6224 = var6241
		else
			error("Unsupported wire type: " .. var6225)
		end
	end
	return var6223
end

function t_176:jsonEncode() --[[ line: 34054 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_176:jsonDecode() --[[ line: 34070 ]]
	-- upvalues: t_176 (ref), propTypesEngineModule (ref)
	local var6243 = t_176.new()
	
	if self.key ~= nil then
		var6243.key = self.key
	end
	if self.value ~= nil then
		var6243.value = propTypesEngineModule.KeyCodeProp.jsonDecode(self.value)
	end
	return var6243
end

t_176.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_KeysEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.KeysEntry"
}
t.FocusNavActionsProp_FocusNavData_KeysEntry = t_176
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_KeysEntry)
local t_177 = {}
t_177.__index = t_177

function t_177.new(p349) --[[ line: 34100 ]]
	-- upvalues: t_177 (ref)
	return setmetatable({
		key = if p349 == nil or p349.key == nil then "" else p349.key,
		value = if p349 == nil or p349.value == nil then nil else p349.value
	}, t_177)
end

function t_177:encode() --[[ line: 34109 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6245 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var6246, var6247 = protoModule.writeTag(buff, var6245, 1, protoModule.wireTypes.lengthDelimited)
		var6246, var6247 = protoModule.writeString(var6246, var6247, self.key)
		buff = var6246
		var6245 = var6247
	end
	if self.value ~= nil then
		local var6248 = self.value:encode()
		local var6249, var6250 = protoModule.writeTag(buff, var6245, 2, protoModule.wireTypes.lengthDelimited)
		var6249, var6250 = protoModule.writeBuffer(var6249, var6250, var6248, buffer.len(var6248))
		buff = var6249
		var6245 = var6250
	end
	local buff_1 = buffer.create(var6245)
	buffer.copy(buff_1, 0, buff, 0, var6245)
	
	return buff_1
end

function t_177.decode(p350) --[[ line: 34131 ]]
	-- upvalues: t_177 (ref), protoModule (ref), t (ref)
	local var6252 = t_177.new()
	local var6253 = 0
	while var6253 < buffer.len(p350) do
		local _ = nil
		local var6254 = nil
		local var6255, var6256, var6257 = protoModule.readTag(p350, var6253)
		local var6258 = var6255
		var6254 = var6256
		var6253 = var6257
		
		if var6254 == protoModule.wireTypes.varint then
			local _ = nil
			local var6259, var6260 = protoModule.readVarInt(p350, var6253)
			local _ = var6259
			var6253 = var6260
			continue
		end
		if var6254 == protoModule.wireTypes.lengthDelimited then
			if var6258 == 1 then
				local _ = nil
				local var6261, var6262 = protoModule.readBuffer(p350, var6253)
				var6253 = var6262
				var6252.key = buffer.tostring(var6261)
			elseif var6258 == 2 then
				local _ = nil
				local var6263, var6264 = protoModule.readBuffer(p350, var6253)
				var6253 = var6264
				var6252.value = t.ActionProp.decode(var6263)
			else
				local _ = nil
				local var6265, var6266 = protoModule.readVarInt(p350, var6253)
				var6253 = var6266 + var6265
			end
		elseif var6254 == protoModule.wireTypes.i32 then
			local _ = nil
			local var6267, var6268 = protoModule.readFixed32(p350, var6253)
			local _ = var6267
			var6253 = var6268
		elseif var6254 == protoModule.wireTypes.i64 then
			local _ = nil
			local var6269, var6270 = protoModule.readFixed64(p350, var6253)
			local _ = var6269
			var6253 = var6270
		else
			error("Unsupported wire type: " .. var6254)
		end
	end
	return var6252
end

function t_177:jsonEncode() --[[ line: 34181 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_177:jsonDecode() --[[ line: 34197 ]]
	-- upvalues: t_177 (ref), t (ref)
	local var6272 = t_177.new()
	
	if self.key ~= nil then
		var6272.key = self.key
	end
	if self.value ~= nil then
		var6272.value = t.ActionProp.jsonDecode(self.value)
	end
	return var6272
end

t_177.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_EventsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsEntry"
}
t.FocusNavActionsProp_FocusNavData_EventsEntry = t_177
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_EventsEntry)
t.ActionType = {
	fromNumber = function(p351) --[[ line: 34224 ]]
		return if p351 == 0 then "ACTION_TYPE_INVALID" elseif p351 == 1 then "ACTION_TYPE_DISMISS_DIALOG" elseif p351 == 2 then "ACTION_TYPE_LINK" elseif p351 == 3 then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p351 == 4 then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p351 == 5 then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p351 == 6 then "ACTION_TYPE_OPEN_SEE_ALL" elseif p351 == 7 then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p351 == 8 then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p351 == 9 then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p351 == 10 then "ACTION_TYPE_OPEN_TOOLTIP" elseif p351 == 11 then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p351 == 12 then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p351 == 13 then "ACTION_TYPE_SHARE" elseif p351 == 14 then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p351 == 15 then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p351 == 16 then "ACTION_TYPE_OPEN_PROFILE" elseif p351 == 17 then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p351 == 18 then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p351 == 19 then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p351 == 20 then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p351 == 21 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p351 == 22 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p351 == 23 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p351 == 24 then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p351 == 25 then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p351 == 26 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p351 == 27 then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p351 == 28 then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p351 == 29 then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p351 == 30 then "ACTION_TYPE_REFRESH_FROM_API" elseif p351 == 31 then "ACTION_TYPE_RSVP_TO_EVENT" elseif p351 == 32 then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p351 == 33 then "ACTION_TYPE_ANALYTICS_EVENT" elseif p351 == 34 then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p351 == 35 then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p351 == 36 then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p351 == 37 then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p351 == 38 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p351 == 39 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p351 == 40 then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p351 == 41 then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p351 == 42 then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p351 == 43 then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p351 == 44 then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p351 == 45 then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p351 == 46 then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p351 == 47 then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p351 == 48 then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p351 == 49 then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p351 == 50 then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p351 == 51 then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p351 == 52 then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p351 == 53 then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p351 == 54 then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p351 == 55 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p351 == 56 then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p351 == 57 then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p351 == 58 then "ACTION_TYPE_DISMISS_PROMPT" elseif p351 == 59 then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p351 == 60 then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p351 == 61 then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p351 == 62 then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p351 == 63 then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p351 == 64 then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p351 == 65 then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p351 == 66 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" elseif p351 == 67 then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" elseif p351 == 68 then "ACTION_TYPE_DOWNLOAD_APP" elseif p351 == 69 then "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" elseif p351 == 70 then "ACTION_TYPE_JOIN_COMMUNITY" elseif p351 == 71 then "ACTION_TYPE_VIEW_COMMUNITY" elseif p351 == 72 then "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" elseif p351 == 73 then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" elseif p351 == 74 then "ACTION_TYPE_SHOW_TOAST" elseif p351 == 75 then "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" elseif p351 == 76 then "ACTION_TYPE_ACTION_SEQUENCE" elseif p351 == 77 then "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" elseif p351 == 78 then "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" else nil
	end,
	toNumber = function(p352) --[[ line: 34388 ]]
		return if p352 == "ACTION_TYPE_INVALID" then 0 elseif p352 == "ACTION_TYPE_DISMISS_DIALOG" then 1 elseif p352 == "ACTION_TYPE_LINK" then 2 elseif p352 == "ACTION_TYPE_OPEN_GAME_DETAILS" then 3 elseif p352 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then 4 elseif p352 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then 5 elseif p352 == "ACTION_TYPE_OPEN_SEE_ALL" then 6 elseif p352 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then 7 elseif p352 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then 8 elseif p352 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then 9 elseif p352 == "ACTION_TYPE_OPEN_TOOLTIP" then 10 elseif p352 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then 11 elseif p352 == "ACTION_TYPE_LOAD_MORE_FROM_API" then 12 elseif p352 == "ACTION_TYPE_SHARE" then 13 elseif p352 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then 14 elseif p352 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then 15 elseif p352 == "ACTION_TYPE_OPEN_PROFILE" then 16 elseif p352 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then 17 elseif p352 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then 18 elseif p352 == "ACTION_TYPE_OPEN_MARKETPLACE" then 19 elseif p352 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then 20 elseif p352 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then 21 elseif p352 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then 22 elseif p352 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then 23 elseif p352 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then 24 elseif p352 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then 25 elseif p352 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then 26 elseif p352 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then 27 elseif p352 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then 28 elseif p352 == "ACTION_TYPE_OPEN_SONG_DETAIL" then 29 elseif p352 == "ACTION_TYPE_REFRESH_FROM_API" then 30 elseif p352 == "ACTION_TYPE_RSVP_TO_EVENT" then 31 elseif p352 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then 32 elseif p352 == "ACTION_TYPE_ANALYTICS_EVENT" then 33 elseif p352 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then 34 elseif p352 == "ACTION_TYPE_OPEN_GAME_INVITE" then 35 elseif p352 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then 36 elseif p352 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then 37 elseif p352 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then 38 elseif p352 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then 39 elseif p352 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then 40 elseif p352 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then 41 elseif p352 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then 42 elseif p352 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then 43 elseif p352 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then 44 elseif p352 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then 45 elseif p352 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then 46 elseif p352 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then 47 elseif p352 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then 48 elseif p352 == "ACTION_TYPE_OPEN_AMP_WIZARD" then 49 elseif p352 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then 50 elseif p352 == "ACTION_TYPE_REFRESH_GAME_PASSES" then 51 elseif p352 == "ACTION_TYPE_REFRESH_PLAYABILITY" then 52 elseif p352 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then 53 elseif p352 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then 54 elseif p352 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then 55 elseif p352 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then 56 elseif p352 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then 57 elseif p352 == "ACTION_TYPE_DISMISS_PROMPT" then 58 elseif p352 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then 59 elseif p352 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then 60 elseif p352 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then 61 elseif p352 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then 62 elseif p352 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then 63 elseif p352 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then 64 elseif p352 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then 65 elseif p352 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then 66 elseif p352 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" then 67 elseif p352 == "ACTION_TYPE_DOWNLOAD_APP" then 68 elseif p352 == "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" then 69 elseif p352 == "ACTION_TYPE_JOIN_COMMUNITY" then 70 elseif p352 == "ACTION_TYPE_VIEW_COMMUNITY" then 71 elseif p352 == "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" then 72 elseif p352 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" then 73 elseif p352 == "ACTION_TYPE_SHOW_TOAST" then 74 elseif p352 == "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" then 75 elseif p352 == "ACTION_TYPE_ACTION_SEQUENCE" then 76 elseif p352 == "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" then 77 elseif p352 == "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" then 78 else p352
	end,
	fromName = function(p353) --[[ line: 34552 ]]
		return if p353 == "ACTION_TYPE_INVALID" then "ACTION_TYPE_INVALID" elseif p353 == "ACTION_TYPE_DISMISS_DIALOG" then "ACTION_TYPE_DISMISS_DIALOG" elseif p353 == "ACTION_TYPE_LINK" then "ACTION_TYPE_LINK" elseif p353 == "ACTION_TYPE_OPEN_GAME_DETAILS" then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p353 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p353 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p353 == "ACTION_TYPE_OPEN_SEE_ALL" then "ACTION_TYPE_OPEN_SEE_ALL" elseif p353 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p353 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p353 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p353 == "ACTION_TYPE_OPEN_TOOLTIP" then "ACTION_TYPE_OPEN_TOOLTIP" elseif p353 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p353 == "ACTION_TYPE_LOAD_MORE_FROM_API" then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p353 == "ACTION_TYPE_SHARE" then "ACTION_TYPE_SHARE" elseif p353 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p353 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p353 == "ACTION_TYPE_OPEN_PROFILE" then "ACTION_TYPE_OPEN_PROFILE" elseif p353 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p353 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p353 == "ACTION_TYPE_OPEN_MARKETPLACE" then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p353 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p353 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p353 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p353 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p353 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p353 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p353 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p353 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p353 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p353 == "ACTION_TYPE_OPEN_SONG_DETAIL" then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p353 == "ACTION_TYPE_REFRESH_FROM_API" then "ACTION_TYPE_REFRESH_FROM_API" elseif p353 == "ACTION_TYPE_RSVP_TO_EVENT" then "ACTION_TYPE_RSVP_TO_EVENT" elseif p353 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p353 == "ACTION_TYPE_ANALYTICS_EVENT" then "ACTION_TYPE_ANALYTICS_EVENT" elseif p353 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p353 == "ACTION_TYPE_OPEN_GAME_INVITE" then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p353 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p353 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p353 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p353 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p353 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p353 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p353 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p353 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p353 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p353 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p353 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p353 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p353 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p353 == "ACTION_TYPE_OPEN_AMP_WIZARD" then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p353 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p353 == "ACTION_TYPE_REFRESH_GAME_PASSES" then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p353 == "ACTION_TYPE_REFRESH_PLAYABILITY" then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p353 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p353 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p353 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p353 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p353 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p353 == "ACTION_TYPE_DISMISS_PROMPT" then "ACTION_TYPE_DISMISS_PROMPT" elseif p353 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p353 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p353 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p353 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p353 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p353 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p353 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p353 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" elseif p353 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" elseif p353 == "ACTION_TYPE_DOWNLOAD_APP" then "ACTION_TYPE_DOWNLOAD_APP" elseif p353 == "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" then "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" elseif p353 == "ACTION_TYPE_JOIN_COMMUNITY" then "ACTION_TYPE_JOIN_COMMUNITY" elseif p353 == "ACTION_TYPE_VIEW_COMMUNITY" then "ACTION_TYPE_VIEW_COMMUNITY" elseif p353 == "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" then "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" elseif p353 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" elseif p353 == "ACTION_TYPE_SHOW_TOAST" then "ACTION_TYPE_SHOW_TOAST" elseif p353 == "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" then "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" elseif p353 == "ACTION_TYPE_ACTION_SEQUENCE" then "ACTION_TYPE_ACTION_SEQUENCE" elseif p353 == "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" then "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" elseif p353 == "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" then "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" else nil
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
	RefreshFeedEntryFromApiAction = t.RefreshFeedEntryFromApiAction,
	RefreshFeedEntryFromApiAction_Params = t.RefreshFeedEntryFromApiAction_Params,
	OpenProfileFramesEditorAction = t.OpenProfileFramesEditorAction,
	OpenProfileFramesEditorAction_Params = t.OpenProfileFramesEditorAction_Params,
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