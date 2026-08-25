local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local propConditionModule = require(script.Parent.prop_condition)
local propTypesModule = require(script.Parent.prop_types)
local propTypesEngineModule = require(script.Parent.prop_types_engine)
local shareLinkDataModule = require(script.Parent.share_link_data)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t (ref), t_1 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_1)
end

function t_1:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var189 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var192 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var1 = t_1.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.DismissDialogAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var196)
		end
	end
	return var1
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var1 = t_1.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.DismissDialogAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.DismissDialogAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_1.descriptor = {
	name = "DismissDialogAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissDialogAction"
}
t.DismissDialogAction = t_1
typeRegistryModule.default:register(t.DismissDialogAction)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p1)
	-- upvalues: t_2 (ref)
	return setmetatable({
		dialog_type = if p1 == nil or p1.dialog_type == nil then nil else p1.dialog_type
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.dialog_type ~= nil then
		local var2 = self.dialog_type:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var220 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_2.decode(p1)
	-- upvalues: t_2 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_2.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.dialog_type = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var224)
		end
	end
	return var1
end

function t_2:jsonEncode()
	local t = {}
	
	if self.dialog_type ~= nil then
		t.dialogType = self.dialog_type:jsonEncode()
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), propTypesModule (ref)
	local var1 = t_2.new()
	
	if self.dialog_type ~= nil then
		var1.dialog_type = propTypesModule.StringProp.jsonDecode(self.dialog_type)
	end
	if self.dialogType ~= nil then
		var1.dialog_type = propTypesModule.StringProp.jsonDecode(self.dialogType)
	end
	return var1
end

t_2.descriptor = {
	name = "DismissDialogAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissDialogAction_Params = t_2
typeRegistryModule.default:register(t.DismissDialogAction_Params)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p1)
	-- upvalues: t (ref), t_3 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_3)
end

function t_3:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var244 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var247 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_3.decode(p1)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var1 = t_3.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.LinkAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var251)
		end
	end
	return var1
end

function t_3:jsonEncode()
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

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), t (ref)
	local var1 = t_3.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.LinkAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.LinkAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_3.descriptor = {
	name = "LinkAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LinkAction"
}
t.LinkAction = t_3
typeRegistryModule.default:register(t.LinkAction)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p1)
	-- upvalues: t_4 (ref)
	return setmetatable({
		url = if p1 == nil or p1.url == nil then nil else p1.url,
		title_key = if p1 == nil or p1.title_key == nil then nil else p1.title_key,
		on_webview_close = if p1 == nil or p1.on_webview_close == nil then nil else p1.on_webview_close
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.url ~= nil then
		local var2 = self.url:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var275 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.title_key ~= nil then
		local var5 = self.title_key:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var278 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.on_webview_close ~= nil then
		local var8 = self.on_webview_close:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var9, var281 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_4.decode(p1)
	-- upvalues: t_4 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1 = t_4.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.url = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.title_key = propTypesModule.StringProp.decode(var12)
			elseif var7 == 4 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.on_webview_close = t.ActionProp.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var285)
		end
	end
	return var1
end

function t_4:jsonEncode()
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

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), propTypesModule (ref), t (ref)
	local var1 = t_4.new()
	
	if self.url ~= nil then
		var1.url = propTypesModule.StringProp.jsonDecode(self.url)
	end
	if self.title_key ~= nil then
		var1.title_key = propTypesModule.StringProp.jsonDecode(self.title_key)
	end
	if self.titleKey ~= nil then
		var1.title_key = propTypesModule.StringProp.jsonDecode(self.titleKey)
	end
	if self.on_webview_close ~= nil then
		var1.on_webview_close = t.ActionProp.jsonDecode(self.on_webview_close)
	end
	if self.onWebviewClose ~= nil then
		var1.on_webview_close = t.ActionProp.jsonDecode(self.onWebviewClose)
	end
	return var1
end

t_4.descriptor = {
	name = "LinkAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LinkAction_Params = t_4
typeRegistryModule.default:register(t.LinkAction_Params)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p1)
	-- upvalues: t (ref), t_5 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_5)
end

function t_5:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var309 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var312 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_5.decode(p1)
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var1 = t_5.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenSocialLinkAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var316)
		end
	end
	return var1
end

function t_5:jsonEncode()
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

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), t (ref)
	local var1 = t_5.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenSocialLinkAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenSocialLinkAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_5.descriptor = {
	name = "OpenSocialLinkAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSocialLinkAction"
}
t.OpenSocialLinkAction = t_5
typeRegistryModule.default:register(t.OpenSocialLinkAction)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p1)
	-- upvalues: t_6 (ref)
	return setmetatable({
		assignment_id = if p1 == nil or p1.assignment_id == nil then nil else p1.assignment_id,
		assignment_type = if p1 == nil or p1.assignment_type == nil then nil else p1.assignment_type,
		social_link_type = if p1 == nil or p1.social_link_type == nil then nil else p1.social_link_type,
		social_link_url = if p1 == nil or p1.social_link_url == nil then nil else p1.social_link_url,
		social_link_display_type = if p1 == nil or p1.social_link_display_type == nil then nil else p1.social_link_display_type
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.assignment_id ~= nil then
		local var2 = self.assignment_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var340 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.assignment_type ~= nil then
		local var5 = self.assignment_type:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var343 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.social_link_type ~= nil then
		local var8 = self.social_link_type:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var346 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.social_link_url ~= nil then
		local var11 = self.social_link_url:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var349 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	if self.social_link_display_type ~= nil then
		local var14 = self.social_link_display_type:encode()
		local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var15, var352 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
		buff = var15
		var1 = var16
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_6.decode(p1)
	-- upvalues: t_6 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_6.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.assignment_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.assignment_type = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.social_link_type = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.social_link_url = propTypesModule.StringProp.decode(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.social_link_display_type = propTypesModule.StringProp.decode(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var356)
		end
	end
	return var1
end

function t_6:jsonEncode()
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

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), propTypesModule (ref)
	local var1 = t_6.new()
	
	if self.assignment_id ~= nil then
		var1.assignment_id = propTypesModule.StringProp.jsonDecode(self.assignment_id)
	end
	if self.assignmentId ~= nil then
		var1.assignment_id = propTypesModule.StringProp.jsonDecode(self.assignmentId)
	end
	if self.assignment_type ~= nil then
		var1.assignment_type = propTypesModule.StringProp.jsonDecode(self.assignment_type)
	end
	if self.assignmentType ~= nil then
		var1.assignment_type = propTypesModule.StringProp.jsonDecode(self.assignmentType)
	end
	if self.social_link_type ~= nil then
		var1.social_link_type = propTypesModule.StringProp.jsonDecode(self.social_link_type)
	end
	if self.socialLinkType ~= nil then
		var1.social_link_type = propTypesModule.StringProp.jsonDecode(self.socialLinkType)
	end
	if self.social_link_url ~= nil then
		var1.social_link_url = propTypesModule.StringProp.jsonDecode(self.social_link_url)
	end
	if self.socialLinkUrl ~= nil then
		var1.social_link_url = propTypesModule.StringProp.jsonDecode(self.socialLinkUrl)
	end
	if self.social_link_display_type ~= nil then
		var1.social_link_display_type = propTypesModule.StringProp.jsonDecode(self.social_link_display_type)
	end
	if self.socialLinkDisplayType ~= nil then
		var1.social_link_display_type = propTypesModule.StringProp.jsonDecode(self.socialLinkDisplayType)
	end
	return var1
end

t_6.descriptor = {
	name = "OpenSocialLinkAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSocialLinkAction_Params = t_6
typeRegistryModule.default:register(t.OpenSocialLinkAction_Params)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p1)
	-- upvalues: t (ref), t_7 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_7)
end

function t_7:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var384 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var387 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_7.decode(p1)
	-- upvalues: t_7 (ref), protoModule (ref), t (ref)
	local var1 = t_7.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenGameDetailsAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var391)
		end
	end
	return var1
end

function t_7:jsonEncode()
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

function t_7:jsonDecode()
	-- upvalues: t_7 (ref), t (ref)
	local var1 = t_7.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenGameDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenGameDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_7.descriptor = {
	name = "OpenGameDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameDetailsAction"
}
t.OpenGameDetailsAction = t_7
typeRegistryModule.default:register(t.OpenGameDetailsAction)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p1)
	-- upvalues: t_8 (ref)
	return setmetatable({
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id,
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		inherit_referral_session = if p1 == nil or p1.inherit_referral_session == nil then nil else p1.inherit_referral_session
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.place_id ~= nil then
		local var2 = self.place_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var415 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.universe_id ~= nil then
		local var5 = self.universe_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var418 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.inherit_referral_session ~= nil then
		local var8 = self.inherit_referral_session:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var421 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_8.decode(p1)
	-- upvalues: t_8 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_8.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.place_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.inherit_referral_session = propTypesModule.BoolProp.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var425)
		end
	end
	return var1
end

function t_8:jsonEncode()
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

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), propTypesModule (ref)
	local var1 = t_8.new()
	
	if self.place_id ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.inherit_referral_session ~= nil then
		var1.inherit_referral_session = propTypesModule.BoolProp.jsonDecode(self.inherit_referral_session)
	end
	if self.inheritReferralSession ~= nil then
		var1.inherit_referral_session = propTypesModule.BoolProp.jsonDecode(self.inheritReferralSession)
	end
	return var1
end

t_8.descriptor = {
	name = "OpenGameDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameDetailsAction_Params = t_8
typeRegistryModule.default:register(t.OpenGameDetailsAction_Params)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p1)
	-- upvalues: t (ref), t_9 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_9)
end

function t_9:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var449 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var452 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_9.decode(p1)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var1 = t_9.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenJoinFriendsAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var456)
		end
	end
	return var1
end

function t_9:jsonEncode()
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

function t_9:jsonDecode()
	-- upvalues: t_9 (ref), t (ref)
	local var1 = t_9.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenJoinFriendsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenJoinFriendsAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_9.descriptor = {
	name = "OpenJoinFriendsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenJoinFriendsAction"
}
t.OpenJoinFriendsAction = t_9
typeRegistryModule.default:register(t.OpenJoinFriendsAction)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p1)
	-- upvalues: t_10 (ref)
	return setmetatable({
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id,
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.place_id ~= nil then
		local var2 = self.place_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var480 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.universe_id ~= nil then
		local var5 = self.universe_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var483 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_10.decode(p1)
	-- upvalues: t_10 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_10.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.place_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var487)
		end
	end
	return var1
end

function t_10:jsonEncode()
	local t = {}
	
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_10:jsonDecode()
	-- upvalues: t_10 (ref), propTypesModule (ref)
	local var1 = t_10.new()
	
	if self.place_id ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1
end

t_10.descriptor = {
	name = "OpenJoinFriendsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenJoinFriendsAction_Params = t_10
typeRegistryModule.default:register(t.OpenJoinFriendsAction_Params)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p1)
	-- upvalues: t (ref), t_11 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_11)
end

function t_11:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var509 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var512 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_11.decode(p1)
	-- upvalues: t_11 (ref), protoModule (ref), t (ref)
	local var1 = t_11.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenMarketplaceTryOnAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var516)
		end
	end
	return var1
end

function t_11:jsonEncode()
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

function t_11:jsonDecode()
	-- upvalues: t_11 (ref), t (ref)
	local var1 = t_11.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenMarketplaceTryOnAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenMarketplaceTryOnAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_11.descriptor = {
	name = "OpenMarketplaceTryOnAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceTryOnAction"
}
t.OpenMarketplaceTryOnAction = t_11
typeRegistryModule.default:register(t.OpenMarketplaceTryOnAction)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p1)
	-- upvalues: t_12 (ref)
	return setmetatable({
		item_id = if p1 == nil or p1.item_id == nil then nil else p1.item_id,
		item_type = if p1 == nil or p1.item_type == nil then nil else p1.item_type,
		item_sub_type_name = if p1 == nil or p1.item_sub_type_name == nil then nil else p1.item_sub_type_name
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.item_id ~= nil then
		local var2 = self.item_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var540 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.item_type ~= nil then
		local var5 = self.item_type:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var543 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.item_sub_type_name ~= nil then
		local var8 = self.item_sub_type_name:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var546 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_12.decode(p1)
	-- upvalues: t_12 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_12.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.item_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.item_type = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.item_sub_type_name = propTypesModule.StringProp.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var550)
		end
	end
	return var1
end

function t_12:jsonEncode()
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

function t_12:jsonDecode()
	-- upvalues: t_12 (ref), propTypesModule (ref)
	local var1 = t_12.new()
	
	if self.item_id ~= nil then
		var1.item_id = propTypesModule.StringProp.jsonDecode(self.item_id)
	end
	if self.itemId ~= nil then
		var1.item_id = propTypesModule.StringProp.jsonDecode(self.itemId)
	end
	if self.item_type ~= nil then
		var1.item_type = propTypesModule.StringProp.jsonDecode(self.item_type)
	end
	if self.itemType ~= nil then
		var1.item_type = propTypesModule.StringProp.jsonDecode(self.itemType)
	end
	if self.item_sub_type_name ~= nil then
		var1.item_sub_type_name = propTypesModule.StringProp.jsonDecode(self.item_sub_type_name)
	end
	if self.itemSubTypeName ~= nil then
		var1.item_sub_type_name = propTypesModule.StringProp.jsonDecode(self.itemSubTypeName)
	end
	return var1
end

t_12.descriptor = {
	name = "OpenMarketplaceTryOnAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceTryOnAction_Params = t_12
typeRegistryModule.default:register(t.OpenMarketplaceTryOnAction_Params)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p1)
	-- upvalues: t (ref), t_13 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_13)
end

function t_13:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var574 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var577 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_13.decode(p1)
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var1 = t_13.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenSeeAllAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var581)
		end
	end
	return var1
end

function t_13:jsonEncode()
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

function t_13:jsonDecode()
	-- upvalues: t_13 (ref), t (ref)
	local var1 = t_13.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_13.descriptor = {
	name = "OpenSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSeeAllAction"
}
t.OpenSeeAllAction = t_13
typeRegistryModule.default:register(t.OpenSeeAllAction)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p1)
	-- upvalues: t_14 (ref)
	return setmetatable({
		collection_id = if p1 == nil or p1.collection_id == nil then nil else p1.collection_id,
		game_set_target_id = if p1 == nil or p1.game_set_target_id == nil then nil else p1.game_set_target_id,
		collection_position = if p1 == nil or p1.collection_position == nil then nil else p1.collection_position
	}, t_14)
end

function t_14:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.collection_id ~= nil then
		local var2 = self.collection_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var605 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.game_set_target_id ~= nil then
		local var5 = self.game_set_target_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var608 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.collection_position ~= nil then
		local var8 = self.collection_position:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var611 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_14.decode(p1)
	-- upvalues: t_14 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_14.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.collection_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.game_set_target_id = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.collection_position = propTypesModule.StringProp.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var615)
		end
	end
	return var1
end

function t_14:jsonEncode()
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

function t_14:jsonDecode()
	-- upvalues: t_14 (ref), propTypesModule (ref)
	local var1 = t_14.new()
	
	if self.collection_id ~= nil then
		var1.collection_id = propTypesModule.StringProp.jsonDecode(self.collection_id)
	end
	if self.collectionId ~= nil then
		var1.collection_id = propTypesModule.StringProp.jsonDecode(self.collectionId)
	end
	if self.game_set_target_id ~= nil then
		var1.game_set_target_id = propTypesModule.StringProp.jsonDecode(self.game_set_target_id)
	end
	if self.gameSetTargetId ~= nil then
		var1.game_set_target_id = propTypesModule.StringProp.jsonDecode(self.gameSetTargetId)
	end
	if self.collection_position ~= nil then
		var1.collection_position = propTypesModule.StringProp.jsonDecode(self.collection_position)
	end
	if self.collectionPosition ~= nil then
		var1.collection_position = propTypesModule.StringProp.jsonDecode(self.collectionPosition)
	end
	return var1
end

t_14.descriptor = {
	name = "OpenSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSeeAllAction_Params = t_14
typeRegistryModule.default:register(t.OpenSeeAllAction_Params)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p1)
	-- upvalues: t (ref), t_15 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_15)
end

function t_15:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var639 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var642 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_15.decode(p1)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var1 = t_15.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenSponsoredTooltipAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var646)
		end
	end
	return var1
end

function t_15:jsonEncode()
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

function t_15:jsonDecode()
	-- upvalues: t_15 (ref), t (ref)
	local var1 = t_15.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_15.descriptor = {
	name = "OpenSponsoredTooltipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSponsoredTooltipAction"
}
t.OpenSponsoredTooltipAction = t_15
typeRegistryModule.default:register(t.OpenSponsoredTooltipAction)
local t_16 = {}
t_16.__index = t_16

function t_16.new(_)
	-- upvalues: t_16 (ref)
	return setmetatable({}, t_16)
end

function t_16.encode(_)
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_16.decode(p1)
	-- upvalues: t_16 (ref), protoModule (ref)
	local var1 = t_16.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local var3 = nil
		local _ = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		var3 = var4
		local var7 = var5
		var2 = var6
		
		if var7 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
		elseif var7 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var10, var11 = protoModule.readVarInt(p1, var2)
			var2 = var11 + var10
		elseif var7 == protoModule.wireTypes.i32 then
			local _ = nil
			local var12, var13 = protoModule.readFixed32(p1, var2)
			local _ = var12
			var2 = var13
		elseif var7 == protoModule.wireTypes.i64 then
			local _ = nil
			local var14, var15 = protoModule.readFixed64(p1, var2)
			local _ = var14
			var2 = var15
		else
			error("Unsupported wire type: " .. var673)
		end
	end
	return var1
end

function t_16.jsonEncode(_)
	return {}
end

function t_16.jsonDecode(_)
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

function t_17.new(p1)
	-- upvalues: t (ref), t_17 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_17)
end

function t_17:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var685 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var688 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_17.decode(p1)
	-- upvalues: t_17 (ref), protoModule (ref), t (ref)
	local var1 = t_17.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.PlayButtonClickAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var692)
		end
	end
	return var1
end

function t_17:jsonEncode()
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

function t_17:jsonDecode()
	-- upvalues: t_17 (ref), t (ref)
	local var1 = t_17.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_17.descriptor = {
	name = "PlayButtonClickAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.PlayButtonClickAction"
}
t.PlayButtonClickAction = t_17
typeRegistryModule.default:register(t.PlayButtonClickAction)
local t_18 = {}
t_18.__index = t_18

function t_18.new(_)
	-- upvalues: t_18 (ref)
	return setmetatable({}, t_18)
end

function t_18.encode(_)
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_18.decode(p1)
	-- upvalues: t_18 (ref), protoModule (ref)
	local var1 = t_18.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local var3 = nil
		local _ = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		var3 = var4
		local var7 = var5
		var2 = var6
		
		if var7 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
		elseif var7 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var10, var11 = protoModule.readVarInt(p1, var2)
			var2 = var11 + var10
		elseif var7 == protoModule.wireTypes.i32 then
			local _ = nil
			local var12, var13 = protoModule.readFixed32(p1, var2)
			local _ = var12
			var2 = var13
		elseif var7 == protoModule.wireTypes.i64 then
			local _ = nil
			local var14, var15 = protoModule.readFixed64(p1, var2)
			local _ = var14
			var2 = var15
		else
			error("Unsupported wire type: " .. var719)
		end
	end
	return var1
end

function t_18.jsonEncode(_)
	return {}
end

function t_18.jsonDecode(_)
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

function t_19.new(p1)
	-- upvalues: t (ref), t_19 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_19)
end

function t_19:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var731 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var734 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_19.decode(p1)
	-- upvalues: t_19 (ref), protoModule (ref), t (ref)
	local var1 = t_19.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.UpdateUserSettingsAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var738)
		end
	end
	return var1
end

function t_19:jsonEncode()
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

function t_19:jsonDecode()
	-- upvalues: t_19 (ref), t (ref)
	local var1 = t_19.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_19.descriptor = {
	name = "UpdateUserSettingsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.UpdateUserSettingsAction"
}
t.UpdateUserSettingsAction = t_19
typeRegistryModule.default:register(t.UpdateUserSettingsAction)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p1)
	-- upvalues: t_20 (ref)
	return setmetatable({
		settings = if p1 == nil or p1.settings == nil then nil else p1.settings,
		audit_data = if p1 == nil or p1.audit_data == nil then nil else p1.audit_data
	}, t_20)
end

function t_20:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.settings ~= nil then
		local var2 = self.settings:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var762 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.audit_data ~= nil then
		local var5 = self.audit_data:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var765 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_20.decode(p1)
	-- upvalues: t_20 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_20.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.settings = propTypesModule.StructProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.audit_data = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var769)
		end
	end
	return var1
end

function t_20:jsonEncode()
	local t = {}
	
	if self.settings ~= nil then
		t.settings = self.settings:jsonEncode()
	end
	if self.audit_data ~= nil then
		t.auditData = self.audit_data:jsonEncode()
	end
	return t
end

function t_20:jsonDecode()
	-- upvalues: t_20 (ref), propTypesModule (ref)
	local var1 = t_20.new()
	
	if self.settings ~= nil then
		var1.settings = propTypesModule.StructProp.jsonDecode(self.settings)
	end
	if self.audit_data ~= nil then
		var1.audit_data = propTypesModule.StringProp.jsonDecode(self.audit_data)
	end
	if self.auditData ~= nil then
		var1.audit_data = propTypesModule.StringProp.jsonDecode(self.auditData)
	end
	return var1
end

t_20.descriptor = {
	name = "UpdateUserSettingsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.UpdateUserSettingsAction_Params = t_20
typeRegistryModule.default:register(t.UpdateUserSettingsAction_Params)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p1)
	-- upvalues: t (ref), t_21 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_21)
end

function t_21:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var791 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var794 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_21.decode(p1)
	-- upvalues: t_21 (ref), protoModule (ref), t (ref)
	local var1 = t_21.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenTooltipAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var798)
		end
	end
	return var1
end

function t_21:jsonEncode()
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

function t_21:jsonDecode()
	-- upvalues: t_21 (ref), t (ref)
	local var1 = t_21.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_21.descriptor = {
	name = "OpenTooltipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenTooltipAction"
}
t.OpenTooltipAction = t_21
typeRegistryModule.default:register(t.OpenTooltipAction)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p1)
	-- upvalues: t_22 (ref)
	return setmetatable({
		tooltip_title = if p1 == nil or p1.tooltip_title == nil then nil else p1.tooltip_title,
		tooltip_info_text = if p1 == nil or p1.tooltip_info_text == nil then nil else p1.tooltip_info_text
	}, t_22)
end

function t_22:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.tooltip_title ~= nil then
		local var2 = self.tooltip_title:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var822 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.tooltip_info_text ~= nil then
		local var5 = self.tooltip_info_text:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var825 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_22.decode(p1)
	-- upvalues: t_22 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_22.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.tooltip_title = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.tooltip_info_text = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var829)
		end
	end
	return var1
end

function t_22:jsonEncode()
	local t = {}
	
	if self.tooltip_title ~= nil then
		t.tooltipTitle = self.tooltip_title:jsonEncode()
	end
	if self.tooltip_info_text ~= nil then
		t.tooltipInfoText = self.tooltip_info_text:jsonEncode()
	end
	return t
end

function t_22:jsonDecode()
	-- upvalues: t_22 (ref), propTypesModule (ref)
	local var1 = t_22.new()
	
	if self.tooltip_title ~= nil then
		var1.tooltip_title = propTypesModule.StringProp.jsonDecode(self.tooltip_title)
	end
	if self.tooltipTitle ~= nil then
		var1.tooltip_title = propTypesModule.StringProp.jsonDecode(self.tooltipTitle)
	end
	if self.tooltip_info_text ~= nil then
		var1.tooltip_info_text = propTypesModule.StringProp.jsonDecode(self.tooltip_info_text)
	end
	if self.tooltipInfoText ~= nil then
		var1.tooltip_info_text = propTypesModule.StringProp.jsonDecode(self.tooltipInfoText)
	end
	return var1
end

t_22.descriptor = {
	name = "OpenTooltipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenTooltipAction_Params = t_22
typeRegistryModule.default:register(t.OpenTooltipAction_Params)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p1)
	-- upvalues: t (ref), t_23 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_23)
end

function t_23:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var851 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var854 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_23.decode(p1)
	-- upvalues: t_23 (ref), protoModule (ref), t (ref)
	local var1 = t_23.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenBadgeDetailsAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var858)
		end
	end
	return var1
end

function t_23:jsonEncode()
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

function t_23:jsonDecode()
	-- upvalues: t_23 (ref), t (ref)
	local var1 = t_23.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_23.descriptor = {
	name = "OpenBadgeDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgeDetailsAction"
}
t.OpenBadgeDetailsAction = t_23
typeRegistryModule.default:register(t.OpenBadgeDetailsAction)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p1)
	-- upvalues: t_24 (ref)
	return setmetatable({
		badge_id = if p1 == nil or p1.badge_id == nil then nil else p1.badge_id,
		title_text = if p1 == nil or p1.title_text == nil then nil else p1.title_text
	}, t_24)
end

function t_24:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.badge_id ~= nil then
		local var2 = self.badge_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var882 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.title_text ~= nil then
		local var5 = self.title_text:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var885 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_24.decode(p1)
	-- upvalues: t_24 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_24.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.badge_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.title_text = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var889)
		end
	end
	return var1
end

function t_24:jsonEncode()
	local t = {}
	
	if self.badge_id ~= nil then
		t.badgeId = self.badge_id:jsonEncode()
	end
	if self.title_text ~= nil then
		t.titleText = self.title_text:jsonEncode()
	end
	return t
end

function t_24:jsonDecode()
	-- upvalues: t_24 (ref), propTypesModule (ref)
	local var1 = t_24.new()
	
	if self.badge_id ~= nil then
		var1.badge_id = propTypesModule.StringProp.jsonDecode(self.badge_id)
	end
	if self.badgeId ~= nil then
		var1.badge_id = propTypesModule.StringProp.jsonDecode(self.badgeId)
	end
	if self.title_text ~= nil then
		var1.title_text = propTypesModule.StringProp.jsonDecode(self.title_text)
	end
	if self.titleText ~= nil then
		var1.title_text = propTypesModule.StringProp.jsonDecode(self.titleText)
	end
	return var1
end

t_24.descriptor = {
	name = "OpenBadgeDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenBadgeDetailsAction_Params = t_24
typeRegistryModule.default:register(t.OpenBadgeDetailsAction_Params)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p1)
	-- upvalues: t (ref), t_25 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_25)
end

function t_25:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var911 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var914 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_25.decode(p1)
	-- upvalues: t_25 (ref), protoModule (ref), t (ref)
	local var1 = t_25.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.LoadMoreFromApiAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var918)
		end
	end
	return var1
end

function t_25:jsonEncode()
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

function t_25:jsonDecode()
	-- upvalues: t_25 (ref), t (ref)
	local var1 = t_25.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_25.descriptor = {
	name = "LoadMoreFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LoadMoreFromApiAction"
}
t.LoadMoreFromApiAction = t_25
typeRegistryModule.default:register(t.LoadMoreFromApiAction)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p1)
	-- upvalues: t_26 (ref)
	return setmetatable({
		surface_key = if p1 == nil or p1.surface_key == nil then nil else p1.surface_key,
		config_key = if p1 == nil or p1.config_key == nil then nil else p1.config_key
	}, t_26)
end

function t_26:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.surface_key ~= nil then
		local var2 = self.surface_key:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var942 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.config_key ~= nil then
		local var5 = self.config_key:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var945 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_26.decode(p1)
	-- upvalues: t_26 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_26.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.surface_key = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.config_key = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var949)
		end
	end
	return var1
end

function t_26:jsonEncode()
	local t = {}
	
	if self.surface_key ~= nil then
		t.surfaceKey = self.surface_key:jsonEncode()
	end
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	return t
end

function t_26:jsonDecode()
	-- upvalues: t_26 (ref), propTypesModule (ref)
	local var1 = t_26.new()
	
	if self.surface_key ~= nil then
		var1.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var1.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		var1.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return var1
end

t_26.descriptor = {
	name = "LoadMoreFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LoadMoreFromApiAction_Params = t_26
typeRegistryModule.default:register(t.LoadMoreFromApiAction_Params)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p1)
	-- upvalues: t (ref), t_27 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_27)
end

function t_27:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var971 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var974 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_27.decode(p1)
	-- upvalues: t_27 (ref), protoModule (ref), t (ref)
	local var1 = t_27.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.ShareAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var978)
		end
	end
	return var1
end

function t_27:jsonEncode()
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

function t_27:jsonDecode()
	-- upvalues: t_27 (ref), t (ref)
	local var1 = t_27.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.ShareAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.ShareAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_27.descriptor = {
	name = "ShareAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareAction"
}
t.ShareAction = t_27
typeRegistryModule.default:register(t.ShareAction)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p1)
	-- upvalues: t_28 (ref)
	return setmetatable({
		oneof_prop = if p1 == nil or p1.oneof_prop == nil then nil else p1.oneof_prop
	}, t_28)
end

function t_28:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "generic_share_link_data" then
			local var2 = self.oneof_prop.value:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var1002 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		elseif self.oneof_prop.type == "share_link_fetch_data" then
			local var5 = self.oneof_prop.value:encode()
			local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var6, var1005 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
			buff = var6
			var1 = var7
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_28.decode(p1)
	-- upvalues: t_28 (ref), protoModule (ref), shareLinkDataModule (ref)
	local var1 = t_28.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.oneof_prop = {
					type = "generic_share_link_data",
					value = shareLinkDataModule.GenericShareLinkData.decode(var10)
				}
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.oneof_prop = {
					type = "share_link_fetch_data",
					value = shareLinkDataModule.ShareLinkFetchData.decode(var12)
				}
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var1009)
		end
	end
	return var1
end

function t_28:jsonEncode()
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

function t_28:jsonDecode()
	-- upvalues: t_28 (ref), shareLinkDataModule (ref)
	local var1 = t_28.new()
	
	if self.generic_share_link_data ~= nil then
		var1.oneof_prop = {
			type = "generic_share_link_data",
			value = shareLinkDataModule.GenericShareLinkData.jsonDecode(self.generic_share_link_data)
		}
	end
	if self.genericShareLinkData ~= nil then
		var1.oneof_prop = {
			type = "generic_share_link_data",
			value = shareLinkDataModule.GenericShareLinkData.jsonDecode(self.genericShareLinkData)
		}
	end
	if self.share_link_fetch_data ~= nil then
		var1.oneof_prop = {
			type = "share_link_fetch_data",
			value = shareLinkDataModule.ShareLinkFetchData.jsonDecode(self.share_link_fetch_data)
		}
	end
	if self.shareLinkFetchData ~= nil then
		var1.oneof_prop = {
			type = "share_link_fetch_data",
			value = shareLinkDataModule.ShareLinkFetchData.jsonDecode(self.shareLinkFetchData)
		}
	end
	return var1
end

t_28.descriptor = {
	name = "ShareAction_ShareLinkData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkData"
}
t.ShareAction_ShareLinkData = t_28
typeRegistryModule.default:register(t.ShareAction_ShareLinkData)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p1)
	-- upvalues: t_29 (ref)
	return setmetatable({
		share_link_type = if p1 == nil or p1.share_link_type == nil then nil else p1.share_link_type,
		share_link_data = if p1 == nil or p1.share_link_data == nil then nil else p1.share_link_data,
		entry_point_key = if p1 == nil or p1.entry_point_key == nil then nil else p1.entry_point_key
	}, t_29)
end

function t_29:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.share_link_type ~= nil then
		local var2 = self.share_link_type:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var1032 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.share_link_data ~= nil then
		local var5 = self.share_link_data:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var1035 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.entry_point_key ~= nil then
		local var8 = self.entry_point_key:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var1038 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_29.decode(p1)
	-- upvalues: t_29 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1 = t_29.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.share_link_type = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.share_link_data = t.ShareAction_ShareLinkData.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.entry_point_key = propTypesModule.StringProp.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var1042)
		end
	end
	return var1
end

function t_29:jsonEncode()
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

function t_29:jsonDecode()
	-- upvalues: t_29 (ref), propTypesModule (ref), t (ref)
	local var1 = t_29.new()
	
	if self.share_link_type ~= nil then
		var1.share_link_type = propTypesModule.StringProp.jsonDecode(self.share_link_type)
	end
	if self.shareLinkType ~= nil then
		var1.share_link_type = propTypesModule.StringProp.jsonDecode(self.shareLinkType)
	end
	if self.share_link_data ~= nil then
		var1.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.share_link_data)
	end
	if self.shareLinkData ~= nil then
		var1.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.shareLinkData)
	end
	if self.entry_point_key ~= nil then
		var1.entry_point_key = propTypesModule.StringProp.jsonDecode(self.entry_point_key)
	end
	if self.entryPointKey ~= nil then
		var1.entry_point_key = propTypesModule.StringProp.jsonDecode(self.entryPointKey)
	end
	return var1
end

t_29.descriptor = {
	name = "ShareAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ShareAction_Params = t_29
typeRegistryModule.default:register(t.ShareAction_Params)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p1)
	-- upvalues: t (ref), t_30 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_30)
end

function t_30:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var1066 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1069 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_30.decode(p1)
	-- upvalues: t_30 (ref), protoModule (ref), t (ref)
	local var1 = t_30.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenAbuseReportAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var1073)
		end
	end
	return var1
end

function t_30:jsonEncode()
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

function t_30:jsonDecode()
	-- upvalues: t_30 (ref), t (ref)
	local var1 = t_30.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_30.descriptor = {
	name = "OpenAbuseReportAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAbuseReportAction"
}
t.OpenAbuseReportAction = t_30
typeRegistryModule.default:register(t.OpenAbuseReportAction)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p1)
	-- upvalues: t_31 (ref)
	return setmetatable({
		target_id = if p1 == nil or p1.target_id == nil then nil else p1.target_id,
		abuse_vector = if p1 == nil or p1.abuse_vector == nil then nil else p1.abuse_vector,
		asset_type_name = if p1 == nil or p1.asset_type_name == nil then nil else p1.asset_type_name,
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id
	}, t_31)
end

function t_31:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.target_id ~= nil then
		local var2 = self.target_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var1097 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.abuse_vector ~= nil then
		local var5 = self.abuse_vector:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var1100 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.asset_type_name ~= nil then
		local var8 = self.asset_type_name:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var1103 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.universe_id ~= nil then
		local var11 = self.universe_id:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var1106 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_31.decode(p1)
	-- upvalues: t_31 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_31.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.target_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.abuse_vector = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.asset_type_name = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.universe_id = propTypesModule.StringProp.decode(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var1110)
		end
	end
	return var1
end

function t_31:jsonEncode()
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

function t_31:jsonDecode()
	-- upvalues: t_31 (ref), propTypesModule (ref)
	local var1 = t_31.new()
	
	if self.target_id ~= nil then
		var1.target_id = propTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		var1.target_id = propTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.abuse_vector ~= nil then
		var1.abuse_vector = propTypesModule.StringProp.jsonDecode(self.abuse_vector)
	end
	if self.abuseVector ~= nil then
		var1.abuse_vector = propTypesModule.StringProp.jsonDecode(self.abuseVector)
	end
	if self.asset_type_name ~= nil then
		var1.asset_type_name = propTypesModule.StringProp.jsonDecode(self.asset_type_name)
	end
	if self.assetTypeName ~= nil then
		var1.asset_type_name = propTypesModule.StringProp.jsonDecode(self.assetTypeName)
	end
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1
end

t_31.descriptor = {
	name = "OpenAbuseReportAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAbuseReportAction_Params = t_31
typeRegistryModule.default:register(t.OpenAbuseReportAction_Params)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p1)
	-- upvalues: t (ref), t_32 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_32)
end

function t_32:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var1136 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1139 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_32.decode(p1)
	-- upvalues: t_32 (ref), protoModule (ref), t (ref)
	local var1 = t_32.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.RemoveBadgeFromInventoryAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var1143)
		end
	end
	return var1
end

function t_32:jsonEncode()
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

function t_32:jsonDecode()
	-- upvalues: t_32 (ref), t (ref)
	local var1 = t_32.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_32.descriptor = {
	name = "RemoveBadgeFromInventoryAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RemoveBadgeFromInventoryAction"
}
t.RemoveBadgeFromInventoryAction = t_32
typeRegistryModule.default:register(t.RemoveBadgeFromInventoryAction)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p1)
	-- upvalues: t_33 (ref)
	return setmetatable({
		asset_id = if p1 == nil or p1.asset_id == nil then nil else p1.asset_id
	}, t_33)
end

function t_33:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.asset_id ~= nil then
		local var2 = self.asset_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var1167 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_33.decode(p1)
	-- upvalues: t_33 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_33.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.asset_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1171)
		end
	end
	return var1
end

function t_33:jsonEncode()
	local t = {}
	
	if self.asset_id ~= nil then
		t.assetId = self.asset_id:jsonEncode()
	end
	return t
end

function t_33:jsonDecode()
	-- upvalues: t_33 (ref), propTypesModule (ref)
	local var1 = t_33.new()
	
	if self.asset_id ~= nil then
		var1.asset_id = propTypesModule.StringProp.jsonDecode(self.asset_id)
	end
	if self.assetId ~= nil then
		var1.asset_id = propTypesModule.StringProp.jsonDecode(self.assetId)
	end
	return var1
end

t_33.descriptor = {
	name = "RemoveBadgeFromInventoryAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RemoveBadgeFromInventoryAction_Params = t_33
typeRegistryModule.default:register(t.RemoveBadgeFromInventoryAction_Params)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p1)
	-- upvalues: t (ref), t_34 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_34)
end

function t_34:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var1191 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1194 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_34.decode(p1)
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var1 = t_34.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenProfileAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var1198)
		end
	end
	return var1
end

function t_34:jsonEncode()
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

function t_34:jsonDecode()
	-- upvalues: t_34 (ref), t (ref)
	local var1 = t_34.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenProfileAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenProfileAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_34.descriptor = {
	name = "OpenProfileAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenProfileAction"
}
t.OpenProfileAction = t_34
typeRegistryModule.default:register(t.OpenProfileAction)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p1)
	-- upvalues: t_35 (ref)
	return setmetatable({
		profile_id = if p1 == nil or p1.profile_id == nil then nil else p1.profile_id,
		profile_type = if p1 == nil or p1.profile_type == nil then nil else p1.profile_type,
		source = if p1 == nil or p1.source == nil then nil else p1.source
	}, t_35)
end

function t_35:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.profile_id ~= nil then
		local var2 = self.profile_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var1222 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.profile_type ~= nil then
		local var5 = self.profile_type:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var1225 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.source ~= nil then
		local var8 = self.source:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var1228 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_35.decode(p1)
	-- upvalues: t_35 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_35.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.profile_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.profile_type = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.source = propTypesModule.StringProp.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var1232)
		end
	end
	return var1
end

function t_35:jsonEncode()
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

function t_35:jsonDecode()
	-- upvalues: t_35 (ref), propTypesModule (ref)
	local var1 = t_35.new()
	
	if self.profile_id ~= nil then
		var1.profile_id = propTypesModule.StringProp.jsonDecode(self.profile_id)
	end
	if self.profileId ~= nil then
		var1.profile_id = propTypesModule.StringProp.jsonDecode(self.profileId)
	end
	if self.profile_type ~= nil then
		var1.profile_type = propTypesModule.StringProp.jsonDecode(self.profile_type)
	end
	if self.profileType ~= nil then
		var1.profile_type = propTypesModule.StringProp.jsonDecode(self.profileType)
	end
	if self.source ~= nil then
		var1.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var1
end

t_35.descriptor = {
	name = "OpenProfileAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenProfileAction_Params = t_35
typeRegistryModule.default:register(t.OpenProfileAction_Params)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p1)
	-- upvalues: t (ref), t_36 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_36)
end

function t_36:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var1256 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1259 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_36.decode(p1)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1 = t_36.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenFacialAgeEstimationAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var1263)
		end
	end
	return var1
end

function t_36:jsonEncode()
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

function t_36:jsonDecode()
	-- upvalues: t_36 (ref), t (ref)
	local var1 = t_36.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_36.descriptor = {
	name = "OpenFacialAgeEstimationAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenFacialAgeEstimationAction"
}
t.OpenFacialAgeEstimationAction = t_36
typeRegistryModule.default:register(t.OpenFacialAgeEstimationAction)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p1)
	-- upvalues: t_37 (ref)
	return setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then nil else p1.user_id,
		source = if p1 == nil or p1.source == nil then nil else p1.source,
		context = if p1 == nil or p1.context == nil then nil else p1.context,
		is_in_experience = if p1 == nil or p1.is_in_experience == nil then nil else p1.is_in_experience,
		on_success = if p1 == nil or p1.on_success == nil then nil else p1.on_success,
		on_failure = if p1 == nil or p1.on_failure == nil then nil else p1.on_failure,
		should_include_vpc = if p1 == nil or p1.should_include_vpc == nil then nil else p1.should_include_vpc
	}, t_37)
end

function t_37:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.user_id ~= nil then
		local var2 = self.user_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var1287 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.source ~= nil then
		local var5 = self.source:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var1290 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.context ~= nil then
		local var8 = self.context:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var1293 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.is_in_experience ~= nil then
		local var11 = self.is_in_experience:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var1296 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	if self.on_success ~= nil then
		local var14 = self.on_success:encode()
		local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var15, var1299 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
		buff = var15
		var1 = var16
	end
	if self.on_failure ~= nil then
		local var17 = self.on_failure:encode()
		local var18, var19 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var18, var1302 = protoModule.writeBuffer(var18, var19, var17, buffer.len(var17))
		buff = var18
		var1 = var19
	end
	if self.should_include_vpc ~= nil then
		local var20 = self.should_include_vpc:encode()
		local var21, var22 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var21, var1305 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
		buff = var21
		var1 = var22
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_37.decode(p1)
	-- upvalues: t_37 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1 = t_37.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.user_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.source = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.context = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.is_in_experience = propTypesModule.BoolProp.decode(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.on_success = t.ActionProp.decode(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.on_failure = t.ActionProp.decode(var20)
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.should_include_vpc = propTypesModule.BoolProp.decode(var22)
			else
				local _ = nil
				local var24, var25 = protoModule.readVarInt(p1, var2)
				var2 = var25 + var24
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var26, var27 = protoModule.readFixed32(p1, var2)
			local _ = var26
			var2 = var27
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var28, var29 = protoModule.readFixed64(p1, var2)
			local _ = var28
			var2 = var29
		else
			error("Unsupported wire type: " .. var1309)
		end
	end
	return var1
end

function t_37:jsonEncode()
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

function t_37:jsonDecode()
	-- upvalues: t_37 (ref), propTypesModule (ref), t (ref)
	local var1 = t_37.new()
	
	if self.user_id ~= nil then
		var1.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var1.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.context ~= nil then
		var1.context = propTypesModule.StringProp.jsonDecode(self.context)
	end
	if self.is_in_experience ~= nil then
		var1.is_in_experience = propTypesModule.BoolProp.jsonDecode(self.is_in_experience)
	end
	if self.isInExperience ~= nil then
		var1.is_in_experience = propTypesModule.BoolProp.jsonDecode(self.isInExperience)
	end
	if self.on_success ~= nil then
		var1.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var1.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var1.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var1.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	if self.should_include_vpc ~= nil then
		var1.should_include_vpc = propTypesModule.BoolProp.jsonDecode(self.should_include_vpc)
	end
	if self.shouldIncludeVpc ~= nil then
		var1.should_include_vpc = propTypesModule.BoolProp.jsonDecode(self.shouldIncludeVpc)
	end
	return var1
end

t_37.descriptor = {
	name = "OpenFacialAgeEstimationAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenFacialAgeEstimationAction_Params = t_37
typeRegistryModule.default:register(t.OpenFacialAgeEstimationAction_Params)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p1)
	-- upvalues: t (ref), t_38 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_38)
end

function t_38:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var1341 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1344 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_38.decode(p1)
	-- upvalues: t_38 (ref), protoModule (ref), t (ref)
	local var1 = t_38.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.ShowToastAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var1348)
		end
	end
	return var1
end

function t_38:jsonEncode()
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

function t_38:jsonDecode()
	-- upvalues: t_38 (ref), t (ref)
	local var1 = t_38.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.ShowToastAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.ShowToastAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_38.descriptor = {
	name = "ShowToastAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShowToastAction"
}
t.ShowToastAction = t_38
typeRegistryModule.default:register(t.ShowToastAction)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p1)
	-- upvalues: t_39 (ref)
	return setmetatable({
		toast_message = if p1 == nil or p1.toast_message == nil then nil else p1.toast_message,
		toast_type = if p1 == nil or p1.toast_type == nil then nil else p1.toast_type,
		dismiss_prompt = if p1 == nil or p1.dismiss_prompt == nil then nil else p1.dismiss_prompt,
		prompt_type = if p1 == nil or p1.prompt_type == nil then nil else p1.prompt_type,
		prompt_id = if p1 == nil or p1.prompt_id == nil then nil else p1.prompt_id
	}, t_39)
end

function t_39:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.toast_message ~= nil then
		local var2 = self.toast_message:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var1372 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.toast_type ~= nil then
		local var5 = self.toast_type:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var1375 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.dismiss_prompt ~= nil then
		local var8 = self.dismiss_prompt:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var1378 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.prompt_type ~= nil then
		local var11 = self.prompt_type:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var1381 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	if self.prompt_id ~= nil then
		local var14 = self.prompt_id:encode()
		local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var15, var1384 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
		buff = var15
		var1 = var16
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_39.decode(p1)
	-- upvalues: t_39 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_39.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.toast_message = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.toast_type = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.dismiss_prompt = propTypesModule.BoolProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.prompt_type = propTypesModule.StringProp.decode(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.prompt_id = propTypesModule.StringProp.decode(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var1388)
		end
	end
	return var1
end

function t_39:jsonEncode()
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

function t_39:jsonDecode()
	-- upvalues: t_39 (ref), propTypesModule (ref)
	local var1 = t_39.new()
	
	if self.toast_message ~= nil then
		var1.toast_message = propTypesModule.StringProp.jsonDecode(self.toast_message)
	end
	if self.toastMessage ~= nil then
		var1.toast_message = propTypesModule.StringProp.jsonDecode(self.toastMessage)
	end
	if self.toast_type ~= nil then
		var1.toast_type = propTypesModule.StringProp.jsonDecode(self.toast_type)
	end
	if self.toastType ~= nil then
		var1.toast_type = propTypesModule.StringProp.jsonDecode(self.toastType)
	end
	if self.dismiss_prompt ~= nil then
		var1.dismiss_prompt = propTypesModule.BoolProp.jsonDecode(self.dismiss_prompt)
	end
	if self.dismissPrompt ~= nil then
		var1.dismiss_prompt = propTypesModule.BoolProp.jsonDecode(self.dismissPrompt)
	end
	if self.prompt_type ~= nil then
		var1.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var1.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	return var1
end

t_39.descriptor = {
	name = "ShowToastAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ShowToastAction_Params = t_39
typeRegistryModule.default:register(t.ShowToastAction_Params)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p1)
	-- upvalues: t (ref), t_40 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_40)
end

function t_40:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var1416 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1419 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_40.decode(p1)
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var1 = t_40.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenPhoneUpsellModalAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var1423)
		end
	end
	return var1
end

function t_40:jsonEncode()
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

function t_40:jsonDecode()
	-- upvalues: t_40 (ref), t (ref)
	local var1 = t_40.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_40.descriptor = {
	name = "OpenPhoneUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenPhoneUpsellModalAction"
}
t.OpenPhoneUpsellModalAction = t_40
typeRegistryModule.default:register(t.OpenPhoneUpsellModalAction)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p1)
	-- upvalues: t_41 (ref)
	return setmetatable({
		voice_opt_in = if p1 == nil or p1.voice_opt_in == nil then nil else p1.voice_opt_in,
		event_context = if p1 == nil or p1.event_context == nil then nil else p1.event_context,
		origin = if p1 == nil or p1.origin == nil then nil else p1.origin,
		should_autofill_android_phone_number_at_launch = if p1 == nil or p1.should_autofill_android_phone_number_at_launch == nil then nil else p1.should_autofill_android_phone_number_at_launch,
		add_phone_description_key = if p1 == nil or p1.add_phone_description_key == nil then nil else p1.add_phone_description_key,
		on_success = if p1 == nil or p1.on_success == nil then nil else p1.on_success,
		on_failure = if p1 == nil or p1.on_failure == nil then nil else p1.on_failure,
		on_cancelled = if p1 == nil or p1.on_cancelled == nil then nil else p1.on_cancelled
	}, t_41)
end

function t_41:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.voice_opt_in ~= nil then
		local var2 = self.voice_opt_in:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var1447 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.event_context ~= nil then
		local var5 = self.event_context:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var1450 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.origin ~= nil then
		local var8 = self.origin:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var1453 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		local var11 = self.should_autofill_android_phone_number_at_launch:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var1456 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	if self.add_phone_description_key ~= nil then
		local var14 = self.add_phone_description_key:encode()
		local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var15, var1459 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
		buff = var15
		var1 = var16
	end
	if self.on_success ~= nil then
		local var17 = self.on_success:encode()
		local var18, var19 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var18, var1462 = protoModule.writeBuffer(var18, var19, var17, buffer.len(var17))
		buff = var18
		var1 = var19
	end
	if self.on_failure ~= nil then
		local var20 = self.on_failure:encode()
		local var21, var22 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var21, var1465 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
		buff = var21
		var1 = var22
	end
	if self.on_cancelled ~= nil then
		local var23 = self.on_cancelled:encode()
		local var24, var25 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var24, var1468 = protoModule.writeBuffer(var24, var25, var23, buffer.len(var23))
		buff = var24
		var1 = var25
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_41.decode(p1)
	-- upvalues: t_41 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1 = t_41.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.voice_opt_in = propTypesModule.BoolProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.event_context = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.origin = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.decode(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.add_phone_description_key = propTypesModule.StringProp.decode(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.on_success = t.ActionProp.decode(var20)
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.on_failure = t.ActionProp.decode(var22)
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.on_cancelled = t.ActionProp.decode(var24)
			else
				local _ = nil
				local var26, var27 = protoModule.readVarInt(p1, var2)
				var2 = var27 + var26
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var28, var29 = protoModule.readFixed32(p1, var2)
			local _ = var28
			var2 = var29
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var30, var31 = protoModule.readFixed64(p1, var2)
			local _ = var30
			var2 = var31
		else
			error("Unsupported wire type: " .. var1472)
		end
	end
	return var1
end

function t_41:jsonEncode()
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

function t_41:jsonDecode()
	-- upvalues: t_41 (ref), propTypesModule (ref), t (ref)
	local var1 = t_41.new()
	
	if self.voice_opt_in ~= nil then
		var1.voice_opt_in = propTypesModule.BoolProp.jsonDecode(self.voice_opt_in)
	end
	if self.voiceOptIn ~= nil then
		var1.voice_opt_in = propTypesModule.BoolProp.jsonDecode(self.voiceOptIn)
	end
	if self.event_context ~= nil then
		var1.event_context = propTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		var1.event_context = propTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		var1.origin = propTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		var1.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.jsonDecode(self.should_autofill_android_phone_number_at_launch)
	end
	if self.shouldAutofillAndroidPhoneNumberAtLaunch ~= nil then
		var1.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.jsonDecode(self.shouldAutofillAndroidPhoneNumberAtLaunch)
	end
	if self.add_phone_description_key ~= nil then
		var1.add_phone_description_key = propTypesModule.StringProp.jsonDecode(self.add_phone_description_key)
	end
	if self.addPhoneDescriptionKey ~= nil then
		var1.add_phone_description_key = propTypesModule.StringProp.jsonDecode(self.addPhoneDescriptionKey)
	end
	if self.on_success ~= nil then
		var1.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var1.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var1.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var1.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	if self.on_cancelled ~= nil then
		var1.on_cancelled = t.ActionProp.jsonDecode(self.on_cancelled)
	end
	if self.onCancelled ~= nil then
		var1.on_cancelled = t.ActionProp.jsonDecode(self.onCancelled)
	end
	return var1
end

t_41.descriptor = {
	name = "OpenPhoneUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenPhoneUpsellModalAction_Params = t_41
typeRegistryModule.default:register(t.OpenPhoneUpsellModalAction_Params)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p1)
	-- upvalues: t (ref), t_42 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_42)
end

function t_42:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var1506 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1509 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_42.decode(p1)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1 = t_42.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenEmailUpsellModalAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var1513)
		end
	end
	return var1
end

function t_42:jsonEncode()
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

function t_42:jsonDecode()
	-- upvalues: t_42 (ref), t (ref)
	local var1 = t_42.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_42.descriptor = {
	name = "OpenEmailUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenEmailUpsellModalAction"
}
t.OpenEmailUpsellModalAction = t_42
typeRegistryModule.default:register(t.OpenEmailUpsellModalAction)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p1)
	-- upvalues: t_43 (ref)
	return setmetatable({
		add_email_over13_text_key = if p1 == nil or p1.add_email_over13_text_key == nil then nil else p1.add_email_over13_text_key,
		add_email_title_key = if p1 == nil or p1.add_email_title_key == nil then nil else p1.add_email_title_key,
		is_email_modal_called_from_home_page = if p1 == nil or p1.is_email_modal_called_from_home_page == nil then nil else p1.is_email_modal_called_from_home_page,
		event_context = if p1 == nil or p1.event_context == nil then nil else p1.event_context,
		origin = if p1 == nil or p1.origin == nil then nil else p1.origin,
		section = if p1 == nil or p1.section == nil then nil else p1.section,
		on_success = if p1 == nil or p1.on_success == nil then nil else p1.on_success,
		on_failure = if p1 == nil or p1.on_failure == nil then nil else p1.on_failure
	}, t_43)
end

function t_43:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.add_email_over13_text_key ~= nil then
		local var2 = self.add_email_over13_text_key:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var1537 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.add_email_title_key ~= nil then
		local var5 = self.add_email_title_key:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var1540 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		local var8 = self.is_email_modal_called_from_home_page:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var1543 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.event_context ~= nil then
		local var11 = self.event_context:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var1546 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	if self.origin ~= nil then
		local var14 = self.origin:encode()
		local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var15, var1549 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
		buff = var15
		var1 = var16
	end
	if self.section ~= nil then
		local var17 = self.section:encode()
		local var18, var19 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var18, var1552 = protoModule.writeBuffer(var18, var19, var17, buffer.len(var17))
		buff = var18
		var1 = var19
	end
	if self.on_success ~= nil then
		local var20 = self.on_success:encode()
		local var21, var22 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var21, var1555 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
		buff = var21
		var1 = var22
	end
	if self.on_failure ~= nil then
		local var23 = self.on_failure:encode()
		local var24, var25 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var24, var1558 = protoModule.writeBuffer(var24, var25, var23, buffer.len(var23))
		buff = var24
		var1 = var25
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_43.decode(p1)
	-- upvalues: t_43 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1 = t_43.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.add_email_over13_text_key = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.add_email_title_key = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.is_email_modal_called_from_home_page = propTypesModule.BoolProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.event_context = propTypesModule.StringProp.decode(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.origin = propTypesModule.StringProp.decode(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.section = propTypesModule.StringProp.decode(var20)
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.on_success = t.ActionProp.decode(var22)
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.on_failure = t.ActionProp.decode(var24)
			else
				local _ = nil
				local var26, var27 = protoModule.readVarInt(p1, var2)
				var2 = var27 + var26
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var28, var29 = protoModule.readFixed32(p1, var2)
			local _ = var28
			var2 = var29
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var30, var31 = protoModule.readFixed64(p1, var2)
			local _ = var30
			var2 = var31
		else
			error("Unsupported wire type: " .. var1562)
		end
	end
	return var1
end

function t_43:jsonEncode()
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

function t_43:jsonDecode()
	-- upvalues: t_43 (ref), propTypesModule (ref), t (ref)
	local var1 = t_43.new()
	
	if self.add_email_over13_text_key ~= nil then
		var1.add_email_over13_text_key = propTypesModule.StringProp.jsonDecode(self.add_email_over13_text_key)
	end
	if self.addEmailOver13TextKey ~= nil then
		var1.add_email_over13_text_key = propTypesModule.StringProp.jsonDecode(self.addEmailOver13TextKey)
	end
	if self.add_email_title_key ~= nil then
		var1.add_email_title_key = propTypesModule.StringProp.jsonDecode(self.add_email_title_key)
	end
	if self.addEmailTitleKey ~= nil then
		var1.add_email_title_key = propTypesModule.StringProp.jsonDecode(self.addEmailTitleKey)
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		var1.is_email_modal_called_from_home_page = propTypesModule.BoolProp.jsonDecode(self.is_email_modal_called_from_home_page)
	end
	if self.isEmailModalCalledFromHomePage ~= nil then
		var1.is_email_modal_called_from_home_page = propTypesModule.BoolProp.jsonDecode(self.isEmailModalCalledFromHomePage)
	end
	if self.event_context ~= nil then
		var1.event_context = propTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		var1.event_context = propTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		var1.origin = propTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.section ~= nil then
		var1.section = propTypesModule.StringProp.jsonDecode(self.section)
	end
	if self.on_success ~= nil then
		var1.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var1.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var1.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var1.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	return var1
end

t_43.descriptor = {
	name = "OpenEmailUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenEmailUpsellModalAction_Params = t_43
typeRegistryModule.default:register(t.OpenEmailUpsellModalAction_Params)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p1)
	-- upvalues: t (ref), t_44 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_44)
end

function t_44:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var1596 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1599 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_44.decode(p1)
	-- upvalues: t_44 (ref), protoModule (ref), t (ref)
	local var1 = t_44.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenAddConnectionsPageAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var1603)
		end
	end
	return var1
end

function t_44:jsonEncode()
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

function t_44:jsonDecode()
	-- upvalues: t_44 (ref), t (ref)
	local var1 = t_44.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_44.descriptor = {
	name = "OpenAddConnectionsPageAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAddConnectionsPageAction"
}
t.OpenAddConnectionsPageAction = t_44
typeRegistryModule.default:register(t.OpenAddConnectionsPageAction)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p1)
	-- upvalues: t_45 (ref)
	return setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then nil else p1.user_id,
		source = if p1 == nil or p1.source == nil then nil else p1.source
	}, t_45)
end

function t_45:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.user_id ~= nil then
		local var2 = self.user_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var1627 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.source ~= nil then
		local var5 = self.source:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var1630 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_45.decode(p1)
	-- upvalues: t_45 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_45.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.user_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.source = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var1634)
		end
	end
	return var1
end

function t_45:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_45:jsonDecode()
	-- upvalues: t_45 (ref), propTypesModule (ref)
	local var1 = t_45.new()
	
	if self.user_id ~= nil then
		var1.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var1.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var1
end

t_45.descriptor = {
	name = "OpenAddConnectionsPageAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAddConnectionsPageAction_Params = t_45
typeRegistryModule.default:register(t.OpenAddConnectionsPageAction_Params)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p1)
	-- upvalues: t (ref), t_46 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_46)
end

function t_46:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var1656 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1659 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_46.decode(p1)
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var1 = t_46.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenMarketplaceAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var1663)
		end
	end
	return var1
end

function t_46:jsonEncode()
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

function t_46:jsonDecode()
	-- upvalues: t_46 (ref), t (ref)
	local var1 = t_46.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_46.descriptor = {
	name = "OpenMarketplaceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceAction"
}
t.OpenMarketplaceAction = t_46
typeRegistryModule.default:register(t.OpenMarketplaceAction)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p1)
	-- upvalues: t_47 (ref)
	return setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then nil else p1.user_id,
		source = if p1 == nil or p1.source == nil then nil else p1.source
	}, t_47)
end

function t_47:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.user_id ~= nil then
		local var2 = self.user_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var1687 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.source ~= nil then
		local var5 = self.source:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var1690 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_47.decode(p1)
	-- upvalues: t_47 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_47.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.user_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.source = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var1694)
		end
	end
	return var1
end

function t_47:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_47:jsonDecode()
	-- upvalues: t_47 (ref), propTypesModule (ref)
	local var1 = t_47.new()
	
	if self.user_id ~= nil then
		var1.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var1.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var1
end

t_47.descriptor = {
	name = "OpenMarketplaceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceAction_Params = t_47
typeRegistryModule.default:register(t.OpenMarketplaceAction_Params)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p1)
	-- upvalues: t (ref), t_48 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_48)
end

function t_48:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var1716 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1719 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_48.decode(p1)
	-- upvalues: t_48 (ref), protoModule (ref), t (ref)
	local var1 = t_48.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.HideProfileCompletionAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var1723)
		end
	end
	return var1
end

function t_48:jsonEncode()
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

function t_48:jsonDecode()
	-- upvalues: t_48 (ref), t (ref)
	local var1 = t_48.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_48.descriptor = {
	name = "HideProfileCompletionAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.HideProfileCompletionAction"
}
t.HideProfileCompletionAction = t_48
typeRegistryModule.default:register(t.HideProfileCompletionAction)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p1)
	-- upvalues: t_49 (ref)
	return setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then nil else p1.user_id,
		prompt_id = if p1 == nil or p1.prompt_id == nil then nil else p1.prompt_id,
		source = if p1 == nil or p1.source == nil then nil else p1.source,
		prompt_type = if p1 == nil or p1.prompt_type == nil then nil else p1.prompt_type
	}, t_49)
end

function t_49:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.user_id ~= nil then
		local var2 = self.user_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var1747 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.prompt_id ~= nil then
		local var5 = self.prompt_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var1750 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.source ~= nil then
		local var8 = self.source:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var1753 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.prompt_type ~= nil then
		local var11 = self.prompt_type:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var1756 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_49.decode(p1)
	-- upvalues: t_49 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_49.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.user_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.prompt_id = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.source = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.prompt_type = propTypesModule.StringProp.decode(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var1760)
		end
	end
	return var1
end

function t_49:jsonEncode()
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

function t_49:jsonDecode()
	-- upvalues: t_49 (ref), propTypesModule (ref)
	local var1 = t_49.new()
	
	if self.user_id ~= nil then
		var1.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.prompt_id ~= nil then
		var1.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.source ~= nil then
		var1.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.prompt_type ~= nil then
		var1.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	return var1
end

t_49.descriptor = {
	name = "HideProfileCompletionAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.HideProfileCompletionAction_Params = t_49
typeRegistryModule.default:register(t.HideProfileCompletionAction_Params)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p1)
	-- upvalues: t (ref), t_50 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_50)
end

function t_50:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var1786 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1789 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_50.decode(p1)
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var1 = t_50.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.SelectMarketplaceCatalogCategory_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var1793)
		end
	end
	return var1
end

function t_50:jsonEncode()
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

function t_50:jsonDecode()
	-- upvalues: t_50 (ref), t (ref)
	local var1 = t_50.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_50.descriptor = {
	name = "SelectMarketplaceCatalogCategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogCategory"
}
t.SelectMarketplaceCatalogCategory = t_50
typeRegistryModule.default:register(t.SelectMarketplaceCatalogCategory)
local t_51 = {}
t_51.__index = t_51

function t_51.new(p1)
	-- upvalues: t_51 (ref)
	return setmetatable({
		category_id = if p1 == nil or p1.category_id == nil then nil else p1.category_id
	}, t_51)
end

function t_51:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.category_id ~= nil then
		local var2 = self.category_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var1817 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_51.decode(p1)
	-- upvalues: t_51 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_51.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.category_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1821)
		end
	end
	return var1
end

function t_51:jsonEncode()
	local t = {}
	
	if self.category_id ~= nil then
		t.categoryId = self.category_id:jsonEncode()
	end
	return t
end

function t_51:jsonDecode()
	-- upvalues: t_51 (ref), propTypesModule (ref)
	local var1 = t_51.new()
	
	if self.category_id ~= nil then
		var1.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var1.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	return var1
end

t_51.descriptor = {
	name = "SelectMarketplaceCatalogCategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceCatalogCategory_Params = t_51
typeRegistryModule.default:register(t.SelectMarketplaceCatalogCategory_Params)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p1)
	-- upvalues: t (ref), t_52 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_52)
end

function t_52:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var1841 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1844 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_52.decode(p1)
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1 = t_52.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.SelectMarketplaceCatalogSubcategory_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var1848)
		end
	end
	return var1
end

function t_52:jsonEncode()
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

function t_52:jsonDecode()
	-- upvalues: t_52 (ref), t (ref)
	local var1 = t_52.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_52.descriptor = {
	name = "SelectMarketplaceCatalogSubcategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogSubcategory"
}
t.SelectMarketplaceCatalogSubcategory = t_52
typeRegistryModule.default:register(t.SelectMarketplaceCatalogSubcategory)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p1)
	-- upvalues: t_53 (ref)
	return setmetatable({
		subcategory_id = if p1 == nil or p1.subcategory_id == nil then nil else p1.subcategory_id
	}, t_53)
end

function t_53:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.subcategory_id ~= nil then
		local var2 = self.subcategory_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var1872 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_53.decode(p1)
	-- upvalues: t_53 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_53.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.subcategory_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1876)
		end
	end
	return var1
end

function t_53:jsonEncode()
	local t = {}
	
	if self.subcategory_id ~= nil then
		t.subcategoryId = self.subcategory_id:jsonEncode()
	end
	return t
end

function t_53:jsonDecode()
	-- upvalues: t_53 (ref), propTypesModule (ref)
	local var1 = t_53.new()
	
	if self.subcategory_id ~= nil then
		var1.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var1.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	return var1
end

t_53.descriptor = {
	name = "SelectMarketplaceCatalogSubcategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceCatalogSubcategory_Params = t_53
typeRegistryModule.default:register(t.SelectMarketplaceCatalogSubcategory_Params)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p1)
	-- upvalues: t (ref), t_54 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_54)
end

function t_54:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var1896 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1899 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_54.decode(p1)
	-- upvalues: t_54 (ref), protoModule (ref), t (ref)
	local var1 = t_54.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenMarketplaceCatalogSeeAll_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var1903)
		end
	end
	return var1
end

function t_54:jsonEncode()
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

function t_54:jsonDecode()
	-- upvalues: t_54 (ref), t (ref)
	local var1 = t_54.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_54.descriptor = {
	name = "OpenMarketplaceCatalogSeeAll",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogSeeAll"
}
t.OpenMarketplaceCatalogSeeAll = t_54
typeRegistryModule.default:register(t.OpenMarketplaceCatalogSeeAll)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p1)
	-- upvalues: t_55 (ref)
	return setmetatable({
		sort_id = if p1 == nil or p1.sort_id == nil then nil else p1.sort_id,
		title = if p1 == nil or p1.title == nil then nil else p1.title,
		description = if p1 == nil or p1.description == nil then nil else p1.description,
		tooltip_text = if p1 == nil or p1.tooltip_text == nil then nil else p1.tooltip_text
	}, t_55)
end

function t_55:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.sort_id ~= nil then
		local var2 = self.sort_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var1927 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.title ~= nil then
		local var5 = self.title:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var1930 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.description ~= nil then
		local var8 = self.description:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var1933 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.tooltip_text ~= nil then
		local var11 = self.tooltip_text:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var1936 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_55.decode(p1)
	-- upvalues: t_55 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_55.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.sort_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.title = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.description = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.tooltip_text = propTypesModule.StringProp.decode(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var1940)
		end
	end
	return var1
end

function t_55:jsonEncode()
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

function t_55:jsonDecode()
	-- upvalues: t_55 (ref), propTypesModule (ref)
	local var1 = t_55.new()
	
	if self.sort_id ~= nil then
		var1.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var1.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.title ~= nil then
		var1.title = propTypesModule.StringProp.jsonDecode(self.title)
	end
	if self.description ~= nil then
		var1.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.tooltip_text ~= nil then
		var1.tooltip_text = propTypesModule.StringProp.jsonDecode(self.tooltip_text)
	end
	if self.tooltipText ~= nil then
		var1.tooltip_text = propTypesModule.StringProp.jsonDecode(self.tooltipText)
	end
	return var1
end

t_55.descriptor = {
	name = "OpenMarketplaceCatalogSeeAll_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceCatalogSeeAll_Params = t_55
typeRegistryModule.default:register(t.OpenMarketplaceCatalogSeeAll_Params)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p1)
	-- upvalues: t (ref), t_56 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_56)
end

function t_56:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var1966 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1969 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_56.decode(p1)
	-- upvalues: t_56 (ref), protoModule (ref), t (ref)
	local var1 = t_56.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.CloseMarketplaceCategoryTooltip_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var1973)
		end
	end
	return var1
end

function t_56:jsonEncode()
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

function t_56:jsonDecode()
	-- upvalues: t_56 (ref), t (ref)
	local var1 = t_56.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_56.descriptor = {
	name = "CloseMarketplaceCategoryTooltip",
	fullName = "roblox.apppageplatform.shared.v1beta1.CloseMarketplaceCategoryTooltip"
}
t.CloseMarketplaceCategoryTooltip = t_56
typeRegistryModule.default:register(t.CloseMarketplaceCategoryTooltip)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p1)
	-- upvalues: t_57 (ref)
	return setmetatable({
		tooltip_id = if p1 == nil or p1.tooltip_id == nil then nil else p1.tooltip_id
	}, t_57)
end

function t_57:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.tooltip_id ~= nil then
		local var2 = self.tooltip_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var1997 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_57.decode(p1)
	-- upvalues: t_57 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_57.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.tooltip_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2001)
		end
	end
	return var1
end

function t_57:jsonEncode()
	local t = {}
	
	if self.tooltip_id ~= nil then
		t.tooltipId = self.tooltip_id:jsonEncode()
	end
	return t
end

function t_57:jsonDecode()
	-- upvalues: t_57 (ref), propTypesModule (ref)
	local var1 = t_57.new()
	
	if self.tooltip_id ~= nil then
		var1.tooltip_id = propTypesModule.StringProp.jsonDecode(self.tooltip_id)
	end
	if self.tooltipId ~= nil then
		var1.tooltip_id = propTypesModule.StringProp.jsonDecode(self.tooltipId)
	end
	return var1
end

t_57.descriptor = {
	name = "CloseMarketplaceCategoryTooltip_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.CloseMarketplaceCategoryTooltip_Params = t_57
typeRegistryModule.default:register(t.CloseMarketplaceCategoryTooltip_Params)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p1)
	-- upvalues: t (ref), t_58 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_58)
end

function t_58:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2021 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2024 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_58.decode(p1)
	-- upvalues: t_58 (ref), protoModule (ref), t (ref)
	local var1 = t_58.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.ResizeMarketplaceCatalog_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2028)
		end
	end
	return var1
end

function t_58:jsonEncode()
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

function t_58:jsonDecode()
	-- upvalues: t_58 (ref), t (ref)
	local var1 = t_58.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_58.descriptor = {
	name = "ResizeMarketplaceCatalog",
	fullName = "roblox.apppageplatform.shared.v1beta1.ResizeMarketplaceCatalog"
}
t.ResizeMarketplaceCatalog = t_58
typeRegistryModule.default:register(t.ResizeMarketplaceCatalog)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p1)
	-- upvalues: t_59 (ref)
	return setmetatable({
		category_id = if p1 == nil or p1.category_id == nil then nil else p1.category_id,
		subcategory_id = if p1 == nil or p1.subcategory_id == nil then nil else p1.subcategory_id,
		screen_size = if p1 == nil or p1.screen_size == nil then nil else p1.screen_size
	}, t_59)
end

function t_59:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.category_id ~= nil then
		local var2 = self.category_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var2052 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.subcategory_id ~= nil then
		local var5 = self.subcategory_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var2055 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.screen_size ~= nil then
		local var8 = self.screen_size:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var2058 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_59.decode(p1)
	-- upvalues: t_59 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_59.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.category_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.subcategory_id = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.screen_size = propTypesModule.StringProp.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var2062)
		end
	end
	return var1
end

function t_59:jsonEncode()
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

function t_59:jsonDecode()
	-- upvalues: t_59 (ref), propTypesModule (ref)
	local var1 = t_59.new()
	
	if self.category_id ~= nil then
		var1.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var1.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	if self.subcategory_id ~= nil then
		var1.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var1.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	if self.screen_size ~= nil then
		var1.screen_size = propTypesModule.StringProp.jsonDecode(self.screen_size)
	end
	if self.screenSize ~= nil then
		var1.screen_size = propTypesModule.StringProp.jsonDecode(self.screenSize)
	end
	return var1
end

t_59.descriptor = {
	name = "ResizeMarketplaceCatalog_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ResizeMarketplaceCatalog_Params = t_59
typeRegistryModule.default:register(t.ResizeMarketplaceCatalog_Params)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p1)
	-- upvalues: t (ref), t_60 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_60)
end

function t_60:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2086 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2089 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_60.decode(p1)
	-- upvalues: t_60 (ref), protoModule (ref), t (ref)
	local var1 = t_60.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenChartsSortDetailAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2093)
		end
	end
	return var1
end

function t_60:jsonEncode()
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

function t_60:jsonDecode()
	-- upvalues: t_60 (ref), t (ref)
	local var1 = t_60.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_60.descriptor = {
	name = "OpenChartsSortDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenChartsSortDetailAction"
}
t.OpenChartsSortDetailAction = t_60
typeRegistryModule.default:register(t.OpenChartsSortDetailAction)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p1)
	-- upvalues: t_61 (ref)
	return setmetatable({
		sort_id = if p1 == nil or p1.sort_id == nil then nil else p1.sort_id,
		secondary_sort_id = if p1 == nil or p1.secondary_sort_id == nil then nil else p1.secondary_sort_id
	}, t_61)
end

function t_61:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.sort_id ~= nil then
		local var2 = self.sort_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var2117 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.secondary_sort_id ~= nil then
		local var5 = self.secondary_sort_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var2120 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_61.decode(p1)
	-- upvalues: t_61 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_61.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.sort_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.secondary_sort_id = propTypesModule.Int32Prop.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var2124)
		end
	end
	return var1
end

function t_61:jsonEncode()
	local t = {}
	
	if self.sort_id ~= nil then
		t.sortId = self.sort_id:jsonEncode()
	end
	if self.secondary_sort_id ~= nil then
		t.secondarySortId = self.secondary_sort_id:jsonEncode()
	end
	return t
end

function t_61:jsonDecode()
	-- upvalues: t_61 (ref), propTypesModule (ref)
	local var1 = t_61.new()
	
	if self.sort_id ~= nil then
		var1.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var1.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.secondary_sort_id ~= nil then
		var1.secondary_sort_id = propTypesModule.Int32Prop.jsonDecode(self.secondary_sort_id)
	end
	if self.secondarySortId ~= nil then
		var1.secondary_sort_id = propTypesModule.Int32Prop.jsonDecode(self.secondarySortId)
	end
	return var1
end

t_61.descriptor = {
	name = "OpenChartsSortDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenChartsSortDetailAction_Params = t_61
typeRegistryModule.default:register(t.OpenChartsSortDetailAction_Params)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p1)
	-- upvalues: t (ref), t_62 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_62)
end

function t_62:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2146 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2149 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_62.decode(p1)
	-- upvalues: t_62 (ref), protoModule (ref), t (ref)
	local var1 = t_62.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenSongDetailAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2153)
		end
	end
	return var1
end

function t_62:jsonEncode()
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

function t_62:jsonDecode()
	-- upvalues: t_62 (ref), t (ref)
	local var1 = t_62.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_62.descriptor = {
	name = "OpenSongDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSongDetailAction"
}
t.OpenSongDetailAction = t_62
typeRegistryModule.default:register(t.OpenSongDetailAction)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p1)
	-- upvalues: t_63 (ref)
	return setmetatable({
		song_id = if p1 == nil or p1.song_id == nil then nil else p1.song_id
	}, t_63)
end

function t_63:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.song_id ~= nil then
		local var2 = self.song_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var2177 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_63.decode(p1)
	-- upvalues: t_63 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_63.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.song_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2181)
		end
	end
	return var1
end

function t_63:jsonEncode()
	local t = {}
	
	if self.song_id ~= nil then
		t.songId = self.song_id:jsonEncode()
	end
	return t
end

function t_63:jsonDecode()
	-- upvalues: t_63 (ref), propTypesModule (ref)
	local var1 = t_63.new()
	
	if self.song_id ~= nil then
		var1.song_id = propTypesModule.StringProp.jsonDecode(self.song_id)
	end
	if self.songId ~= nil then
		var1.song_id = propTypesModule.StringProp.jsonDecode(self.songId)
	end
	return var1
end

t_63.descriptor = {
	name = "OpenSongDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSongDetailAction_Params = t_63
typeRegistryModule.default:register(t.OpenSongDetailAction_Params)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p1)
	-- upvalues: t (ref), t_64 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_64)
end

function t_64:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2201 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2204 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_64.decode(p1)
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var1 = t_64.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenMarketplaceCatalogFilters_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2208)
		end
	end
	return var1
end

function t_64:jsonEncode()
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

function t_64:jsonDecode()
	-- upvalues: t_64 (ref), t (ref)
	local var1 = t_64.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_64.descriptor = {
	name = "OpenMarketplaceCatalogFilters",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogFilters"
}
t.OpenMarketplaceCatalogFilters = t_64
typeRegistryModule.default:register(t.OpenMarketplaceCatalogFilters)
local t_65 = {}
t_65.__index = t_65

function t_65.new(_)
	-- upvalues: t_65 (ref)
	return setmetatable({}, t_65)
end

function t_65.encode(_)
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_65.decode(p1)
	-- upvalues: t_65 (ref), protoModule (ref)
	local var1 = t_65.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local var3 = nil
		local _ = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		var3 = var4
		local var7 = var5
		var2 = var6
		
		if var7 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
		elseif var7 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var10, var11 = protoModule.readVarInt(p1, var2)
			var2 = var11 + var10
		elseif var7 == protoModule.wireTypes.i32 then
			local _ = nil
			local var12, var13 = protoModule.readFixed32(p1, var2)
			local _ = var12
			var2 = var13
		elseif var7 == protoModule.wireTypes.i64 then
			local _ = nil
			local var14, var15 = protoModule.readFixed64(p1, var2)
			local _ = var14
			var2 = var15
		else
			error("Unsupported wire type: " .. var2235)
		end
	end
	return var1
end

function t_65.jsonEncode(_)
	return {}
end

function t_65.jsonDecode(_)
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

function t_66.new(p1)
	-- upvalues: t (ref), t_66 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_66)
end

function t_66:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2247 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2250 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_66.decode(p1)
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var1 = t_66.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.RefreshFromApiAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2254)
		end
	end
	return var1
end

function t_66:jsonEncode()
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

function t_66:jsonDecode()
	-- upvalues: t_66 (ref), t (ref)
	local var1 = t_66.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_66.descriptor = {
	name = "RefreshFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshFromApiAction"
}
t.RefreshFromApiAction = t_66
typeRegistryModule.default:register(t.RefreshFromApiAction)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p1)
	-- upvalues: t_67 (ref)
	return setmetatable({
		surface_key = if p1 == nil or p1.surface_key == nil then nil else p1.surface_key,
		config_key = if p1 == nil or p1.config_key == nil then nil else p1.config_key
	}, t_67)
end

function t_67:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.surface_key ~= nil then
		local var2 = self.surface_key:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var2278 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.config_key ~= nil then
		local var5 = self.config_key:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var2281 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_67.decode(p1)
	-- upvalues: t_67 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_67.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.surface_key = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.config_key = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var2285)
		end
	end
	return var1
end

function t_67:jsonEncode()
	local t = {}
	
	if self.surface_key ~= nil then
		t.surfaceKey = self.surface_key:jsonEncode()
	end
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	return t
end

function t_67:jsonDecode()
	-- upvalues: t_67 (ref), propTypesModule (ref)
	local var1 = t_67.new()
	
	if self.surface_key ~= nil then
		var1.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var1.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		var1.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return var1
end

t_67.descriptor = {
	name = "RefreshFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshFromApiAction_Params = t_67
typeRegistryModule.default:register(t.RefreshFromApiAction_Params)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p1)
	-- upvalues: t (ref), t_68 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_68)
end

function t_68:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2307 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2310 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_68.decode(p1)
	-- upvalues: t_68 (ref), protoModule (ref), t (ref)
	local var1 = t_68.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2314)
		end
	end
	return var1
end

function t_68:jsonEncode()
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

function t_68:jsonDecode()
	-- upvalues: t_68 (ref), t (ref)
	local var1 = t_68.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_68.descriptor = {
	name = "RefreshOmniRecommendationFeedItemAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshOmniRecommendationFeedItemAction"
}
t.RefreshOmniRecommendationFeedItemAction = t_68
typeRegistryModule.default:register(t.RefreshOmniRecommendationFeedItemAction)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p1)
	-- upvalues: t_69 (ref)
	return setmetatable({
		topic_id = if p1 == nil or p1.topic_id == nil then nil else p1.topic_id,
		selected_option = if p1 == nil or p1.selected_option == nil then nil else p1.selected_option,
		request_intent = if p1 == nil or p1.request_intent == nil then nil else p1.request_intent,
		feed_item_key = if p1 == nil or p1.feed_item_key == nil then nil else p1.feed_item_key
	}, t_69)
end

function t_69:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.topic_id ~= nil then
		local var2 = self.topic_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var2338 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.selected_option ~= nil then
		local var5 = self.selected_option:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var2341 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.request_intent ~= nil then
		local var8 = self.request_intent:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var2344 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.feed_item_key ~= nil then
		local var11 = self.feed_item_key:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var2347 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_69.decode(p1)
	-- upvalues: t_69 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_69.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.topic_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.selected_option = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.request_intent = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.feed_item_key = propTypesModule.StringProp.decode(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var2351)
		end
	end
	return var1
end

function t_69:jsonEncode()
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

function t_69:jsonDecode()
	-- upvalues: t_69 (ref), propTypesModule (ref)
	local var1 = t_69.new()
	
	if self.topic_id ~= nil then
		var1.topic_id = propTypesModule.StringProp.jsonDecode(self.topic_id)
	end
	if self.topicId ~= nil then
		var1.topic_id = propTypesModule.StringProp.jsonDecode(self.topicId)
	end
	if self.selected_option ~= nil then
		var1.selected_option = propTypesModule.StringProp.jsonDecode(self.selected_option)
	end
	if self.selectedOption ~= nil then
		var1.selected_option = propTypesModule.StringProp.jsonDecode(self.selectedOption)
	end
	if self.request_intent ~= nil then
		var1.request_intent = propTypesModule.StringProp.jsonDecode(self.request_intent)
	end
	if self.requestIntent ~= nil then
		var1.request_intent = propTypesModule.StringProp.jsonDecode(self.requestIntent)
	end
	if self.feed_item_key ~= nil then
		var1.feed_item_key = propTypesModule.StringProp.jsonDecode(self.feed_item_key)
	end
	if self.feedItemKey ~= nil then
		var1.feed_item_key = propTypesModule.StringProp.jsonDecode(self.feedItemKey)
	end
	return var1
end

t_69.descriptor = {
	name = "RefreshOmniRecommendationFeedItemAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshOmniRecommendationFeedItemAction_Params = t_69
typeRegistryModule.default:register(t.RefreshOmniRecommendationFeedItemAction_Params)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p1)
	-- upvalues: t (ref), t_70 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_70)
end

function t_70:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2377 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2380 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_70.decode(p1)
	-- upvalues: t_70 (ref), protoModule (ref), t (ref)
	local var1 = t_70.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.RsvpToEventAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2384)
		end
	end
	return var1
end

function t_70:jsonEncode()
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

function t_70:jsonDecode()
	-- upvalues: t_70 (ref), t (ref)
	local var1 = t_70.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.RsvpToEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.RsvpToEventAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_70.descriptor = {
	name = "RsvpToEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpToEventAction"
}
t.RsvpToEventAction = t_70
typeRegistryModule.default:register(t.RsvpToEventAction)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p1)
	-- upvalues: t_71 (ref)
	return setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then nil else p1.event_id,
		user_rsvp = if p1 == nil or p1.user_rsvp == nil then nil else p1.user_rsvp,
		notifications_modal_identifier = if p1 == nil or p1.notifications_modal_identifier == nil then nil else p1.notifications_modal_identifier
	}, t_71)
end

function t_71:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.event_id ~= nil then
		local var2 = self.event_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var2408 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.user_rsvp ~= nil then
		local var5 = self.user_rsvp:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var2411 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.notifications_modal_identifier ~= nil then
		local var8 = self.notifications_modal_identifier:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var2414 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_71.decode(p1)
	-- upvalues: t_71 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_71.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.event_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.user_rsvp = propTypesModule.BoolProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.notifications_modal_identifier = propTypesModule.StringProp.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var2418)
		end
	end
	return var1
end

function t_71:jsonEncode()
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

function t_71:jsonDecode()
	-- upvalues: t_71 (ref), propTypesModule (ref)
	local var1 = t_71.new()
	
	if self.event_id ~= nil then
		var1.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var1.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.user_rsvp ~= nil then
		var1.user_rsvp = propTypesModule.BoolProp.jsonDecode(self.user_rsvp)
	end
	if self.userRsvp ~= nil then
		var1.user_rsvp = propTypesModule.BoolProp.jsonDecode(self.userRsvp)
	end
	if self.notifications_modal_identifier ~= nil then
		var1.notifications_modal_identifier = propTypesModule.StringProp.jsonDecode(self.notifications_modal_identifier)
	end
	if self.notificationsModalIdentifier ~= nil then
		var1.notifications_modal_identifier = propTypesModule.StringProp.jsonDecode(self.notificationsModalIdentifier)
	end
	return var1
end

t_71.descriptor = {
	name = "RsvpToEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RsvpToEventAction_Params = t_71
typeRegistryModule.default:register(t.RsvpToEventAction_Params)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p1)
	-- upvalues: t (ref), t_72 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_72)
end

function t_72:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2442 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2445 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_72.decode(p1)
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var1 = t_72.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenEventDetailsAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2449)
		end
	end
	return var1
end

function t_72:jsonEncode()
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

function t_72:jsonDecode()
	-- upvalues: t_72 (ref), t (ref)
	local var1 = t_72.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_72.descriptor = {
	name = "OpenEventDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenEventDetailsAction"
}
t.OpenEventDetailsAction = t_72
typeRegistryModule.default:register(t.OpenEventDetailsAction)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p1)
	-- upvalues: t_73 (ref)
	return setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then nil else p1.event_id
	}, t_73)
end

function t_73:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.event_id ~= nil then
		local var2 = self.event_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var2473 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_73.decode(p1)
	-- upvalues: t_73 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_73.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.event_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2477)
		end
	end
	return var1
end

function t_73:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_73:jsonDecode()
	-- upvalues: t_73 (ref), propTypesModule (ref)
	local var1 = t_73.new()
	
	if self.event_id ~= nil then
		var1.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var1.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var1
end

t_73.descriptor = {
	name = "OpenEventDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenEventDetailsAction_Params = t_73
typeRegistryModule.default:register(t.OpenEventDetailsAction_Params)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p1)
	-- upvalues: t (ref), t_74 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_74)
end

function t_74:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2497 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2500 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_74.decode(p1)
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var1 = t_74.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenBadgesSeeAllAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2504)
		end
	end
	return var1
end

function t_74:jsonEncode()
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

function t_74:jsonDecode()
	-- upvalues: t_74 (ref), t (ref)
	local var1 = t_74.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_74.descriptor = {
	name = "OpenBadgesSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgesSeeAllAction"
}
t.OpenBadgesSeeAllAction = t_74
typeRegistryModule.default:register(t.OpenBadgesSeeAllAction)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p1)
	-- upvalues: t_75 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id
	}, t_75)
end

function t_75:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil then
		local var2 = self.universe_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var2528 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_75.decode(p1)
	-- upvalues: t_75 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_75.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.universe_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2532)
		end
	end
	return var1
end

function t_75:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_75:jsonDecode()
	-- upvalues: t_75 (ref), propTypesModule (ref)
	local var1 = t_75.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1
end

t_75.descriptor = {
	name = "OpenBadgesSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenBadgesSeeAllAction_Params = t_75
typeRegistryModule.default:register(t.OpenBadgesSeeAllAction_Params)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p1)
	-- upvalues: t (ref), t_76 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_76)
end

function t_76:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2552 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2555 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_76.decode(p1)
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var1 = t_76.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenExperienceStoreSeeAllAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2559)
		end
	end
	return var1
end

function t_76:jsonEncode()
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

function t_76:jsonDecode()
	-- upvalues: t_76 (ref), t (ref)
	local var1 = t_76.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_76.descriptor = {
	name = "OpenExperienceStoreSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenExperienceStoreSeeAllAction"
}
t.OpenExperienceStoreSeeAllAction = t_76
typeRegistryModule.default:register(t.OpenExperienceStoreSeeAllAction)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p1)
	-- upvalues: t_77 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id
	}, t_77)
end

function t_77:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil then
		local var2 = self.universe_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var2583 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_77.decode(p1)
	-- upvalues: t_77 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_77.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.universe_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2587)
		end
	end
	return var1
end

function t_77:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_77:jsonDecode()
	-- upvalues: t_77 (ref), propTypesModule (ref)
	local var1 = t_77.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1
end

t_77.descriptor = {
	name = "OpenExperienceStoreSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenExperienceStoreSeeAllAction_Params = t_77
typeRegistryModule.default:register(t.OpenExperienceStoreSeeAllAction_Params)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p1)
	-- upvalues: t (ref), t_78 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_78)
end

function t_78:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2607 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2610 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_78.decode(p1)
	-- upvalues: t_78 (ref), protoModule (ref), t (ref)
	local var1 = t_78.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenSubscriptionPurchasePageAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2614)
		end
	end
	return var1
end

function t_78:jsonEncode()
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

function t_78:jsonDecode()
	-- upvalues: t_78 (ref), t (ref)
	local var1 = t_78.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_78.descriptor = {
	name = "OpenSubscriptionPurchasePageAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSubscriptionPurchasePageAction"
}
t.OpenSubscriptionPurchasePageAction = t_78
typeRegistryModule.default:register(t.OpenSubscriptionPurchasePageAction)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p1)
	-- upvalues: t_79 (ref)
	return setmetatable({
		subscription_id = if p1 == nil or p1.subscription_id == nil then nil else p1.subscription_id,
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		creator_name = if p1 == nil or p1.creator_name == nil then nil else p1.creator_name,
		creator_verified = if p1 == nil or p1.creator_verified == nil then nil else p1.creator_verified,
		name = if p1 == nil or p1.name == nil then nil else p1.name,
		description = if p1 == nil or p1.description == nil then nil else p1.description,
		image_asset_id = if p1 == nil or p1.image_asset_id == nil then nil else p1.image_asset_id,
		period_type = if p1 == nil or p1.period_type == nil then nil else p1.period_type,
		is_subscribed = if p1 == nil or p1.is_subscribed == nil then nil else p1.is_subscribed,
		price_display = if p1 == nil or p1.price_display == nil then nil else p1.price_display,
		price_in_robux = if p1 == nil or p1.price_in_robux == nil then nil else p1.price_in_robux,
		price_tier = if p1 == nil or p1.price_tier == nil then nil else p1.price_tier,
		thumbnail_string = if p1 == nil or p1.thumbnail_string == nil then nil else p1.thumbnail_string
	}, t_79)
end

function t_79:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.subscription_id ~= nil then
		local var2 = self.subscription_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var2638 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.universe_id ~= nil then
		local var5 = self.universe_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var2641 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.creator_name ~= nil then
		local var8 = self.creator_name:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var2644 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.creator_verified ~= nil then
		local var11 = self.creator_verified:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var2647 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	if self.name ~= nil then
		local var14 = self.name:encode()
		local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var15, var2650 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
		buff = var15
		var1 = var16
	end
	if self.description ~= nil then
		local var17 = self.description:encode()
		local var18, var19 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var18, var2653 = protoModule.writeBuffer(var18, var19, var17, buffer.len(var17))
		buff = var18
		var1 = var19
	end
	if self.image_asset_id ~= nil then
		local var20 = self.image_asset_id:encode()
		local var21, var22 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var21, var2656 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
		buff = var21
		var1 = var22
	end
	if self.period_type ~= nil then
		local var23 = self.period_type:encode()
		local var24, var25 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var24, var2659 = protoModule.writeBuffer(var24, var25, var23, buffer.len(var23))
		buff = var24
		var1 = var25
	end
	if self.is_subscribed ~= nil then
		local var26 = self.is_subscribed:encode()
		local var27, var28 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
		var27, var2662 = protoModule.writeBuffer(var27, var28, var26, buffer.len(var26))
		buff = var27
		var1 = var28
	end
	if self.price_display ~= nil then
		local var29 = self.price_display:encode()
		local var30, var31 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
		var30, var2665 = protoModule.writeBuffer(var30, var31, var29, buffer.len(var29))
		buff = var30
		var1 = var31
	end
	if self.price_in_robux ~= nil then
		local var32 = self.price_in_robux:encode()
		local var33, var34 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.lengthDelimited)
		var33, var2668 = protoModule.writeBuffer(var33, var34, var32, buffer.len(var32))
		buff = var33
		var1 = var34
	end
	if self.price_tier ~= nil then
		local var35 = self.price_tier:encode()
		local var36, var37 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
		var36, var2671 = protoModule.writeBuffer(var36, var37, var35, buffer.len(var35))
		buff = var36
		var1 = var37
	end
	if self.thumbnail_string ~= nil then
		local var38 = self.thumbnail_string:encode()
		local var39, var40 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.lengthDelimited)
		var39, var2674 = protoModule.writeBuffer(var39, var40, var38, buffer.len(var38))
		buff = var39
		var1 = var40
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_79.decode(p1)
	-- upvalues: t_79 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_79.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.subscription_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.creator_name = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.creator_verified = propTypesModule.BoolProp.decode(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.name = propTypesModule.StringProp.decode(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.description = propTypesModule.StringProp.decode(var20)
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.image_asset_id = propTypesModule.Int64Prop.decode(var22)
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.period_type = propTypesModule.StringProp.decode(var24)
			elseif var7 == 9 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.is_subscribed = propTypesModule.BoolProp.decode(var26)
			elseif var7 == 10 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var2)
				var2 = var29
				var1.price_display = propTypesModule.StringProp.decode(var28)
			elseif var7 == 11 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var2)
				var2 = var31
				var1.price_in_robux = propTypesModule.Int64Prop.decode(var30)
			elseif var7 == 12 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var2)
				var2 = var33
				var1.price_tier = propTypesModule.Int64Prop.decode(var32)
			elseif var7 == 13 then
				local _ = nil
				local var34, var35 = protoModule.readBuffer(p1, var2)
				var2 = var35
				var1.thumbnail_string = propTypesModule.StringProp.decode(var34)
			else
				local _ = nil
				local var36, var37 = protoModule.readVarInt(p1, var2)
				var2 = var37 + var36
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var38, var39 = protoModule.readFixed32(p1, var2)
			local _ = var38
			var2 = var39
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var40, var41 = protoModule.readFixed64(p1, var2)
			local _ = var40
			var2 = var41
		else
			error("Unsupported wire type: " .. var2678)
		end
	end
	return var1
end

function t_79:jsonEncode()
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

function t_79:jsonDecode()
	-- upvalues: t_79 (ref), propTypesModule (ref)
	local var1 = t_79.new()
	
	if self.subscription_id ~= nil then
		var1.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		var1.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.creator_name ~= nil then
		var1.creator_name = propTypesModule.StringProp.jsonDecode(self.creator_name)
	end
	if self.creatorName ~= nil then
		var1.creator_name = propTypesModule.StringProp.jsonDecode(self.creatorName)
	end
	if self.creator_verified ~= nil then
		var1.creator_verified = propTypesModule.BoolProp.jsonDecode(self.creator_verified)
	end
	if self.creatorVerified ~= nil then
		var1.creator_verified = propTypesModule.BoolProp.jsonDecode(self.creatorVerified)
	end
	if self.name ~= nil then
		var1.name = propTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.description ~= nil then
		var1.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_asset_id ~= nil then
		var1.image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.image_asset_id)
	end
	if self.imageAssetId ~= nil then
		var1.image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.imageAssetId)
	end
	if self.period_type ~= nil then
		var1.period_type = propTypesModule.StringProp.jsonDecode(self.period_type)
	end
	if self.periodType ~= nil then
		var1.period_type = propTypesModule.StringProp.jsonDecode(self.periodType)
	end
	if self.is_subscribed ~= nil then
		var1.is_subscribed = propTypesModule.BoolProp.jsonDecode(self.is_subscribed)
	end
	if self.isSubscribed ~= nil then
		var1.is_subscribed = propTypesModule.BoolProp.jsonDecode(self.isSubscribed)
	end
	if self.price_display ~= nil then
		var1.price_display = propTypesModule.StringProp.jsonDecode(self.price_display)
	end
	if self.priceDisplay ~= nil then
		var1.price_display = propTypesModule.StringProp.jsonDecode(self.priceDisplay)
	end
	if self.price_in_robux ~= nil then
		var1.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		var1.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.price_tier ~= nil then
		var1.price_tier = propTypesModule.Int64Prop.jsonDecode(self.price_tier)
	end
	if self.priceTier ~= nil then
		var1.price_tier = propTypesModule.Int64Prop.jsonDecode(self.priceTier)
	end
	if self.thumbnail_string ~= nil then
		var1.thumbnail_string = propTypesModule.StringProp.jsonDecode(self.thumbnail_string)
	end
	if self.thumbnailString ~= nil then
		var1.thumbnail_string = propTypesModule.StringProp.jsonDecode(self.thumbnailString)
	end
	return var1
end

t_79.descriptor = {
	name = "OpenSubscriptionPurchasePageAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSubscriptionPurchasePageAction_Params = t_79
typeRegistryModule.default:register(t.OpenSubscriptionPurchasePageAction_Params)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p1)
	-- upvalues: t (ref), t_80 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_80)
end

function t_80:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2722 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2725 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_80.decode(p1)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var1 = t_80.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.RefreshGamePassesAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2729)
		end
	end
	return var1
end

function t_80:jsonEncode()
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

function t_80:jsonDecode()
	-- upvalues: t_80 (ref), t (ref)
	local var1 = t_80.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_80.descriptor = {
	name = "RefreshGamePassesAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshGamePassesAction"
}
t.RefreshGamePassesAction = t_80
typeRegistryModule.default:register(t.RefreshGamePassesAction)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p1)
	-- upvalues: t_81 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id
	}, t_81)
end

function t_81:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil then
		local var2 = self.universe_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var2753 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_81.decode(p1)
	-- upvalues: t_81 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_81.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.universe_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2757)
		end
	end
	return var1
end

function t_81:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_81:jsonDecode()
	-- upvalues: t_81 (ref), propTypesModule (ref)
	local var1 = t_81.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1
end

t_81.descriptor = {
	name = "RefreshGamePassesAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshGamePassesAction_Params = t_81
typeRegistryModule.default:register(t.RefreshGamePassesAction_Params)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p1)
	-- upvalues: t (ref), t_82 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_82)
end

function t_82:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2777 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2780 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_82.decode(p1)
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var1 = t_82.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.RefreshPlayabilityAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2784)
		end
	end
	return var1
end

function t_82:jsonEncode()
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

function t_82:jsonDecode()
	-- upvalues: t_82 (ref), t (ref)
	local var1 = t_82.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_82.descriptor = {
	name = "RefreshPlayabilityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshPlayabilityAction"
}
t.RefreshPlayabilityAction = t_82
typeRegistryModule.default:register(t.RefreshPlayabilityAction)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p1)
	-- upvalues: t_83 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id
	}, t_83)
end

function t_83:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil then
		local var2 = self.universe_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var2808 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_83.decode(p1)
	-- upvalues: t_83 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_83.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.universe_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2812)
		end
	end
	return var1
end

function t_83:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_83:jsonDecode()
	-- upvalues: t_83 (ref), propTypesModule (ref)
	local var1 = t_83.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1
end

t_83.descriptor = {
	name = "RefreshPlayabilityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshPlayabilityAction_Params = t_83
typeRegistryModule.default:register(t.RefreshPlayabilityAction_Params)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p1)
	-- upvalues: t (ref), t_84 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_84)
end

function t_84:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2832 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2835 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_84.decode(p1)
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var1 = t_84.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.RefreshDeveloperProductsAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2839)
		end
	end
	return var1
end

function t_84:jsonEncode()
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

function t_84:jsonDecode()
	-- upvalues: t_84 (ref), t (ref)
	local var1 = t_84.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_84.descriptor = {
	name = "RefreshDeveloperProductsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshDeveloperProductsAction"
}
t.RefreshDeveloperProductsAction = t_84
typeRegistryModule.default:register(t.RefreshDeveloperProductsAction)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p1)
	-- upvalues: t_85 (ref)
	return setmetatable({
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id
	}, t_85)
end

function t_85:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.place_id ~= nil then
		local var2 = self.place_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var2863 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_85.decode(p1)
	-- upvalues: t_85 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_85.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.place_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2867)
		end
	end
	return var1
end

function t_85:jsonEncode()
	local t = {}
	
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	return t
end

function t_85:jsonDecode()
	-- upvalues: t_85 (ref), propTypesModule (ref)
	local var1 = t_85.new()
	
	if self.place_id ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	return var1
end

t_85.descriptor = {
	name = "RefreshDeveloperProductsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshDeveloperProductsAction_Params = t_85
typeRegistryModule.default:register(t.RefreshDeveloperProductsAction_Params)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p1)
	-- upvalues: t (ref), t_86 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_86)
end

function t_86:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2887 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2890 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_86.decode(p1)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var1 = t_86.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenFaeTrialUpsellAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2894)
		end
	end
	return var1
end

function t_86:jsonEncode()
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

function t_86:jsonDecode()
	-- upvalues: t_86 (ref), t (ref)
	local var1 = t_86.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_86.descriptor = {
	name = "OpenFaeTrialUpsellAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenFaeTrialUpsellAction"
}
t.OpenFaeTrialUpsellAction = t_86
typeRegistryModule.default:register(t.OpenFaeTrialUpsellAction)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p1)
	-- upvalues: t_87 (ref)
	return setmetatable({
		source = if p1 == nil or p1.source == nil then nil else p1.source,
		config_key = if p1 == nil or p1.config_key == nil then nil else p1.config_key,
		surface_key = if p1 == nil or p1.surface_key == nil then nil else p1.surface_key,
		prompt_type = if p1 == nil or p1.prompt_type == nil then nil else p1.prompt_type
	}, t_87)
end

function t_87:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.source ~= nil then
		local var2 = self.source:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var2918 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.config_key ~= nil then
		local var5 = self.config_key:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var2921 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.surface_key ~= nil then
		local var8 = self.surface_key:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var2924 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.prompt_type ~= nil then
		local var11 = self.prompt_type:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var2927 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_87.decode(p1)
	-- upvalues: t_87 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_87.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.source = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.config_key = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.surface_key = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.prompt_type = propTypesModule.StringProp.decode(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var2931)
		end
	end
	return var1
end

function t_87:jsonEncode()
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

function t_87:jsonDecode()
	-- upvalues: t_87 (ref), propTypesModule (ref)
	local var1 = t_87.new()
	
	if self.source ~= nil then
		var1.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.config_key ~= nil then
		var1.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.surface_key ~= nil then
		var1.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var1.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.prompt_type ~= nil then
		var1.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	return var1
end

t_87.descriptor = {
	name = "OpenFaeTrialUpsellAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenFaeTrialUpsellAction_Params = t_87
typeRegistryModule.default:register(t.OpenFaeTrialUpsellAction_Params)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p1)
	-- upvalues: t (ref), t_88 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_88)
end

function t_88:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2957 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2960 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_88.decode(p1)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var1 = t_88.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenIncomingTransferUpsellAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2964)
		end
	end
	return var1
end

function t_88:jsonEncode()
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

function t_88:jsonDecode()
	-- upvalues: t_88 (ref), t (ref)
	local var1 = t_88.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenIncomingTransferUpsellAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenIncomingTransferUpsellAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_88.descriptor = {
	name = "OpenIncomingTransferUpsellAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenIncomingTransferUpsellAction"
}
t.OpenIncomingTransferUpsellAction = t_88
typeRegistryModule.default:register(t.OpenIncomingTransferUpsellAction)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p1)
	-- upvalues: t_89 (ref)
	return setmetatable({
		url = if p1 == nil or p1.url == nil then nil else p1.url,
		prompt_type = if p1 == nil or p1.prompt_type == nil then nil else p1.prompt_type,
		prompt_id = if p1 == nil or p1.prompt_id == nil then nil else p1.prompt_id
	}, t_89)
end

function t_89:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.url ~= nil then
		local var2 = self.url:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var2988 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.prompt_type ~= nil then
		local var5 = self.prompt_type:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var2991 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.prompt_id ~= nil then
		local var8 = self.prompt_id:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var2994 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_89.decode(p1)
	-- upvalues: t_89 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_89.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.url = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.prompt_type = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.prompt_id = propTypesModule.StringProp.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var2998)
		end
	end
	return var1
end

function t_89:jsonEncode()
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

function t_89:jsonDecode()
	-- upvalues: t_89 (ref), propTypesModule (ref)
	local var1 = t_89.new()
	
	if self.url ~= nil then
		var1.url = propTypesModule.StringProp.jsonDecode(self.url)
	end
	if self.prompt_type ~= nil then
		var1.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var1.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	return var1
end

t_89.descriptor = {
	name = "OpenIncomingTransferUpsellAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenIncomingTransferUpsellAction_Params = t_89
typeRegistryModule.default:register(t.OpenIncomingTransferUpsellAction_Params)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p1)
	-- upvalues: t (ref), t_90 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_90)
end

function t_90:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var3022 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3025 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_90.decode(p1)
	-- upvalues: t_90 (ref), protoModule (ref), t (ref)
	local var1 = t_90.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenSduiOverlayAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var3029)
		end
	end
	return var1
end

function t_90:jsonEncode()
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

function t_90:jsonDecode()
	-- upvalues: t_90 (ref), t (ref)
	local var1 = t_90.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_90.descriptor = {
	name = "OpenSduiOverlayAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSduiOverlayAction"
}
t.OpenSduiOverlayAction = t_90
typeRegistryModule.default:register(t.OpenSduiOverlayAction)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p1)
	-- upvalues: t_91 (ref)
	return setmetatable({
		config_key = if p1 == nil or p1.config_key == nil then nil else p1.config_key,
		identifier = if p1 == nil or p1.identifier == nil then nil else p1.identifier
	}, t_91)
end

function t_91:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.config_key ~= nil then
		local var2 = self.config_key:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var3053 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.identifier ~= nil then
		local var5 = self.identifier:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var3056 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_91.decode(p1)
	-- upvalues: t_91 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_91.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.config_key = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.identifier = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var3060)
		end
	end
	return var1
end

function t_91:jsonEncode()
	local t = {}
	
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	if self.identifier ~= nil then
		t.identifier = self.identifier:jsonEncode()
	end
	return t
end

function t_91:jsonDecode()
	-- upvalues: t_91 (ref), propTypesModule (ref)
	local var1 = t_91.new()
	
	if self.config_key ~= nil then
		var1.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.identifier ~= nil then
		var1.identifier = propTypesModule.StringProp.jsonDecode(self.identifier)
	end
	return var1
end

t_91.descriptor = {
	name = "OpenSduiOverlayAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSduiOverlayAction_Params = t_91
typeRegistryModule.default:register(t.OpenSduiOverlayAction_Params)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p1)
	-- upvalues: t (ref), t_92 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_92)
end

function t_92:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var3082 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3085 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_92.decode(p1)
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var1 = t_92.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.ApplyChartsFilterAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var3089)
		end
	end
	return var1
end

function t_92:jsonEncode()
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

function t_92:jsonDecode()
	-- upvalues: t_92 (ref), t (ref)
	local var1 = t_92.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_92.descriptor = {
	name = "ApplyChartsFilterAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ApplyChartsFilterAction"
}
t.ApplyChartsFilterAction = t_92
typeRegistryModule.default:register(t.ApplyChartsFilterAction)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p1)
	-- upvalues: t_93 (ref)
	return setmetatable({
		session_id = if p1 == nil or p1.session_id == nil then nil else p1.session_id
	}, t_93)
end

function t_93:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.session_id ~= nil then
		local var2 = self.session_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var3113 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_93.decode(p1)
	-- upvalues: t_93 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_93.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.session_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var3117)
		end
	end
	return var1
end

function t_93:jsonEncode()
	local t = {}
	
	if self.session_id ~= nil then
		t.sessionId = self.session_id:jsonEncode()
	end
	return t
end

function t_93:jsonDecode()
	-- upvalues: t_93 (ref), propTypesModule (ref)
	local var1 = t_93.new()
	
	if self.session_id ~= nil then
		var1.session_id = propTypesModule.StringProp.jsonDecode(self.session_id)
	end
	if self.sessionId ~= nil then
		var1.session_id = propTypesModule.StringProp.jsonDecode(self.sessionId)
	end
	return var1
end

t_93.descriptor = {
	name = "ApplyChartsFilterAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ApplyChartsFilterAction_Params = t_93
typeRegistryModule.default:register(t.ApplyChartsFilterAction_Params)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p1)
	-- upvalues: t (ref), t_94 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_94)
end

function t_94:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var3137 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3140 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_94.decode(p1)
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var1 = t_94.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.RefreshChartsSortDetailAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var3144)
		end
	end
	return var1
end

function t_94:jsonEncode()
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

function t_94:jsonDecode()
	-- upvalues: t_94 (ref), t (ref)
	local var1 = t_94.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.RefreshChartsSortDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.RefreshChartsSortDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_94.descriptor = {
	name = "RefreshChartsSortDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshChartsSortDetailAction"
}
t.RefreshChartsSortDetailAction = t_94
typeRegistryModule.default:register(t.RefreshChartsSortDetailAction)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p1)
	-- upvalues: t_95 (ref)
	return setmetatable({
		config_key = if p1 == nil or p1.config_key == nil then nil else p1.config_key,
		selected_option = if p1 == nil or p1.selected_option == nil then nil else p1.selected_option,
		surface_key = if p1 == nil or p1.surface_key == nil then nil else p1.surface_key,
		sort_id = if p1 == nil or p1.sort_id == nil then nil else p1.sort_id
	}, t_95)
end

function t_95:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.config_key ~= nil then
		local var2 = self.config_key:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var3168 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.selected_option ~= nil then
		local var5 = self.selected_option:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var3171 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.surface_key ~= nil then
		local var8 = self.surface_key:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var3174 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.sort_id ~= nil then
		local var11 = self.sort_id:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var3177 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_95.decode(p1)
	-- upvalues: t_95 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_95.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.config_key = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.selected_option = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.surface_key = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.sort_id = propTypesModule.StringProp.decode(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var3181)
		end
	end
	return var1
end

function t_95:jsonEncode()
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

function t_95:jsonDecode()
	-- upvalues: t_95 (ref), propTypesModule (ref)
	local var1 = t_95.new()
	
	if self.config_key ~= nil then
		var1.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.selected_option ~= nil then
		var1.selected_option = propTypesModule.StringProp.jsonDecode(self.selected_option)
	end
	if self.selectedOption ~= nil then
		var1.selected_option = propTypesModule.StringProp.jsonDecode(self.selectedOption)
	end
	if self.surface_key ~= nil then
		var1.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var1.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.sort_id ~= nil then
		var1.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var1.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	return var1
end

t_95.descriptor = {
	name = "RefreshChartsSortDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshChartsSortDetailAction_Params = t_95
typeRegistryModule.default:register(t.RefreshChartsSortDetailAction_Params)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p1)
	-- upvalues: t (ref), t_96 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_96)
end

function t_96:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var3207 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3210 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_96.decode(p1)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var1 = t_96.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.JoinCommunityAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var3214)
		end
	end
	return var1
end

function t_96:jsonEncode()
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

function t_96:jsonDecode()
	-- upvalues: t_96 (ref), t (ref)
	local var1 = t_96.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.JoinCommunityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.JoinCommunityAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_96.descriptor = {
	name = "JoinCommunityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.JoinCommunityAction"
}
t.JoinCommunityAction = t_96
typeRegistryModule.default:register(t.JoinCommunityAction)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p1)
	-- upvalues: t_97 (ref)
	return setmetatable({
		community_id = if p1 == nil or p1.community_id == nil then nil else p1.community_id
	}, t_97)
end

function t_97:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.community_id ~= nil then
		local var2 = self.community_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var3238 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_97.decode(p1)
	-- upvalues: t_97 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_97.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.community_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var3242)
		end
	end
	return var1
end

function t_97:jsonEncode()
	local t = {}
	
	if self.community_id ~= nil then
		t.communityId = self.community_id:jsonEncode()
	end
	return t
end

function t_97:jsonDecode()
	-- upvalues: t_97 (ref), propTypesModule (ref)
	local var1 = t_97.new()
	
	if self.community_id ~= nil then
		var1.community_id = propTypesModule.StringProp.jsonDecode(self.community_id)
	end
	if self.communityId ~= nil then
		var1.community_id = propTypesModule.StringProp.jsonDecode(self.communityId)
	end
	return var1
end

t_97.descriptor = {
	name = "JoinCommunityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.JoinCommunityAction_Params = t_97
typeRegistryModule.default:register(t.JoinCommunityAction_Params)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p1)
	-- upvalues: t (ref), t_98 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_98)
end

function t_98:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var3262 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3265 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_98.decode(p1)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var1 = t_98.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.ViewCommunityAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var3269)
		end
	end
	return var1
end

function t_98:jsonEncode()
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

function t_98:jsonDecode()
	-- upvalues: t_98 (ref), t (ref)
	local var1 = t_98.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.ViewCommunityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.ViewCommunityAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_98.descriptor = {
	name = "ViewCommunityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ViewCommunityAction"
}
t.ViewCommunityAction = t_98
typeRegistryModule.default:register(t.ViewCommunityAction)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p1)
	-- upvalues: t_99 (ref)
	return setmetatable({
		community_id = if p1 == nil or p1.community_id == nil then nil else p1.community_id
	}, t_99)
end

function t_99:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.community_id ~= nil then
		local var2 = self.community_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var3293 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_99.decode(p1)
	-- upvalues: t_99 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_99.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.community_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var3297)
		end
	end
	return var1
end

function t_99:jsonEncode()
	local t = {}
	
	if self.community_id ~= nil then
		t.communityId = self.community_id:jsonEncode()
	end
	return t
end

function t_99:jsonDecode()
	-- upvalues: t_99 (ref), propTypesModule (ref)
	local var1 = t_99.new()
	
	if self.community_id ~= nil then
		var1.community_id = propTypesModule.StringProp.jsonDecode(self.community_id)
	end
	if self.communityId ~= nil then
		var1.community_id = propTypesModule.StringProp.jsonDecode(self.communityId)
	end
	return var1
end

t_99.descriptor = {
	name = "ViewCommunityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ViewCommunityAction_Params = t_99
typeRegistryModule.default:register(t.ViewCommunityAction_Params)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p1)
	-- upvalues: t (ref), t_100 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_100)
end

function t_100:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var3317 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3320 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_100.decode(p1)
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var1 = t_100.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.AnalyticsEventAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var3324)
		end
	end
	return var1
end

function t_100:jsonEncode()
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

function t_100:jsonDecode()
	-- upvalues: t_100 (ref), t (ref)
	local var1 = t_100.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_100.descriptor = {
	name = "AnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.AnalyticsEventAction"
}
t.AnalyticsEventAction = t_100
typeRegistryModule.default:register(t.AnalyticsEventAction)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p1)
	-- upvalues: t_101 (ref)
	return setmetatable({
		event_name = if p1 == nil or p1.event_name == nil then nil else p1.event_name,
		event_fields = if p1 == nil or p1.event_fields == nil then nil else p1.event_fields
	}, t_101)
end

function t_101:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.event_name ~= nil then
		local var2 = self.event_name:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var3348 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.event_fields ~= nil then
		local var5 = self.event_fields:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var3351 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_101.decode(p1)
	-- upvalues: t_101 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_101.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.event_name = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.event_fields = propTypesModule.StructProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var3355)
		end
	end
	return var1
end

function t_101:jsonEncode()
	local t = {}
	
	if self.event_name ~= nil then
		t.eventName = self.event_name:jsonEncode()
	end
	if self.event_fields ~= nil then
		t.eventFields = self.event_fields:jsonEncode()
	end
	return t
end

function t_101:jsonDecode()
	-- upvalues: t_101 (ref), propTypesModule (ref)
	local var1 = t_101.new()
	
	if self.event_name ~= nil then
		var1.event_name = propTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		var1.event_name = propTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		var1.event_fields = propTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		var1.event_fields = propTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return var1
end

t_101.descriptor = {
	name = "AnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.AnalyticsEventAction_Params = t_101
typeRegistryModule.default:register(t.AnalyticsEventAction_Params)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p1)
	-- upvalues: t (ref), t_102 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_102)
end

function t_102:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var3377 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3380 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_102.decode(p1)
	-- upvalues: t_102 (ref), protoModule (ref), t (ref)
	local var1 = t_102.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.CustomAnalyticsEventAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var3384)
		end
	end
	return var1
end

function t_102:jsonEncode()
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

function t_102:jsonDecode()
	-- upvalues: t_102 (ref), t (ref)
	local var1 = t_102.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_102.descriptor = {
	name = "CustomAnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomAnalyticsEventAction"
}
t.CustomAnalyticsEventAction = t_102
typeRegistryModule.default:register(t.CustomAnalyticsEventAction)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p1)
	-- upvalues: t_103 (ref)
	return setmetatable({
		event_name = if p1 == nil or p1.event_name == nil then nil else p1.event_name,
		event_fields = if p1 == nil or p1.event_fields == nil then nil else p1.event_fields
	}, t_103)
end

function t_103:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.event_name ~= nil then
		local var2 = self.event_name:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var3408 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.event_fields ~= nil then
		local var5 = self.event_fields:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var3411 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_103.decode(p1)
	-- upvalues: t_103 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_103.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.event_name = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.event_fields = propTypesModule.StructProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var3415)
		end
	end
	return var1
end

function t_103:jsonEncode()
	local t = {}
	
	if self.event_name ~= nil then
		t.eventName = self.event_name:jsonEncode()
	end
	if self.event_fields ~= nil then
		t.eventFields = self.event_fields:jsonEncode()
	end
	return t
end

function t_103:jsonDecode()
	-- upvalues: t_103 (ref), propTypesModule (ref)
	local var1 = t_103.new()
	
	if self.event_name ~= nil then
		var1.event_name = propTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		var1.event_name = propTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		var1.event_fields = propTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		var1.event_fields = propTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return var1
end

t_103.descriptor = {
	name = "CustomAnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.CustomAnalyticsEventAction_Params = t_103
typeRegistryModule.default:register(t.CustomAnalyticsEventAction_Params)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p1)
	-- upvalues: t (ref), t_104 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_104)
end

function t_104:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var3437 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3440 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_104.decode(p1)
	-- upvalues: t_104 (ref), protoModule (ref), t (ref)
	local var1 = t_104.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenGameInviteAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var3444)
		end
	end
	return var1
end

function t_104:jsonEncode()
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

function t_104:jsonDecode()
	-- upvalues: t_104 (ref), t (ref)
	local var1 = t_104.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_104.descriptor = {
	name = "OpenGameInviteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameInviteAction"
}
t.OpenGameInviteAction = t_104
typeRegistryModule.default:register(t.OpenGameInviteAction)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p1)
	-- upvalues: t_105 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		root_place_id = if p1 == nil or p1.root_place_id == nil then nil else p1.root_place_id,
		trigger = if p1 == nil or p1.trigger == nil then nil else p1.trigger,
		button_name = if p1 == nil or p1.button_name == nil then nil else p1.button_name
	}, t_105)
end

function t_105:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil then
		local var2 = self.universe_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var3468 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.root_place_id ~= nil then
		local var5 = self.root_place_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var3471 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.trigger ~= nil then
		local var8 = self.trigger:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var3474 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.button_name ~= nil then
		local var11 = self.button_name:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var3477 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_105.decode(p1)
	-- upvalues: t_105 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_105.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.universe_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.root_place_id = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.trigger = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.button_name = propTypesModule.StringProp.decode(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var3481)
		end
	end
	return var1
end

function t_105:jsonEncode()
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

function t_105:jsonDecode()
	-- upvalues: t_105 (ref), propTypesModule (ref)
	local var1 = t_105.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		var1.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var1.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	if self.trigger ~= nil then
		var1.trigger = propTypesModule.StringProp.jsonDecode(self.trigger)
	end
	if self.button_name ~= nil then
		var1.button_name = propTypesModule.StringProp.jsonDecode(self.button_name)
	end
	if self.buttonName ~= nil then
		var1.button_name = propTypesModule.StringProp.jsonDecode(self.buttonName)
	end
	return var1
end

t_105.descriptor = {
	name = "OpenGameInviteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameInviteAction_Params = t_105
typeRegistryModule.default:register(t.OpenGameInviteAction_Params)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p1)
	-- upvalues: t (ref), t_106 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_106)
end

function t_106:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var3507 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3510 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_106.decode(p1)
	-- upvalues: t_106 (ref), protoModule (ref), t (ref)
	local var1 = t_106.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.LaunchExperienceAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var3514)
		end
	end
	return var1
end

function t_106:jsonEncode()
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

function t_106:jsonDecode()
	-- upvalues: t_106 (ref), t (ref)
	local var1 = t_106.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_106.descriptor = {
	name = "LaunchExperienceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LaunchExperienceAction"
}
t.LaunchExperienceAction = t_106
typeRegistryModule.default:register(t.LaunchExperienceAction)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p1)
	-- upvalues: t_107 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_107)
end

function t_107:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2 = self.kind.value:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var3538 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		elseif self.kind.type == "binding_path" then
			local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var5, var3540 = protoModule.writeString(var5, var6, self.kind.value)
			buff = var5
			var1 = var6
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_107.decode(p1)
	-- upvalues: t_107 (ref), protoModule (ref), t (ref)
	local var1 = t_107.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.kind = {
					type = "literal",
					value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.decode(var10)
				}
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = { type = "binding_path", value = buffer.tostring(var12) }
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var3544)
		end
	end
	return var1
end

function t_107:jsonEncode()
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

function t_107:jsonDecode()
	-- upvalues: t_107 (ref), t (ref)
	local var1 = t_107.new()
	
	if self.literal ~= nil then
		var1.kind = {
			type = "literal",
			value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var1.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1
end

t_107.descriptor = {
	name = "LaunchExperienceAction_ExperienceJoinData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceJoinData"
}
t.LaunchExperienceAction_ExperienceJoinData = t_107
typeRegistryModule.default:register(t.LaunchExperienceAction_ExperienceJoinData)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p1)
	-- upvalues: t_108 (ref)
	return setmetatable({
		launch_data = if p1 == nil or p1.launch_data == nil then nil else p1.launch_data,
		event_id = if p1 == nil or p1.event_id == nil then nil else p1.event_id
	}, t_108)
end

function t_108:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.launch_data ~= nil then
		local var2 = self.launch_data:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var3567 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.event_id ~= nil then
		local var5 = self.event_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var3570 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_108.decode(p1)
	-- upvalues: t_108 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_108.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.launch_data = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.event_id = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var3574)
		end
	end
	return var1
end

function t_108:jsonEncode()
	local t = {}
	
	if self.launch_data ~= nil then
		t.launchData = self.launch_data:jsonEncode()
	end
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_108:jsonDecode()
	-- upvalues: t_108 (ref), propTypesModule (ref)
	local var1 = t_108.new()
	
	if self.launch_data ~= nil then
		var1.launch_data = propTypesModule.StringProp.jsonDecode(self.launch_data)
	end
	if self.launchData ~= nil then
		var1.launch_data = propTypesModule.StringProp.jsonDecode(self.launchData)
	end
	if self.event_id ~= nil then
		var1.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var1.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var1
end

t_108.descriptor = {
	name = "LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceJoinDataLiteral"
}
t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral = t_108
typeRegistryModule.default:register(t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p1)
	-- upvalues: t_109 (ref)
	return setmetatable({
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id,
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		launch_source = if p1 == nil or p1.launch_source == nil then nil else p1.launch_source,
		experience_join_data = if p1 == nil or p1.experience_join_data == nil then nil else p1.experience_join_data
	}, t_109)
end

function t_109:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.place_id ~= nil then
		local var2 = self.place_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var3597 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.universe_id ~= nil then
		local var5 = self.universe_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var3600 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.launch_source ~= nil then
		local var8 = self.launch_source:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var3603 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.experience_join_data ~= nil then
		local var11 = self.experience_join_data:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var3606 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_109.decode(p1)
	-- upvalues: t_109 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var1 = t_109.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.place_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.launch_source = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.decode(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var3610)
		end
	end
	return var1
end

function t_109:jsonEncode()
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

function t_109:jsonDecode()
	-- upvalues: t_109 (ref), propTypesModule (ref), t (ref)
	local var1 = t_109.new()
	
	if self.place_id ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.launch_source ~= nil then
		var1.launch_source = propTypesModule.StringProp.jsonDecode(self.launch_source)
	end
	if self.launchSource ~= nil then
		var1.launch_source = propTypesModule.StringProp.jsonDecode(self.launchSource)
	end
	if self.experience_join_data ~= nil then
		var1.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experience_join_data)
	end
	if self.experienceJoinData ~= nil then
		var1.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experienceJoinData)
	end
	return var1
end

t_109.descriptor = {
	name = "LaunchExperienceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LaunchExperienceAction_Params = t_109
typeRegistryModule.default:register(t.LaunchExperienceAction_Params)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p1)
	-- upvalues: t (ref), t_110 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_110)
end

function t_110:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var3636 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3639 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_110.decode(p1)
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var1 = t_110.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.ToggleExperienceFavoriteAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var3643)
		end
	end
	return var1
end

function t_110:jsonEncode()
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

function t_110:jsonDecode()
	-- upvalues: t_110 (ref), t (ref)
	local var1 = t_110.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_110.descriptor = {
	name = "ToggleExperienceFavoriteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceFavoriteAction"
}
t.ToggleExperienceFavoriteAction = t_110
typeRegistryModule.default:register(t.ToggleExperienceFavoriteAction)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p1)
	-- upvalues: t_111 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id,
		ctx = if p1 == nil or p1.ctx == nil then nil else p1.ctx
	}, t_111)
end

function t_111:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil then
		local var2 = self.universe_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var3667 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.place_id ~= nil then
		local var5 = self.place_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var3670 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.ctx ~= nil then
		local var8 = self.ctx:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var3673 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_111.decode(p1)
	-- upvalues: t_111 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_111.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.universe_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.place_id = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.ctx = propTypesModule.StringProp.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var3677)
		end
	end
	return var1
end

function t_111:jsonEncode()
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

function t_111:jsonDecode()
	-- upvalues: t_111 (ref), propTypesModule (ref)
	local var1 = t_111.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		var1.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var1
end

t_111.descriptor = {
	name = "ToggleExperienceFavoriteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceFavoriteAction_Params = t_111
typeRegistryModule.default:register(t.ToggleExperienceFavoriteAction_Params)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p1)
	-- upvalues: t (ref), t_112 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_112)
end

function t_112:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var3701 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3704 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_112.decode(p1)
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var1 = t_112.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.ToggleExperienceFollowAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var3708)
		end
	end
	return var1
end

function t_112:jsonEncode()
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

function t_112:jsonDecode()
	-- upvalues: t_112 (ref), t (ref)
	local var1 = t_112.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_112.descriptor = {
	name = "ToggleExperienceFollowAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceFollowAction"
}
t.ToggleExperienceFollowAction = t_112
typeRegistryModule.default:register(t.ToggleExperienceFollowAction)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p1)
	-- upvalues: t_113 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		game_name = if p1 == nil or p1.game_name == nil then nil else p1.game_name,
		ctx = if p1 == nil or p1.ctx == nil then nil else p1.ctx
	}, t_113)
end

function t_113:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil then
		local var2 = self.universe_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var3732 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.game_name ~= nil then
		local var5 = self.game_name:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var3735 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.ctx ~= nil then
		local var8 = self.ctx:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var3738 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_113.decode(p1)
	-- upvalues: t_113 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_113.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.universe_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.game_name = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.ctx = propTypesModule.StringProp.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var3742)
		end
	end
	return var1
end

function t_113:jsonEncode()
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

function t_113:jsonDecode()
	-- upvalues: t_113 (ref), propTypesModule (ref)
	local var1 = t_113.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.game_name ~= nil then
		var1.game_name = propTypesModule.StringProp.jsonDecode(self.game_name)
	end
	if self.gameName ~= nil then
		var1.game_name = propTypesModule.StringProp.jsonDecode(self.gameName)
	end
	if self.ctx ~= nil then
		var1.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var1
end

t_113.descriptor = {
	name = "ToggleExperienceFollowAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceFollowAction_Params = t_113
typeRegistryModule.default:register(t.ToggleExperienceFollowAction_Params)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p1)
	-- upvalues: t (ref), t_114 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_114)
end

function t_114:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var3766 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3769 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_114.decode(p1)
	-- upvalues: t_114 (ref), protoModule (ref), t (ref)
	local var1 = t_114.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.ToggleExperienceVoteAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var3773)
		end
	end
	return var1
end

function t_114:jsonEncode()
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

function t_114:jsonDecode()
	-- upvalues: t_114 (ref), t (ref)
	local var1 = t_114.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_114.descriptor = {
	name = "ToggleExperienceVoteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceVoteAction"
}
t.ToggleExperienceVoteAction = t_114
typeRegistryModule.default:register(t.ToggleExperienceVoteAction)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p1)
	-- upvalues: t_115 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		vote_direction = if p1 == nil or p1.vote_direction == nil then nil else p1.vote_direction,
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id,
		ctx = if p1 == nil or p1.ctx == nil then nil else p1.ctx
	}, t_115)
end

function t_115:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil then
		local var2 = self.universe_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var3797 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.vote_direction ~= nil then
		local var5 = self.vote_direction:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var3800 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.place_id ~= nil then
		local var8 = self.place_id:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var3803 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.ctx ~= nil then
		local var11 = self.ctx:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var3806 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_115.decode(p1)
	-- upvalues: t_115 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_115.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.universe_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.vote_direction = propTypesModule.BoolProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.place_id = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.ctx = propTypesModule.StringProp.decode(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var3810)
		end
	end
	return var1
end

function t_115:jsonEncode()
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

function t_115:jsonDecode()
	-- upvalues: t_115 (ref), propTypesModule (ref)
	local var1 = t_115.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.vote_direction ~= nil then
		var1.vote_direction = propTypesModule.BoolProp.jsonDecode(self.vote_direction)
	end
	if self.voteDirection ~= nil then
		var1.vote_direction = propTypesModule.BoolProp.jsonDecode(self.voteDirection)
	end
	if self.place_id ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		var1.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var1
end

t_115.descriptor = {
	name = "ToggleExperienceVoteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceVoteAction_Params = t_115
typeRegistryModule.default:register(t.ToggleExperienceVoteAction_Params)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p1)
	-- upvalues: t (ref), t_116 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_116)
end

function t_116:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var3836 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3839 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_116.decode(p1)
	-- upvalues: t_116 (ref), protoModule (ref), t (ref)
	local var1 = t_116.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenPurchasePromptAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var3843)
		end
	end
	return var1
end

function t_116:jsonEncode()
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

function t_116:jsonDecode()
	-- upvalues: t_116 (ref), t (ref)
	local var1 = t_116.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_116.descriptor = {
	name = "OpenPurchasePromptAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenPurchasePromptAction"
}
t.OpenPurchasePromptAction = t_116
typeRegistryModule.default:register(t.OpenPurchasePromptAction)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p1)
	-- upvalues: t_117 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_117)
end

function t_117:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2 = self.kind.value:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var3867 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		elseif self.kind.type == "binding_path" then
			local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var5, var3869 = protoModule.writeString(var5, var6, self.kind.value)
			buff = var5
			var1 = var6
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_117.decode(p1)
	-- upvalues: t_117 (ref), protoModule (ref), t (ref)
	local var1 = t_117.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.decode(var10)
				}
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = { type = "binding_path", value = buffer.tostring(var12) }
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var3873)
		end
	end
	return var1
end

function t_117:jsonEncode()
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

function t_117:jsonDecode()
	-- upvalues: t_117 (ref), t (ref)
	local var1 = t_117.new()
	
	if self.literal ~= nil then
		var1.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var1.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1
end

t_117.descriptor = {
	name = "OpenPurchasePromptAction_ProductPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ProductPayload"
}
t.OpenPurchasePromptAction_ProductPayload = t_117
typeRegistryModule.default:register(t.OpenPurchasePromptAction_ProductPayload)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p1)
	-- upvalues: t_118 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind,
		id = if p1 == nil or p1.id == nil then nil else p1.id,
		subscription_id = if p1 == nil or p1.subscription_id == nil then nil else p1.subscription_id,
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		equip_if_purchased = if p1 == nil or p1.equip_if_purchased == nil then nil else p1.equip_if_purchased,
		name = if p1 == nil or p1.name == nil then nil else p1.name,
		expected_price = if p1 == nil or p1.expected_price == nil then nil else p1.expected_price,
		icon_image_asset_id = if p1 == nil or p1.icon_image_asset_id == nil then nil else p1.icon_image_asset_id,
		is_subscription_in_robux = if p1 == nil or p1.is_subscription_in_robux == nil then nil else p1.is_subscription_in_robux,
		display_price = if p1 == nil or p1.display_price == nil then nil else p1.display_price
	}, t_118)
end

function t_118:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil then
		local var2 = self.kind:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var3896 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.id ~= nil then
		local var5 = self.id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var3899 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.subscription_id ~= nil then
		local var8 = self.subscription_id:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var3902 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.universe_id ~= nil then
		local var11 = self.universe_id:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var3905 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	if self.equip_if_purchased ~= nil then
		local var14 = self.equip_if_purchased:encode()
		local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var15, var3908 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
		buff = var15
		var1 = var16
	end
	if self.name ~= nil then
		local var17 = self.name:encode()
		local var18, var19 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var18, var3911 = protoModule.writeBuffer(var18, var19, var17, buffer.len(var17))
		buff = var18
		var1 = var19
	end
	if self.expected_price ~= nil then
		local var20 = self.expected_price:encode()
		local var21, var22 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var21, var3914 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
		buff = var21
		var1 = var22
	end
	if self.icon_image_asset_id ~= nil then
		local var23 = self.icon_image_asset_id:encode()
		local var24, var25 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var24, var3917 = protoModule.writeBuffer(var24, var25, var23, buffer.len(var23))
		buff = var24
		var1 = var25
	end
	if self.is_subscription_in_robux ~= nil then
		local var26 = self.is_subscription_in_robux:encode()
		local var27, var28 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
		var27, var3920 = protoModule.writeBuffer(var27, var28, var26, buffer.len(var26))
		buff = var27
		var1 = var28
	end
	if self.display_price ~= nil then
		local var29 = self.display_price:encode()
		local var30, var31 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
		var30, var3923 = protoModule.writeBuffer(var30, var31, var29, buffer.len(var29))
		buff = var30
		var1 = var31
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_118.decode(p1)
	-- upvalues: t_118 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_118.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.kind = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.id = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.subscription_id = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.universe_id = propTypesModule.StringProp.decode(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.equip_if_purchased = propTypesModule.BoolProp.decode(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.name = propTypesModule.StringProp.decode(var20)
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.expected_price = propTypesModule.Int64Prop.decode(var22)
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.icon_image_asset_id = propTypesModule.Int64Prop.decode(var24)
			elseif var7 == 9 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.is_subscription_in_robux = propTypesModule.BoolProp.decode(var26)
			elseif var7 == 10 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var2)
				var2 = var29
				var1.display_price = propTypesModule.StringProp.decode(var28)
			else
				local _ = nil
				local var30, var31 = protoModule.readVarInt(p1, var2)
				var2 = var31 + var30
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var32, var33 = protoModule.readFixed32(p1, var2)
			local _ = var32
			var2 = var33
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var34, var35 = protoModule.readFixed64(p1, var2)
			local _ = var34
			var2 = var35
		else
			error("Unsupported wire type: " .. var3927)
		end
	end
	return var1
end

function t_118:jsonEncode()
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

function t_118:jsonDecode()
	-- upvalues: t_118 (ref), propTypesModule (ref)
	local var1 = t_118.new()
	
	if self.kind ~= nil then
		var1.kind = propTypesModule.StringProp.jsonDecode(self.kind)
	end
	if self.id ~= nil then
		var1.id = propTypesModule.StringProp.jsonDecode(self.id)
	end
	if self.subscription_id ~= nil then
		var1.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		var1.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.equip_if_purchased ~= nil then
		var1.equip_if_purchased = propTypesModule.BoolProp.jsonDecode(self.equip_if_purchased)
	end
	if self.equipIfPurchased ~= nil then
		var1.equip_if_purchased = propTypesModule.BoolProp.jsonDecode(self.equipIfPurchased)
	end
	if self.name ~= nil then
		var1.name = propTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.expected_price ~= nil then
		var1.expected_price = propTypesModule.Int64Prop.jsonDecode(self.expected_price)
	end
	if self.expectedPrice ~= nil then
		var1.expected_price = propTypesModule.Int64Prop.jsonDecode(self.expectedPrice)
	end
	if self.icon_image_asset_id ~= nil then
		var1.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		var1.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.is_subscription_in_robux ~= nil then
		var1.is_subscription_in_robux = propTypesModule.BoolProp.jsonDecode(self.is_subscription_in_robux)
	end
	if self.isSubscriptionInRobux ~= nil then
		var1.is_subscription_in_robux = propTypesModule.BoolProp.jsonDecode(self.isSubscriptionInRobux)
	end
	if self.display_price ~= nil then
		var1.display_price = propTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		var1.display_price = propTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	return var1
end

t_118.descriptor = {
	name = "OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.ProductPayloadLiteral"
}
t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral = t_118
typeRegistryModule.default:register(t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p1)
	-- upvalues: t_119 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_119)
end

function t_119:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2 = self.kind.value:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var3966 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		elseif self.kind.type == "binding_path" then
			local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var5, var3968 = protoModule.writeString(var5, var6, self.kind.value)
			buff = var5
			var1 = var6
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_119.decode(p1)
	-- upvalues: t_119 (ref), protoModule (ref), t (ref)
	local var1 = t_119.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.decode(var10)
				}
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = { type = "binding_path", value = buffer.tostring(var12) }
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var3972)
		end
	end
	return var1
end

function t_119:jsonEncode()
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

function t_119:jsonDecode()
	-- upvalues: t_119 (ref), t (ref)
	local var1 = t_119.new()
	
	if self.literal ~= nil then
		var1.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var1.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1
end

t_119.descriptor = {
	name = "OpenPurchasePromptAction_DisplayInfo",
	fullName = "roblox.apppageplatform.shared.v1beta1.DisplayInfo"
}
t.OpenPurchasePromptAction_DisplayInfo = t_119
typeRegistryModule.default:register(t.OpenPurchasePromptAction_DisplayInfo)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p1)
	-- upvalues: t_120 (ref)
	return setmetatable({
		product_name = if p1 == nil or p1.product_name == nil then nil else p1.product_name,
		description = if p1 == nil or p1.description == nil then nil else p1.description,
		image_url = if p1 == nil or p1.image_url == nil then nil else p1.image_url,
		price_in_robux = if p1 == nil or p1.price_in_robux == nil then nil else p1.price_in_robux,
		display_price = if p1 == nil or p1.display_price == nil then nil else p1.display_price,
		icon_image_asset_id = if p1 == nil or p1.icon_image_asset_id == nil then nil else p1.icon_image_asset_id,
		product_id = if p1 == nil or p1.product_id == nil then nil else p1.product_id,
		target_id = if p1 == nil or p1.target_id == nil then nil else p1.target_id,
		is_for_sale = if p1 == nil or p1.is_for_sale == nil then nil else p1.is_for_sale,
		product_type = if p1 == nil or p1.product_type == nil then nil else p1.product_type,
		base_price_in_robux = if p1 == nil or p1.base_price_in_robux == nil then nil else p1.base_price_in_robux,
		price_discount_details = if p1 == nil or p1.price_discount_details == nil then nil else p1.price_discount_details
	}, t_120)
end

function t_120:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.product_name ~= nil then
		local var2 = self.product_name:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var3995 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.description ~= nil then
		local var5 = self.description:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var3998 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.image_url ~= nil then
		local var8 = self.image_url:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var4001 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.price_in_robux ~= nil then
		local var11 = self.price_in_robux:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var4004 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	if self.display_price ~= nil then
		local var14 = self.display_price:encode()
		local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var15, var4007 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
		buff = var15
		var1 = var16
	end
	if self.icon_image_asset_id ~= nil then
		local var17 = self.icon_image_asset_id:encode()
		local var18, var19 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var18, var4010 = protoModule.writeBuffer(var18, var19, var17, buffer.len(var17))
		buff = var18
		var1 = var19
	end
	if self.product_id ~= nil then
		local var20 = self.product_id:encode()
		local var21, var22 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var21, var4013 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
		buff = var21
		var1 = var22
	end
	if self.target_id ~= nil then
		local var23 = self.target_id:encode()
		local var24, var25 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var24, var4016 = protoModule.writeBuffer(var24, var25, var23, buffer.len(var23))
		buff = var24
		var1 = var25
	end
	if self.is_for_sale ~= nil then
		local var26 = self.is_for_sale:encode()
		local var27, var28 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
		var27, var4019 = protoModule.writeBuffer(var27, var28, var26, buffer.len(var26))
		buff = var27
		var1 = var28
	end
	if self.product_type ~= nil then
		local var29 = self.product_type:encode()
		local var30, var31 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
		var30, var4022 = protoModule.writeBuffer(var30, var31, var29, buffer.len(var29))
		buff = var30
		var1 = var31
	end
	if self.base_price_in_robux ~= nil then
		local var32 = self.base_price_in_robux:encode()
		local var33, var34 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.lengthDelimited)
		var33, var4025 = protoModule.writeBuffer(var33, var34, var32, buffer.len(var32))
		buff = var33
		var1 = var34
	end
	if self.price_discount_details ~= nil then
		local var35 = self.price_discount_details:encode()
		local var36, var37 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
		var36, var4028 = protoModule.writeBuffer(var36, var37, var35, buffer.len(var35))
		buff = var36
		var1 = var37
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_120.decode(p1)
	-- upvalues: t_120 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_120.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.product_name = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.description = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.image_url = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.price_in_robux = propTypesModule.Int64Prop.decode(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.display_price = propTypesModule.StringProp.decode(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.icon_image_asset_id = propTypesModule.Int64Prop.decode(var20)
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.product_id = propTypesModule.Int64Prop.decode(var22)
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.target_id = propTypesModule.StringProp.decode(var24)
			elseif var7 == 9 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.is_for_sale = propTypesModule.BoolProp.decode(var26)
			elseif var7 == 10 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var2)
				var2 = var29
				var1.product_type = propTypesModule.StringProp.decode(var28)
			elseif var7 == 11 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var2)
				var2 = var31
				var1.base_price_in_robux = propTypesModule.Int64Prop.decode(var30)
			elseif var7 == 12 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var2)
				var2 = var33
				var1.price_discount_details = propTypesModule.ArrayOfStructProp.decode(var32)
			else
				local _ = nil
				local var34, var35 = protoModule.readVarInt(p1, var2)
				var2 = var35 + var34
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var36, var37 = protoModule.readFixed32(p1, var2)
			local _ = var36
			var2 = var37
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var38, var39 = protoModule.readFixed64(p1, var2)
			local _ = var38
			var2 = var39
		else
			error("Unsupported wire type: " .. var4032)
		end
	end
	return var1
end

function t_120:jsonEncode()
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

function t_120:jsonDecode()
	-- upvalues: t_120 (ref), propTypesModule (ref)
	local var1 = t_120.new()
	
	if self.product_name ~= nil then
		var1.product_name = propTypesModule.StringProp.jsonDecode(self.product_name)
	end
	if self.productName ~= nil then
		var1.product_name = propTypesModule.StringProp.jsonDecode(self.productName)
	end
	if self.description ~= nil then
		var1.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_url ~= nil then
		var1.image_url = propTypesModule.StringProp.jsonDecode(self.image_url)
	end
	if self.imageUrl ~= nil then
		var1.image_url = propTypesModule.StringProp.jsonDecode(self.imageUrl)
	end
	if self.price_in_robux ~= nil then
		var1.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		var1.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.display_price ~= nil then
		var1.display_price = propTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		var1.display_price = propTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	if self.icon_image_asset_id ~= nil then
		var1.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		var1.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.product_id ~= nil then
		var1.product_id = propTypesModule.Int64Prop.jsonDecode(self.product_id)
	end
	if self.productId ~= nil then
		var1.product_id = propTypesModule.Int64Prop.jsonDecode(self.productId)
	end
	if self.target_id ~= nil then
		var1.target_id = propTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		var1.target_id = propTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.is_for_sale ~= nil then
		var1.is_for_sale = propTypesModule.BoolProp.jsonDecode(self.is_for_sale)
	end
	if self.isForSale ~= nil then
		var1.is_for_sale = propTypesModule.BoolProp.jsonDecode(self.isForSale)
	end
	if self.product_type ~= nil then
		var1.product_type = propTypesModule.StringProp.jsonDecode(self.product_type)
	end
	if self.productType ~= nil then
		var1.product_type = propTypesModule.StringProp.jsonDecode(self.productType)
	end
	if self.base_price_in_robux ~= nil then
		var1.base_price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.base_price_in_robux)
	end
	if self.basePriceInRobux ~= nil then
		var1.base_price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.basePriceInRobux)
	end
	if self.price_discount_details ~= nil then
		var1.price_discount_details = propTypesModule.ArrayOfStructProp.jsonDecode(self.price_discount_details)
	end
	if self.priceDiscountDetails ~= nil then
		var1.price_discount_details = propTypesModule.ArrayOfStructProp.jsonDecode(self.priceDiscountDetails)
	end
	return var1
end

t_120.descriptor = {
	name = "OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.DisplayInfoLiteral"
}
t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral = t_120
typeRegistryModule.default:register(t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p1)
	-- upvalues: t_121 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_121)
end

function t_121:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2 = self.kind.value:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var4075 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		elseif self.kind.type == "binding_path" then
			local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var5, var4077 = protoModule.writeString(var5, var6, self.kind.value)
			buff = var5
			var1 = var6
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_121.decode(p1)
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var1 = t_121.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.decode(var10)
				}
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = { type = "binding_path", value = buffer.tostring(var12) }
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var4081)
		end
	end
	return var1
end

function t_121:jsonEncode()
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

function t_121:jsonDecode()
	-- upvalues: t_121 (ref), t (ref)
	local var1 = t_121.new()
	
	if self.literal ~= nil then
		var1.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var1.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1
end

t_121.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseOptions"
}
t.OpenPurchasePromptAction_PurchaseOptions = t_121
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseOptions)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p1)
	-- upvalues: t_122 (ref)
	return setmetatable({
		should_skip_ownership_check = if p1 == nil or p1.should_skip_ownership_check == nil then nil else p1.should_skip_ownership_check,
		enable_preloaded_purchase_ui = if p1 == nil or p1.enable_preloaded_purchase_ui == nil then nil else p1.enable_preloaded_purchase_ui,
		completion_message = if p1 == nil or p1.completion_message == nil then nil else p1.completion_message,
		completion_button_text = if p1 == nil or p1.completion_button_text == nil then nil else p1.completion_button_text,
		prevent_double_confirm = if p1 == nil or p1.prevent_double_confirm == nil then nil else p1.prevent_double_confirm,
		provided_robux_balance = if p1 == nil or p1.provided_robux_balance == nil then nil else p1.provided_robux_balance,
		launch_after_purchase_root_place_id = if p1 == nil or p1.launch_after_purchase_root_place_id == nil then nil else p1.launch_after_purchase_root_place_id
	}, t_122)
end

function t_122:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.should_skip_ownership_check ~= nil then
		local var2 = self.should_skip_ownership_check:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4104 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		local var5 = self.enable_preloaded_purchase_ui:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var4107 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.completion_message ~= nil then
		local var8 = self.completion_message:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var4110 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.completion_button_text ~= nil then
		local var11 = self.completion_button_text:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var4113 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	if self.prevent_double_confirm ~= nil then
		local var14 = self.prevent_double_confirm:encode()
		local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var15, var4116 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
		buff = var15
		var1 = var16
	end
	if self.provided_robux_balance ~= nil then
		local var17 = self.provided_robux_balance:encode()
		local var18, var19 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var18, var4119 = protoModule.writeBuffer(var18, var19, var17, buffer.len(var17))
		buff = var18
		var1 = var19
	end
	if self.launch_after_purchase_root_place_id ~= nil then
		local var20 = self.launch_after_purchase_root_place_id:encode()
		local var21, var22 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var21, var4122 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
		buff = var21
		var1 = var22
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_122.decode(p1)
	-- upvalues: t_122 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_122.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.should_skip_ownership_check = propTypesModule.BoolProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.enable_preloaded_purchase_ui = propTypesModule.BoolProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.completion_message = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.completion_button_text = propTypesModule.StringProp.decode(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.prevent_double_confirm = propTypesModule.BoolProp.decode(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.provided_robux_balance = propTypesModule.Int64Prop.decode(var20)
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.launch_after_purchase_root_place_id = propTypesModule.StringProp.decode(var22)
			else
				local _ = nil
				local var24, var25 = protoModule.readVarInt(p1, var2)
				var2 = var25 + var24
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var26, var27 = protoModule.readFixed32(p1, var2)
			local _ = var26
			var2 = var27
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var28, var29 = protoModule.readFixed64(p1, var2)
			local _ = var28
			var2 = var29
		else
			error("Unsupported wire type: " .. var4126)
		end
	end
	return var1
end

function t_122:jsonEncode()
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

function t_122:jsonDecode()
	-- upvalues: t_122 (ref), propTypesModule (ref)
	local var1 = t_122.new()
	
	if self.should_skip_ownership_check ~= nil then
		var1.should_skip_ownership_check = propTypesModule.BoolProp.jsonDecode(self.should_skip_ownership_check)
	end
	if self.shouldSkipOwnershipCheck ~= nil then
		var1.should_skip_ownership_check = propTypesModule.BoolProp.jsonDecode(self.shouldSkipOwnershipCheck)
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		var1.enable_preloaded_purchase_ui = propTypesModule.BoolProp.jsonDecode(self.enable_preloaded_purchase_ui)
	end
	if self.enablePreloadedPurchaseUi ~= nil then
		var1.enable_preloaded_purchase_ui = propTypesModule.BoolProp.jsonDecode(self.enablePreloadedPurchaseUi)
	end
	if self.completion_message ~= nil then
		var1.completion_message = propTypesModule.StringProp.jsonDecode(self.completion_message)
	end
	if self.completionMessage ~= nil then
		var1.completion_message = propTypesModule.StringProp.jsonDecode(self.completionMessage)
	end
	if self.completion_button_text ~= nil then
		var1.completion_button_text = propTypesModule.StringProp.jsonDecode(self.completion_button_text)
	end
	if self.completionButtonText ~= nil then
		var1.completion_button_text = propTypesModule.StringProp.jsonDecode(self.completionButtonText)
	end
	if self.prevent_double_confirm ~= nil then
		var1.prevent_double_confirm = propTypesModule.BoolProp.jsonDecode(self.prevent_double_confirm)
	end
	if self.preventDoubleConfirm ~= nil then
		var1.prevent_double_confirm = propTypesModule.BoolProp.jsonDecode(self.preventDoubleConfirm)
	end
	if self.provided_robux_balance ~= nil then
		var1.provided_robux_balance = propTypesModule.Int64Prop.jsonDecode(self.provided_robux_balance)
	end
	if self.providedRobuxBalance ~= nil then
		var1.provided_robux_balance = propTypesModule.Int64Prop.jsonDecode(self.providedRobuxBalance)
	end
	if self.launch_after_purchase_root_place_id ~= nil then
		var1.launch_after_purchase_root_place_id = propTypesModule.StringProp.jsonDecode(self.launch_after_purchase_root_place_id)
	end
	if self.launchAfterPurchaseRootPlaceId ~= nil then
		var1.launch_after_purchase_root_place_id = propTypesModule.StringProp.jsonDecode(self.launchAfterPurchaseRootPlaceId)
	end
	return var1
end

t_122.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseOptionsLiteral"
}
t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral = t_122
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p1)
	-- upvalues: t_123 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_123)
end

function t_123:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2 = self.kind.value:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var4159 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		elseif self.kind.type == "binding_path" then
			local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var5, var4161 = protoModule.writeString(var5, var6, self.kind.value)
			buff = var5
			var1 = var6
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_123.decode(p1)
	-- upvalues: t_123 (ref), protoModule (ref), t (ref)
	local var1 = t_123.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.decode(var10)
				}
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = { type = "binding_path", value = buffer.tostring(var12) }
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var4165)
		end
	end
	return var1
end

function t_123:jsonEncode()
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

function t_123:jsonDecode()
	-- upvalues: t_123 (ref), t (ref)
	local var1 = t_123.new()
	
	if self.literal ~= nil then
		var1.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var1.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1
end

t_123.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseAnalyticsMetadata",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseAnalyticsMetadata"
}
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata = t_123
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p1)
	-- upvalues: t_124 (ref)
	return setmetatable({
		surface = if p1 == nil or p1.surface == nil then nil else p1.surface,
		product_universe_id = if p1 == nil or p1.product_universe_id == nil then nil else p1.product_universe_id
	}, t_124)
end

function t_124:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.surface ~= nil then
		local var2 = self.surface:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4188 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.product_universe_id ~= nil then
		local var5 = self.product_universe_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var4191 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_124.decode(p1)
	-- upvalues: t_124 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_124.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.surface = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.product_universe_id = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var4195)
		end
	end
	return var1
end

function t_124:jsonEncode()
	local t = {}
	
	if self.surface ~= nil then
		t.surface = self.surface:jsonEncode()
	end
	if self.product_universe_id ~= nil then
		t.productUniverseId = self.product_universe_id:jsonEncode()
	end
	return t
end

function t_124:jsonDecode()
	-- upvalues: t_124 (ref), propTypesModule (ref)
	local var1 = t_124.new()
	
	if self.surface ~= nil then
		var1.surface = propTypesModule.StringProp.jsonDecode(self.surface)
	end
	if self.product_universe_id ~= nil then
		var1.product_universe_id = propTypesModule.StringProp.jsonDecode(self.product_universe_id)
	end
	if self.productUniverseId ~= nil then
		var1.product_universe_id = propTypesModule.StringProp.jsonDecode(self.productUniverseId)
	end
	return var1
end

t_124.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseAnalyticsMetadataLiteral"
}
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral = t_124
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p1)
	-- upvalues: t_125 (ref)
	return setmetatable({
		product_payload = if p1 == nil or p1.product_payload == nil then nil else p1.product_payload,
		display_info = if p1 == nil or p1.display_info == nil then nil else p1.display_info,
		purchase_options = if p1 == nil or p1.purchase_options == nil then nil else p1.purchase_options,
		purchase_analytics_metadata = if p1 == nil or p1.purchase_analytics_metadata == nil then nil else p1.purchase_analytics_metadata,
		root_place_id = if p1 == nil or p1.root_place_id == nil then nil else p1.root_place_id
	}, t_125)
end

function t_125:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.product_payload ~= nil then
		local var2 = self.product_payload:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4218 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.display_info ~= nil then
		local var5 = self.display_info:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var4221 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.purchase_options ~= nil then
		local var8 = self.purchase_options:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var4224 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.purchase_analytics_metadata ~= nil then
		local var11 = self.purchase_analytics_metadata:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var4227 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	if self.root_place_id ~= nil then
		local var14 = self.root_place_id:encode()
		local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var15, var4230 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
		buff = var15
		var1 = var16
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_125.decode(p1)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref), propTypesModule (ref)
	local var1 = t_125.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.product_payload = t.OpenPurchasePromptAction_ProductPayload.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.display_info = t.OpenPurchasePromptAction_DisplayInfo.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.decode(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.root_place_id = propTypesModule.StringProp.decode(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var4234)
		end
	end
	return var1
end

function t_125:jsonEncode()
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

function t_125:jsonDecode()
	-- upvalues: t_125 (ref), t (ref), propTypesModule (ref)
	local var1 = t_125.new()
	
	if self.product_payload ~= nil then
		var1.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.product_payload)
	end
	if self.productPayload ~= nil then
		var1.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.productPayload)
	end
	if self.display_info ~= nil then
		var1.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.display_info)
	end
	if self.displayInfo ~= nil then
		var1.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.displayInfo)
	end
	if self.purchase_options ~= nil then
		var1.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchase_options)
	end
	if self.purchaseOptions ~= nil then
		var1.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchaseOptions)
	end
	if self.purchase_analytics_metadata ~= nil then
		var1.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchase_analytics_metadata)
	end
	if self.purchaseAnalyticsMetadata ~= nil then
		var1.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchaseAnalyticsMetadata)
	end
	if self.root_place_id ~= nil then
		var1.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var1.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var1
end

t_125.descriptor = {
	name = "OpenPurchasePromptAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenPurchasePromptAction_Params = t_125
typeRegistryModule.default:register(t.OpenPurchasePromptAction_Params)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p1)
	-- upvalues: t (ref), t_126 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_126)
end

function t_126:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var4262 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4265 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_126.decode(p1)
	-- upvalues: t_126 (ref), protoModule (ref), t (ref)
	local var1 = t_126.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var4269)
		end
	end
	return var1
end

function t_126:jsonEncode()
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

function t_126:jsonDecode()
	-- upvalues: t_126 (ref), t (ref)
	local var1 = t_126.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_126.descriptor = {
	name = "ReportSurfaceLoadTimeMilestoneAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ReportSurfaceLoadTimeMilestoneAction"
}
t.ReportSurfaceLoadTimeMilestoneAction = t_126
typeRegistryModule.default:register(t.ReportSurfaceLoadTimeMilestoneAction)
local t_127 = {}
t_127.__index = t_127

function t_127.new(p1)
	-- upvalues: t_127 (ref)
	return setmetatable({
		milestone = if p1 == nil or p1.milestone == nil then nil else p1.milestone,
		metadata = if p1 == nil or p1.metadata == nil then nil else p1.metadata
	}, t_127)
end

function t_127:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.milestone ~= nil then
		local var2 = self.milestone:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4293 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.metadata ~= nil then
		local var5 = self.metadata:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var4296 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_127.decode(p1)
	-- upvalues: t_127 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_127.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.milestone = propTypesModule.StringProp.decode(var10)
			elseif var7 == 3 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.metadata = propTypesModule.StructProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var4300)
		end
	end
	return var1
end

function t_127:jsonEncode()
	local t = {}
	
	if self.milestone ~= nil then
		t.milestone = self.milestone:jsonEncode()
	end
	if self.metadata ~= nil then
		t.metadata = self.metadata:jsonEncode()
	end
	return t
end

function t_127:jsonDecode()
	-- upvalues: t_127 (ref), propTypesModule (ref)
	local var1 = t_127.new()
	
	if self.milestone ~= nil then
		var1.milestone = propTypesModule.StringProp.jsonDecode(self.milestone)
	end
	if self.metadata ~= nil then
		var1.metadata = propTypesModule.StructProp.jsonDecode(self.metadata)
	end
	return var1
end

t_127.descriptor = {
	name = "ReportSurfaceLoadTimeMilestoneAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ReportSurfaceLoadTimeMilestoneAction_Params = t_127
typeRegistryModule.default:register(t.ReportSurfaceLoadTimeMilestoneAction_Params)
local t_128 = {}
t_128.__index = t_128

function t_128.new(p1)
	-- upvalues: t (ref), t_128 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_128)
end

function t_128:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var4322 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4325 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_128.decode(p1)
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var1 = t_128.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.DismissGameFeedbackAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var4329)
		end
	end
	return var1
end

function t_128:jsonEncode()
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

function t_128:jsonDecode()
	-- upvalues: t_128 (ref), t (ref)
	local var1 = t_128.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_128.descriptor = {
	name = "DismissGameFeedbackAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissGameFeedbackAction"
}
t.DismissGameFeedbackAction = t_128
typeRegistryModule.default:register(t.DismissGameFeedbackAction)
local t_129 = {}
t_129.__index = t_129

function t_129.new(p1)
	-- upvalues: t_129 (ref)
	return setmetatable({
		root_place_id = if p1 == nil or p1.root_place_id == nil then nil else p1.root_place_id
	}, t_129)
end

function t_129:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.root_place_id ~= nil then
		local var2 = self.root_place_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4353 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_129.decode(p1)
	-- upvalues: t_129 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_129.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.root_place_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var4357)
		end
	end
	return var1
end

function t_129:jsonEncode()
	local t = {}
	
	if self.root_place_id ~= nil then
		t.rootPlaceId = self.root_place_id:jsonEncode()
	end
	return t
end

function t_129:jsonDecode()
	-- upvalues: t_129 (ref), propTypesModule (ref)
	local var1 = t_129.new()
	
	if self.root_place_id ~= nil then
		var1.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var1.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var1
end

t_129.descriptor = {
	name = "DismissGameFeedbackAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissGameFeedbackAction_Params = t_129
typeRegistryModule.default:register(t.DismissGameFeedbackAction_Params)
local t_130 = {}
t_130.__index = t_130

function t_130.new(p1)
	-- upvalues: t (ref), t_130 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_130)
end

function t_130:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var4377 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4380 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_130.decode(p1)
	-- upvalues: t_130 (ref), protoModule (ref), t (ref)
	local var1 = t_130.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenGameFeedbackFormAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var4384)
		end
	end
	return var1
end

function t_130:jsonEncode()
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

function t_130:jsonDecode()
	-- upvalues: t_130 (ref), t (ref)
	local var1 = t_130.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_130.descriptor = {
	name = "OpenGameFeedbackFormAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameFeedbackFormAction"
}
t.OpenGameFeedbackFormAction = t_130
typeRegistryModule.default:register(t.OpenGameFeedbackFormAction)
local t_131 = {}
t_131.__index = t_131

function t_131.new(p1)
	-- upvalues: t_131 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		root_place_id = if p1 == nil or p1.root_place_id == nil then nil else p1.root_place_id
	}, t_131)
end

function t_131:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil then
		local var2 = self.universe_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4408 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.root_place_id ~= nil then
		local var5 = self.root_place_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var4411 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_131.decode(p1)
	-- upvalues: t_131 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_131.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.universe_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.root_place_id = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var4415)
		end
	end
	return var1
end

function t_131:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.root_place_id ~= nil then
		t.rootPlaceId = self.root_place_id:jsonEncode()
	end
	return t
end

function t_131:jsonDecode()
	-- upvalues: t_131 (ref), propTypesModule (ref)
	local var1 = t_131.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		var1.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var1.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var1
end

t_131.descriptor = {
	name = "OpenGameFeedbackFormAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameFeedbackFormAction_Params = t_131
typeRegistryModule.default:register(t.OpenGameFeedbackFormAction_Params)
local t_132 = {}
t_132.__index = t_132

function t_132.new(p1)
	-- upvalues: t (ref), t_132 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_132)
end

function t_132:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var4437 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4440 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_132.decode(p1)
	-- upvalues: t_132 (ref), protoModule (ref), t (ref)
	local var1 = t_132.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.AiOverviewFeedbackAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var4444)
		end
	end
	return var1
end

function t_132:jsonEncode()
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

function t_132:jsonDecode()
	-- upvalues: t_132 (ref), t (ref)
	local var1 = t_132.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_132.descriptor = {
	name = "AiOverviewFeedbackAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.AiOverviewFeedbackAction"
}
t.AiOverviewFeedbackAction = t_132
typeRegistryModule.default:register(t.AiOverviewFeedbackAction)
local t_133 = {}
t_133.__index = t_133

function t_133.new(p1)
	-- upvalues: t_133 (ref)
	return setmetatable({
		sentiment = if p1 == nil or p1.sentiment == nil then nil else p1.sentiment,
		dialog_title = if p1 == nil or p1.dialog_title == nil then nil else p1.dialog_title,
		dialog_text = if p1 == nil or p1.dialog_text == nil then nil else p1.dialog_text,
		placeholder_text = if p1 == nil or p1.placeholder_text == nil then nil else p1.placeholder_text
	}, t_133)
end

function t_133:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.sentiment ~= nil then
		local var2 = self.sentiment:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4468 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.dialog_title ~= nil then
		local var5 = self.dialog_title:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var4471 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.dialog_text ~= nil then
		local var8 = self.dialog_text:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var4474 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.placeholder_text ~= nil then
		local var11 = self.placeholder_text:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var4477 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_133.decode(p1)
	-- upvalues: t_133 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_133.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.sentiment = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.dialog_title = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.dialog_text = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.placeholder_text = propTypesModule.StringProp.decode(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var4481)
		end
	end
	return var1
end

function t_133:jsonEncode()
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

function t_133:jsonDecode()
	-- upvalues: t_133 (ref), propTypesModule (ref)
	local var1 = t_133.new()
	
	if self.sentiment ~= nil then
		var1.sentiment = propTypesModule.StringProp.jsonDecode(self.sentiment)
	end
	if self.dialog_title ~= nil then
		var1.dialog_title = propTypesModule.StringProp.jsonDecode(self.dialog_title)
	end
	if self.dialogTitle ~= nil then
		var1.dialog_title = propTypesModule.StringProp.jsonDecode(self.dialogTitle)
	end
	if self.dialog_text ~= nil then
		var1.dialog_text = propTypesModule.StringProp.jsonDecode(self.dialog_text)
	end
	if self.dialogText ~= nil then
		var1.dialog_text = propTypesModule.StringProp.jsonDecode(self.dialogText)
	end
	if self.placeholder_text ~= nil then
		var1.placeholder_text = propTypesModule.StringProp.jsonDecode(self.placeholder_text)
	end
	if self.placeholderText ~= nil then
		var1.placeholder_text = propTypesModule.StringProp.jsonDecode(self.placeholderText)
	end
	return var1
end

t_133.descriptor = {
	name = "AiOverviewFeedbackAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.AiOverviewFeedbackAction_Params = t_133
typeRegistryModule.default:register(t.AiOverviewFeedbackAction_Params)
local t_134 = {}
t_134.__index = t_134

function t_134.new(p1)
	-- upvalues: t (ref), t_134 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_134)
end

function t_134:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var4507 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4510 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_134.decode(p1)
	-- upvalues: t_134 (ref), protoModule (ref), t (ref)
	local var1 = t_134.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.EnableEventNotificationsAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var4514)
		end
	end
	return var1
end

function t_134:jsonEncode()
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

function t_134:jsonDecode()
	-- upvalues: t_134 (ref), t (ref)
	local var1 = t_134.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_134.descriptor = {
	name = "EnableEventNotificationsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.EnableEventNotificationsAction"
}
t.EnableEventNotificationsAction = t_134
typeRegistryModule.default:register(t.EnableEventNotificationsAction)
local t_135 = {}
t_135.__index = t_135

function t_135.new(p1)
	-- upvalues: t_135 (ref)
	return setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then nil else p1.event_id,
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		channel = if p1 == nil or p1.channel == nil then nil else p1.channel
	}, t_135)
end

function t_135:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.event_id ~= nil then
		local var2 = self.event_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4538 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.universe_id ~= nil then
		local var5 = self.universe_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var4541 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.channel ~= nil then
		local var8 = self.channel:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var4544 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_135.decode(p1)
	-- upvalues: t_135 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_135.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.event_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.channel = propTypesModule.StringProp.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var4548)
		end
	end
	return var1
end

function t_135:jsonEncode()
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

function t_135:jsonDecode()
	-- upvalues: t_135 (ref), propTypesModule (ref)
	local var1 = t_135.new()
	
	if self.event_id ~= nil then
		var1.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var1.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.channel ~= nil then
		var1.channel = propTypesModule.StringProp.jsonDecode(self.channel)
	end
	return var1
end

t_135.descriptor = {
	name = "EnableEventNotificationsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.EnableEventNotificationsAction_Params = t_135
typeRegistryModule.default:register(t.EnableEventNotificationsAction_Params)
local t_136 = {}
t_136.__index = t_136

function t_136.new(p1)
	-- upvalues: t (ref), t_136 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_136)
end

function t_136:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var4572 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4575 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_136.decode(p1)
	-- upvalues: t_136 (ref), protoModule (ref), t (ref)
	local var1 = t_136.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.DismissEventNotificationsModalAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var4579)
		end
	end
	return var1
end

function t_136:jsonEncode()
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

function t_136:jsonDecode()
	-- upvalues: t_136 (ref), t (ref)
	local var1 = t_136.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_136.descriptor = {
	name = "DismissEventNotificationsModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissEventNotificationsModalAction"
}
t.DismissEventNotificationsModalAction = t_136
typeRegistryModule.default:register(t.DismissEventNotificationsModalAction)
local t_137 = {}
t_137.__index = t_137

function t_137.new(p1)
	-- upvalues: t_137 (ref)
	return setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then nil else p1.event_id
	}, t_137)
end

function t_137:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.event_id ~= nil then
		local var2 = self.event_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4603 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_137.decode(p1)
	-- upvalues: t_137 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_137.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.event_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var4607)
		end
	end
	return var1
end

function t_137:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_137:jsonDecode()
	-- upvalues: t_137 (ref), propTypesModule (ref)
	local var1 = t_137.new()
	
	if self.event_id ~= nil then
		var1.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var1.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var1
end

t_137.descriptor = {
	name = "DismissEventNotificationsModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissEventNotificationsModalAction_Params = t_137
typeRegistryModule.default:register(t.DismissEventNotificationsModalAction_Params)
local t_138 = {}
t_138.__index = t_138

function t_138.new(p1)
	-- upvalues: t (ref), t_138 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_138)
end

function t_138:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var4627 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4630 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_138.decode(p1)
	-- upvalues: t_138 (ref), protoModule (ref), t (ref)
	local var1 = t_138.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenAmpWizardAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var4634)
		end
	end
	return var1
end

function t_138:jsonEncode()
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

function t_138:jsonDecode()
	-- upvalues: t_138 (ref), t (ref)
	local var1 = t_138.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_138.descriptor = {
	name = "OpenAmpWizardAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAmpWizardAction"
}
t.OpenAmpWizardAction = t_138
typeRegistryModule.default:register(t.OpenAmpWizardAction)
local t_139 = {}
t_139.__index = t_139

function t_139.new(p1)
	-- upvalues: t_139 (ref)
	return setmetatable({
		feature_name = if p1 == nil or p1.feature_name == nil then nil else p1.feature_name,
		name_space = if p1 == nil or p1.name_space == nil then nil else p1.name_space,
		entry_point_event_ctx = if p1 == nil or p1.entry_point_event_ctx == nil then nil else p1.entry_point_event_ctx,
		skip_facial_age_estimation_web_link_modal = if p1 == nil or p1.skip_facial_age_estimation_web_link_modal == nil then nil else p1.skip_facial_age_estimation_web_link_modal
	}, t_139)
end

function t_139:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.feature_name ~= nil then
		local var2 = self.feature_name:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4658 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.name_space ~= nil then
		local var5 = self.name_space:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var4661 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.entry_point_event_ctx ~= nil then
		local var8 = self.entry_point_event_ctx:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var4664 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		local var11 = self.skip_facial_age_estimation_web_link_modal:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var4667 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_139.decode(p1)
	-- upvalues: t_139 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_139.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.feature_name = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.name_space = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.entry_point_event_ctx = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.decode(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var4671)
		end
	end
	return var1
end

function t_139:jsonEncode()
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

function t_139:jsonDecode()
	-- upvalues: t_139 (ref), propTypesModule (ref)
	local var1 = t_139.new()
	
	if self.feature_name ~= nil then
		var1.feature_name = propTypesModule.StringProp.jsonDecode(self.feature_name)
	end
	if self.featureName ~= nil then
		var1.feature_name = propTypesModule.StringProp.jsonDecode(self.featureName)
	end
	if self.name_space ~= nil then
		var1.name_space = propTypesModule.StringProp.jsonDecode(self.name_space)
	end
	if self.nameSpace ~= nil then
		var1.name_space = propTypesModule.StringProp.jsonDecode(self.nameSpace)
	end
	if self.entry_point_event_ctx ~= nil then
		var1.entry_point_event_ctx = propTypesModule.StringProp.jsonDecode(self.entry_point_event_ctx)
	end
	if self.entryPointEventCtx ~= nil then
		var1.entry_point_event_ctx = propTypesModule.StringProp.jsonDecode(self.entryPointEventCtx)
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		var1.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.jsonDecode(self.skip_facial_age_estimation_web_link_modal)
	end
	if self.skipFacialAgeEstimationWebLinkModal ~= nil then
		var1.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.jsonDecode(self.skipFacialAgeEstimationWebLinkModal)
	end
	return var1
end

t_139.descriptor = {
	name = "OpenAmpWizardAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAmpWizardAction_Params = t_139
typeRegistryModule.default:register(t.OpenAmpWizardAction_Params)
local t_140 = {}
t_140.__index = t_140

function t_140.new(p1)
	-- upvalues: t (ref), t_140 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_140)
end

function t_140:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var4697 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4700 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_140.decode(p1)
	-- upvalues: t_140 (ref), protoModule (ref), t (ref)
	local var1 = t_140.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenSocialProofUserListSheetAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var4704)
		end
	end
	return var1
end

function t_140:jsonEncode()
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

function t_140:jsonDecode()
	-- upvalues: t_140 (ref), t (ref)
	local var1 = t_140.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_140.descriptor = {
	name = "OpenSocialProofUserListSheetAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSocialProofUserListSheetAction"
}
t.OpenSocialProofUserListSheetAction = t_140
typeRegistryModule.default:register(t.OpenSocialProofUserListSheetAction)
local t_141 = {}
t_141.__index = t_141

function t_141.new(p1)
	-- upvalues: t_141 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id,
		total_connections = if p1 == nil or p1.total_connections == nil then nil else p1.total_connections,
		user_ids = if p1 == nil or p1.user_ids == nil then nil else p1.user_ids,
		sheet_title = if p1 == nil or p1.sheet_title == nil then nil else p1.sheet_title
	}, t_141)
end

function t_141:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil then
		local var2 = self.universe_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4728 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.place_id ~= nil then
		local var5 = self.place_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var4731 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.total_connections ~= nil then
		local var8 = self.total_connections:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var4734 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.user_ids ~= nil then
		local var11 = self.user_ids:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var4737 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	if self.sheet_title ~= nil then
		local var14 = self.sheet_title:encode()
		local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var15, var4740 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
		buff = var15
		var1 = var16
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_141.decode(p1)
	-- upvalues: t_141 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_141.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.universe_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.place_id = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.total_connections = propTypesModule.Int32Prop.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.user_ids = propTypesModule.ArrayOfAvatarProp.decode(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.sheet_title = propTypesModule.StringProp.decode(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var4744)
		end
	end
	return var1
end

function t_141:jsonEncode()
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

function t_141:jsonDecode()
	-- upvalues: t_141 (ref), propTypesModule (ref)
	local var1 = t_141.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.total_connections ~= nil then
		var1.total_connections = propTypesModule.Int32Prop.jsonDecode(self.total_connections)
	end
	if self.totalConnections ~= nil then
		var1.total_connections = propTypesModule.Int32Prop.jsonDecode(self.totalConnections)
	end
	if self.user_ids ~= nil then
		var1.user_ids = propTypesModule.ArrayOfAvatarProp.jsonDecode(self.user_ids)
	end
	if self.userIds ~= nil then
		var1.user_ids = propTypesModule.ArrayOfAvatarProp.jsonDecode(self.userIds)
	end
	if self.sheet_title ~= nil then
		var1.sheet_title = propTypesModule.StringProp.jsonDecode(self.sheet_title)
	end
	if self.sheetTitle ~= nil then
		var1.sheet_title = propTypesModule.StringProp.jsonDecode(self.sheetTitle)
	end
	return var1
end

t_141.descriptor = {
	name = "OpenSocialProofUserListSheetAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSocialProofUserListSheetAction_Params = t_141
typeRegistryModule.default:register(t.OpenSocialProofUserListSheetAction_Params)
local t_142 = {}
t_142.__index = t_142

function t_142.new(p1)
	-- upvalues: t (ref), t_142 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_142)
end

function t_142:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var4772 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4775 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_142.decode(p1)
	-- upvalues: t_142 (ref), protoModule (ref), t (ref)
	local var1 = t_142.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenSearchResultsTabAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var4779)
		end
	end
	return var1
end

function t_142:jsonEncode()
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

function t_142:jsonDecode()
	-- upvalues: t_142 (ref), t (ref)
	local var1 = t_142.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_142.descriptor = {
	name = "OpenSearchResultsTabAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSearchResultsTabAction"
}
t.OpenSearchResultsTabAction = t_142
typeRegistryModule.default:register(t.OpenSearchResultsTabAction)
local t_143 = {}
t_143.__index = t_143

function t_143.new(p1)
	-- upvalues: t_143 (ref)
	return setmetatable({
		search_type = if p1 == nil or p1.search_type == nil then nil else p1.search_type
	}, t_143)
end

function t_143:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.search_type ~= nil then
		local var2 = self.search_type:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4803 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_143.decode(p1)
	-- upvalues: t_143 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_143.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.search_type = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var4807)
		end
	end
	return var1
end

function t_143:jsonEncode()
	local t = {}
	
	if self.search_type ~= nil then
		t.searchType = self.search_type:jsonEncode()
	end
	return t
end

function t_143:jsonDecode()
	-- upvalues: t_143 (ref), propTypesModule (ref)
	local var1 = t_143.new()
	
	if self.search_type ~= nil then
		var1.search_type = propTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		var1.search_type = propTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return var1
end

t_143.descriptor = {
	name = "OpenSearchResultsTabAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSearchResultsTabAction_Params = t_143
typeRegistryModule.default:register(t.OpenSearchResultsTabAction_Params)
local t_144 = {}
t_144.__index = t_144

function t_144.new(p1)
	-- upvalues: t (ref), t_144 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_144)
end

function t_144:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var4827 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4830 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_144.decode(p1)
	-- upvalues: t_144 (ref), protoModule (ref), t (ref)
	local var1 = t_144.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.DismissPromptAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var4834)
		end
	end
	return var1
end

function t_144:jsonEncode()
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

function t_144:jsonDecode()
	-- upvalues: t_144 (ref), t (ref)
	local var1 = t_144.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.DismissPromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.DismissPromptAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_144.descriptor = {
	name = "DismissPromptAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissPromptAction"
}
t.DismissPromptAction = t_144
typeRegistryModule.default:register(t.DismissPromptAction)
local t_145 = {}
t_145.__index = t_145

function t_145.new(p1)
	-- upvalues: t_145 (ref)
	return setmetatable({
		prompt_type = if p1 == nil or p1.prompt_type == nil then nil else p1.prompt_type,
		prompt_id = if p1 == nil or p1.prompt_id == nil then nil else p1.prompt_id,
		entity_type = if p1 == nil or p1.entity_type == nil then nil else p1.entity_type,
		entity_id = if p1 == nil or p1.entity_id == nil then nil else p1.entity_id
	}, t_145)
end

function t_145:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.prompt_type ~= nil then
		local var2 = self.prompt_type:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4858 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.prompt_id ~= nil then
		local var5 = self.prompt_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var4861 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.entity_type ~= nil then
		local var8 = self.entity_type:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var4864 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.entity_id ~= nil then
		local var11 = self.entity_id:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var4867 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_145.decode(p1)
	-- upvalues: t_145 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_145.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.prompt_type = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.prompt_id = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.entity_type = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.entity_id = propTypesModule.StringProp.decode(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var4871)
		end
	end
	return var1
end

function t_145:jsonEncode()
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

function t_145:jsonDecode()
	-- upvalues: t_145 (ref), propTypesModule (ref)
	local var1 = t_145.new()
	
	if self.prompt_type ~= nil then
		var1.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var1.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.entity_type ~= nil then
		var1.entity_type = propTypesModule.StringProp.jsonDecode(self.entity_type)
	end
	if self.entityType ~= nil then
		var1.entity_type = propTypesModule.StringProp.jsonDecode(self.entityType)
	end
	if self.entity_id ~= nil then
		var1.entity_id = propTypesModule.StringProp.jsonDecode(self.entity_id)
	end
	if self.entityId ~= nil then
		var1.entity_id = propTypesModule.StringProp.jsonDecode(self.entityId)
	end
	return var1
end

t_145.descriptor = {
	name = "DismissPromptAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissPromptAction_Params = t_145
typeRegistryModule.default:register(t.DismissPromptAction_Params)
local t_146 = {}
t_146.__index = t_146

function t_146.new(p1)
	-- upvalues: t (ref), t_146 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_146)
end

function t_146:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var4897 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4900 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_146.decode(p1)
	-- upvalues: t_146 (ref), protoModule (ref), t (ref)
	local var1 = t_146.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var4904)
		end
	end
	return var1
end

function t_146:jsonEncode()
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

function t_146:jsonDecode()
	-- upvalues: t_146 (ref), t (ref)
	local var1 = t_146.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_146.descriptor = {
	name = "RecordPartyChatConversationUpsellAcknowledgementAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecordPartyChatConversationUpsellAcknowledgementAction"
}
t.RecordPartyChatConversationUpsellAcknowledgementAction = t_146
typeRegistryModule.default:register(t.RecordPartyChatConversationUpsellAcknowledgementAction)
local t_147 = {}
t_147.__index = t_147

function t_147.new(p1)
	-- upvalues: t_147 (ref)
	return setmetatable({
		modal_action = if p1 == nil or p1.modal_action == nil then nil else p1.modal_action,
		modal_variant = if p1 == nil or p1.modal_variant == nil then nil else p1.modal_variant,
		modal_sequence = if p1 == nil or p1.modal_sequence == nil then nil else p1.modal_sequence,
		conversation_id = if p1 == nil or p1.conversation_id == nil then nil else p1.conversation_id,
		friend_id = if p1 == nil or p1.friend_id == nil then nil else p1.friend_id
	}, t_147)
end

function t_147:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.modal_action ~= nil then
		local var2 = self.modal_action:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4928 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.modal_variant ~= nil then
		local var5 = self.modal_variant:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var4931 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.modal_sequence ~= nil then
		local var8 = self.modal_sequence:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var4934 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.conversation_id ~= nil then
		local var11 = self.conversation_id:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var4937 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
	end
	if self.friend_id ~= nil then
		local var14 = self.friend_id:encode()
		local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var15, var4940 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
		buff = var15
		var1 = var16
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_147.decode(p1)
	-- upvalues: t_147 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_147.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.modal_action = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.modal_variant = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.modal_sequence = propTypesModule.StringProp.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.conversation_id = propTypesModule.StringProp.decode(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.friend_id = propTypesModule.StringProp.decode(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var4944)
		end
	end
	return var1
end

function t_147:jsonEncode()
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

function t_147:jsonDecode()
	-- upvalues: t_147 (ref), propTypesModule (ref)
	local var1 = t_147.new()
	
	if self.modal_action ~= nil then
		var1.modal_action = propTypesModule.StringProp.jsonDecode(self.modal_action)
	end
	if self.modalAction ~= nil then
		var1.modal_action = propTypesModule.StringProp.jsonDecode(self.modalAction)
	end
	if self.modal_variant ~= nil then
		var1.modal_variant = propTypesModule.StringProp.jsonDecode(self.modal_variant)
	end
	if self.modalVariant ~= nil then
		var1.modal_variant = propTypesModule.StringProp.jsonDecode(self.modalVariant)
	end
	if self.modal_sequence ~= nil then
		var1.modal_sequence = propTypesModule.StringProp.jsonDecode(self.modal_sequence)
	end
	if self.modalSequence ~= nil then
		var1.modal_sequence = propTypesModule.StringProp.jsonDecode(self.modalSequence)
	end
	if self.conversation_id ~= nil then
		var1.conversation_id = propTypesModule.StringProp.jsonDecode(self.conversation_id)
	end
	if self.conversationId ~= nil then
		var1.conversation_id = propTypesModule.StringProp.jsonDecode(self.conversationId)
	end
	if self.friend_id ~= nil then
		var1.friend_id = propTypesModule.StringProp.jsonDecode(self.friend_id)
	end
	if self.friendId ~= nil then
		var1.friend_id = propTypesModule.StringProp.jsonDecode(self.friendId)
	end
	return var1
end

t_147.descriptor = {
	name = "RecordPartyChatConversationUpsellAcknowledgementAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RecordPartyChatConversationUpsellAcknowledgementAction_Params = t_147
typeRegistryModule.default:register(t.RecordPartyChatConversationUpsellAcknowledgementAction_Params)
local t_148 = {}
t_148.__index = t_148

function t_148.new(p1)
	-- upvalues: t (ref), t_148 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_148)
end

function t_148:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var4972 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4975 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_148.decode(p1)
	-- upvalues: t_148 (ref), protoModule (ref), t (ref)
	local var1 = t_148.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.RequestFriendshipAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var4979)
		end
	end
	return var1
end

function t_148:jsonEncode()
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

function t_148:jsonDecode()
	-- upvalues: t_148 (ref), t (ref)
	local var1 = t_148.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_148.descriptor = {
	name = "RequestFriendshipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RequestFriendshipAction"
}
t.RequestFriendshipAction = t_148
typeRegistryModule.default:register(t.RequestFriendshipAction)
local t_149 = {}
t_149.__index = t_149

function t_149.new(p1)
	-- upvalues: t_149 (ref)
	return setmetatable({
		target_user_id = if p1 == nil or p1.target_user_id == nil then nil else p1.target_user_id,
		source = if p1 == nil or p1.source == nil then nil else p1.source
	}, t_149)
end

function t_149:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.target_user_id ~= nil then
		local var2 = self.target_user_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var5003 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.source ~= nil then
		local var5 = self.source:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var5006 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_149.decode(p1)
	-- upvalues: t_149 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_149.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.target_user_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.source = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var5010)
		end
	end
	return var1
end

function t_149:jsonEncode()
	local t = {}
	
	if self.target_user_id ~= nil then
		t.targetUserId = self.target_user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_149:jsonDecode()
	-- upvalues: t_149 (ref), propTypesModule (ref)
	local var1 = t_149.new()
	
	if self.target_user_id ~= nil then
		var1.target_user_id = propTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		var1.target_user_id = propTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	if self.source ~= nil then
		var1.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var1
end

t_149.descriptor = {
	name = "RequestFriendshipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RequestFriendshipAction_Params = t_149
typeRegistryModule.default:register(t.RequestFriendshipAction_Params)
local t_150 = {}
t_150.__index = t_150

function t_150.new(p1)
	-- upvalues: t (ref), t_150 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_150)
end

function t_150:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var5032 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var5035 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_150.decode(p1)
	-- upvalues: t_150 (ref), protoModule (ref), t (ref)
	local var1 = t_150.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var5039)
		end
	end
	return var1
end

function t_150:jsonEncode()
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

function t_150:jsonDecode()
	-- upvalues: t_150 (ref), t (ref)
	local var1 = t_150.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_150.descriptor = {
	name = "OpenTrustedFriendsUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenTrustedFriendsUpsellModalAction"
}
t.OpenTrustedFriendsUpsellModalAction = t_150
typeRegistryModule.default:register(t.OpenTrustedFriendsUpsellModalAction)
local t_151 = {}
t_151.__index = t_151

function t_151.new(p1)
	-- upvalues: t_151 (ref)
	return setmetatable({
		target_user_id = if p1 == nil or p1.target_user_id == nil then nil else p1.target_user_id
	}, t_151)
end

function t_151:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.target_user_id ~= nil then
		local var2 = self.target_user_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var5063 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_151.decode(p1)
	-- upvalues: t_151 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_151.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.target_user_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var5067)
		end
	end
	return var1
end

function t_151:jsonEncode()
	local t = {}
	
	if self.target_user_id ~= nil then
		t.targetUserId = self.target_user_id:jsonEncode()
	end
	return t
end

function t_151:jsonDecode()
	-- upvalues: t_151 (ref), propTypesModule (ref)
	local var1 = t_151.new()
	
	if self.target_user_id ~= nil then
		var1.target_user_id = propTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		var1.target_user_id = propTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	return var1
end

t_151.descriptor = {
	name = "OpenTrustedFriendsUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenTrustedFriendsUpsellModalAction_Params = t_151
typeRegistryModule.default:register(t.OpenTrustedFriendsUpsellModalAction_Params)
local t_152 = {}
t_152.__index = t_152

function t_152.new(p1)
	-- upvalues: t (ref), t_152 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_152)
end

function t_152:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var5087 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var5090 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_152.decode(p1)
	-- upvalues: t_152 (ref), protoModule (ref), t (ref)
	local var1 = t_152.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenSearchResultsWithQueryAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var5094)
		end
	end
	return var1
end

function t_152:jsonEncode()
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

function t_152:jsonDecode()
	-- upvalues: t_152 (ref), t (ref)
	local var1 = t_152.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_152.descriptor = {
	name = "OpenSearchResultsWithQueryAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSearchResultsWithQueryAction"
}
t.OpenSearchResultsWithQueryAction = t_152
typeRegistryModule.default:register(t.OpenSearchResultsWithQueryAction)
local t_153 = {}
t_153.__index = t_153

function t_153.new(p1)
	-- upvalues: t_153 (ref)
	return setmetatable({
		search_query = if p1 == nil or p1.search_query == nil then nil else p1.search_query,
		search_type = if p1 == nil or p1.search_type == nil then nil else p1.search_type
	}, t_153)
end

function t_153:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.search_query ~= nil then
		local var2 = self.search_query:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var5118 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.search_type ~= nil then
		local var5 = self.search_type:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var5121 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_153.decode(p1)
	-- upvalues: t_153 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_153.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.search_query = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.search_type = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var5125)
		end
	end
	return var1
end

function t_153:jsonEncode()
	local t = {}
	
	if self.search_query ~= nil then
		t.searchQuery = self.search_query:jsonEncode()
	end
	if self.search_type ~= nil then
		t.searchType = self.search_type:jsonEncode()
	end
	return t
end

function t_153:jsonDecode()
	-- upvalues: t_153 (ref), propTypesModule (ref)
	local var1 = t_153.new()
	
	if self.search_query ~= nil then
		var1.search_query = propTypesModule.StringProp.jsonDecode(self.search_query)
	end
	if self.searchQuery ~= nil then
		var1.search_query = propTypesModule.StringProp.jsonDecode(self.searchQuery)
	end
	if self.search_type ~= nil then
		var1.search_type = propTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		var1.search_type = propTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return var1
end

t_153.descriptor = {
	name = "OpenSearchResultsWithQueryAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSearchResultsWithQueryAction_Params = t_153
typeRegistryModule.default:register(t.OpenSearchResultsWithQueryAction_Params)
local t_154 = {}
t_154.__index = t_154

function t_154.new(p1)
	-- upvalues: t (ref), t_154 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_154)
end

function t_154:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var5147 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var5150 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_154.decode(p1)
	-- upvalues: t_154 (ref), protoModule (ref), t (ref)
	local var1 = t_154.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.SelectMarketplaceFavoritesCategory_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var5154)
		end
	end
	return var1
end

function t_154:jsonEncode()
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

function t_154:jsonDecode()
	-- upvalues: t_154 (ref), t (ref)
	local var1 = t_154.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.SelectMarketplaceFavoritesCategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.SelectMarketplaceFavoritesCategory_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_154.descriptor = {
	name = "SelectMarketplaceFavoritesCategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceFavoritesCategory"
}
t.SelectMarketplaceFavoritesCategory = t_154
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesCategory)
local t_155 = {}
t_155.__index = t_155

function t_155.new(p1)
	-- upvalues: t_155 (ref)
	return setmetatable({
		category_id = if p1 == nil or p1.category_id == nil then nil else p1.category_id
	}, t_155)
end

function t_155:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.category_id ~= nil then
		local var2 = self.category_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var5178 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_155.decode(p1)
	-- upvalues: t_155 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_155.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.category_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var5182)
		end
	end
	return var1
end

function t_155:jsonEncode()
	local t = {}
	
	if self.category_id ~= nil then
		t.categoryId = self.category_id:jsonEncode()
	end
	return t
end

function t_155:jsonDecode()
	-- upvalues: t_155 (ref), propTypesModule (ref)
	local var1 = t_155.new()
	
	if self.category_id ~= nil then
		var1.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var1.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	return var1
end

t_155.descriptor = {
	name = "SelectMarketplaceFavoritesCategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceFavoritesCategory_Params = t_155
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesCategory_Params)
local t_156 = {}
t_156.__index = t_156

function t_156.new(p1)
	-- upvalues: t (ref), t_156 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_156)
end

function t_156:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var5202 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var5205 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_156.decode(p1)
	-- upvalues: t_156 (ref), protoModule (ref), t (ref)
	local var1 = t_156.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var5209)
		end
	end
	return var1
end

function t_156:jsonEncode()
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

function t_156:jsonDecode()
	-- upvalues: t_156 (ref), t (ref)
	local var1 = t_156.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_156.descriptor = {
	name = "SelectMarketplaceFavoritesSubcategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceFavoritesSubcategory"
}
t.SelectMarketplaceFavoritesSubcategory = t_156
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesSubcategory)
local t_157 = {}
t_157.__index = t_157

function t_157.new(p1)
	-- upvalues: t_157 (ref)
	return setmetatable({
		subcategory_id = if p1 == nil or p1.subcategory_id == nil then nil else p1.subcategory_id
	}, t_157)
end

function t_157:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.subcategory_id ~= nil then
		local var2 = self.subcategory_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var5233 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_157.decode(p1)
	-- upvalues: t_157 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_157.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.subcategory_id = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var5237)
		end
	end
	return var1
end

function t_157:jsonEncode()
	local t = {}
	
	if self.subcategory_id ~= nil then
		t.subcategoryId = self.subcategory_id:jsonEncode()
	end
	return t
end

function t_157:jsonDecode()
	-- upvalues: t_157 (ref), propTypesModule (ref)
	local var1 = t_157.new()
	
	if self.subcategory_id ~= nil then
		var1.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var1.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	return var1
end

t_157.descriptor = {
	name = "SelectMarketplaceFavoritesSubcategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceFavoritesSubcategory_Params = t_157
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesSubcategory_Params)
local t_158 = {}
t_158.__index = t_158

function t_158.new(p1)
	-- upvalues: t (ref), t_158 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_158)
end

function t_158:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var5257 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var5260 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_158.decode(p1)
	-- upvalues: t_158 (ref), protoModule (ref), t (ref)
	local var1 = t_158.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.PinExperienceShortcutAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var5264)
		end
	end
	return var1
end

function t_158:jsonEncode()
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

function t_158:jsonDecode()
	-- upvalues: t_158 (ref), t (ref)
	local var1 = t_158.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.PinExperienceShortcutAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.PinExperienceShortcutAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_158.descriptor = {
	name = "PinExperienceShortcutAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.PinExperienceShortcutAction"
}
t.PinExperienceShortcutAction = t_158
typeRegistryModule.default:register(t.PinExperienceShortcutAction)
local t_159 = {}
t_159.__index = t_159

function t_159.new(p1)
	-- upvalues: t_159 (ref)
	return setmetatable({
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id,
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		game_name = if p1 == nil or p1.game_name == nil then nil else p1.game_name
	}, t_159)
end

function t_159:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.place_id ~= nil then
		local var2 = self.place_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var5288 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.universe_id ~= nil then
		local var5 = self.universe_id:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var5291 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.game_name ~= nil then
		local var8 = self.game_name:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var5294 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_159.decode(p1)
	-- upvalues: t_159 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_159.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.place_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.game_name = propTypesModule.StringProp.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var5298)
		end
	end
	return var1
end

function t_159:jsonEncode()
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

function t_159:jsonDecode()
	-- upvalues: t_159 (ref), propTypesModule (ref)
	local var1 = t_159.new()
	
	if self.place_id ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var1.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.game_name ~= nil then
		var1.game_name = propTypesModule.StringProp.jsonDecode(self.game_name)
	end
	if self.gameName ~= nil then
		var1.game_name = propTypesModule.StringProp.jsonDecode(self.gameName)
	end
	return var1
end

t_159.descriptor = {
	name = "PinExperienceShortcutAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.PinExperienceShortcutAction_Params = t_159
typeRegistryModule.default:register(t.PinExperienceShortcutAction_Params)
local t_160 = {}
t_160.__index = t_160

function t_160.new(p1)
	-- upvalues: t (ref), t_160 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_160)
end

function t_160:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var5322 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var5325 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_160.decode(p1)
	-- upvalues: t_160 (ref), protoModule (ref), t (ref)
	local var1 = t_160.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.NavigateAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var5329)
		end
	end
	return var1
end

function t_160:jsonEncode()
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

function t_160:jsonDecode()
	-- upvalues: t_160 (ref), t (ref)
	local var1 = t_160.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.NavigateAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.NavigateAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_160.descriptor = {
	name = "NavigateAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.NavigateAction"
}
t.NavigateAction = t_160
typeRegistryModule.default:register(t.NavigateAction)
local t_161 = {}
t_161.__index = t_161

function t_161.new(p1)
	-- upvalues: t_161 (ref)
	return setmetatable({
		destination = if p1 == nil or p1.destination == nil then nil else p1.destination,
		source = if p1 == nil or p1.source == nil then nil else p1.source
	}, t_161)
end

function t_161:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.destination ~= nil then
		local var2 = self.destination:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var5353 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.source ~= nil then
		local var5 = self.source:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var5356 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_161.decode(p1)
	-- upvalues: t_161 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_161.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.destination = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.source = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var5360)
		end
	end
	return var1
end

function t_161:jsonEncode()
	local t = {}
	
	if self.destination ~= nil then
		t.destination = self.destination:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_161:jsonDecode()
	-- upvalues: t_161 (ref), propTypesModule (ref)
	local var1 = t_161.new()
	
	if self.destination ~= nil then
		var1.destination = propTypesModule.StringProp.jsonDecode(self.destination)
	end
	if self.source ~= nil then
		var1.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var1
end

t_161.descriptor = {
	name = "NavigateAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.NavigateAction_Params = t_161
typeRegistryModule.default:register(t.NavigateAction_Params)
local t_162 = {}
t_162.__index = t_162

function t_162.new(p1)
	-- upvalues: t (ref), t_162 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_162)
end

function t_162:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var5382 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var5385 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_162.decode(p1)
	-- upvalues: t_162 (ref), protoModule (ref), t (ref)
	local var1 = t_162.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.DownloadAppAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var5389)
		end
	end
	return var1
end

function t_162:jsonEncode()
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

function t_162:jsonDecode()
	-- upvalues: t_162 (ref), t (ref)
	local var1 = t_162.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.DownloadAppAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.DownloadAppAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_162.descriptor = {
	name = "DownloadAppAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DownloadAppAction"
}
t.DownloadAppAction = t_162
typeRegistryModule.default:register(t.DownloadAppAction)
local t_163 = {}
t_163.__index = t_163

function t_163.new(p1)
	-- upvalues: t_163 (ref)
	return setmetatable({
		source = if p1 == nil or p1.source == nil then nil else p1.source,
		download_type = if p1 == nil or p1.download_type == nil then nil else p1.download_type
	}, t_163)
end

function t_163:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.source ~= nil then
		local var2 = self.source:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var5413 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.download_type ~= nil then
		local var5 = self.download_type:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var5416 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_163.decode(p1)
	-- upvalues: t_163 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_163.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.source = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.download_type = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var5420)
		end
	end
	return var1
end

function t_163:jsonEncode()
	local t = {}
	
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	if self.download_type ~= nil then
		t.downloadType = self.download_type:jsonEncode()
	end
	return t
end

function t_163:jsonDecode()
	-- upvalues: t_163 (ref), propTypesModule (ref)
	local var1 = t_163.new()
	
	if self.source ~= nil then
		var1.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.download_type ~= nil then
		var1.download_type = propTypesModule.StringProp.jsonDecode(self.download_type)
	end
	if self.downloadType ~= nil then
		var1.download_type = propTypesModule.StringProp.jsonDecode(self.downloadType)
	end
	return var1
end

t_163.descriptor = {
	name = "DownloadAppAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DownloadAppAction_Params = t_163
typeRegistryModule.default:register(t.DownloadAppAction_Params)
local t_164 = {}
t_164.__index = t_164

function t_164.new(p1)
	-- upvalues: t (ref), t_164 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_164)
end

function t_164:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var5442 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var5445 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_164.decode(p1)
	-- upvalues: t_164 (ref), protoModule (ref), t (ref)
	local var1 = t_164.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.ActionSequenceAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var5449)
		end
	end
	return var1
end

function t_164:jsonEncode()
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

function t_164:jsonDecode()
	-- upvalues: t_164 (ref), t (ref)
	local var1 = t_164.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.ActionSequenceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.ActionSequenceAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_164.descriptor = {
	name = "ActionSequenceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionSequenceAction"
}
t.ActionSequenceAction = t_164
typeRegistryModule.default:register(t.ActionSequenceAction)
local t_165 = {}
t_165.__index = t_165

function t_165.new(p1)
	-- upvalues: t_165 (ref)
	return setmetatable({
		actions = if p1 == nil or p1.actions == nil then {} else p1.actions
	}, t_165)
end

function t_165:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.actions ~= nil and #self.actions > 0 then
		for i, v in self.actions do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var5473 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_165.decode(p1)
	-- upvalues: t_165 (ref), protoModule (ref), t (ref)
	local var1 = t_165.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				table.insert(var1.actions, t.ActionProp.decode(var10))
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var5477)
		end
	end
	return var1
end

function t_165:jsonEncode()
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

function t_165:jsonDecode()
	-- upvalues: t_165 (ref), t (ref)
	local var1 = t_165.new()
	
	if self.actions ~= nil then
		local t_1 = {}
		
		for i, v in self.actions do
			table.insert(t_1, t.ActionProp.jsonDecode(v))
		end
		var1.actions = t_1
	end
	return var1
end

t_165.descriptor = {
	name = "ActionSequenceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ActionSequenceAction_Params = t_165
typeRegistryModule.default:register(t.ActionSequenceAction_Params)
local t_166 = {}
t_166.__index = t_166

function t_166.new(p1)
	-- upvalues: t (ref), t_166 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_166)
end

function t_166:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var5499 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var5502 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_166.decode(p1)
	-- upvalues: t_166 (ref), protoModule (ref), t (ref)
	local var1 = t_166.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.RefreshFeedEntryFromApiAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var5506)
		end
	end
	return var1
end

function t_166:jsonEncode()
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

function t_166:jsonDecode()
	-- upvalues: t_166 (ref), t (ref)
	local var1 = t_166.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.RefreshFeedEntryFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.RefreshFeedEntryFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_166.descriptor = {
	name = "RefreshFeedEntryFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshFeedEntryFromApiAction"
}
t.RefreshFeedEntryFromApiAction = t_166
typeRegistryModule.default:register(t.RefreshFeedEntryFromApiAction)
local t_167 = {}
t_167.__index = t_167

function t_167.new(p1)
	-- upvalues: t_167 (ref)
	return setmetatable({
		page_entry_identifier = if p1 == nil or p1.page_entry_identifier == nil then nil else p1.page_entry_identifier,
		feed_entry_identifier = if p1 == nil or p1.feed_entry_identifier == nil then nil else p1.feed_entry_identifier,
		selected_option_ids = if p1 == nil or p1.selected_option_ids == nil then nil else p1.selected_option_ids
	}, t_167)
end

function t_167:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.page_entry_identifier ~= nil then
		local var2 = self.page_entry_identifier:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var5530 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.feed_entry_identifier ~= nil then
		local var5 = self.feed_entry_identifier:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var5533 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.selected_option_ids ~= nil then
		local var8 = self.selected_option_ids:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var5536 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_167.decode(p1)
	-- upvalues: t_167 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_167.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.page_entry_identifier = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.feed_entry_identifier = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.selected_option_ids = propTypesModule.StringArrayProp.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var5540)
		end
	end
	return var1
end

function t_167:jsonEncode()
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

function t_167:jsonDecode()
	-- upvalues: t_167 (ref), propTypesModule (ref)
	local var1 = t_167.new()
	
	if self.page_entry_identifier ~= nil then
		var1.page_entry_identifier = propTypesModule.StringProp.jsonDecode(self.page_entry_identifier)
	end
	if self.pageEntryIdentifier ~= nil then
		var1.page_entry_identifier = propTypesModule.StringProp.jsonDecode(self.pageEntryIdentifier)
	end
	if self.feed_entry_identifier ~= nil then
		var1.feed_entry_identifier = propTypesModule.StringProp.jsonDecode(self.feed_entry_identifier)
	end
	if self.feedEntryIdentifier ~= nil then
		var1.feed_entry_identifier = propTypesModule.StringProp.jsonDecode(self.feedEntryIdentifier)
	end
	if self.selected_option_ids ~= nil then
		var1.selected_option_ids = propTypesModule.StringArrayProp.jsonDecode(self.selected_option_ids)
	end
	if self.selectedOptionIds ~= nil then
		var1.selected_option_ids = propTypesModule.StringArrayProp.jsonDecode(self.selectedOptionIds)
	end
	return var1
end

t_167.descriptor = {
	name = "RefreshFeedEntryFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshFeedEntryFromApiAction_Params = t_167
typeRegistryModule.default:register(t.RefreshFeedEntryFromApiAction_Params)
local t_168 = {}
t_168.__index = t_168

function t_168.new(p1)
	-- upvalues: t (ref), t_168 (ref)
	return setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, t_168)
end

function t_168:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var5564 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var5567 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_168.decode(p1)
	-- upvalues: t_168 (ref), protoModule (ref), t (ref)
	local var1 = t_168.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.action_type = t.ActionType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.action_params = t.OpenProfileFramesEditorAction_Params.decode(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var5571)
		end
	end
	return var1
end

function t_168:jsonEncode()
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

function t_168:jsonDecode()
	-- upvalues: t_168 (ref), t (ref)
	local var1 = t_168.new()
	
	if self.action_type ~= nil then
		var1.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1.action_params = t.OpenProfileFramesEditorAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1.action_params = t.OpenProfileFramesEditorAction_Params.jsonDecode(self.actionParams)
	end
	return var1
end

t_168.descriptor = {
	name = "OpenProfileFramesEditorAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenProfileFramesEditorAction"
}
t.OpenProfileFramesEditorAction = t_168
typeRegistryModule.default:register(t.OpenProfileFramesEditorAction)
local t_169 = {}
t_169.__index = t_169

function t_169.new(p1)
	-- upvalues: t_169 (ref)
	return setmetatable({
		prompt_id = if p1 == nil or p1.prompt_id == nil then nil else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then nil else p1.prompt_type,
		source = if p1 == nil or p1.source == nil then nil else p1.source
	}, t_169)
end

function t_169:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.prompt_id ~= nil then
		local var2 = self.prompt_id:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var5595 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.prompt_type ~= nil then
		local var5 = self.prompt_type:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var5598 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.source ~= nil then
		local var8 = self.source:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var5601 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_169.decode(p1)
	-- upvalues: t_169 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_169.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.prompt_id = propTypesModule.StringProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.prompt_type = propTypesModule.StringProp.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.source = propTypesModule.StringProp.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var5605)
		end
	end
	return var1
end

function t_169:jsonEncode()
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

function t_169:jsonDecode()
	-- upvalues: t_169 (ref), propTypesModule (ref)
	local var1 = t_169.new()
	
	if self.prompt_id ~= nil then
		var1.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.prompt_type ~= nil then
		var1.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.source ~= nil then
		var1.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var1
end

t_169.descriptor = {
	name = "OpenProfileFramesEditorAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenProfileFramesEditorAction_Params = t_169
typeRegistryModule.default:register(t.OpenProfileFramesEditorAction_Params)
local t_170 = {}
t_170.__index = t_170

function t_170.new(p1)
	-- upvalues: t_170 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind,
		telemetry_handler = if p1 == nil or p1.telemetry_handler == nil then nil else p1.telemetry_handler,
		accessibility_label = if p1 == nil or p1.accessibility_label == nil then nil else p1.accessibility_label,
		skip_unified_logging = if p1 == nil or p1.skip_unified_logging == nil then nil else p1.skip_unified_logging,
		action_event_name = if p1 == nil or p1.action_event_name == nil then nil else p1.action_event_name
	}, t_170)
end

function t_170:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "dismiss_dialog_action" then
			local var2 = self.kind.value:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var5630 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		elseif self.kind.type == "link_action" then
			local var5 = self.kind.value:encode()
			local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var6, var5633 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
			buff = var6
			var1 = var7
		elseif self.kind.type == "open_game_details_action" then
			local var8 = self.kind.value:encode()
			local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var9, var5636 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
			buff = var9
			var1 = var10
		elseif self.kind.type == "open_join_friends_action" then
			local var11 = self.kind.value:encode()
			local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var12, var5639 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
			buff = var12
			var1 = var13
		elseif self.kind.type == "open_marketplace_try_on_action" then
			local var14 = self.kind.value:encode()
			local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var15, var5642 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
			buff = var15
			var1 = var16
		elseif self.kind.type == "open_see_all_action" then
			local var17 = self.kind.value:encode()
			local var18, var19 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
			var18, var5645 = protoModule.writeBuffer(var18, var19, var17, buffer.len(var17))
			buff = var18
			var1 = var19
		elseif self.kind.type == "open_sponsored_tooltip_action" then
			local var20 = self.kind.value:encode()
			local var21, var22 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
			var21, var5648 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
			buff = var21
			var1 = var22
		elseif self.kind.type == "play_button_click_action" then
			local var23 = self.kind.value:encode()
			local var24, var25 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
			var24, var5651 = protoModule.writeBuffer(var24, var25, var23, buffer.len(var23))
			buff = var24
			var1 = var25
		elseif self.kind.type == "update_user_settings_action" then
			local var26 = self.kind.value:encode()
			local var27, var28 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
			var27, var5654 = protoModule.writeBuffer(var27, var28, var26, buffer.len(var26))
			buff = var27
			var1 = var28
		elseif self.kind.type == "open_tooltip_action" then
			local var29 = self.kind.value:encode()
			local var30, var31 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
			var30, var5657 = protoModule.writeBuffer(var30, var31, var29, buffer.len(var29))
			buff = var30
			var1 = var31
		elseif self.kind.type == "open_badge_details_action" then
			local var32 = self.kind.value:encode()
			local var33, var34 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.lengthDelimited)
			var33, var5660 = protoModule.writeBuffer(var33, var34, var32, buffer.len(var32))
			buff = var33
			var1 = var34
		elseif self.kind.type == "load_more_from_api_action" then
			local var35 = self.kind.value:encode()
			local var36, var37 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
			var36, var5663 = protoModule.writeBuffer(var36, var37, var35, buffer.len(var35))
			buff = var36
			var1 = var37
		elseif self.kind.type == "share_action" then
			local var38 = self.kind.value:encode()
			local var39, var40 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.lengthDelimited)
			var39, var5666 = protoModule.writeBuffer(var39, var40, var38, buffer.len(var38))
			buff = var39
			var1 = var40
		elseif self.kind.type == "open_abuse_report_action" then
			local var41 = self.kind.value:encode()
			local var42, var43 = protoModule.writeTag(buff, var1, 14, protoModule.wireTypes.lengthDelimited)
			var42, var5669 = protoModule.writeBuffer(var42, var43, var41, buffer.len(var41))
			buff = var42
			var1 = var43
		elseif self.kind.type == "remove_badge_from_inventory_action" then
			local var44 = self.kind.value:encode()
			local var45, var46 = protoModule.writeTag(buff, var1, 15, protoModule.wireTypes.lengthDelimited)
			var45, var5672 = protoModule.writeBuffer(var45, var46, var44, buffer.len(var44))
			buff = var45
			var1 = var46
		elseif self.kind.type == "open_profile_action" then
			local var47 = self.kind.value:encode()
			local var48, var49 = protoModule.writeTag(buff, var1, 16, protoModule.wireTypes.lengthDelimited)
			var48, var5675 = protoModule.writeBuffer(var48, var49, var47, buffer.len(var47))
			buff = var48
			var1 = var49
		elseif self.kind.type == "open_facial_age_estimation_action" then
			local var50 = self.kind.value:encode()
			local var51, var52 = protoModule.writeTag(buff, var1, 17, protoModule.wireTypes.lengthDelimited)
			var51, var5678 = protoModule.writeBuffer(var51, var52, var50, buffer.len(var50))
			buff = var51
			var1 = var52
		elseif self.kind.type == "open_add_connections_page_action" then
			local var53 = self.kind.value:encode()
			local var54, var55 = protoModule.writeTag(buff, var1, 18, protoModule.wireTypes.lengthDelimited)
			var54, var5681 = protoModule.writeBuffer(var54, var55, var53, buffer.len(var53))
			buff = var54
			var1 = var55
		elseif self.kind.type == "open_marketplace_action" then
			local var56 = self.kind.value:encode()
			local var57, var58 = protoModule.writeTag(buff, var1, 19, protoModule.wireTypes.lengthDelimited)
			var57, var5684 = protoModule.writeBuffer(var57, var58, var56, buffer.len(var56))
			buff = var57
			var1 = var58
		elseif self.kind.type == "hide_profile_completion_action" then
			local var59 = self.kind.value:encode()
			local var60, var61 = protoModule.writeTag(buff, var1, 20, protoModule.wireTypes.lengthDelimited)
			var60, var5687 = protoModule.writeBuffer(var60, var61, var59, buffer.len(var59))
			buff = var60
			var1 = var61
		elseif self.kind.type == "select_marketplace_catalog_category" then
			local var62 = self.kind.value:encode()
			local var63, var64 = protoModule.writeTag(buff, var1, 21, protoModule.wireTypes.lengthDelimited)
			var63, var5690 = protoModule.writeBuffer(var63, var64, var62, buffer.len(var62))
			buff = var63
			var1 = var64
		elseif self.kind.type == "select_marketplace_catalog_subcategory" then
			local var65 = self.kind.value:encode()
			local var66, var67 = protoModule.writeTag(buff, var1, 22, protoModule.wireTypes.lengthDelimited)
			var66, var5693 = protoModule.writeBuffer(var66, var67, var65, buffer.len(var65))
			buff = var66
			var1 = var67
		elseif self.kind.type == "open_marketplace_catalog_see_all" then
			local var68 = self.kind.value:encode()
			local var69, var70 = protoModule.writeTag(buff, var1, 23, protoModule.wireTypes.lengthDelimited)
			var69, var5696 = protoModule.writeBuffer(var69, var70, var68, buffer.len(var68))
			buff = var69
			var1 = var70
		elseif self.kind.type == "close_marketplace_category_tooltip" then
			local var71 = self.kind.value:encode()
			local var72, var73 = protoModule.writeTag(buff, var1, 24, protoModule.wireTypes.lengthDelimited)
			var72, var5699 = protoModule.writeBuffer(var72, var73, var71, buffer.len(var71))
			buff = var72
			var1 = var73
		elseif self.kind.type == "resize_marketplace_catalog" then
			local var74 = self.kind.value:encode()
			local var75, var76 = protoModule.writeTag(buff, var1, 25, protoModule.wireTypes.lengthDelimited)
			var75, var5702 = protoModule.writeBuffer(var75, var76, var74, buffer.len(var74))
			buff = var75
			var1 = var76
		elseif self.kind.type == "open_marketplace_catalog_filters" then
			local var77 = self.kind.value:encode()
			local var78, var79 = protoModule.writeTag(buff, var1, 26, protoModule.wireTypes.lengthDelimited)
			var78, var5705 = protoModule.writeBuffer(var78, var79, var77, buffer.len(var77))
			buff = var78
			var1 = var79
		elseif self.kind.type == "open_social_link_action" then
			local var80 = self.kind.value:encode()
			local var81, var82 = protoModule.writeTag(buff, var1, 27, protoModule.wireTypes.lengthDelimited)
			var81, var5708 = protoModule.writeBuffer(var81, var82, var80, buffer.len(var80))
			buff = var81
			var1 = var82
		elseif self.kind.type == "open_charts_sort_detail_action" then
			local var83 = self.kind.value:encode()
			local var84, var85 = protoModule.writeTag(buff, var1, 28, protoModule.wireTypes.lengthDelimited)
			var84, var5711 = protoModule.writeBuffer(var84, var85, var83, buffer.len(var83))
			buff = var84
			var1 = var85
		elseif self.kind.type == "open_song_detail_action" then
			local var86 = self.kind.value:encode()
			local var87, var88 = protoModule.writeTag(buff, var1, 29, protoModule.wireTypes.lengthDelimited)
			var87, var5714 = protoModule.writeBuffer(var87, var88, var86, buffer.len(var86))
			buff = var87
			var1 = var88
		elseif self.kind.type == "refresh_from_api_action" then
			local var89 = self.kind.value:encode()
			local var90, var91 = protoModule.writeTag(buff, var1, 30, protoModule.wireTypes.lengthDelimited)
			var90, var5717 = protoModule.writeBuffer(var90, var91, var89, buffer.len(var89))
			buff = var90
			var1 = var91
		elseif self.kind.type == "rsvp_to_event_action" then
			local var92 = self.kind.value:encode()
			local var93, var94 = protoModule.writeTag(buff, var1, 31, protoModule.wireTypes.lengthDelimited)
			var93, var5720 = protoModule.writeBuffer(var93, var94, var92, buffer.len(var92))
			buff = var93
			var1 = var94
		elseif self.kind.type == "apply_charts_filter_action" then
			local var95 = self.kind.value:encode()
			local var96, var97 = protoModule.writeTag(buff, var1, 32, protoModule.wireTypes.lengthDelimited)
			var96, var5723 = protoModule.writeBuffer(var96, var97, var95, buffer.len(var95))
			buff = var96
			var1 = var97
		elseif self.kind.type == "analytics_event_action" then
			local var98 = self.kind.value:encode()
			local var99, var100 = protoModule.writeTag(buff, var1, 33, protoModule.wireTypes.lengthDelimited)
			var99, var5726 = protoModule.writeBuffer(var99, var100, var98, buffer.len(var98))
			buff = var99
			var1 = var100
		elseif self.kind.type == "custom_analytics_event_action" then
			local var101 = self.kind.value:encode()
			local var102, var103 = protoModule.writeTag(buff, var1, 34, protoModule.wireTypes.lengthDelimited)
			var102, var5729 = protoModule.writeBuffer(var102, var103, var101, buffer.len(var101))
			buff = var102
			var1 = var103
		elseif self.kind.type == "open_game_invite_action" then
			local var104 = self.kind.value:encode()
			local var105, var106 = protoModule.writeTag(buff, var1, 35, protoModule.wireTypes.lengthDelimited)
			var105, var5732 = protoModule.writeBuffer(var105, var106, var104, buffer.len(var104))
			buff = var105
			var1 = var106
		elseif self.kind.type == "open_event_details_action" then
			local var107 = self.kind.value:encode()
			local var108, var109 = protoModule.writeTag(buff, var1, 36, protoModule.wireTypes.lengthDelimited)
			var108, var5735 = protoModule.writeBuffer(var108, var109, var107, buffer.len(var107))
			buff = var108
			var1 = var109
		elseif self.kind.type == "launch_experience_action" then
			local var110 = self.kind.value:encode()
			local var111, var112 = protoModule.writeTag(buff, var1, 37, protoModule.wireTypes.lengthDelimited)
			var111, var5738 = protoModule.writeBuffer(var111, var112, var110, buffer.len(var110))
			buff = var111
			var1 = var112
		elseif self.kind.type == "toggle_experience_favorite_action" then
			local var113 = self.kind.value:encode()
			local var114, var115 = protoModule.writeTag(buff, var1, 38, protoModule.wireTypes.lengthDelimited)
			var114, var5741 = protoModule.writeBuffer(var114, var115, var113, buffer.len(var113))
			buff = var114
			var1 = var115
		elseif self.kind.type == "toggle_experience_follow_action" then
			local var116 = self.kind.value:encode()
			local var117, var118 = protoModule.writeTag(buff, var1, 39, protoModule.wireTypes.lengthDelimited)
			var117, var5744 = protoModule.writeBuffer(var117, var118, var116, buffer.len(var116))
			buff = var117
			var1 = var118
		elseif self.kind.type == "toggle_experience_vote_action" then
			local var119 = self.kind.value:encode()
			local var120, var121 = protoModule.writeTag(buff, var1, 40, protoModule.wireTypes.lengthDelimited)
			var120, var5747 = protoModule.writeBuffer(var120, var121, var119, buffer.len(var119))
			buff = var120
			var1 = var121
		elseif self.kind.type == "open_purchase_prompt_action" then
			local var122 = self.kind.value:encode()
			local var123, var124 = protoModule.writeTag(buff, var1, 41, protoModule.wireTypes.lengthDelimited)
			var123, var5750 = protoModule.writeBuffer(var123, var124, var122, buffer.len(var122))
			buff = var123
			var1 = var124
		elseif self.kind.type == "open_sdui_overlay_action" then
			local var125 = self.kind.value:encode()
			local var126, var127 = protoModule.writeTag(buff, var1, 42, protoModule.wireTypes.lengthDelimited)
			var126, var5753 = protoModule.writeBuffer(var126, var127, var125, buffer.len(var125))
			buff = var126
			var1 = var127
		elseif self.kind.type == "open_badges_see_all_action" then
			local var128 = self.kind.value:encode()
			local var129, var130 = protoModule.writeTag(buff, var1, 43, protoModule.wireTypes.lengthDelimited)
			var129, var5756 = protoModule.writeBuffer(var129, var130, var128, buffer.len(var128))
			buff = var129
			var1 = var130
		elseif self.kind.type == "open_experience_store_see_all_action" then
			local var131 = self.kind.value:encode()
			local var132, var133 = protoModule.writeTag(buff, var1, 44, protoModule.wireTypes.lengthDelimited)
			var132, var5759 = protoModule.writeBuffer(var132, var133, var131, buffer.len(var131))
			buff = var132
			var1 = var133
		elseif self.kind.type == "dismiss_game_feedback_action" then
			local var134 = self.kind.value:encode()
			local var135, var136 = protoModule.writeTag(buff, var1, 45, protoModule.wireTypes.lengthDelimited)
			var135, var5762 = protoModule.writeBuffer(var135, var136, var134, buffer.len(var134))
			buff = var135
			var1 = var136
		elseif self.kind.type == "open_game_feedback_form_action" then
			local var137 = self.kind.value:encode()
			local var138, var139 = protoModule.writeTag(buff, var1, 46, protoModule.wireTypes.lengthDelimited)
			var138, var5765 = protoModule.writeBuffer(var138, var139, var137, buffer.len(var137))
			buff = var138
			var1 = var139
		elseif self.kind.type == "enable_event_notifications_action" then
			local var140 = self.kind.value:encode()
			local var141, var142 = protoModule.writeTag(buff, var1, 47, protoModule.wireTypes.lengthDelimited)
			var141, var5768 = protoModule.writeBuffer(var141, var142, var140, buffer.len(var140))
			buff = var141
			var1 = var142
		elseif self.kind.type == "dismiss_event_notifications_modal_action" then
			local var143 = self.kind.value:encode()
			local var144, var145 = protoModule.writeTag(buff, var1, 48, protoModule.wireTypes.lengthDelimited)
			var144, var5771 = protoModule.writeBuffer(var144, var145, var143, buffer.len(var143))
			buff = var144
			var1 = var145
		elseif self.kind.type == "open_amp_wizard_action" then
			local var146 = self.kind.value:encode()
			local var147, var148 = protoModule.writeTag(buff, var1, 49, protoModule.wireTypes.lengthDelimited)
			var147, var5774 = protoModule.writeBuffer(var147, var148, var146, buffer.len(var146))
			buff = var147
			var1 = var148
		elseif self.kind.type == "open_subscription_purchase_page_action" then
			local var149 = self.kind.value:encode()
			local var150, var151 = protoModule.writeTag(buff, var1, 50, protoModule.wireTypes.lengthDelimited)
			var150, var5777 = protoModule.writeBuffer(var150, var151, var149, buffer.len(var149))
			buff = var150
			var1 = var151
		elseif self.kind.type == "refresh_game_passes_action" then
			local var152 = self.kind.value:encode()
			local var153, var154 = protoModule.writeTag(buff, var1, 51, protoModule.wireTypes.lengthDelimited)
			var153, var5780 = protoModule.writeBuffer(var153, var154, var152, buffer.len(var152))
			buff = var153
			var1 = var154
		elseif self.kind.type == "refresh_playability_action" then
			local var155 = self.kind.value:encode()
			local var156, var157 = protoModule.writeTag(buff, var1, 52, protoModule.wireTypes.lengthDelimited)
			var156, var5783 = protoModule.writeBuffer(var156, var157, var155, buffer.len(var155))
			buff = var156
			var1 = var157
		elseif self.kind.type == "open_social_proof_user_list_sheet_action" then
			local var158 = self.kind.value:encode()
			local var159, var160 = protoModule.writeTag(buff, var1, 53, protoModule.wireTypes.lengthDelimited)
			var159, var5786 = protoModule.writeBuffer(var159, var160, var158, buffer.len(var158))
			buff = var159
			var1 = var160
		elseif self.kind.type == "report_surface_load_time_milestone_action" then
			local var161 = self.kind.value:encode()
			local var162, var163 = protoModule.writeTag(buff, var1, 54, protoModule.wireTypes.lengthDelimited)
			var162, var5789 = protoModule.writeBuffer(var162, var163, var161, buffer.len(var161))
			buff = var162
			var1 = var163
		elseif self.kind.type == "open_search_results_tab_action" then
			local var164 = self.kind.value:encode()
			local var165, var166 = protoModule.writeTag(buff, var1, 55, protoModule.wireTypes.lengthDelimited)
			var165, var5792 = protoModule.writeBuffer(var165, var166, var164, buffer.len(var164))
			buff = var165
			var1 = var166
		elseif self.kind.type == "open_phone_upsell_modal_action" then
			local var167 = self.kind.value:encode()
			local var168, var169 = protoModule.writeTag(buff, var1, 56, protoModule.wireTypes.lengthDelimited)
			var168, var5795 = protoModule.writeBuffer(var168, var169, var167, buffer.len(var167))
			buff = var168
			var1 = var169
		elseif self.kind.type == "open_email_upsell_modal_action" then
			local var170 = self.kind.value:encode()
			local var171, var172 = protoModule.writeTag(buff, var1, 57, protoModule.wireTypes.lengthDelimited)
			var171, var5798 = protoModule.writeBuffer(var171, var172, var170, buffer.len(var170))
			buff = var171
			var1 = var172
		elseif self.kind.type == "dismiss_prompt_action" then
			local var173 = self.kind.value:encode()
			local var174, var175 = protoModule.writeTag(buff, var1, 58, protoModule.wireTypes.lengthDelimited)
			var174, var5801 = protoModule.writeBuffer(var174, var175, var173, buffer.len(var173))
			buff = var174
			var1 = var175
		elseif self.kind.type == "request_friendship_action" then
			local var176 = self.kind.value:encode()
			local var177, var178 = protoModule.writeTag(buff, var1, 59, protoModule.wireTypes.lengthDelimited)
			var177, var5804 = protoModule.writeBuffer(var177, var178, var176, buffer.len(var176))
			buff = var177
			var1 = var178
		elseif self.kind.type == "refresh_developer_products_action" then
			local var179 = self.kind.value:encode()
			local var180, var181 = protoModule.writeTag(buff, var1, 60, protoModule.wireTypes.lengthDelimited)
			var180, var5807 = protoModule.writeBuffer(var180, var181, var179, buffer.len(var179))
			buff = var180
			var1 = var181
		elseif self.kind.type == "open_fae_trial_upsell_action" then
			local var182 = self.kind.value:encode()
			local var183, var184 = protoModule.writeTag(buff, var1, 61, protoModule.wireTypes.lengthDelimited)
			var183, var5810 = protoModule.writeBuffer(var183, var184, var182, buffer.len(var182))
			buff = var183
			var1 = var184
		elseif self.kind.type == "refresh_omni_recommendation_feed_item_action" then
			local var185 = self.kind.value:encode()
			local var186, var187 = protoModule.writeTag(buff, var1, 62, protoModule.wireTypes.lengthDelimited)
			var186, var5813 = protoModule.writeBuffer(var186, var187, var185, buffer.len(var185))
			buff = var186
			var1 = var187
		elseif self.kind.type == "ai_overview_feedback_action" then
			local var188 = self.kind.value:encode()
			local var189, var190 = protoModule.writeTag(buff, var1, 63, protoModule.wireTypes.lengthDelimited)
			var189, var5816 = protoModule.writeBuffer(var189, var190, var188, buffer.len(var188))
			buff = var189
			var1 = var190
		elseif self.kind.type == "open_trusted_friends_upsell_modal_action" then
			local var191 = self.kind.value:encode()
			local var192, var193 = protoModule.writeTag(buff, var1, 64, protoModule.wireTypes.lengthDelimited)
			var192, var5819 = protoModule.writeBuffer(var192, var193, var191, buffer.len(var191))
			buff = var192
			var1 = var193
		elseif self.kind.type == "record_party_chat_conversation_upsell_acknowledgement_action" then
			local var194 = self.kind.value:encode()
			local var195, var196 = protoModule.writeTag(buff, var1, 65, protoModule.wireTypes.lengthDelimited)
			var195, var5822 = protoModule.writeBuffer(var195, var196, var194, buffer.len(var194))
			buff = var195
			var1 = var196
		elseif self.kind.type == "open_search_results_with_query_action" then
			local var197 = self.kind.value:encode()
			local var198, var199 = protoModule.writeTag(buff, var1, 66, protoModule.wireTypes.lengthDelimited)
			var198, var5825 = protoModule.writeBuffer(var198, var199, var197, buffer.len(var197))
			buff = var198
			var1 = var199
		elseif self.kind.type == "select_marketplace_favorites_category" then
			local var200 = self.kind.value:encode()
			local var201, var202 = protoModule.writeTag(buff, var1, 67, protoModule.wireTypes.lengthDelimited)
			var201, var5828 = protoModule.writeBuffer(var201, var202, var200, buffer.len(var200))
			buff = var201
			var1 = var202
		elseif self.kind.type == "download_app_action" then
			local var203 = self.kind.value:encode()
			local var204, var205 = protoModule.writeTag(buff, var1, 68, protoModule.wireTypes.lengthDelimited)
			var204, var5831 = protoModule.writeBuffer(var204, var205, var203, buffer.len(var203))
			buff = var204
			var1 = var205
		elseif self.kind.type == "refresh_charts_sort_detail_action" then
			local var206 = self.kind.value:encode()
			local var207, var208 = protoModule.writeTag(buff, var1, 69, protoModule.wireTypes.lengthDelimited)
			var207, var5834 = protoModule.writeBuffer(var207, var208, var206, buffer.len(var206))
			buff = var207
			var1 = var208
		elseif self.kind.type == "join_community_action" then
			local var209 = self.kind.value:encode()
			local var210, var211 = protoModule.writeTag(buff, var1, 70, protoModule.wireTypes.lengthDelimited)
			var210, var5837 = protoModule.writeBuffer(var210, var211, var209, buffer.len(var209))
			buff = var210
			var1 = var211
		elseif self.kind.type == "view_community_action" then
			local var212 = self.kind.value:encode()
			local var213, var214 = protoModule.writeTag(buff, var1, 71, protoModule.wireTypes.lengthDelimited)
			var213, var5840 = protoModule.writeBuffer(var213, var214, var212, buffer.len(var212))
			buff = var213
			var1 = var214
		elseif self.kind.type == "pin_experience_shortcut_action" then
			local var215 = self.kind.value:encode()
			local var216, var217 = protoModule.writeTag(buff, var1, 72, protoModule.wireTypes.lengthDelimited)
			var216, var5843 = protoModule.writeBuffer(var216, var217, var215, buffer.len(var215))
			buff = var216
			var1 = var217
		elseif self.kind.type == "select_marketplace_favorites_subcategory" then
			local var218 = self.kind.value:encode()
			local var219, var220 = protoModule.writeTag(buff, var1, 73, protoModule.wireTypes.lengthDelimited)
			var219, var5846 = protoModule.writeBuffer(var219, var220, var218, buffer.len(var218))
			buff = var219
			var1 = var220
		elseif self.kind.type == "show_toast_action" then
			local var221 = self.kind.value:encode()
			local var222, var223 = protoModule.writeTag(buff, var1, 74, protoModule.wireTypes.lengthDelimited)
			var222, var5849 = protoModule.writeBuffer(var222, var223, var221, buffer.len(var221))
			buff = var222
			var1 = var223
		elseif self.kind.type == "open_incoming_transfer_upsell_action" then
			local var224 = self.kind.value:encode()
			local var225, var226 = protoModule.writeTag(buff, var1, 75, protoModule.wireTypes.lengthDelimited)
			var225, var5852 = protoModule.writeBuffer(var225, var226, var224, buffer.len(var224))
			buff = var225
			var1 = var226
		elseif self.kind.type == "action_sequence_action" then
			local var227 = self.kind.value:encode()
			local var228, var229 = protoModule.writeTag(buff, var1, 76, protoModule.wireTypes.lengthDelimited)
			var228, var5855 = protoModule.writeBuffer(var228, var229, var227, buffer.len(var227))
			buff = var228
			var1 = var229
		elseif self.kind.type == "refresh_feed_entry_from_api_action" then
			local var230 = self.kind.value:encode()
			local var231, var232 = protoModule.writeTag(buff, var1, 77, protoModule.wireTypes.lengthDelimited)
			var231, var5858 = protoModule.writeBuffer(var231, var232, var230, buffer.len(var230))
			buff = var231
			var1 = var232
		elseif self.kind.type == "open_profile_frames_editor_action" then
			local var233 = self.kind.value:encode()
			local var234, var235 = protoModule.writeTag(buff, var1, 78, protoModule.wireTypes.lengthDelimited)
			var234, var5861 = protoModule.writeBuffer(var234, var235, var233, buffer.len(var233))
			buff = var234
			var1 = var235
		elseif self.kind.type == "navigate_action" then
			local var236 = self.kind.value:encode()
			local var237, var238 = protoModule.writeTag(buff, var1, 79, protoModule.wireTypes.lengthDelimited)
			var237, var5864 = protoModule.writeBuffer(var237, var238, var236, buffer.len(var236))
			buff = var237
			var1 = var238
		end
	end
	if self.telemetry_handler ~= nil then
		local var239 = self.telemetry_handler:encode()
		local var240, var241 = protoModule.writeTag(buff, var1, 1000, protoModule.wireTypes.lengthDelimited)
		var240, var5867 = protoModule.writeBuffer(var240, var241, var239, buffer.len(var239))
		buff = var240
		var1 = var241
	end
	if self.accessibility_label ~= nil then
		local var242 = self.accessibility_label:encode()
		local var243, var244 = protoModule.writeTag(buff, var1, 1001, protoModule.wireTypes.lengthDelimited)
		var243, var5870 = protoModule.writeBuffer(var243, var244, var242, buffer.len(var242))
		buff = var243
		var1 = var244
	end
	if self.skip_unified_logging ~= nil then
		local var245 = self.skip_unified_logging:encode()
		local var246, var247 = protoModule.writeTag(buff, var1, 1002, protoModule.wireTypes.lengthDelimited)
		var246, var5873 = protoModule.writeBuffer(var246, var247, var245, buffer.len(var245))
		buff = var246
		var1 = var247
	end
	if self.action_event_name ~= nil then
		local var248 = self.action_event_name:encode()
		local var249, var250 = protoModule.writeTag(buff, var1, 1003, protoModule.wireTypes.lengthDelimited)
		var249, var5876 = protoModule.writeBuffer(var249, var250, var248, buffer.len(var248))
		buff = var249
		var1 = var250
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_170.decode(p1)
	-- upvalues: t_170 (ref), protoModule (ref), t (ref), propTypesModule (ref)
	local var1 = t_170.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.kind = {
					type = "dismiss_dialog_action",
					value = t.DismissDialogAction.decode(var10)
				}
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = {
					type = "link_action",
					value = t.LinkAction.decode(var12)
				}
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.kind = {
					type = "open_game_details_action",
					value = t.OpenGameDetailsAction.decode(var14)
				}
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.kind = {
					type = "open_join_friends_action",
					value = t.OpenJoinFriendsAction.decode(var16)
				}
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.kind = {
					type = "open_marketplace_try_on_action",
					value = t.OpenMarketplaceTryOnAction.decode(var18)
				}
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.kind = {
					type = "open_see_all_action",
					value = t.OpenSeeAllAction.decode(var20)
				}
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.kind = {
					type = "open_sponsored_tooltip_action",
					value = t.OpenSponsoredTooltipAction.decode(var22)
				}
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.kind = {
					type = "play_button_click_action",
					value = t.PlayButtonClickAction.decode(var24)
				}
			elseif var7 == 9 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.kind = {
					type = "update_user_settings_action",
					value = t.UpdateUserSettingsAction.decode(var26)
				}
			elseif var7 == 10 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var2)
				var2 = var29
				var1.kind = {
					type = "open_tooltip_action",
					value = t.OpenTooltipAction.decode(var28)
				}
			elseif var7 == 11 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var2)
				var2 = var31
				var1.kind = {
					type = "open_badge_details_action",
					value = t.OpenBadgeDetailsAction.decode(var30)
				}
			elseif var7 == 12 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var2)
				var2 = var33
				var1.kind = {
					type = "load_more_from_api_action",
					value = t.LoadMoreFromApiAction.decode(var32)
				}
			elseif var7 == 13 then
				local _ = nil
				local var34, var35 = protoModule.readBuffer(p1, var2)
				var2 = var35
				var1.kind = {
					type = "share_action",
					value = t.ShareAction.decode(var34)
				}
			elseif var7 == 14 then
				local _ = nil
				local var36, var37 = protoModule.readBuffer(p1, var2)
				var2 = var37
				var1.kind = {
					type = "open_abuse_report_action",
					value = t.OpenAbuseReportAction.decode(var36)
				}
			elseif var7 == 15 then
				local _ = nil
				local var38, var39 = protoModule.readBuffer(p1, var2)
				var2 = var39
				var1.kind = {
					type = "remove_badge_from_inventory_action",
					value = t.RemoveBadgeFromInventoryAction.decode(var38)
				}
			elseif var7 == 16 then
				local _ = nil
				local var40, var41 = protoModule.readBuffer(p1, var2)
				var2 = var41
				var1.kind = {
					type = "open_profile_action",
					value = t.OpenProfileAction.decode(var40)
				}
			elseif var7 == 17 then
				local _ = nil
				local var42, var43 = protoModule.readBuffer(p1, var2)
				var2 = var43
				var1.kind = {
					type = "open_facial_age_estimation_action",
					value = t.OpenFacialAgeEstimationAction.decode(var42)
				}
			elseif var7 == 18 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p1, var2)
				var2 = var45
				var1.kind = {
					type = "open_add_connections_page_action",
					value = t.OpenAddConnectionsPageAction.decode(var44)
				}
			elseif var7 == 19 then
				local _ = nil
				local var46, var47 = protoModule.readBuffer(p1, var2)
				var2 = var47
				var1.kind = {
					type = "open_marketplace_action",
					value = t.OpenMarketplaceAction.decode(var46)
				}
			elseif var7 == 20 then
				local _ = nil
				local var48, var49 = protoModule.readBuffer(p1, var2)
				var2 = var49
				var1.kind = {
					type = "hide_profile_completion_action",
					value = t.HideProfileCompletionAction.decode(var48)
				}
			elseif var7 == 21 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p1, var2)
				var2 = var51
				var1.kind = {
					type = "select_marketplace_catalog_category",
					value = t.SelectMarketplaceCatalogCategory.decode(var50)
				}
			elseif var7 == 22 then
				local _ = nil
				local var52, var53 = protoModule.readBuffer(p1, var2)
				var2 = var53
				var1.kind = {
					type = "select_marketplace_catalog_subcategory",
					value = t.SelectMarketplaceCatalogSubcategory.decode(var52)
				}
			elseif var7 == 23 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p1, var2)
				var2 = var55
				var1.kind = {
					type = "open_marketplace_catalog_see_all",
					value = t.OpenMarketplaceCatalogSeeAll.decode(var54)
				}
			elseif var7 == 24 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p1, var2)
				var2 = var57
				var1.kind = {
					type = "close_marketplace_category_tooltip",
					value = t.CloseMarketplaceCategoryTooltip.decode(var56)
				}
			elseif var7 == 25 then
				local _ = nil
				local var58, var59 = protoModule.readBuffer(p1, var2)
				var2 = var59
				var1.kind = {
					type = "resize_marketplace_catalog",
					value = t.ResizeMarketplaceCatalog.decode(var58)
				}
			elseif var7 == 26 then
				local _ = nil
				local var60, var61 = protoModule.readBuffer(p1, var2)
				var2 = var61
				var1.kind = {
					type = "open_marketplace_catalog_filters",
					value = t.OpenMarketplaceCatalogFilters.decode(var60)
				}
			elseif var7 == 27 then
				local _ = nil
				local var62, var63 = protoModule.readBuffer(p1, var2)
				var2 = var63
				var1.kind = {
					type = "open_social_link_action",
					value = t.OpenSocialLinkAction.decode(var62)
				}
			elseif var7 == 28 then
				local _ = nil
				local var64, var65 = protoModule.readBuffer(p1, var2)
				var2 = var65
				var1.kind = {
					type = "open_charts_sort_detail_action",
					value = t.OpenChartsSortDetailAction.decode(var64)
				}
			elseif var7 == 29 then
				local _ = nil
				local var66, var67 = protoModule.readBuffer(p1, var2)
				var2 = var67
				var1.kind = {
					type = "open_song_detail_action",
					value = t.OpenSongDetailAction.decode(var66)
				}
			elseif var7 == 30 then
				local _ = nil
				local var68, var69 = protoModule.readBuffer(p1, var2)
				var2 = var69
				var1.kind = {
					type = "refresh_from_api_action",
					value = t.RefreshFromApiAction.decode(var68)
				}
			elseif var7 == 31 then
				local _ = nil
				local var70, var71 = protoModule.readBuffer(p1, var2)
				var2 = var71
				var1.kind = {
					type = "rsvp_to_event_action",
					value = t.RsvpToEventAction.decode(var70)
				}
			elseif var7 == 32 then
				local _ = nil
				local var72, var73 = protoModule.readBuffer(p1, var2)
				var2 = var73
				var1.kind = {
					type = "apply_charts_filter_action",
					value = t.ApplyChartsFilterAction.decode(var72)
				}
			elseif var7 == 33 then
				local _ = nil
				local var74, var75 = protoModule.readBuffer(p1, var2)
				var2 = var75
				var1.kind = {
					type = "analytics_event_action",
					value = t.AnalyticsEventAction.decode(var74)
				}
			elseif var7 == 34 then
				local _ = nil
				local var76, var77 = protoModule.readBuffer(p1, var2)
				var2 = var77
				var1.kind = {
					type = "custom_analytics_event_action",
					value = t.CustomAnalyticsEventAction.decode(var76)
				}
			elseif var7 == 35 then
				local _ = nil
				local var78, var79 = protoModule.readBuffer(p1, var2)
				var2 = var79
				var1.kind = {
					type = "open_game_invite_action",
					value = t.OpenGameInviteAction.decode(var78)
				}
			elseif var7 == 36 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p1, var2)
				var2 = var81
				var1.kind = {
					type = "open_event_details_action",
					value = t.OpenEventDetailsAction.decode(var80)
				}
			elseif var7 == 37 then
				local _ = nil
				local var82, var83 = protoModule.readBuffer(p1, var2)
				var2 = var83
				var1.kind = {
					type = "launch_experience_action",
					value = t.LaunchExperienceAction.decode(var82)
				}
			elseif var7 == 38 then
				local _ = nil
				local var84, var85 = protoModule.readBuffer(p1, var2)
				var2 = var85
				var1.kind = {
					type = "toggle_experience_favorite_action",
					value = t.ToggleExperienceFavoriteAction.decode(var84)
				}
			elseif var7 == 39 then
				local _ = nil
				local var86, var87 = protoModule.readBuffer(p1, var2)
				var2 = var87
				var1.kind = {
					type = "toggle_experience_follow_action",
					value = t.ToggleExperienceFollowAction.decode(var86)
				}
			elseif var7 == 40 then
				local _ = nil
				local var88, var89 = protoModule.readBuffer(p1, var2)
				var2 = var89
				var1.kind = {
					type = "toggle_experience_vote_action",
					value = t.ToggleExperienceVoteAction.decode(var88)
				}
			elseif var7 == 41 then
				local _ = nil
				local var90, var91 = protoModule.readBuffer(p1, var2)
				var2 = var91
				var1.kind = {
					type = "open_purchase_prompt_action",
					value = t.OpenPurchasePromptAction.decode(var90)
				}
			elseif var7 == 42 then
				local _ = nil
				local var92, var93 = protoModule.readBuffer(p1, var2)
				var2 = var93
				var1.kind = {
					type = "open_sdui_overlay_action",
					value = t.OpenSduiOverlayAction.decode(var92)
				}
			elseif var7 == 43 then
				local _ = nil
				local var94, var95 = protoModule.readBuffer(p1, var2)
				var2 = var95
				var1.kind = {
					type = "open_badges_see_all_action",
					value = t.OpenBadgesSeeAllAction.decode(var94)
				}
			elseif var7 == 44 then
				local _ = nil
				local var96, var97 = protoModule.readBuffer(p1, var2)
				var2 = var97
				var1.kind = {
					type = "open_experience_store_see_all_action",
					value = t.OpenExperienceStoreSeeAllAction.decode(var96)
				}
			elseif var7 == 45 then
				local _ = nil
				local var98, var99 = protoModule.readBuffer(p1, var2)
				var2 = var99
				var1.kind = {
					type = "dismiss_game_feedback_action",
					value = t.DismissGameFeedbackAction.decode(var98)
				}
			elseif var7 == 46 then
				local _ = nil
				local var100, var101 = protoModule.readBuffer(p1, var2)
				var2 = var101
				var1.kind = {
					type = "open_game_feedback_form_action",
					value = t.OpenGameFeedbackFormAction.decode(var100)
				}
			elseif var7 == 47 then
				local _ = nil
				local var102, var103 = protoModule.readBuffer(p1, var2)
				var2 = var103
				var1.kind = {
					type = "enable_event_notifications_action",
					value = t.EnableEventNotificationsAction.decode(var102)
				}
			elseif var7 == 48 then
				local _ = nil
				local var104, var105 = protoModule.readBuffer(p1, var2)
				var2 = var105
				var1.kind = {
					type = "dismiss_event_notifications_modal_action",
					value = t.DismissEventNotificationsModalAction.decode(var104)
				}
			elseif var7 == 49 then
				local _ = nil
				local var106, var107 = protoModule.readBuffer(p1, var2)
				var2 = var107
				var1.kind = {
					type = "open_amp_wizard_action",
					value = t.OpenAmpWizardAction.decode(var106)
				}
			elseif var7 == 50 then
				local _ = nil
				local var108, var109 = protoModule.readBuffer(p1, var2)
				var2 = var109
				var1.kind = {
					type = "open_subscription_purchase_page_action",
					value = t.OpenSubscriptionPurchasePageAction.decode(var108)
				}
			elseif var7 == 51 then
				local _ = nil
				local var110, var111 = protoModule.readBuffer(p1, var2)
				var2 = var111
				var1.kind = {
					type = "refresh_game_passes_action",
					value = t.RefreshGamePassesAction.decode(var110)
				}
			elseif var7 == 52 then
				local _ = nil
				local var112, var113 = protoModule.readBuffer(p1, var2)
				var2 = var113
				var1.kind = {
					type = "refresh_playability_action",
					value = t.RefreshPlayabilityAction.decode(var112)
				}
			elseif var7 == 53 then
				local _ = nil
				local var114, var115 = protoModule.readBuffer(p1, var2)
				var2 = var115
				var1.kind = {
					type = "open_social_proof_user_list_sheet_action",
					value = t.OpenSocialProofUserListSheetAction.decode(var114)
				}
			elseif var7 == 54 then
				local _ = nil
				local var116, var117 = protoModule.readBuffer(p1, var2)
				var2 = var117
				var1.kind = {
					type = "report_surface_load_time_milestone_action",
					value = t.ReportSurfaceLoadTimeMilestoneAction.decode(var116)
				}
			elseif var7 == 55 then
				local _ = nil
				local var118, var119 = protoModule.readBuffer(p1, var2)
				var2 = var119
				var1.kind = {
					type = "open_search_results_tab_action",
					value = t.OpenSearchResultsTabAction.decode(var118)
				}
			elseif var7 == 56 then
				local _ = nil
				local var120, var121 = protoModule.readBuffer(p1, var2)
				var2 = var121
				var1.kind = {
					type = "open_phone_upsell_modal_action",
					value = t.OpenPhoneUpsellModalAction.decode(var120)
				}
			elseif var7 == 57 then
				local _ = nil
				local var122, var123 = protoModule.readBuffer(p1, var2)
				var2 = var123
				var1.kind = {
					type = "open_email_upsell_modal_action",
					value = t.OpenEmailUpsellModalAction.decode(var122)
				}
			elseif var7 == 58 then
				local _ = nil
				local var124, var125 = protoModule.readBuffer(p1, var2)
				var2 = var125
				var1.kind = {
					type = "dismiss_prompt_action",
					value = t.DismissPromptAction.decode(var124)
				}
			elseif var7 == 59 then
				local _ = nil
				local var126, var127 = protoModule.readBuffer(p1, var2)
				var2 = var127
				var1.kind = {
					type = "request_friendship_action",
					value = t.RequestFriendshipAction.decode(var126)
				}
			elseif var7 == 60 then
				local _ = nil
				local var128, var129 = protoModule.readBuffer(p1, var2)
				var2 = var129
				var1.kind = {
					type = "refresh_developer_products_action",
					value = t.RefreshDeveloperProductsAction.decode(var128)
				}
			elseif var7 == 61 then
				local _ = nil
				local var130, var131 = protoModule.readBuffer(p1, var2)
				var2 = var131
				var1.kind = {
					type = "open_fae_trial_upsell_action",
					value = t.OpenFaeTrialUpsellAction.decode(var130)
				}
			elseif var7 == 62 then
				local _ = nil
				local var132, var133 = protoModule.readBuffer(p1, var2)
				var2 = var133
				var1.kind = {
					type = "refresh_omni_recommendation_feed_item_action",
					value = t.RefreshOmniRecommendationFeedItemAction.decode(var132)
				}
			elseif var7 == 63 then
				local _ = nil
				local var134, var135 = protoModule.readBuffer(p1, var2)
				var2 = var135
				var1.kind = {
					type = "ai_overview_feedback_action",
					value = t.AiOverviewFeedbackAction.decode(var134)
				}
			elseif var7 == 64 then
				local _ = nil
				local var136, var137 = protoModule.readBuffer(p1, var2)
				var2 = var137
				var1.kind = {
					type = "open_trusted_friends_upsell_modal_action",
					value = t.OpenTrustedFriendsUpsellModalAction.decode(var136)
				}
			elseif var7 == 65 then
				local _ = nil
				local var138, var139 = protoModule.readBuffer(p1, var2)
				var2 = var139
				var1.kind = {
					type = "record_party_chat_conversation_upsell_acknowledgement_action",
					value = t.RecordPartyChatConversationUpsellAcknowledgementAction.decode(var138)
				}
			elseif var7 == 66 then
				local _ = nil
				local var140, var141 = protoModule.readBuffer(p1, var2)
				var2 = var141
				var1.kind = {
					type = "open_search_results_with_query_action",
					value = t.OpenSearchResultsWithQueryAction.decode(var140)
				}
			elseif var7 == 67 then
				local _ = nil
				local var142, var143 = protoModule.readBuffer(p1, var2)
				var2 = var143
				var1.kind = {
					type = "select_marketplace_favorites_category",
					value = t.SelectMarketplaceFavoritesCategory.decode(var142)
				}
			elseif var7 == 68 then
				local _ = nil
				local var144, var145 = protoModule.readBuffer(p1, var2)
				var2 = var145
				var1.kind = {
					type = "download_app_action",
					value = t.DownloadAppAction.decode(var144)
				}
			elseif var7 == 69 then
				local _ = nil
				local var146, var147 = protoModule.readBuffer(p1, var2)
				var2 = var147
				var1.kind = {
					type = "refresh_charts_sort_detail_action",
					value = t.RefreshChartsSortDetailAction.decode(var146)
				}
			elseif var7 == 70 then
				local _ = nil
				local var148, var149 = protoModule.readBuffer(p1, var2)
				var2 = var149
				var1.kind = {
					type = "join_community_action",
					value = t.JoinCommunityAction.decode(var148)
				}
			elseif var7 == 71 then
				local _ = nil
				local var150, var151 = protoModule.readBuffer(p1, var2)
				var2 = var151
				var1.kind = {
					type = "view_community_action",
					value = t.ViewCommunityAction.decode(var150)
				}
			elseif var7 == 72 then
				local _ = nil
				local var152, var153 = protoModule.readBuffer(p1, var2)
				var2 = var153
				var1.kind = {
					type = "pin_experience_shortcut_action",
					value = t.PinExperienceShortcutAction.decode(var152)
				}
			elseif var7 == 73 then
				local _ = nil
				local var154, var155 = protoModule.readBuffer(p1, var2)
				var2 = var155
				var1.kind = {
					type = "select_marketplace_favorites_subcategory",
					value = t.SelectMarketplaceFavoritesSubcategory.decode(var154)
				}
			elseif var7 == 74 then
				local _ = nil
				local var156, var157 = protoModule.readBuffer(p1, var2)
				var2 = var157
				var1.kind = {
					type = "show_toast_action",
					value = t.ShowToastAction.decode(var156)
				}
			elseif var7 == 75 then
				local _ = nil
				local var158, var159 = protoModule.readBuffer(p1, var2)
				var2 = var159
				var1.kind = {
					type = "open_incoming_transfer_upsell_action",
					value = t.OpenIncomingTransferUpsellAction.decode(var158)
				}
			elseif var7 == 76 then
				local _ = nil
				local var160, var161 = protoModule.readBuffer(p1, var2)
				var2 = var161
				var1.kind = {
					type = "action_sequence_action",
					value = t.ActionSequenceAction.decode(var160)
				}
			elseif var7 == 77 then
				local _ = nil
				local var162, var163 = protoModule.readBuffer(p1, var2)
				var2 = var163
				var1.kind = {
					type = "refresh_feed_entry_from_api_action",
					value = t.RefreshFeedEntryFromApiAction.decode(var162)
				}
			elseif var7 == 78 then
				local _ = nil
				local var164, var165 = protoModule.readBuffer(p1, var2)
				var2 = var165
				var1.kind = {
					type = "open_profile_frames_editor_action",
					value = t.OpenProfileFramesEditorAction.decode(var164)
				}
			elseif var7 == 79 then
				local _ = nil
				local var166, var167 = protoModule.readBuffer(p1, var2)
				var2 = var167
				var1.kind = {
					type = "navigate_action",
					value = t.NavigateAction.decode(var166)
				}
			elseif var7 == 1000 then
				local _ = nil
				local var168, var169 = protoModule.readBuffer(p1, var2)
				var2 = var169
				var1.telemetry_handler = propTypesModule.StringProp.decode(var168)
			elseif var7 == 1001 then
				local _ = nil
				local var170, var171 = protoModule.readBuffer(p1, var2)
				var2 = var171
				var1.accessibility_label = propTypesModule.StringFormat.decode(var170)
			elseif var7 == 1002 then
				local _ = nil
				local var172, var173 = protoModule.readBuffer(p1, var2)
				var2 = var173
				var1.skip_unified_logging = propTypesModule.BoolProp.decode(var172)
			elseif var7 == 1003 then
				local _ = nil
				local var174, var175 = protoModule.readBuffer(p1, var2)
				var2 = var175
				var1.action_event_name = propTypesModule.StringProp.decode(var174)
			else
				local _ = nil
				local var176, var177 = protoModule.readVarInt(p1, var2)
				var2 = var177 + var176
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var178, var179 = protoModule.readFixed32(p1, var2)
			local _ = var178
			var2 = var179
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var180, var181 = protoModule.readFixed64(p1, var2)
			local _ = var180
			var2 = var181
		else
			error("Unsupported wire type: " .. var5880)
		end
	end
	return var1
end

function t_170:jsonEncode()
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
		elseif self.kind.type == "navigate_action" then
			t.navigateAction = self.kind.value:jsonEncode()
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
	if self.action_event_name ~= nil then
		t.actionEventName = self.action_event_name:jsonEncode()
	end
	return t
end

function t_170:jsonDecode()
	-- upvalues: t_170 (ref), t (ref), propTypesModule (ref)
	local var1 = t_170.new()
	
	if self.dismiss_dialog_action ~= nil then
		var1.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismiss_dialog_action)
		}
	end
	if self.dismissDialogAction ~= nil then
		var1.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismissDialogAction)
		}
	end
	if self.link_action ~= nil then
		var1.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.link_action)
		}
	end
	if self.linkAction ~= nil then
		var1.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.linkAction)
		}
	end
	if self.open_game_details_action ~= nil then
		var1.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.open_game_details_action)
		}
	end
	if self.openGameDetailsAction ~= nil then
		var1.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.openGameDetailsAction)
		}
	end
	if self.open_join_friends_action ~= nil then
		var1.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.open_join_friends_action)
		}
	end
	if self.openJoinFriendsAction ~= nil then
		var1.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.openJoinFriendsAction)
		}
	end
	if self.open_marketplace_try_on_action ~= nil then
		var1.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.open_marketplace_try_on_action)
		}
	end
	if self.openMarketplaceTryOnAction ~= nil then
		var1.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.openMarketplaceTryOnAction)
		}
	end
	if self.open_see_all_action ~= nil then
		var1.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.open_see_all_action)
		}
	end
	if self.openSeeAllAction ~= nil then
		var1.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.openSeeAllAction)
		}
	end
	if self.open_sponsored_tooltip_action ~= nil then
		var1.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.open_sponsored_tooltip_action)
		}
	end
	if self.openSponsoredTooltipAction ~= nil then
		var1.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.openSponsoredTooltipAction)
		}
	end
	if self.play_button_click_action ~= nil then
		var1.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.play_button_click_action)
		}
	end
	if self.playButtonClickAction ~= nil then
		var1.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.playButtonClickAction)
		}
	end
	if self.update_user_settings_action ~= nil then
		var1.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.update_user_settings_action)
		}
	end
	if self.updateUserSettingsAction ~= nil then
		var1.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.updateUserSettingsAction)
		}
	end
	if self.open_tooltip_action ~= nil then
		var1.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.open_tooltip_action)
		}
	end
	if self.openTooltipAction ~= nil then
		var1.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.openTooltipAction)
		}
	end
	if self.open_badge_details_action ~= nil then
		var1.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.open_badge_details_action)
		}
	end
	if self.openBadgeDetailsAction ~= nil then
		var1.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.openBadgeDetailsAction)
		}
	end
	if self.load_more_from_api_action ~= nil then
		var1.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.load_more_from_api_action)
		}
	end
	if self.loadMoreFromApiAction ~= nil then
		var1.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.loadMoreFromApiAction)
		}
	end
	if self.share_action ~= nil then
		var1.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.share_action)
		}
	end
	if self.shareAction ~= nil then
		var1.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.shareAction)
		}
	end
	if self.open_abuse_report_action ~= nil then
		var1.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.open_abuse_report_action)
		}
	end
	if self.openAbuseReportAction ~= nil then
		var1.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.openAbuseReportAction)
		}
	end
	if self.remove_badge_from_inventory_action ~= nil then
		var1.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.remove_badge_from_inventory_action)
		}
	end
	if self.removeBadgeFromInventoryAction ~= nil then
		var1.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.removeBadgeFromInventoryAction)
		}
	end
	if self.open_profile_action ~= nil then
		var1.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.open_profile_action)
		}
	end
	if self.openProfileAction ~= nil then
		var1.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.openProfileAction)
		}
	end
	if self.open_facial_age_estimation_action ~= nil then
		var1.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.open_facial_age_estimation_action)
		}
	end
	if self.openFacialAgeEstimationAction ~= nil then
		var1.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.openFacialAgeEstimationAction)
		}
	end
	if self.open_add_connections_page_action ~= nil then
		var1.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.open_add_connections_page_action)
		}
	end
	if self.openAddConnectionsPageAction ~= nil then
		var1.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.openAddConnectionsPageAction)
		}
	end
	if self.open_marketplace_action ~= nil then
		var1.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.open_marketplace_action)
		}
	end
	if self.openMarketplaceAction ~= nil then
		var1.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.openMarketplaceAction)
		}
	end
	if self.hide_profile_completion_action ~= nil then
		var1.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hide_profile_completion_action)
		}
	end
	if self.hideProfileCompletionAction ~= nil then
		var1.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hideProfileCompletionAction)
		}
	end
	if self.select_marketplace_catalog_category ~= nil then
		var1.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.select_marketplace_catalog_category)
		}
	end
	if self.selectMarketplaceCatalogCategory ~= nil then
		var1.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.selectMarketplaceCatalogCategory)
		}
	end
	if self.select_marketplace_catalog_subcategory ~= nil then
		var1.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.select_marketplace_catalog_subcategory)
		}
	end
	if self.selectMarketplaceCatalogSubcategory ~= nil then
		var1.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.selectMarketplaceCatalogSubcategory)
		}
	end
	if self.open_marketplace_catalog_see_all ~= nil then
		var1.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.open_marketplace_catalog_see_all)
		}
	end
	if self.openMarketplaceCatalogSeeAll ~= nil then
		var1.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.openMarketplaceCatalogSeeAll)
		}
	end
	if self.close_marketplace_category_tooltip ~= nil then
		var1.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.close_marketplace_category_tooltip)
		}
	end
	if self.closeMarketplaceCategoryTooltip ~= nil then
		var1.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.closeMarketplaceCategoryTooltip)
		}
	end
	if self.resize_marketplace_catalog ~= nil then
		var1.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resize_marketplace_catalog)
		}
	end
	if self.resizeMarketplaceCatalog ~= nil then
		var1.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resizeMarketplaceCatalog)
		}
	end
	if self.open_marketplace_catalog_filters ~= nil then
		var1.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.open_marketplace_catalog_filters)
		}
	end
	if self.openMarketplaceCatalogFilters ~= nil then
		var1.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.openMarketplaceCatalogFilters)
		}
	end
	if self.open_social_link_action ~= nil then
		var1.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.open_social_link_action)
		}
	end
	if self.openSocialLinkAction ~= nil then
		var1.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.openSocialLinkAction)
		}
	end
	if self.open_charts_sort_detail_action ~= nil then
		var1.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.open_charts_sort_detail_action)
		}
	end
	if self.openChartsSortDetailAction ~= nil then
		var1.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.openChartsSortDetailAction)
		}
	end
	if self.open_song_detail_action ~= nil then
		var1.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.open_song_detail_action)
		}
	end
	if self.openSongDetailAction ~= nil then
		var1.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.openSongDetailAction)
		}
	end
	if self.refresh_from_api_action ~= nil then
		var1.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refresh_from_api_action)
		}
	end
	if self.refreshFromApiAction ~= nil then
		var1.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refreshFromApiAction)
		}
	end
	if self.rsvp_to_event_action ~= nil then
		var1.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvp_to_event_action)
		}
	end
	if self.rsvpToEventAction ~= nil then
		var1.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvpToEventAction)
		}
	end
	if self.apply_charts_filter_action ~= nil then
		var1.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.apply_charts_filter_action)
		}
	end
	if self.applyChartsFilterAction ~= nil then
		var1.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.applyChartsFilterAction)
		}
	end
	if self.analytics_event_action ~= nil then
		var1.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analytics_event_action)
		}
	end
	if self.analyticsEventAction ~= nil then
		var1.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analyticsEventAction)
		}
	end
	if self.custom_analytics_event_action ~= nil then
		var1.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.custom_analytics_event_action)
		}
	end
	if self.customAnalyticsEventAction ~= nil then
		var1.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.customAnalyticsEventAction)
		}
	end
	if self.open_game_invite_action ~= nil then
		var1.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.open_game_invite_action)
		}
	end
	if self.openGameInviteAction ~= nil then
		var1.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.openGameInviteAction)
		}
	end
	if self.open_event_details_action ~= nil then
		var1.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.open_event_details_action)
		}
	end
	if self.openEventDetailsAction ~= nil then
		var1.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.openEventDetailsAction)
		}
	end
	if self.launch_experience_action ~= nil then
		var1.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launch_experience_action)
		}
	end
	if self.launchExperienceAction ~= nil then
		var1.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launchExperienceAction)
		}
	end
	if self.toggle_experience_favorite_action ~= nil then
		var1.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggle_experience_favorite_action)
		}
	end
	if self.toggleExperienceFavoriteAction ~= nil then
		var1.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggleExperienceFavoriteAction)
		}
	end
	if self.toggle_experience_follow_action ~= nil then
		var1.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggle_experience_follow_action)
		}
	end
	if self.toggleExperienceFollowAction ~= nil then
		var1.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggleExperienceFollowAction)
		}
	end
	if self.toggle_experience_vote_action ~= nil then
		var1.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggle_experience_vote_action)
		}
	end
	if self.toggleExperienceVoteAction ~= nil then
		var1.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggleExperienceVoteAction)
		}
	end
	if self.open_purchase_prompt_action ~= nil then
		var1.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.open_purchase_prompt_action)
		}
	end
	if self.openPurchasePromptAction ~= nil then
		var1.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.openPurchasePromptAction)
		}
	end
	if self.open_sdui_overlay_action ~= nil then
		var1.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.open_sdui_overlay_action)
		}
	end
	if self.openSduiOverlayAction ~= nil then
		var1.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.openSduiOverlayAction)
		}
	end
	if self.open_badges_see_all_action ~= nil then
		var1.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.open_badges_see_all_action)
		}
	end
	if self.openBadgesSeeAllAction ~= nil then
		var1.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.openBadgesSeeAllAction)
		}
	end
	if self.open_experience_store_see_all_action ~= nil then
		var1.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.open_experience_store_see_all_action)
		}
	end
	if self.openExperienceStoreSeeAllAction ~= nil then
		var1.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.openExperienceStoreSeeAllAction)
		}
	end
	if self.dismiss_game_feedback_action ~= nil then
		var1.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismiss_game_feedback_action)
		}
	end
	if self.dismissGameFeedbackAction ~= nil then
		var1.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismissGameFeedbackAction)
		}
	end
	if self.open_game_feedback_form_action ~= nil then
		var1.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.open_game_feedback_form_action)
		}
	end
	if self.openGameFeedbackFormAction ~= nil then
		var1.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.openGameFeedbackFormAction)
		}
	end
	if self.enable_event_notifications_action ~= nil then
		var1.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enable_event_notifications_action)
		}
	end
	if self.enableEventNotificationsAction ~= nil then
		var1.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enableEventNotificationsAction)
		}
	end
	if self.dismiss_event_notifications_modal_action ~= nil then
		var1.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismiss_event_notifications_modal_action)
		}
	end
	if self.dismissEventNotificationsModalAction ~= nil then
		var1.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismissEventNotificationsModalAction)
		}
	end
	if self.open_amp_wizard_action ~= nil then
		var1.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.open_amp_wizard_action)
		}
	end
	if self.openAmpWizardAction ~= nil then
		var1.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.openAmpWizardAction)
		}
	end
	if self.open_subscription_purchase_page_action ~= nil then
		var1.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.open_subscription_purchase_page_action)
		}
	end
	if self.openSubscriptionPurchasePageAction ~= nil then
		var1.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.openSubscriptionPurchasePageAction)
		}
	end
	if self.refresh_game_passes_action ~= nil then
		var1.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refresh_game_passes_action)
		}
	end
	if self.refreshGamePassesAction ~= nil then
		var1.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refreshGamePassesAction)
		}
	end
	if self.refresh_playability_action ~= nil then
		var1.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refresh_playability_action)
		}
	end
	if self.refreshPlayabilityAction ~= nil then
		var1.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refreshPlayabilityAction)
		}
	end
	if self.open_social_proof_user_list_sheet_action ~= nil then
		var1.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.open_social_proof_user_list_sheet_action)
		}
	end
	if self.openSocialProofUserListSheetAction ~= nil then
		var1.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.openSocialProofUserListSheetAction)
		}
	end
	if self.report_surface_load_time_milestone_action ~= nil then
		var1.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.report_surface_load_time_milestone_action)
		}
	end
	if self.reportSurfaceLoadTimeMilestoneAction ~= nil then
		var1.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.reportSurfaceLoadTimeMilestoneAction)
		}
	end
	if self.open_search_results_tab_action ~= nil then
		var1.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.open_search_results_tab_action)
		}
	end
	if self.openSearchResultsTabAction ~= nil then
		var1.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.openSearchResultsTabAction)
		}
	end
	if self.open_phone_upsell_modal_action ~= nil then
		var1.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.open_phone_upsell_modal_action)
		}
	end
	if self.openPhoneUpsellModalAction ~= nil then
		var1.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.openPhoneUpsellModalAction)
		}
	end
	if self.open_email_upsell_modal_action ~= nil then
		var1.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.open_email_upsell_modal_action)
		}
	end
	if self.openEmailUpsellModalAction ~= nil then
		var1.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.openEmailUpsellModalAction)
		}
	end
	if self.dismiss_prompt_action ~= nil then
		var1.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismiss_prompt_action)
		}
	end
	if self.dismissPromptAction ~= nil then
		var1.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismissPromptAction)
		}
	end
	if self.request_friendship_action ~= nil then
		var1.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.request_friendship_action)
		}
	end
	if self.requestFriendshipAction ~= nil then
		var1.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.requestFriendshipAction)
		}
	end
	if self.refresh_developer_products_action ~= nil then
		var1.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refresh_developer_products_action)
		}
	end
	if self.refreshDeveloperProductsAction ~= nil then
		var1.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refreshDeveloperProductsAction)
		}
	end
	if self.open_fae_trial_upsell_action ~= nil then
		var1.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.open_fae_trial_upsell_action)
		}
	end
	if self.openFaeTrialUpsellAction ~= nil then
		var1.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.openFaeTrialUpsellAction)
		}
	end
	if self.refresh_omni_recommendation_feed_item_action ~= nil then
		var1.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refresh_omni_recommendation_feed_item_action)
		}
	end
	if self.refreshOmniRecommendationFeedItemAction ~= nil then
		var1.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refreshOmniRecommendationFeedItemAction)
		}
	end
	if self.ai_overview_feedback_action ~= nil then
		var1.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.ai_overview_feedback_action)
		}
	end
	if self.aiOverviewFeedbackAction ~= nil then
		var1.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.aiOverviewFeedbackAction)
		}
	end
	if self.open_trusted_friends_upsell_modal_action ~= nil then
		var1.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.open_trusted_friends_upsell_modal_action)
		}
	end
	if self.openTrustedFriendsUpsellModalAction ~= nil then
		var1.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.openTrustedFriendsUpsellModalAction)
		}
	end
	if self.record_party_chat_conversation_upsell_acknowledgement_action ~= nil then
		var1.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.record_party_chat_conversation_upsell_acknowledgement_action)
		}
	end
	if self.recordPartyChatConversationUpsellAcknowledgementAction ~= nil then
		var1.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.recordPartyChatConversationUpsellAcknowledgementAction)
		}
	end
	if self.open_search_results_with_query_action ~= nil then
		var1.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.open_search_results_with_query_action)
		}
	end
	if self.openSearchResultsWithQueryAction ~= nil then
		var1.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.openSearchResultsWithQueryAction)
		}
	end
	if self.select_marketplace_favorites_category ~= nil then
		var1.kind = {
			type = "select_marketplace_favorites_category",
			value = t.SelectMarketplaceFavoritesCategory.jsonDecode(self.select_marketplace_favorites_category)
		}
	end
	if self.selectMarketplaceFavoritesCategory ~= nil then
		var1.kind = {
			type = "select_marketplace_favorites_category",
			value = t.SelectMarketplaceFavoritesCategory.jsonDecode(self.selectMarketplaceFavoritesCategory)
		}
	end
	if self.download_app_action ~= nil then
		var1.kind = {
			type = "download_app_action",
			value = t.DownloadAppAction.jsonDecode(self.download_app_action)
		}
	end
	if self.downloadAppAction ~= nil then
		var1.kind = {
			type = "download_app_action",
			value = t.DownloadAppAction.jsonDecode(self.downloadAppAction)
		}
	end
	if self.refresh_charts_sort_detail_action ~= nil then
		var1.kind = {
			type = "refresh_charts_sort_detail_action",
			value = t.RefreshChartsSortDetailAction.jsonDecode(self.refresh_charts_sort_detail_action)
		}
	end
	if self.refreshChartsSortDetailAction ~= nil then
		var1.kind = {
			type = "refresh_charts_sort_detail_action",
			value = t.RefreshChartsSortDetailAction.jsonDecode(self.refreshChartsSortDetailAction)
		}
	end
	if self.join_community_action ~= nil then
		var1.kind = {
			type = "join_community_action",
			value = t.JoinCommunityAction.jsonDecode(self.join_community_action)
		}
	end
	if self.joinCommunityAction ~= nil then
		var1.kind = {
			type = "join_community_action",
			value = t.JoinCommunityAction.jsonDecode(self.joinCommunityAction)
		}
	end
	if self.view_community_action ~= nil then
		var1.kind = {
			type = "view_community_action",
			value = t.ViewCommunityAction.jsonDecode(self.view_community_action)
		}
	end
	if self.viewCommunityAction ~= nil then
		var1.kind = {
			type = "view_community_action",
			value = t.ViewCommunityAction.jsonDecode(self.viewCommunityAction)
		}
	end
	if self.pin_experience_shortcut_action ~= nil then
		var1.kind = {
			type = "pin_experience_shortcut_action",
			value = t.PinExperienceShortcutAction.jsonDecode(self.pin_experience_shortcut_action)
		}
	end
	if self.pinExperienceShortcutAction ~= nil then
		var1.kind = {
			type = "pin_experience_shortcut_action",
			value = t.PinExperienceShortcutAction.jsonDecode(self.pinExperienceShortcutAction)
		}
	end
	if self.select_marketplace_favorites_subcategory ~= nil then
		var1.kind = {
			type = "select_marketplace_favorites_subcategory",
			value = t.SelectMarketplaceFavoritesSubcategory.jsonDecode(self.select_marketplace_favorites_subcategory)
		}
	end
	if self.selectMarketplaceFavoritesSubcategory ~= nil then
		var1.kind = {
			type = "select_marketplace_favorites_subcategory",
			value = t.SelectMarketplaceFavoritesSubcategory.jsonDecode(self.selectMarketplaceFavoritesSubcategory)
		}
	end
	if self.show_toast_action ~= nil then
		var1.kind = {
			type = "show_toast_action",
			value = t.ShowToastAction.jsonDecode(self.show_toast_action)
		}
	end
	if self.showToastAction ~= nil then
		var1.kind = {
			type = "show_toast_action",
			value = t.ShowToastAction.jsonDecode(self.showToastAction)
		}
	end
	if self.open_incoming_transfer_upsell_action ~= nil then
		var1.kind = {
			type = "open_incoming_transfer_upsell_action",
			value = t.OpenIncomingTransferUpsellAction.jsonDecode(self.open_incoming_transfer_upsell_action)
		}
	end
	if self.openIncomingTransferUpsellAction ~= nil then
		var1.kind = {
			type = "open_incoming_transfer_upsell_action",
			value = t.OpenIncomingTransferUpsellAction.jsonDecode(self.openIncomingTransferUpsellAction)
		}
	end
	if self.action_sequence_action ~= nil then
		var1.kind = {
			type = "action_sequence_action",
			value = t.ActionSequenceAction.jsonDecode(self.action_sequence_action)
		}
	end
	if self.actionSequenceAction ~= nil then
		var1.kind = {
			type = "action_sequence_action",
			value = t.ActionSequenceAction.jsonDecode(self.actionSequenceAction)
		}
	end
	if self.refresh_feed_entry_from_api_action ~= nil then
		var1.kind = {
			type = "refresh_feed_entry_from_api_action",
			value = t.RefreshFeedEntryFromApiAction.jsonDecode(self.refresh_feed_entry_from_api_action)
		}
	end
	if self.refreshFeedEntryFromApiAction ~= nil then
		var1.kind = {
			type = "refresh_feed_entry_from_api_action",
			value = t.RefreshFeedEntryFromApiAction.jsonDecode(self.refreshFeedEntryFromApiAction)
		}
	end
	if self.open_profile_frames_editor_action ~= nil then
		var1.kind = {
			type = "open_profile_frames_editor_action",
			value = t.OpenProfileFramesEditorAction.jsonDecode(self.open_profile_frames_editor_action)
		}
	end
	if self.openProfileFramesEditorAction ~= nil then
		var1.kind = {
			type = "open_profile_frames_editor_action",
			value = t.OpenProfileFramesEditorAction.jsonDecode(self.openProfileFramesEditorAction)
		}
	end
	if self.navigate_action ~= nil then
		var1.kind = {
			type = "navigate_action",
			value = t.NavigateAction.jsonDecode(self.navigate_action)
		}
	end
	if self.navigateAction ~= nil then
		var1.kind = {
			type = "navigate_action",
			value = t.NavigateAction.jsonDecode(self.navigateAction)
		}
	end
	if self.telemetry_handler ~= nil then
		var1.telemetry_handler = propTypesModule.StringProp.jsonDecode(self.telemetry_handler)
	end
	if self.telemetryHandler ~= nil then
		var1.telemetry_handler = propTypesModule.StringProp.jsonDecode(self.telemetryHandler)
	end
	if self.accessibility_label ~= nil then
		var1.accessibility_label = propTypesModule.StringFormat.jsonDecode(self.accessibility_label)
	end
	if self.accessibilityLabel ~= nil then
		var1.accessibility_label = propTypesModule.StringFormat.jsonDecode(self.accessibilityLabel)
	end
	if self.skip_unified_logging ~= nil then
		var1.skip_unified_logging = propTypesModule.BoolProp.jsonDecode(self.skip_unified_logging)
	end
	if self.skipUnifiedLogging ~= nil then
		var1.skip_unified_logging = propTypesModule.BoolProp.jsonDecode(self.skipUnifiedLogging)
	end
	if self.action_event_name ~= nil then
		var1.action_event_name = propTypesModule.StringProp.jsonDecode(self.action_event_name)
	end
	if self.actionEventName ~= nil then
		var1.action_event_name = propTypesModule.StringProp.jsonDecode(self.actionEventName)
	end
	return var1
end

t_170.descriptor = {
	name = "Action",
	fullName = "roblox.apppageplatform.shared.v1beta1.Action"
}
t.Action = t_170
typeRegistryModule.default:register(t.Action)
local t_171 = {}
t_171.__index = t_171

function t_171.new(p1)
	-- upvalues: t_171 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_171)
end

function t_171:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "value" then
			local var2 = self.kind.value:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var6065 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		elseif self.kind.type == "conditional" then
			local var5 = self.kind.value:encode()
			local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var6, var6068 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
			buff = var6
			var1 = var7
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_171.decode(p1)
	-- upvalues: t_171 (ref), protoModule (ref), t (ref)
	local var1 = t_171.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.kind = { type = "value", value = t.Action.decode(var10) }
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = {
					type = "conditional",
					value = t.ActionProp_ConditionalOptions.decode(var12)
				}
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var6072)
		end
	end
	return var1
end

function t_171:jsonEncode()
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

function t_171:jsonDecode()
	-- upvalues: t_171 (ref), t (ref)
	local var1 = t_171.new()
	
	if self.value ~= nil then
		var1.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	if self.conditional ~= nil then
		var1.kind = {
			type = "conditional",
			value = t.ActionProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var1
end

t_171.descriptor = {
	name = "ActionProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionProp"
}
t.ActionProp = t_171
typeRegistryModule.default:register(t.ActionProp)
local t_172 = {}
t_172.__index = t_172

function t_172.new(p1)
	-- upvalues: t_172 (ref)
	return setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_172)
end

function t_172:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.condition ~= nil then
		local var2 = self.condition:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var6095 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.kind ~= nil and self.kind.type == "value" then
		local var5 = self.kind.value:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var6098 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_172.decode(p1)
	-- upvalues: t_172 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var1 = t_172.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.condition = propConditionModule.PropCondition.decode(var10)
			elseif var7 == 3 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = { type = "value", value = t.Action.decode(var12) }
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var6102)
		end
	end
	return var1
end

function t_172:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "value" then
		t.value = self.kind.value:jsonEncode()
	end
	return t
end

function t_172:jsonDecode()
	-- upvalues: t_172 (ref), propConditionModule (ref), t (ref)
	local var1 = t_172.new()
	
	if self.condition ~= nil then
		var1.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.value ~= nil then
		var1.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	return var1
end

t_172.descriptor = {
	name = "ActionProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ActionProp_ConditionalOption = t_172
typeRegistryModule.default:register(t.ActionProp_ConditionalOption)
local t_173 = {}
t_173.__index = t_173

function t_173.new(p1)
	-- upvalues: t_173 (ref)
	return setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, t_173)
end

function t_173:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var6125 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_173.decode(p1)
	-- upvalues: t_173 (ref), protoModule (ref), t (ref)
	local var1 = t_173.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				table.insert(var1.options, t.ActionProp_ConditionalOption.decode(var10))
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var6129)
		end
	end
	return var1
end

function t_173:jsonEncode()
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

function t_173:jsonDecode()
	-- upvalues: t_173 (ref), t (ref)
	local var1 = t_173.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ActionProp_ConditionalOption.jsonDecode(v))
		end
		var1.options = t_1
	end
	return var1
end

t_173.descriptor = {
	name = "ActionProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ActionProp_ConditionalOptions = t_173
typeRegistryModule.default:register(t.ActionProp_ConditionalOptions)
local t_174 = {}
t_174.__index = t_174

function t_174.new(p1)
	-- upvalues: t_174 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_174)
end

function t_174:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2 = self.kind.value:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var6152 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		elseif self.kind.type == "conditional" then
			local var5 = self.kind.value:encode()
			local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var6, var6155 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
			buff = var6
			var1 = var7
		elseif self.kind.type == "binding_path" then
			local var8, var9 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var8, var6157 = protoModule.writeString(var8, var9, self.kind.value)
			buff = var8
			var1 = var9
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_174.decode(p1)
	-- upvalues: t_174 (ref), protoModule (ref), t (ref)
	local var1 = t_174.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(var10)
				}
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = {
					type = "conditional",
					value = t.FocusNavActionsProp_ConditionalOptions.decode(var12)
				}
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.kind = { type = "binding_path", value = buffer.tostring(var14) }
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var6161)
		end
	end
	return var1
end

function t_174:jsonEncode()
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

function t_174:jsonDecode()
	-- upvalues: t_174 (ref), t (ref)
	local var1 = t_174.new()
	
	if self.literal ~= nil then
		var1.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
		}
	end
	if self.conditional ~= nil then
		var1.kind = {
			type = "conditional",
			value = t.FocusNavActionsProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1
end

t_174.descriptor = {
	name = "FocusNavActionsProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavActionsProp"
}
t.FocusNavActionsProp = t_174
typeRegistryModule.default:register(t.FocusNavActionsProp)
local t_175 = {}
t_175.__index = t_175

function t_175.new(p1)
	-- upvalues: t_175 (ref)
	return setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_175)
end

function t_175:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.condition ~= nil then
		local var2 = self.condition:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var6186 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var5 = self.kind.value:encode()
			local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var6, var6189 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
			buff = var6
			var1 = var7
		elseif self.kind.type == "binding_path" then
			local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var8, var6191 = protoModule.writeString(var8, var9, self.kind.value)
			buff = var8
			var1 = var9
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_175.decode(p1)
	-- upvalues: t_175 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var1 = t_175.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.condition = propConditionModule.PropCondition.decode(var10)
			elseif var7 == 3 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(var12)
				}
			elseif var7 == 4 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.kind = { type = "binding_path", value = buffer.tostring(var14) }
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var6195)
		end
	end
	return var1
end

function t_175:jsonEncode()
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

function t_175:jsonDecode()
	-- upvalues: t_175 (ref), propConditionModule (ref), t (ref)
	local var1 = t_175.new()
	
	if self.condition ~= nil then
		var1.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var1.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1
end

t_175.descriptor = {
	name = "FocusNavActionsProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FocusNavActionsProp_ConditionalOption = t_175
typeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOption)
local t_176 = {}
t_176.__index = t_176

function t_176.new(p1)
	-- upvalues: t_176 (ref)
	return setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, t_176)
end

function t_176:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var6220 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_176.decode(p1)
	-- upvalues: t_176 (ref), protoModule (ref), t (ref)
	local var1 = t_176.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				table.insert(var1.options, t.FocusNavActionsProp_ConditionalOption.decode(var10))
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var6224)
		end
	end
	return var1
end

function t_176:jsonEncode()
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

function t_176:jsonDecode()
	-- upvalues: t_176 (ref), t (ref)
	local var1 = t_176.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FocusNavActionsProp_ConditionalOption.jsonDecode(v))
		end
		var1.options = t_1
	end
	return var1
end

t_176.descriptor = {
	name = "FocusNavActionsProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FocusNavActionsProp_ConditionalOptions = t_176
typeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOptions)
local t_177 = {}
t_177.__index = t_177

function t_177.new(p1)
	-- upvalues: t_177 (ref)
	return setmetatable({
		keys = if p1 == nil or p1.keys == nil then {} else p1.keys,
		events = if p1 == nil or p1.events == nil then {} else p1.events
	}, t_177)
end

function t_177:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.keys ~= nil and next(self.keys) ~= nil then
		for i, v in self.keys do
			local var2, var3 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2, var6246 = protoModule.writeString(var2, var3, i)
			local var4 = v:encode()
			var3, var6248 = protoModule.writeTag(var2, var3, 2, protoModule.wireTypes.lengthDelimited)
			var3, var6248 = protoModule.writeBuffer(var3, var6248, var4, buffer.len(var4))
			local var5 = var3
			local var6 = var6248
			local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var7, var6252 = protoModule.writeBuffer(var7, var8, var5, var6)
			buff = var7
			var1 = var8
		end
	end
	if self.events ~= nil and next(self.events) ~= nil then
		for i, v in self.events do
			local var9, var10 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var9, var6254 = protoModule.writeString(var9, var10, i)
			local var11 = v:encode()
			var10, var6256 = protoModule.writeTag(var9, var10, 2, protoModule.wireTypes.lengthDelimited)
			var10, var6256 = protoModule.writeBuffer(var10, var6256, var11, buffer.len(var11))
			local var12 = var10
			local var13 = var6256
			local var14, var15 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var14, var6260 = protoModule.writeBuffer(var14, var15, var12, var13)
			buff = var14
			var1 = var15
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_177.decode(p1)
	-- upvalues: t_177 (ref), protoModule (ref), t (ref), propTypesEngineModule (ref)
	local var1 = t_177.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 3 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var10 = t.FocusNavActionsProp_FocusNavData_KeysEntry.decode(var10)
				var1.keys[var10.key or ""] = var10.value or propTypesEngineModule.KeyCodeProp.new()
			elseif var7 == 4 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var12 = t.FocusNavActionsProp_FocusNavData_EventsEntry.decode(var12)
				var1.events[var12.key or ""] = var12.value or t.ActionProp.new()
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var6264)
		end
	end
	return var1
end

function t_177:jsonEncode()
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

function t_177:jsonDecode()
	-- upvalues: t_177 (ref), propTypesEngineModule (ref), t (ref)
	local var1 = t_177.new()
	
	if self.keys ~= nil then
		local t_1 = {}
		
		for i, v in self.keys do
			t_1[i] = propTypesEngineModule.KeyCodeProp.jsonDecode(v)
		end
		var1.keys = t_1
	end
	if self.events ~= nil then
		local t_1 = {}
		
		for i, v in self.events do
			t_1[i] = t.ActionProp.jsonDecode(v)
		end
		var1.events = t_1
	end
	return var1
end

t_177.descriptor = {
	name = "FocusNavActionsProp_FocusNavData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavData"
}
t.FocusNavActionsProp_FocusNavData = t_177
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData)
local t_178 = {}
t_178.__index = t_178

function t_178.new(p1)
	-- upvalues: t_178 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, t_178)
end

function t_178:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var6290 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil then
		local var4 = self.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var6293 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_178.decode(p1)
	-- upvalues: t_178 (ref), protoModule (ref), propTypesEngineModule (ref)
	local var1 = t_178.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = propTypesEngineModule.KeyCodeProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var6297)
		end
	end
	return var1
end

function t_178:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_178:jsonDecode()
	-- upvalues: t_178 (ref), propTypesEngineModule (ref)
	local var1 = t_178.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = propTypesEngineModule.KeyCodeProp.jsonDecode(self.value)
	end
	return var1
end

t_178.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_KeysEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.KeysEntry"
}
t.FocusNavActionsProp_FocusNavData_KeysEntry = t_178
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_KeysEntry)
local t_179 = {}
t_179.__index = t_179

function t_179.new(p1)
	-- upvalues: t_179 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, t_179)
end

function t_179:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var6319 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil then
		local var4 = self.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var6322 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_179.decode(p1)
	-- upvalues: t_179 (ref), protoModule (ref), t (ref)
	local var1 = t_179.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = t.ActionProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var6326)
		end
	end
	return var1
end

function t_179:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_179:jsonDecode()
	-- upvalues: t_179 (ref), t (ref)
	local var1 = t_179.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = t.ActionProp.jsonDecode(self.value)
	end
	return var1
end

t_179.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_EventsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsEntry"
}
t.FocusNavActionsProp_FocusNavData_EventsEntry = t_179
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_EventsEntry)
t.ActionType = {
	fromNumber = function(p1)
		return if p1 == 0 then "ACTION_TYPE_INVALID" elseif p1 == 1 then "ACTION_TYPE_DISMISS_DIALOG" elseif p1 == 2 then "ACTION_TYPE_LINK" elseif p1 == 3 then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p1 == 4 then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p1 == 5 then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p1 == 6 then "ACTION_TYPE_OPEN_SEE_ALL" elseif p1 == 7 then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p1 == 8 then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p1 == 9 then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p1 == 10 then "ACTION_TYPE_OPEN_TOOLTIP" elseif p1 == 11 then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p1 == 12 then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p1 == 13 then "ACTION_TYPE_SHARE" elseif p1 == 14 then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p1 == 15 then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p1 == 16 then "ACTION_TYPE_OPEN_PROFILE" elseif p1 == 17 then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p1 == 18 then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p1 == 19 then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p1 == 20 then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p1 == 21 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p1 == 22 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p1 == 23 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p1 == 24 then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p1 == 25 then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p1 == 26 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p1 == 27 then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p1 == 28 then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p1 == 29 then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p1 == 30 then "ACTION_TYPE_REFRESH_FROM_API" elseif p1 == 31 then "ACTION_TYPE_RSVP_TO_EVENT" elseif p1 == 32 then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p1 == 33 then "ACTION_TYPE_ANALYTICS_EVENT" elseif p1 == 34 then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p1 == 35 then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p1 == 36 then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p1 == 37 then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p1 == 38 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p1 == 39 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p1 == 40 then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p1 == 41 then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p1 == 42 then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p1 == 43 then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p1 == 44 then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p1 == 45 then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p1 == 46 then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p1 == 47 then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p1 == 48 then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p1 == 49 then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p1 == 50 then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p1 == 51 then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p1 == 52 then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p1 == 53 then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p1 == 54 then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p1 == 55 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p1 == 56 then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p1 == 57 then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p1 == 58 then "ACTION_TYPE_DISMISS_PROMPT" elseif p1 == 59 then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p1 == 60 then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p1 == 61 then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p1 == 62 then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p1 == 63 then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p1 == 64 then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p1 == 65 then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p1 == 66 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" elseif p1 == 67 then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" elseif p1 == 68 then "ACTION_TYPE_DOWNLOAD_APP" elseif p1 == 69 then "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" elseif p1 == 70 then "ACTION_TYPE_JOIN_COMMUNITY" elseif p1 == 71 then "ACTION_TYPE_VIEW_COMMUNITY" elseif p1 == 72 then "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" elseif p1 == 73 then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" elseif p1 == 74 then "ACTION_TYPE_SHOW_TOAST" elseif p1 == 75 then "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" elseif p1 == 76 then "ACTION_TYPE_ACTION_SEQUENCE" elseif p1 == 77 then "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" elseif p1 == 78 then "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" elseif p1 == 79 then "ACTION_TYPE_NAVIGATE" else nil
	end,
	toNumber = function(p1)
		return if p1 == "ACTION_TYPE_INVALID" then 0 elseif p1 == "ACTION_TYPE_DISMISS_DIALOG" then 1 elseif p1 == "ACTION_TYPE_LINK" then 2 elseif p1 == "ACTION_TYPE_OPEN_GAME_DETAILS" then 3 elseif p1 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then 4 elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then 5 elseif p1 == "ACTION_TYPE_OPEN_SEE_ALL" then 6 elseif p1 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then 7 elseif p1 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then 8 elseif p1 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then 9 elseif p1 == "ACTION_TYPE_OPEN_TOOLTIP" then 10 elseif p1 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then 11 elseif p1 == "ACTION_TYPE_LOAD_MORE_FROM_API" then 12 elseif p1 == "ACTION_TYPE_SHARE" then 13 elseif p1 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then 14 elseif p1 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then 15 elseif p1 == "ACTION_TYPE_OPEN_PROFILE" then 16 elseif p1 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then 17 elseif p1 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then 18 elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE" then 19 elseif p1 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then 20 elseif p1 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then 21 elseif p1 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then 22 elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then 23 elseif p1 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then 24 elseif p1 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then 25 elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then 26 elseif p1 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then 27 elseif p1 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then 28 elseif p1 == "ACTION_TYPE_OPEN_SONG_DETAIL" then 29 elseif p1 == "ACTION_TYPE_REFRESH_FROM_API" then 30 elseif p1 == "ACTION_TYPE_RSVP_TO_EVENT" then 31 elseif p1 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then 32 elseif p1 == "ACTION_TYPE_ANALYTICS_EVENT" then 33 elseif p1 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then 34 elseif p1 == "ACTION_TYPE_OPEN_GAME_INVITE" then 35 elseif p1 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then 36 elseif p1 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then 37 elseif p1 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then 38 elseif p1 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then 39 elseif p1 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then 40 elseif p1 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then 41 elseif p1 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then 42 elseif p1 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then 43 elseif p1 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then 44 elseif p1 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then 45 elseif p1 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then 46 elseif p1 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then 47 elseif p1 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then 48 elseif p1 == "ACTION_TYPE_OPEN_AMP_WIZARD" then 49 elseif p1 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then 50 elseif p1 == "ACTION_TYPE_REFRESH_GAME_PASSES" then 51 elseif p1 == "ACTION_TYPE_REFRESH_PLAYABILITY" then 52 elseif p1 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then 53 elseif p1 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then 54 elseif p1 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then 55 elseif p1 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then 56 elseif p1 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then 57 elseif p1 == "ACTION_TYPE_DISMISS_PROMPT" then 58 elseif p1 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then 59 elseif p1 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then 60 elseif p1 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then 61 elseif p1 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then 62 elseif p1 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then 63 elseif p1 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then 64 elseif p1 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then 65 elseif p1 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then 66 elseif p1 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" then 67 elseif p1 == "ACTION_TYPE_DOWNLOAD_APP" then 68 elseif p1 == "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" then 69 elseif p1 == "ACTION_TYPE_JOIN_COMMUNITY" then 70 elseif p1 == "ACTION_TYPE_VIEW_COMMUNITY" then 71 elseif p1 == "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" then 72 elseif p1 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" then 73 elseif p1 == "ACTION_TYPE_SHOW_TOAST" then 74 elseif p1 == "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" then 75 elseif p1 == "ACTION_TYPE_ACTION_SEQUENCE" then 76 elseif p1 == "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" then 77 elseif p1 == "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" then 78 elseif p1 == "ACTION_TYPE_NAVIGATE" then 79 else p1
	end,
	fromName = function(p1)
		return if p1 == "ACTION_TYPE_INVALID" then "ACTION_TYPE_INVALID" elseif p1 == "ACTION_TYPE_DISMISS_DIALOG" then "ACTION_TYPE_DISMISS_DIALOG" elseif p1 == "ACTION_TYPE_LINK" then "ACTION_TYPE_LINK" elseif p1 == "ACTION_TYPE_OPEN_GAME_DETAILS" then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p1 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p1 == "ACTION_TYPE_OPEN_SEE_ALL" then "ACTION_TYPE_OPEN_SEE_ALL" elseif p1 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p1 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p1 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p1 == "ACTION_TYPE_OPEN_TOOLTIP" then "ACTION_TYPE_OPEN_TOOLTIP" elseif p1 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p1 == "ACTION_TYPE_LOAD_MORE_FROM_API" then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p1 == "ACTION_TYPE_SHARE" then "ACTION_TYPE_SHARE" elseif p1 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p1 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p1 == "ACTION_TYPE_OPEN_PROFILE" then "ACTION_TYPE_OPEN_PROFILE" elseif p1 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p1 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE" then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p1 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p1 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p1 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p1 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p1 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p1 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p1 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p1 == "ACTION_TYPE_OPEN_SONG_DETAIL" then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p1 == "ACTION_TYPE_REFRESH_FROM_API" then "ACTION_TYPE_REFRESH_FROM_API" elseif p1 == "ACTION_TYPE_RSVP_TO_EVENT" then "ACTION_TYPE_RSVP_TO_EVENT" elseif p1 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p1 == "ACTION_TYPE_ANALYTICS_EVENT" then "ACTION_TYPE_ANALYTICS_EVENT" elseif p1 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p1 == "ACTION_TYPE_OPEN_GAME_INVITE" then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p1 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p1 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p1 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p1 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p1 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p1 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p1 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p1 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p1 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p1 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p1 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p1 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p1 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p1 == "ACTION_TYPE_OPEN_AMP_WIZARD" then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p1 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p1 == "ACTION_TYPE_REFRESH_GAME_PASSES" then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p1 == "ACTION_TYPE_REFRESH_PLAYABILITY" then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p1 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p1 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p1 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p1 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p1 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p1 == "ACTION_TYPE_DISMISS_PROMPT" then "ACTION_TYPE_DISMISS_PROMPT" elseif p1 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p1 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p1 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p1 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p1 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p1 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p1 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p1 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" elseif p1 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" elseif p1 == "ACTION_TYPE_DOWNLOAD_APP" then "ACTION_TYPE_DOWNLOAD_APP" elseif p1 == "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" then "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" elseif p1 == "ACTION_TYPE_JOIN_COMMUNITY" then "ACTION_TYPE_JOIN_COMMUNITY" elseif p1 == "ACTION_TYPE_VIEW_COMMUNITY" then "ACTION_TYPE_VIEW_COMMUNITY" elseif p1 == "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" then "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" elseif p1 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" elseif p1 == "ACTION_TYPE_SHOW_TOAST" then "ACTION_TYPE_SHOW_TOAST" elseif p1 == "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" then "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" elseif p1 == "ACTION_TYPE_ACTION_SEQUENCE" then "ACTION_TYPE_ACTION_SEQUENCE" elseif p1 == "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" then "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" elseif p1 == "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" then "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" elseif p1 == "ACTION_TYPE_NAVIGATE" then "ACTION_TYPE_NAVIGATE" else nil
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
	NavigateAction = t.NavigateAction,
	NavigateAction_Params = t.NavigateAction_Params,
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