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
	local var21 = t_1.new()
	
	if self.action_type ~= nil then
		var21.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var21.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var21.action_params = t.DismissDialogAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var21.action_params = t.DismissDialogAction_Params.jsonDecode(self.actionParams)
	end
	return var21
end

t_1.descriptor = {
	name = "DismissDialogAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissDialogAction"
}
t.DismissDialogAction = t_1
typeRegistryModule.default:register(t.DismissDialogAction)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		dialog_type = if p2 == nil or p2.dialog_type == nil then nil else p2.dialog_type
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var21 = 0
	
	if self.dialog_type ~= nil then
		local var22 = self.dialog_type:encode()
		local var23, var24 = protoModule.writeTag(buff, var21, 1, protoModule.wireTypes.lengthDelimited)
		var23, var220 = protoModule.writeBuffer(var23, var24, var22, buffer.len(var22))
		buff = var23
		var21 = var24
	end
	local buff_1 = buffer.create(var21)
	buffer.copy(buff_1, 0, buff, 0, var21)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), propTypesModule (ref)
	local var21 = t_2.new()
	local var22 = 0
	while var22 < buffer.len(p2) do
		local _ = nil
		local var23 = nil
		local var24, var25, var26 = protoModule.readTag(p2, var22)
		local var27 = var24
		var23 = var25
		var22 = var26
		
		if var23 == protoModule.wireTypes.varint then
			local _ = nil
			local var28, var29 = protoModule.readVarInt(p2, var22)
			local _ = var28
			var22 = var29
			continue
		end
		if var23 == protoModule.wireTypes.lengthDelimited then
			if var27 == 1 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p2, var22)
				var22 = var31
				var21.dialog_type = propTypesModule.StringProp.decode(var30)
			else
				local _ = nil
				local var32, var33 = protoModule.readVarInt(p2, var22)
				var22 = var33 + var32
			end
		elseif var23 == protoModule.wireTypes.i32 then
			local _ = nil
			local var34, var35 = protoModule.readFixed32(p2, var22)
			local _ = var34
			var22 = var35
		elseif var23 == protoModule.wireTypes.i64 then
			local _ = nil
			local var36, var37 = protoModule.readFixed64(p2, var22)
			local _ = var36
			var22 = var37
		else
			error("Unsupported wire type: " .. var224)
		end
	end
	return var21
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
	local var38 = t_2.new()
	
	if self.dialog_type ~= nil then
		var38.dialog_type = propTypesModule.StringProp.jsonDecode(self.dialog_type)
	end
	if self.dialogType ~= nil then
		var38.dialog_type = propTypesModule.StringProp.jsonDecode(self.dialogType)
	end
	return var38
end

t_2.descriptor = {
	name = "DismissDialogAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissDialogAction_Params = t_2
typeRegistryModule.default:register(t.DismissDialogAction_Params)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t (ref), t_3 (ref)
	return setmetatable({
		action_type = if p3 == nil or p3.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p3.action_type,
		action_params = if p3 == nil or p3.action_params == nil then nil else p3.action_params
	}, t_3)
end

function t_3:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var38 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var39, var40 = protoModule.writeTag(buff, var38, 1, protoModule.wireTypes.varint)
		var39, var244 = protoModule.writeVarInt(var39, var40, t.ActionType.toNumber(self.action_type))
		buff = var39
		var38 = var40
	end
	if self.action_params ~= nil then
		local var41 = self.action_params:encode()
		local var42, var43 = protoModule.writeTag(buff, var38, 2, protoModule.wireTypes.lengthDelimited)
		var42, var247 = protoModule.writeBuffer(var42, var43, var41, buffer.len(var41))
		buff = var42
		var38 = var43
	end
	local buff_1 = buffer.create(var38)
	buffer.copy(buff_1, 0, buff, 0, var38)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var38 = t_3.new()
	local var39 = 0
	while var39 < buffer.len(p3) do
		local _ = nil
		local var40 = nil
		local var41, var42, var43 = protoModule.readTag(p3, var39)
		local var44 = var41
		var40 = var42
		var39 = var43
		
		if var40 == protoModule.wireTypes.varint then
			if var44 == 1 then
				local _ = nil
				local var45, var46 = protoModule.readVarIntI32(p3, var39)
				local var47 = var45
				var39 = var46
				var38.action_type = t.ActionType.fromNumber(var47) or var47
			else
				local _ = nil
				local var48, var49 = protoModule.readVarInt(p3, var39)
				local _ = var48
				var39 = var49
			end
		end
		if var40 == protoModule.wireTypes.lengthDelimited then
			if var44 == 2 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p3, var39)
				var39 = var51
				var38.action_params = t.LinkAction_Params.decode(var50)
			else
				local _ = nil
				local var52, var53 = protoModule.readVarInt(p3, var39)
				var39 = var53 + var52
			end
		elseif var40 == protoModule.wireTypes.i32 then
			local _ = nil
			local var54, var55 = protoModule.readFixed32(p3, var39)
			local _ = var54
			var39 = var55
		elseif var40 == protoModule.wireTypes.i64 then
			local _ = nil
			local var56, var57 = protoModule.readFixed64(p3, var39)
			local _ = var56
			var39 = var57
		else
			error("Unsupported wire type: " .. var251)
		end
	end
	return var38
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
	local var58 = t_3.new()
	
	if self.action_type ~= nil then
		var58.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var58.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var58.action_params = t.LinkAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var58.action_params = t.LinkAction_Params.jsonDecode(self.actionParams)
	end
	return var58
end

t_3.descriptor = {
	name = "LinkAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LinkAction"
}
t.LinkAction = t_3
typeRegistryModule.default:register(t.LinkAction)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		url = if p4 == nil or p4.url == nil then nil else p4.url,
		title_key = if p4 == nil or p4.title_key == nil then nil else p4.title_key,
		on_webview_close = if p4 == nil or p4.on_webview_close == nil then nil else p4.on_webview_close
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var58 = 0
	
	if self.url ~= nil then
		local var59 = self.url:encode()
		local var60, var61 = protoModule.writeTag(buff, var58, 1, protoModule.wireTypes.lengthDelimited)
		var60, var275 = protoModule.writeBuffer(var60, var61, var59, buffer.len(var59))
		buff = var60
		var58 = var61
	end
	if self.title_key ~= nil then
		local var62 = self.title_key:encode()
		local var63, var64 = protoModule.writeTag(buff, var58, 2, protoModule.wireTypes.lengthDelimited)
		var63, var278 = protoModule.writeBuffer(var63, var64, var62, buffer.len(var62))
		buff = var63
		var58 = var64
	end
	if self.on_webview_close ~= nil then
		local var65 = self.on_webview_close:encode()
		local var66, var67 = protoModule.writeTag(buff, var58, 4, protoModule.wireTypes.lengthDelimited)
		var66, var281 = protoModule.writeBuffer(var66, var67, var65, buffer.len(var65))
		buff = var66
		var58 = var67
	end
	local buff_1 = buffer.create(var58)
	buffer.copy(buff_1, 0, buff, 0, var58)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var58 = t_4.new()
	local var59 = 0
	while var59 < buffer.len(p4) do
		local _ = nil
		local var60 = nil
		local var61, var62, var63 = protoModule.readTag(p4, var59)
		local var64 = var61
		var60 = var62
		var59 = var63
		
		if var60 == protoModule.wireTypes.varint then
			local _ = nil
			local var65, var66 = protoModule.readVarInt(p4, var59)
			local _ = var65
			var59 = var66
			continue
		end
		if var60 == protoModule.wireTypes.lengthDelimited then
			if var64 == 1 then
				local _ = nil
				local var67, var68 = protoModule.readBuffer(p4, var59)
				var59 = var68
				var58.url = propTypesModule.StringProp.decode(var67)
			elseif var64 == 2 then
				local _ = nil
				local var69, var70 = protoModule.readBuffer(p4, var59)
				var59 = var70
				var58.title_key = propTypesModule.StringProp.decode(var69)
			elseif var64 == 4 then
				local _ = nil
				local var71, var72 = protoModule.readBuffer(p4, var59)
				var59 = var72
				var58.on_webview_close = t.ActionProp.decode(var71)
			else
				local _ = nil
				local var73, var74 = protoModule.readVarInt(p4, var59)
				var59 = var74 + var73
			end
		elseif var60 == protoModule.wireTypes.i32 then
			local _ = nil
			local var75, var76 = protoModule.readFixed32(p4, var59)
			local _ = var75
			var59 = var76
		elseif var60 == protoModule.wireTypes.i64 then
			local _ = nil
			local var77, var78 = protoModule.readFixed64(p4, var59)
			local _ = var77
			var59 = var78
		else
			error("Unsupported wire type: " .. var285)
		end
	end
	return var58
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
	local var79 = t_4.new()
	
	if self.url ~= nil then
		var79.url = propTypesModule.StringProp.jsonDecode(self.url)
	end
	if self.title_key ~= nil then
		var79.title_key = propTypesModule.StringProp.jsonDecode(self.title_key)
	end
	if self.titleKey ~= nil then
		var79.title_key = propTypesModule.StringProp.jsonDecode(self.titleKey)
	end
	if self.on_webview_close ~= nil then
		var79.on_webview_close = t.ActionProp.jsonDecode(self.on_webview_close)
	end
	if self.onWebviewClose ~= nil then
		var79.on_webview_close = t.ActionProp.jsonDecode(self.onWebviewClose)
	end
	return var79
end

t_4.descriptor = {
	name = "LinkAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LinkAction_Params = t_4
typeRegistryModule.default:register(t.LinkAction_Params)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t (ref), t_5 (ref)
	return setmetatable({
		action_type = if p5 == nil or p5.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p5.action_type,
		action_params = if p5 == nil or p5.action_params == nil then nil else p5.action_params
	}, t_5)
end

function t_5:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var79 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var80, var81 = protoModule.writeTag(buff, var79, 1, protoModule.wireTypes.varint)
		var80, var309 = protoModule.writeVarInt(var80, var81, t.ActionType.toNumber(self.action_type))
		buff = var80
		var79 = var81
	end
	if self.action_params ~= nil then
		local var82 = self.action_params:encode()
		local var83, var84 = protoModule.writeTag(buff, var79, 2, protoModule.wireTypes.lengthDelimited)
		var83, var312 = protoModule.writeBuffer(var83, var84, var82, buffer.len(var82))
		buff = var83
		var79 = var84
	end
	local buff_1 = buffer.create(var79)
	buffer.copy(buff_1, 0, buff, 0, var79)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var79 = t_5.new()
	local var80 = 0
	while var80 < buffer.len(p5) do
		local _ = nil
		local var81 = nil
		local var82, var83, var84 = protoModule.readTag(p5, var80)
		local var85 = var82
		var81 = var83
		var80 = var84
		
		if var81 == protoModule.wireTypes.varint then
			if var85 == 1 then
				local _ = nil
				local var86, var87 = protoModule.readVarIntI32(p5, var80)
				local var88 = var86
				var80 = var87
				var79.action_type = t.ActionType.fromNumber(var88) or var88
			else
				local _ = nil
				local var89, var90 = protoModule.readVarInt(p5, var80)
				local _ = var89
				var80 = var90
			end
		end
		if var81 == protoModule.wireTypes.lengthDelimited then
			if var85 == 2 then
				local _ = nil
				local var91, var92 = protoModule.readBuffer(p5, var80)
				var80 = var92
				var79.action_params = t.OpenSocialLinkAction_Params.decode(var91)
			else
				local _ = nil
				local var93, var94 = protoModule.readVarInt(p5, var80)
				var80 = var94 + var93
			end
		elseif var81 == protoModule.wireTypes.i32 then
			local _ = nil
			local var95, var96 = protoModule.readFixed32(p5, var80)
			local _ = var95
			var80 = var96
		elseif var81 == protoModule.wireTypes.i64 then
			local _ = nil
			local var97, var98 = protoModule.readFixed64(p5, var80)
			local _ = var97
			var80 = var98
		else
			error("Unsupported wire type: " .. var316)
		end
	end
	return var79
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
	local var99 = t_5.new()
	
	if self.action_type ~= nil then
		var99.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var99.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var99.action_params = t.OpenSocialLinkAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var99.action_params = t.OpenSocialLinkAction_Params.jsonDecode(self.actionParams)
	end
	return var99
end

t_5.descriptor = {
	name = "OpenSocialLinkAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSocialLinkAction"
}
t.OpenSocialLinkAction = t_5
typeRegistryModule.default:register(t.OpenSocialLinkAction)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		assignment_id = if p6 == nil or p6.assignment_id == nil then nil else p6.assignment_id,
		assignment_type = if p6 == nil or p6.assignment_type == nil then nil else p6.assignment_type,
		social_link_type = if p6 == nil or p6.social_link_type == nil then nil else p6.social_link_type,
		social_link_url = if p6 == nil or p6.social_link_url == nil then nil else p6.social_link_url,
		social_link_display_type = if p6 == nil or p6.social_link_display_type == nil then nil else p6.social_link_display_type
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var99 = 0
	
	if self.assignment_id ~= nil then
		local var100 = self.assignment_id:encode()
		local var101, var102 = protoModule.writeTag(buff, var99, 1, protoModule.wireTypes.lengthDelimited)
		var101, var340 = protoModule.writeBuffer(var101, var102, var100, buffer.len(var100))
		buff = var101
		var99 = var102
	end
	if self.assignment_type ~= nil then
		local var103 = self.assignment_type:encode()
		local var104, var105 = protoModule.writeTag(buff, var99, 2, protoModule.wireTypes.lengthDelimited)
		var104, var343 = protoModule.writeBuffer(var104, var105, var103, buffer.len(var103))
		buff = var104
		var99 = var105
	end
	if self.social_link_type ~= nil then
		local var106 = self.social_link_type:encode()
		local var107, var108 = protoModule.writeTag(buff, var99, 3, protoModule.wireTypes.lengthDelimited)
		var107, var346 = protoModule.writeBuffer(var107, var108, var106, buffer.len(var106))
		buff = var107
		var99 = var108
	end
	if self.social_link_url ~= nil then
		local var109 = self.social_link_url:encode()
		local var110, var111 = protoModule.writeTag(buff, var99, 4, protoModule.wireTypes.lengthDelimited)
		var110, var349 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
		buff = var110
		var99 = var111
	end
	if self.social_link_display_type ~= nil then
		local var112 = self.social_link_display_type:encode()
		local var113, var114 = protoModule.writeTag(buff, var99, 5, protoModule.wireTypes.lengthDelimited)
		var113, var352 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
		buff = var113
		var99 = var114
	end
	local buff_1 = buffer.create(var99)
	buffer.copy(buff_1, 0, buff, 0, var99)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), propTypesModule (ref)
	local var99 = t_6.new()
	local var100 = 0
	while var100 < buffer.len(p6) do
		local _ = nil
		local var101 = nil
		local var102, var103, var104 = protoModule.readTag(p6, var100)
		local var105 = var102
		var101 = var103
		var100 = var104
		
		if var101 == protoModule.wireTypes.varint then
			local _ = nil
			local var106, var107 = protoModule.readVarInt(p6, var100)
			local _ = var106
			var100 = var107
			continue
		end
		if var101 == protoModule.wireTypes.lengthDelimited then
			if var105 == 1 then
				local _ = nil
				local var108, var109 = protoModule.readBuffer(p6, var100)
				var100 = var109
				var99.assignment_id = propTypesModule.StringProp.decode(var108)
			elseif var105 == 2 then
				local _ = nil
				local var110, var111 = protoModule.readBuffer(p6, var100)
				var100 = var111
				var99.assignment_type = propTypesModule.StringProp.decode(var110)
			elseif var105 == 3 then
				local _ = nil
				local var112, var113 = protoModule.readBuffer(p6, var100)
				var100 = var113
				var99.social_link_type = propTypesModule.StringProp.decode(var112)
			elseif var105 == 4 then
				local _ = nil
				local var114, var115 = protoModule.readBuffer(p6, var100)
				var100 = var115
				var99.social_link_url = propTypesModule.StringProp.decode(var114)
			elseif var105 == 5 then
				local _ = nil
				local var116, var117 = protoModule.readBuffer(p6, var100)
				var100 = var117
				var99.social_link_display_type = propTypesModule.StringProp.decode(var116)
			else
				local _ = nil
				local var118, var119 = protoModule.readVarInt(p6, var100)
				var100 = var119 + var118
			end
		elseif var101 == protoModule.wireTypes.i32 then
			local _ = nil
			local var120, var121 = protoModule.readFixed32(p6, var100)
			local _ = var120
			var100 = var121
		elseif var101 == protoModule.wireTypes.i64 then
			local _ = nil
			local var122, var123 = protoModule.readFixed64(p6, var100)
			local _ = var122
			var100 = var123
		else
			error("Unsupported wire type: " .. var356)
		end
	end
	return var99
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
	local var124 = t_6.new()
	
	if self.assignment_id ~= nil then
		var124.assignment_id = propTypesModule.StringProp.jsonDecode(self.assignment_id)
	end
	if self.assignmentId ~= nil then
		var124.assignment_id = propTypesModule.StringProp.jsonDecode(self.assignmentId)
	end
	if self.assignment_type ~= nil then
		var124.assignment_type = propTypesModule.StringProp.jsonDecode(self.assignment_type)
	end
	if self.assignmentType ~= nil then
		var124.assignment_type = propTypesModule.StringProp.jsonDecode(self.assignmentType)
	end
	if self.social_link_type ~= nil then
		var124.social_link_type = propTypesModule.StringProp.jsonDecode(self.social_link_type)
	end
	if self.socialLinkType ~= nil then
		var124.social_link_type = propTypesModule.StringProp.jsonDecode(self.socialLinkType)
	end
	if self.social_link_url ~= nil then
		var124.social_link_url = propTypesModule.StringProp.jsonDecode(self.social_link_url)
	end
	if self.socialLinkUrl ~= nil then
		var124.social_link_url = propTypesModule.StringProp.jsonDecode(self.socialLinkUrl)
	end
	if self.social_link_display_type ~= nil then
		var124.social_link_display_type = propTypesModule.StringProp.jsonDecode(self.social_link_display_type)
	end
	if self.socialLinkDisplayType ~= nil then
		var124.social_link_display_type = propTypesModule.StringProp.jsonDecode(self.socialLinkDisplayType)
	end
	return var124
end

t_6.descriptor = {
	name = "OpenSocialLinkAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSocialLinkAction_Params = t_6
typeRegistryModule.default:register(t.OpenSocialLinkAction_Params)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t (ref), t_7 (ref)
	return setmetatable({
		action_type = if p7 == nil or p7.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p7.action_type,
		action_params = if p7 == nil or p7.action_params == nil then nil else p7.action_params
	}, t_7)
end

function t_7:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var124 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var125, var126 = protoModule.writeTag(buff, var124, 1, protoModule.wireTypes.varint)
		var125, var384 = protoModule.writeVarInt(var125, var126, t.ActionType.toNumber(self.action_type))
		buff = var125
		var124 = var126
	end
	if self.action_params ~= nil then
		local var127 = self.action_params:encode()
		local var128, var129 = protoModule.writeTag(buff, var124, 2, protoModule.wireTypes.lengthDelimited)
		var128, var387 = protoModule.writeBuffer(var128, var129, var127, buffer.len(var127))
		buff = var128
		var124 = var129
	end
	local buff_1 = buffer.create(var124)
	buffer.copy(buff_1, 0, buff, 0, var124)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), t (ref)
	local var124 = t_7.new()
	local var125 = 0
	while var125 < buffer.len(p7) do
		local _ = nil
		local var126 = nil
		local var127, var128, var129 = protoModule.readTag(p7, var125)
		local var130 = var127
		var126 = var128
		var125 = var129
		
		if var126 == protoModule.wireTypes.varint then
			if var130 == 1 then
				local _ = nil
				local var131, var132 = protoModule.readVarIntI32(p7, var125)
				local var133 = var131
				var125 = var132
				var124.action_type = t.ActionType.fromNumber(var133) or var133
			else
				local _ = nil
				local var134, var135 = protoModule.readVarInt(p7, var125)
				local _ = var134
				var125 = var135
			end
		end
		if var126 == protoModule.wireTypes.lengthDelimited then
			if var130 == 2 then
				local _ = nil
				local var136, var137 = protoModule.readBuffer(p7, var125)
				var125 = var137
				var124.action_params = t.OpenGameDetailsAction_Params.decode(var136)
			else
				local _ = nil
				local var138, var139 = protoModule.readVarInt(p7, var125)
				var125 = var139 + var138
			end
		elseif var126 == protoModule.wireTypes.i32 then
			local _ = nil
			local var140, var141 = protoModule.readFixed32(p7, var125)
			local _ = var140
			var125 = var141
		elseif var126 == protoModule.wireTypes.i64 then
			local _ = nil
			local var142, var143 = protoModule.readFixed64(p7, var125)
			local _ = var142
			var125 = var143
		else
			error("Unsupported wire type: " .. var391)
		end
	end
	return var124
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
	local var144 = t_7.new()
	
	if self.action_type ~= nil then
		var144.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var144.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var144.action_params = t.OpenGameDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var144.action_params = t.OpenGameDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var144
end

t_7.descriptor = {
	name = "OpenGameDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameDetailsAction"
}
t.OpenGameDetailsAction = t_7
typeRegistryModule.default:register(t.OpenGameDetailsAction)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		place_id = if p8 == nil or p8.place_id == nil then nil else p8.place_id,
		universe_id = if p8 == nil or p8.universe_id == nil then nil else p8.universe_id,
		inherit_referral_session = if p8 == nil or p8.inherit_referral_session == nil then nil else p8.inherit_referral_session
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var144 = 0
	
	if self.place_id ~= nil then
		local var145 = self.place_id:encode()
		local var146, var147 = protoModule.writeTag(buff, var144, 1, protoModule.wireTypes.lengthDelimited)
		var146, var415 = protoModule.writeBuffer(var146, var147, var145, buffer.len(var145))
		buff = var146
		var144 = var147
	end
	if self.universe_id ~= nil then
		local var148 = self.universe_id:encode()
		local var149, var150 = protoModule.writeTag(buff, var144, 2, protoModule.wireTypes.lengthDelimited)
		var149, var418 = protoModule.writeBuffer(var149, var150, var148, buffer.len(var148))
		buff = var149
		var144 = var150
	end
	if self.inherit_referral_session ~= nil then
		local var151 = self.inherit_referral_session:encode()
		local var152, var153 = protoModule.writeTag(buff, var144, 3, protoModule.wireTypes.lengthDelimited)
		var152, var421 = protoModule.writeBuffer(var152, var153, var151, buffer.len(var151))
		buff = var152
		var144 = var153
	end
	local buff_1 = buffer.create(var144)
	buffer.copy(buff_1, 0, buff, 0, var144)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), propTypesModule (ref)
	local var144 = t_8.new()
	local var145 = 0
	while var145 < buffer.len(p8) do
		local _ = nil
		local var146 = nil
		local var147, var148, var149 = protoModule.readTag(p8, var145)
		local var150 = var147
		var146 = var148
		var145 = var149
		
		if var146 == protoModule.wireTypes.varint then
			local _ = nil
			local var151, var152 = protoModule.readVarInt(p8, var145)
			local _ = var151
			var145 = var152
			continue
		end
		if var146 == protoModule.wireTypes.lengthDelimited then
			if var150 == 1 then
				local _ = nil
				local var153, var154 = protoModule.readBuffer(p8, var145)
				var145 = var154
				var144.place_id = propTypesModule.StringProp.decode(var153)
			elseif var150 == 2 then
				local _ = nil
				local var155, var156 = protoModule.readBuffer(p8, var145)
				var145 = var156
				var144.universe_id = propTypesModule.StringProp.decode(var155)
			elseif var150 == 3 then
				local _ = nil
				local var157, var158 = protoModule.readBuffer(p8, var145)
				var145 = var158
				var144.inherit_referral_session = propTypesModule.BoolProp.decode(var157)
			else
				local _ = nil
				local var159, var160 = protoModule.readVarInt(p8, var145)
				var145 = var160 + var159
			end
		elseif var146 == protoModule.wireTypes.i32 then
			local _ = nil
			local var161, var162 = protoModule.readFixed32(p8, var145)
			local _ = var161
			var145 = var162
		elseif var146 == protoModule.wireTypes.i64 then
			local _ = nil
			local var163, var164 = protoModule.readFixed64(p8, var145)
			local _ = var163
			var145 = var164
		else
			error("Unsupported wire type: " .. var425)
		end
	end
	return var144
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
	local var165 = t_8.new()
	
	if self.place_id ~= nil then
		var165.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var165.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var165.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var165.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.inherit_referral_session ~= nil then
		var165.inherit_referral_session = propTypesModule.BoolProp.jsonDecode(self.inherit_referral_session)
	end
	if self.inheritReferralSession ~= nil then
		var165.inherit_referral_session = propTypesModule.BoolProp.jsonDecode(self.inheritReferralSession)
	end
	return var165
end

t_8.descriptor = {
	name = "OpenGameDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameDetailsAction_Params = t_8
typeRegistryModule.default:register(t.OpenGameDetailsAction_Params)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t (ref), t_9 (ref)
	return setmetatable({
		action_type = if p9 == nil or p9.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p9.action_type,
		action_params = if p9 == nil or p9.action_params == nil then nil else p9.action_params
	}, t_9)
end

function t_9:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var165 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var166, var167 = protoModule.writeTag(buff, var165, 1, protoModule.wireTypes.varint)
		var166, var449 = protoModule.writeVarInt(var166, var167, t.ActionType.toNumber(self.action_type))
		buff = var166
		var165 = var167
	end
	if self.action_params ~= nil then
		local var168 = self.action_params:encode()
		local var169, var170 = protoModule.writeTag(buff, var165, 2, protoModule.wireTypes.lengthDelimited)
		var169, var452 = protoModule.writeBuffer(var169, var170, var168, buffer.len(var168))
		buff = var169
		var165 = var170
	end
	local buff_1 = buffer.create(var165)
	buffer.copy(buff_1, 0, buff, 0, var165)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var165 = t_9.new()
	local var166 = 0
	while var166 < buffer.len(p9) do
		local _ = nil
		local var167 = nil
		local var168, var169, var170 = protoModule.readTag(p9, var166)
		local var171 = var168
		var167 = var169
		var166 = var170
		
		if var167 == protoModule.wireTypes.varint then
			if var171 == 1 then
				local _ = nil
				local var172, var173 = protoModule.readVarIntI32(p9, var166)
				local var174 = var172
				var166 = var173
				var165.action_type = t.ActionType.fromNumber(var174) or var174
			else
				local _ = nil
				local var175, var176 = protoModule.readVarInt(p9, var166)
				local _ = var175
				var166 = var176
			end
		end
		if var167 == protoModule.wireTypes.lengthDelimited then
			if var171 == 2 then
				local _ = nil
				local var177, var178 = protoModule.readBuffer(p9, var166)
				var166 = var178
				var165.action_params = t.OpenJoinFriendsAction_Params.decode(var177)
			else
				local _ = nil
				local var179, var180 = protoModule.readVarInt(p9, var166)
				var166 = var180 + var179
			end
		elseif var167 == protoModule.wireTypes.i32 then
			local _ = nil
			local var181, var182 = protoModule.readFixed32(p9, var166)
			local _ = var181
			var166 = var182
		elseif var167 == protoModule.wireTypes.i64 then
			local _ = nil
			local var183, var184 = protoModule.readFixed64(p9, var166)
			local _ = var183
			var166 = var184
		else
			error("Unsupported wire type: " .. var456)
		end
	end
	return var165
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
	local var185 = t_9.new()
	
	if self.action_type ~= nil then
		var185.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var185.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var185.action_params = t.OpenJoinFriendsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var185.action_params = t.OpenJoinFriendsAction_Params.jsonDecode(self.actionParams)
	end
	return var185
end

t_9.descriptor = {
	name = "OpenJoinFriendsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenJoinFriendsAction"
}
t.OpenJoinFriendsAction = t_9
typeRegistryModule.default:register(t.OpenJoinFriendsAction)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p10)
	-- upvalues: t_10 (ref)
	return setmetatable({
		place_id = if p10 == nil or p10.place_id == nil then nil else p10.place_id,
		universe_id = if p10 == nil or p10.universe_id == nil then nil else p10.universe_id
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var185 = 0
	
	if self.place_id ~= nil then
		local var186 = self.place_id:encode()
		local var187, var188 = protoModule.writeTag(buff, var185, 1, protoModule.wireTypes.lengthDelimited)
		var187, var480 = protoModule.writeBuffer(var187, var188, var186, buffer.len(var186))
		buff = var187
		var185 = var188
	end
	if self.universe_id ~= nil then
		local var189 = self.universe_id:encode()
		local var190, var191 = protoModule.writeTag(buff, var185, 2, protoModule.wireTypes.lengthDelimited)
		var190, var483 = protoModule.writeBuffer(var190, var191, var189, buffer.len(var189))
		buff = var190
		var185 = var191
	end
	local buff_1 = buffer.create(var185)
	buffer.copy(buff_1, 0, buff, 0, var185)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref), propTypesModule (ref)
	local var185 = t_10.new()
	local var186 = 0
	while var186 < buffer.len(p10) do
		local _ = nil
		local var187 = nil
		local var188, var189, var190 = protoModule.readTag(p10, var186)
		local var191 = var188
		var187 = var189
		var186 = var190
		
		if var187 == protoModule.wireTypes.varint then
			local _ = nil
			local var192, var193 = protoModule.readVarInt(p10, var186)
			local _ = var192
			var186 = var193
			continue
		end
		if var187 == protoModule.wireTypes.lengthDelimited then
			if var191 == 1 then
				local _ = nil
				local var194, var195 = protoModule.readBuffer(p10, var186)
				var186 = var195
				var185.place_id = propTypesModule.StringProp.decode(var194)
			elseif var191 == 2 then
				local _ = nil
				local var196, var197 = protoModule.readBuffer(p10, var186)
				var186 = var197
				var185.universe_id = propTypesModule.StringProp.decode(var196)
			else
				local _ = nil
				local var198, var199 = protoModule.readVarInt(p10, var186)
				var186 = var199 + var198
			end
		elseif var187 == protoModule.wireTypes.i32 then
			local _ = nil
			local var200, var201 = protoModule.readFixed32(p10, var186)
			local _ = var200
			var186 = var201
		elseif var187 == protoModule.wireTypes.i64 then
			local _ = nil
			local var202, var203 = protoModule.readFixed64(p10, var186)
			local _ = var202
			var186 = var203
		else
			error("Unsupported wire type: " .. var487)
		end
	end
	return var185
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
	local var204 = t_10.new()
	
	if self.place_id ~= nil then
		var204.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var204.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var204.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var204.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var204
end

t_10.descriptor = {
	name = "OpenJoinFriendsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenJoinFriendsAction_Params = t_10
typeRegistryModule.default:register(t.OpenJoinFriendsAction_Params)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p11)
	-- upvalues: t (ref), t_11 (ref)
	return setmetatable({
		action_type = if p11 == nil or p11.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p11.action_type,
		action_params = if p11 == nil or p11.action_params == nil then nil else p11.action_params
	}, t_11)
end

function t_11:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var204 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var205, var206 = protoModule.writeTag(buff, var204, 1, protoModule.wireTypes.varint)
		var205, var509 = protoModule.writeVarInt(var205, var206, t.ActionType.toNumber(self.action_type))
		buff = var205
		var204 = var206
	end
	if self.action_params ~= nil then
		local var207 = self.action_params:encode()
		local var208, var209 = protoModule.writeTag(buff, var204, 2, protoModule.wireTypes.lengthDelimited)
		var208, var512 = protoModule.writeBuffer(var208, var209, var207, buffer.len(var207))
		buff = var208
		var204 = var209
	end
	local buff_1 = buffer.create(var204)
	buffer.copy(buff_1, 0, buff, 0, var204)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref), t (ref)
	local var204 = t_11.new()
	local var205 = 0
	while var205 < buffer.len(p11) do
		local _ = nil
		local var206 = nil
		local var207, var208, var209 = protoModule.readTag(p11, var205)
		local var210 = var207
		var206 = var208
		var205 = var209
		
		if var206 == protoModule.wireTypes.varint then
			if var210 == 1 then
				local _ = nil
				local var211, var212 = protoModule.readVarIntI32(p11, var205)
				local var213 = var211
				var205 = var212
				var204.action_type = t.ActionType.fromNumber(var213) or var213
			else
				local _ = nil
				local var214, var215 = protoModule.readVarInt(p11, var205)
				local _ = var214
				var205 = var215
			end
		end
		if var206 == protoModule.wireTypes.lengthDelimited then
			if var210 == 2 then
				local _ = nil
				local var216, var217 = protoModule.readBuffer(p11, var205)
				var205 = var217
				var204.action_params = t.OpenMarketplaceTryOnAction_Params.decode(var216)
			else
				local _ = nil
				local var218, var219 = protoModule.readVarInt(p11, var205)
				var205 = var219 + var218
			end
		elseif var206 == protoModule.wireTypes.i32 then
			local _ = nil
			local var220, var221 = protoModule.readFixed32(p11, var205)
			local _ = var220
			var205 = var221
		elseif var206 == protoModule.wireTypes.i64 then
			local _ = nil
			local var222, var223 = protoModule.readFixed64(p11, var205)
			local _ = var222
			var205 = var223
		else
			error("Unsupported wire type: " .. var516)
		end
	end
	return var204
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
	local var224 = t_11.new()
	
	if self.action_type ~= nil then
		var224.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var224.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var224.action_params = t.OpenMarketplaceTryOnAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var224.action_params = t.OpenMarketplaceTryOnAction_Params.jsonDecode(self.actionParams)
	end
	return var224
end

t_11.descriptor = {
	name = "OpenMarketplaceTryOnAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceTryOnAction"
}
t.OpenMarketplaceTryOnAction = t_11
typeRegistryModule.default:register(t.OpenMarketplaceTryOnAction)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p12)
	-- upvalues: t_12 (ref)
	return setmetatable({
		item_id = if p12 == nil or p12.item_id == nil then nil else p12.item_id,
		item_type = if p12 == nil or p12.item_type == nil then nil else p12.item_type,
		item_sub_type_name = if p12 == nil or p12.item_sub_type_name == nil then nil else p12.item_sub_type_name
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var224 = 0
	
	if self.item_id ~= nil then
		local var225 = self.item_id:encode()
		local var226, var227 = protoModule.writeTag(buff, var224, 1, protoModule.wireTypes.lengthDelimited)
		var226, var540 = protoModule.writeBuffer(var226, var227, var225, buffer.len(var225))
		buff = var226
		var224 = var227
	end
	if self.item_type ~= nil then
		local var228 = self.item_type:encode()
		local var229, var230 = protoModule.writeTag(buff, var224, 2, protoModule.wireTypes.lengthDelimited)
		var229, var543 = protoModule.writeBuffer(var229, var230, var228, buffer.len(var228))
		buff = var229
		var224 = var230
	end
	if self.item_sub_type_name ~= nil then
		local var231 = self.item_sub_type_name:encode()
		local var232, var233 = protoModule.writeTag(buff, var224, 3, protoModule.wireTypes.lengthDelimited)
		var232, var546 = protoModule.writeBuffer(var232, var233, var231, buffer.len(var231))
		buff = var232
		var224 = var233
	end
	local buff_1 = buffer.create(var224)
	buffer.copy(buff_1, 0, buff, 0, var224)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref), propTypesModule (ref)
	local var224 = t_12.new()
	local var225 = 0
	while var225 < buffer.len(p12) do
		local _ = nil
		local var226 = nil
		local var227, var228, var229 = protoModule.readTag(p12, var225)
		local var230 = var227
		var226 = var228
		var225 = var229
		
		if var226 == protoModule.wireTypes.varint then
			local _ = nil
			local var231, var232 = protoModule.readVarInt(p12, var225)
			local _ = var231
			var225 = var232
			continue
		end
		if var226 == protoModule.wireTypes.lengthDelimited then
			if var230 == 1 then
				local _ = nil
				local var233, var234 = protoModule.readBuffer(p12, var225)
				var225 = var234
				var224.item_id = propTypesModule.StringProp.decode(var233)
			elseif var230 == 2 then
				local _ = nil
				local var235, var236 = protoModule.readBuffer(p12, var225)
				var225 = var236
				var224.item_type = propTypesModule.StringProp.decode(var235)
			elseif var230 == 3 then
				local _ = nil
				local var237, var238 = protoModule.readBuffer(p12, var225)
				var225 = var238
				var224.item_sub_type_name = propTypesModule.StringProp.decode(var237)
			else
				local _ = nil
				local var239, var240 = protoModule.readVarInt(p12, var225)
				var225 = var240 + var239
			end
		elseif var226 == protoModule.wireTypes.i32 then
			local _ = nil
			local var241, var242 = protoModule.readFixed32(p12, var225)
			local _ = var241
			var225 = var242
		elseif var226 == protoModule.wireTypes.i64 then
			local _ = nil
			local var243, var244 = protoModule.readFixed64(p12, var225)
			local _ = var243
			var225 = var244
		else
			error("Unsupported wire type: " .. var550)
		end
	end
	return var224
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
	local var245 = t_12.new()
	
	if self.item_id ~= nil then
		var245.item_id = propTypesModule.StringProp.jsonDecode(self.item_id)
	end
	if self.itemId ~= nil then
		var245.item_id = propTypesModule.StringProp.jsonDecode(self.itemId)
	end
	if self.item_type ~= nil then
		var245.item_type = propTypesModule.StringProp.jsonDecode(self.item_type)
	end
	if self.itemType ~= nil then
		var245.item_type = propTypesModule.StringProp.jsonDecode(self.itemType)
	end
	if self.item_sub_type_name ~= nil then
		var245.item_sub_type_name = propTypesModule.StringProp.jsonDecode(self.item_sub_type_name)
	end
	if self.itemSubTypeName ~= nil then
		var245.item_sub_type_name = propTypesModule.StringProp.jsonDecode(self.itemSubTypeName)
	end
	return var245
end

t_12.descriptor = {
	name = "OpenMarketplaceTryOnAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceTryOnAction_Params = t_12
typeRegistryModule.default:register(t.OpenMarketplaceTryOnAction_Params)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p13)
	-- upvalues: t (ref), t_13 (ref)
	return setmetatable({
		action_type = if p13 == nil or p13.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p13.action_type,
		action_params = if p13 == nil or p13.action_params == nil then nil else p13.action_params
	}, t_13)
end

function t_13:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var245 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var246, var247 = protoModule.writeTag(buff, var245, 1, protoModule.wireTypes.varint)
		var246, var574 = protoModule.writeVarInt(var246, var247, t.ActionType.toNumber(self.action_type))
		buff = var246
		var245 = var247
	end
	if self.action_params ~= nil then
		local var248 = self.action_params:encode()
		local var249, var250 = protoModule.writeTag(buff, var245, 2, protoModule.wireTypes.lengthDelimited)
		var249, var577 = protoModule.writeBuffer(var249, var250, var248, buffer.len(var248))
		buff = var249
		var245 = var250
	end
	local buff_1 = buffer.create(var245)
	buffer.copy(buff_1, 0, buff, 0, var245)
	
	return buff_1
end

function t_13.decode(p13)
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var245 = t_13.new()
	local var246 = 0
	while var246 < buffer.len(p13) do
		local _ = nil
		local var247 = nil
		local var248, var249, var250 = protoModule.readTag(p13, var246)
		local var251 = var248
		var247 = var249
		var246 = var250
		
		if var247 == protoModule.wireTypes.varint then
			if var251 == 1 then
				local _ = nil
				local var252, var253 = protoModule.readVarIntI32(p13, var246)
				local var254 = var252
				var246 = var253
				var245.action_type = t.ActionType.fromNumber(var254) or var254
			else
				local _ = nil
				local var255, var256 = protoModule.readVarInt(p13, var246)
				local _ = var255
				var246 = var256
			end
		end
		if var247 == protoModule.wireTypes.lengthDelimited then
			if var251 == 2 then
				local _ = nil
				local var257, var258 = protoModule.readBuffer(p13, var246)
				var246 = var258
				var245.action_params = t.OpenSeeAllAction_Params.decode(var257)
			else
				local _ = nil
				local var259, var260 = protoModule.readVarInt(p13, var246)
				var246 = var260 + var259
			end
		elseif var247 == protoModule.wireTypes.i32 then
			local _ = nil
			local var261, var262 = protoModule.readFixed32(p13, var246)
			local _ = var261
			var246 = var262
		elseif var247 == protoModule.wireTypes.i64 then
			local _ = nil
			local var263, var264 = protoModule.readFixed64(p13, var246)
			local _ = var263
			var246 = var264
		else
			error("Unsupported wire type: " .. var581)
		end
	end
	return var245
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
	local var265 = t_13.new()
	
	if self.action_type ~= nil then
		var265.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var265.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var265.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var265.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var265
end

t_13.descriptor = {
	name = "OpenSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSeeAllAction"
}
t.OpenSeeAllAction = t_13
typeRegistryModule.default:register(t.OpenSeeAllAction)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p14)
	-- upvalues: t_14 (ref)
	return setmetatable({
		collection_id = if p14 == nil or p14.collection_id == nil then nil else p14.collection_id,
		game_set_target_id = if p14 == nil or p14.game_set_target_id == nil then nil else p14.game_set_target_id,
		collection_position = if p14 == nil or p14.collection_position == nil then nil else p14.collection_position
	}, t_14)
end

function t_14:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var265 = 0
	
	if self.collection_id ~= nil then
		local var266 = self.collection_id:encode()
		local var267, var268 = protoModule.writeTag(buff, var265, 1, protoModule.wireTypes.lengthDelimited)
		var267, var605 = protoModule.writeBuffer(var267, var268, var266, buffer.len(var266))
		buff = var267
		var265 = var268
	end
	if self.game_set_target_id ~= nil then
		local var269 = self.game_set_target_id:encode()
		local var270, var271 = protoModule.writeTag(buff, var265, 2, protoModule.wireTypes.lengthDelimited)
		var270, var608 = protoModule.writeBuffer(var270, var271, var269, buffer.len(var269))
		buff = var270
		var265 = var271
	end
	if self.collection_position ~= nil then
		local var272 = self.collection_position:encode()
		local var273, var274 = protoModule.writeTag(buff, var265, 3, protoModule.wireTypes.lengthDelimited)
		var273, var611 = protoModule.writeBuffer(var273, var274, var272, buffer.len(var272))
		buff = var273
		var265 = var274
	end
	local buff_1 = buffer.create(var265)
	buffer.copy(buff_1, 0, buff, 0, var265)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), propTypesModule (ref)
	local var265 = t_14.new()
	local var266 = 0
	while var266 < buffer.len(p14) do
		local _ = nil
		local var267 = nil
		local var268, var269, var270 = protoModule.readTag(p14, var266)
		local var271 = var268
		var267 = var269
		var266 = var270
		
		if var267 == protoModule.wireTypes.varint then
			local _ = nil
			local var272, var273 = protoModule.readVarInt(p14, var266)
			local _ = var272
			var266 = var273
			continue
		end
		if var267 == protoModule.wireTypes.lengthDelimited then
			if var271 == 1 then
				local _ = nil
				local var274, var275 = protoModule.readBuffer(p14, var266)
				var266 = var275
				var265.collection_id = propTypesModule.StringProp.decode(var274)
			elseif var271 == 2 then
				local _ = nil
				local var276, var277 = protoModule.readBuffer(p14, var266)
				var266 = var277
				var265.game_set_target_id = propTypesModule.StringProp.decode(var276)
			elseif var271 == 3 then
				local _ = nil
				local var278, var279 = protoModule.readBuffer(p14, var266)
				var266 = var279
				var265.collection_position = propTypesModule.StringProp.decode(var278)
			else
				local _ = nil
				local var280, var281 = protoModule.readVarInt(p14, var266)
				var266 = var281 + var280
			end
		elseif var267 == protoModule.wireTypes.i32 then
			local _ = nil
			local var282, var283 = protoModule.readFixed32(p14, var266)
			local _ = var282
			var266 = var283
		elseif var267 == protoModule.wireTypes.i64 then
			local _ = nil
			local var284, var285 = protoModule.readFixed64(p14, var266)
			local _ = var284
			var266 = var285
		else
			error("Unsupported wire type: " .. var615)
		end
	end
	return var265
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
	local var286 = t_14.new()
	
	if self.collection_id ~= nil then
		var286.collection_id = propTypesModule.StringProp.jsonDecode(self.collection_id)
	end
	if self.collectionId ~= nil then
		var286.collection_id = propTypesModule.StringProp.jsonDecode(self.collectionId)
	end
	if self.game_set_target_id ~= nil then
		var286.game_set_target_id = propTypesModule.StringProp.jsonDecode(self.game_set_target_id)
	end
	if self.gameSetTargetId ~= nil then
		var286.game_set_target_id = propTypesModule.StringProp.jsonDecode(self.gameSetTargetId)
	end
	if self.collection_position ~= nil then
		var286.collection_position = propTypesModule.StringProp.jsonDecode(self.collection_position)
	end
	if self.collectionPosition ~= nil then
		var286.collection_position = propTypesModule.StringProp.jsonDecode(self.collectionPosition)
	end
	return var286
end

t_14.descriptor = {
	name = "OpenSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSeeAllAction_Params = t_14
typeRegistryModule.default:register(t.OpenSeeAllAction_Params)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p15)
	-- upvalues: t (ref), t_15 (ref)
	return setmetatable({
		action_type = if p15 == nil or p15.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p15.action_type,
		action_params = if p15 == nil or p15.action_params == nil then nil else p15.action_params
	}, t_15)
end

function t_15:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var286 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var287, var288 = protoModule.writeTag(buff, var286, 1, protoModule.wireTypes.varint)
		var287, var639 = protoModule.writeVarInt(var287, var288, t.ActionType.toNumber(self.action_type))
		buff = var287
		var286 = var288
	end
	if self.action_params ~= nil then
		local var289 = self.action_params:encode()
		local var290, var291 = protoModule.writeTag(buff, var286, 2, protoModule.wireTypes.lengthDelimited)
		var290, var642 = protoModule.writeBuffer(var290, var291, var289, buffer.len(var289))
		buff = var290
		var286 = var291
	end
	local buff_1 = buffer.create(var286)
	buffer.copy(buff_1, 0, buff, 0, var286)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var286 = t_15.new()
	local var287 = 0
	while var287 < buffer.len(p15) do
		local _ = nil
		local var288 = nil
		local var289, var290, var291 = protoModule.readTag(p15, var287)
		local var292 = var289
		var288 = var290
		var287 = var291
		
		if var288 == protoModule.wireTypes.varint then
			if var292 == 1 then
				local _ = nil
				local var293, var294 = protoModule.readVarIntI32(p15, var287)
				local var295 = var293
				var287 = var294
				var286.action_type = t.ActionType.fromNumber(var295) or var295
			else
				local _ = nil
				local var296, var297 = protoModule.readVarInt(p15, var287)
				local _ = var296
				var287 = var297
			end
		end
		if var288 == protoModule.wireTypes.lengthDelimited then
			if var292 == 2 then
				local _ = nil
				local var298, var299 = protoModule.readBuffer(p15, var287)
				var287 = var299
				var286.action_params = t.OpenSponsoredTooltipAction_Params.decode(var298)
			else
				local _ = nil
				local var300, var301 = protoModule.readVarInt(p15, var287)
				var287 = var301 + var300
			end
		elseif var288 == protoModule.wireTypes.i32 then
			local _ = nil
			local var302, var303 = protoModule.readFixed32(p15, var287)
			local _ = var302
			var287 = var303
		elseif var288 == protoModule.wireTypes.i64 then
			local _ = nil
			local var304, var305 = protoModule.readFixed64(p15, var287)
			local _ = var304
			var287 = var305
		else
			error("Unsupported wire type: " .. var646)
		end
	end
	return var286
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
	local var306 = t_15.new()
	
	if self.action_type ~= nil then
		var306.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var306.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var306.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var306.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return var306
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

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref)
	local var306 = t_16.new()
	local var307 = 0
	while var307 < buffer.len(p16) do
		local var308 = nil
		local _ = nil
		local var309, var310, var311 = protoModule.readTag(p16, var307)
		var308 = var309
		local var312 = var310
		var307 = var311
		
		if var312 == protoModule.wireTypes.varint then
			local _ = nil
			local var313, var314 = protoModule.readVarInt(p16, var307)
			local _ = var313
			var307 = var314
		elseif var312 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var315, var316 = protoModule.readVarInt(p16, var307)
			var307 = var316 + var315
		elseif var312 == protoModule.wireTypes.i32 then
			local _ = nil
			local var317, var318 = protoModule.readFixed32(p16, var307)
			local _ = var317
			var307 = var318
		elseif var312 == protoModule.wireTypes.i64 then
			local _ = nil
			local var319, var320 = protoModule.readFixed64(p16, var307)
			local _ = var319
			var307 = var320
		else
			error("Unsupported wire type: " .. var673)
		end
	end
	return var306
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

function t_17.new(p17)
	-- upvalues: t (ref), t_17 (ref)
	return setmetatable({
		action_type = if p17 == nil or p17.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p17.action_type,
		action_params = if p17 == nil or p17.action_params == nil then nil else p17.action_params
	}, t_17)
end

function t_17:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var321 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var322, var323 = protoModule.writeTag(buff, var321, 1, protoModule.wireTypes.varint)
		var322, var685 = protoModule.writeVarInt(var322, var323, t.ActionType.toNumber(self.action_type))
		buff = var322
		var321 = var323
	end
	if self.action_params ~= nil then
		local var324 = self.action_params:encode()
		local var325, var326 = protoModule.writeTag(buff, var321, 2, protoModule.wireTypes.lengthDelimited)
		var325, var688 = protoModule.writeBuffer(var325, var326, var324, buffer.len(var324))
		buff = var325
		var321 = var326
	end
	local buff_1 = buffer.create(var321)
	buffer.copy(buff_1, 0, buff, 0, var321)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref), t (ref)
	local var321 = t_17.new()
	local var322 = 0
	while var322 < buffer.len(p17) do
		local _ = nil
		local var323 = nil
		local var324, var325, var326 = protoModule.readTag(p17, var322)
		local var327 = var324
		var323 = var325
		var322 = var326
		
		if var323 == protoModule.wireTypes.varint then
			if var327 == 1 then
				local _ = nil
				local var328, var329 = protoModule.readVarIntI32(p17, var322)
				local var330 = var328
				var322 = var329
				var321.action_type = t.ActionType.fromNumber(var330) or var330
			else
				local _ = nil
				local var331, var332 = protoModule.readVarInt(p17, var322)
				local _ = var331
				var322 = var332
			end
		end
		if var323 == protoModule.wireTypes.lengthDelimited then
			if var327 == 2 then
				local _ = nil
				local var333, var334 = protoModule.readBuffer(p17, var322)
				var322 = var334
				var321.action_params = t.PlayButtonClickAction_Params.decode(var333)
			else
				local _ = nil
				local var335, var336 = protoModule.readVarInt(p17, var322)
				var322 = var336 + var335
			end
		elseif var323 == protoModule.wireTypes.i32 then
			local _ = nil
			local var337, var338 = protoModule.readFixed32(p17, var322)
			local _ = var337
			var322 = var338
		elseif var323 == protoModule.wireTypes.i64 then
			local _ = nil
			local var339, var340 = protoModule.readFixed64(p17, var322)
			local _ = var339
			var322 = var340
		else
			error("Unsupported wire type: " .. var692)
		end
	end
	return var321
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
	local var341 = t_17.new()
	
	if self.action_type ~= nil then
		var341.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var341.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var341.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var341.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.actionParams)
	end
	return var341
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

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref)
	local var341 = t_18.new()
	local var342 = 0
	while var342 < buffer.len(p18) do
		local var343 = nil
		local _ = nil
		local var344, var345, var346 = protoModule.readTag(p18, var342)
		var343 = var344
		local var347 = var345
		var342 = var346
		
		if var347 == protoModule.wireTypes.varint then
			local _ = nil
			local var348, var349 = protoModule.readVarInt(p18, var342)
			local _ = var348
			var342 = var349
		elseif var347 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var350, var351 = protoModule.readVarInt(p18, var342)
			var342 = var351 + var350
		elseif var347 == protoModule.wireTypes.i32 then
			local _ = nil
			local var352, var353 = protoModule.readFixed32(p18, var342)
			local _ = var352
			var342 = var353
		elseif var347 == protoModule.wireTypes.i64 then
			local _ = nil
			local var354, var355 = protoModule.readFixed64(p18, var342)
			local _ = var354
			var342 = var355
		else
			error("Unsupported wire type: " .. var719)
		end
	end
	return var341
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

function t_19.new(p19)
	-- upvalues: t (ref), t_19 (ref)
	return setmetatable({
		action_type = if p19 == nil or p19.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p19.action_type,
		action_params = if p19 == nil or p19.action_params == nil then nil else p19.action_params
	}, t_19)
end

function t_19:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var356 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var357, var358 = protoModule.writeTag(buff, var356, 1, protoModule.wireTypes.varint)
		var357, var731 = protoModule.writeVarInt(var357, var358, t.ActionType.toNumber(self.action_type))
		buff = var357
		var356 = var358
	end
	if self.action_params ~= nil then
		local var359 = self.action_params:encode()
		local var360, var361 = protoModule.writeTag(buff, var356, 2, protoModule.wireTypes.lengthDelimited)
		var360, var734 = protoModule.writeBuffer(var360, var361, var359, buffer.len(var359))
		buff = var360
		var356 = var361
	end
	local buff_1 = buffer.create(var356)
	buffer.copy(buff_1, 0, buff, 0, var356)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref), t (ref)
	local var356 = t_19.new()
	local var357 = 0
	while var357 < buffer.len(p19) do
		local _ = nil
		local var358 = nil
		local var359, var360, var361 = protoModule.readTag(p19, var357)
		local var362 = var359
		var358 = var360
		var357 = var361
		
		if var358 == protoModule.wireTypes.varint then
			if var362 == 1 then
				local _ = nil
				local var363, var364 = protoModule.readVarIntI32(p19, var357)
				local var365 = var363
				var357 = var364
				var356.action_type = t.ActionType.fromNumber(var365) or var365
			else
				local _ = nil
				local var366, var367 = protoModule.readVarInt(p19, var357)
				local _ = var366
				var357 = var367
			end
		end
		if var358 == protoModule.wireTypes.lengthDelimited then
			if var362 == 2 then
				local _ = nil
				local var368, var369 = protoModule.readBuffer(p19, var357)
				var357 = var369
				var356.action_params = t.UpdateUserSettingsAction_Params.decode(var368)
			else
				local _ = nil
				local var370, var371 = protoModule.readVarInt(p19, var357)
				var357 = var371 + var370
			end
		elseif var358 == protoModule.wireTypes.i32 then
			local _ = nil
			local var372, var373 = protoModule.readFixed32(p19, var357)
			local _ = var372
			var357 = var373
		elseif var358 == protoModule.wireTypes.i64 then
			local _ = nil
			local var374, var375 = protoModule.readFixed64(p19, var357)
			local _ = var374
			var357 = var375
		else
			error("Unsupported wire type: " .. var738)
		end
	end
	return var356
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
	local var376 = t_19.new()
	
	if self.action_type ~= nil then
		var376.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var376.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var376.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var376.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.actionParams)
	end
	return var376
end

t_19.descriptor = {
	name = "UpdateUserSettingsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.UpdateUserSettingsAction"
}
t.UpdateUserSettingsAction = t_19
typeRegistryModule.default:register(t.UpdateUserSettingsAction)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p20)
	-- upvalues: t_20 (ref)
	return setmetatable({
		settings = if p20 == nil or p20.settings == nil then nil else p20.settings,
		audit_data = if p20 == nil or p20.audit_data == nil then nil else p20.audit_data
	}, t_20)
end

function t_20:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var376 = 0
	
	if self.settings ~= nil then
		local var377 = self.settings:encode()
		local var378, var379 = protoModule.writeTag(buff, var376, 1, protoModule.wireTypes.lengthDelimited)
		var378, var762 = protoModule.writeBuffer(var378, var379, var377, buffer.len(var377))
		buff = var378
		var376 = var379
	end
	if self.audit_data ~= nil then
		local var380 = self.audit_data:encode()
		local var381, var382 = protoModule.writeTag(buff, var376, 2, protoModule.wireTypes.lengthDelimited)
		var381, var765 = protoModule.writeBuffer(var381, var382, var380, buffer.len(var380))
		buff = var381
		var376 = var382
	end
	local buff_1 = buffer.create(var376)
	buffer.copy(buff_1, 0, buff, 0, var376)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref), propTypesModule (ref)
	local var376 = t_20.new()
	local var377 = 0
	while var377 < buffer.len(p20) do
		local _ = nil
		local var378 = nil
		local var379, var380, var381 = protoModule.readTag(p20, var377)
		local var382 = var379
		var378 = var380
		var377 = var381
		
		if var378 == protoModule.wireTypes.varint then
			local _ = nil
			local var383, var384 = protoModule.readVarInt(p20, var377)
			local _ = var383
			var377 = var384
			continue
		end
		if var378 == protoModule.wireTypes.lengthDelimited then
			if var382 == 1 then
				local _ = nil
				local var385, var386 = protoModule.readBuffer(p20, var377)
				var377 = var386
				var376.settings = propTypesModule.StructProp.decode(var385)
			elseif var382 == 2 then
				local _ = nil
				local var387, var388 = protoModule.readBuffer(p20, var377)
				var377 = var388
				var376.audit_data = propTypesModule.StringProp.decode(var387)
			else
				local _ = nil
				local var389, var390 = protoModule.readVarInt(p20, var377)
				var377 = var390 + var389
			end
		elseif var378 == protoModule.wireTypes.i32 then
			local _ = nil
			local var391, var392 = protoModule.readFixed32(p20, var377)
			local _ = var391
			var377 = var392
		elseif var378 == protoModule.wireTypes.i64 then
			local _ = nil
			local var393, var394 = protoModule.readFixed64(p20, var377)
			local _ = var393
			var377 = var394
		else
			error("Unsupported wire type: " .. var769)
		end
	end
	return var376
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
	local var395 = t_20.new()
	
	if self.settings ~= nil then
		var395.settings = propTypesModule.StructProp.jsonDecode(self.settings)
	end
	if self.audit_data ~= nil then
		var395.audit_data = propTypesModule.StringProp.jsonDecode(self.audit_data)
	end
	if self.auditData ~= nil then
		var395.audit_data = propTypesModule.StringProp.jsonDecode(self.auditData)
	end
	return var395
end

t_20.descriptor = {
	name = "UpdateUserSettingsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.UpdateUserSettingsAction_Params = t_20
typeRegistryModule.default:register(t.UpdateUserSettingsAction_Params)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p21)
	-- upvalues: t (ref), t_21 (ref)
	return setmetatable({
		action_type = if p21 == nil or p21.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p21.action_type,
		action_params = if p21 == nil or p21.action_params == nil then nil else p21.action_params
	}, t_21)
end

function t_21:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var395 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var396, var397 = protoModule.writeTag(buff, var395, 1, protoModule.wireTypes.varint)
		var396, var791 = protoModule.writeVarInt(var396, var397, t.ActionType.toNumber(self.action_type))
		buff = var396
		var395 = var397
	end
	if self.action_params ~= nil then
		local var398 = self.action_params:encode()
		local var399, var400 = protoModule.writeTag(buff, var395, 2, protoModule.wireTypes.lengthDelimited)
		var399, var794 = protoModule.writeBuffer(var399, var400, var398, buffer.len(var398))
		buff = var399
		var395 = var400
	end
	local buff_1 = buffer.create(var395)
	buffer.copy(buff_1, 0, buff, 0, var395)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref), t (ref)
	local var395 = t_21.new()
	local var396 = 0
	while var396 < buffer.len(p21) do
		local _ = nil
		local var397 = nil
		local var398, var399, var400 = protoModule.readTag(p21, var396)
		local var401 = var398
		var397 = var399
		var396 = var400
		
		if var397 == protoModule.wireTypes.varint then
			if var401 == 1 then
				local _ = nil
				local var402, var403 = protoModule.readVarIntI32(p21, var396)
				local var404 = var402
				var396 = var403
				var395.action_type = t.ActionType.fromNumber(var404) or var404
			else
				local _ = nil
				local var405, var406 = protoModule.readVarInt(p21, var396)
				local _ = var405
				var396 = var406
			end
		end
		if var397 == protoModule.wireTypes.lengthDelimited then
			if var401 == 2 then
				local _ = nil
				local var407, var408 = protoModule.readBuffer(p21, var396)
				var396 = var408
				var395.action_params = t.OpenTooltipAction_Params.decode(var407)
			else
				local _ = nil
				local var409, var410 = protoModule.readVarInt(p21, var396)
				var396 = var410 + var409
			end
		elseif var397 == protoModule.wireTypes.i32 then
			local _ = nil
			local var411, var412 = protoModule.readFixed32(p21, var396)
			local _ = var411
			var396 = var412
		elseif var397 == protoModule.wireTypes.i64 then
			local _ = nil
			local var413, var414 = protoModule.readFixed64(p21, var396)
			local _ = var413
			var396 = var414
		else
			error("Unsupported wire type: " .. var798)
		end
	end
	return var395
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
	local var415 = t_21.new()
	
	if self.action_type ~= nil then
		var415.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var415.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var415.action_params = t.OpenTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var415.action_params = t.OpenTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return var415
end

t_21.descriptor = {
	name = "OpenTooltipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenTooltipAction"
}
t.OpenTooltipAction = t_21
typeRegistryModule.default:register(t.OpenTooltipAction)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p22)
	-- upvalues: t_22 (ref)
	return setmetatable({
		tooltip_title = if p22 == nil or p22.tooltip_title == nil then nil else p22.tooltip_title,
		tooltip_info_text = if p22 == nil or p22.tooltip_info_text == nil then nil else p22.tooltip_info_text
	}, t_22)
end

function t_22:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var415 = 0
	
	if self.tooltip_title ~= nil then
		local var416 = self.tooltip_title:encode()
		local var417, var418 = protoModule.writeTag(buff, var415, 1, protoModule.wireTypes.lengthDelimited)
		var417, var822 = protoModule.writeBuffer(var417, var418, var416, buffer.len(var416))
		buff = var417
		var415 = var418
	end
	if self.tooltip_info_text ~= nil then
		local var419 = self.tooltip_info_text:encode()
		local var420, var421 = protoModule.writeTag(buff, var415, 2, protoModule.wireTypes.lengthDelimited)
		var420, var825 = protoModule.writeBuffer(var420, var421, var419, buffer.len(var419))
		buff = var420
		var415 = var421
	end
	local buff_1 = buffer.create(var415)
	buffer.copy(buff_1, 0, buff, 0, var415)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), propTypesModule (ref)
	local var415 = t_22.new()
	local var416 = 0
	while var416 < buffer.len(p22) do
		local _ = nil
		local var417 = nil
		local var418, var419, var420 = protoModule.readTag(p22, var416)
		local var421 = var418
		var417 = var419
		var416 = var420
		
		if var417 == protoModule.wireTypes.varint then
			local _ = nil
			local var422, var423 = protoModule.readVarInt(p22, var416)
			local _ = var422
			var416 = var423
			continue
		end
		if var417 == protoModule.wireTypes.lengthDelimited then
			if var421 == 1 then
				local _ = nil
				local var424, var425 = protoModule.readBuffer(p22, var416)
				var416 = var425
				var415.tooltip_title = propTypesModule.StringProp.decode(var424)
			elseif var421 == 2 then
				local _ = nil
				local var426, var427 = protoModule.readBuffer(p22, var416)
				var416 = var427
				var415.tooltip_info_text = propTypesModule.StringProp.decode(var426)
			else
				local _ = nil
				local var428, var429 = protoModule.readVarInt(p22, var416)
				var416 = var429 + var428
			end
		elseif var417 == protoModule.wireTypes.i32 then
			local _ = nil
			local var430, var431 = protoModule.readFixed32(p22, var416)
			local _ = var430
			var416 = var431
		elseif var417 == protoModule.wireTypes.i64 then
			local _ = nil
			local var432, var433 = protoModule.readFixed64(p22, var416)
			local _ = var432
			var416 = var433
		else
			error("Unsupported wire type: " .. var829)
		end
	end
	return var415
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
	local var434 = t_22.new()
	
	if self.tooltip_title ~= nil then
		var434.tooltip_title = propTypesModule.StringProp.jsonDecode(self.tooltip_title)
	end
	if self.tooltipTitle ~= nil then
		var434.tooltip_title = propTypesModule.StringProp.jsonDecode(self.tooltipTitle)
	end
	if self.tooltip_info_text ~= nil then
		var434.tooltip_info_text = propTypesModule.StringProp.jsonDecode(self.tooltip_info_text)
	end
	if self.tooltipInfoText ~= nil then
		var434.tooltip_info_text = propTypesModule.StringProp.jsonDecode(self.tooltipInfoText)
	end
	return var434
end

t_22.descriptor = {
	name = "OpenTooltipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenTooltipAction_Params = t_22
typeRegistryModule.default:register(t.OpenTooltipAction_Params)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p23)
	-- upvalues: t (ref), t_23 (ref)
	return setmetatable({
		action_type = if p23 == nil or p23.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p23.action_type,
		action_params = if p23 == nil or p23.action_params == nil then nil else p23.action_params
	}, t_23)
end

function t_23:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var434 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var435, var436 = protoModule.writeTag(buff, var434, 1, protoModule.wireTypes.varint)
		var435, var851 = protoModule.writeVarInt(var435, var436, t.ActionType.toNumber(self.action_type))
		buff = var435
		var434 = var436
	end
	if self.action_params ~= nil then
		local var437 = self.action_params:encode()
		local var438, var439 = protoModule.writeTag(buff, var434, 2, protoModule.wireTypes.lengthDelimited)
		var438, var854 = protoModule.writeBuffer(var438, var439, var437, buffer.len(var437))
		buff = var438
		var434 = var439
	end
	local buff_1 = buffer.create(var434)
	buffer.copy(buff_1, 0, buff, 0, var434)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref), t (ref)
	local var434 = t_23.new()
	local var435 = 0
	while var435 < buffer.len(p23) do
		local _ = nil
		local var436 = nil
		local var437, var438, var439 = protoModule.readTag(p23, var435)
		local var440 = var437
		var436 = var438
		var435 = var439
		
		if var436 == protoModule.wireTypes.varint then
			if var440 == 1 then
				local _ = nil
				local var441, var442 = protoModule.readVarIntI32(p23, var435)
				local var443 = var441
				var435 = var442
				var434.action_type = t.ActionType.fromNumber(var443) or var443
			else
				local _ = nil
				local var444, var445 = protoModule.readVarInt(p23, var435)
				local _ = var444
				var435 = var445
			end
		end
		if var436 == protoModule.wireTypes.lengthDelimited then
			if var440 == 2 then
				local _ = nil
				local var446, var447 = protoModule.readBuffer(p23, var435)
				var435 = var447
				var434.action_params = t.OpenBadgeDetailsAction_Params.decode(var446)
			else
				local _ = nil
				local var448, var449 = protoModule.readVarInt(p23, var435)
				var435 = var449 + var448
			end
		elseif var436 == protoModule.wireTypes.i32 then
			local _ = nil
			local var450, var451 = protoModule.readFixed32(p23, var435)
			local _ = var450
			var435 = var451
		elseif var436 == protoModule.wireTypes.i64 then
			local _ = nil
			local var452, var453 = protoModule.readFixed64(p23, var435)
			local _ = var452
			var435 = var453
		else
			error("Unsupported wire type: " .. var858)
		end
	end
	return var434
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
	local var454 = t_23.new()
	
	if self.action_type ~= nil then
		var454.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var454.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var454.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var454.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var454
end

t_23.descriptor = {
	name = "OpenBadgeDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgeDetailsAction"
}
t.OpenBadgeDetailsAction = t_23
typeRegistryModule.default:register(t.OpenBadgeDetailsAction)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p24)
	-- upvalues: t_24 (ref)
	return setmetatable({
		badge_id = if p24 == nil or p24.badge_id == nil then nil else p24.badge_id,
		title_text = if p24 == nil or p24.title_text == nil then nil else p24.title_text
	}, t_24)
end

function t_24:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var454 = 0
	
	if self.badge_id ~= nil then
		local var455 = self.badge_id:encode()
		local var456, var457 = protoModule.writeTag(buff, var454, 1, protoModule.wireTypes.lengthDelimited)
		var456, var882 = protoModule.writeBuffer(var456, var457, var455, buffer.len(var455))
		buff = var456
		var454 = var457
	end
	if self.title_text ~= nil then
		local var458 = self.title_text:encode()
		local var459, var460 = protoModule.writeTag(buff, var454, 2, protoModule.wireTypes.lengthDelimited)
		var459, var885 = protoModule.writeBuffer(var459, var460, var458, buffer.len(var458))
		buff = var459
		var454 = var460
	end
	local buff_1 = buffer.create(var454)
	buffer.copy(buff_1, 0, buff, 0, var454)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), propTypesModule (ref)
	local var454 = t_24.new()
	local var455 = 0
	while var455 < buffer.len(p24) do
		local _ = nil
		local var456 = nil
		local var457, var458, var459 = protoModule.readTag(p24, var455)
		local var460 = var457
		var456 = var458
		var455 = var459
		
		if var456 == protoModule.wireTypes.varint then
			local _ = nil
			local var461, var462 = protoModule.readVarInt(p24, var455)
			local _ = var461
			var455 = var462
			continue
		end
		if var456 == protoModule.wireTypes.lengthDelimited then
			if var460 == 1 then
				local _ = nil
				local var463, var464 = protoModule.readBuffer(p24, var455)
				var455 = var464
				var454.badge_id = propTypesModule.StringProp.decode(var463)
			elseif var460 == 2 then
				local _ = nil
				local var465, var466 = protoModule.readBuffer(p24, var455)
				var455 = var466
				var454.title_text = propTypesModule.StringProp.decode(var465)
			else
				local _ = nil
				local var467, var468 = protoModule.readVarInt(p24, var455)
				var455 = var468 + var467
			end
		elseif var456 == protoModule.wireTypes.i32 then
			local _ = nil
			local var469, var470 = protoModule.readFixed32(p24, var455)
			local _ = var469
			var455 = var470
		elseif var456 == protoModule.wireTypes.i64 then
			local _ = nil
			local var471, var472 = protoModule.readFixed64(p24, var455)
			local _ = var471
			var455 = var472
		else
			error("Unsupported wire type: " .. var889)
		end
	end
	return var454
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
	local var473 = t_24.new()
	
	if self.badge_id ~= nil then
		var473.badge_id = propTypesModule.StringProp.jsonDecode(self.badge_id)
	end
	if self.badgeId ~= nil then
		var473.badge_id = propTypesModule.StringProp.jsonDecode(self.badgeId)
	end
	if self.title_text ~= nil then
		var473.title_text = propTypesModule.StringProp.jsonDecode(self.title_text)
	end
	if self.titleText ~= nil then
		var473.title_text = propTypesModule.StringProp.jsonDecode(self.titleText)
	end
	return var473
end

t_24.descriptor = {
	name = "OpenBadgeDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenBadgeDetailsAction_Params = t_24
typeRegistryModule.default:register(t.OpenBadgeDetailsAction_Params)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p25)
	-- upvalues: t (ref), t_25 (ref)
	return setmetatable({
		action_type = if p25 == nil or p25.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p25.action_type,
		action_params = if p25 == nil or p25.action_params == nil then nil else p25.action_params
	}, t_25)
end

function t_25:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var473 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var474, var475 = protoModule.writeTag(buff, var473, 1, protoModule.wireTypes.varint)
		var474, var911 = protoModule.writeVarInt(var474, var475, t.ActionType.toNumber(self.action_type))
		buff = var474
		var473 = var475
	end
	if self.action_params ~= nil then
		local var476 = self.action_params:encode()
		local var477, var478 = protoModule.writeTag(buff, var473, 2, protoModule.wireTypes.lengthDelimited)
		var477, var914 = protoModule.writeBuffer(var477, var478, var476, buffer.len(var476))
		buff = var477
		var473 = var478
	end
	local buff_1 = buffer.create(var473)
	buffer.copy(buff_1, 0, buff, 0, var473)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref), t (ref)
	local var473 = t_25.new()
	local var474 = 0
	while var474 < buffer.len(p25) do
		local _ = nil
		local var475 = nil
		local var476, var477, var478 = protoModule.readTag(p25, var474)
		local var479 = var476
		var475 = var477
		var474 = var478
		
		if var475 == protoModule.wireTypes.varint then
			if var479 == 1 then
				local _ = nil
				local var480, var481 = protoModule.readVarIntI32(p25, var474)
				local var482 = var480
				var474 = var481
				var473.action_type = t.ActionType.fromNumber(var482) or var482
			else
				local _ = nil
				local var483, var484 = protoModule.readVarInt(p25, var474)
				local _ = var483
				var474 = var484
			end
		end
		if var475 == protoModule.wireTypes.lengthDelimited then
			if var479 == 2 then
				local _ = nil
				local var485, var486 = protoModule.readBuffer(p25, var474)
				var474 = var486
				var473.action_params = t.LoadMoreFromApiAction_Params.decode(var485)
			else
				local _ = nil
				local var487, var488 = protoModule.readVarInt(p25, var474)
				var474 = var488 + var487
			end
		elseif var475 == protoModule.wireTypes.i32 then
			local _ = nil
			local var489, var490 = protoModule.readFixed32(p25, var474)
			local _ = var489
			var474 = var490
		elseif var475 == protoModule.wireTypes.i64 then
			local _ = nil
			local var491, var492 = protoModule.readFixed64(p25, var474)
			local _ = var491
			var474 = var492
		else
			error("Unsupported wire type: " .. var918)
		end
	end
	return var473
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
	local var493 = t_25.new()
	
	if self.action_type ~= nil then
		var493.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var493.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var493.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var493.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var493
end

t_25.descriptor = {
	name = "LoadMoreFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LoadMoreFromApiAction"
}
t.LoadMoreFromApiAction = t_25
typeRegistryModule.default:register(t.LoadMoreFromApiAction)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p26)
	-- upvalues: t_26 (ref)
	return setmetatable({
		surface_key = if p26 == nil or p26.surface_key == nil then nil else p26.surface_key,
		config_key = if p26 == nil or p26.config_key == nil then nil else p26.config_key
	}, t_26)
end

function t_26:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var493 = 0
	
	if self.surface_key ~= nil then
		local var494 = self.surface_key:encode()
		local var495, var496 = protoModule.writeTag(buff, var493, 1, protoModule.wireTypes.lengthDelimited)
		var495, var942 = protoModule.writeBuffer(var495, var496, var494, buffer.len(var494))
		buff = var495
		var493 = var496
	end
	if self.config_key ~= nil then
		local var497 = self.config_key:encode()
		local var498, var499 = protoModule.writeTag(buff, var493, 2, protoModule.wireTypes.lengthDelimited)
		var498, var945 = protoModule.writeBuffer(var498, var499, var497, buffer.len(var497))
		buff = var498
		var493 = var499
	end
	local buff_1 = buffer.create(var493)
	buffer.copy(buff_1, 0, buff, 0, var493)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref), propTypesModule (ref)
	local var493 = t_26.new()
	local var494 = 0
	while var494 < buffer.len(p26) do
		local _ = nil
		local var495 = nil
		local var496, var497, var498 = protoModule.readTag(p26, var494)
		local var499 = var496
		var495 = var497
		var494 = var498
		
		if var495 == protoModule.wireTypes.varint then
			local _ = nil
			local var500, var501 = protoModule.readVarInt(p26, var494)
			local _ = var500
			var494 = var501
			continue
		end
		if var495 == protoModule.wireTypes.lengthDelimited then
			if var499 == 1 then
				local _ = nil
				local var502, var503 = protoModule.readBuffer(p26, var494)
				var494 = var503
				var493.surface_key = propTypesModule.StringProp.decode(var502)
			elseif var499 == 2 then
				local _ = nil
				local var504, var505 = protoModule.readBuffer(p26, var494)
				var494 = var505
				var493.config_key = propTypesModule.StringProp.decode(var504)
			else
				local _ = nil
				local var506, var507 = protoModule.readVarInt(p26, var494)
				var494 = var507 + var506
			end
		elseif var495 == protoModule.wireTypes.i32 then
			local _ = nil
			local var508, var509 = protoModule.readFixed32(p26, var494)
			local _ = var508
			var494 = var509
		elseif var495 == protoModule.wireTypes.i64 then
			local _ = nil
			local var510, var511 = protoModule.readFixed64(p26, var494)
			local _ = var510
			var494 = var511
		else
			error("Unsupported wire type: " .. var949)
		end
	end
	return var493
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
	local var512 = t_26.new()
	
	if self.surface_key ~= nil then
		var512.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var512.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		var512.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var512.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return var512
end

t_26.descriptor = {
	name = "LoadMoreFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LoadMoreFromApiAction_Params = t_26
typeRegistryModule.default:register(t.LoadMoreFromApiAction_Params)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p27)
	-- upvalues: t (ref), t_27 (ref)
	return setmetatable({
		action_type = if p27 == nil or p27.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p27.action_type,
		action_params = if p27 == nil or p27.action_params == nil then nil else p27.action_params
	}, t_27)
end

function t_27:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var512 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var513, var514 = protoModule.writeTag(buff, var512, 1, protoModule.wireTypes.varint)
		var513, var971 = protoModule.writeVarInt(var513, var514, t.ActionType.toNumber(self.action_type))
		buff = var513
		var512 = var514
	end
	if self.action_params ~= nil then
		local var515 = self.action_params:encode()
		local var516, var517 = protoModule.writeTag(buff, var512, 2, protoModule.wireTypes.lengthDelimited)
		var516, var974 = protoModule.writeBuffer(var516, var517, var515, buffer.len(var515))
		buff = var516
		var512 = var517
	end
	local buff_1 = buffer.create(var512)
	buffer.copy(buff_1, 0, buff, 0, var512)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref), t (ref)
	local var512 = t_27.new()
	local var513 = 0
	while var513 < buffer.len(p27) do
		local _ = nil
		local var514 = nil
		local var515, var516, var517 = protoModule.readTag(p27, var513)
		local var518 = var515
		var514 = var516
		var513 = var517
		
		if var514 == protoModule.wireTypes.varint then
			if var518 == 1 then
				local _ = nil
				local var519, var520 = protoModule.readVarIntI32(p27, var513)
				local var521 = var519
				var513 = var520
				var512.action_type = t.ActionType.fromNumber(var521) or var521
			else
				local _ = nil
				local var522, var523 = protoModule.readVarInt(p27, var513)
				local _ = var522
				var513 = var523
			end
		end
		if var514 == protoModule.wireTypes.lengthDelimited then
			if var518 == 2 then
				local _ = nil
				local var524, var525 = protoModule.readBuffer(p27, var513)
				var513 = var525
				var512.action_params = t.ShareAction_Params.decode(var524)
			else
				local _ = nil
				local var526, var527 = protoModule.readVarInt(p27, var513)
				var513 = var527 + var526
			end
		elseif var514 == protoModule.wireTypes.i32 then
			local _ = nil
			local var528, var529 = protoModule.readFixed32(p27, var513)
			local _ = var528
			var513 = var529
		elseif var514 == protoModule.wireTypes.i64 then
			local _ = nil
			local var530, var531 = protoModule.readFixed64(p27, var513)
			local _ = var530
			var513 = var531
		else
			error("Unsupported wire type: " .. var978)
		end
	end
	return var512
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
	local var532 = t_27.new()
	
	if self.action_type ~= nil then
		var532.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var532.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var532.action_params = t.ShareAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var532.action_params = t.ShareAction_Params.jsonDecode(self.actionParams)
	end
	return var532
end

t_27.descriptor = {
	name = "ShareAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareAction"
}
t.ShareAction = t_27
typeRegistryModule.default:register(t.ShareAction)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p28)
	-- upvalues: t_28 (ref)
	return setmetatable({
		oneof_prop = if p28 == nil or p28.oneof_prop == nil then nil else p28.oneof_prop
	}, t_28)
end

function t_28:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var532 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "generic_share_link_data" then
			local var533 = self.oneof_prop.value:encode()
			local var534, var535 = protoModule.writeTag(buff, var532, 1, protoModule.wireTypes.lengthDelimited)
			var534, var1002 = protoModule.writeBuffer(var534, var535, var533, buffer.len(var533))
			buff = var534
			var532 = var535
		elseif self.oneof_prop.type == "share_link_fetch_data" then
			local var536 = self.oneof_prop.value:encode()
			local var537, var538 = protoModule.writeTag(buff, var532, 2, protoModule.wireTypes.lengthDelimited)
			var537, var1005 = protoModule.writeBuffer(var537, var538, var536, buffer.len(var536))
			buff = var537
			var532 = var538
		end
	end
	local buff_1 = buffer.create(var532)
	buffer.copy(buff_1, 0, buff, 0, var532)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref), shareLinkDataModule (ref)
	local var532 = t_28.new()
	local var533 = 0
	while var533 < buffer.len(p28) do
		local _ = nil
		local var534 = nil
		local var535, var536, var537 = protoModule.readTag(p28, var533)
		local var538 = var535
		var534 = var536
		var533 = var537
		
		if var534 == protoModule.wireTypes.varint then
			local _ = nil
			local var539, var540 = protoModule.readVarInt(p28, var533)
			local _ = var539
			var533 = var540
			continue
		end
		if var534 == protoModule.wireTypes.lengthDelimited then
			if var538 == 1 then
				local _ = nil
				local var541, var542 = protoModule.readBuffer(p28, var533)
				var533 = var542
				var532.oneof_prop = {
					type = "generic_share_link_data",
					value = shareLinkDataModule.GenericShareLinkData.decode(var541)
				}
			elseif var538 == 2 then
				local _ = nil
				local var543, var544 = protoModule.readBuffer(p28, var533)
				var533 = var544
				var532.oneof_prop = {
					type = "share_link_fetch_data",
					value = shareLinkDataModule.ShareLinkFetchData.decode(var543)
				}
			else
				local _ = nil
				local var545, var546 = protoModule.readVarInt(p28, var533)
				var533 = var546 + var545
			end
		elseif var534 == protoModule.wireTypes.i32 then
			local _ = nil
			local var547, var548 = protoModule.readFixed32(p28, var533)
			local _ = var547
			var533 = var548
		elseif var534 == protoModule.wireTypes.i64 then
			local _ = nil
			local var549, var550 = protoModule.readFixed64(p28, var533)
			local _ = var549
			var533 = var550
		else
			error("Unsupported wire type: " .. var1009)
		end
	end
	return var532
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
	local var551 = t_28.new()
	
	if self.generic_share_link_data ~= nil then
		var551.oneof_prop = {
			type = "generic_share_link_data",
			value = shareLinkDataModule.GenericShareLinkData.jsonDecode(self.generic_share_link_data)
		}
	end
	if self.genericShareLinkData ~= nil then
		var551.oneof_prop = {
			type = "generic_share_link_data",
			value = shareLinkDataModule.GenericShareLinkData.jsonDecode(self.genericShareLinkData)
		}
	end
	if self.share_link_fetch_data ~= nil then
		var551.oneof_prop = {
			type = "share_link_fetch_data",
			value = shareLinkDataModule.ShareLinkFetchData.jsonDecode(self.share_link_fetch_data)
		}
	end
	if self.shareLinkFetchData ~= nil then
		var551.oneof_prop = {
			type = "share_link_fetch_data",
			value = shareLinkDataModule.ShareLinkFetchData.jsonDecode(self.shareLinkFetchData)
		}
	end
	return var551
end

t_28.descriptor = {
	name = "ShareAction_ShareLinkData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkData"
}
t.ShareAction_ShareLinkData = t_28
typeRegistryModule.default:register(t.ShareAction_ShareLinkData)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p29)
	-- upvalues: t_29 (ref)
	return setmetatable({
		share_link_type = if p29 == nil or p29.share_link_type == nil then nil else p29.share_link_type,
		share_link_data = if p29 == nil or p29.share_link_data == nil then nil else p29.share_link_data,
		entry_point_key = if p29 == nil or p29.entry_point_key == nil then nil else p29.entry_point_key
	}, t_29)
end

function t_29:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var551 = 0
	
	if self.share_link_type ~= nil then
		local var552 = self.share_link_type:encode()
		local var553, var554 = protoModule.writeTag(buff, var551, 1, protoModule.wireTypes.lengthDelimited)
		var553, var1032 = protoModule.writeBuffer(var553, var554, var552, buffer.len(var552))
		buff = var553
		var551 = var554
	end
	if self.share_link_data ~= nil then
		local var555 = self.share_link_data:encode()
		local var556, var557 = protoModule.writeTag(buff, var551, 2, protoModule.wireTypes.lengthDelimited)
		var556, var1035 = protoModule.writeBuffer(var556, var557, var555, buffer.len(var555))
		buff = var556
		var551 = var557
	end
	if self.entry_point_key ~= nil then
		local var558 = self.entry_point_key:encode()
		local var559, var560 = protoModule.writeTag(buff, var551, 3, protoModule.wireTypes.lengthDelimited)
		var559, var1038 = protoModule.writeBuffer(var559, var560, var558, buffer.len(var558))
		buff = var559
		var551 = var560
	end
	local buff_1 = buffer.create(var551)
	buffer.copy(buff_1, 0, buff, 0, var551)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var551 = t_29.new()
	local var552 = 0
	while var552 < buffer.len(p29) do
		local _ = nil
		local var553 = nil
		local var554, var555, var556 = protoModule.readTag(p29, var552)
		local var557 = var554
		var553 = var555
		var552 = var556
		
		if var553 == protoModule.wireTypes.varint then
			local _ = nil
			local var558, var559 = protoModule.readVarInt(p29, var552)
			local _ = var558
			var552 = var559
			continue
		end
		if var553 == protoModule.wireTypes.lengthDelimited then
			if var557 == 1 then
				local _ = nil
				local var560, var561 = protoModule.readBuffer(p29, var552)
				var552 = var561
				var551.share_link_type = propTypesModule.StringProp.decode(var560)
			elseif var557 == 2 then
				local _ = nil
				local var562, var563 = protoModule.readBuffer(p29, var552)
				var552 = var563
				var551.share_link_data = t.ShareAction_ShareLinkData.decode(var562)
			elseif var557 == 3 then
				local _ = nil
				local var564, var565 = protoModule.readBuffer(p29, var552)
				var552 = var565
				var551.entry_point_key = propTypesModule.StringProp.decode(var564)
			else
				local _ = nil
				local var566, var567 = protoModule.readVarInt(p29, var552)
				var552 = var567 + var566
			end
		elseif var553 == protoModule.wireTypes.i32 then
			local _ = nil
			local var568, var569 = protoModule.readFixed32(p29, var552)
			local _ = var568
			var552 = var569
		elseif var553 == protoModule.wireTypes.i64 then
			local _ = nil
			local var570, var571 = protoModule.readFixed64(p29, var552)
			local _ = var570
			var552 = var571
		else
			error("Unsupported wire type: " .. var1042)
		end
	end
	return var551
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
	local var572 = t_29.new()
	
	if self.share_link_type ~= nil then
		var572.share_link_type = propTypesModule.StringProp.jsonDecode(self.share_link_type)
	end
	if self.shareLinkType ~= nil then
		var572.share_link_type = propTypesModule.StringProp.jsonDecode(self.shareLinkType)
	end
	if self.share_link_data ~= nil then
		var572.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.share_link_data)
	end
	if self.shareLinkData ~= nil then
		var572.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.shareLinkData)
	end
	if self.entry_point_key ~= nil then
		var572.entry_point_key = propTypesModule.StringProp.jsonDecode(self.entry_point_key)
	end
	if self.entryPointKey ~= nil then
		var572.entry_point_key = propTypesModule.StringProp.jsonDecode(self.entryPointKey)
	end
	return var572
end

t_29.descriptor = {
	name = "ShareAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ShareAction_Params = t_29
typeRegistryModule.default:register(t.ShareAction_Params)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p30)
	-- upvalues: t (ref), t_30 (ref)
	return setmetatable({
		action_type = if p30 == nil or p30.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p30.action_type,
		action_params = if p30 == nil or p30.action_params == nil then nil else p30.action_params
	}, t_30)
end

function t_30:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var572 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var573, var574 = protoModule.writeTag(buff, var572, 1, protoModule.wireTypes.varint)
		var573, var1066 = protoModule.writeVarInt(var573, var574, t.ActionType.toNumber(self.action_type))
		buff = var573
		var572 = var574
	end
	if self.action_params ~= nil then
		local var575 = self.action_params:encode()
		local var576, var577 = protoModule.writeTag(buff, var572, 2, protoModule.wireTypes.lengthDelimited)
		var576, var1069 = protoModule.writeBuffer(var576, var577, var575, buffer.len(var575))
		buff = var576
		var572 = var577
	end
	local buff_1 = buffer.create(var572)
	buffer.copy(buff_1, 0, buff, 0, var572)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref), t (ref)
	local var572 = t_30.new()
	local var573 = 0
	while var573 < buffer.len(p30) do
		local _ = nil
		local var574 = nil
		local var575, var576, var577 = protoModule.readTag(p30, var573)
		local var578 = var575
		var574 = var576
		var573 = var577
		
		if var574 == protoModule.wireTypes.varint then
			if var578 == 1 then
				local _ = nil
				local var579, var580 = protoModule.readVarIntI32(p30, var573)
				local var581 = var579
				var573 = var580
				var572.action_type = t.ActionType.fromNumber(var581) or var581
			else
				local _ = nil
				local var582, var583 = protoModule.readVarInt(p30, var573)
				local _ = var582
				var573 = var583
			end
		end
		if var574 == protoModule.wireTypes.lengthDelimited then
			if var578 == 2 then
				local _ = nil
				local var584, var585 = protoModule.readBuffer(p30, var573)
				var573 = var585
				var572.action_params = t.OpenAbuseReportAction_Params.decode(var584)
			else
				local _ = nil
				local var586, var587 = protoModule.readVarInt(p30, var573)
				var573 = var587 + var586
			end
		elseif var574 == protoModule.wireTypes.i32 then
			local _ = nil
			local var588, var589 = protoModule.readFixed32(p30, var573)
			local _ = var588
			var573 = var589
		elseif var574 == protoModule.wireTypes.i64 then
			local _ = nil
			local var590, var591 = protoModule.readFixed64(p30, var573)
			local _ = var590
			var573 = var591
		else
			error("Unsupported wire type: " .. var1073)
		end
	end
	return var572
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
	local var592 = t_30.new()
	
	if self.action_type ~= nil then
		var592.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var592.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var592.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var592.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.actionParams)
	end
	return var592
end

t_30.descriptor = {
	name = "OpenAbuseReportAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAbuseReportAction"
}
t.OpenAbuseReportAction = t_30
typeRegistryModule.default:register(t.OpenAbuseReportAction)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p31)
	-- upvalues: t_31 (ref)
	return setmetatable({
		target_id = if p31 == nil or p31.target_id == nil then nil else p31.target_id,
		abuse_vector = if p31 == nil or p31.abuse_vector == nil then nil else p31.abuse_vector,
		asset_type_name = if p31 == nil or p31.asset_type_name == nil then nil else p31.asset_type_name,
		universe_id = if p31 == nil or p31.universe_id == nil then nil else p31.universe_id
	}, t_31)
end

function t_31:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var592 = 0
	
	if self.target_id ~= nil then
		local var593 = self.target_id:encode()
		local var594, var595 = protoModule.writeTag(buff, var592, 1, protoModule.wireTypes.lengthDelimited)
		var594, var1097 = protoModule.writeBuffer(var594, var595, var593, buffer.len(var593))
		buff = var594
		var592 = var595
	end
	if self.abuse_vector ~= nil then
		local var596 = self.abuse_vector:encode()
		local var597, var598 = protoModule.writeTag(buff, var592, 2, protoModule.wireTypes.lengthDelimited)
		var597, var1100 = protoModule.writeBuffer(var597, var598, var596, buffer.len(var596))
		buff = var597
		var592 = var598
	end
	if self.asset_type_name ~= nil then
		local var599 = self.asset_type_name:encode()
		local var600, var601 = protoModule.writeTag(buff, var592, 3, protoModule.wireTypes.lengthDelimited)
		var600, var1103 = protoModule.writeBuffer(var600, var601, var599, buffer.len(var599))
		buff = var600
		var592 = var601
	end
	if self.universe_id ~= nil then
		local var602 = self.universe_id:encode()
		local var603, var604 = protoModule.writeTag(buff, var592, 4, protoModule.wireTypes.lengthDelimited)
		var603, var1106 = protoModule.writeBuffer(var603, var604, var602, buffer.len(var602))
		buff = var603
		var592 = var604
	end
	local buff_1 = buffer.create(var592)
	buffer.copy(buff_1, 0, buff, 0, var592)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref), propTypesModule (ref)
	local var592 = t_31.new()
	local var593 = 0
	while var593 < buffer.len(p31) do
		local _ = nil
		local var594 = nil
		local var595, var596, var597 = protoModule.readTag(p31, var593)
		local var598 = var595
		var594 = var596
		var593 = var597
		
		if var594 == protoModule.wireTypes.varint then
			local _ = nil
			local var599, var600 = protoModule.readVarInt(p31, var593)
			local _ = var599
			var593 = var600
			continue
		end
		if var594 == protoModule.wireTypes.lengthDelimited then
			if var598 == 1 then
				local _ = nil
				local var601, var602 = protoModule.readBuffer(p31, var593)
				var593 = var602
				var592.target_id = propTypesModule.StringProp.decode(var601)
			elseif var598 == 2 then
				local _ = nil
				local var603, var604 = protoModule.readBuffer(p31, var593)
				var593 = var604
				var592.abuse_vector = propTypesModule.StringProp.decode(var603)
			elseif var598 == 3 then
				local _ = nil
				local var605, var606 = protoModule.readBuffer(p31, var593)
				var593 = var606
				var592.asset_type_name = propTypesModule.StringProp.decode(var605)
			elseif var598 == 4 then
				local _ = nil
				local var607, var608 = protoModule.readBuffer(p31, var593)
				var593 = var608
				var592.universe_id = propTypesModule.StringProp.decode(var607)
			else
				local _ = nil
				local var609, var610 = protoModule.readVarInt(p31, var593)
				var593 = var610 + var609
			end
		elseif var594 == protoModule.wireTypes.i32 then
			local _ = nil
			local var611, var612 = protoModule.readFixed32(p31, var593)
			local _ = var611
			var593 = var612
		elseif var594 == protoModule.wireTypes.i64 then
			local _ = nil
			local var613, var614 = protoModule.readFixed64(p31, var593)
			local _ = var613
			var593 = var614
		else
			error("Unsupported wire type: " .. var1110)
		end
	end
	return var592
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
	local var615 = t_31.new()
	
	if self.target_id ~= nil then
		var615.target_id = propTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		var615.target_id = propTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.abuse_vector ~= nil then
		var615.abuse_vector = propTypesModule.StringProp.jsonDecode(self.abuse_vector)
	end
	if self.abuseVector ~= nil then
		var615.abuse_vector = propTypesModule.StringProp.jsonDecode(self.abuseVector)
	end
	if self.asset_type_name ~= nil then
		var615.asset_type_name = propTypesModule.StringProp.jsonDecode(self.asset_type_name)
	end
	if self.assetTypeName ~= nil then
		var615.asset_type_name = propTypesModule.StringProp.jsonDecode(self.assetTypeName)
	end
	if self.universe_id ~= nil then
		var615.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var615.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var615
end

t_31.descriptor = {
	name = "OpenAbuseReportAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAbuseReportAction_Params = t_31
typeRegistryModule.default:register(t.OpenAbuseReportAction_Params)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p32)
	-- upvalues: t (ref), t_32 (ref)
	return setmetatable({
		action_type = if p32 == nil or p32.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p32.action_type,
		action_params = if p32 == nil or p32.action_params == nil then nil else p32.action_params
	}, t_32)
end

function t_32:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var615 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var616, var617 = protoModule.writeTag(buff, var615, 1, protoModule.wireTypes.varint)
		var616, var1136 = protoModule.writeVarInt(var616, var617, t.ActionType.toNumber(self.action_type))
		buff = var616
		var615 = var617
	end
	if self.action_params ~= nil then
		local var618 = self.action_params:encode()
		local var619, var620 = protoModule.writeTag(buff, var615, 2, protoModule.wireTypes.lengthDelimited)
		var619, var1139 = protoModule.writeBuffer(var619, var620, var618, buffer.len(var618))
		buff = var619
		var615 = var620
	end
	local buff_1 = buffer.create(var615)
	buffer.copy(buff_1, 0, buff, 0, var615)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref), t (ref)
	local var615 = t_32.new()
	local var616 = 0
	while var616 < buffer.len(p32) do
		local _ = nil
		local var617 = nil
		local var618, var619, var620 = protoModule.readTag(p32, var616)
		local var621 = var618
		var617 = var619
		var616 = var620
		
		if var617 == protoModule.wireTypes.varint then
			if var621 == 1 then
				local _ = nil
				local var622, var623 = protoModule.readVarIntI32(p32, var616)
				local var624 = var622
				var616 = var623
				var615.action_type = t.ActionType.fromNumber(var624) or var624
			else
				local _ = nil
				local var625, var626 = protoModule.readVarInt(p32, var616)
				local _ = var625
				var616 = var626
			end
		end
		if var617 == protoModule.wireTypes.lengthDelimited then
			if var621 == 2 then
				local _ = nil
				local var627, var628 = protoModule.readBuffer(p32, var616)
				var616 = var628
				var615.action_params = t.RemoveBadgeFromInventoryAction_Params.decode(var627)
			else
				local _ = nil
				local var629, var630 = protoModule.readVarInt(p32, var616)
				var616 = var630 + var629
			end
		elseif var617 == protoModule.wireTypes.i32 then
			local _ = nil
			local var631, var632 = protoModule.readFixed32(p32, var616)
			local _ = var631
			var616 = var632
		elseif var617 == protoModule.wireTypes.i64 then
			local _ = nil
			local var633, var634 = protoModule.readFixed64(p32, var616)
			local _ = var633
			var616 = var634
		else
			error("Unsupported wire type: " .. var1143)
		end
	end
	return var615
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
	local var635 = t_32.new()
	
	if self.action_type ~= nil then
		var635.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var635.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var635.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var635.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.actionParams)
	end
	return var635
end

t_32.descriptor = {
	name = "RemoveBadgeFromInventoryAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RemoveBadgeFromInventoryAction"
}
t.RemoveBadgeFromInventoryAction = t_32
typeRegistryModule.default:register(t.RemoveBadgeFromInventoryAction)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p33)
	-- upvalues: t_33 (ref)
	return setmetatable({
		asset_id = if p33 == nil or p33.asset_id == nil then nil else p33.asset_id
	}, t_33)
end

function t_33:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var635 = 0
	
	if self.asset_id ~= nil then
		local var636 = self.asset_id:encode()
		local var637, var638 = protoModule.writeTag(buff, var635, 1, protoModule.wireTypes.lengthDelimited)
		var637, var1167 = protoModule.writeBuffer(var637, var638, var636, buffer.len(var636))
		buff = var637
		var635 = var638
	end
	local buff_1 = buffer.create(var635)
	buffer.copy(buff_1, 0, buff, 0, var635)
	
	return buff_1
end

function t_33.decode(p33)
	-- upvalues: t_33 (ref), protoModule (ref), propTypesModule (ref)
	local var635 = t_33.new()
	local var636 = 0
	while var636 < buffer.len(p33) do
		local _ = nil
		local var637 = nil
		local var638, var639, var640 = protoModule.readTag(p33, var636)
		local var641 = var638
		var637 = var639
		var636 = var640
		
		if var637 == protoModule.wireTypes.varint then
			local _ = nil
			local var642, var643 = protoModule.readVarInt(p33, var636)
			local _ = var642
			var636 = var643
			continue
		end
		if var637 == protoModule.wireTypes.lengthDelimited then
			if var641 == 1 then
				local _ = nil
				local var644, var645 = protoModule.readBuffer(p33, var636)
				var636 = var645
				var635.asset_id = propTypesModule.StringProp.decode(var644)
			else
				local _ = nil
				local var646, var647 = protoModule.readVarInt(p33, var636)
				var636 = var647 + var646
			end
		elseif var637 == protoModule.wireTypes.i32 then
			local _ = nil
			local var648, var649 = protoModule.readFixed32(p33, var636)
			local _ = var648
			var636 = var649
		elseif var637 == protoModule.wireTypes.i64 then
			local _ = nil
			local var650, var651 = protoModule.readFixed64(p33, var636)
			local _ = var650
			var636 = var651
		else
			error("Unsupported wire type: " .. var1171)
		end
	end
	return var635
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
	local var652 = t_33.new()
	
	if self.asset_id ~= nil then
		var652.asset_id = propTypesModule.StringProp.jsonDecode(self.asset_id)
	end
	if self.assetId ~= nil then
		var652.asset_id = propTypesModule.StringProp.jsonDecode(self.assetId)
	end
	return var652
end

t_33.descriptor = {
	name = "RemoveBadgeFromInventoryAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RemoveBadgeFromInventoryAction_Params = t_33
typeRegistryModule.default:register(t.RemoveBadgeFromInventoryAction_Params)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p34)
	-- upvalues: t (ref), t_34 (ref)
	return setmetatable({
		action_type = if p34 == nil or p34.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p34.action_type,
		action_params = if p34 == nil or p34.action_params == nil then nil else p34.action_params
	}, t_34)
end

function t_34:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var652 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var653, var654 = protoModule.writeTag(buff, var652, 1, protoModule.wireTypes.varint)
		var653, var1191 = protoModule.writeVarInt(var653, var654, t.ActionType.toNumber(self.action_type))
		buff = var653
		var652 = var654
	end
	if self.action_params ~= nil then
		local var655 = self.action_params:encode()
		local var656, var657 = protoModule.writeTag(buff, var652, 2, protoModule.wireTypes.lengthDelimited)
		var656, var1194 = protoModule.writeBuffer(var656, var657, var655, buffer.len(var655))
		buff = var656
		var652 = var657
	end
	local buff_1 = buffer.create(var652)
	buffer.copy(buff_1, 0, buff, 0, var652)
	
	return buff_1
end

function t_34.decode(p34)
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var652 = t_34.new()
	local var653 = 0
	while var653 < buffer.len(p34) do
		local _ = nil
		local var654 = nil
		local var655, var656, var657 = protoModule.readTag(p34, var653)
		local var658 = var655
		var654 = var656
		var653 = var657
		
		if var654 == protoModule.wireTypes.varint then
			if var658 == 1 then
				local _ = nil
				local var659, var660 = protoModule.readVarIntI32(p34, var653)
				local var661 = var659
				var653 = var660
				var652.action_type = t.ActionType.fromNumber(var661) or var661
			else
				local _ = nil
				local var662, var663 = protoModule.readVarInt(p34, var653)
				local _ = var662
				var653 = var663
			end
		end
		if var654 == protoModule.wireTypes.lengthDelimited then
			if var658 == 2 then
				local _ = nil
				local var664, var665 = protoModule.readBuffer(p34, var653)
				var653 = var665
				var652.action_params = t.OpenProfileAction_Params.decode(var664)
			else
				local _ = nil
				local var666, var667 = protoModule.readVarInt(p34, var653)
				var653 = var667 + var666
			end
		elseif var654 == protoModule.wireTypes.i32 then
			local _ = nil
			local var668, var669 = protoModule.readFixed32(p34, var653)
			local _ = var668
			var653 = var669
		elseif var654 == protoModule.wireTypes.i64 then
			local _ = nil
			local var670, var671 = protoModule.readFixed64(p34, var653)
			local _ = var670
			var653 = var671
		else
			error("Unsupported wire type: " .. var1198)
		end
	end
	return var652
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
	local var672 = t_34.new()
	
	if self.action_type ~= nil then
		var672.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var672.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var672.action_params = t.OpenProfileAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var672.action_params = t.OpenProfileAction_Params.jsonDecode(self.actionParams)
	end
	return var672
end

t_34.descriptor = {
	name = "OpenProfileAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenProfileAction"
}
t.OpenProfileAction = t_34
typeRegistryModule.default:register(t.OpenProfileAction)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p35)
	-- upvalues: t_35 (ref)
	return setmetatable({
		profile_id = if p35 == nil or p35.profile_id == nil then nil else p35.profile_id,
		profile_type = if p35 == nil or p35.profile_type == nil then nil else p35.profile_type,
		source = if p35 == nil or p35.source == nil then nil else p35.source
	}, t_35)
end

function t_35:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var672 = 0
	
	if self.profile_id ~= nil then
		local var673 = self.profile_id:encode()
		local var674, var675 = protoModule.writeTag(buff, var672, 1, protoModule.wireTypes.lengthDelimited)
		var674, var1222 = protoModule.writeBuffer(var674, var675, var673, buffer.len(var673))
		buff = var674
		var672 = var675
	end
	if self.profile_type ~= nil then
		local var676 = self.profile_type:encode()
		local var677, var678 = protoModule.writeTag(buff, var672, 2, protoModule.wireTypes.lengthDelimited)
		var677, var1225 = protoModule.writeBuffer(var677, var678, var676, buffer.len(var676))
		buff = var677
		var672 = var678
	end
	if self.source ~= nil then
		local var679 = self.source:encode()
		local var680, var681 = protoModule.writeTag(buff, var672, 3, protoModule.wireTypes.lengthDelimited)
		var680, var1228 = protoModule.writeBuffer(var680, var681, var679, buffer.len(var679))
		buff = var680
		var672 = var681
	end
	local buff_1 = buffer.create(var672)
	buffer.copy(buff_1, 0, buff, 0, var672)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref), propTypesModule (ref)
	local var672 = t_35.new()
	local var673 = 0
	while var673 < buffer.len(p35) do
		local _ = nil
		local var674 = nil
		local var675, var676, var677 = protoModule.readTag(p35, var673)
		local var678 = var675
		var674 = var676
		var673 = var677
		
		if var674 == protoModule.wireTypes.varint then
			local _ = nil
			local var679, var680 = protoModule.readVarInt(p35, var673)
			local _ = var679
			var673 = var680
			continue
		end
		if var674 == protoModule.wireTypes.lengthDelimited then
			if var678 == 1 then
				local _ = nil
				local var681, var682 = protoModule.readBuffer(p35, var673)
				var673 = var682
				var672.profile_id = propTypesModule.StringProp.decode(var681)
			elseif var678 == 2 then
				local _ = nil
				local var683, var684 = protoModule.readBuffer(p35, var673)
				var673 = var684
				var672.profile_type = propTypesModule.StringProp.decode(var683)
			elseif var678 == 3 then
				local _ = nil
				local var685, var686 = protoModule.readBuffer(p35, var673)
				var673 = var686
				var672.source = propTypesModule.StringProp.decode(var685)
			else
				local _ = nil
				local var687, var688 = protoModule.readVarInt(p35, var673)
				var673 = var688 + var687
			end
		elseif var674 == protoModule.wireTypes.i32 then
			local _ = nil
			local var689, var690 = protoModule.readFixed32(p35, var673)
			local _ = var689
			var673 = var690
		elseif var674 == protoModule.wireTypes.i64 then
			local _ = nil
			local var691, var692 = protoModule.readFixed64(p35, var673)
			local _ = var691
			var673 = var692
		else
			error("Unsupported wire type: " .. var1232)
		end
	end
	return var672
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
	local var693 = t_35.new()
	
	if self.profile_id ~= nil then
		var693.profile_id = propTypesModule.StringProp.jsonDecode(self.profile_id)
	end
	if self.profileId ~= nil then
		var693.profile_id = propTypesModule.StringProp.jsonDecode(self.profileId)
	end
	if self.profile_type ~= nil then
		var693.profile_type = propTypesModule.StringProp.jsonDecode(self.profile_type)
	end
	if self.profileType ~= nil then
		var693.profile_type = propTypesModule.StringProp.jsonDecode(self.profileType)
	end
	if self.source ~= nil then
		var693.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var693
end

t_35.descriptor = {
	name = "OpenProfileAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenProfileAction_Params = t_35
typeRegistryModule.default:register(t.OpenProfileAction_Params)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p36)
	-- upvalues: t (ref), t_36 (ref)
	return setmetatable({
		action_type = if p36 == nil or p36.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p36.action_type,
		action_params = if p36 == nil or p36.action_params == nil then nil else p36.action_params
	}, t_36)
end

function t_36:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var693 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var694, var695 = protoModule.writeTag(buff, var693, 1, protoModule.wireTypes.varint)
		var694, var1256 = protoModule.writeVarInt(var694, var695, t.ActionType.toNumber(self.action_type))
		buff = var694
		var693 = var695
	end
	if self.action_params ~= nil then
		local var696 = self.action_params:encode()
		local var697, var698 = protoModule.writeTag(buff, var693, 2, protoModule.wireTypes.lengthDelimited)
		var697, var1259 = protoModule.writeBuffer(var697, var698, var696, buffer.len(var696))
		buff = var697
		var693 = var698
	end
	local buff_1 = buffer.create(var693)
	buffer.copy(buff_1, 0, buff, 0, var693)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var693 = t_36.new()
	local var694 = 0
	while var694 < buffer.len(p36) do
		local _ = nil
		local var695 = nil
		local var696, var697, var698 = protoModule.readTag(p36, var694)
		local var699 = var696
		var695 = var697
		var694 = var698
		
		if var695 == protoModule.wireTypes.varint then
			if var699 == 1 then
				local _ = nil
				local var700, var701 = protoModule.readVarIntI32(p36, var694)
				local var702 = var700
				var694 = var701
				var693.action_type = t.ActionType.fromNumber(var702) or var702
			else
				local _ = nil
				local var703, var704 = protoModule.readVarInt(p36, var694)
				local _ = var703
				var694 = var704
			end
		end
		if var695 == protoModule.wireTypes.lengthDelimited then
			if var699 == 2 then
				local _ = nil
				local var705, var706 = protoModule.readBuffer(p36, var694)
				var694 = var706
				var693.action_params = t.OpenFacialAgeEstimationAction_Params.decode(var705)
			else
				local _ = nil
				local var707, var708 = protoModule.readVarInt(p36, var694)
				var694 = var708 + var707
			end
		elseif var695 == protoModule.wireTypes.i32 then
			local _ = nil
			local var709, var710 = protoModule.readFixed32(p36, var694)
			local _ = var709
			var694 = var710
		elseif var695 == protoModule.wireTypes.i64 then
			local _ = nil
			local var711, var712 = protoModule.readFixed64(p36, var694)
			local _ = var711
			var694 = var712
		else
			error("Unsupported wire type: " .. var1263)
		end
	end
	return var693
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
	local var713 = t_36.new()
	
	if self.action_type ~= nil then
		var713.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var713.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var713.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var713.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.actionParams)
	end
	return var713
end

t_36.descriptor = {
	name = "OpenFacialAgeEstimationAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenFacialAgeEstimationAction"
}
t.OpenFacialAgeEstimationAction = t_36
typeRegistryModule.default:register(t.OpenFacialAgeEstimationAction)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p37)
	-- upvalues: t_37 (ref)
	return setmetatable({
		user_id = if p37 == nil or p37.user_id == nil then nil else p37.user_id,
		source = if p37 == nil or p37.source == nil then nil else p37.source,
		context = if p37 == nil or p37.context == nil then nil else p37.context,
		is_in_experience = if p37 == nil or p37.is_in_experience == nil then nil else p37.is_in_experience,
		on_success = if p37 == nil or p37.on_success == nil then nil else p37.on_success,
		on_failure = if p37 == nil or p37.on_failure == nil then nil else p37.on_failure,
		should_include_vpc = if p37 == nil or p37.should_include_vpc == nil then nil else p37.should_include_vpc
	}, t_37)
end

function t_37:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var713 = 0
	
	if self.user_id ~= nil then
		local var714 = self.user_id:encode()
		local var715, var716 = protoModule.writeTag(buff, var713, 1, protoModule.wireTypes.lengthDelimited)
		var715, var1287 = protoModule.writeBuffer(var715, var716, var714, buffer.len(var714))
		buff = var715
		var713 = var716
	end
	if self.source ~= nil then
		local var717 = self.source:encode()
		local var718, var719 = protoModule.writeTag(buff, var713, 2, protoModule.wireTypes.lengthDelimited)
		var718, var1290 = protoModule.writeBuffer(var718, var719, var717, buffer.len(var717))
		buff = var718
		var713 = var719
	end
	if self.context ~= nil then
		local var720 = self.context:encode()
		local var721, var722 = protoModule.writeTag(buff, var713, 3, protoModule.wireTypes.lengthDelimited)
		var721, var1293 = protoModule.writeBuffer(var721, var722, var720, buffer.len(var720))
		buff = var721
		var713 = var722
	end
	if self.is_in_experience ~= nil then
		local var723 = self.is_in_experience:encode()
		local var724, var725 = protoModule.writeTag(buff, var713, 4, protoModule.wireTypes.lengthDelimited)
		var724, var1296 = protoModule.writeBuffer(var724, var725, var723, buffer.len(var723))
		buff = var724
		var713 = var725
	end
	if self.on_success ~= nil then
		local var726 = self.on_success:encode()
		local var727, var728 = protoModule.writeTag(buff, var713, 5, protoModule.wireTypes.lengthDelimited)
		var727, var1299 = protoModule.writeBuffer(var727, var728, var726, buffer.len(var726))
		buff = var727
		var713 = var728
	end
	if self.on_failure ~= nil then
		local var729 = self.on_failure:encode()
		local var730, var731 = protoModule.writeTag(buff, var713, 6, protoModule.wireTypes.lengthDelimited)
		var730, var1302 = protoModule.writeBuffer(var730, var731, var729, buffer.len(var729))
		buff = var730
		var713 = var731
	end
	if self.should_include_vpc ~= nil then
		local var732 = self.should_include_vpc:encode()
		local var733, var734 = protoModule.writeTag(buff, var713, 7, protoModule.wireTypes.lengthDelimited)
		var733, var1305 = protoModule.writeBuffer(var733, var734, var732, buffer.len(var732))
		buff = var733
		var713 = var734
	end
	local buff_1 = buffer.create(var713)
	buffer.copy(buff_1, 0, buff, 0, var713)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var713 = t_37.new()
	local var714 = 0
	while var714 < buffer.len(p37) do
		local _ = nil
		local var715 = nil
		local var716, var717, var718 = protoModule.readTag(p37, var714)
		local var719 = var716
		var715 = var717
		var714 = var718
		
		if var715 == protoModule.wireTypes.varint then
			local _ = nil
			local var720, var721 = protoModule.readVarInt(p37, var714)
			local _ = var720
			var714 = var721
			continue
		end
		if var715 == protoModule.wireTypes.lengthDelimited then
			if var719 == 1 then
				local _ = nil
				local var722, var723 = protoModule.readBuffer(p37, var714)
				var714 = var723
				var713.user_id = propTypesModule.StringProp.decode(var722)
			elseif var719 == 2 then
				local _ = nil
				local var724, var725 = protoModule.readBuffer(p37, var714)
				var714 = var725
				var713.source = propTypesModule.StringProp.decode(var724)
			elseif var719 == 3 then
				local _ = nil
				local var726, var727 = protoModule.readBuffer(p37, var714)
				var714 = var727
				var713.context = propTypesModule.StringProp.decode(var726)
			elseif var719 == 4 then
				local _ = nil
				local var728, var729 = protoModule.readBuffer(p37, var714)
				var714 = var729
				var713.is_in_experience = propTypesModule.BoolProp.decode(var728)
			elseif var719 == 5 then
				local _ = nil
				local var730, var731 = protoModule.readBuffer(p37, var714)
				var714 = var731
				var713.on_success = t.ActionProp.decode(var730)
			elseif var719 == 6 then
				local _ = nil
				local var732, var733 = protoModule.readBuffer(p37, var714)
				var714 = var733
				var713.on_failure = t.ActionProp.decode(var732)
			elseif var719 == 7 then
				local _ = nil
				local var734, var735 = protoModule.readBuffer(p37, var714)
				var714 = var735
				var713.should_include_vpc = propTypesModule.BoolProp.decode(var734)
			else
				local _ = nil
				local var736, var737 = protoModule.readVarInt(p37, var714)
				var714 = var737 + var736
			end
		elseif var715 == protoModule.wireTypes.i32 then
			local _ = nil
			local var738, var739 = protoModule.readFixed32(p37, var714)
			local _ = var738
			var714 = var739
		elseif var715 == protoModule.wireTypes.i64 then
			local _ = nil
			local var740, var741 = protoModule.readFixed64(p37, var714)
			local _ = var740
			var714 = var741
		else
			error("Unsupported wire type: " .. var1309)
		end
	end
	return var713
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
	local var742 = t_37.new()
	
	if self.user_id ~= nil then
		var742.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var742.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var742.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.context ~= nil then
		var742.context = propTypesModule.StringProp.jsonDecode(self.context)
	end
	if self.is_in_experience ~= nil then
		var742.is_in_experience = propTypesModule.BoolProp.jsonDecode(self.is_in_experience)
	end
	if self.isInExperience ~= nil then
		var742.is_in_experience = propTypesModule.BoolProp.jsonDecode(self.isInExperience)
	end
	if self.on_success ~= nil then
		var742.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var742.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var742.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var742.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	if self.should_include_vpc ~= nil then
		var742.should_include_vpc = propTypesModule.BoolProp.jsonDecode(self.should_include_vpc)
	end
	if self.shouldIncludeVpc ~= nil then
		var742.should_include_vpc = propTypesModule.BoolProp.jsonDecode(self.shouldIncludeVpc)
	end
	return var742
end

t_37.descriptor = {
	name = "OpenFacialAgeEstimationAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenFacialAgeEstimationAction_Params = t_37
typeRegistryModule.default:register(t.OpenFacialAgeEstimationAction_Params)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p38)
	-- upvalues: t (ref), t_38 (ref)
	return setmetatable({
		action_type = if p38 == nil or p38.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p38.action_type,
		action_params = if p38 == nil or p38.action_params == nil then nil else p38.action_params
	}, t_38)
end

function t_38:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var742 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var743, var744 = protoModule.writeTag(buff, var742, 1, protoModule.wireTypes.varint)
		var743, var1341 = protoModule.writeVarInt(var743, var744, t.ActionType.toNumber(self.action_type))
		buff = var743
		var742 = var744
	end
	if self.action_params ~= nil then
		local var745 = self.action_params:encode()
		local var746, var747 = protoModule.writeTag(buff, var742, 2, protoModule.wireTypes.lengthDelimited)
		var746, var1344 = protoModule.writeBuffer(var746, var747, var745, buffer.len(var745))
		buff = var746
		var742 = var747
	end
	local buff_1 = buffer.create(var742)
	buffer.copy(buff_1, 0, buff, 0, var742)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref), t (ref)
	local var742 = t_38.new()
	local var743 = 0
	while var743 < buffer.len(p38) do
		local _ = nil
		local var744 = nil
		local var745, var746, var747 = protoModule.readTag(p38, var743)
		local var748 = var745
		var744 = var746
		var743 = var747
		
		if var744 == protoModule.wireTypes.varint then
			if var748 == 1 then
				local _ = nil
				local var749, var750 = protoModule.readVarIntI32(p38, var743)
				local var751 = var749
				var743 = var750
				var742.action_type = t.ActionType.fromNumber(var751) or var751
			else
				local _ = nil
				local var752, var753 = protoModule.readVarInt(p38, var743)
				local _ = var752
				var743 = var753
			end
		end
		if var744 == protoModule.wireTypes.lengthDelimited then
			if var748 == 2 then
				local _ = nil
				local var754, var755 = protoModule.readBuffer(p38, var743)
				var743 = var755
				var742.action_params = t.ShowToastAction_Params.decode(var754)
			else
				local _ = nil
				local var756, var757 = protoModule.readVarInt(p38, var743)
				var743 = var757 + var756
			end
		elseif var744 == protoModule.wireTypes.i32 then
			local _ = nil
			local var758, var759 = protoModule.readFixed32(p38, var743)
			local _ = var758
			var743 = var759
		elseif var744 == protoModule.wireTypes.i64 then
			local _ = nil
			local var760, var761 = protoModule.readFixed64(p38, var743)
			local _ = var760
			var743 = var761
		else
			error("Unsupported wire type: " .. var1348)
		end
	end
	return var742
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
	local var762 = t_38.new()
	
	if self.action_type ~= nil then
		var762.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var762.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var762.action_params = t.ShowToastAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var762.action_params = t.ShowToastAction_Params.jsonDecode(self.actionParams)
	end
	return var762
end

t_38.descriptor = {
	name = "ShowToastAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShowToastAction"
}
t.ShowToastAction = t_38
typeRegistryModule.default:register(t.ShowToastAction)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p39)
	-- upvalues: t_39 (ref)
	return setmetatable({
		toast_message = if p39 == nil or p39.toast_message == nil then nil else p39.toast_message,
		toast_type = if p39 == nil or p39.toast_type == nil then nil else p39.toast_type,
		dismiss_prompt = if p39 == nil or p39.dismiss_prompt == nil then nil else p39.dismiss_prompt,
		prompt_type = if p39 == nil or p39.prompt_type == nil then nil else p39.prompt_type,
		prompt_id = if p39 == nil or p39.prompt_id == nil then nil else p39.prompt_id
	}, t_39)
end

function t_39:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var762 = 0
	
	if self.toast_message ~= nil then
		local var763 = self.toast_message:encode()
		local var764, var765 = protoModule.writeTag(buff, var762, 1, protoModule.wireTypes.lengthDelimited)
		var764, var1372 = protoModule.writeBuffer(var764, var765, var763, buffer.len(var763))
		buff = var764
		var762 = var765
	end
	if self.toast_type ~= nil then
		local var766 = self.toast_type:encode()
		local var767, var768 = protoModule.writeTag(buff, var762, 2, protoModule.wireTypes.lengthDelimited)
		var767, var1375 = protoModule.writeBuffer(var767, var768, var766, buffer.len(var766))
		buff = var767
		var762 = var768
	end
	if self.dismiss_prompt ~= nil then
		local var769 = self.dismiss_prompt:encode()
		local var770, var771 = protoModule.writeTag(buff, var762, 3, protoModule.wireTypes.lengthDelimited)
		var770, var1378 = protoModule.writeBuffer(var770, var771, var769, buffer.len(var769))
		buff = var770
		var762 = var771
	end
	if self.prompt_type ~= nil then
		local var772 = self.prompt_type:encode()
		local var773, var774 = protoModule.writeTag(buff, var762, 4, protoModule.wireTypes.lengthDelimited)
		var773, var1381 = protoModule.writeBuffer(var773, var774, var772, buffer.len(var772))
		buff = var773
		var762 = var774
	end
	if self.prompt_id ~= nil then
		local var775 = self.prompt_id:encode()
		local var776, var777 = protoModule.writeTag(buff, var762, 5, protoModule.wireTypes.lengthDelimited)
		var776, var1384 = protoModule.writeBuffer(var776, var777, var775, buffer.len(var775))
		buff = var776
		var762 = var777
	end
	local buff_1 = buffer.create(var762)
	buffer.copy(buff_1, 0, buff, 0, var762)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref), propTypesModule (ref)
	local var762 = t_39.new()
	local var763 = 0
	while var763 < buffer.len(p39) do
		local _ = nil
		local var764 = nil
		local var765, var766, var767 = protoModule.readTag(p39, var763)
		local var768 = var765
		var764 = var766
		var763 = var767
		
		if var764 == protoModule.wireTypes.varint then
			local _ = nil
			local var769, var770 = protoModule.readVarInt(p39, var763)
			local _ = var769
			var763 = var770
			continue
		end
		if var764 == protoModule.wireTypes.lengthDelimited then
			if var768 == 1 then
				local _ = nil
				local var771, var772 = protoModule.readBuffer(p39, var763)
				var763 = var772
				var762.toast_message = propTypesModule.StringProp.decode(var771)
			elseif var768 == 2 then
				local _ = nil
				local var773, var774 = protoModule.readBuffer(p39, var763)
				var763 = var774
				var762.toast_type = propTypesModule.StringProp.decode(var773)
			elseif var768 == 3 then
				local _ = nil
				local var775, var776 = protoModule.readBuffer(p39, var763)
				var763 = var776
				var762.dismiss_prompt = propTypesModule.BoolProp.decode(var775)
			elseif var768 == 4 then
				local _ = nil
				local var777, var778 = protoModule.readBuffer(p39, var763)
				var763 = var778
				var762.prompt_type = propTypesModule.StringProp.decode(var777)
			elseif var768 == 5 then
				local _ = nil
				local var779, var780 = protoModule.readBuffer(p39, var763)
				var763 = var780
				var762.prompt_id = propTypesModule.StringProp.decode(var779)
			else
				local _ = nil
				local var781, var782 = protoModule.readVarInt(p39, var763)
				var763 = var782 + var781
			end
		elseif var764 == protoModule.wireTypes.i32 then
			local _ = nil
			local var783, var784 = protoModule.readFixed32(p39, var763)
			local _ = var783
			var763 = var784
		elseif var764 == protoModule.wireTypes.i64 then
			local _ = nil
			local var785, var786 = protoModule.readFixed64(p39, var763)
			local _ = var785
			var763 = var786
		else
			error("Unsupported wire type: " .. var1388)
		end
	end
	return var762
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
	local var787 = t_39.new()
	
	if self.toast_message ~= nil then
		var787.toast_message = propTypesModule.StringProp.jsonDecode(self.toast_message)
	end
	if self.toastMessage ~= nil then
		var787.toast_message = propTypesModule.StringProp.jsonDecode(self.toastMessage)
	end
	if self.toast_type ~= nil then
		var787.toast_type = propTypesModule.StringProp.jsonDecode(self.toast_type)
	end
	if self.toastType ~= nil then
		var787.toast_type = propTypesModule.StringProp.jsonDecode(self.toastType)
	end
	if self.dismiss_prompt ~= nil then
		var787.dismiss_prompt = propTypesModule.BoolProp.jsonDecode(self.dismiss_prompt)
	end
	if self.dismissPrompt ~= nil then
		var787.dismiss_prompt = propTypesModule.BoolProp.jsonDecode(self.dismissPrompt)
	end
	if self.prompt_type ~= nil then
		var787.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var787.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var787.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var787.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	return var787
end

t_39.descriptor = {
	name = "ShowToastAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ShowToastAction_Params = t_39
typeRegistryModule.default:register(t.ShowToastAction_Params)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p40)
	-- upvalues: t (ref), t_40 (ref)
	return setmetatable({
		action_type = if p40 == nil or p40.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p40.action_type,
		action_params = if p40 == nil or p40.action_params == nil then nil else p40.action_params
	}, t_40)
end

function t_40:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var787 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var788, var789 = protoModule.writeTag(buff, var787, 1, protoModule.wireTypes.varint)
		var788, var1416 = protoModule.writeVarInt(var788, var789, t.ActionType.toNumber(self.action_type))
		buff = var788
		var787 = var789
	end
	if self.action_params ~= nil then
		local var790 = self.action_params:encode()
		local var791, var792 = protoModule.writeTag(buff, var787, 2, protoModule.wireTypes.lengthDelimited)
		var791, var1419 = protoModule.writeBuffer(var791, var792, var790, buffer.len(var790))
		buff = var791
		var787 = var792
	end
	local buff_1 = buffer.create(var787)
	buffer.copy(buff_1, 0, buff, 0, var787)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var787 = t_40.new()
	local var788 = 0
	while var788 < buffer.len(p40) do
		local _ = nil
		local var789 = nil
		local var790, var791, var792 = protoModule.readTag(p40, var788)
		local var793 = var790
		var789 = var791
		var788 = var792
		
		if var789 == protoModule.wireTypes.varint then
			if var793 == 1 then
				local _ = nil
				local var794, var795 = protoModule.readVarIntI32(p40, var788)
				local var796 = var794
				var788 = var795
				var787.action_type = t.ActionType.fromNumber(var796) or var796
			else
				local _ = nil
				local var797, var798 = protoModule.readVarInt(p40, var788)
				local _ = var797
				var788 = var798
			end
		end
		if var789 == protoModule.wireTypes.lengthDelimited then
			if var793 == 2 then
				local _ = nil
				local var799, var800 = protoModule.readBuffer(p40, var788)
				var788 = var800
				var787.action_params = t.OpenPhoneUpsellModalAction_Params.decode(var799)
			else
				local _ = nil
				local var801, var802 = protoModule.readVarInt(p40, var788)
				var788 = var802 + var801
			end
		elseif var789 == protoModule.wireTypes.i32 then
			local _ = nil
			local var803, var804 = protoModule.readFixed32(p40, var788)
			local _ = var803
			var788 = var804
		elseif var789 == protoModule.wireTypes.i64 then
			local _ = nil
			local var805, var806 = protoModule.readFixed64(p40, var788)
			local _ = var805
			var788 = var806
		else
			error("Unsupported wire type: " .. var1423)
		end
	end
	return var787
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
	local var807 = t_40.new()
	
	if self.action_type ~= nil then
		var807.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var807.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var807.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var807.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var807
end

t_40.descriptor = {
	name = "OpenPhoneUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenPhoneUpsellModalAction"
}
t.OpenPhoneUpsellModalAction = t_40
typeRegistryModule.default:register(t.OpenPhoneUpsellModalAction)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p41)
	-- upvalues: t_41 (ref)
	return setmetatable({
		voice_opt_in = if p41 == nil or p41.voice_opt_in == nil then nil else p41.voice_opt_in,
		event_context = if p41 == nil or p41.event_context == nil then nil else p41.event_context,
		origin = if p41 == nil or p41.origin == nil then nil else p41.origin,
		should_autofill_android_phone_number_at_launch = if p41 == nil or p41.should_autofill_android_phone_number_at_launch == nil then nil else p41.should_autofill_android_phone_number_at_launch,
		add_phone_description_key = if p41 == nil or p41.add_phone_description_key == nil then nil else p41.add_phone_description_key,
		on_success = if p41 == nil or p41.on_success == nil then nil else p41.on_success,
		on_failure = if p41 == nil or p41.on_failure == nil then nil else p41.on_failure,
		on_cancelled = if p41 == nil or p41.on_cancelled == nil then nil else p41.on_cancelled
	}, t_41)
end

function t_41:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var807 = 0
	
	if self.voice_opt_in ~= nil then
		local var808 = self.voice_opt_in:encode()
		local var809, var810 = protoModule.writeTag(buff, var807, 1, protoModule.wireTypes.lengthDelimited)
		var809, var1447 = protoModule.writeBuffer(var809, var810, var808, buffer.len(var808))
		buff = var809
		var807 = var810
	end
	if self.event_context ~= nil then
		local var811 = self.event_context:encode()
		local var812, var813 = protoModule.writeTag(buff, var807, 2, protoModule.wireTypes.lengthDelimited)
		var812, var1450 = protoModule.writeBuffer(var812, var813, var811, buffer.len(var811))
		buff = var812
		var807 = var813
	end
	if self.origin ~= nil then
		local var814 = self.origin:encode()
		local var815, var816 = protoModule.writeTag(buff, var807, 3, protoModule.wireTypes.lengthDelimited)
		var815, var1453 = protoModule.writeBuffer(var815, var816, var814, buffer.len(var814))
		buff = var815
		var807 = var816
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		local var817 = self.should_autofill_android_phone_number_at_launch:encode()
		local var818, var819 = protoModule.writeTag(buff, var807, 4, protoModule.wireTypes.lengthDelimited)
		var818, var1456 = protoModule.writeBuffer(var818, var819, var817, buffer.len(var817))
		buff = var818
		var807 = var819
	end
	if self.add_phone_description_key ~= nil then
		local var820 = self.add_phone_description_key:encode()
		local var821, var822 = protoModule.writeTag(buff, var807, 5, protoModule.wireTypes.lengthDelimited)
		var821, var1459 = protoModule.writeBuffer(var821, var822, var820, buffer.len(var820))
		buff = var821
		var807 = var822
	end
	if self.on_success ~= nil then
		local var823 = self.on_success:encode()
		local var824, var825 = protoModule.writeTag(buff, var807, 6, protoModule.wireTypes.lengthDelimited)
		var824, var1462 = protoModule.writeBuffer(var824, var825, var823, buffer.len(var823))
		buff = var824
		var807 = var825
	end
	if self.on_failure ~= nil then
		local var826 = self.on_failure:encode()
		local var827, var828 = protoModule.writeTag(buff, var807, 7, protoModule.wireTypes.lengthDelimited)
		var827, var1465 = protoModule.writeBuffer(var827, var828, var826, buffer.len(var826))
		buff = var827
		var807 = var828
	end
	if self.on_cancelled ~= nil then
		local var829 = self.on_cancelled:encode()
		local var830, var831 = protoModule.writeTag(buff, var807, 8, protoModule.wireTypes.lengthDelimited)
		var830, var1468 = protoModule.writeBuffer(var830, var831, var829, buffer.len(var829))
		buff = var830
		var807 = var831
	end
	local buff_1 = buffer.create(var807)
	buffer.copy(buff_1, 0, buff, 0, var807)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var807 = t_41.new()
	local var808 = 0
	while var808 < buffer.len(p41) do
		local _ = nil
		local var809 = nil
		local var810, var811, var812 = protoModule.readTag(p41, var808)
		local var813 = var810
		var809 = var811
		var808 = var812
		
		if var809 == protoModule.wireTypes.varint then
			local _ = nil
			local var814, var815 = protoModule.readVarInt(p41, var808)
			local _ = var814
			var808 = var815
			continue
		end
		if var809 == protoModule.wireTypes.lengthDelimited then
			if var813 == 1 then
				local _ = nil
				local var816, var817 = protoModule.readBuffer(p41, var808)
				var808 = var817
				var807.voice_opt_in = propTypesModule.BoolProp.decode(var816)
			elseif var813 == 2 then
				local _ = nil
				local var818, var819 = protoModule.readBuffer(p41, var808)
				var808 = var819
				var807.event_context = propTypesModule.StringProp.decode(var818)
			elseif var813 == 3 then
				local _ = nil
				local var820, var821 = protoModule.readBuffer(p41, var808)
				var808 = var821
				var807.origin = propTypesModule.StringProp.decode(var820)
			elseif var813 == 4 then
				local _ = nil
				local var822, var823 = protoModule.readBuffer(p41, var808)
				var808 = var823
				var807.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.decode(var822)
			elseif var813 == 5 then
				local _ = nil
				local var824, var825 = protoModule.readBuffer(p41, var808)
				var808 = var825
				var807.add_phone_description_key = propTypesModule.StringProp.decode(var824)
			elseif var813 == 6 then
				local _ = nil
				local var826, var827 = protoModule.readBuffer(p41, var808)
				var808 = var827
				var807.on_success = t.ActionProp.decode(var826)
			elseif var813 == 7 then
				local _ = nil
				local var828, var829 = protoModule.readBuffer(p41, var808)
				var808 = var829
				var807.on_failure = t.ActionProp.decode(var828)
			elseif var813 == 8 then
				local _ = nil
				local var830, var831 = protoModule.readBuffer(p41, var808)
				var808 = var831
				var807.on_cancelled = t.ActionProp.decode(var830)
			else
				local _ = nil
				local var832, var833 = protoModule.readVarInt(p41, var808)
				var808 = var833 + var832
			end
		elseif var809 == protoModule.wireTypes.i32 then
			local _ = nil
			local var834, var835 = protoModule.readFixed32(p41, var808)
			local _ = var834
			var808 = var835
		elseif var809 == protoModule.wireTypes.i64 then
			local _ = nil
			local var836, var837 = protoModule.readFixed64(p41, var808)
			local _ = var836
			var808 = var837
		else
			error("Unsupported wire type: " .. var1472)
		end
	end
	return var807
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
	local var838 = t_41.new()
	
	if self.voice_opt_in ~= nil then
		var838.voice_opt_in = propTypesModule.BoolProp.jsonDecode(self.voice_opt_in)
	end
	if self.voiceOptIn ~= nil then
		var838.voice_opt_in = propTypesModule.BoolProp.jsonDecode(self.voiceOptIn)
	end
	if self.event_context ~= nil then
		var838.event_context = propTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		var838.event_context = propTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		var838.origin = propTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		var838.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.jsonDecode(self.should_autofill_android_phone_number_at_launch)
	end
	if self.shouldAutofillAndroidPhoneNumberAtLaunch ~= nil then
		var838.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.jsonDecode(self.shouldAutofillAndroidPhoneNumberAtLaunch)
	end
	if self.add_phone_description_key ~= nil then
		var838.add_phone_description_key = propTypesModule.StringProp.jsonDecode(self.add_phone_description_key)
	end
	if self.addPhoneDescriptionKey ~= nil then
		var838.add_phone_description_key = propTypesModule.StringProp.jsonDecode(self.addPhoneDescriptionKey)
	end
	if self.on_success ~= nil then
		var838.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var838.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var838.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var838.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	if self.on_cancelled ~= nil then
		var838.on_cancelled = t.ActionProp.jsonDecode(self.on_cancelled)
	end
	if self.onCancelled ~= nil then
		var838.on_cancelled = t.ActionProp.jsonDecode(self.onCancelled)
	end
	return var838
end

t_41.descriptor = {
	name = "OpenPhoneUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenPhoneUpsellModalAction_Params = t_41
typeRegistryModule.default:register(t.OpenPhoneUpsellModalAction_Params)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p42)
	-- upvalues: t (ref), t_42 (ref)
	return setmetatable({
		action_type = if p42 == nil or p42.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p42.action_type,
		action_params = if p42 == nil or p42.action_params == nil then nil else p42.action_params
	}, t_42)
end

function t_42:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var838 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var839, var840 = protoModule.writeTag(buff, var838, 1, protoModule.wireTypes.varint)
		var839, var1506 = protoModule.writeVarInt(var839, var840, t.ActionType.toNumber(self.action_type))
		buff = var839
		var838 = var840
	end
	if self.action_params ~= nil then
		local var841 = self.action_params:encode()
		local var842, var843 = protoModule.writeTag(buff, var838, 2, protoModule.wireTypes.lengthDelimited)
		var842, var1509 = protoModule.writeBuffer(var842, var843, var841, buffer.len(var841))
		buff = var842
		var838 = var843
	end
	local buff_1 = buffer.create(var838)
	buffer.copy(buff_1, 0, buff, 0, var838)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var838 = t_42.new()
	local var839 = 0
	while var839 < buffer.len(p42) do
		local _ = nil
		local var840 = nil
		local var841, var842, var843 = protoModule.readTag(p42, var839)
		local var844 = var841
		var840 = var842
		var839 = var843
		
		if var840 == protoModule.wireTypes.varint then
			if var844 == 1 then
				local _ = nil
				local var845, var846 = protoModule.readVarIntI32(p42, var839)
				local var847 = var845
				var839 = var846
				var838.action_type = t.ActionType.fromNumber(var847) or var847
			else
				local _ = nil
				local var848, var849 = protoModule.readVarInt(p42, var839)
				local _ = var848
				var839 = var849
			end
		end
		if var840 == protoModule.wireTypes.lengthDelimited then
			if var844 == 2 then
				local _ = nil
				local var850, var851 = protoModule.readBuffer(p42, var839)
				var839 = var851
				var838.action_params = t.OpenEmailUpsellModalAction_Params.decode(var850)
			else
				local _ = nil
				local var852, var853 = protoModule.readVarInt(p42, var839)
				var839 = var853 + var852
			end
		elseif var840 == protoModule.wireTypes.i32 then
			local _ = nil
			local var854, var855 = protoModule.readFixed32(p42, var839)
			local _ = var854
			var839 = var855
		elseif var840 == protoModule.wireTypes.i64 then
			local _ = nil
			local var856, var857 = protoModule.readFixed64(p42, var839)
			local _ = var856
			var839 = var857
		else
			error("Unsupported wire type: " .. var1513)
		end
	end
	return var838
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
	local var858 = t_42.new()
	
	if self.action_type ~= nil then
		var858.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var858.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var858.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var858.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var858
end

t_42.descriptor = {
	name = "OpenEmailUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenEmailUpsellModalAction"
}
t.OpenEmailUpsellModalAction = t_42
typeRegistryModule.default:register(t.OpenEmailUpsellModalAction)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p43)
	-- upvalues: t_43 (ref)
	return setmetatable({
		add_email_over13_text_key = if p43 == nil or p43.add_email_over13_text_key == nil then nil else p43.add_email_over13_text_key,
		add_email_title_key = if p43 == nil or p43.add_email_title_key == nil then nil else p43.add_email_title_key,
		is_email_modal_called_from_home_page = if p43 == nil or p43.is_email_modal_called_from_home_page == nil then nil else p43.is_email_modal_called_from_home_page,
		event_context = if p43 == nil or p43.event_context == nil then nil else p43.event_context,
		origin = if p43 == nil or p43.origin == nil then nil else p43.origin,
		section = if p43 == nil or p43.section == nil then nil else p43.section,
		on_success = if p43 == nil or p43.on_success == nil then nil else p43.on_success,
		on_failure = if p43 == nil or p43.on_failure == nil then nil else p43.on_failure
	}, t_43)
end

function t_43:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var858 = 0
	
	if self.add_email_over13_text_key ~= nil then
		local var859 = self.add_email_over13_text_key:encode()
		local var860, var861 = protoModule.writeTag(buff, var858, 1, protoModule.wireTypes.lengthDelimited)
		var860, var1537 = protoModule.writeBuffer(var860, var861, var859, buffer.len(var859))
		buff = var860
		var858 = var861
	end
	if self.add_email_title_key ~= nil then
		local var862 = self.add_email_title_key:encode()
		local var863, var864 = protoModule.writeTag(buff, var858, 2, protoModule.wireTypes.lengthDelimited)
		var863, var1540 = protoModule.writeBuffer(var863, var864, var862, buffer.len(var862))
		buff = var863
		var858 = var864
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		local var865 = self.is_email_modal_called_from_home_page:encode()
		local var866, var867 = protoModule.writeTag(buff, var858, 3, protoModule.wireTypes.lengthDelimited)
		var866, var1543 = protoModule.writeBuffer(var866, var867, var865, buffer.len(var865))
		buff = var866
		var858 = var867
	end
	if self.event_context ~= nil then
		local var868 = self.event_context:encode()
		local var869, var870 = protoModule.writeTag(buff, var858, 4, protoModule.wireTypes.lengthDelimited)
		var869, var1546 = protoModule.writeBuffer(var869, var870, var868, buffer.len(var868))
		buff = var869
		var858 = var870
	end
	if self.origin ~= nil then
		local var871 = self.origin:encode()
		local var872, var873 = protoModule.writeTag(buff, var858, 5, protoModule.wireTypes.lengthDelimited)
		var872, var1549 = protoModule.writeBuffer(var872, var873, var871, buffer.len(var871))
		buff = var872
		var858 = var873
	end
	if self.section ~= nil then
		local var874 = self.section:encode()
		local var875, var876 = protoModule.writeTag(buff, var858, 6, protoModule.wireTypes.lengthDelimited)
		var875, var1552 = protoModule.writeBuffer(var875, var876, var874, buffer.len(var874))
		buff = var875
		var858 = var876
	end
	if self.on_success ~= nil then
		local var877 = self.on_success:encode()
		local var878, var879 = protoModule.writeTag(buff, var858, 7, protoModule.wireTypes.lengthDelimited)
		var878, var1555 = protoModule.writeBuffer(var878, var879, var877, buffer.len(var877))
		buff = var878
		var858 = var879
	end
	if self.on_failure ~= nil then
		local var880 = self.on_failure:encode()
		local var881, var882 = protoModule.writeTag(buff, var858, 8, protoModule.wireTypes.lengthDelimited)
		var881, var1558 = protoModule.writeBuffer(var881, var882, var880, buffer.len(var880))
		buff = var881
		var858 = var882
	end
	local buff_1 = buffer.create(var858)
	buffer.copy(buff_1, 0, buff, 0, var858)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var858 = t_43.new()
	local var859 = 0
	while var859 < buffer.len(p43) do
		local _ = nil
		local var860 = nil
		local var861, var862, var863 = protoModule.readTag(p43, var859)
		local var864 = var861
		var860 = var862
		var859 = var863
		
		if var860 == protoModule.wireTypes.varint then
			local _ = nil
			local var865, var866 = protoModule.readVarInt(p43, var859)
			local _ = var865
			var859 = var866
			continue
		end
		if var860 == protoModule.wireTypes.lengthDelimited then
			if var864 == 1 then
				local _ = nil
				local var867, var868 = protoModule.readBuffer(p43, var859)
				var859 = var868
				var858.add_email_over13_text_key = propTypesModule.StringProp.decode(var867)
			elseif var864 == 2 then
				local _ = nil
				local var869, var870 = protoModule.readBuffer(p43, var859)
				var859 = var870
				var858.add_email_title_key = propTypesModule.StringProp.decode(var869)
			elseif var864 == 3 then
				local _ = nil
				local var871, var872 = protoModule.readBuffer(p43, var859)
				var859 = var872
				var858.is_email_modal_called_from_home_page = propTypesModule.BoolProp.decode(var871)
			elseif var864 == 4 then
				local _ = nil
				local var873, var874 = protoModule.readBuffer(p43, var859)
				var859 = var874
				var858.event_context = propTypesModule.StringProp.decode(var873)
			elseif var864 == 5 then
				local _ = nil
				local var875, var876 = protoModule.readBuffer(p43, var859)
				var859 = var876
				var858.origin = propTypesModule.StringProp.decode(var875)
			elseif var864 == 6 then
				local _ = nil
				local var877, var878 = protoModule.readBuffer(p43, var859)
				var859 = var878
				var858.section = propTypesModule.StringProp.decode(var877)
			elseif var864 == 7 then
				local _ = nil
				local var879, var880 = protoModule.readBuffer(p43, var859)
				var859 = var880
				var858.on_success = t.ActionProp.decode(var879)
			elseif var864 == 8 then
				local _ = nil
				local var881, var882 = protoModule.readBuffer(p43, var859)
				var859 = var882
				var858.on_failure = t.ActionProp.decode(var881)
			else
				local _ = nil
				local var883, var884 = protoModule.readVarInt(p43, var859)
				var859 = var884 + var883
			end
		elseif var860 == protoModule.wireTypes.i32 then
			local _ = nil
			local var885, var886 = protoModule.readFixed32(p43, var859)
			local _ = var885
			var859 = var886
		elseif var860 == protoModule.wireTypes.i64 then
			local _ = nil
			local var887, var888 = protoModule.readFixed64(p43, var859)
			local _ = var887
			var859 = var888
		else
			error("Unsupported wire type: " .. var1562)
		end
	end
	return var858
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
	local var889 = t_43.new()
	
	if self.add_email_over13_text_key ~= nil then
		var889.add_email_over13_text_key = propTypesModule.StringProp.jsonDecode(self.add_email_over13_text_key)
	end
	if self.addEmailOver13TextKey ~= nil then
		var889.add_email_over13_text_key = propTypesModule.StringProp.jsonDecode(self.addEmailOver13TextKey)
	end
	if self.add_email_title_key ~= nil then
		var889.add_email_title_key = propTypesModule.StringProp.jsonDecode(self.add_email_title_key)
	end
	if self.addEmailTitleKey ~= nil then
		var889.add_email_title_key = propTypesModule.StringProp.jsonDecode(self.addEmailTitleKey)
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		var889.is_email_modal_called_from_home_page = propTypesModule.BoolProp.jsonDecode(self.is_email_modal_called_from_home_page)
	end
	if self.isEmailModalCalledFromHomePage ~= nil then
		var889.is_email_modal_called_from_home_page = propTypesModule.BoolProp.jsonDecode(self.isEmailModalCalledFromHomePage)
	end
	if self.event_context ~= nil then
		var889.event_context = propTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		var889.event_context = propTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		var889.origin = propTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.section ~= nil then
		var889.section = propTypesModule.StringProp.jsonDecode(self.section)
	end
	if self.on_success ~= nil then
		var889.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var889.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var889.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var889.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	return var889
end

t_43.descriptor = {
	name = "OpenEmailUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenEmailUpsellModalAction_Params = t_43
typeRegistryModule.default:register(t.OpenEmailUpsellModalAction_Params)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p44)
	-- upvalues: t (ref), t_44 (ref)
	return setmetatable({
		action_type = if p44 == nil or p44.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p44.action_type,
		action_params = if p44 == nil or p44.action_params == nil then nil else p44.action_params
	}, t_44)
end

function t_44:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var889 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var890, var891 = protoModule.writeTag(buff, var889, 1, protoModule.wireTypes.varint)
		var890, var1596 = protoModule.writeVarInt(var890, var891, t.ActionType.toNumber(self.action_type))
		buff = var890
		var889 = var891
	end
	if self.action_params ~= nil then
		local var892 = self.action_params:encode()
		local var893, var894 = protoModule.writeTag(buff, var889, 2, protoModule.wireTypes.lengthDelimited)
		var893, var1599 = protoModule.writeBuffer(var893, var894, var892, buffer.len(var892))
		buff = var893
		var889 = var894
	end
	local buff_1 = buffer.create(var889)
	buffer.copy(buff_1, 0, buff, 0, var889)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref), t (ref)
	local var889 = t_44.new()
	local var890 = 0
	while var890 < buffer.len(p44) do
		local _ = nil
		local var891 = nil
		local var892, var893, var894 = protoModule.readTag(p44, var890)
		local var895 = var892
		var891 = var893
		var890 = var894
		
		if var891 == protoModule.wireTypes.varint then
			if var895 == 1 then
				local _ = nil
				local var896, var897 = protoModule.readVarIntI32(p44, var890)
				local var898 = var896
				var890 = var897
				var889.action_type = t.ActionType.fromNumber(var898) or var898
			else
				local _ = nil
				local var899, var900 = protoModule.readVarInt(p44, var890)
				local _ = var899
				var890 = var900
			end
		end
		if var891 == protoModule.wireTypes.lengthDelimited then
			if var895 == 2 then
				local _ = nil
				local var901, var902 = protoModule.readBuffer(p44, var890)
				var890 = var902
				var889.action_params = t.OpenAddConnectionsPageAction_Params.decode(var901)
			else
				local _ = nil
				local var903, var904 = protoModule.readVarInt(p44, var890)
				var890 = var904 + var903
			end
		elseif var891 == protoModule.wireTypes.i32 then
			local _ = nil
			local var905, var906 = protoModule.readFixed32(p44, var890)
			local _ = var905
			var890 = var906
		elseif var891 == protoModule.wireTypes.i64 then
			local _ = nil
			local var907, var908 = protoModule.readFixed64(p44, var890)
			local _ = var907
			var890 = var908
		else
			error("Unsupported wire type: " .. var1603)
		end
	end
	return var889
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
	local var909 = t_44.new()
	
	if self.action_type ~= nil then
		var909.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var909.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var909.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var909.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.actionParams)
	end
	return var909
end

t_44.descriptor = {
	name = "OpenAddConnectionsPageAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAddConnectionsPageAction"
}
t.OpenAddConnectionsPageAction = t_44
typeRegistryModule.default:register(t.OpenAddConnectionsPageAction)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p45)
	-- upvalues: t_45 (ref)
	return setmetatable({
		user_id = if p45 == nil or p45.user_id == nil then nil else p45.user_id,
		source = if p45 == nil or p45.source == nil then nil else p45.source
	}, t_45)
end

function t_45:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var909 = 0
	
	if self.user_id ~= nil then
		local var910 = self.user_id:encode()
		local var911, var912 = protoModule.writeTag(buff, var909, 1, protoModule.wireTypes.lengthDelimited)
		var911, var1627 = protoModule.writeBuffer(var911, var912, var910, buffer.len(var910))
		buff = var911
		var909 = var912
	end
	if self.source ~= nil then
		local var913 = self.source:encode()
		local var914, var915 = protoModule.writeTag(buff, var909, 2, protoModule.wireTypes.lengthDelimited)
		var914, var1630 = protoModule.writeBuffer(var914, var915, var913, buffer.len(var913))
		buff = var914
		var909 = var915
	end
	local buff_1 = buffer.create(var909)
	buffer.copy(buff_1, 0, buff, 0, var909)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref), propTypesModule (ref)
	local var909 = t_45.new()
	local var910 = 0
	while var910 < buffer.len(p45) do
		local _ = nil
		local var911 = nil
		local var912, var913, var914 = protoModule.readTag(p45, var910)
		local var915 = var912
		var911 = var913
		var910 = var914
		
		if var911 == protoModule.wireTypes.varint then
			local _ = nil
			local var916, var917 = protoModule.readVarInt(p45, var910)
			local _ = var916
			var910 = var917
			continue
		end
		if var911 == protoModule.wireTypes.lengthDelimited then
			if var915 == 1 then
				local _ = nil
				local var918, var919 = protoModule.readBuffer(p45, var910)
				var910 = var919
				var909.user_id = propTypesModule.StringProp.decode(var918)
			elseif var915 == 2 then
				local _ = nil
				local var920, var921 = protoModule.readBuffer(p45, var910)
				var910 = var921
				var909.source = propTypesModule.StringProp.decode(var920)
			else
				local _ = nil
				local var922, var923 = protoModule.readVarInt(p45, var910)
				var910 = var923 + var922
			end
		elseif var911 == protoModule.wireTypes.i32 then
			local _ = nil
			local var924, var925 = protoModule.readFixed32(p45, var910)
			local _ = var924
			var910 = var925
		elseif var911 == protoModule.wireTypes.i64 then
			local _ = nil
			local var926, var927 = protoModule.readFixed64(p45, var910)
			local _ = var926
			var910 = var927
		else
			error("Unsupported wire type: " .. var1634)
		end
	end
	return var909
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
	local var928 = t_45.new()
	
	if self.user_id ~= nil then
		var928.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var928.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var928.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var928
end

t_45.descriptor = {
	name = "OpenAddConnectionsPageAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAddConnectionsPageAction_Params = t_45
typeRegistryModule.default:register(t.OpenAddConnectionsPageAction_Params)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p46)
	-- upvalues: t (ref), t_46 (ref)
	return setmetatable({
		action_type = if p46 == nil or p46.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p46.action_type,
		action_params = if p46 == nil or p46.action_params == nil then nil else p46.action_params
	}, t_46)
end

function t_46:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var928 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var929, var930 = protoModule.writeTag(buff, var928, 1, protoModule.wireTypes.varint)
		var929, var1656 = protoModule.writeVarInt(var929, var930, t.ActionType.toNumber(self.action_type))
		buff = var929
		var928 = var930
	end
	if self.action_params ~= nil then
		local var931 = self.action_params:encode()
		local var932, var933 = protoModule.writeTag(buff, var928, 2, protoModule.wireTypes.lengthDelimited)
		var932, var1659 = protoModule.writeBuffer(var932, var933, var931, buffer.len(var931))
		buff = var932
		var928 = var933
	end
	local buff_1 = buffer.create(var928)
	buffer.copy(buff_1, 0, buff, 0, var928)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var928 = t_46.new()
	local var929 = 0
	while var929 < buffer.len(p46) do
		local _ = nil
		local var930 = nil
		local var931, var932, var933 = protoModule.readTag(p46, var929)
		local var934 = var931
		var930 = var932
		var929 = var933
		
		if var930 == protoModule.wireTypes.varint then
			if var934 == 1 then
				local _ = nil
				local var935, var936 = protoModule.readVarIntI32(p46, var929)
				local var937 = var935
				var929 = var936
				var928.action_type = t.ActionType.fromNumber(var937) or var937
			else
				local _ = nil
				local var938, var939 = protoModule.readVarInt(p46, var929)
				local _ = var938
				var929 = var939
			end
		end
		if var930 == protoModule.wireTypes.lengthDelimited then
			if var934 == 2 then
				local _ = nil
				local var940, var941 = protoModule.readBuffer(p46, var929)
				var929 = var941
				var928.action_params = t.OpenMarketplaceAction_Params.decode(var940)
			else
				local _ = nil
				local var942, var943 = protoModule.readVarInt(p46, var929)
				var929 = var943 + var942
			end
		elseif var930 == protoModule.wireTypes.i32 then
			local _ = nil
			local var944, var945 = protoModule.readFixed32(p46, var929)
			local _ = var944
			var929 = var945
		elseif var930 == protoModule.wireTypes.i64 then
			local _ = nil
			local var946, var947 = protoModule.readFixed64(p46, var929)
			local _ = var946
			var929 = var947
		else
			error("Unsupported wire type: " .. var1663)
		end
	end
	return var928
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
	local var948 = t_46.new()
	
	if self.action_type ~= nil then
		var948.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var948.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var948.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var948.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.actionParams)
	end
	return var948
end

t_46.descriptor = {
	name = "OpenMarketplaceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceAction"
}
t.OpenMarketplaceAction = t_46
typeRegistryModule.default:register(t.OpenMarketplaceAction)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p47)
	-- upvalues: t_47 (ref)
	return setmetatable({
		user_id = if p47 == nil or p47.user_id == nil then nil else p47.user_id,
		source = if p47 == nil or p47.source == nil then nil else p47.source
	}, t_47)
end

function t_47:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var948 = 0
	
	if self.user_id ~= nil then
		local var949 = self.user_id:encode()
		local var950, var951 = protoModule.writeTag(buff, var948, 1, protoModule.wireTypes.lengthDelimited)
		var950, var1687 = protoModule.writeBuffer(var950, var951, var949, buffer.len(var949))
		buff = var950
		var948 = var951
	end
	if self.source ~= nil then
		local var952 = self.source:encode()
		local var953, var954 = protoModule.writeTag(buff, var948, 2, protoModule.wireTypes.lengthDelimited)
		var953, var1690 = protoModule.writeBuffer(var953, var954, var952, buffer.len(var952))
		buff = var953
		var948 = var954
	end
	local buff_1 = buffer.create(var948)
	buffer.copy(buff_1, 0, buff, 0, var948)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref), propTypesModule (ref)
	local var948 = t_47.new()
	local var949 = 0
	while var949 < buffer.len(p47) do
		local _ = nil
		local var950 = nil
		local var951, var952, var953 = protoModule.readTag(p47, var949)
		local var954 = var951
		var950 = var952
		var949 = var953
		
		if var950 == protoModule.wireTypes.varint then
			local _ = nil
			local var955, var956 = protoModule.readVarInt(p47, var949)
			local _ = var955
			var949 = var956
			continue
		end
		if var950 == protoModule.wireTypes.lengthDelimited then
			if var954 == 1 then
				local _ = nil
				local var957, var958 = protoModule.readBuffer(p47, var949)
				var949 = var958
				var948.user_id = propTypesModule.StringProp.decode(var957)
			elseif var954 == 2 then
				local _ = nil
				local var959, var960 = protoModule.readBuffer(p47, var949)
				var949 = var960
				var948.source = propTypesModule.StringProp.decode(var959)
			else
				local _ = nil
				local var961, var962 = protoModule.readVarInt(p47, var949)
				var949 = var962 + var961
			end
		elseif var950 == protoModule.wireTypes.i32 then
			local _ = nil
			local var963, var964 = protoModule.readFixed32(p47, var949)
			local _ = var963
			var949 = var964
		elseif var950 == protoModule.wireTypes.i64 then
			local _ = nil
			local var965, var966 = protoModule.readFixed64(p47, var949)
			local _ = var965
			var949 = var966
		else
			error("Unsupported wire type: " .. var1694)
		end
	end
	return var948
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
	local var967 = t_47.new()
	
	if self.user_id ~= nil then
		var967.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var967.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var967.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var967
end

t_47.descriptor = {
	name = "OpenMarketplaceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceAction_Params = t_47
typeRegistryModule.default:register(t.OpenMarketplaceAction_Params)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p48)
	-- upvalues: t (ref), t_48 (ref)
	return setmetatable({
		action_type = if p48 == nil or p48.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p48.action_type,
		action_params = if p48 == nil or p48.action_params == nil then nil else p48.action_params
	}, t_48)
end

function t_48:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var967 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var968, var969 = protoModule.writeTag(buff, var967, 1, protoModule.wireTypes.varint)
		var968, var1716 = protoModule.writeVarInt(var968, var969, t.ActionType.toNumber(self.action_type))
		buff = var968
		var967 = var969
	end
	if self.action_params ~= nil then
		local var970 = self.action_params:encode()
		local var971, var972 = protoModule.writeTag(buff, var967, 2, protoModule.wireTypes.lengthDelimited)
		var971, var1719 = protoModule.writeBuffer(var971, var972, var970, buffer.len(var970))
		buff = var971
		var967 = var972
	end
	local buff_1 = buffer.create(var967)
	buffer.copy(buff_1, 0, buff, 0, var967)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref), t (ref)
	local var967 = t_48.new()
	local var968 = 0
	while var968 < buffer.len(p48) do
		local _ = nil
		local var969 = nil
		local var970, var971, var972 = protoModule.readTag(p48, var968)
		local var973 = var970
		var969 = var971
		var968 = var972
		
		if var969 == protoModule.wireTypes.varint then
			if var973 == 1 then
				local _ = nil
				local var974, var975 = protoModule.readVarIntI32(p48, var968)
				local var976 = var974
				var968 = var975
				var967.action_type = t.ActionType.fromNumber(var976) or var976
			else
				local _ = nil
				local var977, var978 = protoModule.readVarInt(p48, var968)
				local _ = var977
				var968 = var978
			end
		end
		if var969 == protoModule.wireTypes.lengthDelimited then
			if var973 == 2 then
				local _ = nil
				local var979, var980 = protoModule.readBuffer(p48, var968)
				var968 = var980
				var967.action_params = t.HideProfileCompletionAction_Params.decode(var979)
			else
				local _ = nil
				local var981, var982 = protoModule.readVarInt(p48, var968)
				var968 = var982 + var981
			end
		elseif var969 == protoModule.wireTypes.i32 then
			local _ = nil
			local var983, var984 = protoModule.readFixed32(p48, var968)
			local _ = var983
			var968 = var984
		elseif var969 == protoModule.wireTypes.i64 then
			local _ = nil
			local var985, var986 = protoModule.readFixed64(p48, var968)
			local _ = var985
			var968 = var986
		else
			error("Unsupported wire type: " .. var1723)
		end
	end
	return var967
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
	local var987 = t_48.new()
	
	if self.action_type ~= nil then
		var987.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var987.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var987.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var987.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.actionParams)
	end
	return var987
end

t_48.descriptor = {
	name = "HideProfileCompletionAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.HideProfileCompletionAction"
}
t.HideProfileCompletionAction = t_48
typeRegistryModule.default:register(t.HideProfileCompletionAction)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p49)
	-- upvalues: t_49 (ref)
	return setmetatable({
		user_id = if p49 == nil or p49.user_id == nil then nil else p49.user_id,
		prompt_id = if p49 == nil or p49.prompt_id == nil then nil else p49.prompt_id,
		source = if p49 == nil or p49.source == nil then nil else p49.source,
		prompt_type = if p49 == nil or p49.prompt_type == nil then nil else p49.prompt_type
	}, t_49)
end

function t_49:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var987 = 0
	
	if self.user_id ~= nil then
		local var988 = self.user_id:encode()
		local var989, var990 = protoModule.writeTag(buff, var987, 1, protoModule.wireTypes.lengthDelimited)
		var989, var1747 = protoModule.writeBuffer(var989, var990, var988, buffer.len(var988))
		buff = var989
		var987 = var990
	end
	if self.prompt_id ~= nil then
		local var991 = self.prompt_id:encode()
		local var992, var993 = protoModule.writeTag(buff, var987, 2, protoModule.wireTypes.lengthDelimited)
		var992, var1750 = protoModule.writeBuffer(var992, var993, var991, buffer.len(var991))
		buff = var992
		var987 = var993
	end
	if self.source ~= nil then
		local var994 = self.source:encode()
		local var995, var996 = protoModule.writeTag(buff, var987, 3, protoModule.wireTypes.lengthDelimited)
		var995, var1753 = protoModule.writeBuffer(var995, var996, var994, buffer.len(var994))
		buff = var995
		var987 = var996
	end
	if self.prompt_type ~= nil then
		local var997 = self.prompt_type:encode()
		local var998, var999 = protoModule.writeTag(buff, var987, 4, protoModule.wireTypes.lengthDelimited)
		var998, var1756 = protoModule.writeBuffer(var998, var999, var997, buffer.len(var997))
		buff = var998
		var987 = var999
	end
	local buff_1 = buffer.create(var987)
	buffer.copy(buff_1, 0, buff, 0, var987)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref), propTypesModule (ref)
	local var987 = t_49.new()
	local var988 = 0
	while var988 < buffer.len(p49) do
		local _ = nil
		local var989 = nil
		local var990, var991, var992 = protoModule.readTag(p49, var988)
		local var993 = var990
		var989 = var991
		var988 = var992
		
		if var989 == protoModule.wireTypes.varint then
			local _ = nil
			local var994, var995 = protoModule.readVarInt(p49, var988)
			local _ = var994
			var988 = var995
			continue
		end
		if var989 == protoModule.wireTypes.lengthDelimited then
			if var993 == 1 then
				local _ = nil
				local var996, var997 = protoModule.readBuffer(p49, var988)
				var988 = var997
				var987.user_id = propTypesModule.StringProp.decode(var996)
			elseif var993 == 2 then
				local _ = nil
				local var998, var999 = protoModule.readBuffer(p49, var988)
				var988 = var999
				var987.prompt_id = propTypesModule.StringProp.decode(var998)
			elseif var993 == 3 then
				local _ = nil
				local var1000, var1001 = protoModule.readBuffer(p49, var988)
				var988 = var1001
				var987.source = propTypesModule.StringProp.decode(var1000)
			elseif var993 == 4 then
				local _ = nil
				local var1002, var1003 = protoModule.readBuffer(p49, var988)
				var988 = var1003
				var987.prompt_type = propTypesModule.StringProp.decode(var1002)
			else
				local _ = nil
				local var1004, var1005 = protoModule.readVarInt(p49, var988)
				var988 = var1005 + var1004
			end
		elseif var989 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1006, var1007 = protoModule.readFixed32(p49, var988)
			local _ = var1006
			var988 = var1007
		elseif var989 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1008, var1009 = protoModule.readFixed64(p49, var988)
			local _ = var1008
			var988 = var1009
		else
			error("Unsupported wire type: " .. var1760)
		end
	end
	return var987
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
	local var1010 = t_49.new()
	
	if self.user_id ~= nil then
		var1010.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1010.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.prompt_id ~= nil then
		var1010.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1010.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.source ~= nil then
		var1010.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.prompt_type ~= nil then
		var1010.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1010.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	return var1010
end

t_49.descriptor = {
	name = "HideProfileCompletionAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.HideProfileCompletionAction_Params = t_49
typeRegistryModule.default:register(t.HideProfileCompletionAction_Params)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p50)
	-- upvalues: t (ref), t_50 (ref)
	return setmetatable({
		action_type = if p50 == nil or p50.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p50.action_type,
		action_params = if p50 == nil or p50.action_params == nil then nil else p50.action_params
	}, t_50)
end

function t_50:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1010 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1011, var1012 = protoModule.writeTag(buff, var1010, 1, protoModule.wireTypes.varint)
		var1011, var1786 = protoModule.writeVarInt(var1011, var1012, t.ActionType.toNumber(self.action_type))
		buff = var1011
		var1010 = var1012
	end
	if self.action_params ~= nil then
		local var1013 = self.action_params:encode()
		local var1014, var1015 = protoModule.writeTag(buff, var1010, 2, protoModule.wireTypes.lengthDelimited)
		var1014, var1789 = protoModule.writeBuffer(var1014, var1015, var1013, buffer.len(var1013))
		buff = var1014
		var1010 = var1015
	end
	local buff_1 = buffer.create(var1010)
	buffer.copy(buff_1, 0, buff, 0, var1010)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var1010 = t_50.new()
	local var1011 = 0
	while var1011 < buffer.len(p50) do
		local _ = nil
		local var1012 = nil
		local var1013, var1014, var1015 = protoModule.readTag(p50, var1011)
		local var1016 = var1013
		var1012 = var1014
		var1011 = var1015
		
		if var1012 == protoModule.wireTypes.varint then
			if var1016 == 1 then
				local _ = nil
				local var1017, var1018 = protoModule.readVarIntI32(p50, var1011)
				local var1019 = var1017
				var1011 = var1018
				var1010.action_type = t.ActionType.fromNumber(var1019) or var1019
			else
				local _ = nil
				local var1020, var1021 = protoModule.readVarInt(p50, var1011)
				local _ = var1020
				var1011 = var1021
			end
		end
		if var1012 == protoModule.wireTypes.lengthDelimited then
			if var1016 == 2 then
				local _ = nil
				local var1022, var1023 = protoModule.readBuffer(p50, var1011)
				var1011 = var1023
				var1010.action_params = t.SelectMarketplaceCatalogCategory_Params.decode(var1022)
			else
				local _ = nil
				local var1024, var1025 = protoModule.readVarInt(p50, var1011)
				var1011 = var1025 + var1024
			end
		elseif var1012 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1026, var1027 = protoModule.readFixed32(p50, var1011)
			local _ = var1026
			var1011 = var1027
		elseif var1012 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1028, var1029 = protoModule.readFixed64(p50, var1011)
			local _ = var1028
			var1011 = var1029
		else
			error("Unsupported wire type: " .. var1793)
		end
	end
	return var1010
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
	local var1030 = t_50.new()
	
	if self.action_type ~= nil then
		var1030.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1030.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1030.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1030.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.actionParams)
	end
	return var1030
end

t_50.descriptor = {
	name = "SelectMarketplaceCatalogCategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogCategory"
}
t.SelectMarketplaceCatalogCategory = t_50
typeRegistryModule.default:register(t.SelectMarketplaceCatalogCategory)
local t_51 = {}
t_51.__index = t_51

function t_51.new(p51)
	-- upvalues: t_51 (ref)
	return setmetatable({
		category_id = if p51 == nil or p51.category_id == nil then nil else p51.category_id
	}, t_51)
end

function t_51:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1030 = 0
	
	if self.category_id ~= nil then
		local var1031 = self.category_id:encode()
		local var1032, var1033 = protoModule.writeTag(buff, var1030, 1, protoModule.wireTypes.lengthDelimited)
		var1032, var1817 = protoModule.writeBuffer(var1032, var1033, var1031, buffer.len(var1031))
		buff = var1032
		var1030 = var1033
	end
	local buff_1 = buffer.create(var1030)
	buffer.copy(buff_1, 0, buff, 0, var1030)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref), propTypesModule (ref)
	local var1030 = t_51.new()
	local var1031 = 0
	while var1031 < buffer.len(p51) do
		local _ = nil
		local var1032 = nil
		local var1033, var1034, var1035 = protoModule.readTag(p51, var1031)
		local var1036 = var1033
		var1032 = var1034
		var1031 = var1035
		
		if var1032 == protoModule.wireTypes.varint then
			local _ = nil
			local var1037, var1038 = protoModule.readVarInt(p51, var1031)
			local _ = var1037
			var1031 = var1038
			continue
		end
		if var1032 == protoModule.wireTypes.lengthDelimited then
			if var1036 == 1 then
				local _ = nil
				local var1039, var1040 = protoModule.readBuffer(p51, var1031)
				var1031 = var1040
				var1030.category_id = propTypesModule.StringProp.decode(var1039)
			else
				local _ = nil
				local var1041, var1042 = protoModule.readVarInt(p51, var1031)
				var1031 = var1042 + var1041
			end
		elseif var1032 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1043, var1044 = protoModule.readFixed32(p51, var1031)
			local _ = var1043
			var1031 = var1044
		elseif var1032 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1045, var1046 = protoModule.readFixed64(p51, var1031)
			local _ = var1045
			var1031 = var1046
		else
			error("Unsupported wire type: " .. var1821)
		end
	end
	return var1030
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
	local var1047 = t_51.new()
	
	if self.category_id ~= nil then
		var1047.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var1047.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	return var1047
end

t_51.descriptor = {
	name = "SelectMarketplaceCatalogCategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceCatalogCategory_Params = t_51
typeRegistryModule.default:register(t.SelectMarketplaceCatalogCategory_Params)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p52)
	-- upvalues: t (ref), t_52 (ref)
	return setmetatable({
		action_type = if p52 == nil or p52.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p52.action_type,
		action_params = if p52 == nil or p52.action_params == nil then nil else p52.action_params
	}, t_52)
end

function t_52:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1047 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1048, var1049 = protoModule.writeTag(buff, var1047, 1, protoModule.wireTypes.varint)
		var1048, var1841 = protoModule.writeVarInt(var1048, var1049, t.ActionType.toNumber(self.action_type))
		buff = var1048
		var1047 = var1049
	end
	if self.action_params ~= nil then
		local var1050 = self.action_params:encode()
		local var1051, var1052 = protoModule.writeTag(buff, var1047, 2, protoModule.wireTypes.lengthDelimited)
		var1051, var1844 = protoModule.writeBuffer(var1051, var1052, var1050, buffer.len(var1050))
		buff = var1051
		var1047 = var1052
	end
	local buff_1 = buffer.create(var1047)
	buffer.copy(buff_1, 0, buff, 0, var1047)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1047 = t_52.new()
	local var1048 = 0
	while var1048 < buffer.len(p52) do
		local _ = nil
		local var1049 = nil
		local var1050, var1051, var1052 = protoModule.readTag(p52, var1048)
		local var1053 = var1050
		var1049 = var1051
		var1048 = var1052
		
		if var1049 == protoModule.wireTypes.varint then
			if var1053 == 1 then
				local _ = nil
				local var1054, var1055 = protoModule.readVarIntI32(p52, var1048)
				local var1056 = var1054
				var1048 = var1055
				var1047.action_type = t.ActionType.fromNumber(var1056) or var1056
			else
				local _ = nil
				local var1057, var1058 = protoModule.readVarInt(p52, var1048)
				local _ = var1057
				var1048 = var1058
			end
		end
		if var1049 == protoModule.wireTypes.lengthDelimited then
			if var1053 == 2 then
				local _ = nil
				local var1059, var1060 = protoModule.readBuffer(p52, var1048)
				var1048 = var1060
				var1047.action_params = t.SelectMarketplaceCatalogSubcategory_Params.decode(var1059)
			else
				local _ = nil
				local var1061, var1062 = protoModule.readVarInt(p52, var1048)
				var1048 = var1062 + var1061
			end
		elseif var1049 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1063, var1064 = protoModule.readFixed32(p52, var1048)
			local _ = var1063
			var1048 = var1064
		elseif var1049 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1065, var1066 = protoModule.readFixed64(p52, var1048)
			local _ = var1065
			var1048 = var1066
		else
			error("Unsupported wire type: " .. var1848)
		end
	end
	return var1047
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
	local var1067 = t_52.new()
	
	if self.action_type ~= nil then
		var1067.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1067.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1067.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1067.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.actionParams)
	end
	return var1067
end

t_52.descriptor = {
	name = "SelectMarketplaceCatalogSubcategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogSubcategory"
}
t.SelectMarketplaceCatalogSubcategory = t_52
typeRegistryModule.default:register(t.SelectMarketplaceCatalogSubcategory)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p53)
	-- upvalues: t_53 (ref)
	return setmetatable({
		subcategory_id = if p53 == nil or p53.subcategory_id == nil then nil else p53.subcategory_id
	}, t_53)
end

function t_53:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1067 = 0
	
	if self.subcategory_id ~= nil then
		local var1068 = self.subcategory_id:encode()
		local var1069, var1070 = protoModule.writeTag(buff, var1067, 1, protoModule.wireTypes.lengthDelimited)
		var1069, var1872 = protoModule.writeBuffer(var1069, var1070, var1068, buffer.len(var1068))
		buff = var1069
		var1067 = var1070
	end
	local buff_1 = buffer.create(var1067)
	buffer.copy(buff_1, 0, buff, 0, var1067)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref), propTypesModule (ref)
	local var1067 = t_53.new()
	local var1068 = 0
	while var1068 < buffer.len(p53) do
		local _ = nil
		local var1069 = nil
		local var1070, var1071, var1072 = protoModule.readTag(p53, var1068)
		local var1073 = var1070
		var1069 = var1071
		var1068 = var1072
		
		if var1069 == protoModule.wireTypes.varint then
			local _ = nil
			local var1074, var1075 = protoModule.readVarInt(p53, var1068)
			local _ = var1074
			var1068 = var1075
			continue
		end
		if var1069 == protoModule.wireTypes.lengthDelimited then
			if var1073 == 1 then
				local _ = nil
				local var1076, var1077 = protoModule.readBuffer(p53, var1068)
				var1068 = var1077
				var1067.subcategory_id = propTypesModule.StringProp.decode(var1076)
			else
				local _ = nil
				local var1078, var1079 = protoModule.readVarInt(p53, var1068)
				var1068 = var1079 + var1078
			end
		elseif var1069 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1080, var1081 = protoModule.readFixed32(p53, var1068)
			local _ = var1080
			var1068 = var1081
		elseif var1069 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1082, var1083 = protoModule.readFixed64(p53, var1068)
			local _ = var1082
			var1068 = var1083
		else
			error("Unsupported wire type: " .. var1876)
		end
	end
	return var1067
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
	local var1084 = t_53.new()
	
	if self.subcategory_id ~= nil then
		var1084.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var1084.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	return var1084
end

t_53.descriptor = {
	name = "SelectMarketplaceCatalogSubcategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceCatalogSubcategory_Params = t_53
typeRegistryModule.default:register(t.SelectMarketplaceCatalogSubcategory_Params)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p54)
	-- upvalues: t (ref), t_54 (ref)
	return setmetatable({
		action_type = if p54 == nil or p54.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p54.action_type,
		action_params = if p54 == nil or p54.action_params == nil then nil else p54.action_params
	}, t_54)
end

function t_54:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1084 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1085, var1086 = protoModule.writeTag(buff, var1084, 1, protoModule.wireTypes.varint)
		var1085, var1896 = protoModule.writeVarInt(var1085, var1086, t.ActionType.toNumber(self.action_type))
		buff = var1085
		var1084 = var1086
	end
	if self.action_params ~= nil then
		local var1087 = self.action_params:encode()
		local var1088, var1089 = protoModule.writeTag(buff, var1084, 2, protoModule.wireTypes.lengthDelimited)
		var1088, var1899 = protoModule.writeBuffer(var1088, var1089, var1087, buffer.len(var1087))
		buff = var1088
		var1084 = var1089
	end
	local buff_1 = buffer.create(var1084)
	buffer.copy(buff_1, 0, buff, 0, var1084)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref), t (ref)
	local var1084 = t_54.new()
	local var1085 = 0
	while var1085 < buffer.len(p54) do
		local _ = nil
		local var1086 = nil
		local var1087, var1088, var1089 = protoModule.readTag(p54, var1085)
		local var1090 = var1087
		var1086 = var1088
		var1085 = var1089
		
		if var1086 == protoModule.wireTypes.varint then
			if var1090 == 1 then
				local _ = nil
				local var1091, var1092 = protoModule.readVarIntI32(p54, var1085)
				local var1093 = var1091
				var1085 = var1092
				var1084.action_type = t.ActionType.fromNumber(var1093) or var1093
			else
				local _ = nil
				local var1094, var1095 = protoModule.readVarInt(p54, var1085)
				local _ = var1094
				var1085 = var1095
			end
		end
		if var1086 == protoModule.wireTypes.lengthDelimited then
			if var1090 == 2 then
				local _ = nil
				local var1096, var1097 = protoModule.readBuffer(p54, var1085)
				var1085 = var1097
				var1084.action_params = t.OpenMarketplaceCatalogSeeAll_Params.decode(var1096)
			else
				local _ = nil
				local var1098, var1099 = protoModule.readVarInt(p54, var1085)
				var1085 = var1099 + var1098
			end
		elseif var1086 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1100, var1101 = protoModule.readFixed32(p54, var1085)
			local _ = var1100
			var1085 = var1101
		elseif var1086 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1102, var1103 = protoModule.readFixed64(p54, var1085)
			local _ = var1102
			var1085 = var1103
		else
			error("Unsupported wire type: " .. var1903)
		end
	end
	return var1084
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
	local var1104 = t_54.new()
	
	if self.action_type ~= nil then
		var1104.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1104.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1104.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1104.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.actionParams)
	end
	return var1104
end

t_54.descriptor = {
	name = "OpenMarketplaceCatalogSeeAll",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogSeeAll"
}
t.OpenMarketplaceCatalogSeeAll = t_54
typeRegistryModule.default:register(t.OpenMarketplaceCatalogSeeAll)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p55)
	-- upvalues: t_55 (ref)
	return setmetatable({
		sort_id = if p55 == nil or p55.sort_id == nil then nil else p55.sort_id,
		title = if p55 == nil or p55.title == nil then nil else p55.title,
		description = if p55 == nil or p55.description == nil then nil else p55.description,
		tooltip_text = if p55 == nil or p55.tooltip_text == nil then nil else p55.tooltip_text
	}, t_55)
end

function t_55:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1104 = 0
	
	if self.sort_id ~= nil then
		local var1105 = self.sort_id:encode()
		local var1106, var1107 = protoModule.writeTag(buff, var1104, 1, protoModule.wireTypes.lengthDelimited)
		var1106, var1927 = protoModule.writeBuffer(var1106, var1107, var1105, buffer.len(var1105))
		buff = var1106
		var1104 = var1107
	end
	if self.title ~= nil then
		local var1108 = self.title:encode()
		local var1109, var1110 = protoModule.writeTag(buff, var1104, 2, protoModule.wireTypes.lengthDelimited)
		var1109, var1930 = protoModule.writeBuffer(var1109, var1110, var1108, buffer.len(var1108))
		buff = var1109
		var1104 = var1110
	end
	if self.description ~= nil then
		local var1111 = self.description:encode()
		local var1112, var1113 = protoModule.writeTag(buff, var1104, 3, protoModule.wireTypes.lengthDelimited)
		var1112, var1933 = protoModule.writeBuffer(var1112, var1113, var1111, buffer.len(var1111))
		buff = var1112
		var1104 = var1113
	end
	if self.tooltip_text ~= nil then
		local var1114 = self.tooltip_text:encode()
		local var1115, var1116 = protoModule.writeTag(buff, var1104, 4, protoModule.wireTypes.lengthDelimited)
		var1115, var1936 = protoModule.writeBuffer(var1115, var1116, var1114, buffer.len(var1114))
		buff = var1115
		var1104 = var1116
	end
	local buff_1 = buffer.create(var1104)
	buffer.copy(buff_1, 0, buff, 0, var1104)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref), propTypesModule (ref)
	local var1104 = t_55.new()
	local var1105 = 0
	while var1105 < buffer.len(p55) do
		local _ = nil
		local var1106 = nil
		local var1107, var1108, var1109 = protoModule.readTag(p55, var1105)
		local var1110 = var1107
		var1106 = var1108
		var1105 = var1109
		
		if var1106 == protoModule.wireTypes.varint then
			local _ = nil
			local var1111, var1112 = protoModule.readVarInt(p55, var1105)
			local _ = var1111
			var1105 = var1112
			continue
		end
		if var1106 == protoModule.wireTypes.lengthDelimited then
			if var1110 == 1 then
				local _ = nil
				local var1113, var1114 = protoModule.readBuffer(p55, var1105)
				var1105 = var1114
				var1104.sort_id = propTypesModule.StringProp.decode(var1113)
			elseif var1110 == 2 then
				local _ = nil
				local var1115, var1116 = protoModule.readBuffer(p55, var1105)
				var1105 = var1116
				var1104.title = propTypesModule.StringProp.decode(var1115)
			elseif var1110 == 3 then
				local _ = nil
				local var1117, var1118 = protoModule.readBuffer(p55, var1105)
				var1105 = var1118
				var1104.description = propTypesModule.StringProp.decode(var1117)
			elseif var1110 == 4 then
				local _ = nil
				local var1119, var1120 = protoModule.readBuffer(p55, var1105)
				var1105 = var1120
				var1104.tooltip_text = propTypesModule.StringProp.decode(var1119)
			else
				local _ = nil
				local var1121, var1122 = protoModule.readVarInt(p55, var1105)
				var1105 = var1122 + var1121
			end
		elseif var1106 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1123, var1124 = protoModule.readFixed32(p55, var1105)
			local _ = var1123
			var1105 = var1124
		elseif var1106 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1125, var1126 = protoModule.readFixed64(p55, var1105)
			local _ = var1125
			var1105 = var1126
		else
			error("Unsupported wire type: " .. var1940)
		end
	end
	return var1104
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
	local var1127 = t_55.new()
	
	if self.sort_id ~= nil then
		var1127.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var1127.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.title ~= nil then
		var1127.title = propTypesModule.StringProp.jsonDecode(self.title)
	end
	if self.description ~= nil then
		var1127.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.tooltip_text ~= nil then
		var1127.tooltip_text = propTypesModule.StringProp.jsonDecode(self.tooltip_text)
	end
	if self.tooltipText ~= nil then
		var1127.tooltip_text = propTypesModule.StringProp.jsonDecode(self.tooltipText)
	end
	return var1127
end

t_55.descriptor = {
	name = "OpenMarketplaceCatalogSeeAll_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceCatalogSeeAll_Params = t_55
typeRegistryModule.default:register(t.OpenMarketplaceCatalogSeeAll_Params)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p56)
	-- upvalues: t (ref), t_56 (ref)
	return setmetatable({
		action_type = if p56 == nil or p56.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p56.action_type,
		action_params = if p56 == nil or p56.action_params == nil then nil else p56.action_params
	}, t_56)
end

function t_56:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1127 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1128, var1129 = protoModule.writeTag(buff, var1127, 1, protoModule.wireTypes.varint)
		var1128, var1966 = protoModule.writeVarInt(var1128, var1129, t.ActionType.toNumber(self.action_type))
		buff = var1128
		var1127 = var1129
	end
	if self.action_params ~= nil then
		local var1130 = self.action_params:encode()
		local var1131, var1132 = protoModule.writeTag(buff, var1127, 2, protoModule.wireTypes.lengthDelimited)
		var1131, var1969 = protoModule.writeBuffer(var1131, var1132, var1130, buffer.len(var1130))
		buff = var1131
		var1127 = var1132
	end
	local buff_1 = buffer.create(var1127)
	buffer.copy(buff_1, 0, buff, 0, var1127)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref), t (ref)
	local var1127 = t_56.new()
	local var1128 = 0
	while var1128 < buffer.len(p56) do
		local _ = nil
		local var1129 = nil
		local var1130, var1131, var1132 = protoModule.readTag(p56, var1128)
		local var1133 = var1130
		var1129 = var1131
		var1128 = var1132
		
		if var1129 == protoModule.wireTypes.varint then
			if var1133 == 1 then
				local _ = nil
				local var1134, var1135 = protoModule.readVarIntI32(p56, var1128)
				local var1136 = var1134
				var1128 = var1135
				var1127.action_type = t.ActionType.fromNumber(var1136) or var1136
			else
				local _ = nil
				local var1137, var1138 = protoModule.readVarInt(p56, var1128)
				local _ = var1137
				var1128 = var1138
			end
		end
		if var1129 == protoModule.wireTypes.lengthDelimited then
			if var1133 == 2 then
				local _ = nil
				local var1139, var1140 = protoModule.readBuffer(p56, var1128)
				var1128 = var1140
				var1127.action_params = t.CloseMarketplaceCategoryTooltip_Params.decode(var1139)
			else
				local _ = nil
				local var1141, var1142 = protoModule.readVarInt(p56, var1128)
				var1128 = var1142 + var1141
			end
		elseif var1129 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1143, var1144 = protoModule.readFixed32(p56, var1128)
			local _ = var1143
			var1128 = var1144
		elseif var1129 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1145, var1146 = protoModule.readFixed64(p56, var1128)
			local _ = var1145
			var1128 = var1146
		else
			error("Unsupported wire type: " .. var1973)
		end
	end
	return var1127
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
	local var1147 = t_56.new()
	
	if self.action_type ~= nil then
		var1147.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1147.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1147.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1147.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.actionParams)
	end
	return var1147
end

t_56.descriptor = {
	name = "CloseMarketplaceCategoryTooltip",
	fullName = "roblox.apppageplatform.shared.v1beta1.CloseMarketplaceCategoryTooltip"
}
t.CloseMarketplaceCategoryTooltip = t_56
typeRegistryModule.default:register(t.CloseMarketplaceCategoryTooltip)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p57)
	-- upvalues: t_57 (ref)
	return setmetatable({
		tooltip_id = if p57 == nil or p57.tooltip_id == nil then nil else p57.tooltip_id
	}, t_57)
end

function t_57:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1147 = 0
	
	if self.tooltip_id ~= nil then
		local var1148 = self.tooltip_id:encode()
		local var1149, var1150 = protoModule.writeTag(buff, var1147, 1, protoModule.wireTypes.lengthDelimited)
		var1149, var1997 = protoModule.writeBuffer(var1149, var1150, var1148, buffer.len(var1148))
		buff = var1149
		var1147 = var1150
	end
	local buff_1 = buffer.create(var1147)
	buffer.copy(buff_1, 0, buff, 0, var1147)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref), propTypesModule (ref)
	local var1147 = t_57.new()
	local var1148 = 0
	while var1148 < buffer.len(p57) do
		local _ = nil
		local var1149 = nil
		local var1150, var1151, var1152 = protoModule.readTag(p57, var1148)
		local var1153 = var1150
		var1149 = var1151
		var1148 = var1152
		
		if var1149 == protoModule.wireTypes.varint then
			local _ = nil
			local var1154, var1155 = protoModule.readVarInt(p57, var1148)
			local _ = var1154
			var1148 = var1155
			continue
		end
		if var1149 == protoModule.wireTypes.lengthDelimited then
			if var1153 == 1 then
				local _ = nil
				local var1156, var1157 = protoModule.readBuffer(p57, var1148)
				var1148 = var1157
				var1147.tooltip_id = propTypesModule.StringProp.decode(var1156)
			else
				local _ = nil
				local var1158, var1159 = protoModule.readVarInt(p57, var1148)
				var1148 = var1159 + var1158
			end
		elseif var1149 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1160, var1161 = protoModule.readFixed32(p57, var1148)
			local _ = var1160
			var1148 = var1161
		elseif var1149 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1162, var1163 = protoModule.readFixed64(p57, var1148)
			local _ = var1162
			var1148 = var1163
		else
			error("Unsupported wire type: " .. var2001)
		end
	end
	return var1147
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
	local var1164 = t_57.new()
	
	if self.tooltip_id ~= nil then
		var1164.tooltip_id = propTypesModule.StringProp.jsonDecode(self.tooltip_id)
	end
	if self.tooltipId ~= nil then
		var1164.tooltip_id = propTypesModule.StringProp.jsonDecode(self.tooltipId)
	end
	return var1164
end

t_57.descriptor = {
	name = "CloseMarketplaceCategoryTooltip_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.CloseMarketplaceCategoryTooltip_Params = t_57
typeRegistryModule.default:register(t.CloseMarketplaceCategoryTooltip_Params)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p58)
	-- upvalues: t (ref), t_58 (ref)
	return setmetatable({
		action_type = if p58 == nil or p58.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p58.action_type,
		action_params = if p58 == nil or p58.action_params == nil then nil else p58.action_params
	}, t_58)
end

function t_58:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1164 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1165, var1166 = protoModule.writeTag(buff, var1164, 1, protoModule.wireTypes.varint)
		var1165, var2021 = protoModule.writeVarInt(var1165, var1166, t.ActionType.toNumber(self.action_type))
		buff = var1165
		var1164 = var1166
	end
	if self.action_params ~= nil then
		local var1167 = self.action_params:encode()
		local var1168, var1169 = protoModule.writeTag(buff, var1164, 2, protoModule.wireTypes.lengthDelimited)
		var1168, var2024 = protoModule.writeBuffer(var1168, var1169, var1167, buffer.len(var1167))
		buff = var1168
		var1164 = var1169
	end
	local buff_1 = buffer.create(var1164)
	buffer.copy(buff_1, 0, buff, 0, var1164)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref), t (ref)
	local var1164 = t_58.new()
	local var1165 = 0
	while var1165 < buffer.len(p58) do
		local _ = nil
		local var1166 = nil
		local var1167, var1168, var1169 = protoModule.readTag(p58, var1165)
		local var1170 = var1167
		var1166 = var1168
		var1165 = var1169
		
		if var1166 == protoModule.wireTypes.varint then
			if var1170 == 1 then
				local _ = nil
				local var1171, var1172 = protoModule.readVarIntI32(p58, var1165)
				local var1173 = var1171
				var1165 = var1172
				var1164.action_type = t.ActionType.fromNumber(var1173) or var1173
			else
				local _ = nil
				local var1174, var1175 = protoModule.readVarInt(p58, var1165)
				local _ = var1174
				var1165 = var1175
			end
		end
		if var1166 == protoModule.wireTypes.lengthDelimited then
			if var1170 == 2 then
				local _ = nil
				local var1176, var1177 = protoModule.readBuffer(p58, var1165)
				var1165 = var1177
				var1164.action_params = t.ResizeMarketplaceCatalog_Params.decode(var1176)
			else
				local _ = nil
				local var1178, var1179 = protoModule.readVarInt(p58, var1165)
				var1165 = var1179 + var1178
			end
		elseif var1166 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1180, var1181 = protoModule.readFixed32(p58, var1165)
			local _ = var1180
			var1165 = var1181
		elseif var1166 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1182, var1183 = protoModule.readFixed64(p58, var1165)
			local _ = var1182
			var1165 = var1183
		else
			error("Unsupported wire type: " .. var2028)
		end
	end
	return var1164
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
	local var1184 = t_58.new()
	
	if self.action_type ~= nil then
		var1184.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1184.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1184.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1184.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.actionParams)
	end
	return var1184
end

t_58.descriptor = {
	name = "ResizeMarketplaceCatalog",
	fullName = "roblox.apppageplatform.shared.v1beta1.ResizeMarketplaceCatalog"
}
t.ResizeMarketplaceCatalog = t_58
typeRegistryModule.default:register(t.ResizeMarketplaceCatalog)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p59)
	-- upvalues: t_59 (ref)
	return setmetatable({
		category_id = if p59 == nil or p59.category_id == nil then nil else p59.category_id,
		subcategory_id = if p59 == nil or p59.subcategory_id == nil then nil else p59.subcategory_id,
		screen_size = if p59 == nil or p59.screen_size == nil then nil else p59.screen_size
	}, t_59)
end

function t_59:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1184 = 0
	
	if self.category_id ~= nil then
		local var1185 = self.category_id:encode()
		local var1186, var1187 = protoModule.writeTag(buff, var1184, 1, protoModule.wireTypes.lengthDelimited)
		var1186, var2052 = protoModule.writeBuffer(var1186, var1187, var1185, buffer.len(var1185))
		buff = var1186
		var1184 = var1187
	end
	if self.subcategory_id ~= nil then
		local var1188 = self.subcategory_id:encode()
		local var1189, var1190 = protoModule.writeTag(buff, var1184, 2, protoModule.wireTypes.lengthDelimited)
		var1189, var2055 = protoModule.writeBuffer(var1189, var1190, var1188, buffer.len(var1188))
		buff = var1189
		var1184 = var1190
	end
	if self.screen_size ~= nil then
		local var1191 = self.screen_size:encode()
		local var1192, var1193 = protoModule.writeTag(buff, var1184, 3, protoModule.wireTypes.lengthDelimited)
		var1192, var2058 = protoModule.writeBuffer(var1192, var1193, var1191, buffer.len(var1191))
		buff = var1192
		var1184 = var1193
	end
	local buff_1 = buffer.create(var1184)
	buffer.copy(buff_1, 0, buff, 0, var1184)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref), propTypesModule (ref)
	local var1184 = t_59.new()
	local var1185 = 0
	while var1185 < buffer.len(p59) do
		local _ = nil
		local var1186 = nil
		local var1187, var1188, var1189 = protoModule.readTag(p59, var1185)
		local var1190 = var1187
		var1186 = var1188
		var1185 = var1189
		
		if var1186 == protoModule.wireTypes.varint then
			local _ = nil
			local var1191, var1192 = protoModule.readVarInt(p59, var1185)
			local _ = var1191
			var1185 = var1192
			continue
		end
		if var1186 == protoModule.wireTypes.lengthDelimited then
			if var1190 == 1 then
				local _ = nil
				local var1193, var1194 = protoModule.readBuffer(p59, var1185)
				var1185 = var1194
				var1184.category_id = propTypesModule.StringProp.decode(var1193)
			elseif var1190 == 2 then
				local _ = nil
				local var1195, var1196 = protoModule.readBuffer(p59, var1185)
				var1185 = var1196
				var1184.subcategory_id = propTypesModule.StringProp.decode(var1195)
			elseif var1190 == 3 then
				local _ = nil
				local var1197, var1198 = protoModule.readBuffer(p59, var1185)
				var1185 = var1198
				var1184.screen_size = propTypesModule.StringProp.decode(var1197)
			else
				local _ = nil
				local var1199, var1200 = protoModule.readVarInt(p59, var1185)
				var1185 = var1200 + var1199
			end
		elseif var1186 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1201, var1202 = protoModule.readFixed32(p59, var1185)
			local _ = var1201
			var1185 = var1202
		elseif var1186 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1203, var1204 = protoModule.readFixed64(p59, var1185)
			local _ = var1203
			var1185 = var1204
		else
			error("Unsupported wire type: " .. var2062)
		end
	end
	return var1184
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
	local var1205 = t_59.new()
	
	if self.category_id ~= nil then
		var1205.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var1205.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	if self.subcategory_id ~= nil then
		var1205.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var1205.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	if self.screen_size ~= nil then
		var1205.screen_size = propTypesModule.StringProp.jsonDecode(self.screen_size)
	end
	if self.screenSize ~= nil then
		var1205.screen_size = propTypesModule.StringProp.jsonDecode(self.screenSize)
	end
	return var1205
end

t_59.descriptor = {
	name = "ResizeMarketplaceCatalog_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ResizeMarketplaceCatalog_Params = t_59
typeRegistryModule.default:register(t.ResizeMarketplaceCatalog_Params)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p60)
	-- upvalues: t (ref), t_60 (ref)
	return setmetatable({
		action_type = if p60 == nil or p60.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p60.action_type,
		action_params = if p60 == nil or p60.action_params == nil then nil else p60.action_params
	}, t_60)
end

function t_60:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1205 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1206, var1207 = protoModule.writeTag(buff, var1205, 1, protoModule.wireTypes.varint)
		var1206, var2086 = protoModule.writeVarInt(var1206, var1207, t.ActionType.toNumber(self.action_type))
		buff = var1206
		var1205 = var1207
	end
	if self.action_params ~= nil then
		local var1208 = self.action_params:encode()
		local var1209, var1210 = protoModule.writeTag(buff, var1205, 2, protoModule.wireTypes.lengthDelimited)
		var1209, var2089 = protoModule.writeBuffer(var1209, var1210, var1208, buffer.len(var1208))
		buff = var1209
		var1205 = var1210
	end
	local buff_1 = buffer.create(var1205)
	buffer.copy(buff_1, 0, buff, 0, var1205)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref), t (ref)
	local var1205 = t_60.new()
	local var1206 = 0
	while var1206 < buffer.len(p60) do
		local _ = nil
		local var1207 = nil
		local var1208, var1209, var1210 = protoModule.readTag(p60, var1206)
		local var1211 = var1208
		var1207 = var1209
		var1206 = var1210
		
		if var1207 == protoModule.wireTypes.varint then
			if var1211 == 1 then
				local _ = nil
				local var1212, var1213 = protoModule.readVarIntI32(p60, var1206)
				local var1214 = var1212
				var1206 = var1213
				var1205.action_type = t.ActionType.fromNumber(var1214) or var1214
			else
				local _ = nil
				local var1215, var1216 = protoModule.readVarInt(p60, var1206)
				local _ = var1215
				var1206 = var1216
			end
		end
		if var1207 == protoModule.wireTypes.lengthDelimited then
			if var1211 == 2 then
				local _ = nil
				local var1217, var1218 = protoModule.readBuffer(p60, var1206)
				var1206 = var1218
				var1205.action_params = t.OpenChartsSortDetailAction_Params.decode(var1217)
			else
				local _ = nil
				local var1219, var1220 = protoModule.readVarInt(p60, var1206)
				var1206 = var1220 + var1219
			end
		elseif var1207 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1221, var1222 = protoModule.readFixed32(p60, var1206)
			local _ = var1221
			var1206 = var1222
		elseif var1207 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1223, var1224 = protoModule.readFixed64(p60, var1206)
			local _ = var1223
			var1206 = var1224
		else
			error("Unsupported wire type: " .. var2093)
		end
	end
	return var1205
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
	local var1225 = t_60.new()
	
	if self.action_type ~= nil then
		var1225.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1225.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1225.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1225.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var1225
end

t_60.descriptor = {
	name = "OpenChartsSortDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenChartsSortDetailAction"
}
t.OpenChartsSortDetailAction = t_60
typeRegistryModule.default:register(t.OpenChartsSortDetailAction)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p61)
	-- upvalues: t_61 (ref)
	return setmetatable({
		sort_id = if p61 == nil or p61.sort_id == nil then nil else p61.sort_id,
		secondary_sort_id = if p61 == nil or p61.secondary_sort_id == nil then nil else p61.secondary_sort_id
	}, t_61)
end

function t_61:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1225 = 0
	
	if self.sort_id ~= nil then
		local var1226 = self.sort_id:encode()
		local var1227, var1228 = protoModule.writeTag(buff, var1225, 1, protoModule.wireTypes.lengthDelimited)
		var1227, var2117 = protoModule.writeBuffer(var1227, var1228, var1226, buffer.len(var1226))
		buff = var1227
		var1225 = var1228
	end
	if self.secondary_sort_id ~= nil then
		local var1229 = self.secondary_sort_id:encode()
		local var1230, var1231 = protoModule.writeTag(buff, var1225, 2, protoModule.wireTypes.lengthDelimited)
		var1230, var2120 = protoModule.writeBuffer(var1230, var1231, var1229, buffer.len(var1229))
		buff = var1230
		var1225 = var1231
	end
	local buff_1 = buffer.create(var1225)
	buffer.copy(buff_1, 0, buff, 0, var1225)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref), propTypesModule (ref)
	local var1225 = t_61.new()
	local var1226 = 0
	while var1226 < buffer.len(p61) do
		local _ = nil
		local var1227 = nil
		local var1228, var1229, var1230 = protoModule.readTag(p61, var1226)
		local var1231 = var1228
		var1227 = var1229
		var1226 = var1230
		
		if var1227 == protoModule.wireTypes.varint then
			local _ = nil
			local var1232, var1233 = protoModule.readVarInt(p61, var1226)
			local _ = var1232
			var1226 = var1233
			continue
		end
		if var1227 == protoModule.wireTypes.lengthDelimited then
			if var1231 == 1 then
				local _ = nil
				local var1234, var1235 = protoModule.readBuffer(p61, var1226)
				var1226 = var1235
				var1225.sort_id = propTypesModule.StringProp.decode(var1234)
			elseif var1231 == 2 then
				local _ = nil
				local var1236, var1237 = protoModule.readBuffer(p61, var1226)
				var1226 = var1237
				var1225.secondary_sort_id = propTypesModule.Int32Prop.decode(var1236)
			else
				local _ = nil
				local var1238, var1239 = protoModule.readVarInt(p61, var1226)
				var1226 = var1239 + var1238
			end
		elseif var1227 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1240, var1241 = protoModule.readFixed32(p61, var1226)
			local _ = var1240
			var1226 = var1241
		elseif var1227 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1242, var1243 = protoModule.readFixed64(p61, var1226)
			local _ = var1242
			var1226 = var1243
		else
			error("Unsupported wire type: " .. var2124)
		end
	end
	return var1225
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
	local var1244 = t_61.new()
	
	if self.sort_id ~= nil then
		var1244.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var1244.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.secondary_sort_id ~= nil then
		var1244.secondary_sort_id = propTypesModule.Int32Prop.jsonDecode(self.secondary_sort_id)
	end
	if self.secondarySortId ~= nil then
		var1244.secondary_sort_id = propTypesModule.Int32Prop.jsonDecode(self.secondarySortId)
	end
	return var1244
end

t_61.descriptor = {
	name = "OpenChartsSortDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenChartsSortDetailAction_Params = t_61
typeRegistryModule.default:register(t.OpenChartsSortDetailAction_Params)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p62)
	-- upvalues: t (ref), t_62 (ref)
	return setmetatable({
		action_type = if p62 == nil or p62.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p62.action_type,
		action_params = if p62 == nil or p62.action_params == nil then nil else p62.action_params
	}, t_62)
end

function t_62:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1244 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1245, var1246 = protoModule.writeTag(buff, var1244, 1, protoModule.wireTypes.varint)
		var1245, var2146 = protoModule.writeVarInt(var1245, var1246, t.ActionType.toNumber(self.action_type))
		buff = var1245
		var1244 = var1246
	end
	if self.action_params ~= nil then
		local var1247 = self.action_params:encode()
		local var1248, var1249 = protoModule.writeTag(buff, var1244, 2, protoModule.wireTypes.lengthDelimited)
		var1248, var2149 = protoModule.writeBuffer(var1248, var1249, var1247, buffer.len(var1247))
		buff = var1248
		var1244 = var1249
	end
	local buff_1 = buffer.create(var1244)
	buffer.copy(buff_1, 0, buff, 0, var1244)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref), t (ref)
	local var1244 = t_62.new()
	local var1245 = 0
	while var1245 < buffer.len(p62) do
		local _ = nil
		local var1246 = nil
		local var1247, var1248, var1249 = protoModule.readTag(p62, var1245)
		local var1250 = var1247
		var1246 = var1248
		var1245 = var1249
		
		if var1246 == protoModule.wireTypes.varint then
			if var1250 == 1 then
				local _ = nil
				local var1251, var1252 = protoModule.readVarIntI32(p62, var1245)
				local var1253 = var1251
				var1245 = var1252
				var1244.action_type = t.ActionType.fromNumber(var1253) or var1253
			else
				local _ = nil
				local var1254, var1255 = protoModule.readVarInt(p62, var1245)
				local _ = var1254
				var1245 = var1255
			end
		end
		if var1246 == protoModule.wireTypes.lengthDelimited then
			if var1250 == 2 then
				local _ = nil
				local var1256, var1257 = protoModule.readBuffer(p62, var1245)
				var1245 = var1257
				var1244.action_params = t.OpenSongDetailAction_Params.decode(var1256)
			else
				local _ = nil
				local var1258, var1259 = protoModule.readVarInt(p62, var1245)
				var1245 = var1259 + var1258
			end
		elseif var1246 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1260, var1261 = protoModule.readFixed32(p62, var1245)
			local _ = var1260
			var1245 = var1261
		elseif var1246 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1262, var1263 = protoModule.readFixed64(p62, var1245)
			local _ = var1262
			var1245 = var1263
		else
			error("Unsupported wire type: " .. var2153)
		end
	end
	return var1244
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
	local var1264 = t_62.new()
	
	if self.action_type ~= nil then
		var1264.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1264.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1264.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1264.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var1264
end

t_62.descriptor = {
	name = "OpenSongDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSongDetailAction"
}
t.OpenSongDetailAction = t_62
typeRegistryModule.default:register(t.OpenSongDetailAction)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p63)
	-- upvalues: t_63 (ref)
	return setmetatable({
		song_id = if p63 == nil or p63.song_id == nil then nil else p63.song_id
	}, t_63)
end

function t_63:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1264 = 0
	
	if self.song_id ~= nil then
		local var1265 = self.song_id:encode()
		local var1266, var1267 = protoModule.writeTag(buff, var1264, 1, protoModule.wireTypes.lengthDelimited)
		var1266, var2177 = protoModule.writeBuffer(var1266, var1267, var1265, buffer.len(var1265))
		buff = var1266
		var1264 = var1267
	end
	local buff_1 = buffer.create(var1264)
	buffer.copy(buff_1, 0, buff, 0, var1264)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref), propTypesModule (ref)
	local var1264 = t_63.new()
	local var1265 = 0
	while var1265 < buffer.len(p63) do
		local _ = nil
		local var1266 = nil
		local var1267, var1268, var1269 = protoModule.readTag(p63, var1265)
		local var1270 = var1267
		var1266 = var1268
		var1265 = var1269
		
		if var1266 == protoModule.wireTypes.varint then
			local _ = nil
			local var1271, var1272 = protoModule.readVarInt(p63, var1265)
			local _ = var1271
			var1265 = var1272
			continue
		end
		if var1266 == protoModule.wireTypes.lengthDelimited then
			if var1270 == 1 then
				local _ = nil
				local var1273, var1274 = protoModule.readBuffer(p63, var1265)
				var1265 = var1274
				var1264.song_id = propTypesModule.StringProp.decode(var1273)
			else
				local _ = nil
				local var1275, var1276 = protoModule.readVarInt(p63, var1265)
				var1265 = var1276 + var1275
			end
		elseif var1266 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1277, var1278 = protoModule.readFixed32(p63, var1265)
			local _ = var1277
			var1265 = var1278
		elseif var1266 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1279, var1280 = protoModule.readFixed64(p63, var1265)
			local _ = var1279
			var1265 = var1280
		else
			error("Unsupported wire type: " .. var2181)
		end
	end
	return var1264
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
	local var1281 = t_63.new()
	
	if self.song_id ~= nil then
		var1281.song_id = propTypesModule.StringProp.jsonDecode(self.song_id)
	end
	if self.songId ~= nil then
		var1281.song_id = propTypesModule.StringProp.jsonDecode(self.songId)
	end
	return var1281
end

t_63.descriptor = {
	name = "OpenSongDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSongDetailAction_Params = t_63
typeRegistryModule.default:register(t.OpenSongDetailAction_Params)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p64)
	-- upvalues: t (ref), t_64 (ref)
	return setmetatable({
		action_type = if p64 == nil or p64.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p64.action_type,
		action_params = if p64 == nil or p64.action_params == nil then nil else p64.action_params
	}, t_64)
end

function t_64:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1281 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1282, var1283 = protoModule.writeTag(buff, var1281, 1, protoModule.wireTypes.varint)
		var1282, var2201 = protoModule.writeVarInt(var1282, var1283, t.ActionType.toNumber(self.action_type))
		buff = var1282
		var1281 = var1283
	end
	if self.action_params ~= nil then
		local var1284 = self.action_params:encode()
		local var1285, var1286 = protoModule.writeTag(buff, var1281, 2, protoModule.wireTypes.lengthDelimited)
		var1285, var2204 = protoModule.writeBuffer(var1285, var1286, var1284, buffer.len(var1284))
		buff = var1285
		var1281 = var1286
	end
	local buff_1 = buffer.create(var1281)
	buffer.copy(buff_1, 0, buff, 0, var1281)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var1281 = t_64.new()
	local var1282 = 0
	while var1282 < buffer.len(p64) do
		local _ = nil
		local var1283 = nil
		local var1284, var1285, var1286 = protoModule.readTag(p64, var1282)
		local var1287 = var1284
		var1283 = var1285
		var1282 = var1286
		
		if var1283 == protoModule.wireTypes.varint then
			if var1287 == 1 then
				local _ = nil
				local var1288, var1289 = protoModule.readVarIntI32(p64, var1282)
				local var1290 = var1288
				var1282 = var1289
				var1281.action_type = t.ActionType.fromNumber(var1290) or var1290
			else
				local _ = nil
				local var1291, var1292 = protoModule.readVarInt(p64, var1282)
				local _ = var1291
				var1282 = var1292
			end
		end
		if var1283 == protoModule.wireTypes.lengthDelimited then
			if var1287 == 2 then
				local _ = nil
				local var1293, var1294 = protoModule.readBuffer(p64, var1282)
				var1282 = var1294
				var1281.action_params = t.OpenMarketplaceCatalogFilters_Params.decode(var1293)
			else
				local _ = nil
				local var1295, var1296 = protoModule.readVarInt(p64, var1282)
				var1282 = var1296 + var1295
			end
		elseif var1283 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1297, var1298 = protoModule.readFixed32(p64, var1282)
			local _ = var1297
			var1282 = var1298
		elseif var1283 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1299, var1300 = protoModule.readFixed64(p64, var1282)
			local _ = var1299
			var1282 = var1300
		else
			error("Unsupported wire type: " .. var2208)
		end
	end
	return var1281
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
	local var1301 = t_64.new()
	
	if self.action_type ~= nil then
		var1301.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1301.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1301.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1301.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.actionParams)
	end
	return var1301
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

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref)
	local var1301 = t_65.new()
	local var1302 = 0
	while var1302 < buffer.len(p65) do
		local var1303 = nil
		local _ = nil
		local var1304, var1305, var1306 = protoModule.readTag(p65, var1302)
		var1303 = var1304
		local var1307 = var1305
		var1302 = var1306
		
		if var1307 == protoModule.wireTypes.varint then
			local _ = nil
			local var1308, var1309 = protoModule.readVarInt(p65, var1302)
			local _ = var1308
			var1302 = var1309
		elseif var1307 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1310, var1311 = protoModule.readVarInt(p65, var1302)
			var1302 = var1311 + var1310
		elseif var1307 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1312, var1313 = protoModule.readFixed32(p65, var1302)
			local _ = var1312
			var1302 = var1313
		elseif var1307 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1314, var1315 = protoModule.readFixed64(p65, var1302)
			local _ = var1314
			var1302 = var1315
		else
			error("Unsupported wire type: " .. var2235)
		end
	end
	return var1301
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

function t_66.new(p66)
	-- upvalues: t (ref), t_66 (ref)
	return setmetatable({
		action_type = if p66 == nil or p66.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p66.action_type,
		action_params = if p66 == nil or p66.action_params == nil then nil else p66.action_params
	}, t_66)
end

function t_66:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1316 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1317, var1318 = protoModule.writeTag(buff, var1316, 1, protoModule.wireTypes.varint)
		var1317, var2247 = protoModule.writeVarInt(var1317, var1318, t.ActionType.toNumber(self.action_type))
		buff = var1317
		var1316 = var1318
	end
	if self.action_params ~= nil then
		local var1319 = self.action_params:encode()
		local var1320, var1321 = protoModule.writeTag(buff, var1316, 2, protoModule.wireTypes.lengthDelimited)
		var1320, var2250 = protoModule.writeBuffer(var1320, var1321, var1319, buffer.len(var1319))
		buff = var1320
		var1316 = var1321
	end
	local buff_1 = buffer.create(var1316)
	buffer.copy(buff_1, 0, buff, 0, var1316)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var1316 = t_66.new()
	local var1317 = 0
	while var1317 < buffer.len(p66) do
		local _ = nil
		local var1318 = nil
		local var1319, var1320, var1321 = protoModule.readTag(p66, var1317)
		local var1322 = var1319
		var1318 = var1320
		var1317 = var1321
		
		if var1318 == protoModule.wireTypes.varint then
			if var1322 == 1 then
				local _ = nil
				local var1323, var1324 = protoModule.readVarIntI32(p66, var1317)
				local var1325 = var1323
				var1317 = var1324
				var1316.action_type = t.ActionType.fromNumber(var1325) or var1325
			else
				local _ = nil
				local var1326, var1327 = protoModule.readVarInt(p66, var1317)
				local _ = var1326
				var1317 = var1327
			end
		end
		if var1318 == protoModule.wireTypes.lengthDelimited then
			if var1322 == 2 then
				local _ = nil
				local var1328, var1329 = protoModule.readBuffer(p66, var1317)
				var1317 = var1329
				var1316.action_params = t.RefreshFromApiAction_Params.decode(var1328)
			else
				local _ = nil
				local var1330, var1331 = protoModule.readVarInt(p66, var1317)
				var1317 = var1331 + var1330
			end
		elseif var1318 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1332, var1333 = protoModule.readFixed32(p66, var1317)
			local _ = var1332
			var1317 = var1333
		elseif var1318 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1334, var1335 = protoModule.readFixed64(p66, var1317)
			local _ = var1334
			var1317 = var1335
		else
			error("Unsupported wire type: " .. var2254)
		end
	end
	return var1316
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
	local var1336 = t_66.new()
	
	if self.action_type ~= nil then
		var1336.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1336.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1336.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1336.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var1336
end

t_66.descriptor = {
	name = "RefreshFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshFromApiAction"
}
t.RefreshFromApiAction = t_66
typeRegistryModule.default:register(t.RefreshFromApiAction)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p67)
	-- upvalues: t_67 (ref)
	return setmetatable({
		surface_key = if p67 == nil or p67.surface_key == nil then nil else p67.surface_key,
		config_key = if p67 == nil or p67.config_key == nil then nil else p67.config_key
	}, t_67)
end

function t_67:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1336 = 0
	
	if self.surface_key ~= nil then
		local var1337 = self.surface_key:encode()
		local var1338, var1339 = protoModule.writeTag(buff, var1336, 1, protoModule.wireTypes.lengthDelimited)
		var1338, var2278 = protoModule.writeBuffer(var1338, var1339, var1337, buffer.len(var1337))
		buff = var1338
		var1336 = var1339
	end
	if self.config_key ~= nil then
		local var1340 = self.config_key:encode()
		local var1341, var1342 = protoModule.writeTag(buff, var1336, 2, protoModule.wireTypes.lengthDelimited)
		var1341, var2281 = protoModule.writeBuffer(var1341, var1342, var1340, buffer.len(var1340))
		buff = var1341
		var1336 = var1342
	end
	local buff_1 = buffer.create(var1336)
	buffer.copy(buff_1, 0, buff, 0, var1336)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref), propTypesModule (ref)
	local var1336 = t_67.new()
	local var1337 = 0
	while var1337 < buffer.len(p67) do
		local _ = nil
		local var1338 = nil
		local var1339, var1340, var1341 = protoModule.readTag(p67, var1337)
		local var1342 = var1339
		var1338 = var1340
		var1337 = var1341
		
		if var1338 == protoModule.wireTypes.varint then
			local _ = nil
			local var1343, var1344 = protoModule.readVarInt(p67, var1337)
			local _ = var1343
			var1337 = var1344
			continue
		end
		if var1338 == protoModule.wireTypes.lengthDelimited then
			if var1342 == 1 then
				local _ = nil
				local var1345, var1346 = protoModule.readBuffer(p67, var1337)
				var1337 = var1346
				var1336.surface_key = propTypesModule.StringProp.decode(var1345)
			elseif var1342 == 2 then
				local _ = nil
				local var1347, var1348 = protoModule.readBuffer(p67, var1337)
				var1337 = var1348
				var1336.config_key = propTypesModule.StringProp.decode(var1347)
			else
				local _ = nil
				local var1349, var1350 = protoModule.readVarInt(p67, var1337)
				var1337 = var1350 + var1349
			end
		elseif var1338 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1351, var1352 = protoModule.readFixed32(p67, var1337)
			local _ = var1351
			var1337 = var1352
		elseif var1338 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1353, var1354 = protoModule.readFixed64(p67, var1337)
			local _ = var1353
			var1337 = var1354
		else
			error("Unsupported wire type: " .. var2285)
		end
	end
	return var1336
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
	local var1355 = t_67.new()
	
	if self.surface_key ~= nil then
		var1355.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var1355.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		var1355.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1355.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return var1355
end

t_67.descriptor = {
	name = "RefreshFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshFromApiAction_Params = t_67
typeRegistryModule.default:register(t.RefreshFromApiAction_Params)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p68)
	-- upvalues: t (ref), t_68 (ref)
	return setmetatable({
		action_type = if p68 == nil or p68.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p68.action_type,
		action_params = if p68 == nil or p68.action_params == nil then nil else p68.action_params
	}, t_68)
end

function t_68:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1355 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1356, var1357 = protoModule.writeTag(buff, var1355, 1, protoModule.wireTypes.varint)
		var1356, var2307 = protoModule.writeVarInt(var1356, var1357, t.ActionType.toNumber(self.action_type))
		buff = var1356
		var1355 = var1357
	end
	if self.action_params ~= nil then
		local var1358 = self.action_params:encode()
		local var1359, var1360 = protoModule.writeTag(buff, var1355, 2, protoModule.wireTypes.lengthDelimited)
		var1359, var2310 = protoModule.writeBuffer(var1359, var1360, var1358, buffer.len(var1358))
		buff = var1359
		var1355 = var1360
	end
	local buff_1 = buffer.create(var1355)
	buffer.copy(buff_1, 0, buff, 0, var1355)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref), t (ref)
	local var1355 = t_68.new()
	local var1356 = 0
	while var1356 < buffer.len(p68) do
		local _ = nil
		local var1357 = nil
		local var1358, var1359, var1360 = protoModule.readTag(p68, var1356)
		local var1361 = var1358
		var1357 = var1359
		var1356 = var1360
		
		if var1357 == protoModule.wireTypes.varint then
			if var1361 == 1 then
				local _ = nil
				local var1362, var1363 = protoModule.readVarIntI32(p68, var1356)
				local var1364 = var1362
				var1356 = var1363
				var1355.action_type = t.ActionType.fromNumber(var1364) or var1364
			else
				local _ = nil
				local var1365, var1366 = protoModule.readVarInt(p68, var1356)
				local _ = var1365
				var1356 = var1366
			end
		end
		if var1357 == protoModule.wireTypes.lengthDelimited then
			if var1361 == 2 then
				local _ = nil
				local var1367, var1368 = protoModule.readBuffer(p68, var1356)
				var1356 = var1368
				var1355.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.decode(var1367)
			else
				local _ = nil
				local var1369, var1370 = protoModule.readVarInt(p68, var1356)
				var1356 = var1370 + var1369
			end
		elseif var1357 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1371, var1372 = protoModule.readFixed32(p68, var1356)
			local _ = var1371
			var1356 = var1372
		elseif var1357 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1373, var1374 = protoModule.readFixed64(p68, var1356)
			local _ = var1373
			var1356 = var1374
		else
			error("Unsupported wire type: " .. var2314)
		end
	end
	return var1355
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
	local var1375 = t_68.new()
	
	if self.action_type ~= nil then
		var1375.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1375.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1375.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1375.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.actionParams)
	end
	return var1375
end

t_68.descriptor = {
	name = "RefreshOmniRecommendationFeedItemAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshOmniRecommendationFeedItemAction"
}
t.RefreshOmniRecommendationFeedItemAction = t_68
typeRegistryModule.default:register(t.RefreshOmniRecommendationFeedItemAction)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p69)
	-- upvalues: t_69 (ref)
	return setmetatable({
		topic_id = if p69 == nil or p69.topic_id == nil then nil else p69.topic_id,
		selected_option = if p69 == nil or p69.selected_option == nil then nil else p69.selected_option,
		request_intent = if p69 == nil or p69.request_intent == nil then nil else p69.request_intent,
		feed_item_key = if p69 == nil or p69.feed_item_key == nil then nil else p69.feed_item_key
	}, t_69)
end

function t_69:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1375 = 0
	
	if self.topic_id ~= nil then
		local var1376 = self.topic_id:encode()
		local var1377, var1378 = protoModule.writeTag(buff, var1375, 1, protoModule.wireTypes.lengthDelimited)
		var1377, var2338 = protoModule.writeBuffer(var1377, var1378, var1376, buffer.len(var1376))
		buff = var1377
		var1375 = var1378
	end
	if self.selected_option ~= nil then
		local var1379 = self.selected_option:encode()
		local var1380, var1381 = protoModule.writeTag(buff, var1375, 2, protoModule.wireTypes.lengthDelimited)
		var1380, var2341 = protoModule.writeBuffer(var1380, var1381, var1379, buffer.len(var1379))
		buff = var1380
		var1375 = var1381
	end
	if self.request_intent ~= nil then
		local var1382 = self.request_intent:encode()
		local var1383, var1384 = protoModule.writeTag(buff, var1375, 3, protoModule.wireTypes.lengthDelimited)
		var1383, var2344 = protoModule.writeBuffer(var1383, var1384, var1382, buffer.len(var1382))
		buff = var1383
		var1375 = var1384
	end
	if self.feed_item_key ~= nil then
		local var1385 = self.feed_item_key:encode()
		local var1386, var1387 = protoModule.writeTag(buff, var1375, 4, protoModule.wireTypes.lengthDelimited)
		var1386, var2347 = protoModule.writeBuffer(var1386, var1387, var1385, buffer.len(var1385))
		buff = var1386
		var1375 = var1387
	end
	local buff_1 = buffer.create(var1375)
	buffer.copy(buff_1, 0, buff, 0, var1375)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref), propTypesModule (ref)
	local var1375 = t_69.new()
	local var1376 = 0
	while var1376 < buffer.len(p69) do
		local _ = nil
		local var1377 = nil
		local var1378, var1379, var1380 = protoModule.readTag(p69, var1376)
		local var1381 = var1378
		var1377 = var1379
		var1376 = var1380
		
		if var1377 == protoModule.wireTypes.varint then
			local _ = nil
			local var1382, var1383 = protoModule.readVarInt(p69, var1376)
			local _ = var1382
			var1376 = var1383
			continue
		end
		if var1377 == protoModule.wireTypes.lengthDelimited then
			if var1381 == 1 then
				local _ = nil
				local var1384, var1385 = protoModule.readBuffer(p69, var1376)
				var1376 = var1385
				var1375.topic_id = propTypesModule.StringProp.decode(var1384)
			elseif var1381 == 2 then
				local _ = nil
				local var1386, var1387 = protoModule.readBuffer(p69, var1376)
				var1376 = var1387
				var1375.selected_option = propTypesModule.StringProp.decode(var1386)
			elseif var1381 == 3 then
				local _ = nil
				local var1388, var1389 = protoModule.readBuffer(p69, var1376)
				var1376 = var1389
				var1375.request_intent = propTypesModule.StringProp.decode(var1388)
			elseif var1381 == 4 then
				local _ = nil
				local var1390, var1391 = protoModule.readBuffer(p69, var1376)
				var1376 = var1391
				var1375.feed_item_key = propTypesModule.StringProp.decode(var1390)
			else
				local _ = nil
				local var1392, var1393 = protoModule.readVarInt(p69, var1376)
				var1376 = var1393 + var1392
			end
		elseif var1377 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1394, var1395 = protoModule.readFixed32(p69, var1376)
			local _ = var1394
			var1376 = var1395
		elseif var1377 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1396, var1397 = protoModule.readFixed64(p69, var1376)
			local _ = var1396
			var1376 = var1397
		else
			error("Unsupported wire type: " .. var2351)
		end
	end
	return var1375
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
	local var1398 = t_69.new()
	
	if self.topic_id ~= nil then
		var1398.topic_id = propTypesModule.StringProp.jsonDecode(self.topic_id)
	end
	if self.topicId ~= nil then
		var1398.topic_id = propTypesModule.StringProp.jsonDecode(self.topicId)
	end
	if self.selected_option ~= nil then
		var1398.selected_option = propTypesModule.StringProp.jsonDecode(self.selected_option)
	end
	if self.selectedOption ~= nil then
		var1398.selected_option = propTypesModule.StringProp.jsonDecode(self.selectedOption)
	end
	if self.request_intent ~= nil then
		var1398.request_intent = propTypesModule.StringProp.jsonDecode(self.request_intent)
	end
	if self.requestIntent ~= nil then
		var1398.request_intent = propTypesModule.StringProp.jsonDecode(self.requestIntent)
	end
	if self.feed_item_key ~= nil then
		var1398.feed_item_key = propTypesModule.StringProp.jsonDecode(self.feed_item_key)
	end
	if self.feedItemKey ~= nil then
		var1398.feed_item_key = propTypesModule.StringProp.jsonDecode(self.feedItemKey)
	end
	return var1398
end

t_69.descriptor = {
	name = "RefreshOmniRecommendationFeedItemAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshOmniRecommendationFeedItemAction_Params = t_69
typeRegistryModule.default:register(t.RefreshOmniRecommendationFeedItemAction_Params)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p70)
	-- upvalues: t (ref), t_70 (ref)
	return setmetatable({
		action_type = if p70 == nil or p70.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p70.action_type,
		action_params = if p70 == nil or p70.action_params == nil then nil else p70.action_params
	}, t_70)
end

function t_70:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1398 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1399, var1400 = protoModule.writeTag(buff, var1398, 1, protoModule.wireTypes.varint)
		var1399, var2377 = protoModule.writeVarInt(var1399, var1400, t.ActionType.toNumber(self.action_type))
		buff = var1399
		var1398 = var1400
	end
	if self.action_params ~= nil then
		local var1401 = self.action_params:encode()
		local var1402, var1403 = protoModule.writeTag(buff, var1398, 2, protoModule.wireTypes.lengthDelimited)
		var1402, var2380 = protoModule.writeBuffer(var1402, var1403, var1401, buffer.len(var1401))
		buff = var1402
		var1398 = var1403
	end
	local buff_1 = buffer.create(var1398)
	buffer.copy(buff_1, 0, buff, 0, var1398)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref), t (ref)
	local var1398 = t_70.new()
	local var1399 = 0
	while var1399 < buffer.len(p70) do
		local _ = nil
		local var1400 = nil
		local var1401, var1402, var1403 = protoModule.readTag(p70, var1399)
		local var1404 = var1401
		var1400 = var1402
		var1399 = var1403
		
		if var1400 == protoModule.wireTypes.varint then
			if var1404 == 1 then
				local _ = nil
				local var1405, var1406 = protoModule.readVarIntI32(p70, var1399)
				local var1407 = var1405
				var1399 = var1406
				var1398.action_type = t.ActionType.fromNumber(var1407) or var1407
			else
				local _ = nil
				local var1408, var1409 = protoModule.readVarInt(p70, var1399)
				local _ = var1408
				var1399 = var1409
			end
		end
		if var1400 == protoModule.wireTypes.lengthDelimited then
			if var1404 == 2 then
				local _ = nil
				local var1410, var1411 = protoModule.readBuffer(p70, var1399)
				var1399 = var1411
				var1398.action_params = t.RsvpToEventAction_Params.decode(var1410)
			else
				local _ = nil
				local var1412, var1413 = protoModule.readVarInt(p70, var1399)
				var1399 = var1413 + var1412
			end
		elseif var1400 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1414, var1415 = protoModule.readFixed32(p70, var1399)
			local _ = var1414
			var1399 = var1415
		elseif var1400 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1416, var1417 = protoModule.readFixed64(p70, var1399)
			local _ = var1416
			var1399 = var1417
		else
			error("Unsupported wire type: " .. var2384)
		end
	end
	return var1398
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
	local var1418 = t_70.new()
	
	if self.action_type ~= nil then
		var1418.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1418.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1418.action_params = t.RsvpToEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1418.action_params = t.RsvpToEventAction_Params.jsonDecode(self.actionParams)
	end
	return var1418
end

t_70.descriptor = {
	name = "RsvpToEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpToEventAction"
}
t.RsvpToEventAction = t_70
typeRegistryModule.default:register(t.RsvpToEventAction)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p71)
	-- upvalues: t_71 (ref)
	return setmetatable({
		event_id = if p71 == nil or p71.event_id == nil then nil else p71.event_id,
		user_rsvp = if p71 == nil or p71.user_rsvp == nil then nil else p71.user_rsvp,
		notifications_modal_identifier = if p71 == nil or p71.notifications_modal_identifier == nil then nil else p71.notifications_modal_identifier
	}, t_71)
end

function t_71:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1418 = 0
	
	if self.event_id ~= nil then
		local var1419 = self.event_id:encode()
		local var1420, var1421 = protoModule.writeTag(buff, var1418, 1, protoModule.wireTypes.lengthDelimited)
		var1420, var2408 = protoModule.writeBuffer(var1420, var1421, var1419, buffer.len(var1419))
		buff = var1420
		var1418 = var1421
	end
	if self.user_rsvp ~= nil then
		local var1422 = self.user_rsvp:encode()
		local var1423, var1424 = protoModule.writeTag(buff, var1418, 2, protoModule.wireTypes.lengthDelimited)
		var1423, var2411 = protoModule.writeBuffer(var1423, var1424, var1422, buffer.len(var1422))
		buff = var1423
		var1418 = var1424
	end
	if self.notifications_modal_identifier ~= nil then
		local var1425 = self.notifications_modal_identifier:encode()
		local var1426, var1427 = protoModule.writeTag(buff, var1418, 3, protoModule.wireTypes.lengthDelimited)
		var1426, var2414 = protoModule.writeBuffer(var1426, var1427, var1425, buffer.len(var1425))
		buff = var1426
		var1418 = var1427
	end
	local buff_1 = buffer.create(var1418)
	buffer.copy(buff_1, 0, buff, 0, var1418)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref), propTypesModule (ref)
	local var1418 = t_71.new()
	local var1419 = 0
	while var1419 < buffer.len(p71) do
		local _ = nil
		local var1420 = nil
		local var1421, var1422, var1423 = protoModule.readTag(p71, var1419)
		local var1424 = var1421
		var1420 = var1422
		var1419 = var1423
		
		if var1420 == protoModule.wireTypes.varint then
			local _ = nil
			local var1425, var1426 = protoModule.readVarInt(p71, var1419)
			local _ = var1425
			var1419 = var1426
			continue
		end
		if var1420 == protoModule.wireTypes.lengthDelimited then
			if var1424 == 1 then
				local _ = nil
				local var1427, var1428 = protoModule.readBuffer(p71, var1419)
				var1419 = var1428
				var1418.event_id = propTypesModule.StringProp.decode(var1427)
			elseif var1424 == 2 then
				local _ = nil
				local var1429, var1430 = protoModule.readBuffer(p71, var1419)
				var1419 = var1430
				var1418.user_rsvp = propTypesModule.BoolProp.decode(var1429)
			elseif var1424 == 3 then
				local _ = nil
				local var1431, var1432 = protoModule.readBuffer(p71, var1419)
				var1419 = var1432
				var1418.notifications_modal_identifier = propTypesModule.StringProp.decode(var1431)
			else
				local _ = nil
				local var1433, var1434 = protoModule.readVarInt(p71, var1419)
				var1419 = var1434 + var1433
			end
		elseif var1420 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1435, var1436 = protoModule.readFixed32(p71, var1419)
			local _ = var1435
			var1419 = var1436
		elseif var1420 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1437, var1438 = protoModule.readFixed64(p71, var1419)
			local _ = var1437
			var1419 = var1438
		else
			error("Unsupported wire type: " .. var2418)
		end
	end
	return var1418
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
	local var1439 = t_71.new()
	
	if self.event_id ~= nil then
		var1439.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var1439.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.user_rsvp ~= nil then
		var1439.user_rsvp = propTypesModule.BoolProp.jsonDecode(self.user_rsvp)
	end
	if self.userRsvp ~= nil then
		var1439.user_rsvp = propTypesModule.BoolProp.jsonDecode(self.userRsvp)
	end
	if self.notifications_modal_identifier ~= nil then
		var1439.notifications_modal_identifier = propTypesModule.StringProp.jsonDecode(self.notifications_modal_identifier)
	end
	if self.notificationsModalIdentifier ~= nil then
		var1439.notifications_modal_identifier = propTypesModule.StringProp.jsonDecode(self.notificationsModalIdentifier)
	end
	return var1439
end

t_71.descriptor = {
	name = "RsvpToEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RsvpToEventAction_Params = t_71
typeRegistryModule.default:register(t.RsvpToEventAction_Params)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p72)
	-- upvalues: t (ref), t_72 (ref)
	return setmetatable({
		action_type = if p72 == nil or p72.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p72.action_type,
		action_params = if p72 == nil or p72.action_params == nil then nil else p72.action_params
	}, t_72)
end

function t_72:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1439 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1440, var1441 = protoModule.writeTag(buff, var1439, 1, protoModule.wireTypes.varint)
		var1440, var2442 = protoModule.writeVarInt(var1440, var1441, t.ActionType.toNumber(self.action_type))
		buff = var1440
		var1439 = var1441
	end
	if self.action_params ~= nil then
		local var1442 = self.action_params:encode()
		local var1443, var1444 = protoModule.writeTag(buff, var1439, 2, protoModule.wireTypes.lengthDelimited)
		var1443, var2445 = protoModule.writeBuffer(var1443, var1444, var1442, buffer.len(var1442))
		buff = var1443
		var1439 = var1444
	end
	local buff_1 = buffer.create(var1439)
	buffer.copy(buff_1, 0, buff, 0, var1439)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var1439 = t_72.new()
	local var1440 = 0
	while var1440 < buffer.len(p72) do
		local _ = nil
		local var1441 = nil
		local var1442, var1443, var1444 = protoModule.readTag(p72, var1440)
		local var1445 = var1442
		var1441 = var1443
		var1440 = var1444
		
		if var1441 == protoModule.wireTypes.varint then
			if var1445 == 1 then
				local _ = nil
				local var1446, var1447 = protoModule.readVarIntI32(p72, var1440)
				local var1448 = var1446
				var1440 = var1447
				var1439.action_type = t.ActionType.fromNumber(var1448) or var1448
			else
				local _ = nil
				local var1449, var1450 = protoModule.readVarInt(p72, var1440)
				local _ = var1449
				var1440 = var1450
			end
		end
		if var1441 == protoModule.wireTypes.lengthDelimited then
			if var1445 == 2 then
				local _ = nil
				local var1451, var1452 = protoModule.readBuffer(p72, var1440)
				var1440 = var1452
				var1439.action_params = t.OpenEventDetailsAction_Params.decode(var1451)
			else
				local _ = nil
				local var1453, var1454 = protoModule.readVarInt(p72, var1440)
				var1440 = var1454 + var1453
			end
		elseif var1441 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1455, var1456 = protoModule.readFixed32(p72, var1440)
			local _ = var1455
			var1440 = var1456
		elseif var1441 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1457, var1458 = protoModule.readFixed64(p72, var1440)
			local _ = var1457
			var1440 = var1458
		else
			error("Unsupported wire type: " .. var2449)
		end
	end
	return var1439
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
	local var1459 = t_72.new()
	
	if self.action_type ~= nil then
		var1459.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1459.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1459.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1459.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var1459
end

t_72.descriptor = {
	name = "OpenEventDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenEventDetailsAction"
}
t.OpenEventDetailsAction = t_72
typeRegistryModule.default:register(t.OpenEventDetailsAction)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p73)
	-- upvalues: t_73 (ref)
	return setmetatable({
		event_id = if p73 == nil or p73.event_id == nil then nil else p73.event_id
	}, t_73)
end

function t_73:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1459 = 0
	
	if self.event_id ~= nil then
		local var1460 = self.event_id:encode()
		local var1461, var1462 = protoModule.writeTag(buff, var1459, 1, protoModule.wireTypes.lengthDelimited)
		var1461, var2473 = protoModule.writeBuffer(var1461, var1462, var1460, buffer.len(var1460))
		buff = var1461
		var1459 = var1462
	end
	local buff_1 = buffer.create(var1459)
	buffer.copy(buff_1, 0, buff, 0, var1459)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref), propTypesModule (ref)
	local var1459 = t_73.new()
	local var1460 = 0
	while var1460 < buffer.len(p73) do
		local _ = nil
		local var1461 = nil
		local var1462, var1463, var1464 = protoModule.readTag(p73, var1460)
		local var1465 = var1462
		var1461 = var1463
		var1460 = var1464
		
		if var1461 == protoModule.wireTypes.varint then
			local _ = nil
			local var1466, var1467 = protoModule.readVarInt(p73, var1460)
			local _ = var1466
			var1460 = var1467
			continue
		end
		if var1461 == protoModule.wireTypes.lengthDelimited then
			if var1465 == 1 then
				local _ = nil
				local var1468, var1469 = protoModule.readBuffer(p73, var1460)
				var1460 = var1469
				var1459.event_id = propTypesModule.StringProp.decode(var1468)
			else
				local _ = nil
				local var1470, var1471 = protoModule.readVarInt(p73, var1460)
				var1460 = var1471 + var1470
			end
		elseif var1461 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1472, var1473 = protoModule.readFixed32(p73, var1460)
			local _ = var1472
			var1460 = var1473
		elseif var1461 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1474, var1475 = protoModule.readFixed64(p73, var1460)
			local _ = var1474
			var1460 = var1475
		else
			error("Unsupported wire type: " .. var2477)
		end
	end
	return var1459
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
	local var1476 = t_73.new()
	
	if self.event_id ~= nil then
		var1476.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var1476.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var1476
end

t_73.descriptor = {
	name = "OpenEventDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenEventDetailsAction_Params = t_73
typeRegistryModule.default:register(t.OpenEventDetailsAction_Params)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p74)
	-- upvalues: t (ref), t_74 (ref)
	return setmetatable({
		action_type = if p74 == nil or p74.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p74.action_type,
		action_params = if p74 == nil or p74.action_params == nil then nil else p74.action_params
	}, t_74)
end

function t_74:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1476 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1477, var1478 = protoModule.writeTag(buff, var1476, 1, protoModule.wireTypes.varint)
		var1477, var2497 = protoModule.writeVarInt(var1477, var1478, t.ActionType.toNumber(self.action_type))
		buff = var1477
		var1476 = var1478
	end
	if self.action_params ~= nil then
		local var1479 = self.action_params:encode()
		local var1480, var1481 = protoModule.writeTag(buff, var1476, 2, protoModule.wireTypes.lengthDelimited)
		var1480, var2500 = protoModule.writeBuffer(var1480, var1481, var1479, buffer.len(var1479))
		buff = var1480
		var1476 = var1481
	end
	local buff_1 = buffer.create(var1476)
	buffer.copy(buff_1, 0, buff, 0, var1476)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var1476 = t_74.new()
	local var1477 = 0
	while var1477 < buffer.len(p74) do
		local _ = nil
		local var1478 = nil
		local var1479, var1480, var1481 = protoModule.readTag(p74, var1477)
		local var1482 = var1479
		var1478 = var1480
		var1477 = var1481
		
		if var1478 == protoModule.wireTypes.varint then
			if var1482 == 1 then
				local _ = nil
				local var1483, var1484 = protoModule.readVarIntI32(p74, var1477)
				local var1485 = var1483
				var1477 = var1484
				var1476.action_type = t.ActionType.fromNumber(var1485) or var1485
			else
				local _ = nil
				local var1486, var1487 = protoModule.readVarInt(p74, var1477)
				local _ = var1486
				var1477 = var1487
			end
		end
		if var1478 == protoModule.wireTypes.lengthDelimited then
			if var1482 == 2 then
				local _ = nil
				local var1488, var1489 = protoModule.readBuffer(p74, var1477)
				var1477 = var1489
				var1476.action_params = t.OpenBadgesSeeAllAction_Params.decode(var1488)
			else
				local _ = nil
				local var1490, var1491 = protoModule.readVarInt(p74, var1477)
				var1477 = var1491 + var1490
			end
		elseif var1478 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1492, var1493 = protoModule.readFixed32(p74, var1477)
			local _ = var1492
			var1477 = var1493
		elseif var1478 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1494, var1495 = protoModule.readFixed64(p74, var1477)
			local _ = var1494
			var1477 = var1495
		else
			error("Unsupported wire type: " .. var2504)
		end
	end
	return var1476
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
	local var1496 = t_74.new()
	
	if self.action_type ~= nil then
		var1496.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1496.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1496.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1496.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var1496
end

t_74.descriptor = {
	name = "OpenBadgesSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgesSeeAllAction"
}
t.OpenBadgesSeeAllAction = t_74
typeRegistryModule.default:register(t.OpenBadgesSeeAllAction)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p75)
	-- upvalues: t_75 (ref)
	return setmetatable({
		universe_id = if p75 == nil or p75.universe_id == nil then nil else p75.universe_id
	}, t_75)
end

function t_75:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1496 = 0
	
	if self.universe_id ~= nil then
		local var1497 = self.universe_id:encode()
		local var1498, var1499 = protoModule.writeTag(buff, var1496, 1, protoModule.wireTypes.lengthDelimited)
		var1498, var2528 = protoModule.writeBuffer(var1498, var1499, var1497, buffer.len(var1497))
		buff = var1498
		var1496 = var1499
	end
	local buff_1 = buffer.create(var1496)
	buffer.copy(buff_1, 0, buff, 0, var1496)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref), propTypesModule (ref)
	local var1496 = t_75.new()
	local var1497 = 0
	while var1497 < buffer.len(p75) do
		local _ = nil
		local var1498 = nil
		local var1499, var1500, var1501 = protoModule.readTag(p75, var1497)
		local var1502 = var1499
		var1498 = var1500
		var1497 = var1501
		
		if var1498 == protoModule.wireTypes.varint then
			local _ = nil
			local var1503, var1504 = protoModule.readVarInt(p75, var1497)
			local _ = var1503
			var1497 = var1504
			continue
		end
		if var1498 == protoModule.wireTypes.lengthDelimited then
			if var1502 == 1 then
				local _ = nil
				local var1505, var1506 = protoModule.readBuffer(p75, var1497)
				var1497 = var1506
				var1496.universe_id = propTypesModule.StringProp.decode(var1505)
			else
				local _ = nil
				local var1507, var1508 = protoModule.readVarInt(p75, var1497)
				var1497 = var1508 + var1507
			end
		elseif var1498 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1509, var1510 = protoModule.readFixed32(p75, var1497)
			local _ = var1509
			var1497 = var1510
		elseif var1498 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1511, var1512 = protoModule.readFixed64(p75, var1497)
			local _ = var1511
			var1497 = var1512
		else
			error("Unsupported wire type: " .. var2532)
		end
	end
	return var1496
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
	local var1513 = t_75.new()
	
	if self.universe_id ~= nil then
		var1513.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1513.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1513
end

t_75.descriptor = {
	name = "OpenBadgesSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenBadgesSeeAllAction_Params = t_75
typeRegistryModule.default:register(t.OpenBadgesSeeAllAction_Params)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p76)
	-- upvalues: t (ref), t_76 (ref)
	return setmetatable({
		action_type = if p76 == nil or p76.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p76.action_type,
		action_params = if p76 == nil or p76.action_params == nil then nil else p76.action_params
	}, t_76)
end

function t_76:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1513 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1514, var1515 = protoModule.writeTag(buff, var1513, 1, protoModule.wireTypes.varint)
		var1514, var2552 = protoModule.writeVarInt(var1514, var1515, t.ActionType.toNumber(self.action_type))
		buff = var1514
		var1513 = var1515
	end
	if self.action_params ~= nil then
		local var1516 = self.action_params:encode()
		local var1517, var1518 = protoModule.writeTag(buff, var1513, 2, protoModule.wireTypes.lengthDelimited)
		var1517, var2555 = protoModule.writeBuffer(var1517, var1518, var1516, buffer.len(var1516))
		buff = var1517
		var1513 = var1518
	end
	local buff_1 = buffer.create(var1513)
	buffer.copy(buff_1, 0, buff, 0, var1513)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var1513 = t_76.new()
	local var1514 = 0
	while var1514 < buffer.len(p76) do
		local _ = nil
		local var1515 = nil
		local var1516, var1517, var1518 = protoModule.readTag(p76, var1514)
		local var1519 = var1516
		var1515 = var1517
		var1514 = var1518
		
		if var1515 == protoModule.wireTypes.varint then
			if var1519 == 1 then
				local _ = nil
				local var1520, var1521 = protoModule.readVarIntI32(p76, var1514)
				local var1522 = var1520
				var1514 = var1521
				var1513.action_type = t.ActionType.fromNumber(var1522) or var1522
			else
				local _ = nil
				local var1523, var1524 = protoModule.readVarInt(p76, var1514)
				local _ = var1523
				var1514 = var1524
			end
		end
		if var1515 == protoModule.wireTypes.lengthDelimited then
			if var1519 == 2 then
				local _ = nil
				local var1525, var1526 = protoModule.readBuffer(p76, var1514)
				var1514 = var1526
				var1513.action_params = t.OpenExperienceStoreSeeAllAction_Params.decode(var1525)
			else
				local _ = nil
				local var1527, var1528 = protoModule.readVarInt(p76, var1514)
				var1514 = var1528 + var1527
			end
		elseif var1515 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1529, var1530 = protoModule.readFixed32(p76, var1514)
			local _ = var1529
			var1514 = var1530
		elseif var1515 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1531, var1532 = protoModule.readFixed64(p76, var1514)
			local _ = var1531
			var1514 = var1532
		else
			error("Unsupported wire type: " .. var2559)
		end
	end
	return var1513
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
	local var1533 = t_76.new()
	
	if self.action_type ~= nil then
		var1533.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1533.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1533.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1533.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var1533
end

t_76.descriptor = {
	name = "OpenExperienceStoreSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenExperienceStoreSeeAllAction"
}
t.OpenExperienceStoreSeeAllAction = t_76
typeRegistryModule.default:register(t.OpenExperienceStoreSeeAllAction)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p77)
	-- upvalues: t_77 (ref)
	return setmetatable({
		universe_id = if p77 == nil or p77.universe_id == nil then nil else p77.universe_id
	}, t_77)
end

function t_77:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1533 = 0
	
	if self.universe_id ~= nil then
		local var1534 = self.universe_id:encode()
		local var1535, var1536 = protoModule.writeTag(buff, var1533, 1, protoModule.wireTypes.lengthDelimited)
		var1535, var2583 = protoModule.writeBuffer(var1535, var1536, var1534, buffer.len(var1534))
		buff = var1535
		var1533 = var1536
	end
	local buff_1 = buffer.create(var1533)
	buffer.copy(buff_1, 0, buff, 0, var1533)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), propTypesModule (ref)
	local var1533 = t_77.new()
	local var1534 = 0
	while var1534 < buffer.len(p77) do
		local _ = nil
		local var1535 = nil
		local var1536, var1537, var1538 = protoModule.readTag(p77, var1534)
		local var1539 = var1536
		var1535 = var1537
		var1534 = var1538
		
		if var1535 == protoModule.wireTypes.varint then
			local _ = nil
			local var1540, var1541 = protoModule.readVarInt(p77, var1534)
			local _ = var1540
			var1534 = var1541
			continue
		end
		if var1535 == protoModule.wireTypes.lengthDelimited then
			if var1539 == 1 then
				local _ = nil
				local var1542, var1543 = protoModule.readBuffer(p77, var1534)
				var1534 = var1543
				var1533.universe_id = propTypesModule.StringProp.decode(var1542)
			else
				local _ = nil
				local var1544, var1545 = protoModule.readVarInt(p77, var1534)
				var1534 = var1545 + var1544
			end
		elseif var1535 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1546, var1547 = protoModule.readFixed32(p77, var1534)
			local _ = var1546
			var1534 = var1547
		elseif var1535 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1548, var1549 = protoModule.readFixed64(p77, var1534)
			local _ = var1548
			var1534 = var1549
		else
			error("Unsupported wire type: " .. var2587)
		end
	end
	return var1533
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
	local var1550 = t_77.new()
	
	if self.universe_id ~= nil then
		var1550.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1550.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1550
end

t_77.descriptor = {
	name = "OpenExperienceStoreSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenExperienceStoreSeeAllAction_Params = t_77
typeRegistryModule.default:register(t.OpenExperienceStoreSeeAllAction_Params)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p78)
	-- upvalues: t (ref), t_78 (ref)
	return setmetatable({
		action_type = if p78 == nil or p78.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p78.action_type,
		action_params = if p78 == nil or p78.action_params == nil then nil else p78.action_params
	}, t_78)
end

function t_78:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1550 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1551, var1552 = protoModule.writeTag(buff, var1550, 1, protoModule.wireTypes.varint)
		var1551, var2607 = protoModule.writeVarInt(var1551, var1552, t.ActionType.toNumber(self.action_type))
		buff = var1551
		var1550 = var1552
	end
	if self.action_params ~= nil then
		local var1553 = self.action_params:encode()
		local var1554, var1555 = protoModule.writeTag(buff, var1550, 2, protoModule.wireTypes.lengthDelimited)
		var1554, var2610 = protoModule.writeBuffer(var1554, var1555, var1553, buffer.len(var1553))
		buff = var1554
		var1550 = var1555
	end
	local buff_1 = buffer.create(var1550)
	buffer.copy(buff_1, 0, buff, 0, var1550)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref), t (ref)
	local var1550 = t_78.new()
	local var1551 = 0
	while var1551 < buffer.len(p78) do
		local _ = nil
		local var1552 = nil
		local var1553, var1554, var1555 = protoModule.readTag(p78, var1551)
		local var1556 = var1553
		var1552 = var1554
		var1551 = var1555
		
		if var1552 == protoModule.wireTypes.varint then
			if var1556 == 1 then
				local _ = nil
				local var1557, var1558 = protoModule.readVarIntI32(p78, var1551)
				local var1559 = var1557
				var1551 = var1558
				var1550.action_type = t.ActionType.fromNumber(var1559) or var1559
			else
				local _ = nil
				local var1560, var1561 = protoModule.readVarInt(p78, var1551)
				local _ = var1560
				var1551 = var1561
			end
		end
		if var1552 == protoModule.wireTypes.lengthDelimited then
			if var1556 == 2 then
				local _ = nil
				local var1562, var1563 = protoModule.readBuffer(p78, var1551)
				var1551 = var1563
				var1550.action_params = t.OpenSubscriptionPurchasePageAction_Params.decode(var1562)
			else
				local _ = nil
				local var1564, var1565 = protoModule.readVarInt(p78, var1551)
				var1551 = var1565 + var1564
			end
		elseif var1552 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1566, var1567 = protoModule.readFixed32(p78, var1551)
			local _ = var1566
			var1551 = var1567
		elseif var1552 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1568, var1569 = protoModule.readFixed64(p78, var1551)
			local _ = var1568
			var1551 = var1569
		else
			error("Unsupported wire type: " .. var2614)
		end
	end
	return var1550
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
	local var1570 = t_78.new()
	
	if self.action_type ~= nil then
		var1570.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1570.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1570.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1570.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.actionParams)
	end
	return var1570
end

t_78.descriptor = {
	name = "OpenSubscriptionPurchasePageAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSubscriptionPurchasePageAction"
}
t.OpenSubscriptionPurchasePageAction = t_78
typeRegistryModule.default:register(t.OpenSubscriptionPurchasePageAction)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p79)
	-- upvalues: t_79 (ref)
	return setmetatable({
		subscription_id = if p79 == nil or p79.subscription_id == nil then nil else p79.subscription_id,
		universe_id = if p79 == nil or p79.universe_id == nil then nil else p79.universe_id,
		creator_name = if p79 == nil or p79.creator_name == nil then nil else p79.creator_name,
		creator_verified = if p79 == nil or p79.creator_verified == nil then nil else p79.creator_verified,
		name = if p79 == nil or p79.name == nil then nil else p79.name,
		description = if p79 == nil or p79.description == nil then nil else p79.description,
		image_asset_id = if p79 == nil or p79.image_asset_id == nil then nil else p79.image_asset_id,
		period_type = if p79 == nil or p79.period_type == nil then nil else p79.period_type,
		is_subscribed = if p79 == nil or p79.is_subscribed == nil then nil else p79.is_subscribed,
		price_display = if p79 == nil or p79.price_display == nil then nil else p79.price_display,
		price_in_robux = if p79 == nil or p79.price_in_robux == nil then nil else p79.price_in_robux,
		price_tier = if p79 == nil or p79.price_tier == nil then nil else p79.price_tier,
		thumbnail_string = if p79 == nil or p79.thumbnail_string == nil then nil else p79.thumbnail_string
	}, t_79)
end

function t_79:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1570 = 0
	
	if self.subscription_id ~= nil then
		local var1571 = self.subscription_id:encode()
		local var1572, var1573 = protoModule.writeTag(buff, var1570, 1, protoModule.wireTypes.lengthDelimited)
		var1572, var2638 = protoModule.writeBuffer(var1572, var1573, var1571, buffer.len(var1571))
		buff = var1572
		var1570 = var1573
	end
	if self.universe_id ~= nil then
		local var1574 = self.universe_id:encode()
		local var1575, var1576 = protoModule.writeTag(buff, var1570, 2, protoModule.wireTypes.lengthDelimited)
		var1575, var2641 = protoModule.writeBuffer(var1575, var1576, var1574, buffer.len(var1574))
		buff = var1575
		var1570 = var1576
	end
	if self.creator_name ~= nil then
		local var1577 = self.creator_name:encode()
		local var1578, var1579 = protoModule.writeTag(buff, var1570, 3, protoModule.wireTypes.lengthDelimited)
		var1578, var2644 = protoModule.writeBuffer(var1578, var1579, var1577, buffer.len(var1577))
		buff = var1578
		var1570 = var1579
	end
	if self.creator_verified ~= nil then
		local var1580 = self.creator_verified:encode()
		local var1581, var1582 = protoModule.writeTag(buff, var1570, 4, protoModule.wireTypes.lengthDelimited)
		var1581, var2647 = protoModule.writeBuffer(var1581, var1582, var1580, buffer.len(var1580))
		buff = var1581
		var1570 = var1582
	end
	if self.name ~= nil then
		local var1583 = self.name:encode()
		local var1584, var1585 = protoModule.writeTag(buff, var1570, 5, protoModule.wireTypes.lengthDelimited)
		var1584, var2650 = protoModule.writeBuffer(var1584, var1585, var1583, buffer.len(var1583))
		buff = var1584
		var1570 = var1585
	end
	if self.description ~= nil then
		local var1586 = self.description:encode()
		local var1587, var1588 = protoModule.writeTag(buff, var1570, 6, protoModule.wireTypes.lengthDelimited)
		var1587, var2653 = protoModule.writeBuffer(var1587, var1588, var1586, buffer.len(var1586))
		buff = var1587
		var1570 = var1588
	end
	if self.image_asset_id ~= nil then
		local var1589 = self.image_asset_id:encode()
		local var1590, var1591 = protoModule.writeTag(buff, var1570, 7, protoModule.wireTypes.lengthDelimited)
		var1590, var2656 = protoModule.writeBuffer(var1590, var1591, var1589, buffer.len(var1589))
		buff = var1590
		var1570 = var1591
	end
	if self.period_type ~= nil then
		local var1592 = self.period_type:encode()
		local var1593, var1594 = protoModule.writeTag(buff, var1570, 8, protoModule.wireTypes.lengthDelimited)
		var1593, var2659 = protoModule.writeBuffer(var1593, var1594, var1592, buffer.len(var1592))
		buff = var1593
		var1570 = var1594
	end
	if self.is_subscribed ~= nil then
		local var1595 = self.is_subscribed:encode()
		local var1596, var1597 = protoModule.writeTag(buff, var1570, 9, protoModule.wireTypes.lengthDelimited)
		var1596, var2662 = protoModule.writeBuffer(var1596, var1597, var1595, buffer.len(var1595))
		buff = var1596
		var1570 = var1597
	end
	if self.price_display ~= nil then
		local var1598 = self.price_display:encode()
		local var1599, var1600 = protoModule.writeTag(buff, var1570, 10, protoModule.wireTypes.lengthDelimited)
		var1599, var2665 = protoModule.writeBuffer(var1599, var1600, var1598, buffer.len(var1598))
		buff = var1599
		var1570 = var1600
	end
	if self.price_in_robux ~= nil then
		local var1601 = self.price_in_robux:encode()
		local var1602, var1603 = protoModule.writeTag(buff, var1570, 11, protoModule.wireTypes.lengthDelimited)
		var1602, var2668 = protoModule.writeBuffer(var1602, var1603, var1601, buffer.len(var1601))
		buff = var1602
		var1570 = var1603
	end
	if self.price_tier ~= nil then
		local var1604 = self.price_tier:encode()
		local var1605, var1606 = protoModule.writeTag(buff, var1570, 12, protoModule.wireTypes.lengthDelimited)
		var1605, var2671 = protoModule.writeBuffer(var1605, var1606, var1604, buffer.len(var1604))
		buff = var1605
		var1570 = var1606
	end
	if self.thumbnail_string ~= nil then
		local var1607 = self.thumbnail_string:encode()
		local var1608, var1609 = protoModule.writeTag(buff, var1570, 13, protoModule.wireTypes.lengthDelimited)
		var1608, var2674 = protoModule.writeBuffer(var1608, var1609, var1607, buffer.len(var1607))
		buff = var1608
		var1570 = var1609
	end
	local buff_1 = buffer.create(var1570)
	buffer.copy(buff_1, 0, buff, 0, var1570)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref), propTypesModule (ref)
	local var1570 = t_79.new()
	local var1571 = 0
	while var1571 < buffer.len(p79) do
		local _ = nil
		local var1572 = nil
		local var1573, var1574, var1575 = protoModule.readTag(p79, var1571)
		local var1576 = var1573
		var1572 = var1574
		var1571 = var1575
		
		if var1572 == protoModule.wireTypes.varint then
			local _ = nil
			local var1577, var1578 = protoModule.readVarInt(p79, var1571)
			local _ = var1577
			var1571 = var1578
			continue
		end
		if var1572 == protoModule.wireTypes.lengthDelimited then
			if var1576 == 1 then
				local _ = nil
				local var1579, var1580 = protoModule.readBuffer(p79, var1571)
				var1571 = var1580
				var1570.subscription_id = propTypesModule.StringProp.decode(var1579)
			elseif var1576 == 2 then
				local _ = nil
				local var1581, var1582 = protoModule.readBuffer(p79, var1571)
				var1571 = var1582
				var1570.universe_id = propTypesModule.StringProp.decode(var1581)
			elseif var1576 == 3 then
				local _ = nil
				local var1583, var1584 = protoModule.readBuffer(p79, var1571)
				var1571 = var1584
				var1570.creator_name = propTypesModule.StringProp.decode(var1583)
			elseif var1576 == 4 then
				local _ = nil
				local var1585, var1586 = protoModule.readBuffer(p79, var1571)
				var1571 = var1586
				var1570.creator_verified = propTypesModule.BoolProp.decode(var1585)
			elseif var1576 == 5 then
				local _ = nil
				local var1587, var1588 = protoModule.readBuffer(p79, var1571)
				var1571 = var1588
				var1570.name = propTypesModule.StringProp.decode(var1587)
			elseif var1576 == 6 then
				local _ = nil
				local var1589, var1590 = protoModule.readBuffer(p79, var1571)
				var1571 = var1590
				var1570.description = propTypesModule.StringProp.decode(var1589)
			elseif var1576 == 7 then
				local _ = nil
				local var1591, var1592 = protoModule.readBuffer(p79, var1571)
				var1571 = var1592
				var1570.image_asset_id = propTypesModule.Int64Prop.decode(var1591)
			elseif var1576 == 8 then
				local _ = nil
				local var1593, var1594 = protoModule.readBuffer(p79, var1571)
				var1571 = var1594
				var1570.period_type = propTypesModule.StringProp.decode(var1593)
			elseif var1576 == 9 then
				local _ = nil
				local var1595, var1596 = protoModule.readBuffer(p79, var1571)
				var1571 = var1596
				var1570.is_subscribed = propTypesModule.BoolProp.decode(var1595)
			elseif var1576 == 10 then
				local _ = nil
				local var1597, var1598 = protoModule.readBuffer(p79, var1571)
				var1571 = var1598
				var1570.price_display = propTypesModule.StringProp.decode(var1597)
			elseif var1576 == 11 then
				local _ = nil
				local var1599, var1600 = protoModule.readBuffer(p79, var1571)
				var1571 = var1600
				var1570.price_in_robux = propTypesModule.Int64Prop.decode(var1599)
			elseif var1576 == 12 then
				local _ = nil
				local var1601, var1602 = protoModule.readBuffer(p79, var1571)
				var1571 = var1602
				var1570.price_tier = propTypesModule.Int64Prop.decode(var1601)
			elseif var1576 == 13 then
				local _ = nil
				local var1603, var1604 = protoModule.readBuffer(p79, var1571)
				var1571 = var1604
				var1570.thumbnail_string = propTypesModule.StringProp.decode(var1603)
			else
				local _ = nil
				local var1605, var1606 = protoModule.readVarInt(p79, var1571)
				var1571 = var1606 + var1605
			end
		elseif var1572 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1607, var1608 = protoModule.readFixed32(p79, var1571)
			local _ = var1607
			var1571 = var1608
		elseif var1572 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1609, var1610 = protoModule.readFixed64(p79, var1571)
			local _ = var1609
			var1571 = var1610
		else
			error("Unsupported wire type: " .. var2678)
		end
	end
	return var1570
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
	local var1611 = t_79.new()
	
	if self.subscription_id ~= nil then
		var1611.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		var1611.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		var1611.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1611.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.creator_name ~= nil then
		var1611.creator_name = propTypesModule.StringProp.jsonDecode(self.creator_name)
	end
	if self.creatorName ~= nil then
		var1611.creator_name = propTypesModule.StringProp.jsonDecode(self.creatorName)
	end
	if self.creator_verified ~= nil then
		var1611.creator_verified = propTypesModule.BoolProp.jsonDecode(self.creator_verified)
	end
	if self.creatorVerified ~= nil then
		var1611.creator_verified = propTypesModule.BoolProp.jsonDecode(self.creatorVerified)
	end
	if self.name ~= nil then
		var1611.name = propTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.description ~= nil then
		var1611.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_asset_id ~= nil then
		var1611.image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.image_asset_id)
	end
	if self.imageAssetId ~= nil then
		var1611.image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.imageAssetId)
	end
	if self.period_type ~= nil then
		var1611.period_type = propTypesModule.StringProp.jsonDecode(self.period_type)
	end
	if self.periodType ~= nil then
		var1611.period_type = propTypesModule.StringProp.jsonDecode(self.periodType)
	end
	if self.is_subscribed ~= nil then
		var1611.is_subscribed = propTypesModule.BoolProp.jsonDecode(self.is_subscribed)
	end
	if self.isSubscribed ~= nil then
		var1611.is_subscribed = propTypesModule.BoolProp.jsonDecode(self.isSubscribed)
	end
	if self.price_display ~= nil then
		var1611.price_display = propTypesModule.StringProp.jsonDecode(self.price_display)
	end
	if self.priceDisplay ~= nil then
		var1611.price_display = propTypesModule.StringProp.jsonDecode(self.priceDisplay)
	end
	if self.price_in_robux ~= nil then
		var1611.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		var1611.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.price_tier ~= nil then
		var1611.price_tier = propTypesModule.Int64Prop.jsonDecode(self.price_tier)
	end
	if self.priceTier ~= nil then
		var1611.price_tier = propTypesModule.Int64Prop.jsonDecode(self.priceTier)
	end
	if self.thumbnail_string ~= nil then
		var1611.thumbnail_string = propTypesModule.StringProp.jsonDecode(self.thumbnail_string)
	end
	if self.thumbnailString ~= nil then
		var1611.thumbnail_string = propTypesModule.StringProp.jsonDecode(self.thumbnailString)
	end
	return var1611
end

t_79.descriptor = {
	name = "OpenSubscriptionPurchasePageAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSubscriptionPurchasePageAction_Params = t_79
typeRegistryModule.default:register(t.OpenSubscriptionPurchasePageAction_Params)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p80)
	-- upvalues: t (ref), t_80 (ref)
	return setmetatable({
		action_type = if p80 == nil or p80.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p80.action_type,
		action_params = if p80 == nil or p80.action_params == nil then nil else p80.action_params
	}, t_80)
end

function t_80:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1611 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1612, var1613 = protoModule.writeTag(buff, var1611, 1, protoModule.wireTypes.varint)
		var1612, var2722 = protoModule.writeVarInt(var1612, var1613, t.ActionType.toNumber(self.action_type))
		buff = var1612
		var1611 = var1613
	end
	if self.action_params ~= nil then
		local var1614 = self.action_params:encode()
		local var1615, var1616 = protoModule.writeTag(buff, var1611, 2, protoModule.wireTypes.lengthDelimited)
		var1615, var2725 = protoModule.writeBuffer(var1615, var1616, var1614, buffer.len(var1614))
		buff = var1615
		var1611 = var1616
	end
	local buff_1 = buffer.create(var1611)
	buffer.copy(buff_1, 0, buff, 0, var1611)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var1611 = t_80.new()
	local var1612 = 0
	while var1612 < buffer.len(p80) do
		local _ = nil
		local var1613 = nil
		local var1614, var1615, var1616 = protoModule.readTag(p80, var1612)
		local var1617 = var1614
		var1613 = var1615
		var1612 = var1616
		
		if var1613 == protoModule.wireTypes.varint then
			if var1617 == 1 then
				local _ = nil
				local var1618, var1619 = protoModule.readVarIntI32(p80, var1612)
				local var1620 = var1618
				var1612 = var1619
				var1611.action_type = t.ActionType.fromNumber(var1620) or var1620
			else
				local _ = nil
				local var1621, var1622 = protoModule.readVarInt(p80, var1612)
				local _ = var1621
				var1612 = var1622
			end
		end
		if var1613 == protoModule.wireTypes.lengthDelimited then
			if var1617 == 2 then
				local _ = nil
				local var1623, var1624 = protoModule.readBuffer(p80, var1612)
				var1612 = var1624
				var1611.action_params = t.RefreshGamePassesAction_Params.decode(var1623)
			else
				local _ = nil
				local var1625, var1626 = protoModule.readVarInt(p80, var1612)
				var1612 = var1626 + var1625
			end
		elseif var1613 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1627, var1628 = protoModule.readFixed32(p80, var1612)
			local _ = var1627
			var1612 = var1628
		elseif var1613 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1629, var1630 = protoModule.readFixed64(p80, var1612)
			local _ = var1629
			var1612 = var1630
		else
			error("Unsupported wire type: " .. var2729)
		end
	end
	return var1611
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
	local var1631 = t_80.new()
	
	if self.action_type ~= nil then
		var1631.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1631.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1631.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1631.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.actionParams)
	end
	return var1631
end

t_80.descriptor = {
	name = "RefreshGamePassesAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshGamePassesAction"
}
t.RefreshGamePassesAction = t_80
typeRegistryModule.default:register(t.RefreshGamePassesAction)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p81)
	-- upvalues: t_81 (ref)
	return setmetatable({
		universe_id = if p81 == nil or p81.universe_id == nil then nil else p81.universe_id
	}, t_81)
end

function t_81:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1631 = 0
	
	if self.universe_id ~= nil then
		local var1632 = self.universe_id:encode()
		local var1633, var1634 = protoModule.writeTag(buff, var1631, 1, protoModule.wireTypes.lengthDelimited)
		var1633, var2753 = protoModule.writeBuffer(var1633, var1634, var1632, buffer.len(var1632))
		buff = var1633
		var1631 = var1634
	end
	local buff_1 = buffer.create(var1631)
	buffer.copy(buff_1, 0, buff, 0, var1631)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref), propTypesModule (ref)
	local var1631 = t_81.new()
	local var1632 = 0
	while var1632 < buffer.len(p81) do
		local _ = nil
		local var1633 = nil
		local var1634, var1635, var1636 = protoModule.readTag(p81, var1632)
		local var1637 = var1634
		var1633 = var1635
		var1632 = var1636
		
		if var1633 == protoModule.wireTypes.varint then
			local _ = nil
			local var1638, var1639 = protoModule.readVarInt(p81, var1632)
			local _ = var1638
			var1632 = var1639
			continue
		end
		if var1633 == protoModule.wireTypes.lengthDelimited then
			if var1637 == 1 then
				local _ = nil
				local var1640, var1641 = protoModule.readBuffer(p81, var1632)
				var1632 = var1641
				var1631.universe_id = propTypesModule.StringProp.decode(var1640)
			else
				local _ = nil
				local var1642, var1643 = protoModule.readVarInt(p81, var1632)
				var1632 = var1643 + var1642
			end
		elseif var1633 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1644, var1645 = protoModule.readFixed32(p81, var1632)
			local _ = var1644
			var1632 = var1645
		elseif var1633 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1646, var1647 = protoModule.readFixed64(p81, var1632)
			local _ = var1646
			var1632 = var1647
		else
			error("Unsupported wire type: " .. var2757)
		end
	end
	return var1631
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
	local var1648 = t_81.new()
	
	if self.universe_id ~= nil then
		var1648.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1648.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1648
end

t_81.descriptor = {
	name = "RefreshGamePassesAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshGamePassesAction_Params = t_81
typeRegistryModule.default:register(t.RefreshGamePassesAction_Params)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p82)
	-- upvalues: t (ref), t_82 (ref)
	return setmetatable({
		action_type = if p82 == nil or p82.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p82.action_type,
		action_params = if p82 == nil or p82.action_params == nil then nil else p82.action_params
	}, t_82)
end

function t_82:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1648 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1649, var1650 = protoModule.writeTag(buff, var1648, 1, protoModule.wireTypes.varint)
		var1649, var2777 = protoModule.writeVarInt(var1649, var1650, t.ActionType.toNumber(self.action_type))
		buff = var1649
		var1648 = var1650
	end
	if self.action_params ~= nil then
		local var1651 = self.action_params:encode()
		local var1652, var1653 = protoModule.writeTag(buff, var1648, 2, protoModule.wireTypes.lengthDelimited)
		var1652, var2780 = protoModule.writeBuffer(var1652, var1653, var1651, buffer.len(var1651))
		buff = var1652
		var1648 = var1653
	end
	local buff_1 = buffer.create(var1648)
	buffer.copy(buff_1, 0, buff, 0, var1648)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var1648 = t_82.new()
	local var1649 = 0
	while var1649 < buffer.len(p82) do
		local _ = nil
		local var1650 = nil
		local var1651, var1652, var1653 = protoModule.readTag(p82, var1649)
		local var1654 = var1651
		var1650 = var1652
		var1649 = var1653
		
		if var1650 == protoModule.wireTypes.varint then
			if var1654 == 1 then
				local _ = nil
				local var1655, var1656 = protoModule.readVarIntI32(p82, var1649)
				local var1657 = var1655
				var1649 = var1656
				var1648.action_type = t.ActionType.fromNumber(var1657) or var1657
			else
				local _ = nil
				local var1658, var1659 = protoModule.readVarInt(p82, var1649)
				local _ = var1658
				var1649 = var1659
			end
		end
		if var1650 == protoModule.wireTypes.lengthDelimited then
			if var1654 == 2 then
				local _ = nil
				local var1660, var1661 = protoModule.readBuffer(p82, var1649)
				var1649 = var1661
				var1648.action_params = t.RefreshPlayabilityAction_Params.decode(var1660)
			else
				local _ = nil
				local var1662, var1663 = protoModule.readVarInt(p82, var1649)
				var1649 = var1663 + var1662
			end
		elseif var1650 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1664, var1665 = protoModule.readFixed32(p82, var1649)
			local _ = var1664
			var1649 = var1665
		elseif var1650 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1666, var1667 = protoModule.readFixed64(p82, var1649)
			local _ = var1666
			var1649 = var1667
		else
			error("Unsupported wire type: " .. var2784)
		end
	end
	return var1648
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
	local var1668 = t_82.new()
	
	if self.action_type ~= nil then
		var1668.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1668.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1668.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1668.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.actionParams)
	end
	return var1668
end

t_82.descriptor = {
	name = "RefreshPlayabilityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshPlayabilityAction"
}
t.RefreshPlayabilityAction = t_82
typeRegistryModule.default:register(t.RefreshPlayabilityAction)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p83)
	-- upvalues: t_83 (ref)
	return setmetatable({
		universe_id = if p83 == nil or p83.universe_id == nil then nil else p83.universe_id
	}, t_83)
end

function t_83:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1668 = 0
	
	if self.universe_id ~= nil then
		local var1669 = self.universe_id:encode()
		local var1670, var1671 = protoModule.writeTag(buff, var1668, 1, protoModule.wireTypes.lengthDelimited)
		var1670, var2808 = protoModule.writeBuffer(var1670, var1671, var1669, buffer.len(var1669))
		buff = var1670
		var1668 = var1671
	end
	local buff_1 = buffer.create(var1668)
	buffer.copy(buff_1, 0, buff, 0, var1668)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), propTypesModule (ref)
	local var1668 = t_83.new()
	local var1669 = 0
	while var1669 < buffer.len(p83) do
		local _ = nil
		local var1670 = nil
		local var1671, var1672, var1673 = protoModule.readTag(p83, var1669)
		local var1674 = var1671
		var1670 = var1672
		var1669 = var1673
		
		if var1670 == protoModule.wireTypes.varint then
			local _ = nil
			local var1675, var1676 = protoModule.readVarInt(p83, var1669)
			local _ = var1675
			var1669 = var1676
			continue
		end
		if var1670 == protoModule.wireTypes.lengthDelimited then
			if var1674 == 1 then
				local _ = nil
				local var1677, var1678 = protoModule.readBuffer(p83, var1669)
				var1669 = var1678
				var1668.universe_id = propTypesModule.StringProp.decode(var1677)
			else
				local _ = nil
				local var1679, var1680 = protoModule.readVarInt(p83, var1669)
				var1669 = var1680 + var1679
			end
		elseif var1670 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1681, var1682 = protoModule.readFixed32(p83, var1669)
			local _ = var1681
			var1669 = var1682
		elseif var1670 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1683, var1684 = protoModule.readFixed64(p83, var1669)
			local _ = var1683
			var1669 = var1684
		else
			error("Unsupported wire type: " .. var2812)
		end
	end
	return var1668
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
	local var1685 = t_83.new()
	
	if self.universe_id ~= nil then
		var1685.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1685.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1685
end

t_83.descriptor = {
	name = "RefreshPlayabilityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshPlayabilityAction_Params = t_83
typeRegistryModule.default:register(t.RefreshPlayabilityAction_Params)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p84)
	-- upvalues: t (ref), t_84 (ref)
	return setmetatable({
		action_type = if p84 == nil or p84.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p84.action_type,
		action_params = if p84 == nil or p84.action_params == nil then nil else p84.action_params
	}, t_84)
end

function t_84:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1685 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1686, var1687 = protoModule.writeTag(buff, var1685, 1, protoModule.wireTypes.varint)
		var1686, var2832 = protoModule.writeVarInt(var1686, var1687, t.ActionType.toNumber(self.action_type))
		buff = var1686
		var1685 = var1687
	end
	if self.action_params ~= nil then
		local var1688 = self.action_params:encode()
		local var1689, var1690 = protoModule.writeTag(buff, var1685, 2, protoModule.wireTypes.lengthDelimited)
		var1689, var2835 = protoModule.writeBuffer(var1689, var1690, var1688, buffer.len(var1688))
		buff = var1689
		var1685 = var1690
	end
	local buff_1 = buffer.create(var1685)
	buffer.copy(buff_1, 0, buff, 0, var1685)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var1685 = t_84.new()
	local var1686 = 0
	while var1686 < buffer.len(p84) do
		local _ = nil
		local var1687 = nil
		local var1688, var1689, var1690 = protoModule.readTag(p84, var1686)
		local var1691 = var1688
		var1687 = var1689
		var1686 = var1690
		
		if var1687 == protoModule.wireTypes.varint then
			if var1691 == 1 then
				local _ = nil
				local var1692, var1693 = protoModule.readVarIntI32(p84, var1686)
				local var1694 = var1692
				var1686 = var1693
				var1685.action_type = t.ActionType.fromNumber(var1694) or var1694
			else
				local _ = nil
				local var1695, var1696 = protoModule.readVarInt(p84, var1686)
				local _ = var1695
				var1686 = var1696
			end
		end
		if var1687 == protoModule.wireTypes.lengthDelimited then
			if var1691 == 2 then
				local _ = nil
				local var1697, var1698 = protoModule.readBuffer(p84, var1686)
				var1686 = var1698
				var1685.action_params = t.RefreshDeveloperProductsAction_Params.decode(var1697)
			else
				local _ = nil
				local var1699, var1700 = protoModule.readVarInt(p84, var1686)
				var1686 = var1700 + var1699
			end
		elseif var1687 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1701, var1702 = protoModule.readFixed32(p84, var1686)
			local _ = var1701
			var1686 = var1702
		elseif var1687 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1703, var1704 = protoModule.readFixed64(p84, var1686)
			local _ = var1703
			var1686 = var1704
		else
			error("Unsupported wire type: " .. var2839)
		end
	end
	return var1685
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
	local var1705 = t_84.new()
	
	if self.action_type ~= nil then
		var1705.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1705.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1705.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1705.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.actionParams)
	end
	return var1705
end

t_84.descriptor = {
	name = "RefreshDeveloperProductsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshDeveloperProductsAction"
}
t.RefreshDeveloperProductsAction = t_84
typeRegistryModule.default:register(t.RefreshDeveloperProductsAction)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p85)
	-- upvalues: t_85 (ref)
	return setmetatable({
		place_id = if p85 == nil or p85.place_id == nil then nil else p85.place_id
	}, t_85)
end

function t_85:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1705 = 0
	
	if self.place_id ~= nil then
		local var1706 = self.place_id:encode()
		local var1707, var1708 = protoModule.writeTag(buff, var1705, 1, protoModule.wireTypes.lengthDelimited)
		var1707, var2863 = protoModule.writeBuffer(var1707, var1708, var1706, buffer.len(var1706))
		buff = var1707
		var1705 = var1708
	end
	local buff_1 = buffer.create(var1705)
	buffer.copy(buff_1, 0, buff, 0, var1705)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), propTypesModule (ref)
	local var1705 = t_85.new()
	local var1706 = 0
	while var1706 < buffer.len(p85) do
		local _ = nil
		local var1707 = nil
		local var1708, var1709, var1710 = protoModule.readTag(p85, var1706)
		local var1711 = var1708
		var1707 = var1709
		var1706 = var1710
		
		if var1707 == protoModule.wireTypes.varint then
			local _ = nil
			local var1712, var1713 = protoModule.readVarInt(p85, var1706)
			local _ = var1712
			var1706 = var1713
			continue
		end
		if var1707 == protoModule.wireTypes.lengthDelimited then
			if var1711 == 1 then
				local _ = nil
				local var1714, var1715 = protoModule.readBuffer(p85, var1706)
				var1706 = var1715
				var1705.place_id = propTypesModule.StringProp.decode(var1714)
			else
				local _ = nil
				local var1716, var1717 = protoModule.readVarInt(p85, var1706)
				var1706 = var1717 + var1716
			end
		elseif var1707 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1718, var1719 = protoModule.readFixed32(p85, var1706)
			local _ = var1718
			var1706 = var1719
		elseif var1707 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1720, var1721 = protoModule.readFixed64(p85, var1706)
			local _ = var1720
			var1706 = var1721
		else
			error("Unsupported wire type: " .. var2867)
		end
	end
	return var1705
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
	local var1722 = t_85.new()
	
	if self.place_id ~= nil then
		var1722.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var1722.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	return var1722
end

t_85.descriptor = {
	name = "RefreshDeveloperProductsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshDeveloperProductsAction_Params = t_85
typeRegistryModule.default:register(t.RefreshDeveloperProductsAction_Params)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p86)
	-- upvalues: t (ref), t_86 (ref)
	return setmetatable({
		action_type = if p86 == nil or p86.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p86.action_type,
		action_params = if p86 == nil or p86.action_params == nil then nil else p86.action_params
	}, t_86)
end

function t_86:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1722 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1723, var1724 = protoModule.writeTag(buff, var1722, 1, protoModule.wireTypes.varint)
		var1723, var2887 = protoModule.writeVarInt(var1723, var1724, t.ActionType.toNumber(self.action_type))
		buff = var1723
		var1722 = var1724
	end
	if self.action_params ~= nil then
		local var1725 = self.action_params:encode()
		local var1726, var1727 = protoModule.writeTag(buff, var1722, 2, protoModule.wireTypes.lengthDelimited)
		var1726, var2890 = protoModule.writeBuffer(var1726, var1727, var1725, buffer.len(var1725))
		buff = var1726
		var1722 = var1727
	end
	local buff_1 = buffer.create(var1722)
	buffer.copy(buff_1, 0, buff, 0, var1722)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var1722 = t_86.new()
	local var1723 = 0
	while var1723 < buffer.len(p86) do
		local _ = nil
		local var1724 = nil
		local var1725, var1726, var1727 = protoModule.readTag(p86, var1723)
		local var1728 = var1725
		var1724 = var1726
		var1723 = var1727
		
		if var1724 == protoModule.wireTypes.varint then
			if var1728 == 1 then
				local _ = nil
				local var1729, var1730 = protoModule.readVarIntI32(p86, var1723)
				local var1731 = var1729
				var1723 = var1730
				var1722.action_type = t.ActionType.fromNumber(var1731) or var1731
			else
				local _ = nil
				local var1732, var1733 = protoModule.readVarInt(p86, var1723)
				local _ = var1732
				var1723 = var1733
			end
		end
		if var1724 == protoModule.wireTypes.lengthDelimited then
			if var1728 == 2 then
				local _ = nil
				local var1734, var1735 = protoModule.readBuffer(p86, var1723)
				var1723 = var1735
				var1722.action_params = t.OpenFaeTrialUpsellAction_Params.decode(var1734)
			else
				local _ = nil
				local var1736, var1737 = protoModule.readVarInt(p86, var1723)
				var1723 = var1737 + var1736
			end
		elseif var1724 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1738, var1739 = protoModule.readFixed32(p86, var1723)
			local _ = var1738
			var1723 = var1739
		elseif var1724 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1740, var1741 = protoModule.readFixed64(p86, var1723)
			local _ = var1740
			var1723 = var1741
		else
			error("Unsupported wire type: " .. var2894)
		end
	end
	return var1722
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
	local var1742 = t_86.new()
	
	if self.action_type ~= nil then
		var1742.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1742.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1742.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1742.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.actionParams)
	end
	return var1742
end

t_86.descriptor = {
	name = "OpenFaeTrialUpsellAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenFaeTrialUpsellAction"
}
t.OpenFaeTrialUpsellAction = t_86
typeRegistryModule.default:register(t.OpenFaeTrialUpsellAction)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p87)
	-- upvalues: t_87 (ref)
	return setmetatable({
		source = if p87 == nil or p87.source == nil then nil else p87.source,
		config_key = if p87 == nil or p87.config_key == nil then nil else p87.config_key,
		surface_key = if p87 == nil or p87.surface_key == nil then nil else p87.surface_key,
		prompt_type = if p87 == nil or p87.prompt_type == nil then nil else p87.prompt_type
	}, t_87)
end

function t_87:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1742 = 0
	
	if self.source ~= nil then
		local var1743 = self.source:encode()
		local var1744, var1745 = protoModule.writeTag(buff, var1742, 1, protoModule.wireTypes.lengthDelimited)
		var1744, var2918 = protoModule.writeBuffer(var1744, var1745, var1743, buffer.len(var1743))
		buff = var1744
		var1742 = var1745
	end
	if self.config_key ~= nil then
		local var1746 = self.config_key:encode()
		local var1747, var1748 = protoModule.writeTag(buff, var1742, 2, protoModule.wireTypes.lengthDelimited)
		var1747, var2921 = protoModule.writeBuffer(var1747, var1748, var1746, buffer.len(var1746))
		buff = var1747
		var1742 = var1748
	end
	if self.surface_key ~= nil then
		local var1749 = self.surface_key:encode()
		local var1750, var1751 = protoModule.writeTag(buff, var1742, 3, protoModule.wireTypes.lengthDelimited)
		var1750, var2924 = protoModule.writeBuffer(var1750, var1751, var1749, buffer.len(var1749))
		buff = var1750
		var1742 = var1751
	end
	if self.prompt_type ~= nil then
		local var1752 = self.prompt_type:encode()
		local var1753, var1754 = protoModule.writeTag(buff, var1742, 4, protoModule.wireTypes.lengthDelimited)
		var1753, var2927 = protoModule.writeBuffer(var1753, var1754, var1752, buffer.len(var1752))
		buff = var1753
		var1742 = var1754
	end
	local buff_1 = buffer.create(var1742)
	buffer.copy(buff_1, 0, buff, 0, var1742)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref), propTypesModule (ref)
	local var1742 = t_87.new()
	local var1743 = 0
	while var1743 < buffer.len(p87) do
		local _ = nil
		local var1744 = nil
		local var1745, var1746, var1747 = protoModule.readTag(p87, var1743)
		local var1748 = var1745
		var1744 = var1746
		var1743 = var1747
		
		if var1744 == protoModule.wireTypes.varint then
			local _ = nil
			local var1749, var1750 = protoModule.readVarInt(p87, var1743)
			local _ = var1749
			var1743 = var1750
			continue
		end
		if var1744 == protoModule.wireTypes.lengthDelimited then
			if var1748 == 1 then
				local _ = nil
				local var1751, var1752 = protoModule.readBuffer(p87, var1743)
				var1743 = var1752
				var1742.source = propTypesModule.StringProp.decode(var1751)
			elseif var1748 == 2 then
				local _ = nil
				local var1753, var1754 = protoModule.readBuffer(p87, var1743)
				var1743 = var1754
				var1742.config_key = propTypesModule.StringProp.decode(var1753)
			elseif var1748 == 3 then
				local _ = nil
				local var1755, var1756 = protoModule.readBuffer(p87, var1743)
				var1743 = var1756
				var1742.surface_key = propTypesModule.StringProp.decode(var1755)
			elseif var1748 == 4 then
				local _ = nil
				local var1757, var1758 = protoModule.readBuffer(p87, var1743)
				var1743 = var1758
				var1742.prompt_type = propTypesModule.StringProp.decode(var1757)
			else
				local _ = nil
				local var1759, var1760 = protoModule.readVarInt(p87, var1743)
				var1743 = var1760 + var1759
			end
		elseif var1744 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1761, var1762 = protoModule.readFixed32(p87, var1743)
			local _ = var1761
			var1743 = var1762
		elseif var1744 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1763, var1764 = protoModule.readFixed64(p87, var1743)
			local _ = var1763
			var1743 = var1764
		else
			error("Unsupported wire type: " .. var2931)
		end
	end
	return var1742
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
	local var1765 = t_87.new()
	
	if self.source ~= nil then
		var1765.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.config_key ~= nil then
		var1765.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1765.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.surface_key ~= nil then
		var1765.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var1765.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.prompt_type ~= nil then
		var1765.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1765.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	return var1765
end

t_87.descriptor = {
	name = "OpenFaeTrialUpsellAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenFaeTrialUpsellAction_Params = t_87
typeRegistryModule.default:register(t.OpenFaeTrialUpsellAction_Params)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p88)
	-- upvalues: t (ref), t_88 (ref)
	return setmetatable({
		action_type = if p88 == nil or p88.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p88.action_type,
		action_params = if p88 == nil or p88.action_params == nil then nil else p88.action_params
	}, t_88)
end

function t_88:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1765 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1766, var1767 = protoModule.writeTag(buff, var1765, 1, protoModule.wireTypes.varint)
		var1766, var2957 = protoModule.writeVarInt(var1766, var1767, t.ActionType.toNumber(self.action_type))
		buff = var1766
		var1765 = var1767
	end
	if self.action_params ~= nil then
		local var1768 = self.action_params:encode()
		local var1769, var1770 = protoModule.writeTag(buff, var1765, 2, protoModule.wireTypes.lengthDelimited)
		var1769, var2960 = protoModule.writeBuffer(var1769, var1770, var1768, buffer.len(var1768))
		buff = var1769
		var1765 = var1770
	end
	local buff_1 = buffer.create(var1765)
	buffer.copy(buff_1, 0, buff, 0, var1765)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var1765 = t_88.new()
	local var1766 = 0
	while var1766 < buffer.len(p88) do
		local _ = nil
		local var1767 = nil
		local var1768, var1769, var1770 = protoModule.readTag(p88, var1766)
		local var1771 = var1768
		var1767 = var1769
		var1766 = var1770
		
		if var1767 == protoModule.wireTypes.varint then
			if var1771 == 1 then
				local _ = nil
				local var1772, var1773 = protoModule.readVarIntI32(p88, var1766)
				local var1774 = var1772
				var1766 = var1773
				var1765.action_type = t.ActionType.fromNumber(var1774) or var1774
			else
				local _ = nil
				local var1775, var1776 = protoModule.readVarInt(p88, var1766)
				local _ = var1775
				var1766 = var1776
			end
		end
		if var1767 == protoModule.wireTypes.lengthDelimited then
			if var1771 == 2 then
				local _ = nil
				local var1777, var1778 = protoModule.readBuffer(p88, var1766)
				var1766 = var1778
				var1765.action_params = t.OpenIncomingTransferUpsellAction_Params.decode(var1777)
			else
				local _ = nil
				local var1779, var1780 = protoModule.readVarInt(p88, var1766)
				var1766 = var1780 + var1779
			end
		elseif var1767 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1781, var1782 = protoModule.readFixed32(p88, var1766)
			local _ = var1781
			var1766 = var1782
		elseif var1767 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1783, var1784 = protoModule.readFixed64(p88, var1766)
			local _ = var1783
			var1766 = var1784
		else
			error("Unsupported wire type: " .. var2964)
		end
	end
	return var1765
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
	local var1785 = t_88.new()
	
	if self.action_type ~= nil then
		var1785.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1785.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1785.action_params = t.OpenIncomingTransferUpsellAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1785.action_params = t.OpenIncomingTransferUpsellAction_Params.jsonDecode(self.actionParams)
	end
	return var1785
end

t_88.descriptor = {
	name = "OpenIncomingTransferUpsellAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenIncomingTransferUpsellAction"
}
t.OpenIncomingTransferUpsellAction = t_88
typeRegistryModule.default:register(t.OpenIncomingTransferUpsellAction)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p89)
	-- upvalues: t_89 (ref)
	return setmetatable({
		url = if p89 == nil or p89.url == nil then nil else p89.url,
		prompt_type = if p89 == nil or p89.prompt_type == nil then nil else p89.prompt_type,
		prompt_id = if p89 == nil or p89.prompt_id == nil then nil else p89.prompt_id
	}, t_89)
end

function t_89:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1785 = 0
	
	if self.url ~= nil then
		local var1786 = self.url:encode()
		local var1787, var1788 = protoModule.writeTag(buff, var1785, 1, protoModule.wireTypes.lengthDelimited)
		var1787, var2988 = protoModule.writeBuffer(var1787, var1788, var1786, buffer.len(var1786))
		buff = var1787
		var1785 = var1788
	end
	if self.prompt_type ~= nil then
		local var1789 = self.prompt_type:encode()
		local var1790, var1791 = protoModule.writeTag(buff, var1785, 2, protoModule.wireTypes.lengthDelimited)
		var1790, var2991 = protoModule.writeBuffer(var1790, var1791, var1789, buffer.len(var1789))
		buff = var1790
		var1785 = var1791
	end
	if self.prompt_id ~= nil then
		local var1792 = self.prompt_id:encode()
		local var1793, var1794 = protoModule.writeTag(buff, var1785, 3, protoModule.wireTypes.lengthDelimited)
		var1793, var2994 = protoModule.writeBuffer(var1793, var1794, var1792, buffer.len(var1792))
		buff = var1793
		var1785 = var1794
	end
	local buff_1 = buffer.create(var1785)
	buffer.copy(buff_1, 0, buff, 0, var1785)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref), propTypesModule (ref)
	local var1785 = t_89.new()
	local var1786 = 0
	while var1786 < buffer.len(p89) do
		local _ = nil
		local var1787 = nil
		local var1788, var1789, var1790 = protoModule.readTag(p89, var1786)
		local var1791 = var1788
		var1787 = var1789
		var1786 = var1790
		
		if var1787 == protoModule.wireTypes.varint then
			local _ = nil
			local var1792, var1793 = protoModule.readVarInt(p89, var1786)
			local _ = var1792
			var1786 = var1793
			continue
		end
		if var1787 == protoModule.wireTypes.lengthDelimited then
			if var1791 == 1 then
				local _ = nil
				local var1794, var1795 = protoModule.readBuffer(p89, var1786)
				var1786 = var1795
				var1785.url = propTypesModule.StringProp.decode(var1794)
			elseif var1791 == 2 then
				local _ = nil
				local var1796, var1797 = protoModule.readBuffer(p89, var1786)
				var1786 = var1797
				var1785.prompt_type = propTypesModule.StringProp.decode(var1796)
			elseif var1791 == 3 then
				local _ = nil
				local var1798, var1799 = protoModule.readBuffer(p89, var1786)
				var1786 = var1799
				var1785.prompt_id = propTypesModule.StringProp.decode(var1798)
			else
				local _ = nil
				local var1800, var1801 = protoModule.readVarInt(p89, var1786)
				var1786 = var1801 + var1800
			end
		elseif var1787 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1802, var1803 = protoModule.readFixed32(p89, var1786)
			local _ = var1802
			var1786 = var1803
		elseif var1787 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1804, var1805 = protoModule.readFixed64(p89, var1786)
			local _ = var1804
			var1786 = var1805
		else
			error("Unsupported wire type: " .. var2998)
		end
	end
	return var1785
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
	local var1806 = t_89.new()
	
	if self.url ~= nil then
		var1806.url = propTypesModule.StringProp.jsonDecode(self.url)
	end
	if self.prompt_type ~= nil then
		var1806.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1806.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var1806.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1806.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	return var1806
end

t_89.descriptor = {
	name = "OpenIncomingTransferUpsellAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenIncomingTransferUpsellAction_Params = t_89
typeRegistryModule.default:register(t.OpenIncomingTransferUpsellAction_Params)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p90)
	-- upvalues: t (ref), t_90 (ref)
	return setmetatable({
		action_type = if p90 == nil or p90.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p90.action_type,
		action_params = if p90 == nil or p90.action_params == nil then nil else p90.action_params
	}, t_90)
end

function t_90:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1806 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1807, var1808 = protoModule.writeTag(buff, var1806, 1, protoModule.wireTypes.varint)
		var1807, var3022 = protoModule.writeVarInt(var1807, var1808, t.ActionType.toNumber(self.action_type))
		buff = var1807
		var1806 = var1808
	end
	if self.action_params ~= nil then
		local var1809 = self.action_params:encode()
		local var1810, var1811 = protoModule.writeTag(buff, var1806, 2, protoModule.wireTypes.lengthDelimited)
		var1810, var3025 = protoModule.writeBuffer(var1810, var1811, var1809, buffer.len(var1809))
		buff = var1810
		var1806 = var1811
	end
	local buff_1 = buffer.create(var1806)
	buffer.copy(buff_1, 0, buff, 0, var1806)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref), t (ref)
	local var1806 = t_90.new()
	local var1807 = 0
	while var1807 < buffer.len(p90) do
		local _ = nil
		local var1808 = nil
		local var1809, var1810, var1811 = protoModule.readTag(p90, var1807)
		local var1812 = var1809
		var1808 = var1810
		var1807 = var1811
		
		if var1808 == protoModule.wireTypes.varint then
			if var1812 == 1 then
				local _ = nil
				local var1813, var1814 = protoModule.readVarIntI32(p90, var1807)
				local var1815 = var1813
				var1807 = var1814
				var1806.action_type = t.ActionType.fromNumber(var1815) or var1815
			else
				local _ = nil
				local var1816, var1817 = protoModule.readVarInt(p90, var1807)
				local _ = var1816
				var1807 = var1817
			end
		end
		if var1808 == protoModule.wireTypes.lengthDelimited then
			if var1812 == 2 then
				local _ = nil
				local var1818, var1819 = protoModule.readBuffer(p90, var1807)
				var1807 = var1819
				var1806.action_params = t.OpenSduiOverlayAction_Params.decode(var1818)
			else
				local _ = nil
				local var1820, var1821 = protoModule.readVarInt(p90, var1807)
				var1807 = var1821 + var1820
			end
		elseif var1808 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1822, var1823 = protoModule.readFixed32(p90, var1807)
			local _ = var1822
			var1807 = var1823
		elseif var1808 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1824, var1825 = protoModule.readFixed64(p90, var1807)
			local _ = var1824
			var1807 = var1825
		else
			error("Unsupported wire type: " .. var3029)
		end
	end
	return var1806
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
	local var1826 = t_90.new()
	
	if self.action_type ~= nil then
		var1826.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1826.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1826.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1826.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.actionParams)
	end
	return var1826
end

t_90.descriptor = {
	name = "OpenSduiOverlayAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSduiOverlayAction"
}
t.OpenSduiOverlayAction = t_90
typeRegistryModule.default:register(t.OpenSduiOverlayAction)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p91)
	-- upvalues: t_91 (ref)
	return setmetatable({
		config_key = if p91 == nil or p91.config_key == nil then nil else p91.config_key,
		identifier = if p91 == nil or p91.identifier == nil then nil else p91.identifier
	}, t_91)
end

function t_91:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1826 = 0
	
	if self.config_key ~= nil then
		local var1827 = self.config_key:encode()
		local var1828, var1829 = protoModule.writeTag(buff, var1826, 1, protoModule.wireTypes.lengthDelimited)
		var1828, var3053 = protoModule.writeBuffer(var1828, var1829, var1827, buffer.len(var1827))
		buff = var1828
		var1826 = var1829
	end
	if self.identifier ~= nil then
		local var1830 = self.identifier:encode()
		local var1831, var1832 = protoModule.writeTag(buff, var1826, 2, protoModule.wireTypes.lengthDelimited)
		var1831, var3056 = protoModule.writeBuffer(var1831, var1832, var1830, buffer.len(var1830))
		buff = var1831
		var1826 = var1832
	end
	local buff_1 = buffer.create(var1826)
	buffer.copy(buff_1, 0, buff, 0, var1826)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref), propTypesModule (ref)
	local var1826 = t_91.new()
	local var1827 = 0
	while var1827 < buffer.len(p91) do
		local _ = nil
		local var1828 = nil
		local var1829, var1830, var1831 = protoModule.readTag(p91, var1827)
		local var1832 = var1829
		var1828 = var1830
		var1827 = var1831
		
		if var1828 == protoModule.wireTypes.varint then
			local _ = nil
			local var1833, var1834 = protoModule.readVarInt(p91, var1827)
			local _ = var1833
			var1827 = var1834
			continue
		end
		if var1828 == protoModule.wireTypes.lengthDelimited then
			if var1832 == 1 then
				local _ = nil
				local var1835, var1836 = protoModule.readBuffer(p91, var1827)
				var1827 = var1836
				var1826.config_key = propTypesModule.StringProp.decode(var1835)
			elseif var1832 == 2 then
				local _ = nil
				local var1837, var1838 = protoModule.readBuffer(p91, var1827)
				var1827 = var1838
				var1826.identifier = propTypesModule.StringProp.decode(var1837)
			else
				local _ = nil
				local var1839, var1840 = protoModule.readVarInt(p91, var1827)
				var1827 = var1840 + var1839
			end
		elseif var1828 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1841, var1842 = protoModule.readFixed32(p91, var1827)
			local _ = var1841
			var1827 = var1842
		elseif var1828 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1843, var1844 = protoModule.readFixed64(p91, var1827)
			local _ = var1843
			var1827 = var1844
		else
			error("Unsupported wire type: " .. var3060)
		end
	end
	return var1826
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
	local var1845 = t_91.new()
	
	if self.config_key ~= nil then
		var1845.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1845.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.identifier ~= nil then
		var1845.identifier = propTypesModule.StringProp.jsonDecode(self.identifier)
	end
	return var1845
end

t_91.descriptor = {
	name = "OpenSduiOverlayAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSduiOverlayAction_Params = t_91
typeRegistryModule.default:register(t.OpenSduiOverlayAction_Params)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p92)
	-- upvalues: t (ref), t_92 (ref)
	return setmetatable({
		action_type = if p92 == nil or p92.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p92.action_type,
		action_params = if p92 == nil or p92.action_params == nil then nil else p92.action_params
	}, t_92)
end

function t_92:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1845 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1846, var1847 = protoModule.writeTag(buff, var1845, 1, protoModule.wireTypes.varint)
		var1846, var3082 = protoModule.writeVarInt(var1846, var1847, t.ActionType.toNumber(self.action_type))
		buff = var1846
		var1845 = var1847
	end
	if self.action_params ~= nil then
		local var1848 = self.action_params:encode()
		local var1849, var1850 = protoModule.writeTag(buff, var1845, 2, protoModule.wireTypes.lengthDelimited)
		var1849, var3085 = protoModule.writeBuffer(var1849, var1850, var1848, buffer.len(var1848))
		buff = var1849
		var1845 = var1850
	end
	local buff_1 = buffer.create(var1845)
	buffer.copy(buff_1, 0, buff, 0, var1845)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var1845 = t_92.new()
	local var1846 = 0
	while var1846 < buffer.len(p92) do
		local _ = nil
		local var1847 = nil
		local var1848, var1849, var1850 = protoModule.readTag(p92, var1846)
		local var1851 = var1848
		var1847 = var1849
		var1846 = var1850
		
		if var1847 == protoModule.wireTypes.varint then
			if var1851 == 1 then
				local _ = nil
				local var1852, var1853 = protoModule.readVarIntI32(p92, var1846)
				local var1854 = var1852
				var1846 = var1853
				var1845.action_type = t.ActionType.fromNumber(var1854) or var1854
			else
				local _ = nil
				local var1855, var1856 = protoModule.readVarInt(p92, var1846)
				local _ = var1855
				var1846 = var1856
			end
		end
		if var1847 == protoModule.wireTypes.lengthDelimited then
			if var1851 == 2 then
				local _ = nil
				local var1857, var1858 = protoModule.readBuffer(p92, var1846)
				var1846 = var1858
				var1845.action_params = t.ApplyChartsFilterAction_Params.decode(var1857)
			else
				local _ = nil
				local var1859, var1860 = protoModule.readVarInt(p92, var1846)
				var1846 = var1860 + var1859
			end
		elseif var1847 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1861, var1862 = protoModule.readFixed32(p92, var1846)
			local _ = var1861
			var1846 = var1862
		elseif var1847 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1863, var1864 = protoModule.readFixed64(p92, var1846)
			local _ = var1863
			var1846 = var1864
		else
			error("Unsupported wire type: " .. var3089)
		end
	end
	return var1845
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
	local var1865 = t_92.new()
	
	if self.action_type ~= nil then
		var1865.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1865.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1865.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1865.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.actionParams)
	end
	return var1865
end

t_92.descriptor = {
	name = "ApplyChartsFilterAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ApplyChartsFilterAction"
}
t.ApplyChartsFilterAction = t_92
typeRegistryModule.default:register(t.ApplyChartsFilterAction)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p93)
	-- upvalues: t_93 (ref)
	return setmetatable({
		session_id = if p93 == nil or p93.session_id == nil then nil else p93.session_id
	}, t_93)
end

function t_93:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1865 = 0
	
	if self.session_id ~= nil then
		local var1866 = self.session_id:encode()
		local var1867, var1868 = protoModule.writeTag(buff, var1865, 1, protoModule.wireTypes.lengthDelimited)
		var1867, var3113 = protoModule.writeBuffer(var1867, var1868, var1866, buffer.len(var1866))
		buff = var1867
		var1865 = var1868
	end
	local buff_1 = buffer.create(var1865)
	buffer.copy(buff_1, 0, buff, 0, var1865)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref), propTypesModule (ref)
	local var1865 = t_93.new()
	local var1866 = 0
	while var1866 < buffer.len(p93) do
		local _ = nil
		local var1867 = nil
		local var1868, var1869, var1870 = protoModule.readTag(p93, var1866)
		local var1871 = var1868
		var1867 = var1869
		var1866 = var1870
		
		if var1867 == protoModule.wireTypes.varint then
			local _ = nil
			local var1872, var1873 = protoModule.readVarInt(p93, var1866)
			local _ = var1872
			var1866 = var1873
			continue
		end
		if var1867 == protoModule.wireTypes.lengthDelimited then
			if var1871 == 1 then
				local _ = nil
				local var1874, var1875 = protoModule.readBuffer(p93, var1866)
				var1866 = var1875
				var1865.session_id = propTypesModule.StringProp.decode(var1874)
			else
				local _ = nil
				local var1876, var1877 = protoModule.readVarInt(p93, var1866)
				var1866 = var1877 + var1876
			end
		elseif var1867 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1878, var1879 = protoModule.readFixed32(p93, var1866)
			local _ = var1878
			var1866 = var1879
		elseif var1867 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1880, var1881 = protoModule.readFixed64(p93, var1866)
			local _ = var1880
			var1866 = var1881
		else
			error("Unsupported wire type: " .. var3117)
		end
	end
	return var1865
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
	local var1882 = t_93.new()
	
	if self.session_id ~= nil then
		var1882.session_id = propTypesModule.StringProp.jsonDecode(self.session_id)
	end
	if self.sessionId ~= nil then
		var1882.session_id = propTypesModule.StringProp.jsonDecode(self.sessionId)
	end
	return var1882
end

t_93.descriptor = {
	name = "ApplyChartsFilterAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ApplyChartsFilterAction_Params = t_93
typeRegistryModule.default:register(t.ApplyChartsFilterAction_Params)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p94)
	-- upvalues: t (ref), t_94 (ref)
	return setmetatable({
		action_type = if p94 == nil or p94.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p94.action_type,
		action_params = if p94 == nil or p94.action_params == nil then nil else p94.action_params
	}, t_94)
end

function t_94:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1882 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1883, var1884 = protoModule.writeTag(buff, var1882, 1, protoModule.wireTypes.varint)
		var1883, var3137 = protoModule.writeVarInt(var1883, var1884, t.ActionType.toNumber(self.action_type))
		buff = var1883
		var1882 = var1884
	end
	if self.action_params ~= nil then
		local var1885 = self.action_params:encode()
		local var1886, var1887 = protoModule.writeTag(buff, var1882, 2, protoModule.wireTypes.lengthDelimited)
		var1886, var3140 = protoModule.writeBuffer(var1886, var1887, var1885, buffer.len(var1885))
		buff = var1886
		var1882 = var1887
	end
	local buff_1 = buffer.create(var1882)
	buffer.copy(buff_1, 0, buff, 0, var1882)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var1882 = t_94.new()
	local var1883 = 0
	while var1883 < buffer.len(p94) do
		local _ = nil
		local var1884 = nil
		local var1885, var1886, var1887 = protoModule.readTag(p94, var1883)
		local var1888 = var1885
		var1884 = var1886
		var1883 = var1887
		
		if var1884 == protoModule.wireTypes.varint then
			if var1888 == 1 then
				local _ = nil
				local var1889, var1890 = protoModule.readVarIntI32(p94, var1883)
				local var1891 = var1889
				var1883 = var1890
				var1882.action_type = t.ActionType.fromNumber(var1891) or var1891
			else
				local _ = nil
				local var1892, var1893 = protoModule.readVarInt(p94, var1883)
				local _ = var1892
				var1883 = var1893
			end
		end
		if var1884 == protoModule.wireTypes.lengthDelimited then
			if var1888 == 2 then
				local _ = nil
				local var1894, var1895 = protoModule.readBuffer(p94, var1883)
				var1883 = var1895
				var1882.action_params = t.RefreshChartsSortDetailAction_Params.decode(var1894)
			else
				local _ = nil
				local var1896, var1897 = protoModule.readVarInt(p94, var1883)
				var1883 = var1897 + var1896
			end
		elseif var1884 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1898, var1899 = protoModule.readFixed32(p94, var1883)
			local _ = var1898
			var1883 = var1899
		elseif var1884 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1900, var1901 = protoModule.readFixed64(p94, var1883)
			local _ = var1900
			var1883 = var1901
		else
			error("Unsupported wire type: " .. var3144)
		end
	end
	return var1882
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
	local var1902 = t_94.new()
	
	if self.action_type ~= nil then
		var1902.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1902.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1902.action_params = t.RefreshChartsSortDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1902.action_params = t.RefreshChartsSortDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var1902
end

t_94.descriptor = {
	name = "RefreshChartsSortDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshChartsSortDetailAction"
}
t.RefreshChartsSortDetailAction = t_94
typeRegistryModule.default:register(t.RefreshChartsSortDetailAction)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p95)
	-- upvalues: t_95 (ref)
	return setmetatable({
		config_key = if p95 == nil or p95.config_key == nil then nil else p95.config_key,
		selected_option = if p95 == nil or p95.selected_option == nil then nil else p95.selected_option,
		surface_key = if p95 == nil or p95.surface_key == nil then nil else p95.surface_key,
		sort_id = if p95 == nil or p95.sort_id == nil then nil else p95.sort_id
	}, t_95)
end

function t_95:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1902 = 0
	
	if self.config_key ~= nil then
		local var1903 = self.config_key:encode()
		local var1904, var1905 = protoModule.writeTag(buff, var1902, 1, protoModule.wireTypes.lengthDelimited)
		var1904, var3168 = protoModule.writeBuffer(var1904, var1905, var1903, buffer.len(var1903))
		buff = var1904
		var1902 = var1905
	end
	if self.selected_option ~= nil then
		local var1906 = self.selected_option:encode()
		local var1907, var1908 = protoModule.writeTag(buff, var1902, 2, protoModule.wireTypes.lengthDelimited)
		var1907, var3171 = protoModule.writeBuffer(var1907, var1908, var1906, buffer.len(var1906))
		buff = var1907
		var1902 = var1908
	end
	if self.surface_key ~= nil then
		local var1909 = self.surface_key:encode()
		local var1910, var1911 = protoModule.writeTag(buff, var1902, 3, protoModule.wireTypes.lengthDelimited)
		var1910, var3174 = protoModule.writeBuffer(var1910, var1911, var1909, buffer.len(var1909))
		buff = var1910
		var1902 = var1911
	end
	if self.sort_id ~= nil then
		local var1912 = self.sort_id:encode()
		local var1913, var1914 = protoModule.writeTag(buff, var1902, 4, protoModule.wireTypes.lengthDelimited)
		var1913, var3177 = protoModule.writeBuffer(var1913, var1914, var1912, buffer.len(var1912))
		buff = var1913
		var1902 = var1914
	end
	local buff_1 = buffer.create(var1902)
	buffer.copy(buff_1, 0, buff, 0, var1902)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref), propTypesModule (ref)
	local var1902 = t_95.new()
	local var1903 = 0
	while var1903 < buffer.len(p95) do
		local _ = nil
		local var1904 = nil
		local var1905, var1906, var1907 = protoModule.readTag(p95, var1903)
		local var1908 = var1905
		var1904 = var1906
		var1903 = var1907
		
		if var1904 == protoModule.wireTypes.varint then
			local _ = nil
			local var1909, var1910 = protoModule.readVarInt(p95, var1903)
			local _ = var1909
			var1903 = var1910
			continue
		end
		if var1904 == protoModule.wireTypes.lengthDelimited then
			if var1908 == 1 then
				local _ = nil
				local var1911, var1912 = protoModule.readBuffer(p95, var1903)
				var1903 = var1912
				var1902.config_key = propTypesModule.StringProp.decode(var1911)
			elseif var1908 == 2 then
				local _ = nil
				local var1913, var1914 = protoModule.readBuffer(p95, var1903)
				var1903 = var1914
				var1902.selected_option = propTypesModule.StringProp.decode(var1913)
			elseif var1908 == 3 then
				local _ = nil
				local var1915, var1916 = protoModule.readBuffer(p95, var1903)
				var1903 = var1916
				var1902.surface_key = propTypesModule.StringProp.decode(var1915)
			elseif var1908 == 4 then
				local _ = nil
				local var1917, var1918 = protoModule.readBuffer(p95, var1903)
				var1903 = var1918
				var1902.sort_id = propTypesModule.StringProp.decode(var1917)
			else
				local _ = nil
				local var1919, var1920 = protoModule.readVarInt(p95, var1903)
				var1903 = var1920 + var1919
			end
		elseif var1904 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1921, var1922 = protoModule.readFixed32(p95, var1903)
			local _ = var1921
			var1903 = var1922
		elseif var1904 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1923, var1924 = protoModule.readFixed64(p95, var1903)
			local _ = var1923
			var1903 = var1924
		else
			error("Unsupported wire type: " .. var3181)
		end
	end
	return var1902
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
	local var1925 = t_95.new()
	
	if self.config_key ~= nil then
		var1925.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1925.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.selected_option ~= nil then
		var1925.selected_option = propTypesModule.StringProp.jsonDecode(self.selected_option)
	end
	if self.selectedOption ~= nil then
		var1925.selected_option = propTypesModule.StringProp.jsonDecode(self.selectedOption)
	end
	if self.surface_key ~= nil then
		var1925.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var1925.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.sort_id ~= nil then
		var1925.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var1925.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	return var1925
end

t_95.descriptor = {
	name = "RefreshChartsSortDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshChartsSortDetailAction_Params = t_95
typeRegistryModule.default:register(t.RefreshChartsSortDetailAction_Params)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p96)
	-- upvalues: t (ref), t_96 (ref)
	return setmetatable({
		action_type = if p96 == nil or p96.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p96.action_type,
		action_params = if p96 == nil or p96.action_params == nil then nil else p96.action_params
	}, t_96)
end

function t_96:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1925 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1926, var1927 = protoModule.writeTag(buff, var1925, 1, protoModule.wireTypes.varint)
		var1926, var3207 = protoModule.writeVarInt(var1926, var1927, t.ActionType.toNumber(self.action_type))
		buff = var1926
		var1925 = var1927
	end
	if self.action_params ~= nil then
		local var1928 = self.action_params:encode()
		local var1929, var1930 = protoModule.writeTag(buff, var1925, 2, protoModule.wireTypes.lengthDelimited)
		var1929, var3210 = protoModule.writeBuffer(var1929, var1930, var1928, buffer.len(var1928))
		buff = var1929
		var1925 = var1930
	end
	local buff_1 = buffer.create(var1925)
	buffer.copy(buff_1, 0, buff, 0, var1925)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var1925 = t_96.new()
	local var1926 = 0
	while var1926 < buffer.len(p96) do
		local _ = nil
		local var1927 = nil
		local var1928, var1929, var1930 = protoModule.readTag(p96, var1926)
		local var1931 = var1928
		var1927 = var1929
		var1926 = var1930
		
		if var1927 == protoModule.wireTypes.varint then
			if var1931 == 1 then
				local _ = nil
				local var1932, var1933 = protoModule.readVarIntI32(p96, var1926)
				local var1934 = var1932
				var1926 = var1933
				var1925.action_type = t.ActionType.fromNumber(var1934) or var1934
			else
				local _ = nil
				local var1935, var1936 = protoModule.readVarInt(p96, var1926)
				local _ = var1935
				var1926 = var1936
			end
		end
		if var1927 == protoModule.wireTypes.lengthDelimited then
			if var1931 == 2 then
				local _ = nil
				local var1937, var1938 = protoModule.readBuffer(p96, var1926)
				var1926 = var1938
				var1925.action_params = t.JoinCommunityAction_Params.decode(var1937)
			else
				local _ = nil
				local var1939, var1940 = protoModule.readVarInt(p96, var1926)
				var1926 = var1940 + var1939
			end
		elseif var1927 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1941, var1942 = protoModule.readFixed32(p96, var1926)
			local _ = var1941
			var1926 = var1942
		elseif var1927 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1943, var1944 = protoModule.readFixed64(p96, var1926)
			local _ = var1943
			var1926 = var1944
		else
			error("Unsupported wire type: " .. var3214)
		end
	end
	return var1925
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
	local var1945 = t_96.new()
	
	if self.action_type ~= nil then
		var1945.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1945.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1945.action_params = t.JoinCommunityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1945.action_params = t.JoinCommunityAction_Params.jsonDecode(self.actionParams)
	end
	return var1945
end

t_96.descriptor = {
	name = "JoinCommunityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.JoinCommunityAction"
}
t.JoinCommunityAction = t_96
typeRegistryModule.default:register(t.JoinCommunityAction)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p97)
	-- upvalues: t_97 (ref)
	return setmetatable({
		community_id = if p97 == nil or p97.community_id == nil then nil else p97.community_id
	}, t_97)
end

function t_97:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1945 = 0
	
	if self.community_id ~= nil then
		local var1946 = self.community_id:encode()
		local var1947, var1948 = protoModule.writeTag(buff, var1945, 1, protoModule.wireTypes.lengthDelimited)
		var1947, var3238 = protoModule.writeBuffer(var1947, var1948, var1946, buffer.len(var1946))
		buff = var1947
		var1945 = var1948
	end
	local buff_1 = buffer.create(var1945)
	buffer.copy(buff_1, 0, buff, 0, var1945)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref), propTypesModule (ref)
	local var1945 = t_97.new()
	local var1946 = 0
	while var1946 < buffer.len(p97) do
		local _ = nil
		local var1947 = nil
		local var1948, var1949, var1950 = protoModule.readTag(p97, var1946)
		local var1951 = var1948
		var1947 = var1949
		var1946 = var1950
		
		if var1947 == protoModule.wireTypes.varint then
			local _ = nil
			local var1952, var1953 = protoModule.readVarInt(p97, var1946)
			local _ = var1952
			var1946 = var1953
			continue
		end
		if var1947 == protoModule.wireTypes.lengthDelimited then
			if var1951 == 1 then
				local _ = nil
				local var1954, var1955 = protoModule.readBuffer(p97, var1946)
				var1946 = var1955
				var1945.community_id = propTypesModule.StringProp.decode(var1954)
			else
				local _ = nil
				local var1956, var1957 = protoModule.readVarInt(p97, var1946)
				var1946 = var1957 + var1956
			end
		elseif var1947 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1958, var1959 = protoModule.readFixed32(p97, var1946)
			local _ = var1958
			var1946 = var1959
		elseif var1947 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1960, var1961 = protoModule.readFixed64(p97, var1946)
			local _ = var1960
			var1946 = var1961
		else
			error("Unsupported wire type: " .. var3242)
		end
	end
	return var1945
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
	local var1962 = t_97.new()
	
	if self.community_id ~= nil then
		var1962.community_id = propTypesModule.StringProp.jsonDecode(self.community_id)
	end
	if self.communityId ~= nil then
		var1962.community_id = propTypesModule.StringProp.jsonDecode(self.communityId)
	end
	return var1962
end

t_97.descriptor = {
	name = "JoinCommunityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.JoinCommunityAction_Params = t_97
typeRegistryModule.default:register(t.JoinCommunityAction_Params)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p98)
	-- upvalues: t (ref), t_98 (ref)
	return setmetatable({
		action_type = if p98 == nil or p98.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p98.action_type,
		action_params = if p98 == nil or p98.action_params == nil then nil else p98.action_params
	}, t_98)
end

function t_98:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1962 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1963, var1964 = protoModule.writeTag(buff, var1962, 1, protoModule.wireTypes.varint)
		var1963, var3262 = protoModule.writeVarInt(var1963, var1964, t.ActionType.toNumber(self.action_type))
		buff = var1963
		var1962 = var1964
	end
	if self.action_params ~= nil then
		local var1965 = self.action_params:encode()
		local var1966, var1967 = protoModule.writeTag(buff, var1962, 2, protoModule.wireTypes.lengthDelimited)
		var1966, var3265 = protoModule.writeBuffer(var1966, var1967, var1965, buffer.len(var1965))
		buff = var1966
		var1962 = var1967
	end
	local buff_1 = buffer.create(var1962)
	buffer.copy(buff_1, 0, buff, 0, var1962)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var1962 = t_98.new()
	local var1963 = 0
	while var1963 < buffer.len(p98) do
		local _ = nil
		local var1964 = nil
		local var1965, var1966, var1967 = protoModule.readTag(p98, var1963)
		local var1968 = var1965
		var1964 = var1966
		var1963 = var1967
		
		if var1964 == protoModule.wireTypes.varint then
			if var1968 == 1 then
				local _ = nil
				local var1969, var1970 = protoModule.readVarIntI32(p98, var1963)
				local var1971 = var1969
				var1963 = var1970
				var1962.action_type = t.ActionType.fromNumber(var1971) or var1971
			else
				local _ = nil
				local var1972, var1973 = protoModule.readVarInt(p98, var1963)
				local _ = var1972
				var1963 = var1973
			end
		end
		if var1964 == protoModule.wireTypes.lengthDelimited then
			if var1968 == 2 then
				local _ = nil
				local var1974, var1975 = protoModule.readBuffer(p98, var1963)
				var1963 = var1975
				var1962.action_params = t.ViewCommunityAction_Params.decode(var1974)
			else
				local _ = nil
				local var1976, var1977 = protoModule.readVarInt(p98, var1963)
				var1963 = var1977 + var1976
			end
		elseif var1964 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1978, var1979 = protoModule.readFixed32(p98, var1963)
			local _ = var1978
			var1963 = var1979
		elseif var1964 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1980, var1981 = protoModule.readFixed64(p98, var1963)
			local _ = var1980
			var1963 = var1981
		else
			error("Unsupported wire type: " .. var3269)
		end
	end
	return var1962
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
	local var1982 = t_98.new()
	
	if self.action_type ~= nil then
		var1982.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1982.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1982.action_params = t.ViewCommunityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1982.action_params = t.ViewCommunityAction_Params.jsonDecode(self.actionParams)
	end
	return var1982
end

t_98.descriptor = {
	name = "ViewCommunityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ViewCommunityAction"
}
t.ViewCommunityAction = t_98
typeRegistryModule.default:register(t.ViewCommunityAction)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p99)
	-- upvalues: t_99 (ref)
	return setmetatable({
		community_id = if p99 == nil or p99.community_id == nil then nil else p99.community_id
	}, t_99)
end

function t_99:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1982 = 0
	
	if self.community_id ~= nil then
		local var1983 = self.community_id:encode()
		local var1984, var1985 = protoModule.writeTag(buff, var1982, 1, protoModule.wireTypes.lengthDelimited)
		var1984, var3293 = protoModule.writeBuffer(var1984, var1985, var1983, buffer.len(var1983))
		buff = var1984
		var1982 = var1985
	end
	local buff_1 = buffer.create(var1982)
	buffer.copy(buff_1, 0, buff, 0, var1982)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref), propTypesModule (ref)
	local var1982 = t_99.new()
	local var1983 = 0
	while var1983 < buffer.len(p99) do
		local _ = nil
		local var1984 = nil
		local var1985, var1986, var1987 = protoModule.readTag(p99, var1983)
		local var1988 = var1985
		var1984 = var1986
		var1983 = var1987
		
		if var1984 == protoModule.wireTypes.varint then
			local _ = nil
			local var1989, var1990 = protoModule.readVarInt(p99, var1983)
			local _ = var1989
			var1983 = var1990
			continue
		end
		if var1984 == protoModule.wireTypes.lengthDelimited then
			if var1988 == 1 then
				local _ = nil
				local var1991, var1992 = protoModule.readBuffer(p99, var1983)
				var1983 = var1992
				var1982.community_id = propTypesModule.StringProp.decode(var1991)
			else
				local _ = nil
				local var1993, var1994 = protoModule.readVarInt(p99, var1983)
				var1983 = var1994 + var1993
			end
		elseif var1984 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1995, var1996 = protoModule.readFixed32(p99, var1983)
			local _ = var1995
			var1983 = var1996
		elseif var1984 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1997, var1998 = protoModule.readFixed64(p99, var1983)
			local _ = var1997
			var1983 = var1998
		else
			error("Unsupported wire type: " .. var3297)
		end
	end
	return var1982
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
	local var1999 = t_99.new()
	
	if self.community_id ~= nil then
		var1999.community_id = propTypesModule.StringProp.jsonDecode(self.community_id)
	end
	if self.communityId ~= nil then
		var1999.community_id = propTypesModule.StringProp.jsonDecode(self.communityId)
	end
	return var1999
end

t_99.descriptor = {
	name = "ViewCommunityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ViewCommunityAction_Params = t_99
typeRegistryModule.default:register(t.ViewCommunityAction_Params)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p100)
	-- upvalues: t (ref), t_100 (ref)
	return setmetatable({
		action_type = if p100 == nil or p100.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p100.action_type,
		action_params = if p100 == nil or p100.action_params == nil then nil else p100.action_params
	}, t_100)
end

function t_100:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1999 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2000, var2001 = protoModule.writeTag(buff, var1999, 1, protoModule.wireTypes.varint)
		var2000, var3317 = protoModule.writeVarInt(var2000, var2001, t.ActionType.toNumber(self.action_type))
		buff = var2000
		var1999 = var2001
	end
	if self.action_params ~= nil then
		local var2002 = self.action_params:encode()
		local var2003, var2004 = protoModule.writeTag(buff, var1999, 2, protoModule.wireTypes.lengthDelimited)
		var2003, var3320 = protoModule.writeBuffer(var2003, var2004, var2002, buffer.len(var2002))
		buff = var2003
		var1999 = var2004
	end
	local buff_1 = buffer.create(var1999)
	buffer.copy(buff_1, 0, buff, 0, var1999)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var1999 = t_100.new()
	local var2000 = 0
	while var2000 < buffer.len(p100) do
		local _ = nil
		local var2001 = nil
		local var2002, var2003, var2004 = protoModule.readTag(p100, var2000)
		local var2005 = var2002
		var2001 = var2003
		var2000 = var2004
		
		if var2001 == protoModule.wireTypes.varint then
			if var2005 == 1 then
				local _ = nil
				local var2006, var2007 = protoModule.readVarIntI32(p100, var2000)
				local var2008 = var2006
				var2000 = var2007
				var1999.action_type = t.ActionType.fromNumber(var2008) or var2008
			else
				local _ = nil
				local var2009, var2010 = protoModule.readVarInt(p100, var2000)
				local _ = var2009
				var2000 = var2010
			end
		end
		if var2001 == protoModule.wireTypes.lengthDelimited then
			if var2005 == 2 then
				local _ = nil
				local var2011, var2012 = protoModule.readBuffer(p100, var2000)
				var2000 = var2012
				var1999.action_params = t.AnalyticsEventAction_Params.decode(var2011)
			else
				local _ = nil
				local var2013, var2014 = protoModule.readVarInt(p100, var2000)
				var2000 = var2014 + var2013
			end
		elseif var2001 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2015, var2016 = protoModule.readFixed32(p100, var2000)
			local _ = var2015
			var2000 = var2016
		elseif var2001 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2017, var2018 = protoModule.readFixed64(p100, var2000)
			local _ = var2017
			var2000 = var2018
		else
			error("Unsupported wire type: " .. var3324)
		end
	end
	return var1999
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
	local var2019 = t_100.new()
	
	if self.action_type ~= nil then
		var2019.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2019.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2019.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2019.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return var2019
end

t_100.descriptor = {
	name = "AnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.AnalyticsEventAction"
}
t.AnalyticsEventAction = t_100
typeRegistryModule.default:register(t.AnalyticsEventAction)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p101)
	-- upvalues: t_101 (ref)
	return setmetatable({
		event_name = if p101 == nil or p101.event_name == nil then nil else p101.event_name,
		event_fields = if p101 == nil or p101.event_fields == nil then nil else p101.event_fields
	}, t_101)
end

function t_101:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2019 = 0
	
	if self.event_name ~= nil then
		local var2020 = self.event_name:encode()
		local var2021, var2022 = protoModule.writeTag(buff, var2019, 1, protoModule.wireTypes.lengthDelimited)
		var2021, var3348 = protoModule.writeBuffer(var2021, var2022, var2020, buffer.len(var2020))
		buff = var2021
		var2019 = var2022
	end
	if self.event_fields ~= nil then
		local var2023 = self.event_fields:encode()
		local var2024, var2025 = protoModule.writeTag(buff, var2019, 2, protoModule.wireTypes.lengthDelimited)
		var2024, var3351 = protoModule.writeBuffer(var2024, var2025, var2023, buffer.len(var2023))
		buff = var2024
		var2019 = var2025
	end
	local buff_1 = buffer.create(var2019)
	buffer.copy(buff_1, 0, buff, 0, var2019)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref), propTypesModule (ref)
	local var2019 = t_101.new()
	local var2020 = 0
	while var2020 < buffer.len(p101) do
		local _ = nil
		local var2021 = nil
		local var2022, var2023, var2024 = protoModule.readTag(p101, var2020)
		local var2025 = var2022
		var2021 = var2023
		var2020 = var2024
		
		if var2021 == protoModule.wireTypes.varint then
			local _ = nil
			local var2026, var2027 = protoModule.readVarInt(p101, var2020)
			local _ = var2026
			var2020 = var2027
			continue
		end
		if var2021 == protoModule.wireTypes.lengthDelimited then
			if var2025 == 1 then
				local _ = nil
				local var2028, var2029 = protoModule.readBuffer(p101, var2020)
				var2020 = var2029
				var2019.event_name = propTypesModule.StringProp.decode(var2028)
			elseif var2025 == 2 then
				local _ = nil
				local var2030, var2031 = protoModule.readBuffer(p101, var2020)
				var2020 = var2031
				var2019.event_fields = propTypesModule.StructProp.decode(var2030)
			else
				local _ = nil
				local var2032, var2033 = protoModule.readVarInt(p101, var2020)
				var2020 = var2033 + var2032
			end
		elseif var2021 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2034, var2035 = protoModule.readFixed32(p101, var2020)
			local _ = var2034
			var2020 = var2035
		elseif var2021 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2036, var2037 = protoModule.readFixed64(p101, var2020)
			local _ = var2036
			var2020 = var2037
		else
			error("Unsupported wire type: " .. var3355)
		end
	end
	return var2019
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
	local var2038 = t_101.new()
	
	if self.event_name ~= nil then
		var2038.event_name = propTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		var2038.event_name = propTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		var2038.event_fields = propTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		var2038.event_fields = propTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return var2038
end

t_101.descriptor = {
	name = "AnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.AnalyticsEventAction_Params = t_101
typeRegistryModule.default:register(t.AnalyticsEventAction_Params)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p102)
	-- upvalues: t (ref), t_102 (ref)
	return setmetatable({
		action_type = if p102 == nil or p102.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p102.action_type,
		action_params = if p102 == nil or p102.action_params == nil then nil else p102.action_params
	}, t_102)
end

function t_102:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2038 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2039, var2040 = protoModule.writeTag(buff, var2038, 1, protoModule.wireTypes.varint)
		var2039, var3377 = protoModule.writeVarInt(var2039, var2040, t.ActionType.toNumber(self.action_type))
		buff = var2039
		var2038 = var2040
	end
	if self.action_params ~= nil then
		local var2041 = self.action_params:encode()
		local var2042, var2043 = protoModule.writeTag(buff, var2038, 2, protoModule.wireTypes.lengthDelimited)
		var2042, var3380 = protoModule.writeBuffer(var2042, var2043, var2041, buffer.len(var2041))
		buff = var2042
		var2038 = var2043
	end
	local buff_1 = buffer.create(var2038)
	buffer.copy(buff_1, 0, buff, 0, var2038)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref), t (ref)
	local var2038 = t_102.new()
	local var2039 = 0
	while var2039 < buffer.len(p102) do
		local _ = nil
		local var2040 = nil
		local var2041, var2042, var2043 = protoModule.readTag(p102, var2039)
		local var2044 = var2041
		var2040 = var2042
		var2039 = var2043
		
		if var2040 == protoModule.wireTypes.varint then
			if var2044 == 1 then
				local _ = nil
				local var2045, var2046 = protoModule.readVarIntI32(p102, var2039)
				local var2047 = var2045
				var2039 = var2046
				var2038.action_type = t.ActionType.fromNumber(var2047) or var2047
			else
				local _ = nil
				local var2048, var2049 = protoModule.readVarInt(p102, var2039)
				local _ = var2048
				var2039 = var2049
			end
		end
		if var2040 == protoModule.wireTypes.lengthDelimited then
			if var2044 == 2 then
				local _ = nil
				local var2050, var2051 = protoModule.readBuffer(p102, var2039)
				var2039 = var2051
				var2038.action_params = t.CustomAnalyticsEventAction_Params.decode(var2050)
			else
				local _ = nil
				local var2052, var2053 = protoModule.readVarInt(p102, var2039)
				var2039 = var2053 + var2052
			end
		elseif var2040 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2054, var2055 = protoModule.readFixed32(p102, var2039)
			local _ = var2054
			var2039 = var2055
		elseif var2040 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2056, var2057 = protoModule.readFixed64(p102, var2039)
			local _ = var2056
			var2039 = var2057
		else
			error("Unsupported wire type: " .. var3384)
		end
	end
	return var2038
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
	local var2058 = t_102.new()
	
	if self.action_type ~= nil then
		var2058.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2058.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2058.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2058.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return var2058
end

t_102.descriptor = {
	name = "CustomAnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomAnalyticsEventAction"
}
t.CustomAnalyticsEventAction = t_102
typeRegistryModule.default:register(t.CustomAnalyticsEventAction)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p103)
	-- upvalues: t_103 (ref)
	return setmetatable({
		event_name = if p103 == nil or p103.event_name == nil then nil else p103.event_name,
		event_fields = if p103 == nil or p103.event_fields == nil then nil else p103.event_fields
	}, t_103)
end

function t_103:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2058 = 0
	
	if self.event_name ~= nil then
		local var2059 = self.event_name:encode()
		local var2060, var2061 = protoModule.writeTag(buff, var2058, 1, protoModule.wireTypes.lengthDelimited)
		var2060, var3408 = protoModule.writeBuffer(var2060, var2061, var2059, buffer.len(var2059))
		buff = var2060
		var2058 = var2061
	end
	if self.event_fields ~= nil then
		local var2062 = self.event_fields:encode()
		local var2063, var2064 = protoModule.writeTag(buff, var2058, 2, protoModule.wireTypes.lengthDelimited)
		var2063, var3411 = protoModule.writeBuffer(var2063, var2064, var2062, buffer.len(var2062))
		buff = var2063
		var2058 = var2064
	end
	local buff_1 = buffer.create(var2058)
	buffer.copy(buff_1, 0, buff, 0, var2058)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref), propTypesModule (ref)
	local var2058 = t_103.new()
	local var2059 = 0
	while var2059 < buffer.len(p103) do
		local _ = nil
		local var2060 = nil
		local var2061, var2062, var2063 = protoModule.readTag(p103, var2059)
		local var2064 = var2061
		var2060 = var2062
		var2059 = var2063
		
		if var2060 == protoModule.wireTypes.varint then
			local _ = nil
			local var2065, var2066 = protoModule.readVarInt(p103, var2059)
			local _ = var2065
			var2059 = var2066
			continue
		end
		if var2060 == protoModule.wireTypes.lengthDelimited then
			if var2064 == 1 then
				local _ = nil
				local var2067, var2068 = protoModule.readBuffer(p103, var2059)
				var2059 = var2068
				var2058.event_name = propTypesModule.StringProp.decode(var2067)
			elseif var2064 == 2 then
				local _ = nil
				local var2069, var2070 = protoModule.readBuffer(p103, var2059)
				var2059 = var2070
				var2058.event_fields = propTypesModule.StructProp.decode(var2069)
			else
				local _ = nil
				local var2071, var2072 = protoModule.readVarInt(p103, var2059)
				var2059 = var2072 + var2071
			end
		elseif var2060 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2073, var2074 = protoModule.readFixed32(p103, var2059)
			local _ = var2073
			var2059 = var2074
		elseif var2060 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2075, var2076 = protoModule.readFixed64(p103, var2059)
			local _ = var2075
			var2059 = var2076
		else
			error("Unsupported wire type: " .. var3415)
		end
	end
	return var2058
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
	local var2077 = t_103.new()
	
	if self.event_name ~= nil then
		var2077.event_name = propTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		var2077.event_name = propTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		var2077.event_fields = propTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		var2077.event_fields = propTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return var2077
end

t_103.descriptor = {
	name = "CustomAnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.CustomAnalyticsEventAction_Params = t_103
typeRegistryModule.default:register(t.CustomAnalyticsEventAction_Params)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p104)
	-- upvalues: t (ref), t_104 (ref)
	return setmetatable({
		action_type = if p104 == nil or p104.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p104.action_type,
		action_params = if p104 == nil or p104.action_params == nil then nil else p104.action_params
	}, t_104)
end

function t_104:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2077 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2078, var2079 = protoModule.writeTag(buff, var2077, 1, protoModule.wireTypes.varint)
		var2078, var3437 = protoModule.writeVarInt(var2078, var2079, t.ActionType.toNumber(self.action_type))
		buff = var2078
		var2077 = var2079
	end
	if self.action_params ~= nil then
		local var2080 = self.action_params:encode()
		local var2081, var2082 = protoModule.writeTag(buff, var2077, 2, protoModule.wireTypes.lengthDelimited)
		var2081, var3440 = protoModule.writeBuffer(var2081, var2082, var2080, buffer.len(var2080))
		buff = var2081
		var2077 = var2082
	end
	local buff_1 = buffer.create(var2077)
	buffer.copy(buff_1, 0, buff, 0, var2077)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref), t (ref)
	local var2077 = t_104.new()
	local var2078 = 0
	while var2078 < buffer.len(p104) do
		local _ = nil
		local var2079 = nil
		local var2080, var2081, var2082 = protoModule.readTag(p104, var2078)
		local var2083 = var2080
		var2079 = var2081
		var2078 = var2082
		
		if var2079 == protoModule.wireTypes.varint then
			if var2083 == 1 then
				local _ = nil
				local var2084, var2085 = protoModule.readVarIntI32(p104, var2078)
				local var2086 = var2084
				var2078 = var2085
				var2077.action_type = t.ActionType.fromNumber(var2086) or var2086
			else
				local _ = nil
				local var2087, var2088 = protoModule.readVarInt(p104, var2078)
				local _ = var2087
				var2078 = var2088
			end
		end
		if var2079 == protoModule.wireTypes.lengthDelimited then
			if var2083 == 2 then
				local _ = nil
				local var2089, var2090 = protoModule.readBuffer(p104, var2078)
				var2078 = var2090
				var2077.action_params = t.OpenGameInviteAction_Params.decode(var2089)
			else
				local _ = nil
				local var2091, var2092 = protoModule.readVarInt(p104, var2078)
				var2078 = var2092 + var2091
			end
		elseif var2079 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2093, var2094 = protoModule.readFixed32(p104, var2078)
			local _ = var2093
			var2078 = var2094
		elseif var2079 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2095, var2096 = protoModule.readFixed64(p104, var2078)
			local _ = var2095
			var2078 = var2096
		else
			error("Unsupported wire type: " .. var3444)
		end
	end
	return var2077
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
	local var2097 = t_104.new()
	
	if self.action_type ~= nil then
		var2097.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2097.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2097.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2097.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.actionParams)
	end
	return var2097
end

t_104.descriptor = {
	name = "OpenGameInviteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameInviteAction"
}
t.OpenGameInviteAction = t_104
typeRegistryModule.default:register(t.OpenGameInviteAction)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p105)
	-- upvalues: t_105 (ref)
	return setmetatable({
		universe_id = if p105 == nil or p105.universe_id == nil then nil else p105.universe_id,
		root_place_id = if p105 == nil or p105.root_place_id == nil then nil else p105.root_place_id,
		trigger = if p105 == nil or p105.trigger == nil then nil else p105.trigger,
		button_name = if p105 == nil or p105.button_name == nil then nil else p105.button_name
	}, t_105)
end

function t_105:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2097 = 0
	
	if self.universe_id ~= nil then
		local var2098 = self.universe_id:encode()
		local var2099, var2100 = protoModule.writeTag(buff, var2097, 1, protoModule.wireTypes.lengthDelimited)
		var2099, var3468 = protoModule.writeBuffer(var2099, var2100, var2098, buffer.len(var2098))
		buff = var2099
		var2097 = var2100
	end
	if self.root_place_id ~= nil then
		local var2101 = self.root_place_id:encode()
		local var2102, var2103 = protoModule.writeTag(buff, var2097, 2, protoModule.wireTypes.lengthDelimited)
		var2102, var3471 = protoModule.writeBuffer(var2102, var2103, var2101, buffer.len(var2101))
		buff = var2102
		var2097 = var2103
	end
	if self.trigger ~= nil then
		local var2104 = self.trigger:encode()
		local var2105, var2106 = protoModule.writeTag(buff, var2097, 3, protoModule.wireTypes.lengthDelimited)
		var2105, var3474 = protoModule.writeBuffer(var2105, var2106, var2104, buffer.len(var2104))
		buff = var2105
		var2097 = var2106
	end
	if self.button_name ~= nil then
		local var2107 = self.button_name:encode()
		local var2108, var2109 = protoModule.writeTag(buff, var2097, 4, protoModule.wireTypes.lengthDelimited)
		var2108, var3477 = protoModule.writeBuffer(var2108, var2109, var2107, buffer.len(var2107))
		buff = var2108
		var2097 = var2109
	end
	local buff_1 = buffer.create(var2097)
	buffer.copy(buff_1, 0, buff, 0, var2097)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref), propTypesModule (ref)
	local var2097 = t_105.new()
	local var2098 = 0
	while var2098 < buffer.len(p105) do
		local _ = nil
		local var2099 = nil
		local var2100, var2101, var2102 = protoModule.readTag(p105, var2098)
		local var2103 = var2100
		var2099 = var2101
		var2098 = var2102
		
		if var2099 == protoModule.wireTypes.varint then
			local _ = nil
			local var2104, var2105 = protoModule.readVarInt(p105, var2098)
			local _ = var2104
			var2098 = var2105
			continue
		end
		if var2099 == protoModule.wireTypes.lengthDelimited then
			if var2103 == 1 then
				local _ = nil
				local var2106, var2107 = protoModule.readBuffer(p105, var2098)
				var2098 = var2107
				var2097.universe_id = propTypesModule.StringProp.decode(var2106)
			elseif var2103 == 2 then
				local _ = nil
				local var2108, var2109 = protoModule.readBuffer(p105, var2098)
				var2098 = var2109
				var2097.root_place_id = propTypesModule.StringProp.decode(var2108)
			elseif var2103 == 3 then
				local _ = nil
				local var2110, var2111 = protoModule.readBuffer(p105, var2098)
				var2098 = var2111
				var2097.trigger = propTypesModule.StringProp.decode(var2110)
			elseif var2103 == 4 then
				local _ = nil
				local var2112, var2113 = protoModule.readBuffer(p105, var2098)
				var2098 = var2113
				var2097.button_name = propTypesModule.StringProp.decode(var2112)
			else
				local _ = nil
				local var2114, var2115 = protoModule.readVarInt(p105, var2098)
				var2098 = var2115 + var2114
			end
		elseif var2099 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2116, var2117 = protoModule.readFixed32(p105, var2098)
			local _ = var2116
			var2098 = var2117
		elseif var2099 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2118, var2119 = protoModule.readFixed64(p105, var2098)
			local _ = var2118
			var2098 = var2119
		else
			error("Unsupported wire type: " .. var3481)
		end
	end
	return var2097
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
	local var2120 = t_105.new()
	
	if self.universe_id ~= nil then
		var2120.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2120.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		var2120.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var2120.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	if self.trigger ~= nil then
		var2120.trigger = propTypesModule.StringProp.jsonDecode(self.trigger)
	end
	if self.button_name ~= nil then
		var2120.button_name = propTypesModule.StringProp.jsonDecode(self.button_name)
	end
	if self.buttonName ~= nil then
		var2120.button_name = propTypesModule.StringProp.jsonDecode(self.buttonName)
	end
	return var2120
end

t_105.descriptor = {
	name = "OpenGameInviteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameInviteAction_Params = t_105
typeRegistryModule.default:register(t.OpenGameInviteAction_Params)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p106)
	-- upvalues: t (ref), t_106 (ref)
	return setmetatable({
		action_type = if p106 == nil or p106.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p106.action_type,
		action_params = if p106 == nil or p106.action_params == nil then nil else p106.action_params
	}, t_106)
end

function t_106:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2120 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2121, var2122 = protoModule.writeTag(buff, var2120, 1, protoModule.wireTypes.varint)
		var2121, var3507 = protoModule.writeVarInt(var2121, var2122, t.ActionType.toNumber(self.action_type))
		buff = var2121
		var2120 = var2122
	end
	if self.action_params ~= nil then
		local var2123 = self.action_params:encode()
		local var2124, var2125 = protoModule.writeTag(buff, var2120, 2, protoModule.wireTypes.lengthDelimited)
		var2124, var3510 = protoModule.writeBuffer(var2124, var2125, var2123, buffer.len(var2123))
		buff = var2124
		var2120 = var2125
	end
	local buff_1 = buffer.create(var2120)
	buffer.copy(buff_1, 0, buff, 0, var2120)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref), t (ref)
	local var2120 = t_106.new()
	local var2121 = 0
	while var2121 < buffer.len(p106) do
		local _ = nil
		local var2122 = nil
		local var2123, var2124, var2125 = protoModule.readTag(p106, var2121)
		local var2126 = var2123
		var2122 = var2124
		var2121 = var2125
		
		if var2122 == protoModule.wireTypes.varint then
			if var2126 == 1 then
				local _ = nil
				local var2127, var2128 = protoModule.readVarIntI32(p106, var2121)
				local var2129 = var2127
				var2121 = var2128
				var2120.action_type = t.ActionType.fromNumber(var2129) or var2129
			else
				local _ = nil
				local var2130, var2131 = protoModule.readVarInt(p106, var2121)
				local _ = var2130
				var2121 = var2131
			end
		end
		if var2122 == protoModule.wireTypes.lengthDelimited then
			if var2126 == 2 then
				local _ = nil
				local var2132, var2133 = protoModule.readBuffer(p106, var2121)
				var2121 = var2133
				var2120.action_params = t.LaunchExperienceAction_Params.decode(var2132)
			else
				local _ = nil
				local var2134, var2135 = protoModule.readVarInt(p106, var2121)
				var2121 = var2135 + var2134
			end
		elseif var2122 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2136, var2137 = protoModule.readFixed32(p106, var2121)
			local _ = var2136
			var2121 = var2137
		elseif var2122 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2138, var2139 = protoModule.readFixed64(p106, var2121)
			local _ = var2138
			var2121 = var2139
		else
			error("Unsupported wire type: " .. var3514)
		end
	end
	return var2120
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
	local var2140 = t_106.new()
	
	if self.action_type ~= nil then
		var2140.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2140.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2140.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2140.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.actionParams)
	end
	return var2140
end

t_106.descriptor = {
	name = "LaunchExperienceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LaunchExperienceAction"
}
t.LaunchExperienceAction = t_106
typeRegistryModule.default:register(t.LaunchExperienceAction)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p107)
	-- upvalues: t_107 (ref)
	return setmetatable({
		kind = if p107 == nil or p107.kind == nil then nil else p107.kind
	}, t_107)
end

function t_107:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2140 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2141 = self.kind.value:encode()
			local var2142, var2143 = protoModule.writeTag(buff, var2140, 1, protoModule.wireTypes.lengthDelimited)
			var2142, var3538 = protoModule.writeBuffer(var2142, var2143, var2141, buffer.len(var2141))
			buff = var2142
			var2140 = var2143
		elseif self.kind.type == "binding_path" then
			local var2144, var2145 = protoModule.writeTag(buff, var2140, 2, protoModule.wireTypes.lengthDelimited)
			var2144, var3540 = protoModule.writeString(var2144, var2145, self.kind.value)
			buff = var2144
			var2140 = var2145
		end
	end
	local buff_1 = buffer.create(var2140)
	buffer.copy(buff_1, 0, buff, 0, var2140)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref), t (ref)
	local var2140 = t_107.new()
	local var2141 = 0
	while var2141 < buffer.len(p107) do
		local _ = nil
		local var2142 = nil
		local var2143, var2144, var2145 = protoModule.readTag(p107, var2141)
		local var2146 = var2143
		var2142 = var2144
		var2141 = var2145
		
		if var2142 == protoModule.wireTypes.varint then
			local _ = nil
			local var2147, var2148 = protoModule.readVarInt(p107, var2141)
			local _ = var2147
			var2141 = var2148
			continue
		end
		if var2142 == protoModule.wireTypes.lengthDelimited then
			if var2146 == 1 then
				local _ = nil
				local var2149, var2150 = protoModule.readBuffer(p107, var2141)
				var2141 = var2150
				var2140.kind = {
					type = "literal",
					value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.decode(var2149)
				}
			elseif var2146 == 2 then
				local _ = nil
				local var2151, var2152 = protoModule.readBuffer(p107, var2141)
				var2141 = var2152
				var2140.kind = { type = "binding_path", value = buffer.tostring(var2151) }
			else
				local _ = nil
				local var2153, var2154 = protoModule.readVarInt(p107, var2141)
				var2141 = var2154 + var2153
			end
		elseif var2142 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2155, var2156 = protoModule.readFixed32(p107, var2141)
			local _ = var2155
			var2141 = var2156
		elseif var2142 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2157, var2158 = protoModule.readFixed64(p107, var2141)
			local _ = var2157
			var2141 = var2158
		else
			error("Unsupported wire type: " .. var3544)
		end
	end
	return var2140
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
	local var2159 = t_107.new()
	
	if self.literal ~= nil then
		var2159.kind = {
			type = "literal",
			value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2159.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2159.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2159
end

t_107.descriptor = {
	name = "LaunchExperienceAction_ExperienceJoinData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceJoinData"
}
t.LaunchExperienceAction_ExperienceJoinData = t_107
typeRegistryModule.default:register(t.LaunchExperienceAction_ExperienceJoinData)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p108)
	-- upvalues: t_108 (ref)
	return setmetatable({
		launch_data = if p108 == nil or p108.launch_data == nil then nil else p108.launch_data,
		event_id = if p108 == nil or p108.event_id == nil then nil else p108.event_id
	}, t_108)
end

function t_108:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2159 = 0
	
	if self.launch_data ~= nil then
		local var2160 = self.launch_data:encode()
		local var2161, var2162 = protoModule.writeTag(buff, var2159, 1, protoModule.wireTypes.lengthDelimited)
		var2161, var3567 = protoModule.writeBuffer(var2161, var2162, var2160, buffer.len(var2160))
		buff = var2161
		var2159 = var2162
	end
	if self.event_id ~= nil then
		local var2163 = self.event_id:encode()
		local var2164, var2165 = protoModule.writeTag(buff, var2159, 2, protoModule.wireTypes.lengthDelimited)
		var2164, var3570 = protoModule.writeBuffer(var2164, var2165, var2163, buffer.len(var2163))
		buff = var2164
		var2159 = var2165
	end
	local buff_1 = buffer.create(var2159)
	buffer.copy(buff_1, 0, buff, 0, var2159)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref), propTypesModule (ref)
	local var2159 = t_108.new()
	local var2160 = 0
	while var2160 < buffer.len(p108) do
		local _ = nil
		local var2161 = nil
		local var2162, var2163, var2164 = protoModule.readTag(p108, var2160)
		local var2165 = var2162
		var2161 = var2163
		var2160 = var2164
		
		if var2161 == protoModule.wireTypes.varint then
			local _ = nil
			local var2166, var2167 = protoModule.readVarInt(p108, var2160)
			local _ = var2166
			var2160 = var2167
			continue
		end
		if var2161 == protoModule.wireTypes.lengthDelimited then
			if var2165 == 1 then
				local _ = nil
				local var2168, var2169 = protoModule.readBuffer(p108, var2160)
				var2160 = var2169
				var2159.launch_data = propTypesModule.StringProp.decode(var2168)
			elseif var2165 == 2 then
				local _ = nil
				local var2170, var2171 = protoModule.readBuffer(p108, var2160)
				var2160 = var2171
				var2159.event_id = propTypesModule.StringProp.decode(var2170)
			else
				local _ = nil
				local var2172, var2173 = protoModule.readVarInt(p108, var2160)
				var2160 = var2173 + var2172
			end
		elseif var2161 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2174, var2175 = protoModule.readFixed32(p108, var2160)
			local _ = var2174
			var2160 = var2175
		elseif var2161 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2176, var2177 = protoModule.readFixed64(p108, var2160)
			local _ = var2176
			var2160 = var2177
		else
			error("Unsupported wire type: " .. var3574)
		end
	end
	return var2159
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
	local var2178 = t_108.new()
	
	if self.launch_data ~= nil then
		var2178.launch_data = propTypesModule.StringProp.jsonDecode(self.launch_data)
	end
	if self.launchData ~= nil then
		var2178.launch_data = propTypesModule.StringProp.jsonDecode(self.launchData)
	end
	if self.event_id ~= nil then
		var2178.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var2178.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var2178
end

t_108.descriptor = {
	name = "LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceJoinDataLiteral"
}
t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral = t_108
typeRegistryModule.default:register(t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p109)
	-- upvalues: t_109 (ref)
	return setmetatable({
		place_id = if p109 == nil or p109.place_id == nil then nil else p109.place_id,
		universe_id = if p109 == nil or p109.universe_id == nil then nil else p109.universe_id,
		launch_source = if p109 == nil or p109.launch_source == nil then nil else p109.launch_source,
		experience_join_data = if p109 == nil or p109.experience_join_data == nil then nil else p109.experience_join_data
	}, t_109)
end

function t_109:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2178 = 0
	
	if self.place_id ~= nil then
		local var2179 = self.place_id:encode()
		local var2180, var2181 = protoModule.writeTag(buff, var2178, 1, protoModule.wireTypes.lengthDelimited)
		var2180, var3597 = protoModule.writeBuffer(var2180, var2181, var2179, buffer.len(var2179))
		buff = var2180
		var2178 = var2181
	end
	if self.universe_id ~= nil then
		local var2182 = self.universe_id:encode()
		local var2183, var2184 = protoModule.writeTag(buff, var2178, 2, protoModule.wireTypes.lengthDelimited)
		var2183, var3600 = protoModule.writeBuffer(var2183, var2184, var2182, buffer.len(var2182))
		buff = var2183
		var2178 = var2184
	end
	if self.launch_source ~= nil then
		local var2185 = self.launch_source:encode()
		local var2186, var2187 = protoModule.writeTag(buff, var2178, 3, protoModule.wireTypes.lengthDelimited)
		var2186, var3603 = protoModule.writeBuffer(var2186, var2187, var2185, buffer.len(var2185))
		buff = var2186
		var2178 = var2187
	end
	if self.experience_join_data ~= nil then
		local var2188 = self.experience_join_data:encode()
		local var2189, var2190 = protoModule.writeTag(buff, var2178, 4, protoModule.wireTypes.lengthDelimited)
		var2189, var3606 = protoModule.writeBuffer(var2189, var2190, var2188, buffer.len(var2188))
		buff = var2189
		var2178 = var2190
	end
	local buff_1 = buffer.create(var2178)
	buffer.copy(buff_1, 0, buff, 0, var2178)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var2178 = t_109.new()
	local var2179 = 0
	while var2179 < buffer.len(p109) do
		local _ = nil
		local var2180 = nil
		local var2181, var2182, var2183 = protoModule.readTag(p109, var2179)
		local var2184 = var2181
		var2180 = var2182
		var2179 = var2183
		
		if var2180 == protoModule.wireTypes.varint then
			local _ = nil
			local var2185, var2186 = protoModule.readVarInt(p109, var2179)
			local _ = var2185
			var2179 = var2186
			continue
		end
		if var2180 == protoModule.wireTypes.lengthDelimited then
			if var2184 == 1 then
				local _ = nil
				local var2187, var2188 = protoModule.readBuffer(p109, var2179)
				var2179 = var2188
				var2178.place_id = propTypesModule.StringProp.decode(var2187)
			elseif var2184 == 2 then
				local _ = nil
				local var2189, var2190 = protoModule.readBuffer(p109, var2179)
				var2179 = var2190
				var2178.universe_id = propTypesModule.StringProp.decode(var2189)
			elseif var2184 == 3 then
				local _ = nil
				local var2191, var2192 = protoModule.readBuffer(p109, var2179)
				var2179 = var2192
				var2178.launch_source = propTypesModule.StringProp.decode(var2191)
			elseif var2184 == 4 then
				local _ = nil
				local var2193, var2194 = protoModule.readBuffer(p109, var2179)
				var2179 = var2194
				var2178.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.decode(var2193)
			else
				local _ = nil
				local var2195, var2196 = protoModule.readVarInt(p109, var2179)
				var2179 = var2196 + var2195
			end
		elseif var2180 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2197, var2198 = protoModule.readFixed32(p109, var2179)
			local _ = var2197
			var2179 = var2198
		elseif var2180 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2199, var2200 = protoModule.readFixed64(p109, var2179)
			local _ = var2199
			var2179 = var2200
		else
			error("Unsupported wire type: " .. var3610)
		end
	end
	return var2178
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
	local var2201 = t_109.new()
	
	if self.place_id ~= nil then
		var2201.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var2201.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var2201.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2201.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.launch_source ~= nil then
		var2201.launch_source = propTypesModule.StringProp.jsonDecode(self.launch_source)
	end
	if self.launchSource ~= nil then
		var2201.launch_source = propTypesModule.StringProp.jsonDecode(self.launchSource)
	end
	if self.experience_join_data ~= nil then
		var2201.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experience_join_data)
	end
	if self.experienceJoinData ~= nil then
		var2201.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experienceJoinData)
	end
	return var2201
end

t_109.descriptor = {
	name = "LaunchExperienceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LaunchExperienceAction_Params = t_109
typeRegistryModule.default:register(t.LaunchExperienceAction_Params)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p110)
	-- upvalues: t (ref), t_110 (ref)
	return setmetatable({
		action_type = if p110 == nil or p110.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p110.action_type,
		action_params = if p110 == nil or p110.action_params == nil then nil else p110.action_params
	}, t_110)
end

function t_110:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2201 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2202, var2203 = protoModule.writeTag(buff, var2201, 1, protoModule.wireTypes.varint)
		var2202, var3636 = protoModule.writeVarInt(var2202, var2203, t.ActionType.toNumber(self.action_type))
		buff = var2202
		var2201 = var2203
	end
	if self.action_params ~= nil then
		local var2204 = self.action_params:encode()
		local var2205, var2206 = protoModule.writeTag(buff, var2201, 2, protoModule.wireTypes.lengthDelimited)
		var2205, var3639 = protoModule.writeBuffer(var2205, var2206, var2204, buffer.len(var2204))
		buff = var2205
		var2201 = var2206
	end
	local buff_1 = buffer.create(var2201)
	buffer.copy(buff_1, 0, buff, 0, var2201)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var2201 = t_110.new()
	local var2202 = 0
	while var2202 < buffer.len(p110) do
		local _ = nil
		local var2203 = nil
		local var2204, var2205, var2206 = protoModule.readTag(p110, var2202)
		local var2207 = var2204
		var2203 = var2205
		var2202 = var2206
		
		if var2203 == protoModule.wireTypes.varint then
			if var2207 == 1 then
				local _ = nil
				local var2208, var2209 = protoModule.readVarIntI32(p110, var2202)
				local var2210 = var2208
				var2202 = var2209
				var2201.action_type = t.ActionType.fromNumber(var2210) or var2210
			else
				local _ = nil
				local var2211, var2212 = protoModule.readVarInt(p110, var2202)
				local _ = var2211
				var2202 = var2212
			end
		end
		if var2203 == protoModule.wireTypes.lengthDelimited then
			if var2207 == 2 then
				local _ = nil
				local var2213, var2214 = protoModule.readBuffer(p110, var2202)
				var2202 = var2214
				var2201.action_params = t.ToggleExperienceFavoriteAction_Params.decode(var2213)
			else
				local _ = nil
				local var2215, var2216 = protoModule.readVarInt(p110, var2202)
				var2202 = var2216 + var2215
			end
		elseif var2203 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2217, var2218 = protoModule.readFixed32(p110, var2202)
			local _ = var2217
			var2202 = var2218
		elseif var2203 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2219, var2220 = protoModule.readFixed64(p110, var2202)
			local _ = var2219
			var2202 = var2220
		else
			error("Unsupported wire type: " .. var3643)
		end
	end
	return var2201
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
	local var2221 = t_110.new()
	
	if self.action_type ~= nil then
		var2221.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2221.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2221.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2221.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.actionParams)
	end
	return var2221
end

t_110.descriptor = {
	name = "ToggleExperienceFavoriteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceFavoriteAction"
}
t.ToggleExperienceFavoriteAction = t_110
typeRegistryModule.default:register(t.ToggleExperienceFavoriteAction)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p111)
	-- upvalues: t_111 (ref)
	return setmetatable({
		universe_id = if p111 == nil or p111.universe_id == nil then nil else p111.universe_id,
		place_id = if p111 == nil or p111.place_id == nil then nil else p111.place_id,
		ctx = if p111 == nil or p111.ctx == nil then nil else p111.ctx
	}, t_111)
end

function t_111:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2221 = 0
	
	if self.universe_id ~= nil then
		local var2222 = self.universe_id:encode()
		local var2223, var2224 = protoModule.writeTag(buff, var2221, 1, protoModule.wireTypes.lengthDelimited)
		var2223, var3667 = protoModule.writeBuffer(var2223, var2224, var2222, buffer.len(var2222))
		buff = var2223
		var2221 = var2224
	end
	if self.place_id ~= nil then
		local var2225 = self.place_id:encode()
		local var2226, var2227 = protoModule.writeTag(buff, var2221, 2, protoModule.wireTypes.lengthDelimited)
		var2226, var3670 = protoModule.writeBuffer(var2226, var2227, var2225, buffer.len(var2225))
		buff = var2226
		var2221 = var2227
	end
	if self.ctx ~= nil then
		local var2228 = self.ctx:encode()
		local var2229, var2230 = protoModule.writeTag(buff, var2221, 3, protoModule.wireTypes.lengthDelimited)
		var2229, var3673 = protoModule.writeBuffer(var2229, var2230, var2228, buffer.len(var2228))
		buff = var2229
		var2221 = var2230
	end
	local buff_1 = buffer.create(var2221)
	buffer.copy(buff_1, 0, buff, 0, var2221)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref), propTypesModule (ref)
	local var2221 = t_111.new()
	local var2222 = 0
	while var2222 < buffer.len(p111) do
		local _ = nil
		local var2223 = nil
		local var2224, var2225, var2226 = protoModule.readTag(p111, var2222)
		local var2227 = var2224
		var2223 = var2225
		var2222 = var2226
		
		if var2223 == protoModule.wireTypes.varint then
			local _ = nil
			local var2228, var2229 = protoModule.readVarInt(p111, var2222)
			local _ = var2228
			var2222 = var2229
			continue
		end
		if var2223 == protoModule.wireTypes.lengthDelimited then
			if var2227 == 1 then
				local _ = nil
				local var2230, var2231 = protoModule.readBuffer(p111, var2222)
				var2222 = var2231
				var2221.universe_id = propTypesModule.StringProp.decode(var2230)
			elseif var2227 == 2 then
				local _ = nil
				local var2232, var2233 = protoModule.readBuffer(p111, var2222)
				var2222 = var2233
				var2221.place_id = propTypesModule.StringProp.decode(var2232)
			elseif var2227 == 3 then
				local _ = nil
				local var2234, var2235 = protoModule.readBuffer(p111, var2222)
				var2222 = var2235
				var2221.ctx = propTypesModule.StringProp.decode(var2234)
			else
				local _ = nil
				local var2236, var2237 = protoModule.readVarInt(p111, var2222)
				var2222 = var2237 + var2236
			end
		elseif var2223 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2238, var2239 = protoModule.readFixed32(p111, var2222)
			local _ = var2238
			var2222 = var2239
		elseif var2223 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2240, var2241 = protoModule.readFixed64(p111, var2222)
			local _ = var2240
			var2222 = var2241
		else
			error("Unsupported wire type: " .. var3677)
		end
	end
	return var2221
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
	local var2242 = t_111.new()
	
	if self.universe_id ~= nil then
		var2242.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2242.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var2242.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var2242.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		var2242.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var2242
end

t_111.descriptor = {
	name = "ToggleExperienceFavoriteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceFavoriteAction_Params = t_111
typeRegistryModule.default:register(t.ToggleExperienceFavoriteAction_Params)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p112)
	-- upvalues: t (ref), t_112 (ref)
	return setmetatable({
		action_type = if p112 == nil or p112.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p112.action_type,
		action_params = if p112 == nil or p112.action_params == nil then nil else p112.action_params
	}, t_112)
end

function t_112:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2242 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2243, var2244 = protoModule.writeTag(buff, var2242, 1, protoModule.wireTypes.varint)
		var2243, var3701 = protoModule.writeVarInt(var2243, var2244, t.ActionType.toNumber(self.action_type))
		buff = var2243
		var2242 = var2244
	end
	if self.action_params ~= nil then
		local var2245 = self.action_params:encode()
		local var2246, var2247 = protoModule.writeTag(buff, var2242, 2, protoModule.wireTypes.lengthDelimited)
		var2246, var3704 = protoModule.writeBuffer(var2246, var2247, var2245, buffer.len(var2245))
		buff = var2246
		var2242 = var2247
	end
	local buff_1 = buffer.create(var2242)
	buffer.copy(buff_1, 0, buff, 0, var2242)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var2242 = t_112.new()
	local var2243 = 0
	while var2243 < buffer.len(p112) do
		local _ = nil
		local var2244 = nil
		local var2245, var2246, var2247 = protoModule.readTag(p112, var2243)
		local var2248 = var2245
		var2244 = var2246
		var2243 = var2247
		
		if var2244 == protoModule.wireTypes.varint then
			if var2248 == 1 then
				local _ = nil
				local var2249, var2250 = protoModule.readVarIntI32(p112, var2243)
				local var2251 = var2249
				var2243 = var2250
				var2242.action_type = t.ActionType.fromNumber(var2251) or var2251
			else
				local _ = nil
				local var2252, var2253 = protoModule.readVarInt(p112, var2243)
				local _ = var2252
				var2243 = var2253
			end
		end
		if var2244 == protoModule.wireTypes.lengthDelimited then
			if var2248 == 2 then
				local _ = nil
				local var2254, var2255 = protoModule.readBuffer(p112, var2243)
				var2243 = var2255
				var2242.action_params = t.ToggleExperienceFollowAction_Params.decode(var2254)
			else
				local _ = nil
				local var2256, var2257 = protoModule.readVarInt(p112, var2243)
				var2243 = var2257 + var2256
			end
		elseif var2244 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2258, var2259 = protoModule.readFixed32(p112, var2243)
			local _ = var2258
			var2243 = var2259
		elseif var2244 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2260, var2261 = protoModule.readFixed64(p112, var2243)
			local _ = var2260
			var2243 = var2261
		else
			error("Unsupported wire type: " .. var3708)
		end
	end
	return var2242
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
	local var2262 = t_112.new()
	
	if self.action_type ~= nil then
		var2262.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2262.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2262.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2262.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.actionParams)
	end
	return var2262
end

t_112.descriptor = {
	name = "ToggleExperienceFollowAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceFollowAction"
}
t.ToggleExperienceFollowAction = t_112
typeRegistryModule.default:register(t.ToggleExperienceFollowAction)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p113)
	-- upvalues: t_113 (ref)
	return setmetatable({
		universe_id = if p113 == nil or p113.universe_id == nil then nil else p113.universe_id,
		game_name = if p113 == nil or p113.game_name == nil then nil else p113.game_name,
		ctx = if p113 == nil or p113.ctx == nil then nil else p113.ctx
	}, t_113)
end

function t_113:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2262 = 0
	
	if self.universe_id ~= nil then
		local var2263 = self.universe_id:encode()
		local var2264, var2265 = protoModule.writeTag(buff, var2262, 1, protoModule.wireTypes.lengthDelimited)
		var2264, var3732 = protoModule.writeBuffer(var2264, var2265, var2263, buffer.len(var2263))
		buff = var2264
		var2262 = var2265
	end
	if self.game_name ~= nil then
		local var2266 = self.game_name:encode()
		local var2267, var2268 = protoModule.writeTag(buff, var2262, 2, protoModule.wireTypes.lengthDelimited)
		var2267, var3735 = protoModule.writeBuffer(var2267, var2268, var2266, buffer.len(var2266))
		buff = var2267
		var2262 = var2268
	end
	if self.ctx ~= nil then
		local var2269 = self.ctx:encode()
		local var2270, var2271 = protoModule.writeTag(buff, var2262, 3, protoModule.wireTypes.lengthDelimited)
		var2270, var3738 = protoModule.writeBuffer(var2270, var2271, var2269, buffer.len(var2269))
		buff = var2270
		var2262 = var2271
	end
	local buff_1 = buffer.create(var2262)
	buffer.copy(buff_1, 0, buff, 0, var2262)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref), propTypesModule (ref)
	local var2262 = t_113.new()
	local var2263 = 0
	while var2263 < buffer.len(p113) do
		local _ = nil
		local var2264 = nil
		local var2265, var2266, var2267 = protoModule.readTag(p113, var2263)
		local var2268 = var2265
		var2264 = var2266
		var2263 = var2267
		
		if var2264 == protoModule.wireTypes.varint then
			local _ = nil
			local var2269, var2270 = protoModule.readVarInt(p113, var2263)
			local _ = var2269
			var2263 = var2270
			continue
		end
		if var2264 == protoModule.wireTypes.lengthDelimited then
			if var2268 == 1 then
				local _ = nil
				local var2271, var2272 = protoModule.readBuffer(p113, var2263)
				var2263 = var2272
				var2262.universe_id = propTypesModule.StringProp.decode(var2271)
			elseif var2268 == 2 then
				local _ = nil
				local var2273, var2274 = protoModule.readBuffer(p113, var2263)
				var2263 = var2274
				var2262.game_name = propTypesModule.StringProp.decode(var2273)
			elseif var2268 == 3 then
				local _ = nil
				local var2275, var2276 = protoModule.readBuffer(p113, var2263)
				var2263 = var2276
				var2262.ctx = propTypesModule.StringProp.decode(var2275)
			else
				local _ = nil
				local var2277, var2278 = protoModule.readVarInt(p113, var2263)
				var2263 = var2278 + var2277
			end
		elseif var2264 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2279, var2280 = protoModule.readFixed32(p113, var2263)
			local _ = var2279
			var2263 = var2280
		elseif var2264 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2281, var2282 = protoModule.readFixed64(p113, var2263)
			local _ = var2281
			var2263 = var2282
		else
			error("Unsupported wire type: " .. var3742)
		end
	end
	return var2262
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
	local var2283 = t_113.new()
	
	if self.universe_id ~= nil then
		var2283.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2283.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.game_name ~= nil then
		var2283.game_name = propTypesModule.StringProp.jsonDecode(self.game_name)
	end
	if self.gameName ~= nil then
		var2283.game_name = propTypesModule.StringProp.jsonDecode(self.gameName)
	end
	if self.ctx ~= nil then
		var2283.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var2283
end

t_113.descriptor = {
	name = "ToggleExperienceFollowAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceFollowAction_Params = t_113
typeRegistryModule.default:register(t.ToggleExperienceFollowAction_Params)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p114)
	-- upvalues: t (ref), t_114 (ref)
	return setmetatable({
		action_type = if p114 == nil or p114.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p114.action_type,
		action_params = if p114 == nil or p114.action_params == nil then nil else p114.action_params
	}, t_114)
end

function t_114:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2283 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2284, var2285 = protoModule.writeTag(buff, var2283, 1, protoModule.wireTypes.varint)
		var2284, var3766 = protoModule.writeVarInt(var2284, var2285, t.ActionType.toNumber(self.action_type))
		buff = var2284
		var2283 = var2285
	end
	if self.action_params ~= nil then
		local var2286 = self.action_params:encode()
		local var2287, var2288 = protoModule.writeTag(buff, var2283, 2, protoModule.wireTypes.lengthDelimited)
		var2287, var3769 = protoModule.writeBuffer(var2287, var2288, var2286, buffer.len(var2286))
		buff = var2287
		var2283 = var2288
	end
	local buff_1 = buffer.create(var2283)
	buffer.copy(buff_1, 0, buff, 0, var2283)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref), t (ref)
	local var2283 = t_114.new()
	local var2284 = 0
	while var2284 < buffer.len(p114) do
		local _ = nil
		local var2285 = nil
		local var2286, var2287, var2288 = protoModule.readTag(p114, var2284)
		local var2289 = var2286
		var2285 = var2287
		var2284 = var2288
		
		if var2285 == protoModule.wireTypes.varint then
			if var2289 == 1 then
				local _ = nil
				local var2290, var2291 = protoModule.readVarIntI32(p114, var2284)
				local var2292 = var2290
				var2284 = var2291
				var2283.action_type = t.ActionType.fromNumber(var2292) or var2292
			else
				local _ = nil
				local var2293, var2294 = protoModule.readVarInt(p114, var2284)
				local _ = var2293
				var2284 = var2294
			end
		end
		if var2285 == protoModule.wireTypes.lengthDelimited then
			if var2289 == 2 then
				local _ = nil
				local var2295, var2296 = protoModule.readBuffer(p114, var2284)
				var2284 = var2296
				var2283.action_params = t.ToggleExperienceVoteAction_Params.decode(var2295)
			else
				local _ = nil
				local var2297, var2298 = protoModule.readVarInt(p114, var2284)
				var2284 = var2298 + var2297
			end
		elseif var2285 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2299, var2300 = protoModule.readFixed32(p114, var2284)
			local _ = var2299
			var2284 = var2300
		elseif var2285 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2301, var2302 = protoModule.readFixed64(p114, var2284)
			local _ = var2301
			var2284 = var2302
		else
			error("Unsupported wire type: " .. var3773)
		end
	end
	return var2283
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
	local var2303 = t_114.new()
	
	if self.action_type ~= nil then
		var2303.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2303.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2303.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2303.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.actionParams)
	end
	return var2303
end

t_114.descriptor = {
	name = "ToggleExperienceVoteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceVoteAction"
}
t.ToggleExperienceVoteAction = t_114
typeRegistryModule.default:register(t.ToggleExperienceVoteAction)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p115)
	-- upvalues: t_115 (ref)
	return setmetatable({
		universe_id = if p115 == nil or p115.universe_id == nil then nil else p115.universe_id,
		vote_direction = if p115 == nil or p115.vote_direction == nil then nil else p115.vote_direction,
		place_id = if p115 == nil or p115.place_id == nil then nil else p115.place_id,
		ctx = if p115 == nil or p115.ctx == nil then nil else p115.ctx
	}, t_115)
end

function t_115:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2303 = 0
	
	if self.universe_id ~= nil then
		local var2304 = self.universe_id:encode()
		local var2305, var2306 = protoModule.writeTag(buff, var2303, 1, protoModule.wireTypes.lengthDelimited)
		var2305, var3797 = protoModule.writeBuffer(var2305, var2306, var2304, buffer.len(var2304))
		buff = var2305
		var2303 = var2306
	end
	if self.vote_direction ~= nil then
		local var2307 = self.vote_direction:encode()
		local var2308, var2309 = protoModule.writeTag(buff, var2303, 2, protoModule.wireTypes.lengthDelimited)
		var2308, var3800 = protoModule.writeBuffer(var2308, var2309, var2307, buffer.len(var2307))
		buff = var2308
		var2303 = var2309
	end
	if self.place_id ~= nil then
		local var2310 = self.place_id:encode()
		local var2311, var2312 = protoModule.writeTag(buff, var2303, 3, protoModule.wireTypes.lengthDelimited)
		var2311, var3803 = protoModule.writeBuffer(var2311, var2312, var2310, buffer.len(var2310))
		buff = var2311
		var2303 = var2312
	end
	if self.ctx ~= nil then
		local var2313 = self.ctx:encode()
		local var2314, var2315 = protoModule.writeTag(buff, var2303, 4, protoModule.wireTypes.lengthDelimited)
		var2314, var3806 = protoModule.writeBuffer(var2314, var2315, var2313, buffer.len(var2313))
		buff = var2314
		var2303 = var2315
	end
	local buff_1 = buffer.create(var2303)
	buffer.copy(buff_1, 0, buff, 0, var2303)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref), propTypesModule (ref)
	local var2303 = t_115.new()
	local var2304 = 0
	while var2304 < buffer.len(p115) do
		local _ = nil
		local var2305 = nil
		local var2306, var2307, var2308 = protoModule.readTag(p115, var2304)
		local var2309 = var2306
		var2305 = var2307
		var2304 = var2308
		
		if var2305 == protoModule.wireTypes.varint then
			local _ = nil
			local var2310, var2311 = protoModule.readVarInt(p115, var2304)
			local _ = var2310
			var2304 = var2311
			continue
		end
		if var2305 == protoModule.wireTypes.lengthDelimited then
			if var2309 == 1 then
				local _ = nil
				local var2312, var2313 = protoModule.readBuffer(p115, var2304)
				var2304 = var2313
				var2303.universe_id = propTypesModule.StringProp.decode(var2312)
			elseif var2309 == 2 then
				local _ = nil
				local var2314, var2315 = protoModule.readBuffer(p115, var2304)
				var2304 = var2315
				var2303.vote_direction = propTypesModule.BoolProp.decode(var2314)
			elseif var2309 == 3 then
				local _ = nil
				local var2316, var2317 = protoModule.readBuffer(p115, var2304)
				var2304 = var2317
				var2303.place_id = propTypesModule.StringProp.decode(var2316)
			elseif var2309 == 4 then
				local _ = nil
				local var2318, var2319 = protoModule.readBuffer(p115, var2304)
				var2304 = var2319
				var2303.ctx = propTypesModule.StringProp.decode(var2318)
			else
				local _ = nil
				local var2320, var2321 = protoModule.readVarInt(p115, var2304)
				var2304 = var2321 + var2320
			end
		elseif var2305 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2322, var2323 = protoModule.readFixed32(p115, var2304)
			local _ = var2322
			var2304 = var2323
		elseif var2305 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2324, var2325 = protoModule.readFixed64(p115, var2304)
			local _ = var2324
			var2304 = var2325
		else
			error("Unsupported wire type: " .. var3810)
		end
	end
	return var2303
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
	local var2326 = t_115.new()
	
	if self.universe_id ~= nil then
		var2326.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2326.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.vote_direction ~= nil then
		var2326.vote_direction = propTypesModule.BoolProp.jsonDecode(self.vote_direction)
	end
	if self.voteDirection ~= nil then
		var2326.vote_direction = propTypesModule.BoolProp.jsonDecode(self.voteDirection)
	end
	if self.place_id ~= nil then
		var2326.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var2326.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		var2326.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var2326
end

t_115.descriptor = {
	name = "ToggleExperienceVoteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceVoteAction_Params = t_115
typeRegistryModule.default:register(t.ToggleExperienceVoteAction_Params)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p116)
	-- upvalues: t (ref), t_116 (ref)
	return setmetatable({
		action_type = if p116 == nil or p116.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p116.action_type,
		action_params = if p116 == nil or p116.action_params == nil then nil else p116.action_params
	}, t_116)
end

function t_116:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2326 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2327, var2328 = protoModule.writeTag(buff, var2326, 1, protoModule.wireTypes.varint)
		var2327, var3836 = protoModule.writeVarInt(var2327, var2328, t.ActionType.toNumber(self.action_type))
		buff = var2327
		var2326 = var2328
	end
	if self.action_params ~= nil then
		local var2329 = self.action_params:encode()
		local var2330, var2331 = protoModule.writeTag(buff, var2326, 2, protoModule.wireTypes.lengthDelimited)
		var2330, var3839 = protoModule.writeBuffer(var2330, var2331, var2329, buffer.len(var2329))
		buff = var2330
		var2326 = var2331
	end
	local buff_1 = buffer.create(var2326)
	buffer.copy(buff_1, 0, buff, 0, var2326)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref), t (ref)
	local var2326 = t_116.new()
	local var2327 = 0
	while var2327 < buffer.len(p116) do
		local _ = nil
		local var2328 = nil
		local var2329, var2330, var2331 = protoModule.readTag(p116, var2327)
		local var2332 = var2329
		var2328 = var2330
		var2327 = var2331
		
		if var2328 == protoModule.wireTypes.varint then
			if var2332 == 1 then
				local _ = nil
				local var2333, var2334 = protoModule.readVarIntI32(p116, var2327)
				local var2335 = var2333
				var2327 = var2334
				var2326.action_type = t.ActionType.fromNumber(var2335) or var2335
			else
				local _ = nil
				local var2336, var2337 = protoModule.readVarInt(p116, var2327)
				local _ = var2336
				var2327 = var2337
			end
		end
		if var2328 == protoModule.wireTypes.lengthDelimited then
			if var2332 == 2 then
				local _ = nil
				local var2338, var2339 = protoModule.readBuffer(p116, var2327)
				var2327 = var2339
				var2326.action_params = t.OpenPurchasePromptAction_Params.decode(var2338)
			else
				local _ = nil
				local var2340, var2341 = protoModule.readVarInt(p116, var2327)
				var2327 = var2341 + var2340
			end
		elseif var2328 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2342, var2343 = protoModule.readFixed32(p116, var2327)
			local _ = var2342
			var2327 = var2343
		elseif var2328 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2344, var2345 = protoModule.readFixed64(p116, var2327)
			local _ = var2344
			var2327 = var2345
		else
			error("Unsupported wire type: " .. var3843)
		end
	end
	return var2326
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
	local var2346 = t_116.new()
	
	if self.action_type ~= nil then
		var2346.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2346.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2346.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2346.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.actionParams)
	end
	return var2346
end

t_116.descriptor = {
	name = "OpenPurchasePromptAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenPurchasePromptAction"
}
t.OpenPurchasePromptAction = t_116
typeRegistryModule.default:register(t.OpenPurchasePromptAction)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p117)
	-- upvalues: t_117 (ref)
	return setmetatable({
		kind = if p117 == nil or p117.kind == nil then nil else p117.kind
	}, t_117)
end

function t_117:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2346 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2347 = self.kind.value:encode()
			local var2348, var2349 = protoModule.writeTag(buff, var2346, 1, protoModule.wireTypes.lengthDelimited)
			var2348, var3867 = protoModule.writeBuffer(var2348, var2349, var2347, buffer.len(var2347))
			buff = var2348
			var2346 = var2349
		elseif self.kind.type == "binding_path" then
			local var2350, var2351 = protoModule.writeTag(buff, var2346, 2, protoModule.wireTypes.lengthDelimited)
			var2350, var3869 = protoModule.writeString(var2350, var2351, self.kind.value)
			buff = var2350
			var2346 = var2351
		end
	end
	local buff_1 = buffer.create(var2346)
	buffer.copy(buff_1, 0, buff, 0, var2346)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref), t (ref)
	local var2346 = t_117.new()
	local var2347 = 0
	while var2347 < buffer.len(p117) do
		local _ = nil
		local var2348 = nil
		local var2349, var2350, var2351 = protoModule.readTag(p117, var2347)
		local var2352 = var2349
		var2348 = var2350
		var2347 = var2351
		
		if var2348 == protoModule.wireTypes.varint then
			local _ = nil
			local var2353, var2354 = protoModule.readVarInt(p117, var2347)
			local _ = var2353
			var2347 = var2354
			continue
		end
		if var2348 == protoModule.wireTypes.lengthDelimited then
			if var2352 == 1 then
				local _ = nil
				local var2355, var2356 = protoModule.readBuffer(p117, var2347)
				var2347 = var2356
				var2346.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.decode(var2355)
				}
			elseif var2352 == 2 then
				local _ = nil
				local var2357, var2358 = protoModule.readBuffer(p117, var2347)
				var2347 = var2358
				var2346.kind = { type = "binding_path", value = buffer.tostring(var2357) }
			else
				local _ = nil
				local var2359, var2360 = protoModule.readVarInt(p117, var2347)
				var2347 = var2360 + var2359
			end
		elseif var2348 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2361, var2362 = protoModule.readFixed32(p117, var2347)
			local _ = var2361
			var2347 = var2362
		elseif var2348 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2363, var2364 = protoModule.readFixed64(p117, var2347)
			local _ = var2363
			var2347 = var2364
		else
			error("Unsupported wire type: " .. var3873)
		end
	end
	return var2346
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
	local var2365 = t_117.new()
	
	if self.literal ~= nil then
		var2365.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2365.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2365.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2365
end

t_117.descriptor = {
	name = "OpenPurchasePromptAction_ProductPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ProductPayload"
}
t.OpenPurchasePromptAction_ProductPayload = t_117
typeRegistryModule.default:register(t.OpenPurchasePromptAction_ProductPayload)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p118)
	-- upvalues: t_118 (ref)
	return setmetatable({
		kind = if p118 == nil or p118.kind == nil then nil else p118.kind,
		id = if p118 == nil or p118.id == nil then nil else p118.id,
		subscription_id = if p118 == nil or p118.subscription_id == nil then nil else p118.subscription_id,
		universe_id = if p118 == nil or p118.universe_id == nil then nil else p118.universe_id,
		equip_if_purchased = if p118 == nil or p118.equip_if_purchased == nil then nil else p118.equip_if_purchased,
		name = if p118 == nil or p118.name == nil then nil else p118.name,
		expected_price = if p118 == nil or p118.expected_price == nil then nil else p118.expected_price,
		icon_image_asset_id = if p118 == nil or p118.icon_image_asset_id == nil then nil else p118.icon_image_asset_id,
		is_subscription_in_robux = if p118 == nil or p118.is_subscription_in_robux == nil then nil else p118.is_subscription_in_robux,
		display_price = if p118 == nil or p118.display_price == nil then nil else p118.display_price
	}, t_118)
end

function t_118:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2365 = 0
	
	if self.kind ~= nil then
		local var2366 = self.kind:encode()
		local var2367, var2368 = protoModule.writeTag(buff, var2365, 1, protoModule.wireTypes.lengthDelimited)
		var2367, var3896 = protoModule.writeBuffer(var2367, var2368, var2366, buffer.len(var2366))
		buff = var2367
		var2365 = var2368
	end
	if self.id ~= nil then
		local var2369 = self.id:encode()
		local var2370, var2371 = protoModule.writeTag(buff, var2365, 2, protoModule.wireTypes.lengthDelimited)
		var2370, var3899 = protoModule.writeBuffer(var2370, var2371, var2369, buffer.len(var2369))
		buff = var2370
		var2365 = var2371
	end
	if self.subscription_id ~= nil then
		local var2372 = self.subscription_id:encode()
		local var2373, var2374 = protoModule.writeTag(buff, var2365, 3, protoModule.wireTypes.lengthDelimited)
		var2373, var3902 = protoModule.writeBuffer(var2373, var2374, var2372, buffer.len(var2372))
		buff = var2373
		var2365 = var2374
	end
	if self.universe_id ~= nil then
		local var2375 = self.universe_id:encode()
		local var2376, var2377 = protoModule.writeTag(buff, var2365, 4, protoModule.wireTypes.lengthDelimited)
		var2376, var3905 = protoModule.writeBuffer(var2376, var2377, var2375, buffer.len(var2375))
		buff = var2376
		var2365 = var2377
	end
	if self.equip_if_purchased ~= nil then
		local var2378 = self.equip_if_purchased:encode()
		local var2379, var2380 = protoModule.writeTag(buff, var2365, 5, protoModule.wireTypes.lengthDelimited)
		var2379, var3908 = protoModule.writeBuffer(var2379, var2380, var2378, buffer.len(var2378))
		buff = var2379
		var2365 = var2380
	end
	if self.name ~= nil then
		local var2381 = self.name:encode()
		local var2382, var2383 = protoModule.writeTag(buff, var2365, 6, protoModule.wireTypes.lengthDelimited)
		var2382, var3911 = protoModule.writeBuffer(var2382, var2383, var2381, buffer.len(var2381))
		buff = var2382
		var2365 = var2383
	end
	if self.expected_price ~= nil then
		local var2384 = self.expected_price:encode()
		local var2385, var2386 = protoModule.writeTag(buff, var2365, 7, protoModule.wireTypes.lengthDelimited)
		var2385, var3914 = protoModule.writeBuffer(var2385, var2386, var2384, buffer.len(var2384))
		buff = var2385
		var2365 = var2386
	end
	if self.icon_image_asset_id ~= nil then
		local var2387 = self.icon_image_asset_id:encode()
		local var2388, var2389 = protoModule.writeTag(buff, var2365, 8, protoModule.wireTypes.lengthDelimited)
		var2388, var3917 = protoModule.writeBuffer(var2388, var2389, var2387, buffer.len(var2387))
		buff = var2388
		var2365 = var2389
	end
	if self.is_subscription_in_robux ~= nil then
		local var2390 = self.is_subscription_in_robux:encode()
		local var2391, var2392 = protoModule.writeTag(buff, var2365, 9, protoModule.wireTypes.lengthDelimited)
		var2391, var3920 = protoModule.writeBuffer(var2391, var2392, var2390, buffer.len(var2390))
		buff = var2391
		var2365 = var2392
	end
	if self.display_price ~= nil then
		local var2393 = self.display_price:encode()
		local var2394, var2395 = protoModule.writeTag(buff, var2365, 10, protoModule.wireTypes.lengthDelimited)
		var2394, var3923 = protoModule.writeBuffer(var2394, var2395, var2393, buffer.len(var2393))
		buff = var2394
		var2365 = var2395
	end
	local buff_1 = buffer.create(var2365)
	buffer.copy(buff_1, 0, buff, 0, var2365)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref), propTypesModule (ref)
	local var2365 = t_118.new()
	local var2366 = 0
	while var2366 < buffer.len(p118) do
		local _ = nil
		local var2367 = nil
		local var2368, var2369, var2370 = protoModule.readTag(p118, var2366)
		local var2371 = var2368
		var2367 = var2369
		var2366 = var2370
		
		if var2367 == protoModule.wireTypes.varint then
			local _ = nil
			local var2372, var2373 = protoModule.readVarInt(p118, var2366)
			local _ = var2372
			var2366 = var2373
			continue
		end
		if var2367 == protoModule.wireTypes.lengthDelimited then
			if var2371 == 1 then
				local _ = nil
				local var2374, var2375 = protoModule.readBuffer(p118, var2366)
				var2366 = var2375
				var2365.kind = propTypesModule.StringProp.decode(var2374)
			elseif var2371 == 2 then
				local _ = nil
				local var2376, var2377 = protoModule.readBuffer(p118, var2366)
				var2366 = var2377
				var2365.id = propTypesModule.StringProp.decode(var2376)
			elseif var2371 == 3 then
				local _ = nil
				local var2378, var2379 = protoModule.readBuffer(p118, var2366)
				var2366 = var2379
				var2365.subscription_id = propTypesModule.StringProp.decode(var2378)
			elseif var2371 == 4 then
				local _ = nil
				local var2380, var2381 = protoModule.readBuffer(p118, var2366)
				var2366 = var2381
				var2365.universe_id = propTypesModule.StringProp.decode(var2380)
			elseif var2371 == 5 then
				local _ = nil
				local var2382, var2383 = protoModule.readBuffer(p118, var2366)
				var2366 = var2383
				var2365.equip_if_purchased = propTypesModule.BoolProp.decode(var2382)
			elseif var2371 == 6 then
				local _ = nil
				local var2384, var2385 = protoModule.readBuffer(p118, var2366)
				var2366 = var2385
				var2365.name = propTypesModule.StringProp.decode(var2384)
			elseif var2371 == 7 then
				local _ = nil
				local var2386, var2387 = protoModule.readBuffer(p118, var2366)
				var2366 = var2387
				var2365.expected_price = propTypesModule.Int64Prop.decode(var2386)
			elseif var2371 == 8 then
				local _ = nil
				local var2388, var2389 = protoModule.readBuffer(p118, var2366)
				var2366 = var2389
				var2365.icon_image_asset_id = propTypesModule.Int64Prop.decode(var2388)
			elseif var2371 == 9 then
				local _ = nil
				local var2390, var2391 = protoModule.readBuffer(p118, var2366)
				var2366 = var2391
				var2365.is_subscription_in_robux = propTypesModule.BoolProp.decode(var2390)
			elseif var2371 == 10 then
				local _ = nil
				local var2392, var2393 = protoModule.readBuffer(p118, var2366)
				var2366 = var2393
				var2365.display_price = propTypesModule.StringProp.decode(var2392)
			else
				local _ = nil
				local var2394, var2395 = protoModule.readVarInt(p118, var2366)
				var2366 = var2395 + var2394
			end
		elseif var2367 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2396, var2397 = protoModule.readFixed32(p118, var2366)
			local _ = var2396
			var2366 = var2397
		elseif var2367 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2398, var2399 = protoModule.readFixed64(p118, var2366)
			local _ = var2398
			var2366 = var2399
		else
			error("Unsupported wire type: " .. var3927)
		end
	end
	return var2365
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
	local var2400 = t_118.new()
	
	if self.kind ~= nil then
		var2400.kind = propTypesModule.StringProp.jsonDecode(self.kind)
	end
	if self.id ~= nil then
		var2400.id = propTypesModule.StringProp.jsonDecode(self.id)
	end
	if self.subscription_id ~= nil then
		var2400.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		var2400.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		var2400.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2400.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.equip_if_purchased ~= nil then
		var2400.equip_if_purchased = propTypesModule.BoolProp.jsonDecode(self.equip_if_purchased)
	end
	if self.equipIfPurchased ~= nil then
		var2400.equip_if_purchased = propTypesModule.BoolProp.jsonDecode(self.equipIfPurchased)
	end
	if self.name ~= nil then
		var2400.name = propTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.expected_price ~= nil then
		var2400.expected_price = propTypesModule.Int64Prop.jsonDecode(self.expected_price)
	end
	if self.expectedPrice ~= nil then
		var2400.expected_price = propTypesModule.Int64Prop.jsonDecode(self.expectedPrice)
	end
	if self.icon_image_asset_id ~= nil then
		var2400.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		var2400.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.is_subscription_in_robux ~= nil then
		var2400.is_subscription_in_robux = propTypesModule.BoolProp.jsonDecode(self.is_subscription_in_robux)
	end
	if self.isSubscriptionInRobux ~= nil then
		var2400.is_subscription_in_robux = propTypesModule.BoolProp.jsonDecode(self.isSubscriptionInRobux)
	end
	if self.display_price ~= nil then
		var2400.display_price = propTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		var2400.display_price = propTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	return var2400
end

t_118.descriptor = {
	name = "OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.ProductPayloadLiteral"
}
t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral = t_118
typeRegistryModule.default:register(t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p119)
	-- upvalues: t_119 (ref)
	return setmetatable({
		kind = if p119 == nil or p119.kind == nil then nil else p119.kind
	}, t_119)
end

function t_119:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2400 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2401 = self.kind.value:encode()
			local var2402, var2403 = protoModule.writeTag(buff, var2400, 1, protoModule.wireTypes.lengthDelimited)
			var2402, var3966 = protoModule.writeBuffer(var2402, var2403, var2401, buffer.len(var2401))
			buff = var2402
			var2400 = var2403
		elseif self.kind.type == "binding_path" then
			local var2404, var2405 = protoModule.writeTag(buff, var2400, 2, protoModule.wireTypes.lengthDelimited)
			var2404, var3968 = protoModule.writeString(var2404, var2405, self.kind.value)
			buff = var2404
			var2400 = var2405
		end
	end
	local buff_1 = buffer.create(var2400)
	buffer.copy(buff_1, 0, buff, 0, var2400)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref), t (ref)
	local var2400 = t_119.new()
	local var2401 = 0
	while var2401 < buffer.len(p119) do
		local _ = nil
		local var2402 = nil
		local var2403, var2404, var2405 = protoModule.readTag(p119, var2401)
		local var2406 = var2403
		var2402 = var2404
		var2401 = var2405
		
		if var2402 == protoModule.wireTypes.varint then
			local _ = nil
			local var2407, var2408 = protoModule.readVarInt(p119, var2401)
			local _ = var2407
			var2401 = var2408
			continue
		end
		if var2402 == protoModule.wireTypes.lengthDelimited then
			if var2406 == 1 then
				local _ = nil
				local var2409, var2410 = protoModule.readBuffer(p119, var2401)
				var2401 = var2410
				var2400.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.decode(var2409)
				}
			elseif var2406 == 2 then
				local _ = nil
				local var2411, var2412 = protoModule.readBuffer(p119, var2401)
				var2401 = var2412
				var2400.kind = { type = "binding_path", value = buffer.tostring(var2411) }
			else
				local _ = nil
				local var2413, var2414 = protoModule.readVarInt(p119, var2401)
				var2401 = var2414 + var2413
			end
		elseif var2402 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2415, var2416 = protoModule.readFixed32(p119, var2401)
			local _ = var2415
			var2401 = var2416
		elseif var2402 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2417, var2418 = protoModule.readFixed64(p119, var2401)
			local _ = var2417
			var2401 = var2418
		else
			error("Unsupported wire type: " .. var3972)
		end
	end
	return var2400
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
	local var2419 = t_119.new()
	
	if self.literal ~= nil then
		var2419.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2419.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2419.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2419
end

t_119.descriptor = {
	name = "OpenPurchasePromptAction_DisplayInfo",
	fullName = "roblox.apppageplatform.shared.v1beta1.DisplayInfo"
}
t.OpenPurchasePromptAction_DisplayInfo = t_119
typeRegistryModule.default:register(t.OpenPurchasePromptAction_DisplayInfo)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p120)
	-- upvalues: t_120 (ref)
	return setmetatable({
		product_name = if p120 == nil or p120.product_name == nil then nil else p120.product_name,
		description = if p120 == nil or p120.description == nil then nil else p120.description,
		image_url = if p120 == nil or p120.image_url == nil then nil else p120.image_url,
		price_in_robux = if p120 == nil or p120.price_in_robux == nil then nil else p120.price_in_robux,
		display_price = if p120 == nil or p120.display_price == nil then nil else p120.display_price,
		icon_image_asset_id = if p120 == nil or p120.icon_image_asset_id == nil then nil else p120.icon_image_asset_id,
		product_id = if p120 == nil or p120.product_id == nil then nil else p120.product_id,
		target_id = if p120 == nil or p120.target_id == nil then nil else p120.target_id,
		is_for_sale = if p120 == nil or p120.is_for_sale == nil then nil else p120.is_for_sale,
		product_type = if p120 == nil or p120.product_type == nil then nil else p120.product_type,
		base_price_in_robux = if p120 == nil or p120.base_price_in_robux == nil then nil else p120.base_price_in_robux,
		price_discount_details = if p120 == nil or p120.price_discount_details == nil then nil else p120.price_discount_details
	}, t_120)
end

function t_120:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2419 = 0
	
	if self.product_name ~= nil then
		local var2420 = self.product_name:encode()
		local var2421, var2422 = protoModule.writeTag(buff, var2419, 1, protoModule.wireTypes.lengthDelimited)
		var2421, var3995 = protoModule.writeBuffer(var2421, var2422, var2420, buffer.len(var2420))
		buff = var2421
		var2419 = var2422
	end
	if self.description ~= nil then
		local var2423 = self.description:encode()
		local var2424, var2425 = protoModule.writeTag(buff, var2419, 2, protoModule.wireTypes.lengthDelimited)
		var2424, var3998 = protoModule.writeBuffer(var2424, var2425, var2423, buffer.len(var2423))
		buff = var2424
		var2419 = var2425
	end
	if self.image_url ~= nil then
		local var2426 = self.image_url:encode()
		local var2427, var2428 = protoModule.writeTag(buff, var2419, 3, protoModule.wireTypes.lengthDelimited)
		var2427, var4001 = protoModule.writeBuffer(var2427, var2428, var2426, buffer.len(var2426))
		buff = var2427
		var2419 = var2428
	end
	if self.price_in_robux ~= nil then
		local var2429 = self.price_in_robux:encode()
		local var2430, var2431 = protoModule.writeTag(buff, var2419, 4, protoModule.wireTypes.lengthDelimited)
		var2430, var4004 = protoModule.writeBuffer(var2430, var2431, var2429, buffer.len(var2429))
		buff = var2430
		var2419 = var2431
	end
	if self.display_price ~= nil then
		local var2432 = self.display_price:encode()
		local var2433, var2434 = protoModule.writeTag(buff, var2419, 5, protoModule.wireTypes.lengthDelimited)
		var2433, var4007 = protoModule.writeBuffer(var2433, var2434, var2432, buffer.len(var2432))
		buff = var2433
		var2419 = var2434
	end
	if self.icon_image_asset_id ~= nil then
		local var2435 = self.icon_image_asset_id:encode()
		local var2436, var2437 = protoModule.writeTag(buff, var2419, 6, protoModule.wireTypes.lengthDelimited)
		var2436, var4010 = protoModule.writeBuffer(var2436, var2437, var2435, buffer.len(var2435))
		buff = var2436
		var2419 = var2437
	end
	if self.product_id ~= nil then
		local var2438 = self.product_id:encode()
		local var2439, var2440 = protoModule.writeTag(buff, var2419, 7, protoModule.wireTypes.lengthDelimited)
		var2439, var4013 = protoModule.writeBuffer(var2439, var2440, var2438, buffer.len(var2438))
		buff = var2439
		var2419 = var2440
	end
	if self.target_id ~= nil then
		local var2441 = self.target_id:encode()
		local var2442, var2443 = protoModule.writeTag(buff, var2419, 8, protoModule.wireTypes.lengthDelimited)
		var2442, var4016 = protoModule.writeBuffer(var2442, var2443, var2441, buffer.len(var2441))
		buff = var2442
		var2419 = var2443
	end
	if self.is_for_sale ~= nil then
		local var2444 = self.is_for_sale:encode()
		local var2445, var2446 = protoModule.writeTag(buff, var2419, 9, protoModule.wireTypes.lengthDelimited)
		var2445, var4019 = protoModule.writeBuffer(var2445, var2446, var2444, buffer.len(var2444))
		buff = var2445
		var2419 = var2446
	end
	if self.product_type ~= nil then
		local var2447 = self.product_type:encode()
		local var2448, var2449 = protoModule.writeTag(buff, var2419, 10, protoModule.wireTypes.lengthDelimited)
		var2448, var4022 = protoModule.writeBuffer(var2448, var2449, var2447, buffer.len(var2447))
		buff = var2448
		var2419 = var2449
	end
	if self.base_price_in_robux ~= nil then
		local var2450 = self.base_price_in_robux:encode()
		local var2451, var2452 = protoModule.writeTag(buff, var2419, 11, protoModule.wireTypes.lengthDelimited)
		var2451, var4025 = protoModule.writeBuffer(var2451, var2452, var2450, buffer.len(var2450))
		buff = var2451
		var2419 = var2452
	end
	if self.price_discount_details ~= nil then
		local var2453 = self.price_discount_details:encode()
		local var2454, var2455 = protoModule.writeTag(buff, var2419, 12, protoModule.wireTypes.lengthDelimited)
		var2454, var4028 = protoModule.writeBuffer(var2454, var2455, var2453, buffer.len(var2453))
		buff = var2454
		var2419 = var2455
	end
	local buff_1 = buffer.create(var2419)
	buffer.copy(buff_1, 0, buff, 0, var2419)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref), propTypesModule (ref)
	local var2419 = t_120.new()
	local var2420 = 0
	while var2420 < buffer.len(p120) do
		local _ = nil
		local var2421 = nil
		local var2422, var2423, var2424 = protoModule.readTag(p120, var2420)
		local var2425 = var2422
		var2421 = var2423
		var2420 = var2424
		
		if var2421 == protoModule.wireTypes.varint then
			local _ = nil
			local var2426, var2427 = protoModule.readVarInt(p120, var2420)
			local _ = var2426
			var2420 = var2427
			continue
		end
		if var2421 == protoModule.wireTypes.lengthDelimited then
			if var2425 == 1 then
				local _ = nil
				local var2428, var2429 = protoModule.readBuffer(p120, var2420)
				var2420 = var2429
				var2419.product_name = propTypesModule.StringProp.decode(var2428)
			elseif var2425 == 2 then
				local _ = nil
				local var2430, var2431 = protoModule.readBuffer(p120, var2420)
				var2420 = var2431
				var2419.description = propTypesModule.StringProp.decode(var2430)
			elseif var2425 == 3 then
				local _ = nil
				local var2432, var2433 = protoModule.readBuffer(p120, var2420)
				var2420 = var2433
				var2419.image_url = propTypesModule.StringProp.decode(var2432)
			elseif var2425 == 4 then
				local _ = nil
				local var2434, var2435 = protoModule.readBuffer(p120, var2420)
				var2420 = var2435
				var2419.price_in_robux = propTypesModule.Int64Prop.decode(var2434)
			elseif var2425 == 5 then
				local _ = nil
				local var2436, var2437 = protoModule.readBuffer(p120, var2420)
				var2420 = var2437
				var2419.display_price = propTypesModule.StringProp.decode(var2436)
			elseif var2425 == 6 then
				local _ = nil
				local var2438, var2439 = protoModule.readBuffer(p120, var2420)
				var2420 = var2439
				var2419.icon_image_asset_id = propTypesModule.Int64Prop.decode(var2438)
			elseif var2425 == 7 then
				local _ = nil
				local var2440, var2441 = protoModule.readBuffer(p120, var2420)
				var2420 = var2441
				var2419.product_id = propTypesModule.Int64Prop.decode(var2440)
			elseif var2425 == 8 then
				local _ = nil
				local var2442, var2443 = protoModule.readBuffer(p120, var2420)
				var2420 = var2443
				var2419.target_id = propTypesModule.StringProp.decode(var2442)
			elseif var2425 == 9 then
				local _ = nil
				local var2444, var2445 = protoModule.readBuffer(p120, var2420)
				var2420 = var2445
				var2419.is_for_sale = propTypesModule.BoolProp.decode(var2444)
			elseif var2425 == 10 then
				local _ = nil
				local var2446, var2447 = protoModule.readBuffer(p120, var2420)
				var2420 = var2447
				var2419.product_type = propTypesModule.StringProp.decode(var2446)
			elseif var2425 == 11 then
				local _ = nil
				local var2448, var2449 = protoModule.readBuffer(p120, var2420)
				var2420 = var2449
				var2419.base_price_in_robux = propTypesModule.Int64Prop.decode(var2448)
			elseif var2425 == 12 then
				local _ = nil
				local var2450, var2451 = protoModule.readBuffer(p120, var2420)
				var2420 = var2451
				var2419.price_discount_details = propTypesModule.ArrayOfStructProp.decode(var2450)
			else
				local _ = nil
				local var2452, var2453 = protoModule.readVarInt(p120, var2420)
				var2420 = var2453 + var2452
			end
		elseif var2421 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2454, var2455 = protoModule.readFixed32(p120, var2420)
			local _ = var2454
			var2420 = var2455
		elseif var2421 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2456, var2457 = protoModule.readFixed64(p120, var2420)
			local _ = var2456
			var2420 = var2457
		else
			error("Unsupported wire type: " .. var4032)
		end
	end
	return var2419
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
	local var2458 = t_120.new()
	
	if self.product_name ~= nil then
		var2458.product_name = propTypesModule.StringProp.jsonDecode(self.product_name)
	end
	if self.productName ~= nil then
		var2458.product_name = propTypesModule.StringProp.jsonDecode(self.productName)
	end
	if self.description ~= nil then
		var2458.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_url ~= nil then
		var2458.image_url = propTypesModule.StringProp.jsonDecode(self.image_url)
	end
	if self.imageUrl ~= nil then
		var2458.image_url = propTypesModule.StringProp.jsonDecode(self.imageUrl)
	end
	if self.price_in_robux ~= nil then
		var2458.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		var2458.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.display_price ~= nil then
		var2458.display_price = propTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		var2458.display_price = propTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	if self.icon_image_asset_id ~= nil then
		var2458.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		var2458.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.product_id ~= nil then
		var2458.product_id = propTypesModule.Int64Prop.jsonDecode(self.product_id)
	end
	if self.productId ~= nil then
		var2458.product_id = propTypesModule.Int64Prop.jsonDecode(self.productId)
	end
	if self.target_id ~= nil then
		var2458.target_id = propTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		var2458.target_id = propTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.is_for_sale ~= nil then
		var2458.is_for_sale = propTypesModule.BoolProp.jsonDecode(self.is_for_sale)
	end
	if self.isForSale ~= nil then
		var2458.is_for_sale = propTypesModule.BoolProp.jsonDecode(self.isForSale)
	end
	if self.product_type ~= nil then
		var2458.product_type = propTypesModule.StringProp.jsonDecode(self.product_type)
	end
	if self.productType ~= nil then
		var2458.product_type = propTypesModule.StringProp.jsonDecode(self.productType)
	end
	if self.base_price_in_robux ~= nil then
		var2458.base_price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.base_price_in_robux)
	end
	if self.basePriceInRobux ~= nil then
		var2458.base_price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.basePriceInRobux)
	end
	if self.price_discount_details ~= nil then
		var2458.price_discount_details = propTypesModule.ArrayOfStructProp.jsonDecode(self.price_discount_details)
	end
	if self.priceDiscountDetails ~= nil then
		var2458.price_discount_details = propTypesModule.ArrayOfStructProp.jsonDecode(self.priceDiscountDetails)
	end
	return var2458
end

t_120.descriptor = {
	name = "OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.DisplayInfoLiteral"
}
t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral = t_120
typeRegistryModule.default:register(t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p121)
	-- upvalues: t_121 (ref)
	return setmetatable({
		kind = if p121 == nil or p121.kind == nil then nil else p121.kind
	}, t_121)
end

function t_121:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2458 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2459 = self.kind.value:encode()
			local var2460, var2461 = protoModule.writeTag(buff, var2458, 1, protoModule.wireTypes.lengthDelimited)
			var2460, var4075 = protoModule.writeBuffer(var2460, var2461, var2459, buffer.len(var2459))
			buff = var2460
			var2458 = var2461
		elseif self.kind.type == "binding_path" then
			local var2462, var2463 = protoModule.writeTag(buff, var2458, 2, protoModule.wireTypes.lengthDelimited)
			var2462, var4077 = protoModule.writeString(var2462, var2463, self.kind.value)
			buff = var2462
			var2458 = var2463
		end
	end
	local buff_1 = buffer.create(var2458)
	buffer.copy(buff_1, 0, buff, 0, var2458)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var2458 = t_121.new()
	local var2459 = 0
	while var2459 < buffer.len(p121) do
		local _ = nil
		local var2460 = nil
		local var2461, var2462, var2463 = protoModule.readTag(p121, var2459)
		local var2464 = var2461
		var2460 = var2462
		var2459 = var2463
		
		if var2460 == protoModule.wireTypes.varint then
			local _ = nil
			local var2465, var2466 = protoModule.readVarInt(p121, var2459)
			local _ = var2465
			var2459 = var2466
			continue
		end
		if var2460 == protoModule.wireTypes.lengthDelimited then
			if var2464 == 1 then
				local _ = nil
				local var2467, var2468 = protoModule.readBuffer(p121, var2459)
				var2459 = var2468
				var2458.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.decode(var2467)
				}
			elseif var2464 == 2 then
				local _ = nil
				local var2469, var2470 = protoModule.readBuffer(p121, var2459)
				var2459 = var2470
				var2458.kind = { type = "binding_path", value = buffer.tostring(var2469) }
			else
				local _ = nil
				local var2471, var2472 = protoModule.readVarInt(p121, var2459)
				var2459 = var2472 + var2471
			end
		elseif var2460 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2473, var2474 = protoModule.readFixed32(p121, var2459)
			local _ = var2473
			var2459 = var2474
		elseif var2460 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2475, var2476 = protoModule.readFixed64(p121, var2459)
			local _ = var2475
			var2459 = var2476
		else
			error("Unsupported wire type: " .. var4081)
		end
	end
	return var2458
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
	local var2477 = t_121.new()
	
	if self.literal ~= nil then
		var2477.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2477.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2477.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2477
end

t_121.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseOptions"
}
t.OpenPurchasePromptAction_PurchaseOptions = t_121
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseOptions)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p122)
	-- upvalues: t_122 (ref)
	return setmetatable({
		should_skip_ownership_check = if p122 == nil or p122.should_skip_ownership_check == nil then nil else p122.should_skip_ownership_check,
		enable_preloaded_purchase_ui = if p122 == nil or p122.enable_preloaded_purchase_ui == nil then nil else p122.enable_preloaded_purchase_ui,
		completion_message = if p122 == nil or p122.completion_message == nil then nil else p122.completion_message,
		completion_button_text = if p122 == nil or p122.completion_button_text == nil then nil else p122.completion_button_text,
		prevent_double_confirm = if p122 == nil or p122.prevent_double_confirm == nil then nil else p122.prevent_double_confirm,
		provided_robux_balance = if p122 == nil or p122.provided_robux_balance == nil then nil else p122.provided_robux_balance,
		launch_after_purchase_root_place_id = if p122 == nil or p122.launch_after_purchase_root_place_id == nil then nil else p122.launch_after_purchase_root_place_id
	}, t_122)
end

function t_122:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2477 = 0
	
	if self.should_skip_ownership_check ~= nil then
		local var2478 = self.should_skip_ownership_check:encode()
		local var2479, var2480 = protoModule.writeTag(buff, var2477, 1, protoModule.wireTypes.lengthDelimited)
		var2479, var4104 = protoModule.writeBuffer(var2479, var2480, var2478, buffer.len(var2478))
		buff = var2479
		var2477 = var2480
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		local var2481 = self.enable_preloaded_purchase_ui:encode()
		local var2482, var2483 = protoModule.writeTag(buff, var2477, 2, protoModule.wireTypes.lengthDelimited)
		var2482, var4107 = protoModule.writeBuffer(var2482, var2483, var2481, buffer.len(var2481))
		buff = var2482
		var2477 = var2483
	end
	if self.completion_message ~= nil then
		local var2484 = self.completion_message:encode()
		local var2485, var2486 = protoModule.writeTag(buff, var2477, 3, protoModule.wireTypes.lengthDelimited)
		var2485, var4110 = protoModule.writeBuffer(var2485, var2486, var2484, buffer.len(var2484))
		buff = var2485
		var2477 = var2486
	end
	if self.completion_button_text ~= nil then
		local var2487 = self.completion_button_text:encode()
		local var2488, var2489 = protoModule.writeTag(buff, var2477, 4, protoModule.wireTypes.lengthDelimited)
		var2488, var4113 = protoModule.writeBuffer(var2488, var2489, var2487, buffer.len(var2487))
		buff = var2488
		var2477 = var2489
	end
	if self.prevent_double_confirm ~= nil then
		local var2490 = self.prevent_double_confirm:encode()
		local var2491, var2492 = protoModule.writeTag(buff, var2477, 5, protoModule.wireTypes.lengthDelimited)
		var2491, var4116 = protoModule.writeBuffer(var2491, var2492, var2490, buffer.len(var2490))
		buff = var2491
		var2477 = var2492
	end
	if self.provided_robux_balance ~= nil then
		local var2493 = self.provided_robux_balance:encode()
		local var2494, var2495 = protoModule.writeTag(buff, var2477, 6, protoModule.wireTypes.lengthDelimited)
		var2494, var4119 = protoModule.writeBuffer(var2494, var2495, var2493, buffer.len(var2493))
		buff = var2494
		var2477 = var2495
	end
	if self.launch_after_purchase_root_place_id ~= nil then
		local var2496 = self.launch_after_purchase_root_place_id:encode()
		local var2497, var2498 = protoModule.writeTag(buff, var2477, 7, protoModule.wireTypes.lengthDelimited)
		var2497, var4122 = protoModule.writeBuffer(var2497, var2498, var2496, buffer.len(var2496))
		buff = var2497
		var2477 = var2498
	end
	local buff_1 = buffer.create(var2477)
	buffer.copy(buff_1, 0, buff, 0, var2477)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref), propTypesModule (ref)
	local var2477 = t_122.new()
	local var2478 = 0
	while var2478 < buffer.len(p122) do
		local _ = nil
		local var2479 = nil
		local var2480, var2481, var2482 = protoModule.readTag(p122, var2478)
		local var2483 = var2480
		var2479 = var2481
		var2478 = var2482
		
		if var2479 == protoModule.wireTypes.varint then
			local _ = nil
			local var2484, var2485 = protoModule.readVarInt(p122, var2478)
			local _ = var2484
			var2478 = var2485
			continue
		end
		if var2479 == protoModule.wireTypes.lengthDelimited then
			if var2483 == 1 then
				local _ = nil
				local var2486, var2487 = protoModule.readBuffer(p122, var2478)
				var2478 = var2487
				var2477.should_skip_ownership_check = propTypesModule.BoolProp.decode(var2486)
			elseif var2483 == 2 then
				local _ = nil
				local var2488, var2489 = protoModule.readBuffer(p122, var2478)
				var2478 = var2489
				var2477.enable_preloaded_purchase_ui = propTypesModule.BoolProp.decode(var2488)
			elseif var2483 == 3 then
				local _ = nil
				local var2490, var2491 = protoModule.readBuffer(p122, var2478)
				var2478 = var2491
				var2477.completion_message = propTypesModule.StringProp.decode(var2490)
			elseif var2483 == 4 then
				local _ = nil
				local var2492, var2493 = protoModule.readBuffer(p122, var2478)
				var2478 = var2493
				var2477.completion_button_text = propTypesModule.StringProp.decode(var2492)
			elseif var2483 == 5 then
				local _ = nil
				local var2494, var2495 = protoModule.readBuffer(p122, var2478)
				var2478 = var2495
				var2477.prevent_double_confirm = propTypesModule.BoolProp.decode(var2494)
			elseif var2483 == 6 then
				local _ = nil
				local var2496, var2497 = protoModule.readBuffer(p122, var2478)
				var2478 = var2497
				var2477.provided_robux_balance = propTypesModule.Int64Prop.decode(var2496)
			elseif var2483 == 7 then
				local _ = nil
				local var2498, var2499 = protoModule.readBuffer(p122, var2478)
				var2478 = var2499
				var2477.launch_after_purchase_root_place_id = propTypesModule.StringProp.decode(var2498)
			else
				local _ = nil
				local var2500, var2501 = protoModule.readVarInt(p122, var2478)
				var2478 = var2501 + var2500
			end
		elseif var2479 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2502, var2503 = protoModule.readFixed32(p122, var2478)
			local _ = var2502
			var2478 = var2503
		elseif var2479 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2504, var2505 = protoModule.readFixed64(p122, var2478)
			local _ = var2504
			var2478 = var2505
		else
			error("Unsupported wire type: " .. var4126)
		end
	end
	return var2477
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
	local var2506 = t_122.new()
	
	if self.should_skip_ownership_check ~= nil then
		var2506.should_skip_ownership_check = propTypesModule.BoolProp.jsonDecode(self.should_skip_ownership_check)
	end
	if self.shouldSkipOwnershipCheck ~= nil then
		var2506.should_skip_ownership_check = propTypesModule.BoolProp.jsonDecode(self.shouldSkipOwnershipCheck)
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		var2506.enable_preloaded_purchase_ui = propTypesModule.BoolProp.jsonDecode(self.enable_preloaded_purchase_ui)
	end
	if self.enablePreloadedPurchaseUi ~= nil then
		var2506.enable_preloaded_purchase_ui = propTypesModule.BoolProp.jsonDecode(self.enablePreloadedPurchaseUi)
	end
	if self.completion_message ~= nil then
		var2506.completion_message = propTypesModule.StringProp.jsonDecode(self.completion_message)
	end
	if self.completionMessage ~= nil then
		var2506.completion_message = propTypesModule.StringProp.jsonDecode(self.completionMessage)
	end
	if self.completion_button_text ~= nil then
		var2506.completion_button_text = propTypesModule.StringProp.jsonDecode(self.completion_button_text)
	end
	if self.completionButtonText ~= nil then
		var2506.completion_button_text = propTypesModule.StringProp.jsonDecode(self.completionButtonText)
	end
	if self.prevent_double_confirm ~= nil then
		var2506.prevent_double_confirm = propTypesModule.BoolProp.jsonDecode(self.prevent_double_confirm)
	end
	if self.preventDoubleConfirm ~= nil then
		var2506.prevent_double_confirm = propTypesModule.BoolProp.jsonDecode(self.preventDoubleConfirm)
	end
	if self.provided_robux_balance ~= nil then
		var2506.provided_robux_balance = propTypesModule.Int64Prop.jsonDecode(self.provided_robux_balance)
	end
	if self.providedRobuxBalance ~= nil then
		var2506.provided_robux_balance = propTypesModule.Int64Prop.jsonDecode(self.providedRobuxBalance)
	end
	if self.launch_after_purchase_root_place_id ~= nil then
		var2506.launch_after_purchase_root_place_id = propTypesModule.StringProp.jsonDecode(self.launch_after_purchase_root_place_id)
	end
	if self.launchAfterPurchaseRootPlaceId ~= nil then
		var2506.launch_after_purchase_root_place_id = propTypesModule.StringProp.jsonDecode(self.launchAfterPurchaseRootPlaceId)
	end
	return var2506
end

t_122.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseOptionsLiteral"
}
t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral = t_122
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p123)
	-- upvalues: t_123 (ref)
	return setmetatable({
		kind = if p123 == nil or p123.kind == nil then nil else p123.kind
	}, t_123)
end

function t_123:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2506 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2507 = self.kind.value:encode()
			local var2508, var2509 = protoModule.writeTag(buff, var2506, 1, protoModule.wireTypes.lengthDelimited)
			var2508, var4159 = protoModule.writeBuffer(var2508, var2509, var2507, buffer.len(var2507))
			buff = var2508
			var2506 = var2509
		elseif self.kind.type == "binding_path" then
			local var2510, var2511 = protoModule.writeTag(buff, var2506, 2, protoModule.wireTypes.lengthDelimited)
			var2510, var4161 = protoModule.writeString(var2510, var2511, self.kind.value)
			buff = var2510
			var2506 = var2511
		end
	end
	local buff_1 = buffer.create(var2506)
	buffer.copy(buff_1, 0, buff, 0, var2506)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref), t (ref)
	local var2506 = t_123.new()
	local var2507 = 0
	while var2507 < buffer.len(p123) do
		local _ = nil
		local var2508 = nil
		local var2509, var2510, var2511 = protoModule.readTag(p123, var2507)
		local var2512 = var2509
		var2508 = var2510
		var2507 = var2511
		
		if var2508 == protoModule.wireTypes.varint then
			local _ = nil
			local var2513, var2514 = protoModule.readVarInt(p123, var2507)
			local _ = var2513
			var2507 = var2514
			continue
		end
		if var2508 == protoModule.wireTypes.lengthDelimited then
			if var2512 == 1 then
				local _ = nil
				local var2515, var2516 = protoModule.readBuffer(p123, var2507)
				var2507 = var2516
				var2506.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.decode(var2515)
				}
			elseif var2512 == 2 then
				local _ = nil
				local var2517, var2518 = protoModule.readBuffer(p123, var2507)
				var2507 = var2518
				var2506.kind = { type = "binding_path", value = buffer.tostring(var2517) }
			else
				local _ = nil
				local var2519, var2520 = protoModule.readVarInt(p123, var2507)
				var2507 = var2520 + var2519
			end
		elseif var2508 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2521, var2522 = protoModule.readFixed32(p123, var2507)
			local _ = var2521
			var2507 = var2522
		elseif var2508 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2523, var2524 = protoModule.readFixed64(p123, var2507)
			local _ = var2523
			var2507 = var2524
		else
			error("Unsupported wire type: " .. var4165)
		end
	end
	return var2506
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
	local var2525 = t_123.new()
	
	if self.literal ~= nil then
		var2525.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2525.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2525.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2525
end

t_123.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseAnalyticsMetadata",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseAnalyticsMetadata"
}
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata = t_123
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p124)
	-- upvalues: t_124 (ref)
	return setmetatable({
		surface = if p124 == nil or p124.surface == nil then nil else p124.surface,
		product_universe_id = if p124 == nil or p124.product_universe_id == nil then nil else p124.product_universe_id
	}, t_124)
end

function t_124:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2525 = 0
	
	if self.surface ~= nil then
		local var2526 = self.surface:encode()
		local var2527, var2528 = protoModule.writeTag(buff, var2525, 1, protoModule.wireTypes.lengthDelimited)
		var2527, var4188 = protoModule.writeBuffer(var2527, var2528, var2526, buffer.len(var2526))
		buff = var2527
		var2525 = var2528
	end
	if self.product_universe_id ~= nil then
		local var2529 = self.product_universe_id:encode()
		local var2530, var2531 = protoModule.writeTag(buff, var2525, 2, protoModule.wireTypes.lengthDelimited)
		var2530, var4191 = protoModule.writeBuffer(var2530, var2531, var2529, buffer.len(var2529))
		buff = var2530
		var2525 = var2531
	end
	local buff_1 = buffer.create(var2525)
	buffer.copy(buff_1, 0, buff, 0, var2525)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref), propTypesModule (ref)
	local var2525 = t_124.new()
	local var2526 = 0
	while var2526 < buffer.len(p124) do
		local _ = nil
		local var2527 = nil
		local var2528, var2529, var2530 = protoModule.readTag(p124, var2526)
		local var2531 = var2528
		var2527 = var2529
		var2526 = var2530
		
		if var2527 == protoModule.wireTypes.varint then
			local _ = nil
			local var2532, var2533 = protoModule.readVarInt(p124, var2526)
			local _ = var2532
			var2526 = var2533
			continue
		end
		if var2527 == protoModule.wireTypes.lengthDelimited then
			if var2531 == 1 then
				local _ = nil
				local var2534, var2535 = protoModule.readBuffer(p124, var2526)
				var2526 = var2535
				var2525.surface = propTypesModule.StringProp.decode(var2534)
			elseif var2531 == 2 then
				local _ = nil
				local var2536, var2537 = protoModule.readBuffer(p124, var2526)
				var2526 = var2537
				var2525.product_universe_id = propTypesModule.StringProp.decode(var2536)
			else
				local _ = nil
				local var2538, var2539 = protoModule.readVarInt(p124, var2526)
				var2526 = var2539 + var2538
			end
		elseif var2527 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2540, var2541 = protoModule.readFixed32(p124, var2526)
			local _ = var2540
			var2526 = var2541
		elseif var2527 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2542, var2543 = protoModule.readFixed64(p124, var2526)
			local _ = var2542
			var2526 = var2543
		else
			error("Unsupported wire type: " .. var4195)
		end
	end
	return var2525
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
	local var2544 = t_124.new()
	
	if self.surface ~= nil then
		var2544.surface = propTypesModule.StringProp.jsonDecode(self.surface)
	end
	if self.product_universe_id ~= nil then
		var2544.product_universe_id = propTypesModule.StringProp.jsonDecode(self.product_universe_id)
	end
	if self.productUniverseId ~= nil then
		var2544.product_universe_id = propTypesModule.StringProp.jsonDecode(self.productUniverseId)
	end
	return var2544
end

t_124.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseAnalyticsMetadataLiteral"
}
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral = t_124
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p125)
	-- upvalues: t_125 (ref)
	return setmetatable({
		product_payload = if p125 == nil or p125.product_payload == nil then nil else p125.product_payload,
		display_info = if p125 == nil or p125.display_info == nil then nil else p125.display_info,
		purchase_options = if p125 == nil or p125.purchase_options == nil then nil else p125.purchase_options,
		purchase_analytics_metadata = if p125 == nil or p125.purchase_analytics_metadata == nil then nil else p125.purchase_analytics_metadata,
		root_place_id = if p125 == nil or p125.root_place_id == nil then nil else p125.root_place_id
	}, t_125)
end

function t_125:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2544 = 0
	
	if self.product_payload ~= nil then
		local var2545 = self.product_payload:encode()
		local var2546, var2547 = protoModule.writeTag(buff, var2544, 1, protoModule.wireTypes.lengthDelimited)
		var2546, var4218 = protoModule.writeBuffer(var2546, var2547, var2545, buffer.len(var2545))
		buff = var2546
		var2544 = var2547
	end
	if self.display_info ~= nil then
		local var2548 = self.display_info:encode()
		local var2549, var2550 = protoModule.writeTag(buff, var2544, 2, protoModule.wireTypes.lengthDelimited)
		var2549, var4221 = protoModule.writeBuffer(var2549, var2550, var2548, buffer.len(var2548))
		buff = var2549
		var2544 = var2550
	end
	if self.purchase_options ~= nil then
		local var2551 = self.purchase_options:encode()
		local var2552, var2553 = protoModule.writeTag(buff, var2544, 3, protoModule.wireTypes.lengthDelimited)
		var2552, var4224 = protoModule.writeBuffer(var2552, var2553, var2551, buffer.len(var2551))
		buff = var2552
		var2544 = var2553
	end
	if self.purchase_analytics_metadata ~= nil then
		local var2554 = self.purchase_analytics_metadata:encode()
		local var2555, var2556 = protoModule.writeTag(buff, var2544, 4, protoModule.wireTypes.lengthDelimited)
		var2555, var4227 = protoModule.writeBuffer(var2555, var2556, var2554, buffer.len(var2554))
		buff = var2555
		var2544 = var2556
	end
	if self.root_place_id ~= nil then
		local var2557 = self.root_place_id:encode()
		local var2558, var2559 = protoModule.writeTag(buff, var2544, 5, protoModule.wireTypes.lengthDelimited)
		var2558, var4230 = protoModule.writeBuffer(var2558, var2559, var2557, buffer.len(var2557))
		buff = var2558
		var2544 = var2559
	end
	local buff_1 = buffer.create(var2544)
	buffer.copy(buff_1, 0, buff, 0, var2544)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref), propTypesModule (ref)
	local var2544 = t_125.new()
	local var2545 = 0
	while var2545 < buffer.len(p125) do
		local _ = nil
		local var2546 = nil
		local var2547, var2548, var2549 = protoModule.readTag(p125, var2545)
		local var2550 = var2547
		var2546 = var2548
		var2545 = var2549
		
		if var2546 == protoModule.wireTypes.varint then
			local _ = nil
			local var2551, var2552 = protoModule.readVarInt(p125, var2545)
			local _ = var2551
			var2545 = var2552
			continue
		end
		if var2546 == protoModule.wireTypes.lengthDelimited then
			if var2550 == 1 then
				local _ = nil
				local var2553, var2554 = protoModule.readBuffer(p125, var2545)
				var2545 = var2554
				var2544.product_payload = t.OpenPurchasePromptAction_ProductPayload.decode(var2553)
			elseif var2550 == 2 then
				local _ = nil
				local var2555, var2556 = protoModule.readBuffer(p125, var2545)
				var2545 = var2556
				var2544.display_info = t.OpenPurchasePromptAction_DisplayInfo.decode(var2555)
			elseif var2550 == 3 then
				local _ = nil
				local var2557, var2558 = protoModule.readBuffer(p125, var2545)
				var2545 = var2558
				var2544.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.decode(var2557)
			elseif var2550 == 4 then
				local _ = nil
				local var2559, var2560 = protoModule.readBuffer(p125, var2545)
				var2545 = var2560
				var2544.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.decode(var2559)
			elseif var2550 == 5 then
				local _ = nil
				local var2561, var2562 = protoModule.readBuffer(p125, var2545)
				var2545 = var2562
				var2544.root_place_id = propTypesModule.StringProp.decode(var2561)
			else
				local _ = nil
				local var2563, var2564 = protoModule.readVarInt(p125, var2545)
				var2545 = var2564 + var2563
			end
		elseif var2546 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2565, var2566 = protoModule.readFixed32(p125, var2545)
			local _ = var2565
			var2545 = var2566
		elseif var2546 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2567, var2568 = protoModule.readFixed64(p125, var2545)
			local _ = var2567
			var2545 = var2568
		else
			error("Unsupported wire type: " .. var4234)
		end
	end
	return var2544
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
	local var2569 = t_125.new()
	
	if self.product_payload ~= nil then
		var2569.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.product_payload)
	end
	if self.productPayload ~= nil then
		var2569.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.productPayload)
	end
	if self.display_info ~= nil then
		var2569.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.display_info)
	end
	if self.displayInfo ~= nil then
		var2569.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.displayInfo)
	end
	if self.purchase_options ~= nil then
		var2569.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchase_options)
	end
	if self.purchaseOptions ~= nil then
		var2569.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchaseOptions)
	end
	if self.purchase_analytics_metadata ~= nil then
		var2569.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchase_analytics_metadata)
	end
	if self.purchaseAnalyticsMetadata ~= nil then
		var2569.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchaseAnalyticsMetadata)
	end
	if self.root_place_id ~= nil then
		var2569.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var2569.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var2569
end

t_125.descriptor = {
	name = "OpenPurchasePromptAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenPurchasePromptAction_Params = t_125
typeRegistryModule.default:register(t.OpenPurchasePromptAction_Params)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p126)
	-- upvalues: t (ref), t_126 (ref)
	return setmetatable({
		action_type = if p126 == nil or p126.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p126.action_type,
		action_params = if p126 == nil or p126.action_params == nil then nil else p126.action_params
	}, t_126)
end

function t_126:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2569 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2570, var2571 = protoModule.writeTag(buff, var2569, 1, protoModule.wireTypes.varint)
		var2570, var4262 = protoModule.writeVarInt(var2570, var2571, t.ActionType.toNumber(self.action_type))
		buff = var2570
		var2569 = var2571
	end
	if self.action_params ~= nil then
		local var2572 = self.action_params:encode()
		local var2573, var2574 = protoModule.writeTag(buff, var2569, 2, protoModule.wireTypes.lengthDelimited)
		var2573, var4265 = protoModule.writeBuffer(var2573, var2574, var2572, buffer.len(var2572))
		buff = var2573
		var2569 = var2574
	end
	local buff_1 = buffer.create(var2569)
	buffer.copy(buff_1, 0, buff, 0, var2569)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref), t (ref)
	local var2569 = t_126.new()
	local var2570 = 0
	while var2570 < buffer.len(p126) do
		local _ = nil
		local var2571 = nil
		local var2572, var2573, var2574 = protoModule.readTag(p126, var2570)
		local var2575 = var2572
		var2571 = var2573
		var2570 = var2574
		
		if var2571 == protoModule.wireTypes.varint then
			if var2575 == 1 then
				local _ = nil
				local var2576, var2577 = protoModule.readVarIntI32(p126, var2570)
				local var2578 = var2576
				var2570 = var2577
				var2569.action_type = t.ActionType.fromNumber(var2578) or var2578
			else
				local _ = nil
				local var2579, var2580 = protoModule.readVarInt(p126, var2570)
				local _ = var2579
				var2570 = var2580
			end
		end
		if var2571 == protoModule.wireTypes.lengthDelimited then
			if var2575 == 2 then
				local _ = nil
				local var2581, var2582 = protoModule.readBuffer(p126, var2570)
				var2570 = var2582
				var2569.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.decode(var2581)
			else
				local _ = nil
				local var2583, var2584 = protoModule.readVarInt(p126, var2570)
				var2570 = var2584 + var2583
			end
		elseif var2571 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2585, var2586 = protoModule.readFixed32(p126, var2570)
			local _ = var2585
			var2570 = var2586
		elseif var2571 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2587, var2588 = protoModule.readFixed64(p126, var2570)
			local _ = var2587
			var2570 = var2588
		else
			error("Unsupported wire type: " .. var4269)
		end
	end
	return var2569
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
	local var2589 = t_126.new()
	
	if self.action_type ~= nil then
		var2589.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2589.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2589.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2589.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.actionParams)
	end
	return var2589
end

t_126.descriptor = {
	name = "ReportSurfaceLoadTimeMilestoneAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ReportSurfaceLoadTimeMilestoneAction"
}
t.ReportSurfaceLoadTimeMilestoneAction = t_126
typeRegistryModule.default:register(t.ReportSurfaceLoadTimeMilestoneAction)
local t_127 = {}
t_127.__index = t_127

function t_127.new(p127)
	-- upvalues: t_127 (ref)
	return setmetatable({
		milestone = if p127 == nil or p127.milestone == nil then nil else p127.milestone,
		metadata = if p127 == nil or p127.metadata == nil then nil else p127.metadata
	}, t_127)
end

function t_127:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2589 = 0
	
	if self.milestone ~= nil then
		local var2590 = self.milestone:encode()
		local var2591, var2592 = protoModule.writeTag(buff, var2589, 1, protoModule.wireTypes.lengthDelimited)
		var2591, var4293 = protoModule.writeBuffer(var2591, var2592, var2590, buffer.len(var2590))
		buff = var2591
		var2589 = var2592
	end
	if self.metadata ~= nil then
		local var2593 = self.metadata:encode()
		local var2594, var2595 = protoModule.writeTag(buff, var2589, 3, protoModule.wireTypes.lengthDelimited)
		var2594, var4296 = protoModule.writeBuffer(var2594, var2595, var2593, buffer.len(var2593))
		buff = var2594
		var2589 = var2595
	end
	local buff_1 = buffer.create(var2589)
	buffer.copy(buff_1, 0, buff, 0, var2589)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref), propTypesModule (ref)
	local var2589 = t_127.new()
	local var2590 = 0
	while var2590 < buffer.len(p127) do
		local _ = nil
		local var2591 = nil
		local var2592, var2593, var2594 = protoModule.readTag(p127, var2590)
		local var2595 = var2592
		var2591 = var2593
		var2590 = var2594
		
		if var2591 == protoModule.wireTypes.varint then
			local _ = nil
			local var2596, var2597 = protoModule.readVarInt(p127, var2590)
			local _ = var2596
			var2590 = var2597
			continue
		end
		if var2591 == protoModule.wireTypes.lengthDelimited then
			if var2595 == 1 then
				local _ = nil
				local var2598, var2599 = protoModule.readBuffer(p127, var2590)
				var2590 = var2599
				var2589.milestone = propTypesModule.StringProp.decode(var2598)
			elseif var2595 == 3 then
				local _ = nil
				local var2600, var2601 = protoModule.readBuffer(p127, var2590)
				var2590 = var2601
				var2589.metadata = propTypesModule.StructProp.decode(var2600)
			else
				local _ = nil
				local var2602, var2603 = protoModule.readVarInt(p127, var2590)
				var2590 = var2603 + var2602
			end
		elseif var2591 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2604, var2605 = protoModule.readFixed32(p127, var2590)
			local _ = var2604
			var2590 = var2605
		elseif var2591 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2606, var2607 = protoModule.readFixed64(p127, var2590)
			local _ = var2606
			var2590 = var2607
		else
			error("Unsupported wire type: " .. var4300)
		end
	end
	return var2589
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
	local var2608 = t_127.new()
	
	if self.milestone ~= nil then
		var2608.milestone = propTypesModule.StringProp.jsonDecode(self.milestone)
	end
	if self.metadata ~= nil then
		var2608.metadata = propTypesModule.StructProp.jsonDecode(self.metadata)
	end
	return var2608
end

t_127.descriptor = {
	name = "ReportSurfaceLoadTimeMilestoneAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ReportSurfaceLoadTimeMilestoneAction_Params = t_127
typeRegistryModule.default:register(t.ReportSurfaceLoadTimeMilestoneAction_Params)
local t_128 = {}
t_128.__index = t_128

function t_128.new(p128)
	-- upvalues: t (ref), t_128 (ref)
	return setmetatable({
		action_type = if p128 == nil or p128.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p128.action_type,
		action_params = if p128 == nil or p128.action_params == nil then nil else p128.action_params
	}, t_128)
end

function t_128:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2608 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2609, var2610 = protoModule.writeTag(buff, var2608, 1, protoModule.wireTypes.varint)
		var2609, var4322 = protoModule.writeVarInt(var2609, var2610, t.ActionType.toNumber(self.action_type))
		buff = var2609
		var2608 = var2610
	end
	if self.action_params ~= nil then
		local var2611 = self.action_params:encode()
		local var2612, var2613 = protoModule.writeTag(buff, var2608, 2, protoModule.wireTypes.lengthDelimited)
		var2612, var4325 = protoModule.writeBuffer(var2612, var2613, var2611, buffer.len(var2611))
		buff = var2612
		var2608 = var2613
	end
	local buff_1 = buffer.create(var2608)
	buffer.copy(buff_1, 0, buff, 0, var2608)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var2608 = t_128.new()
	local var2609 = 0
	while var2609 < buffer.len(p128) do
		local _ = nil
		local var2610 = nil
		local var2611, var2612, var2613 = protoModule.readTag(p128, var2609)
		local var2614 = var2611
		var2610 = var2612
		var2609 = var2613
		
		if var2610 == protoModule.wireTypes.varint then
			if var2614 == 1 then
				local _ = nil
				local var2615, var2616 = protoModule.readVarIntI32(p128, var2609)
				local var2617 = var2615
				var2609 = var2616
				var2608.action_type = t.ActionType.fromNumber(var2617) or var2617
			else
				local _ = nil
				local var2618, var2619 = protoModule.readVarInt(p128, var2609)
				local _ = var2618
				var2609 = var2619
			end
		end
		if var2610 == protoModule.wireTypes.lengthDelimited then
			if var2614 == 2 then
				local _ = nil
				local var2620, var2621 = protoModule.readBuffer(p128, var2609)
				var2609 = var2621
				var2608.action_params = t.DismissGameFeedbackAction_Params.decode(var2620)
			else
				local _ = nil
				local var2622, var2623 = protoModule.readVarInt(p128, var2609)
				var2609 = var2623 + var2622
			end
		elseif var2610 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2624, var2625 = protoModule.readFixed32(p128, var2609)
			local _ = var2624
			var2609 = var2625
		elseif var2610 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2626, var2627 = protoModule.readFixed64(p128, var2609)
			local _ = var2626
			var2609 = var2627
		else
			error("Unsupported wire type: " .. var4329)
		end
	end
	return var2608
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
	local var2628 = t_128.new()
	
	if self.action_type ~= nil then
		var2628.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2628.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2628.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2628.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return var2628
end

t_128.descriptor = {
	name = "DismissGameFeedbackAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissGameFeedbackAction"
}
t.DismissGameFeedbackAction = t_128
typeRegistryModule.default:register(t.DismissGameFeedbackAction)
local t_129 = {}
t_129.__index = t_129

function t_129.new(p129)
	-- upvalues: t_129 (ref)
	return setmetatable({
		root_place_id = if p129 == nil or p129.root_place_id == nil then nil else p129.root_place_id
	}, t_129)
end

function t_129:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2628 = 0
	
	if self.root_place_id ~= nil then
		local var2629 = self.root_place_id:encode()
		local var2630, var2631 = protoModule.writeTag(buff, var2628, 1, protoModule.wireTypes.lengthDelimited)
		var2630, var4353 = protoModule.writeBuffer(var2630, var2631, var2629, buffer.len(var2629))
		buff = var2630
		var2628 = var2631
	end
	local buff_1 = buffer.create(var2628)
	buffer.copy(buff_1, 0, buff, 0, var2628)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref), propTypesModule (ref)
	local var2628 = t_129.new()
	local var2629 = 0
	while var2629 < buffer.len(p129) do
		local _ = nil
		local var2630 = nil
		local var2631, var2632, var2633 = protoModule.readTag(p129, var2629)
		local var2634 = var2631
		var2630 = var2632
		var2629 = var2633
		
		if var2630 == protoModule.wireTypes.varint then
			local _ = nil
			local var2635, var2636 = protoModule.readVarInt(p129, var2629)
			local _ = var2635
			var2629 = var2636
			continue
		end
		if var2630 == protoModule.wireTypes.lengthDelimited then
			if var2634 == 1 then
				local _ = nil
				local var2637, var2638 = protoModule.readBuffer(p129, var2629)
				var2629 = var2638
				var2628.root_place_id = propTypesModule.StringProp.decode(var2637)
			else
				local _ = nil
				local var2639, var2640 = protoModule.readVarInt(p129, var2629)
				var2629 = var2640 + var2639
			end
		elseif var2630 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2641, var2642 = protoModule.readFixed32(p129, var2629)
			local _ = var2641
			var2629 = var2642
		elseif var2630 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2643, var2644 = protoModule.readFixed64(p129, var2629)
			local _ = var2643
			var2629 = var2644
		else
			error("Unsupported wire type: " .. var4357)
		end
	end
	return var2628
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
	local var2645 = t_129.new()
	
	if self.root_place_id ~= nil then
		var2645.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var2645.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var2645
end

t_129.descriptor = {
	name = "DismissGameFeedbackAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissGameFeedbackAction_Params = t_129
typeRegistryModule.default:register(t.DismissGameFeedbackAction_Params)
local t_130 = {}
t_130.__index = t_130

function t_130.new(p130)
	-- upvalues: t (ref), t_130 (ref)
	return setmetatable({
		action_type = if p130 == nil or p130.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p130.action_type,
		action_params = if p130 == nil or p130.action_params == nil then nil else p130.action_params
	}, t_130)
end

function t_130:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2645 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2646, var2647 = protoModule.writeTag(buff, var2645, 1, protoModule.wireTypes.varint)
		var2646, var4377 = protoModule.writeVarInt(var2646, var2647, t.ActionType.toNumber(self.action_type))
		buff = var2646
		var2645 = var2647
	end
	if self.action_params ~= nil then
		local var2648 = self.action_params:encode()
		local var2649, var2650 = protoModule.writeTag(buff, var2645, 2, protoModule.wireTypes.lengthDelimited)
		var2649, var4380 = protoModule.writeBuffer(var2649, var2650, var2648, buffer.len(var2648))
		buff = var2649
		var2645 = var2650
	end
	local buff_1 = buffer.create(var2645)
	buffer.copy(buff_1, 0, buff, 0, var2645)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref), t (ref)
	local var2645 = t_130.new()
	local var2646 = 0
	while var2646 < buffer.len(p130) do
		local _ = nil
		local var2647 = nil
		local var2648, var2649, var2650 = protoModule.readTag(p130, var2646)
		local var2651 = var2648
		var2647 = var2649
		var2646 = var2650
		
		if var2647 == protoModule.wireTypes.varint then
			if var2651 == 1 then
				local _ = nil
				local var2652, var2653 = protoModule.readVarIntI32(p130, var2646)
				local var2654 = var2652
				var2646 = var2653
				var2645.action_type = t.ActionType.fromNumber(var2654) or var2654
			else
				local _ = nil
				local var2655, var2656 = protoModule.readVarInt(p130, var2646)
				local _ = var2655
				var2646 = var2656
			end
		end
		if var2647 == protoModule.wireTypes.lengthDelimited then
			if var2651 == 2 then
				local _ = nil
				local var2657, var2658 = protoModule.readBuffer(p130, var2646)
				var2646 = var2658
				var2645.action_params = t.OpenGameFeedbackFormAction_Params.decode(var2657)
			else
				local _ = nil
				local var2659, var2660 = protoModule.readVarInt(p130, var2646)
				var2646 = var2660 + var2659
			end
		elseif var2647 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2661, var2662 = protoModule.readFixed32(p130, var2646)
			local _ = var2661
			var2646 = var2662
		elseif var2647 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2663, var2664 = protoModule.readFixed64(p130, var2646)
			local _ = var2663
			var2646 = var2664
		else
			error("Unsupported wire type: " .. var4384)
		end
	end
	return var2645
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
	local var2665 = t_130.new()
	
	if self.action_type ~= nil then
		var2665.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2665.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2665.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2665.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.actionParams)
	end
	return var2665
end

t_130.descriptor = {
	name = "OpenGameFeedbackFormAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameFeedbackFormAction"
}
t.OpenGameFeedbackFormAction = t_130
typeRegistryModule.default:register(t.OpenGameFeedbackFormAction)
local t_131 = {}
t_131.__index = t_131

function t_131.new(p131)
	-- upvalues: t_131 (ref)
	return setmetatable({
		universe_id = if p131 == nil or p131.universe_id == nil then nil else p131.universe_id,
		root_place_id = if p131 == nil or p131.root_place_id == nil then nil else p131.root_place_id
	}, t_131)
end

function t_131:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2665 = 0
	
	if self.universe_id ~= nil then
		local var2666 = self.universe_id:encode()
		local var2667, var2668 = protoModule.writeTag(buff, var2665, 1, protoModule.wireTypes.lengthDelimited)
		var2667, var4408 = protoModule.writeBuffer(var2667, var2668, var2666, buffer.len(var2666))
		buff = var2667
		var2665 = var2668
	end
	if self.root_place_id ~= nil then
		local var2669 = self.root_place_id:encode()
		local var2670, var2671 = protoModule.writeTag(buff, var2665, 2, protoModule.wireTypes.lengthDelimited)
		var2670, var4411 = protoModule.writeBuffer(var2670, var2671, var2669, buffer.len(var2669))
		buff = var2670
		var2665 = var2671
	end
	local buff_1 = buffer.create(var2665)
	buffer.copy(buff_1, 0, buff, 0, var2665)
	
	return buff_1
end

function t_131.decode(p131)
	-- upvalues: t_131 (ref), protoModule (ref), propTypesModule (ref)
	local var2665 = t_131.new()
	local var2666 = 0
	while var2666 < buffer.len(p131) do
		local _ = nil
		local var2667 = nil
		local var2668, var2669, var2670 = protoModule.readTag(p131, var2666)
		local var2671 = var2668
		var2667 = var2669
		var2666 = var2670
		
		if var2667 == protoModule.wireTypes.varint then
			local _ = nil
			local var2672, var2673 = protoModule.readVarInt(p131, var2666)
			local _ = var2672
			var2666 = var2673
			continue
		end
		if var2667 == protoModule.wireTypes.lengthDelimited then
			if var2671 == 1 then
				local _ = nil
				local var2674, var2675 = protoModule.readBuffer(p131, var2666)
				var2666 = var2675
				var2665.universe_id = propTypesModule.StringProp.decode(var2674)
			elseif var2671 == 2 then
				local _ = nil
				local var2676, var2677 = protoModule.readBuffer(p131, var2666)
				var2666 = var2677
				var2665.root_place_id = propTypesModule.StringProp.decode(var2676)
			else
				local _ = nil
				local var2678, var2679 = protoModule.readVarInt(p131, var2666)
				var2666 = var2679 + var2678
			end
		elseif var2667 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2680, var2681 = protoModule.readFixed32(p131, var2666)
			local _ = var2680
			var2666 = var2681
		elseif var2667 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2682, var2683 = protoModule.readFixed64(p131, var2666)
			local _ = var2682
			var2666 = var2683
		else
			error("Unsupported wire type: " .. var4415)
		end
	end
	return var2665
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
	local var2684 = t_131.new()
	
	if self.universe_id ~= nil then
		var2684.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2684.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		var2684.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var2684.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var2684
end

t_131.descriptor = {
	name = "OpenGameFeedbackFormAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameFeedbackFormAction_Params = t_131
typeRegistryModule.default:register(t.OpenGameFeedbackFormAction_Params)
local t_132 = {}
t_132.__index = t_132

function t_132.new(p132)
	-- upvalues: t (ref), t_132 (ref)
	return setmetatable({
		action_type = if p132 == nil or p132.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p132.action_type,
		action_params = if p132 == nil or p132.action_params == nil then nil else p132.action_params
	}, t_132)
end

function t_132:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2684 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2685, var2686 = protoModule.writeTag(buff, var2684, 1, protoModule.wireTypes.varint)
		var2685, var4437 = protoModule.writeVarInt(var2685, var2686, t.ActionType.toNumber(self.action_type))
		buff = var2685
		var2684 = var2686
	end
	if self.action_params ~= nil then
		local var2687 = self.action_params:encode()
		local var2688, var2689 = protoModule.writeTag(buff, var2684, 2, protoModule.wireTypes.lengthDelimited)
		var2688, var4440 = protoModule.writeBuffer(var2688, var2689, var2687, buffer.len(var2687))
		buff = var2688
		var2684 = var2689
	end
	local buff_1 = buffer.create(var2684)
	buffer.copy(buff_1, 0, buff, 0, var2684)
	
	return buff_1
end

function t_132.decode(p132)
	-- upvalues: t_132 (ref), protoModule (ref), t (ref)
	local var2684 = t_132.new()
	local var2685 = 0
	while var2685 < buffer.len(p132) do
		local _ = nil
		local var2686 = nil
		local var2687, var2688, var2689 = protoModule.readTag(p132, var2685)
		local var2690 = var2687
		var2686 = var2688
		var2685 = var2689
		
		if var2686 == protoModule.wireTypes.varint then
			if var2690 == 1 then
				local _ = nil
				local var2691, var2692 = protoModule.readVarIntI32(p132, var2685)
				local var2693 = var2691
				var2685 = var2692
				var2684.action_type = t.ActionType.fromNumber(var2693) or var2693
			else
				local _ = nil
				local var2694, var2695 = protoModule.readVarInt(p132, var2685)
				local _ = var2694
				var2685 = var2695
			end
		end
		if var2686 == protoModule.wireTypes.lengthDelimited then
			if var2690 == 2 then
				local _ = nil
				local var2696, var2697 = protoModule.readBuffer(p132, var2685)
				var2685 = var2697
				var2684.action_params = t.AiOverviewFeedbackAction_Params.decode(var2696)
			else
				local _ = nil
				local var2698, var2699 = protoModule.readVarInt(p132, var2685)
				var2685 = var2699 + var2698
			end
		elseif var2686 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2700, var2701 = protoModule.readFixed32(p132, var2685)
			local _ = var2700
			var2685 = var2701
		elseif var2686 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2702, var2703 = protoModule.readFixed64(p132, var2685)
			local _ = var2702
			var2685 = var2703
		else
			error("Unsupported wire type: " .. var4444)
		end
	end
	return var2684
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
	local var2704 = t_132.new()
	
	if self.action_type ~= nil then
		var2704.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2704.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2704.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2704.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return var2704
end

t_132.descriptor = {
	name = "AiOverviewFeedbackAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.AiOverviewFeedbackAction"
}
t.AiOverviewFeedbackAction = t_132
typeRegistryModule.default:register(t.AiOverviewFeedbackAction)
local t_133 = {}
t_133.__index = t_133

function t_133.new(p133)
	-- upvalues: t_133 (ref)
	return setmetatable({
		sentiment = if p133 == nil or p133.sentiment == nil then nil else p133.sentiment,
		dialog_title = if p133 == nil or p133.dialog_title == nil then nil else p133.dialog_title,
		dialog_text = if p133 == nil or p133.dialog_text == nil then nil else p133.dialog_text,
		placeholder_text = if p133 == nil or p133.placeholder_text == nil then nil else p133.placeholder_text
	}, t_133)
end

function t_133:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2704 = 0
	
	if self.sentiment ~= nil then
		local var2705 = self.sentiment:encode()
		local var2706, var2707 = protoModule.writeTag(buff, var2704, 1, protoModule.wireTypes.lengthDelimited)
		var2706, var4468 = protoModule.writeBuffer(var2706, var2707, var2705, buffer.len(var2705))
		buff = var2706
		var2704 = var2707
	end
	if self.dialog_title ~= nil then
		local var2708 = self.dialog_title:encode()
		local var2709, var2710 = protoModule.writeTag(buff, var2704, 2, protoModule.wireTypes.lengthDelimited)
		var2709, var4471 = protoModule.writeBuffer(var2709, var2710, var2708, buffer.len(var2708))
		buff = var2709
		var2704 = var2710
	end
	if self.dialog_text ~= nil then
		local var2711 = self.dialog_text:encode()
		local var2712, var2713 = protoModule.writeTag(buff, var2704, 3, protoModule.wireTypes.lengthDelimited)
		var2712, var4474 = protoModule.writeBuffer(var2712, var2713, var2711, buffer.len(var2711))
		buff = var2712
		var2704 = var2713
	end
	if self.placeholder_text ~= nil then
		local var2714 = self.placeholder_text:encode()
		local var2715, var2716 = protoModule.writeTag(buff, var2704, 4, protoModule.wireTypes.lengthDelimited)
		var2715, var4477 = protoModule.writeBuffer(var2715, var2716, var2714, buffer.len(var2714))
		buff = var2715
		var2704 = var2716
	end
	local buff_1 = buffer.create(var2704)
	buffer.copy(buff_1, 0, buff, 0, var2704)
	
	return buff_1
end

function t_133.decode(p133)
	-- upvalues: t_133 (ref), protoModule (ref), propTypesModule (ref)
	local var2704 = t_133.new()
	local var2705 = 0
	while var2705 < buffer.len(p133) do
		local _ = nil
		local var2706 = nil
		local var2707, var2708, var2709 = protoModule.readTag(p133, var2705)
		local var2710 = var2707
		var2706 = var2708
		var2705 = var2709
		
		if var2706 == protoModule.wireTypes.varint then
			local _ = nil
			local var2711, var2712 = protoModule.readVarInt(p133, var2705)
			local _ = var2711
			var2705 = var2712
			continue
		end
		if var2706 == protoModule.wireTypes.lengthDelimited then
			if var2710 == 1 then
				local _ = nil
				local var2713, var2714 = protoModule.readBuffer(p133, var2705)
				var2705 = var2714
				var2704.sentiment = propTypesModule.StringProp.decode(var2713)
			elseif var2710 == 2 then
				local _ = nil
				local var2715, var2716 = protoModule.readBuffer(p133, var2705)
				var2705 = var2716
				var2704.dialog_title = propTypesModule.StringProp.decode(var2715)
			elseif var2710 == 3 then
				local _ = nil
				local var2717, var2718 = protoModule.readBuffer(p133, var2705)
				var2705 = var2718
				var2704.dialog_text = propTypesModule.StringProp.decode(var2717)
			elseif var2710 == 4 then
				local _ = nil
				local var2719, var2720 = protoModule.readBuffer(p133, var2705)
				var2705 = var2720
				var2704.placeholder_text = propTypesModule.StringProp.decode(var2719)
			else
				local _ = nil
				local var2721, var2722 = protoModule.readVarInt(p133, var2705)
				var2705 = var2722 + var2721
			end
		elseif var2706 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2723, var2724 = protoModule.readFixed32(p133, var2705)
			local _ = var2723
			var2705 = var2724
		elseif var2706 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2725, var2726 = protoModule.readFixed64(p133, var2705)
			local _ = var2725
			var2705 = var2726
		else
			error("Unsupported wire type: " .. var4481)
		end
	end
	return var2704
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
	local var2727 = t_133.new()
	
	if self.sentiment ~= nil then
		var2727.sentiment = propTypesModule.StringProp.jsonDecode(self.sentiment)
	end
	if self.dialog_title ~= nil then
		var2727.dialog_title = propTypesModule.StringProp.jsonDecode(self.dialog_title)
	end
	if self.dialogTitle ~= nil then
		var2727.dialog_title = propTypesModule.StringProp.jsonDecode(self.dialogTitle)
	end
	if self.dialog_text ~= nil then
		var2727.dialog_text = propTypesModule.StringProp.jsonDecode(self.dialog_text)
	end
	if self.dialogText ~= nil then
		var2727.dialog_text = propTypesModule.StringProp.jsonDecode(self.dialogText)
	end
	if self.placeholder_text ~= nil then
		var2727.placeholder_text = propTypesModule.StringProp.jsonDecode(self.placeholder_text)
	end
	if self.placeholderText ~= nil then
		var2727.placeholder_text = propTypesModule.StringProp.jsonDecode(self.placeholderText)
	end
	return var2727
end

t_133.descriptor = {
	name = "AiOverviewFeedbackAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.AiOverviewFeedbackAction_Params = t_133
typeRegistryModule.default:register(t.AiOverviewFeedbackAction_Params)
local t_134 = {}
t_134.__index = t_134

function t_134.new(p134)
	-- upvalues: t (ref), t_134 (ref)
	return setmetatable({
		action_type = if p134 == nil or p134.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p134.action_type,
		action_params = if p134 == nil or p134.action_params == nil then nil else p134.action_params
	}, t_134)
end

function t_134:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2727 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2728, var2729 = protoModule.writeTag(buff, var2727, 1, protoModule.wireTypes.varint)
		var2728, var4507 = protoModule.writeVarInt(var2728, var2729, t.ActionType.toNumber(self.action_type))
		buff = var2728
		var2727 = var2729
	end
	if self.action_params ~= nil then
		local var2730 = self.action_params:encode()
		local var2731, var2732 = protoModule.writeTag(buff, var2727, 2, protoModule.wireTypes.lengthDelimited)
		var2731, var4510 = protoModule.writeBuffer(var2731, var2732, var2730, buffer.len(var2730))
		buff = var2731
		var2727 = var2732
	end
	local buff_1 = buffer.create(var2727)
	buffer.copy(buff_1, 0, buff, 0, var2727)
	
	return buff_1
end

function t_134.decode(p134)
	-- upvalues: t_134 (ref), protoModule (ref), t (ref)
	local var2727 = t_134.new()
	local var2728 = 0
	while var2728 < buffer.len(p134) do
		local _ = nil
		local var2729 = nil
		local var2730, var2731, var2732 = protoModule.readTag(p134, var2728)
		local var2733 = var2730
		var2729 = var2731
		var2728 = var2732
		
		if var2729 == protoModule.wireTypes.varint then
			if var2733 == 1 then
				local _ = nil
				local var2734, var2735 = protoModule.readVarIntI32(p134, var2728)
				local var2736 = var2734
				var2728 = var2735
				var2727.action_type = t.ActionType.fromNumber(var2736) or var2736
			else
				local _ = nil
				local var2737, var2738 = protoModule.readVarInt(p134, var2728)
				local _ = var2737
				var2728 = var2738
			end
		end
		if var2729 == protoModule.wireTypes.lengthDelimited then
			if var2733 == 2 then
				local _ = nil
				local var2739, var2740 = protoModule.readBuffer(p134, var2728)
				var2728 = var2740
				var2727.action_params = t.EnableEventNotificationsAction_Params.decode(var2739)
			else
				local _ = nil
				local var2741, var2742 = protoModule.readVarInt(p134, var2728)
				var2728 = var2742 + var2741
			end
		elseif var2729 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2743, var2744 = protoModule.readFixed32(p134, var2728)
			local _ = var2743
			var2728 = var2744
		elseif var2729 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2745, var2746 = protoModule.readFixed64(p134, var2728)
			local _ = var2745
			var2728 = var2746
		else
			error("Unsupported wire type: " .. var4514)
		end
	end
	return var2727
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
	local var2747 = t_134.new()
	
	if self.action_type ~= nil then
		var2747.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2747.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2747.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2747.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.actionParams)
	end
	return var2747
end

t_134.descriptor = {
	name = "EnableEventNotificationsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.EnableEventNotificationsAction"
}
t.EnableEventNotificationsAction = t_134
typeRegistryModule.default:register(t.EnableEventNotificationsAction)
local t_135 = {}
t_135.__index = t_135

function t_135.new(p135)
	-- upvalues: t_135 (ref)
	return setmetatable({
		event_id = if p135 == nil or p135.event_id == nil then nil else p135.event_id,
		universe_id = if p135 == nil or p135.universe_id == nil then nil else p135.universe_id,
		channel = if p135 == nil or p135.channel == nil then nil else p135.channel
	}, t_135)
end

function t_135:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2747 = 0
	
	if self.event_id ~= nil then
		local var2748 = self.event_id:encode()
		local var2749, var2750 = protoModule.writeTag(buff, var2747, 1, protoModule.wireTypes.lengthDelimited)
		var2749, var4538 = protoModule.writeBuffer(var2749, var2750, var2748, buffer.len(var2748))
		buff = var2749
		var2747 = var2750
	end
	if self.universe_id ~= nil then
		local var2751 = self.universe_id:encode()
		local var2752, var2753 = protoModule.writeTag(buff, var2747, 2, protoModule.wireTypes.lengthDelimited)
		var2752, var4541 = protoModule.writeBuffer(var2752, var2753, var2751, buffer.len(var2751))
		buff = var2752
		var2747 = var2753
	end
	if self.channel ~= nil then
		local var2754 = self.channel:encode()
		local var2755, var2756 = protoModule.writeTag(buff, var2747, 3, protoModule.wireTypes.lengthDelimited)
		var2755, var4544 = protoModule.writeBuffer(var2755, var2756, var2754, buffer.len(var2754))
		buff = var2755
		var2747 = var2756
	end
	local buff_1 = buffer.create(var2747)
	buffer.copy(buff_1, 0, buff, 0, var2747)
	
	return buff_1
end

function t_135.decode(p135)
	-- upvalues: t_135 (ref), protoModule (ref), propTypesModule (ref)
	local var2747 = t_135.new()
	local var2748 = 0
	while var2748 < buffer.len(p135) do
		local _ = nil
		local var2749 = nil
		local var2750, var2751, var2752 = protoModule.readTag(p135, var2748)
		local var2753 = var2750
		var2749 = var2751
		var2748 = var2752
		
		if var2749 == protoModule.wireTypes.varint then
			local _ = nil
			local var2754, var2755 = protoModule.readVarInt(p135, var2748)
			local _ = var2754
			var2748 = var2755
			continue
		end
		if var2749 == protoModule.wireTypes.lengthDelimited then
			if var2753 == 1 then
				local _ = nil
				local var2756, var2757 = protoModule.readBuffer(p135, var2748)
				var2748 = var2757
				var2747.event_id = propTypesModule.StringProp.decode(var2756)
			elseif var2753 == 2 then
				local _ = nil
				local var2758, var2759 = protoModule.readBuffer(p135, var2748)
				var2748 = var2759
				var2747.universe_id = propTypesModule.StringProp.decode(var2758)
			elseif var2753 == 3 then
				local _ = nil
				local var2760, var2761 = protoModule.readBuffer(p135, var2748)
				var2748 = var2761
				var2747.channel = propTypesModule.StringProp.decode(var2760)
			else
				local _ = nil
				local var2762, var2763 = protoModule.readVarInt(p135, var2748)
				var2748 = var2763 + var2762
			end
		elseif var2749 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2764, var2765 = protoModule.readFixed32(p135, var2748)
			local _ = var2764
			var2748 = var2765
		elseif var2749 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2766, var2767 = protoModule.readFixed64(p135, var2748)
			local _ = var2766
			var2748 = var2767
		else
			error("Unsupported wire type: " .. var4548)
		end
	end
	return var2747
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
	local var2768 = t_135.new()
	
	if self.event_id ~= nil then
		var2768.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var2768.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.universe_id ~= nil then
		var2768.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2768.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.channel ~= nil then
		var2768.channel = propTypesModule.StringProp.jsonDecode(self.channel)
	end
	return var2768
end

t_135.descriptor = {
	name = "EnableEventNotificationsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.EnableEventNotificationsAction_Params = t_135
typeRegistryModule.default:register(t.EnableEventNotificationsAction_Params)
local t_136 = {}
t_136.__index = t_136

function t_136.new(p136)
	-- upvalues: t (ref), t_136 (ref)
	return setmetatable({
		action_type = if p136 == nil or p136.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p136.action_type,
		action_params = if p136 == nil or p136.action_params == nil then nil else p136.action_params
	}, t_136)
end

function t_136:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2768 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2769, var2770 = protoModule.writeTag(buff, var2768, 1, protoModule.wireTypes.varint)
		var2769, var4572 = protoModule.writeVarInt(var2769, var2770, t.ActionType.toNumber(self.action_type))
		buff = var2769
		var2768 = var2770
	end
	if self.action_params ~= nil then
		local var2771 = self.action_params:encode()
		local var2772, var2773 = protoModule.writeTag(buff, var2768, 2, protoModule.wireTypes.lengthDelimited)
		var2772, var4575 = protoModule.writeBuffer(var2772, var2773, var2771, buffer.len(var2771))
		buff = var2772
		var2768 = var2773
	end
	local buff_1 = buffer.create(var2768)
	buffer.copy(buff_1, 0, buff, 0, var2768)
	
	return buff_1
end

function t_136.decode(p136)
	-- upvalues: t_136 (ref), protoModule (ref), t (ref)
	local var2768 = t_136.new()
	local var2769 = 0
	while var2769 < buffer.len(p136) do
		local _ = nil
		local var2770 = nil
		local var2771, var2772, var2773 = protoModule.readTag(p136, var2769)
		local var2774 = var2771
		var2770 = var2772
		var2769 = var2773
		
		if var2770 == protoModule.wireTypes.varint then
			if var2774 == 1 then
				local _ = nil
				local var2775, var2776 = protoModule.readVarIntI32(p136, var2769)
				local var2777 = var2775
				var2769 = var2776
				var2768.action_type = t.ActionType.fromNumber(var2777) or var2777
			else
				local _ = nil
				local var2778, var2779 = protoModule.readVarInt(p136, var2769)
				local _ = var2778
				var2769 = var2779
			end
		end
		if var2770 == protoModule.wireTypes.lengthDelimited then
			if var2774 == 2 then
				local _ = nil
				local var2780, var2781 = protoModule.readBuffer(p136, var2769)
				var2769 = var2781
				var2768.action_params = t.DismissEventNotificationsModalAction_Params.decode(var2780)
			else
				local _ = nil
				local var2782, var2783 = protoModule.readVarInt(p136, var2769)
				var2769 = var2783 + var2782
			end
		elseif var2770 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2784, var2785 = protoModule.readFixed32(p136, var2769)
			local _ = var2784
			var2769 = var2785
		elseif var2770 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2786, var2787 = protoModule.readFixed64(p136, var2769)
			local _ = var2786
			var2769 = var2787
		else
			error("Unsupported wire type: " .. var4579)
		end
	end
	return var2768
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
	local var2788 = t_136.new()
	
	if self.action_type ~= nil then
		var2788.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2788.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2788.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2788.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.actionParams)
	end
	return var2788
end

t_136.descriptor = {
	name = "DismissEventNotificationsModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissEventNotificationsModalAction"
}
t.DismissEventNotificationsModalAction = t_136
typeRegistryModule.default:register(t.DismissEventNotificationsModalAction)
local t_137 = {}
t_137.__index = t_137

function t_137.new(p137)
	-- upvalues: t_137 (ref)
	return setmetatable({
		event_id = if p137 == nil or p137.event_id == nil then nil else p137.event_id
	}, t_137)
end

function t_137:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2788 = 0
	
	if self.event_id ~= nil then
		local var2789 = self.event_id:encode()
		local var2790, var2791 = protoModule.writeTag(buff, var2788, 1, protoModule.wireTypes.lengthDelimited)
		var2790, var4603 = protoModule.writeBuffer(var2790, var2791, var2789, buffer.len(var2789))
		buff = var2790
		var2788 = var2791
	end
	local buff_1 = buffer.create(var2788)
	buffer.copy(buff_1, 0, buff, 0, var2788)
	
	return buff_1
end

function t_137.decode(p137)
	-- upvalues: t_137 (ref), protoModule (ref), propTypesModule (ref)
	local var2788 = t_137.new()
	local var2789 = 0
	while var2789 < buffer.len(p137) do
		local _ = nil
		local var2790 = nil
		local var2791, var2792, var2793 = protoModule.readTag(p137, var2789)
		local var2794 = var2791
		var2790 = var2792
		var2789 = var2793
		
		if var2790 == protoModule.wireTypes.varint then
			local _ = nil
			local var2795, var2796 = protoModule.readVarInt(p137, var2789)
			local _ = var2795
			var2789 = var2796
			continue
		end
		if var2790 == protoModule.wireTypes.lengthDelimited then
			if var2794 == 1 then
				local _ = nil
				local var2797, var2798 = protoModule.readBuffer(p137, var2789)
				var2789 = var2798
				var2788.event_id = propTypesModule.StringProp.decode(var2797)
			else
				local _ = nil
				local var2799, var2800 = protoModule.readVarInt(p137, var2789)
				var2789 = var2800 + var2799
			end
		elseif var2790 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2801, var2802 = protoModule.readFixed32(p137, var2789)
			local _ = var2801
			var2789 = var2802
		elseif var2790 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2803, var2804 = protoModule.readFixed64(p137, var2789)
			local _ = var2803
			var2789 = var2804
		else
			error("Unsupported wire type: " .. var4607)
		end
	end
	return var2788
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
	local var2805 = t_137.new()
	
	if self.event_id ~= nil then
		var2805.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var2805.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var2805
end

t_137.descriptor = {
	name = "DismissEventNotificationsModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissEventNotificationsModalAction_Params = t_137
typeRegistryModule.default:register(t.DismissEventNotificationsModalAction_Params)
local t_138 = {}
t_138.__index = t_138

function t_138.new(p138)
	-- upvalues: t (ref), t_138 (ref)
	return setmetatable({
		action_type = if p138 == nil or p138.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p138.action_type,
		action_params = if p138 == nil or p138.action_params == nil then nil else p138.action_params
	}, t_138)
end

function t_138:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2805 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2806, var2807 = protoModule.writeTag(buff, var2805, 1, protoModule.wireTypes.varint)
		var2806, var4627 = protoModule.writeVarInt(var2806, var2807, t.ActionType.toNumber(self.action_type))
		buff = var2806
		var2805 = var2807
	end
	if self.action_params ~= nil then
		local var2808 = self.action_params:encode()
		local var2809, var2810 = protoModule.writeTag(buff, var2805, 2, protoModule.wireTypes.lengthDelimited)
		var2809, var4630 = protoModule.writeBuffer(var2809, var2810, var2808, buffer.len(var2808))
		buff = var2809
		var2805 = var2810
	end
	local buff_1 = buffer.create(var2805)
	buffer.copy(buff_1, 0, buff, 0, var2805)
	
	return buff_1
end

function t_138.decode(p138)
	-- upvalues: t_138 (ref), protoModule (ref), t (ref)
	local var2805 = t_138.new()
	local var2806 = 0
	while var2806 < buffer.len(p138) do
		local _ = nil
		local var2807 = nil
		local var2808, var2809, var2810 = protoModule.readTag(p138, var2806)
		local var2811 = var2808
		var2807 = var2809
		var2806 = var2810
		
		if var2807 == protoModule.wireTypes.varint then
			if var2811 == 1 then
				local _ = nil
				local var2812, var2813 = protoModule.readVarIntI32(p138, var2806)
				local var2814 = var2812
				var2806 = var2813
				var2805.action_type = t.ActionType.fromNumber(var2814) or var2814
			else
				local _ = nil
				local var2815, var2816 = protoModule.readVarInt(p138, var2806)
				local _ = var2815
				var2806 = var2816
			end
		end
		if var2807 == protoModule.wireTypes.lengthDelimited then
			if var2811 == 2 then
				local _ = nil
				local var2817, var2818 = protoModule.readBuffer(p138, var2806)
				var2806 = var2818
				var2805.action_params = t.OpenAmpWizardAction_Params.decode(var2817)
			else
				local _ = nil
				local var2819, var2820 = protoModule.readVarInt(p138, var2806)
				var2806 = var2820 + var2819
			end
		elseif var2807 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2821, var2822 = protoModule.readFixed32(p138, var2806)
			local _ = var2821
			var2806 = var2822
		elseif var2807 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2823, var2824 = protoModule.readFixed64(p138, var2806)
			local _ = var2823
			var2806 = var2824
		else
			error("Unsupported wire type: " .. var4634)
		end
	end
	return var2805
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
	local var2825 = t_138.new()
	
	if self.action_type ~= nil then
		var2825.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2825.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2825.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2825.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.actionParams)
	end
	return var2825
end

t_138.descriptor = {
	name = "OpenAmpWizardAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAmpWizardAction"
}
t.OpenAmpWizardAction = t_138
typeRegistryModule.default:register(t.OpenAmpWizardAction)
local t_139 = {}
t_139.__index = t_139

function t_139.new(p139)
	-- upvalues: t_139 (ref)
	return setmetatable({
		feature_name = if p139 == nil or p139.feature_name == nil then nil else p139.feature_name,
		name_space = if p139 == nil or p139.name_space == nil then nil else p139.name_space,
		entry_point_event_ctx = if p139 == nil or p139.entry_point_event_ctx == nil then nil else p139.entry_point_event_ctx,
		skip_facial_age_estimation_web_link_modal = if p139 == nil or p139.skip_facial_age_estimation_web_link_modal == nil then nil else p139.skip_facial_age_estimation_web_link_modal
	}, t_139)
end

function t_139:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2825 = 0
	
	if self.feature_name ~= nil then
		local var2826 = self.feature_name:encode()
		local var2827, var2828 = protoModule.writeTag(buff, var2825, 1, protoModule.wireTypes.lengthDelimited)
		var2827, var4658 = protoModule.writeBuffer(var2827, var2828, var2826, buffer.len(var2826))
		buff = var2827
		var2825 = var2828
	end
	if self.name_space ~= nil then
		local var2829 = self.name_space:encode()
		local var2830, var2831 = protoModule.writeTag(buff, var2825, 2, protoModule.wireTypes.lengthDelimited)
		var2830, var4661 = protoModule.writeBuffer(var2830, var2831, var2829, buffer.len(var2829))
		buff = var2830
		var2825 = var2831
	end
	if self.entry_point_event_ctx ~= nil then
		local var2832 = self.entry_point_event_ctx:encode()
		local var2833, var2834 = protoModule.writeTag(buff, var2825, 3, protoModule.wireTypes.lengthDelimited)
		var2833, var4664 = protoModule.writeBuffer(var2833, var2834, var2832, buffer.len(var2832))
		buff = var2833
		var2825 = var2834
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		local var2835 = self.skip_facial_age_estimation_web_link_modal:encode()
		local var2836, var2837 = protoModule.writeTag(buff, var2825, 4, protoModule.wireTypes.lengthDelimited)
		var2836, var4667 = protoModule.writeBuffer(var2836, var2837, var2835, buffer.len(var2835))
		buff = var2836
		var2825 = var2837
	end
	local buff_1 = buffer.create(var2825)
	buffer.copy(buff_1, 0, buff, 0, var2825)
	
	return buff_1
end

function t_139.decode(p139)
	-- upvalues: t_139 (ref), protoModule (ref), propTypesModule (ref)
	local var2825 = t_139.new()
	local var2826 = 0
	while var2826 < buffer.len(p139) do
		local _ = nil
		local var2827 = nil
		local var2828, var2829, var2830 = protoModule.readTag(p139, var2826)
		local var2831 = var2828
		var2827 = var2829
		var2826 = var2830
		
		if var2827 == protoModule.wireTypes.varint then
			local _ = nil
			local var2832, var2833 = protoModule.readVarInt(p139, var2826)
			local _ = var2832
			var2826 = var2833
			continue
		end
		if var2827 == protoModule.wireTypes.lengthDelimited then
			if var2831 == 1 then
				local _ = nil
				local var2834, var2835 = protoModule.readBuffer(p139, var2826)
				var2826 = var2835
				var2825.feature_name = propTypesModule.StringProp.decode(var2834)
			elseif var2831 == 2 then
				local _ = nil
				local var2836, var2837 = protoModule.readBuffer(p139, var2826)
				var2826 = var2837
				var2825.name_space = propTypesModule.StringProp.decode(var2836)
			elseif var2831 == 3 then
				local _ = nil
				local var2838, var2839 = protoModule.readBuffer(p139, var2826)
				var2826 = var2839
				var2825.entry_point_event_ctx = propTypesModule.StringProp.decode(var2838)
			elseif var2831 == 4 then
				local _ = nil
				local var2840, var2841 = protoModule.readBuffer(p139, var2826)
				var2826 = var2841
				var2825.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.decode(var2840)
			else
				local _ = nil
				local var2842, var2843 = protoModule.readVarInt(p139, var2826)
				var2826 = var2843 + var2842
			end
		elseif var2827 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2844, var2845 = protoModule.readFixed32(p139, var2826)
			local _ = var2844
			var2826 = var2845
		elseif var2827 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2846, var2847 = protoModule.readFixed64(p139, var2826)
			local _ = var2846
			var2826 = var2847
		else
			error("Unsupported wire type: " .. var4671)
		end
	end
	return var2825
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
	local var2848 = t_139.new()
	
	if self.feature_name ~= nil then
		var2848.feature_name = propTypesModule.StringProp.jsonDecode(self.feature_name)
	end
	if self.featureName ~= nil then
		var2848.feature_name = propTypesModule.StringProp.jsonDecode(self.featureName)
	end
	if self.name_space ~= nil then
		var2848.name_space = propTypesModule.StringProp.jsonDecode(self.name_space)
	end
	if self.nameSpace ~= nil then
		var2848.name_space = propTypesModule.StringProp.jsonDecode(self.nameSpace)
	end
	if self.entry_point_event_ctx ~= nil then
		var2848.entry_point_event_ctx = propTypesModule.StringProp.jsonDecode(self.entry_point_event_ctx)
	end
	if self.entryPointEventCtx ~= nil then
		var2848.entry_point_event_ctx = propTypesModule.StringProp.jsonDecode(self.entryPointEventCtx)
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		var2848.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.jsonDecode(self.skip_facial_age_estimation_web_link_modal)
	end
	if self.skipFacialAgeEstimationWebLinkModal ~= nil then
		var2848.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.jsonDecode(self.skipFacialAgeEstimationWebLinkModal)
	end
	return var2848
end

t_139.descriptor = {
	name = "OpenAmpWizardAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAmpWizardAction_Params = t_139
typeRegistryModule.default:register(t.OpenAmpWizardAction_Params)
local t_140 = {}
t_140.__index = t_140

function t_140.new(p140)
	-- upvalues: t (ref), t_140 (ref)
	return setmetatable({
		action_type = if p140 == nil or p140.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p140.action_type,
		action_params = if p140 == nil or p140.action_params == nil then nil else p140.action_params
	}, t_140)
end

function t_140:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2848 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2849, var2850 = protoModule.writeTag(buff, var2848, 1, protoModule.wireTypes.varint)
		var2849, var4697 = protoModule.writeVarInt(var2849, var2850, t.ActionType.toNumber(self.action_type))
		buff = var2849
		var2848 = var2850
	end
	if self.action_params ~= nil then
		local var2851 = self.action_params:encode()
		local var2852, var2853 = protoModule.writeTag(buff, var2848, 2, protoModule.wireTypes.lengthDelimited)
		var2852, var4700 = protoModule.writeBuffer(var2852, var2853, var2851, buffer.len(var2851))
		buff = var2852
		var2848 = var2853
	end
	local buff_1 = buffer.create(var2848)
	buffer.copy(buff_1, 0, buff, 0, var2848)
	
	return buff_1
end

function t_140.decode(p140)
	-- upvalues: t_140 (ref), protoModule (ref), t (ref)
	local var2848 = t_140.new()
	local var2849 = 0
	while var2849 < buffer.len(p140) do
		local _ = nil
		local var2850 = nil
		local var2851, var2852, var2853 = protoModule.readTag(p140, var2849)
		local var2854 = var2851
		var2850 = var2852
		var2849 = var2853
		
		if var2850 == protoModule.wireTypes.varint then
			if var2854 == 1 then
				local _ = nil
				local var2855, var2856 = protoModule.readVarIntI32(p140, var2849)
				local var2857 = var2855
				var2849 = var2856
				var2848.action_type = t.ActionType.fromNumber(var2857) or var2857
			else
				local _ = nil
				local var2858, var2859 = protoModule.readVarInt(p140, var2849)
				local _ = var2858
				var2849 = var2859
			end
		end
		if var2850 == protoModule.wireTypes.lengthDelimited then
			if var2854 == 2 then
				local _ = nil
				local var2860, var2861 = protoModule.readBuffer(p140, var2849)
				var2849 = var2861
				var2848.action_params = t.OpenSocialProofUserListSheetAction_Params.decode(var2860)
			else
				local _ = nil
				local var2862, var2863 = protoModule.readVarInt(p140, var2849)
				var2849 = var2863 + var2862
			end
		elseif var2850 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2864, var2865 = protoModule.readFixed32(p140, var2849)
			local _ = var2864
			var2849 = var2865
		elseif var2850 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2866, var2867 = protoModule.readFixed64(p140, var2849)
			local _ = var2866
			var2849 = var2867
		else
			error("Unsupported wire type: " .. var4704)
		end
	end
	return var2848
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
	local var2868 = t_140.new()
	
	if self.action_type ~= nil then
		var2868.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2868.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2868.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2868.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.actionParams)
	end
	return var2868
end

t_140.descriptor = {
	name = "OpenSocialProofUserListSheetAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSocialProofUserListSheetAction"
}
t.OpenSocialProofUserListSheetAction = t_140
typeRegistryModule.default:register(t.OpenSocialProofUserListSheetAction)
local t_141 = {}
t_141.__index = t_141

function t_141.new(p141)
	-- upvalues: t_141 (ref)
	return setmetatable({
		universe_id = if p141 == nil or p141.universe_id == nil then nil else p141.universe_id,
		place_id = if p141 == nil or p141.place_id == nil then nil else p141.place_id,
		total_connections = if p141 == nil or p141.total_connections == nil then nil else p141.total_connections,
		user_ids = if p141 == nil or p141.user_ids == nil then nil else p141.user_ids,
		sheet_title = if p141 == nil or p141.sheet_title == nil then nil else p141.sheet_title
	}, t_141)
end

function t_141:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2868 = 0
	
	if self.universe_id ~= nil then
		local var2869 = self.universe_id:encode()
		local var2870, var2871 = protoModule.writeTag(buff, var2868, 1, protoModule.wireTypes.lengthDelimited)
		var2870, var4728 = protoModule.writeBuffer(var2870, var2871, var2869, buffer.len(var2869))
		buff = var2870
		var2868 = var2871
	end
	if self.place_id ~= nil then
		local var2872 = self.place_id:encode()
		local var2873, var2874 = protoModule.writeTag(buff, var2868, 2, protoModule.wireTypes.lengthDelimited)
		var2873, var4731 = protoModule.writeBuffer(var2873, var2874, var2872, buffer.len(var2872))
		buff = var2873
		var2868 = var2874
	end
	if self.total_connections ~= nil then
		local var2875 = self.total_connections:encode()
		local var2876, var2877 = protoModule.writeTag(buff, var2868, 3, protoModule.wireTypes.lengthDelimited)
		var2876, var4734 = protoModule.writeBuffer(var2876, var2877, var2875, buffer.len(var2875))
		buff = var2876
		var2868 = var2877
	end
	if self.user_ids ~= nil then
		local var2878 = self.user_ids:encode()
		local var2879, var2880 = protoModule.writeTag(buff, var2868, 4, protoModule.wireTypes.lengthDelimited)
		var2879, var4737 = protoModule.writeBuffer(var2879, var2880, var2878, buffer.len(var2878))
		buff = var2879
		var2868 = var2880
	end
	if self.sheet_title ~= nil then
		local var2881 = self.sheet_title:encode()
		local var2882, var2883 = protoModule.writeTag(buff, var2868, 5, protoModule.wireTypes.lengthDelimited)
		var2882, var4740 = protoModule.writeBuffer(var2882, var2883, var2881, buffer.len(var2881))
		buff = var2882
		var2868 = var2883
	end
	local buff_1 = buffer.create(var2868)
	buffer.copy(buff_1, 0, buff, 0, var2868)
	
	return buff_1
end

function t_141.decode(p141)
	-- upvalues: t_141 (ref), protoModule (ref), propTypesModule (ref)
	local var2868 = t_141.new()
	local var2869 = 0
	while var2869 < buffer.len(p141) do
		local _ = nil
		local var2870 = nil
		local var2871, var2872, var2873 = protoModule.readTag(p141, var2869)
		local var2874 = var2871
		var2870 = var2872
		var2869 = var2873
		
		if var2870 == protoModule.wireTypes.varint then
			local _ = nil
			local var2875, var2876 = protoModule.readVarInt(p141, var2869)
			local _ = var2875
			var2869 = var2876
			continue
		end
		if var2870 == protoModule.wireTypes.lengthDelimited then
			if var2874 == 1 then
				local _ = nil
				local var2877, var2878 = protoModule.readBuffer(p141, var2869)
				var2869 = var2878
				var2868.universe_id = propTypesModule.StringProp.decode(var2877)
			elseif var2874 == 2 then
				local _ = nil
				local var2879, var2880 = protoModule.readBuffer(p141, var2869)
				var2869 = var2880
				var2868.place_id = propTypesModule.StringProp.decode(var2879)
			elseif var2874 == 3 then
				local _ = nil
				local var2881, var2882 = protoModule.readBuffer(p141, var2869)
				var2869 = var2882
				var2868.total_connections = propTypesModule.Int32Prop.decode(var2881)
			elseif var2874 == 4 then
				local _ = nil
				local var2883, var2884 = protoModule.readBuffer(p141, var2869)
				var2869 = var2884
				var2868.user_ids = propTypesModule.ArrayOfAvatarProp.decode(var2883)
			elseif var2874 == 5 then
				local _ = nil
				local var2885, var2886 = protoModule.readBuffer(p141, var2869)
				var2869 = var2886
				var2868.sheet_title = propTypesModule.StringProp.decode(var2885)
			else
				local _ = nil
				local var2887, var2888 = protoModule.readVarInt(p141, var2869)
				var2869 = var2888 + var2887
			end
		elseif var2870 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2889, var2890 = protoModule.readFixed32(p141, var2869)
			local _ = var2889
			var2869 = var2890
		elseif var2870 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2891, var2892 = protoModule.readFixed64(p141, var2869)
			local _ = var2891
			var2869 = var2892
		else
			error("Unsupported wire type: " .. var4744)
		end
	end
	return var2868
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
	local var2893 = t_141.new()
	
	if self.universe_id ~= nil then
		var2893.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2893.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var2893.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var2893.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.total_connections ~= nil then
		var2893.total_connections = propTypesModule.Int32Prop.jsonDecode(self.total_connections)
	end
	if self.totalConnections ~= nil then
		var2893.total_connections = propTypesModule.Int32Prop.jsonDecode(self.totalConnections)
	end
	if self.user_ids ~= nil then
		var2893.user_ids = propTypesModule.ArrayOfAvatarProp.jsonDecode(self.user_ids)
	end
	if self.userIds ~= nil then
		var2893.user_ids = propTypesModule.ArrayOfAvatarProp.jsonDecode(self.userIds)
	end
	if self.sheet_title ~= nil then
		var2893.sheet_title = propTypesModule.StringProp.jsonDecode(self.sheet_title)
	end
	if self.sheetTitle ~= nil then
		var2893.sheet_title = propTypesModule.StringProp.jsonDecode(self.sheetTitle)
	end
	return var2893
end

t_141.descriptor = {
	name = "OpenSocialProofUserListSheetAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSocialProofUserListSheetAction_Params = t_141
typeRegistryModule.default:register(t.OpenSocialProofUserListSheetAction_Params)
local t_142 = {}
t_142.__index = t_142

function t_142.new(p142)
	-- upvalues: t (ref), t_142 (ref)
	return setmetatable({
		action_type = if p142 == nil or p142.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p142.action_type,
		action_params = if p142 == nil or p142.action_params == nil then nil else p142.action_params
	}, t_142)
end

function t_142:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2893 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2894, var2895 = protoModule.writeTag(buff, var2893, 1, protoModule.wireTypes.varint)
		var2894, var4772 = protoModule.writeVarInt(var2894, var2895, t.ActionType.toNumber(self.action_type))
		buff = var2894
		var2893 = var2895
	end
	if self.action_params ~= nil then
		local var2896 = self.action_params:encode()
		local var2897, var2898 = protoModule.writeTag(buff, var2893, 2, protoModule.wireTypes.lengthDelimited)
		var2897, var4775 = protoModule.writeBuffer(var2897, var2898, var2896, buffer.len(var2896))
		buff = var2897
		var2893 = var2898
	end
	local buff_1 = buffer.create(var2893)
	buffer.copy(buff_1, 0, buff, 0, var2893)
	
	return buff_1
end

function t_142.decode(p142)
	-- upvalues: t_142 (ref), protoModule (ref), t (ref)
	local var2893 = t_142.new()
	local var2894 = 0
	while var2894 < buffer.len(p142) do
		local _ = nil
		local var2895 = nil
		local var2896, var2897, var2898 = protoModule.readTag(p142, var2894)
		local var2899 = var2896
		var2895 = var2897
		var2894 = var2898
		
		if var2895 == protoModule.wireTypes.varint then
			if var2899 == 1 then
				local _ = nil
				local var2900, var2901 = protoModule.readVarIntI32(p142, var2894)
				local var2902 = var2900
				var2894 = var2901
				var2893.action_type = t.ActionType.fromNumber(var2902) or var2902
			else
				local _ = nil
				local var2903, var2904 = protoModule.readVarInt(p142, var2894)
				local _ = var2903
				var2894 = var2904
			end
		end
		if var2895 == protoModule.wireTypes.lengthDelimited then
			if var2899 == 2 then
				local _ = nil
				local var2905, var2906 = protoModule.readBuffer(p142, var2894)
				var2894 = var2906
				var2893.action_params = t.OpenSearchResultsTabAction_Params.decode(var2905)
			else
				local _ = nil
				local var2907, var2908 = protoModule.readVarInt(p142, var2894)
				var2894 = var2908 + var2907
			end
		elseif var2895 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2909, var2910 = protoModule.readFixed32(p142, var2894)
			local _ = var2909
			var2894 = var2910
		elseif var2895 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2911, var2912 = protoModule.readFixed64(p142, var2894)
			local _ = var2911
			var2894 = var2912
		else
			error("Unsupported wire type: " .. var4779)
		end
	end
	return var2893
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
	local var2913 = t_142.new()
	
	if self.action_type ~= nil then
		var2913.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2913.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2913.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2913.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.actionParams)
	end
	return var2913
end

t_142.descriptor = {
	name = "OpenSearchResultsTabAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSearchResultsTabAction"
}
t.OpenSearchResultsTabAction = t_142
typeRegistryModule.default:register(t.OpenSearchResultsTabAction)
local t_143 = {}
t_143.__index = t_143

function t_143.new(p143)
	-- upvalues: t_143 (ref)
	return setmetatable({
		search_type = if p143 == nil or p143.search_type == nil then nil else p143.search_type
	}, t_143)
end

function t_143:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2913 = 0
	
	if self.search_type ~= nil then
		local var2914 = self.search_type:encode()
		local var2915, var2916 = protoModule.writeTag(buff, var2913, 1, protoModule.wireTypes.lengthDelimited)
		var2915, var4803 = protoModule.writeBuffer(var2915, var2916, var2914, buffer.len(var2914))
		buff = var2915
		var2913 = var2916
	end
	local buff_1 = buffer.create(var2913)
	buffer.copy(buff_1, 0, buff, 0, var2913)
	
	return buff_1
end

function t_143.decode(p143)
	-- upvalues: t_143 (ref), protoModule (ref), propTypesModule (ref)
	local var2913 = t_143.new()
	local var2914 = 0
	while var2914 < buffer.len(p143) do
		local _ = nil
		local var2915 = nil
		local var2916, var2917, var2918 = protoModule.readTag(p143, var2914)
		local var2919 = var2916
		var2915 = var2917
		var2914 = var2918
		
		if var2915 == protoModule.wireTypes.varint then
			local _ = nil
			local var2920, var2921 = protoModule.readVarInt(p143, var2914)
			local _ = var2920
			var2914 = var2921
			continue
		end
		if var2915 == protoModule.wireTypes.lengthDelimited then
			if var2919 == 1 then
				local _ = nil
				local var2922, var2923 = protoModule.readBuffer(p143, var2914)
				var2914 = var2923
				var2913.search_type = propTypesModule.StringProp.decode(var2922)
			else
				local _ = nil
				local var2924, var2925 = protoModule.readVarInt(p143, var2914)
				var2914 = var2925 + var2924
			end
		elseif var2915 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2926, var2927 = protoModule.readFixed32(p143, var2914)
			local _ = var2926
			var2914 = var2927
		elseif var2915 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2928, var2929 = protoModule.readFixed64(p143, var2914)
			local _ = var2928
			var2914 = var2929
		else
			error("Unsupported wire type: " .. var4807)
		end
	end
	return var2913
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
	local var2930 = t_143.new()
	
	if self.search_type ~= nil then
		var2930.search_type = propTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		var2930.search_type = propTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return var2930
end

t_143.descriptor = {
	name = "OpenSearchResultsTabAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSearchResultsTabAction_Params = t_143
typeRegistryModule.default:register(t.OpenSearchResultsTabAction_Params)
local t_144 = {}
t_144.__index = t_144

function t_144.new(p144)
	-- upvalues: t (ref), t_144 (ref)
	return setmetatable({
		action_type = if p144 == nil or p144.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p144.action_type,
		action_params = if p144 == nil or p144.action_params == nil then nil else p144.action_params
	}, t_144)
end

function t_144:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2930 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2931, var2932 = protoModule.writeTag(buff, var2930, 1, protoModule.wireTypes.varint)
		var2931, var4827 = protoModule.writeVarInt(var2931, var2932, t.ActionType.toNumber(self.action_type))
		buff = var2931
		var2930 = var2932
	end
	if self.action_params ~= nil then
		local var2933 = self.action_params:encode()
		local var2934, var2935 = protoModule.writeTag(buff, var2930, 2, protoModule.wireTypes.lengthDelimited)
		var2934, var4830 = protoModule.writeBuffer(var2934, var2935, var2933, buffer.len(var2933))
		buff = var2934
		var2930 = var2935
	end
	local buff_1 = buffer.create(var2930)
	buffer.copy(buff_1, 0, buff, 0, var2930)
	
	return buff_1
end

function t_144.decode(p144)
	-- upvalues: t_144 (ref), protoModule (ref), t (ref)
	local var2930 = t_144.new()
	local var2931 = 0
	while var2931 < buffer.len(p144) do
		local _ = nil
		local var2932 = nil
		local var2933, var2934, var2935 = protoModule.readTag(p144, var2931)
		local var2936 = var2933
		var2932 = var2934
		var2931 = var2935
		
		if var2932 == protoModule.wireTypes.varint then
			if var2936 == 1 then
				local _ = nil
				local var2937, var2938 = protoModule.readVarIntI32(p144, var2931)
				local var2939 = var2937
				var2931 = var2938
				var2930.action_type = t.ActionType.fromNumber(var2939) or var2939
			else
				local _ = nil
				local var2940, var2941 = protoModule.readVarInt(p144, var2931)
				local _ = var2940
				var2931 = var2941
			end
		end
		if var2932 == protoModule.wireTypes.lengthDelimited then
			if var2936 == 2 then
				local _ = nil
				local var2942, var2943 = protoModule.readBuffer(p144, var2931)
				var2931 = var2943
				var2930.action_params = t.DismissPromptAction_Params.decode(var2942)
			else
				local _ = nil
				local var2944, var2945 = protoModule.readVarInt(p144, var2931)
				var2931 = var2945 + var2944
			end
		elseif var2932 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2946, var2947 = protoModule.readFixed32(p144, var2931)
			local _ = var2946
			var2931 = var2947
		elseif var2932 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2948, var2949 = protoModule.readFixed64(p144, var2931)
			local _ = var2948
			var2931 = var2949
		else
			error("Unsupported wire type: " .. var4834)
		end
	end
	return var2930
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
	local var2950 = t_144.new()
	
	if self.action_type ~= nil then
		var2950.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2950.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2950.action_params = t.DismissPromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2950.action_params = t.DismissPromptAction_Params.jsonDecode(self.actionParams)
	end
	return var2950
end

t_144.descriptor = {
	name = "DismissPromptAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissPromptAction"
}
t.DismissPromptAction = t_144
typeRegistryModule.default:register(t.DismissPromptAction)
local t_145 = {}
t_145.__index = t_145

function t_145.new(p145)
	-- upvalues: t_145 (ref)
	return setmetatable({
		prompt_type = if p145 == nil or p145.prompt_type == nil then nil else p145.prompt_type,
		prompt_id = if p145 == nil or p145.prompt_id == nil then nil else p145.prompt_id,
		entity_type = if p145 == nil or p145.entity_type == nil then nil else p145.entity_type,
		entity_id = if p145 == nil or p145.entity_id == nil then nil else p145.entity_id
	}, t_145)
end

function t_145:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2950 = 0
	
	if self.prompt_type ~= nil then
		local var2951 = self.prompt_type:encode()
		local var2952, var2953 = protoModule.writeTag(buff, var2950, 1, protoModule.wireTypes.lengthDelimited)
		var2952, var4858 = protoModule.writeBuffer(var2952, var2953, var2951, buffer.len(var2951))
		buff = var2952
		var2950 = var2953
	end
	if self.prompt_id ~= nil then
		local var2954 = self.prompt_id:encode()
		local var2955, var2956 = protoModule.writeTag(buff, var2950, 2, protoModule.wireTypes.lengthDelimited)
		var2955, var4861 = protoModule.writeBuffer(var2955, var2956, var2954, buffer.len(var2954))
		buff = var2955
		var2950 = var2956
	end
	if self.entity_type ~= nil then
		local var2957 = self.entity_type:encode()
		local var2958, var2959 = protoModule.writeTag(buff, var2950, 3, protoModule.wireTypes.lengthDelimited)
		var2958, var4864 = protoModule.writeBuffer(var2958, var2959, var2957, buffer.len(var2957))
		buff = var2958
		var2950 = var2959
	end
	if self.entity_id ~= nil then
		local var2960 = self.entity_id:encode()
		local var2961, var2962 = protoModule.writeTag(buff, var2950, 4, protoModule.wireTypes.lengthDelimited)
		var2961, var4867 = protoModule.writeBuffer(var2961, var2962, var2960, buffer.len(var2960))
		buff = var2961
		var2950 = var2962
	end
	local buff_1 = buffer.create(var2950)
	buffer.copy(buff_1, 0, buff, 0, var2950)
	
	return buff_1
end

function t_145.decode(p145)
	-- upvalues: t_145 (ref), protoModule (ref), propTypesModule (ref)
	local var2950 = t_145.new()
	local var2951 = 0
	while var2951 < buffer.len(p145) do
		local _ = nil
		local var2952 = nil
		local var2953, var2954, var2955 = protoModule.readTag(p145, var2951)
		local var2956 = var2953
		var2952 = var2954
		var2951 = var2955
		
		if var2952 == protoModule.wireTypes.varint then
			local _ = nil
			local var2957, var2958 = protoModule.readVarInt(p145, var2951)
			local _ = var2957
			var2951 = var2958
			continue
		end
		if var2952 == protoModule.wireTypes.lengthDelimited then
			if var2956 == 1 then
				local _ = nil
				local var2959, var2960 = protoModule.readBuffer(p145, var2951)
				var2951 = var2960
				var2950.prompt_type = propTypesModule.StringProp.decode(var2959)
			elseif var2956 == 2 then
				local _ = nil
				local var2961, var2962 = protoModule.readBuffer(p145, var2951)
				var2951 = var2962
				var2950.prompt_id = propTypesModule.StringProp.decode(var2961)
			elseif var2956 == 3 then
				local _ = nil
				local var2963, var2964 = protoModule.readBuffer(p145, var2951)
				var2951 = var2964
				var2950.entity_type = propTypesModule.StringProp.decode(var2963)
			elseif var2956 == 4 then
				local _ = nil
				local var2965, var2966 = protoModule.readBuffer(p145, var2951)
				var2951 = var2966
				var2950.entity_id = propTypesModule.StringProp.decode(var2965)
			else
				local _ = nil
				local var2967, var2968 = protoModule.readVarInt(p145, var2951)
				var2951 = var2968 + var2967
			end
		elseif var2952 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2969, var2970 = protoModule.readFixed32(p145, var2951)
			local _ = var2969
			var2951 = var2970
		elseif var2952 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2971, var2972 = protoModule.readFixed64(p145, var2951)
			local _ = var2971
			var2951 = var2972
		else
			error("Unsupported wire type: " .. var4871)
		end
	end
	return var2950
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
	local var2973 = t_145.new()
	
	if self.prompt_type ~= nil then
		var2973.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var2973.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var2973.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var2973.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.entity_type ~= nil then
		var2973.entity_type = propTypesModule.StringProp.jsonDecode(self.entity_type)
	end
	if self.entityType ~= nil then
		var2973.entity_type = propTypesModule.StringProp.jsonDecode(self.entityType)
	end
	if self.entity_id ~= nil then
		var2973.entity_id = propTypesModule.StringProp.jsonDecode(self.entity_id)
	end
	if self.entityId ~= nil then
		var2973.entity_id = propTypesModule.StringProp.jsonDecode(self.entityId)
	end
	return var2973
end

t_145.descriptor = {
	name = "DismissPromptAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissPromptAction_Params = t_145
typeRegistryModule.default:register(t.DismissPromptAction_Params)
local t_146 = {}
t_146.__index = t_146

function t_146.new(p146)
	-- upvalues: t (ref), t_146 (ref)
	return setmetatable({
		action_type = if p146 == nil or p146.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p146.action_type,
		action_params = if p146 == nil or p146.action_params == nil then nil else p146.action_params
	}, t_146)
end

function t_146:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2973 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2974, var2975 = protoModule.writeTag(buff, var2973, 1, protoModule.wireTypes.varint)
		var2974, var4897 = protoModule.writeVarInt(var2974, var2975, t.ActionType.toNumber(self.action_type))
		buff = var2974
		var2973 = var2975
	end
	if self.action_params ~= nil then
		local var2976 = self.action_params:encode()
		local var2977, var2978 = protoModule.writeTag(buff, var2973, 2, protoModule.wireTypes.lengthDelimited)
		var2977, var4900 = protoModule.writeBuffer(var2977, var2978, var2976, buffer.len(var2976))
		buff = var2977
		var2973 = var2978
	end
	local buff_1 = buffer.create(var2973)
	buffer.copy(buff_1, 0, buff, 0, var2973)
	
	return buff_1
end

function t_146.decode(p146)
	-- upvalues: t_146 (ref), protoModule (ref), t (ref)
	local var2973 = t_146.new()
	local var2974 = 0
	while var2974 < buffer.len(p146) do
		local _ = nil
		local var2975 = nil
		local var2976, var2977, var2978 = protoModule.readTag(p146, var2974)
		local var2979 = var2976
		var2975 = var2977
		var2974 = var2978
		
		if var2975 == protoModule.wireTypes.varint then
			if var2979 == 1 then
				local _ = nil
				local var2980, var2981 = protoModule.readVarIntI32(p146, var2974)
				local var2982 = var2980
				var2974 = var2981
				var2973.action_type = t.ActionType.fromNumber(var2982) or var2982
			else
				local _ = nil
				local var2983, var2984 = protoModule.readVarInt(p146, var2974)
				local _ = var2983
				var2974 = var2984
			end
		end
		if var2975 == protoModule.wireTypes.lengthDelimited then
			if var2979 == 2 then
				local _ = nil
				local var2985, var2986 = protoModule.readBuffer(p146, var2974)
				var2974 = var2986
				var2973.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.decode(var2985)
			else
				local _ = nil
				local var2987, var2988 = protoModule.readVarInt(p146, var2974)
				var2974 = var2988 + var2987
			end
		elseif var2975 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2989, var2990 = protoModule.readFixed32(p146, var2974)
			local _ = var2989
			var2974 = var2990
		elseif var2975 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2991, var2992 = protoModule.readFixed64(p146, var2974)
			local _ = var2991
			var2974 = var2992
		else
			error("Unsupported wire type: " .. var4904)
		end
	end
	return var2973
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
	local var2993 = t_146.new()
	
	if self.action_type ~= nil then
		var2993.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2993.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2993.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2993.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.actionParams)
	end
	return var2993
end

t_146.descriptor = {
	name = "RecordPartyChatConversationUpsellAcknowledgementAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecordPartyChatConversationUpsellAcknowledgementAction"
}
t.RecordPartyChatConversationUpsellAcknowledgementAction = t_146
typeRegistryModule.default:register(t.RecordPartyChatConversationUpsellAcknowledgementAction)
local t_147 = {}
t_147.__index = t_147

function t_147.new(p147)
	-- upvalues: t_147 (ref)
	return setmetatable({
		modal_action = if p147 == nil or p147.modal_action == nil then nil else p147.modal_action,
		modal_variant = if p147 == nil or p147.modal_variant == nil then nil else p147.modal_variant,
		modal_sequence = if p147 == nil or p147.modal_sequence == nil then nil else p147.modal_sequence,
		conversation_id = if p147 == nil or p147.conversation_id == nil then nil else p147.conversation_id,
		friend_id = if p147 == nil or p147.friend_id == nil then nil else p147.friend_id
	}, t_147)
end

function t_147:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2993 = 0
	
	if self.modal_action ~= nil then
		local var2994 = self.modal_action:encode()
		local var2995, var2996 = protoModule.writeTag(buff, var2993, 1, protoModule.wireTypes.lengthDelimited)
		var2995, var4928 = protoModule.writeBuffer(var2995, var2996, var2994, buffer.len(var2994))
		buff = var2995
		var2993 = var2996
	end
	if self.modal_variant ~= nil then
		local var2997 = self.modal_variant:encode()
		local var2998, var2999 = protoModule.writeTag(buff, var2993, 2, protoModule.wireTypes.lengthDelimited)
		var2998, var4931 = protoModule.writeBuffer(var2998, var2999, var2997, buffer.len(var2997))
		buff = var2998
		var2993 = var2999
	end
	if self.modal_sequence ~= nil then
		local var3000 = self.modal_sequence:encode()
		local var3001, var3002 = protoModule.writeTag(buff, var2993, 3, protoModule.wireTypes.lengthDelimited)
		var3001, var4934 = protoModule.writeBuffer(var3001, var3002, var3000, buffer.len(var3000))
		buff = var3001
		var2993 = var3002
	end
	if self.conversation_id ~= nil then
		local var3003 = self.conversation_id:encode()
		local var3004, var3005 = protoModule.writeTag(buff, var2993, 4, protoModule.wireTypes.lengthDelimited)
		var3004, var4937 = protoModule.writeBuffer(var3004, var3005, var3003, buffer.len(var3003))
		buff = var3004
		var2993 = var3005
	end
	if self.friend_id ~= nil then
		local var3006 = self.friend_id:encode()
		local var3007, var3008 = protoModule.writeTag(buff, var2993, 5, protoModule.wireTypes.lengthDelimited)
		var3007, var4940 = protoModule.writeBuffer(var3007, var3008, var3006, buffer.len(var3006))
		buff = var3007
		var2993 = var3008
	end
	local buff_1 = buffer.create(var2993)
	buffer.copy(buff_1, 0, buff, 0, var2993)
	
	return buff_1
end

function t_147.decode(p147)
	-- upvalues: t_147 (ref), protoModule (ref), propTypesModule (ref)
	local var2993 = t_147.new()
	local var2994 = 0
	while var2994 < buffer.len(p147) do
		local _ = nil
		local var2995 = nil
		local var2996, var2997, var2998 = protoModule.readTag(p147, var2994)
		local var2999 = var2996
		var2995 = var2997
		var2994 = var2998
		
		if var2995 == protoModule.wireTypes.varint then
			local _ = nil
			local var3000, var3001 = protoModule.readVarInt(p147, var2994)
			local _ = var3000
			var2994 = var3001
			continue
		end
		if var2995 == protoModule.wireTypes.lengthDelimited then
			if var2999 == 1 then
				local _ = nil
				local var3002, var3003 = protoModule.readBuffer(p147, var2994)
				var2994 = var3003
				var2993.modal_action = propTypesModule.StringProp.decode(var3002)
			elseif var2999 == 2 then
				local _ = nil
				local var3004, var3005 = protoModule.readBuffer(p147, var2994)
				var2994 = var3005
				var2993.modal_variant = propTypesModule.StringProp.decode(var3004)
			elseif var2999 == 3 then
				local _ = nil
				local var3006, var3007 = protoModule.readBuffer(p147, var2994)
				var2994 = var3007
				var2993.modal_sequence = propTypesModule.StringProp.decode(var3006)
			elseif var2999 == 4 then
				local _ = nil
				local var3008, var3009 = protoModule.readBuffer(p147, var2994)
				var2994 = var3009
				var2993.conversation_id = propTypesModule.StringProp.decode(var3008)
			elseif var2999 == 5 then
				local _ = nil
				local var3010, var3011 = protoModule.readBuffer(p147, var2994)
				var2994 = var3011
				var2993.friend_id = propTypesModule.StringProp.decode(var3010)
			else
				local _ = nil
				local var3012, var3013 = protoModule.readVarInt(p147, var2994)
				var2994 = var3013 + var3012
			end
		elseif var2995 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3014, var3015 = protoModule.readFixed32(p147, var2994)
			local _ = var3014
			var2994 = var3015
		elseif var2995 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3016, var3017 = protoModule.readFixed64(p147, var2994)
			local _ = var3016
			var2994 = var3017
		else
			error("Unsupported wire type: " .. var4944)
		end
	end
	return var2993
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
	local var3018 = t_147.new()
	
	if self.modal_action ~= nil then
		var3018.modal_action = propTypesModule.StringProp.jsonDecode(self.modal_action)
	end
	if self.modalAction ~= nil then
		var3018.modal_action = propTypesModule.StringProp.jsonDecode(self.modalAction)
	end
	if self.modal_variant ~= nil then
		var3018.modal_variant = propTypesModule.StringProp.jsonDecode(self.modal_variant)
	end
	if self.modalVariant ~= nil then
		var3018.modal_variant = propTypesModule.StringProp.jsonDecode(self.modalVariant)
	end
	if self.modal_sequence ~= nil then
		var3018.modal_sequence = propTypesModule.StringProp.jsonDecode(self.modal_sequence)
	end
	if self.modalSequence ~= nil then
		var3018.modal_sequence = propTypesModule.StringProp.jsonDecode(self.modalSequence)
	end
	if self.conversation_id ~= nil then
		var3018.conversation_id = propTypesModule.StringProp.jsonDecode(self.conversation_id)
	end
	if self.conversationId ~= nil then
		var3018.conversation_id = propTypesModule.StringProp.jsonDecode(self.conversationId)
	end
	if self.friend_id ~= nil then
		var3018.friend_id = propTypesModule.StringProp.jsonDecode(self.friend_id)
	end
	if self.friendId ~= nil then
		var3018.friend_id = propTypesModule.StringProp.jsonDecode(self.friendId)
	end
	return var3018
end

t_147.descriptor = {
	name = "RecordPartyChatConversationUpsellAcknowledgementAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RecordPartyChatConversationUpsellAcknowledgementAction_Params = t_147
typeRegistryModule.default:register(t.RecordPartyChatConversationUpsellAcknowledgementAction_Params)
local t_148 = {}
t_148.__index = t_148

function t_148.new(p148)
	-- upvalues: t (ref), t_148 (ref)
	return setmetatable({
		action_type = if p148 == nil or p148.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p148.action_type,
		action_params = if p148 == nil or p148.action_params == nil then nil else p148.action_params
	}, t_148)
end

function t_148:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3018 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3019, var3020 = protoModule.writeTag(buff, var3018, 1, protoModule.wireTypes.varint)
		var3019, var4972 = protoModule.writeVarInt(var3019, var3020, t.ActionType.toNumber(self.action_type))
		buff = var3019
		var3018 = var3020
	end
	if self.action_params ~= nil then
		local var3021 = self.action_params:encode()
		local var3022, var3023 = protoModule.writeTag(buff, var3018, 2, protoModule.wireTypes.lengthDelimited)
		var3022, var4975 = protoModule.writeBuffer(var3022, var3023, var3021, buffer.len(var3021))
		buff = var3022
		var3018 = var3023
	end
	local buff_1 = buffer.create(var3018)
	buffer.copy(buff_1, 0, buff, 0, var3018)
	
	return buff_1
end

function t_148.decode(p148)
	-- upvalues: t_148 (ref), protoModule (ref), t (ref)
	local var3018 = t_148.new()
	local var3019 = 0
	while var3019 < buffer.len(p148) do
		local _ = nil
		local var3020 = nil
		local var3021, var3022, var3023 = protoModule.readTag(p148, var3019)
		local var3024 = var3021
		var3020 = var3022
		var3019 = var3023
		
		if var3020 == protoModule.wireTypes.varint then
			if var3024 == 1 then
				local _ = nil
				local var3025, var3026 = protoModule.readVarIntI32(p148, var3019)
				local var3027 = var3025
				var3019 = var3026
				var3018.action_type = t.ActionType.fromNumber(var3027) or var3027
			else
				local _ = nil
				local var3028, var3029 = protoModule.readVarInt(p148, var3019)
				local _ = var3028
				var3019 = var3029
			end
		end
		if var3020 == protoModule.wireTypes.lengthDelimited then
			if var3024 == 2 then
				local _ = nil
				local var3030, var3031 = protoModule.readBuffer(p148, var3019)
				var3019 = var3031
				var3018.action_params = t.RequestFriendshipAction_Params.decode(var3030)
			else
				local _ = nil
				local var3032, var3033 = protoModule.readVarInt(p148, var3019)
				var3019 = var3033 + var3032
			end
		elseif var3020 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3034, var3035 = protoModule.readFixed32(p148, var3019)
			local _ = var3034
			var3019 = var3035
		elseif var3020 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3036, var3037 = protoModule.readFixed64(p148, var3019)
			local _ = var3036
			var3019 = var3037
		else
			error("Unsupported wire type: " .. var4979)
		end
	end
	return var3018
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
	local var3038 = t_148.new()
	
	if self.action_type ~= nil then
		var3038.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3038.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3038.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3038.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.actionParams)
	end
	return var3038
end

t_148.descriptor = {
	name = "RequestFriendshipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RequestFriendshipAction"
}
t.RequestFriendshipAction = t_148
typeRegistryModule.default:register(t.RequestFriendshipAction)
local t_149 = {}
t_149.__index = t_149

function t_149.new(p149)
	-- upvalues: t_149 (ref)
	return setmetatable({
		target_user_id = if p149 == nil or p149.target_user_id == nil then nil else p149.target_user_id,
		source = if p149 == nil or p149.source == nil then nil else p149.source
	}, t_149)
end

function t_149:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3038 = 0
	
	if self.target_user_id ~= nil then
		local var3039 = self.target_user_id:encode()
		local var3040, var3041 = protoModule.writeTag(buff, var3038, 1, protoModule.wireTypes.lengthDelimited)
		var3040, var5003 = protoModule.writeBuffer(var3040, var3041, var3039, buffer.len(var3039))
		buff = var3040
		var3038 = var3041
	end
	if self.source ~= nil then
		local var3042 = self.source:encode()
		local var3043, var3044 = protoModule.writeTag(buff, var3038, 2, protoModule.wireTypes.lengthDelimited)
		var3043, var5006 = protoModule.writeBuffer(var3043, var3044, var3042, buffer.len(var3042))
		buff = var3043
		var3038 = var3044
	end
	local buff_1 = buffer.create(var3038)
	buffer.copy(buff_1, 0, buff, 0, var3038)
	
	return buff_1
end

function t_149.decode(p149)
	-- upvalues: t_149 (ref), protoModule (ref), propTypesModule (ref)
	local var3038 = t_149.new()
	local var3039 = 0
	while var3039 < buffer.len(p149) do
		local _ = nil
		local var3040 = nil
		local var3041, var3042, var3043 = protoModule.readTag(p149, var3039)
		local var3044 = var3041
		var3040 = var3042
		var3039 = var3043
		
		if var3040 == protoModule.wireTypes.varint then
			local _ = nil
			local var3045, var3046 = protoModule.readVarInt(p149, var3039)
			local _ = var3045
			var3039 = var3046
			continue
		end
		if var3040 == protoModule.wireTypes.lengthDelimited then
			if var3044 == 1 then
				local _ = nil
				local var3047, var3048 = protoModule.readBuffer(p149, var3039)
				var3039 = var3048
				var3038.target_user_id = propTypesModule.StringProp.decode(var3047)
			elseif var3044 == 2 then
				local _ = nil
				local var3049, var3050 = protoModule.readBuffer(p149, var3039)
				var3039 = var3050
				var3038.source = propTypesModule.StringProp.decode(var3049)
			else
				local _ = nil
				local var3051, var3052 = protoModule.readVarInt(p149, var3039)
				var3039 = var3052 + var3051
			end
		elseif var3040 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3053, var3054 = protoModule.readFixed32(p149, var3039)
			local _ = var3053
			var3039 = var3054
		elseif var3040 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3055, var3056 = protoModule.readFixed64(p149, var3039)
			local _ = var3055
			var3039 = var3056
		else
			error("Unsupported wire type: " .. var5010)
		end
	end
	return var3038
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
	local var3057 = t_149.new()
	
	if self.target_user_id ~= nil then
		var3057.target_user_id = propTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		var3057.target_user_id = propTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	if self.source ~= nil then
		var3057.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var3057
end

t_149.descriptor = {
	name = "RequestFriendshipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RequestFriendshipAction_Params = t_149
typeRegistryModule.default:register(t.RequestFriendshipAction_Params)
local t_150 = {}
t_150.__index = t_150

function t_150.new(p150)
	-- upvalues: t (ref), t_150 (ref)
	return setmetatable({
		action_type = if p150 == nil or p150.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p150.action_type,
		action_params = if p150 == nil or p150.action_params == nil then nil else p150.action_params
	}, t_150)
end

function t_150:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3057 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3058, var3059 = protoModule.writeTag(buff, var3057, 1, protoModule.wireTypes.varint)
		var3058, var5032 = protoModule.writeVarInt(var3058, var3059, t.ActionType.toNumber(self.action_type))
		buff = var3058
		var3057 = var3059
	end
	if self.action_params ~= nil then
		local var3060 = self.action_params:encode()
		local var3061, var3062 = protoModule.writeTag(buff, var3057, 2, protoModule.wireTypes.lengthDelimited)
		var3061, var5035 = protoModule.writeBuffer(var3061, var3062, var3060, buffer.len(var3060))
		buff = var3061
		var3057 = var3062
	end
	local buff_1 = buffer.create(var3057)
	buffer.copy(buff_1, 0, buff, 0, var3057)
	
	return buff_1
end

function t_150.decode(p150)
	-- upvalues: t_150 (ref), protoModule (ref), t (ref)
	local var3057 = t_150.new()
	local var3058 = 0
	while var3058 < buffer.len(p150) do
		local _ = nil
		local var3059 = nil
		local var3060, var3061, var3062 = protoModule.readTag(p150, var3058)
		local var3063 = var3060
		var3059 = var3061
		var3058 = var3062
		
		if var3059 == protoModule.wireTypes.varint then
			if var3063 == 1 then
				local _ = nil
				local var3064, var3065 = protoModule.readVarIntI32(p150, var3058)
				local var3066 = var3064
				var3058 = var3065
				var3057.action_type = t.ActionType.fromNumber(var3066) or var3066
			else
				local _ = nil
				local var3067, var3068 = protoModule.readVarInt(p150, var3058)
				local _ = var3067
				var3058 = var3068
			end
		end
		if var3059 == protoModule.wireTypes.lengthDelimited then
			if var3063 == 2 then
				local _ = nil
				local var3069, var3070 = protoModule.readBuffer(p150, var3058)
				var3058 = var3070
				var3057.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.decode(var3069)
			else
				local _ = nil
				local var3071, var3072 = protoModule.readVarInt(p150, var3058)
				var3058 = var3072 + var3071
			end
		elseif var3059 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3073, var3074 = protoModule.readFixed32(p150, var3058)
			local _ = var3073
			var3058 = var3074
		elseif var3059 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3075, var3076 = protoModule.readFixed64(p150, var3058)
			local _ = var3075
			var3058 = var3076
		else
			error("Unsupported wire type: " .. var5039)
		end
	end
	return var3057
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
	local var3077 = t_150.new()
	
	if self.action_type ~= nil then
		var3077.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3077.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3077.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3077.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var3077
end

t_150.descriptor = {
	name = "OpenTrustedFriendsUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenTrustedFriendsUpsellModalAction"
}
t.OpenTrustedFriendsUpsellModalAction = t_150
typeRegistryModule.default:register(t.OpenTrustedFriendsUpsellModalAction)
local t_151 = {}
t_151.__index = t_151

function t_151.new(p151)
	-- upvalues: t_151 (ref)
	return setmetatable({
		target_user_id = if p151 == nil or p151.target_user_id == nil then nil else p151.target_user_id
	}, t_151)
end

function t_151:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3077 = 0
	
	if self.target_user_id ~= nil then
		local var3078 = self.target_user_id:encode()
		local var3079, var3080 = protoModule.writeTag(buff, var3077, 1, protoModule.wireTypes.lengthDelimited)
		var3079, var5063 = protoModule.writeBuffer(var3079, var3080, var3078, buffer.len(var3078))
		buff = var3079
		var3077 = var3080
	end
	local buff_1 = buffer.create(var3077)
	buffer.copy(buff_1, 0, buff, 0, var3077)
	
	return buff_1
end

function t_151.decode(p151)
	-- upvalues: t_151 (ref), protoModule (ref), propTypesModule (ref)
	local var3077 = t_151.new()
	local var3078 = 0
	while var3078 < buffer.len(p151) do
		local _ = nil
		local var3079 = nil
		local var3080, var3081, var3082 = protoModule.readTag(p151, var3078)
		local var3083 = var3080
		var3079 = var3081
		var3078 = var3082
		
		if var3079 == protoModule.wireTypes.varint then
			local _ = nil
			local var3084, var3085 = protoModule.readVarInt(p151, var3078)
			local _ = var3084
			var3078 = var3085
			continue
		end
		if var3079 == protoModule.wireTypes.lengthDelimited then
			if var3083 == 1 then
				local _ = nil
				local var3086, var3087 = protoModule.readBuffer(p151, var3078)
				var3078 = var3087
				var3077.target_user_id = propTypesModule.StringProp.decode(var3086)
			else
				local _ = nil
				local var3088, var3089 = protoModule.readVarInt(p151, var3078)
				var3078 = var3089 + var3088
			end
		elseif var3079 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3090, var3091 = protoModule.readFixed32(p151, var3078)
			local _ = var3090
			var3078 = var3091
		elseif var3079 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3092, var3093 = protoModule.readFixed64(p151, var3078)
			local _ = var3092
			var3078 = var3093
		else
			error("Unsupported wire type: " .. var5067)
		end
	end
	return var3077
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
	local var3094 = t_151.new()
	
	if self.target_user_id ~= nil then
		var3094.target_user_id = propTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		var3094.target_user_id = propTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	return var3094
end

t_151.descriptor = {
	name = "OpenTrustedFriendsUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenTrustedFriendsUpsellModalAction_Params = t_151
typeRegistryModule.default:register(t.OpenTrustedFriendsUpsellModalAction_Params)
local t_152 = {}
t_152.__index = t_152

function t_152.new(p152)
	-- upvalues: t (ref), t_152 (ref)
	return setmetatable({
		action_type = if p152 == nil or p152.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p152.action_type,
		action_params = if p152 == nil or p152.action_params == nil then nil else p152.action_params
	}, t_152)
end

function t_152:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3094 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3095, var3096 = protoModule.writeTag(buff, var3094, 1, protoModule.wireTypes.varint)
		var3095, var5087 = protoModule.writeVarInt(var3095, var3096, t.ActionType.toNumber(self.action_type))
		buff = var3095
		var3094 = var3096
	end
	if self.action_params ~= nil then
		local var3097 = self.action_params:encode()
		local var3098, var3099 = protoModule.writeTag(buff, var3094, 2, protoModule.wireTypes.lengthDelimited)
		var3098, var5090 = protoModule.writeBuffer(var3098, var3099, var3097, buffer.len(var3097))
		buff = var3098
		var3094 = var3099
	end
	local buff_1 = buffer.create(var3094)
	buffer.copy(buff_1, 0, buff, 0, var3094)
	
	return buff_1
end

function t_152.decode(p152)
	-- upvalues: t_152 (ref), protoModule (ref), t (ref)
	local var3094 = t_152.new()
	local var3095 = 0
	while var3095 < buffer.len(p152) do
		local _ = nil
		local var3096 = nil
		local var3097, var3098, var3099 = protoModule.readTag(p152, var3095)
		local var3100 = var3097
		var3096 = var3098
		var3095 = var3099
		
		if var3096 == protoModule.wireTypes.varint then
			if var3100 == 1 then
				local _ = nil
				local var3101, var3102 = protoModule.readVarIntI32(p152, var3095)
				local var3103 = var3101
				var3095 = var3102
				var3094.action_type = t.ActionType.fromNumber(var3103) or var3103
			else
				local _ = nil
				local var3104, var3105 = protoModule.readVarInt(p152, var3095)
				local _ = var3104
				var3095 = var3105
			end
		end
		if var3096 == protoModule.wireTypes.lengthDelimited then
			if var3100 == 2 then
				local _ = nil
				local var3106, var3107 = protoModule.readBuffer(p152, var3095)
				var3095 = var3107
				var3094.action_params = t.OpenSearchResultsWithQueryAction_Params.decode(var3106)
			else
				local _ = nil
				local var3108, var3109 = protoModule.readVarInt(p152, var3095)
				var3095 = var3109 + var3108
			end
		elseif var3096 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3110, var3111 = protoModule.readFixed32(p152, var3095)
			local _ = var3110
			var3095 = var3111
		elseif var3096 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3112, var3113 = protoModule.readFixed64(p152, var3095)
			local _ = var3112
			var3095 = var3113
		else
			error("Unsupported wire type: " .. var5094)
		end
	end
	return var3094
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
	local var3114 = t_152.new()
	
	if self.action_type ~= nil then
		var3114.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3114.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3114.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3114.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.actionParams)
	end
	return var3114
end

t_152.descriptor = {
	name = "OpenSearchResultsWithQueryAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSearchResultsWithQueryAction"
}
t.OpenSearchResultsWithQueryAction = t_152
typeRegistryModule.default:register(t.OpenSearchResultsWithQueryAction)
local t_153 = {}
t_153.__index = t_153

function t_153.new(p153)
	-- upvalues: t_153 (ref)
	return setmetatable({
		search_query = if p153 == nil or p153.search_query == nil then nil else p153.search_query,
		search_type = if p153 == nil or p153.search_type == nil then nil else p153.search_type
	}, t_153)
end

function t_153:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3114 = 0
	
	if self.search_query ~= nil then
		local var3115 = self.search_query:encode()
		local var3116, var3117 = protoModule.writeTag(buff, var3114, 1, protoModule.wireTypes.lengthDelimited)
		var3116, var5118 = protoModule.writeBuffer(var3116, var3117, var3115, buffer.len(var3115))
		buff = var3116
		var3114 = var3117
	end
	if self.search_type ~= nil then
		local var3118 = self.search_type:encode()
		local var3119, var3120 = protoModule.writeTag(buff, var3114, 2, protoModule.wireTypes.lengthDelimited)
		var3119, var5121 = protoModule.writeBuffer(var3119, var3120, var3118, buffer.len(var3118))
		buff = var3119
		var3114 = var3120
	end
	local buff_1 = buffer.create(var3114)
	buffer.copy(buff_1, 0, buff, 0, var3114)
	
	return buff_1
end

function t_153.decode(p153)
	-- upvalues: t_153 (ref), protoModule (ref), propTypesModule (ref)
	local var3114 = t_153.new()
	local var3115 = 0
	while var3115 < buffer.len(p153) do
		local _ = nil
		local var3116 = nil
		local var3117, var3118, var3119 = protoModule.readTag(p153, var3115)
		local var3120 = var3117
		var3116 = var3118
		var3115 = var3119
		
		if var3116 == protoModule.wireTypes.varint then
			local _ = nil
			local var3121, var3122 = protoModule.readVarInt(p153, var3115)
			local _ = var3121
			var3115 = var3122
			continue
		end
		if var3116 == protoModule.wireTypes.lengthDelimited then
			if var3120 == 1 then
				local _ = nil
				local var3123, var3124 = protoModule.readBuffer(p153, var3115)
				var3115 = var3124
				var3114.search_query = propTypesModule.StringProp.decode(var3123)
			elseif var3120 == 2 then
				local _ = nil
				local var3125, var3126 = protoModule.readBuffer(p153, var3115)
				var3115 = var3126
				var3114.search_type = propTypesModule.StringProp.decode(var3125)
			else
				local _ = nil
				local var3127, var3128 = protoModule.readVarInt(p153, var3115)
				var3115 = var3128 + var3127
			end
		elseif var3116 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3129, var3130 = protoModule.readFixed32(p153, var3115)
			local _ = var3129
			var3115 = var3130
		elseif var3116 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3131, var3132 = protoModule.readFixed64(p153, var3115)
			local _ = var3131
			var3115 = var3132
		else
			error("Unsupported wire type: " .. var5125)
		end
	end
	return var3114
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
	local var3133 = t_153.new()
	
	if self.search_query ~= nil then
		var3133.search_query = propTypesModule.StringProp.jsonDecode(self.search_query)
	end
	if self.searchQuery ~= nil then
		var3133.search_query = propTypesModule.StringProp.jsonDecode(self.searchQuery)
	end
	if self.search_type ~= nil then
		var3133.search_type = propTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		var3133.search_type = propTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return var3133
end

t_153.descriptor = {
	name = "OpenSearchResultsWithQueryAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSearchResultsWithQueryAction_Params = t_153
typeRegistryModule.default:register(t.OpenSearchResultsWithQueryAction_Params)
local t_154 = {}
t_154.__index = t_154

function t_154.new(p154)
	-- upvalues: t (ref), t_154 (ref)
	return setmetatable({
		action_type = if p154 == nil or p154.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p154.action_type,
		action_params = if p154 == nil or p154.action_params == nil then nil else p154.action_params
	}, t_154)
end

function t_154:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3133 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3134, var3135 = protoModule.writeTag(buff, var3133, 1, protoModule.wireTypes.varint)
		var3134, var5147 = protoModule.writeVarInt(var3134, var3135, t.ActionType.toNumber(self.action_type))
		buff = var3134
		var3133 = var3135
	end
	if self.action_params ~= nil then
		local var3136 = self.action_params:encode()
		local var3137, var3138 = protoModule.writeTag(buff, var3133, 2, protoModule.wireTypes.lengthDelimited)
		var3137, var5150 = protoModule.writeBuffer(var3137, var3138, var3136, buffer.len(var3136))
		buff = var3137
		var3133 = var3138
	end
	local buff_1 = buffer.create(var3133)
	buffer.copy(buff_1, 0, buff, 0, var3133)
	
	return buff_1
end

function t_154.decode(p154)
	-- upvalues: t_154 (ref), protoModule (ref), t (ref)
	local var3133 = t_154.new()
	local var3134 = 0
	while var3134 < buffer.len(p154) do
		local _ = nil
		local var3135 = nil
		local var3136, var3137, var3138 = protoModule.readTag(p154, var3134)
		local var3139 = var3136
		var3135 = var3137
		var3134 = var3138
		
		if var3135 == protoModule.wireTypes.varint then
			if var3139 == 1 then
				local _ = nil
				local var3140, var3141 = protoModule.readVarIntI32(p154, var3134)
				local var3142 = var3140
				var3134 = var3141
				var3133.action_type = t.ActionType.fromNumber(var3142) or var3142
			else
				local _ = nil
				local var3143, var3144 = protoModule.readVarInt(p154, var3134)
				local _ = var3143
				var3134 = var3144
			end
		end
		if var3135 == protoModule.wireTypes.lengthDelimited then
			if var3139 == 2 then
				local _ = nil
				local var3145, var3146 = protoModule.readBuffer(p154, var3134)
				var3134 = var3146
				var3133.action_params = t.SelectMarketplaceFavoritesCategory_Params.decode(var3145)
			else
				local _ = nil
				local var3147, var3148 = protoModule.readVarInt(p154, var3134)
				var3134 = var3148 + var3147
			end
		elseif var3135 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3149, var3150 = protoModule.readFixed32(p154, var3134)
			local _ = var3149
			var3134 = var3150
		elseif var3135 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3151, var3152 = protoModule.readFixed64(p154, var3134)
			local _ = var3151
			var3134 = var3152
		else
			error("Unsupported wire type: " .. var5154)
		end
	end
	return var3133
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
	local var3153 = t_154.new()
	
	if self.action_type ~= nil then
		var3153.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3153.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3153.action_params = t.SelectMarketplaceFavoritesCategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3153.action_params = t.SelectMarketplaceFavoritesCategory_Params.jsonDecode(self.actionParams)
	end
	return var3153
end

t_154.descriptor = {
	name = "SelectMarketplaceFavoritesCategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceFavoritesCategory"
}
t.SelectMarketplaceFavoritesCategory = t_154
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesCategory)
local t_155 = {}
t_155.__index = t_155

function t_155.new(p155)
	-- upvalues: t_155 (ref)
	return setmetatable({
		category_id = if p155 == nil or p155.category_id == nil then nil else p155.category_id
	}, t_155)
end

function t_155:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3153 = 0
	
	if self.category_id ~= nil then
		local var3154 = self.category_id:encode()
		local var3155, var3156 = protoModule.writeTag(buff, var3153, 1, protoModule.wireTypes.lengthDelimited)
		var3155, var5178 = protoModule.writeBuffer(var3155, var3156, var3154, buffer.len(var3154))
		buff = var3155
		var3153 = var3156
	end
	local buff_1 = buffer.create(var3153)
	buffer.copy(buff_1, 0, buff, 0, var3153)
	
	return buff_1
end

function t_155.decode(p155)
	-- upvalues: t_155 (ref), protoModule (ref), propTypesModule (ref)
	local var3153 = t_155.new()
	local var3154 = 0
	while var3154 < buffer.len(p155) do
		local _ = nil
		local var3155 = nil
		local var3156, var3157, var3158 = protoModule.readTag(p155, var3154)
		local var3159 = var3156
		var3155 = var3157
		var3154 = var3158
		
		if var3155 == protoModule.wireTypes.varint then
			local _ = nil
			local var3160, var3161 = protoModule.readVarInt(p155, var3154)
			local _ = var3160
			var3154 = var3161
			continue
		end
		if var3155 == protoModule.wireTypes.lengthDelimited then
			if var3159 == 1 then
				local _ = nil
				local var3162, var3163 = protoModule.readBuffer(p155, var3154)
				var3154 = var3163
				var3153.category_id = propTypesModule.StringProp.decode(var3162)
			else
				local _ = nil
				local var3164, var3165 = protoModule.readVarInt(p155, var3154)
				var3154 = var3165 + var3164
			end
		elseif var3155 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3166, var3167 = protoModule.readFixed32(p155, var3154)
			local _ = var3166
			var3154 = var3167
		elseif var3155 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3168, var3169 = protoModule.readFixed64(p155, var3154)
			local _ = var3168
			var3154 = var3169
		else
			error("Unsupported wire type: " .. var5182)
		end
	end
	return var3153
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
	local var3170 = t_155.new()
	
	if self.category_id ~= nil then
		var3170.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var3170.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	return var3170
end

t_155.descriptor = {
	name = "SelectMarketplaceFavoritesCategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceFavoritesCategory_Params = t_155
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesCategory_Params)
local t_156 = {}
t_156.__index = t_156

function t_156.new(p156)
	-- upvalues: t (ref), t_156 (ref)
	return setmetatable({
		action_type = if p156 == nil or p156.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p156.action_type,
		action_params = if p156 == nil or p156.action_params == nil then nil else p156.action_params
	}, t_156)
end

function t_156:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3170 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3171, var3172 = protoModule.writeTag(buff, var3170, 1, protoModule.wireTypes.varint)
		var3171, var5202 = protoModule.writeVarInt(var3171, var3172, t.ActionType.toNumber(self.action_type))
		buff = var3171
		var3170 = var3172
	end
	if self.action_params ~= nil then
		local var3173 = self.action_params:encode()
		local var3174, var3175 = protoModule.writeTag(buff, var3170, 2, protoModule.wireTypes.lengthDelimited)
		var3174, var5205 = protoModule.writeBuffer(var3174, var3175, var3173, buffer.len(var3173))
		buff = var3174
		var3170 = var3175
	end
	local buff_1 = buffer.create(var3170)
	buffer.copy(buff_1, 0, buff, 0, var3170)
	
	return buff_1
end

function t_156.decode(p156)
	-- upvalues: t_156 (ref), protoModule (ref), t (ref)
	local var3170 = t_156.new()
	local var3171 = 0
	while var3171 < buffer.len(p156) do
		local _ = nil
		local var3172 = nil
		local var3173, var3174, var3175 = protoModule.readTag(p156, var3171)
		local var3176 = var3173
		var3172 = var3174
		var3171 = var3175
		
		if var3172 == protoModule.wireTypes.varint then
			if var3176 == 1 then
				local _ = nil
				local var3177, var3178 = protoModule.readVarIntI32(p156, var3171)
				local var3179 = var3177
				var3171 = var3178
				var3170.action_type = t.ActionType.fromNumber(var3179) or var3179
			else
				local _ = nil
				local var3180, var3181 = protoModule.readVarInt(p156, var3171)
				local _ = var3180
				var3171 = var3181
			end
		end
		if var3172 == protoModule.wireTypes.lengthDelimited then
			if var3176 == 2 then
				local _ = nil
				local var3182, var3183 = protoModule.readBuffer(p156, var3171)
				var3171 = var3183
				var3170.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.decode(var3182)
			else
				local _ = nil
				local var3184, var3185 = protoModule.readVarInt(p156, var3171)
				var3171 = var3185 + var3184
			end
		elseif var3172 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3186, var3187 = protoModule.readFixed32(p156, var3171)
			local _ = var3186
			var3171 = var3187
		elseif var3172 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3188, var3189 = protoModule.readFixed64(p156, var3171)
			local _ = var3188
			var3171 = var3189
		else
			error("Unsupported wire type: " .. var5209)
		end
	end
	return var3170
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
	local var3190 = t_156.new()
	
	if self.action_type ~= nil then
		var3190.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3190.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3190.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3190.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.jsonDecode(self.actionParams)
	end
	return var3190
end

t_156.descriptor = {
	name = "SelectMarketplaceFavoritesSubcategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceFavoritesSubcategory"
}
t.SelectMarketplaceFavoritesSubcategory = t_156
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesSubcategory)
local t_157 = {}
t_157.__index = t_157

function t_157.new(p157)
	-- upvalues: t_157 (ref)
	return setmetatable({
		subcategory_id = if p157 == nil or p157.subcategory_id == nil then nil else p157.subcategory_id
	}, t_157)
end

function t_157:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3190 = 0
	
	if self.subcategory_id ~= nil then
		local var3191 = self.subcategory_id:encode()
		local var3192, var3193 = protoModule.writeTag(buff, var3190, 1, protoModule.wireTypes.lengthDelimited)
		var3192, var5233 = protoModule.writeBuffer(var3192, var3193, var3191, buffer.len(var3191))
		buff = var3192
		var3190 = var3193
	end
	local buff_1 = buffer.create(var3190)
	buffer.copy(buff_1, 0, buff, 0, var3190)
	
	return buff_1
end

function t_157.decode(p157)
	-- upvalues: t_157 (ref), protoModule (ref), propTypesModule (ref)
	local var3190 = t_157.new()
	local var3191 = 0
	while var3191 < buffer.len(p157) do
		local _ = nil
		local var3192 = nil
		local var3193, var3194, var3195 = protoModule.readTag(p157, var3191)
		local var3196 = var3193
		var3192 = var3194
		var3191 = var3195
		
		if var3192 == protoModule.wireTypes.varint then
			local _ = nil
			local var3197, var3198 = protoModule.readVarInt(p157, var3191)
			local _ = var3197
			var3191 = var3198
			continue
		end
		if var3192 == protoModule.wireTypes.lengthDelimited then
			if var3196 == 1 then
				local _ = nil
				local var3199, var3200 = protoModule.readBuffer(p157, var3191)
				var3191 = var3200
				var3190.subcategory_id = propTypesModule.StringProp.decode(var3199)
			else
				local _ = nil
				local var3201, var3202 = protoModule.readVarInt(p157, var3191)
				var3191 = var3202 + var3201
			end
		elseif var3192 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3203, var3204 = protoModule.readFixed32(p157, var3191)
			local _ = var3203
			var3191 = var3204
		elseif var3192 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3205, var3206 = protoModule.readFixed64(p157, var3191)
			local _ = var3205
			var3191 = var3206
		else
			error("Unsupported wire type: " .. var5237)
		end
	end
	return var3190
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
	local var3207 = t_157.new()
	
	if self.subcategory_id ~= nil then
		var3207.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var3207.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	return var3207
end

t_157.descriptor = {
	name = "SelectMarketplaceFavoritesSubcategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceFavoritesSubcategory_Params = t_157
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesSubcategory_Params)
local t_158 = {}
t_158.__index = t_158

function t_158.new(p158)
	-- upvalues: t (ref), t_158 (ref)
	return setmetatable({
		action_type = if p158 == nil or p158.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p158.action_type,
		action_params = if p158 == nil or p158.action_params == nil then nil else p158.action_params
	}, t_158)
end

function t_158:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3207 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3208, var3209 = protoModule.writeTag(buff, var3207, 1, protoModule.wireTypes.varint)
		var3208, var5257 = protoModule.writeVarInt(var3208, var3209, t.ActionType.toNumber(self.action_type))
		buff = var3208
		var3207 = var3209
	end
	if self.action_params ~= nil then
		local var3210 = self.action_params:encode()
		local var3211, var3212 = protoModule.writeTag(buff, var3207, 2, protoModule.wireTypes.lengthDelimited)
		var3211, var5260 = protoModule.writeBuffer(var3211, var3212, var3210, buffer.len(var3210))
		buff = var3211
		var3207 = var3212
	end
	local buff_1 = buffer.create(var3207)
	buffer.copy(buff_1, 0, buff, 0, var3207)
	
	return buff_1
end

function t_158.decode(p158)
	-- upvalues: t_158 (ref), protoModule (ref), t (ref)
	local var3207 = t_158.new()
	local var3208 = 0
	while var3208 < buffer.len(p158) do
		local _ = nil
		local var3209 = nil
		local var3210, var3211, var3212 = protoModule.readTag(p158, var3208)
		local var3213 = var3210
		var3209 = var3211
		var3208 = var3212
		
		if var3209 == protoModule.wireTypes.varint then
			if var3213 == 1 then
				local _ = nil
				local var3214, var3215 = protoModule.readVarIntI32(p158, var3208)
				local var3216 = var3214
				var3208 = var3215
				var3207.action_type = t.ActionType.fromNumber(var3216) or var3216
			else
				local _ = nil
				local var3217, var3218 = protoModule.readVarInt(p158, var3208)
				local _ = var3217
				var3208 = var3218
			end
		end
		if var3209 == protoModule.wireTypes.lengthDelimited then
			if var3213 == 2 then
				local _ = nil
				local var3219, var3220 = protoModule.readBuffer(p158, var3208)
				var3208 = var3220
				var3207.action_params = t.PinExperienceShortcutAction_Params.decode(var3219)
			else
				local _ = nil
				local var3221, var3222 = protoModule.readVarInt(p158, var3208)
				var3208 = var3222 + var3221
			end
		elseif var3209 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3223, var3224 = protoModule.readFixed32(p158, var3208)
			local _ = var3223
			var3208 = var3224
		elseif var3209 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3225, var3226 = protoModule.readFixed64(p158, var3208)
			local _ = var3225
			var3208 = var3226
		else
			error("Unsupported wire type: " .. var5264)
		end
	end
	return var3207
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
	local var3227 = t_158.new()
	
	if self.action_type ~= nil then
		var3227.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3227.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3227.action_params = t.PinExperienceShortcutAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3227.action_params = t.PinExperienceShortcutAction_Params.jsonDecode(self.actionParams)
	end
	return var3227
end

t_158.descriptor = {
	name = "PinExperienceShortcutAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.PinExperienceShortcutAction"
}
t.PinExperienceShortcutAction = t_158
typeRegistryModule.default:register(t.PinExperienceShortcutAction)
local t_159 = {}
t_159.__index = t_159

function t_159.new(p159)
	-- upvalues: t_159 (ref)
	return setmetatable({
		place_id = if p159 == nil or p159.place_id == nil then nil else p159.place_id,
		universe_id = if p159 == nil or p159.universe_id == nil then nil else p159.universe_id,
		game_name = if p159 == nil or p159.game_name == nil then nil else p159.game_name
	}, t_159)
end

function t_159:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3227 = 0
	
	if self.place_id ~= nil then
		local var3228 = self.place_id:encode()
		local var3229, var3230 = protoModule.writeTag(buff, var3227, 1, protoModule.wireTypes.lengthDelimited)
		var3229, var5288 = protoModule.writeBuffer(var3229, var3230, var3228, buffer.len(var3228))
		buff = var3229
		var3227 = var3230
	end
	if self.universe_id ~= nil then
		local var3231 = self.universe_id:encode()
		local var3232, var3233 = protoModule.writeTag(buff, var3227, 2, protoModule.wireTypes.lengthDelimited)
		var3232, var5291 = protoModule.writeBuffer(var3232, var3233, var3231, buffer.len(var3231))
		buff = var3232
		var3227 = var3233
	end
	if self.game_name ~= nil then
		local var3234 = self.game_name:encode()
		local var3235, var3236 = protoModule.writeTag(buff, var3227, 3, protoModule.wireTypes.lengthDelimited)
		var3235, var5294 = protoModule.writeBuffer(var3235, var3236, var3234, buffer.len(var3234))
		buff = var3235
		var3227 = var3236
	end
	local buff_1 = buffer.create(var3227)
	buffer.copy(buff_1, 0, buff, 0, var3227)
	
	return buff_1
end

function t_159.decode(p159)
	-- upvalues: t_159 (ref), protoModule (ref), propTypesModule (ref)
	local var3227 = t_159.new()
	local var3228 = 0
	while var3228 < buffer.len(p159) do
		local _ = nil
		local var3229 = nil
		local var3230, var3231, var3232 = protoModule.readTag(p159, var3228)
		local var3233 = var3230
		var3229 = var3231
		var3228 = var3232
		
		if var3229 == protoModule.wireTypes.varint then
			local _ = nil
			local var3234, var3235 = protoModule.readVarInt(p159, var3228)
			local _ = var3234
			var3228 = var3235
			continue
		end
		if var3229 == protoModule.wireTypes.lengthDelimited then
			if var3233 == 1 then
				local _ = nil
				local var3236, var3237 = protoModule.readBuffer(p159, var3228)
				var3228 = var3237
				var3227.place_id = propTypesModule.StringProp.decode(var3236)
			elseif var3233 == 2 then
				local _ = nil
				local var3238, var3239 = protoModule.readBuffer(p159, var3228)
				var3228 = var3239
				var3227.universe_id = propTypesModule.StringProp.decode(var3238)
			elseif var3233 == 3 then
				local _ = nil
				local var3240, var3241 = protoModule.readBuffer(p159, var3228)
				var3228 = var3241
				var3227.game_name = propTypesModule.StringProp.decode(var3240)
			else
				local _ = nil
				local var3242, var3243 = protoModule.readVarInt(p159, var3228)
				var3228 = var3243 + var3242
			end
		elseif var3229 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3244, var3245 = protoModule.readFixed32(p159, var3228)
			local _ = var3244
			var3228 = var3245
		elseif var3229 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3246, var3247 = protoModule.readFixed64(p159, var3228)
			local _ = var3246
			var3228 = var3247
		else
			error("Unsupported wire type: " .. var5298)
		end
	end
	return var3227
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
	local var3248 = t_159.new()
	
	if self.place_id ~= nil then
		var3248.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var3248.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var3248.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3248.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.game_name ~= nil then
		var3248.game_name = propTypesModule.StringProp.jsonDecode(self.game_name)
	end
	if self.gameName ~= nil then
		var3248.game_name = propTypesModule.StringProp.jsonDecode(self.gameName)
	end
	return var3248
end

t_159.descriptor = {
	name = "PinExperienceShortcutAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.PinExperienceShortcutAction_Params = t_159
typeRegistryModule.default:register(t.PinExperienceShortcutAction_Params)
local t_160 = {}
t_160.__index = t_160

function t_160.new(p160)
	-- upvalues: t (ref), t_160 (ref)
	return setmetatable({
		action_type = if p160 == nil or p160.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p160.action_type,
		action_params = if p160 == nil or p160.action_params == nil then nil else p160.action_params
	}, t_160)
end

function t_160:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3248 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3249, var3250 = protoModule.writeTag(buff, var3248, 1, protoModule.wireTypes.varint)
		var3249, var5322 = protoModule.writeVarInt(var3249, var3250, t.ActionType.toNumber(self.action_type))
		buff = var3249
		var3248 = var3250
	end
	if self.action_params ~= nil then
		local var3251 = self.action_params:encode()
		local var3252, var3253 = protoModule.writeTag(buff, var3248, 2, protoModule.wireTypes.lengthDelimited)
		var3252, var5325 = protoModule.writeBuffer(var3252, var3253, var3251, buffer.len(var3251))
		buff = var3252
		var3248 = var3253
	end
	local buff_1 = buffer.create(var3248)
	buffer.copy(buff_1, 0, buff, 0, var3248)
	
	return buff_1
end

function t_160.decode(p160)
	-- upvalues: t_160 (ref), protoModule (ref), t (ref)
	local var3248 = t_160.new()
	local var3249 = 0
	while var3249 < buffer.len(p160) do
		local _ = nil
		local var3250 = nil
		local var3251, var3252, var3253 = protoModule.readTag(p160, var3249)
		local var3254 = var3251
		var3250 = var3252
		var3249 = var3253
		
		if var3250 == protoModule.wireTypes.varint then
			if var3254 == 1 then
				local _ = nil
				local var3255, var3256 = protoModule.readVarIntI32(p160, var3249)
				local var3257 = var3255
				var3249 = var3256
				var3248.action_type = t.ActionType.fromNumber(var3257) or var3257
			else
				local _ = nil
				local var3258, var3259 = protoModule.readVarInt(p160, var3249)
				local _ = var3258
				var3249 = var3259
			end
		end
		if var3250 == protoModule.wireTypes.lengthDelimited then
			if var3254 == 2 then
				local _ = nil
				local var3260, var3261 = protoModule.readBuffer(p160, var3249)
				var3249 = var3261
				var3248.action_params = t.NavigateAction_Params.decode(var3260)
			else
				local _ = nil
				local var3262, var3263 = protoModule.readVarInt(p160, var3249)
				var3249 = var3263 + var3262
			end
		elseif var3250 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3264, var3265 = protoModule.readFixed32(p160, var3249)
			local _ = var3264
			var3249 = var3265
		elseif var3250 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3266, var3267 = protoModule.readFixed64(p160, var3249)
			local _ = var3266
			var3249 = var3267
		else
			error("Unsupported wire type: " .. var5329)
		end
	end
	return var3248
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
	local var3268 = t_160.new()
	
	if self.action_type ~= nil then
		var3268.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3268.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3268.action_params = t.NavigateAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3268.action_params = t.NavigateAction_Params.jsonDecode(self.actionParams)
	end
	return var3268
end

t_160.descriptor = {
	name = "NavigateAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.NavigateAction"
}
t.NavigateAction = t_160
typeRegistryModule.default:register(t.NavigateAction)
local t_161 = {}
t_161.__index = t_161

function t_161.new(p161)
	-- upvalues: t_161 (ref)
	return setmetatable({
		destination = if p161 == nil or p161.destination == nil then nil else p161.destination,
		source = if p161 == nil or p161.source == nil then nil else p161.source
	}, t_161)
end

function t_161:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3268 = 0
	
	if self.destination ~= nil then
		local var3269 = self.destination:encode()
		local var3270, var3271 = protoModule.writeTag(buff, var3268, 1, protoModule.wireTypes.lengthDelimited)
		var3270, var5353 = protoModule.writeBuffer(var3270, var3271, var3269, buffer.len(var3269))
		buff = var3270
		var3268 = var3271
	end
	if self.source ~= nil then
		local var3272 = self.source:encode()
		local var3273, var3274 = protoModule.writeTag(buff, var3268, 2, protoModule.wireTypes.lengthDelimited)
		var3273, var5356 = protoModule.writeBuffer(var3273, var3274, var3272, buffer.len(var3272))
		buff = var3273
		var3268 = var3274
	end
	local buff_1 = buffer.create(var3268)
	buffer.copy(buff_1, 0, buff, 0, var3268)
	
	return buff_1
end

function t_161.decode(p161)
	-- upvalues: t_161 (ref), protoModule (ref), propTypesModule (ref)
	local var3268 = t_161.new()
	local var3269 = 0
	while var3269 < buffer.len(p161) do
		local _ = nil
		local var3270 = nil
		local var3271, var3272, var3273 = protoModule.readTag(p161, var3269)
		local var3274 = var3271
		var3270 = var3272
		var3269 = var3273
		
		if var3270 == protoModule.wireTypes.varint then
			local _ = nil
			local var3275, var3276 = protoModule.readVarInt(p161, var3269)
			local _ = var3275
			var3269 = var3276
			continue
		end
		if var3270 == protoModule.wireTypes.lengthDelimited then
			if var3274 == 1 then
				local _ = nil
				local var3277, var3278 = protoModule.readBuffer(p161, var3269)
				var3269 = var3278
				var3268.destination = propTypesModule.StringProp.decode(var3277)
			elseif var3274 == 2 then
				local _ = nil
				local var3279, var3280 = protoModule.readBuffer(p161, var3269)
				var3269 = var3280
				var3268.source = propTypesModule.StringProp.decode(var3279)
			else
				local _ = nil
				local var3281, var3282 = protoModule.readVarInt(p161, var3269)
				var3269 = var3282 + var3281
			end
		elseif var3270 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3283, var3284 = protoModule.readFixed32(p161, var3269)
			local _ = var3283
			var3269 = var3284
		elseif var3270 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3285, var3286 = protoModule.readFixed64(p161, var3269)
			local _ = var3285
			var3269 = var3286
		else
			error("Unsupported wire type: " .. var5360)
		end
	end
	return var3268
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
	local var3287 = t_161.new()
	
	if self.destination ~= nil then
		var3287.destination = propTypesModule.StringProp.jsonDecode(self.destination)
	end
	if self.source ~= nil then
		var3287.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var3287
end

t_161.descriptor = {
	name = "NavigateAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.NavigateAction_Params = t_161
typeRegistryModule.default:register(t.NavigateAction_Params)
local t_162 = {}
t_162.__index = t_162

function t_162.new(p162)
	-- upvalues: t (ref), t_162 (ref)
	return setmetatable({
		action_type = if p162 == nil or p162.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p162.action_type,
		action_params = if p162 == nil or p162.action_params == nil then nil else p162.action_params
	}, t_162)
end

function t_162:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3287 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3288, var3289 = protoModule.writeTag(buff, var3287, 1, protoModule.wireTypes.varint)
		var3288, var5382 = protoModule.writeVarInt(var3288, var3289, t.ActionType.toNumber(self.action_type))
		buff = var3288
		var3287 = var3289
	end
	if self.action_params ~= nil then
		local var3290 = self.action_params:encode()
		local var3291, var3292 = protoModule.writeTag(buff, var3287, 2, protoModule.wireTypes.lengthDelimited)
		var3291, var5385 = protoModule.writeBuffer(var3291, var3292, var3290, buffer.len(var3290))
		buff = var3291
		var3287 = var3292
	end
	local buff_1 = buffer.create(var3287)
	buffer.copy(buff_1, 0, buff, 0, var3287)
	
	return buff_1
end

function t_162.decode(p162)
	-- upvalues: t_162 (ref), protoModule (ref), t (ref)
	local var3287 = t_162.new()
	local var3288 = 0
	while var3288 < buffer.len(p162) do
		local _ = nil
		local var3289 = nil
		local var3290, var3291, var3292 = protoModule.readTag(p162, var3288)
		local var3293 = var3290
		var3289 = var3291
		var3288 = var3292
		
		if var3289 == protoModule.wireTypes.varint then
			if var3293 == 1 then
				local _ = nil
				local var3294, var3295 = protoModule.readVarIntI32(p162, var3288)
				local var3296 = var3294
				var3288 = var3295
				var3287.action_type = t.ActionType.fromNumber(var3296) or var3296
			else
				local _ = nil
				local var3297, var3298 = protoModule.readVarInt(p162, var3288)
				local _ = var3297
				var3288 = var3298
			end
		end
		if var3289 == protoModule.wireTypes.lengthDelimited then
			if var3293 == 2 then
				local _ = nil
				local var3299, var3300 = protoModule.readBuffer(p162, var3288)
				var3288 = var3300
				var3287.action_params = t.DownloadAppAction_Params.decode(var3299)
			else
				local _ = nil
				local var3301, var3302 = protoModule.readVarInt(p162, var3288)
				var3288 = var3302 + var3301
			end
		elseif var3289 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3303, var3304 = protoModule.readFixed32(p162, var3288)
			local _ = var3303
			var3288 = var3304
		elseif var3289 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3305, var3306 = protoModule.readFixed64(p162, var3288)
			local _ = var3305
			var3288 = var3306
		else
			error("Unsupported wire type: " .. var5389)
		end
	end
	return var3287
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
	local var3307 = t_162.new()
	
	if self.action_type ~= nil then
		var3307.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3307.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3307.action_params = t.DownloadAppAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3307.action_params = t.DownloadAppAction_Params.jsonDecode(self.actionParams)
	end
	return var3307
end

t_162.descriptor = {
	name = "DownloadAppAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DownloadAppAction"
}
t.DownloadAppAction = t_162
typeRegistryModule.default:register(t.DownloadAppAction)
local t_163 = {}
t_163.__index = t_163

function t_163.new(p163)
	-- upvalues: t_163 (ref)
	return setmetatable({
		source = if p163 == nil or p163.source == nil then nil else p163.source,
		download_type = if p163 == nil or p163.download_type == nil then nil else p163.download_type
	}, t_163)
end

function t_163:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3307 = 0
	
	if self.source ~= nil then
		local var3308 = self.source:encode()
		local var3309, var3310 = protoModule.writeTag(buff, var3307, 1, protoModule.wireTypes.lengthDelimited)
		var3309, var5413 = protoModule.writeBuffer(var3309, var3310, var3308, buffer.len(var3308))
		buff = var3309
		var3307 = var3310
	end
	if self.download_type ~= nil then
		local var3311 = self.download_type:encode()
		local var3312, var3313 = protoModule.writeTag(buff, var3307, 2, protoModule.wireTypes.lengthDelimited)
		var3312, var5416 = protoModule.writeBuffer(var3312, var3313, var3311, buffer.len(var3311))
		buff = var3312
		var3307 = var3313
	end
	local buff_1 = buffer.create(var3307)
	buffer.copy(buff_1, 0, buff, 0, var3307)
	
	return buff_1
end

function t_163.decode(p163)
	-- upvalues: t_163 (ref), protoModule (ref), propTypesModule (ref)
	local var3307 = t_163.new()
	local var3308 = 0
	while var3308 < buffer.len(p163) do
		local _ = nil
		local var3309 = nil
		local var3310, var3311, var3312 = protoModule.readTag(p163, var3308)
		local var3313 = var3310
		var3309 = var3311
		var3308 = var3312
		
		if var3309 == protoModule.wireTypes.varint then
			local _ = nil
			local var3314, var3315 = protoModule.readVarInt(p163, var3308)
			local _ = var3314
			var3308 = var3315
			continue
		end
		if var3309 == protoModule.wireTypes.lengthDelimited then
			if var3313 == 1 then
				local _ = nil
				local var3316, var3317 = protoModule.readBuffer(p163, var3308)
				var3308 = var3317
				var3307.source = propTypesModule.StringProp.decode(var3316)
			elseif var3313 == 2 then
				local _ = nil
				local var3318, var3319 = protoModule.readBuffer(p163, var3308)
				var3308 = var3319
				var3307.download_type = propTypesModule.StringProp.decode(var3318)
			else
				local _ = nil
				local var3320, var3321 = protoModule.readVarInt(p163, var3308)
				var3308 = var3321 + var3320
			end
		elseif var3309 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3322, var3323 = protoModule.readFixed32(p163, var3308)
			local _ = var3322
			var3308 = var3323
		elseif var3309 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3324, var3325 = protoModule.readFixed64(p163, var3308)
			local _ = var3324
			var3308 = var3325
		else
			error("Unsupported wire type: " .. var5420)
		end
	end
	return var3307
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
	local var3326 = t_163.new()
	
	if self.source ~= nil then
		var3326.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.download_type ~= nil then
		var3326.download_type = propTypesModule.StringProp.jsonDecode(self.download_type)
	end
	if self.downloadType ~= nil then
		var3326.download_type = propTypesModule.StringProp.jsonDecode(self.downloadType)
	end
	return var3326
end

t_163.descriptor = {
	name = "DownloadAppAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DownloadAppAction_Params = t_163
typeRegistryModule.default:register(t.DownloadAppAction_Params)
local t_164 = {}
t_164.__index = t_164

function t_164.new(p164)
	-- upvalues: t (ref), t_164 (ref)
	return setmetatable({
		action_type = if p164 == nil or p164.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p164.action_type,
		action_params = if p164 == nil or p164.action_params == nil then nil else p164.action_params
	}, t_164)
end

function t_164:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3326 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3327, var3328 = protoModule.writeTag(buff, var3326, 1, protoModule.wireTypes.varint)
		var3327, var5442 = protoModule.writeVarInt(var3327, var3328, t.ActionType.toNumber(self.action_type))
		buff = var3327
		var3326 = var3328
	end
	if self.action_params ~= nil then
		local var3329 = self.action_params:encode()
		local var3330, var3331 = protoModule.writeTag(buff, var3326, 2, protoModule.wireTypes.lengthDelimited)
		var3330, var5445 = protoModule.writeBuffer(var3330, var3331, var3329, buffer.len(var3329))
		buff = var3330
		var3326 = var3331
	end
	local buff_1 = buffer.create(var3326)
	buffer.copy(buff_1, 0, buff, 0, var3326)
	
	return buff_1
end

function t_164.decode(p164)
	-- upvalues: t_164 (ref), protoModule (ref), t (ref)
	local var3326 = t_164.new()
	local var3327 = 0
	while var3327 < buffer.len(p164) do
		local _ = nil
		local var3328 = nil
		local var3329, var3330, var3331 = protoModule.readTag(p164, var3327)
		local var3332 = var3329
		var3328 = var3330
		var3327 = var3331
		
		if var3328 == protoModule.wireTypes.varint then
			if var3332 == 1 then
				local _ = nil
				local var3333, var3334 = protoModule.readVarIntI32(p164, var3327)
				local var3335 = var3333
				var3327 = var3334
				var3326.action_type = t.ActionType.fromNumber(var3335) or var3335
			else
				local _ = nil
				local var3336, var3337 = protoModule.readVarInt(p164, var3327)
				local _ = var3336
				var3327 = var3337
			end
		end
		if var3328 == protoModule.wireTypes.lengthDelimited then
			if var3332 == 2 then
				local _ = nil
				local var3338, var3339 = protoModule.readBuffer(p164, var3327)
				var3327 = var3339
				var3326.action_params = t.ActionSequenceAction_Params.decode(var3338)
			else
				local _ = nil
				local var3340, var3341 = protoModule.readVarInt(p164, var3327)
				var3327 = var3341 + var3340
			end
		elseif var3328 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3342, var3343 = protoModule.readFixed32(p164, var3327)
			local _ = var3342
			var3327 = var3343
		elseif var3328 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3344, var3345 = protoModule.readFixed64(p164, var3327)
			local _ = var3344
			var3327 = var3345
		else
			error("Unsupported wire type: " .. var5449)
		end
	end
	return var3326
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
	local var3346 = t_164.new()
	
	if self.action_type ~= nil then
		var3346.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3346.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3346.action_params = t.ActionSequenceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3346.action_params = t.ActionSequenceAction_Params.jsonDecode(self.actionParams)
	end
	return var3346
end

t_164.descriptor = {
	name = "ActionSequenceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionSequenceAction"
}
t.ActionSequenceAction = t_164
typeRegistryModule.default:register(t.ActionSequenceAction)
local t_165 = {}
t_165.__index = t_165

function t_165.new(p165)
	-- upvalues: t_165 (ref)
	return setmetatable({
		actions = if p165 == nil or p165.actions == nil then {} else p165.actions
	}, t_165)
end

function t_165:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3346 = 0
	
	if self.actions ~= nil and #self.actions > 0 then
		for i, v in self.actions do
			local var3347 = v:encode()
			local var3348, var3349 = protoModule.writeTag(buff, var3346, 1, protoModule.wireTypes.lengthDelimited)
			var3348, var5473 = protoModule.writeBuffer(var3348, var3349, var3347, buffer.len(var3347))
			buff = var3348
			var3346 = var3349
		end
	end
	local buff_1 = buffer.create(var3346)
	buffer.copy(buff_1, 0, buff, 0, var3346)
	
	return buff_1
end

function t_165.decode(p165)
	-- upvalues: t_165 (ref), protoModule (ref), t (ref)
	local var3350 = t_165.new()
	local var3351 = 0
	while var3351 < buffer.len(p165) do
		local _ = nil
		local var3352 = nil
		local var3353, var3354, var3355 = protoModule.readTag(p165, var3351)
		local var3356 = var3353
		var3352 = var3354
		var3351 = var3355
		
		if var3352 == protoModule.wireTypes.varint then
			local _ = nil
			local var3357, var3358 = protoModule.readVarInt(p165, var3351)
			local _ = var3357
			var3351 = var3358
			continue
		end
		if var3352 == protoModule.wireTypes.lengthDelimited then
			if var3356 == 1 then
				local _ = nil
				local var3359, var3360 = protoModule.readBuffer(p165, var3351)
				var3351 = var3360
				table.insert(var3350.actions, t.ActionProp.decode(var3359))
			else
				local _ = nil
				local var3361, var3362 = protoModule.readVarInt(p165, var3351)
				var3351 = var3362 + var3361
			end
		elseif var3352 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3363, var3364 = protoModule.readFixed32(p165, var3351)
			local _ = var3363
			var3351 = var3364
		elseif var3352 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3365, var3366 = protoModule.readFixed64(p165, var3351)
			local _ = var3365
			var3351 = var3366
		else
			error("Unsupported wire type: " .. var5477)
		end
	end
	return var3350
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
	local var3367 = t_165.new()
	
	if self.actions ~= nil then
		local t_1 = {}
		
		for i, v in self.actions do
			table.insert(t_1, t.ActionProp.jsonDecode(v))
		end
		var3367.actions = t_1
	end
	return var3367
end

t_165.descriptor = {
	name = "ActionSequenceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ActionSequenceAction_Params = t_165
typeRegistryModule.default:register(t.ActionSequenceAction_Params)
local t_166 = {}
t_166.__index = t_166

function t_166.new(p166)
	-- upvalues: t (ref), t_166 (ref)
	return setmetatable({
		action_type = if p166 == nil or p166.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p166.action_type,
		action_params = if p166 == nil or p166.action_params == nil then nil else p166.action_params
	}, t_166)
end

function t_166:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3368 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3369, var3370 = protoModule.writeTag(buff, var3368, 1, protoModule.wireTypes.varint)
		var3369, var5499 = protoModule.writeVarInt(var3369, var3370, t.ActionType.toNumber(self.action_type))
		buff = var3369
		var3368 = var3370
	end
	if self.action_params ~= nil then
		local var3371 = self.action_params:encode()
		local var3372, var3373 = protoModule.writeTag(buff, var3368, 2, protoModule.wireTypes.lengthDelimited)
		var3372, var5502 = protoModule.writeBuffer(var3372, var3373, var3371, buffer.len(var3371))
		buff = var3372
		var3368 = var3373
	end
	local buff_1 = buffer.create(var3368)
	buffer.copy(buff_1, 0, buff, 0, var3368)
	
	return buff_1
end

function t_166.decode(p166)
	-- upvalues: t_166 (ref), protoModule (ref), t (ref)
	local var3368 = t_166.new()
	local var3369 = 0
	while var3369 < buffer.len(p166) do
		local _ = nil
		local var3370 = nil
		local var3371, var3372, var3373 = protoModule.readTag(p166, var3369)
		local var3374 = var3371
		var3370 = var3372
		var3369 = var3373
		
		if var3370 == protoModule.wireTypes.varint then
			if var3374 == 1 then
				local _ = nil
				local var3375, var3376 = protoModule.readVarIntI32(p166, var3369)
				local var3377 = var3375
				var3369 = var3376
				var3368.action_type = t.ActionType.fromNumber(var3377) or var3377
			else
				local _ = nil
				local var3378, var3379 = protoModule.readVarInt(p166, var3369)
				local _ = var3378
				var3369 = var3379
			end
		end
		if var3370 == protoModule.wireTypes.lengthDelimited then
			if var3374 == 2 then
				local _ = nil
				local var3380, var3381 = protoModule.readBuffer(p166, var3369)
				var3369 = var3381
				var3368.action_params = t.RefreshFeedEntryFromApiAction_Params.decode(var3380)
			else
				local _ = nil
				local var3382, var3383 = protoModule.readVarInt(p166, var3369)
				var3369 = var3383 + var3382
			end
		elseif var3370 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3384, var3385 = protoModule.readFixed32(p166, var3369)
			local _ = var3384
			var3369 = var3385
		elseif var3370 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3386, var3387 = protoModule.readFixed64(p166, var3369)
			local _ = var3386
			var3369 = var3387
		else
			error("Unsupported wire type: " .. var5506)
		end
	end
	return var3368
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
	local var3388 = t_166.new()
	
	if self.action_type ~= nil then
		var3388.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3388.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3388.action_params = t.RefreshFeedEntryFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3388.action_params = t.RefreshFeedEntryFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var3388
end

t_166.descriptor = {
	name = "RefreshFeedEntryFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshFeedEntryFromApiAction"
}
t.RefreshFeedEntryFromApiAction = t_166
typeRegistryModule.default:register(t.RefreshFeedEntryFromApiAction)
local t_167 = {}
t_167.__index = t_167

function t_167.new(p167)
	-- upvalues: t_167 (ref)
	return setmetatable({
		page_entry_identifier = if p167 == nil or p167.page_entry_identifier == nil then nil else p167.page_entry_identifier,
		feed_entry_identifier = if p167 == nil or p167.feed_entry_identifier == nil then nil else p167.feed_entry_identifier,
		selected_option_ids = if p167 == nil or p167.selected_option_ids == nil then nil else p167.selected_option_ids
	}, t_167)
end

function t_167:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3388 = 0
	
	if self.page_entry_identifier ~= nil then
		local var3389 = self.page_entry_identifier:encode()
		local var3390, var3391 = protoModule.writeTag(buff, var3388, 1, protoModule.wireTypes.lengthDelimited)
		var3390, var5530 = protoModule.writeBuffer(var3390, var3391, var3389, buffer.len(var3389))
		buff = var3390
		var3388 = var3391
	end
	if self.feed_entry_identifier ~= nil then
		local var3392 = self.feed_entry_identifier:encode()
		local var3393, var3394 = protoModule.writeTag(buff, var3388, 2, protoModule.wireTypes.lengthDelimited)
		var3393, var5533 = protoModule.writeBuffer(var3393, var3394, var3392, buffer.len(var3392))
		buff = var3393
		var3388 = var3394
	end
	if self.selected_option_ids ~= nil then
		local var3395 = self.selected_option_ids:encode()
		local var3396, var3397 = protoModule.writeTag(buff, var3388, 3, protoModule.wireTypes.lengthDelimited)
		var3396, var5536 = protoModule.writeBuffer(var3396, var3397, var3395, buffer.len(var3395))
		buff = var3396
		var3388 = var3397
	end
	local buff_1 = buffer.create(var3388)
	buffer.copy(buff_1, 0, buff, 0, var3388)
	
	return buff_1
end

function t_167.decode(p167)
	-- upvalues: t_167 (ref), protoModule (ref), propTypesModule (ref)
	local var3388 = t_167.new()
	local var3389 = 0
	while var3389 < buffer.len(p167) do
		local _ = nil
		local var3390 = nil
		local var3391, var3392, var3393 = protoModule.readTag(p167, var3389)
		local var3394 = var3391
		var3390 = var3392
		var3389 = var3393
		
		if var3390 == protoModule.wireTypes.varint then
			local _ = nil
			local var3395, var3396 = protoModule.readVarInt(p167, var3389)
			local _ = var3395
			var3389 = var3396
			continue
		end
		if var3390 == protoModule.wireTypes.lengthDelimited then
			if var3394 == 1 then
				local _ = nil
				local var3397, var3398 = protoModule.readBuffer(p167, var3389)
				var3389 = var3398
				var3388.page_entry_identifier = propTypesModule.StringProp.decode(var3397)
			elseif var3394 == 2 then
				local _ = nil
				local var3399, var3400 = protoModule.readBuffer(p167, var3389)
				var3389 = var3400
				var3388.feed_entry_identifier = propTypesModule.StringProp.decode(var3399)
			elseif var3394 == 3 then
				local _ = nil
				local var3401, var3402 = protoModule.readBuffer(p167, var3389)
				var3389 = var3402
				var3388.selected_option_ids = propTypesModule.StringArrayProp.decode(var3401)
			else
				local _ = nil
				local var3403, var3404 = protoModule.readVarInt(p167, var3389)
				var3389 = var3404 + var3403
			end
		elseif var3390 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3405, var3406 = protoModule.readFixed32(p167, var3389)
			local _ = var3405
			var3389 = var3406
		elseif var3390 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3407, var3408 = protoModule.readFixed64(p167, var3389)
			local _ = var3407
			var3389 = var3408
		else
			error("Unsupported wire type: " .. var5540)
		end
	end
	return var3388
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
	local var3409 = t_167.new()
	
	if self.page_entry_identifier ~= nil then
		var3409.page_entry_identifier = propTypesModule.StringProp.jsonDecode(self.page_entry_identifier)
	end
	if self.pageEntryIdentifier ~= nil then
		var3409.page_entry_identifier = propTypesModule.StringProp.jsonDecode(self.pageEntryIdentifier)
	end
	if self.feed_entry_identifier ~= nil then
		var3409.feed_entry_identifier = propTypesModule.StringProp.jsonDecode(self.feed_entry_identifier)
	end
	if self.feedEntryIdentifier ~= nil then
		var3409.feed_entry_identifier = propTypesModule.StringProp.jsonDecode(self.feedEntryIdentifier)
	end
	if self.selected_option_ids ~= nil then
		var3409.selected_option_ids = propTypesModule.StringArrayProp.jsonDecode(self.selected_option_ids)
	end
	if self.selectedOptionIds ~= nil then
		var3409.selected_option_ids = propTypesModule.StringArrayProp.jsonDecode(self.selectedOptionIds)
	end
	return var3409
end

t_167.descriptor = {
	name = "RefreshFeedEntryFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshFeedEntryFromApiAction_Params = t_167
typeRegistryModule.default:register(t.RefreshFeedEntryFromApiAction_Params)
local t_168 = {}
t_168.__index = t_168

function t_168.new(p168)
	-- upvalues: t (ref), t_168 (ref)
	return setmetatable({
		action_type = if p168 == nil or p168.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p168.action_type,
		action_params = if p168 == nil or p168.action_params == nil then nil else p168.action_params
	}, t_168)
end

function t_168:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3409 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3410, var3411 = protoModule.writeTag(buff, var3409, 1, protoModule.wireTypes.varint)
		var3410, var5564 = protoModule.writeVarInt(var3410, var3411, t.ActionType.toNumber(self.action_type))
		buff = var3410
		var3409 = var3411
	end
	if self.action_params ~= nil then
		local var3412 = self.action_params:encode()
		local var3413, var3414 = protoModule.writeTag(buff, var3409, 2, protoModule.wireTypes.lengthDelimited)
		var3413, var5567 = protoModule.writeBuffer(var3413, var3414, var3412, buffer.len(var3412))
		buff = var3413
		var3409 = var3414
	end
	local buff_1 = buffer.create(var3409)
	buffer.copy(buff_1, 0, buff, 0, var3409)
	
	return buff_1
end

function t_168.decode(p168)
	-- upvalues: t_168 (ref), protoModule (ref), t (ref)
	local var3409 = t_168.new()
	local var3410 = 0
	while var3410 < buffer.len(p168) do
		local _ = nil
		local var3411 = nil
		local var3412, var3413, var3414 = protoModule.readTag(p168, var3410)
		local var3415 = var3412
		var3411 = var3413
		var3410 = var3414
		
		if var3411 == protoModule.wireTypes.varint then
			if var3415 == 1 then
				local _ = nil
				local var3416, var3417 = protoModule.readVarIntI32(p168, var3410)
				local var3418 = var3416
				var3410 = var3417
				var3409.action_type = t.ActionType.fromNumber(var3418) or var3418
			else
				local _ = nil
				local var3419, var3420 = protoModule.readVarInt(p168, var3410)
				local _ = var3419
				var3410 = var3420
			end
		end
		if var3411 == protoModule.wireTypes.lengthDelimited then
			if var3415 == 2 then
				local _ = nil
				local var3421, var3422 = protoModule.readBuffer(p168, var3410)
				var3410 = var3422
				var3409.action_params = t.OpenProfileFramesEditorAction_Params.decode(var3421)
			else
				local _ = nil
				local var3423, var3424 = protoModule.readVarInt(p168, var3410)
				var3410 = var3424 + var3423
			end
		elseif var3411 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3425, var3426 = protoModule.readFixed32(p168, var3410)
			local _ = var3425
			var3410 = var3426
		elseif var3411 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3427, var3428 = protoModule.readFixed64(p168, var3410)
			local _ = var3427
			var3410 = var3428
		else
			error("Unsupported wire type: " .. var5571)
		end
	end
	return var3409
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
	local var3429 = t_168.new()
	
	if self.action_type ~= nil then
		var3429.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3429.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3429.action_params = t.OpenProfileFramesEditorAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3429.action_params = t.OpenProfileFramesEditorAction_Params.jsonDecode(self.actionParams)
	end
	return var3429
end

t_168.descriptor = {
	name = "OpenProfileFramesEditorAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenProfileFramesEditorAction"
}
t.OpenProfileFramesEditorAction = t_168
typeRegistryModule.default:register(t.OpenProfileFramesEditorAction)
local t_169 = {}
t_169.__index = t_169

function t_169.new(p169)
	-- upvalues: t_169 (ref)
	return setmetatable({
		prompt_id = if p169 == nil or p169.prompt_id == nil then nil else p169.prompt_id,
		prompt_type = if p169 == nil or p169.prompt_type == nil then nil else p169.prompt_type,
		source = if p169 == nil or p169.source == nil then nil else p169.source
	}, t_169)
end

function t_169:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3429 = 0
	
	if self.prompt_id ~= nil then
		local var3430 = self.prompt_id:encode()
		local var3431, var3432 = protoModule.writeTag(buff, var3429, 1, protoModule.wireTypes.lengthDelimited)
		var3431, var5595 = protoModule.writeBuffer(var3431, var3432, var3430, buffer.len(var3430))
		buff = var3431
		var3429 = var3432
	end
	if self.prompt_type ~= nil then
		local var3433 = self.prompt_type:encode()
		local var3434, var3435 = protoModule.writeTag(buff, var3429, 2, protoModule.wireTypes.lengthDelimited)
		var3434, var5598 = protoModule.writeBuffer(var3434, var3435, var3433, buffer.len(var3433))
		buff = var3434
		var3429 = var3435
	end
	if self.source ~= nil then
		local var3436 = self.source:encode()
		local var3437, var3438 = protoModule.writeTag(buff, var3429, 3, protoModule.wireTypes.lengthDelimited)
		var3437, var5601 = protoModule.writeBuffer(var3437, var3438, var3436, buffer.len(var3436))
		buff = var3437
		var3429 = var3438
	end
	local buff_1 = buffer.create(var3429)
	buffer.copy(buff_1, 0, buff, 0, var3429)
	
	return buff_1
end

function t_169.decode(p169)
	-- upvalues: t_169 (ref), protoModule (ref), propTypesModule (ref)
	local var3429 = t_169.new()
	local var3430 = 0
	while var3430 < buffer.len(p169) do
		local _ = nil
		local var3431 = nil
		local var3432, var3433, var3434 = protoModule.readTag(p169, var3430)
		local var3435 = var3432
		var3431 = var3433
		var3430 = var3434
		
		if var3431 == protoModule.wireTypes.varint then
			local _ = nil
			local var3436, var3437 = protoModule.readVarInt(p169, var3430)
			local _ = var3436
			var3430 = var3437
			continue
		end
		if var3431 == protoModule.wireTypes.lengthDelimited then
			if var3435 == 1 then
				local _ = nil
				local var3438, var3439 = protoModule.readBuffer(p169, var3430)
				var3430 = var3439
				var3429.prompt_id = propTypesModule.StringProp.decode(var3438)
			elseif var3435 == 2 then
				local _ = nil
				local var3440, var3441 = protoModule.readBuffer(p169, var3430)
				var3430 = var3441
				var3429.prompt_type = propTypesModule.StringProp.decode(var3440)
			elseif var3435 == 3 then
				local _ = nil
				local var3442, var3443 = protoModule.readBuffer(p169, var3430)
				var3430 = var3443
				var3429.source = propTypesModule.StringProp.decode(var3442)
			else
				local _ = nil
				local var3444, var3445 = protoModule.readVarInt(p169, var3430)
				var3430 = var3445 + var3444
			end
		elseif var3431 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3446, var3447 = protoModule.readFixed32(p169, var3430)
			local _ = var3446
			var3430 = var3447
		elseif var3431 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3448, var3449 = protoModule.readFixed64(p169, var3430)
			local _ = var3448
			var3430 = var3449
		else
			error("Unsupported wire type: " .. var5605)
		end
	end
	return var3429
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
	local var3450 = t_169.new()
	
	if self.prompt_id ~= nil then
		var3450.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var3450.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.prompt_type ~= nil then
		var3450.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var3450.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.source ~= nil then
		var3450.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var3450
end

t_169.descriptor = {
	name = "OpenProfileFramesEditorAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenProfileFramesEditorAction_Params = t_169
typeRegistryModule.default:register(t.OpenProfileFramesEditorAction_Params)
local t_170 = {}
t_170.__index = t_170

function t_170.new(p170)
	-- upvalues: t_170 (ref)
	return setmetatable({
		kind = if p170 == nil or p170.kind == nil then nil else p170.kind,
		telemetry_handler = if p170 == nil or p170.telemetry_handler == nil then nil else p170.telemetry_handler,
		accessibility_label = if p170 == nil or p170.accessibility_label == nil then nil else p170.accessibility_label,
		skip_unified_logging = if p170 == nil or p170.skip_unified_logging == nil then nil else p170.skip_unified_logging,
		action_event_name = if p170 == nil or p170.action_event_name == nil then nil else p170.action_event_name
	}, t_170)
end

function t_170:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3450 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "dismiss_dialog_action" then
			local var3451 = self.kind.value:encode()
			local var3452, var3453 = protoModule.writeTag(buff, var3450, 1, protoModule.wireTypes.lengthDelimited)
			var3452, var5630 = protoModule.writeBuffer(var3452, var3453, var3451, buffer.len(var3451))
			buff = var3452
			var3450 = var3453
		elseif self.kind.type == "link_action" then
			local var3454 = self.kind.value:encode()
			local var3455, var3456 = protoModule.writeTag(buff, var3450, 2, protoModule.wireTypes.lengthDelimited)
			var3455, var5633 = protoModule.writeBuffer(var3455, var3456, var3454, buffer.len(var3454))
			buff = var3455
			var3450 = var3456
		elseif self.kind.type == "open_game_details_action" then
			local var3457 = self.kind.value:encode()
			local var3458, var3459 = protoModule.writeTag(buff, var3450, 3, protoModule.wireTypes.lengthDelimited)
			var3458, var5636 = protoModule.writeBuffer(var3458, var3459, var3457, buffer.len(var3457))
			buff = var3458
			var3450 = var3459
		elseif self.kind.type == "open_join_friends_action" then
			local var3460 = self.kind.value:encode()
			local var3461, var3462 = protoModule.writeTag(buff, var3450, 4, protoModule.wireTypes.lengthDelimited)
			var3461, var5639 = protoModule.writeBuffer(var3461, var3462, var3460, buffer.len(var3460))
			buff = var3461
			var3450 = var3462
		elseif self.kind.type == "open_marketplace_try_on_action" then
			local var3463 = self.kind.value:encode()
			local var3464, var3465 = protoModule.writeTag(buff, var3450, 5, protoModule.wireTypes.lengthDelimited)
			var3464, var5642 = protoModule.writeBuffer(var3464, var3465, var3463, buffer.len(var3463))
			buff = var3464
			var3450 = var3465
		elseif self.kind.type == "open_see_all_action" then
			local var3466 = self.kind.value:encode()
			local var3467, var3468 = protoModule.writeTag(buff, var3450, 6, protoModule.wireTypes.lengthDelimited)
			var3467, var5645 = protoModule.writeBuffer(var3467, var3468, var3466, buffer.len(var3466))
			buff = var3467
			var3450 = var3468
		elseif self.kind.type == "open_sponsored_tooltip_action" then
			local var3469 = self.kind.value:encode()
			local var3470, var3471 = protoModule.writeTag(buff, var3450, 7, protoModule.wireTypes.lengthDelimited)
			var3470, var5648 = protoModule.writeBuffer(var3470, var3471, var3469, buffer.len(var3469))
			buff = var3470
			var3450 = var3471
		elseif self.kind.type == "play_button_click_action" then
			local var3472 = self.kind.value:encode()
			local var3473, var3474 = protoModule.writeTag(buff, var3450, 8, protoModule.wireTypes.lengthDelimited)
			var3473, var5651 = protoModule.writeBuffer(var3473, var3474, var3472, buffer.len(var3472))
			buff = var3473
			var3450 = var3474
		elseif self.kind.type == "update_user_settings_action" then
			local var3475 = self.kind.value:encode()
			local var3476, var3477 = protoModule.writeTag(buff, var3450, 9, protoModule.wireTypes.lengthDelimited)
			var3476, var5654 = protoModule.writeBuffer(var3476, var3477, var3475, buffer.len(var3475))
			buff = var3476
			var3450 = var3477
		elseif self.kind.type == "open_tooltip_action" then
			local var3478 = self.kind.value:encode()
			local var3479, var3480 = protoModule.writeTag(buff, var3450, 10, protoModule.wireTypes.lengthDelimited)
			var3479, var5657 = protoModule.writeBuffer(var3479, var3480, var3478, buffer.len(var3478))
			buff = var3479
			var3450 = var3480
		elseif self.kind.type == "open_badge_details_action" then
			local var3481 = self.kind.value:encode()
			local var3482, var3483 = protoModule.writeTag(buff, var3450, 11, protoModule.wireTypes.lengthDelimited)
			var3482, var5660 = protoModule.writeBuffer(var3482, var3483, var3481, buffer.len(var3481))
			buff = var3482
			var3450 = var3483
		elseif self.kind.type == "load_more_from_api_action" then
			local var3484 = self.kind.value:encode()
			local var3485, var3486 = protoModule.writeTag(buff, var3450, 12, protoModule.wireTypes.lengthDelimited)
			var3485, var5663 = protoModule.writeBuffer(var3485, var3486, var3484, buffer.len(var3484))
			buff = var3485
			var3450 = var3486
		elseif self.kind.type == "share_action" then
			local var3487 = self.kind.value:encode()
			local var3488, var3489 = protoModule.writeTag(buff, var3450, 13, protoModule.wireTypes.lengthDelimited)
			var3488, var5666 = protoModule.writeBuffer(var3488, var3489, var3487, buffer.len(var3487))
			buff = var3488
			var3450 = var3489
		elseif self.kind.type == "open_abuse_report_action" then
			local var3490 = self.kind.value:encode()
			local var3491, var3492 = protoModule.writeTag(buff, var3450, 14, protoModule.wireTypes.lengthDelimited)
			var3491, var5669 = protoModule.writeBuffer(var3491, var3492, var3490, buffer.len(var3490))
			buff = var3491
			var3450 = var3492
		elseif self.kind.type == "remove_badge_from_inventory_action" then
			local var3493 = self.kind.value:encode()
			local var3494, var3495 = protoModule.writeTag(buff, var3450, 15, protoModule.wireTypes.lengthDelimited)
			var3494, var5672 = protoModule.writeBuffer(var3494, var3495, var3493, buffer.len(var3493))
			buff = var3494
			var3450 = var3495
		elseif self.kind.type == "open_profile_action" then
			local var3496 = self.kind.value:encode()
			local var3497, var3498 = protoModule.writeTag(buff, var3450, 16, protoModule.wireTypes.lengthDelimited)
			var3497, var5675 = protoModule.writeBuffer(var3497, var3498, var3496, buffer.len(var3496))
			buff = var3497
			var3450 = var3498
		elseif self.kind.type == "open_facial_age_estimation_action" then
			local var3499 = self.kind.value:encode()
			local var3500, var3501 = protoModule.writeTag(buff, var3450, 17, protoModule.wireTypes.lengthDelimited)
			var3500, var5678 = protoModule.writeBuffer(var3500, var3501, var3499, buffer.len(var3499))
			buff = var3500
			var3450 = var3501
		elseif self.kind.type == "open_add_connections_page_action" then
			local var3502 = self.kind.value:encode()
			local var3503, var3504 = protoModule.writeTag(buff, var3450, 18, protoModule.wireTypes.lengthDelimited)
			var3503, var5681 = protoModule.writeBuffer(var3503, var3504, var3502, buffer.len(var3502))
			buff = var3503
			var3450 = var3504
		elseif self.kind.type == "open_marketplace_action" then
			local var3505 = self.kind.value:encode()
			local var3506, var3507 = protoModule.writeTag(buff, var3450, 19, protoModule.wireTypes.lengthDelimited)
			var3506, var5684 = protoModule.writeBuffer(var3506, var3507, var3505, buffer.len(var3505))
			buff = var3506
			var3450 = var3507
		elseif self.kind.type == "hide_profile_completion_action" then
			local var3508 = self.kind.value:encode()
			local var3509, var3510 = protoModule.writeTag(buff, var3450, 20, protoModule.wireTypes.lengthDelimited)
			var3509, var5687 = protoModule.writeBuffer(var3509, var3510, var3508, buffer.len(var3508))
			buff = var3509
			var3450 = var3510
		elseif self.kind.type == "select_marketplace_catalog_category" then
			local var3511 = self.kind.value:encode()
			local var3512, var3513 = protoModule.writeTag(buff, var3450, 21, protoModule.wireTypes.lengthDelimited)
			var3512, var5690 = protoModule.writeBuffer(var3512, var3513, var3511, buffer.len(var3511))
			buff = var3512
			var3450 = var3513
		elseif self.kind.type == "select_marketplace_catalog_subcategory" then
			local var3514 = self.kind.value:encode()
			local var3515, var3516 = protoModule.writeTag(buff, var3450, 22, protoModule.wireTypes.lengthDelimited)
			var3515, var5693 = protoModule.writeBuffer(var3515, var3516, var3514, buffer.len(var3514))
			buff = var3515
			var3450 = var3516
		elseif self.kind.type == "open_marketplace_catalog_see_all" then
			local var3517 = self.kind.value:encode()
			local var3518, var3519 = protoModule.writeTag(buff, var3450, 23, protoModule.wireTypes.lengthDelimited)
			var3518, var5696 = protoModule.writeBuffer(var3518, var3519, var3517, buffer.len(var3517))
			buff = var3518
			var3450 = var3519
		elseif self.kind.type == "close_marketplace_category_tooltip" then
			local var3520 = self.kind.value:encode()
			local var3521, var3522 = protoModule.writeTag(buff, var3450, 24, protoModule.wireTypes.lengthDelimited)
			var3521, var5699 = protoModule.writeBuffer(var3521, var3522, var3520, buffer.len(var3520))
			buff = var3521
			var3450 = var3522
		elseif self.kind.type == "resize_marketplace_catalog" then
			local var3523 = self.kind.value:encode()
			local var3524, var3525 = protoModule.writeTag(buff, var3450, 25, protoModule.wireTypes.lengthDelimited)
			var3524, var5702 = protoModule.writeBuffer(var3524, var3525, var3523, buffer.len(var3523))
			buff = var3524
			var3450 = var3525
		elseif self.kind.type == "open_marketplace_catalog_filters" then
			local var3526 = self.kind.value:encode()
			local var3527, var3528 = protoModule.writeTag(buff, var3450, 26, protoModule.wireTypes.lengthDelimited)
			var3527, var5705 = protoModule.writeBuffer(var3527, var3528, var3526, buffer.len(var3526))
			buff = var3527
			var3450 = var3528
		elseif self.kind.type == "open_social_link_action" then
			local var3529 = self.kind.value:encode()
			local var3530, var3531 = protoModule.writeTag(buff, var3450, 27, protoModule.wireTypes.lengthDelimited)
			var3530, var5708 = protoModule.writeBuffer(var3530, var3531, var3529, buffer.len(var3529))
			buff = var3530
			var3450 = var3531
		elseif self.kind.type == "open_charts_sort_detail_action" then
			local var3532 = self.kind.value:encode()
			local var3533, var3534 = protoModule.writeTag(buff, var3450, 28, protoModule.wireTypes.lengthDelimited)
			var3533, var5711 = protoModule.writeBuffer(var3533, var3534, var3532, buffer.len(var3532))
			buff = var3533
			var3450 = var3534
		elseif self.kind.type == "open_song_detail_action" then
			local var3535 = self.kind.value:encode()
			local var3536, var3537 = protoModule.writeTag(buff, var3450, 29, protoModule.wireTypes.lengthDelimited)
			var3536, var5714 = protoModule.writeBuffer(var3536, var3537, var3535, buffer.len(var3535))
			buff = var3536
			var3450 = var3537
		elseif self.kind.type == "refresh_from_api_action" then
			local var3538 = self.kind.value:encode()
			local var3539, var3540 = protoModule.writeTag(buff, var3450, 30, protoModule.wireTypes.lengthDelimited)
			var3539, var5717 = protoModule.writeBuffer(var3539, var3540, var3538, buffer.len(var3538))
			buff = var3539
			var3450 = var3540
		elseif self.kind.type == "rsvp_to_event_action" then
			local var3541 = self.kind.value:encode()
			local var3542, var3543 = protoModule.writeTag(buff, var3450, 31, protoModule.wireTypes.lengthDelimited)
			var3542, var5720 = protoModule.writeBuffer(var3542, var3543, var3541, buffer.len(var3541))
			buff = var3542
			var3450 = var3543
		elseif self.kind.type == "apply_charts_filter_action" then
			local var3544 = self.kind.value:encode()
			local var3545, var3546 = protoModule.writeTag(buff, var3450, 32, protoModule.wireTypes.lengthDelimited)
			var3545, var5723 = protoModule.writeBuffer(var3545, var3546, var3544, buffer.len(var3544))
			buff = var3545
			var3450 = var3546
		elseif self.kind.type == "analytics_event_action" then
			local var3547 = self.kind.value:encode()
			local var3548, var3549 = protoModule.writeTag(buff, var3450, 33, protoModule.wireTypes.lengthDelimited)
			var3548, var5726 = protoModule.writeBuffer(var3548, var3549, var3547, buffer.len(var3547))
			buff = var3548
			var3450 = var3549
		elseif self.kind.type == "custom_analytics_event_action" then
			local var3550 = self.kind.value:encode()
			local var3551, var3552 = protoModule.writeTag(buff, var3450, 34, protoModule.wireTypes.lengthDelimited)
			var3551, var5729 = protoModule.writeBuffer(var3551, var3552, var3550, buffer.len(var3550))
			buff = var3551
			var3450 = var3552
		elseif self.kind.type == "open_game_invite_action" then
			local var3553 = self.kind.value:encode()
			local var3554, var3555 = protoModule.writeTag(buff, var3450, 35, protoModule.wireTypes.lengthDelimited)
			var3554, var5732 = protoModule.writeBuffer(var3554, var3555, var3553, buffer.len(var3553))
			buff = var3554
			var3450 = var3555
		elseif self.kind.type == "open_event_details_action" then
			local var3556 = self.kind.value:encode()
			local var3557, var3558 = protoModule.writeTag(buff, var3450, 36, protoModule.wireTypes.lengthDelimited)
			var3557, var5735 = protoModule.writeBuffer(var3557, var3558, var3556, buffer.len(var3556))
			buff = var3557
			var3450 = var3558
		elseif self.kind.type == "launch_experience_action" then
			local var3559 = self.kind.value:encode()
			local var3560, var3561 = protoModule.writeTag(buff, var3450, 37, protoModule.wireTypes.lengthDelimited)
			var3560, var5738 = protoModule.writeBuffer(var3560, var3561, var3559, buffer.len(var3559))
			buff = var3560
			var3450 = var3561
		elseif self.kind.type == "toggle_experience_favorite_action" then
			local var3562 = self.kind.value:encode()
			local var3563, var3564 = protoModule.writeTag(buff, var3450, 38, protoModule.wireTypes.lengthDelimited)
			var3563, var5741 = protoModule.writeBuffer(var3563, var3564, var3562, buffer.len(var3562))
			buff = var3563
			var3450 = var3564
		elseif self.kind.type == "toggle_experience_follow_action" then
			local var3565 = self.kind.value:encode()
			local var3566, var3567 = protoModule.writeTag(buff, var3450, 39, protoModule.wireTypes.lengthDelimited)
			var3566, var5744 = protoModule.writeBuffer(var3566, var3567, var3565, buffer.len(var3565))
			buff = var3566
			var3450 = var3567
		elseif self.kind.type == "toggle_experience_vote_action" then
			local var3568 = self.kind.value:encode()
			local var3569, var3570 = protoModule.writeTag(buff, var3450, 40, protoModule.wireTypes.lengthDelimited)
			var3569, var5747 = protoModule.writeBuffer(var3569, var3570, var3568, buffer.len(var3568))
			buff = var3569
			var3450 = var3570
		elseif self.kind.type == "open_purchase_prompt_action" then
			local var3571 = self.kind.value:encode()
			local var3572, var3573 = protoModule.writeTag(buff, var3450, 41, protoModule.wireTypes.lengthDelimited)
			var3572, var5750 = protoModule.writeBuffer(var3572, var3573, var3571, buffer.len(var3571))
			buff = var3572
			var3450 = var3573
		elseif self.kind.type == "open_sdui_overlay_action" then
			local var3574 = self.kind.value:encode()
			local var3575, var3576 = protoModule.writeTag(buff, var3450, 42, protoModule.wireTypes.lengthDelimited)
			var3575, var5753 = protoModule.writeBuffer(var3575, var3576, var3574, buffer.len(var3574))
			buff = var3575
			var3450 = var3576
		elseif self.kind.type == "open_badges_see_all_action" then
			local var3577 = self.kind.value:encode()
			local var3578, var3579 = protoModule.writeTag(buff, var3450, 43, protoModule.wireTypes.lengthDelimited)
			var3578, var5756 = protoModule.writeBuffer(var3578, var3579, var3577, buffer.len(var3577))
			buff = var3578
			var3450 = var3579
		elseif self.kind.type == "open_experience_store_see_all_action" then
			local var3580 = self.kind.value:encode()
			local var3581, var3582 = protoModule.writeTag(buff, var3450, 44, protoModule.wireTypes.lengthDelimited)
			var3581, var5759 = protoModule.writeBuffer(var3581, var3582, var3580, buffer.len(var3580))
			buff = var3581
			var3450 = var3582
		elseif self.kind.type == "dismiss_game_feedback_action" then
			local var3583 = self.kind.value:encode()
			local var3584, var3585 = protoModule.writeTag(buff, var3450, 45, protoModule.wireTypes.lengthDelimited)
			var3584, var5762 = protoModule.writeBuffer(var3584, var3585, var3583, buffer.len(var3583))
			buff = var3584
			var3450 = var3585
		elseif self.kind.type == "open_game_feedback_form_action" then
			local var3586 = self.kind.value:encode()
			local var3587, var3588 = protoModule.writeTag(buff, var3450, 46, protoModule.wireTypes.lengthDelimited)
			var3587, var5765 = protoModule.writeBuffer(var3587, var3588, var3586, buffer.len(var3586))
			buff = var3587
			var3450 = var3588
		elseif self.kind.type == "enable_event_notifications_action" then
			local var3589 = self.kind.value:encode()
			local var3590, var3591 = protoModule.writeTag(buff, var3450, 47, protoModule.wireTypes.lengthDelimited)
			var3590, var5768 = protoModule.writeBuffer(var3590, var3591, var3589, buffer.len(var3589))
			buff = var3590
			var3450 = var3591
		elseif self.kind.type == "dismiss_event_notifications_modal_action" then
			local var3592 = self.kind.value:encode()
			local var3593, var3594 = protoModule.writeTag(buff, var3450, 48, protoModule.wireTypes.lengthDelimited)
			var3593, var5771 = protoModule.writeBuffer(var3593, var3594, var3592, buffer.len(var3592))
			buff = var3593
			var3450 = var3594
		elseif self.kind.type == "open_amp_wizard_action" then
			local var3595 = self.kind.value:encode()
			local var3596, var3597 = protoModule.writeTag(buff, var3450, 49, protoModule.wireTypes.lengthDelimited)
			var3596, var5774 = protoModule.writeBuffer(var3596, var3597, var3595, buffer.len(var3595))
			buff = var3596
			var3450 = var3597
		elseif self.kind.type == "open_subscription_purchase_page_action" then
			local var3598 = self.kind.value:encode()
			local var3599, var3600 = protoModule.writeTag(buff, var3450, 50, protoModule.wireTypes.lengthDelimited)
			var3599, var5777 = protoModule.writeBuffer(var3599, var3600, var3598, buffer.len(var3598))
			buff = var3599
			var3450 = var3600
		elseif self.kind.type == "refresh_game_passes_action" then
			local var3601 = self.kind.value:encode()
			local var3602, var3603 = protoModule.writeTag(buff, var3450, 51, protoModule.wireTypes.lengthDelimited)
			var3602, var5780 = protoModule.writeBuffer(var3602, var3603, var3601, buffer.len(var3601))
			buff = var3602
			var3450 = var3603
		elseif self.kind.type == "refresh_playability_action" then
			local var3604 = self.kind.value:encode()
			local var3605, var3606 = protoModule.writeTag(buff, var3450, 52, protoModule.wireTypes.lengthDelimited)
			var3605, var5783 = protoModule.writeBuffer(var3605, var3606, var3604, buffer.len(var3604))
			buff = var3605
			var3450 = var3606
		elseif self.kind.type == "open_social_proof_user_list_sheet_action" then
			local var3607 = self.kind.value:encode()
			local var3608, var3609 = protoModule.writeTag(buff, var3450, 53, protoModule.wireTypes.lengthDelimited)
			var3608, var5786 = protoModule.writeBuffer(var3608, var3609, var3607, buffer.len(var3607))
			buff = var3608
			var3450 = var3609
		elseif self.kind.type == "report_surface_load_time_milestone_action" then
			local var3610 = self.kind.value:encode()
			local var3611, var3612 = protoModule.writeTag(buff, var3450, 54, protoModule.wireTypes.lengthDelimited)
			var3611, var5789 = protoModule.writeBuffer(var3611, var3612, var3610, buffer.len(var3610))
			buff = var3611
			var3450 = var3612
		elseif self.kind.type == "open_search_results_tab_action" then
			local var3613 = self.kind.value:encode()
			local var3614, var3615 = protoModule.writeTag(buff, var3450, 55, protoModule.wireTypes.lengthDelimited)
			var3614, var5792 = protoModule.writeBuffer(var3614, var3615, var3613, buffer.len(var3613))
			buff = var3614
			var3450 = var3615
		elseif self.kind.type == "open_phone_upsell_modal_action" then
			local var3616 = self.kind.value:encode()
			local var3617, var3618 = protoModule.writeTag(buff, var3450, 56, protoModule.wireTypes.lengthDelimited)
			var3617, var5795 = protoModule.writeBuffer(var3617, var3618, var3616, buffer.len(var3616))
			buff = var3617
			var3450 = var3618
		elseif self.kind.type == "open_email_upsell_modal_action" then
			local var3619 = self.kind.value:encode()
			local var3620, var3621 = protoModule.writeTag(buff, var3450, 57, protoModule.wireTypes.lengthDelimited)
			var3620, var5798 = protoModule.writeBuffer(var3620, var3621, var3619, buffer.len(var3619))
			buff = var3620
			var3450 = var3621
		elseif self.kind.type == "dismiss_prompt_action" then
			local var3622 = self.kind.value:encode()
			local var3623, var3624 = protoModule.writeTag(buff, var3450, 58, protoModule.wireTypes.lengthDelimited)
			var3623, var5801 = protoModule.writeBuffer(var3623, var3624, var3622, buffer.len(var3622))
			buff = var3623
			var3450 = var3624
		elseif self.kind.type == "request_friendship_action" then
			local var3625 = self.kind.value:encode()
			local var3626, var3627 = protoModule.writeTag(buff, var3450, 59, protoModule.wireTypes.lengthDelimited)
			var3626, var5804 = protoModule.writeBuffer(var3626, var3627, var3625, buffer.len(var3625))
			buff = var3626
			var3450 = var3627
		elseif self.kind.type == "refresh_developer_products_action" then
			local var3628 = self.kind.value:encode()
			local var3629, var3630 = protoModule.writeTag(buff, var3450, 60, protoModule.wireTypes.lengthDelimited)
			var3629, var5807 = protoModule.writeBuffer(var3629, var3630, var3628, buffer.len(var3628))
			buff = var3629
			var3450 = var3630
		elseif self.kind.type == "open_fae_trial_upsell_action" then
			local var3631 = self.kind.value:encode()
			local var3632, var3633 = protoModule.writeTag(buff, var3450, 61, protoModule.wireTypes.lengthDelimited)
			var3632, var5810 = protoModule.writeBuffer(var3632, var3633, var3631, buffer.len(var3631))
			buff = var3632
			var3450 = var3633
		elseif self.kind.type == "refresh_omni_recommendation_feed_item_action" then
			local var3634 = self.kind.value:encode()
			local var3635, var3636 = protoModule.writeTag(buff, var3450, 62, protoModule.wireTypes.lengthDelimited)
			var3635, var5813 = protoModule.writeBuffer(var3635, var3636, var3634, buffer.len(var3634))
			buff = var3635
			var3450 = var3636
		elseif self.kind.type == "ai_overview_feedback_action" then
			local var3637 = self.kind.value:encode()
			local var3638, var3639 = protoModule.writeTag(buff, var3450, 63, protoModule.wireTypes.lengthDelimited)
			var3638, var5816 = protoModule.writeBuffer(var3638, var3639, var3637, buffer.len(var3637))
			buff = var3638
			var3450 = var3639
		elseif self.kind.type == "open_trusted_friends_upsell_modal_action" then
			local var3640 = self.kind.value:encode()
			local var3641, var3642 = protoModule.writeTag(buff, var3450, 64, protoModule.wireTypes.lengthDelimited)
			var3641, var5819 = protoModule.writeBuffer(var3641, var3642, var3640, buffer.len(var3640))
			buff = var3641
			var3450 = var3642
		elseif self.kind.type == "record_party_chat_conversation_upsell_acknowledgement_action" then
			local var3643 = self.kind.value:encode()
			local var3644, var3645 = protoModule.writeTag(buff, var3450, 65, protoModule.wireTypes.lengthDelimited)
			var3644, var5822 = protoModule.writeBuffer(var3644, var3645, var3643, buffer.len(var3643))
			buff = var3644
			var3450 = var3645
		elseif self.kind.type == "open_search_results_with_query_action" then
			local var3646 = self.kind.value:encode()
			local var3647, var3648 = protoModule.writeTag(buff, var3450, 66, protoModule.wireTypes.lengthDelimited)
			var3647, var5825 = protoModule.writeBuffer(var3647, var3648, var3646, buffer.len(var3646))
			buff = var3647
			var3450 = var3648
		elseif self.kind.type == "select_marketplace_favorites_category" then
			local var3649 = self.kind.value:encode()
			local var3650, var3651 = protoModule.writeTag(buff, var3450, 67, protoModule.wireTypes.lengthDelimited)
			var3650, var5828 = protoModule.writeBuffer(var3650, var3651, var3649, buffer.len(var3649))
			buff = var3650
			var3450 = var3651
		elseif self.kind.type == "download_app_action" then
			local var3652 = self.kind.value:encode()
			local var3653, var3654 = protoModule.writeTag(buff, var3450, 68, protoModule.wireTypes.lengthDelimited)
			var3653, var5831 = protoModule.writeBuffer(var3653, var3654, var3652, buffer.len(var3652))
			buff = var3653
			var3450 = var3654
		elseif self.kind.type == "refresh_charts_sort_detail_action" then
			local var3655 = self.kind.value:encode()
			local var3656, var3657 = protoModule.writeTag(buff, var3450, 69, protoModule.wireTypes.lengthDelimited)
			var3656, var5834 = protoModule.writeBuffer(var3656, var3657, var3655, buffer.len(var3655))
			buff = var3656
			var3450 = var3657
		elseif self.kind.type == "join_community_action" then
			local var3658 = self.kind.value:encode()
			local var3659, var3660 = protoModule.writeTag(buff, var3450, 70, protoModule.wireTypes.lengthDelimited)
			var3659, var5837 = protoModule.writeBuffer(var3659, var3660, var3658, buffer.len(var3658))
			buff = var3659
			var3450 = var3660
		elseif self.kind.type == "view_community_action" then
			local var3661 = self.kind.value:encode()
			local var3662, var3663 = protoModule.writeTag(buff, var3450, 71, protoModule.wireTypes.lengthDelimited)
			var3662, var5840 = protoModule.writeBuffer(var3662, var3663, var3661, buffer.len(var3661))
			buff = var3662
			var3450 = var3663
		elseif self.kind.type == "pin_experience_shortcut_action" then
			local var3664 = self.kind.value:encode()
			local var3665, var3666 = protoModule.writeTag(buff, var3450, 72, protoModule.wireTypes.lengthDelimited)
			var3665, var5843 = protoModule.writeBuffer(var3665, var3666, var3664, buffer.len(var3664))
			buff = var3665
			var3450 = var3666
		elseif self.kind.type == "select_marketplace_favorites_subcategory" then
			local var3667 = self.kind.value:encode()
			local var3668, var3669 = protoModule.writeTag(buff, var3450, 73, protoModule.wireTypes.lengthDelimited)
			var3668, var5846 = protoModule.writeBuffer(var3668, var3669, var3667, buffer.len(var3667))
			buff = var3668
			var3450 = var3669
		elseif self.kind.type == "show_toast_action" then
			local var3670 = self.kind.value:encode()
			local var3671, var3672 = protoModule.writeTag(buff, var3450, 74, protoModule.wireTypes.lengthDelimited)
			var3671, var5849 = protoModule.writeBuffer(var3671, var3672, var3670, buffer.len(var3670))
			buff = var3671
			var3450 = var3672
		elseif self.kind.type == "open_incoming_transfer_upsell_action" then
			local var3673 = self.kind.value:encode()
			local var3674, var3675 = protoModule.writeTag(buff, var3450, 75, protoModule.wireTypes.lengthDelimited)
			var3674, var5852 = protoModule.writeBuffer(var3674, var3675, var3673, buffer.len(var3673))
			buff = var3674
			var3450 = var3675
		elseif self.kind.type == "action_sequence_action" then
			local var3676 = self.kind.value:encode()
			local var3677, var3678 = protoModule.writeTag(buff, var3450, 76, protoModule.wireTypes.lengthDelimited)
			var3677, var5855 = protoModule.writeBuffer(var3677, var3678, var3676, buffer.len(var3676))
			buff = var3677
			var3450 = var3678
		elseif self.kind.type == "refresh_feed_entry_from_api_action" then
			local var3679 = self.kind.value:encode()
			local var3680, var3681 = protoModule.writeTag(buff, var3450, 77, protoModule.wireTypes.lengthDelimited)
			var3680, var5858 = protoModule.writeBuffer(var3680, var3681, var3679, buffer.len(var3679))
			buff = var3680
			var3450 = var3681
		elseif self.kind.type == "open_profile_frames_editor_action" then
			local var3682 = self.kind.value:encode()
			local var3683, var3684 = protoModule.writeTag(buff, var3450, 78, protoModule.wireTypes.lengthDelimited)
			var3683, var5861 = protoModule.writeBuffer(var3683, var3684, var3682, buffer.len(var3682))
			buff = var3683
			var3450 = var3684
		elseif self.kind.type == "navigate_action" then
			local var3685 = self.kind.value:encode()
			local var3686, var3687 = protoModule.writeTag(buff, var3450, 79, protoModule.wireTypes.lengthDelimited)
			var3686, var5864 = protoModule.writeBuffer(var3686, var3687, var3685, buffer.len(var3685))
			buff = var3686
			var3450 = var3687
		end
	end
	if self.telemetry_handler ~= nil then
		local var3688 = self.telemetry_handler:encode()
		local var3689, var3690 = protoModule.writeTag(buff, var3450, 1000, protoModule.wireTypes.lengthDelimited)
		var3689, var5867 = protoModule.writeBuffer(var3689, var3690, var3688, buffer.len(var3688))
		buff = var3689
		var3450 = var3690
	end
	if self.accessibility_label ~= nil then
		local var3691 = self.accessibility_label:encode()
		local var3692, var3693 = protoModule.writeTag(buff, var3450, 1001, protoModule.wireTypes.lengthDelimited)
		var3692, var5870 = protoModule.writeBuffer(var3692, var3693, var3691, buffer.len(var3691))
		buff = var3692
		var3450 = var3693
	end
	if self.skip_unified_logging ~= nil then
		local var3694 = self.skip_unified_logging:encode()
		local var3695, var3696 = protoModule.writeTag(buff, var3450, 1002, protoModule.wireTypes.lengthDelimited)
		var3695, var5873 = protoModule.writeBuffer(var3695, var3696, var3694, buffer.len(var3694))
		buff = var3695
		var3450 = var3696
	end
	if self.action_event_name ~= nil then
		local var3697 = self.action_event_name:encode()
		local var3698, var3699 = protoModule.writeTag(buff, var3450, 1003, protoModule.wireTypes.lengthDelimited)
		var3698, var5876 = protoModule.writeBuffer(var3698, var3699, var3697, buffer.len(var3697))
		buff = var3698
		var3450 = var3699
	end
	local buff_1 = buffer.create(var3450)
	buffer.copy(buff_1, 0, buff, 0, var3450)
	
	return buff_1
end

function t_170.decode(p170)
	-- upvalues: t_170 (ref), protoModule (ref), t (ref), propTypesModule (ref)
	local var3450 = t_170.new()
	local var3451 = 0
	while var3451 < buffer.len(p170) do
		local _ = nil
		local var3452 = nil
		local var3453, var3454, var3455 = protoModule.readTag(p170, var3451)
		local var3456 = var3453
		var3452 = var3454
		var3451 = var3455
		
		if var3452 == protoModule.wireTypes.varint then
			local _ = nil
			local var3457, var3458 = protoModule.readVarInt(p170, var3451)
			local _ = var3457
			var3451 = var3458
			continue
		end
		if var3452 == protoModule.wireTypes.lengthDelimited then
			if var3456 == 1 then
				local _ = nil
				local var3459, var3460 = protoModule.readBuffer(p170, var3451)
				var3451 = var3460
				var3450.kind = {
					type = "dismiss_dialog_action",
					value = t.DismissDialogAction.decode(var3459)
				}
			elseif var3456 == 2 then
				local _ = nil
				local var3461, var3462 = protoModule.readBuffer(p170, var3451)
				var3451 = var3462
				var3450.kind = {
					type = "link_action",
					value = t.LinkAction.decode(var3461)
				}
			elseif var3456 == 3 then
				local _ = nil
				local var3463, var3464 = protoModule.readBuffer(p170, var3451)
				var3451 = var3464
				var3450.kind = {
					type = "open_game_details_action",
					value = t.OpenGameDetailsAction.decode(var3463)
				}
			elseif var3456 == 4 then
				local _ = nil
				local var3465, var3466 = protoModule.readBuffer(p170, var3451)
				var3451 = var3466
				var3450.kind = {
					type = "open_join_friends_action",
					value = t.OpenJoinFriendsAction.decode(var3465)
				}
			elseif var3456 == 5 then
				local _ = nil
				local var3467, var3468 = protoModule.readBuffer(p170, var3451)
				var3451 = var3468
				var3450.kind = {
					type = "open_marketplace_try_on_action",
					value = t.OpenMarketplaceTryOnAction.decode(var3467)
				}
			elseif var3456 == 6 then
				local _ = nil
				local var3469, var3470 = protoModule.readBuffer(p170, var3451)
				var3451 = var3470
				var3450.kind = {
					type = "open_see_all_action",
					value = t.OpenSeeAllAction.decode(var3469)
				}
			elseif var3456 == 7 then
				local _ = nil
				local var3471, var3472 = protoModule.readBuffer(p170, var3451)
				var3451 = var3472
				var3450.kind = {
					type = "open_sponsored_tooltip_action",
					value = t.OpenSponsoredTooltipAction.decode(var3471)
				}
			elseif var3456 == 8 then
				local _ = nil
				local var3473, var3474 = protoModule.readBuffer(p170, var3451)
				var3451 = var3474
				var3450.kind = {
					type = "play_button_click_action",
					value = t.PlayButtonClickAction.decode(var3473)
				}
			elseif var3456 == 9 then
				local _ = nil
				local var3475, var3476 = protoModule.readBuffer(p170, var3451)
				var3451 = var3476
				var3450.kind = {
					type = "update_user_settings_action",
					value = t.UpdateUserSettingsAction.decode(var3475)
				}
			elseif var3456 == 10 then
				local _ = nil
				local var3477, var3478 = protoModule.readBuffer(p170, var3451)
				var3451 = var3478
				var3450.kind = {
					type = "open_tooltip_action",
					value = t.OpenTooltipAction.decode(var3477)
				}
			elseif var3456 == 11 then
				local _ = nil
				local var3479, var3480 = protoModule.readBuffer(p170, var3451)
				var3451 = var3480
				var3450.kind = {
					type = "open_badge_details_action",
					value = t.OpenBadgeDetailsAction.decode(var3479)
				}
			elseif var3456 == 12 then
				local _ = nil
				local var3481, var3482 = protoModule.readBuffer(p170, var3451)
				var3451 = var3482
				var3450.kind = {
					type = "load_more_from_api_action",
					value = t.LoadMoreFromApiAction.decode(var3481)
				}
			elseif var3456 == 13 then
				local _ = nil
				local var3483, var3484 = protoModule.readBuffer(p170, var3451)
				var3451 = var3484
				var3450.kind = {
					type = "share_action",
					value = t.ShareAction.decode(var3483)
				}
			elseif var3456 == 14 then
				local _ = nil
				local var3485, var3486 = protoModule.readBuffer(p170, var3451)
				var3451 = var3486
				var3450.kind = {
					type = "open_abuse_report_action",
					value = t.OpenAbuseReportAction.decode(var3485)
				}
			elseif var3456 == 15 then
				local _ = nil
				local var3487, var3488 = protoModule.readBuffer(p170, var3451)
				var3451 = var3488
				var3450.kind = {
					type = "remove_badge_from_inventory_action",
					value = t.RemoveBadgeFromInventoryAction.decode(var3487)
				}
			elseif var3456 == 16 then
				local _ = nil
				local var3489, var3490 = protoModule.readBuffer(p170, var3451)
				var3451 = var3490
				var3450.kind = {
					type = "open_profile_action",
					value = t.OpenProfileAction.decode(var3489)
				}
			elseif var3456 == 17 then
				local _ = nil
				local var3491, var3492 = protoModule.readBuffer(p170, var3451)
				var3451 = var3492
				var3450.kind = {
					type = "open_facial_age_estimation_action",
					value = t.OpenFacialAgeEstimationAction.decode(var3491)
				}
			elseif var3456 == 18 then
				local _ = nil
				local var3493, var3494 = protoModule.readBuffer(p170, var3451)
				var3451 = var3494
				var3450.kind = {
					type = "open_add_connections_page_action",
					value = t.OpenAddConnectionsPageAction.decode(var3493)
				}
			elseif var3456 == 19 then
				local _ = nil
				local var3495, var3496 = protoModule.readBuffer(p170, var3451)
				var3451 = var3496
				var3450.kind = {
					type = "open_marketplace_action",
					value = t.OpenMarketplaceAction.decode(var3495)
				}
			elseif var3456 == 20 then
				local _ = nil
				local var3497, var3498 = protoModule.readBuffer(p170, var3451)
				var3451 = var3498
				var3450.kind = {
					type = "hide_profile_completion_action",
					value = t.HideProfileCompletionAction.decode(var3497)
				}
			elseif var3456 == 21 then
				local _ = nil
				local var3499, var3500 = protoModule.readBuffer(p170, var3451)
				var3451 = var3500
				var3450.kind = {
					type = "select_marketplace_catalog_category",
					value = t.SelectMarketplaceCatalogCategory.decode(var3499)
				}
			elseif var3456 == 22 then
				local _ = nil
				local var3501, var3502 = protoModule.readBuffer(p170, var3451)
				var3451 = var3502
				var3450.kind = {
					type = "select_marketplace_catalog_subcategory",
					value = t.SelectMarketplaceCatalogSubcategory.decode(var3501)
				}
			elseif var3456 == 23 then
				local _ = nil
				local var3503, var3504 = protoModule.readBuffer(p170, var3451)
				var3451 = var3504
				var3450.kind = {
					type = "open_marketplace_catalog_see_all",
					value = t.OpenMarketplaceCatalogSeeAll.decode(var3503)
				}
			elseif var3456 == 24 then
				local _ = nil
				local var3505, var3506 = protoModule.readBuffer(p170, var3451)
				var3451 = var3506
				var3450.kind = {
					type = "close_marketplace_category_tooltip",
					value = t.CloseMarketplaceCategoryTooltip.decode(var3505)
				}
			elseif var3456 == 25 then
				local _ = nil
				local var3507, var3508 = protoModule.readBuffer(p170, var3451)
				var3451 = var3508
				var3450.kind = {
					type = "resize_marketplace_catalog",
					value = t.ResizeMarketplaceCatalog.decode(var3507)
				}
			elseif var3456 == 26 then
				local _ = nil
				local var3509, var3510 = protoModule.readBuffer(p170, var3451)
				var3451 = var3510
				var3450.kind = {
					type = "open_marketplace_catalog_filters",
					value = t.OpenMarketplaceCatalogFilters.decode(var3509)
				}
			elseif var3456 == 27 then
				local _ = nil
				local var3511, var3512 = protoModule.readBuffer(p170, var3451)
				var3451 = var3512
				var3450.kind = {
					type = "open_social_link_action",
					value = t.OpenSocialLinkAction.decode(var3511)
				}
			elseif var3456 == 28 then
				local _ = nil
				local var3513, var3514 = protoModule.readBuffer(p170, var3451)
				var3451 = var3514
				var3450.kind = {
					type = "open_charts_sort_detail_action",
					value = t.OpenChartsSortDetailAction.decode(var3513)
				}
			elseif var3456 == 29 then
				local _ = nil
				local var3515, var3516 = protoModule.readBuffer(p170, var3451)
				var3451 = var3516
				var3450.kind = {
					type = "open_song_detail_action",
					value = t.OpenSongDetailAction.decode(var3515)
				}
			elseif var3456 == 30 then
				local _ = nil
				local var3517, var3518 = protoModule.readBuffer(p170, var3451)
				var3451 = var3518
				var3450.kind = {
					type = "refresh_from_api_action",
					value = t.RefreshFromApiAction.decode(var3517)
				}
			elseif var3456 == 31 then
				local _ = nil
				local var3519, var3520 = protoModule.readBuffer(p170, var3451)
				var3451 = var3520
				var3450.kind = {
					type = "rsvp_to_event_action",
					value = t.RsvpToEventAction.decode(var3519)
				}
			elseif var3456 == 32 then
				local _ = nil
				local var3521, var3522 = protoModule.readBuffer(p170, var3451)
				var3451 = var3522
				var3450.kind = {
					type = "apply_charts_filter_action",
					value = t.ApplyChartsFilterAction.decode(var3521)
				}
			elseif var3456 == 33 then
				local _ = nil
				local var3523, var3524 = protoModule.readBuffer(p170, var3451)
				var3451 = var3524
				var3450.kind = {
					type = "analytics_event_action",
					value = t.AnalyticsEventAction.decode(var3523)
				}
			elseif var3456 == 34 then
				local _ = nil
				local var3525, var3526 = protoModule.readBuffer(p170, var3451)
				var3451 = var3526
				var3450.kind = {
					type = "custom_analytics_event_action",
					value = t.CustomAnalyticsEventAction.decode(var3525)
				}
			elseif var3456 == 35 then
				local _ = nil
				local var3527, var3528 = protoModule.readBuffer(p170, var3451)
				var3451 = var3528
				var3450.kind = {
					type = "open_game_invite_action",
					value = t.OpenGameInviteAction.decode(var3527)
				}
			elseif var3456 == 36 then
				local _ = nil
				local var3529, var3530 = protoModule.readBuffer(p170, var3451)
				var3451 = var3530
				var3450.kind = {
					type = "open_event_details_action",
					value = t.OpenEventDetailsAction.decode(var3529)
				}
			elseif var3456 == 37 then
				local _ = nil
				local var3531, var3532 = protoModule.readBuffer(p170, var3451)
				var3451 = var3532
				var3450.kind = {
					type = "launch_experience_action",
					value = t.LaunchExperienceAction.decode(var3531)
				}
			elseif var3456 == 38 then
				local _ = nil
				local var3533, var3534 = protoModule.readBuffer(p170, var3451)
				var3451 = var3534
				var3450.kind = {
					type = "toggle_experience_favorite_action",
					value = t.ToggleExperienceFavoriteAction.decode(var3533)
				}
			elseif var3456 == 39 then
				local _ = nil
				local var3535, var3536 = protoModule.readBuffer(p170, var3451)
				var3451 = var3536
				var3450.kind = {
					type = "toggle_experience_follow_action",
					value = t.ToggleExperienceFollowAction.decode(var3535)
				}
			elseif var3456 == 40 then
				local _ = nil
				local var3537, var3538 = protoModule.readBuffer(p170, var3451)
				var3451 = var3538
				var3450.kind = {
					type = "toggle_experience_vote_action",
					value = t.ToggleExperienceVoteAction.decode(var3537)
				}
			elseif var3456 == 41 then
				local _ = nil
				local var3539, var3540 = protoModule.readBuffer(p170, var3451)
				var3451 = var3540
				var3450.kind = {
					type = "open_purchase_prompt_action",
					value = t.OpenPurchasePromptAction.decode(var3539)
				}
			elseif var3456 == 42 then
				local _ = nil
				local var3541, var3542 = protoModule.readBuffer(p170, var3451)
				var3451 = var3542
				var3450.kind = {
					type = "open_sdui_overlay_action",
					value = t.OpenSduiOverlayAction.decode(var3541)
				}
			elseif var3456 == 43 then
				local _ = nil
				local var3543, var3544 = protoModule.readBuffer(p170, var3451)
				var3451 = var3544
				var3450.kind = {
					type = "open_badges_see_all_action",
					value = t.OpenBadgesSeeAllAction.decode(var3543)
				}
			elseif var3456 == 44 then
				local _ = nil
				local var3545, var3546 = protoModule.readBuffer(p170, var3451)
				var3451 = var3546
				var3450.kind = {
					type = "open_experience_store_see_all_action",
					value = t.OpenExperienceStoreSeeAllAction.decode(var3545)
				}
			elseif var3456 == 45 then
				local _ = nil
				local var3547, var3548 = protoModule.readBuffer(p170, var3451)
				var3451 = var3548
				var3450.kind = {
					type = "dismiss_game_feedback_action",
					value = t.DismissGameFeedbackAction.decode(var3547)
				}
			elseif var3456 == 46 then
				local _ = nil
				local var3549, var3550 = protoModule.readBuffer(p170, var3451)
				var3451 = var3550
				var3450.kind = {
					type = "open_game_feedback_form_action",
					value = t.OpenGameFeedbackFormAction.decode(var3549)
				}
			elseif var3456 == 47 then
				local _ = nil
				local var3551, var3552 = protoModule.readBuffer(p170, var3451)
				var3451 = var3552
				var3450.kind = {
					type = "enable_event_notifications_action",
					value = t.EnableEventNotificationsAction.decode(var3551)
				}
			elseif var3456 == 48 then
				local _ = nil
				local var3553, var3554 = protoModule.readBuffer(p170, var3451)
				var3451 = var3554
				var3450.kind = {
					type = "dismiss_event_notifications_modal_action",
					value = t.DismissEventNotificationsModalAction.decode(var3553)
				}
			elseif var3456 == 49 then
				local _ = nil
				local var3555, var3556 = protoModule.readBuffer(p170, var3451)
				var3451 = var3556
				var3450.kind = {
					type = "open_amp_wizard_action",
					value = t.OpenAmpWizardAction.decode(var3555)
				}
			elseif var3456 == 50 then
				local _ = nil
				local var3557, var3558 = protoModule.readBuffer(p170, var3451)
				var3451 = var3558
				var3450.kind = {
					type = "open_subscription_purchase_page_action",
					value = t.OpenSubscriptionPurchasePageAction.decode(var3557)
				}
			elseif var3456 == 51 then
				local _ = nil
				local var3559, var3560 = protoModule.readBuffer(p170, var3451)
				var3451 = var3560
				var3450.kind = {
					type = "refresh_game_passes_action",
					value = t.RefreshGamePassesAction.decode(var3559)
				}
			elseif var3456 == 52 then
				local _ = nil
				local var3561, var3562 = protoModule.readBuffer(p170, var3451)
				var3451 = var3562
				var3450.kind = {
					type = "refresh_playability_action",
					value = t.RefreshPlayabilityAction.decode(var3561)
				}
			elseif var3456 == 53 then
				local _ = nil
				local var3563, var3564 = protoModule.readBuffer(p170, var3451)
				var3451 = var3564
				var3450.kind = {
					type = "open_social_proof_user_list_sheet_action",
					value = t.OpenSocialProofUserListSheetAction.decode(var3563)
				}
			elseif var3456 == 54 then
				local _ = nil
				local var3565, var3566 = protoModule.readBuffer(p170, var3451)
				var3451 = var3566
				var3450.kind = {
					type = "report_surface_load_time_milestone_action",
					value = t.ReportSurfaceLoadTimeMilestoneAction.decode(var3565)
				}
			elseif var3456 == 55 then
				local _ = nil
				local var3567, var3568 = protoModule.readBuffer(p170, var3451)
				var3451 = var3568
				var3450.kind = {
					type = "open_search_results_tab_action",
					value = t.OpenSearchResultsTabAction.decode(var3567)
				}
			elseif var3456 == 56 then
				local _ = nil
				local var3569, var3570 = protoModule.readBuffer(p170, var3451)
				var3451 = var3570
				var3450.kind = {
					type = "open_phone_upsell_modal_action",
					value = t.OpenPhoneUpsellModalAction.decode(var3569)
				}
			elseif var3456 == 57 then
				local _ = nil
				local var3571, var3572 = protoModule.readBuffer(p170, var3451)
				var3451 = var3572
				var3450.kind = {
					type = "open_email_upsell_modal_action",
					value = t.OpenEmailUpsellModalAction.decode(var3571)
				}
			elseif var3456 == 58 then
				local _ = nil
				local var3573, var3574 = protoModule.readBuffer(p170, var3451)
				var3451 = var3574
				var3450.kind = {
					type = "dismiss_prompt_action",
					value = t.DismissPromptAction.decode(var3573)
				}
			elseif var3456 == 59 then
				local _ = nil
				local var3575, var3576 = protoModule.readBuffer(p170, var3451)
				var3451 = var3576
				var3450.kind = {
					type = "request_friendship_action",
					value = t.RequestFriendshipAction.decode(var3575)
				}
			elseif var3456 == 60 then
				local _ = nil
				local var3577, var3578 = protoModule.readBuffer(p170, var3451)
				var3451 = var3578
				var3450.kind = {
					type = "refresh_developer_products_action",
					value = t.RefreshDeveloperProductsAction.decode(var3577)
				}
			elseif var3456 == 61 then
				local _ = nil
				local var3579, var3580 = protoModule.readBuffer(p170, var3451)
				var3451 = var3580
				var3450.kind = {
					type = "open_fae_trial_upsell_action",
					value = t.OpenFaeTrialUpsellAction.decode(var3579)
				}
			elseif var3456 == 62 then
				local _ = nil
				local var3581, var3582 = protoModule.readBuffer(p170, var3451)
				var3451 = var3582
				var3450.kind = {
					type = "refresh_omni_recommendation_feed_item_action",
					value = t.RefreshOmniRecommendationFeedItemAction.decode(var3581)
				}
			elseif var3456 == 63 then
				local _ = nil
				local var3583, var3584 = protoModule.readBuffer(p170, var3451)
				var3451 = var3584
				var3450.kind = {
					type = "ai_overview_feedback_action",
					value = t.AiOverviewFeedbackAction.decode(var3583)
				}
			elseif var3456 == 64 then
				local _ = nil
				local var3585, var3586 = protoModule.readBuffer(p170, var3451)
				var3451 = var3586
				var3450.kind = {
					type = "open_trusted_friends_upsell_modal_action",
					value = t.OpenTrustedFriendsUpsellModalAction.decode(var3585)
				}
			elseif var3456 == 65 then
				local _ = nil
				local var3587, var3588 = protoModule.readBuffer(p170, var3451)
				var3451 = var3588
				var3450.kind = {
					type = "record_party_chat_conversation_upsell_acknowledgement_action",
					value = t.RecordPartyChatConversationUpsellAcknowledgementAction.decode(var3587)
				}
			elseif var3456 == 66 then
				local _ = nil
				local var3589, var3590 = protoModule.readBuffer(p170, var3451)
				var3451 = var3590
				var3450.kind = {
					type = "open_search_results_with_query_action",
					value = t.OpenSearchResultsWithQueryAction.decode(var3589)
				}
			elseif var3456 == 67 then
				local _ = nil
				local var3591, var3592 = protoModule.readBuffer(p170, var3451)
				var3451 = var3592
				var3450.kind = {
					type = "select_marketplace_favorites_category",
					value = t.SelectMarketplaceFavoritesCategory.decode(var3591)
				}
			elseif var3456 == 68 then
				local _ = nil
				local var3593, var3594 = protoModule.readBuffer(p170, var3451)
				var3451 = var3594
				var3450.kind = {
					type = "download_app_action",
					value = t.DownloadAppAction.decode(var3593)
				}
			elseif var3456 == 69 then
				local _ = nil
				local var3595, var3596 = protoModule.readBuffer(p170, var3451)
				var3451 = var3596
				var3450.kind = {
					type = "refresh_charts_sort_detail_action",
					value = t.RefreshChartsSortDetailAction.decode(var3595)
				}
			elseif var3456 == 70 then
				local _ = nil
				local var3597, var3598 = protoModule.readBuffer(p170, var3451)
				var3451 = var3598
				var3450.kind = {
					type = "join_community_action",
					value = t.JoinCommunityAction.decode(var3597)
				}
			elseif var3456 == 71 then
				local _ = nil
				local var3599, var3600 = protoModule.readBuffer(p170, var3451)
				var3451 = var3600
				var3450.kind = {
					type = "view_community_action",
					value = t.ViewCommunityAction.decode(var3599)
				}
			elseif var3456 == 72 then
				local _ = nil
				local var3601, var3602 = protoModule.readBuffer(p170, var3451)
				var3451 = var3602
				var3450.kind = {
					type = "pin_experience_shortcut_action",
					value = t.PinExperienceShortcutAction.decode(var3601)
				}
			elseif var3456 == 73 then
				local _ = nil
				local var3603, var3604 = protoModule.readBuffer(p170, var3451)
				var3451 = var3604
				var3450.kind = {
					type = "select_marketplace_favorites_subcategory",
					value = t.SelectMarketplaceFavoritesSubcategory.decode(var3603)
				}
			elseif var3456 == 74 then
				local _ = nil
				local var3605, var3606 = protoModule.readBuffer(p170, var3451)
				var3451 = var3606
				var3450.kind = {
					type = "show_toast_action",
					value = t.ShowToastAction.decode(var3605)
				}
			elseif var3456 == 75 then
				local _ = nil
				local var3607, var3608 = protoModule.readBuffer(p170, var3451)
				var3451 = var3608
				var3450.kind = {
					type = "open_incoming_transfer_upsell_action",
					value = t.OpenIncomingTransferUpsellAction.decode(var3607)
				}
			elseif var3456 == 76 then
				local _ = nil
				local var3609, var3610 = protoModule.readBuffer(p170, var3451)
				var3451 = var3610
				var3450.kind = {
					type = "action_sequence_action",
					value = t.ActionSequenceAction.decode(var3609)
				}
			elseif var3456 == 77 then
				local _ = nil
				local var3611, var3612 = protoModule.readBuffer(p170, var3451)
				var3451 = var3612
				var3450.kind = {
					type = "refresh_feed_entry_from_api_action",
					value = t.RefreshFeedEntryFromApiAction.decode(var3611)
				}
			elseif var3456 == 78 then
				local _ = nil
				local var3613, var3614 = protoModule.readBuffer(p170, var3451)
				var3451 = var3614
				var3450.kind = {
					type = "open_profile_frames_editor_action",
					value = t.OpenProfileFramesEditorAction.decode(var3613)
				}
			elseif var3456 == 79 then
				local _ = nil
				local var3615, var3616 = protoModule.readBuffer(p170, var3451)
				var3451 = var3616
				var3450.kind = {
					type = "navigate_action",
					value = t.NavigateAction.decode(var3615)
				}
			elseif var3456 == 1000 then
				local _ = nil
				local var3617, var3618 = protoModule.readBuffer(p170, var3451)
				var3451 = var3618
				var3450.telemetry_handler = propTypesModule.StringProp.decode(var3617)
			elseif var3456 == 1001 then
				local _ = nil
				local var3619, var3620 = protoModule.readBuffer(p170, var3451)
				var3451 = var3620
				var3450.accessibility_label = propTypesModule.StringFormat.decode(var3619)
			elseif var3456 == 1002 then
				local _ = nil
				local var3621, var3622 = protoModule.readBuffer(p170, var3451)
				var3451 = var3622
				var3450.skip_unified_logging = propTypesModule.BoolProp.decode(var3621)
			elseif var3456 == 1003 then
				local _ = nil
				local var3623, var3624 = protoModule.readBuffer(p170, var3451)
				var3451 = var3624
				var3450.action_event_name = propTypesModule.StringProp.decode(var3623)
			else
				local _ = nil
				local var3625, var3626 = protoModule.readVarInt(p170, var3451)
				var3451 = var3626 + var3625
			end
		elseif var3452 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3627, var3628 = protoModule.readFixed32(p170, var3451)
			local _ = var3627
			var3451 = var3628
		elseif var3452 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3629, var3630 = protoModule.readFixed64(p170, var3451)
			local _ = var3629
			var3451 = var3630
		else
			error("Unsupported wire type: " .. var5880)
		end
	end
	return var3450
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
	local var3631 = t_170.new()
	
	if self.dismiss_dialog_action ~= nil then
		var3631.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismiss_dialog_action)
		}
	end
	if self.dismissDialogAction ~= nil then
		var3631.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismissDialogAction)
		}
	end
	if self.link_action ~= nil then
		var3631.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.link_action)
		}
	end
	if self.linkAction ~= nil then
		var3631.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.linkAction)
		}
	end
	if self.open_game_details_action ~= nil then
		var3631.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.open_game_details_action)
		}
	end
	if self.openGameDetailsAction ~= nil then
		var3631.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.openGameDetailsAction)
		}
	end
	if self.open_join_friends_action ~= nil then
		var3631.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.open_join_friends_action)
		}
	end
	if self.openJoinFriendsAction ~= nil then
		var3631.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.openJoinFriendsAction)
		}
	end
	if self.open_marketplace_try_on_action ~= nil then
		var3631.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.open_marketplace_try_on_action)
		}
	end
	if self.openMarketplaceTryOnAction ~= nil then
		var3631.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.openMarketplaceTryOnAction)
		}
	end
	if self.open_see_all_action ~= nil then
		var3631.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.open_see_all_action)
		}
	end
	if self.openSeeAllAction ~= nil then
		var3631.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.openSeeAllAction)
		}
	end
	if self.open_sponsored_tooltip_action ~= nil then
		var3631.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.open_sponsored_tooltip_action)
		}
	end
	if self.openSponsoredTooltipAction ~= nil then
		var3631.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.openSponsoredTooltipAction)
		}
	end
	if self.play_button_click_action ~= nil then
		var3631.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.play_button_click_action)
		}
	end
	if self.playButtonClickAction ~= nil then
		var3631.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.playButtonClickAction)
		}
	end
	if self.update_user_settings_action ~= nil then
		var3631.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.update_user_settings_action)
		}
	end
	if self.updateUserSettingsAction ~= nil then
		var3631.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.updateUserSettingsAction)
		}
	end
	if self.open_tooltip_action ~= nil then
		var3631.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.open_tooltip_action)
		}
	end
	if self.openTooltipAction ~= nil then
		var3631.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.openTooltipAction)
		}
	end
	if self.open_badge_details_action ~= nil then
		var3631.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.open_badge_details_action)
		}
	end
	if self.openBadgeDetailsAction ~= nil then
		var3631.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.openBadgeDetailsAction)
		}
	end
	if self.load_more_from_api_action ~= nil then
		var3631.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.load_more_from_api_action)
		}
	end
	if self.loadMoreFromApiAction ~= nil then
		var3631.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.loadMoreFromApiAction)
		}
	end
	if self.share_action ~= nil then
		var3631.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.share_action)
		}
	end
	if self.shareAction ~= nil then
		var3631.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.shareAction)
		}
	end
	if self.open_abuse_report_action ~= nil then
		var3631.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.open_abuse_report_action)
		}
	end
	if self.openAbuseReportAction ~= nil then
		var3631.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.openAbuseReportAction)
		}
	end
	if self.remove_badge_from_inventory_action ~= nil then
		var3631.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.remove_badge_from_inventory_action)
		}
	end
	if self.removeBadgeFromInventoryAction ~= nil then
		var3631.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.removeBadgeFromInventoryAction)
		}
	end
	if self.open_profile_action ~= nil then
		var3631.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.open_profile_action)
		}
	end
	if self.openProfileAction ~= nil then
		var3631.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.openProfileAction)
		}
	end
	if self.open_facial_age_estimation_action ~= nil then
		var3631.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.open_facial_age_estimation_action)
		}
	end
	if self.openFacialAgeEstimationAction ~= nil then
		var3631.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.openFacialAgeEstimationAction)
		}
	end
	if self.open_add_connections_page_action ~= nil then
		var3631.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.open_add_connections_page_action)
		}
	end
	if self.openAddConnectionsPageAction ~= nil then
		var3631.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.openAddConnectionsPageAction)
		}
	end
	if self.open_marketplace_action ~= nil then
		var3631.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.open_marketplace_action)
		}
	end
	if self.openMarketplaceAction ~= nil then
		var3631.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.openMarketplaceAction)
		}
	end
	if self.hide_profile_completion_action ~= nil then
		var3631.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hide_profile_completion_action)
		}
	end
	if self.hideProfileCompletionAction ~= nil then
		var3631.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hideProfileCompletionAction)
		}
	end
	if self.select_marketplace_catalog_category ~= nil then
		var3631.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.select_marketplace_catalog_category)
		}
	end
	if self.selectMarketplaceCatalogCategory ~= nil then
		var3631.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.selectMarketplaceCatalogCategory)
		}
	end
	if self.select_marketplace_catalog_subcategory ~= nil then
		var3631.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.select_marketplace_catalog_subcategory)
		}
	end
	if self.selectMarketplaceCatalogSubcategory ~= nil then
		var3631.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.selectMarketplaceCatalogSubcategory)
		}
	end
	if self.open_marketplace_catalog_see_all ~= nil then
		var3631.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.open_marketplace_catalog_see_all)
		}
	end
	if self.openMarketplaceCatalogSeeAll ~= nil then
		var3631.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.openMarketplaceCatalogSeeAll)
		}
	end
	if self.close_marketplace_category_tooltip ~= nil then
		var3631.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.close_marketplace_category_tooltip)
		}
	end
	if self.closeMarketplaceCategoryTooltip ~= nil then
		var3631.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.closeMarketplaceCategoryTooltip)
		}
	end
	if self.resize_marketplace_catalog ~= nil then
		var3631.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resize_marketplace_catalog)
		}
	end
	if self.resizeMarketplaceCatalog ~= nil then
		var3631.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resizeMarketplaceCatalog)
		}
	end
	if self.open_marketplace_catalog_filters ~= nil then
		var3631.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.open_marketplace_catalog_filters)
		}
	end
	if self.openMarketplaceCatalogFilters ~= nil then
		var3631.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.openMarketplaceCatalogFilters)
		}
	end
	if self.open_social_link_action ~= nil then
		var3631.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.open_social_link_action)
		}
	end
	if self.openSocialLinkAction ~= nil then
		var3631.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.openSocialLinkAction)
		}
	end
	if self.open_charts_sort_detail_action ~= nil then
		var3631.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.open_charts_sort_detail_action)
		}
	end
	if self.openChartsSortDetailAction ~= nil then
		var3631.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.openChartsSortDetailAction)
		}
	end
	if self.open_song_detail_action ~= nil then
		var3631.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.open_song_detail_action)
		}
	end
	if self.openSongDetailAction ~= nil then
		var3631.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.openSongDetailAction)
		}
	end
	if self.refresh_from_api_action ~= nil then
		var3631.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refresh_from_api_action)
		}
	end
	if self.refreshFromApiAction ~= nil then
		var3631.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refreshFromApiAction)
		}
	end
	if self.rsvp_to_event_action ~= nil then
		var3631.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvp_to_event_action)
		}
	end
	if self.rsvpToEventAction ~= nil then
		var3631.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvpToEventAction)
		}
	end
	if self.apply_charts_filter_action ~= nil then
		var3631.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.apply_charts_filter_action)
		}
	end
	if self.applyChartsFilterAction ~= nil then
		var3631.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.applyChartsFilterAction)
		}
	end
	if self.analytics_event_action ~= nil then
		var3631.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analytics_event_action)
		}
	end
	if self.analyticsEventAction ~= nil then
		var3631.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analyticsEventAction)
		}
	end
	if self.custom_analytics_event_action ~= nil then
		var3631.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.custom_analytics_event_action)
		}
	end
	if self.customAnalyticsEventAction ~= nil then
		var3631.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.customAnalyticsEventAction)
		}
	end
	if self.open_game_invite_action ~= nil then
		var3631.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.open_game_invite_action)
		}
	end
	if self.openGameInviteAction ~= nil then
		var3631.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.openGameInviteAction)
		}
	end
	if self.open_event_details_action ~= nil then
		var3631.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.open_event_details_action)
		}
	end
	if self.openEventDetailsAction ~= nil then
		var3631.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.openEventDetailsAction)
		}
	end
	if self.launch_experience_action ~= nil then
		var3631.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launch_experience_action)
		}
	end
	if self.launchExperienceAction ~= nil then
		var3631.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launchExperienceAction)
		}
	end
	if self.toggle_experience_favorite_action ~= nil then
		var3631.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggle_experience_favorite_action)
		}
	end
	if self.toggleExperienceFavoriteAction ~= nil then
		var3631.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggleExperienceFavoriteAction)
		}
	end
	if self.toggle_experience_follow_action ~= nil then
		var3631.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggle_experience_follow_action)
		}
	end
	if self.toggleExperienceFollowAction ~= nil then
		var3631.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggleExperienceFollowAction)
		}
	end
	if self.toggle_experience_vote_action ~= nil then
		var3631.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggle_experience_vote_action)
		}
	end
	if self.toggleExperienceVoteAction ~= nil then
		var3631.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggleExperienceVoteAction)
		}
	end
	if self.open_purchase_prompt_action ~= nil then
		var3631.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.open_purchase_prompt_action)
		}
	end
	if self.openPurchasePromptAction ~= nil then
		var3631.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.openPurchasePromptAction)
		}
	end
	if self.open_sdui_overlay_action ~= nil then
		var3631.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.open_sdui_overlay_action)
		}
	end
	if self.openSduiOverlayAction ~= nil then
		var3631.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.openSduiOverlayAction)
		}
	end
	if self.open_badges_see_all_action ~= nil then
		var3631.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.open_badges_see_all_action)
		}
	end
	if self.openBadgesSeeAllAction ~= nil then
		var3631.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.openBadgesSeeAllAction)
		}
	end
	if self.open_experience_store_see_all_action ~= nil then
		var3631.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.open_experience_store_see_all_action)
		}
	end
	if self.openExperienceStoreSeeAllAction ~= nil then
		var3631.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.openExperienceStoreSeeAllAction)
		}
	end
	if self.dismiss_game_feedback_action ~= nil then
		var3631.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismiss_game_feedback_action)
		}
	end
	if self.dismissGameFeedbackAction ~= nil then
		var3631.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismissGameFeedbackAction)
		}
	end
	if self.open_game_feedback_form_action ~= nil then
		var3631.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.open_game_feedback_form_action)
		}
	end
	if self.openGameFeedbackFormAction ~= nil then
		var3631.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.openGameFeedbackFormAction)
		}
	end
	if self.enable_event_notifications_action ~= nil then
		var3631.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enable_event_notifications_action)
		}
	end
	if self.enableEventNotificationsAction ~= nil then
		var3631.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enableEventNotificationsAction)
		}
	end
	if self.dismiss_event_notifications_modal_action ~= nil then
		var3631.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismiss_event_notifications_modal_action)
		}
	end
	if self.dismissEventNotificationsModalAction ~= nil then
		var3631.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismissEventNotificationsModalAction)
		}
	end
	if self.open_amp_wizard_action ~= nil then
		var3631.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.open_amp_wizard_action)
		}
	end
	if self.openAmpWizardAction ~= nil then
		var3631.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.openAmpWizardAction)
		}
	end
	if self.open_subscription_purchase_page_action ~= nil then
		var3631.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.open_subscription_purchase_page_action)
		}
	end
	if self.openSubscriptionPurchasePageAction ~= nil then
		var3631.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.openSubscriptionPurchasePageAction)
		}
	end
	if self.refresh_game_passes_action ~= nil then
		var3631.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refresh_game_passes_action)
		}
	end
	if self.refreshGamePassesAction ~= nil then
		var3631.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refreshGamePassesAction)
		}
	end
	if self.refresh_playability_action ~= nil then
		var3631.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refresh_playability_action)
		}
	end
	if self.refreshPlayabilityAction ~= nil then
		var3631.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refreshPlayabilityAction)
		}
	end
	if self.open_social_proof_user_list_sheet_action ~= nil then
		var3631.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.open_social_proof_user_list_sheet_action)
		}
	end
	if self.openSocialProofUserListSheetAction ~= nil then
		var3631.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.openSocialProofUserListSheetAction)
		}
	end
	if self.report_surface_load_time_milestone_action ~= nil then
		var3631.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.report_surface_load_time_milestone_action)
		}
	end
	if self.reportSurfaceLoadTimeMilestoneAction ~= nil then
		var3631.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.reportSurfaceLoadTimeMilestoneAction)
		}
	end
	if self.open_search_results_tab_action ~= nil then
		var3631.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.open_search_results_tab_action)
		}
	end
	if self.openSearchResultsTabAction ~= nil then
		var3631.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.openSearchResultsTabAction)
		}
	end
	if self.open_phone_upsell_modal_action ~= nil then
		var3631.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.open_phone_upsell_modal_action)
		}
	end
	if self.openPhoneUpsellModalAction ~= nil then
		var3631.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.openPhoneUpsellModalAction)
		}
	end
	if self.open_email_upsell_modal_action ~= nil then
		var3631.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.open_email_upsell_modal_action)
		}
	end
	if self.openEmailUpsellModalAction ~= nil then
		var3631.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.openEmailUpsellModalAction)
		}
	end
	if self.dismiss_prompt_action ~= nil then
		var3631.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismiss_prompt_action)
		}
	end
	if self.dismissPromptAction ~= nil then
		var3631.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismissPromptAction)
		}
	end
	if self.request_friendship_action ~= nil then
		var3631.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.request_friendship_action)
		}
	end
	if self.requestFriendshipAction ~= nil then
		var3631.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.requestFriendshipAction)
		}
	end
	if self.refresh_developer_products_action ~= nil then
		var3631.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refresh_developer_products_action)
		}
	end
	if self.refreshDeveloperProductsAction ~= nil then
		var3631.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refreshDeveloperProductsAction)
		}
	end
	if self.open_fae_trial_upsell_action ~= nil then
		var3631.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.open_fae_trial_upsell_action)
		}
	end
	if self.openFaeTrialUpsellAction ~= nil then
		var3631.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.openFaeTrialUpsellAction)
		}
	end
	if self.refresh_omni_recommendation_feed_item_action ~= nil then
		var3631.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refresh_omni_recommendation_feed_item_action)
		}
	end
	if self.refreshOmniRecommendationFeedItemAction ~= nil then
		var3631.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refreshOmniRecommendationFeedItemAction)
		}
	end
	if self.ai_overview_feedback_action ~= nil then
		var3631.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.ai_overview_feedback_action)
		}
	end
	if self.aiOverviewFeedbackAction ~= nil then
		var3631.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.aiOverviewFeedbackAction)
		}
	end
	if self.open_trusted_friends_upsell_modal_action ~= nil then
		var3631.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.open_trusted_friends_upsell_modal_action)
		}
	end
	if self.openTrustedFriendsUpsellModalAction ~= nil then
		var3631.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.openTrustedFriendsUpsellModalAction)
		}
	end
	if self.record_party_chat_conversation_upsell_acknowledgement_action ~= nil then
		var3631.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.record_party_chat_conversation_upsell_acknowledgement_action)
		}
	end
	if self.recordPartyChatConversationUpsellAcknowledgementAction ~= nil then
		var3631.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.recordPartyChatConversationUpsellAcknowledgementAction)
		}
	end
	if self.open_search_results_with_query_action ~= nil then
		var3631.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.open_search_results_with_query_action)
		}
	end
	if self.openSearchResultsWithQueryAction ~= nil then
		var3631.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.openSearchResultsWithQueryAction)
		}
	end
	if self.select_marketplace_favorites_category ~= nil then
		var3631.kind = {
			type = "select_marketplace_favorites_category",
			value = t.SelectMarketplaceFavoritesCategory.jsonDecode(self.select_marketplace_favorites_category)
		}
	end
	if self.selectMarketplaceFavoritesCategory ~= nil then
		var3631.kind = {
			type = "select_marketplace_favorites_category",
			value = t.SelectMarketplaceFavoritesCategory.jsonDecode(self.selectMarketplaceFavoritesCategory)
		}
	end
	if self.download_app_action ~= nil then
		var3631.kind = {
			type = "download_app_action",
			value = t.DownloadAppAction.jsonDecode(self.download_app_action)
		}
	end
	if self.downloadAppAction ~= nil then
		var3631.kind = {
			type = "download_app_action",
			value = t.DownloadAppAction.jsonDecode(self.downloadAppAction)
		}
	end
	if self.refresh_charts_sort_detail_action ~= nil then
		var3631.kind = {
			type = "refresh_charts_sort_detail_action",
			value = t.RefreshChartsSortDetailAction.jsonDecode(self.refresh_charts_sort_detail_action)
		}
	end
	if self.refreshChartsSortDetailAction ~= nil then
		var3631.kind = {
			type = "refresh_charts_sort_detail_action",
			value = t.RefreshChartsSortDetailAction.jsonDecode(self.refreshChartsSortDetailAction)
		}
	end
	if self.join_community_action ~= nil then
		var3631.kind = {
			type = "join_community_action",
			value = t.JoinCommunityAction.jsonDecode(self.join_community_action)
		}
	end
	if self.joinCommunityAction ~= nil then
		var3631.kind = {
			type = "join_community_action",
			value = t.JoinCommunityAction.jsonDecode(self.joinCommunityAction)
		}
	end
	if self.view_community_action ~= nil then
		var3631.kind = {
			type = "view_community_action",
			value = t.ViewCommunityAction.jsonDecode(self.view_community_action)
		}
	end
	if self.viewCommunityAction ~= nil then
		var3631.kind = {
			type = "view_community_action",
			value = t.ViewCommunityAction.jsonDecode(self.viewCommunityAction)
		}
	end
	if self.pin_experience_shortcut_action ~= nil then
		var3631.kind = {
			type = "pin_experience_shortcut_action",
			value = t.PinExperienceShortcutAction.jsonDecode(self.pin_experience_shortcut_action)
		}
	end
	if self.pinExperienceShortcutAction ~= nil then
		var3631.kind = {
			type = "pin_experience_shortcut_action",
			value = t.PinExperienceShortcutAction.jsonDecode(self.pinExperienceShortcutAction)
		}
	end
	if self.select_marketplace_favorites_subcategory ~= nil then
		var3631.kind = {
			type = "select_marketplace_favorites_subcategory",
			value = t.SelectMarketplaceFavoritesSubcategory.jsonDecode(self.select_marketplace_favorites_subcategory)
		}
	end
	if self.selectMarketplaceFavoritesSubcategory ~= nil then
		var3631.kind = {
			type = "select_marketplace_favorites_subcategory",
			value = t.SelectMarketplaceFavoritesSubcategory.jsonDecode(self.selectMarketplaceFavoritesSubcategory)
		}
	end
	if self.show_toast_action ~= nil then
		var3631.kind = {
			type = "show_toast_action",
			value = t.ShowToastAction.jsonDecode(self.show_toast_action)
		}
	end
	if self.showToastAction ~= nil then
		var3631.kind = {
			type = "show_toast_action",
			value = t.ShowToastAction.jsonDecode(self.showToastAction)
		}
	end
	if self.open_incoming_transfer_upsell_action ~= nil then
		var3631.kind = {
			type = "open_incoming_transfer_upsell_action",
			value = t.OpenIncomingTransferUpsellAction.jsonDecode(self.open_incoming_transfer_upsell_action)
		}
	end
	if self.openIncomingTransferUpsellAction ~= nil then
		var3631.kind = {
			type = "open_incoming_transfer_upsell_action",
			value = t.OpenIncomingTransferUpsellAction.jsonDecode(self.openIncomingTransferUpsellAction)
		}
	end
	if self.action_sequence_action ~= nil then
		var3631.kind = {
			type = "action_sequence_action",
			value = t.ActionSequenceAction.jsonDecode(self.action_sequence_action)
		}
	end
	if self.actionSequenceAction ~= nil then
		var3631.kind = {
			type = "action_sequence_action",
			value = t.ActionSequenceAction.jsonDecode(self.actionSequenceAction)
		}
	end
	if self.refresh_feed_entry_from_api_action ~= nil then
		var3631.kind = {
			type = "refresh_feed_entry_from_api_action",
			value = t.RefreshFeedEntryFromApiAction.jsonDecode(self.refresh_feed_entry_from_api_action)
		}
	end
	if self.refreshFeedEntryFromApiAction ~= nil then
		var3631.kind = {
			type = "refresh_feed_entry_from_api_action",
			value = t.RefreshFeedEntryFromApiAction.jsonDecode(self.refreshFeedEntryFromApiAction)
		}
	end
	if self.open_profile_frames_editor_action ~= nil then
		var3631.kind = {
			type = "open_profile_frames_editor_action",
			value = t.OpenProfileFramesEditorAction.jsonDecode(self.open_profile_frames_editor_action)
		}
	end
	if self.openProfileFramesEditorAction ~= nil then
		var3631.kind = {
			type = "open_profile_frames_editor_action",
			value = t.OpenProfileFramesEditorAction.jsonDecode(self.openProfileFramesEditorAction)
		}
	end
	if self.navigate_action ~= nil then
		var3631.kind = {
			type = "navigate_action",
			value = t.NavigateAction.jsonDecode(self.navigate_action)
		}
	end
	if self.navigateAction ~= nil then
		var3631.kind = {
			type = "navigate_action",
			value = t.NavigateAction.jsonDecode(self.navigateAction)
		}
	end
	if self.telemetry_handler ~= nil then
		var3631.telemetry_handler = propTypesModule.StringProp.jsonDecode(self.telemetry_handler)
	end
	if self.telemetryHandler ~= nil then
		var3631.telemetry_handler = propTypesModule.StringProp.jsonDecode(self.telemetryHandler)
	end
	if self.accessibility_label ~= nil then
		var3631.accessibility_label = propTypesModule.StringFormat.jsonDecode(self.accessibility_label)
	end
	if self.accessibilityLabel ~= nil then
		var3631.accessibility_label = propTypesModule.StringFormat.jsonDecode(self.accessibilityLabel)
	end
	if self.skip_unified_logging ~= nil then
		var3631.skip_unified_logging = propTypesModule.BoolProp.jsonDecode(self.skip_unified_logging)
	end
	if self.skipUnifiedLogging ~= nil then
		var3631.skip_unified_logging = propTypesModule.BoolProp.jsonDecode(self.skipUnifiedLogging)
	end
	if self.action_event_name ~= nil then
		var3631.action_event_name = propTypesModule.StringProp.jsonDecode(self.action_event_name)
	end
	if self.actionEventName ~= nil then
		var3631.action_event_name = propTypesModule.StringProp.jsonDecode(self.actionEventName)
	end
	return var3631
end

t_170.descriptor = {
	name = "Action",
	fullName = "roblox.apppageplatform.shared.v1beta1.Action"
}
t.Action = t_170
typeRegistryModule.default:register(t.Action)
local t_171 = {}
t_171.__index = t_171

function t_171.new(p171)
	-- upvalues: t_171 (ref)
	return setmetatable({
		kind = if p171 == nil or p171.kind == nil then nil else p171.kind
	}, t_171)
end

function t_171:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3631 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "value" then
			local var3632 = self.kind.value:encode()
			local var3633, var3634 = protoModule.writeTag(buff, var3631, 1, protoModule.wireTypes.lengthDelimited)
			var3633, var6065 = protoModule.writeBuffer(var3633, var3634, var3632, buffer.len(var3632))
			buff = var3633
			var3631 = var3634
		elseif self.kind.type == "conditional" then
			local var3635 = self.kind.value:encode()
			local var3636, var3637 = protoModule.writeTag(buff, var3631, 2, protoModule.wireTypes.lengthDelimited)
			var3636, var6068 = protoModule.writeBuffer(var3636, var3637, var3635, buffer.len(var3635))
			buff = var3636
			var3631 = var3637
		end
	end
	local buff_1 = buffer.create(var3631)
	buffer.copy(buff_1, 0, buff, 0, var3631)
	
	return buff_1
end

function t_171.decode(p171)
	-- upvalues: t_171 (ref), protoModule (ref), t (ref)
	local var3631 = t_171.new()
	local var3632 = 0
	while var3632 < buffer.len(p171) do
		local _ = nil
		local var3633 = nil
		local var3634, var3635, var3636 = protoModule.readTag(p171, var3632)
		local var3637 = var3634
		var3633 = var3635
		var3632 = var3636
		
		if var3633 == protoModule.wireTypes.varint then
			local _ = nil
			local var3638, var3639 = protoModule.readVarInt(p171, var3632)
			local _ = var3638
			var3632 = var3639
			continue
		end
		if var3633 == protoModule.wireTypes.lengthDelimited then
			if var3637 == 1 then
				local _ = nil
				local var3640, var3641 = protoModule.readBuffer(p171, var3632)
				var3632 = var3641
				var3631.kind = { type = "value", value = t.Action.decode(var3640) }
			elseif var3637 == 2 then
				local _ = nil
				local var3642, var3643 = protoModule.readBuffer(p171, var3632)
				var3632 = var3643
				var3631.kind = {
					type = "conditional",
					value = t.ActionProp_ConditionalOptions.decode(var3642)
				}
			else
				local _ = nil
				local var3644, var3645 = protoModule.readVarInt(p171, var3632)
				var3632 = var3645 + var3644
			end
		elseif var3633 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3646, var3647 = protoModule.readFixed32(p171, var3632)
			local _ = var3646
			var3632 = var3647
		elseif var3633 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3648, var3649 = protoModule.readFixed64(p171, var3632)
			local _ = var3648
			var3632 = var3649
		else
			error("Unsupported wire type: " .. var6072)
		end
	end
	return var3631
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
	local var3650 = t_171.new()
	
	if self.value ~= nil then
		var3650.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	if self.conditional ~= nil then
		var3650.kind = {
			type = "conditional",
			value = t.ActionProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var3650
end

t_171.descriptor = {
	name = "ActionProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionProp"
}
t.ActionProp = t_171
typeRegistryModule.default:register(t.ActionProp)
local t_172 = {}
t_172.__index = t_172

function t_172.new(p172)
	-- upvalues: t_172 (ref)
	return setmetatable({
		condition = if p172 == nil or p172.condition == nil then nil else p172.condition,
		kind = if p172 == nil or p172.kind == nil then nil else p172.kind
	}, t_172)
end

function t_172:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3650 = 0
	
	if self.condition ~= nil then
		local var3651 = self.condition:encode()
		local var3652, var3653 = protoModule.writeTag(buff, var3650, 1, protoModule.wireTypes.lengthDelimited)
		var3652, var6095 = protoModule.writeBuffer(var3652, var3653, var3651, buffer.len(var3651))
		buff = var3652
		var3650 = var3653
	end
	if self.kind ~= nil and self.kind.type == "value" then
		local var3654 = self.kind.value:encode()
		local var3655, var3656 = protoModule.writeTag(buff, var3650, 3, protoModule.wireTypes.lengthDelimited)
		var3655, var6098 = protoModule.writeBuffer(var3655, var3656, var3654, buffer.len(var3654))
		buff = var3655
		var3650 = var3656
	end
	local buff_1 = buffer.create(var3650)
	buffer.copy(buff_1, 0, buff, 0, var3650)
	
	return buff_1
end

function t_172.decode(p172)
	-- upvalues: t_172 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var3650 = t_172.new()
	local var3651 = 0
	while var3651 < buffer.len(p172) do
		local _ = nil
		local var3652 = nil
		local var3653, var3654, var3655 = protoModule.readTag(p172, var3651)
		local var3656 = var3653
		var3652 = var3654
		var3651 = var3655
		
		if var3652 == protoModule.wireTypes.varint then
			local _ = nil
			local var3657, var3658 = protoModule.readVarInt(p172, var3651)
			local _ = var3657
			var3651 = var3658
			continue
		end
		if var3652 == protoModule.wireTypes.lengthDelimited then
			if var3656 == 1 then
				local _ = nil
				local var3659, var3660 = protoModule.readBuffer(p172, var3651)
				var3651 = var3660
				var3650.condition = propConditionModule.PropCondition.decode(var3659)
			elseif var3656 == 3 then
				local _ = nil
				local var3661, var3662 = protoModule.readBuffer(p172, var3651)
				var3651 = var3662
				var3650.kind = { type = "value", value = t.Action.decode(var3661) }
			else
				local _ = nil
				local var3663, var3664 = protoModule.readVarInt(p172, var3651)
				var3651 = var3664 + var3663
			end
		elseif var3652 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3665, var3666 = protoModule.readFixed32(p172, var3651)
			local _ = var3665
			var3651 = var3666
		elseif var3652 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3667, var3668 = protoModule.readFixed64(p172, var3651)
			local _ = var3667
			var3651 = var3668
		else
			error("Unsupported wire type: " .. var6102)
		end
	end
	return var3650
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
	local var3669 = t_172.new()
	
	if self.condition ~= nil then
		var3669.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.value ~= nil then
		var3669.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	return var3669
end

t_172.descriptor = {
	name = "ActionProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ActionProp_ConditionalOption = t_172
typeRegistryModule.default:register(t.ActionProp_ConditionalOption)
local t_173 = {}
t_173.__index = t_173

function t_173.new(p173)
	-- upvalues: t_173 (ref)
	return setmetatable({
		options = if p173 == nil or p173.options == nil then {} else p173.options
	}, t_173)
end

function t_173:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3669 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3670 = v:encode()
			local var3671, var3672 = protoModule.writeTag(buff, var3669, 1, protoModule.wireTypes.lengthDelimited)
			var3671, var6125 = protoModule.writeBuffer(var3671, var3672, var3670, buffer.len(var3670))
			buff = var3671
			var3669 = var3672
		end
	end
	local buff_1 = buffer.create(var3669)
	buffer.copy(buff_1, 0, buff, 0, var3669)
	
	return buff_1
end

function t_173.decode(p173)
	-- upvalues: t_173 (ref), protoModule (ref), t (ref)
	local var3673 = t_173.new()
	local var3674 = 0
	while var3674 < buffer.len(p173) do
		local _ = nil
		local var3675 = nil
		local var3676, var3677, var3678 = protoModule.readTag(p173, var3674)
		local var3679 = var3676
		var3675 = var3677
		var3674 = var3678
		
		if var3675 == protoModule.wireTypes.varint then
			local _ = nil
			local var3680, var3681 = protoModule.readVarInt(p173, var3674)
			local _ = var3680
			var3674 = var3681
			continue
		end
		if var3675 == protoModule.wireTypes.lengthDelimited then
			if var3679 == 1 then
				local _ = nil
				local var3682, var3683 = protoModule.readBuffer(p173, var3674)
				var3674 = var3683
				table.insert(var3673.options, t.ActionProp_ConditionalOption.decode(var3682))
			else
				local _ = nil
				local var3684, var3685 = protoModule.readVarInt(p173, var3674)
				var3674 = var3685 + var3684
			end
		elseif var3675 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3686, var3687 = protoModule.readFixed32(p173, var3674)
			local _ = var3686
			var3674 = var3687
		elseif var3675 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3688, var3689 = protoModule.readFixed64(p173, var3674)
			local _ = var3688
			var3674 = var3689
		else
			error("Unsupported wire type: " .. var6129)
		end
	end
	return var3673
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
	local var3690 = t_173.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ActionProp_ConditionalOption.jsonDecode(v))
		end
		var3690.options = t_1
	end
	return var3690
end

t_173.descriptor = {
	name = "ActionProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ActionProp_ConditionalOptions = t_173
typeRegistryModule.default:register(t.ActionProp_ConditionalOptions)
local t_174 = {}
t_174.__index = t_174

function t_174.new(p174)
	-- upvalues: t_174 (ref)
	return setmetatable({
		kind = if p174 == nil or p174.kind == nil then nil else p174.kind
	}, t_174)
end

function t_174:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3691 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3692 = self.kind.value:encode()
			local var3693, var3694 = protoModule.writeTag(buff, var3691, 1, protoModule.wireTypes.lengthDelimited)
			var3693, var6152 = protoModule.writeBuffer(var3693, var3694, var3692, buffer.len(var3692))
			buff = var3693
			var3691 = var3694
		elseif self.kind.type == "conditional" then
			local var3695 = self.kind.value:encode()
			local var3696, var3697 = protoModule.writeTag(buff, var3691, 2, protoModule.wireTypes.lengthDelimited)
			var3696, var6155 = protoModule.writeBuffer(var3696, var3697, var3695, buffer.len(var3695))
			buff = var3696
			var3691 = var3697
		elseif self.kind.type == "binding_path" then
			local var3698, var3699 = protoModule.writeTag(buff, var3691, 3, protoModule.wireTypes.lengthDelimited)
			var3698, var6157 = protoModule.writeString(var3698, var3699, self.kind.value)
			buff = var3698
			var3691 = var3699
		end
	end
	local buff_1 = buffer.create(var3691)
	buffer.copy(buff_1, 0, buff, 0, var3691)
	
	return buff_1
end

function t_174.decode(p174)
	-- upvalues: t_174 (ref), protoModule (ref), t (ref)
	local var3691 = t_174.new()
	local var3692 = 0
	while var3692 < buffer.len(p174) do
		local _ = nil
		local var3693 = nil
		local var3694, var3695, var3696 = protoModule.readTag(p174, var3692)
		local var3697 = var3694
		var3693 = var3695
		var3692 = var3696
		
		if var3693 == protoModule.wireTypes.varint then
			local _ = nil
			local var3698, var3699 = protoModule.readVarInt(p174, var3692)
			local _ = var3698
			var3692 = var3699
			continue
		end
		if var3693 == protoModule.wireTypes.lengthDelimited then
			if var3697 == 1 then
				local _ = nil
				local var3700, var3701 = protoModule.readBuffer(p174, var3692)
				var3692 = var3701
				var3691.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(var3700)
				}
			elseif var3697 == 2 then
				local _ = nil
				local var3702, var3703 = protoModule.readBuffer(p174, var3692)
				var3692 = var3703
				var3691.kind = {
					type = "conditional",
					value = t.FocusNavActionsProp_ConditionalOptions.decode(var3702)
				}
			elseif var3697 == 3 then
				local _ = nil
				local var3704, var3705 = protoModule.readBuffer(p174, var3692)
				var3692 = var3705
				var3691.kind = { type = "binding_path", value = buffer.tostring(var3704) }
			else
				local _ = nil
				local var3706, var3707 = protoModule.readVarInt(p174, var3692)
				var3692 = var3707 + var3706
			end
		elseif var3693 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3708, var3709 = protoModule.readFixed32(p174, var3692)
			local _ = var3708
			var3692 = var3709
		elseif var3693 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3710, var3711 = protoModule.readFixed64(p174, var3692)
			local _ = var3710
			var3692 = var3711
		else
			error("Unsupported wire type: " .. var6161)
		end
	end
	return var3691
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
	local var3712 = t_174.new()
	
	if self.literal ~= nil then
		var3712.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
		}
	end
	if self.conditional ~= nil then
		var3712.kind = {
			type = "conditional",
			value = t.FocusNavActionsProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var3712.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3712.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3712
end

t_174.descriptor = {
	name = "FocusNavActionsProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavActionsProp"
}
t.FocusNavActionsProp = t_174
typeRegistryModule.default:register(t.FocusNavActionsProp)
local t_175 = {}
t_175.__index = t_175

function t_175.new(p175)
	-- upvalues: t_175 (ref)
	return setmetatable({
		condition = if p175 == nil or p175.condition == nil then nil else p175.condition,
		kind = if p175 == nil or p175.kind == nil then nil else p175.kind
	}, t_175)
end

function t_175:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3712 = 0
	
	if self.condition ~= nil then
		local var3713 = self.condition:encode()
		local var3714, var3715 = protoModule.writeTag(buff, var3712, 1, protoModule.wireTypes.lengthDelimited)
		var3714, var6186 = protoModule.writeBuffer(var3714, var3715, var3713, buffer.len(var3713))
		buff = var3714
		var3712 = var3715
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3716 = self.kind.value:encode()
			local var3717, var3718 = protoModule.writeTag(buff, var3712, 3, protoModule.wireTypes.lengthDelimited)
			var3717, var6189 = protoModule.writeBuffer(var3717, var3718, var3716, buffer.len(var3716))
			buff = var3717
			var3712 = var3718
		elseif self.kind.type == "binding_path" then
			local var3719, var3720 = protoModule.writeTag(buff, var3712, 4, protoModule.wireTypes.lengthDelimited)
			var3719, var6191 = protoModule.writeString(var3719, var3720, self.kind.value)
			buff = var3719
			var3712 = var3720
		end
	end
	local buff_1 = buffer.create(var3712)
	buffer.copy(buff_1, 0, buff, 0, var3712)
	
	return buff_1
end

function t_175.decode(p175)
	-- upvalues: t_175 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var3712 = t_175.new()
	local var3713 = 0
	while var3713 < buffer.len(p175) do
		local _ = nil
		local var3714 = nil
		local var3715, var3716, var3717 = protoModule.readTag(p175, var3713)
		local var3718 = var3715
		var3714 = var3716
		var3713 = var3717
		
		if var3714 == protoModule.wireTypes.varint then
			local _ = nil
			local var3719, var3720 = protoModule.readVarInt(p175, var3713)
			local _ = var3719
			var3713 = var3720
			continue
		end
		if var3714 == protoModule.wireTypes.lengthDelimited then
			if var3718 == 1 then
				local _ = nil
				local var3721, var3722 = protoModule.readBuffer(p175, var3713)
				var3713 = var3722
				var3712.condition = propConditionModule.PropCondition.decode(var3721)
			elseif var3718 == 3 then
				local _ = nil
				local var3723, var3724 = protoModule.readBuffer(p175, var3713)
				var3713 = var3724
				var3712.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(var3723)
				}
			elseif var3718 == 4 then
				local _ = nil
				local var3725, var3726 = protoModule.readBuffer(p175, var3713)
				var3713 = var3726
				var3712.kind = { type = "binding_path", value = buffer.tostring(var3725) }
			else
				local _ = nil
				local var3727, var3728 = protoModule.readVarInt(p175, var3713)
				var3713 = var3728 + var3727
			end
		elseif var3714 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3729, var3730 = protoModule.readFixed32(p175, var3713)
			local _ = var3729
			var3713 = var3730
		elseif var3714 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3731, var3732 = protoModule.readFixed64(p175, var3713)
			local _ = var3731
			var3713 = var3732
		else
			error("Unsupported wire type: " .. var6195)
		end
	end
	return var3712
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
	local var3733 = t_175.new()
	
	if self.condition ~= nil then
		var3733.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var3733.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
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

t_175.descriptor = {
	name = "FocusNavActionsProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FocusNavActionsProp_ConditionalOption = t_175
typeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOption)
local t_176 = {}
t_176.__index = t_176

function t_176.new(p176)
	-- upvalues: t_176 (ref)
	return setmetatable({
		options = if p176 == nil or p176.options == nil then {} else p176.options
	}, t_176)
end

function t_176:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3733 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3734 = v:encode()
			local var3735, var3736 = protoModule.writeTag(buff, var3733, 1, protoModule.wireTypes.lengthDelimited)
			var3735, var6220 = protoModule.writeBuffer(var3735, var3736, var3734, buffer.len(var3734))
			buff = var3735
			var3733 = var3736
		end
	end
	local buff_1 = buffer.create(var3733)
	buffer.copy(buff_1, 0, buff, 0, var3733)
	
	return buff_1
end

function t_176.decode(p176)
	-- upvalues: t_176 (ref), protoModule (ref), t (ref)
	local var3737 = t_176.new()
	local var3738 = 0
	while var3738 < buffer.len(p176) do
		local _ = nil
		local var3739 = nil
		local var3740, var3741, var3742 = protoModule.readTag(p176, var3738)
		local var3743 = var3740
		var3739 = var3741
		var3738 = var3742
		
		if var3739 == protoModule.wireTypes.varint then
			local _ = nil
			local var3744, var3745 = protoModule.readVarInt(p176, var3738)
			local _ = var3744
			var3738 = var3745
			continue
		end
		if var3739 == protoModule.wireTypes.lengthDelimited then
			if var3743 == 1 then
				local _ = nil
				local var3746, var3747 = protoModule.readBuffer(p176, var3738)
				var3738 = var3747
				table.insert(var3737.options, t.FocusNavActionsProp_ConditionalOption.decode(var3746))
			else
				local _ = nil
				local var3748, var3749 = protoModule.readVarInt(p176, var3738)
				var3738 = var3749 + var3748
			end
		elseif var3739 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3750, var3751 = protoModule.readFixed32(p176, var3738)
			local _ = var3750
			var3738 = var3751
		elseif var3739 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3752, var3753 = protoModule.readFixed64(p176, var3738)
			local _ = var3752
			var3738 = var3753
		else
			error("Unsupported wire type: " .. var6224)
		end
	end
	return var3737
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
	local var3754 = t_176.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FocusNavActionsProp_ConditionalOption.jsonDecode(v))
		end
		var3754.options = t_1
	end
	return var3754
end

t_176.descriptor = {
	name = "FocusNavActionsProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FocusNavActionsProp_ConditionalOptions = t_176
typeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOptions)
local t_177 = {}
t_177.__index = t_177

function t_177.new(p177)
	-- upvalues: t_177 (ref)
	return setmetatable({
		keys = if p177 == nil or p177.keys == nil then {} else p177.keys,
		events = if p177 == nil or p177.events == nil then {} else p177.events
	}, t_177)
end

function t_177:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3755 = 0
	
	if self.keys ~= nil and next(self.keys) ~= nil then
		for i, v in self.keys do
			local var3756, var3757 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3756, var6246 = protoModule.writeString(var3756, var3757, i)
			local var3758 = v:encode()
			var3757, var6248 = protoModule.writeTag(var3756, var3757, 2, protoModule.wireTypes.lengthDelimited)
			var3757, var6248 = protoModule.writeBuffer(var3757, var6248, var3758, buffer.len(var3758))
			local var3759 = var3757
			local var3760 = var6248
			local var3761, var3762 = protoModule.writeTag(buff, var3755, 3, protoModule.wireTypes.lengthDelimited)
			var3761, var6252 = protoModule.writeBuffer(var3761, var3762, var3759, var3760)
			buff = var3761
			var3755 = var3762
		end
	end
	if self.events ~= nil and next(self.events) ~= nil then
		for i, v in self.events do
			local var3763, var3764 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3763, var6254 = protoModule.writeString(var3763, var3764, i)
			local var3765 = v:encode()
			var3764, var6256 = protoModule.writeTag(var3763, var3764, 2, protoModule.wireTypes.lengthDelimited)
			var3764, var6256 = protoModule.writeBuffer(var3764, var6256, var3765, buffer.len(var3765))
			local var3766 = var3764
			local var3767 = var6256
			local var3768, var3769 = protoModule.writeTag(buff, var3755, 4, protoModule.wireTypes.lengthDelimited)
			var3768, var6260 = protoModule.writeBuffer(var3768, var3769, var3766, var3767)
			buff = var3768
			var3755 = var3769
		end
	end
	local buff_1 = buffer.create(var3755)
	buffer.copy(buff_1, 0, buff, 0, var3755)
	
	return buff_1
end

function t_177.decode(p177)
	-- upvalues: t_177 (ref), protoModule (ref), t (ref), propTypesEngineModule (ref)
	local var3770 = t_177.new()
	local var3771 = 0
	while var3771 < buffer.len(p177) do
		local _ = nil
		local var3772 = nil
		local var3773, var3774, var3775 = protoModule.readTag(p177, var3771)
		local var3776 = var3773
		var3772 = var3774
		var3771 = var3775
		
		if var3772 == protoModule.wireTypes.varint then
			local _ = nil
			local var3777, var3778 = protoModule.readVarInt(p177, var3771)
			local _ = var3777
			var3771 = var3778
			continue
		end
		if var3772 == protoModule.wireTypes.lengthDelimited then
			if var3776 == 3 then
				local _ = nil
				local var3779, var3780 = protoModule.readBuffer(p177, var3771)
				var3771 = var3780
				var3779 = t.FocusNavActionsProp_FocusNavData_KeysEntry.decode(var3779)
				var3770.keys[var3779.key or ""] = var3779.value or propTypesEngineModule.KeyCodeProp.new()
			elseif var3776 == 4 then
				local _ = nil
				local var3781, var3782 = protoModule.readBuffer(p177, var3771)
				var3771 = var3782
				var3781 = t.FocusNavActionsProp_FocusNavData_EventsEntry.decode(var3781)
				var3770.events[var3781.key or ""] = var3781.value or t.ActionProp.new()
			else
				local _ = nil
				local var3783, var3784 = protoModule.readVarInt(p177, var3771)
				var3771 = var3784 + var3783
			end
		elseif var3772 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3785, var3786 = protoModule.readFixed32(p177, var3771)
			local _ = var3785
			var3771 = var3786
		elseif var3772 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3787, var3788 = protoModule.readFixed64(p177, var3771)
			local _ = var3787
			var3771 = var3788
		else
			error("Unsupported wire type: " .. var6264)
		end
	end
	return var3770
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
	local var3789 = t_177.new()
	
	if self.keys ~= nil then
		local t_1 = {}
		
		for i, v in self.keys do
			t_1[i] = propTypesEngineModule.KeyCodeProp.jsonDecode(v)
		end
		var3789.keys = t_1
	end
	if self.events ~= nil then
		local t_1 = {}
		
		for i, v in self.events do
			t_1[i] = t.ActionProp.jsonDecode(v)
		end
		var3789.events = t_1
	end
	return var3789
end

t_177.descriptor = {
	name = "FocusNavActionsProp_FocusNavData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavData"
}
t.FocusNavActionsProp_FocusNavData = t_177
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData)
local t_178 = {}
t_178.__index = t_178

function t_178.new(p178)
	-- upvalues: t_178 (ref)
	return setmetatable({
		key = if p178 == nil or p178.key == nil then "" else p178.key,
		value = if p178 == nil or p178.value == nil then nil else p178.value
	}, t_178)
end

function t_178:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3790 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3791, var3792 = protoModule.writeTag(buff, var3790, 1, protoModule.wireTypes.lengthDelimited)
		var3791, var6290 = protoModule.writeString(var3791, var3792, self.key)
		buff = var3791
		var3790 = var3792
	end
	if self.value ~= nil then
		local var3793 = self.value:encode()
		local var3794, var3795 = protoModule.writeTag(buff, var3790, 2, protoModule.wireTypes.lengthDelimited)
		var3794, var6293 = protoModule.writeBuffer(var3794, var3795, var3793, buffer.len(var3793))
		buff = var3794
		var3790 = var3795
	end
	local buff_1 = buffer.create(var3790)
	buffer.copy(buff_1, 0, buff, 0, var3790)
	
	return buff_1
end

function t_178.decode(p178)
	-- upvalues: t_178 (ref), protoModule (ref), propTypesEngineModule (ref)
	local var3790 = t_178.new()
	local var3791 = 0
	while var3791 < buffer.len(p178) do
		local _ = nil
		local var3792 = nil
		local var3793, var3794, var3795 = protoModule.readTag(p178, var3791)
		local var3796 = var3793
		var3792 = var3794
		var3791 = var3795
		
		if var3792 == protoModule.wireTypes.varint then
			local _ = nil
			local var3797, var3798 = protoModule.readVarInt(p178, var3791)
			local _ = var3797
			var3791 = var3798
			continue
		end
		if var3792 == protoModule.wireTypes.lengthDelimited then
			if var3796 == 1 then
				local _ = nil
				local var3799, var3800 = protoModule.readBuffer(p178, var3791)
				var3791 = var3800
				var3790.key = buffer.tostring(var3799)
			elseif var3796 == 2 then
				local _ = nil
				local var3801, var3802 = protoModule.readBuffer(p178, var3791)
				var3791 = var3802
				var3790.value = propTypesEngineModule.KeyCodeProp.decode(var3801)
			else
				local _ = nil
				local var3803, var3804 = protoModule.readVarInt(p178, var3791)
				var3791 = var3804 + var3803
			end
		elseif var3792 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3805, var3806 = protoModule.readFixed32(p178, var3791)
			local _ = var3805
			var3791 = var3806
		elseif var3792 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3807, var3808 = protoModule.readFixed64(p178, var3791)
			local _ = var3807
			var3791 = var3808
		else
			error("Unsupported wire type: " .. var6297)
		end
	end
	return var3790
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
	local var3809 = t_178.new()
	
	if self.key ~= nil then
		var3809.key = self.key
	end
	if self.value ~= nil then
		var3809.value = propTypesEngineModule.KeyCodeProp.jsonDecode(self.value)
	end
	return var3809
end

t_178.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_KeysEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.KeysEntry"
}
t.FocusNavActionsProp_FocusNavData_KeysEntry = t_178
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_KeysEntry)
local t_179 = {}
t_179.__index = t_179

function t_179.new(p179)
	-- upvalues: t_179 (ref)
	return setmetatable({
		key = if p179 == nil or p179.key == nil then "" else p179.key,
		value = if p179 == nil or p179.value == nil then nil else p179.value
	}, t_179)
end

function t_179:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3809 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3810, var3811 = protoModule.writeTag(buff, var3809, 1, protoModule.wireTypes.lengthDelimited)
		var3810, var6319 = protoModule.writeString(var3810, var3811, self.key)
		buff = var3810
		var3809 = var3811
	end
	if self.value ~= nil then
		local var3812 = self.value:encode()
		local var3813, var3814 = protoModule.writeTag(buff, var3809, 2, protoModule.wireTypes.lengthDelimited)
		var3813, var6322 = protoModule.writeBuffer(var3813, var3814, var3812, buffer.len(var3812))
		buff = var3813
		var3809 = var3814
	end
	local buff_1 = buffer.create(var3809)
	buffer.copy(buff_1, 0, buff, 0, var3809)
	
	return buff_1
end

function t_179.decode(p179)
	-- upvalues: t_179 (ref), protoModule (ref), t (ref)
	local var3809 = t_179.new()
	local var3810 = 0
	while var3810 < buffer.len(p179) do
		local _ = nil
		local var3811 = nil
		local var3812, var3813, var3814 = protoModule.readTag(p179, var3810)
		local var3815 = var3812
		var3811 = var3813
		var3810 = var3814
		
		if var3811 == protoModule.wireTypes.varint then
			local _ = nil
			local var3816, var3817 = protoModule.readVarInt(p179, var3810)
			local _ = var3816
			var3810 = var3817
			continue
		end
		if var3811 == protoModule.wireTypes.lengthDelimited then
			if var3815 == 1 then
				local _ = nil
				local var3818, var3819 = protoModule.readBuffer(p179, var3810)
				var3810 = var3819
				var3809.key = buffer.tostring(var3818)
			elseif var3815 == 2 then
				local _ = nil
				local var3820, var3821 = protoModule.readBuffer(p179, var3810)
				var3810 = var3821
				var3809.value = t.ActionProp.decode(var3820)
			else
				local _ = nil
				local var3822, var3823 = protoModule.readVarInt(p179, var3810)
				var3810 = var3823 + var3822
			end
		elseif var3811 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3824, var3825 = protoModule.readFixed32(p179, var3810)
			local _ = var3824
			var3810 = var3825
		elseif var3811 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3826, var3827 = protoModule.readFixed64(p179, var3810)
			local _ = var3826
			var3810 = var3827
		else
			error("Unsupported wire type: " .. var6326)
		end
	end
	return var3809
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
	local var3828 = t_179.new()
	
	if self.key ~= nil then
		var3828.key = self.key
	end
	if self.value ~= nil then
		var3828.value = t.ActionProp.jsonDecode(self.value)
	end
	return var3828
end

t_179.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_EventsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsEntry"
}
t.FocusNavActionsProp_FocusNavData_EventsEntry = t_179
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_EventsEntry)
t.ActionType = {
	fromNumber = function(p180)
		return if p180 == 0 then "ACTION_TYPE_INVALID" elseif p180 == 1 then "ACTION_TYPE_DISMISS_DIALOG" elseif p180 == 2 then "ACTION_TYPE_LINK" elseif p180 == 3 then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p180 == 4 then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p180 == 5 then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p180 == 6 then "ACTION_TYPE_OPEN_SEE_ALL" elseif p180 == 7 then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p180 == 8 then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p180 == 9 then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p180 == 10 then "ACTION_TYPE_OPEN_TOOLTIP" elseif p180 == 11 then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p180 == 12 then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p180 == 13 then "ACTION_TYPE_SHARE" elseif p180 == 14 then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p180 == 15 then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p180 == 16 then "ACTION_TYPE_OPEN_PROFILE" elseif p180 == 17 then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p180 == 18 then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p180 == 19 then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p180 == 20 then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p180 == 21 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p180 == 22 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p180 == 23 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p180 == 24 then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p180 == 25 then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p180 == 26 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p180 == 27 then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p180 == 28 then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p180 == 29 then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p180 == 30 then "ACTION_TYPE_REFRESH_FROM_API" elseif p180 == 31 then "ACTION_TYPE_RSVP_TO_EVENT" elseif p180 == 32 then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p180 == 33 then "ACTION_TYPE_ANALYTICS_EVENT" elseif p180 == 34 then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p180 == 35 then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p180 == 36 then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p180 == 37 then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p180 == 38 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p180 == 39 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p180 == 40 then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p180 == 41 then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p180 == 42 then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p180 == 43 then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p180 == 44 then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p180 == 45 then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p180 == 46 then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p180 == 47 then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p180 == 48 then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p180 == 49 then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p180 == 50 then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p180 == 51 then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p180 == 52 then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p180 == 53 then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p180 == 54 then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p180 == 55 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p180 == 56 then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p180 == 57 then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p180 == 58 then "ACTION_TYPE_DISMISS_PROMPT" elseif p180 == 59 then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p180 == 60 then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p180 == 61 then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p180 == 62 then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p180 == 63 then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p180 == 64 then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p180 == 65 then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p180 == 66 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" elseif p180 == 67 then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" elseif p180 == 68 then "ACTION_TYPE_DOWNLOAD_APP" elseif p180 == 69 then "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" elseif p180 == 70 then "ACTION_TYPE_JOIN_COMMUNITY" elseif p180 == 71 then "ACTION_TYPE_VIEW_COMMUNITY" elseif p180 == 72 then "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" elseif p180 == 73 then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" elseif p180 == 74 then "ACTION_TYPE_SHOW_TOAST" elseif p180 == 75 then "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" elseif p180 == 76 then "ACTION_TYPE_ACTION_SEQUENCE" elseif p180 == 77 then "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" elseif p180 == 78 then "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" elseif p180 == 79 then "ACTION_TYPE_NAVIGATE" else nil
	end,
	toNumber = function(p180)
		return if p180 == "ACTION_TYPE_INVALID" then 0 elseif p180 == "ACTION_TYPE_DISMISS_DIALOG" then 1 elseif p180 == "ACTION_TYPE_LINK" then 2 elseif p180 == "ACTION_TYPE_OPEN_GAME_DETAILS" then 3 elseif p180 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then 4 elseif p180 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then 5 elseif p180 == "ACTION_TYPE_OPEN_SEE_ALL" then 6 elseif p180 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then 7 elseif p180 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then 8 elseif p180 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then 9 elseif p180 == "ACTION_TYPE_OPEN_TOOLTIP" then 10 elseif p180 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then 11 elseif p180 == "ACTION_TYPE_LOAD_MORE_FROM_API" then 12 elseif p180 == "ACTION_TYPE_SHARE" then 13 elseif p180 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then 14 elseif p180 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then 15 elseif p180 == "ACTION_TYPE_OPEN_PROFILE" then 16 elseif p180 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then 17 elseif p180 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then 18 elseif p180 == "ACTION_TYPE_OPEN_MARKETPLACE" then 19 elseif p180 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then 20 elseif p180 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then 21 elseif p180 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then 22 elseif p180 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then 23 elseif p180 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then 24 elseif p180 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then 25 elseif p180 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then 26 elseif p180 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then 27 elseif p180 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then 28 elseif p180 == "ACTION_TYPE_OPEN_SONG_DETAIL" then 29 elseif p180 == "ACTION_TYPE_REFRESH_FROM_API" then 30 elseif p180 == "ACTION_TYPE_RSVP_TO_EVENT" then 31 elseif p180 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then 32 elseif p180 == "ACTION_TYPE_ANALYTICS_EVENT" then 33 elseif p180 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then 34 elseif p180 == "ACTION_TYPE_OPEN_GAME_INVITE" then 35 elseif p180 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then 36 elseif p180 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then 37 elseif p180 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then 38 elseif p180 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then 39 elseif p180 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then 40 elseif p180 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then 41 elseif p180 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then 42 elseif p180 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then 43 elseif p180 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then 44 elseif p180 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then 45 elseif p180 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then 46 elseif p180 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then 47 elseif p180 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then 48 elseif p180 == "ACTION_TYPE_OPEN_AMP_WIZARD" then 49 elseif p180 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then 50 elseif p180 == "ACTION_TYPE_REFRESH_GAME_PASSES" then 51 elseif p180 == "ACTION_TYPE_REFRESH_PLAYABILITY" then 52 elseif p180 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then 53 elseif p180 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then 54 elseif p180 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then 55 elseif p180 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then 56 elseif p180 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then 57 elseif p180 == "ACTION_TYPE_DISMISS_PROMPT" then 58 elseif p180 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then 59 elseif p180 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then 60 elseif p180 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then 61 elseif p180 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then 62 elseif p180 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then 63 elseif p180 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then 64 elseif p180 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then 65 elseif p180 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then 66 elseif p180 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" then 67 elseif p180 == "ACTION_TYPE_DOWNLOAD_APP" then 68 elseif p180 == "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" then 69 elseif p180 == "ACTION_TYPE_JOIN_COMMUNITY" then 70 elseif p180 == "ACTION_TYPE_VIEW_COMMUNITY" then 71 elseif p180 == "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" then 72 elseif p180 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" then 73 elseif p180 == "ACTION_TYPE_SHOW_TOAST" then 74 elseif p180 == "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" then 75 elseif p180 == "ACTION_TYPE_ACTION_SEQUENCE" then 76 elseif p180 == "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" then 77 elseif p180 == "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" then 78 elseif p180 == "ACTION_TYPE_NAVIGATE" then 79 else p180
	end,
	fromName = function(p180)
		return if p180 == "ACTION_TYPE_INVALID" then "ACTION_TYPE_INVALID" elseif p180 == "ACTION_TYPE_DISMISS_DIALOG" then "ACTION_TYPE_DISMISS_DIALOG" elseif p180 == "ACTION_TYPE_LINK" then "ACTION_TYPE_LINK" elseif p180 == "ACTION_TYPE_OPEN_GAME_DETAILS" then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p180 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p180 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p180 == "ACTION_TYPE_OPEN_SEE_ALL" then "ACTION_TYPE_OPEN_SEE_ALL" elseif p180 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p180 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p180 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p180 == "ACTION_TYPE_OPEN_TOOLTIP" then "ACTION_TYPE_OPEN_TOOLTIP" elseif p180 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p180 == "ACTION_TYPE_LOAD_MORE_FROM_API" then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p180 == "ACTION_TYPE_SHARE" then "ACTION_TYPE_SHARE" elseif p180 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p180 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p180 == "ACTION_TYPE_OPEN_PROFILE" then "ACTION_TYPE_OPEN_PROFILE" elseif p180 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p180 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p180 == "ACTION_TYPE_OPEN_MARKETPLACE" then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p180 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p180 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p180 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p180 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p180 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p180 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p180 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p180 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p180 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p180 == "ACTION_TYPE_OPEN_SONG_DETAIL" then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p180 == "ACTION_TYPE_REFRESH_FROM_API" then "ACTION_TYPE_REFRESH_FROM_API" elseif p180 == "ACTION_TYPE_RSVP_TO_EVENT" then "ACTION_TYPE_RSVP_TO_EVENT" elseif p180 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p180 == "ACTION_TYPE_ANALYTICS_EVENT" then "ACTION_TYPE_ANALYTICS_EVENT" elseif p180 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p180 == "ACTION_TYPE_OPEN_GAME_INVITE" then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p180 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p180 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p180 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p180 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p180 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p180 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p180 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p180 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p180 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p180 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p180 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p180 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p180 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p180 == "ACTION_TYPE_OPEN_AMP_WIZARD" then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p180 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p180 == "ACTION_TYPE_REFRESH_GAME_PASSES" then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p180 == "ACTION_TYPE_REFRESH_PLAYABILITY" then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p180 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p180 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p180 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p180 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p180 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p180 == "ACTION_TYPE_DISMISS_PROMPT" then "ACTION_TYPE_DISMISS_PROMPT" elseif p180 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p180 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p180 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p180 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p180 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p180 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p180 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p180 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" elseif p180 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" elseif p180 == "ACTION_TYPE_DOWNLOAD_APP" then "ACTION_TYPE_DOWNLOAD_APP" elseif p180 == "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" then "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" elseif p180 == "ACTION_TYPE_JOIN_COMMUNITY" then "ACTION_TYPE_JOIN_COMMUNITY" elseif p180 == "ACTION_TYPE_VIEW_COMMUNITY" then "ACTION_TYPE_VIEW_COMMUNITY" elseif p180 == "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" then "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" elseif p180 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" elseif p180 == "ACTION_TYPE_SHOW_TOAST" then "ACTION_TYPE_SHOW_TOAST" elseif p180 == "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" then "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" elseif p180 == "ACTION_TYPE_ACTION_SEQUENCE" then "ACTION_TYPE_ACTION_SEQUENCE" elseif p180 == "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" then "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" elseif p180 == "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" then "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" elseif p180 == "ACTION_TYPE_NAVIGATE" then "ACTION_TYPE_NAVIGATE" else nil
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