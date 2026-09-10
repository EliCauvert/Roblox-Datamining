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
		var2, var201 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var204 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
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
			error("Unsupported wire type: " .. var208)
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
		var23, var232 = protoModule.writeBuffer(var23, var24, var22, buffer.len(var22))
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
			error("Unsupported wire type: " .. var236)
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
		var39, var256 = protoModule.writeVarInt(var39, var40, t.ActionType.toNumber(self.action_type))
		buff = var39
		var38 = var40
	end
	if self.action_params ~= nil then
		local var41 = self.action_params:encode()
		local var42, var43 = protoModule.writeTag(buff, var38, 2, protoModule.wireTypes.lengthDelimited)
		var42, var259 = protoModule.writeBuffer(var42, var43, var41, buffer.len(var41))
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
			error("Unsupported wire type: " .. var263)
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
		var60, var287 = protoModule.writeBuffer(var60, var61, var59, buffer.len(var59))
		buff = var60
		var58 = var61
	end
	if self.title_key ~= nil then
		local var62 = self.title_key:encode()
		local var63, var64 = protoModule.writeTag(buff, var58, 2, protoModule.wireTypes.lengthDelimited)
		var63, var290 = protoModule.writeBuffer(var63, var64, var62, buffer.len(var62))
		buff = var63
		var58 = var64
	end
	if self.on_webview_close ~= nil then
		local var65 = self.on_webview_close:encode()
		local var66, var67 = protoModule.writeTag(buff, var58, 4, protoModule.wireTypes.lengthDelimited)
		var66, var293 = protoModule.writeBuffer(var66, var67, var65, buffer.len(var65))
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
			error("Unsupported wire type: " .. var297)
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
		var80, var321 = protoModule.writeVarInt(var80, var81, t.ActionType.toNumber(self.action_type))
		buff = var80
		var79 = var81
	end
	if self.action_params ~= nil then
		local var82 = self.action_params:encode()
		local var83, var84 = protoModule.writeTag(buff, var79, 2, protoModule.wireTypes.lengthDelimited)
		var83, var324 = protoModule.writeBuffer(var83, var84, var82, buffer.len(var82))
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
			error("Unsupported wire type: " .. var328)
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
		var101, var352 = protoModule.writeBuffer(var101, var102, var100, buffer.len(var100))
		buff = var101
		var99 = var102
	end
	if self.assignment_type ~= nil then
		local var103 = self.assignment_type:encode()
		local var104, var105 = protoModule.writeTag(buff, var99, 2, protoModule.wireTypes.lengthDelimited)
		var104, var355 = protoModule.writeBuffer(var104, var105, var103, buffer.len(var103))
		buff = var104
		var99 = var105
	end
	if self.social_link_type ~= nil then
		local var106 = self.social_link_type:encode()
		local var107, var108 = protoModule.writeTag(buff, var99, 3, protoModule.wireTypes.lengthDelimited)
		var107, var358 = protoModule.writeBuffer(var107, var108, var106, buffer.len(var106))
		buff = var107
		var99 = var108
	end
	if self.social_link_url ~= nil then
		local var109 = self.social_link_url:encode()
		local var110, var111 = protoModule.writeTag(buff, var99, 4, protoModule.wireTypes.lengthDelimited)
		var110, var361 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
		buff = var110
		var99 = var111
	end
	if self.social_link_display_type ~= nil then
		local var112 = self.social_link_display_type:encode()
		local var113, var114 = protoModule.writeTag(buff, var99, 5, protoModule.wireTypes.lengthDelimited)
		var113, var364 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
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
			error("Unsupported wire type: " .. var368)
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
		var125, var396 = protoModule.writeVarInt(var125, var126, t.ActionType.toNumber(self.action_type))
		buff = var125
		var124 = var126
	end
	if self.action_params ~= nil then
		local var127 = self.action_params:encode()
		local var128, var129 = protoModule.writeTag(buff, var124, 2, protoModule.wireTypes.lengthDelimited)
		var128, var399 = protoModule.writeBuffer(var128, var129, var127, buffer.len(var127))
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
			error("Unsupported wire type: " .. var403)
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
		inherit_referral_session = if p8 == nil or p8.inherit_referral_session == nil then nil else p8.inherit_referral_session,
		place_id_override = if p8 == nil or p8.place_id_override == nil then nil else p8.place_id_override,
		experience_join_data = if p8 == nil or p8.experience_join_data == nil then nil else p8.experience_join_data,
		skip_sponsored_click_recording = if p8 == nil or p8.skip_sponsored_click_recording == nil then nil else p8.skip_sponsored_click_recording
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var144 = 0
	
	if self.place_id ~= nil then
		local var145 = self.place_id:encode()
		local var146, var147 = protoModule.writeTag(buff, var144, 1, protoModule.wireTypes.lengthDelimited)
		var146, var427 = protoModule.writeBuffer(var146, var147, var145, buffer.len(var145))
		buff = var146
		var144 = var147
	end
	if self.universe_id ~= nil then
		local var148 = self.universe_id:encode()
		local var149, var150 = protoModule.writeTag(buff, var144, 2, protoModule.wireTypes.lengthDelimited)
		var149, var430 = protoModule.writeBuffer(var149, var150, var148, buffer.len(var148))
		buff = var149
		var144 = var150
	end
	if self.inherit_referral_session ~= nil then
		local var151 = self.inherit_referral_session:encode()
		local var152, var153 = protoModule.writeTag(buff, var144, 3, protoModule.wireTypes.lengthDelimited)
		var152, var433 = protoModule.writeBuffer(var152, var153, var151, buffer.len(var151))
		buff = var152
		var144 = var153
	end
	if self.place_id_override ~= nil then
		local var154 = self.place_id_override:encode()
		local var155, var156 = protoModule.writeTag(buff, var144, 4, protoModule.wireTypes.lengthDelimited)
		var155, var436 = protoModule.writeBuffer(var155, var156, var154, buffer.len(var154))
		buff = var155
		var144 = var156
	end
	if self.experience_join_data ~= nil then
		local var157 = self.experience_join_data:encode()
		local var158, var159 = protoModule.writeTag(buff, var144, 5, protoModule.wireTypes.lengthDelimited)
		var158, var439 = protoModule.writeBuffer(var158, var159, var157, buffer.len(var157))
		buff = var158
		var144 = var159
	end
	if self.skip_sponsored_click_recording ~= nil then
		local var160 = self.skip_sponsored_click_recording:encode()
		local var161, var162 = protoModule.writeTag(buff, var144, 6, protoModule.wireTypes.lengthDelimited)
		var161, var442 = protoModule.writeBuffer(var161, var162, var160, buffer.len(var160))
		buff = var161
		var144 = var162
	end
	local buff_1 = buffer.create(var144)
	buffer.copy(buff_1, 0, buff, 0, var144)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), propTypesModule (ref), t (ref)
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
			elseif var150 == 4 then
				local _ = nil
				local var159, var160 = protoModule.readBuffer(p8, var145)
				var145 = var160
				var144.place_id_override = propTypesModule.StringProp.decode(var159)
			elseif var150 == 5 then
				local _ = nil
				local var161, var162 = protoModule.readBuffer(p8, var145)
				var145 = var162
				var144.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.decode(var161)
			elseif var150 == 6 then
				local _ = nil
				local var163, var164 = protoModule.readBuffer(p8, var145)
				var145 = var164
				var144.skip_sponsored_click_recording = propTypesModule.BoolProp.decode(var163)
			else
				local _ = nil
				local var165, var166 = protoModule.readVarInt(p8, var145)
				var145 = var166 + var165
			end
		elseif var146 == protoModule.wireTypes.i32 then
			local _ = nil
			local var167, var168 = protoModule.readFixed32(p8, var145)
			local _ = var167
			var145 = var168
		elseif var146 == protoModule.wireTypes.i64 then
			local _ = nil
			local var169, var170 = protoModule.readFixed64(p8, var145)
			local _ = var169
			var145 = var170
		else
			error("Unsupported wire type: " .. var446)
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
	if self.place_id_override ~= nil then
		t.placeIdOverride = self.place_id_override:jsonEncode()
	end
	if self.experience_join_data ~= nil then
		t.experienceJoinData = self.experience_join_data:jsonEncode()
	end
	if self.skip_sponsored_click_recording ~= nil then
		t.skipSponsoredClickRecording = self.skip_sponsored_click_recording:jsonEncode()
	end
	return t
end

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), propTypesModule (ref), t (ref)
	local var171 = t_8.new()
	
	if self.place_id ~= nil then
		var171.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var171.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var171.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var171.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.inherit_referral_session ~= nil then
		var171.inherit_referral_session = propTypesModule.BoolProp.jsonDecode(self.inherit_referral_session)
	end
	if self.inheritReferralSession ~= nil then
		var171.inherit_referral_session = propTypesModule.BoolProp.jsonDecode(self.inheritReferralSession)
	end
	if self.place_id_override ~= nil then
		var171.place_id_override = propTypesModule.StringProp.jsonDecode(self.place_id_override)
	end
	if self.placeIdOverride ~= nil then
		var171.place_id_override = propTypesModule.StringProp.jsonDecode(self.placeIdOverride)
	end
	if self.experience_join_data ~= nil then
		var171.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experience_join_data)
	end
	if self.experienceJoinData ~= nil then
		var171.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experienceJoinData)
	end
	if self.skip_sponsored_click_recording ~= nil then
		var171.skip_sponsored_click_recording = propTypesModule.BoolProp.jsonDecode(self.skip_sponsored_click_recording)
	end
	if self.skipSponsoredClickRecording ~= nil then
		var171.skip_sponsored_click_recording = propTypesModule.BoolProp.jsonDecode(self.skipSponsoredClickRecording)
	end
	return var171
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
	local var171 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var172, var173 = protoModule.writeTag(buff, var171, 1, protoModule.wireTypes.varint)
		var172, var476 = protoModule.writeVarInt(var172, var173, t.ActionType.toNumber(self.action_type))
		buff = var172
		var171 = var173
	end
	if self.action_params ~= nil then
		local var174 = self.action_params:encode()
		local var175, var176 = protoModule.writeTag(buff, var171, 2, protoModule.wireTypes.lengthDelimited)
		var175, var479 = protoModule.writeBuffer(var175, var176, var174, buffer.len(var174))
		buff = var175
		var171 = var176
	end
	local buff_1 = buffer.create(var171)
	buffer.copy(buff_1, 0, buff, 0, var171)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var171 = t_9.new()
	local var172 = 0
	while var172 < buffer.len(p9) do
		local _ = nil
		local var173 = nil
		local var174, var175, var176 = protoModule.readTag(p9, var172)
		local var177 = var174
		var173 = var175
		var172 = var176
		
		if var173 == protoModule.wireTypes.varint then
			if var177 == 1 then
				local _ = nil
				local var178, var179 = protoModule.readVarIntI32(p9, var172)
				local var180 = var178
				var172 = var179
				var171.action_type = t.ActionType.fromNumber(var180) or var180
			else
				local _ = nil
				local var181, var182 = protoModule.readVarInt(p9, var172)
				local _ = var181
				var172 = var182
			end
		end
		if var173 == protoModule.wireTypes.lengthDelimited then
			if var177 == 2 then
				local _ = nil
				local var183, var184 = protoModule.readBuffer(p9, var172)
				var172 = var184
				var171.action_params = t.OpenJoinFriendsAction_Params.decode(var183)
			else
				local _ = nil
				local var185, var186 = protoModule.readVarInt(p9, var172)
				var172 = var186 + var185
			end
		elseif var173 == protoModule.wireTypes.i32 then
			local _ = nil
			local var187, var188 = protoModule.readFixed32(p9, var172)
			local _ = var187
			var172 = var188
		elseif var173 == protoModule.wireTypes.i64 then
			local _ = nil
			local var189, var190 = protoModule.readFixed64(p9, var172)
			local _ = var189
			var172 = var190
		else
			error("Unsupported wire type: " .. var483)
		end
	end
	return var171
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
	local var191 = t_9.new()
	
	if self.action_type ~= nil then
		var191.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var191.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var191.action_params = t.OpenJoinFriendsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var191.action_params = t.OpenJoinFriendsAction_Params.jsonDecode(self.actionParams)
	end
	return var191
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
	local var191 = 0
	
	if self.place_id ~= nil then
		local var192 = self.place_id:encode()
		local var193, var194 = protoModule.writeTag(buff, var191, 1, protoModule.wireTypes.lengthDelimited)
		var193, var507 = protoModule.writeBuffer(var193, var194, var192, buffer.len(var192))
		buff = var193
		var191 = var194
	end
	if self.universe_id ~= nil then
		local var195 = self.universe_id:encode()
		local var196, var197 = protoModule.writeTag(buff, var191, 2, protoModule.wireTypes.lengthDelimited)
		var196, var510 = protoModule.writeBuffer(var196, var197, var195, buffer.len(var195))
		buff = var196
		var191 = var197
	end
	local buff_1 = buffer.create(var191)
	buffer.copy(buff_1, 0, buff, 0, var191)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref), propTypesModule (ref)
	local var191 = t_10.new()
	local var192 = 0
	while var192 < buffer.len(p10) do
		local _ = nil
		local var193 = nil
		local var194, var195, var196 = protoModule.readTag(p10, var192)
		local var197 = var194
		var193 = var195
		var192 = var196
		
		if var193 == protoModule.wireTypes.varint then
			local _ = nil
			local var198, var199 = protoModule.readVarInt(p10, var192)
			local _ = var198
			var192 = var199
			continue
		end
		if var193 == protoModule.wireTypes.lengthDelimited then
			if var197 == 1 then
				local _ = nil
				local var200, var201 = protoModule.readBuffer(p10, var192)
				var192 = var201
				var191.place_id = propTypesModule.StringProp.decode(var200)
			elseif var197 == 2 then
				local _ = nil
				local var202, var203 = protoModule.readBuffer(p10, var192)
				var192 = var203
				var191.universe_id = propTypesModule.StringProp.decode(var202)
			else
				local _ = nil
				local var204, var205 = protoModule.readVarInt(p10, var192)
				var192 = var205 + var204
			end
		elseif var193 == protoModule.wireTypes.i32 then
			local _ = nil
			local var206, var207 = protoModule.readFixed32(p10, var192)
			local _ = var206
			var192 = var207
		elseif var193 == protoModule.wireTypes.i64 then
			local _ = nil
			local var208, var209 = protoModule.readFixed64(p10, var192)
			local _ = var208
			var192 = var209
		else
			error("Unsupported wire type: " .. var514)
		end
	end
	return var191
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
	local var210 = t_10.new()
	
	if self.place_id ~= nil then
		var210.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var210.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var210.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var210.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var210
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
	local var210 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var211, var212 = protoModule.writeTag(buff, var210, 1, protoModule.wireTypes.varint)
		var211, var536 = protoModule.writeVarInt(var211, var212, t.ActionType.toNumber(self.action_type))
		buff = var211
		var210 = var212
	end
	if self.action_params ~= nil then
		local var213 = self.action_params:encode()
		local var214, var215 = protoModule.writeTag(buff, var210, 2, protoModule.wireTypes.lengthDelimited)
		var214, var539 = protoModule.writeBuffer(var214, var215, var213, buffer.len(var213))
		buff = var214
		var210 = var215
	end
	local buff_1 = buffer.create(var210)
	buffer.copy(buff_1, 0, buff, 0, var210)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref), t (ref)
	local var210 = t_11.new()
	local var211 = 0
	while var211 < buffer.len(p11) do
		local _ = nil
		local var212 = nil
		local var213, var214, var215 = protoModule.readTag(p11, var211)
		local var216 = var213
		var212 = var214
		var211 = var215
		
		if var212 == protoModule.wireTypes.varint then
			if var216 == 1 then
				local _ = nil
				local var217, var218 = protoModule.readVarIntI32(p11, var211)
				local var219 = var217
				var211 = var218
				var210.action_type = t.ActionType.fromNumber(var219) or var219
			else
				local _ = nil
				local var220, var221 = protoModule.readVarInt(p11, var211)
				local _ = var220
				var211 = var221
			end
		end
		if var212 == protoModule.wireTypes.lengthDelimited then
			if var216 == 2 then
				local _ = nil
				local var222, var223 = protoModule.readBuffer(p11, var211)
				var211 = var223
				var210.action_params = t.OpenMarketplaceTryOnAction_Params.decode(var222)
			else
				local _ = nil
				local var224, var225 = protoModule.readVarInt(p11, var211)
				var211 = var225 + var224
			end
		elseif var212 == protoModule.wireTypes.i32 then
			local _ = nil
			local var226, var227 = protoModule.readFixed32(p11, var211)
			local _ = var226
			var211 = var227
		elseif var212 == protoModule.wireTypes.i64 then
			local _ = nil
			local var228, var229 = protoModule.readFixed64(p11, var211)
			local _ = var228
			var211 = var229
		else
			error("Unsupported wire type: " .. var543)
		end
	end
	return var210
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
	local var230 = t_11.new()
	
	if self.action_type ~= nil then
		var230.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var230.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var230.action_params = t.OpenMarketplaceTryOnAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var230.action_params = t.OpenMarketplaceTryOnAction_Params.jsonDecode(self.actionParams)
	end
	return var230
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
		item_sub_type_name = if p12 == nil or p12.item_sub_type_name == nil then nil else p12.item_sub_type_name,
		item_price = if p12 == nil or p12.item_price == nil then nil else p12.item_price
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var230 = 0
	
	if self.item_id ~= nil then
		local var231 = self.item_id:encode()
		local var232, var233 = protoModule.writeTag(buff, var230, 1, protoModule.wireTypes.lengthDelimited)
		var232, var567 = protoModule.writeBuffer(var232, var233, var231, buffer.len(var231))
		buff = var232
		var230 = var233
	end
	if self.item_type ~= nil then
		local var234 = self.item_type:encode()
		local var235, var236 = protoModule.writeTag(buff, var230, 2, protoModule.wireTypes.lengthDelimited)
		var235, var570 = protoModule.writeBuffer(var235, var236, var234, buffer.len(var234))
		buff = var235
		var230 = var236
	end
	if self.item_sub_type_name ~= nil then
		local var237 = self.item_sub_type_name:encode()
		local var238, var239 = protoModule.writeTag(buff, var230, 3, protoModule.wireTypes.lengthDelimited)
		var238, var573 = protoModule.writeBuffer(var238, var239, var237, buffer.len(var237))
		buff = var238
		var230 = var239
	end
	if self.item_price ~= nil then
		local var240 = self.item_price:encode()
		local var241, var242 = protoModule.writeTag(buff, var230, 4, protoModule.wireTypes.lengthDelimited)
		var241, var576 = protoModule.writeBuffer(var241, var242, var240, buffer.len(var240))
		buff = var241
		var230 = var242
	end
	local buff_1 = buffer.create(var230)
	buffer.copy(buff_1, 0, buff, 0, var230)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref), propTypesModule (ref)
	local var230 = t_12.new()
	local var231 = 0
	while var231 < buffer.len(p12) do
		local _ = nil
		local var232 = nil
		local var233, var234, var235 = protoModule.readTag(p12, var231)
		local var236 = var233
		var232 = var234
		var231 = var235
		
		if var232 == protoModule.wireTypes.varint then
			local _ = nil
			local var237, var238 = protoModule.readVarInt(p12, var231)
			local _ = var237
			var231 = var238
			continue
		end
		if var232 == protoModule.wireTypes.lengthDelimited then
			if var236 == 1 then
				local _ = nil
				local var239, var240 = protoModule.readBuffer(p12, var231)
				var231 = var240
				var230.item_id = propTypesModule.StringProp.decode(var239)
			elseif var236 == 2 then
				local _ = nil
				local var241, var242 = protoModule.readBuffer(p12, var231)
				var231 = var242
				var230.item_type = propTypesModule.StringProp.decode(var241)
			elseif var236 == 3 then
				local _ = nil
				local var243, var244 = protoModule.readBuffer(p12, var231)
				var231 = var244
				var230.item_sub_type_name = propTypesModule.StringProp.decode(var243)
			elseif var236 == 4 then
				local _ = nil
				local var245, var246 = protoModule.readBuffer(p12, var231)
				var231 = var246
				var230.item_price = propTypesModule.Int64Prop.decode(var245)
			else
				local _ = nil
				local var247, var248 = protoModule.readVarInt(p12, var231)
				var231 = var248 + var247
			end
		elseif var232 == protoModule.wireTypes.i32 then
			local _ = nil
			local var249, var250 = protoModule.readFixed32(p12, var231)
			local _ = var249
			var231 = var250
		elseif var232 == protoModule.wireTypes.i64 then
			local _ = nil
			local var251, var252 = protoModule.readFixed64(p12, var231)
			local _ = var251
			var231 = var252
		else
			error("Unsupported wire type: " .. var580)
		end
	end
	return var230
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
	if self.item_price ~= nil then
		t.itemPrice = self.item_price:jsonEncode()
	end
	return t
end

function t_12:jsonDecode()
	-- upvalues: t_12 (ref), propTypesModule (ref)
	local var253 = t_12.new()
	
	if self.item_id ~= nil then
		var253.item_id = propTypesModule.StringProp.jsonDecode(self.item_id)
	end
	if self.itemId ~= nil then
		var253.item_id = propTypesModule.StringProp.jsonDecode(self.itemId)
	end
	if self.item_type ~= nil then
		var253.item_type = propTypesModule.StringProp.jsonDecode(self.item_type)
	end
	if self.itemType ~= nil then
		var253.item_type = propTypesModule.StringProp.jsonDecode(self.itemType)
	end
	if self.item_sub_type_name ~= nil then
		var253.item_sub_type_name = propTypesModule.StringProp.jsonDecode(self.item_sub_type_name)
	end
	if self.itemSubTypeName ~= nil then
		var253.item_sub_type_name = propTypesModule.StringProp.jsonDecode(self.itemSubTypeName)
	end
	if self.item_price ~= nil then
		var253.item_price = propTypesModule.Int64Prop.jsonDecode(self.item_price)
	end
	if self.itemPrice ~= nil then
		var253.item_price = propTypesModule.Int64Prop.jsonDecode(self.itemPrice)
	end
	return var253
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
	local var253 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var254, var255 = protoModule.writeTag(buff, var253, 1, protoModule.wireTypes.varint)
		var254, var606 = protoModule.writeVarInt(var254, var255, t.ActionType.toNumber(self.action_type))
		buff = var254
		var253 = var255
	end
	if self.action_params ~= nil then
		local var256 = self.action_params:encode()
		local var257, var258 = protoModule.writeTag(buff, var253, 2, protoModule.wireTypes.lengthDelimited)
		var257, var609 = protoModule.writeBuffer(var257, var258, var256, buffer.len(var256))
		buff = var257
		var253 = var258
	end
	local buff_1 = buffer.create(var253)
	buffer.copy(buff_1, 0, buff, 0, var253)
	
	return buff_1
end

function t_13.decode(p13)
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var253 = t_13.new()
	local var254 = 0
	while var254 < buffer.len(p13) do
		local _ = nil
		local var255 = nil
		local var256, var257, var258 = protoModule.readTag(p13, var254)
		local var259 = var256
		var255 = var257
		var254 = var258
		
		if var255 == protoModule.wireTypes.varint then
			if var259 == 1 then
				local _ = nil
				local var260, var261 = protoModule.readVarIntI32(p13, var254)
				local var262 = var260
				var254 = var261
				var253.action_type = t.ActionType.fromNumber(var262) or var262
			else
				local _ = nil
				local var263, var264 = protoModule.readVarInt(p13, var254)
				local _ = var263
				var254 = var264
			end
		end
		if var255 == protoModule.wireTypes.lengthDelimited then
			if var259 == 2 then
				local _ = nil
				local var265, var266 = protoModule.readBuffer(p13, var254)
				var254 = var266
				var253.action_params = t.OpenSeeAllAction_Params.decode(var265)
			else
				local _ = nil
				local var267, var268 = protoModule.readVarInt(p13, var254)
				var254 = var268 + var267
			end
		elseif var255 == protoModule.wireTypes.i32 then
			local _ = nil
			local var269, var270 = protoModule.readFixed32(p13, var254)
			local _ = var269
			var254 = var270
		elseif var255 == protoModule.wireTypes.i64 then
			local _ = nil
			local var271, var272 = protoModule.readFixed64(p13, var254)
			local _ = var271
			var254 = var272
		else
			error("Unsupported wire type: " .. var613)
		end
	end
	return var253
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
	local var273 = t_13.new()
	
	if self.action_type ~= nil then
		var273.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var273.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var273.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var273.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var273
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
	local var273 = 0
	
	if self.collection_id ~= nil then
		local var274 = self.collection_id:encode()
		local var275, var276 = protoModule.writeTag(buff, var273, 1, protoModule.wireTypes.lengthDelimited)
		var275, var637 = protoModule.writeBuffer(var275, var276, var274, buffer.len(var274))
		buff = var275
		var273 = var276
	end
	if self.game_set_target_id ~= nil then
		local var277 = self.game_set_target_id:encode()
		local var278, var279 = protoModule.writeTag(buff, var273, 2, protoModule.wireTypes.lengthDelimited)
		var278, var640 = protoModule.writeBuffer(var278, var279, var277, buffer.len(var277))
		buff = var278
		var273 = var279
	end
	if self.collection_position ~= nil then
		local var280 = self.collection_position:encode()
		local var281, var282 = protoModule.writeTag(buff, var273, 3, protoModule.wireTypes.lengthDelimited)
		var281, var643 = protoModule.writeBuffer(var281, var282, var280, buffer.len(var280))
		buff = var281
		var273 = var282
	end
	local buff_1 = buffer.create(var273)
	buffer.copy(buff_1, 0, buff, 0, var273)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), propTypesModule (ref)
	local var273 = t_14.new()
	local var274 = 0
	while var274 < buffer.len(p14) do
		local _ = nil
		local var275 = nil
		local var276, var277, var278 = protoModule.readTag(p14, var274)
		local var279 = var276
		var275 = var277
		var274 = var278
		
		if var275 == protoModule.wireTypes.varint then
			local _ = nil
			local var280, var281 = protoModule.readVarInt(p14, var274)
			local _ = var280
			var274 = var281
			continue
		end
		if var275 == protoModule.wireTypes.lengthDelimited then
			if var279 == 1 then
				local _ = nil
				local var282, var283 = protoModule.readBuffer(p14, var274)
				var274 = var283
				var273.collection_id = propTypesModule.StringProp.decode(var282)
			elseif var279 == 2 then
				local _ = nil
				local var284, var285 = protoModule.readBuffer(p14, var274)
				var274 = var285
				var273.game_set_target_id = propTypesModule.StringProp.decode(var284)
			elseif var279 == 3 then
				local _ = nil
				local var286, var287 = protoModule.readBuffer(p14, var274)
				var274 = var287
				var273.collection_position = propTypesModule.StringProp.decode(var286)
			else
				local _ = nil
				local var288, var289 = protoModule.readVarInt(p14, var274)
				var274 = var289 + var288
			end
		elseif var275 == protoModule.wireTypes.i32 then
			local _ = nil
			local var290, var291 = protoModule.readFixed32(p14, var274)
			local _ = var290
			var274 = var291
		elseif var275 == protoModule.wireTypes.i64 then
			local _ = nil
			local var292, var293 = protoModule.readFixed64(p14, var274)
			local _ = var292
			var274 = var293
		else
			error("Unsupported wire type: " .. var647)
		end
	end
	return var273
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
	local var294 = t_14.new()
	
	if self.collection_id ~= nil then
		var294.collection_id = propTypesModule.StringProp.jsonDecode(self.collection_id)
	end
	if self.collectionId ~= nil then
		var294.collection_id = propTypesModule.StringProp.jsonDecode(self.collectionId)
	end
	if self.game_set_target_id ~= nil then
		var294.game_set_target_id = propTypesModule.StringProp.jsonDecode(self.game_set_target_id)
	end
	if self.gameSetTargetId ~= nil then
		var294.game_set_target_id = propTypesModule.StringProp.jsonDecode(self.gameSetTargetId)
	end
	if self.collection_position ~= nil then
		var294.collection_position = propTypesModule.StringProp.jsonDecode(self.collection_position)
	end
	if self.collectionPosition ~= nil then
		var294.collection_position = propTypesModule.StringProp.jsonDecode(self.collectionPosition)
	end
	return var294
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
	local var294 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var295, var296 = protoModule.writeTag(buff, var294, 1, protoModule.wireTypes.varint)
		var295, var671 = protoModule.writeVarInt(var295, var296, t.ActionType.toNumber(self.action_type))
		buff = var295
		var294 = var296
	end
	if self.action_params ~= nil then
		local var297 = self.action_params:encode()
		local var298, var299 = protoModule.writeTag(buff, var294, 2, protoModule.wireTypes.lengthDelimited)
		var298, var674 = protoModule.writeBuffer(var298, var299, var297, buffer.len(var297))
		buff = var298
		var294 = var299
	end
	local buff_1 = buffer.create(var294)
	buffer.copy(buff_1, 0, buff, 0, var294)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var294 = t_15.new()
	local var295 = 0
	while var295 < buffer.len(p15) do
		local _ = nil
		local var296 = nil
		local var297, var298, var299 = protoModule.readTag(p15, var295)
		local var300 = var297
		var296 = var298
		var295 = var299
		
		if var296 == protoModule.wireTypes.varint then
			if var300 == 1 then
				local _ = nil
				local var301, var302 = protoModule.readVarIntI32(p15, var295)
				local var303 = var301
				var295 = var302
				var294.action_type = t.ActionType.fromNumber(var303) or var303
			else
				local _ = nil
				local var304, var305 = protoModule.readVarInt(p15, var295)
				local _ = var304
				var295 = var305
			end
		end
		if var296 == protoModule.wireTypes.lengthDelimited then
			if var300 == 2 then
				local _ = nil
				local var306, var307 = protoModule.readBuffer(p15, var295)
				var295 = var307
				var294.action_params = t.OpenSponsoredTooltipAction_Params.decode(var306)
			else
				local _ = nil
				local var308, var309 = protoModule.readVarInt(p15, var295)
				var295 = var309 + var308
			end
		elseif var296 == protoModule.wireTypes.i32 then
			local _ = nil
			local var310, var311 = protoModule.readFixed32(p15, var295)
			local _ = var310
			var295 = var311
		elseif var296 == protoModule.wireTypes.i64 then
			local _ = nil
			local var312, var313 = protoModule.readFixed64(p15, var295)
			local _ = var312
			var295 = var313
		else
			error("Unsupported wire type: " .. var678)
		end
	end
	return var294
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
	local var314 = t_15.new()
	
	if self.action_type ~= nil then
		var314.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var314.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var314.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var314.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return var314
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
	local var314 = t_16.new()
	local var315 = 0
	while var315 < buffer.len(p16) do
		local var316 = nil
		local _ = nil
		local var317, var318, var319 = protoModule.readTag(p16, var315)
		var316 = var317
		local var320 = var318
		var315 = var319
		
		if var320 == protoModule.wireTypes.varint then
			local _ = nil
			local var321, var322 = protoModule.readVarInt(p16, var315)
			local _ = var321
			var315 = var322
		elseif var320 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var323, var324 = protoModule.readVarInt(p16, var315)
			var315 = var324 + var323
		elseif var320 == protoModule.wireTypes.i32 then
			local _ = nil
			local var325, var326 = protoModule.readFixed32(p16, var315)
			local _ = var325
			var315 = var326
		elseif var320 == protoModule.wireTypes.i64 then
			local _ = nil
			local var327, var328 = protoModule.readFixed64(p16, var315)
			local _ = var327
			var315 = var328
		else
			error("Unsupported wire type: " .. var705)
		end
	end
	return var314
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
	local var329 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var330, var331 = protoModule.writeTag(buff, var329, 1, protoModule.wireTypes.varint)
		var330, var717 = protoModule.writeVarInt(var330, var331, t.ActionType.toNumber(self.action_type))
		buff = var330
		var329 = var331
	end
	if self.action_params ~= nil then
		local var332 = self.action_params:encode()
		local var333, var334 = protoModule.writeTag(buff, var329, 2, protoModule.wireTypes.lengthDelimited)
		var333, var720 = protoModule.writeBuffer(var333, var334, var332, buffer.len(var332))
		buff = var333
		var329 = var334
	end
	local buff_1 = buffer.create(var329)
	buffer.copy(buff_1, 0, buff, 0, var329)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref), t (ref)
	local var329 = t_17.new()
	local var330 = 0
	while var330 < buffer.len(p17) do
		local _ = nil
		local var331 = nil
		local var332, var333, var334 = protoModule.readTag(p17, var330)
		local var335 = var332
		var331 = var333
		var330 = var334
		
		if var331 == protoModule.wireTypes.varint then
			if var335 == 1 then
				local _ = nil
				local var336, var337 = protoModule.readVarIntI32(p17, var330)
				local var338 = var336
				var330 = var337
				var329.action_type = t.ActionType.fromNumber(var338) or var338
			else
				local _ = nil
				local var339, var340 = protoModule.readVarInt(p17, var330)
				local _ = var339
				var330 = var340
			end
		end
		if var331 == protoModule.wireTypes.lengthDelimited then
			if var335 == 2 then
				local _ = nil
				local var341, var342 = protoModule.readBuffer(p17, var330)
				var330 = var342
				var329.action_params = t.PlayButtonClickAction_Params.decode(var341)
			else
				local _ = nil
				local var343, var344 = protoModule.readVarInt(p17, var330)
				var330 = var344 + var343
			end
		elseif var331 == protoModule.wireTypes.i32 then
			local _ = nil
			local var345, var346 = protoModule.readFixed32(p17, var330)
			local _ = var345
			var330 = var346
		elseif var331 == protoModule.wireTypes.i64 then
			local _ = nil
			local var347, var348 = protoModule.readFixed64(p17, var330)
			local _ = var347
			var330 = var348
		else
			error("Unsupported wire type: " .. var724)
		end
	end
	return var329
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
	local var349 = t_17.new()
	
	if self.action_type ~= nil then
		var349.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var349.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var349.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var349.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.actionParams)
	end
	return var349
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
	local var349 = t_18.new()
	local var350 = 0
	while var350 < buffer.len(p18) do
		local var351 = nil
		local _ = nil
		local var352, var353, var354 = protoModule.readTag(p18, var350)
		var351 = var352
		local var355 = var353
		var350 = var354
		
		if var355 == protoModule.wireTypes.varint then
			local _ = nil
			local var356, var357 = protoModule.readVarInt(p18, var350)
			local _ = var356
			var350 = var357
		elseif var355 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var358, var359 = protoModule.readVarInt(p18, var350)
			var350 = var359 + var358
		elseif var355 == protoModule.wireTypes.i32 then
			local _ = nil
			local var360, var361 = protoModule.readFixed32(p18, var350)
			local _ = var360
			var350 = var361
		elseif var355 == protoModule.wireTypes.i64 then
			local _ = nil
			local var362, var363 = protoModule.readFixed64(p18, var350)
			local _ = var362
			var350 = var363
		else
			error("Unsupported wire type: " .. var751)
		end
	end
	return var349
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
	local var364 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var365, var366 = protoModule.writeTag(buff, var364, 1, protoModule.wireTypes.varint)
		var365, var763 = protoModule.writeVarInt(var365, var366, t.ActionType.toNumber(self.action_type))
		buff = var365
		var364 = var366
	end
	if self.action_params ~= nil then
		local var367 = self.action_params:encode()
		local var368, var369 = protoModule.writeTag(buff, var364, 2, protoModule.wireTypes.lengthDelimited)
		var368, var766 = protoModule.writeBuffer(var368, var369, var367, buffer.len(var367))
		buff = var368
		var364 = var369
	end
	local buff_1 = buffer.create(var364)
	buffer.copy(buff_1, 0, buff, 0, var364)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref), t (ref)
	local var364 = t_19.new()
	local var365 = 0
	while var365 < buffer.len(p19) do
		local _ = nil
		local var366 = nil
		local var367, var368, var369 = protoModule.readTag(p19, var365)
		local var370 = var367
		var366 = var368
		var365 = var369
		
		if var366 == protoModule.wireTypes.varint then
			if var370 == 1 then
				local _ = nil
				local var371, var372 = protoModule.readVarIntI32(p19, var365)
				local var373 = var371
				var365 = var372
				var364.action_type = t.ActionType.fromNumber(var373) or var373
			else
				local _ = nil
				local var374, var375 = protoModule.readVarInt(p19, var365)
				local _ = var374
				var365 = var375
			end
		end
		if var366 == protoModule.wireTypes.lengthDelimited then
			if var370 == 2 then
				local _ = nil
				local var376, var377 = protoModule.readBuffer(p19, var365)
				var365 = var377
				var364.action_params = t.UpdateUserSettingsAction_Params.decode(var376)
			else
				local _ = nil
				local var378, var379 = protoModule.readVarInt(p19, var365)
				var365 = var379 + var378
			end
		elseif var366 == protoModule.wireTypes.i32 then
			local _ = nil
			local var380, var381 = protoModule.readFixed32(p19, var365)
			local _ = var380
			var365 = var381
		elseif var366 == protoModule.wireTypes.i64 then
			local _ = nil
			local var382, var383 = protoModule.readFixed64(p19, var365)
			local _ = var382
			var365 = var383
		else
			error("Unsupported wire type: " .. var770)
		end
	end
	return var364
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
	local var384 = t_19.new()
	
	if self.action_type ~= nil then
		var384.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var384.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var384.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var384.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.actionParams)
	end
	return var384
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
	local var384 = 0
	
	if self.settings ~= nil then
		local var385 = self.settings:encode()
		local var386, var387 = protoModule.writeTag(buff, var384, 1, protoModule.wireTypes.lengthDelimited)
		var386, var794 = protoModule.writeBuffer(var386, var387, var385, buffer.len(var385))
		buff = var386
		var384 = var387
	end
	if self.audit_data ~= nil then
		local var388 = self.audit_data:encode()
		local var389, var390 = protoModule.writeTag(buff, var384, 2, protoModule.wireTypes.lengthDelimited)
		var389, var797 = protoModule.writeBuffer(var389, var390, var388, buffer.len(var388))
		buff = var389
		var384 = var390
	end
	local buff_1 = buffer.create(var384)
	buffer.copy(buff_1, 0, buff, 0, var384)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref), propTypesModule (ref)
	local var384 = t_20.new()
	local var385 = 0
	while var385 < buffer.len(p20) do
		local _ = nil
		local var386 = nil
		local var387, var388, var389 = protoModule.readTag(p20, var385)
		local var390 = var387
		var386 = var388
		var385 = var389
		
		if var386 == protoModule.wireTypes.varint then
			local _ = nil
			local var391, var392 = protoModule.readVarInt(p20, var385)
			local _ = var391
			var385 = var392
			continue
		end
		if var386 == protoModule.wireTypes.lengthDelimited then
			if var390 == 1 then
				local _ = nil
				local var393, var394 = protoModule.readBuffer(p20, var385)
				var385 = var394
				var384.settings = propTypesModule.StructProp.decode(var393)
			elseif var390 == 2 then
				local _ = nil
				local var395, var396 = protoModule.readBuffer(p20, var385)
				var385 = var396
				var384.audit_data = propTypesModule.StringProp.decode(var395)
			else
				local _ = nil
				local var397, var398 = protoModule.readVarInt(p20, var385)
				var385 = var398 + var397
			end
		elseif var386 == protoModule.wireTypes.i32 then
			local _ = nil
			local var399, var400 = protoModule.readFixed32(p20, var385)
			local _ = var399
			var385 = var400
		elseif var386 == protoModule.wireTypes.i64 then
			local _ = nil
			local var401, var402 = protoModule.readFixed64(p20, var385)
			local _ = var401
			var385 = var402
		else
			error("Unsupported wire type: " .. var801)
		end
	end
	return var384
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
	local var403 = t_20.new()
	
	if self.settings ~= nil then
		var403.settings = propTypesModule.StructProp.jsonDecode(self.settings)
	end
	if self.audit_data ~= nil then
		var403.audit_data = propTypesModule.StringProp.jsonDecode(self.audit_data)
	end
	if self.auditData ~= nil then
		var403.audit_data = propTypesModule.StringProp.jsonDecode(self.auditData)
	end
	return var403
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
	local var403 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var404, var405 = protoModule.writeTag(buff, var403, 1, protoModule.wireTypes.varint)
		var404, var823 = protoModule.writeVarInt(var404, var405, t.ActionType.toNumber(self.action_type))
		buff = var404
		var403 = var405
	end
	if self.action_params ~= nil then
		local var406 = self.action_params:encode()
		local var407, var408 = protoModule.writeTag(buff, var403, 2, protoModule.wireTypes.lengthDelimited)
		var407, var826 = protoModule.writeBuffer(var407, var408, var406, buffer.len(var406))
		buff = var407
		var403 = var408
	end
	local buff_1 = buffer.create(var403)
	buffer.copy(buff_1, 0, buff, 0, var403)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref), t (ref)
	local var403 = t_21.new()
	local var404 = 0
	while var404 < buffer.len(p21) do
		local _ = nil
		local var405 = nil
		local var406, var407, var408 = protoModule.readTag(p21, var404)
		local var409 = var406
		var405 = var407
		var404 = var408
		
		if var405 == protoModule.wireTypes.varint then
			if var409 == 1 then
				local _ = nil
				local var410, var411 = protoModule.readVarIntI32(p21, var404)
				local var412 = var410
				var404 = var411
				var403.action_type = t.ActionType.fromNumber(var412) or var412
			else
				local _ = nil
				local var413, var414 = protoModule.readVarInt(p21, var404)
				local _ = var413
				var404 = var414
			end
		end
		if var405 == protoModule.wireTypes.lengthDelimited then
			if var409 == 2 then
				local _ = nil
				local var415, var416 = protoModule.readBuffer(p21, var404)
				var404 = var416
				var403.action_params = t.OpenTooltipAction_Params.decode(var415)
			else
				local _ = nil
				local var417, var418 = protoModule.readVarInt(p21, var404)
				var404 = var418 + var417
			end
		elseif var405 == protoModule.wireTypes.i32 then
			local _ = nil
			local var419, var420 = protoModule.readFixed32(p21, var404)
			local _ = var419
			var404 = var420
		elseif var405 == protoModule.wireTypes.i64 then
			local _ = nil
			local var421, var422 = protoModule.readFixed64(p21, var404)
			local _ = var421
			var404 = var422
		else
			error("Unsupported wire type: " .. var830)
		end
	end
	return var403
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
	local var423 = t_21.new()
	
	if self.action_type ~= nil then
		var423.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var423.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var423.action_params = t.OpenTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var423.action_params = t.OpenTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return var423
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
	local var423 = 0
	
	if self.tooltip_title ~= nil then
		local var424 = self.tooltip_title:encode()
		local var425, var426 = protoModule.writeTag(buff, var423, 1, protoModule.wireTypes.lengthDelimited)
		var425, var854 = protoModule.writeBuffer(var425, var426, var424, buffer.len(var424))
		buff = var425
		var423 = var426
	end
	if self.tooltip_info_text ~= nil then
		local var427 = self.tooltip_info_text:encode()
		local var428, var429 = protoModule.writeTag(buff, var423, 2, protoModule.wireTypes.lengthDelimited)
		var428, var857 = protoModule.writeBuffer(var428, var429, var427, buffer.len(var427))
		buff = var428
		var423 = var429
	end
	local buff_1 = buffer.create(var423)
	buffer.copy(buff_1, 0, buff, 0, var423)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), propTypesModule (ref)
	local var423 = t_22.new()
	local var424 = 0
	while var424 < buffer.len(p22) do
		local _ = nil
		local var425 = nil
		local var426, var427, var428 = protoModule.readTag(p22, var424)
		local var429 = var426
		var425 = var427
		var424 = var428
		
		if var425 == protoModule.wireTypes.varint then
			local _ = nil
			local var430, var431 = protoModule.readVarInt(p22, var424)
			local _ = var430
			var424 = var431
			continue
		end
		if var425 == protoModule.wireTypes.lengthDelimited then
			if var429 == 1 then
				local _ = nil
				local var432, var433 = protoModule.readBuffer(p22, var424)
				var424 = var433
				var423.tooltip_title = propTypesModule.StringProp.decode(var432)
			elseif var429 == 2 then
				local _ = nil
				local var434, var435 = protoModule.readBuffer(p22, var424)
				var424 = var435
				var423.tooltip_info_text = propTypesModule.StringProp.decode(var434)
			else
				local _ = nil
				local var436, var437 = protoModule.readVarInt(p22, var424)
				var424 = var437 + var436
			end
		elseif var425 == protoModule.wireTypes.i32 then
			local _ = nil
			local var438, var439 = protoModule.readFixed32(p22, var424)
			local _ = var438
			var424 = var439
		elseif var425 == protoModule.wireTypes.i64 then
			local _ = nil
			local var440, var441 = protoModule.readFixed64(p22, var424)
			local _ = var440
			var424 = var441
		else
			error("Unsupported wire type: " .. var861)
		end
	end
	return var423
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
	local var442 = t_22.new()
	
	if self.tooltip_title ~= nil then
		var442.tooltip_title = propTypesModule.StringProp.jsonDecode(self.tooltip_title)
	end
	if self.tooltipTitle ~= nil then
		var442.tooltip_title = propTypesModule.StringProp.jsonDecode(self.tooltipTitle)
	end
	if self.tooltip_info_text ~= nil then
		var442.tooltip_info_text = propTypesModule.StringProp.jsonDecode(self.tooltip_info_text)
	end
	if self.tooltipInfoText ~= nil then
		var442.tooltip_info_text = propTypesModule.StringProp.jsonDecode(self.tooltipInfoText)
	end
	return var442
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
	local var442 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var443, var444 = protoModule.writeTag(buff, var442, 1, protoModule.wireTypes.varint)
		var443, var883 = protoModule.writeVarInt(var443, var444, t.ActionType.toNumber(self.action_type))
		buff = var443
		var442 = var444
	end
	if self.action_params ~= nil then
		local var445 = self.action_params:encode()
		local var446, var447 = protoModule.writeTag(buff, var442, 2, protoModule.wireTypes.lengthDelimited)
		var446, var886 = protoModule.writeBuffer(var446, var447, var445, buffer.len(var445))
		buff = var446
		var442 = var447
	end
	local buff_1 = buffer.create(var442)
	buffer.copy(buff_1, 0, buff, 0, var442)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref), t (ref)
	local var442 = t_23.new()
	local var443 = 0
	while var443 < buffer.len(p23) do
		local _ = nil
		local var444 = nil
		local var445, var446, var447 = protoModule.readTag(p23, var443)
		local var448 = var445
		var444 = var446
		var443 = var447
		
		if var444 == protoModule.wireTypes.varint then
			if var448 == 1 then
				local _ = nil
				local var449, var450 = protoModule.readVarIntI32(p23, var443)
				local var451 = var449
				var443 = var450
				var442.action_type = t.ActionType.fromNumber(var451) or var451
			else
				local _ = nil
				local var452, var453 = protoModule.readVarInt(p23, var443)
				local _ = var452
				var443 = var453
			end
		end
		if var444 == protoModule.wireTypes.lengthDelimited then
			if var448 == 2 then
				local _ = nil
				local var454, var455 = protoModule.readBuffer(p23, var443)
				var443 = var455
				var442.action_params = t.OpenBadgeDetailsAction_Params.decode(var454)
			else
				local _ = nil
				local var456, var457 = protoModule.readVarInt(p23, var443)
				var443 = var457 + var456
			end
		elseif var444 == protoModule.wireTypes.i32 then
			local _ = nil
			local var458, var459 = protoModule.readFixed32(p23, var443)
			local _ = var458
			var443 = var459
		elseif var444 == protoModule.wireTypes.i64 then
			local _ = nil
			local var460, var461 = protoModule.readFixed64(p23, var443)
			local _ = var460
			var443 = var461
		else
			error("Unsupported wire type: " .. var890)
		end
	end
	return var442
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
	local var462 = t_23.new()
	
	if self.action_type ~= nil then
		var462.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var462.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var462.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var462.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var462
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
	local var462 = 0
	
	if self.badge_id ~= nil then
		local var463 = self.badge_id:encode()
		local var464, var465 = protoModule.writeTag(buff, var462, 1, protoModule.wireTypes.lengthDelimited)
		var464, var914 = protoModule.writeBuffer(var464, var465, var463, buffer.len(var463))
		buff = var464
		var462 = var465
	end
	if self.title_text ~= nil then
		local var466 = self.title_text:encode()
		local var467, var468 = protoModule.writeTag(buff, var462, 2, protoModule.wireTypes.lengthDelimited)
		var467, var917 = protoModule.writeBuffer(var467, var468, var466, buffer.len(var466))
		buff = var467
		var462 = var468
	end
	local buff_1 = buffer.create(var462)
	buffer.copy(buff_1, 0, buff, 0, var462)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), propTypesModule (ref)
	local var462 = t_24.new()
	local var463 = 0
	while var463 < buffer.len(p24) do
		local _ = nil
		local var464 = nil
		local var465, var466, var467 = protoModule.readTag(p24, var463)
		local var468 = var465
		var464 = var466
		var463 = var467
		
		if var464 == protoModule.wireTypes.varint then
			local _ = nil
			local var469, var470 = protoModule.readVarInt(p24, var463)
			local _ = var469
			var463 = var470
			continue
		end
		if var464 == protoModule.wireTypes.lengthDelimited then
			if var468 == 1 then
				local _ = nil
				local var471, var472 = protoModule.readBuffer(p24, var463)
				var463 = var472
				var462.badge_id = propTypesModule.StringProp.decode(var471)
			elseif var468 == 2 then
				local _ = nil
				local var473, var474 = protoModule.readBuffer(p24, var463)
				var463 = var474
				var462.title_text = propTypesModule.StringProp.decode(var473)
			else
				local _ = nil
				local var475, var476 = protoModule.readVarInt(p24, var463)
				var463 = var476 + var475
			end
		elseif var464 == protoModule.wireTypes.i32 then
			local _ = nil
			local var477, var478 = protoModule.readFixed32(p24, var463)
			local _ = var477
			var463 = var478
		elseif var464 == protoModule.wireTypes.i64 then
			local _ = nil
			local var479, var480 = protoModule.readFixed64(p24, var463)
			local _ = var479
			var463 = var480
		else
			error("Unsupported wire type: " .. var921)
		end
	end
	return var462
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
	local var481 = t_24.new()
	
	if self.badge_id ~= nil then
		var481.badge_id = propTypesModule.StringProp.jsonDecode(self.badge_id)
	end
	if self.badgeId ~= nil then
		var481.badge_id = propTypesModule.StringProp.jsonDecode(self.badgeId)
	end
	if self.title_text ~= nil then
		var481.title_text = propTypesModule.StringProp.jsonDecode(self.title_text)
	end
	if self.titleText ~= nil then
		var481.title_text = propTypesModule.StringProp.jsonDecode(self.titleText)
	end
	return var481
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
	local var481 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var482, var483 = protoModule.writeTag(buff, var481, 1, protoModule.wireTypes.varint)
		var482, var943 = protoModule.writeVarInt(var482, var483, t.ActionType.toNumber(self.action_type))
		buff = var482
		var481 = var483
	end
	if self.action_params ~= nil then
		local var484 = self.action_params:encode()
		local var485, var486 = protoModule.writeTag(buff, var481, 2, protoModule.wireTypes.lengthDelimited)
		var485, var946 = protoModule.writeBuffer(var485, var486, var484, buffer.len(var484))
		buff = var485
		var481 = var486
	end
	local buff_1 = buffer.create(var481)
	buffer.copy(buff_1, 0, buff, 0, var481)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref), t (ref)
	local var481 = t_25.new()
	local var482 = 0
	while var482 < buffer.len(p25) do
		local _ = nil
		local var483 = nil
		local var484, var485, var486 = protoModule.readTag(p25, var482)
		local var487 = var484
		var483 = var485
		var482 = var486
		
		if var483 == protoModule.wireTypes.varint then
			if var487 == 1 then
				local _ = nil
				local var488, var489 = protoModule.readVarIntI32(p25, var482)
				local var490 = var488
				var482 = var489
				var481.action_type = t.ActionType.fromNumber(var490) or var490
			else
				local _ = nil
				local var491, var492 = protoModule.readVarInt(p25, var482)
				local _ = var491
				var482 = var492
			end
		end
		if var483 == protoModule.wireTypes.lengthDelimited then
			if var487 == 2 then
				local _ = nil
				local var493, var494 = protoModule.readBuffer(p25, var482)
				var482 = var494
				var481.action_params = t.LoadMoreFromApiAction_Params.decode(var493)
			else
				local _ = nil
				local var495, var496 = protoModule.readVarInt(p25, var482)
				var482 = var496 + var495
			end
		elseif var483 == protoModule.wireTypes.i32 then
			local _ = nil
			local var497, var498 = protoModule.readFixed32(p25, var482)
			local _ = var497
			var482 = var498
		elseif var483 == protoModule.wireTypes.i64 then
			local _ = nil
			local var499, var500 = protoModule.readFixed64(p25, var482)
			local _ = var499
			var482 = var500
		else
			error("Unsupported wire type: " .. var950)
		end
	end
	return var481
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
	local var501 = t_25.new()
	
	if self.action_type ~= nil then
		var501.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var501.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var501.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var501.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var501
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
	local var501 = 0
	
	if self.surface_key ~= nil then
		local var502 = self.surface_key:encode()
		local var503, var504 = protoModule.writeTag(buff, var501, 1, protoModule.wireTypes.lengthDelimited)
		var503, var974 = protoModule.writeBuffer(var503, var504, var502, buffer.len(var502))
		buff = var503
		var501 = var504
	end
	if self.config_key ~= nil then
		local var505 = self.config_key:encode()
		local var506, var507 = protoModule.writeTag(buff, var501, 2, protoModule.wireTypes.lengthDelimited)
		var506, var977 = protoModule.writeBuffer(var506, var507, var505, buffer.len(var505))
		buff = var506
		var501 = var507
	end
	local buff_1 = buffer.create(var501)
	buffer.copy(buff_1, 0, buff, 0, var501)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref), propTypesModule (ref)
	local var501 = t_26.new()
	local var502 = 0
	while var502 < buffer.len(p26) do
		local _ = nil
		local var503 = nil
		local var504, var505, var506 = protoModule.readTag(p26, var502)
		local var507 = var504
		var503 = var505
		var502 = var506
		
		if var503 == protoModule.wireTypes.varint then
			local _ = nil
			local var508, var509 = protoModule.readVarInt(p26, var502)
			local _ = var508
			var502 = var509
			continue
		end
		if var503 == protoModule.wireTypes.lengthDelimited then
			if var507 == 1 then
				local _ = nil
				local var510, var511 = protoModule.readBuffer(p26, var502)
				var502 = var511
				var501.surface_key = propTypesModule.StringProp.decode(var510)
			elseif var507 == 2 then
				local _ = nil
				local var512, var513 = protoModule.readBuffer(p26, var502)
				var502 = var513
				var501.config_key = propTypesModule.StringProp.decode(var512)
			else
				local _ = nil
				local var514, var515 = protoModule.readVarInt(p26, var502)
				var502 = var515 + var514
			end
		elseif var503 == protoModule.wireTypes.i32 then
			local _ = nil
			local var516, var517 = protoModule.readFixed32(p26, var502)
			local _ = var516
			var502 = var517
		elseif var503 == protoModule.wireTypes.i64 then
			local _ = nil
			local var518, var519 = protoModule.readFixed64(p26, var502)
			local _ = var518
			var502 = var519
		else
			error("Unsupported wire type: " .. var981)
		end
	end
	return var501
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
	local var520 = t_26.new()
	
	if self.surface_key ~= nil then
		var520.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var520.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		var520.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var520.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return var520
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
	local var520 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var521, var522 = protoModule.writeTag(buff, var520, 1, protoModule.wireTypes.varint)
		var521, var1003 = protoModule.writeVarInt(var521, var522, t.ActionType.toNumber(self.action_type))
		buff = var521
		var520 = var522
	end
	if self.action_params ~= nil then
		local var523 = self.action_params:encode()
		local var524, var525 = protoModule.writeTag(buff, var520, 2, protoModule.wireTypes.lengthDelimited)
		var524, var1006 = protoModule.writeBuffer(var524, var525, var523, buffer.len(var523))
		buff = var524
		var520 = var525
	end
	local buff_1 = buffer.create(var520)
	buffer.copy(buff_1, 0, buff, 0, var520)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref), t (ref)
	local var520 = t_27.new()
	local var521 = 0
	while var521 < buffer.len(p27) do
		local _ = nil
		local var522 = nil
		local var523, var524, var525 = protoModule.readTag(p27, var521)
		local var526 = var523
		var522 = var524
		var521 = var525
		
		if var522 == protoModule.wireTypes.varint then
			if var526 == 1 then
				local _ = nil
				local var527, var528 = protoModule.readVarIntI32(p27, var521)
				local var529 = var527
				var521 = var528
				var520.action_type = t.ActionType.fromNumber(var529) or var529
			else
				local _ = nil
				local var530, var531 = protoModule.readVarInt(p27, var521)
				local _ = var530
				var521 = var531
			end
		end
		if var522 == protoModule.wireTypes.lengthDelimited then
			if var526 == 2 then
				local _ = nil
				local var532, var533 = protoModule.readBuffer(p27, var521)
				var521 = var533
				var520.action_params = t.ShareAction_Params.decode(var532)
			else
				local _ = nil
				local var534, var535 = protoModule.readVarInt(p27, var521)
				var521 = var535 + var534
			end
		elseif var522 == protoModule.wireTypes.i32 then
			local _ = nil
			local var536, var537 = protoModule.readFixed32(p27, var521)
			local _ = var536
			var521 = var537
		elseif var522 == protoModule.wireTypes.i64 then
			local _ = nil
			local var538, var539 = protoModule.readFixed64(p27, var521)
			local _ = var538
			var521 = var539
		else
			error("Unsupported wire type: " .. var1010)
		end
	end
	return var520
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
	local var540 = t_27.new()
	
	if self.action_type ~= nil then
		var540.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var540.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var540.action_params = t.ShareAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var540.action_params = t.ShareAction_Params.jsonDecode(self.actionParams)
	end
	return var540
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
	local var540 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "generic_share_link_data" then
			local var541 = self.oneof_prop.value:encode()
			local var542, var543 = protoModule.writeTag(buff, var540, 1, protoModule.wireTypes.lengthDelimited)
			var542, var1034 = protoModule.writeBuffer(var542, var543, var541, buffer.len(var541))
			buff = var542
			var540 = var543
		elseif self.oneof_prop.type == "share_link_fetch_data" then
			local var544 = self.oneof_prop.value:encode()
			local var545, var546 = protoModule.writeTag(buff, var540, 2, protoModule.wireTypes.lengthDelimited)
			var545, var1037 = protoModule.writeBuffer(var545, var546, var544, buffer.len(var544))
			buff = var545
			var540 = var546
		end
	end
	local buff_1 = buffer.create(var540)
	buffer.copy(buff_1, 0, buff, 0, var540)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref), shareLinkDataModule (ref)
	local var540 = t_28.new()
	local var541 = 0
	while var541 < buffer.len(p28) do
		local _ = nil
		local var542 = nil
		local var543, var544, var545 = protoModule.readTag(p28, var541)
		local var546 = var543
		var542 = var544
		var541 = var545
		
		if var542 == protoModule.wireTypes.varint then
			local _ = nil
			local var547, var548 = protoModule.readVarInt(p28, var541)
			local _ = var547
			var541 = var548
			continue
		end
		if var542 == protoModule.wireTypes.lengthDelimited then
			if var546 == 1 then
				local _ = nil
				local var549, var550 = protoModule.readBuffer(p28, var541)
				var541 = var550
				var540.oneof_prop = {
					type = "generic_share_link_data",
					value = shareLinkDataModule.GenericShareLinkData.decode(var549)
				}
			elseif var546 == 2 then
				local _ = nil
				local var551, var552 = protoModule.readBuffer(p28, var541)
				var541 = var552
				var540.oneof_prop = {
					type = "share_link_fetch_data",
					value = shareLinkDataModule.ShareLinkFetchData.decode(var551)
				}
			else
				local _ = nil
				local var553, var554 = protoModule.readVarInt(p28, var541)
				var541 = var554 + var553
			end
		elseif var542 == protoModule.wireTypes.i32 then
			local _ = nil
			local var555, var556 = protoModule.readFixed32(p28, var541)
			local _ = var555
			var541 = var556
		elseif var542 == protoModule.wireTypes.i64 then
			local _ = nil
			local var557, var558 = protoModule.readFixed64(p28, var541)
			local _ = var557
			var541 = var558
		else
			error("Unsupported wire type: " .. var1041)
		end
	end
	return var540
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
	local var559 = t_28.new()
	
	if self.generic_share_link_data ~= nil then
		var559.oneof_prop = {
			type = "generic_share_link_data",
			value = shareLinkDataModule.GenericShareLinkData.jsonDecode(self.generic_share_link_data)
		}
	end
	if self.genericShareLinkData ~= nil then
		var559.oneof_prop = {
			type = "generic_share_link_data",
			value = shareLinkDataModule.GenericShareLinkData.jsonDecode(self.genericShareLinkData)
		}
	end
	if self.share_link_fetch_data ~= nil then
		var559.oneof_prop = {
			type = "share_link_fetch_data",
			value = shareLinkDataModule.ShareLinkFetchData.jsonDecode(self.share_link_fetch_data)
		}
	end
	if self.shareLinkFetchData ~= nil then
		var559.oneof_prop = {
			type = "share_link_fetch_data",
			value = shareLinkDataModule.ShareLinkFetchData.jsonDecode(self.shareLinkFetchData)
		}
	end
	return var559
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
	local var559 = 0
	
	if self.share_link_type ~= nil then
		local var560 = self.share_link_type:encode()
		local var561, var562 = protoModule.writeTag(buff, var559, 1, protoModule.wireTypes.lengthDelimited)
		var561, var1064 = protoModule.writeBuffer(var561, var562, var560, buffer.len(var560))
		buff = var561
		var559 = var562
	end
	if self.share_link_data ~= nil then
		local var563 = self.share_link_data:encode()
		local var564, var565 = protoModule.writeTag(buff, var559, 2, protoModule.wireTypes.lengthDelimited)
		var564, var1067 = protoModule.writeBuffer(var564, var565, var563, buffer.len(var563))
		buff = var564
		var559 = var565
	end
	if self.entry_point_key ~= nil then
		local var566 = self.entry_point_key:encode()
		local var567, var568 = protoModule.writeTag(buff, var559, 3, protoModule.wireTypes.lengthDelimited)
		var567, var1070 = protoModule.writeBuffer(var567, var568, var566, buffer.len(var566))
		buff = var567
		var559 = var568
	end
	local buff_1 = buffer.create(var559)
	buffer.copy(buff_1, 0, buff, 0, var559)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var559 = t_29.new()
	local var560 = 0
	while var560 < buffer.len(p29) do
		local _ = nil
		local var561 = nil
		local var562, var563, var564 = protoModule.readTag(p29, var560)
		local var565 = var562
		var561 = var563
		var560 = var564
		
		if var561 == protoModule.wireTypes.varint then
			local _ = nil
			local var566, var567 = protoModule.readVarInt(p29, var560)
			local _ = var566
			var560 = var567
			continue
		end
		if var561 == protoModule.wireTypes.lengthDelimited then
			if var565 == 1 then
				local _ = nil
				local var568, var569 = protoModule.readBuffer(p29, var560)
				var560 = var569
				var559.share_link_type = propTypesModule.StringProp.decode(var568)
			elseif var565 == 2 then
				local _ = nil
				local var570, var571 = protoModule.readBuffer(p29, var560)
				var560 = var571
				var559.share_link_data = t.ShareAction_ShareLinkData.decode(var570)
			elseif var565 == 3 then
				local _ = nil
				local var572, var573 = protoModule.readBuffer(p29, var560)
				var560 = var573
				var559.entry_point_key = propTypesModule.StringProp.decode(var572)
			else
				local _ = nil
				local var574, var575 = protoModule.readVarInt(p29, var560)
				var560 = var575 + var574
			end
		elseif var561 == protoModule.wireTypes.i32 then
			local _ = nil
			local var576, var577 = protoModule.readFixed32(p29, var560)
			local _ = var576
			var560 = var577
		elseif var561 == protoModule.wireTypes.i64 then
			local _ = nil
			local var578, var579 = protoModule.readFixed64(p29, var560)
			local _ = var578
			var560 = var579
		else
			error("Unsupported wire type: " .. var1074)
		end
	end
	return var559
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
	local var580 = t_29.new()
	
	if self.share_link_type ~= nil then
		var580.share_link_type = propTypesModule.StringProp.jsonDecode(self.share_link_type)
	end
	if self.shareLinkType ~= nil then
		var580.share_link_type = propTypesModule.StringProp.jsonDecode(self.shareLinkType)
	end
	if self.share_link_data ~= nil then
		var580.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.share_link_data)
	end
	if self.shareLinkData ~= nil then
		var580.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.shareLinkData)
	end
	if self.entry_point_key ~= nil then
		var580.entry_point_key = propTypesModule.StringProp.jsonDecode(self.entry_point_key)
	end
	if self.entryPointKey ~= nil then
		var580.entry_point_key = propTypesModule.StringProp.jsonDecode(self.entryPointKey)
	end
	return var580
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
	local var580 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var581, var582 = protoModule.writeTag(buff, var580, 1, protoModule.wireTypes.varint)
		var581, var1098 = protoModule.writeVarInt(var581, var582, t.ActionType.toNumber(self.action_type))
		buff = var581
		var580 = var582
	end
	if self.action_params ~= nil then
		local var583 = self.action_params:encode()
		local var584, var585 = protoModule.writeTag(buff, var580, 2, protoModule.wireTypes.lengthDelimited)
		var584, var1101 = protoModule.writeBuffer(var584, var585, var583, buffer.len(var583))
		buff = var584
		var580 = var585
	end
	local buff_1 = buffer.create(var580)
	buffer.copy(buff_1, 0, buff, 0, var580)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref), t (ref)
	local var580 = t_30.new()
	local var581 = 0
	while var581 < buffer.len(p30) do
		local _ = nil
		local var582 = nil
		local var583, var584, var585 = protoModule.readTag(p30, var581)
		local var586 = var583
		var582 = var584
		var581 = var585
		
		if var582 == protoModule.wireTypes.varint then
			if var586 == 1 then
				local _ = nil
				local var587, var588 = protoModule.readVarIntI32(p30, var581)
				local var589 = var587
				var581 = var588
				var580.action_type = t.ActionType.fromNumber(var589) or var589
			else
				local _ = nil
				local var590, var591 = protoModule.readVarInt(p30, var581)
				local _ = var590
				var581 = var591
			end
		end
		if var582 == protoModule.wireTypes.lengthDelimited then
			if var586 == 2 then
				local _ = nil
				local var592, var593 = protoModule.readBuffer(p30, var581)
				var581 = var593
				var580.action_params = t.OpenAbuseReportAction_Params.decode(var592)
			else
				local _ = nil
				local var594, var595 = protoModule.readVarInt(p30, var581)
				var581 = var595 + var594
			end
		elseif var582 == protoModule.wireTypes.i32 then
			local _ = nil
			local var596, var597 = protoModule.readFixed32(p30, var581)
			local _ = var596
			var581 = var597
		elseif var582 == protoModule.wireTypes.i64 then
			local _ = nil
			local var598, var599 = protoModule.readFixed64(p30, var581)
			local _ = var598
			var581 = var599
		else
			error("Unsupported wire type: " .. var1105)
		end
	end
	return var580
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
	local var600 = t_30.new()
	
	if self.action_type ~= nil then
		var600.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var600.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var600.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var600.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.actionParams)
	end
	return var600
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
		universe_id = if p31 == nil or p31.universe_id == nil then nil else p31.universe_id,
		group_id = if p31 == nil or p31.group_id == nil then nil else p31.group_id
	}, t_31)
end

function t_31:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var600 = 0
	
	if self.target_id ~= nil then
		local var601 = self.target_id:encode()
		local var602, var603 = protoModule.writeTag(buff, var600, 1, protoModule.wireTypes.lengthDelimited)
		var602, var1129 = protoModule.writeBuffer(var602, var603, var601, buffer.len(var601))
		buff = var602
		var600 = var603
	end
	if self.abuse_vector ~= nil then
		local var604 = self.abuse_vector:encode()
		local var605, var606 = protoModule.writeTag(buff, var600, 2, protoModule.wireTypes.lengthDelimited)
		var605, var1132 = protoModule.writeBuffer(var605, var606, var604, buffer.len(var604))
		buff = var605
		var600 = var606
	end
	if self.asset_type_name ~= nil then
		local var607 = self.asset_type_name:encode()
		local var608, var609 = protoModule.writeTag(buff, var600, 3, protoModule.wireTypes.lengthDelimited)
		var608, var1135 = protoModule.writeBuffer(var608, var609, var607, buffer.len(var607))
		buff = var608
		var600 = var609
	end
	if self.universe_id ~= nil then
		local var610 = self.universe_id:encode()
		local var611, var612 = protoModule.writeTag(buff, var600, 4, protoModule.wireTypes.lengthDelimited)
		var611, var1138 = protoModule.writeBuffer(var611, var612, var610, buffer.len(var610))
		buff = var611
		var600 = var612
	end
	if self.group_id ~= nil then
		local var613 = self.group_id:encode()
		local var614, var615 = protoModule.writeTag(buff, var600, 5, protoModule.wireTypes.lengthDelimited)
		var614, var1141 = protoModule.writeBuffer(var614, var615, var613, buffer.len(var613))
		buff = var614
		var600 = var615
	end
	local buff_1 = buffer.create(var600)
	buffer.copy(buff_1, 0, buff, 0, var600)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref), propTypesModule (ref)
	local var600 = t_31.new()
	local var601 = 0
	while var601 < buffer.len(p31) do
		local _ = nil
		local var602 = nil
		local var603, var604, var605 = protoModule.readTag(p31, var601)
		local var606 = var603
		var602 = var604
		var601 = var605
		
		if var602 == protoModule.wireTypes.varint then
			local _ = nil
			local var607, var608 = protoModule.readVarInt(p31, var601)
			local _ = var607
			var601 = var608
			continue
		end
		if var602 == protoModule.wireTypes.lengthDelimited then
			if var606 == 1 then
				local _ = nil
				local var609, var610 = protoModule.readBuffer(p31, var601)
				var601 = var610
				var600.target_id = propTypesModule.StringProp.decode(var609)
			elseif var606 == 2 then
				local _ = nil
				local var611, var612 = protoModule.readBuffer(p31, var601)
				var601 = var612
				var600.abuse_vector = propTypesModule.StringProp.decode(var611)
			elseif var606 == 3 then
				local _ = nil
				local var613, var614 = protoModule.readBuffer(p31, var601)
				var601 = var614
				var600.asset_type_name = propTypesModule.StringProp.decode(var613)
			elseif var606 == 4 then
				local _ = nil
				local var615, var616 = protoModule.readBuffer(p31, var601)
				var601 = var616
				var600.universe_id = propTypesModule.StringProp.decode(var615)
			elseif var606 == 5 then
				local _ = nil
				local var617, var618 = protoModule.readBuffer(p31, var601)
				var601 = var618
				var600.group_id = propTypesModule.StringProp.decode(var617)
			else
				local _ = nil
				local var619, var620 = protoModule.readVarInt(p31, var601)
				var601 = var620 + var619
			end
		elseif var602 == protoModule.wireTypes.i32 then
			local _ = nil
			local var621, var622 = protoModule.readFixed32(p31, var601)
			local _ = var621
			var601 = var622
		elseif var602 == protoModule.wireTypes.i64 then
			local _ = nil
			local var623, var624 = protoModule.readFixed64(p31, var601)
			local _ = var623
			var601 = var624
		else
			error("Unsupported wire type: " .. var1145)
		end
	end
	return var600
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
	if self.group_id ~= nil then
		t.groupId = self.group_id:jsonEncode()
	end
	return t
end

function t_31:jsonDecode()
	-- upvalues: t_31 (ref), propTypesModule (ref)
	local var625 = t_31.new()
	
	if self.target_id ~= nil then
		var625.target_id = propTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		var625.target_id = propTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.abuse_vector ~= nil then
		var625.abuse_vector = propTypesModule.StringProp.jsonDecode(self.abuse_vector)
	end
	if self.abuseVector ~= nil then
		var625.abuse_vector = propTypesModule.StringProp.jsonDecode(self.abuseVector)
	end
	if self.asset_type_name ~= nil then
		var625.asset_type_name = propTypesModule.StringProp.jsonDecode(self.asset_type_name)
	end
	if self.assetTypeName ~= nil then
		var625.asset_type_name = propTypesModule.StringProp.jsonDecode(self.assetTypeName)
	end
	if self.universe_id ~= nil then
		var625.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var625.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.group_id ~= nil then
		var625.group_id = propTypesModule.StringProp.jsonDecode(self.group_id)
	end
	if self.groupId ~= nil then
		var625.group_id = propTypesModule.StringProp.jsonDecode(self.groupId)
	end
	return var625
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
	local var625 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var626, var627 = protoModule.writeTag(buff, var625, 1, protoModule.wireTypes.varint)
		var626, var1173 = protoModule.writeVarInt(var626, var627, t.ActionType.toNumber(self.action_type))
		buff = var626
		var625 = var627
	end
	if self.action_params ~= nil then
		local var628 = self.action_params:encode()
		local var629, var630 = protoModule.writeTag(buff, var625, 2, protoModule.wireTypes.lengthDelimited)
		var629, var1176 = protoModule.writeBuffer(var629, var630, var628, buffer.len(var628))
		buff = var629
		var625 = var630
	end
	local buff_1 = buffer.create(var625)
	buffer.copy(buff_1, 0, buff, 0, var625)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref), t (ref)
	local var625 = t_32.new()
	local var626 = 0
	while var626 < buffer.len(p32) do
		local _ = nil
		local var627 = nil
		local var628, var629, var630 = protoModule.readTag(p32, var626)
		local var631 = var628
		var627 = var629
		var626 = var630
		
		if var627 == protoModule.wireTypes.varint then
			if var631 == 1 then
				local _ = nil
				local var632, var633 = protoModule.readVarIntI32(p32, var626)
				local var634 = var632
				var626 = var633
				var625.action_type = t.ActionType.fromNumber(var634) or var634
			else
				local _ = nil
				local var635, var636 = protoModule.readVarInt(p32, var626)
				local _ = var635
				var626 = var636
			end
		end
		if var627 == protoModule.wireTypes.lengthDelimited then
			if var631 == 2 then
				local _ = nil
				local var637, var638 = protoModule.readBuffer(p32, var626)
				var626 = var638
				var625.action_params = t.RemoveBadgeFromInventoryAction_Params.decode(var637)
			else
				local _ = nil
				local var639, var640 = protoModule.readVarInt(p32, var626)
				var626 = var640 + var639
			end
		elseif var627 == protoModule.wireTypes.i32 then
			local _ = nil
			local var641, var642 = protoModule.readFixed32(p32, var626)
			local _ = var641
			var626 = var642
		elseif var627 == protoModule.wireTypes.i64 then
			local _ = nil
			local var643, var644 = protoModule.readFixed64(p32, var626)
			local _ = var643
			var626 = var644
		else
			error("Unsupported wire type: " .. var1180)
		end
	end
	return var625
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
	local var645 = t_32.new()
	
	if self.action_type ~= nil then
		var645.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var645.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var645.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var645.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.actionParams)
	end
	return var645
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
	local var645 = 0
	
	if self.asset_id ~= nil then
		local var646 = self.asset_id:encode()
		local var647, var648 = protoModule.writeTag(buff, var645, 1, protoModule.wireTypes.lengthDelimited)
		var647, var1204 = protoModule.writeBuffer(var647, var648, var646, buffer.len(var646))
		buff = var647
		var645 = var648
	end
	local buff_1 = buffer.create(var645)
	buffer.copy(buff_1, 0, buff, 0, var645)
	
	return buff_1
end

function t_33.decode(p33)
	-- upvalues: t_33 (ref), protoModule (ref), propTypesModule (ref)
	local var645 = t_33.new()
	local var646 = 0
	while var646 < buffer.len(p33) do
		local _ = nil
		local var647 = nil
		local var648, var649, var650 = protoModule.readTag(p33, var646)
		local var651 = var648
		var647 = var649
		var646 = var650
		
		if var647 == protoModule.wireTypes.varint then
			local _ = nil
			local var652, var653 = protoModule.readVarInt(p33, var646)
			local _ = var652
			var646 = var653
			continue
		end
		if var647 == protoModule.wireTypes.lengthDelimited then
			if var651 == 1 then
				local _ = nil
				local var654, var655 = protoModule.readBuffer(p33, var646)
				var646 = var655
				var645.asset_id = propTypesModule.StringProp.decode(var654)
			else
				local _ = nil
				local var656, var657 = protoModule.readVarInt(p33, var646)
				var646 = var657 + var656
			end
		elseif var647 == protoModule.wireTypes.i32 then
			local _ = nil
			local var658, var659 = protoModule.readFixed32(p33, var646)
			local _ = var658
			var646 = var659
		elseif var647 == protoModule.wireTypes.i64 then
			local _ = nil
			local var660, var661 = protoModule.readFixed64(p33, var646)
			local _ = var660
			var646 = var661
		else
			error("Unsupported wire type: " .. var1208)
		end
	end
	return var645
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
	local var662 = t_33.new()
	
	if self.asset_id ~= nil then
		var662.asset_id = propTypesModule.StringProp.jsonDecode(self.asset_id)
	end
	if self.assetId ~= nil then
		var662.asset_id = propTypesModule.StringProp.jsonDecode(self.assetId)
	end
	return var662
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
	local var662 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var663, var664 = protoModule.writeTag(buff, var662, 1, protoModule.wireTypes.varint)
		var663, var1228 = protoModule.writeVarInt(var663, var664, t.ActionType.toNumber(self.action_type))
		buff = var663
		var662 = var664
	end
	if self.action_params ~= nil then
		local var665 = self.action_params:encode()
		local var666, var667 = protoModule.writeTag(buff, var662, 2, protoModule.wireTypes.lengthDelimited)
		var666, var1231 = protoModule.writeBuffer(var666, var667, var665, buffer.len(var665))
		buff = var666
		var662 = var667
	end
	local buff_1 = buffer.create(var662)
	buffer.copy(buff_1, 0, buff, 0, var662)
	
	return buff_1
end

function t_34.decode(p34)
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var662 = t_34.new()
	local var663 = 0
	while var663 < buffer.len(p34) do
		local _ = nil
		local var664 = nil
		local var665, var666, var667 = protoModule.readTag(p34, var663)
		local var668 = var665
		var664 = var666
		var663 = var667
		
		if var664 == protoModule.wireTypes.varint then
			if var668 == 1 then
				local _ = nil
				local var669, var670 = protoModule.readVarIntI32(p34, var663)
				local var671 = var669
				var663 = var670
				var662.action_type = t.ActionType.fromNumber(var671) or var671
			else
				local _ = nil
				local var672, var673 = protoModule.readVarInt(p34, var663)
				local _ = var672
				var663 = var673
			end
		end
		if var664 == protoModule.wireTypes.lengthDelimited then
			if var668 == 2 then
				local _ = nil
				local var674, var675 = protoModule.readBuffer(p34, var663)
				var663 = var675
				var662.action_params = t.OpenProfileAction_Params.decode(var674)
			else
				local _ = nil
				local var676, var677 = protoModule.readVarInt(p34, var663)
				var663 = var677 + var676
			end
		elseif var664 == protoModule.wireTypes.i32 then
			local _ = nil
			local var678, var679 = protoModule.readFixed32(p34, var663)
			local _ = var678
			var663 = var679
		elseif var664 == protoModule.wireTypes.i64 then
			local _ = nil
			local var680, var681 = protoModule.readFixed64(p34, var663)
			local _ = var680
			var663 = var681
		else
			error("Unsupported wire type: " .. var1235)
		end
	end
	return var662
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
	local var682 = t_34.new()
	
	if self.action_type ~= nil then
		var682.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var682.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var682.action_params = t.OpenProfileAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var682.action_params = t.OpenProfileAction_Params.jsonDecode(self.actionParams)
	end
	return var682
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
	local var682 = 0
	
	if self.profile_id ~= nil then
		local var683 = self.profile_id:encode()
		local var684, var685 = protoModule.writeTag(buff, var682, 1, protoModule.wireTypes.lengthDelimited)
		var684, var1259 = protoModule.writeBuffer(var684, var685, var683, buffer.len(var683))
		buff = var684
		var682 = var685
	end
	if self.profile_type ~= nil then
		local var686 = self.profile_type:encode()
		local var687, var688 = protoModule.writeTag(buff, var682, 2, protoModule.wireTypes.lengthDelimited)
		var687, var1262 = protoModule.writeBuffer(var687, var688, var686, buffer.len(var686))
		buff = var687
		var682 = var688
	end
	if self.source ~= nil then
		local var689 = self.source:encode()
		local var690, var691 = protoModule.writeTag(buff, var682, 3, protoModule.wireTypes.lengthDelimited)
		var690, var1265 = protoModule.writeBuffer(var690, var691, var689, buffer.len(var689))
		buff = var690
		var682 = var691
	end
	local buff_1 = buffer.create(var682)
	buffer.copy(buff_1, 0, buff, 0, var682)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref), propTypesModule (ref)
	local var682 = t_35.new()
	local var683 = 0
	while var683 < buffer.len(p35) do
		local _ = nil
		local var684 = nil
		local var685, var686, var687 = protoModule.readTag(p35, var683)
		local var688 = var685
		var684 = var686
		var683 = var687
		
		if var684 == protoModule.wireTypes.varint then
			local _ = nil
			local var689, var690 = protoModule.readVarInt(p35, var683)
			local _ = var689
			var683 = var690
			continue
		end
		if var684 == protoModule.wireTypes.lengthDelimited then
			if var688 == 1 then
				local _ = nil
				local var691, var692 = protoModule.readBuffer(p35, var683)
				var683 = var692
				var682.profile_id = propTypesModule.StringProp.decode(var691)
			elseif var688 == 2 then
				local _ = nil
				local var693, var694 = protoModule.readBuffer(p35, var683)
				var683 = var694
				var682.profile_type = propTypesModule.StringProp.decode(var693)
			elseif var688 == 3 then
				local _ = nil
				local var695, var696 = protoModule.readBuffer(p35, var683)
				var683 = var696
				var682.source = propTypesModule.StringProp.decode(var695)
			else
				local _ = nil
				local var697, var698 = protoModule.readVarInt(p35, var683)
				var683 = var698 + var697
			end
		elseif var684 == protoModule.wireTypes.i32 then
			local _ = nil
			local var699, var700 = protoModule.readFixed32(p35, var683)
			local _ = var699
			var683 = var700
		elseif var684 == protoModule.wireTypes.i64 then
			local _ = nil
			local var701, var702 = protoModule.readFixed64(p35, var683)
			local _ = var701
			var683 = var702
		else
			error("Unsupported wire type: " .. var1269)
		end
	end
	return var682
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
	local var703 = t_35.new()
	
	if self.profile_id ~= nil then
		var703.profile_id = propTypesModule.StringProp.jsonDecode(self.profile_id)
	end
	if self.profileId ~= nil then
		var703.profile_id = propTypesModule.StringProp.jsonDecode(self.profileId)
	end
	if self.profile_type ~= nil then
		var703.profile_type = propTypesModule.StringProp.jsonDecode(self.profile_type)
	end
	if self.profileType ~= nil then
		var703.profile_type = propTypesModule.StringProp.jsonDecode(self.profileType)
	end
	if self.source ~= nil then
		var703.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var703
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
	local var703 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var704, var705 = protoModule.writeTag(buff, var703, 1, protoModule.wireTypes.varint)
		var704, var1293 = protoModule.writeVarInt(var704, var705, t.ActionType.toNumber(self.action_type))
		buff = var704
		var703 = var705
	end
	if self.action_params ~= nil then
		local var706 = self.action_params:encode()
		local var707, var708 = protoModule.writeTag(buff, var703, 2, protoModule.wireTypes.lengthDelimited)
		var707, var1296 = protoModule.writeBuffer(var707, var708, var706, buffer.len(var706))
		buff = var707
		var703 = var708
	end
	local buff_1 = buffer.create(var703)
	buffer.copy(buff_1, 0, buff, 0, var703)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var703 = t_36.new()
	local var704 = 0
	while var704 < buffer.len(p36) do
		local _ = nil
		local var705 = nil
		local var706, var707, var708 = protoModule.readTag(p36, var704)
		local var709 = var706
		var705 = var707
		var704 = var708
		
		if var705 == protoModule.wireTypes.varint then
			if var709 == 1 then
				local _ = nil
				local var710, var711 = protoModule.readVarIntI32(p36, var704)
				local var712 = var710
				var704 = var711
				var703.action_type = t.ActionType.fromNumber(var712) or var712
			else
				local _ = nil
				local var713, var714 = protoModule.readVarInt(p36, var704)
				local _ = var713
				var704 = var714
			end
		end
		if var705 == protoModule.wireTypes.lengthDelimited then
			if var709 == 2 then
				local _ = nil
				local var715, var716 = protoModule.readBuffer(p36, var704)
				var704 = var716
				var703.action_params = t.OpenFacialAgeEstimationAction_Params.decode(var715)
			else
				local _ = nil
				local var717, var718 = protoModule.readVarInt(p36, var704)
				var704 = var718 + var717
			end
		elseif var705 == protoModule.wireTypes.i32 then
			local _ = nil
			local var719, var720 = protoModule.readFixed32(p36, var704)
			local _ = var719
			var704 = var720
		elseif var705 == protoModule.wireTypes.i64 then
			local _ = nil
			local var721, var722 = protoModule.readFixed64(p36, var704)
			local _ = var721
			var704 = var722
		else
			error("Unsupported wire type: " .. var1300)
		end
	end
	return var703
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
	local var723 = t_36.new()
	
	if self.action_type ~= nil then
		var723.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var723.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var723.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var723.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.actionParams)
	end
	return var723
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
	local var723 = 0
	
	if self.user_id ~= nil then
		local var724 = self.user_id:encode()
		local var725, var726 = protoModule.writeTag(buff, var723, 1, protoModule.wireTypes.lengthDelimited)
		var725, var1324 = protoModule.writeBuffer(var725, var726, var724, buffer.len(var724))
		buff = var725
		var723 = var726
	end
	if self.source ~= nil then
		local var727 = self.source:encode()
		local var728, var729 = protoModule.writeTag(buff, var723, 2, protoModule.wireTypes.lengthDelimited)
		var728, var1327 = protoModule.writeBuffer(var728, var729, var727, buffer.len(var727))
		buff = var728
		var723 = var729
	end
	if self.context ~= nil then
		local var730 = self.context:encode()
		local var731, var732 = protoModule.writeTag(buff, var723, 3, protoModule.wireTypes.lengthDelimited)
		var731, var1330 = protoModule.writeBuffer(var731, var732, var730, buffer.len(var730))
		buff = var731
		var723 = var732
	end
	if self.is_in_experience ~= nil then
		local var733 = self.is_in_experience:encode()
		local var734, var735 = protoModule.writeTag(buff, var723, 4, protoModule.wireTypes.lengthDelimited)
		var734, var1333 = protoModule.writeBuffer(var734, var735, var733, buffer.len(var733))
		buff = var734
		var723 = var735
	end
	if self.on_success ~= nil then
		local var736 = self.on_success:encode()
		local var737, var738 = protoModule.writeTag(buff, var723, 5, protoModule.wireTypes.lengthDelimited)
		var737, var1336 = protoModule.writeBuffer(var737, var738, var736, buffer.len(var736))
		buff = var737
		var723 = var738
	end
	if self.on_failure ~= nil then
		local var739 = self.on_failure:encode()
		local var740, var741 = protoModule.writeTag(buff, var723, 6, protoModule.wireTypes.lengthDelimited)
		var740, var1339 = protoModule.writeBuffer(var740, var741, var739, buffer.len(var739))
		buff = var740
		var723 = var741
	end
	if self.should_include_vpc ~= nil then
		local var742 = self.should_include_vpc:encode()
		local var743, var744 = protoModule.writeTag(buff, var723, 7, protoModule.wireTypes.lengthDelimited)
		var743, var1342 = protoModule.writeBuffer(var743, var744, var742, buffer.len(var742))
		buff = var743
		var723 = var744
	end
	local buff_1 = buffer.create(var723)
	buffer.copy(buff_1, 0, buff, 0, var723)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var723 = t_37.new()
	local var724 = 0
	while var724 < buffer.len(p37) do
		local _ = nil
		local var725 = nil
		local var726, var727, var728 = protoModule.readTag(p37, var724)
		local var729 = var726
		var725 = var727
		var724 = var728
		
		if var725 == protoModule.wireTypes.varint then
			local _ = nil
			local var730, var731 = protoModule.readVarInt(p37, var724)
			local _ = var730
			var724 = var731
			continue
		end
		if var725 == protoModule.wireTypes.lengthDelimited then
			if var729 == 1 then
				local _ = nil
				local var732, var733 = protoModule.readBuffer(p37, var724)
				var724 = var733
				var723.user_id = propTypesModule.StringProp.decode(var732)
			elseif var729 == 2 then
				local _ = nil
				local var734, var735 = protoModule.readBuffer(p37, var724)
				var724 = var735
				var723.source = propTypesModule.StringProp.decode(var734)
			elseif var729 == 3 then
				local _ = nil
				local var736, var737 = protoModule.readBuffer(p37, var724)
				var724 = var737
				var723.context = propTypesModule.StringProp.decode(var736)
			elseif var729 == 4 then
				local _ = nil
				local var738, var739 = protoModule.readBuffer(p37, var724)
				var724 = var739
				var723.is_in_experience = propTypesModule.BoolProp.decode(var738)
			elseif var729 == 5 then
				local _ = nil
				local var740, var741 = protoModule.readBuffer(p37, var724)
				var724 = var741
				var723.on_success = t.ActionProp.decode(var740)
			elseif var729 == 6 then
				local _ = nil
				local var742, var743 = protoModule.readBuffer(p37, var724)
				var724 = var743
				var723.on_failure = t.ActionProp.decode(var742)
			elseif var729 == 7 then
				local _ = nil
				local var744, var745 = protoModule.readBuffer(p37, var724)
				var724 = var745
				var723.should_include_vpc = propTypesModule.BoolProp.decode(var744)
			else
				local _ = nil
				local var746, var747 = protoModule.readVarInt(p37, var724)
				var724 = var747 + var746
			end
		elseif var725 == protoModule.wireTypes.i32 then
			local _ = nil
			local var748, var749 = protoModule.readFixed32(p37, var724)
			local _ = var748
			var724 = var749
		elseif var725 == protoModule.wireTypes.i64 then
			local _ = nil
			local var750, var751 = protoModule.readFixed64(p37, var724)
			local _ = var750
			var724 = var751
		else
			error("Unsupported wire type: " .. var1346)
		end
	end
	return var723
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
	local var752 = t_37.new()
	
	if self.user_id ~= nil then
		var752.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var752.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var752.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.context ~= nil then
		var752.context = propTypesModule.StringProp.jsonDecode(self.context)
	end
	if self.is_in_experience ~= nil then
		var752.is_in_experience = propTypesModule.BoolProp.jsonDecode(self.is_in_experience)
	end
	if self.isInExperience ~= nil then
		var752.is_in_experience = propTypesModule.BoolProp.jsonDecode(self.isInExperience)
	end
	if self.on_success ~= nil then
		var752.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var752.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var752.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var752.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	if self.should_include_vpc ~= nil then
		var752.should_include_vpc = propTypesModule.BoolProp.jsonDecode(self.should_include_vpc)
	end
	if self.shouldIncludeVpc ~= nil then
		var752.should_include_vpc = propTypesModule.BoolProp.jsonDecode(self.shouldIncludeVpc)
	end
	return var752
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
	local var752 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var753, var754 = protoModule.writeTag(buff, var752, 1, protoModule.wireTypes.varint)
		var753, var1378 = protoModule.writeVarInt(var753, var754, t.ActionType.toNumber(self.action_type))
		buff = var753
		var752 = var754
	end
	if self.action_params ~= nil then
		local var755 = self.action_params:encode()
		local var756, var757 = protoModule.writeTag(buff, var752, 2, protoModule.wireTypes.lengthDelimited)
		var756, var1381 = protoModule.writeBuffer(var756, var757, var755, buffer.len(var755))
		buff = var756
		var752 = var757
	end
	local buff_1 = buffer.create(var752)
	buffer.copy(buff_1, 0, buff, 0, var752)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref), t (ref)
	local var752 = t_38.new()
	local var753 = 0
	while var753 < buffer.len(p38) do
		local _ = nil
		local var754 = nil
		local var755, var756, var757 = protoModule.readTag(p38, var753)
		local var758 = var755
		var754 = var756
		var753 = var757
		
		if var754 == protoModule.wireTypes.varint then
			if var758 == 1 then
				local _ = nil
				local var759, var760 = protoModule.readVarIntI32(p38, var753)
				local var761 = var759
				var753 = var760
				var752.action_type = t.ActionType.fromNumber(var761) or var761
			else
				local _ = nil
				local var762, var763 = protoModule.readVarInt(p38, var753)
				local _ = var762
				var753 = var763
			end
		end
		if var754 == protoModule.wireTypes.lengthDelimited then
			if var758 == 2 then
				local _ = nil
				local var764, var765 = protoModule.readBuffer(p38, var753)
				var753 = var765
				var752.action_params = t.ShowToastAction_Params.decode(var764)
			else
				local _ = nil
				local var766, var767 = protoModule.readVarInt(p38, var753)
				var753 = var767 + var766
			end
		elseif var754 == protoModule.wireTypes.i32 then
			local _ = nil
			local var768, var769 = protoModule.readFixed32(p38, var753)
			local _ = var768
			var753 = var769
		elseif var754 == protoModule.wireTypes.i64 then
			local _ = nil
			local var770, var771 = protoModule.readFixed64(p38, var753)
			local _ = var770
			var753 = var771
		else
			error("Unsupported wire type: " .. var1385)
		end
	end
	return var752
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
	local var772 = t_38.new()
	
	if self.action_type ~= nil then
		var772.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var772.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var772.action_params = t.ShowToastAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var772.action_params = t.ShowToastAction_Params.jsonDecode(self.actionParams)
	end
	return var772
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
	local var772 = 0
	
	if self.toast_message ~= nil then
		local var773 = self.toast_message:encode()
		local var774, var775 = protoModule.writeTag(buff, var772, 1, protoModule.wireTypes.lengthDelimited)
		var774, var1409 = protoModule.writeBuffer(var774, var775, var773, buffer.len(var773))
		buff = var774
		var772 = var775
	end
	if self.toast_type ~= nil then
		local var776 = self.toast_type:encode()
		local var777, var778 = protoModule.writeTag(buff, var772, 2, protoModule.wireTypes.lengthDelimited)
		var777, var1412 = protoModule.writeBuffer(var777, var778, var776, buffer.len(var776))
		buff = var777
		var772 = var778
	end
	if self.dismiss_prompt ~= nil then
		local var779 = self.dismiss_prompt:encode()
		local var780, var781 = protoModule.writeTag(buff, var772, 3, protoModule.wireTypes.lengthDelimited)
		var780, var1415 = protoModule.writeBuffer(var780, var781, var779, buffer.len(var779))
		buff = var780
		var772 = var781
	end
	if self.prompt_type ~= nil then
		local var782 = self.prompt_type:encode()
		local var783, var784 = protoModule.writeTag(buff, var772, 4, protoModule.wireTypes.lengthDelimited)
		var783, var1418 = protoModule.writeBuffer(var783, var784, var782, buffer.len(var782))
		buff = var783
		var772 = var784
	end
	if self.prompt_id ~= nil then
		local var785 = self.prompt_id:encode()
		local var786, var787 = protoModule.writeTag(buff, var772, 5, protoModule.wireTypes.lengthDelimited)
		var786, var1421 = protoModule.writeBuffer(var786, var787, var785, buffer.len(var785))
		buff = var786
		var772 = var787
	end
	local buff_1 = buffer.create(var772)
	buffer.copy(buff_1, 0, buff, 0, var772)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref), propTypesModule (ref)
	local var772 = t_39.new()
	local var773 = 0
	while var773 < buffer.len(p39) do
		local _ = nil
		local var774 = nil
		local var775, var776, var777 = protoModule.readTag(p39, var773)
		local var778 = var775
		var774 = var776
		var773 = var777
		
		if var774 == protoModule.wireTypes.varint then
			local _ = nil
			local var779, var780 = protoModule.readVarInt(p39, var773)
			local _ = var779
			var773 = var780
			continue
		end
		if var774 == protoModule.wireTypes.lengthDelimited then
			if var778 == 1 then
				local _ = nil
				local var781, var782 = protoModule.readBuffer(p39, var773)
				var773 = var782
				var772.toast_message = propTypesModule.StringProp.decode(var781)
			elseif var778 == 2 then
				local _ = nil
				local var783, var784 = protoModule.readBuffer(p39, var773)
				var773 = var784
				var772.toast_type = propTypesModule.StringProp.decode(var783)
			elseif var778 == 3 then
				local _ = nil
				local var785, var786 = protoModule.readBuffer(p39, var773)
				var773 = var786
				var772.dismiss_prompt = propTypesModule.BoolProp.decode(var785)
			elseif var778 == 4 then
				local _ = nil
				local var787, var788 = protoModule.readBuffer(p39, var773)
				var773 = var788
				var772.prompt_type = propTypesModule.StringProp.decode(var787)
			elseif var778 == 5 then
				local _ = nil
				local var789, var790 = protoModule.readBuffer(p39, var773)
				var773 = var790
				var772.prompt_id = propTypesModule.StringProp.decode(var789)
			else
				local _ = nil
				local var791, var792 = protoModule.readVarInt(p39, var773)
				var773 = var792 + var791
			end
		elseif var774 == protoModule.wireTypes.i32 then
			local _ = nil
			local var793, var794 = protoModule.readFixed32(p39, var773)
			local _ = var793
			var773 = var794
		elseif var774 == protoModule.wireTypes.i64 then
			local _ = nil
			local var795, var796 = protoModule.readFixed64(p39, var773)
			local _ = var795
			var773 = var796
		else
			error("Unsupported wire type: " .. var1425)
		end
	end
	return var772
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
	local var797 = t_39.new()
	
	if self.toast_message ~= nil then
		var797.toast_message = propTypesModule.StringProp.jsonDecode(self.toast_message)
	end
	if self.toastMessage ~= nil then
		var797.toast_message = propTypesModule.StringProp.jsonDecode(self.toastMessage)
	end
	if self.toast_type ~= nil then
		var797.toast_type = propTypesModule.StringProp.jsonDecode(self.toast_type)
	end
	if self.toastType ~= nil then
		var797.toast_type = propTypesModule.StringProp.jsonDecode(self.toastType)
	end
	if self.dismiss_prompt ~= nil then
		var797.dismiss_prompt = propTypesModule.BoolProp.jsonDecode(self.dismiss_prompt)
	end
	if self.dismissPrompt ~= nil then
		var797.dismiss_prompt = propTypesModule.BoolProp.jsonDecode(self.dismissPrompt)
	end
	if self.prompt_type ~= nil then
		var797.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var797.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var797.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var797.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	return var797
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
	local var797 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var798, var799 = protoModule.writeTag(buff, var797, 1, protoModule.wireTypes.varint)
		var798, var1453 = protoModule.writeVarInt(var798, var799, t.ActionType.toNumber(self.action_type))
		buff = var798
		var797 = var799
	end
	if self.action_params ~= nil then
		local var800 = self.action_params:encode()
		local var801, var802 = protoModule.writeTag(buff, var797, 2, protoModule.wireTypes.lengthDelimited)
		var801, var1456 = protoModule.writeBuffer(var801, var802, var800, buffer.len(var800))
		buff = var801
		var797 = var802
	end
	local buff_1 = buffer.create(var797)
	buffer.copy(buff_1, 0, buff, 0, var797)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var797 = t_40.new()
	local var798 = 0
	while var798 < buffer.len(p40) do
		local _ = nil
		local var799 = nil
		local var800, var801, var802 = protoModule.readTag(p40, var798)
		local var803 = var800
		var799 = var801
		var798 = var802
		
		if var799 == protoModule.wireTypes.varint then
			if var803 == 1 then
				local _ = nil
				local var804, var805 = protoModule.readVarIntI32(p40, var798)
				local var806 = var804
				var798 = var805
				var797.action_type = t.ActionType.fromNumber(var806) or var806
			else
				local _ = nil
				local var807, var808 = protoModule.readVarInt(p40, var798)
				local _ = var807
				var798 = var808
			end
		end
		if var799 == protoModule.wireTypes.lengthDelimited then
			if var803 == 2 then
				local _ = nil
				local var809, var810 = protoModule.readBuffer(p40, var798)
				var798 = var810
				var797.action_params = t.OpenPhoneUpsellModalAction_Params.decode(var809)
			else
				local _ = nil
				local var811, var812 = protoModule.readVarInt(p40, var798)
				var798 = var812 + var811
			end
		elseif var799 == protoModule.wireTypes.i32 then
			local _ = nil
			local var813, var814 = protoModule.readFixed32(p40, var798)
			local _ = var813
			var798 = var814
		elseif var799 == protoModule.wireTypes.i64 then
			local _ = nil
			local var815, var816 = protoModule.readFixed64(p40, var798)
			local _ = var815
			var798 = var816
		else
			error("Unsupported wire type: " .. var1460)
		end
	end
	return var797
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
	local var817 = t_40.new()
	
	if self.action_type ~= nil then
		var817.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var817.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var817.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var817.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var817
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
	local var817 = 0
	
	if self.voice_opt_in ~= nil then
		local var818 = self.voice_opt_in:encode()
		local var819, var820 = protoModule.writeTag(buff, var817, 1, protoModule.wireTypes.lengthDelimited)
		var819, var1484 = protoModule.writeBuffer(var819, var820, var818, buffer.len(var818))
		buff = var819
		var817 = var820
	end
	if self.event_context ~= nil then
		local var821 = self.event_context:encode()
		local var822, var823 = protoModule.writeTag(buff, var817, 2, protoModule.wireTypes.lengthDelimited)
		var822, var1487 = protoModule.writeBuffer(var822, var823, var821, buffer.len(var821))
		buff = var822
		var817 = var823
	end
	if self.origin ~= nil then
		local var824 = self.origin:encode()
		local var825, var826 = protoModule.writeTag(buff, var817, 3, protoModule.wireTypes.lengthDelimited)
		var825, var1490 = protoModule.writeBuffer(var825, var826, var824, buffer.len(var824))
		buff = var825
		var817 = var826
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		local var827 = self.should_autofill_android_phone_number_at_launch:encode()
		local var828, var829 = protoModule.writeTag(buff, var817, 4, protoModule.wireTypes.lengthDelimited)
		var828, var1493 = protoModule.writeBuffer(var828, var829, var827, buffer.len(var827))
		buff = var828
		var817 = var829
	end
	if self.add_phone_description_key ~= nil then
		local var830 = self.add_phone_description_key:encode()
		local var831, var832 = protoModule.writeTag(buff, var817, 5, protoModule.wireTypes.lengthDelimited)
		var831, var1496 = protoModule.writeBuffer(var831, var832, var830, buffer.len(var830))
		buff = var831
		var817 = var832
	end
	if self.on_success ~= nil then
		local var833 = self.on_success:encode()
		local var834, var835 = protoModule.writeTag(buff, var817, 6, protoModule.wireTypes.lengthDelimited)
		var834, var1499 = protoModule.writeBuffer(var834, var835, var833, buffer.len(var833))
		buff = var834
		var817 = var835
	end
	if self.on_failure ~= nil then
		local var836 = self.on_failure:encode()
		local var837, var838 = protoModule.writeTag(buff, var817, 7, protoModule.wireTypes.lengthDelimited)
		var837, var1502 = protoModule.writeBuffer(var837, var838, var836, buffer.len(var836))
		buff = var837
		var817 = var838
	end
	if self.on_cancelled ~= nil then
		local var839 = self.on_cancelled:encode()
		local var840, var841 = protoModule.writeTag(buff, var817, 8, protoModule.wireTypes.lengthDelimited)
		var840, var1505 = protoModule.writeBuffer(var840, var841, var839, buffer.len(var839))
		buff = var840
		var817 = var841
	end
	local buff_1 = buffer.create(var817)
	buffer.copy(buff_1, 0, buff, 0, var817)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var817 = t_41.new()
	local var818 = 0
	while var818 < buffer.len(p41) do
		local _ = nil
		local var819 = nil
		local var820, var821, var822 = protoModule.readTag(p41, var818)
		local var823 = var820
		var819 = var821
		var818 = var822
		
		if var819 == protoModule.wireTypes.varint then
			local _ = nil
			local var824, var825 = protoModule.readVarInt(p41, var818)
			local _ = var824
			var818 = var825
			continue
		end
		if var819 == protoModule.wireTypes.lengthDelimited then
			if var823 == 1 then
				local _ = nil
				local var826, var827 = protoModule.readBuffer(p41, var818)
				var818 = var827
				var817.voice_opt_in = propTypesModule.BoolProp.decode(var826)
			elseif var823 == 2 then
				local _ = nil
				local var828, var829 = protoModule.readBuffer(p41, var818)
				var818 = var829
				var817.event_context = propTypesModule.StringProp.decode(var828)
			elseif var823 == 3 then
				local _ = nil
				local var830, var831 = protoModule.readBuffer(p41, var818)
				var818 = var831
				var817.origin = propTypesModule.StringProp.decode(var830)
			elseif var823 == 4 then
				local _ = nil
				local var832, var833 = protoModule.readBuffer(p41, var818)
				var818 = var833
				var817.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.decode(var832)
			elseif var823 == 5 then
				local _ = nil
				local var834, var835 = protoModule.readBuffer(p41, var818)
				var818 = var835
				var817.add_phone_description_key = propTypesModule.StringProp.decode(var834)
			elseif var823 == 6 then
				local _ = nil
				local var836, var837 = protoModule.readBuffer(p41, var818)
				var818 = var837
				var817.on_success = t.ActionProp.decode(var836)
			elseif var823 == 7 then
				local _ = nil
				local var838, var839 = protoModule.readBuffer(p41, var818)
				var818 = var839
				var817.on_failure = t.ActionProp.decode(var838)
			elseif var823 == 8 then
				local _ = nil
				local var840, var841 = protoModule.readBuffer(p41, var818)
				var818 = var841
				var817.on_cancelled = t.ActionProp.decode(var840)
			else
				local _ = nil
				local var842, var843 = protoModule.readVarInt(p41, var818)
				var818 = var843 + var842
			end
		elseif var819 == protoModule.wireTypes.i32 then
			local _ = nil
			local var844, var845 = protoModule.readFixed32(p41, var818)
			local _ = var844
			var818 = var845
		elseif var819 == protoModule.wireTypes.i64 then
			local _ = nil
			local var846, var847 = protoModule.readFixed64(p41, var818)
			local _ = var846
			var818 = var847
		else
			error("Unsupported wire type: " .. var1509)
		end
	end
	return var817
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
	local var848 = t_41.new()
	
	if self.voice_opt_in ~= nil then
		var848.voice_opt_in = propTypesModule.BoolProp.jsonDecode(self.voice_opt_in)
	end
	if self.voiceOptIn ~= nil then
		var848.voice_opt_in = propTypesModule.BoolProp.jsonDecode(self.voiceOptIn)
	end
	if self.event_context ~= nil then
		var848.event_context = propTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		var848.event_context = propTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		var848.origin = propTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		var848.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.jsonDecode(self.should_autofill_android_phone_number_at_launch)
	end
	if self.shouldAutofillAndroidPhoneNumberAtLaunch ~= nil then
		var848.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.jsonDecode(self.shouldAutofillAndroidPhoneNumberAtLaunch)
	end
	if self.add_phone_description_key ~= nil then
		var848.add_phone_description_key = propTypesModule.StringProp.jsonDecode(self.add_phone_description_key)
	end
	if self.addPhoneDescriptionKey ~= nil then
		var848.add_phone_description_key = propTypesModule.StringProp.jsonDecode(self.addPhoneDescriptionKey)
	end
	if self.on_success ~= nil then
		var848.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var848.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var848.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var848.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	if self.on_cancelled ~= nil then
		var848.on_cancelled = t.ActionProp.jsonDecode(self.on_cancelled)
	end
	if self.onCancelled ~= nil then
		var848.on_cancelled = t.ActionProp.jsonDecode(self.onCancelled)
	end
	return var848
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
	local var848 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var849, var850 = protoModule.writeTag(buff, var848, 1, protoModule.wireTypes.varint)
		var849, var1543 = protoModule.writeVarInt(var849, var850, t.ActionType.toNumber(self.action_type))
		buff = var849
		var848 = var850
	end
	if self.action_params ~= nil then
		local var851 = self.action_params:encode()
		local var852, var853 = protoModule.writeTag(buff, var848, 2, protoModule.wireTypes.lengthDelimited)
		var852, var1546 = protoModule.writeBuffer(var852, var853, var851, buffer.len(var851))
		buff = var852
		var848 = var853
	end
	local buff_1 = buffer.create(var848)
	buffer.copy(buff_1, 0, buff, 0, var848)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var848 = t_42.new()
	local var849 = 0
	while var849 < buffer.len(p42) do
		local _ = nil
		local var850 = nil
		local var851, var852, var853 = protoModule.readTag(p42, var849)
		local var854 = var851
		var850 = var852
		var849 = var853
		
		if var850 == protoModule.wireTypes.varint then
			if var854 == 1 then
				local _ = nil
				local var855, var856 = protoModule.readVarIntI32(p42, var849)
				local var857 = var855
				var849 = var856
				var848.action_type = t.ActionType.fromNumber(var857) or var857
			else
				local _ = nil
				local var858, var859 = protoModule.readVarInt(p42, var849)
				local _ = var858
				var849 = var859
			end
		end
		if var850 == protoModule.wireTypes.lengthDelimited then
			if var854 == 2 then
				local _ = nil
				local var860, var861 = protoModule.readBuffer(p42, var849)
				var849 = var861
				var848.action_params = t.OpenEmailUpsellModalAction_Params.decode(var860)
			else
				local _ = nil
				local var862, var863 = protoModule.readVarInt(p42, var849)
				var849 = var863 + var862
			end
		elseif var850 == protoModule.wireTypes.i32 then
			local _ = nil
			local var864, var865 = protoModule.readFixed32(p42, var849)
			local _ = var864
			var849 = var865
		elseif var850 == protoModule.wireTypes.i64 then
			local _ = nil
			local var866, var867 = protoModule.readFixed64(p42, var849)
			local _ = var866
			var849 = var867
		else
			error("Unsupported wire type: " .. var1550)
		end
	end
	return var848
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
	local var868 = t_42.new()
	
	if self.action_type ~= nil then
		var868.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var868.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var868.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var868.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var868
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
	local var868 = 0
	
	if self.add_email_over13_text_key ~= nil then
		local var869 = self.add_email_over13_text_key:encode()
		local var870, var871 = protoModule.writeTag(buff, var868, 1, protoModule.wireTypes.lengthDelimited)
		var870, var1574 = protoModule.writeBuffer(var870, var871, var869, buffer.len(var869))
		buff = var870
		var868 = var871
	end
	if self.add_email_title_key ~= nil then
		local var872 = self.add_email_title_key:encode()
		local var873, var874 = protoModule.writeTag(buff, var868, 2, protoModule.wireTypes.lengthDelimited)
		var873, var1577 = protoModule.writeBuffer(var873, var874, var872, buffer.len(var872))
		buff = var873
		var868 = var874
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		local var875 = self.is_email_modal_called_from_home_page:encode()
		local var876, var877 = protoModule.writeTag(buff, var868, 3, protoModule.wireTypes.lengthDelimited)
		var876, var1580 = protoModule.writeBuffer(var876, var877, var875, buffer.len(var875))
		buff = var876
		var868 = var877
	end
	if self.event_context ~= nil then
		local var878 = self.event_context:encode()
		local var879, var880 = protoModule.writeTag(buff, var868, 4, protoModule.wireTypes.lengthDelimited)
		var879, var1583 = protoModule.writeBuffer(var879, var880, var878, buffer.len(var878))
		buff = var879
		var868 = var880
	end
	if self.origin ~= nil then
		local var881 = self.origin:encode()
		local var882, var883 = protoModule.writeTag(buff, var868, 5, protoModule.wireTypes.lengthDelimited)
		var882, var1586 = protoModule.writeBuffer(var882, var883, var881, buffer.len(var881))
		buff = var882
		var868 = var883
	end
	if self.section ~= nil then
		local var884 = self.section:encode()
		local var885, var886 = protoModule.writeTag(buff, var868, 6, protoModule.wireTypes.lengthDelimited)
		var885, var1589 = protoModule.writeBuffer(var885, var886, var884, buffer.len(var884))
		buff = var885
		var868 = var886
	end
	if self.on_success ~= nil then
		local var887 = self.on_success:encode()
		local var888, var889 = protoModule.writeTag(buff, var868, 7, protoModule.wireTypes.lengthDelimited)
		var888, var1592 = protoModule.writeBuffer(var888, var889, var887, buffer.len(var887))
		buff = var888
		var868 = var889
	end
	if self.on_failure ~= nil then
		local var890 = self.on_failure:encode()
		local var891, var892 = protoModule.writeTag(buff, var868, 8, protoModule.wireTypes.lengthDelimited)
		var891, var1595 = protoModule.writeBuffer(var891, var892, var890, buffer.len(var890))
		buff = var891
		var868 = var892
	end
	local buff_1 = buffer.create(var868)
	buffer.copy(buff_1, 0, buff, 0, var868)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var868 = t_43.new()
	local var869 = 0
	while var869 < buffer.len(p43) do
		local _ = nil
		local var870 = nil
		local var871, var872, var873 = protoModule.readTag(p43, var869)
		local var874 = var871
		var870 = var872
		var869 = var873
		
		if var870 == protoModule.wireTypes.varint then
			local _ = nil
			local var875, var876 = protoModule.readVarInt(p43, var869)
			local _ = var875
			var869 = var876
			continue
		end
		if var870 == protoModule.wireTypes.lengthDelimited then
			if var874 == 1 then
				local _ = nil
				local var877, var878 = protoModule.readBuffer(p43, var869)
				var869 = var878
				var868.add_email_over13_text_key = propTypesModule.StringProp.decode(var877)
			elseif var874 == 2 then
				local _ = nil
				local var879, var880 = protoModule.readBuffer(p43, var869)
				var869 = var880
				var868.add_email_title_key = propTypesModule.StringProp.decode(var879)
			elseif var874 == 3 then
				local _ = nil
				local var881, var882 = protoModule.readBuffer(p43, var869)
				var869 = var882
				var868.is_email_modal_called_from_home_page = propTypesModule.BoolProp.decode(var881)
			elseif var874 == 4 then
				local _ = nil
				local var883, var884 = protoModule.readBuffer(p43, var869)
				var869 = var884
				var868.event_context = propTypesModule.StringProp.decode(var883)
			elseif var874 == 5 then
				local _ = nil
				local var885, var886 = protoModule.readBuffer(p43, var869)
				var869 = var886
				var868.origin = propTypesModule.StringProp.decode(var885)
			elseif var874 == 6 then
				local _ = nil
				local var887, var888 = protoModule.readBuffer(p43, var869)
				var869 = var888
				var868.section = propTypesModule.StringProp.decode(var887)
			elseif var874 == 7 then
				local _ = nil
				local var889, var890 = protoModule.readBuffer(p43, var869)
				var869 = var890
				var868.on_success = t.ActionProp.decode(var889)
			elseif var874 == 8 then
				local _ = nil
				local var891, var892 = protoModule.readBuffer(p43, var869)
				var869 = var892
				var868.on_failure = t.ActionProp.decode(var891)
			else
				local _ = nil
				local var893, var894 = protoModule.readVarInt(p43, var869)
				var869 = var894 + var893
			end
		elseif var870 == protoModule.wireTypes.i32 then
			local _ = nil
			local var895, var896 = protoModule.readFixed32(p43, var869)
			local _ = var895
			var869 = var896
		elseif var870 == protoModule.wireTypes.i64 then
			local _ = nil
			local var897, var898 = protoModule.readFixed64(p43, var869)
			local _ = var897
			var869 = var898
		else
			error("Unsupported wire type: " .. var1599)
		end
	end
	return var868
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
	local var899 = t_43.new()
	
	if self.add_email_over13_text_key ~= nil then
		var899.add_email_over13_text_key = propTypesModule.StringProp.jsonDecode(self.add_email_over13_text_key)
	end
	if self.addEmailOver13TextKey ~= nil then
		var899.add_email_over13_text_key = propTypesModule.StringProp.jsonDecode(self.addEmailOver13TextKey)
	end
	if self.add_email_title_key ~= nil then
		var899.add_email_title_key = propTypesModule.StringProp.jsonDecode(self.add_email_title_key)
	end
	if self.addEmailTitleKey ~= nil then
		var899.add_email_title_key = propTypesModule.StringProp.jsonDecode(self.addEmailTitleKey)
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		var899.is_email_modal_called_from_home_page = propTypesModule.BoolProp.jsonDecode(self.is_email_modal_called_from_home_page)
	end
	if self.isEmailModalCalledFromHomePage ~= nil then
		var899.is_email_modal_called_from_home_page = propTypesModule.BoolProp.jsonDecode(self.isEmailModalCalledFromHomePage)
	end
	if self.event_context ~= nil then
		var899.event_context = propTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		var899.event_context = propTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		var899.origin = propTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.section ~= nil then
		var899.section = propTypesModule.StringProp.jsonDecode(self.section)
	end
	if self.on_success ~= nil then
		var899.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var899.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var899.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var899.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	return var899
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
	local var899 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var900, var901 = protoModule.writeTag(buff, var899, 1, protoModule.wireTypes.varint)
		var900, var1633 = protoModule.writeVarInt(var900, var901, t.ActionType.toNumber(self.action_type))
		buff = var900
		var899 = var901
	end
	if self.action_params ~= nil then
		local var902 = self.action_params:encode()
		local var903, var904 = protoModule.writeTag(buff, var899, 2, protoModule.wireTypes.lengthDelimited)
		var903, var1636 = protoModule.writeBuffer(var903, var904, var902, buffer.len(var902))
		buff = var903
		var899 = var904
	end
	local buff_1 = buffer.create(var899)
	buffer.copy(buff_1, 0, buff, 0, var899)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref), t (ref)
	local var899 = t_44.new()
	local var900 = 0
	while var900 < buffer.len(p44) do
		local _ = nil
		local var901 = nil
		local var902, var903, var904 = protoModule.readTag(p44, var900)
		local var905 = var902
		var901 = var903
		var900 = var904
		
		if var901 == protoModule.wireTypes.varint then
			if var905 == 1 then
				local _ = nil
				local var906, var907 = protoModule.readVarIntI32(p44, var900)
				local var908 = var906
				var900 = var907
				var899.action_type = t.ActionType.fromNumber(var908) or var908
			else
				local _ = nil
				local var909, var910 = protoModule.readVarInt(p44, var900)
				local _ = var909
				var900 = var910
			end
		end
		if var901 == protoModule.wireTypes.lengthDelimited then
			if var905 == 2 then
				local _ = nil
				local var911, var912 = protoModule.readBuffer(p44, var900)
				var900 = var912
				var899.action_params = t.OpenAddConnectionsPageAction_Params.decode(var911)
			else
				local _ = nil
				local var913, var914 = protoModule.readVarInt(p44, var900)
				var900 = var914 + var913
			end
		elseif var901 == protoModule.wireTypes.i32 then
			local _ = nil
			local var915, var916 = protoModule.readFixed32(p44, var900)
			local _ = var915
			var900 = var916
		elseif var901 == protoModule.wireTypes.i64 then
			local _ = nil
			local var917, var918 = protoModule.readFixed64(p44, var900)
			local _ = var917
			var900 = var918
		else
			error("Unsupported wire type: " .. var1640)
		end
	end
	return var899
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
	local var919 = t_44.new()
	
	if self.action_type ~= nil then
		var919.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var919.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var919.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var919.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.actionParams)
	end
	return var919
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
	local var919 = 0
	
	if self.user_id ~= nil then
		local var920 = self.user_id:encode()
		local var921, var922 = protoModule.writeTag(buff, var919, 1, protoModule.wireTypes.lengthDelimited)
		var921, var1664 = protoModule.writeBuffer(var921, var922, var920, buffer.len(var920))
		buff = var921
		var919 = var922
	end
	if self.source ~= nil then
		local var923 = self.source:encode()
		local var924, var925 = protoModule.writeTag(buff, var919, 2, protoModule.wireTypes.lengthDelimited)
		var924, var1667 = protoModule.writeBuffer(var924, var925, var923, buffer.len(var923))
		buff = var924
		var919 = var925
	end
	local buff_1 = buffer.create(var919)
	buffer.copy(buff_1, 0, buff, 0, var919)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref), propTypesModule (ref)
	local var919 = t_45.new()
	local var920 = 0
	while var920 < buffer.len(p45) do
		local _ = nil
		local var921 = nil
		local var922, var923, var924 = protoModule.readTag(p45, var920)
		local var925 = var922
		var921 = var923
		var920 = var924
		
		if var921 == protoModule.wireTypes.varint then
			local _ = nil
			local var926, var927 = protoModule.readVarInt(p45, var920)
			local _ = var926
			var920 = var927
			continue
		end
		if var921 == protoModule.wireTypes.lengthDelimited then
			if var925 == 1 then
				local _ = nil
				local var928, var929 = protoModule.readBuffer(p45, var920)
				var920 = var929
				var919.user_id = propTypesModule.StringProp.decode(var928)
			elseif var925 == 2 then
				local _ = nil
				local var930, var931 = protoModule.readBuffer(p45, var920)
				var920 = var931
				var919.source = propTypesModule.StringProp.decode(var930)
			else
				local _ = nil
				local var932, var933 = protoModule.readVarInt(p45, var920)
				var920 = var933 + var932
			end
		elseif var921 == protoModule.wireTypes.i32 then
			local _ = nil
			local var934, var935 = protoModule.readFixed32(p45, var920)
			local _ = var934
			var920 = var935
		elseif var921 == protoModule.wireTypes.i64 then
			local _ = nil
			local var936, var937 = protoModule.readFixed64(p45, var920)
			local _ = var936
			var920 = var937
		else
			error("Unsupported wire type: " .. var1671)
		end
	end
	return var919
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
	local var938 = t_45.new()
	
	if self.user_id ~= nil then
		var938.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var938.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var938.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var938
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
	local var938 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var939, var940 = protoModule.writeTag(buff, var938, 1, protoModule.wireTypes.varint)
		var939, var1693 = protoModule.writeVarInt(var939, var940, t.ActionType.toNumber(self.action_type))
		buff = var939
		var938 = var940
	end
	if self.action_params ~= nil then
		local var941 = self.action_params:encode()
		local var942, var943 = protoModule.writeTag(buff, var938, 2, protoModule.wireTypes.lengthDelimited)
		var942, var1696 = protoModule.writeBuffer(var942, var943, var941, buffer.len(var941))
		buff = var942
		var938 = var943
	end
	local buff_1 = buffer.create(var938)
	buffer.copy(buff_1, 0, buff, 0, var938)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var938 = t_46.new()
	local var939 = 0
	while var939 < buffer.len(p46) do
		local _ = nil
		local var940 = nil
		local var941, var942, var943 = protoModule.readTag(p46, var939)
		local var944 = var941
		var940 = var942
		var939 = var943
		
		if var940 == protoModule.wireTypes.varint then
			if var944 == 1 then
				local _ = nil
				local var945, var946 = protoModule.readVarIntI32(p46, var939)
				local var947 = var945
				var939 = var946
				var938.action_type = t.ActionType.fromNumber(var947) or var947
			else
				local _ = nil
				local var948, var949 = protoModule.readVarInt(p46, var939)
				local _ = var948
				var939 = var949
			end
		end
		if var940 == protoModule.wireTypes.lengthDelimited then
			if var944 == 2 then
				local _ = nil
				local var950, var951 = protoModule.readBuffer(p46, var939)
				var939 = var951
				var938.action_params = t.OpenMarketplaceAction_Params.decode(var950)
			else
				local _ = nil
				local var952, var953 = protoModule.readVarInt(p46, var939)
				var939 = var953 + var952
			end
		elseif var940 == protoModule.wireTypes.i32 then
			local _ = nil
			local var954, var955 = protoModule.readFixed32(p46, var939)
			local _ = var954
			var939 = var955
		elseif var940 == protoModule.wireTypes.i64 then
			local _ = nil
			local var956, var957 = protoModule.readFixed64(p46, var939)
			local _ = var956
			var939 = var957
		else
			error("Unsupported wire type: " .. var1700)
		end
	end
	return var938
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
	local var958 = t_46.new()
	
	if self.action_type ~= nil then
		var958.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var958.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var958.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var958.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.actionParams)
	end
	return var958
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
	local var958 = 0
	
	if self.user_id ~= nil then
		local var959 = self.user_id:encode()
		local var960, var961 = protoModule.writeTag(buff, var958, 1, protoModule.wireTypes.lengthDelimited)
		var960, var1724 = protoModule.writeBuffer(var960, var961, var959, buffer.len(var959))
		buff = var960
		var958 = var961
	end
	if self.source ~= nil then
		local var962 = self.source:encode()
		local var963, var964 = protoModule.writeTag(buff, var958, 2, protoModule.wireTypes.lengthDelimited)
		var963, var1727 = protoModule.writeBuffer(var963, var964, var962, buffer.len(var962))
		buff = var963
		var958 = var964
	end
	local buff_1 = buffer.create(var958)
	buffer.copy(buff_1, 0, buff, 0, var958)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref), propTypesModule (ref)
	local var958 = t_47.new()
	local var959 = 0
	while var959 < buffer.len(p47) do
		local _ = nil
		local var960 = nil
		local var961, var962, var963 = protoModule.readTag(p47, var959)
		local var964 = var961
		var960 = var962
		var959 = var963
		
		if var960 == protoModule.wireTypes.varint then
			local _ = nil
			local var965, var966 = protoModule.readVarInt(p47, var959)
			local _ = var965
			var959 = var966
			continue
		end
		if var960 == protoModule.wireTypes.lengthDelimited then
			if var964 == 1 then
				local _ = nil
				local var967, var968 = protoModule.readBuffer(p47, var959)
				var959 = var968
				var958.user_id = propTypesModule.StringProp.decode(var967)
			elseif var964 == 2 then
				local _ = nil
				local var969, var970 = protoModule.readBuffer(p47, var959)
				var959 = var970
				var958.source = propTypesModule.StringProp.decode(var969)
			else
				local _ = nil
				local var971, var972 = protoModule.readVarInt(p47, var959)
				var959 = var972 + var971
			end
		elseif var960 == protoModule.wireTypes.i32 then
			local _ = nil
			local var973, var974 = protoModule.readFixed32(p47, var959)
			local _ = var973
			var959 = var974
		elseif var960 == protoModule.wireTypes.i64 then
			local _ = nil
			local var975, var976 = protoModule.readFixed64(p47, var959)
			local _ = var975
			var959 = var976
		else
			error("Unsupported wire type: " .. var1731)
		end
	end
	return var958
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
	local var977 = t_47.new()
	
	if self.user_id ~= nil then
		var977.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var977.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var977.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var977
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
	local var977 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var978, var979 = protoModule.writeTag(buff, var977, 1, protoModule.wireTypes.varint)
		var978, var1753 = protoModule.writeVarInt(var978, var979, t.ActionType.toNumber(self.action_type))
		buff = var978
		var977 = var979
	end
	if self.action_params ~= nil then
		local var980 = self.action_params:encode()
		local var981, var982 = protoModule.writeTag(buff, var977, 2, protoModule.wireTypes.lengthDelimited)
		var981, var1756 = protoModule.writeBuffer(var981, var982, var980, buffer.len(var980))
		buff = var981
		var977 = var982
	end
	local buff_1 = buffer.create(var977)
	buffer.copy(buff_1, 0, buff, 0, var977)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref), t (ref)
	local var977 = t_48.new()
	local var978 = 0
	while var978 < buffer.len(p48) do
		local _ = nil
		local var979 = nil
		local var980, var981, var982 = protoModule.readTag(p48, var978)
		local var983 = var980
		var979 = var981
		var978 = var982
		
		if var979 == protoModule.wireTypes.varint then
			if var983 == 1 then
				local _ = nil
				local var984, var985 = protoModule.readVarIntI32(p48, var978)
				local var986 = var984
				var978 = var985
				var977.action_type = t.ActionType.fromNumber(var986) or var986
			else
				local _ = nil
				local var987, var988 = protoModule.readVarInt(p48, var978)
				local _ = var987
				var978 = var988
			end
		end
		if var979 == protoModule.wireTypes.lengthDelimited then
			if var983 == 2 then
				local _ = nil
				local var989, var990 = protoModule.readBuffer(p48, var978)
				var978 = var990
				var977.action_params = t.HideProfileCompletionAction_Params.decode(var989)
			else
				local _ = nil
				local var991, var992 = protoModule.readVarInt(p48, var978)
				var978 = var992 + var991
			end
		elseif var979 == protoModule.wireTypes.i32 then
			local _ = nil
			local var993, var994 = protoModule.readFixed32(p48, var978)
			local _ = var993
			var978 = var994
		elseif var979 == protoModule.wireTypes.i64 then
			local _ = nil
			local var995, var996 = protoModule.readFixed64(p48, var978)
			local _ = var995
			var978 = var996
		else
			error("Unsupported wire type: " .. var1760)
		end
	end
	return var977
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
	local var997 = t_48.new()
	
	if self.action_type ~= nil then
		var997.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var997.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var997.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var997.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.actionParams)
	end
	return var997
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
	local var997 = 0
	
	if self.user_id ~= nil then
		local var998 = self.user_id:encode()
		local var999, var1000 = protoModule.writeTag(buff, var997, 1, protoModule.wireTypes.lengthDelimited)
		var999, var1784 = protoModule.writeBuffer(var999, var1000, var998, buffer.len(var998))
		buff = var999
		var997 = var1000
	end
	if self.prompt_id ~= nil then
		local var1001 = self.prompt_id:encode()
		local var1002, var1003 = protoModule.writeTag(buff, var997, 2, protoModule.wireTypes.lengthDelimited)
		var1002, var1787 = protoModule.writeBuffer(var1002, var1003, var1001, buffer.len(var1001))
		buff = var1002
		var997 = var1003
	end
	if self.source ~= nil then
		local var1004 = self.source:encode()
		local var1005, var1006 = protoModule.writeTag(buff, var997, 3, protoModule.wireTypes.lengthDelimited)
		var1005, var1790 = protoModule.writeBuffer(var1005, var1006, var1004, buffer.len(var1004))
		buff = var1005
		var997 = var1006
	end
	if self.prompt_type ~= nil then
		local var1007 = self.prompt_type:encode()
		local var1008, var1009 = protoModule.writeTag(buff, var997, 4, protoModule.wireTypes.lengthDelimited)
		var1008, var1793 = protoModule.writeBuffer(var1008, var1009, var1007, buffer.len(var1007))
		buff = var1008
		var997 = var1009
	end
	local buff_1 = buffer.create(var997)
	buffer.copy(buff_1, 0, buff, 0, var997)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref), propTypesModule (ref)
	local var997 = t_49.new()
	local var998 = 0
	while var998 < buffer.len(p49) do
		local _ = nil
		local var999 = nil
		local var1000, var1001, var1002 = protoModule.readTag(p49, var998)
		local var1003 = var1000
		var999 = var1001
		var998 = var1002
		
		if var999 == protoModule.wireTypes.varint then
			local _ = nil
			local var1004, var1005 = protoModule.readVarInt(p49, var998)
			local _ = var1004
			var998 = var1005
			continue
		end
		if var999 == protoModule.wireTypes.lengthDelimited then
			if var1003 == 1 then
				local _ = nil
				local var1006, var1007 = protoModule.readBuffer(p49, var998)
				var998 = var1007
				var997.user_id = propTypesModule.StringProp.decode(var1006)
			elseif var1003 == 2 then
				local _ = nil
				local var1008, var1009 = protoModule.readBuffer(p49, var998)
				var998 = var1009
				var997.prompt_id = propTypesModule.StringProp.decode(var1008)
			elseif var1003 == 3 then
				local _ = nil
				local var1010, var1011 = protoModule.readBuffer(p49, var998)
				var998 = var1011
				var997.source = propTypesModule.StringProp.decode(var1010)
			elseif var1003 == 4 then
				local _ = nil
				local var1012, var1013 = protoModule.readBuffer(p49, var998)
				var998 = var1013
				var997.prompt_type = propTypesModule.StringProp.decode(var1012)
			else
				local _ = nil
				local var1014, var1015 = protoModule.readVarInt(p49, var998)
				var998 = var1015 + var1014
			end
		elseif var999 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1016, var1017 = protoModule.readFixed32(p49, var998)
			local _ = var1016
			var998 = var1017
		elseif var999 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1018, var1019 = protoModule.readFixed64(p49, var998)
			local _ = var1018
			var998 = var1019
		else
			error("Unsupported wire type: " .. var1797)
		end
	end
	return var997
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
	local var1020 = t_49.new()
	
	if self.user_id ~= nil then
		var1020.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1020.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.prompt_id ~= nil then
		var1020.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1020.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.source ~= nil then
		var1020.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.prompt_type ~= nil then
		var1020.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1020.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	return var1020
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
	local var1020 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1021, var1022 = protoModule.writeTag(buff, var1020, 1, protoModule.wireTypes.varint)
		var1021, var1823 = protoModule.writeVarInt(var1021, var1022, t.ActionType.toNumber(self.action_type))
		buff = var1021
		var1020 = var1022
	end
	if self.action_params ~= nil then
		local var1023 = self.action_params:encode()
		local var1024, var1025 = protoModule.writeTag(buff, var1020, 2, protoModule.wireTypes.lengthDelimited)
		var1024, var1826 = protoModule.writeBuffer(var1024, var1025, var1023, buffer.len(var1023))
		buff = var1024
		var1020 = var1025
	end
	local buff_1 = buffer.create(var1020)
	buffer.copy(buff_1, 0, buff, 0, var1020)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var1020 = t_50.new()
	local var1021 = 0
	while var1021 < buffer.len(p50) do
		local _ = nil
		local var1022 = nil
		local var1023, var1024, var1025 = protoModule.readTag(p50, var1021)
		local var1026 = var1023
		var1022 = var1024
		var1021 = var1025
		
		if var1022 == protoModule.wireTypes.varint then
			if var1026 == 1 then
				local _ = nil
				local var1027, var1028 = protoModule.readVarIntI32(p50, var1021)
				local var1029 = var1027
				var1021 = var1028
				var1020.action_type = t.ActionType.fromNumber(var1029) or var1029
			else
				local _ = nil
				local var1030, var1031 = protoModule.readVarInt(p50, var1021)
				local _ = var1030
				var1021 = var1031
			end
		end
		if var1022 == protoModule.wireTypes.lengthDelimited then
			if var1026 == 2 then
				local _ = nil
				local var1032, var1033 = protoModule.readBuffer(p50, var1021)
				var1021 = var1033
				var1020.action_params = t.SelectMarketplaceCatalogCategory_Params.decode(var1032)
			else
				local _ = nil
				local var1034, var1035 = protoModule.readVarInt(p50, var1021)
				var1021 = var1035 + var1034
			end
		elseif var1022 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1036, var1037 = protoModule.readFixed32(p50, var1021)
			local _ = var1036
			var1021 = var1037
		elseif var1022 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1038, var1039 = protoModule.readFixed64(p50, var1021)
			local _ = var1038
			var1021 = var1039
		else
			error("Unsupported wire type: " .. var1830)
		end
	end
	return var1020
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
	local var1040 = t_50.new()
	
	if self.action_type ~= nil then
		var1040.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1040.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1040.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1040.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.actionParams)
	end
	return var1040
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
	local var1040 = 0
	
	if self.category_id ~= nil then
		local var1041 = self.category_id:encode()
		local var1042, var1043 = protoModule.writeTag(buff, var1040, 1, protoModule.wireTypes.lengthDelimited)
		var1042, var1854 = protoModule.writeBuffer(var1042, var1043, var1041, buffer.len(var1041))
		buff = var1042
		var1040 = var1043
	end
	local buff_1 = buffer.create(var1040)
	buffer.copy(buff_1, 0, buff, 0, var1040)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref), propTypesModule (ref)
	local var1040 = t_51.new()
	local var1041 = 0
	while var1041 < buffer.len(p51) do
		local _ = nil
		local var1042 = nil
		local var1043, var1044, var1045 = protoModule.readTag(p51, var1041)
		local var1046 = var1043
		var1042 = var1044
		var1041 = var1045
		
		if var1042 == protoModule.wireTypes.varint then
			local _ = nil
			local var1047, var1048 = protoModule.readVarInt(p51, var1041)
			local _ = var1047
			var1041 = var1048
			continue
		end
		if var1042 == protoModule.wireTypes.lengthDelimited then
			if var1046 == 1 then
				local _ = nil
				local var1049, var1050 = protoModule.readBuffer(p51, var1041)
				var1041 = var1050
				var1040.category_id = propTypesModule.StringProp.decode(var1049)
			else
				local _ = nil
				local var1051, var1052 = protoModule.readVarInt(p51, var1041)
				var1041 = var1052 + var1051
			end
		elseif var1042 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1053, var1054 = protoModule.readFixed32(p51, var1041)
			local _ = var1053
			var1041 = var1054
		elseif var1042 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1055, var1056 = protoModule.readFixed64(p51, var1041)
			local _ = var1055
			var1041 = var1056
		else
			error("Unsupported wire type: " .. var1858)
		end
	end
	return var1040
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
	local var1057 = t_51.new()
	
	if self.category_id ~= nil then
		var1057.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var1057.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	return var1057
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
	local var1057 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1058, var1059 = protoModule.writeTag(buff, var1057, 1, protoModule.wireTypes.varint)
		var1058, var1878 = protoModule.writeVarInt(var1058, var1059, t.ActionType.toNumber(self.action_type))
		buff = var1058
		var1057 = var1059
	end
	if self.action_params ~= nil then
		local var1060 = self.action_params:encode()
		local var1061, var1062 = protoModule.writeTag(buff, var1057, 2, protoModule.wireTypes.lengthDelimited)
		var1061, var1881 = protoModule.writeBuffer(var1061, var1062, var1060, buffer.len(var1060))
		buff = var1061
		var1057 = var1062
	end
	local buff_1 = buffer.create(var1057)
	buffer.copy(buff_1, 0, buff, 0, var1057)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1057 = t_52.new()
	local var1058 = 0
	while var1058 < buffer.len(p52) do
		local _ = nil
		local var1059 = nil
		local var1060, var1061, var1062 = protoModule.readTag(p52, var1058)
		local var1063 = var1060
		var1059 = var1061
		var1058 = var1062
		
		if var1059 == protoModule.wireTypes.varint then
			if var1063 == 1 then
				local _ = nil
				local var1064, var1065 = protoModule.readVarIntI32(p52, var1058)
				local var1066 = var1064
				var1058 = var1065
				var1057.action_type = t.ActionType.fromNumber(var1066) or var1066
			else
				local _ = nil
				local var1067, var1068 = protoModule.readVarInt(p52, var1058)
				local _ = var1067
				var1058 = var1068
			end
		end
		if var1059 == protoModule.wireTypes.lengthDelimited then
			if var1063 == 2 then
				local _ = nil
				local var1069, var1070 = protoModule.readBuffer(p52, var1058)
				var1058 = var1070
				var1057.action_params = t.SelectMarketplaceCatalogSubcategory_Params.decode(var1069)
			else
				local _ = nil
				local var1071, var1072 = protoModule.readVarInt(p52, var1058)
				var1058 = var1072 + var1071
			end
		elseif var1059 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1073, var1074 = protoModule.readFixed32(p52, var1058)
			local _ = var1073
			var1058 = var1074
		elseif var1059 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1075, var1076 = protoModule.readFixed64(p52, var1058)
			local _ = var1075
			var1058 = var1076
		else
			error("Unsupported wire type: " .. var1885)
		end
	end
	return var1057
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
	local var1077 = t_52.new()
	
	if self.action_type ~= nil then
		var1077.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1077.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1077.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1077.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.actionParams)
	end
	return var1077
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
	local var1077 = 0
	
	if self.subcategory_id ~= nil then
		local var1078 = self.subcategory_id:encode()
		local var1079, var1080 = protoModule.writeTag(buff, var1077, 1, protoModule.wireTypes.lengthDelimited)
		var1079, var1909 = protoModule.writeBuffer(var1079, var1080, var1078, buffer.len(var1078))
		buff = var1079
		var1077 = var1080
	end
	local buff_1 = buffer.create(var1077)
	buffer.copy(buff_1, 0, buff, 0, var1077)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref), propTypesModule (ref)
	local var1077 = t_53.new()
	local var1078 = 0
	while var1078 < buffer.len(p53) do
		local _ = nil
		local var1079 = nil
		local var1080, var1081, var1082 = protoModule.readTag(p53, var1078)
		local var1083 = var1080
		var1079 = var1081
		var1078 = var1082
		
		if var1079 == protoModule.wireTypes.varint then
			local _ = nil
			local var1084, var1085 = protoModule.readVarInt(p53, var1078)
			local _ = var1084
			var1078 = var1085
			continue
		end
		if var1079 == protoModule.wireTypes.lengthDelimited then
			if var1083 == 1 then
				local _ = nil
				local var1086, var1087 = protoModule.readBuffer(p53, var1078)
				var1078 = var1087
				var1077.subcategory_id = propTypesModule.StringProp.decode(var1086)
			else
				local _ = nil
				local var1088, var1089 = protoModule.readVarInt(p53, var1078)
				var1078 = var1089 + var1088
			end
		elseif var1079 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1090, var1091 = protoModule.readFixed32(p53, var1078)
			local _ = var1090
			var1078 = var1091
		elseif var1079 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1092, var1093 = protoModule.readFixed64(p53, var1078)
			local _ = var1092
			var1078 = var1093
		else
			error("Unsupported wire type: " .. var1913)
		end
	end
	return var1077
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
	local var1094 = t_53.new()
	
	if self.subcategory_id ~= nil then
		var1094.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var1094.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	return var1094
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
	local var1094 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1095, var1096 = protoModule.writeTag(buff, var1094, 1, protoModule.wireTypes.varint)
		var1095, var1933 = protoModule.writeVarInt(var1095, var1096, t.ActionType.toNumber(self.action_type))
		buff = var1095
		var1094 = var1096
	end
	if self.action_params ~= nil then
		local var1097 = self.action_params:encode()
		local var1098, var1099 = protoModule.writeTag(buff, var1094, 2, protoModule.wireTypes.lengthDelimited)
		var1098, var1936 = protoModule.writeBuffer(var1098, var1099, var1097, buffer.len(var1097))
		buff = var1098
		var1094 = var1099
	end
	local buff_1 = buffer.create(var1094)
	buffer.copy(buff_1, 0, buff, 0, var1094)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref), t (ref)
	local var1094 = t_54.new()
	local var1095 = 0
	while var1095 < buffer.len(p54) do
		local _ = nil
		local var1096 = nil
		local var1097, var1098, var1099 = protoModule.readTag(p54, var1095)
		local var1100 = var1097
		var1096 = var1098
		var1095 = var1099
		
		if var1096 == protoModule.wireTypes.varint then
			if var1100 == 1 then
				local _ = nil
				local var1101, var1102 = protoModule.readVarIntI32(p54, var1095)
				local var1103 = var1101
				var1095 = var1102
				var1094.action_type = t.ActionType.fromNumber(var1103) or var1103
			else
				local _ = nil
				local var1104, var1105 = protoModule.readVarInt(p54, var1095)
				local _ = var1104
				var1095 = var1105
			end
		end
		if var1096 == protoModule.wireTypes.lengthDelimited then
			if var1100 == 2 then
				local _ = nil
				local var1106, var1107 = protoModule.readBuffer(p54, var1095)
				var1095 = var1107
				var1094.action_params = t.OpenMarketplaceCatalogSeeAll_Params.decode(var1106)
			else
				local _ = nil
				local var1108, var1109 = protoModule.readVarInt(p54, var1095)
				var1095 = var1109 + var1108
			end
		elseif var1096 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1110, var1111 = protoModule.readFixed32(p54, var1095)
			local _ = var1110
			var1095 = var1111
		elseif var1096 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1112, var1113 = protoModule.readFixed64(p54, var1095)
			local _ = var1112
			var1095 = var1113
		else
			error("Unsupported wire type: " .. var1940)
		end
	end
	return var1094
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
	local var1114 = t_54.new()
	
	if self.action_type ~= nil then
		var1114.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1114.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1114.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1114.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.actionParams)
	end
	return var1114
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
	local var1114 = 0
	
	if self.sort_id ~= nil then
		local var1115 = self.sort_id:encode()
		local var1116, var1117 = protoModule.writeTag(buff, var1114, 1, protoModule.wireTypes.lengthDelimited)
		var1116, var1964 = protoModule.writeBuffer(var1116, var1117, var1115, buffer.len(var1115))
		buff = var1116
		var1114 = var1117
	end
	if self.title ~= nil then
		local var1118 = self.title:encode()
		local var1119, var1120 = protoModule.writeTag(buff, var1114, 2, protoModule.wireTypes.lengthDelimited)
		var1119, var1967 = protoModule.writeBuffer(var1119, var1120, var1118, buffer.len(var1118))
		buff = var1119
		var1114 = var1120
	end
	if self.description ~= nil then
		local var1121 = self.description:encode()
		local var1122, var1123 = protoModule.writeTag(buff, var1114, 3, protoModule.wireTypes.lengthDelimited)
		var1122, var1970 = protoModule.writeBuffer(var1122, var1123, var1121, buffer.len(var1121))
		buff = var1122
		var1114 = var1123
	end
	if self.tooltip_text ~= nil then
		local var1124 = self.tooltip_text:encode()
		local var1125, var1126 = protoModule.writeTag(buff, var1114, 4, protoModule.wireTypes.lengthDelimited)
		var1125, var1973 = protoModule.writeBuffer(var1125, var1126, var1124, buffer.len(var1124))
		buff = var1125
		var1114 = var1126
	end
	local buff_1 = buffer.create(var1114)
	buffer.copy(buff_1, 0, buff, 0, var1114)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref), propTypesModule (ref)
	local var1114 = t_55.new()
	local var1115 = 0
	while var1115 < buffer.len(p55) do
		local _ = nil
		local var1116 = nil
		local var1117, var1118, var1119 = protoModule.readTag(p55, var1115)
		local var1120 = var1117
		var1116 = var1118
		var1115 = var1119
		
		if var1116 == protoModule.wireTypes.varint then
			local _ = nil
			local var1121, var1122 = protoModule.readVarInt(p55, var1115)
			local _ = var1121
			var1115 = var1122
			continue
		end
		if var1116 == protoModule.wireTypes.lengthDelimited then
			if var1120 == 1 then
				local _ = nil
				local var1123, var1124 = protoModule.readBuffer(p55, var1115)
				var1115 = var1124
				var1114.sort_id = propTypesModule.StringProp.decode(var1123)
			elseif var1120 == 2 then
				local _ = nil
				local var1125, var1126 = protoModule.readBuffer(p55, var1115)
				var1115 = var1126
				var1114.title = propTypesModule.StringProp.decode(var1125)
			elseif var1120 == 3 then
				local _ = nil
				local var1127, var1128 = protoModule.readBuffer(p55, var1115)
				var1115 = var1128
				var1114.description = propTypesModule.StringProp.decode(var1127)
			elseif var1120 == 4 then
				local _ = nil
				local var1129, var1130 = protoModule.readBuffer(p55, var1115)
				var1115 = var1130
				var1114.tooltip_text = propTypesModule.StringProp.decode(var1129)
			else
				local _ = nil
				local var1131, var1132 = protoModule.readVarInt(p55, var1115)
				var1115 = var1132 + var1131
			end
		elseif var1116 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1133, var1134 = protoModule.readFixed32(p55, var1115)
			local _ = var1133
			var1115 = var1134
		elseif var1116 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1135, var1136 = protoModule.readFixed64(p55, var1115)
			local _ = var1135
			var1115 = var1136
		else
			error("Unsupported wire type: " .. var1977)
		end
	end
	return var1114
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
	local var1137 = t_55.new()
	
	if self.sort_id ~= nil then
		var1137.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var1137.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.title ~= nil then
		var1137.title = propTypesModule.StringProp.jsonDecode(self.title)
	end
	if self.description ~= nil then
		var1137.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.tooltip_text ~= nil then
		var1137.tooltip_text = propTypesModule.StringProp.jsonDecode(self.tooltip_text)
	end
	if self.tooltipText ~= nil then
		var1137.tooltip_text = propTypesModule.StringProp.jsonDecode(self.tooltipText)
	end
	return var1137
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
	local var1137 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1138, var1139 = protoModule.writeTag(buff, var1137, 1, protoModule.wireTypes.varint)
		var1138, var2003 = protoModule.writeVarInt(var1138, var1139, t.ActionType.toNumber(self.action_type))
		buff = var1138
		var1137 = var1139
	end
	if self.action_params ~= nil then
		local var1140 = self.action_params:encode()
		local var1141, var1142 = protoModule.writeTag(buff, var1137, 2, protoModule.wireTypes.lengthDelimited)
		var1141, var2006 = protoModule.writeBuffer(var1141, var1142, var1140, buffer.len(var1140))
		buff = var1141
		var1137 = var1142
	end
	local buff_1 = buffer.create(var1137)
	buffer.copy(buff_1, 0, buff, 0, var1137)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref), t (ref)
	local var1137 = t_56.new()
	local var1138 = 0
	while var1138 < buffer.len(p56) do
		local _ = nil
		local var1139 = nil
		local var1140, var1141, var1142 = protoModule.readTag(p56, var1138)
		local var1143 = var1140
		var1139 = var1141
		var1138 = var1142
		
		if var1139 == protoModule.wireTypes.varint then
			if var1143 == 1 then
				local _ = nil
				local var1144, var1145 = protoModule.readVarIntI32(p56, var1138)
				local var1146 = var1144
				var1138 = var1145
				var1137.action_type = t.ActionType.fromNumber(var1146) or var1146
			else
				local _ = nil
				local var1147, var1148 = protoModule.readVarInt(p56, var1138)
				local _ = var1147
				var1138 = var1148
			end
		end
		if var1139 == protoModule.wireTypes.lengthDelimited then
			if var1143 == 2 then
				local _ = nil
				local var1149, var1150 = protoModule.readBuffer(p56, var1138)
				var1138 = var1150
				var1137.action_params = t.CloseMarketplaceCategoryTooltip_Params.decode(var1149)
			else
				local _ = nil
				local var1151, var1152 = protoModule.readVarInt(p56, var1138)
				var1138 = var1152 + var1151
			end
		elseif var1139 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1153, var1154 = protoModule.readFixed32(p56, var1138)
			local _ = var1153
			var1138 = var1154
		elseif var1139 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1155, var1156 = protoModule.readFixed64(p56, var1138)
			local _ = var1155
			var1138 = var1156
		else
			error("Unsupported wire type: " .. var2010)
		end
	end
	return var1137
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
	local var1157 = t_56.new()
	
	if self.action_type ~= nil then
		var1157.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1157.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1157.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1157.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.actionParams)
	end
	return var1157
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
	local var1157 = 0
	
	if self.tooltip_id ~= nil then
		local var1158 = self.tooltip_id:encode()
		local var1159, var1160 = protoModule.writeTag(buff, var1157, 1, protoModule.wireTypes.lengthDelimited)
		var1159, var2034 = protoModule.writeBuffer(var1159, var1160, var1158, buffer.len(var1158))
		buff = var1159
		var1157 = var1160
	end
	local buff_1 = buffer.create(var1157)
	buffer.copy(buff_1, 0, buff, 0, var1157)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref), propTypesModule (ref)
	local var1157 = t_57.new()
	local var1158 = 0
	while var1158 < buffer.len(p57) do
		local _ = nil
		local var1159 = nil
		local var1160, var1161, var1162 = protoModule.readTag(p57, var1158)
		local var1163 = var1160
		var1159 = var1161
		var1158 = var1162
		
		if var1159 == protoModule.wireTypes.varint then
			local _ = nil
			local var1164, var1165 = protoModule.readVarInt(p57, var1158)
			local _ = var1164
			var1158 = var1165
			continue
		end
		if var1159 == protoModule.wireTypes.lengthDelimited then
			if var1163 == 1 then
				local _ = nil
				local var1166, var1167 = protoModule.readBuffer(p57, var1158)
				var1158 = var1167
				var1157.tooltip_id = propTypesModule.StringProp.decode(var1166)
			else
				local _ = nil
				local var1168, var1169 = protoModule.readVarInt(p57, var1158)
				var1158 = var1169 + var1168
			end
		elseif var1159 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1170, var1171 = protoModule.readFixed32(p57, var1158)
			local _ = var1170
			var1158 = var1171
		elseif var1159 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1172, var1173 = protoModule.readFixed64(p57, var1158)
			local _ = var1172
			var1158 = var1173
		else
			error("Unsupported wire type: " .. var2038)
		end
	end
	return var1157
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
	local var1174 = t_57.new()
	
	if self.tooltip_id ~= nil then
		var1174.tooltip_id = propTypesModule.StringProp.jsonDecode(self.tooltip_id)
	end
	if self.tooltipId ~= nil then
		var1174.tooltip_id = propTypesModule.StringProp.jsonDecode(self.tooltipId)
	end
	return var1174
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
	local var1174 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1175, var1176 = protoModule.writeTag(buff, var1174, 1, protoModule.wireTypes.varint)
		var1175, var2058 = protoModule.writeVarInt(var1175, var1176, t.ActionType.toNumber(self.action_type))
		buff = var1175
		var1174 = var1176
	end
	if self.action_params ~= nil then
		local var1177 = self.action_params:encode()
		local var1178, var1179 = protoModule.writeTag(buff, var1174, 2, protoModule.wireTypes.lengthDelimited)
		var1178, var2061 = protoModule.writeBuffer(var1178, var1179, var1177, buffer.len(var1177))
		buff = var1178
		var1174 = var1179
	end
	local buff_1 = buffer.create(var1174)
	buffer.copy(buff_1, 0, buff, 0, var1174)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref), t (ref)
	local var1174 = t_58.new()
	local var1175 = 0
	while var1175 < buffer.len(p58) do
		local _ = nil
		local var1176 = nil
		local var1177, var1178, var1179 = protoModule.readTag(p58, var1175)
		local var1180 = var1177
		var1176 = var1178
		var1175 = var1179
		
		if var1176 == protoModule.wireTypes.varint then
			if var1180 == 1 then
				local _ = nil
				local var1181, var1182 = protoModule.readVarIntI32(p58, var1175)
				local var1183 = var1181
				var1175 = var1182
				var1174.action_type = t.ActionType.fromNumber(var1183) or var1183
			else
				local _ = nil
				local var1184, var1185 = protoModule.readVarInt(p58, var1175)
				local _ = var1184
				var1175 = var1185
			end
		end
		if var1176 == protoModule.wireTypes.lengthDelimited then
			if var1180 == 2 then
				local _ = nil
				local var1186, var1187 = protoModule.readBuffer(p58, var1175)
				var1175 = var1187
				var1174.action_params = t.ResizeMarketplaceCatalog_Params.decode(var1186)
			else
				local _ = nil
				local var1188, var1189 = protoModule.readVarInt(p58, var1175)
				var1175 = var1189 + var1188
			end
		elseif var1176 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1190, var1191 = protoModule.readFixed32(p58, var1175)
			local _ = var1190
			var1175 = var1191
		elseif var1176 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1192, var1193 = protoModule.readFixed64(p58, var1175)
			local _ = var1192
			var1175 = var1193
		else
			error("Unsupported wire type: " .. var2065)
		end
	end
	return var1174
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
	local var1194 = t_58.new()
	
	if self.action_type ~= nil then
		var1194.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1194.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1194.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1194.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.actionParams)
	end
	return var1194
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
	local var1194 = 0
	
	if self.category_id ~= nil then
		local var1195 = self.category_id:encode()
		local var1196, var1197 = protoModule.writeTag(buff, var1194, 1, protoModule.wireTypes.lengthDelimited)
		var1196, var2089 = protoModule.writeBuffer(var1196, var1197, var1195, buffer.len(var1195))
		buff = var1196
		var1194 = var1197
	end
	if self.subcategory_id ~= nil then
		local var1198 = self.subcategory_id:encode()
		local var1199, var1200 = protoModule.writeTag(buff, var1194, 2, protoModule.wireTypes.lengthDelimited)
		var1199, var2092 = protoModule.writeBuffer(var1199, var1200, var1198, buffer.len(var1198))
		buff = var1199
		var1194 = var1200
	end
	if self.screen_size ~= nil then
		local var1201 = self.screen_size:encode()
		local var1202, var1203 = protoModule.writeTag(buff, var1194, 3, protoModule.wireTypes.lengthDelimited)
		var1202, var2095 = protoModule.writeBuffer(var1202, var1203, var1201, buffer.len(var1201))
		buff = var1202
		var1194 = var1203
	end
	local buff_1 = buffer.create(var1194)
	buffer.copy(buff_1, 0, buff, 0, var1194)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref), propTypesModule (ref)
	local var1194 = t_59.new()
	local var1195 = 0
	while var1195 < buffer.len(p59) do
		local _ = nil
		local var1196 = nil
		local var1197, var1198, var1199 = protoModule.readTag(p59, var1195)
		local var1200 = var1197
		var1196 = var1198
		var1195 = var1199
		
		if var1196 == protoModule.wireTypes.varint then
			local _ = nil
			local var1201, var1202 = protoModule.readVarInt(p59, var1195)
			local _ = var1201
			var1195 = var1202
			continue
		end
		if var1196 == protoModule.wireTypes.lengthDelimited then
			if var1200 == 1 then
				local _ = nil
				local var1203, var1204 = protoModule.readBuffer(p59, var1195)
				var1195 = var1204
				var1194.category_id = propTypesModule.StringProp.decode(var1203)
			elseif var1200 == 2 then
				local _ = nil
				local var1205, var1206 = protoModule.readBuffer(p59, var1195)
				var1195 = var1206
				var1194.subcategory_id = propTypesModule.StringProp.decode(var1205)
			elseif var1200 == 3 then
				local _ = nil
				local var1207, var1208 = protoModule.readBuffer(p59, var1195)
				var1195 = var1208
				var1194.screen_size = propTypesModule.StringProp.decode(var1207)
			else
				local _ = nil
				local var1209, var1210 = protoModule.readVarInt(p59, var1195)
				var1195 = var1210 + var1209
			end
		elseif var1196 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1211, var1212 = protoModule.readFixed32(p59, var1195)
			local _ = var1211
			var1195 = var1212
		elseif var1196 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1213, var1214 = protoModule.readFixed64(p59, var1195)
			local _ = var1213
			var1195 = var1214
		else
			error("Unsupported wire type: " .. var2099)
		end
	end
	return var1194
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
	local var1215 = t_59.new()
	
	if self.category_id ~= nil then
		var1215.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var1215.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	if self.subcategory_id ~= nil then
		var1215.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var1215.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	if self.screen_size ~= nil then
		var1215.screen_size = propTypesModule.StringProp.jsonDecode(self.screen_size)
	end
	if self.screenSize ~= nil then
		var1215.screen_size = propTypesModule.StringProp.jsonDecode(self.screenSize)
	end
	return var1215
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
	local var1215 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1216, var1217 = protoModule.writeTag(buff, var1215, 1, protoModule.wireTypes.varint)
		var1216, var2123 = protoModule.writeVarInt(var1216, var1217, t.ActionType.toNumber(self.action_type))
		buff = var1216
		var1215 = var1217
	end
	if self.action_params ~= nil then
		local var1218 = self.action_params:encode()
		local var1219, var1220 = protoModule.writeTag(buff, var1215, 2, protoModule.wireTypes.lengthDelimited)
		var1219, var2126 = protoModule.writeBuffer(var1219, var1220, var1218, buffer.len(var1218))
		buff = var1219
		var1215 = var1220
	end
	local buff_1 = buffer.create(var1215)
	buffer.copy(buff_1, 0, buff, 0, var1215)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref), t (ref)
	local var1215 = t_60.new()
	local var1216 = 0
	while var1216 < buffer.len(p60) do
		local _ = nil
		local var1217 = nil
		local var1218, var1219, var1220 = protoModule.readTag(p60, var1216)
		local var1221 = var1218
		var1217 = var1219
		var1216 = var1220
		
		if var1217 == protoModule.wireTypes.varint then
			if var1221 == 1 then
				local _ = nil
				local var1222, var1223 = protoModule.readVarIntI32(p60, var1216)
				local var1224 = var1222
				var1216 = var1223
				var1215.action_type = t.ActionType.fromNumber(var1224) or var1224
			else
				local _ = nil
				local var1225, var1226 = protoModule.readVarInt(p60, var1216)
				local _ = var1225
				var1216 = var1226
			end
		end
		if var1217 == protoModule.wireTypes.lengthDelimited then
			if var1221 == 2 then
				local _ = nil
				local var1227, var1228 = protoModule.readBuffer(p60, var1216)
				var1216 = var1228
				var1215.action_params = t.OpenChartsSortDetailAction_Params.decode(var1227)
			else
				local _ = nil
				local var1229, var1230 = protoModule.readVarInt(p60, var1216)
				var1216 = var1230 + var1229
			end
		elseif var1217 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1231, var1232 = protoModule.readFixed32(p60, var1216)
			local _ = var1231
			var1216 = var1232
		elseif var1217 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1233, var1234 = protoModule.readFixed64(p60, var1216)
			local _ = var1233
			var1216 = var1234
		else
			error("Unsupported wire type: " .. var2130)
		end
	end
	return var1215
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
	local var1235 = t_60.new()
	
	if self.action_type ~= nil then
		var1235.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1235.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1235.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1235.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var1235
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
	local var1235 = 0
	
	if self.sort_id ~= nil then
		local var1236 = self.sort_id:encode()
		local var1237, var1238 = protoModule.writeTag(buff, var1235, 1, protoModule.wireTypes.lengthDelimited)
		var1237, var2154 = protoModule.writeBuffer(var1237, var1238, var1236, buffer.len(var1236))
		buff = var1237
		var1235 = var1238
	end
	if self.secondary_sort_id ~= nil then
		local var1239 = self.secondary_sort_id:encode()
		local var1240, var1241 = protoModule.writeTag(buff, var1235, 2, protoModule.wireTypes.lengthDelimited)
		var1240, var2157 = protoModule.writeBuffer(var1240, var1241, var1239, buffer.len(var1239))
		buff = var1240
		var1235 = var1241
	end
	local buff_1 = buffer.create(var1235)
	buffer.copy(buff_1, 0, buff, 0, var1235)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref), propTypesModule (ref)
	local var1235 = t_61.new()
	local var1236 = 0
	while var1236 < buffer.len(p61) do
		local _ = nil
		local var1237 = nil
		local var1238, var1239, var1240 = protoModule.readTag(p61, var1236)
		local var1241 = var1238
		var1237 = var1239
		var1236 = var1240
		
		if var1237 == protoModule.wireTypes.varint then
			local _ = nil
			local var1242, var1243 = protoModule.readVarInt(p61, var1236)
			local _ = var1242
			var1236 = var1243
			continue
		end
		if var1237 == protoModule.wireTypes.lengthDelimited then
			if var1241 == 1 then
				local _ = nil
				local var1244, var1245 = protoModule.readBuffer(p61, var1236)
				var1236 = var1245
				var1235.sort_id = propTypesModule.StringProp.decode(var1244)
			elseif var1241 == 2 then
				local _ = nil
				local var1246, var1247 = protoModule.readBuffer(p61, var1236)
				var1236 = var1247
				var1235.secondary_sort_id = propTypesModule.Int32Prop.decode(var1246)
			else
				local _ = nil
				local var1248, var1249 = protoModule.readVarInt(p61, var1236)
				var1236 = var1249 + var1248
			end
		elseif var1237 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1250, var1251 = protoModule.readFixed32(p61, var1236)
			local _ = var1250
			var1236 = var1251
		elseif var1237 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1252, var1253 = protoModule.readFixed64(p61, var1236)
			local _ = var1252
			var1236 = var1253
		else
			error("Unsupported wire type: " .. var2161)
		end
	end
	return var1235
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
	local var1254 = t_61.new()
	
	if self.sort_id ~= nil then
		var1254.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var1254.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.secondary_sort_id ~= nil then
		var1254.secondary_sort_id = propTypesModule.Int32Prop.jsonDecode(self.secondary_sort_id)
	end
	if self.secondarySortId ~= nil then
		var1254.secondary_sort_id = propTypesModule.Int32Prop.jsonDecode(self.secondarySortId)
	end
	return var1254
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
	local var1254 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1255, var1256 = protoModule.writeTag(buff, var1254, 1, protoModule.wireTypes.varint)
		var1255, var2183 = protoModule.writeVarInt(var1255, var1256, t.ActionType.toNumber(self.action_type))
		buff = var1255
		var1254 = var1256
	end
	if self.action_params ~= nil then
		local var1257 = self.action_params:encode()
		local var1258, var1259 = protoModule.writeTag(buff, var1254, 2, protoModule.wireTypes.lengthDelimited)
		var1258, var2186 = protoModule.writeBuffer(var1258, var1259, var1257, buffer.len(var1257))
		buff = var1258
		var1254 = var1259
	end
	local buff_1 = buffer.create(var1254)
	buffer.copy(buff_1, 0, buff, 0, var1254)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref), t (ref)
	local var1254 = t_62.new()
	local var1255 = 0
	while var1255 < buffer.len(p62) do
		local _ = nil
		local var1256 = nil
		local var1257, var1258, var1259 = protoModule.readTag(p62, var1255)
		local var1260 = var1257
		var1256 = var1258
		var1255 = var1259
		
		if var1256 == protoModule.wireTypes.varint then
			if var1260 == 1 then
				local _ = nil
				local var1261, var1262 = protoModule.readVarIntI32(p62, var1255)
				local var1263 = var1261
				var1255 = var1262
				var1254.action_type = t.ActionType.fromNumber(var1263) or var1263
			else
				local _ = nil
				local var1264, var1265 = protoModule.readVarInt(p62, var1255)
				local _ = var1264
				var1255 = var1265
			end
		end
		if var1256 == protoModule.wireTypes.lengthDelimited then
			if var1260 == 2 then
				local _ = nil
				local var1266, var1267 = protoModule.readBuffer(p62, var1255)
				var1255 = var1267
				var1254.action_params = t.OpenSongDetailAction_Params.decode(var1266)
			else
				local _ = nil
				local var1268, var1269 = protoModule.readVarInt(p62, var1255)
				var1255 = var1269 + var1268
			end
		elseif var1256 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1270, var1271 = protoModule.readFixed32(p62, var1255)
			local _ = var1270
			var1255 = var1271
		elseif var1256 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1272, var1273 = protoModule.readFixed64(p62, var1255)
			local _ = var1272
			var1255 = var1273
		else
			error("Unsupported wire type: " .. var2190)
		end
	end
	return var1254
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
	local var1274 = t_62.new()
	
	if self.action_type ~= nil then
		var1274.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1274.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1274.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1274.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var1274
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
	local var1274 = 0
	
	if self.song_id ~= nil then
		local var1275 = self.song_id:encode()
		local var1276, var1277 = protoModule.writeTag(buff, var1274, 1, protoModule.wireTypes.lengthDelimited)
		var1276, var2214 = protoModule.writeBuffer(var1276, var1277, var1275, buffer.len(var1275))
		buff = var1276
		var1274 = var1277
	end
	local buff_1 = buffer.create(var1274)
	buffer.copy(buff_1, 0, buff, 0, var1274)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref), propTypesModule (ref)
	local var1274 = t_63.new()
	local var1275 = 0
	while var1275 < buffer.len(p63) do
		local _ = nil
		local var1276 = nil
		local var1277, var1278, var1279 = protoModule.readTag(p63, var1275)
		local var1280 = var1277
		var1276 = var1278
		var1275 = var1279
		
		if var1276 == protoModule.wireTypes.varint then
			local _ = nil
			local var1281, var1282 = protoModule.readVarInt(p63, var1275)
			local _ = var1281
			var1275 = var1282
			continue
		end
		if var1276 == protoModule.wireTypes.lengthDelimited then
			if var1280 == 1 then
				local _ = nil
				local var1283, var1284 = protoModule.readBuffer(p63, var1275)
				var1275 = var1284
				var1274.song_id = propTypesModule.StringProp.decode(var1283)
			else
				local _ = nil
				local var1285, var1286 = protoModule.readVarInt(p63, var1275)
				var1275 = var1286 + var1285
			end
		elseif var1276 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1287, var1288 = protoModule.readFixed32(p63, var1275)
			local _ = var1287
			var1275 = var1288
		elseif var1276 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1289, var1290 = protoModule.readFixed64(p63, var1275)
			local _ = var1289
			var1275 = var1290
		else
			error("Unsupported wire type: " .. var2218)
		end
	end
	return var1274
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
	local var1291 = t_63.new()
	
	if self.song_id ~= nil then
		var1291.song_id = propTypesModule.StringProp.jsonDecode(self.song_id)
	end
	if self.songId ~= nil then
		var1291.song_id = propTypesModule.StringProp.jsonDecode(self.songId)
	end
	return var1291
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
	local var1291 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1292, var1293 = protoModule.writeTag(buff, var1291, 1, protoModule.wireTypes.varint)
		var1292, var2238 = protoModule.writeVarInt(var1292, var1293, t.ActionType.toNumber(self.action_type))
		buff = var1292
		var1291 = var1293
	end
	if self.action_params ~= nil then
		local var1294 = self.action_params:encode()
		local var1295, var1296 = protoModule.writeTag(buff, var1291, 2, protoModule.wireTypes.lengthDelimited)
		var1295, var2241 = protoModule.writeBuffer(var1295, var1296, var1294, buffer.len(var1294))
		buff = var1295
		var1291 = var1296
	end
	local buff_1 = buffer.create(var1291)
	buffer.copy(buff_1, 0, buff, 0, var1291)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var1291 = t_64.new()
	local var1292 = 0
	while var1292 < buffer.len(p64) do
		local _ = nil
		local var1293 = nil
		local var1294, var1295, var1296 = protoModule.readTag(p64, var1292)
		local var1297 = var1294
		var1293 = var1295
		var1292 = var1296
		
		if var1293 == protoModule.wireTypes.varint then
			if var1297 == 1 then
				local _ = nil
				local var1298, var1299 = protoModule.readVarIntI32(p64, var1292)
				local var1300 = var1298
				var1292 = var1299
				var1291.action_type = t.ActionType.fromNumber(var1300) or var1300
			else
				local _ = nil
				local var1301, var1302 = protoModule.readVarInt(p64, var1292)
				local _ = var1301
				var1292 = var1302
			end
		end
		if var1293 == protoModule.wireTypes.lengthDelimited then
			if var1297 == 2 then
				local _ = nil
				local var1303, var1304 = protoModule.readBuffer(p64, var1292)
				var1292 = var1304
				var1291.action_params = t.OpenMarketplaceCatalogFilters_Params.decode(var1303)
			else
				local _ = nil
				local var1305, var1306 = protoModule.readVarInt(p64, var1292)
				var1292 = var1306 + var1305
			end
		elseif var1293 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1307, var1308 = protoModule.readFixed32(p64, var1292)
			local _ = var1307
			var1292 = var1308
		elseif var1293 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1309, var1310 = protoModule.readFixed64(p64, var1292)
			local _ = var1309
			var1292 = var1310
		else
			error("Unsupported wire type: " .. var2245)
		end
	end
	return var1291
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
	local var1311 = t_64.new()
	
	if self.action_type ~= nil then
		var1311.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1311.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1311.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1311.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.actionParams)
	end
	return var1311
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
	local var1311 = t_65.new()
	local var1312 = 0
	while var1312 < buffer.len(p65) do
		local var1313 = nil
		local _ = nil
		local var1314, var1315, var1316 = protoModule.readTag(p65, var1312)
		var1313 = var1314
		local var1317 = var1315
		var1312 = var1316
		
		if var1317 == protoModule.wireTypes.varint then
			local _ = nil
			local var1318, var1319 = protoModule.readVarInt(p65, var1312)
			local _ = var1318
			var1312 = var1319
		elseif var1317 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1320, var1321 = protoModule.readVarInt(p65, var1312)
			var1312 = var1321 + var1320
		elseif var1317 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1322, var1323 = protoModule.readFixed32(p65, var1312)
			local _ = var1322
			var1312 = var1323
		elseif var1317 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1324, var1325 = protoModule.readFixed64(p65, var1312)
			local _ = var1324
			var1312 = var1325
		else
			error("Unsupported wire type: " .. var2272)
		end
	end
	return var1311
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
	local var1326 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1327, var1328 = protoModule.writeTag(buff, var1326, 1, protoModule.wireTypes.varint)
		var1327, var2284 = protoModule.writeVarInt(var1327, var1328, t.ActionType.toNumber(self.action_type))
		buff = var1327
		var1326 = var1328
	end
	if self.action_params ~= nil then
		local var1329 = self.action_params:encode()
		local var1330, var1331 = protoModule.writeTag(buff, var1326, 2, protoModule.wireTypes.lengthDelimited)
		var1330, var2287 = protoModule.writeBuffer(var1330, var1331, var1329, buffer.len(var1329))
		buff = var1330
		var1326 = var1331
	end
	local buff_1 = buffer.create(var1326)
	buffer.copy(buff_1, 0, buff, 0, var1326)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var1326 = t_66.new()
	local var1327 = 0
	while var1327 < buffer.len(p66) do
		local _ = nil
		local var1328 = nil
		local var1329, var1330, var1331 = protoModule.readTag(p66, var1327)
		local var1332 = var1329
		var1328 = var1330
		var1327 = var1331
		
		if var1328 == protoModule.wireTypes.varint then
			if var1332 == 1 then
				local _ = nil
				local var1333, var1334 = protoModule.readVarIntI32(p66, var1327)
				local var1335 = var1333
				var1327 = var1334
				var1326.action_type = t.ActionType.fromNumber(var1335) or var1335
			else
				local _ = nil
				local var1336, var1337 = protoModule.readVarInt(p66, var1327)
				local _ = var1336
				var1327 = var1337
			end
		end
		if var1328 == protoModule.wireTypes.lengthDelimited then
			if var1332 == 2 then
				local _ = nil
				local var1338, var1339 = protoModule.readBuffer(p66, var1327)
				var1327 = var1339
				var1326.action_params = t.RefreshFromApiAction_Params.decode(var1338)
			else
				local _ = nil
				local var1340, var1341 = protoModule.readVarInt(p66, var1327)
				var1327 = var1341 + var1340
			end
		elseif var1328 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1342, var1343 = protoModule.readFixed32(p66, var1327)
			local _ = var1342
			var1327 = var1343
		elseif var1328 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1344, var1345 = protoModule.readFixed64(p66, var1327)
			local _ = var1344
			var1327 = var1345
		else
			error("Unsupported wire type: " .. var2291)
		end
	end
	return var1326
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
	local var1346 = t_66.new()
	
	if self.action_type ~= nil then
		var1346.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1346.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1346.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1346.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var1346
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
	local var1346 = 0
	
	if self.surface_key ~= nil then
		local var1347 = self.surface_key:encode()
		local var1348, var1349 = protoModule.writeTag(buff, var1346, 1, protoModule.wireTypes.lengthDelimited)
		var1348, var2315 = protoModule.writeBuffer(var1348, var1349, var1347, buffer.len(var1347))
		buff = var1348
		var1346 = var1349
	end
	if self.config_key ~= nil then
		local var1350 = self.config_key:encode()
		local var1351, var1352 = protoModule.writeTag(buff, var1346, 2, protoModule.wireTypes.lengthDelimited)
		var1351, var2318 = protoModule.writeBuffer(var1351, var1352, var1350, buffer.len(var1350))
		buff = var1351
		var1346 = var1352
	end
	local buff_1 = buffer.create(var1346)
	buffer.copy(buff_1, 0, buff, 0, var1346)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref), propTypesModule (ref)
	local var1346 = t_67.new()
	local var1347 = 0
	while var1347 < buffer.len(p67) do
		local _ = nil
		local var1348 = nil
		local var1349, var1350, var1351 = protoModule.readTag(p67, var1347)
		local var1352 = var1349
		var1348 = var1350
		var1347 = var1351
		
		if var1348 == protoModule.wireTypes.varint then
			local _ = nil
			local var1353, var1354 = protoModule.readVarInt(p67, var1347)
			local _ = var1353
			var1347 = var1354
			continue
		end
		if var1348 == protoModule.wireTypes.lengthDelimited then
			if var1352 == 1 then
				local _ = nil
				local var1355, var1356 = protoModule.readBuffer(p67, var1347)
				var1347 = var1356
				var1346.surface_key = propTypesModule.StringProp.decode(var1355)
			elseif var1352 == 2 then
				local _ = nil
				local var1357, var1358 = protoModule.readBuffer(p67, var1347)
				var1347 = var1358
				var1346.config_key = propTypesModule.StringProp.decode(var1357)
			else
				local _ = nil
				local var1359, var1360 = protoModule.readVarInt(p67, var1347)
				var1347 = var1360 + var1359
			end
		elseif var1348 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1361, var1362 = protoModule.readFixed32(p67, var1347)
			local _ = var1361
			var1347 = var1362
		elseif var1348 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1363, var1364 = protoModule.readFixed64(p67, var1347)
			local _ = var1363
			var1347 = var1364
		else
			error("Unsupported wire type: " .. var2322)
		end
	end
	return var1346
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
	local var1365 = t_67.new()
	
	if self.surface_key ~= nil then
		var1365.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var1365.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		var1365.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1365.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return var1365
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
	local var1365 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1366, var1367 = protoModule.writeTag(buff, var1365, 1, protoModule.wireTypes.varint)
		var1366, var2344 = protoModule.writeVarInt(var1366, var1367, t.ActionType.toNumber(self.action_type))
		buff = var1366
		var1365 = var1367
	end
	if self.action_params ~= nil then
		local var1368 = self.action_params:encode()
		local var1369, var1370 = protoModule.writeTag(buff, var1365, 2, protoModule.wireTypes.lengthDelimited)
		var1369, var2347 = protoModule.writeBuffer(var1369, var1370, var1368, buffer.len(var1368))
		buff = var1369
		var1365 = var1370
	end
	local buff_1 = buffer.create(var1365)
	buffer.copy(buff_1, 0, buff, 0, var1365)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref), t (ref)
	local var1365 = t_68.new()
	local var1366 = 0
	while var1366 < buffer.len(p68) do
		local _ = nil
		local var1367 = nil
		local var1368, var1369, var1370 = protoModule.readTag(p68, var1366)
		local var1371 = var1368
		var1367 = var1369
		var1366 = var1370
		
		if var1367 == protoModule.wireTypes.varint then
			if var1371 == 1 then
				local _ = nil
				local var1372, var1373 = protoModule.readVarIntI32(p68, var1366)
				local var1374 = var1372
				var1366 = var1373
				var1365.action_type = t.ActionType.fromNumber(var1374) or var1374
			else
				local _ = nil
				local var1375, var1376 = protoModule.readVarInt(p68, var1366)
				local _ = var1375
				var1366 = var1376
			end
		end
		if var1367 == protoModule.wireTypes.lengthDelimited then
			if var1371 == 2 then
				local _ = nil
				local var1377, var1378 = protoModule.readBuffer(p68, var1366)
				var1366 = var1378
				var1365.action_params = t.RefreshHomeAction_Params.decode(var1377)
			else
				local _ = nil
				local var1379, var1380 = protoModule.readVarInt(p68, var1366)
				var1366 = var1380 + var1379
			end
		elseif var1367 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1381, var1382 = protoModule.readFixed32(p68, var1366)
			local _ = var1381
			var1366 = var1382
		elseif var1367 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1383, var1384 = protoModule.readFixed64(p68, var1366)
			local _ = var1383
			var1366 = var1384
		else
			error("Unsupported wire type: " .. var2351)
		end
	end
	return var1365
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
	local var1385 = t_68.new()
	
	if self.action_type ~= nil then
		var1385.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1385.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1385.action_params = t.RefreshHomeAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1385.action_params = t.RefreshHomeAction_Params.jsonDecode(self.actionParams)
	end
	return var1385
end

t_68.descriptor = {
	name = "RefreshHomeAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshHomeAction"
}
t.RefreshHomeAction = t_68
typeRegistryModule.default:register(t.RefreshHomeAction)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p69)
	-- upvalues: t_69 (ref)
	return setmetatable({
		request_intent = if p69 == nil or p69.request_intent == nil then nil else p69.request_intent
	}, t_69)
end

function t_69:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1385 = 0
	
	if self.request_intent ~= nil then
		local var1386 = self.request_intent:encode()
		local var1387, var1388 = protoModule.writeTag(buff, var1385, 1, protoModule.wireTypes.lengthDelimited)
		var1387, var2375 = protoModule.writeBuffer(var1387, var1388, var1386, buffer.len(var1386))
		buff = var1387
		var1385 = var1388
	end
	local buff_1 = buffer.create(var1385)
	buffer.copy(buff_1, 0, buff, 0, var1385)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref), propTypesModule (ref)
	local var1385 = t_69.new()
	local var1386 = 0
	while var1386 < buffer.len(p69) do
		local _ = nil
		local var1387 = nil
		local var1388, var1389, var1390 = protoModule.readTag(p69, var1386)
		local var1391 = var1388
		var1387 = var1389
		var1386 = var1390
		
		if var1387 == protoModule.wireTypes.varint then
			local _ = nil
			local var1392, var1393 = protoModule.readVarInt(p69, var1386)
			local _ = var1392
			var1386 = var1393
			continue
		end
		if var1387 == protoModule.wireTypes.lengthDelimited then
			if var1391 == 1 then
				local _ = nil
				local var1394, var1395 = protoModule.readBuffer(p69, var1386)
				var1386 = var1395
				var1385.request_intent = propTypesModule.StringProp.decode(var1394)
			else
				local _ = nil
				local var1396, var1397 = protoModule.readVarInt(p69, var1386)
				var1386 = var1397 + var1396
			end
		elseif var1387 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1398, var1399 = protoModule.readFixed32(p69, var1386)
			local _ = var1398
			var1386 = var1399
		elseif var1387 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1400, var1401 = protoModule.readFixed64(p69, var1386)
			local _ = var1400
			var1386 = var1401
		else
			error("Unsupported wire type: " .. var2379)
		end
	end
	return var1385
end

function t_69:jsonEncode()
	local t = {}
	
	if self.request_intent ~= nil then
		t.requestIntent = self.request_intent:jsonEncode()
	end
	return t
end

function t_69:jsonDecode()
	-- upvalues: t_69 (ref), propTypesModule (ref)
	local var1402 = t_69.new()
	
	if self.request_intent ~= nil then
		var1402.request_intent = propTypesModule.StringProp.jsonDecode(self.request_intent)
	end
	if self.requestIntent ~= nil then
		var1402.request_intent = propTypesModule.StringProp.jsonDecode(self.requestIntent)
	end
	return var1402
end

t_69.descriptor = {
	name = "RefreshHomeAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshHomeAction_Params = t_69
typeRegistryModule.default:register(t.RefreshHomeAction_Params)
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
	local var1402 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1403, var1404 = protoModule.writeTag(buff, var1402, 1, protoModule.wireTypes.varint)
		var1403, var2399 = protoModule.writeVarInt(var1403, var1404, t.ActionType.toNumber(self.action_type))
		buff = var1403
		var1402 = var1404
	end
	if self.action_params ~= nil then
		local var1405 = self.action_params:encode()
		local var1406, var1407 = protoModule.writeTag(buff, var1402, 2, protoModule.wireTypes.lengthDelimited)
		var1406, var2402 = protoModule.writeBuffer(var1406, var1407, var1405, buffer.len(var1405))
		buff = var1406
		var1402 = var1407
	end
	local buff_1 = buffer.create(var1402)
	buffer.copy(buff_1, 0, buff, 0, var1402)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref), t (ref)
	local var1402 = t_70.new()
	local var1403 = 0
	while var1403 < buffer.len(p70) do
		local _ = nil
		local var1404 = nil
		local var1405, var1406, var1407 = protoModule.readTag(p70, var1403)
		local var1408 = var1405
		var1404 = var1406
		var1403 = var1407
		
		if var1404 == protoModule.wireTypes.varint then
			if var1408 == 1 then
				local _ = nil
				local var1409, var1410 = protoModule.readVarIntI32(p70, var1403)
				local var1411 = var1409
				var1403 = var1410
				var1402.action_type = t.ActionType.fromNumber(var1411) or var1411
			else
				local _ = nil
				local var1412, var1413 = protoModule.readVarInt(p70, var1403)
				local _ = var1412
				var1403 = var1413
			end
		end
		if var1404 == protoModule.wireTypes.lengthDelimited then
			if var1408 == 2 then
				local _ = nil
				local var1414, var1415 = protoModule.readBuffer(p70, var1403)
				var1403 = var1415
				var1402.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.decode(var1414)
			else
				local _ = nil
				local var1416, var1417 = protoModule.readVarInt(p70, var1403)
				var1403 = var1417 + var1416
			end
		elseif var1404 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1418, var1419 = protoModule.readFixed32(p70, var1403)
			local _ = var1418
			var1403 = var1419
		elseif var1404 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1420, var1421 = protoModule.readFixed64(p70, var1403)
			local _ = var1420
			var1403 = var1421
		else
			error("Unsupported wire type: " .. var2406)
		end
	end
	return var1402
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
	local var1422 = t_70.new()
	
	if self.action_type ~= nil then
		var1422.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1422.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1422.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1422.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.actionParams)
	end
	return var1422
end

t_70.descriptor = {
	name = "RefreshOmniRecommendationFeedItemAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshOmniRecommendationFeedItemAction"
}
t.RefreshOmniRecommendationFeedItemAction = t_70
typeRegistryModule.default:register(t.RefreshOmniRecommendationFeedItemAction)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p71)
	-- upvalues: t_71 (ref)
	return setmetatable({
		topic_id = if p71 == nil or p71.topic_id == nil then nil else p71.topic_id,
		selected_option = if p71 == nil or p71.selected_option == nil then nil else p71.selected_option,
		request_intent = if p71 == nil or p71.request_intent == nil then nil else p71.request_intent,
		feed_item_key = if p71 == nil or p71.feed_item_key == nil then nil else p71.feed_item_key
	}, t_71)
end

function t_71:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1422 = 0
	
	if self.topic_id ~= nil then
		local var1423 = self.topic_id:encode()
		local var1424, var1425 = protoModule.writeTag(buff, var1422, 1, protoModule.wireTypes.lengthDelimited)
		var1424, var2430 = protoModule.writeBuffer(var1424, var1425, var1423, buffer.len(var1423))
		buff = var1424
		var1422 = var1425
	end
	if self.selected_option ~= nil then
		local var1426 = self.selected_option:encode()
		local var1427, var1428 = protoModule.writeTag(buff, var1422, 2, protoModule.wireTypes.lengthDelimited)
		var1427, var2433 = protoModule.writeBuffer(var1427, var1428, var1426, buffer.len(var1426))
		buff = var1427
		var1422 = var1428
	end
	if self.request_intent ~= nil then
		local var1429 = self.request_intent:encode()
		local var1430, var1431 = protoModule.writeTag(buff, var1422, 3, protoModule.wireTypes.lengthDelimited)
		var1430, var2436 = protoModule.writeBuffer(var1430, var1431, var1429, buffer.len(var1429))
		buff = var1430
		var1422 = var1431
	end
	if self.feed_item_key ~= nil then
		local var1432 = self.feed_item_key:encode()
		local var1433, var1434 = protoModule.writeTag(buff, var1422, 4, protoModule.wireTypes.lengthDelimited)
		var1433, var2439 = protoModule.writeBuffer(var1433, var1434, var1432, buffer.len(var1432))
		buff = var1433
		var1422 = var1434
	end
	local buff_1 = buffer.create(var1422)
	buffer.copy(buff_1, 0, buff, 0, var1422)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref), propTypesModule (ref)
	local var1422 = t_71.new()
	local var1423 = 0
	while var1423 < buffer.len(p71) do
		local _ = nil
		local var1424 = nil
		local var1425, var1426, var1427 = protoModule.readTag(p71, var1423)
		local var1428 = var1425
		var1424 = var1426
		var1423 = var1427
		
		if var1424 == protoModule.wireTypes.varint then
			local _ = nil
			local var1429, var1430 = protoModule.readVarInt(p71, var1423)
			local _ = var1429
			var1423 = var1430
			continue
		end
		if var1424 == protoModule.wireTypes.lengthDelimited then
			if var1428 == 1 then
				local _ = nil
				local var1431, var1432 = protoModule.readBuffer(p71, var1423)
				var1423 = var1432
				var1422.topic_id = propTypesModule.StringProp.decode(var1431)
			elseif var1428 == 2 then
				local _ = nil
				local var1433, var1434 = protoModule.readBuffer(p71, var1423)
				var1423 = var1434
				var1422.selected_option = propTypesModule.StringProp.decode(var1433)
			elseif var1428 == 3 then
				local _ = nil
				local var1435, var1436 = protoModule.readBuffer(p71, var1423)
				var1423 = var1436
				var1422.request_intent = propTypesModule.StringProp.decode(var1435)
			elseif var1428 == 4 then
				local _ = nil
				local var1437, var1438 = protoModule.readBuffer(p71, var1423)
				var1423 = var1438
				var1422.feed_item_key = propTypesModule.StringProp.decode(var1437)
			else
				local _ = nil
				local var1439, var1440 = protoModule.readVarInt(p71, var1423)
				var1423 = var1440 + var1439
			end
		elseif var1424 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1441, var1442 = protoModule.readFixed32(p71, var1423)
			local _ = var1441
			var1423 = var1442
		elseif var1424 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1443, var1444 = protoModule.readFixed64(p71, var1423)
			local _ = var1443
			var1423 = var1444
		else
			error("Unsupported wire type: " .. var2443)
		end
	end
	return var1422
end

function t_71:jsonEncode()
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

function t_71:jsonDecode()
	-- upvalues: t_71 (ref), propTypesModule (ref)
	local var1445 = t_71.new()
	
	if self.topic_id ~= nil then
		var1445.topic_id = propTypesModule.StringProp.jsonDecode(self.topic_id)
	end
	if self.topicId ~= nil then
		var1445.topic_id = propTypesModule.StringProp.jsonDecode(self.topicId)
	end
	if self.selected_option ~= nil then
		var1445.selected_option = propTypesModule.StringProp.jsonDecode(self.selected_option)
	end
	if self.selectedOption ~= nil then
		var1445.selected_option = propTypesModule.StringProp.jsonDecode(self.selectedOption)
	end
	if self.request_intent ~= nil then
		var1445.request_intent = propTypesModule.StringProp.jsonDecode(self.request_intent)
	end
	if self.requestIntent ~= nil then
		var1445.request_intent = propTypesModule.StringProp.jsonDecode(self.requestIntent)
	end
	if self.feed_item_key ~= nil then
		var1445.feed_item_key = propTypesModule.StringProp.jsonDecode(self.feed_item_key)
	end
	if self.feedItemKey ~= nil then
		var1445.feed_item_key = propTypesModule.StringProp.jsonDecode(self.feedItemKey)
	end
	return var1445
end

t_71.descriptor = {
	name = "RefreshOmniRecommendationFeedItemAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshOmniRecommendationFeedItemAction_Params = t_71
typeRegistryModule.default:register(t.RefreshOmniRecommendationFeedItemAction_Params)
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
	local var1445 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1446, var1447 = protoModule.writeTag(buff, var1445, 1, protoModule.wireTypes.varint)
		var1446, var2469 = protoModule.writeVarInt(var1446, var1447, t.ActionType.toNumber(self.action_type))
		buff = var1446
		var1445 = var1447
	end
	if self.action_params ~= nil then
		local var1448 = self.action_params:encode()
		local var1449, var1450 = protoModule.writeTag(buff, var1445, 2, protoModule.wireTypes.lengthDelimited)
		var1449, var2472 = protoModule.writeBuffer(var1449, var1450, var1448, buffer.len(var1448))
		buff = var1449
		var1445 = var1450
	end
	local buff_1 = buffer.create(var1445)
	buffer.copy(buff_1, 0, buff, 0, var1445)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var1445 = t_72.new()
	local var1446 = 0
	while var1446 < buffer.len(p72) do
		local _ = nil
		local var1447 = nil
		local var1448, var1449, var1450 = protoModule.readTag(p72, var1446)
		local var1451 = var1448
		var1447 = var1449
		var1446 = var1450
		
		if var1447 == protoModule.wireTypes.varint then
			if var1451 == 1 then
				local _ = nil
				local var1452, var1453 = protoModule.readVarIntI32(p72, var1446)
				local var1454 = var1452
				var1446 = var1453
				var1445.action_type = t.ActionType.fromNumber(var1454) or var1454
			else
				local _ = nil
				local var1455, var1456 = protoModule.readVarInt(p72, var1446)
				local _ = var1455
				var1446 = var1456
			end
		end
		if var1447 == protoModule.wireTypes.lengthDelimited then
			if var1451 == 2 then
				local _ = nil
				local var1457, var1458 = protoModule.readBuffer(p72, var1446)
				var1446 = var1458
				var1445.action_params = t.RsvpToEventAction_Params.decode(var1457)
			else
				local _ = nil
				local var1459, var1460 = protoModule.readVarInt(p72, var1446)
				var1446 = var1460 + var1459
			end
		elseif var1447 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1461, var1462 = protoModule.readFixed32(p72, var1446)
			local _ = var1461
			var1446 = var1462
		elseif var1447 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1463, var1464 = protoModule.readFixed64(p72, var1446)
			local _ = var1463
			var1446 = var1464
		else
			error("Unsupported wire type: " .. var2476)
		end
	end
	return var1445
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
	local var1465 = t_72.new()
	
	if self.action_type ~= nil then
		var1465.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1465.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1465.action_params = t.RsvpToEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1465.action_params = t.RsvpToEventAction_Params.jsonDecode(self.actionParams)
	end
	return var1465
end

t_72.descriptor = {
	name = "RsvpToEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpToEventAction"
}
t.RsvpToEventAction = t_72
typeRegistryModule.default:register(t.RsvpToEventAction)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p73)
	-- upvalues: t_73 (ref)
	return setmetatable({
		event_id = if p73 == nil or p73.event_id == nil then nil else p73.event_id,
		user_rsvp = if p73 == nil or p73.user_rsvp == nil then nil else p73.user_rsvp,
		notifications_modal_identifier = if p73 == nil or p73.notifications_modal_identifier == nil then nil else p73.notifications_modal_identifier
	}, t_73)
end

function t_73:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1465 = 0
	
	if self.event_id ~= nil then
		local var1466 = self.event_id:encode()
		local var1467, var1468 = protoModule.writeTag(buff, var1465, 1, protoModule.wireTypes.lengthDelimited)
		var1467, var2500 = protoModule.writeBuffer(var1467, var1468, var1466, buffer.len(var1466))
		buff = var1467
		var1465 = var1468
	end
	if self.user_rsvp ~= nil then
		local var1469 = self.user_rsvp:encode()
		local var1470, var1471 = protoModule.writeTag(buff, var1465, 2, protoModule.wireTypes.lengthDelimited)
		var1470, var2503 = protoModule.writeBuffer(var1470, var1471, var1469, buffer.len(var1469))
		buff = var1470
		var1465 = var1471
	end
	if self.notifications_modal_identifier ~= nil then
		local var1472 = self.notifications_modal_identifier:encode()
		local var1473, var1474 = protoModule.writeTag(buff, var1465, 3, protoModule.wireTypes.lengthDelimited)
		var1473, var2506 = protoModule.writeBuffer(var1473, var1474, var1472, buffer.len(var1472))
		buff = var1473
		var1465 = var1474
	end
	local buff_1 = buffer.create(var1465)
	buffer.copy(buff_1, 0, buff, 0, var1465)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref), propTypesModule (ref)
	local var1465 = t_73.new()
	local var1466 = 0
	while var1466 < buffer.len(p73) do
		local _ = nil
		local var1467 = nil
		local var1468, var1469, var1470 = protoModule.readTag(p73, var1466)
		local var1471 = var1468
		var1467 = var1469
		var1466 = var1470
		
		if var1467 == protoModule.wireTypes.varint then
			local _ = nil
			local var1472, var1473 = protoModule.readVarInt(p73, var1466)
			local _ = var1472
			var1466 = var1473
			continue
		end
		if var1467 == protoModule.wireTypes.lengthDelimited then
			if var1471 == 1 then
				local _ = nil
				local var1474, var1475 = protoModule.readBuffer(p73, var1466)
				var1466 = var1475
				var1465.event_id = propTypesModule.StringProp.decode(var1474)
			elseif var1471 == 2 then
				local _ = nil
				local var1476, var1477 = protoModule.readBuffer(p73, var1466)
				var1466 = var1477
				var1465.user_rsvp = propTypesModule.BoolProp.decode(var1476)
			elseif var1471 == 3 then
				local _ = nil
				local var1478, var1479 = protoModule.readBuffer(p73, var1466)
				var1466 = var1479
				var1465.notifications_modal_identifier = propTypesModule.StringProp.decode(var1478)
			else
				local _ = nil
				local var1480, var1481 = protoModule.readVarInt(p73, var1466)
				var1466 = var1481 + var1480
			end
		elseif var1467 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1482, var1483 = protoModule.readFixed32(p73, var1466)
			local _ = var1482
			var1466 = var1483
		elseif var1467 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1484, var1485 = protoModule.readFixed64(p73, var1466)
			local _ = var1484
			var1466 = var1485
		else
			error("Unsupported wire type: " .. var2510)
		end
	end
	return var1465
end

function t_73:jsonEncode()
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

function t_73:jsonDecode()
	-- upvalues: t_73 (ref), propTypesModule (ref)
	local var1486 = t_73.new()
	
	if self.event_id ~= nil then
		var1486.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var1486.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.user_rsvp ~= nil then
		var1486.user_rsvp = propTypesModule.BoolProp.jsonDecode(self.user_rsvp)
	end
	if self.userRsvp ~= nil then
		var1486.user_rsvp = propTypesModule.BoolProp.jsonDecode(self.userRsvp)
	end
	if self.notifications_modal_identifier ~= nil then
		var1486.notifications_modal_identifier = propTypesModule.StringProp.jsonDecode(self.notifications_modal_identifier)
	end
	if self.notificationsModalIdentifier ~= nil then
		var1486.notifications_modal_identifier = propTypesModule.StringProp.jsonDecode(self.notificationsModalIdentifier)
	end
	return var1486
end

t_73.descriptor = {
	name = "RsvpToEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RsvpToEventAction_Params = t_73
typeRegistryModule.default:register(t.RsvpToEventAction_Params)
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
	local var1486 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1487, var1488 = protoModule.writeTag(buff, var1486, 1, protoModule.wireTypes.varint)
		var1487, var2534 = protoModule.writeVarInt(var1487, var1488, t.ActionType.toNumber(self.action_type))
		buff = var1487
		var1486 = var1488
	end
	if self.action_params ~= nil then
		local var1489 = self.action_params:encode()
		local var1490, var1491 = protoModule.writeTag(buff, var1486, 2, protoModule.wireTypes.lengthDelimited)
		var1490, var2537 = protoModule.writeBuffer(var1490, var1491, var1489, buffer.len(var1489))
		buff = var1490
		var1486 = var1491
	end
	local buff_1 = buffer.create(var1486)
	buffer.copy(buff_1, 0, buff, 0, var1486)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var1486 = t_74.new()
	local var1487 = 0
	while var1487 < buffer.len(p74) do
		local _ = nil
		local var1488 = nil
		local var1489, var1490, var1491 = protoModule.readTag(p74, var1487)
		local var1492 = var1489
		var1488 = var1490
		var1487 = var1491
		
		if var1488 == protoModule.wireTypes.varint then
			if var1492 == 1 then
				local _ = nil
				local var1493, var1494 = protoModule.readVarIntI32(p74, var1487)
				local var1495 = var1493
				var1487 = var1494
				var1486.action_type = t.ActionType.fromNumber(var1495) or var1495
			else
				local _ = nil
				local var1496, var1497 = protoModule.readVarInt(p74, var1487)
				local _ = var1496
				var1487 = var1497
			end
		end
		if var1488 == protoModule.wireTypes.lengthDelimited then
			if var1492 == 2 then
				local _ = nil
				local var1498, var1499 = protoModule.readBuffer(p74, var1487)
				var1487 = var1499
				var1486.action_params = t.OpenEventDetailsAction_Params.decode(var1498)
			else
				local _ = nil
				local var1500, var1501 = protoModule.readVarInt(p74, var1487)
				var1487 = var1501 + var1500
			end
		elseif var1488 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1502, var1503 = protoModule.readFixed32(p74, var1487)
			local _ = var1502
			var1487 = var1503
		elseif var1488 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1504, var1505 = protoModule.readFixed64(p74, var1487)
			local _ = var1504
			var1487 = var1505
		else
			error("Unsupported wire type: " .. var2541)
		end
	end
	return var1486
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
	local var1506 = t_74.new()
	
	if self.action_type ~= nil then
		var1506.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1506.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1506.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1506.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var1506
end

t_74.descriptor = {
	name = "OpenEventDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenEventDetailsAction"
}
t.OpenEventDetailsAction = t_74
typeRegistryModule.default:register(t.OpenEventDetailsAction)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p75)
	-- upvalues: t_75 (ref)
	return setmetatable({
		event_id = if p75 == nil or p75.event_id == nil then nil else p75.event_id
	}, t_75)
end

function t_75:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1506 = 0
	
	if self.event_id ~= nil then
		local var1507 = self.event_id:encode()
		local var1508, var1509 = protoModule.writeTag(buff, var1506, 1, protoModule.wireTypes.lengthDelimited)
		var1508, var2565 = protoModule.writeBuffer(var1508, var1509, var1507, buffer.len(var1507))
		buff = var1508
		var1506 = var1509
	end
	local buff_1 = buffer.create(var1506)
	buffer.copy(buff_1, 0, buff, 0, var1506)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref), propTypesModule (ref)
	local var1506 = t_75.new()
	local var1507 = 0
	while var1507 < buffer.len(p75) do
		local _ = nil
		local var1508 = nil
		local var1509, var1510, var1511 = protoModule.readTag(p75, var1507)
		local var1512 = var1509
		var1508 = var1510
		var1507 = var1511
		
		if var1508 == protoModule.wireTypes.varint then
			local _ = nil
			local var1513, var1514 = protoModule.readVarInt(p75, var1507)
			local _ = var1513
			var1507 = var1514
			continue
		end
		if var1508 == protoModule.wireTypes.lengthDelimited then
			if var1512 == 1 then
				local _ = nil
				local var1515, var1516 = protoModule.readBuffer(p75, var1507)
				var1507 = var1516
				var1506.event_id = propTypesModule.StringProp.decode(var1515)
			else
				local _ = nil
				local var1517, var1518 = protoModule.readVarInt(p75, var1507)
				var1507 = var1518 + var1517
			end
		elseif var1508 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1519, var1520 = protoModule.readFixed32(p75, var1507)
			local _ = var1519
			var1507 = var1520
		elseif var1508 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1521, var1522 = protoModule.readFixed64(p75, var1507)
			local _ = var1521
			var1507 = var1522
		else
			error("Unsupported wire type: " .. var2569)
		end
	end
	return var1506
end

function t_75:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_75:jsonDecode()
	-- upvalues: t_75 (ref), propTypesModule (ref)
	local var1523 = t_75.new()
	
	if self.event_id ~= nil then
		var1523.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var1523.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var1523
end

t_75.descriptor = {
	name = "OpenEventDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenEventDetailsAction_Params = t_75
typeRegistryModule.default:register(t.OpenEventDetailsAction_Params)
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
	local var1523 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1524, var1525 = protoModule.writeTag(buff, var1523, 1, protoModule.wireTypes.varint)
		var1524, var2589 = protoModule.writeVarInt(var1524, var1525, t.ActionType.toNumber(self.action_type))
		buff = var1524
		var1523 = var1525
	end
	if self.action_params ~= nil then
		local var1526 = self.action_params:encode()
		local var1527, var1528 = protoModule.writeTag(buff, var1523, 2, protoModule.wireTypes.lengthDelimited)
		var1527, var2592 = protoModule.writeBuffer(var1527, var1528, var1526, buffer.len(var1526))
		buff = var1527
		var1523 = var1528
	end
	local buff_1 = buffer.create(var1523)
	buffer.copy(buff_1, 0, buff, 0, var1523)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var1523 = t_76.new()
	local var1524 = 0
	while var1524 < buffer.len(p76) do
		local _ = nil
		local var1525 = nil
		local var1526, var1527, var1528 = protoModule.readTag(p76, var1524)
		local var1529 = var1526
		var1525 = var1527
		var1524 = var1528
		
		if var1525 == protoModule.wireTypes.varint then
			if var1529 == 1 then
				local _ = nil
				local var1530, var1531 = protoModule.readVarIntI32(p76, var1524)
				local var1532 = var1530
				var1524 = var1531
				var1523.action_type = t.ActionType.fromNumber(var1532) or var1532
			else
				local _ = nil
				local var1533, var1534 = protoModule.readVarInt(p76, var1524)
				local _ = var1533
				var1524 = var1534
			end
		end
		if var1525 == protoModule.wireTypes.lengthDelimited then
			if var1529 == 2 then
				local _ = nil
				local var1535, var1536 = protoModule.readBuffer(p76, var1524)
				var1524 = var1536
				var1523.action_params = t.OpenBadgesSeeAllAction_Params.decode(var1535)
			else
				local _ = nil
				local var1537, var1538 = protoModule.readVarInt(p76, var1524)
				var1524 = var1538 + var1537
			end
		elseif var1525 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1539, var1540 = protoModule.readFixed32(p76, var1524)
			local _ = var1539
			var1524 = var1540
		elseif var1525 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1541, var1542 = protoModule.readFixed64(p76, var1524)
			local _ = var1541
			var1524 = var1542
		else
			error("Unsupported wire type: " .. var2596)
		end
	end
	return var1523
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
	local var1543 = t_76.new()
	
	if self.action_type ~= nil then
		var1543.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1543.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1543.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1543.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var1543
end

t_76.descriptor = {
	name = "OpenBadgesSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgesSeeAllAction"
}
t.OpenBadgesSeeAllAction = t_76
typeRegistryModule.default:register(t.OpenBadgesSeeAllAction)
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
	local var1543 = 0
	
	if self.universe_id ~= nil then
		local var1544 = self.universe_id:encode()
		local var1545, var1546 = protoModule.writeTag(buff, var1543, 1, protoModule.wireTypes.lengthDelimited)
		var1545, var2620 = protoModule.writeBuffer(var1545, var1546, var1544, buffer.len(var1544))
		buff = var1545
		var1543 = var1546
	end
	local buff_1 = buffer.create(var1543)
	buffer.copy(buff_1, 0, buff, 0, var1543)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), propTypesModule (ref)
	local var1543 = t_77.new()
	local var1544 = 0
	while var1544 < buffer.len(p77) do
		local _ = nil
		local var1545 = nil
		local var1546, var1547, var1548 = protoModule.readTag(p77, var1544)
		local var1549 = var1546
		var1545 = var1547
		var1544 = var1548
		
		if var1545 == protoModule.wireTypes.varint then
			local _ = nil
			local var1550, var1551 = protoModule.readVarInt(p77, var1544)
			local _ = var1550
			var1544 = var1551
			continue
		end
		if var1545 == protoModule.wireTypes.lengthDelimited then
			if var1549 == 1 then
				local _ = nil
				local var1552, var1553 = protoModule.readBuffer(p77, var1544)
				var1544 = var1553
				var1543.universe_id = propTypesModule.StringProp.decode(var1552)
			else
				local _ = nil
				local var1554, var1555 = protoModule.readVarInt(p77, var1544)
				var1544 = var1555 + var1554
			end
		elseif var1545 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1556, var1557 = protoModule.readFixed32(p77, var1544)
			local _ = var1556
			var1544 = var1557
		elseif var1545 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1558, var1559 = protoModule.readFixed64(p77, var1544)
			local _ = var1558
			var1544 = var1559
		else
			error("Unsupported wire type: " .. var2624)
		end
	end
	return var1543
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
	local var1560 = t_77.new()
	
	if self.universe_id ~= nil then
		var1560.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1560.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1560
end

t_77.descriptor = {
	name = "OpenBadgesSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenBadgesSeeAllAction_Params = t_77
typeRegistryModule.default:register(t.OpenBadgesSeeAllAction_Params)
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
	local var1560 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1561, var1562 = protoModule.writeTag(buff, var1560, 1, protoModule.wireTypes.varint)
		var1561, var2644 = protoModule.writeVarInt(var1561, var1562, t.ActionType.toNumber(self.action_type))
		buff = var1561
		var1560 = var1562
	end
	if self.action_params ~= nil then
		local var1563 = self.action_params:encode()
		local var1564, var1565 = protoModule.writeTag(buff, var1560, 2, protoModule.wireTypes.lengthDelimited)
		var1564, var2647 = protoModule.writeBuffer(var1564, var1565, var1563, buffer.len(var1563))
		buff = var1564
		var1560 = var1565
	end
	local buff_1 = buffer.create(var1560)
	buffer.copy(buff_1, 0, buff, 0, var1560)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref), t (ref)
	local var1560 = t_78.new()
	local var1561 = 0
	while var1561 < buffer.len(p78) do
		local _ = nil
		local var1562 = nil
		local var1563, var1564, var1565 = protoModule.readTag(p78, var1561)
		local var1566 = var1563
		var1562 = var1564
		var1561 = var1565
		
		if var1562 == protoModule.wireTypes.varint then
			if var1566 == 1 then
				local _ = nil
				local var1567, var1568 = protoModule.readVarIntI32(p78, var1561)
				local var1569 = var1567
				var1561 = var1568
				var1560.action_type = t.ActionType.fromNumber(var1569) or var1569
			else
				local _ = nil
				local var1570, var1571 = protoModule.readVarInt(p78, var1561)
				local _ = var1570
				var1561 = var1571
			end
		end
		if var1562 == protoModule.wireTypes.lengthDelimited then
			if var1566 == 2 then
				local _ = nil
				local var1572, var1573 = protoModule.readBuffer(p78, var1561)
				var1561 = var1573
				var1560.action_params = t.OpenExperienceStoreSeeAllAction_Params.decode(var1572)
			else
				local _ = nil
				local var1574, var1575 = protoModule.readVarInt(p78, var1561)
				var1561 = var1575 + var1574
			end
		elseif var1562 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1576, var1577 = protoModule.readFixed32(p78, var1561)
			local _ = var1576
			var1561 = var1577
		elseif var1562 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1578, var1579 = protoModule.readFixed64(p78, var1561)
			local _ = var1578
			var1561 = var1579
		else
			error("Unsupported wire type: " .. var2651)
		end
	end
	return var1560
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
	local var1580 = t_78.new()
	
	if self.action_type ~= nil then
		var1580.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1580.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1580.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1580.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var1580
end

t_78.descriptor = {
	name = "OpenExperienceStoreSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenExperienceStoreSeeAllAction"
}
t.OpenExperienceStoreSeeAllAction = t_78
typeRegistryModule.default:register(t.OpenExperienceStoreSeeAllAction)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p79)
	-- upvalues: t_79 (ref)
	return setmetatable({
		universe_id = if p79 == nil or p79.universe_id == nil then nil else p79.universe_id
	}, t_79)
end

function t_79:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1580 = 0
	
	if self.universe_id ~= nil then
		local var1581 = self.universe_id:encode()
		local var1582, var1583 = protoModule.writeTag(buff, var1580, 1, protoModule.wireTypes.lengthDelimited)
		var1582, var2675 = protoModule.writeBuffer(var1582, var1583, var1581, buffer.len(var1581))
		buff = var1582
		var1580 = var1583
	end
	local buff_1 = buffer.create(var1580)
	buffer.copy(buff_1, 0, buff, 0, var1580)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref), propTypesModule (ref)
	local var1580 = t_79.new()
	local var1581 = 0
	while var1581 < buffer.len(p79) do
		local _ = nil
		local var1582 = nil
		local var1583, var1584, var1585 = protoModule.readTag(p79, var1581)
		local var1586 = var1583
		var1582 = var1584
		var1581 = var1585
		
		if var1582 == protoModule.wireTypes.varint then
			local _ = nil
			local var1587, var1588 = protoModule.readVarInt(p79, var1581)
			local _ = var1587
			var1581 = var1588
			continue
		end
		if var1582 == protoModule.wireTypes.lengthDelimited then
			if var1586 == 1 then
				local _ = nil
				local var1589, var1590 = protoModule.readBuffer(p79, var1581)
				var1581 = var1590
				var1580.universe_id = propTypesModule.StringProp.decode(var1589)
			else
				local _ = nil
				local var1591, var1592 = protoModule.readVarInt(p79, var1581)
				var1581 = var1592 + var1591
			end
		elseif var1582 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1593, var1594 = protoModule.readFixed32(p79, var1581)
			local _ = var1593
			var1581 = var1594
		elseif var1582 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1595, var1596 = protoModule.readFixed64(p79, var1581)
			local _ = var1595
			var1581 = var1596
		else
			error("Unsupported wire type: " .. var2679)
		end
	end
	return var1580
end

function t_79:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_79:jsonDecode()
	-- upvalues: t_79 (ref), propTypesModule (ref)
	local var1597 = t_79.new()
	
	if self.universe_id ~= nil then
		var1597.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1597.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1597
end

t_79.descriptor = {
	name = "OpenExperienceStoreSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenExperienceStoreSeeAllAction_Params = t_79
typeRegistryModule.default:register(t.OpenExperienceStoreSeeAllAction_Params)
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
	local var1597 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1598, var1599 = protoModule.writeTag(buff, var1597, 1, protoModule.wireTypes.varint)
		var1598, var2699 = protoModule.writeVarInt(var1598, var1599, t.ActionType.toNumber(self.action_type))
		buff = var1598
		var1597 = var1599
	end
	if self.action_params ~= nil then
		local var1600 = self.action_params:encode()
		local var1601, var1602 = protoModule.writeTag(buff, var1597, 2, protoModule.wireTypes.lengthDelimited)
		var1601, var2702 = protoModule.writeBuffer(var1601, var1602, var1600, buffer.len(var1600))
		buff = var1601
		var1597 = var1602
	end
	local buff_1 = buffer.create(var1597)
	buffer.copy(buff_1, 0, buff, 0, var1597)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var1597 = t_80.new()
	local var1598 = 0
	while var1598 < buffer.len(p80) do
		local _ = nil
		local var1599 = nil
		local var1600, var1601, var1602 = protoModule.readTag(p80, var1598)
		local var1603 = var1600
		var1599 = var1601
		var1598 = var1602
		
		if var1599 == protoModule.wireTypes.varint then
			if var1603 == 1 then
				local _ = nil
				local var1604, var1605 = protoModule.readVarIntI32(p80, var1598)
				local var1606 = var1604
				var1598 = var1605
				var1597.action_type = t.ActionType.fromNumber(var1606) or var1606
			else
				local _ = nil
				local var1607, var1608 = protoModule.readVarInt(p80, var1598)
				local _ = var1607
				var1598 = var1608
			end
		end
		if var1599 == protoModule.wireTypes.lengthDelimited then
			if var1603 == 2 then
				local _ = nil
				local var1609, var1610 = protoModule.readBuffer(p80, var1598)
				var1598 = var1610
				var1597.action_params = t.OpenSubscriptionPurchasePageAction_Params.decode(var1609)
			else
				local _ = nil
				local var1611, var1612 = protoModule.readVarInt(p80, var1598)
				var1598 = var1612 + var1611
			end
		elseif var1599 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1613, var1614 = protoModule.readFixed32(p80, var1598)
			local _ = var1613
			var1598 = var1614
		elseif var1599 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1615, var1616 = protoModule.readFixed64(p80, var1598)
			local _ = var1615
			var1598 = var1616
		else
			error("Unsupported wire type: " .. var2706)
		end
	end
	return var1597
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
	local var1617 = t_80.new()
	
	if self.action_type ~= nil then
		var1617.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1617.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1617.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1617.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.actionParams)
	end
	return var1617
end

t_80.descriptor = {
	name = "OpenSubscriptionPurchasePageAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSubscriptionPurchasePageAction"
}
t.OpenSubscriptionPurchasePageAction = t_80
typeRegistryModule.default:register(t.OpenSubscriptionPurchasePageAction)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p81)
	-- upvalues: t_81 (ref)
	return setmetatable({
		subscription_id = if p81 == nil or p81.subscription_id == nil then nil else p81.subscription_id,
		universe_id = if p81 == nil or p81.universe_id == nil then nil else p81.universe_id,
		creator_name = if p81 == nil or p81.creator_name == nil then nil else p81.creator_name,
		creator_verified = if p81 == nil or p81.creator_verified == nil then nil else p81.creator_verified,
		name = if p81 == nil or p81.name == nil then nil else p81.name,
		description = if p81 == nil or p81.description == nil then nil else p81.description,
		image_asset_id = if p81 == nil or p81.image_asset_id == nil then nil else p81.image_asset_id,
		period_type = if p81 == nil or p81.period_type == nil then nil else p81.period_type,
		is_subscribed = if p81 == nil or p81.is_subscribed == nil then nil else p81.is_subscribed,
		price_display = if p81 == nil or p81.price_display == nil then nil else p81.price_display,
		price_in_robux = if p81 == nil or p81.price_in_robux == nil then nil else p81.price_in_robux,
		price_tier = if p81 == nil or p81.price_tier == nil then nil else p81.price_tier,
		thumbnail_string = if p81 == nil or p81.thumbnail_string == nil then nil else p81.thumbnail_string
	}, t_81)
end

function t_81:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1617 = 0
	
	if self.subscription_id ~= nil then
		local var1618 = self.subscription_id:encode()
		local var1619, var1620 = protoModule.writeTag(buff, var1617, 1, protoModule.wireTypes.lengthDelimited)
		var1619, var2730 = protoModule.writeBuffer(var1619, var1620, var1618, buffer.len(var1618))
		buff = var1619
		var1617 = var1620
	end
	if self.universe_id ~= nil then
		local var1621 = self.universe_id:encode()
		local var1622, var1623 = protoModule.writeTag(buff, var1617, 2, protoModule.wireTypes.lengthDelimited)
		var1622, var2733 = protoModule.writeBuffer(var1622, var1623, var1621, buffer.len(var1621))
		buff = var1622
		var1617 = var1623
	end
	if self.creator_name ~= nil then
		local var1624 = self.creator_name:encode()
		local var1625, var1626 = protoModule.writeTag(buff, var1617, 3, protoModule.wireTypes.lengthDelimited)
		var1625, var2736 = protoModule.writeBuffer(var1625, var1626, var1624, buffer.len(var1624))
		buff = var1625
		var1617 = var1626
	end
	if self.creator_verified ~= nil then
		local var1627 = self.creator_verified:encode()
		local var1628, var1629 = protoModule.writeTag(buff, var1617, 4, protoModule.wireTypes.lengthDelimited)
		var1628, var2739 = protoModule.writeBuffer(var1628, var1629, var1627, buffer.len(var1627))
		buff = var1628
		var1617 = var1629
	end
	if self.name ~= nil then
		local var1630 = self.name:encode()
		local var1631, var1632 = protoModule.writeTag(buff, var1617, 5, protoModule.wireTypes.lengthDelimited)
		var1631, var2742 = protoModule.writeBuffer(var1631, var1632, var1630, buffer.len(var1630))
		buff = var1631
		var1617 = var1632
	end
	if self.description ~= nil then
		local var1633 = self.description:encode()
		local var1634, var1635 = protoModule.writeTag(buff, var1617, 6, protoModule.wireTypes.lengthDelimited)
		var1634, var2745 = protoModule.writeBuffer(var1634, var1635, var1633, buffer.len(var1633))
		buff = var1634
		var1617 = var1635
	end
	if self.image_asset_id ~= nil then
		local var1636 = self.image_asset_id:encode()
		local var1637, var1638 = protoModule.writeTag(buff, var1617, 7, protoModule.wireTypes.lengthDelimited)
		var1637, var2748 = protoModule.writeBuffer(var1637, var1638, var1636, buffer.len(var1636))
		buff = var1637
		var1617 = var1638
	end
	if self.period_type ~= nil then
		local var1639 = self.period_type:encode()
		local var1640, var1641 = protoModule.writeTag(buff, var1617, 8, protoModule.wireTypes.lengthDelimited)
		var1640, var2751 = protoModule.writeBuffer(var1640, var1641, var1639, buffer.len(var1639))
		buff = var1640
		var1617 = var1641
	end
	if self.is_subscribed ~= nil then
		local var1642 = self.is_subscribed:encode()
		local var1643, var1644 = protoModule.writeTag(buff, var1617, 9, protoModule.wireTypes.lengthDelimited)
		var1643, var2754 = protoModule.writeBuffer(var1643, var1644, var1642, buffer.len(var1642))
		buff = var1643
		var1617 = var1644
	end
	if self.price_display ~= nil then
		local var1645 = self.price_display:encode()
		local var1646, var1647 = protoModule.writeTag(buff, var1617, 10, protoModule.wireTypes.lengthDelimited)
		var1646, var2757 = protoModule.writeBuffer(var1646, var1647, var1645, buffer.len(var1645))
		buff = var1646
		var1617 = var1647
	end
	if self.price_in_robux ~= nil then
		local var1648 = self.price_in_robux:encode()
		local var1649, var1650 = protoModule.writeTag(buff, var1617, 11, protoModule.wireTypes.lengthDelimited)
		var1649, var2760 = protoModule.writeBuffer(var1649, var1650, var1648, buffer.len(var1648))
		buff = var1649
		var1617 = var1650
	end
	if self.price_tier ~= nil then
		local var1651 = self.price_tier:encode()
		local var1652, var1653 = protoModule.writeTag(buff, var1617, 12, protoModule.wireTypes.lengthDelimited)
		var1652, var2763 = protoModule.writeBuffer(var1652, var1653, var1651, buffer.len(var1651))
		buff = var1652
		var1617 = var1653
	end
	if self.thumbnail_string ~= nil then
		local var1654 = self.thumbnail_string:encode()
		local var1655, var1656 = protoModule.writeTag(buff, var1617, 13, protoModule.wireTypes.lengthDelimited)
		var1655, var2766 = protoModule.writeBuffer(var1655, var1656, var1654, buffer.len(var1654))
		buff = var1655
		var1617 = var1656
	end
	local buff_1 = buffer.create(var1617)
	buffer.copy(buff_1, 0, buff, 0, var1617)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref), propTypesModule (ref)
	local var1617 = t_81.new()
	local var1618 = 0
	while var1618 < buffer.len(p81) do
		local _ = nil
		local var1619 = nil
		local var1620, var1621, var1622 = protoModule.readTag(p81, var1618)
		local var1623 = var1620
		var1619 = var1621
		var1618 = var1622
		
		if var1619 == protoModule.wireTypes.varint then
			local _ = nil
			local var1624, var1625 = protoModule.readVarInt(p81, var1618)
			local _ = var1624
			var1618 = var1625
			continue
		end
		if var1619 == protoModule.wireTypes.lengthDelimited then
			if var1623 == 1 then
				local _ = nil
				local var1626, var1627 = protoModule.readBuffer(p81, var1618)
				var1618 = var1627
				var1617.subscription_id = propTypesModule.StringProp.decode(var1626)
			elseif var1623 == 2 then
				local _ = nil
				local var1628, var1629 = protoModule.readBuffer(p81, var1618)
				var1618 = var1629
				var1617.universe_id = propTypesModule.StringProp.decode(var1628)
			elseif var1623 == 3 then
				local _ = nil
				local var1630, var1631 = protoModule.readBuffer(p81, var1618)
				var1618 = var1631
				var1617.creator_name = propTypesModule.StringProp.decode(var1630)
			elseif var1623 == 4 then
				local _ = nil
				local var1632, var1633 = protoModule.readBuffer(p81, var1618)
				var1618 = var1633
				var1617.creator_verified = propTypesModule.BoolProp.decode(var1632)
			elseif var1623 == 5 then
				local _ = nil
				local var1634, var1635 = protoModule.readBuffer(p81, var1618)
				var1618 = var1635
				var1617.name = propTypesModule.StringProp.decode(var1634)
			elseif var1623 == 6 then
				local _ = nil
				local var1636, var1637 = protoModule.readBuffer(p81, var1618)
				var1618 = var1637
				var1617.description = propTypesModule.StringProp.decode(var1636)
			elseif var1623 == 7 then
				local _ = nil
				local var1638, var1639 = protoModule.readBuffer(p81, var1618)
				var1618 = var1639
				var1617.image_asset_id = propTypesModule.Int64Prop.decode(var1638)
			elseif var1623 == 8 then
				local _ = nil
				local var1640, var1641 = protoModule.readBuffer(p81, var1618)
				var1618 = var1641
				var1617.period_type = propTypesModule.StringProp.decode(var1640)
			elseif var1623 == 9 then
				local _ = nil
				local var1642, var1643 = protoModule.readBuffer(p81, var1618)
				var1618 = var1643
				var1617.is_subscribed = propTypesModule.BoolProp.decode(var1642)
			elseif var1623 == 10 then
				local _ = nil
				local var1644, var1645 = protoModule.readBuffer(p81, var1618)
				var1618 = var1645
				var1617.price_display = propTypesModule.StringProp.decode(var1644)
			elseif var1623 == 11 then
				local _ = nil
				local var1646, var1647 = protoModule.readBuffer(p81, var1618)
				var1618 = var1647
				var1617.price_in_robux = propTypesModule.Int64Prop.decode(var1646)
			elseif var1623 == 12 then
				local _ = nil
				local var1648, var1649 = protoModule.readBuffer(p81, var1618)
				var1618 = var1649
				var1617.price_tier = propTypesModule.Int64Prop.decode(var1648)
			elseif var1623 == 13 then
				local _ = nil
				local var1650, var1651 = protoModule.readBuffer(p81, var1618)
				var1618 = var1651
				var1617.thumbnail_string = propTypesModule.StringProp.decode(var1650)
			else
				local _ = nil
				local var1652, var1653 = protoModule.readVarInt(p81, var1618)
				var1618 = var1653 + var1652
			end
		elseif var1619 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1654, var1655 = protoModule.readFixed32(p81, var1618)
			local _ = var1654
			var1618 = var1655
		elseif var1619 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1656, var1657 = protoModule.readFixed64(p81, var1618)
			local _ = var1656
			var1618 = var1657
		else
			error("Unsupported wire type: " .. var2770)
		end
	end
	return var1617
end

function t_81:jsonEncode()
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

function t_81:jsonDecode()
	-- upvalues: t_81 (ref), propTypesModule (ref)
	local var1658 = t_81.new()
	
	if self.subscription_id ~= nil then
		var1658.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		var1658.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		var1658.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1658.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.creator_name ~= nil then
		var1658.creator_name = propTypesModule.StringProp.jsonDecode(self.creator_name)
	end
	if self.creatorName ~= nil then
		var1658.creator_name = propTypesModule.StringProp.jsonDecode(self.creatorName)
	end
	if self.creator_verified ~= nil then
		var1658.creator_verified = propTypesModule.BoolProp.jsonDecode(self.creator_verified)
	end
	if self.creatorVerified ~= nil then
		var1658.creator_verified = propTypesModule.BoolProp.jsonDecode(self.creatorVerified)
	end
	if self.name ~= nil then
		var1658.name = propTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.description ~= nil then
		var1658.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_asset_id ~= nil then
		var1658.image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.image_asset_id)
	end
	if self.imageAssetId ~= nil then
		var1658.image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.imageAssetId)
	end
	if self.period_type ~= nil then
		var1658.period_type = propTypesModule.StringProp.jsonDecode(self.period_type)
	end
	if self.periodType ~= nil then
		var1658.period_type = propTypesModule.StringProp.jsonDecode(self.periodType)
	end
	if self.is_subscribed ~= nil then
		var1658.is_subscribed = propTypesModule.BoolProp.jsonDecode(self.is_subscribed)
	end
	if self.isSubscribed ~= nil then
		var1658.is_subscribed = propTypesModule.BoolProp.jsonDecode(self.isSubscribed)
	end
	if self.price_display ~= nil then
		var1658.price_display = propTypesModule.StringProp.jsonDecode(self.price_display)
	end
	if self.priceDisplay ~= nil then
		var1658.price_display = propTypesModule.StringProp.jsonDecode(self.priceDisplay)
	end
	if self.price_in_robux ~= nil then
		var1658.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		var1658.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.price_tier ~= nil then
		var1658.price_tier = propTypesModule.Int64Prop.jsonDecode(self.price_tier)
	end
	if self.priceTier ~= nil then
		var1658.price_tier = propTypesModule.Int64Prop.jsonDecode(self.priceTier)
	end
	if self.thumbnail_string ~= nil then
		var1658.thumbnail_string = propTypesModule.StringProp.jsonDecode(self.thumbnail_string)
	end
	if self.thumbnailString ~= nil then
		var1658.thumbnail_string = propTypesModule.StringProp.jsonDecode(self.thumbnailString)
	end
	return var1658
end

t_81.descriptor = {
	name = "OpenSubscriptionPurchasePageAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSubscriptionPurchasePageAction_Params = t_81
typeRegistryModule.default:register(t.OpenSubscriptionPurchasePageAction_Params)
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
	local var1658 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1659, var1660 = protoModule.writeTag(buff, var1658, 1, protoModule.wireTypes.varint)
		var1659, var2814 = protoModule.writeVarInt(var1659, var1660, t.ActionType.toNumber(self.action_type))
		buff = var1659
		var1658 = var1660
	end
	if self.action_params ~= nil then
		local var1661 = self.action_params:encode()
		local var1662, var1663 = protoModule.writeTag(buff, var1658, 2, protoModule.wireTypes.lengthDelimited)
		var1662, var2817 = protoModule.writeBuffer(var1662, var1663, var1661, buffer.len(var1661))
		buff = var1662
		var1658 = var1663
	end
	local buff_1 = buffer.create(var1658)
	buffer.copy(buff_1, 0, buff, 0, var1658)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var1658 = t_82.new()
	local var1659 = 0
	while var1659 < buffer.len(p82) do
		local _ = nil
		local var1660 = nil
		local var1661, var1662, var1663 = protoModule.readTag(p82, var1659)
		local var1664 = var1661
		var1660 = var1662
		var1659 = var1663
		
		if var1660 == protoModule.wireTypes.varint then
			if var1664 == 1 then
				local _ = nil
				local var1665, var1666 = protoModule.readVarIntI32(p82, var1659)
				local var1667 = var1665
				var1659 = var1666
				var1658.action_type = t.ActionType.fromNumber(var1667) or var1667
			else
				local _ = nil
				local var1668, var1669 = protoModule.readVarInt(p82, var1659)
				local _ = var1668
				var1659 = var1669
			end
		end
		if var1660 == protoModule.wireTypes.lengthDelimited then
			if var1664 == 2 then
				local _ = nil
				local var1670, var1671 = protoModule.readBuffer(p82, var1659)
				var1659 = var1671
				var1658.action_params = t.RefreshGamePassesAction_Params.decode(var1670)
			else
				local _ = nil
				local var1672, var1673 = protoModule.readVarInt(p82, var1659)
				var1659 = var1673 + var1672
			end
		elseif var1660 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1674, var1675 = protoModule.readFixed32(p82, var1659)
			local _ = var1674
			var1659 = var1675
		elseif var1660 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1676, var1677 = protoModule.readFixed64(p82, var1659)
			local _ = var1676
			var1659 = var1677
		else
			error("Unsupported wire type: " .. var2821)
		end
	end
	return var1658
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
	local var1678 = t_82.new()
	
	if self.action_type ~= nil then
		var1678.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1678.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1678.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1678.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.actionParams)
	end
	return var1678
end

t_82.descriptor = {
	name = "RefreshGamePassesAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshGamePassesAction"
}
t.RefreshGamePassesAction = t_82
typeRegistryModule.default:register(t.RefreshGamePassesAction)
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
	local var1678 = 0
	
	if self.universe_id ~= nil then
		local var1679 = self.universe_id:encode()
		local var1680, var1681 = protoModule.writeTag(buff, var1678, 1, protoModule.wireTypes.lengthDelimited)
		var1680, var2845 = protoModule.writeBuffer(var1680, var1681, var1679, buffer.len(var1679))
		buff = var1680
		var1678 = var1681
	end
	local buff_1 = buffer.create(var1678)
	buffer.copy(buff_1, 0, buff, 0, var1678)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), propTypesModule (ref)
	local var1678 = t_83.new()
	local var1679 = 0
	while var1679 < buffer.len(p83) do
		local _ = nil
		local var1680 = nil
		local var1681, var1682, var1683 = protoModule.readTag(p83, var1679)
		local var1684 = var1681
		var1680 = var1682
		var1679 = var1683
		
		if var1680 == protoModule.wireTypes.varint then
			local _ = nil
			local var1685, var1686 = protoModule.readVarInt(p83, var1679)
			local _ = var1685
			var1679 = var1686
			continue
		end
		if var1680 == protoModule.wireTypes.lengthDelimited then
			if var1684 == 1 then
				local _ = nil
				local var1687, var1688 = protoModule.readBuffer(p83, var1679)
				var1679 = var1688
				var1678.universe_id = propTypesModule.StringProp.decode(var1687)
			else
				local _ = nil
				local var1689, var1690 = protoModule.readVarInt(p83, var1679)
				var1679 = var1690 + var1689
			end
		elseif var1680 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1691, var1692 = protoModule.readFixed32(p83, var1679)
			local _ = var1691
			var1679 = var1692
		elseif var1680 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1693, var1694 = protoModule.readFixed64(p83, var1679)
			local _ = var1693
			var1679 = var1694
		else
			error("Unsupported wire type: " .. var2849)
		end
	end
	return var1678
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
	local var1695 = t_83.new()
	
	if self.universe_id ~= nil then
		var1695.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1695.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1695
end

t_83.descriptor = {
	name = "RefreshGamePassesAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshGamePassesAction_Params = t_83
typeRegistryModule.default:register(t.RefreshGamePassesAction_Params)
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
	local var1695 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1696, var1697 = protoModule.writeTag(buff, var1695, 1, protoModule.wireTypes.varint)
		var1696, var2869 = protoModule.writeVarInt(var1696, var1697, t.ActionType.toNumber(self.action_type))
		buff = var1696
		var1695 = var1697
	end
	if self.action_params ~= nil then
		local var1698 = self.action_params:encode()
		local var1699, var1700 = protoModule.writeTag(buff, var1695, 2, protoModule.wireTypes.lengthDelimited)
		var1699, var2872 = protoModule.writeBuffer(var1699, var1700, var1698, buffer.len(var1698))
		buff = var1699
		var1695 = var1700
	end
	local buff_1 = buffer.create(var1695)
	buffer.copy(buff_1, 0, buff, 0, var1695)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var1695 = t_84.new()
	local var1696 = 0
	while var1696 < buffer.len(p84) do
		local _ = nil
		local var1697 = nil
		local var1698, var1699, var1700 = protoModule.readTag(p84, var1696)
		local var1701 = var1698
		var1697 = var1699
		var1696 = var1700
		
		if var1697 == protoModule.wireTypes.varint then
			if var1701 == 1 then
				local _ = nil
				local var1702, var1703 = protoModule.readVarIntI32(p84, var1696)
				local var1704 = var1702
				var1696 = var1703
				var1695.action_type = t.ActionType.fromNumber(var1704) or var1704
			else
				local _ = nil
				local var1705, var1706 = protoModule.readVarInt(p84, var1696)
				local _ = var1705
				var1696 = var1706
			end
		end
		if var1697 == protoModule.wireTypes.lengthDelimited then
			if var1701 == 2 then
				local _ = nil
				local var1707, var1708 = protoModule.readBuffer(p84, var1696)
				var1696 = var1708
				var1695.action_params = t.RefreshPlayabilityAction_Params.decode(var1707)
			else
				local _ = nil
				local var1709, var1710 = protoModule.readVarInt(p84, var1696)
				var1696 = var1710 + var1709
			end
		elseif var1697 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1711, var1712 = protoModule.readFixed32(p84, var1696)
			local _ = var1711
			var1696 = var1712
		elseif var1697 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1713, var1714 = protoModule.readFixed64(p84, var1696)
			local _ = var1713
			var1696 = var1714
		else
			error("Unsupported wire type: " .. var2876)
		end
	end
	return var1695
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
	local var1715 = t_84.new()
	
	if self.action_type ~= nil then
		var1715.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1715.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1715.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1715.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.actionParams)
	end
	return var1715
end

t_84.descriptor = {
	name = "RefreshPlayabilityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshPlayabilityAction"
}
t.RefreshPlayabilityAction = t_84
typeRegistryModule.default:register(t.RefreshPlayabilityAction)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p85)
	-- upvalues: t_85 (ref)
	return setmetatable({
		universe_id = if p85 == nil or p85.universe_id == nil then nil else p85.universe_id
	}, t_85)
end

function t_85:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1715 = 0
	
	if self.universe_id ~= nil then
		local var1716 = self.universe_id:encode()
		local var1717, var1718 = protoModule.writeTag(buff, var1715, 1, protoModule.wireTypes.lengthDelimited)
		var1717, var2900 = protoModule.writeBuffer(var1717, var1718, var1716, buffer.len(var1716))
		buff = var1717
		var1715 = var1718
	end
	local buff_1 = buffer.create(var1715)
	buffer.copy(buff_1, 0, buff, 0, var1715)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), propTypesModule (ref)
	local var1715 = t_85.new()
	local var1716 = 0
	while var1716 < buffer.len(p85) do
		local _ = nil
		local var1717 = nil
		local var1718, var1719, var1720 = protoModule.readTag(p85, var1716)
		local var1721 = var1718
		var1717 = var1719
		var1716 = var1720
		
		if var1717 == protoModule.wireTypes.varint then
			local _ = nil
			local var1722, var1723 = protoModule.readVarInt(p85, var1716)
			local _ = var1722
			var1716 = var1723
			continue
		end
		if var1717 == protoModule.wireTypes.lengthDelimited then
			if var1721 == 1 then
				local _ = nil
				local var1724, var1725 = protoModule.readBuffer(p85, var1716)
				var1716 = var1725
				var1715.universe_id = propTypesModule.StringProp.decode(var1724)
			else
				local _ = nil
				local var1726, var1727 = protoModule.readVarInt(p85, var1716)
				var1716 = var1727 + var1726
			end
		elseif var1717 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1728, var1729 = protoModule.readFixed32(p85, var1716)
			local _ = var1728
			var1716 = var1729
		elseif var1717 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1730, var1731 = protoModule.readFixed64(p85, var1716)
			local _ = var1730
			var1716 = var1731
		else
			error("Unsupported wire type: " .. var2904)
		end
	end
	return var1715
end

function t_85:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_85:jsonDecode()
	-- upvalues: t_85 (ref), propTypesModule (ref)
	local var1732 = t_85.new()
	
	if self.universe_id ~= nil then
		var1732.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1732.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1732
end

t_85.descriptor = {
	name = "RefreshPlayabilityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshPlayabilityAction_Params = t_85
typeRegistryModule.default:register(t.RefreshPlayabilityAction_Params)
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
	local var1732 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1733, var1734 = protoModule.writeTag(buff, var1732, 1, protoModule.wireTypes.varint)
		var1733, var2924 = protoModule.writeVarInt(var1733, var1734, t.ActionType.toNumber(self.action_type))
		buff = var1733
		var1732 = var1734
	end
	if self.action_params ~= nil then
		local var1735 = self.action_params:encode()
		local var1736, var1737 = protoModule.writeTag(buff, var1732, 2, protoModule.wireTypes.lengthDelimited)
		var1736, var2927 = protoModule.writeBuffer(var1736, var1737, var1735, buffer.len(var1735))
		buff = var1736
		var1732 = var1737
	end
	local buff_1 = buffer.create(var1732)
	buffer.copy(buff_1, 0, buff, 0, var1732)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var1732 = t_86.new()
	local var1733 = 0
	while var1733 < buffer.len(p86) do
		local _ = nil
		local var1734 = nil
		local var1735, var1736, var1737 = protoModule.readTag(p86, var1733)
		local var1738 = var1735
		var1734 = var1736
		var1733 = var1737
		
		if var1734 == protoModule.wireTypes.varint then
			if var1738 == 1 then
				local _ = nil
				local var1739, var1740 = protoModule.readVarIntI32(p86, var1733)
				local var1741 = var1739
				var1733 = var1740
				var1732.action_type = t.ActionType.fromNumber(var1741) or var1741
			else
				local _ = nil
				local var1742, var1743 = protoModule.readVarInt(p86, var1733)
				local _ = var1742
				var1733 = var1743
			end
		end
		if var1734 == protoModule.wireTypes.lengthDelimited then
			if var1738 == 2 then
				local _ = nil
				local var1744, var1745 = protoModule.readBuffer(p86, var1733)
				var1733 = var1745
				var1732.action_params = t.RefreshDeveloperProductsAction_Params.decode(var1744)
			else
				local _ = nil
				local var1746, var1747 = protoModule.readVarInt(p86, var1733)
				var1733 = var1747 + var1746
			end
		elseif var1734 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1748, var1749 = protoModule.readFixed32(p86, var1733)
			local _ = var1748
			var1733 = var1749
		elseif var1734 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1750, var1751 = protoModule.readFixed64(p86, var1733)
			local _ = var1750
			var1733 = var1751
		else
			error("Unsupported wire type: " .. var2931)
		end
	end
	return var1732
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
	local var1752 = t_86.new()
	
	if self.action_type ~= nil then
		var1752.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1752.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1752.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1752.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.actionParams)
	end
	return var1752
end

t_86.descriptor = {
	name = "RefreshDeveloperProductsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshDeveloperProductsAction"
}
t.RefreshDeveloperProductsAction = t_86
typeRegistryModule.default:register(t.RefreshDeveloperProductsAction)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p87)
	-- upvalues: t_87 (ref)
	return setmetatable({
		place_id = if p87 == nil or p87.place_id == nil then nil else p87.place_id
	}, t_87)
end

function t_87:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1752 = 0
	
	if self.place_id ~= nil then
		local var1753 = self.place_id:encode()
		local var1754, var1755 = protoModule.writeTag(buff, var1752, 1, protoModule.wireTypes.lengthDelimited)
		var1754, var2955 = protoModule.writeBuffer(var1754, var1755, var1753, buffer.len(var1753))
		buff = var1754
		var1752 = var1755
	end
	local buff_1 = buffer.create(var1752)
	buffer.copy(buff_1, 0, buff, 0, var1752)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref), propTypesModule (ref)
	local var1752 = t_87.new()
	local var1753 = 0
	while var1753 < buffer.len(p87) do
		local _ = nil
		local var1754 = nil
		local var1755, var1756, var1757 = protoModule.readTag(p87, var1753)
		local var1758 = var1755
		var1754 = var1756
		var1753 = var1757
		
		if var1754 == protoModule.wireTypes.varint then
			local _ = nil
			local var1759, var1760 = protoModule.readVarInt(p87, var1753)
			local _ = var1759
			var1753 = var1760
			continue
		end
		if var1754 == protoModule.wireTypes.lengthDelimited then
			if var1758 == 1 then
				local _ = nil
				local var1761, var1762 = protoModule.readBuffer(p87, var1753)
				var1753 = var1762
				var1752.place_id = propTypesModule.StringProp.decode(var1761)
			else
				local _ = nil
				local var1763, var1764 = protoModule.readVarInt(p87, var1753)
				var1753 = var1764 + var1763
			end
		elseif var1754 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1765, var1766 = protoModule.readFixed32(p87, var1753)
			local _ = var1765
			var1753 = var1766
		elseif var1754 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1767, var1768 = protoModule.readFixed64(p87, var1753)
			local _ = var1767
			var1753 = var1768
		else
			error("Unsupported wire type: " .. var2959)
		end
	end
	return var1752
end

function t_87:jsonEncode()
	local t = {}
	
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	return t
end

function t_87:jsonDecode()
	-- upvalues: t_87 (ref), propTypesModule (ref)
	local var1769 = t_87.new()
	
	if self.place_id ~= nil then
		var1769.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var1769.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	return var1769
end

t_87.descriptor = {
	name = "RefreshDeveloperProductsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshDeveloperProductsAction_Params = t_87
typeRegistryModule.default:register(t.RefreshDeveloperProductsAction_Params)
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
	local var1769 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1770, var1771 = protoModule.writeTag(buff, var1769, 1, protoModule.wireTypes.varint)
		var1770, var2979 = protoModule.writeVarInt(var1770, var1771, t.ActionType.toNumber(self.action_type))
		buff = var1770
		var1769 = var1771
	end
	if self.action_params ~= nil then
		local var1772 = self.action_params:encode()
		local var1773, var1774 = protoModule.writeTag(buff, var1769, 2, protoModule.wireTypes.lengthDelimited)
		var1773, var2982 = protoModule.writeBuffer(var1773, var1774, var1772, buffer.len(var1772))
		buff = var1773
		var1769 = var1774
	end
	local buff_1 = buffer.create(var1769)
	buffer.copy(buff_1, 0, buff, 0, var1769)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var1769 = t_88.new()
	local var1770 = 0
	while var1770 < buffer.len(p88) do
		local _ = nil
		local var1771 = nil
		local var1772, var1773, var1774 = protoModule.readTag(p88, var1770)
		local var1775 = var1772
		var1771 = var1773
		var1770 = var1774
		
		if var1771 == protoModule.wireTypes.varint then
			if var1775 == 1 then
				local _ = nil
				local var1776, var1777 = protoModule.readVarIntI32(p88, var1770)
				local var1778 = var1776
				var1770 = var1777
				var1769.action_type = t.ActionType.fromNumber(var1778) or var1778
			else
				local _ = nil
				local var1779, var1780 = protoModule.readVarInt(p88, var1770)
				local _ = var1779
				var1770 = var1780
			end
		end
		if var1771 == protoModule.wireTypes.lengthDelimited then
			if var1775 == 2 then
				local _ = nil
				local var1781, var1782 = protoModule.readBuffer(p88, var1770)
				var1770 = var1782
				var1769.action_params = t.OpenFaeTrialUpsellAction_Params.decode(var1781)
			else
				local _ = nil
				local var1783, var1784 = protoModule.readVarInt(p88, var1770)
				var1770 = var1784 + var1783
			end
		elseif var1771 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1785, var1786 = protoModule.readFixed32(p88, var1770)
			local _ = var1785
			var1770 = var1786
		elseif var1771 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1787, var1788 = protoModule.readFixed64(p88, var1770)
			local _ = var1787
			var1770 = var1788
		else
			error("Unsupported wire type: " .. var2986)
		end
	end
	return var1769
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
	local var1789 = t_88.new()
	
	if self.action_type ~= nil then
		var1789.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1789.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1789.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1789.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.actionParams)
	end
	return var1789
end

t_88.descriptor = {
	name = "OpenFaeTrialUpsellAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenFaeTrialUpsellAction"
}
t.OpenFaeTrialUpsellAction = t_88
typeRegistryModule.default:register(t.OpenFaeTrialUpsellAction)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p89)
	-- upvalues: t_89 (ref)
	return setmetatable({
		source = if p89 == nil or p89.source == nil then nil else p89.source,
		config_key = if p89 == nil or p89.config_key == nil then nil else p89.config_key,
		surface_key = if p89 == nil or p89.surface_key == nil then nil else p89.surface_key,
		prompt_type = if p89 == nil or p89.prompt_type == nil then nil else p89.prompt_type
	}, t_89)
end

function t_89:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1789 = 0
	
	if self.source ~= nil then
		local var1790 = self.source:encode()
		local var1791, var1792 = protoModule.writeTag(buff, var1789, 1, protoModule.wireTypes.lengthDelimited)
		var1791, var3010 = protoModule.writeBuffer(var1791, var1792, var1790, buffer.len(var1790))
		buff = var1791
		var1789 = var1792
	end
	if self.config_key ~= nil then
		local var1793 = self.config_key:encode()
		local var1794, var1795 = protoModule.writeTag(buff, var1789, 2, protoModule.wireTypes.lengthDelimited)
		var1794, var3013 = protoModule.writeBuffer(var1794, var1795, var1793, buffer.len(var1793))
		buff = var1794
		var1789 = var1795
	end
	if self.surface_key ~= nil then
		local var1796 = self.surface_key:encode()
		local var1797, var1798 = protoModule.writeTag(buff, var1789, 3, protoModule.wireTypes.lengthDelimited)
		var1797, var3016 = protoModule.writeBuffer(var1797, var1798, var1796, buffer.len(var1796))
		buff = var1797
		var1789 = var1798
	end
	if self.prompt_type ~= nil then
		local var1799 = self.prompt_type:encode()
		local var1800, var1801 = protoModule.writeTag(buff, var1789, 4, protoModule.wireTypes.lengthDelimited)
		var1800, var3019 = protoModule.writeBuffer(var1800, var1801, var1799, buffer.len(var1799))
		buff = var1800
		var1789 = var1801
	end
	local buff_1 = buffer.create(var1789)
	buffer.copy(buff_1, 0, buff, 0, var1789)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref), propTypesModule (ref)
	local var1789 = t_89.new()
	local var1790 = 0
	while var1790 < buffer.len(p89) do
		local _ = nil
		local var1791 = nil
		local var1792, var1793, var1794 = protoModule.readTag(p89, var1790)
		local var1795 = var1792
		var1791 = var1793
		var1790 = var1794
		
		if var1791 == protoModule.wireTypes.varint then
			local _ = nil
			local var1796, var1797 = protoModule.readVarInt(p89, var1790)
			local _ = var1796
			var1790 = var1797
			continue
		end
		if var1791 == protoModule.wireTypes.lengthDelimited then
			if var1795 == 1 then
				local _ = nil
				local var1798, var1799 = protoModule.readBuffer(p89, var1790)
				var1790 = var1799
				var1789.source = propTypesModule.StringProp.decode(var1798)
			elseif var1795 == 2 then
				local _ = nil
				local var1800, var1801 = protoModule.readBuffer(p89, var1790)
				var1790 = var1801
				var1789.config_key = propTypesModule.StringProp.decode(var1800)
			elseif var1795 == 3 then
				local _ = nil
				local var1802, var1803 = protoModule.readBuffer(p89, var1790)
				var1790 = var1803
				var1789.surface_key = propTypesModule.StringProp.decode(var1802)
			elseif var1795 == 4 then
				local _ = nil
				local var1804, var1805 = protoModule.readBuffer(p89, var1790)
				var1790 = var1805
				var1789.prompt_type = propTypesModule.StringProp.decode(var1804)
			else
				local _ = nil
				local var1806, var1807 = protoModule.readVarInt(p89, var1790)
				var1790 = var1807 + var1806
			end
		elseif var1791 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1808, var1809 = protoModule.readFixed32(p89, var1790)
			local _ = var1808
			var1790 = var1809
		elseif var1791 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1810, var1811 = protoModule.readFixed64(p89, var1790)
			local _ = var1810
			var1790 = var1811
		else
			error("Unsupported wire type: " .. var3023)
		end
	end
	return var1789
end

function t_89:jsonEncode()
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

function t_89:jsonDecode()
	-- upvalues: t_89 (ref), propTypesModule (ref)
	local var1812 = t_89.new()
	
	if self.source ~= nil then
		var1812.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.config_key ~= nil then
		var1812.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1812.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.surface_key ~= nil then
		var1812.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var1812.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.prompt_type ~= nil then
		var1812.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1812.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	return var1812
end

t_89.descriptor = {
	name = "OpenFaeTrialUpsellAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenFaeTrialUpsellAction_Params = t_89
typeRegistryModule.default:register(t.OpenFaeTrialUpsellAction_Params)
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
	local var1812 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1813, var1814 = protoModule.writeTag(buff, var1812, 1, protoModule.wireTypes.varint)
		var1813, var3049 = protoModule.writeVarInt(var1813, var1814, t.ActionType.toNumber(self.action_type))
		buff = var1813
		var1812 = var1814
	end
	if self.action_params ~= nil then
		local var1815 = self.action_params:encode()
		local var1816, var1817 = protoModule.writeTag(buff, var1812, 2, protoModule.wireTypes.lengthDelimited)
		var1816, var3052 = protoModule.writeBuffer(var1816, var1817, var1815, buffer.len(var1815))
		buff = var1816
		var1812 = var1817
	end
	local buff_1 = buffer.create(var1812)
	buffer.copy(buff_1, 0, buff, 0, var1812)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref), t (ref)
	local var1812 = t_90.new()
	local var1813 = 0
	while var1813 < buffer.len(p90) do
		local _ = nil
		local var1814 = nil
		local var1815, var1816, var1817 = protoModule.readTag(p90, var1813)
		local var1818 = var1815
		var1814 = var1816
		var1813 = var1817
		
		if var1814 == protoModule.wireTypes.varint then
			if var1818 == 1 then
				local _ = nil
				local var1819, var1820 = protoModule.readVarIntI32(p90, var1813)
				local var1821 = var1819
				var1813 = var1820
				var1812.action_type = t.ActionType.fromNumber(var1821) or var1821
			else
				local _ = nil
				local var1822, var1823 = protoModule.readVarInt(p90, var1813)
				local _ = var1822
				var1813 = var1823
			end
		end
		if var1814 == protoModule.wireTypes.lengthDelimited then
			if var1818 == 2 then
				local _ = nil
				local var1824, var1825 = protoModule.readBuffer(p90, var1813)
				var1813 = var1825
				var1812.action_params = t.OpenIncomingTransferUpsellAction_Params.decode(var1824)
			else
				local _ = nil
				local var1826, var1827 = protoModule.readVarInt(p90, var1813)
				var1813 = var1827 + var1826
			end
		elseif var1814 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1828, var1829 = protoModule.readFixed32(p90, var1813)
			local _ = var1828
			var1813 = var1829
		elseif var1814 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1830, var1831 = protoModule.readFixed64(p90, var1813)
			local _ = var1830
			var1813 = var1831
		else
			error("Unsupported wire type: " .. var3056)
		end
	end
	return var1812
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
	local var1832 = t_90.new()
	
	if self.action_type ~= nil then
		var1832.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1832.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1832.action_params = t.OpenIncomingTransferUpsellAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1832.action_params = t.OpenIncomingTransferUpsellAction_Params.jsonDecode(self.actionParams)
	end
	return var1832
end

t_90.descriptor = {
	name = "OpenIncomingTransferUpsellAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenIncomingTransferUpsellAction"
}
t.OpenIncomingTransferUpsellAction = t_90
typeRegistryModule.default:register(t.OpenIncomingTransferUpsellAction)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p91)
	-- upvalues: t_91 (ref)
	return setmetatable({
		url = if p91 == nil or p91.url == nil then nil else p91.url,
		prompt_type = if p91 == nil or p91.prompt_type == nil then nil else p91.prompt_type,
		prompt_id = if p91 == nil or p91.prompt_id == nil then nil else p91.prompt_id
	}, t_91)
end

function t_91:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1832 = 0
	
	if self.url ~= nil then
		local var1833 = self.url:encode()
		local var1834, var1835 = protoModule.writeTag(buff, var1832, 1, protoModule.wireTypes.lengthDelimited)
		var1834, var3080 = protoModule.writeBuffer(var1834, var1835, var1833, buffer.len(var1833))
		buff = var1834
		var1832 = var1835
	end
	if self.prompt_type ~= nil then
		local var1836 = self.prompt_type:encode()
		local var1837, var1838 = protoModule.writeTag(buff, var1832, 2, protoModule.wireTypes.lengthDelimited)
		var1837, var3083 = protoModule.writeBuffer(var1837, var1838, var1836, buffer.len(var1836))
		buff = var1837
		var1832 = var1838
	end
	if self.prompt_id ~= nil then
		local var1839 = self.prompt_id:encode()
		local var1840, var1841 = protoModule.writeTag(buff, var1832, 3, protoModule.wireTypes.lengthDelimited)
		var1840, var3086 = protoModule.writeBuffer(var1840, var1841, var1839, buffer.len(var1839))
		buff = var1840
		var1832 = var1841
	end
	local buff_1 = buffer.create(var1832)
	buffer.copy(buff_1, 0, buff, 0, var1832)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref), propTypesModule (ref)
	local var1832 = t_91.new()
	local var1833 = 0
	while var1833 < buffer.len(p91) do
		local _ = nil
		local var1834 = nil
		local var1835, var1836, var1837 = protoModule.readTag(p91, var1833)
		local var1838 = var1835
		var1834 = var1836
		var1833 = var1837
		
		if var1834 == protoModule.wireTypes.varint then
			local _ = nil
			local var1839, var1840 = protoModule.readVarInt(p91, var1833)
			local _ = var1839
			var1833 = var1840
			continue
		end
		if var1834 == protoModule.wireTypes.lengthDelimited then
			if var1838 == 1 then
				local _ = nil
				local var1841, var1842 = protoModule.readBuffer(p91, var1833)
				var1833 = var1842
				var1832.url = propTypesModule.StringProp.decode(var1841)
			elseif var1838 == 2 then
				local _ = nil
				local var1843, var1844 = protoModule.readBuffer(p91, var1833)
				var1833 = var1844
				var1832.prompt_type = propTypesModule.StringProp.decode(var1843)
			elseif var1838 == 3 then
				local _ = nil
				local var1845, var1846 = protoModule.readBuffer(p91, var1833)
				var1833 = var1846
				var1832.prompt_id = propTypesModule.StringProp.decode(var1845)
			else
				local _ = nil
				local var1847, var1848 = protoModule.readVarInt(p91, var1833)
				var1833 = var1848 + var1847
			end
		elseif var1834 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1849, var1850 = protoModule.readFixed32(p91, var1833)
			local _ = var1849
			var1833 = var1850
		elseif var1834 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1851, var1852 = protoModule.readFixed64(p91, var1833)
			local _ = var1851
			var1833 = var1852
		else
			error("Unsupported wire type: " .. var3090)
		end
	end
	return var1832
end

function t_91:jsonEncode()
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

function t_91:jsonDecode()
	-- upvalues: t_91 (ref), propTypesModule (ref)
	local var1853 = t_91.new()
	
	if self.url ~= nil then
		var1853.url = propTypesModule.StringProp.jsonDecode(self.url)
	end
	if self.prompt_type ~= nil then
		var1853.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1853.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var1853.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1853.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	return var1853
end

t_91.descriptor = {
	name = "OpenIncomingTransferUpsellAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenIncomingTransferUpsellAction_Params = t_91
typeRegistryModule.default:register(t.OpenIncomingTransferUpsellAction_Params)
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
	local var1853 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1854, var1855 = protoModule.writeTag(buff, var1853, 1, protoModule.wireTypes.varint)
		var1854, var3114 = protoModule.writeVarInt(var1854, var1855, t.ActionType.toNumber(self.action_type))
		buff = var1854
		var1853 = var1855
	end
	if self.action_params ~= nil then
		local var1856 = self.action_params:encode()
		local var1857, var1858 = protoModule.writeTag(buff, var1853, 2, protoModule.wireTypes.lengthDelimited)
		var1857, var3117 = protoModule.writeBuffer(var1857, var1858, var1856, buffer.len(var1856))
		buff = var1857
		var1853 = var1858
	end
	local buff_1 = buffer.create(var1853)
	buffer.copy(buff_1, 0, buff, 0, var1853)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var1853 = t_92.new()
	local var1854 = 0
	while var1854 < buffer.len(p92) do
		local _ = nil
		local var1855 = nil
		local var1856, var1857, var1858 = protoModule.readTag(p92, var1854)
		local var1859 = var1856
		var1855 = var1857
		var1854 = var1858
		
		if var1855 == protoModule.wireTypes.varint then
			if var1859 == 1 then
				local _ = nil
				local var1860, var1861 = protoModule.readVarIntI32(p92, var1854)
				local var1862 = var1860
				var1854 = var1861
				var1853.action_type = t.ActionType.fromNumber(var1862) or var1862
			else
				local _ = nil
				local var1863, var1864 = protoModule.readVarInt(p92, var1854)
				local _ = var1863
				var1854 = var1864
			end
		end
		if var1855 == protoModule.wireTypes.lengthDelimited then
			if var1859 == 2 then
				local _ = nil
				local var1865, var1866 = protoModule.readBuffer(p92, var1854)
				var1854 = var1866
				var1853.action_params = t.OpenSduiOverlayAction_Params.decode(var1865)
			else
				local _ = nil
				local var1867, var1868 = protoModule.readVarInt(p92, var1854)
				var1854 = var1868 + var1867
			end
		elseif var1855 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1869, var1870 = protoModule.readFixed32(p92, var1854)
			local _ = var1869
			var1854 = var1870
		elseif var1855 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1871, var1872 = protoModule.readFixed64(p92, var1854)
			local _ = var1871
			var1854 = var1872
		else
			error("Unsupported wire type: " .. var3121)
		end
	end
	return var1853
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
	local var1873 = t_92.new()
	
	if self.action_type ~= nil then
		var1873.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1873.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1873.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1873.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.actionParams)
	end
	return var1873
end

t_92.descriptor = {
	name = "OpenSduiOverlayAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSduiOverlayAction"
}
t.OpenSduiOverlayAction = t_92
typeRegistryModule.default:register(t.OpenSduiOverlayAction)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p93)
	-- upvalues: t_93 (ref)
	return setmetatable({
		config_key = if p93 == nil or p93.config_key == nil then nil else p93.config_key,
		identifier = if p93 == nil or p93.identifier == nil then nil else p93.identifier
	}, t_93)
end

function t_93:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1873 = 0
	
	if self.config_key ~= nil then
		local var1874 = self.config_key:encode()
		local var1875, var1876 = protoModule.writeTag(buff, var1873, 1, protoModule.wireTypes.lengthDelimited)
		var1875, var3145 = protoModule.writeBuffer(var1875, var1876, var1874, buffer.len(var1874))
		buff = var1875
		var1873 = var1876
	end
	if self.identifier ~= nil then
		local var1877 = self.identifier:encode()
		local var1878, var1879 = protoModule.writeTag(buff, var1873, 2, protoModule.wireTypes.lengthDelimited)
		var1878, var3148 = protoModule.writeBuffer(var1878, var1879, var1877, buffer.len(var1877))
		buff = var1878
		var1873 = var1879
	end
	local buff_1 = buffer.create(var1873)
	buffer.copy(buff_1, 0, buff, 0, var1873)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref), propTypesModule (ref)
	local var1873 = t_93.new()
	local var1874 = 0
	while var1874 < buffer.len(p93) do
		local _ = nil
		local var1875 = nil
		local var1876, var1877, var1878 = protoModule.readTag(p93, var1874)
		local var1879 = var1876
		var1875 = var1877
		var1874 = var1878
		
		if var1875 == protoModule.wireTypes.varint then
			local _ = nil
			local var1880, var1881 = protoModule.readVarInt(p93, var1874)
			local _ = var1880
			var1874 = var1881
			continue
		end
		if var1875 == protoModule.wireTypes.lengthDelimited then
			if var1879 == 1 then
				local _ = nil
				local var1882, var1883 = protoModule.readBuffer(p93, var1874)
				var1874 = var1883
				var1873.config_key = propTypesModule.StringProp.decode(var1882)
			elseif var1879 == 2 then
				local _ = nil
				local var1884, var1885 = protoModule.readBuffer(p93, var1874)
				var1874 = var1885
				var1873.identifier = propTypesModule.StringProp.decode(var1884)
			else
				local _ = nil
				local var1886, var1887 = protoModule.readVarInt(p93, var1874)
				var1874 = var1887 + var1886
			end
		elseif var1875 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1888, var1889 = protoModule.readFixed32(p93, var1874)
			local _ = var1888
			var1874 = var1889
		elseif var1875 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1890, var1891 = protoModule.readFixed64(p93, var1874)
			local _ = var1890
			var1874 = var1891
		else
			error("Unsupported wire type: " .. var3152)
		end
	end
	return var1873
end

function t_93:jsonEncode()
	local t = {}
	
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	if self.identifier ~= nil then
		t.identifier = self.identifier:jsonEncode()
	end
	return t
end

function t_93:jsonDecode()
	-- upvalues: t_93 (ref), propTypesModule (ref)
	local var1892 = t_93.new()
	
	if self.config_key ~= nil then
		var1892.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1892.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.identifier ~= nil then
		var1892.identifier = propTypesModule.StringProp.jsonDecode(self.identifier)
	end
	return var1892
end

t_93.descriptor = {
	name = "OpenSduiOverlayAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSduiOverlayAction_Params = t_93
typeRegistryModule.default:register(t.OpenSduiOverlayAction_Params)
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
	local var1892 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1893, var1894 = protoModule.writeTag(buff, var1892, 1, protoModule.wireTypes.varint)
		var1893, var3174 = protoModule.writeVarInt(var1893, var1894, t.ActionType.toNumber(self.action_type))
		buff = var1893
		var1892 = var1894
	end
	if self.action_params ~= nil then
		local var1895 = self.action_params:encode()
		local var1896, var1897 = protoModule.writeTag(buff, var1892, 2, protoModule.wireTypes.lengthDelimited)
		var1896, var3177 = protoModule.writeBuffer(var1896, var1897, var1895, buffer.len(var1895))
		buff = var1896
		var1892 = var1897
	end
	local buff_1 = buffer.create(var1892)
	buffer.copy(buff_1, 0, buff, 0, var1892)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var1892 = t_94.new()
	local var1893 = 0
	while var1893 < buffer.len(p94) do
		local _ = nil
		local var1894 = nil
		local var1895, var1896, var1897 = protoModule.readTag(p94, var1893)
		local var1898 = var1895
		var1894 = var1896
		var1893 = var1897
		
		if var1894 == protoModule.wireTypes.varint then
			if var1898 == 1 then
				local _ = nil
				local var1899, var1900 = protoModule.readVarIntI32(p94, var1893)
				local var1901 = var1899
				var1893 = var1900
				var1892.action_type = t.ActionType.fromNumber(var1901) or var1901
			else
				local _ = nil
				local var1902, var1903 = protoModule.readVarInt(p94, var1893)
				local _ = var1902
				var1893 = var1903
			end
		end
		if var1894 == protoModule.wireTypes.lengthDelimited then
			if var1898 == 2 then
				local _ = nil
				local var1904, var1905 = protoModule.readBuffer(p94, var1893)
				var1893 = var1905
				var1892.action_params = t.ApplyChartsFilterAction_Params.decode(var1904)
			else
				local _ = nil
				local var1906, var1907 = protoModule.readVarInt(p94, var1893)
				var1893 = var1907 + var1906
			end
		elseif var1894 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1908, var1909 = protoModule.readFixed32(p94, var1893)
			local _ = var1908
			var1893 = var1909
		elseif var1894 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1910, var1911 = protoModule.readFixed64(p94, var1893)
			local _ = var1910
			var1893 = var1911
		else
			error("Unsupported wire type: " .. var3181)
		end
	end
	return var1892
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
	local var1912 = t_94.new()
	
	if self.action_type ~= nil then
		var1912.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1912.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1912.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1912.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.actionParams)
	end
	return var1912
end

t_94.descriptor = {
	name = "ApplyChartsFilterAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ApplyChartsFilterAction"
}
t.ApplyChartsFilterAction = t_94
typeRegistryModule.default:register(t.ApplyChartsFilterAction)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p95)
	-- upvalues: t_95 (ref)
	return setmetatable({
		session_id = if p95 == nil or p95.session_id == nil then nil else p95.session_id
	}, t_95)
end

function t_95:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1912 = 0
	
	if self.session_id ~= nil then
		local var1913 = self.session_id:encode()
		local var1914, var1915 = protoModule.writeTag(buff, var1912, 1, protoModule.wireTypes.lengthDelimited)
		var1914, var3205 = protoModule.writeBuffer(var1914, var1915, var1913, buffer.len(var1913))
		buff = var1914
		var1912 = var1915
	end
	local buff_1 = buffer.create(var1912)
	buffer.copy(buff_1, 0, buff, 0, var1912)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref), propTypesModule (ref)
	local var1912 = t_95.new()
	local var1913 = 0
	while var1913 < buffer.len(p95) do
		local _ = nil
		local var1914 = nil
		local var1915, var1916, var1917 = protoModule.readTag(p95, var1913)
		local var1918 = var1915
		var1914 = var1916
		var1913 = var1917
		
		if var1914 == protoModule.wireTypes.varint then
			local _ = nil
			local var1919, var1920 = protoModule.readVarInt(p95, var1913)
			local _ = var1919
			var1913 = var1920
			continue
		end
		if var1914 == protoModule.wireTypes.lengthDelimited then
			if var1918 == 1 then
				local _ = nil
				local var1921, var1922 = protoModule.readBuffer(p95, var1913)
				var1913 = var1922
				var1912.session_id = propTypesModule.StringProp.decode(var1921)
			else
				local _ = nil
				local var1923, var1924 = protoModule.readVarInt(p95, var1913)
				var1913 = var1924 + var1923
			end
		elseif var1914 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1925, var1926 = protoModule.readFixed32(p95, var1913)
			local _ = var1925
			var1913 = var1926
		elseif var1914 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1927, var1928 = protoModule.readFixed64(p95, var1913)
			local _ = var1927
			var1913 = var1928
		else
			error("Unsupported wire type: " .. var3209)
		end
	end
	return var1912
end

function t_95:jsonEncode()
	local t = {}
	
	if self.session_id ~= nil then
		t.sessionId = self.session_id:jsonEncode()
	end
	return t
end

function t_95:jsonDecode()
	-- upvalues: t_95 (ref), propTypesModule (ref)
	local var1929 = t_95.new()
	
	if self.session_id ~= nil then
		var1929.session_id = propTypesModule.StringProp.jsonDecode(self.session_id)
	end
	if self.sessionId ~= nil then
		var1929.session_id = propTypesModule.StringProp.jsonDecode(self.sessionId)
	end
	return var1929
end

t_95.descriptor = {
	name = "ApplyChartsFilterAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ApplyChartsFilterAction_Params = t_95
typeRegistryModule.default:register(t.ApplyChartsFilterAction_Params)
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
	local var1929 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1930, var1931 = protoModule.writeTag(buff, var1929, 1, protoModule.wireTypes.varint)
		var1930, var3229 = protoModule.writeVarInt(var1930, var1931, t.ActionType.toNumber(self.action_type))
		buff = var1930
		var1929 = var1931
	end
	if self.action_params ~= nil then
		local var1932 = self.action_params:encode()
		local var1933, var1934 = protoModule.writeTag(buff, var1929, 2, protoModule.wireTypes.lengthDelimited)
		var1933, var3232 = protoModule.writeBuffer(var1933, var1934, var1932, buffer.len(var1932))
		buff = var1933
		var1929 = var1934
	end
	local buff_1 = buffer.create(var1929)
	buffer.copy(buff_1, 0, buff, 0, var1929)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var1929 = t_96.new()
	local var1930 = 0
	while var1930 < buffer.len(p96) do
		local _ = nil
		local var1931 = nil
		local var1932, var1933, var1934 = protoModule.readTag(p96, var1930)
		local var1935 = var1932
		var1931 = var1933
		var1930 = var1934
		
		if var1931 == protoModule.wireTypes.varint then
			if var1935 == 1 then
				local _ = nil
				local var1936, var1937 = protoModule.readVarIntI32(p96, var1930)
				local var1938 = var1936
				var1930 = var1937
				var1929.action_type = t.ActionType.fromNumber(var1938) or var1938
			else
				local _ = nil
				local var1939, var1940 = protoModule.readVarInt(p96, var1930)
				local _ = var1939
				var1930 = var1940
			end
		end
		if var1931 == protoModule.wireTypes.lengthDelimited then
			if var1935 == 2 then
				local _ = nil
				local var1941, var1942 = protoModule.readBuffer(p96, var1930)
				var1930 = var1942
				var1929.action_params = t.RefreshChartsSortDetailAction_Params.decode(var1941)
			else
				local _ = nil
				local var1943, var1944 = protoModule.readVarInt(p96, var1930)
				var1930 = var1944 + var1943
			end
		elseif var1931 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1945, var1946 = protoModule.readFixed32(p96, var1930)
			local _ = var1945
			var1930 = var1946
		elseif var1931 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1947, var1948 = protoModule.readFixed64(p96, var1930)
			local _ = var1947
			var1930 = var1948
		else
			error("Unsupported wire type: " .. var3236)
		end
	end
	return var1929
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
	local var1949 = t_96.new()
	
	if self.action_type ~= nil then
		var1949.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1949.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1949.action_params = t.RefreshChartsSortDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1949.action_params = t.RefreshChartsSortDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var1949
end

t_96.descriptor = {
	name = "RefreshChartsSortDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshChartsSortDetailAction"
}
t.RefreshChartsSortDetailAction = t_96
typeRegistryModule.default:register(t.RefreshChartsSortDetailAction)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p97)
	-- upvalues: t_97 (ref)
	return setmetatable({
		config_key = if p97 == nil or p97.config_key == nil then nil else p97.config_key,
		selected_option = if p97 == nil or p97.selected_option == nil then nil else p97.selected_option,
		surface_key = if p97 == nil or p97.surface_key == nil then nil else p97.surface_key,
		sort_id = if p97 == nil or p97.sort_id == nil then nil else p97.sort_id
	}, t_97)
end

function t_97:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1949 = 0
	
	if self.config_key ~= nil then
		local var1950 = self.config_key:encode()
		local var1951, var1952 = protoModule.writeTag(buff, var1949, 1, protoModule.wireTypes.lengthDelimited)
		var1951, var3260 = protoModule.writeBuffer(var1951, var1952, var1950, buffer.len(var1950))
		buff = var1951
		var1949 = var1952
	end
	if self.selected_option ~= nil then
		local var1953 = self.selected_option:encode()
		local var1954, var1955 = protoModule.writeTag(buff, var1949, 2, protoModule.wireTypes.lengthDelimited)
		var1954, var3263 = protoModule.writeBuffer(var1954, var1955, var1953, buffer.len(var1953))
		buff = var1954
		var1949 = var1955
	end
	if self.surface_key ~= nil then
		local var1956 = self.surface_key:encode()
		local var1957, var1958 = protoModule.writeTag(buff, var1949, 3, protoModule.wireTypes.lengthDelimited)
		var1957, var3266 = protoModule.writeBuffer(var1957, var1958, var1956, buffer.len(var1956))
		buff = var1957
		var1949 = var1958
	end
	if self.sort_id ~= nil then
		local var1959 = self.sort_id:encode()
		local var1960, var1961 = protoModule.writeTag(buff, var1949, 4, protoModule.wireTypes.lengthDelimited)
		var1960, var3269 = protoModule.writeBuffer(var1960, var1961, var1959, buffer.len(var1959))
		buff = var1960
		var1949 = var1961
	end
	local buff_1 = buffer.create(var1949)
	buffer.copy(buff_1, 0, buff, 0, var1949)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref), propTypesModule (ref)
	local var1949 = t_97.new()
	local var1950 = 0
	while var1950 < buffer.len(p97) do
		local _ = nil
		local var1951 = nil
		local var1952, var1953, var1954 = protoModule.readTag(p97, var1950)
		local var1955 = var1952
		var1951 = var1953
		var1950 = var1954
		
		if var1951 == protoModule.wireTypes.varint then
			local _ = nil
			local var1956, var1957 = protoModule.readVarInt(p97, var1950)
			local _ = var1956
			var1950 = var1957
			continue
		end
		if var1951 == protoModule.wireTypes.lengthDelimited then
			if var1955 == 1 then
				local _ = nil
				local var1958, var1959 = protoModule.readBuffer(p97, var1950)
				var1950 = var1959
				var1949.config_key = propTypesModule.StringProp.decode(var1958)
			elseif var1955 == 2 then
				local _ = nil
				local var1960, var1961 = protoModule.readBuffer(p97, var1950)
				var1950 = var1961
				var1949.selected_option = propTypesModule.StringProp.decode(var1960)
			elseif var1955 == 3 then
				local _ = nil
				local var1962, var1963 = protoModule.readBuffer(p97, var1950)
				var1950 = var1963
				var1949.surface_key = propTypesModule.StringProp.decode(var1962)
			elseif var1955 == 4 then
				local _ = nil
				local var1964, var1965 = protoModule.readBuffer(p97, var1950)
				var1950 = var1965
				var1949.sort_id = propTypesModule.StringProp.decode(var1964)
			else
				local _ = nil
				local var1966, var1967 = protoModule.readVarInt(p97, var1950)
				var1950 = var1967 + var1966
			end
		elseif var1951 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1968, var1969 = protoModule.readFixed32(p97, var1950)
			local _ = var1968
			var1950 = var1969
		elseif var1951 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1970, var1971 = protoModule.readFixed64(p97, var1950)
			local _ = var1970
			var1950 = var1971
		else
			error("Unsupported wire type: " .. var3273)
		end
	end
	return var1949
end

function t_97:jsonEncode()
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

function t_97:jsonDecode()
	-- upvalues: t_97 (ref), propTypesModule (ref)
	local var1972 = t_97.new()
	
	if self.config_key ~= nil then
		var1972.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1972.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.selected_option ~= nil then
		var1972.selected_option = propTypesModule.StringProp.jsonDecode(self.selected_option)
	end
	if self.selectedOption ~= nil then
		var1972.selected_option = propTypesModule.StringProp.jsonDecode(self.selectedOption)
	end
	if self.surface_key ~= nil then
		var1972.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var1972.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.sort_id ~= nil then
		var1972.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var1972.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	return var1972
end

t_97.descriptor = {
	name = "RefreshChartsSortDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshChartsSortDetailAction_Params = t_97
typeRegistryModule.default:register(t.RefreshChartsSortDetailAction_Params)
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
	local var1972 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1973, var1974 = protoModule.writeTag(buff, var1972, 1, protoModule.wireTypes.varint)
		var1973, var3299 = protoModule.writeVarInt(var1973, var1974, t.ActionType.toNumber(self.action_type))
		buff = var1973
		var1972 = var1974
	end
	if self.action_params ~= nil then
		local var1975 = self.action_params:encode()
		local var1976, var1977 = protoModule.writeTag(buff, var1972, 2, protoModule.wireTypes.lengthDelimited)
		var1976, var3302 = protoModule.writeBuffer(var1976, var1977, var1975, buffer.len(var1975))
		buff = var1976
		var1972 = var1977
	end
	local buff_1 = buffer.create(var1972)
	buffer.copy(buff_1, 0, buff, 0, var1972)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var1972 = t_98.new()
	local var1973 = 0
	while var1973 < buffer.len(p98) do
		local _ = nil
		local var1974 = nil
		local var1975, var1976, var1977 = protoModule.readTag(p98, var1973)
		local var1978 = var1975
		var1974 = var1976
		var1973 = var1977
		
		if var1974 == protoModule.wireTypes.varint then
			if var1978 == 1 then
				local _ = nil
				local var1979, var1980 = protoModule.readVarIntI32(p98, var1973)
				local var1981 = var1979
				var1973 = var1980
				var1972.action_type = t.ActionType.fromNumber(var1981) or var1981
			else
				local _ = nil
				local var1982, var1983 = protoModule.readVarInt(p98, var1973)
				local _ = var1982
				var1973 = var1983
			end
		end
		if var1974 == protoModule.wireTypes.lengthDelimited then
			if var1978 == 2 then
				local _ = nil
				local var1984, var1985 = protoModule.readBuffer(p98, var1973)
				var1973 = var1985
				var1972.action_params = t.JoinCommunityAction_Params.decode(var1984)
			else
				local _ = nil
				local var1986, var1987 = protoModule.readVarInt(p98, var1973)
				var1973 = var1987 + var1986
			end
		elseif var1974 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1988, var1989 = protoModule.readFixed32(p98, var1973)
			local _ = var1988
			var1973 = var1989
		elseif var1974 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1990, var1991 = protoModule.readFixed64(p98, var1973)
			local _ = var1990
			var1973 = var1991
		else
			error("Unsupported wire type: " .. var3306)
		end
	end
	return var1972
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
	local var1992 = t_98.new()
	
	if self.action_type ~= nil then
		var1992.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1992.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1992.action_params = t.JoinCommunityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1992.action_params = t.JoinCommunityAction_Params.jsonDecode(self.actionParams)
	end
	return var1992
end

t_98.descriptor = {
	name = "JoinCommunityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.JoinCommunityAction"
}
t.JoinCommunityAction = t_98
typeRegistryModule.default:register(t.JoinCommunityAction)
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
	local var1992 = 0
	
	if self.community_id ~= nil then
		local var1993 = self.community_id:encode()
		local var1994, var1995 = protoModule.writeTag(buff, var1992, 1, protoModule.wireTypes.lengthDelimited)
		var1994, var3330 = protoModule.writeBuffer(var1994, var1995, var1993, buffer.len(var1993))
		buff = var1994
		var1992 = var1995
	end
	local buff_1 = buffer.create(var1992)
	buffer.copy(buff_1, 0, buff, 0, var1992)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref), propTypesModule (ref)
	local var1992 = t_99.new()
	local var1993 = 0
	while var1993 < buffer.len(p99) do
		local _ = nil
		local var1994 = nil
		local var1995, var1996, var1997 = protoModule.readTag(p99, var1993)
		local var1998 = var1995
		var1994 = var1996
		var1993 = var1997
		
		if var1994 == protoModule.wireTypes.varint then
			local _ = nil
			local var1999, var2000 = protoModule.readVarInt(p99, var1993)
			local _ = var1999
			var1993 = var2000
			continue
		end
		if var1994 == protoModule.wireTypes.lengthDelimited then
			if var1998 == 1 then
				local _ = nil
				local var2001, var2002 = protoModule.readBuffer(p99, var1993)
				var1993 = var2002
				var1992.community_id = propTypesModule.StringProp.decode(var2001)
			else
				local _ = nil
				local var2003, var2004 = protoModule.readVarInt(p99, var1993)
				var1993 = var2004 + var2003
			end
		elseif var1994 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2005, var2006 = protoModule.readFixed32(p99, var1993)
			local _ = var2005
			var1993 = var2006
		elseif var1994 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2007, var2008 = protoModule.readFixed64(p99, var1993)
			local _ = var2007
			var1993 = var2008
		else
			error("Unsupported wire type: " .. var3334)
		end
	end
	return var1992
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
	local var2009 = t_99.new()
	
	if self.community_id ~= nil then
		var2009.community_id = propTypesModule.StringProp.jsonDecode(self.community_id)
	end
	if self.communityId ~= nil then
		var2009.community_id = propTypesModule.StringProp.jsonDecode(self.communityId)
	end
	return var2009
end

t_99.descriptor = {
	name = "JoinCommunityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.JoinCommunityAction_Params = t_99
typeRegistryModule.default:register(t.JoinCommunityAction_Params)
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
	local var2009 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2010, var2011 = protoModule.writeTag(buff, var2009, 1, protoModule.wireTypes.varint)
		var2010, var3354 = protoModule.writeVarInt(var2010, var2011, t.ActionType.toNumber(self.action_type))
		buff = var2010
		var2009 = var2011
	end
	if self.action_params ~= nil then
		local var2012 = self.action_params:encode()
		local var2013, var2014 = protoModule.writeTag(buff, var2009, 2, protoModule.wireTypes.lengthDelimited)
		var2013, var3357 = protoModule.writeBuffer(var2013, var2014, var2012, buffer.len(var2012))
		buff = var2013
		var2009 = var2014
	end
	local buff_1 = buffer.create(var2009)
	buffer.copy(buff_1, 0, buff, 0, var2009)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var2009 = t_100.new()
	local var2010 = 0
	while var2010 < buffer.len(p100) do
		local _ = nil
		local var2011 = nil
		local var2012, var2013, var2014 = protoModule.readTag(p100, var2010)
		local var2015 = var2012
		var2011 = var2013
		var2010 = var2014
		
		if var2011 == protoModule.wireTypes.varint then
			if var2015 == 1 then
				local _ = nil
				local var2016, var2017 = protoModule.readVarIntI32(p100, var2010)
				local var2018 = var2016
				var2010 = var2017
				var2009.action_type = t.ActionType.fromNumber(var2018) or var2018
			else
				local _ = nil
				local var2019, var2020 = protoModule.readVarInt(p100, var2010)
				local _ = var2019
				var2010 = var2020
			end
		end
		if var2011 == protoModule.wireTypes.lengthDelimited then
			if var2015 == 2 then
				local _ = nil
				local var2021, var2022 = protoModule.readBuffer(p100, var2010)
				var2010 = var2022
				var2009.action_params = t.ViewCommunityAction_Params.decode(var2021)
			else
				local _ = nil
				local var2023, var2024 = protoModule.readVarInt(p100, var2010)
				var2010 = var2024 + var2023
			end
		elseif var2011 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2025, var2026 = protoModule.readFixed32(p100, var2010)
			local _ = var2025
			var2010 = var2026
		elseif var2011 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2027, var2028 = protoModule.readFixed64(p100, var2010)
			local _ = var2027
			var2010 = var2028
		else
			error("Unsupported wire type: " .. var3361)
		end
	end
	return var2009
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
	local var2029 = t_100.new()
	
	if self.action_type ~= nil then
		var2029.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2029.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2029.action_params = t.ViewCommunityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2029.action_params = t.ViewCommunityAction_Params.jsonDecode(self.actionParams)
	end
	return var2029
end

t_100.descriptor = {
	name = "ViewCommunityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ViewCommunityAction"
}
t.ViewCommunityAction = t_100
typeRegistryModule.default:register(t.ViewCommunityAction)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p101)
	-- upvalues: t_101 (ref)
	return setmetatable({
		community_id = if p101 == nil or p101.community_id == nil then nil else p101.community_id
	}, t_101)
end

function t_101:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2029 = 0
	
	if self.community_id ~= nil then
		local var2030 = self.community_id:encode()
		local var2031, var2032 = protoModule.writeTag(buff, var2029, 1, protoModule.wireTypes.lengthDelimited)
		var2031, var3385 = protoModule.writeBuffer(var2031, var2032, var2030, buffer.len(var2030))
		buff = var2031
		var2029 = var2032
	end
	local buff_1 = buffer.create(var2029)
	buffer.copy(buff_1, 0, buff, 0, var2029)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref), propTypesModule (ref)
	local var2029 = t_101.new()
	local var2030 = 0
	while var2030 < buffer.len(p101) do
		local _ = nil
		local var2031 = nil
		local var2032, var2033, var2034 = protoModule.readTag(p101, var2030)
		local var2035 = var2032
		var2031 = var2033
		var2030 = var2034
		
		if var2031 == protoModule.wireTypes.varint then
			local _ = nil
			local var2036, var2037 = protoModule.readVarInt(p101, var2030)
			local _ = var2036
			var2030 = var2037
			continue
		end
		if var2031 == protoModule.wireTypes.lengthDelimited then
			if var2035 == 1 then
				local _ = nil
				local var2038, var2039 = protoModule.readBuffer(p101, var2030)
				var2030 = var2039
				var2029.community_id = propTypesModule.StringProp.decode(var2038)
			else
				local _ = nil
				local var2040, var2041 = protoModule.readVarInt(p101, var2030)
				var2030 = var2041 + var2040
			end
		elseif var2031 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2042, var2043 = protoModule.readFixed32(p101, var2030)
			local _ = var2042
			var2030 = var2043
		elseif var2031 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2044, var2045 = protoModule.readFixed64(p101, var2030)
			local _ = var2044
			var2030 = var2045
		else
			error("Unsupported wire type: " .. var3389)
		end
	end
	return var2029
end

function t_101:jsonEncode()
	local t = {}
	
	if self.community_id ~= nil then
		t.communityId = self.community_id:jsonEncode()
	end
	return t
end

function t_101:jsonDecode()
	-- upvalues: t_101 (ref), propTypesModule (ref)
	local var2046 = t_101.new()
	
	if self.community_id ~= nil then
		var2046.community_id = propTypesModule.StringProp.jsonDecode(self.community_id)
	end
	if self.communityId ~= nil then
		var2046.community_id = propTypesModule.StringProp.jsonDecode(self.communityId)
	end
	return var2046
end

t_101.descriptor = {
	name = "ViewCommunityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ViewCommunityAction_Params = t_101
typeRegistryModule.default:register(t.ViewCommunityAction_Params)
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
	local var2046 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2047, var2048 = protoModule.writeTag(buff, var2046, 1, protoModule.wireTypes.varint)
		var2047, var3409 = protoModule.writeVarInt(var2047, var2048, t.ActionType.toNumber(self.action_type))
		buff = var2047
		var2046 = var2048
	end
	if self.action_params ~= nil then
		local var2049 = self.action_params:encode()
		local var2050, var2051 = protoModule.writeTag(buff, var2046, 2, protoModule.wireTypes.lengthDelimited)
		var2050, var3412 = protoModule.writeBuffer(var2050, var2051, var2049, buffer.len(var2049))
		buff = var2050
		var2046 = var2051
	end
	local buff_1 = buffer.create(var2046)
	buffer.copy(buff_1, 0, buff, 0, var2046)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref), t (ref)
	local var2046 = t_102.new()
	local var2047 = 0
	while var2047 < buffer.len(p102) do
		local _ = nil
		local var2048 = nil
		local var2049, var2050, var2051 = protoModule.readTag(p102, var2047)
		local var2052 = var2049
		var2048 = var2050
		var2047 = var2051
		
		if var2048 == protoModule.wireTypes.varint then
			if var2052 == 1 then
				local _ = nil
				local var2053, var2054 = protoModule.readVarIntI32(p102, var2047)
				local var2055 = var2053
				var2047 = var2054
				var2046.action_type = t.ActionType.fromNumber(var2055) or var2055
			else
				local _ = nil
				local var2056, var2057 = protoModule.readVarInt(p102, var2047)
				local _ = var2056
				var2047 = var2057
			end
		end
		if var2048 == protoModule.wireTypes.lengthDelimited then
			if var2052 == 2 then
				local _ = nil
				local var2058, var2059 = protoModule.readBuffer(p102, var2047)
				var2047 = var2059
				var2046.action_params = t.AnalyticsEventAction_Params.decode(var2058)
			else
				local _ = nil
				local var2060, var2061 = protoModule.readVarInt(p102, var2047)
				var2047 = var2061 + var2060
			end
		elseif var2048 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2062, var2063 = protoModule.readFixed32(p102, var2047)
			local _ = var2062
			var2047 = var2063
		elseif var2048 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2064, var2065 = protoModule.readFixed64(p102, var2047)
			local _ = var2064
			var2047 = var2065
		else
			error("Unsupported wire type: " .. var3416)
		end
	end
	return var2046
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
	local var2066 = t_102.new()
	
	if self.action_type ~= nil then
		var2066.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2066.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2066.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2066.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return var2066
end

t_102.descriptor = {
	name = "AnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.AnalyticsEventAction"
}
t.AnalyticsEventAction = t_102
typeRegistryModule.default:register(t.AnalyticsEventAction)
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
	local var2066 = 0
	
	if self.event_name ~= nil then
		local var2067 = self.event_name:encode()
		local var2068, var2069 = protoModule.writeTag(buff, var2066, 1, protoModule.wireTypes.lengthDelimited)
		var2068, var3440 = protoModule.writeBuffer(var2068, var2069, var2067, buffer.len(var2067))
		buff = var2068
		var2066 = var2069
	end
	if self.event_fields ~= nil then
		local var2070 = self.event_fields:encode()
		local var2071, var2072 = protoModule.writeTag(buff, var2066, 2, protoModule.wireTypes.lengthDelimited)
		var2071, var3443 = protoModule.writeBuffer(var2071, var2072, var2070, buffer.len(var2070))
		buff = var2071
		var2066 = var2072
	end
	local buff_1 = buffer.create(var2066)
	buffer.copy(buff_1, 0, buff, 0, var2066)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref), propTypesModule (ref)
	local var2066 = t_103.new()
	local var2067 = 0
	while var2067 < buffer.len(p103) do
		local _ = nil
		local var2068 = nil
		local var2069, var2070, var2071 = protoModule.readTag(p103, var2067)
		local var2072 = var2069
		var2068 = var2070
		var2067 = var2071
		
		if var2068 == protoModule.wireTypes.varint then
			local _ = nil
			local var2073, var2074 = protoModule.readVarInt(p103, var2067)
			local _ = var2073
			var2067 = var2074
			continue
		end
		if var2068 == protoModule.wireTypes.lengthDelimited then
			if var2072 == 1 then
				local _ = nil
				local var2075, var2076 = protoModule.readBuffer(p103, var2067)
				var2067 = var2076
				var2066.event_name = propTypesModule.StringProp.decode(var2075)
			elseif var2072 == 2 then
				local _ = nil
				local var2077, var2078 = protoModule.readBuffer(p103, var2067)
				var2067 = var2078
				var2066.event_fields = propTypesModule.StructProp.decode(var2077)
			else
				local _ = nil
				local var2079, var2080 = protoModule.readVarInt(p103, var2067)
				var2067 = var2080 + var2079
			end
		elseif var2068 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2081, var2082 = protoModule.readFixed32(p103, var2067)
			local _ = var2081
			var2067 = var2082
		elseif var2068 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2083, var2084 = protoModule.readFixed64(p103, var2067)
			local _ = var2083
			var2067 = var2084
		else
			error("Unsupported wire type: " .. var3447)
		end
	end
	return var2066
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
	local var2085 = t_103.new()
	
	if self.event_name ~= nil then
		var2085.event_name = propTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		var2085.event_name = propTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		var2085.event_fields = propTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		var2085.event_fields = propTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return var2085
end

t_103.descriptor = {
	name = "AnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.AnalyticsEventAction_Params = t_103
typeRegistryModule.default:register(t.AnalyticsEventAction_Params)
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
	local var2085 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2086, var2087 = protoModule.writeTag(buff, var2085, 1, protoModule.wireTypes.varint)
		var2086, var3469 = protoModule.writeVarInt(var2086, var2087, t.ActionType.toNumber(self.action_type))
		buff = var2086
		var2085 = var2087
	end
	if self.action_params ~= nil then
		local var2088 = self.action_params:encode()
		local var2089, var2090 = protoModule.writeTag(buff, var2085, 2, protoModule.wireTypes.lengthDelimited)
		var2089, var3472 = protoModule.writeBuffer(var2089, var2090, var2088, buffer.len(var2088))
		buff = var2089
		var2085 = var2090
	end
	local buff_1 = buffer.create(var2085)
	buffer.copy(buff_1, 0, buff, 0, var2085)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref), t (ref)
	local var2085 = t_104.new()
	local var2086 = 0
	while var2086 < buffer.len(p104) do
		local _ = nil
		local var2087 = nil
		local var2088, var2089, var2090 = protoModule.readTag(p104, var2086)
		local var2091 = var2088
		var2087 = var2089
		var2086 = var2090
		
		if var2087 == protoModule.wireTypes.varint then
			if var2091 == 1 then
				local _ = nil
				local var2092, var2093 = protoModule.readVarIntI32(p104, var2086)
				local var2094 = var2092
				var2086 = var2093
				var2085.action_type = t.ActionType.fromNumber(var2094) or var2094
			else
				local _ = nil
				local var2095, var2096 = protoModule.readVarInt(p104, var2086)
				local _ = var2095
				var2086 = var2096
			end
		end
		if var2087 == protoModule.wireTypes.lengthDelimited then
			if var2091 == 2 then
				local _ = nil
				local var2097, var2098 = protoModule.readBuffer(p104, var2086)
				var2086 = var2098
				var2085.action_params = t.CustomAnalyticsEventAction_Params.decode(var2097)
			else
				local _ = nil
				local var2099, var2100 = protoModule.readVarInt(p104, var2086)
				var2086 = var2100 + var2099
			end
		elseif var2087 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2101, var2102 = protoModule.readFixed32(p104, var2086)
			local _ = var2101
			var2086 = var2102
		elseif var2087 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2103, var2104 = protoModule.readFixed64(p104, var2086)
			local _ = var2103
			var2086 = var2104
		else
			error("Unsupported wire type: " .. var3476)
		end
	end
	return var2085
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
	local var2105 = t_104.new()
	
	if self.action_type ~= nil then
		var2105.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2105.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2105.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2105.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return var2105
end

t_104.descriptor = {
	name = "CustomAnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomAnalyticsEventAction"
}
t.CustomAnalyticsEventAction = t_104
typeRegistryModule.default:register(t.CustomAnalyticsEventAction)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p105)
	-- upvalues: t_105 (ref)
	return setmetatable({
		event_name = if p105 == nil or p105.event_name == nil then nil else p105.event_name,
		event_fields = if p105 == nil or p105.event_fields == nil then nil else p105.event_fields
	}, t_105)
end

function t_105:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2105 = 0
	
	if self.event_name ~= nil then
		local var2106 = self.event_name:encode()
		local var2107, var2108 = protoModule.writeTag(buff, var2105, 1, protoModule.wireTypes.lengthDelimited)
		var2107, var3500 = protoModule.writeBuffer(var2107, var2108, var2106, buffer.len(var2106))
		buff = var2107
		var2105 = var2108
	end
	if self.event_fields ~= nil then
		local var2109 = self.event_fields:encode()
		local var2110, var2111 = protoModule.writeTag(buff, var2105, 2, protoModule.wireTypes.lengthDelimited)
		var2110, var3503 = protoModule.writeBuffer(var2110, var2111, var2109, buffer.len(var2109))
		buff = var2110
		var2105 = var2111
	end
	local buff_1 = buffer.create(var2105)
	buffer.copy(buff_1, 0, buff, 0, var2105)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref), propTypesModule (ref)
	local var2105 = t_105.new()
	local var2106 = 0
	while var2106 < buffer.len(p105) do
		local _ = nil
		local var2107 = nil
		local var2108, var2109, var2110 = protoModule.readTag(p105, var2106)
		local var2111 = var2108
		var2107 = var2109
		var2106 = var2110
		
		if var2107 == protoModule.wireTypes.varint then
			local _ = nil
			local var2112, var2113 = protoModule.readVarInt(p105, var2106)
			local _ = var2112
			var2106 = var2113
			continue
		end
		if var2107 == protoModule.wireTypes.lengthDelimited then
			if var2111 == 1 then
				local _ = nil
				local var2114, var2115 = protoModule.readBuffer(p105, var2106)
				var2106 = var2115
				var2105.event_name = propTypesModule.StringProp.decode(var2114)
			elseif var2111 == 2 then
				local _ = nil
				local var2116, var2117 = protoModule.readBuffer(p105, var2106)
				var2106 = var2117
				var2105.event_fields = propTypesModule.StructProp.decode(var2116)
			else
				local _ = nil
				local var2118, var2119 = protoModule.readVarInt(p105, var2106)
				var2106 = var2119 + var2118
			end
		elseif var2107 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2120, var2121 = protoModule.readFixed32(p105, var2106)
			local _ = var2120
			var2106 = var2121
		elseif var2107 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2122, var2123 = protoModule.readFixed64(p105, var2106)
			local _ = var2122
			var2106 = var2123
		else
			error("Unsupported wire type: " .. var3507)
		end
	end
	return var2105
end

function t_105:jsonEncode()
	local t = {}
	
	if self.event_name ~= nil then
		t.eventName = self.event_name:jsonEncode()
	end
	if self.event_fields ~= nil then
		t.eventFields = self.event_fields:jsonEncode()
	end
	return t
end

function t_105:jsonDecode()
	-- upvalues: t_105 (ref), propTypesModule (ref)
	local var2124 = t_105.new()
	
	if self.event_name ~= nil then
		var2124.event_name = propTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		var2124.event_name = propTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		var2124.event_fields = propTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		var2124.event_fields = propTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return var2124
end

t_105.descriptor = {
	name = "CustomAnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.CustomAnalyticsEventAction_Params = t_105
typeRegistryModule.default:register(t.CustomAnalyticsEventAction_Params)
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
	local var2124 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2125, var2126 = protoModule.writeTag(buff, var2124, 1, protoModule.wireTypes.varint)
		var2125, var3529 = protoModule.writeVarInt(var2125, var2126, t.ActionType.toNumber(self.action_type))
		buff = var2125
		var2124 = var2126
	end
	if self.action_params ~= nil then
		local var2127 = self.action_params:encode()
		local var2128, var2129 = protoModule.writeTag(buff, var2124, 2, protoModule.wireTypes.lengthDelimited)
		var2128, var3532 = protoModule.writeBuffer(var2128, var2129, var2127, buffer.len(var2127))
		buff = var2128
		var2124 = var2129
	end
	local buff_1 = buffer.create(var2124)
	buffer.copy(buff_1, 0, buff, 0, var2124)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref), t (ref)
	local var2124 = t_106.new()
	local var2125 = 0
	while var2125 < buffer.len(p106) do
		local _ = nil
		local var2126 = nil
		local var2127, var2128, var2129 = protoModule.readTag(p106, var2125)
		local var2130 = var2127
		var2126 = var2128
		var2125 = var2129
		
		if var2126 == protoModule.wireTypes.varint then
			if var2130 == 1 then
				local _ = nil
				local var2131, var2132 = protoModule.readVarIntI32(p106, var2125)
				local var2133 = var2131
				var2125 = var2132
				var2124.action_type = t.ActionType.fromNumber(var2133) or var2133
			else
				local _ = nil
				local var2134, var2135 = protoModule.readVarInt(p106, var2125)
				local _ = var2134
				var2125 = var2135
			end
		end
		if var2126 == protoModule.wireTypes.lengthDelimited then
			if var2130 == 2 then
				local _ = nil
				local var2136, var2137 = protoModule.readBuffer(p106, var2125)
				var2125 = var2137
				var2124.action_params = t.OpenGameInviteAction_Params.decode(var2136)
			else
				local _ = nil
				local var2138, var2139 = protoModule.readVarInt(p106, var2125)
				var2125 = var2139 + var2138
			end
		elseif var2126 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2140, var2141 = protoModule.readFixed32(p106, var2125)
			local _ = var2140
			var2125 = var2141
		elseif var2126 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2142, var2143 = protoModule.readFixed64(p106, var2125)
			local _ = var2142
			var2125 = var2143
		else
			error("Unsupported wire type: " .. var3536)
		end
	end
	return var2124
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
	local var2144 = t_106.new()
	
	if self.action_type ~= nil then
		var2144.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2144.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2144.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2144.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.actionParams)
	end
	return var2144
end

t_106.descriptor = {
	name = "OpenGameInviteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameInviteAction"
}
t.OpenGameInviteAction = t_106
typeRegistryModule.default:register(t.OpenGameInviteAction)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p107)
	-- upvalues: t_107 (ref)
	return setmetatable({
		universe_id = if p107 == nil or p107.universe_id == nil then nil else p107.universe_id,
		root_place_id = if p107 == nil or p107.root_place_id == nil then nil else p107.root_place_id,
		trigger = if p107 == nil or p107.trigger == nil then nil else p107.trigger,
		button_name = if p107 == nil or p107.button_name == nil then nil else p107.button_name
	}, t_107)
end

function t_107:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2144 = 0
	
	if self.universe_id ~= nil then
		local var2145 = self.universe_id:encode()
		local var2146, var2147 = protoModule.writeTag(buff, var2144, 1, protoModule.wireTypes.lengthDelimited)
		var2146, var3560 = protoModule.writeBuffer(var2146, var2147, var2145, buffer.len(var2145))
		buff = var2146
		var2144 = var2147
	end
	if self.root_place_id ~= nil then
		local var2148 = self.root_place_id:encode()
		local var2149, var2150 = protoModule.writeTag(buff, var2144, 2, protoModule.wireTypes.lengthDelimited)
		var2149, var3563 = protoModule.writeBuffer(var2149, var2150, var2148, buffer.len(var2148))
		buff = var2149
		var2144 = var2150
	end
	if self.trigger ~= nil then
		local var2151 = self.trigger:encode()
		local var2152, var2153 = protoModule.writeTag(buff, var2144, 3, protoModule.wireTypes.lengthDelimited)
		var2152, var3566 = protoModule.writeBuffer(var2152, var2153, var2151, buffer.len(var2151))
		buff = var2152
		var2144 = var2153
	end
	if self.button_name ~= nil then
		local var2154 = self.button_name:encode()
		local var2155, var2156 = protoModule.writeTag(buff, var2144, 4, protoModule.wireTypes.lengthDelimited)
		var2155, var3569 = protoModule.writeBuffer(var2155, var2156, var2154, buffer.len(var2154))
		buff = var2155
		var2144 = var2156
	end
	local buff_1 = buffer.create(var2144)
	buffer.copy(buff_1, 0, buff, 0, var2144)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref), propTypesModule (ref)
	local var2144 = t_107.new()
	local var2145 = 0
	while var2145 < buffer.len(p107) do
		local _ = nil
		local var2146 = nil
		local var2147, var2148, var2149 = protoModule.readTag(p107, var2145)
		local var2150 = var2147
		var2146 = var2148
		var2145 = var2149
		
		if var2146 == protoModule.wireTypes.varint then
			local _ = nil
			local var2151, var2152 = protoModule.readVarInt(p107, var2145)
			local _ = var2151
			var2145 = var2152
			continue
		end
		if var2146 == protoModule.wireTypes.lengthDelimited then
			if var2150 == 1 then
				local _ = nil
				local var2153, var2154 = protoModule.readBuffer(p107, var2145)
				var2145 = var2154
				var2144.universe_id = propTypesModule.StringProp.decode(var2153)
			elseif var2150 == 2 then
				local _ = nil
				local var2155, var2156 = protoModule.readBuffer(p107, var2145)
				var2145 = var2156
				var2144.root_place_id = propTypesModule.StringProp.decode(var2155)
			elseif var2150 == 3 then
				local _ = nil
				local var2157, var2158 = protoModule.readBuffer(p107, var2145)
				var2145 = var2158
				var2144.trigger = propTypesModule.StringProp.decode(var2157)
			elseif var2150 == 4 then
				local _ = nil
				local var2159, var2160 = protoModule.readBuffer(p107, var2145)
				var2145 = var2160
				var2144.button_name = propTypesModule.StringProp.decode(var2159)
			else
				local _ = nil
				local var2161, var2162 = protoModule.readVarInt(p107, var2145)
				var2145 = var2162 + var2161
			end
		elseif var2146 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2163, var2164 = protoModule.readFixed32(p107, var2145)
			local _ = var2163
			var2145 = var2164
		elseif var2146 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2165, var2166 = protoModule.readFixed64(p107, var2145)
			local _ = var2165
			var2145 = var2166
		else
			error("Unsupported wire type: " .. var3573)
		end
	end
	return var2144
end

function t_107:jsonEncode()
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

function t_107:jsonDecode()
	-- upvalues: t_107 (ref), propTypesModule (ref)
	local var2167 = t_107.new()
	
	if self.universe_id ~= nil then
		var2167.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2167.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		var2167.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var2167.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	if self.trigger ~= nil then
		var2167.trigger = propTypesModule.StringProp.jsonDecode(self.trigger)
	end
	if self.button_name ~= nil then
		var2167.button_name = propTypesModule.StringProp.jsonDecode(self.button_name)
	end
	if self.buttonName ~= nil then
		var2167.button_name = propTypesModule.StringProp.jsonDecode(self.buttonName)
	end
	return var2167
end

t_107.descriptor = {
	name = "OpenGameInviteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameInviteAction_Params = t_107
typeRegistryModule.default:register(t.OpenGameInviteAction_Params)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p108)
	-- upvalues: t (ref), t_108 (ref)
	return setmetatable({
		action_type = if p108 == nil or p108.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p108.action_type,
		action_params = if p108 == nil or p108.action_params == nil then nil else p108.action_params
	}, t_108)
end

function t_108:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2167 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2168, var2169 = protoModule.writeTag(buff, var2167, 1, protoModule.wireTypes.varint)
		var2168, var3599 = protoModule.writeVarInt(var2168, var2169, t.ActionType.toNumber(self.action_type))
		buff = var2168
		var2167 = var2169
	end
	if self.action_params ~= nil then
		local var2170 = self.action_params:encode()
		local var2171, var2172 = protoModule.writeTag(buff, var2167, 2, protoModule.wireTypes.lengthDelimited)
		var2171, var3602 = protoModule.writeBuffer(var2171, var2172, var2170, buffer.len(var2170))
		buff = var2171
		var2167 = var2172
	end
	local buff_1 = buffer.create(var2167)
	buffer.copy(buff_1, 0, buff, 0, var2167)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref), t (ref)
	local var2167 = t_108.new()
	local var2168 = 0
	while var2168 < buffer.len(p108) do
		local _ = nil
		local var2169 = nil
		local var2170, var2171, var2172 = protoModule.readTag(p108, var2168)
		local var2173 = var2170
		var2169 = var2171
		var2168 = var2172
		
		if var2169 == protoModule.wireTypes.varint then
			if var2173 == 1 then
				local _ = nil
				local var2174, var2175 = protoModule.readVarIntI32(p108, var2168)
				local var2176 = var2174
				var2168 = var2175
				var2167.action_type = t.ActionType.fromNumber(var2176) or var2176
			else
				local _ = nil
				local var2177, var2178 = protoModule.readVarInt(p108, var2168)
				local _ = var2177
				var2168 = var2178
			end
		end
		if var2169 == protoModule.wireTypes.lengthDelimited then
			if var2173 == 2 then
				local _ = nil
				local var2179, var2180 = protoModule.readBuffer(p108, var2168)
				var2168 = var2180
				var2167.action_params = t.LaunchExperienceAction_Params.decode(var2179)
			else
				local _ = nil
				local var2181, var2182 = protoModule.readVarInt(p108, var2168)
				var2168 = var2182 + var2181
			end
		elseif var2169 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2183, var2184 = protoModule.readFixed32(p108, var2168)
			local _ = var2183
			var2168 = var2184
		elseif var2169 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2185, var2186 = protoModule.readFixed64(p108, var2168)
			local _ = var2185
			var2168 = var2186
		else
			error("Unsupported wire type: " .. var3606)
		end
	end
	return var2167
end

function t_108:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_108:jsonDecode()
	-- upvalues: t_108 (ref), t (ref)
	local var2187 = t_108.new()
	
	if self.action_type ~= nil then
		var2187.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2187.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2187.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2187.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.actionParams)
	end
	return var2187
end

t_108.descriptor = {
	name = "LaunchExperienceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LaunchExperienceAction"
}
t.LaunchExperienceAction = t_108
typeRegistryModule.default:register(t.LaunchExperienceAction)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p109)
	-- upvalues: t_109 (ref)
	return setmetatable({
		kind = if p109 == nil or p109.kind == nil then nil else p109.kind
	}, t_109)
end

function t_109:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2187 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2188 = self.kind.value:encode()
			local var2189, var2190 = protoModule.writeTag(buff, var2187, 1, protoModule.wireTypes.lengthDelimited)
			var2189, var3630 = protoModule.writeBuffer(var2189, var2190, var2188, buffer.len(var2188))
			buff = var2189
			var2187 = var2190
		elseif self.kind.type == "binding_path" then
			local var2191, var2192 = protoModule.writeTag(buff, var2187, 2, protoModule.wireTypes.lengthDelimited)
			var2191, var3632 = protoModule.writeString(var2191, var2192, self.kind.value)
			buff = var2191
			var2187 = var2192
		end
	end
	local buff_1 = buffer.create(var2187)
	buffer.copy(buff_1, 0, buff, 0, var2187)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref), t (ref)
	local var2187 = t_109.new()
	local var2188 = 0
	while var2188 < buffer.len(p109) do
		local _ = nil
		local var2189 = nil
		local var2190, var2191, var2192 = protoModule.readTag(p109, var2188)
		local var2193 = var2190
		var2189 = var2191
		var2188 = var2192
		
		if var2189 == protoModule.wireTypes.varint then
			local _ = nil
			local var2194, var2195 = protoModule.readVarInt(p109, var2188)
			local _ = var2194
			var2188 = var2195
			continue
		end
		if var2189 == protoModule.wireTypes.lengthDelimited then
			if var2193 == 1 then
				local _ = nil
				local var2196, var2197 = protoModule.readBuffer(p109, var2188)
				var2188 = var2197
				var2187.kind = {
					type = "literal",
					value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.decode(var2196)
				}
			elseif var2193 == 2 then
				local _ = nil
				local var2198, var2199 = protoModule.readBuffer(p109, var2188)
				var2188 = var2199
				var2187.kind = { type = "binding_path", value = buffer.tostring(var2198) }
			else
				local _ = nil
				local var2200, var2201 = protoModule.readVarInt(p109, var2188)
				var2188 = var2201 + var2200
			end
		elseif var2189 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2202, var2203 = protoModule.readFixed32(p109, var2188)
			local _ = var2202
			var2188 = var2203
		elseif var2189 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2204, var2205 = protoModule.readFixed64(p109, var2188)
			local _ = var2204
			var2188 = var2205
		else
			error("Unsupported wire type: " .. var3636)
		end
	end
	return var2187
end

function t_109:jsonEncode()
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

function t_109:jsonDecode()
	-- upvalues: t_109 (ref), t (ref)
	local var2206 = t_109.new()
	
	if self.literal ~= nil then
		var2206.kind = {
			type = "literal",
			value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2206.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2206.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2206
end

t_109.descriptor = {
	name = "LaunchExperienceAction_ExperienceJoinData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceJoinData"
}
t.LaunchExperienceAction_ExperienceJoinData = t_109
typeRegistryModule.default:register(t.LaunchExperienceAction_ExperienceJoinData)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p110)
	-- upvalues: t_110 (ref)
	return setmetatable({
		launch_data = if p110 == nil or p110.launch_data == nil then nil else p110.launch_data,
		event_id = if p110 == nil or p110.event_id == nil then nil else p110.event_id
	}, t_110)
end

function t_110:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2206 = 0
	
	if self.launch_data ~= nil then
		local var2207 = self.launch_data:encode()
		local var2208, var2209 = protoModule.writeTag(buff, var2206, 1, protoModule.wireTypes.lengthDelimited)
		var2208, var3659 = protoModule.writeBuffer(var2208, var2209, var2207, buffer.len(var2207))
		buff = var2208
		var2206 = var2209
	end
	if self.event_id ~= nil then
		local var2210 = self.event_id:encode()
		local var2211, var2212 = protoModule.writeTag(buff, var2206, 2, protoModule.wireTypes.lengthDelimited)
		var2211, var3662 = protoModule.writeBuffer(var2211, var2212, var2210, buffer.len(var2210))
		buff = var2211
		var2206 = var2212
	end
	local buff_1 = buffer.create(var2206)
	buffer.copy(buff_1, 0, buff, 0, var2206)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref), propTypesModule (ref)
	local var2206 = t_110.new()
	local var2207 = 0
	while var2207 < buffer.len(p110) do
		local _ = nil
		local var2208 = nil
		local var2209, var2210, var2211 = protoModule.readTag(p110, var2207)
		local var2212 = var2209
		var2208 = var2210
		var2207 = var2211
		
		if var2208 == protoModule.wireTypes.varint then
			local _ = nil
			local var2213, var2214 = protoModule.readVarInt(p110, var2207)
			local _ = var2213
			var2207 = var2214
			continue
		end
		if var2208 == protoModule.wireTypes.lengthDelimited then
			if var2212 == 1 then
				local _ = nil
				local var2215, var2216 = protoModule.readBuffer(p110, var2207)
				var2207 = var2216
				var2206.launch_data = propTypesModule.StringProp.decode(var2215)
			elseif var2212 == 2 then
				local _ = nil
				local var2217, var2218 = protoModule.readBuffer(p110, var2207)
				var2207 = var2218
				var2206.event_id = propTypesModule.StringProp.decode(var2217)
			else
				local _ = nil
				local var2219, var2220 = protoModule.readVarInt(p110, var2207)
				var2207 = var2220 + var2219
			end
		elseif var2208 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2221, var2222 = protoModule.readFixed32(p110, var2207)
			local _ = var2221
			var2207 = var2222
		elseif var2208 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2223, var2224 = protoModule.readFixed64(p110, var2207)
			local _ = var2223
			var2207 = var2224
		else
			error("Unsupported wire type: " .. var3666)
		end
	end
	return var2206
end

function t_110:jsonEncode()
	local t = {}
	
	if self.launch_data ~= nil then
		t.launchData = self.launch_data:jsonEncode()
	end
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_110:jsonDecode()
	-- upvalues: t_110 (ref), propTypesModule (ref)
	local var2225 = t_110.new()
	
	if self.launch_data ~= nil then
		var2225.launch_data = propTypesModule.StringProp.jsonDecode(self.launch_data)
	end
	if self.launchData ~= nil then
		var2225.launch_data = propTypesModule.StringProp.jsonDecode(self.launchData)
	end
	if self.event_id ~= nil then
		var2225.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var2225.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var2225
end

t_110.descriptor = {
	name = "LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceJoinDataLiteral"
}
t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral = t_110
typeRegistryModule.default:register(t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p111)
	-- upvalues: t_111 (ref)
	return setmetatable({
		place_id = if p111 == nil or p111.place_id == nil then nil else p111.place_id,
		universe_id = if p111 == nil or p111.universe_id == nil then nil else p111.universe_id,
		launch_source = if p111 == nil or p111.launch_source == nil then nil else p111.launch_source,
		experience_join_data = if p111 == nil or p111.experience_join_data == nil then nil else p111.experience_join_data
	}, t_111)
end

function t_111:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2225 = 0
	
	if self.place_id ~= nil then
		local var2226 = self.place_id:encode()
		local var2227, var2228 = protoModule.writeTag(buff, var2225, 1, protoModule.wireTypes.lengthDelimited)
		var2227, var3689 = protoModule.writeBuffer(var2227, var2228, var2226, buffer.len(var2226))
		buff = var2227
		var2225 = var2228
	end
	if self.universe_id ~= nil then
		local var2229 = self.universe_id:encode()
		local var2230, var2231 = protoModule.writeTag(buff, var2225, 2, protoModule.wireTypes.lengthDelimited)
		var2230, var3692 = protoModule.writeBuffer(var2230, var2231, var2229, buffer.len(var2229))
		buff = var2230
		var2225 = var2231
	end
	if self.launch_source ~= nil then
		local var2232 = self.launch_source:encode()
		local var2233, var2234 = protoModule.writeTag(buff, var2225, 3, protoModule.wireTypes.lengthDelimited)
		var2233, var3695 = protoModule.writeBuffer(var2233, var2234, var2232, buffer.len(var2232))
		buff = var2233
		var2225 = var2234
	end
	if self.experience_join_data ~= nil then
		local var2235 = self.experience_join_data:encode()
		local var2236, var2237 = protoModule.writeTag(buff, var2225, 4, protoModule.wireTypes.lengthDelimited)
		var2236, var3698 = protoModule.writeBuffer(var2236, var2237, var2235, buffer.len(var2235))
		buff = var2236
		var2225 = var2237
	end
	local buff_1 = buffer.create(var2225)
	buffer.copy(buff_1, 0, buff, 0, var2225)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var2225 = t_111.new()
	local var2226 = 0
	while var2226 < buffer.len(p111) do
		local _ = nil
		local var2227 = nil
		local var2228, var2229, var2230 = protoModule.readTag(p111, var2226)
		local var2231 = var2228
		var2227 = var2229
		var2226 = var2230
		
		if var2227 == protoModule.wireTypes.varint then
			local _ = nil
			local var2232, var2233 = protoModule.readVarInt(p111, var2226)
			local _ = var2232
			var2226 = var2233
			continue
		end
		if var2227 == protoModule.wireTypes.lengthDelimited then
			if var2231 == 1 then
				local _ = nil
				local var2234, var2235 = protoModule.readBuffer(p111, var2226)
				var2226 = var2235
				var2225.place_id = propTypesModule.StringProp.decode(var2234)
			elseif var2231 == 2 then
				local _ = nil
				local var2236, var2237 = protoModule.readBuffer(p111, var2226)
				var2226 = var2237
				var2225.universe_id = propTypesModule.StringProp.decode(var2236)
			elseif var2231 == 3 then
				local _ = nil
				local var2238, var2239 = protoModule.readBuffer(p111, var2226)
				var2226 = var2239
				var2225.launch_source = propTypesModule.StringProp.decode(var2238)
			elseif var2231 == 4 then
				local _ = nil
				local var2240, var2241 = protoModule.readBuffer(p111, var2226)
				var2226 = var2241
				var2225.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.decode(var2240)
			else
				local _ = nil
				local var2242, var2243 = protoModule.readVarInt(p111, var2226)
				var2226 = var2243 + var2242
			end
		elseif var2227 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2244, var2245 = protoModule.readFixed32(p111, var2226)
			local _ = var2244
			var2226 = var2245
		elseif var2227 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2246, var2247 = protoModule.readFixed64(p111, var2226)
			local _ = var2246
			var2226 = var2247
		else
			error("Unsupported wire type: " .. var3702)
		end
	end
	return var2225
end

function t_111:jsonEncode()
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

function t_111:jsonDecode()
	-- upvalues: t_111 (ref), propTypesModule (ref), t (ref)
	local var2248 = t_111.new()
	
	if self.place_id ~= nil then
		var2248.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var2248.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var2248.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2248.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.launch_source ~= nil then
		var2248.launch_source = propTypesModule.StringProp.jsonDecode(self.launch_source)
	end
	if self.launchSource ~= nil then
		var2248.launch_source = propTypesModule.StringProp.jsonDecode(self.launchSource)
	end
	if self.experience_join_data ~= nil then
		var2248.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experience_join_data)
	end
	if self.experienceJoinData ~= nil then
		var2248.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experienceJoinData)
	end
	return var2248
end

t_111.descriptor = {
	name = "LaunchExperienceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LaunchExperienceAction_Params = t_111
typeRegistryModule.default:register(t.LaunchExperienceAction_Params)
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
	local var2248 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2249, var2250 = protoModule.writeTag(buff, var2248, 1, protoModule.wireTypes.varint)
		var2249, var3728 = protoModule.writeVarInt(var2249, var2250, t.ActionType.toNumber(self.action_type))
		buff = var2249
		var2248 = var2250
	end
	if self.action_params ~= nil then
		local var2251 = self.action_params:encode()
		local var2252, var2253 = protoModule.writeTag(buff, var2248, 2, protoModule.wireTypes.lengthDelimited)
		var2252, var3731 = protoModule.writeBuffer(var2252, var2253, var2251, buffer.len(var2251))
		buff = var2252
		var2248 = var2253
	end
	local buff_1 = buffer.create(var2248)
	buffer.copy(buff_1, 0, buff, 0, var2248)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var2248 = t_112.new()
	local var2249 = 0
	while var2249 < buffer.len(p112) do
		local _ = nil
		local var2250 = nil
		local var2251, var2252, var2253 = protoModule.readTag(p112, var2249)
		local var2254 = var2251
		var2250 = var2252
		var2249 = var2253
		
		if var2250 == protoModule.wireTypes.varint then
			if var2254 == 1 then
				local _ = nil
				local var2255, var2256 = protoModule.readVarIntI32(p112, var2249)
				local var2257 = var2255
				var2249 = var2256
				var2248.action_type = t.ActionType.fromNumber(var2257) or var2257
			else
				local _ = nil
				local var2258, var2259 = protoModule.readVarInt(p112, var2249)
				local _ = var2258
				var2249 = var2259
			end
		end
		if var2250 == protoModule.wireTypes.lengthDelimited then
			if var2254 == 2 then
				local _ = nil
				local var2260, var2261 = protoModule.readBuffer(p112, var2249)
				var2249 = var2261
				var2248.action_params = t.ToggleExperienceFavoriteAction_Params.decode(var2260)
			else
				local _ = nil
				local var2262, var2263 = protoModule.readVarInt(p112, var2249)
				var2249 = var2263 + var2262
			end
		elseif var2250 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2264, var2265 = protoModule.readFixed32(p112, var2249)
			local _ = var2264
			var2249 = var2265
		elseif var2250 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2266, var2267 = protoModule.readFixed64(p112, var2249)
			local _ = var2266
			var2249 = var2267
		else
			error("Unsupported wire type: " .. var3735)
		end
	end
	return var2248
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
	local var2268 = t_112.new()
	
	if self.action_type ~= nil then
		var2268.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2268.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2268.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2268.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.actionParams)
	end
	return var2268
end

t_112.descriptor = {
	name = "ToggleExperienceFavoriteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceFavoriteAction"
}
t.ToggleExperienceFavoriteAction = t_112
typeRegistryModule.default:register(t.ToggleExperienceFavoriteAction)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p113)
	-- upvalues: t_113 (ref)
	return setmetatable({
		universe_id = if p113 == nil or p113.universe_id == nil then nil else p113.universe_id,
		place_id = if p113 == nil or p113.place_id == nil then nil else p113.place_id,
		ctx = if p113 == nil or p113.ctx == nil then nil else p113.ctx
	}, t_113)
end

function t_113:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2268 = 0
	
	if self.universe_id ~= nil then
		local var2269 = self.universe_id:encode()
		local var2270, var2271 = protoModule.writeTag(buff, var2268, 1, protoModule.wireTypes.lengthDelimited)
		var2270, var3759 = protoModule.writeBuffer(var2270, var2271, var2269, buffer.len(var2269))
		buff = var2270
		var2268 = var2271
	end
	if self.place_id ~= nil then
		local var2272 = self.place_id:encode()
		local var2273, var2274 = protoModule.writeTag(buff, var2268, 2, protoModule.wireTypes.lengthDelimited)
		var2273, var3762 = protoModule.writeBuffer(var2273, var2274, var2272, buffer.len(var2272))
		buff = var2273
		var2268 = var2274
	end
	if self.ctx ~= nil then
		local var2275 = self.ctx:encode()
		local var2276, var2277 = protoModule.writeTag(buff, var2268, 3, protoModule.wireTypes.lengthDelimited)
		var2276, var3765 = protoModule.writeBuffer(var2276, var2277, var2275, buffer.len(var2275))
		buff = var2276
		var2268 = var2277
	end
	local buff_1 = buffer.create(var2268)
	buffer.copy(buff_1, 0, buff, 0, var2268)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref), propTypesModule (ref)
	local var2268 = t_113.new()
	local var2269 = 0
	while var2269 < buffer.len(p113) do
		local _ = nil
		local var2270 = nil
		local var2271, var2272, var2273 = protoModule.readTag(p113, var2269)
		local var2274 = var2271
		var2270 = var2272
		var2269 = var2273
		
		if var2270 == protoModule.wireTypes.varint then
			local _ = nil
			local var2275, var2276 = protoModule.readVarInt(p113, var2269)
			local _ = var2275
			var2269 = var2276
			continue
		end
		if var2270 == protoModule.wireTypes.lengthDelimited then
			if var2274 == 1 then
				local _ = nil
				local var2277, var2278 = protoModule.readBuffer(p113, var2269)
				var2269 = var2278
				var2268.universe_id = propTypesModule.StringProp.decode(var2277)
			elseif var2274 == 2 then
				local _ = nil
				local var2279, var2280 = protoModule.readBuffer(p113, var2269)
				var2269 = var2280
				var2268.place_id = propTypesModule.StringProp.decode(var2279)
			elseif var2274 == 3 then
				local _ = nil
				local var2281, var2282 = protoModule.readBuffer(p113, var2269)
				var2269 = var2282
				var2268.ctx = propTypesModule.StringProp.decode(var2281)
			else
				local _ = nil
				local var2283, var2284 = protoModule.readVarInt(p113, var2269)
				var2269 = var2284 + var2283
			end
		elseif var2270 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2285, var2286 = protoModule.readFixed32(p113, var2269)
			local _ = var2285
			var2269 = var2286
		elseif var2270 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2287, var2288 = protoModule.readFixed64(p113, var2269)
			local _ = var2287
			var2269 = var2288
		else
			error("Unsupported wire type: " .. var3769)
		end
	end
	return var2268
end

function t_113:jsonEncode()
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

function t_113:jsonDecode()
	-- upvalues: t_113 (ref), propTypesModule (ref)
	local var2289 = t_113.new()
	
	if self.universe_id ~= nil then
		var2289.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2289.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var2289.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var2289.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		var2289.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var2289
end

t_113.descriptor = {
	name = "ToggleExperienceFavoriteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceFavoriteAction_Params = t_113
typeRegistryModule.default:register(t.ToggleExperienceFavoriteAction_Params)
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
	local var2289 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2290, var2291 = protoModule.writeTag(buff, var2289, 1, protoModule.wireTypes.varint)
		var2290, var3793 = protoModule.writeVarInt(var2290, var2291, t.ActionType.toNumber(self.action_type))
		buff = var2290
		var2289 = var2291
	end
	if self.action_params ~= nil then
		local var2292 = self.action_params:encode()
		local var2293, var2294 = protoModule.writeTag(buff, var2289, 2, protoModule.wireTypes.lengthDelimited)
		var2293, var3796 = protoModule.writeBuffer(var2293, var2294, var2292, buffer.len(var2292))
		buff = var2293
		var2289 = var2294
	end
	local buff_1 = buffer.create(var2289)
	buffer.copy(buff_1, 0, buff, 0, var2289)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref), t (ref)
	local var2289 = t_114.new()
	local var2290 = 0
	while var2290 < buffer.len(p114) do
		local _ = nil
		local var2291 = nil
		local var2292, var2293, var2294 = protoModule.readTag(p114, var2290)
		local var2295 = var2292
		var2291 = var2293
		var2290 = var2294
		
		if var2291 == protoModule.wireTypes.varint then
			if var2295 == 1 then
				local _ = nil
				local var2296, var2297 = protoModule.readVarIntI32(p114, var2290)
				local var2298 = var2296
				var2290 = var2297
				var2289.action_type = t.ActionType.fromNumber(var2298) or var2298
			else
				local _ = nil
				local var2299, var2300 = protoModule.readVarInt(p114, var2290)
				local _ = var2299
				var2290 = var2300
			end
		end
		if var2291 == protoModule.wireTypes.lengthDelimited then
			if var2295 == 2 then
				local _ = nil
				local var2301, var2302 = protoModule.readBuffer(p114, var2290)
				var2290 = var2302
				var2289.action_params = t.ToggleExperienceFollowAction_Params.decode(var2301)
			else
				local _ = nil
				local var2303, var2304 = protoModule.readVarInt(p114, var2290)
				var2290 = var2304 + var2303
			end
		elseif var2291 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2305, var2306 = protoModule.readFixed32(p114, var2290)
			local _ = var2305
			var2290 = var2306
		elseif var2291 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2307, var2308 = protoModule.readFixed64(p114, var2290)
			local _ = var2307
			var2290 = var2308
		else
			error("Unsupported wire type: " .. var3800)
		end
	end
	return var2289
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
	local var2309 = t_114.new()
	
	if self.action_type ~= nil then
		var2309.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2309.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2309.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2309.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.actionParams)
	end
	return var2309
end

t_114.descriptor = {
	name = "ToggleExperienceFollowAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceFollowAction"
}
t.ToggleExperienceFollowAction = t_114
typeRegistryModule.default:register(t.ToggleExperienceFollowAction)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p115)
	-- upvalues: t_115 (ref)
	return setmetatable({
		universe_id = if p115 == nil or p115.universe_id == nil then nil else p115.universe_id,
		game_name = if p115 == nil or p115.game_name == nil then nil else p115.game_name,
		ctx = if p115 == nil or p115.ctx == nil then nil else p115.ctx
	}, t_115)
end

function t_115:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2309 = 0
	
	if self.universe_id ~= nil then
		local var2310 = self.universe_id:encode()
		local var2311, var2312 = protoModule.writeTag(buff, var2309, 1, protoModule.wireTypes.lengthDelimited)
		var2311, var3824 = protoModule.writeBuffer(var2311, var2312, var2310, buffer.len(var2310))
		buff = var2311
		var2309 = var2312
	end
	if self.game_name ~= nil then
		local var2313 = self.game_name:encode()
		local var2314, var2315 = protoModule.writeTag(buff, var2309, 2, protoModule.wireTypes.lengthDelimited)
		var2314, var3827 = protoModule.writeBuffer(var2314, var2315, var2313, buffer.len(var2313))
		buff = var2314
		var2309 = var2315
	end
	if self.ctx ~= nil then
		local var2316 = self.ctx:encode()
		local var2317, var2318 = protoModule.writeTag(buff, var2309, 3, protoModule.wireTypes.lengthDelimited)
		var2317, var3830 = protoModule.writeBuffer(var2317, var2318, var2316, buffer.len(var2316))
		buff = var2317
		var2309 = var2318
	end
	local buff_1 = buffer.create(var2309)
	buffer.copy(buff_1, 0, buff, 0, var2309)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref), propTypesModule (ref)
	local var2309 = t_115.new()
	local var2310 = 0
	while var2310 < buffer.len(p115) do
		local _ = nil
		local var2311 = nil
		local var2312, var2313, var2314 = protoModule.readTag(p115, var2310)
		local var2315 = var2312
		var2311 = var2313
		var2310 = var2314
		
		if var2311 == protoModule.wireTypes.varint then
			local _ = nil
			local var2316, var2317 = protoModule.readVarInt(p115, var2310)
			local _ = var2316
			var2310 = var2317
			continue
		end
		if var2311 == protoModule.wireTypes.lengthDelimited then
			if var2315 == 1 then
				local _ = nil
				local var2318, var2319 = protoModule.readBuffer(p115, var2310)
				var2310 = var2319
				var2309.universe_id = propTypesModule.StringProp.decode(var2318)
			elseif var2315 == 2 then
				local _ = nil
				local var2320, var2321 = protoModule.readBuffer(p115, var2310)
				var2310 = var2321
				var2309.game_name = propTypesModule.StringProp.decode(var2320)
			elseif var2315 == 3 then
				local _ = nil
				local var2322, var2323 = protoModule.readBuffer(p115, var2310)
				var2310 = var2323
				var2309.ctx = propTypesModule.StringProp.decode(var2322)
			else
				local _ = nil
				local var2324, var2325 = protoModule.readVarInt(p115, var2310)
				var2310 = var2325 + var2324
			end
		elseif var2311 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2326, var2327 = protoModule.readFixed32(p115, var2310)
			local _ = var2326
			var2310 = var2327
		elseif var2311 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2328, var2329 = protoModule.readFixed64(p115, var2310)
			local _ = var2328
			var2310 = var2329
		else
			error("Unsupported wire type: " .. var3834)
		end
	end
	return var2309
end

function t_115:jsonEncode()
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

function t_115:jsonDecode()
	-- upvalues: t_115 (ref), propTypesModule (ref)
	local var2330 = t_115.new()
	
	if self.universe_id ~= nil then
		var2330.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2330.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.game_name ~= nil then
		var2330.game_name = propTypesModule.StringProp.jsonDecode(self.game_name)
	end
	if self.gameName ~= nil then
		var2330.game_name = propTypesModule.StringProp.jsonDecode(self.gameName)
	end
	if self.ctx ~= nil then
		var2330.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var2330
end

t_115.descriptor = {
	name = "ToggleExperienceFollowAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceFollowAction_Params = t_115
typeRegistryModule.default:register(t.ToggleExperienceFollowAction_Params)
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
	local var2330 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2331, var2332 = protoModule.writeTag(buff, var2330, 1, protoModule.wireTypes.varint)
		var2331, var3858 = protoModule.writeVarInt(var2331, var2332, t.ActionType.toNumber(self.action_type))
		buff = var2331
		var2330 = var2332
	end
	if self.action_params ~= nil then
		local var2333 = self.action_params:encode()
		local var2334, var2335 = protoModule.writeTag(buff, var2330, 2, protoModule.wireTypes.lengthDelimited)
		var2334, var3861 = protoModule.writeBuffer(var2334, var2335, var2333, buffer.len(var2333))
		buff = var2334
		var2330 = var2335
	end
	local buff_1 = buffer.create(var2330)
	buffer.copy(buff_1, 0, buff, 0, var2330)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref), t (ref)
	local var2330 = t_116.new()
	local var2331 = 0
	while var2331 < buffer.len(p116) do
		local _ = nil
		local var2332 = nil
		local var2333, var2334, var2335 = protoModule.readTag(p116, var2331)
		local var2336 = var2333
		var2332 = var2334
		var2331 = var2335
		
		if var2332 == protoModule.wireTypes.varint then
			if var2336 == 1 then
				local _ = nil
				local var2337, var2338 = protoModule.readVarIntI32(p116, var2331)
				local var2339 = var2337
				var2331 = var2338
				var2330.action_type = t.ActionType.fromNumber(var2339) or var2339
			else
				local _ = nil
				local var2340, var2341 = protoModule.readVarInt(p116, var2331)
				local _ = var2340
				var2331 = var2341
			end
		end
		if var2332 == protoModule.wireTypes.lengthDelimited then
			if var2336 == 2 then
				local _ = nil
				local var2342, var2343 = protoModule.readBuffer(p116, var2331)
				var2331 = var2343
				var2330.action_params = t.ToggleExperienceVoteAction_Params.decode(var2342)
			else
				local _ = nil
				local var2344, var2345 = protoModule.readVarInt(p116, var2331)
				var2331 = var2345 + var2344
			end
		elseif var2332 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2346, var2347 = protoModule.readFixed32(p116, var2331)
			local _ = var2346
			var2331 = var2347
		elseif var2332 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2348, var2349 = protoModule.readFixed64(p116, var2331)
			local _ = var2348
			var2331 = var2349
		else
			error("Unsupported wire type: " .. var3865)
		end
	end
	return var2330
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
	local var2350 = t_116.new()
	
	if self.action_type ~= nil then
		var2350.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2350.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2350.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2350.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.actionParams)
	end
	return var2350
end

t_116.descriptor = {
	name = "ToggleExperienceVoteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceVoteAction"
}
t.ToggleExperienceVoteAction = t_116
typeRegistryModule.default:register(t.ToggleExperienceVoteAction)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p117)
	-- upvalues: t_117 (ref)
	return setmetatable({
		universe_id = if p117 == nil or p117.universe_id == nil then nil else p117.universe_id,
		vote_direction = if p117 == nil or p117.vote_direction == nil then nil else p117.vote_direction,
		place_id = if p117 == nil or p117.place_id == nil then nil else p117.place_id,
		ctx = if p117 == nil or p117.ctx == nil then nil else p117.ctx
	}, t_117)
end

function t_117:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2350 = 0
	
	if self.universe_id ~= nil then
		local var2351 = self.universe_id:encode()
		local var2352, var2353 = protoModule.writeTag(buff, var2350, 1, protoModule.wireTypes.lengthDelimited)
		var2352, var3889 = protoModule.writeBuffer(var2352, var2353, var2351, buffer.len(var2351))
		buff = var2352
		var2350 = var2353
	end
	if self.vote_direction ~= nil then
		local var2354 = self.vote_direction:encode()
		local var2355, var2356 = protoModule.writeTag(buff, var2350, 2, protoModule.wireTypes.lengthDelimited)
		var2355, var3892 = protoModule.writeBuffer(var2355, var2356, var2354, buffer.len(var2354))
		buff = var2355
		var2350 = var2356
	end
	if self.place_id ~= nil then
		local var2357 = self.place_id:encode()
		local var2358, var2359 = protoModule.writeTag(buff, var2350, 3, protoModule.wireTypes.lengthDelimited)
		var2358, var3895 = protoModule.writeBuffer(var2358, var2359, var2357, buffer.len(var2357))
		buff = var2358
		var2350 = var2359
	end
	if self.ctx ~= nil then
		local var2360 = self.ctx:encode()
		local var2361, var2362 = protoModule.writeTag(buff, var2350, 4, protoModule.wireTypes.lengthDelimited)
		var2361, var3898 = protoModule.writeBuffer(var2361, var2362, var2360, buffer.len(var2360))
		buff = var2361
		var2350 = var2362
	end
	local buff_1 = buffer.create(var2350)
	buffer.copy(buff_1, 0, buff, 0, var2350)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref), propTypesModule (ref)
	local var2350 = t_117.new()
	local var2351 = 0
	while var2351 < buffer.len(p117) do
		local _ = nil
		local var2352 = nil
		local var2353, var2354, var2355 = protoModule.readTag(p117, var2351)
		local var2356 = var2353
		var2352 = var2354
		var2351 = var2355
		
		if var2352 == protoModule.wireTypes.varint then
			local _ = nil
			local var2357, var2358 = protoModule.readVarInt(p117, var2351)
			local _ = var2357
			var2351 = var2358
			continue
		end
		if var2352 == protoModule.wireTypes.lengthDelimited then
			if var2356 == 1 then
				local _ = nil
				local var2359, var2360 = protoModule.readBuffer(p117, var2351)
				var2351 = var2360
				var2350.universe_id = propTypesModule.StringProp.decode(var2359)
			elseif var2356 == 2 then
				local _ = nil
				local var2361, var2362 = protoModule.readBuffer(p117, var2351)
				var2351 = var2362
				var2350.vote_direction = propTypesModule.BoolProp.decode(var2361)
			elseif var2356 == 3 then
				local _ = nil
				local var2363, var2364 = protoModule.readBuffer(p117, var2351)
				var2351 = var2364
				var2350.place_id = propTypesModule.StringProp.decode(var2363)
			elseif var2356 == 4 then
				local _ = nil
				local var2365, var2366 = protoModule.readBuffer(p117, var2351)
				var2351 = var2366
				var2350.ctx = propTypesModule.StringProp.decode(var2365)
			else
				local _ = nil
				local var2367, var2368 = protoModule.readVarInt(p117, var2351)
				var2351 = var2368 + var2367
			end
		elseif var2352 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2369, var2370 = protoModule.readFixed32(p117, var2351)
			local _ = var2369
			var2351 = var2370
		elseif var2352 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2371, var2372 = protoModule.readFixed64(p117, var2351)
			local _ = var2371
			var2351 = var2372
		else
			error("Unsupported wire type: " .. var3902)
		end
	end
	return var2350
end

function t_117:jsonEncode()
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

function t_117:jsonDecode()
	-- upvalues: t_117 (ref), propTypesModule (ref)
	local var2373 = t_117.new()
	
	if self.universe_id ~= nil then
		var2373.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2373.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.vote_direction ~= nil then
		var2373.vote_direction = propTypesModule.BoolProp.jsonDecode(self.vote_direction)
	end
	if self.voteDirection ~= nil then
		var2373.vote_direction = propTypesModule.BoolProp.jsonDecode(self.voteDirection)
	end
	if self.place_id ~= nil then
		var2373.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var2373.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		var2373.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var2373
end

t_117.descriptor = {
	name = "ToggleExperienceVoteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceVoteAction_Params = t_117
typeRegistryModule.default:register(t.ToggleExperienceVoteAction_Params)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p118)
	-- upvalues: t (ref), t_118 (ref)
	return setmetatable({
		action_type = if p118 == nil or p118.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p118.action_type,
		action_params = if p118 == nil or p118.action_params == nil then nil else p118.action_params
	}, t_118)
end

function t_118:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var2373 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2374, var2375 = protoModule.writeTag(buff, var2373, 1, protoModule.wireTypes.varint)
		var2374, var3928 = protoModule.writeVarInt(var2374, var2375, t.ActionType.toNumber(self.action_type))
		buff = var2374
		var2373 = var2375
	end
	if self.action_params ~= nil then
		local var2376 = self.action_params:encode()
		local var2377, var2378 = protoModule.writeTag(buff, var2373, 2, protoModule.wireTypes.lengthDelimited)
		var2377, var3931 = protoModule.writeBuffer(var2377, var2378, var2376, buffer.len(var2376))
		buff = var2377
		var2373 = var2378
	end
	local buff_1 = buffer.create(var2373)
	buffer.copy(buff_1, 0, buff, 0, var2373)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref), t (ref)
	local var2373 = t_118.new()
	local var2374 = 0
	while var2374 < buffer.len(p118) do
		local _ = nil
		local var2375 = nil
		local var2376, var2377, var2378 = protoModule.readTag(p118, var2374)
		local var2379 = var2376
		var2375 = var2377
		var2374 = var2378
		
		if var2375 == protoModule.wireTypes.varint then
			if var2379 == 1 then
				local _ = nil
				local var2380, var2381 = protoModule.readVarIntI32(p118, var2374)
				local var2382 = var2380
				var2374 = var2381
				var2373.action_type = t.ActionType.fromNumber(var2382) or var2382
			else
				local _ = nil
				local var2383, var2384 = protoModule.readVarInt(p118, var2374)
				local _ = var2383
				var2374 = var2384
			end
		end
		if var2375 == protoModule.wireTypes.lengthDelimited then
			if var2379 == 2 then
				local _ = nil
				local var2385, var2386 = protoModule.readBuffer(p118, var2374)
				var2374 = var2386
				var2373.action_params = t.OpenPurchasePromptAction_Params.decode(var2385)
			else
				local _ = nil
				local var2387, var2388 = protoModule.readVarInt(p118, var2374)
				var2374 = var2388 + var2387
			end
		elseif var2375 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2389, var2390 = protoModule.readFixed32(p118, var2374)
			local _ = var2389
			var2374 = var2390
		elseif var2375 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2391, var2392 = protoModule.readFixed64(p118, var2374)
			local _ = var2391
			var2374 = var2392
		else
			error("Unsupported wire type: " .. var3935)
		end
	end
	return var2373
end

function t_118:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_118:jsonDecode()
	-- upvalues: t_118 (ref), t (ref)
	local var2393 = t_118.new()
	
	if self.action_type ~= nil then
		var2393.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2393.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2393.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2393.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.actionParams)
	end
	return var2393
end

t_118.descriptor = {
	name = "OpenPurchasePromptAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenPurchasePromptAction"
}
t.OpenPurchasePromptAction = t_118
typeRegistryModule.default:register(t.OpenPurchasePromptAction)
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
	local var2393 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2394 = self.kind.value:encode()
			local var2395, var2396 = protoModule.writeTag(buff, var2393, 1, protoModule.wireTypes.lengthDelimited)
			var2395, var3959 = protoModule.writeBuffer(var2395, var2396, var2394, buffer.len(var2394))
			buff = var2395
			var2393 = var2396
		elseif self.kind.type == "binding_path" then
			local var2397, var2398 = protoModule.writeTag(buff, var2393, 2, protoModule.wireTypes.lengthDelimited)
			var2397, var3961 = protoModule.writeString(var2397, var2398, self.kind.value)
			buff = var2397
			var2393 = var2398
		end
	end
	local buff_1 = buffer.create(var2393)
	buffer.copy(buff_1, 0, buff, 0, var2393)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref), t (ref)
	local var2393 = t_119.new()
	local var2394 = 0
	while var2394 < buffer.len(p119) do
		local _ = nil
		local var2395 = nil
		local var2396, var2397, var2398 = protoModule.readTag(p119, var2394)
		local var2399 = var2396
		var2395 = var2397
		var2394 = var2398
		
		if var2395 == protoModule.wireTypes.varint then
			local _ = nil
			local var2400, var2401 = protoModule.readVarInt(p119, var2394)
			local _ = var2400
			var2394 = var2401
			continue
		end
		if var2395 == protoModule.wireTypes.lengthDelimited then
			if var2399 == 1 then
				local _ = nil
				local var2402, var2403 = protoModule.readBuffer(p119, var2394)
				var2394 = var2403
				var2393.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.decode(var2402)
				}
			elseif var2399 == 2 then
				local _ = nil
				local var2404, var2405 = protoModule.readBuffer(p119, var2394)
				var2394 = var2405
				var2393.kind = { type = "binding_path", value = buffer.tostring(var2404) }
			else
				local _ = nil
				local var2406, var2407 = protoModule.readVarInt(p119, var2394)
				var2394 = var2407 + var2406
			end
		elseif var2395 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2408, var2409 = protoModule.readFixed32(p119, var2394)
			local _ = var2408
			var2394 = var2409
		elseif var2395 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2410, var2411 = protoModule.readFixed64(p119, var2394)
			local _ = var2410
			var2394 = var2411
		else
			error("Unsupported wire type: " .. var3965)
		end
	end
	return var2393
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
	local var2412 = t_119.new()
	
	if self.literal ~= nil then
		var2412.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2412.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2412.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2412
end

t_119.descriptor = {
	name = "OpenPurchasePromptAction_ProductPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ProductPayload"
}
t.OpenPurchasePromptAction_ProductPayload = t_119
typeRegistryModule.default:register(t.OpenPurchasePromptAction_ProductPayload)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p120)
	-- upvalues: t_120 (ref)
	return setmetatable({
		kind = if p120 == nil or p120.kind == nil then nil else p120.kind,
		id = if p120 == nil or p120.id == nil then nil else p120.id,
		subscription_id = if p120 == nil or p120.subscription_id == nil then nil else p120.subscription_id,
		universe_id = if p120 == nil or p120.universe_id == nil then nil else p120.universe_id,
		equip_if_purchased = if p120 == nil or p120.equip_if_purchased == nil then nil else p120.equip_if_purchased,
		name = if p120 == nil or p120.name == nil then nil else p120.name,
		expected_price = if p120 == nil or p120.expected_price == nil then nil else p120.expected_price,
		icon_image_asset_id = if p120 == nil or p120.icon_image_asset_id == nil then nil else p120.icon_image_asset_id,
		is_subscription_in_robux = if p120 == nil or p120.is_subscription_in_robux == nil then nil else p120.is_subscription_in_robux,
		display_price = if p120 == nil or p120.display_price == nil then nil else p120.display_price
	}, t_120)
end

function t_120:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2412 = 0
	
	if self.kind ~= nil then
		local var2413 = self.kind:encode()
		local var2414, var2415 = protoModule.writeTag(buff, var2412, 1, protoModule.wireTypes.lengthDelimited)
		var2414, var3988 = protoModule.writeBuffer(var2414, var2415, var2413, buffer.len(var2413))
		buff = var2414
		var2412 = var2415
	end
	if self.id ~= nil then
		local var2416 = self.id:encode()
		local var2417, var2418 = protoModule.writeTag(buff, var2412, 2, protoModule.wireTypes.lengthDelimited)
		var2417, var3991 = protoModule.writeBuffer(var2417, var2418, var2416, buffer.len(var2416))
		buff = var2417
		var2412 = var2418
	end
	if self.subscription_id ~= nil then
		local var2419 = self.subscription_id:encode()
		local var2420, var2421 = protoModule.writeTag(buff, var2412, 3, protoModule.wireTypes.lengthDelimited)
		var2420, var3994 = protoModule.writeBuffer(var2420, var2421, var2419, buffer.len(var2419))
		buff = var2420
		var2412 = var2421
	end
	if self.universe_id ~= nil then
		local var2422 = self.universe_id:encode()
		local var2423, var2424 = protoModule.writeTag(buff, var2412, 4, protoModule.wireTypes.lengthDelimited)
		var2423, var3997 = protoModule.writeBuffer(var2423, var2424, var2422, buffer.len(var2422))
		buff = var2423
		var2412 = var2424
	end
	if self.equip_if_purchased ~= nil then
		local var2425 = self.equip_if_purchased:encode()
		local var2426, var2427 = protoModule.writeTag(buff, var2412, 5, protoModule.wireTypes.lengthDelimited)
		var2426, var4000 = protoModule.writeBuffer(var2426, var2427, var2425, buffer.len(var2425))
		buff = var2426
		var2412 = var2427
	end
	if self.name ~= nil then
		local var2428 = self.name:encode()
		local var2429, var2430 = protoModule.writeTag(buff, var2412, 6, protoModule.wireTypes.lengthDelimited)
		var2429, var4003 = protoModule.writeBuffer(var2429, var2430, var2428, buffer.len(var2428))
		buff = var2429
		var2412 = var2430
	end
	if self.expected_price ~= nil then
		local var2431 = self.expected_price:encode()
		local var2432, var2433 = protoModule.writeTag(buff, var2412, 7, protoModule.wireTypes.lengthDelimited)
		var2432, var4006 = protoModule.writeBuffer(var2432, var2433, var2431, buffer.len(var2431))
		buff = var2432
		var2412 = var2433
	end
	if self.icon_image_asset_id ~= nil then
		local var2434 = self.icon_image_asset_id:encode()
		local var2435, var2436 = protoModule.writeTag(buff, var2412, 8, protoModule.wireTypes.lengthDelimited)
		var2435, var4009 = protoModule.writeBuffer(var2435, var2436, var2434, buffer.len(var2434))
		buff = var2435
		var2412 = var2436
	end
	if self.is_subscription_in_robux ~= nil then
		local var2437 = self.is_subscription_in_robux:encode()
		local var2438, var2439 = protoModule.writeTag(buff, var2412, 9, protoModule.wireTypes.lengthDelimited)
		var2438, var4012 = protoModule.writeBuffer(var2438, var2439, var2437, buffer.len(var2437))
		buff = var2438
		var2412 = var2439
	end
	if self.display_price ~= nil then
		local var2440 = self.display_price:encode()
		local var2441, var2442 = protoModule.writeTag(buff, var2412, 10, protoModule.wireTypes.lengthDelimited)
		var2441, var4015 = protoModule.writeBuffer(var2441, var2442, var2440, buffer.len(var2440))
		buff = var2441
		var2412 = var2442
	end
	local buff_1 = buffer.create(var2412)
	buffer.copy(buff_1, 0, buff, 0, var2412)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref), propTypesModule (ref)
	local var2412 = t_120.new()
	local var2413 = 0
	while var2413 < buffer.len(p120) do
		local _ = nil
		local var2414 = nil
		local var2415, var2416, var2417 = protoModule.readTag(p120, var2413)
		local var2418 = var2415
		var2414 = var2416
		var2413 = var2417
		
		if var2414 == protoModule.wireTypes.varint then
			local _ = nil
			local var2419, var2420 = protoModule.readVarInt(p120, var2413)
			local _ = var2419
			var2413 = var2420
			continue
		end
		if var2414 == protoModule.wireTypes.lengthDelimited then
			if var2418 == 1 then
				local _ = nil
				local var2421, var2422 = protoModule.readBuffer(p120, var2413)
				var2413 = var2422
				var2412.kind = propTypesModule.StringProp.decode(var2421)
			elseif var2418 == 2 then
				local _ = nil
				local var2423, var2424 = protoModule.readBuffer(p120, var2413)
				var2413 = var2424
				var2412.id = propTypesModule.StringProp.decode(var2423)
			elseif var2418 == 3 then
				local _ = nil
				local var2425, var2426 = protoModule.readBuffer(p120, var2413)
				var2413 = var2426
				var2412.subscription_id = propTypesModule.StringProp.decode(var2425)
			elseif var2418 == 4 then
				local _ = nil
				local var2427, var2428 = protoModule.readBuffer(p120, var2413)
				var2413 = var2428
				var2412.universe_id = propTypesModule.StringProp.decode(var2427)
			elseif var2418 == 5 then
				local _ = nil
				local var2429, var2430 = protoModule.readBuffer(p120, var2413)
				var2413 = var2430
				var2412.equip_if_purchased = propTypesModule.BoolProp.decode(var2429)
			elseif var2418 == 6 then
				local _ = nil
				local var2431, var2432 = protoModule.readBuffer(p120, var2413)
				var2413 = var2432
				var2412.name = propTypesModule.StringProp.decode(var2431)
			elseif var2418 == 7 then
				local _ = nil
				local var2433, var2434 = protoModule.readBuffer(p120, var2413)
				var2413 = var2434
				var2412.expected_price = propTypesModule.Int64Prop.decode(var2433)
			elseif var2418 == 8 then
				local _ = nil
				local var2435, var2436 = protoModule.readBuffer(p120, var2413)
				var2413 = var2436
				var2412.icon_image_asset_id = propTypesModule.Int64Prop.decode(var2435)
			elseif var2418 == 9 then
				local _ = nil
				local var2437, var2438 = protoModule.readBuffer(p120, var2413)
				var2413 = var2438
				var2412.is_subscription_in_robux = propTypesModule.BoolProp.decode(var2437)
			elseif var2418 == 10 then
				local _ = nil
				local var2439, var2440 = protoModule.readBuffer(p120, var2413)
				var2413 = var2440
				var2412.display_price = propTypesModule.StringProp.decode(var2439)
			else
				local _ = nil
				local var2441, var2442 = protoModule.readVarInt(p120, var2413)
				var2413 = var2442 + var2441
			end
		elseif var2414 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2443, var2444 = protoModule.readFixed32(p120, var2413)
			local _ = var2443
			var2413 = var2444
		elseif var2414 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2445, var2446 = protoModule.readFixed64(p120, var2413)
			local _ = var2445
			var2413 = var2446
		else
			error("Unsupported wire type: " .. var4019)
		end
	end
	return var2412
end

function t_120:jsonEncode()
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

function t_120:jsonDecode()
	-- upvalues: t_120 (ref), propTypesModule (ref)
	local var2447 = t_120.new()
	
	if self.kind ~= nil then
		var2447.kind = propTypesModule.StringProp.jsonDecode(self.kind)
	end
	if self.id ~= nil then
		var2447.id = propTypesModule.StringProp.jsonDecode(self.id)
	end
	if self.subscription_id ~= nil then
		var2447.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		var2447.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		var2447.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2447.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.equip_if_purchased ~= nil then
		var2447.equip_if_purchased = propTypesModule.BoolProp.jsonDecode(self.equip_if_purchased)
	end
	if self.equipIfPurchased ~= nil then
		var2447.equip_if_purchased = propTypesModule.BoolProp.jsonDecode(self.equipIfPurchased)
	end
	if self.name ~= nil then
		var2447.name = propTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.expected_price ~= nil then
		var2447.expected_price = propTypesModule.Int64Prop.jsonDecode(self.expected_price)
	end
	if self.expectedPrice ~= nil then
		var2447.expected_price = propTypesModule.Int64Prop.jsonDecode(self.expectedPrice)
	end
	if self.icon_image_asset_id ~= nil then
		var2447.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		var2447.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.is_subscription_in_robux ~= nil then
		var2447.is_subscription_in_robux = propTypesModule.BoolProp.jsonDecode(self.is_subscription_in_robux)
	end
	if self.isSubscriptionInRobux ~= nil then
		var2447.is_subscription_in_robux = propTypesModule.BoolProp.jsonDecode(self.isSubscriptionInRobux)
	end
	if self.display_price ~= nil then
		var2447.display_price = propTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		var2447.display_price = propTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	return var2447
end

t_120.descriptor = {
	name = "OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.ProductPayloadLiteral"
}
t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral = t_120
typeRegistryModule.default:register(t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral)
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
	local var2447 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2448 = self.kind.value:encode()
			local var2449, var2450 = protoModule.writeTag(buff, var2447, 1, protoModule.wireTypes.lengthDelimited)
			var2449, var4058 = protoModule.writeBuffer(var2449, var2450, var2448, buffer.len(var2448))
			buff = var2449
			var2447 = var2450
		elseif self.kind.type == "binding_path" then
			local var2451, var2452 = protoModule.writeTag(buff, var2447, 2, protoModule.wireTypes.lengthDelimited)
			var2451, var4060 = protoModule.writeString(var2451, var2452, self.kind.value)
			buff = var2451
			var2447 = var2452
		end
	end
	local buff_1 = buffer.create(var2447)
	buffer.copy(buff_1, 0, buff, 0, var2447)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var2447 = t_121.new()
	local var2448 = 0
	while var2448 < buffer.len(p121) do
		local _ = nil
		local var2449 = nil
		local var2450, var2451, var2452 = protoModule.readTag(p121, var2448)
		local var2453 = var2450
		var2449 = var2451
		var2448 = var2452
		
		if var2449 == protoModule.wireTypes.varint then
			local _ = nil
			local var2454, var2455 = protoModule.readVarInt(p121, var2448)
			local _ = var2454
			var2448 = var2455
			continue
		end
		if var2449 == protoModule.wireTypes.lengthDelimited then
			if var2453 == 1 then
				local _ = nil
				local var2456, var2457 = protoModule.readBuffer(p121, var2448)
				var2448 = var2457
				var2447.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.decode(var2456)
				}
			elseif var2453 == 2 then
				local _ = nil
				local var2458, var2459 = protoModule.readBuffer(p121, var2448)
				var2448 = var2459
				var2447.kind = { type = "binding_path", value = buffer.tostring(var2458) }
			else
				local _ = nil
				local var2460, var2461 = protoModule.readVarInt(p121, var2448)
				var2448 = var2461 + var2460
			end
		elseif var2449 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2462, var2463 = protoModule.readFixed32(p121, var2448)
			local _ = var2462
			var2448 = var2463
		elseif var2449 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2464, var2465 = protoModule.readFixed64(p121, var2448)
			local _ = var2464
			var2448 = var2465
		else
			error("Unsupported wire type: " .. var4064)
		end
	end
	return var2447
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
	local var2466 = t_121.new()
	
	if self.literal ~= nil then
		var2466.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2466.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2466.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2466
end

t_121.descriptor = {
	name = "OpenPurchasePromptAction_DisplayInfo",
	fullName = "roblox.apppageplatform.shared.v1beta1.DisplayInfo"
}
t.OpenPurchasePromptAction_DisplayInfo = t_121
typeRegistryModule.default:register(t.OpenPurchasePromptAction_DisplayInfo)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p122)
	-- upvalues: t_122 (ref)
	return setmetatable({
		product_name = if p122 == nil or p122.product_name == nil then nil else p122.product_name,
		description = if p122 == nil or p122.description == nil then nil else p122.description,
		image_url = if p122 == nil or p122.image_url == nil then nil else p122.image_url,
		price_in_robux = if p122 == nil or p122.price_in_robux == nil then nil else p122.price_in_robux,
		display_price = if p122 == nil or p122.display_price == nil then nil else p122.display_price,
		icon_image_asset_id = if p122 == nil or p122.icon_image_asset_id == nil then nil else p122.icon_image_asset_id,
		product_id = if p122 == nil or p122.product_id == nil then nil else p122.product_id,
		target_id = if p122 == nil or p122.target_id == nil then nil else p122.target_id,
		is_for_sale = if p122 == nil or p122.is_for_sale == nil then nil else p122.is_for_sale,
		product_type = if p122 == nil or p122.product_type == nil then nil else p122.product_type,
		base_price_in_robux = if p122 == nil or p122.base_price_in_robux == nil then nil else p122.base_price_in_robux,
		price_discount_details = if p122 == nil or p122.price_discount_details == nil then nil else p122.price_discount_details
	}, t_122)
end

function t_122:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2466 = 0
	
	if self.product_name ~= nil then
		local var2467 = self.product_name:encode()
		local var2468, var2469 = protoModule.writeTag(buff, var2466, 1, protoModule.wireTypes.lengthDelimited)
		var2468, var4087 = protoModule.writeBuffer(var2468, var2469, var2467, buffer.len(var2467))
		buff = var2468
		var2466 = var2469
	end
	if self.description ~= nil then
		local var2470 = self.description:encode()
		local var2471, var2472 = protoModule.writeTag(buff, var2466, 2, protoModule.wireTypes.lengthDelimited)
		var2471, var4090 = protoModule.writeBuffer(var2471, var2472, var2470, buffer.len(var2470))
		buff = var2471
		var2466 = var2472
	end
	if self.image_url ~= nil then
		local var2473 = self.image_url:encode()
		local var2474, var2475 = protoModule.writeTag(buff, var2466, 3, protoModule.wireTypes.lengthDelimited)
		var2474, var4093 = protoModule.writeBuffer(var2474, var2475, var2473, buffer.len(var2473))
		buff = var2474
		var2466 = var2475
	end
	if self.price_in_robux ~= nil then
		local var2476 = self.price_in_robux:encode()
		local var2477, var2478 = protoModule.writeTag(buff, var2466, 4, protoModule.wireTypes.lengthDelimited)
		var2477, var4096 = protoModule.writeBuffer(var2477, var2478, var2476, buffer.len(var2476))
		buff = var2477
		var2466 = var2478
	end
	if self.display_price ~= nil then
		local var2479 = self.display_price:encode()
		local var2480, var2481 = protoModule.writeTag(buff, var2466, 5, protoModule.wireTypes.lengthDelimited)
		var2480, var4099 = protoModule.writeBuffer(var2480, var2481, var2479, buffer.len(var2479))
		buff = var2480
		var2466 = var2481
	end
	if self.icon_image_asset_id ~= nil then
		local var2482 = self.icon_image_asset_id:encode()
		local var2483, var2484 = protoModule.writeTag(buff, var2466, 6, protoModule.wireTypes.lengthDelimited)
		var2483, var4102 = protoModule.writeBuffer(var2483, var2484, var2482, buffer.len(var2482))
		buff = var2483
		var2466 = var2484
	end
	if self.product_id ~= nil then
		local var2485 = self.product_id:encode()
		local var2486, var2487 = protoModule.writeTag(buff, var2466, 7, protoModule.wireTypes.lengthDelimited)
		var2486, var4105 = protoModule.writeBuffer(var2486, var2487, var2485, buffer.len(var2485))
		buff = var2486
		var2466 = var2487
	end
	if self.target_id ~= nil then
		local var2488 = self.target_id:encode()
		local var2489, var2490 = protoModule.writeTag(buff, var2466, 8, protoModule.wireTypes.lengthDelimited)
		var2489, var4108 = protoModule.writeBuffer(var2489, var2490, var2488, buffer.len(var2488))
		buff = var2489
		var2466 = var2490
	end
	if self.is_for_sale ~= nil then
		local var2491 = self.is_for_sale:encode()
		local var2492, var2493 = protoModule.writeTag(buff, var2466, 9, protoModule.wireTypes.lengthDelimited)
		var2492, var4111 = protoModule.writeBuffer(var2492, var2493, var2491, buffer.len(var2491))
		buff = var2492
		var2466 = var2493
	end
	if self.product_type ~= nil then
		local var2494 = self.product_type:encode()
		local var2495, var2496 = protoModule.writeTag(buff, var2466, 10, protoModule.wireTypes.lengthDelimited)
		var2495, var4114 = protoModule.writeBuffer(var2495, var2496, var2494, buffer.len(var2494))
		buff = var2495
		var2466 = var2496
	end
	if self.base_price_in_robux ~= nil then
		local var2497 = self.base_price_in_robux:encode()
		local var2498, var2499 = protoModule.writeTag(buff, var2466, 11, protoModule.wireTypes.lengthDelimited)
		var2498, var4117 = protoModule.writeBuffer(var2498, var2499, var2497, buffer.len(var2497))
		buff = var2498
		var2466 = var2499
	end
	if self.price_discount_details ~= nil then
		local var2500 = self.price_discount_details:encode()
		local var2501, var2502 = protoModule.writeTag(buff, var2466, 12, protoModule.wireTypes.lengthDelimited)
		var2501, var4120 = protoModule.writeBuffer(var2501, var2502, var2500, buffer.len(var2500))
		buff = var2501
		var2466 = var2502
	end
	local buff_1 = buffer.create(var2466)
	buffer.copy(buff_1, 0, buff, 0, var2466)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref), propTypesModule (ref)
	local var2466 = t_122.new()
	local var2467 = 0
	while var2467 < buffer.len(p122) do
		local _ = nil
		local var2468 = nil
		local var2469, var2470, var2471 = protoModule.readTag(p122, var2467)
		local var2472 = var2469
		var2468 = var2470
		var2467 = var2471
		
		if var2468 == protoModule.wireTypes.varint then
			local _ = nil
			local var2473, var2474 = protoModule.readVarInt(p122, var2467)
			local _ = var2473
			var2467 = var2474
			continue
		end
		if var2468 == protoModule.wireTypes.lengthDelimited then
			if var2472 == 1 then
				local _ = nil
				local var2475, var2476 = protoModule.readBuffer(p122, var2467)
				var2467 = var2476
				var2466.product_name = propTypesModule.StringProp.decode(var2475)
			elseif var2472 == 2 then
				local _ = nil
				local var2477, var2478 = protoModule.readBuffer(p122, var2467)
				var2467 = var2478
				var2466.description = propTypesModule.StringProp.decode(var2477)
			elseif var2472 == 3 then
				local _ = nil
				local var2479, var2480 = protoModule.readBuffer(p122, var2467)
				var2467 = var2480
				var2466.image_url = propTypesModule.StringProp.decode(var2479)
			elseif var2472 == 4 then
				local _ = nil
				local var2481, var2482 = protoModule.readBuffer(p122, var2467)
				var2467 = var2482
				var2466.price_in_robux = propTypesModule.Int64Prop.decode(var2481)
			elseif var2472 == 5 then
				local _ = nil
				local var2483, var2484 = protoModule.readBuffer(p122, var2467)
				var2467 = var2484
				var2466.display_price = propTypesModule.StringProp.decode(var2483)
			elseif var2472 == 6 then
				local _ = nil
				local var2485, var2486 = protoModule.readBuffer(p122, var2467)
				var2467 = var2486
				var2466.icon_image_asset_id = propTypesModule.Int64Prop.decode(var2485)
			elseif var2472 == 7 then
				local _ = nil
				local var2487, var2488 = protoModule.readBuffer(p122, var2467)
				var2467 = var2488
				var2466.product_id = propTypesModule.Int64Prop.decode(var2487)
			elseif var2472 == 8 then
				local _ = nil
				local var2489, var2490 = protoModule.readBuffer(p122, var2467)
				var2467 = var2490
				var2466.target_id = propTypesModule.StringProp.decode(var2489)
			elseif var2472 == 9 then
				local _ = nil
				local var2491, var2492 = protoModule.readBuffer(p122, var2467)
				var2467 = var2492
				var2466.is_for_sale = propTypesModule.BoolProp.decode(var2491)
			elseif var2472 == 10 then
				local _ = nil
				local var2493, var2494 = protoModule.readBuffer(p122, var2467)
				var2467 = var2494
				var2466.product_type = propTypesModule.StringProp.decode(var2493)
			elseif var2472 == 11 then
				local _ = nil
				local var2495, var2496 = protoModule.readBuffer(p122, var2467)
				var2467 = var2496
				var2466.base_price_in_robux = propTypesModule.Int64Prop.decode(var2495)
			elseif var2472 == 12 then
				local _ = nil
				local var2497, var2498 = protoModule.readBuffer(p122, var2467)
				var2467 = var2498
				var2466.price_discount_details = propTypesModule.ArrayOfStructProp.decode(var2497)
			else
				local _ = nil
				local var2499, var2500 = protoModule.readVarInt(p122, var2467)
				var2467 = var2500 + var2499
			end
		elseif var2468 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2501, var2502 = protoModule.readFixed32(p122, var2467)
			local _ = var2501
			var2467 = var2502
		elseif var2468 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2503, var2504 = protoModule.readFixed64(p122, var2467)
			local _ = var2503
			var2467 = var2504
		else
			error("Unsupported wire type: " .. var4124)
		end
	end
	return var2466
end

function t_122:jsonEncode()
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

function t_122:jsonDecode()
	-- upvalues: t_122 (ref), propTypesModule (ref)
	local var2505 = t_122.new()
	
	if self.product_name ~= nil then
		var2505.product_name = propTypesModule.StringProp.jsonDecode(self.product_name)
	end
	if self.productName ~= nil then
		var2505.product_name = propTypesModule.StringProp.jsonDecode(self.productName)
	end
	if self.description ~= nil then
		var2505.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_url ~= nil then
		var2505.image_url = propTypesModule.StringProp.jsonDecode(self.image_url)
	end
	if self.imageUrl ~= nil then
		var2505.image_url = propTypesModule.StringProp.jsonDecode(self.imageUrl)
	end
	if self.price_in_robux ~= nil then
		var2505.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		var2505.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.display_price ~= nil then
		var2505.display_price = propTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		var2505.display_price = propTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	if self.icon_image_asset_id ~= nil then
		var2505.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		var2505.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.product_id ~= nil then
		var2505.product_id = propTypesModule.Int64Prop.jsonDecode(self.product_id)
	end
	if self.productId ~= nil then
		var2505.product_id = propTypesModule.Int64Prop.jsonDecode(self.productId)
	end
	if self.target_id ~= nil then
		var2505.target_id = propTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		var2505.target_id = propTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.is_for_sale ~= nil then
		var2505.is_for_sale = propTypesModule.BoolProp.jsonDecode(self.is_for_sale)
	end
	if self.isForSale ~= nil then
		var2505.is_for_sale = propTypesModule.BoolProp.jsonDecode(self.isForSale)
	end
	if self.product_type ~= nil then
		var2505.product_type = propTypesModule.StringProp.jsonDecode(self.product_type)
	end
	if self.productType ~= nil then
		var2505.product_type = propTypesModule.StringProp.jsonDecode(self.productType)
	end
	if self.base_price_in_robux ~= nil then
		var2505.base_price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.base_price_in_robux)
	end
	if self.basePriceInRobux ~= nil then
		var2505.base_price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.basePriceInRobux)
	end
	if self.price_discount_details ~= nil then
		var2505.price_discount_details = propTypesModule.ArrayOfStructProp.jsonDecode(self.price_discount_details)
	end
	if self.priceDiscountDetails ~= nil then
		var2505.price_discount_details = propTypesModule.ArrayOfStructProp.jsonDecode(self.priceDiscountDetails)
	end
	return var2505
end

t_122.descriptor = {
	name = "OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.DisplayInfoLiteral"
}
t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral = t_122
typeRegistryModule.default:register(t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral)
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
	local var2505 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2506 = self.kind.value:encode()
			local var2507, var2508 = protoModule.writeTag(buff, var2505, 1, protoModule.wireTypes.lengthDelimited)
			var2507, var4167 = protoModule.writeBuffer(var2507, var2508, var2506, buffer.len(var2506))
			buff = var2507
			var2505 = var2508
		elseif self.kind.type == "binding_path" then
			local var2509, var2510 = protoModule.writeTag(buff, var2505, 2, protoModule.wireTypes.lengthDelimited)
			var2509, var4169 = protoModule.writeString(var2509, var2510, self.kind.value)
			buff = var2509
			var2505 = var2510
		end
	end
	local buff_1 = buffer.create(var2505)
	buffer.copy(buff_1, 0, buff, 0, var2505)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref), t (ref)
	local var2505 = t_123.new()
	local var2506 = 0
	while var2506 < buffer.len(p123) do
		local _ = nil
		local var2507 = nil
		local var2508, var2509, var2510 = protoModule.readTag(p123, var2506)
		local var2511 = var2508
		var2507 = var2509
		var2506 = var2510
		
		if var2507 == protoModule.wireTypes.varint then
			local _ = nil
			local var2512, var2513 = protoModule.readVarInt(p123, var2506)
			local _ = var2512
			var2506 = var2513
			continue
		end
		if var2507 == protoModule.wireTypes.lengthDelimited then
			if var2511 == 1 then
				local _ = nil
				local var2514, var2515 = protoModule.readBuffer(p123, var2506)
				var2506 = var2515
				var2505.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.decode(var2514)
				}
			elseif var2511 == 2 then
				local _ = nil
				local var2516, var2517 = protoModule.readBuffer(p123, var2506)
				var2506 = var2517
				var2505.kind = { type = "binding_path", value = buffer.tostring(var2516) }
			else
				local _ = nil
				local var2518, var2519 = protoModule.readVarInt(p123, var2506)
				var2506 = var2519 + var2518
			end
		elseif var2507 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2520, var2521 = protoModule.readFixed32(p123, var2506)
			local _ = var2520
			var2506 = var2521
		elseif var2507 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2522, var2523 = protoModule.readFixed64(p123, var2506)
			local _ = var2522
			var2506 = var2523
		else
			error("Unsupported wire type: " .. var4173)
		end
	end
	return var2505
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
	local var2524 = t_123.new()
	
	if self.literal ~= nil then
		var2524.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2524.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2524.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2524
end

t_123.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseOptions"
}
t.OpenPurchasePromptAction_PurchaseOptions = t_123
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseOptions)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p124)
	-- upvalues: t_124 (ref)
	return setmetatable({
		should_skip_ownership_check = if p124 == nil or p124.should_skip_ownership_check == nil then nil else p124.should_skip_ownership_check,
		enable_preloaded_purchase_ui = if p124 == nil or p124.enable_preloaded_purchase_ui == nil then nil else p124.enable_preloaded_purchase_ui,
		completion_message = if p124 == nil or p124.completion_message == nil then nil else p124.completion_message,
		completion_button_text = if p124 == nil or p124.completion_button_text == nil then nil else p124.completion_button_text,
		prevent_double_confirm = if p124 == nil or p124.prevent_double_confirm == nil then nil else p124.prevent_double_confirm,
		provided_robux_balance = if p124 == nil or p124.provided_robux_balance == nil then nil else p124.provided_robux_balance,
		launch_after_purchase_root_place_id = if p124 == nil or p124.launch_after_purchase_root_place_id == nil then nil else p124.launch_after_purchase_root_place_id
	}, t_124)
end

function t_124:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2524 = 0
	
	if self.should_skip_ownership_check ~= nil then
		local var2525 = self.should_skip_ownership_check:encode()
		local var2526, var2527 = protoModule.writeTag(buff, var2524, 1, protoModule.wireTypes.lengthDelimited)
		var2526, var4196 = protoModule.writeBuffer(var2526, var2527, var2525, buffer.len(var2525))
		buff = var2526
		var2524 = var2527
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		local var2528 = self.enable_preloaded_purchase_ui:encode()
		local var2529, var2530 = protoModule.writeTag(buff, var2524, 2, protoModule.wireTypes.lengthDelimited)
		var2529, var4199 = protoModule.writeBuffer(var2529, var2530, var2528, buffer.len(var2528))
		buff = var2529
		var2524 = var2530
	end
	if self.completion_message ~= nil then
		local var2531 = self.completion_message:encode()
		local var2532, var2533 = protoModule.writeTag(buff, var2524, 3, protoModule.wireTypes.lengthDelimited)
		var2532, var4202 = protoModule.writeBuffer(var2532, var2533, var2531, buffer.len(var2531))
		buff = var2532
		var2524 = var2533
	end
	if self.completion_button_text ~= nil then
		local var2534 = self.completion_button_text:encode()
		local var2535, var2536 = protoModule.writeTag(buff, var2524, 4, protoModule.wireTypes.lengthDelimited)
		var2535, var4205 = protoModule.writeBuffer(var2535, var2536, var2534, buffer.len(var2534))
		buff = var2535
		var2524 = var2536
	end
	if self.prevent_double_confirm ~= nil then
		local var2537 = self.prevent_double_confirm:encode()
		local var2538, var2539 = protoModule.writeTag(buff, var2524, 5, protoModule.wireTypes.lengthDelimited)
		var2538, var4208 = protoModule.writeBuffer(var2538, var2539, var2537, buffer.len(var2537))
		buff = var2538
		var2524 = var2539
	end
	if self.provided_robux_balance ~= nil then
		local var2540 = self.provided_robux_balance:encode()
		local var2541, var2542 = protoModule.writeTag(buff, var2524, 6, protoModule.wireTypes.lengthDelimited)
		var2541, var4211 = protoModule.writeBuffer(var2541, var2542, var2540, buffer.len(var2540))
		buff = var2541
		var2524 = var2542
	end
	if self.launch_after_purchase_root_place_id ~= nil then
		local var2543 = self.launch_after_purchase_root_place_id:encode()
		local var2544, var2545 = protoModule.writeTag(buff, var2524, 7, protoModule.wireTypes.lengthDelimited)
		var2544, var4214 = protoModule.writeBuffer(var2544, var2545, var2543, buffer.len(var2543))
		buff = var2544
		var2524 = var2545
	end
	local buff_1 = buffer.create(var2524)
	buffer.copy(buff_1, 0, buff, 0, var2524)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref), propTypesModule (ref)
	local var2524 = t_124.new()
	local var2525 = 0
	while var2525 < buffer.len(p124) do
		local _ = nil
		local var2526 = nil
		local var2527, var2528, var2529 = protoModule.readTag(p124, var2525)
		local var2530 = var2527
		var2526 = var2528
		var2525 = var2529
		
		if var2526 == protoModule.wireTypes.varint then
			local _ = nil
			local var2531, var2532 = protoModule.readVarInt(p124, var2525)
			local _ = var2531
			var2525 = var2532
			continue
		end
		if var2526 == protoModule.wireTypes.lengthDelimited then
			if var2530 == 1 then
				local _ = nil
				local var2533, var2534 = protoModule.readBuffer(p124, var2525)
				var2525 = var2534
				var2524.should_skip_ownership_check = propTypesModule.BoolProp.decode(var2533)
			elseif var2530 == 2 then
				local _ = nil
				local var2535, var2536 = protoModule.readBuffer(p124, var2525)
				var2525 = var2536
				var2524.enable_preloaded_purchase_ui = propTypesModule.BoolProp.decode(var2535)
			elseif var2530 == 3 then
				local _ = nil
				local var2537, var2538 = protoModule.readBuffer(p124, var2525)
				var2525 = var2538
				var2524.completion_message = propTypesModule.StringProp.decode(var2537)
			elseif var2530 == 4 then
				local _ = nil
				local var2539, var2540 = protoModule.readBuffer(p124, var2525)
				var2525 = var2540
				var2524.completion_button_text = propTypesModule.StringProp.decode(var2539)
			elseif var2530 == 5 then
				local _ = nil
				local var2541, var2542 = protoModule.readBuffer(p124, var2525)
				var2525 = var2542
				var2524.prevent_double_confirm = propTypesModule.BoolProp.decode(var2541)
			elseif var2530 == 6 then
				local _ = nil
				local var2543, var2544 = protoModule.readBuffer(p124, var2525)
				var2525 = var2544
				var2524.provided_robux_balance = propTypesModule.Int64Prop.decode(var2543)
			elseif var2530 == 7 then
				local _ = nil
				local var2545, var2546 = protoModule.readBuffer(p124, var2525)
				var2525 = var2546
				var2524.launch_after_purchase_root_place_id = propTypesModule.StringProp.decode(var2545)
			else
				local _ = nil
				local var2547, var2548 = protoModule.readVarInt(p124, var2525)
				var2525 = var2548 + var2547
			end
		elseif var2526 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2549, var2550 = protoModule.readFixed32(p124, var2525)
			local _ = var2549
			var2525 = var2550
		elseif var2526 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2551, var2552 = protoModule.readFixed64(p124, var2525)
			local _ = var2551
			var2525 = var2552
		else
			error("Unsupported wire type: " .. var4218)
		end
	end
	return var2524
end

function t_124:jsonEncode()
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

function t_124:jsonDecode()
	-- upvalues: t_124 (ref), propTypesModule (ref)
	local var2553 = t_124.new()
	
	if self.should_skip_ownership_check ~= nil then
		var2553.should_skip_ownership_check = propTypesModule.BoolProp.jsonDecode(self.should_skip_ownership_check)
	end
	if self.shouldSkipOwnershipCheck ~= nil then
		var2553.should_skip_ownership_check = propTypesModule.BoolProp.jsonDecode(self.shouldSkipOwnershipCheck)
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		var2553.enable_preloaded_purchase_ui = propTypesModule.BoolProp.jsonDecode(self.enable_preloaded_purchase_ui)
	end
	if self.enablePreloadedPurchaseUi ~= nil then
		var2553.enable_preloaded_purchase_ui = propTypesModule.BoolProp.jsonDecode(self.enablePreloadedPurchaseUi)
	end
	if self.completion_message ~= nil then
		var2553.completion_message = propTypesModule.StringProp.jsonDecode(self.completion_message)
	end
	if self.completionMessage ~= nil then
		var2553.completion_message = propTypesModule.StringProp.jsonDecode(self.completionMessage)
	end
	if self.completion_button_text ~= nil then
		var2553.completion_button_text = propTypesModule.StringProp.jsonDecode(self.completion_button_text)
	end
	if self.completionButtonText ~= nil then
		var2553.completion_button_text = propTypesModule.StringProp.jsonDecode(self.completionButtonText)
	end
	if self.prevent_double_confirm ~= nil then
		var2553.prevent_double_confirm = propTypesModule.BoolProp.jsonDecode(self.prevent_double_confirm)
	end
	if self.preventDoubleConfirm ~= nil then
		var2553.prevent_double_confirm = propTypesModule.BoolProp.jsonDecode(self.preventDoubleConfirm)
	end
	if self.provided_robux_balance ~= nil then
		var2553.provided_robux_balance = propTypesModule.Int64Prop.jsonDecode(self.provided_robux_balance)
	end
	if self.providedRobuxBalance ~= nil then
		var2553.provided_robux_balance = propTypesModule.Int64Prop.jsonDecode(self.providedRobuxBalance)
	end
	if self.launch_after_purchase_root_place_id ~= nil then
		var2553.launch_after_purchase_root_place_id = propTypesModule.StringProp.jsonDecode(self.launch_after_purchase_root_place_id)
	end
	if self.launchAfterPurchaseRootPlaceId ~= nil then
		var2553.launch_after_purchase_root_place_id = propTypesModule.StringProp.jsonDecode(self.launchAfterPurchaseRootPlaceId)
	end
	return var2553
end

t_124.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseOptionsLiteral"
}
t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral = t_124
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p125)
	-- upvalues: t_125 (ref)
	return setmetatable({
		kind = if p125 == nil or p125.kind == nil then nil else p125.kind
	}, t_125)
end

function t_125:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2553 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2554 = self.kind.value:encode()
			local var2555, var2556 = protoModule.writeTag(buff, var2553, 1, protoModule.wireTypes.lengthDelimited)
			var2555, var4251 = protoModule.writeBuffer(var2555, var2556, var2554, buffer.len(var2554))
			buff = var2555
			var2553 = var2556
		elseif self.kind.type == "binding_path" then
			local var2557, var2558 = protoModule.writeTag(buff, var2553, 2, protoModule.wireTypes.lengthDelimited)
			var2557, var4253 = protoModule.writeString(var2557, var2558, self.kind.value)
			buff = var2557
			var2553 = var2558
		end
	end
	local buff_1 = buffer.create(var2553)
	buffer.copy(buff_1, 0, buff, 0, var2553)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref)
	local var2553 = t_125.new()
	local var2554 = 0
	while var2554 < buffer.len(p125) do
		local _ = nil
		local var2555 = nil
		local var2556, var2557, var2558 = protoModule.readTag(p125, var2554)
		local var2559 = var2556
		var2555 = var2557
		var2554 = var2558
		
		if var2555 == protoModule.wireTypes.varint then
			local _ = nil
			local var2560, var2561 = protoModule.readVarInt(p125, var2554)
			local _ = var2560
			var2554 = var2561
			continue
		end
		if var2555 == protoModule.wireTypes.lengthDelimited then
			if var2559 == 1 then
				local _ = nil
				local var2562, var2563 = protoModule.readBuffer(p125, var2554)
				var2554 = var2563
				var2553.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.decode(var2562)
				}
			elseif var2559 == 2 then
				local _ = nil
				local var2564, var2565 = protoModule.readBuffer(p125, var2554)
				var2554 = var2565
				var2553.kind = { type = "binding_path", value = buffer.tostring(var2564) }
			else
				local _ = nil
				local var2566, var2567 = protoModule.readVarInt(p125, var2554)
				var2554 = var2567 + var2566
			end
		elseif var2555 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2568, var2569 = protoModule.readFixed32(p125, var2554)
			local _ = var2568
			var2554 = var2569
		elseif var2555 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2570, var2571 = protoModule.readFixed64(p125, var2554)
			local _ = var2570
			var2554 = var2571
		else
			error("Unsupported wire type: " .. var4257)
		end
	end
	return var2553
end

function t_125:jsonEncode()
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

function t_125:jsonDecode()
	-- upvalues: t_125 (ref), t (ref)
	local var2572 = t_125.new()
	
	if self.literal ~= nil then
		var2572.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2572.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2572.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2572
end

t_125.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseAnalyticsMetadata",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseAnalyticsMetadata"
}
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata = t_125
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p126)
	-- upvalues: t_126 (ref)
	return setmetatable({
		surface = if p126 == nil or p126.surface == nil then nil else p126.surface,
		product_universe_id = if p126 == nil or p126.product_universe_id == nil then nil else p126.product_universe_id
	}, t_126)
end

function t_126:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2572 = 0
	
	if self.surface ~= nil then
		local var2573 = self.surface:encode()
		local var2574, var2575 = protoModule.writeTag(buff, var2572, 1, protoModule.wireTypes.lengthDelimited)
		var2574, var4280 = protoModule.writeBuffer(var2574, var2575, var2573, buffer.len(var2573))
		buff = var2574
		var2572 = var2575
	end
	if self.product_universe_id ~= nil then
		local var2576 = self.product_universe_id:encode()
		local var2577, var2578 = protoModule.writeTag(buff, var2572, 2, protoModule.wireTypes.lengthDelimited)
		var2577, var4283 = protoModule.writeBuffer(var2577, var2578, var2576, buffer.len(var2576))
		buff = var2577
		var2572 = var2578
	end
	local buff_1 = buffer.create(var2572)
	buffer.copy(buff_1, 0, buff, 0, var2572)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref), propTypesModule (ref)
	local var2572 = t_126.new()
	local var2573 = 0
	while var2573 < buffer.len(p126) do
		local _ = nil
		local var2574 = nil
		local var2575, var2576, var2577 = protoModule.readTag(p126, var2573)
		local var2578 = var2575
		var2574 = var2576
		var2573 = var2577
		
		if var2574 == protoModule.wireTypes.varint then
			local _ = nil
			local var2579, var2580 = protoModule.readVarInt(p126, var2573)
			local _ = var2579
			var2573 = var2580
			continue
		end
		if var2574 == protoModule.wireTypes.lengthDelimited then
			if var2578 == 1 then
				local _ = nil
				local var2581, var2582 = protoModule.readBuffer(p126, var2573)
				var2573 = var2582
				var2572.surface = propTypesModule.StringProp.decode(var2581)
			elseif var2578 == 2 then
				local _ = nil
				local var2583, var2584 = protoModule.readBuffer(p126, var2573)
				var2573 = var2584
				var2572.product_universe_id = propTypesModule.StringProp.decode(var2583)
			else
				local _ = nil
				local var2585, var2586 = protoModule.readVarInt(p126, var2573)
				var2573 = var2586 + var2585
			end
		elseif var2574 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2587, var2588 = protoModule.readFixed32(p126, var2573)
			local _ = var2587
			var2573 = var2588
		elseif var2574 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2589, var2590 = protoModule.readFixed64(p126, var2573)
			local _ = var2589
			var2573 = var2590
		else
			error("Unsupported wire type: " .. var4287)
		end
	end
	return var2572
end

function t_126:jsonEncode()
	local t = {}
	
	if self.surface ~= nil then
		t.surface = self.surface:jsonEncode()
	end
	if self.product_universe_id ~= nil then
		t.productUniverseId = self.product_universe_id:jsonEncode()
	end
	return t
end

function t_126:jsonDecode()
	-- upvalues: t_126 (ref), propTypesModule (ref)
	local var2591 = t_126.new()
	
	if self.surface ~= nil then
		var2591.surface = propTypesModule.StringProp.jsonDecode(self.surface)
	end
	if self.product_universe_id ~= nil then
		var2591.product_universe_id = propTypesModule.StringProp.jsonDecode(self.product_universe_id)
	end
	if self.productUniverseId ~= nil then
		var2591.product_universe_id = propTypesModule.StringProp.jsonDecode(self.productUniverseId)
	end
	return var2591
end

t_126.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseAnalyticsMetadataLiteral"
}
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral = t_126
typeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral)
local t_127 = {}
t_127.__index = t_127

function t_127.new(p127)
	-- upvalues: t_127 (ref)
	return setmetatable({
		product_payload = if p127 == nil or p127.product_payload == nil then nil else p127.product_payload,
		display_info = if p127 == nil or p127.display_info == nil then nil else p127.display_info,
		purchase_options = if p127 == nil or p127.purchase_options == nil then nil else p127.purchase_options,
		purchase_analytics_metadata = if p127 == nil or p127.purchase_analytics_metadata == nil then nil else p127.purchase_analytics_metadata,
		root_place_id = if p127 == nil or p127.root_place_id == nil then nil else p127.root_place_id
	}, t_127)
end

function t_127:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2591 = 0
	
	if self.product_payload ~= nil then
		local var2592 = self.product_payload:encode()
		local var2593, var2594 = protoModule.writeTag(buff, var2591, 1, protoModule.wireTypes.lengthDelimited)
		var2593, var4310 = protoModule.writeBuffer(var2593, var2594, var2592, buffer.len(var2592))
		buff = var2593
		var2591 = var2594
	end
	if self.display_info ~= nil then
		local var2595 = self.display_info:encode()
		local var2596, var2597 = protoModule.writeTag(buff, var2591, 2, protoModule.wireTypes.lengthDelimited)
		var2596, var4313 = protoModule.writeBuffer(var2596, var2597, var2595, buffer.len(var2595))
		buff = var2596
		var2591 = var2597
	end
	if self.purchase_options ~= nil then
		local var2598 = self.purchase_options:encode()
		local var2599, var2600 = protoModule.writeTag(buff, var2591, 3, protoModule.wireTypes.lengthDelimited)
		var2599, var4316 = protoModule.writeBuffer(var2599, var2600, var2598, buffer.len(var2598))
		buff = var2599
		var2591 = var2600
	end
	if self.purchase_analytics_metadata ~= nil then
		local var2601 = self.purchase_analytics_metadata:encode()
		local var2602, var2603 = protoModule.writeTag(buff, var2591, 4, protoModule.wireTypes.lengthDelimited)
		var2602, var4319 = protoModule.writeBuffer(var2602, var2603, var2601, buffer.len(var2601))
		buff = var2602
		var2591 = var2603
	end
	if self.root_place_id ~= nil then
		local var2604 = self.root_place_id:encode()
		local var2605, var2606 = protoModule.writeTag(buff, var2591, 5, protoModule.wireTypes.lengthDelimited)
		var2605, var4322 = protoModule.writeBuffer(var2605, var2606, var2604, buffer.len(var2604))
		buff = var2605
		var2591 = var2606
	end
	local buff_1 = buffer.create(var2591)
	buffer.copy(buff_1, 0, buff, 0, var2591)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref), t (ref), propTypesModule (ref)
	local var2591 = t_127.new()
	local var2592 = 0
	while var2592 < buffer.len(p127) do
		local _ = nil
		local var2593 = nil
		local var2594, var2595, var2596 = protoModule.readTag(p127, var2592)
		local var2597 = var2594
		var2593 = var2595
		var2592 = var2596
		
		if var2593 == protoModule.wireTypes.varint then
			local _ = nil
			local var2598, var2599 = protoModule.readVarInt(p127, var2592)
			local _ = var2598
			var2592 = var2599
			continue
		end
		if var2593 == protoModule.wireTypes.lengthDelimited then
			if var2597 == 1 then
				local _ = nil
				local var2600, var2601 = protoModule.readBuffer(p127, var2592)
				var2592 = var2601
				var2591.product_payload = t.OpenPurchasePromptAction_ProductPayload.decode(var2600)
			elseif var2597 == 2 then
				local _ = nil
				local var2602, var2603 = protoModule.readBuffer(p127, var2592)
				var2592 = var2603
				var2591.display_info = t.OpenPurchasePromptAction_DisplayInfo.decode(var2602)
			elseif var2597 == 3 then
				local _ = nil
				local var2604, var2605 = protoModule.readBuffer(p127, var2592)
				var2592 = var2605
				var2591.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.decode(var2604)
			elseif var2597 == 4 then
				local _ = nil
				local var2606, var2607 = protoModule.readBuffer(p127, var2592)
				var2592 = var2607
				var2591.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.decode(var2606)
			elseif var2597 == 5 then
				local _ = nil
				local var2608, var2609 = protoModule.readBuffer(p127, var2592)
				var2592 = var2609
				var2591.root_place_id = propTypesModule.StringProp.decode(var2608)
			else
				local _ = nil
				local var2610, var2611 = protoModule.readVarInt(p127, var2592)
				var2592 = var2611 + var2610
			end
		elseif var2593 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2612, var2613 = protoModule.readFixed32(p127, var2592)
			local _ = var2612
			var2592 = var2613
		elseif var2593 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2614, var2615 = protoModule.readFixed64(p127, var2592)
			local _ = var2614
			var2592 = var2615
		else
			error("Unsupported wire type: " .. var4326)
		end
	end
	return var2591
end

function t_127:jsonEncode()
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

function t_127:jsonDecode()
	-- upvalues: t_127 (ref), t (ref), propTypesModule (ref)
	local var2616 = t_127.new()
	
	if self.product_payload ~= nil then
		var2616.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.product_payload)
	end
	if self.productPayload ~= nil then
		var2616.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.productPayload)
	end
	if self.display_info ~= nil then
		var2616.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.display_info)
	end
	if self.displayInfo ~= nil then
		var2616.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.displayInfo)
	end
	if self.purchase_options ~= nil then
		var2616.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchase_options)
	end
	if self.purchaseOptions ~= nil then
		var2616.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchaseOptions)
	end
	if self.purchase_analytics_metadata ~= nil then
		var2616.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchase_analytics_metadata)
	end
	if self.purchaseAnalyticsMetadata ~= nil then
		var2616.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchaseAnalyticsMetadata)
	end
	if self.root_place_id ~= nil then
		var2616.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var2616.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var2616
end

t_127.descriptor = {
	name = "OpenPurchasePromptAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenPurchasePromptAction_Params = t_127
typeRegistryModule.default:register(t.OpenPurchasePromptAction_Params)
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
	local var2616 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2617, var2618 = protoModule.writeTag(buff, var2616, 1, protoModule.wireTypes.varint)
		var2617, var4354 = protoModule.writeVarInt(var2617, var2618, t.ActionType.toNumber(self.action_type))
		buff = var2617
		var2616 = var2618
	end
	if self.action_params ~= nil then
		local var2619 = self.action_params:encode()
		local var2620, var2621 = protoModule.writeTag(buff, var2616, 2, protoModule.wireTypes.lengthDelimited)
		var2620, var4357 = protoModule.writeBuffer(var2620, var2621, var2619, buffer.len(var2619))
		buff = var2620
		var2616 = var2621
	end
	local buff_1 = buffer.create(var2616)
	buffer.copy(buff_1, 0, buff, 0, var2616)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var2616 = t_128.new()
	local var2617 = 0
	while var2617 < buffer.len(p128) do
		local _ = nil
		local var2618 = nil
		local var2619, var2620, var2621 = protoModule.readTag(p128, var2617)
		local var2622 = var2619
		var2618 = var2620
		var2617 = var2621
		
		if var2618 == protoModule.wireTypes.varint then
			if var2622 == 1 then
				local _ = nil
				local var2623, var2624 = protoModule.readVarIntI32(p128, var2617)
				local var2625 = var2623
				var2617 = var2624
				var2616.action_type = t.ActionType.fromNumber(var2625) or var2625
			else
				local _ = nil
				local var2626, var2627 = protoModule.readVarInt(p128, var2617)
				local _ = var2626
				var2617 = var2627
			end
		end
		if var2618 == protoModule.wireTypes.lengthDelimited then
			if var2622 == 2 then
				local _ = nil
				local var2628, var2629 = protoModule.readBuffer(p128, var2617)
				var2617 = var2629
				var2616.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.decode(var2628)
			else
				local _ = nil
				local var2630, var2631 = protoModule.readVarInt(p128, var2617)
				var2617 = var2631 + var2630
			end
		elseif var2618 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2632, var2633 = protoModule.readFixed32(p128, var2617)
			local _ = var2632
			var2617 = var2633
		elseif var2618 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2634, var2635 = protoModule.readFixed64(p128, var2617)
			local _ = var2634
			var2617 = var2635
		else
			error("Unsupported wire type: " .. var4361)
		end
	end
	return var2616
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
	local var2636 = t_128.new()
	
	if self.action_type ~= nil then
		var2636.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2636.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2636.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2636.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.actionParams)
	end
	return var2636
end

t_128.descriptor = {
	name = "ReportSurfaceLoadTimeMilestoneAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ReportSurfaceLoadTimeMilestoneAction"
}
t.ReportSurfaceLoadTimeMilestoneAction = t_128
typeRegistryModule.default:register(t.ReportSurfaceLoadTimeMilestoneAction)
local t_129 = {}
t_129.__index = t_129

function t_129.new(p129)
	-- upvalues: t_129 (ref)
	return setmetatable({
		milestone = if p129 == nil or p129.milestone == nil then nil else p129.milestone,
		metadata = if p129 == nil or p129.metadata == nil then nil else p129.metadata
	}, t_129)
end

function t_129:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2636 = 0
	
	if self.milestone ~= nil then
		local var2637 = self.milestone:encode()
		local var2638, var2639 = protoModule.writeTag(buff, var2636, 1, protoModule.wireTypes.lengthDelimited)
		var2638, var4385 = protoModule.writeBuffer(var2638, var2639, var2637, buffer.len(var2637))
		buff = var2638
		var2636 = var2639
	end
	if self.metadata ~= nil then
		local var2640 = self.metadata:encode()
		local var2641, var2642 = protoModule.writeTag(buff, var2636, 3, protoModule.wireTypes.lengthDelimited)
		var2641, var4388 = protoModule.writeBuffer(var2641, var2642, var2640, buffer.len(var2640))
		buff = var2641
		var2636 = var2642
	end
	local buff_1 = buffer.create(var2636)
	buffer.copy(buff_1, 0, buff, 0, var2636)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref), propTypesModule (ref)
	local var2636 = t_129.new()
	local var2637 = 0
	while var2637 < buffer.len(p129) do
		local _ = nil
		local var2638 = nil
		local var2639, var2640, var2641 = protoModule.readTag(p129, var2637)
		local var2642 = var2639
		var2638 = var2640
		var2637 = var2641
		
		if var2638 == protoModule.wireTypes.varint then
			local _ = nil
			local var2643, var2644 = protoModule.readVarInt(p129, var2637)
			local _ = var2643
			var2637 = var2644
			continue
		end
		if var2638 == protoModule.wireTypes.lengthDelimited then
			if var2642 == 1 then
				local _ = nil
				local var2645, var2646 = protoModule.readBuffer(p129, var2637)
				var2637 = var2646
				var2636.milestone = propTypesModule.StringProp.decode(var2645)
			elseif var2642 == 3 then
				local _ = nil
				local var2647, var2648 = protoModule.readBuffer(p129, var2637)
				var2637 = var2648
				var2636.metadata = propTypesModule.StructProp.decode(var2647)
			else
				local _ = nil
				local var2649, var2650 = protoModule.readVarInt(p129, var2637)
				var2637 = var2650 + var2649
			end
		elseif var2638 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2651, var2652 = protoModule.readFixed32(p129, var2637)
			local _ = var2651
			var2637 = var2652
		elseif var2638 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2653, var2654 = protoModule.readFixed64(p129, var2637)
			local _ = var2653
			var2637 = var2654
		else
			error("Unsupported wire type: " .. var4392)
		end
	end
	return var2636
end

function t_129:jsonEncode()
	local t = {}
	
	if self.milestone ~= nil then
		t.milestone = self.milestone:jsonEncode()
	end
	if self.metadata ~= nil then
		t.metadata = self.metadata:jsonEncode()
	end
	return t
end

function t_129:jsonDecode()
	-- upvalues: t_129 (ref), propTypesModule (ref)
	local var2655 = t_129.new()
	
	if self.milestone ~= nil then
		var2655.milestone = propTypesModule.StringProp.jsonDecode(self.milestone)
	end
	if self.metadata ~= nil then
		var2655.metadata = propTypesModule.StructProp.jsonDecode(self.metadata)
	end
	return var2655
end

t_129.descriptor = {
	name = "ReportSurfaceLoadTimeMilestoneAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ReportSurfaceLoadTimeMilestoneAction_Params = t_129
typeRegistryModule.default:register(t.ReportSurfaceLoadTimeMilestoneAction_Params)
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
	local var2655 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2656, var2657 = protoModule.writeTag(buff, var2655, 1, protoModule.wireTypes.varint)
		var2656, var4414 = protoModule.writeVarInt(var2656, var2657, t.ActionType.toNumber(self.action_type))
		buff = var2656
		var2655 = var2657
	end
	if self.action_params ~= nil then
		local var2658 = self.action_params:encode()
		local var2659, var2660 = protoModule.writeTag(buff, var2655, 2, protoModule.wireTypes.lengthDelimited)
		var2659, var4417 = protoModule.writeBuffer(var2659, var2660, var2658, buffer.len(var2658))
		buff = var2659
		var2655 = var2660
	end
	local buff_1 = buffer.create(var2655)
	buffer.copy(buff_1, 0, buff, 0, var2655)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref), t (ref)
	local var2655 = t_130.new()
	local var2656 = 0
	while var2656 < buffer.len(p130) do
		local _ = nil
		local var2657 = nil
		local var2658, var2659, var2660 = protoModule.readTag(p130, var2656)
		local var2661 = var2658
		var2657 = var2659
		var2656 = var2660
		
		if var2657 == protoModule.wireTypes.varint then
			if var2661 == 1 then
				local _ = nil
				local var2662, var2663 = protoModule.readVarIntI32(p130, var2656)
				local var2664 = var2662
				var2656 = var2663
				var2655.action_type = t.ActionType.fromNumber(var2664) or var2664
			else
				local _ = nil
				local var2665, var2666 = protoModule.readVarInt(p130, var2656)
				local _ = var2665
				var2656 = var2666
			end
		end
		if var2657 == protoModule.wireTypes.lengthDelimited then
			if var2661 == 2 then
				local _ = nil
				local var2667, var2668 = protoModule.readBuffer(p130, var2656)
				var2656 = var2668
				var2655.action_params = t.DismissGameFeedbackAction_Params.decode(var2667)
			else
				local _ = nil
				local var2669, var2670 = protoModule.readVarInt(p130, var2656)
				var2656 = var2670 + var2669
			end
		elseif var2657 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2671, var2672 = protoModule.readFixed32(p130, var2656)
			local _ = var2671
			var2656 = var2672
		elseif var2657 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2673, var2674 = protoModule.readFixed64(p130, var2656)
			local _ = var2673
			var2656 = var2674
		else
			error("Unsupported wire type: " .. var4421)
		end
	end
	return var2655
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
	local var2675 = t_130.new()
	
	if self.action_type ~= nil then
		var2675.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2675.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2675.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2675.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return var2675
end

t_130.descriptor = {
	name = "DismissGameFeedbackAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissGameFeedbackAction"
}
t.DismissGameFeedbackAction = t_130
typeRegistryModule.default:register(t.DismissGameFeedbackAction)
local t_131 = {}
t_131.__index = t_131

function t_131.new(p131)
	-- upvalues: t_131 (ref)
	return setmetatable({
		root_place_id = if p131 == nil or p131.root_place_id == nil then nil else p131.root_place_id
	}, t_131)
end

function t_131:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2675 = 0
	
	if self.root_place_id ~= nil then
		local var2676 = self.root_place_id:encode()
		local var2677, var2678 = protoModule.writeTag(buff, var2675, 1, protoModule.wireTypes.lengthDelimited)
		var2677, var4445 = protoModule.writeBuffer(var2677, var2678, var2676, buffer.len(var2676))
		buff = var2677
		var2675 = var2678
	end
	local buff_1 = buffer.create(var2675)
	buffer.copy(buff_1, 0, buff, 0, var2675)
	
	return buff_1
end

function t_131.decode(p131)
	-- upvalues: t_131 (ref), protoModule (ref), propTypesModule (ref)
	local var2675 = t_131.new()
	local var2676 = 0
	while var2676 < buffer.len(p131) do
		local _ = nil
		local var2677 = nil
		local var2678, var2679, var2680 = protoModule.readTag(p131, var2676)
		local var2681 = var2678
		var2677 = var2679
		var2676 = var2680
		
		if var2677 == protoModule.wireTypes.varint then
			local _ = nil
			local var2682, var2683 = protoModule.readVarInt(p131, var2676)
			local _ = var2682
			var2676 = var2683
			continue
		end
		if var2677 == protoModule.wireTypes.lengthDelimited then
			if var2681 == 1 then
				local _ = nil
				local var2684, var2685 = protoModule.readBuffer(p131, var2676)
				var2676 = var2685
				var2675.root_place_id = propTypesModule.StringProp.decode(var2684)
			else
				local _ = nil
				local var2686, var2687 = protoModule.readVarInt(p131, var2676)
				var2676 = var2687 + var2686
			end
		elseif var2677 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2688, var2689 = protoModule.readFixed32(p131, var2676)
			local _ = var2688
			var2676 = var2689
		elseif var2677 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2690, var2691 = protoModule.readFixed64(p131, var2676)
			local _ = var2690
			var2676 = var2691
		else
			error("Unsupported wire type: " .. var4449)
		end
	end
	return var2675
end

function t_131:jsonEncode()
	local t = {}
	
	if self.root_place_id ~= nil then
		t.rootPlaceId = self.root_place_id:jsonEncode()
	end
	return t
end

function t_131:jsonDecode()
	-- upvalues: t_131 (ref), propTypesModule (ref)
	local var2692 = t_131.new()
	
	if self.root_place_id ~= nil then
		var2692.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var2692.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var2692
end

t_131.descriptor = {
	name = "DismissGameFeedbackAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissGameFeedbackAction_Params = t_131
typeRegistryModule.default:register(t.DismissGameFeedbackAction_Params)
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
	local var2692 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2693, var2694 = protoModule.writeTag(buff, var2692, 1, protoModule.wireTypes.varint)
		var2693, var4469 = protoModule.writeVarInt(var2693, var2694, t.ActionType.toNumber(self.action_type))
		buff = var2693
		var2692 = var2694
	end
	if self.action_params ~= nil then
		local var2695 = self.action_params:encode()
		local var2696, var2697 = protoModule.writeTag(buff, var2692, 2, protoModule.wireTypes.lengthDelimited)
		var2696, var4472 = protoModule.writeBuffer(var2696, var2697, var2695, buffer.len(var2695))
		buff = var2696
		var2692 = var2697
	end
	local buff_1 = buffer.create(var2692)
	buffer.copy(buff_1, 0, buff, 0, var2692)
	
	return buff_1
end

function t_132.decode(p132)
	-- upvalues: t_132 (ref), protoModule (ref), t (ref)
	local var2692 = t_132.new()
	local var2693 = 0
	while var2693 < buffer.len(p132) do
		local _ = nil
		local var2694 = nil
		local var2695, var2696, var2697 = protoModule.readTag(p132, var2693)
		local var2698 = var2695
		var2694 = var2696
		var2693 = var2697
		
		if var2694 == protoModule.wireTypes.varint then
			if var2698 == 1 then
				local _ = nil
				local var2699, var2700 = protoModule.readVarIntI32(p132, var2693)
				local var2701 = var2699
				var2693 = var2700
				var2692.action_type = t.ActionType.fromNumber(var2701) or var2701
			else
				local _ = nil
				local var2702, var2703 = protoModule.readVarInt(p132, var2693)
				local _ = var2702
				var2693 = var2703
			end
		end
		if var2694 == protoModule.wireTypes.lengthDelimited then
			if var2698 == 2 then
				local _ = nil
				local var2704, var2705 = protoModule.readBuffer(p132, var2693)
				var2693 = var2705
				var2692.action_params = t.OpenGameFeedbackFormAction_Params.decode(var2704)
			else
				local _ = nil
				local var2706, var2707 = protoModule.readVarInt(p132, var2693)
				var2693 = var2707 + var2706
			end
		elseif var2694 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2708, var2709 = protoModule.readFixed32(p132, var2693)
			local _ = var2708
			var2693 = var2709
		elseif var2694 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2710, var2711 = protoModule.readFixed64(p132, var2693)
			local _ = var2710
			var2693 = var2711
		else
			error("Unsupported wire type: " .. var4476)
		end
	end
	return var2692
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
	local var2712 = t_132.new()
	
	if self.action_type ~= nil then
		var2712.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2712.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2712.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2712.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.actionParams)
	end
	return var2712
end

t_132.descriptor = {
	name = "OpenGameFeedbackFormAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameFeedbackFormAction"
}
t.OpenGameFeedbackFormAction = t_132
typeRegistryModule.default:register(t.OpenGameFeedbackFormAction)
local t_133 = {}
t_133.__index = t_133

function t_133.new(p133)
	-- upvalues: t_133 (ref)
	return setmetatable({
		universe_id = if p133 == nil or p133.universe_id == nil then nil else p133.universe_id,
		root_place_id = if p133 == nil or p133.root_place_id == nil then nil else p133.root_place_id
	}, t_133)
end

function t_133:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2712 = 0
	
	if self.universe_id ~= nil then
		local var2713 = self.universe_id:encode()
		local var2714, var2715 = protoModule.writeTag(buff, var2712, 1, protoModule.wireTypes.lengthDelimited)
		var2714, var4500 = protoModule.writeBuffer(var2714, var2715, var2713, buffer.len(var2713))
		buff = var2714
		var2712 = var2715
	end
	if self.root_place_id ~= nil then
		local var2716 = self.root_place_id:encode()
		local var2717, var2718 = protoModule.writeTag(buff, var2712, 2, protoModule.wireTypes.lengthDelimited)
		var2717, var4503 = protoModule.writeBuffer(var2717, var2718, var2716, buffer.len(var2716))
		buff = var2717
		var2712 = var2718
	end
	local buff_1 = buffer.create(var2712)
	buffer.copy(buff_1, 0, buff, 0, var2712)
	
	return buff_1
end

function t_133.decode(p133)
	-- upvalues: t_133 (ref), protoModule (ref), propTypesModule (ref)
	local var2712 = t_133.new()
	local var2713 = 0
	while var2713 < buffer.len(p133) do
		local _ = nil
		local var2714 = nil
		local var2715, var2716, var2717 = protoModule.readTag(p133, var2713)
		local var2718 = var2715
		var2714 = var2716
		var2713 = var2717
		
		if var2714 == protoModule.wireTypes.varint then
			local _ = nil
			local var2719, var2720 = protoModule.readVarInt(p133, var2713)
			local _ = var2719
			var2713 = var2720
			continue
		end
		if var2714 == protoModule.wireTypes.lengthDelimited then
			if var2718 == 1 then
				local _ = nil
				local var2721, var2722 = protoModule.readBuffer(p133, var2713)
				var2713 = var2722
				var2712.universe_id = propTypesModule.StringProp.decode(var2721)
			elseif var2718 == 2 then
				local _ = nil
				local var2723, var2724 = protoModule.readBuffer(p133, var2713)
				var2713 = var2724
				var2712.root_place_id = propTypesModule.StringProp.decode(var2723)
			else
				local _ = nil
				local var2725, var2726 = protoModule.readVarInt(p133, var2713)
				var2713 = var2726 + var2725
			end
		elseif var2714 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2727, var2728 = protoModule.readFixed32(p133, var2713)
			local _ = var2727
			var2713 = var2728
		elseif var2714 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2729, var2730 = protoModule.readFixed64(p133, var2713)
			local _ = var2729
			var2713 = var2730
		else
			error("Unsupported wire type: " .. var4507)
		end
	end
	return var2712
end

function t_133:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.root_place_id ~= nil then
		t.rootPlaceId = self.root_place_id:jsonEncode()
	end
	return t
end

function t_133:jsonDecode()
	-- upvalues: t_133 (ref), propTypesModule (ref)
	local var2731 = t_133.new()
	
	if self.universe_id ~= nil then
		var2731.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2731.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		var2731.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var2731.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var2731
end

t_133.descriptor = {
	name = "OpenGameFeedbackFormAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameFeedbackFormAction_Params = t_133
typeRegistryModule.default:register(t.OpenGameFeedbackFormAction_Params)
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
	local var2731 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2732, var2733 = protoModule.writeTag(buff, var2731, 1, protoModule.wireTypes.varint)
		var2732, var4529 = protoModule.writeVarInt(var2732, var2733, t.ActionType.toNumber(self.action_type))
		buff = var2732
		var2731 = var2733
	end
	if self.action_params ~= nil then
		local var2734 = self.action_params:encode()
		local var2735, var2736 = protoModule.writeTag(buff, var2731, 2, protoModule.wireTypes.lengthDelimited)
		var2735, var4532 = protoModule.writeBuffer(var2735, var2736, var2734, buffer.len(var2734))
		buff = var2735
		var2731 = var2736
	end
	local buff_1 = buffer.create(var2731)
	buffer.copy(buff_1, 0, buff, 0, var2731)
	
	return buff_1
end

function t_134.decode(p134)
	-- upvalues: t_134 (ref), protoModule (ref), t (ref)
	local var2731 = t_134.new()
	local var2732 = 0
	while var2732 < buffer.len(p134) do
		local _ = nil
		local var2733 = nil
		local var2734, var2735, var2736 = protoModule.readTag(p134, var2732)
		local var2737 = var2734
		var2733 = var2735
		var2732 = var2736
		
		if var2733 == protoModule.wireTypes.varint then
			if var2737 == 1 then
				local _ = nil
				local var2738, var2739 = protoModule.readVarIntI32(p134, var2732)
				local var2740 = var2738
				var2732 = var2739
				var2731.action_type = t.ActionType.fromNumber(var2740) or var2740
			else
				local _ = nil
				local var2741, var2742 = protoModule.readVarInt(p134, var2732)
				local _ = var2741
				var2732 = var2742
			end
		end
		if var2733 == protoModule.wireTypes.lengthDelimited then
			if var2737 == 2 then
				local _ = nil
				local var2743, var2744 = protoModule.readBuffer(p134, var2732)
				var2732 = var2744
				var2731.action_params = t.AiOverviewFeedbackAction_Params.decode(var2743)
			else
				local _ = nil
				local var2745, var2746 = protoModule.readVarInt(p134, var2732)
				var2732 = var2746 + var2745
			end
		elseif var2733 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2747, var2748 = protoModule.readFixed32(p134, var2732)
			local _ = var2747
			var2732 = var2748
		elseif var2733 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2749, var2750 = protoModule.readFixed64(p134, var2732)
			local _ = var2749
			var2732 = var2750
		else
			error("Unsupported wire type: " .. var4536)
		end
	end
	return var2731
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
	local var2751 = t_134.new()
	
	if self.action_type ~= nil then
		var2751.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2751.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2751.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2751.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return var2751
end

t_134.descriptor = {
	name = "AiOverviewFeedbackAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.AiOverviewFeedbackAction"
}
t.AiOverviewFeedbackAction = t_134
typeRegistryModule.default:register(t.AiOverviewFeedbackAction)
local t_135 = {}
t_135.__index = t_135

function t_135.new(p135)
	-- upvalues: t_135 (ref)
	return setmetatable({
		sentiment = if p135 == nil or p135.sentiment == nil then nil else p135.sentiment,
		dialog_title = if p135 == nil or p135.dialog_title == nil then nil else p135.dialog_title,
		dialog_text = if p135 == nil or p135.dialog_text == nil then nil else p135.dialog_text,
		placeholder_text = if p135 == nil or p135.placeholder_text == nil then nil else p135.placeholder_text
	}, t_135)
end

function t_135:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2751 = 0
	
	if self.sentiment ~= nil then
		local var2752 = self.sentiment:encode()
		local var2753, var2754 = protoModule.writeTag(buff, var2751, 1, protoModule.wireTypes.lengthDelimited)
		var2753, var4560 = protoModule.writeBuffer(var2753, var2754, var2752, buffer.len(var2752))
		buff = var2753
		var2751 = var2754
	end
	if self.dialog_title ~= nil then
		local var2755 = self.dialog_title:encode()
		local var2756, var2757 = protoModule.writeTag(buff, var2751, 2, protoModule.wireTypes.lengthDelimited)
		var2756, var4563 = protoModule.writeBuffer(var2756, var2757, var2755, buffer.len(var2755))
		buff = var2756
		var2751 = var2757
	end
	if self.dialog_text ~= nil then
		local var2758 = self.dialog_text:encode()
		local var2759, var2760 = protoModule.writeTag(buff, var2751, 3, protoModule.wireTypes.lengthDelimited)
		var2759, var4566 = protoModule.writeBuffer(var2759, var2760, var2758, buffer.len(var2758))
		buff = var2759
		var2751 = var2760
	end
	if self.placeholder_text ~= nil then
		local var2761 = self.placeholder_text:encode()
		local var2762, var2763 = protoModule.writeTag(buff, var2751, 4, protoModule.wireTypes.lengthDelimited)
		var2762, var4569 = protoModule.writeBuffer(var2762, var2763, var2761, buffer.len(var2761))
		buff = var2762
		var2751 = var2763
	end
	local buff_1 = buffer.create(var2751)
	buffer.copy(buff_1, 0, buff, 0, var2751)
	
	return buff_1
end

function t_135.decode(p135)
	-- upvalues: t_135 (ref), protoModule (ref), propTypesModule (ref)
	local var2751 = t_135.new()
	local var2752 = 0
	while var2752 < buffer.len(p135) do
		local _ = nil
		local var2753 = nil
		local var2754, var2755, var2756 = protoModule.readTag(p135, var2752)
		local var2757 = var2754
		var2753 = var2755
		var2752 = var2756
		
		if var2753 == protoModule.wireTypes.varint then
			local _ = nil
			local var2758, var2759 = protoModule.readVarInt(p135, var2752)
			local _ = var2758
			var2752 = var2759
			continue
		end
		if var2753 == protoModule.wireTypes.lengthDelimited then
			if var2757 == 1 then
				local _ = nil
				local var2760, var2761 = protoModule.readBuffer(p135, var2752)
				var2752 = var2761
				var2751.sentiment = propTypesModule.StringProp.decode(var2760)
			elseif var2757 == 2 then
				local _ = nil
				local var2762, var2763 = protoModule.readBuffer(p135, var2752)
				var2752 = var2763
				var2751.dialog_title = propTypesModule.StringProp.decode(var2762)
			elseif var2757 == 3 then
				local _ = nil
				local var2764, var2765 = protoModule.readBuffer(p135, var2752)
				var2752 = var2765
				var2751.dialog_text = propTypesModule.StringProp.decode(var2764)
			elseif var2757 == 4 then
				local _ = nil
				local var2766, var2767 = protoModule.readBuffer(p135, var2752)
				var2752 = var2767
				var2751.placeholder_text = propTypesModule.StringProp.decode(var2766)
			else
				local _ = nil
				local var2768, var2769 = protoModule.readVarInt(p135, var2752)
				var2752 = var2769 + var2768
			end
		elseif var2753 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2770, var2771 = protoModule.readFixed32(p135, var2752)
			local _ = var2770
			var2752 = var2771
		elseif var2753 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2772, var2773 = protoModule.readFixed64(p135, var2752)
			local _ = var2772
			var2752 = var2773
		else
			error("Unsupported wire type: " .. var4573)
		end
	end
	return var2751
end

function t_135:jsonEncode()
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

function t_135:jsonDecode()
	-- upvalues: t_135 (ref), propTypesModule (ref)
	local var2774 = t_135.new()
	
	if self.sentiment ~= nil then
		var2774.sentiment = propTypesModule.StringProp.jsonDecode(self.sentiment)
	end
	if self.dialog_title ~= nil then
		var2774.dialog_title = propTypesModule.StringProp.jsonDecode(self.dialog_title)
	end
	if self.dialogTitle ~= nil then
		var2774.dialog_title = propTypesModule.StringProp.jsonDecode(self.dialogTitle)
	end
	if self.dialog_text ~= nil then
		var2774.dialog_text = propTypesModule.StringProp.jsonDecode(self.dialog_text)
	end
	if self.dialogText ~= nil then
		var2774.dialog_text = propTypesModule.StringProp.jsonDecode(self.dialogText)
	end
	if self.placeholder_text ~= nil then
		var2774.placeholder_text = propTypesModule.StringProp.jsonDecode(self.placeholder_text)
	end
	if self.placeholderText ~= nil then
		var2774.placeholder_text = propTypesModule.StringProp.jsonDecode(self.placeholderText)
	end
	return var2774
end

t_135.descriptor = {
	name = "AiOverviewFeedbackAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.AiOverviewFeedbackAction_Params = t_135
typeRegistryModule.default:register(t.AiOverviewFeedbackAction_Params)
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
	local var2774 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2775, var2776 = protoModule.writeTag(buff, var2774, 1, protoModule.wireTypes.varint)
		var2775, var4599 = protoModule.writeVarInt(var2775, var2776, t.ActionType.toNumber(self.action_type))
		buff = var2775
		var2774 = var2776
	end
	if self.action_params ~= nil then
		local var2777 = self.action_params:encode()
		local var2778, var2779 = protoModule.writeTag(buff, var2774, 2, protoModule.wireTypes.lengthDelimited)
		var2778, var4602 = protoModule.writeBuffer(var2778, var2779, var2777, buffer.len(var2777))
		buff = var2778
		var2774 = var2779
	end
	local buff_1 = buffer.create(var2774)
	buffer.copy(buff_1, 0, buff, 0, var2774)
	
	return buff_1
end

function t_136.decode(p136)
	-- upvalues: t_136 (ref), protoModule (ref), t (ref)
	local var2774 = t_136.new()
	local var2775 = 0
	while var2775 < buffer.len(p136) do
		local _ = nil
		local var2776 = nil
		local var2777, var2778, var2779 = protoModule.readTag(p136, var2775)
		local var2780 = var2777
		var2776 = var2778
		var2775 = var2779
		
		if var2776 == protoModule.wireTypes.varint then
			if var2780 == 1 then
				local _ = nil
				local var2781, var2782 = protoModule.readVarIntI32(p136, var2775)
				local var2783 = var2781
				var2775 = var2782
				var2774.action_type = t.ActionType.fromNumber(var2783) or var2783
			else
				local _ = nil
				local var2784, var2785 = protoModule.readVarInt(p136, var2775)
				local _ = var2784
				var2775 = var2785
			end
		end
		if var2776 == protoModule.wireTypes.lengthDelimited then
			if var2780 == 2 then
				local _ = nil
				local var2786, var2787 = protoModule.readBuffer(p136, var2775)
				var2775 = var2787
				var2774.action_params = t.EnableEventNotificationsAction_Params.decode(var2786)
			else
				local _ = nil
				local var2788, var2789 = protoModule.readVarInt(p136, var2775)
				var2775 = var2789 + var2788
			end
		elseif var2776 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2790, var2791 = protoModule.readFixed32(p136, var2775)
			local _ = var2790
			var2775 = var2791
		elseif var2776 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2792, var2793 = protoModule.readFixed64(p136, var2775)
			local _ = var2792
			var2775 = var2793
		else
			error("Unsupported wire type: " .. var4606)
		end
	end
	return var2774
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
	local var2794 = t_136.new()
	
	if self.action_type ~= nil then
		var2794.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2794.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2794.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2794.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.actionParams)
	end
	return var2794
end

t_136.descriptor = {
	name = "EnableEventNotificationsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.EnableEventNotificationsAction"
}
t.EnableEventNotificationsAction = t_136
typeRegistryModule.default:register(t.EnableEventNotificationsAction)
local t_137 = {}
t_137.__index = t_137

function t_137.new(p137)
	-- upvalues: t_137 (ref)
	return setmetatable({
		event_id = if p137 == nil or p137.event_id == nil then nil else p137.event_id,
		universe_id = if p137 == nil or p137.universe_id == nil then nil else p137.universe_id,
		channel = if p137 == nil or p137.channel == nil then nil else p137.channel
	}, t_137)
end

function t_137:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2794 = 0
	
	if self.event_id ~= nil then
		local var2795 = self.event_id:encode()
		local var2796, var2797 = protoModule.writeTag(buff, var2794, 1, protoModule.wireTypes.lengthDelimited)
		var2796, var4630 = protoModule.writeBuffer(var2796, var2797, var2795, buffer.len(var2795))
		buff = var2796
		var2794 = var2797
	end
	if self.universe_id ~= nil then
		local var2798 = self.universe_id:encode()
		local var2799, var2800 = protoModule.writeTag(buff, var2794, 2, protoModule.wireTypes.lengthDelimited)
		var2799, var4633 = protoModule.writeBuffer(var2799, var2800, var2798, buffer.len(var2798))
		buff = var2799
		var2794 = var2800
	end
	if self.channel ~= nil then
		local var2801 = self.channel:encode()
		local var2802, var2803 = protoModule.writeTag(buff, var2794, 3, protoModule.wireTypes.lengthDelimited)
		var2802, var4636 = protoModule.writeBuffer(var2802, var2803, var2801, buffer.len(var2801))
		buff = var2802
		var2794 = var2803
	end
	local buff_1 = buffer.create(var2794)
	buffer.copy(buff_1, 0, buff, 0, var2794)
	
	return buff_1
end

function t_137.decode(p137)
	-- upvalues: t_137 (ref), protoModule (ref), propTypesModule (ref)
	local var2794 = t_137.new()
	local var2795 = 0
	while var2795 < buffer.len(p137) do
		local _ = nil
		local var2796 = nil
		local var2797, var2798, var2799 = protoModule.readTag(p137, var2795)
		local var2800 = var2797
		var2796 = var2798
		var2795 = var2799
		
		if var2796 == protoModule.wireTypes.varint then
			local _ = nil
			local var2801, var2802 = protoModule.readVarInt(p137, var2795)
			local _ = var2801
			var2795 = var2802
			continue
		end
		if var2796 == protoModule.wireTypes.lengthDelimited then
			if var2800 == 1 then
				local _ = nil
				local var2803, var2804 = protoModule.readBuffer(p137, var2795)
				var2795 = var2804
				var2794.event_id = propTypesModule.StringProp.decode(var2803)
			elseif var2800 == 2 then
				local _ = nil
				local var2805, var2806 = protoModule.readBuffer(p137, var2795)
				var2795 = var2806
				var2794.universe_id = propTypesModule.StringProp.decode(var2805)
			elseif var2800 == 3 then
				local _ = nil
				local var2807, var2808 = protoModule.readBuffer(p137, var2795)
				var2795 = var2808
				var2794.channel = propTypesModule.StringProp.decode(var2807)
			else
				local _ = nil
				local var2809, var2810 = protoModule.readVarInt(p137, var2795)
				var2795 = var2810 + var2809
			end
		elseif var2796 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2811, var2812 = protoModule.readFixed32(p137, var2795)
			local _ = var2811
			var2795 = var2812
		elseif var2796 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2813, var2814 = protoModule.readFixed64(p137, var2795)
			local _ = var2813
			var2795 = var2814
		else
			error("Unsupported wire type: " .. var4640)
		end
	end
	return var2794
end

function t_137:jsonEncode()
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

function t_137:jsonDecode()
	-- upvalues: t_137 (ref), propTypesModule (ref)
	local var2815 = t_137.new()
	
	if self.event_id ~= nil then
		var2815.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var2815.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.universe_id ~= nil then
		var2815.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2815.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.channel ~= nil then
		var2815.channel = propTypesModule.StringProp.jsonDecode(self.channel)
	end
	return var2815
end

t_137.descriptor = {
	name = "EnableEventNotificationsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.EnableEventNotificationsAction_Params = t_137
typeRegistryModule.default:register(t.EnableEventNotificationsAction_Params)
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
	local var2815 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2816, var2817 = protoModule.writeTag(buff, var2815, 1, protoModule.wireTypes.varint)
		var2816, var4664 = protoModule.writeVarInt(var2816, var2817, t.ActionType.toNumber(self.action_type))
		buff = var2816
		var2815 = var2817
	end
	if self.action_params ~= nil then
		local var2818 = self.action_params:encode()
		local var2819, var2820 = protoModule.writeTag(buff, var2815, 2, protoModule.wireTypes.lengthDelimited)
		var2819, var4667 = protoModule.writeBuffer(var2819, var2820, var2818, buffer.len(var2818))
		buff = var2819
		var2815 = var2820
	end
	local buff_1 = buffer.create(var2815)
	buffer.copy(buff_1, 0, buff, 0, var2815)
	
	return buff_1
end

function t_138.decode(p138)
	-- upvalues: t_138 (ref), protoModule (ref), t (ref)
	local var2815 = t_138.new()
	local var2816 = 0
	while var2816 < buffer.len(p138) do
		local _ = nil
		local var2817 = nil
		local var2818, var2819, var2820 = protoModule.readTag(p138, var2816)
		local var2821 = var2818
		var2817 = var2819
		var2816 = var2820
		
		if var2817 == protoModule.wireTypes.varint then
			if var2821 == 1 then
				local _ = nil
				local var2822, var2823 = protoModule.readVarIntI32(p138, var2816)
				local var2824 = var2822
				var2816 = var2823
				var2815.action_type = t.ActionType.fromNumber(var2824) or var2824
			else
				local _ = nil
				local var2825, var2826 = protoModule.readVarInt(p138, var2816)
				local _ = var2825
				var2816 = var2826
			end
		end
		if var2817 == protoModule.wireTypes.lengthDelimited then
			if var2821 == 2 then
				local _ = nil
				local var2827, var2828 = protoModule.readBuffer(p138, var2816)
				var2816 = var2828
				var2815.action_params = t.DismissEventNotificationsModalAction_Params.decode(var2827)
			else
				local _ = nil
				local var2829, var2830 = protoModule.readVarInt(p138, var2816)
				var2816 = var2830 + var2829
			end
		elseif var2817 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2831, var2832 = protoModule.readFixed32(p138, var2816)
			local _ = var2831
			var2816 = var2832
		elseif var2817 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2833, var2834 = protoModule.readFixed64(p138, var2816)
			local _ = var2833
			var2816 = var2834
		else
			error("Unsupported wire type: " .. var4671)
		end
	end
	return var2815
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
	local var2835 = t_138.new()
	
	if self.action_type ~= nil then
		var2835.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2835.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2835.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2835.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.actionParams)
	end
	return var2835
end

t_138.descriptor = {
	name = "DismissEventNotificationsModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissEventNotificationsModalAction"
}
t.DismissEventNotificationsModalAction = t_138
typeRegistryModule.default:register(t.DismissEventNotificationsModalAction)
local t_139 = {}
t_139.__index = t_139

function t_139.new(p139)
	-- upvalues: t_139 (ref)
	return setmetatable({
		event_id = if p139 == nil or p139.event_id == nil then nil else p139.event_id
	}, t_139)
end

function t_139:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2835 = 0
	
	if self.event_id ~= nil then
		local var2836 = self.event_id:encode()
		local var2837, var2838 = protoModule.writeTag(buff, var2835, 1, protoModule.wireTypes.lengthDelimited)
		var2837, var4695 = protoModule.writeBuffer(var2837, var2838, var2836, buffer.len(var2836))
		buff = var2837
		var2835 = var2838
	end
	local buff_1 = buffer.create(var2835)
	buffer.copy(buff_1, 0, buff, 0, var2835)
	
	return buff_1
end

function t_139.decode(p139)
	-- upvalues: t_139 (ref), protoModule (ref), propTypesModule (ref)
	local var2835 = t_139.new()
	local var2836 = 0
	while var2836 < buffer.len(p139) do
		local _ = nil
		local var2837 = nil
		local var2838, var2839, var2840 = protoModule.readTag(p139, var2836)
		local var2841 = var2838
		var2837 = var2839
		var2836 = var2840
		
		if var2837 == protoModule.wireTypes.varint then
			local _ = nil
			local var2842, var2843 = protoModule.readVarInt(p139, var2836)
			local _ = var2842
			var2836 = var2843
			continue
		end
		if var2837 == protoModule.wireTypes.lengthDelimited then
			if var2841 == 1 then
				local _ = nil
				local var2844, var2845 = protoModule.readBuffer(p139, var2836)
				var2836 = var2845
				var2835.event_id = propTypesModule.StringProp.decode(var2844)
			else
				local _ = nil
				local var2846, var2847 = protoModule.readVarInt(p139, var2836)
				var2836 = var2847 + var2846
			end
		elseif var2837 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2848, var2849 = protoModule.readFixed32(p139, var2836)
			local _ = var2848
			var2836 = var2849
		elseif var2837 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2850, var2851 = protoModule.readFixed64(p139, var2836)
			local _ = var2850
			var2836 = var2851
		else
			error("Unsupported wire type: " .. var4699)
		end
	end
	return var2835
end

function t_139:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_139:jsonDecode()
	-- upvalues: t_139 (ref), propTypesModule (ref)
	local var2852 = t_139.new()
	
	if self.event_id ~= nil then
		var2852.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var2852.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var2852
end

t_139.descriptor = {
	name = "DismissEventNotificationsModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissEventNotificationsModalAction_Params = t_139
typeRegistryModule.default:register(t.DismissEventNotificationsModalAction_Params)
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
	local var2852 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2853, var2854 = protoModule.writeTag(buff, var2852, 1, protoModule.wireTypes.varint)
		var2853, var4719 = protoModule.writeVarInt(var2853, var2854, t.ActionType.toNumber(self.action_type))
		buff = var2853
		var2852 = var2854
	end
	if self.action_params ~= nil then
		local var2855 = self.action_params:encode()
		local var2856, var2857 = protoModule.writeTag(buff, var2852, 2, protoModule.wireTypes.lengthDelimited)
		var2856, var4722 = protoModule.writeBuffer(var2856, var2857, var2855, buffer.len(var2855))
		buff = var2856
		var2852 = var2857
	end
	local buff_1 = buffer.create(var2852)
	buffer.copy(buff_1, 0, buff, 0, var2852)
	
	return buff_1
end

function t_140.decode(p140)
	-- upvalues: t_140 (ref), protoModule (ref), t (ref)
	local var2852 = t_140.new()
	local var2853 = 0
	while var2853 < buffer.len(p140) do
		local _ = nil
		local var2854 = nil
		local var2855, var2856, var2857 = protoModule.readTag(p140, var2853)
		local var2858 = var2855
		var2854 = var2856
		var2853 = var2857
		
		if var2854 == protoModule.wireTypes.varint then
			if var2858 == 1 then
				local _ = nil
				local var2859, var2860 = protoModule.readVarIntI32(p140, var2853)
				local var2861 = var2859
				var2853 = var2860
				var2852.action_type = t.ActionType.fromNumber(var2861) or var2861
			else
				local _ = nil
				local var2862, var2863 = protoModule.readVarInt(p140, var2853)
				local _ = var2862
				var2853 = var2863
			end
		end
		if var2854 == protoModule.wireTypes.lengthDelimited then
			if var2858 == 2 then
				local _ = nil
				local var2864, var2865 = protoModule.readBuffer(p140, var2853)
				var2853 = var2865
				var2852.action_params = t.OpenAmpWizardAction_Params.decode(var2864)
			else
				local _ = nil
				local var2866, var2867 = protoModule.readVarInt(p140, var2853)
				var2853 = var2867 + var2866
			end
		elseif var2854 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2868, var2869 = protoModule.readFixed32(p140, var2853)
			local _ = var2868
			var2853 = var2869
		elseif var2854 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2870, var2871 = protoModule.readFixed64(p140, var2853)
			local _ = var2870
			var2853 = var2871
		else
			error("Unsupported wire type: " .. var4726)
		end
	end
	return var2852
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
	local var2872 = t_140.new()
	
	if self.action_type ~= nil then
		var2872.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2872.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2872.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2872.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.actionParams)
	end
	return var2872
end

t_140.descriptor = {
	name = "OpenAmpWizardAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAmpWizardAction"
}
t.OpenAmpWizardAction = t_140
typeRegistryModule.default:register(t.OpenAmpWizardAction)
local t_141 = {}
t_141.__index = t_141

function t_141.new(p141)
	-- upvalues: t_141 (ref)
	return setmetatable({
		feature_name = if p141 == nil or p141.feature_name == nil then nil else p141.feature_name,
		name_space = if p141 == nil or p141.name_space == nil then nil else p141.name_space,
		entry_point_event_ctx = if p141 == nil or p141.entry_point_event_ctx == nil then nil else p141.entry_point_event_ctx,
		skip_facial_age_estimation_web_link_modal = if p141 == nil or p141.skip_facial_age_estimation_web_link_modal == nil then nil else p141.skip_facial_age_estimation_web_link_modal
	}, t_141)
end

function t_141:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2872 = 0
	
	if self.feature_name ~= nil then
		local var2873 = self.feature_name:encode()
		local var2874, var2875 = protoModule.writeTag(buff, var2872, 1, protoModule.wireTypes.lengthDelimited)
		var2874, var4750 = protoModule.writeBuffer(var2874, var2875, var2873, buffer.len(var2873))
		buff = var2874
		var2872 = var2875
	end
	if self.name_space ~= nil then
		local var2876 = self.name_space:encode()
		local var2877, var2878 = protoModule.writeTag(buff, var2872, 2, protoModule.wireTypes.lengthDelimited)
		var2877, var4753 = protoModule.writeBuffer(var2877, var2878, var2876, buffer.len(var2876))
		buff = var2877
		var2872 = var2878
	end
	if self.entry_point_event_ctx ~= nil then
		local var2879 = self.entry_point_event_ctx:encode()
		local var2880, var2881 = protoModule.writeTag(buff, var2872, 3, protoModule.wireTypes.lengthDelimited)
		var2880, var4756 = protoModule.writeBuffer(var2880, var2881, var2879, buffer.len(var2879))
		buff = var2880
		var2872 = var2881
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		local var2882 = self.skip_facial_age_estimation_web_link_modal:encode()
		local var2883, var2884 = protoModule.writeTag(buff, var2872, 4, protoModule.wireTypes.lengthDelimited)
		var2883, var4759 = protoModule.writeBuffer(var2883, var2884, var2882, buffer.len(var2882))
		buff = var2883
		var2872 = var2884
	end
	local buff_1 = buffer.create(var2872)
	buffer.copy(buff_1, 0, buff, 0, var2872)
	
	return buff_1
end

function t_141.decode(p141)
	-- upvalues: t_141 (ref), protoModule (ref), propTypesModule (ref)
	local var2872 = t_141.new()
	local var2873 = 0
	while var2873 < buffer.len(p141) do
		local _ = nil
		local var2874 = nil
		local var2875, var2876, var2877 = protoModule.readTag(p141, var2873)
		local var2878 = var2875
		var2874 = var2876
		var2873 = var2877
		
		if var2874 == protoModule.wireTypes.varint then
			local _ = nil
			local var2879, var2880 = protoModule.readVarInt(p141, var2873)
			local _ = var2879
			var2873 = var2880
			continue
		end
		if var2874 == protoModule.wireTypes.lengthDelimited then
			if var2878 == 1 then
				local _ = nil
				local var2881, var2882 = protoModule.readBuffer(p141, var2873)
				var2873 = var2882
				var2872.feature_name = propTypesModule.StringProp.decode(var2881)
			elseif var2878 == 2 then
				local _ = nil
				local var2883, var2884 = protoModule.readBuffer(p141, var2873)
				var2873 = var2884
				var2872.name_space = propTypesModule.StringProp.decode(var2883)
			elseif var2878 == 3 then
				local _ = nil
				local var2885, var2886 = protoModule.readBuffer(p141, var2873)
				var2873 = var2886
				var2872.entry_point_event_ctx = propTypesModule.StringProp.decode(var2885)
			elseif var2878 == 4 then
				local _ = nil
				local var2887, var2888 = protoModule.readBuffer(p141, var2873)
				var2873 = var2888
				var2872.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.decode(var2887)
			else
				local _ = nil
				local var2889, var2890 = protoModule.readVarInt(p141, var2873)
				var2873 = var2890 + var2889
			end
		elseif var2874 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2891, var2892 = protoModule.readFixed32(p141, var2873)
			local _ = var2891
			var2873 = var2892
		elseif var2874 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2893, var2894 = protoModule.readFixed64(p141, var2873)
			local _ = var2893
			var2873 = var2894
		else
			error("Unsupported wire type: " .. var4763)
		end
	end
	return var2872
end

function t_141:jsonEncode()
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

function t_141:jsonDecode()
	-- upvalues: t_141 (ref), propTypesModule (ref)
	local var2895 = t_141.new()
	
	if self.feature_name ~= nil then
		var2895.feature_name = propTypesModule.StringProp.jsonDecode(self.feature_name)
	end
	if self.featureName ~= nil then
		var2895.feature_name = propTypesModule.StringProp.jsonDecode(self.featureName)
	end
	if self.name_space ~= nil then
		var2895.name_space = propTypesModule.StringProp.jsonDecode(self.name_space)
	end
	if self.nameSpace ~= nil then
		var2895.name_space = propTypesModule.StringProp.jsonDecode(self.nameSpace)
	end
	if self.entry_point_event_ctx ~= nil then
		var2895.entry_point_event_ctx = propTypesModule.StringProp.jsonDecode(self.entry_point_event_ctx)
	end
	if self.entryPointEventCtx ~= nil then
		var2895.entry_point_event_ctx = propTypesModule.StringProp.jsonDecode(self.entryPointEventCtx)
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		var2895.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.jsonDecode(self.skip_facial_age_estimation_web_link_modal)
	end
	if self.skipFacialAgeEstimationWebLinkModal ~= nil then
		var2895.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.jsonDecode(self.skipFacialAgeEstimationWebLinkModal)
	end
	return var2895
end

t_141.descriptor = {
	name = "OpenAmpWizardAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAmpWizardAction_Params = t_141
typeRegistryModule.default:register(t.OpenAmpWizardAction_Params)
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
	local var2895 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2896, var2897 = protoModule.writeTag(buff, var2895, 1, protoModule.wireTypes.varint)
		var2896, var4789 = protoModule.writeVarInt(var2896, var2897, t.ActionType.toNumber(self.action_type))
		buff = var2896
		var2895 = var2897
	end
	if self.action_params ~= nil then
		local var2898 = self.action_params:encode()
		local var2899, var2900 = protoModule.writeTag(buff, var2895, 2, protoModule.wireTypes.lengthDelimited)
		var2899, var4792 = protoModule.writeBuffer(var2899, var2900, var2898, buffer.len(var2898))
		buff = var2899
		var2895 = var2900
	end
	local buff_1 = buffer.create(var2895)
	buffer.copy(buff_1, 0, buff, 0, var2895)
	
	return buff_1
end

function t_142.decode(p142)
	-- upvalues: t_142 (ref), protoModule (ref), t (ref)
	local var2895 = t_142.new()
	local var2896 = 0
	while var2896 < buffer.len(p142) do
		local _ = nil
		local var2897 = nil
		local var2898, var2899, var2900 = protoModule.readTag(p142, var2896)
		local var2901 = var2898
		var2897 = var2899
		var2896 = var2900
		
		if var2897 == protoModule.wireTypes.varint then
			if var2901 == 1 then
				local _ = nil
				local var2902, var2903 = protoModule.readVarIntI32(p142, var2896)
				local var2904 = var2902
				var2896 = var2903
				var2895.action_type = t.ActionType.fromNumber(var2904) or var2904
			else
				local _ = nil
				local var2905, var2906 = protoModule.readVarInt(p142, var2896)
				local _ = var2905
				var2896 = var2906
			end
		end
		if var2897 == protoModule.wireTypes.lengthDelimited then
			if var2901 == 2 then
				local _ = nil
				local var2907, var2908 = protoModule.readBuffer(p142, var2896)
				var2896 = var2908
				var2895.action_params = t.OpenSocialProofUserListSheetAction_Params.decode(var2907)
			else
				local _ = nil
				local var2909, var2910 = protoModule.readVarInt(p142, var2896)
				var2896 = var2910 + var2909
			end
		elseif var2897 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2911, var2912 = protoModule.readFixed32(p142, var2896)
			local _ = var2911
			var2896 = var2912
		elseif var2897 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2913, var2914 = protoModule.readFixed64(p142, var2896)
			local _ = var2913
			var2896 = var2914
		else
			error("Unsupported wire type: " .. var4796)
		end
	end
	return var2895
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
	local var2915 = t_142.new()
	
	if self.action_type ~= nil then
		var2915.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2915.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2915.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2915.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.actionParams)
	end
	return var2915
end

t_142.descriptor = {
	name = "OpenSocialProofUserListSheetAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSocialProofUserListSheetAction"
}
t.OpenSocialProofUserListSheetAction = t_142
typeRegistryModule.default:register(t.OpenSocialProofUserListSheetAction)
local t_143 = {}
t_143.__index = t_143

function t_143.new(p143)
	-- upvalues: t_143 (ref)
	return setmetatable({
		universe_id = if p143 == nil or p143.universe_id == nil then nil else p143.universe_id,
		place_id = if p143 == nil or p143.place_id == nil then nil else p143.place_id,
		total_connections = if p143 == nil or p143.total_connections == nil then nil else p143.total_connections,
		user_ids = if p143 == nil or p143.user_ids == nil then nil else p143.user_ids,
		sheet_title = if p143 == nil or p143.sheet_title == nil then nil else p143.sheet_title
	}, t_143)
end

function t_143:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2915 = 0
	
	if self.universe_id ~= nil then
		local var2916 = self.universe_id:encode()
		local var2917, var2918 = protoModule.writeTag(buff, var2915, 1, protoModule.wireTypes.lengthDelimited)
		var2917, var4820 = protoModule.writeBuffer(var2917, var2918, var2916, buffer.len(var2916))
		buff = var2917
		var2915 = var2918
	end
	if self.place_id ~= nil then
		local var2919 = self.place_id:encode()
		local var2920, var2921 = protoModule.writeTag(buff, var2915, 2, protoModule.wireTypes.lengthDelimited)
		var2920, var4823 = protoModule.writeBuffer(var2920, var2921, var2919, buffer.len(var2919))
		buff = var2920
		var2915 = var2921
	end
	if self.total_connections ~= nil then
		local var2922 = self.total_connections:encode()
		local var2923, var2924 = protoModule.writeTag(buff, var2915, 3, protoModule.wireTypes.lengthDelimited)
		var2923, var4826 = protoModule.writeBuffer(var2923, var2924, var2922, buffer.len(var2922))
		buff = var2923
		var2915 = var2924
	end
	if self.user_ids ~= nil then
		local var2925 = self.user_ids:encode()
		local var2926, var2927 = protoModule.writeTag(buff, var2915, 4, protoModule.wireTypes.lengthDelimited)
		var2926, var4829 = protoModule.writeBuffer(var2926, var2927, var2925, buffer.len(var2925))
		buff = var2926
		var2915 = var2927
	end
	if self.sheet_title ~= nil then
		local var2928 = self.sheet_title:encode()
		local var2929, var2930 = protoModule.writeTag(buff, var2915, 5, protoModule.wireTypes.lengthDelimited)
		var2929, var4832 = protoModule.writeBuffer(var2929, var2930, var2928, buffer.len(var2928))
		buff = var2929
		var2915 = var2930
	end
	local buff_1 = buffer.create(var2915)
	buffer.copy(buff_1, 0, buff, 0, var2915)
	
	return buff_1
end

function t_143.decode(p143)
	-- upvalues: t_143 (ref), protoModule (ref), propTypesModule (ref)
	local var2915 = t_143.new()
	local var2916 = 0
	while var2916 < buffer.len(p143) do
		local _ = nil
		local var2917 = nil
		local var2918, var2919, var2920 = protoModule.readTag(p143, var2916)
		local var2921 = var2918
		var2917 = var2919
		var2916 = var2920
		
		if var2917 == protoModule.wireTypes.varint then
			local _ = nil
			local var2922, var2923 = protoModule.readVarInt(p143, var2916)
			local _ = var2922
			var2916 = var2923
			continue
		end
		if var2917 == protoModule.wireTypes.lengthDelimited then
			if var2921 == 1 then
				local _ = nil
				local var2924, var2925 = protoModule.readBuffer(p143, var2916)
				var2916 = var2925
				var2915.universe_id = propTypesModule.StringProp.decode(var2924)
			elseif var2921 == 2 then
				local _ = nil
				local var2926, var2927 = protoModule.readBuffer(p143, var2916)
				var2916 = var2927
				var2915.place_id = propTypesModule.StringProp.decode(var2926)
			elseif var2921 == 3 then
				local _ = nil
				local var2928, var2929 = protoModule.readBuffer(p143, var2916)
				var2916 = var2929
				var2915.total_connections = propTypesModule.Int32Prop.decode(var2928)
			elseif var2921 == 4 then
				local _ = nil
				local var2930, var2931 = protoModule.readBuffer(p143, var2916)
				var2916 = var2931
				var2915.user_ids = propTypesModule.ArrayOfAvatarProp.decode(var2930)
			elseif var2921 == 5 then
				local _ = nil
				local var2932, var2933 = protoModule.readBuffer(p143, var2916)
				var2916 = var2933
				var2915.sheet_title = propTypesModule.StringProp.decode(var2932)
			else
				local _ = nil
				local var2934, var2935 = protoModule.readVarInt(p143, var2916)
				var2916 = var2935 + var2934
			end
		elseif var2917 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2936, var2937 = protoModule.readFixed32(p143, var2916)
			local _ = var2936
			var2916 = var2937
		elseif var2917 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2938, var2939 = protoModule.readFixed64(p143, var2916)
			local _ = var2938
			var2916 = var2939
		else
			error("Unsupported wire type: " .. var4836)
		end
	end
	return var2915
end

function t_143:jsonEncode()
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

function t_143:jsonDecode()
	-- upvalues: t_143 (ref), propTypesModule (ref)
	local var2940 = t_143.new()
	
	if self.universe_id ~= nil then
		var2940.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2940.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var2940.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var2940.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.total_connections ~= nil then
		var2940.total_connections = propTypesModule.Int32Prop.jsonDecode(self.total_connections)
	end
	if self.totalConnections ~= nil then
		var2940.total_connections = propTypesModule.Int32Prop.jsonDecode(self.totalConnections)
	end
	if self.user_ids ~= nil then
		var2940.user_ids = propTypesModule.ArrayOfAvatarProp.jsonDecode(self.user_ids)
	end
	if self.userIds ~= nil then
		var2940.user_ids = propTypesModule.ArrayOfAvatarProp.jsonDecode(self.userIds)
	end
	if self.sheet_title ~= nil then
		var2940.sheet_title = propTypesModule.StringProp.jsonDecode(self.sheet_title)
	end
	if self.sheetTitle ~= nil then
		var2940.sheet_title = propTypesModule.StringProp.jsonDecode(self.sheetTitle)
	end
	return var2940
end

t_143.descriptor = {
	name = "OpenSocialProofUserListSheetAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSocialProofUserListSheetAction_Params = t_143
typeRegistryModule.default:register(t.OpenSocialProofUserListSheetAction_Params)
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
	local var2940 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2941, var2942 = protoModule.writeTag(buff, var2940, 1, protoModule.wireTypes.varint)
		var2941, var4864 = protoModule.writeVarInt(var2941, var2942, t.ActionType.toNumber(self.action_type))
		buff = var2941
		var2940 = var2942
	end
	if self.action_params ~= nil then
		local var2943 = self.action_params:encode()
		local var2944, var2945 = protoModule.writeTag(buff, var2940, 2, protoModule.wireTypes.lengthDelimited)
		var2944, var4867 = protoModule.writeBuffer(var2944, var2945, var2943, buffer.len(var2943))
		buff = var2944
		var2940 = var2945
	end
	local buff_1 = buffer.create(var2940)
	buffer.copy(buff_1, 0, buff, 0, var2940)
	
	return buff_1
end

function t_144.decode(p144)
	-- upvalues: t_144 (ref), protoModule (ref), t (ref)
	local var2940 = t_144.new()
	local var2941 = 0
	while var2941 < buffer.len(p144) do
		local _ = nil
		local var2942 = nil
		local var2943, var2944, var2945 = protoModule.readTag(p144, var2941)
		local var2946 = var2943
		var2942 = var2944
		var2941 = var2945
		
		if var2942 == protoModule.wireTypes.varint then
			if var2946 == 1 then
				local _ = nil
				local var2947, var2948 = protoModule.readVarIntI32(p144, var2941)
				local var2949 = var2947
				var2941 = var2948
				var2940.action_type = t.ActionType.fromNumber(var2949) or var2949
			else
				local _ = nil
				local var2950, var2951 = protoModule.readVarInt(p144, var2941)
				local _ = var2950
				var2941 = var2951
			end
		end
		if var2942 == protoModule.wireTypes.lengthDelimited then
			if var2946 == 2 then
				local _ = nil
				local var2952, var2953 = protoModule.readBuffer(p144, var2941)
				var2941 = var2953
				var2940.action_params = t.OpenSearchResultsTabAction_Params.decode(var2952)
			else
				local _ = nil
				local var2954, var2955 = protoModule.readVarInt(p144, var2941)
				var2941 = var2955 + var2954
			end
		elseif var2942 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2956, var2957 = protoModule.readFixed32(p144, var2941)
			local _ = var2956
			var2941 = var2957
		elseif var2942 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2958, var2959 = protoModule.readFixed64(p144, var2941)
			local _ = var2958
			var2941 = var2959
		else
			error("Unsupported wire type: " .. var4871)
		end
	end
	return var2940
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
	local var2960 = t_144.new()
	
	if self.action_type ~= nil then
		var2960.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2960.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2960.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2960.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.actionParams)
	end
	return var2960
end

t_144.descriptor = {
	name = "OpenSearchResultsTabAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSearchResultsTabAction"
}
t.OpenSearchResultsTabAction = t_144
typeRegistryModule.default:register(t.OpenSearchResultsTabAction)
local t_145 = {}
t_145.__index = t_145

function t_145.new(p145)
	-- upvalues: t_145 (ref)
	return setmetatable({
		search_type = if p145 == nil or p145.search_type == nil then nil else p145.search_type
	}, t_145)
end

function t_145:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2960 = 0
	
	if self.search_type ~= nil then
		local var2961 = self.search_type:encode()
		local var2962, var2963 = protoModule.writeTag(buff, var2960, 1, protoModule.wireTypes.lengthDelimited)
		var2962, var4895 = protoModule.writeBuffer(var2962, var2963, var2961, buffer.len(var2961))
		buff = var2962
		var2960 = var2963
	end
	local buff_1 = buffer.create(var2960)
	buffer.copy(buff_1, 0, buff, 0, var2960)
	
	return buff_1
end

function t_145.decode(p145)
	-- upvalues: t_145 (ref), protoModule (ref), propTypesModule (ref)
	local var2960 = t_145.new()
	local var2961 = 0
	while var2961 < buffer.len(p145) do
		local _ = nil
		local var2962 = nil
		local var2963, var2964, var2965 = protoModule.readTag(p145, var2961)
		local var2966 = var2963
		var2962 = var2964
		var2961 = var2965
		
		if var2962 == protoModule.wireTypes.varint then
			local _ = nil
			local var2967, var2968 = protoModule.readVarInt(p145, var2961)
			local _ = var2967
			var2961 = var2968
			continue
		end
		if var2962 == protoModule.wireTypes.lengthDelimited then
			if var2966 == 1 then
				local _ = nil
				local var2969, var2970 = protoModule.readBuffer(p145, var2961)
				var2961 = var2970
				var2960.search_type = propTypesModule.StringProp.decode(var2969)
			else
				local _ = nil
				local var2971, var2972 = protoModule.readVarInt(p145, var2961)
				var2961 = var2972 + var2971
			end
		elseif var2962 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2973, var2974 = protoModule.readFixed32(p145, var2961)
			local _ = var2973
			var2961 = var2974
		elseif var2962 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2975, var2976 = protoModule.readFixed64(p145, var2961)
			local _ = var2975
			var2961 = var2976
		else
			error("Unsupported wire type: " .. var4899)
		end
	end
	return var2960
end

function t_145:jsonEncode()
	local t = {}
	
	if self.search_type ~= nil then
		t.searchType = self.search_type:jsonEncode()
	end
	return t
end

function t_145:jsonDecode()
	-- upvalues: t_145 (ref), propTypesModule (ref)
	local var2977 = t_145.new()
	
	if self.search_type ~= nil then
		var2977.search_type = propTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		var2977.search_type = propTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return var2977
end

t_145.descriptor = {
	name = "OpenSearchResultsTabAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSearchResultsTabAction_Params = t_145
typeRegistryModule.default:register(t.OpenSearchResultsTabAction_Params)
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
	local var2977 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2978, var2979 = protoModule.writeTag(buff, var2977, 1, protoModule.wireTypes.varint)
		var2978, var4919 = protoModule.writeVarInt(var2978, var2979, t.ActionType.toNumber(self.action_type))
		buff = var2978
		var2977 = var2979
	end
	if self.action_params ~= nil then
		local var2980 = self.action_params:encode()
		local var2981, var2982 = protoModule.writeTag(buff, var2977, 2, protoModule.wireTypes.lengthDelimited)
		var2981, var4922 = protoModule.writeBuffer(var2981, var2982, var2980, buffer.len(var2980))
		buff = var2981
		var2977 = var2982
	end
	local buff_1 = buffer.create(var2977)
	buffer.copy(buff_1, 0, buff, 0, var2977)
	
	return buff_1
end

function t_146.decode(p146)
	-- upvalues: t_146 (ref), protoModule (ref), t (ref)
	local var2977 = t_146.new()
	local var2978 = 0
	while var2978 < buffer.len(p146) do
		local _ = nil
		local var2979 = nil
		local var2980, var2981, var2982 = protoModule.readTag(p146, var2978)
		local var2983 = var2980
		var2979 = var2981
		var2978 = var2982
		
		if var2979 == protoModule.wireTypes.varint then
			if var2983 == 1 then
				local _ = nil
				local var2984, var2985 = protoModule.readVarIntI32(p146, var2978)
				local var2986 = var2984
				var2978 = var2985
				var2977.action_type = t.ActionType.fromNumber(var2986) or var2986
			else
				local _ = nil
				local var2987, var2988 = protoModule.readVarInt(p146, var2978)
				local _ = var2987
				var2978 = var2988
			end
		end
		if var2979 == protoModule.wireTypes.lengthDelimited then
			if var2983 == 2 then
				local _ = nil
				local var2989, var2990 = protoModule.readBuffer(p146, var2978)
				var2978 = var2990
				var2977.action_params = t.DismissPromptAction_Params.decode(var2989)
			else
				local _ = nil
				local var2991, var2992 = protoModule.readVarInt(p146, var2978)
				var2978 = var2992 + var2991
			end
		elseif var2979 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2993, var2994 = protoModule.readFixed32(p146, var2978)
			local _ = var2993
			var2978 = var2994
		elseif var2979 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2995, var2996 = protoModule.readFixed64(p146, var2978)
			local _ = var2995
			var2978 = var2996
		else
			error("Unsupported wire type: " .. var4926)
		end
	end
	return var2977
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
	local var2997 = t_146.new()
	
	if self.action_type ~= nil then
		var2997.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2997.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2997.action_params = t.DismissPromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2997.action_params = t.DismissPromptAction_Params.jsonDecode(self.actionParams)
	end
	return var2997
end

t_146.descriptor = {
	name = "DismissPromptAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissPromptAction"
}
t.DismissPromptAction = t_146
typeRegistryModule.default:register(t.DismissPromptAction)
local t_147 = {}
t_147.__index = t_147

function t_147.new(p147)
	-- upvalues: t_147 (ref)
	return setmetatable({
		prompt_type = if p147 == nil or p147.prompt_type == nil then nil else p147.prompt_type,
		prompt_id = if p147 == nil or p147.prompt_id == nil then nil else p147.prompt_id,
		entity_type = if p147 == nil or p147.entity_type == nil then nil else p147.entity_type,
		entity_id = if p147 == nil or p147.entity_id == nil then nil else p147.entity_id
	}, t_147)
end

function t_147:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2997 = 0
	
	if self.prompt_type ~= nil then
		local var2998 = self.prompt_type:encode()
		local var2999, var3000 = protoModule.writeTag(buff, var2997, 1, protoModule.wireTypes.lengthDelimited)
		var2999, var4950 = protoModule.writeBuffer(var2999, var3000, var2998, buffer.len(var2998))
		buff = var2999
		var2997 = var3000
	end
	if self.prompt_id ~= nil then
		local var3001 = self.prompt_id:encode()
		local var3002, var3003 = protoModule.writeTag(buff, var2997, 2, protoModule.wireTypes.lengthDelimited)
		var3002, var4953 = protoModule.writeBuffer(var3002, var3003, var3001, buffer.len(var3001))
		buff = var3002
		var2997 = var3003
	end
	if self.entity_type ~= nil then
		local var3004 = self.entity_type:encode()
		local var3005, var3006 = protoModule.writeTag(buff, var2997, 3, protoModule.wireTypes.lengthDelimited)
		var3005, var4956 = protoModule.writeBuffer(var3005, var3006, var3004, buffer.len(var3004))
		buff = var3005
		var2997 = var3006
	end
	if self.entity_id ~= nil then
		local var3007 = self.entity_id:encode()
		local var3008, var3009 = protoModule.writeTag(buff, var2997, 4, protoModule.wireTypes.lengthDelimited)
		var3008, var4959 = protoModule.writeBuffer(var3008, var3009, var3007, buffer.len(var3007))
		buff = var3008
		var2997 = var3009
	end
	local buff_1 = buffer.create(var2997)
	buffer.copy(buff_1, 0, buff, 0, var2997)
	
	return buff_1
end

function t_147.decode(p147)
	-- upvalues: t_147 (ref), protoModule (ref), propTypesModule (ref)
	local var2997 = t_147.new()
	local var2998 = 0
	while var2998 < buffer.len(p147) do
		local _ = nil
		local var2999 = nil
		local var3000, var3001, var3002 = protoModule.readTag(p147, var2998)
		local var3003 = var3000
		var2999 = var3001
		var2998 = var3002
		
		if var2999 == protoModule.wireTypes.varint then
			local _ = nil
			local var3004, var3005 = protoModule.readVarInt(p147, var2998)
			local _ = var3004
			var2998 = var3005
			continue
		end
		if var2999 == protoModule.wireTypes.lengthDelimited then
			if var3003 == 1 then
				local _ = nil
				local var3006, var3007 = protoModule.readBuffer(p147, var2998)
				var2998 = var3007
				var2997.prompt_type = propTypesModule.StringProp.decode(var3006)
			elseif var3003 == 2 then
				local _ = nil
				local var3008, var3009 = protoModule.readBuffer(p147, var2998)
				var2998 = var3009
				var2997.prompt_id = propTypesModule.StringProp.decode(var3008)
			elseif var3003 == 3 then
				local _ = nil
				local var3010, var3011 = protoModule.readBuffer(p147, var2998)
				var2998 = var3011
				var2997.entity_type = propTypesModule.StringProp.decode(var3010)
			elseif var3003 == 4 then
				local _ = nil
				local var3012, var3013 = protoModule.readBuffer(p147, var2998)
				var2998 = var3013
				var2997.entity_id = propTypesModule.StringProp.decode(var3012)
			else
				local _ = nil
				local var3014, var3015 = protoModule.readVarInt(p147, var2998)
				var2998 = var3015 + var3014
			end
		elseif var2999 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3016, var3017 = protoModule.readFixed32(p147, var2998)
			local _ = var3016
			var2998 = var3017
		elseif var2999 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3018, var3019 = protoModule.readFixed64(p147, var2998)
			local _ = var3018
			var2998 = var3019
		else
			error("Unsupported wire type: " .. var4963)
		end
	end
	return var2997
end

function t_147:jsonEncode()
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

function t_147:jsonDecode()
	-- upvalues: t_147 (ref), propTypesModule (ref)
	local var3020 = t_147.new()
	
	if self.prompt_type ~= nil then
		var3020.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var3020.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var3020.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var3020.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.entity_type ~= nil then
		var3020.entity_type = propTypesModule.StringProp.jsonDecode(self.entity_type)
	end
	if self.entityType ~= nil then
		var3020.entity_type = propTypesModule.StringProp.jsonDecode(self.entityType)
	end
	if self.entity_id ~= nil then
		var3020.entity_id = propTypesModule.StringProp.jsonDecode(self.entity_id)
	end
	if self.entityId ~= nil then
		var3020.entity_id = propTypesModule.StringProp.jsonDecode(self.entityId)
	end
	return var3020
end

t_147.descriptor = {
	name = "DismissPromptAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissPromptAction_Params = t_147
typeRegistryModule.default:register(t.DismissPromptAction_Params)
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
	local var3020 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3021, var3022 = protoModule.writeTag(buff, var3020, 1, protoModule.wireTypes.varint)
		var3021, var4989 = protoModule.writeVarInt(var3021, var3022, t.ActionType.toNumber(self.action_type))
		buff = var3021
		var3020 = var3022
	end
	if self.action_params ~= nil then
		local var3023 = self.action_params:encode()
		local var3024, var3025 = protoModule.writeTag(buff, var3020, 2, protoModule.wireTypes.lengthDelimited)
		var3024, var4992 = protoModule.writeBuffer(var3024, var3025, var3023, buffer.len(var3023))
		buff = var3024
		var3020 = var3025
	end
	local buff_1 = buffer.create(var3020)
	buffer.copy(buff_1, 0, buff, 0, var3020)
	
	return buff_1
end

function t_148.decode(p148)
	-- upvalues: t_148 (ref), protoModule (ref), t (ref)
	local var3020 = t_148.new()
	local var3021 = 0
	while var3021 < buffer.len(p148) do
		local _ = nil
		local var3022 = nil
		local var3023, var3024, var3025 = protoModule.readTag(p148, var3021)
		local var3026 = var3023
		var3022 = var3024
		var3021 = var3025
		
		if var3022 == protoModule.wireTypes.varint then
			if var3026 == 1 then
				local _ = nil
				local var3027, var3028 = protoModule.readVarIntI32(p148, var3021)
				local var3029 = var3027
				var3021 = var3028
				var3020.action_type = t.ActionType.fromNumber(var3029) or var3029
			else
				local _ = nil
				local var3030, var3031 = protoModule.readVarInt(p148, var3021)
				local _ = var3030
				var3021 = var3031
			end
		end
		if var3022 == protoModule.wireTypes.lengthDelimited then
			if var3026 == 2 then
				local _ = nil
				local var3032, var3033 = protoModule.readBuffer(p148, var3021)
				var3021 = var3033
				var3020.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.decode(var3032)
			else
				local _ = nil
				local var3034, var3035 = protoModule.readVarInt(p148, var3021)
				var3021 = var3035 + var3034
			end
		elseif var3022 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3036, var3037 = protoModule.readFixed32(p148, var3021)
			local _ = var3036
			var3021 = var3037
		elseif var3022 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3038, var3039 = protoModule.readFixed64(p148, var3021)
			local _ = var3038
			var3021 = var3039
		else
			error("Unsupported wire type: " .. var4996)
		end
	end
	return var3020
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
	local var3040 = t_148.new()
	
	if self.action_type ~= nil then
		var3040.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3040.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3040.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3040.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.actionParams)
	end
	return var3040
end

t_148.descriptor = {
	name = "RecordPartyChatConversationUpsellAcknowledgementAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecordPartyChatConversationUpsellAcknowledgementAction"
}
t.RecordPartyChatConversationUpsellAcknowledgementAction = t_148
typeRegistryModule.default:register(t.RecordPartyChatConversationUpsellAcknowledgementAction)
local t_149 = {}
t_149.__index = t_149

function t_149.new(p149)
	-- upvalues: t_149 (ref)
	return setmetatable({
		modal_action = if p149 == nil or p149.modal_action == nil then nil else p149.modal_action,
		modal_variant = if p149 == nil or p149.modal_variant == nil then nil else p149.modal_variant,
		modal_sequence = if p149 == nil or p149.modal_sequence == nil then nil else p149.modal_sequence,
		conversation_id = if p149 == nil or p149.conversation_id == nil then nil else p149.conversation_id,
		friend_id = if p149 == nil or p149.friend_id == nil then nil else p149.friend_id
	}, t_149)
end

function t_149:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3040 = 0
	
	if self.modal_action ~= nil then
		local var3041 = self.modal_action:encode()
		local var3042, var3043 = protoModule.writeTag(buff, var3040, 1, protoModule.wireTypes.lengthDelimited)
		var3042, var5020 = protoModule.writeBuffer(var3042, var3043, var3041, buffer.len(var3041))
		buff = var3042
		var3040 = var3043
	end
	if self.modal_variant ~= nil then
		local var3044 = self.modal_variant:encode()
		local var3045, var3046 = protoModule.writeTag(buff, var3040, 2, protoModule.wireTypes.lengthDelimited)
		var3045, var5023 = protoModule.writeBuffer(var3045, var3046, var3044, buffer.len(var3044))
		buff = var3045
		var3040 = var3046
	end
	if self.modal_sequence ~= nil then
		local var3047 = self.modal_sequence:encode()
		local var3048, var3049 = protoModule.writeTag(buff, var3040, 3, protoModule.wireTypes.lengthDelimited)
		var3048, var5026 = protoModule.writeBuffer(var3048, var3049, var3047, buffer.len(var3047))
		buff = var3048
		var3040 = var3049
	end
	if self.conversation_id ~= nil then
		local var3050 = self.conversation_id:encode()
		local var3051, var3052 = protoModule.writeTag(buff, var3040, 4, protoModule.wireTypes.lengthDelimited)
		var3051, var5029 = protoModule.writeBuffer(var3051, var3052, var3050, buffer.len(var3050))
		buff = var3051
		var3040 = var3052
	end
	if self.friend_id ~= nil then
		local var3053 = self.friend_id:encode()
		local var3054, var3055 = protoModule.writeTag(buff, var3040, 5, protoModule.wireTypes.lengthDelimited)
		var3054, var5032 = protoModule.writeBuffer(var3054, var3055, var3053, buffer.len(var3053))
		buff = var3054
		var3040 = var3055
	end
	local buff_1 = buffer.create(var3040)
	buffer.copy(buff_1, 0, buff, 0, var3040)
	
	return buff_1
end

function t_149.decode(p149)
	-- upvalues: t_149 (ref), protoModule (ref), propTypesModule (ref)
	local var3040 = t_149.new()
	local var3041 = 0
	while var3041 < buffer.len(p149) do
		local _ = nil
		local var3042 = nil
		local var3043, var3044, var3045 = protoModule.readTag(p149, var3041)
		local var3046 = var3043
		var3042 = var3044
		var3041 = var3045
		
		if var3042 == protoModule.wireTypes.varint then
			local _ = nil
			local var3047, var3048 = protoModule.readVarInt(p149, var3041)
			local _ = var3047
			var3041 = var3048
			continue
		end
		if var3042 == protoModule.wireTypes.lengthDelimited then
			if var3046 == 1 then
				local _ = nil
				local var3049, var3050 = protoModule.readBuffer(p149, var3041)
				var3041 = var3050
				var3040.modal_action = propTypesModule.StringProp.decode(var3049)
			elseif var3046 == 2 then
				local _ = nil
				local var3051, var3052 = protoModule.readBuffer(p149, var3041)
				var3041 = var3052
				var3040.modal_variant = propTypesModule.StringProp.decode(var3051)
			elseif var3046 == 3 then
				local _ = nil
				local var3053, var3054 = protoModule.readBuffer(p149, var3041)
				var3041 = var3054
				var3040.modal_sequence = propTypesModule.StringProp.decode(var3053)
			elseif var3046 == 4 then
				local _ = nil
				local var3055, var3056 = protoModule.readBuffer(p149, var3041)
				var3041 = var3056
				var3040.conversation_id = propTypesModule.StringProp.decode(var3055)
			elseif var3046 == 5 then
				local _ = nil
				local var3057, var3058 = protoModule.readBuffer(p149, var3041)
				var3041 = var3058
				var3040.friend_id = propTypesModule.StringProp.decode(var3057)
			else
				local _ = nil
				local var3059, var3060 = protoModule.readVarInt(p149, var3041)
				var3041 = var3060 + var3059
			end
		elseif var3042 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3061, var3062 = protoModule.readFixed32(p149, var3041)
			local _ = var3061
			var3041 = var3062
		elseif var3042 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3063, var3064 = protoModule.readFixed64(p149, var3041)
			local _ = var3063
			var3041 = var3064
		else
			error("Unsupported wire type: " .. var5036)
		end
	end
	return var3040
end

function t_149:jsonEncode()
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

function t_149:jsonDecode()
	-- upvalues: t_149 (ref), propTypesModule (ref)
	local var3065 = t_149.new()
	
	if self.modal_action ~= nil then
		var3065.modal_action = propTypesModule.StringProp.jsonDecode(self.modal_action)
	end
	if self.modalAction ~= nil then
		var3065.modal_action = propTypesModule.StringProp.jsonDecode(self.modalAction)
	end
	if self.modal_variant ~= nil then
		var3065.modal_variant = propTypesModule.StringProp.jsonDecode(self.modal_variant)
	end
	if self.modalVariant ~= nil then
		var3065.modal_variant = propTypesModule.StringProp.jsonDecode(self.modalVariant)
	end
	if self.modal_sequence ~= nil then
		var3065.modal_sequence = propTypesModule.StringProp.jsonDecode(self.modal_sequence)
	end
	if self.modalSequence ~= nil then
		var3065.modal_sequence = propTypesModule.StringProp.jsonDecode(self.modalSequence)
	end
	if self.conversation_id ~= nil then
		var3065.conversation_id = propTypesModule.StringProp.jsonDecode(self.conversation_id)
	end
	if self.conversationId ~= nil then
		var3065.conversation_id = propTypesModule.StringProp.jsonDecode(self.conversationId)
	end
	if self.friend_id ~= nil then
		var3065.friend_id = propTypesModule.StringProp.jsonDecode(self.friend_id)
	end
	if self.friendId ~= nil then
		var3065.friend_id = propTypesModule.StringProp.jsonDecode(self.friendId)
	end
	return var3065
end

t_149.descriptor = {
	name = "RecordPartyChatConversationUpsellAcknowledgementAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RecordPartyChatConversationUpsellAcknowledgementAction_Params = t_149
typeRegistryModule.default:register(t.RecordPartyChatConversationUpsellAcknowledgementAction_Params)
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
	local var3065 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3066, var3067 = protoModule.writeTag(buff, var3065, 1, protoModule.wireTypes.varint)
		var3066, var5064 = protoModule.writeVarInt(var3066, var3067, t.ActionType.toNumber(self.action_type))
		buff = var3066
		var3065 = var3067
	end
	if self.action_params ~= nil then
		local var3068 = self.action_params:encode()
		local var3069, var3070 = protoModule.writeTag(buff, var3065, 2, protoModule.wireTypes.lengthDelimited)
		var3069, var5067 = protoModule.writeBuffer(var3069, var3070, var3068, buffer.len(var3068))
		buff = var3069
		var3065 = var3070
	end
	local buff_1 = buffer.create(var3065)
	buffer.copy(buff_1, 0, buff, 0, var3065)
	
	return buff_1
end

function t_150.decode(p150)
	-- upvalues: t_150 (ref), protoModule (ref), t (ref)
	local var3065 = t_150.new()
	local var3066 = 0
	while var3066 < buffer.len(p150) do
		local _ = nil
		local var3067 = nil
		local var3068, var3069, var3070 = protoModule.readTag(p150, var3066)
		local var3071 = var3068
		var3067 = var3069
		var3066 = var3070
		
		if var3067 == protoModule.wireTypes.varint then
			if var3071 == 1 then
				local _ = nil
				local var3072, var3073 = protoModule.readVarIntI32(p150, var3066)
				local var3074 = var3072
				var3066 = var3073
				var3065.action_type = t.ActionType.fromNumber(var3074) or var3074
			else
				local _ = nil
				local var3075, var3076 = protoModule.readVarInt(p150, var3066)
				local _ = var3075
				var3066 = var3076
			end
		end
		if var3067 == protoModule.wireTypes.lengthDelimited then
			if var3071 == 2 then
				local _ = nil
				local var3077, var3078 = protoModule.readBuffer(p150, var3066)
				var3066 = var3078
				var3065.action_params = t.RequestFriendshipAction_Params.decode(var3077)
			else
				local _ = nil
				local var3079, var3080 = protoModule.readVarInt(p150, var3066)
				var3066 = var3080 + var3079
			end
		elseif var3067 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3081, var3082 = protoModule.readFixed32(p150, var3066)
			local _ = var3081
			var3066 = var3082
		elseif var3067 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3083, var3084 = protoModule.readFixed64(p150, var3066)
			local _ = var3083
			var3066 = var3084
		else
			error("Unsupported wire type: " .. var5071)
		end
	end
	return var3065
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
	local var3085 = t_150.new()
	
	if self.action_type ~= nil then
		var3085.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3085.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3085.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3085.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.actionParams)
	end
	return var3085
end

t_150.descriptor = {
	name = "RequestFriendshipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RequestFriendshipAction"
}
t.RequestFriendshipAction = t_150
typeRegistryModule.default:register(t.RequestFriendshipAction)
local t_151 = {}
t_151.__index = t_151

function t_151.new(p151)
	-- upvalues: t_151 (ref)
	return setmetatable({
		target_user_id = if p151 == nil or p151.target_user_id == nil then nil else p151.target_user_id,
		source = if p151 == nil or p151.source == nil then nil else p151.source
	}, t_151)
end

function t_151:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3085 = 0
	
	if self.target_user_id ~= nil then
		local var3086 = self.target_user_id:encode()
		local var3087, var3088 = protoModule.writeTag(buff, var3085, 1, protoModule.wireTypes.lengthDelimited)
		var3087, var5095 = protoModule.writeBuffer(var3087, var3088, var3086, buffer.len(var3086))
		buff = var3087
		var3085 = var3088
	end
	if self.source ~= nil then
		local var3089 = self.source:encode()
		local var3090, var3091 = protoModule.writeTag(buff, var3085, 2, protoModule.wireTypes.lengthDelimited)
		var3090, var5098 = protoModule.writeBuffer(var3090, var3091, var3089, buffer.len(var3089))
		buff = var3090
		var3085 = var3091
	end
	local buff_1 = buffer.create(var3085)
	buffer.copy(buff_1, 0, buff, 0, var3085)
	
	return buff_1
end

function t_151.decode(p151)
	-- upvalues: t_151 (ref), protoModule (ref), propTypesModule (ref)
	local var3085 = t_151.new()
	local var3086 = 0
	while var3086 < buffer.len(p151) do
		local _ = nil
		local var3087 = nil
		local var3088, var3089, var3090 = protoModule.readTag(p151, var3086)
		local var3091 = var3088
		var3087 = var3089
		var3086 = var3090
		
		if var3087 == protoModule.wireTypes.varint then
			local _ = nil
			local var3092, var3093 = protoModule.readVarInt(p151, var3086)
			local _ = var3092
			var3086 = var3093
			continue
		end
		if var3087 == protoModule.wireTypes.lengthDelimited then
			if var3091 == 1 then
				local _ = nil
				local var3094, var3095 = protoModule.readBuffer(p151, var3086)
				var3086 = var3095
				var3085.target_user_id = propTypesModule.StringProp.decode(var3094)
			elseif var3091 == 2 then
				local _ = nil
				local var3096, var3097 = protoModule.readBuffer(p151, var3086)
				var3086 = var3097
				var3085.source = propTypesModule.StringProp.decode(var3096)
			else
				local _ = nil
				local var3098, var3099 = protoModule.readVarInt(p151, var3086)
				var3086 = var3099 + var3098
			end
		elseif var3087 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3100, var3101 = protoModule.readFixed32(p151, var3086)
			local _ = var3100
			var3086 = var3101
		elseif var3087 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3102, var3103 = protoModule.readFixed64(p151, var3086)
			local _ = var3102
			var3086 = var3103
		else
			error("Unsupported wire type: " .. var5102)
		end
	end
	return var3085
end

function t_151:jsonEncode()
	local t = {}
	
	if self.target_user_id ~= nil then
		t.targetUserId = self.target_user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_151:jsonDecode()
	-- upvalues: t_151 (ref), propTypesModule (ref)
	local var3104 = t_151.new()
	
	if self.target_user_id ~= nil then
		var3104.target_user_id = propTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		var3104.target_user_id = propTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	if self.source ~= nil then
		var3104.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var3104
end

t_151.descriptor = {
	name = "RequestFriendshipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RequestFriendshipAction_Params = t_151
typeRegistryModule.default:register(t.RequestFriendshipAction_Params)
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
	local var3104 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3105, var3106 = protoModule.writeTag(buff, var3104, 1, protoModule.wireTypes.varint)
		var3105, var5124 = protoModule.writeVarInt(var3105, var3106, t.ActionType.toNumber(self.action_type))
		buff = var3105
		var3104 = var3106
	end
	if self.action_params ~= nil then
		local var3107 = self.action_params:encode()
		local var3108, var3109 = protoModule.writeTag(buff, var3104, 2, protoModule.wireTypes.lengthDelimited)
		var3108, var5127 = protoModule.writeBuffer(var3108, var3109, var3107, buffer.len(var3107))
		buff = var3108
		var3104 = var3109
	end
	local buff_1 = buffer.create(var3104)
	buffer.copy(buff_1, 0, buff, 0, var3104)
	
	return buff_1
end

function t_152.decode(p152)
	-- upvalues: t_152 (ref), protoModule (ref), t (ref)
	local var3104 = t_152.new()
	local var3105 = 0
	while var3105 < buffer.len(p152) do
		local _ = nil
		local var3106 = nil
		local var3107, var3108, var3109 = protoModule.readTag(p152, var3105)
		local var3110 = var3107
		var3106 = var3108
		var3105 = var3109
		
		if var3106 == protoModule.wireTypes.varint then
			if var3110 == 1 then
				local _ = nil
				local var3111, var3112 = protoModule.readVarIntI32(p152, var3105)
				local var3113 = var3111
				var3105 = var3112
				var3104.action_type = t.ActionType.fromNumber(var3113) or var3113
			else
				local _ = nil
				local var3114, var3115 = protoModule.readVarInt(p152, var3105)
				local _ = var3114
				var3105 = var3115
			end
		end
		if var3106 == protoModule.wireTypes.lengthDelimited then
			if var3110 == 2 then
				local _ = nil
				local var3116, var3117 = protoModule.readBuffer(p152, var3105)
				var3105 = var3117
				var3104.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.decode(var3116)
			else
				local _ = nil
				local var3118, var3119 = protoModule.readVarInt(p152, var3105)
				var3105 = var3119 + var3118
			end
		elseif var3106 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3120, var3121 = protoModule.readFixed32(p152, var3105)
			local _ = var3120
			var3105 = var3121
		elseif var3106 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3122, var3123 = protoModule.readFixed64(p152, var3105)
			local _ = var3122
			var3105 = var3123
		else
			error("Unsupported wire type: " .. var5131)
		end
	end
	return var3104
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
	local var3124 = t_152.new()
	
	if self.action_type ~= nil then
		var3124.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3124.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3124.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3124.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var3124
end

t_152.descriptor = {
	name = "OpenTrustedFriendsUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenTrustedFriendsUpsellModalAction"
}
t.OpenTrustedFriendsUpsellModalAction = t_152
typeRegistryModule.default:register(t.OpenTrustedFriendsUpsellModalAction)
local t_153 = {}
t_153.__index = t_153

function t_153.new(p153)
	-- upvalues: t_153 (ref)
	return setmetatable({
		target_user_id = if p153 == nil or p153.target_user_id == nil then nil else p153.target_user_id
	}, t_153)
end

function t_153:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3124 = 0
	
	if self.target_user_id ~= nil then
		local var3125 = self.target_user_id:encode()
		local var3126, var3127 = protoModule.writeTag(buff, var3124, 1, protoModule.wireTypes.lengthDelimited)
		var3126, var5155 = protoModule.writeBuffer(var3126, var3127, var3125, buffer.len(var3125))
		buff = var3126
		var3124 = var3127
	end
	local buff_1 = buffer.create(var3124)
	buffer.copy(buff_1, 0, buff, 0, var3124)
	
	return buff_1
end

function t_153.decode(p153)
	-- upvalues: t_153 (ref), protoModule (ref), propTypesModule (ref)
	local var3124 = t_153.new()
	local var3125 = 0
	while var3125 < buffer.len(p153) do
		local _ = nil
		local var3126 = nil
		local var3127, var3128, var3129 = protoModule.readTag(p153, var3125)
		local var3130 = var3127
		var3126 = var3128
		var3125 = var3129
		
		if var3126 == protoModule.wireTypes.varint then
			local _ = nil
			local var3131, var3132 = protoModule.readVarInt(p153, var3125)
			local _ = var3131
			var3125 = var3132
			continue
		end
		if var3126 == protoModule.wireTypes.lengthDelimited then
			if var3130 == 1 then
				local _ = nil
				local var3133, var3134 = protoModule.readBuffer(p153, var3125)
				var3125 = var3134
				var3124.target_user_id = propTypesModule.StringProp.decode(var3133)
			else
				local _ = nil
				local var3135, var3136 = protoModule.readVarInt(p153, var3125)
				var3125 = var3136 + var3135
			end
		elseif var3126 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3137, var3138 = protoModule.readFixed32(p153, var3125)
			local _ = var3137
			var3125 = var3138
		elseif var3126 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3139, var3140 = protoModule.readFixed64(p153, var3125)
			local _ = var3139
			var3125 = var3140
		else
			error("Unsupported wire type: " .. var5159)
		end
	end
	return var3124
end

function t_153:jsonEncode()
	local t = {}
	
	if self.target_user_id ~= nil then
		t.targetUserId = self.target_user_id:jsonEncode()
	end
	return t
end

function t_153:jsonDecode()
	-- upvalues: t_153 (ref), propTypesModule (ref)
	local var3141 = t_153.new()
	
	if self.target_user_id ~= nil then
		var3141.target_user_id = propTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		var3141.target_user_id = propTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	return var3141
end

t_153.descriptor = {
	name = "OpenTrustedFriendsUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenTrustedFriendsUpsellModalAction_Params = t_153
typeRegistryModule.default:register(t.OpenTrustedFriendsUpsellModalAction_Params)
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
	local var3141 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3142, var3143 = protoModule.writeTag(buff, var3141, 1, protoModule.wireTypes.varint)
		var3142, var5179 = protoModule.writeVarInt(var3142, var3143, t.ActionType.toNumber(self.action_type))
		buff = var3142
		var3141 = var3143
	end
	if self.action_params ~= nil then
		local var3144 = self.action_params:encode()
		local var3145, var3146 = protoModule.writeTag(buff, var3141, 2, protoModule.wireTypes.lengthDelimited)
		var3145, var5182 = protoModule.writeBuffer(var3145, var3146, var3144, buffer.len(var3144))
		buff = var3145
		var3141 = var3146
	end
	local buff_1 = buffer.create(var3141)
	buffer.copy(buff_1, 0, buff, 0, var3141)
	
	return buff_1
end

function t_154.decode(p154)
	-- upvalues: t_154 (ref), protoModule (ref), t (ref)
	local var3141 = t_154.new()
	local var3142 = 0
	while var3142 < buffer.len(p154) do
		local _ = nil
		local var3143 = nil
		local var3144, var3145, var3146 = protoModule.readTag(p154, var3142)
		local var3147 = var3144
		var3143 = var3145
		var3142 = var3146
		
		if var3143 == protoModule.wireTypes.varint then
			if var3147 == 1 then
				local _ = nil
				local var3148, var3149 = protoModule.readVarIntI32(p154, var3142)
				local var3150 = var3148
				var3142 = var3149
				var3141.action_type = t.ActionType.fromNumber(var3150) or var3150
			else
				local _ = nil
				local var3151, var3152 = protoModule.readVarInt(p154, var3142)
				local _ = var3151
				var3142 = var3152
			end
		end
		if var3143 == protoModule.wireTypes.lengthDelimited then
			if var3147 == 2 then
				local _ = nil
				local var3153, var3154 = protoModule.readBuffer(p154, var3142)
				var3142 = var3154
				var3141.action_params = t.OpenSearchResultsWithQueryAction_Params.decode(var3153)
			else
				local _ = nil
				local var3155, var3156 = protoModule.readVarInt(p154, var3142)
				var3142 = var3156 + var3155
			end
		elseif var3143 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3157, var3158 = protoModule.readFixed32(p154, var3142)
			local _ = var3157
			var3142 = var3158
		elseif var3143 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3159, var3160 = protoModule.readFixed64(p154, var3142)
			local _ = var3159
			var3142 = var3160
		else
			error("Unsupported wire type: " .. var5186)
		end
	end
	return var3141
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
	local var3161 = t_154.new()
	
	if self.action_type ~= nil then
		var3161.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3161.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3161.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3161.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.actionParams)
	end
	return var3161
end

t_154.descriptor = {
	name = "OpenSearchResultsWithQueryAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSearchResultsWithQueryAction"
}
t.OpenSearchResultsWithQueryAction = t_154
typeRegistryModule.default:register(t.OpenSearchResultsWithQueryAction)
local t_155 = {}
t_155.__index = t_155

function t_155.new(p155)
	-- upvalues: t_155 (ref)
	return setmetatable({
		search_query = if p155 == nil or p155.search_query == nil then nil else p155.search_query,
		search_type = if p155 == nil or p155.search_type == nil then nil else p155.search_type
	}, t_155)
end

function t_155:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3161 = 0
	
	if self.search_query ~= nil then
		local var3162 = self.search_query:encode()
		local var3163, var3164 = protoModule.writeTag(buff, var3161, 1, protoModule.wireTypes.lengthDelimited)
		var3163, var5210 = protoModule.writeBuffer(var3163, var3164, var3162, buffer.len(var3162))
		buff = var3163
		var3161 = var3164
	end
	if self.search_type ~= nil then
		local var3165 = self.search_type:encode()
		local var3166, var3167 = protoModule.writeTag(buff, var3161, 2, protoModule.wireTypes.lengthDelimited)
		var3166, var5213 = protoModule.writeBuffer(var3166, var3167, var3165, buffer.len(var3165))
		buff = var3166
		var3161 = var3167
	end
	local buff_1 = buffer.create(var3161)
	buffer.copy(buff_1, 0, buff, 0, var3161)
	
	return buff_1
end

function t_155.decode(p155)
	-- upvalues: t_155 (ref), protoModule (ref), propTypesModule (ref)
	local var3161 = t_155.new()
	local var3162 = 0
	while var3162 < buffer.len(p155) do
		local _ = nil
		local var3163 = nil
		local var3164, var3165, var3166 = protoModule.readTag(p155, var3162)
		local var3167 = var3164
		var3163 = var3165
		var3162 = var3166
		
		if var3163 == protoModule.wireTypes.varint then
			local _ = nil
			local var3168, var3169 = protoModule.readVarInt(p155, var3162)
			local _ = var3168
			var3162 = var3169
			continue
		end
		if var3163 == protoModule.wireTypes.lengthDelimited then
			if var3167 == 1 then
				local _ = nil
				local var3170, var3171 = protoModule.readBuffer(p155, var3162)
				var3162 = var3171
				var3161.search_query = propTypesModule.StringProp.decode(var3170)
			elseif var3167 == 2 then
				local _ = nil
				local var3172, var3173 = protoModule.readBuffer(p155, var3162)
				var3162 = var3173
				var3161.search_type = propTypesModule.StringProp.decode(var3172)
			else
				local _ = nil
				local var3174, var3175 = protoModule.readVarInt(p155, var3162)
				var3162 = var3175 + var3174
			end
		elseif var3163 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3176, var3177 = protoModule.readFixed32(p155, var3162)
			local _ = var3176
			var3162 = var3177
		elseif var3163 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3178, var3179 = protoModule.readFixed64(p155, var3162)
			local _ = var3178
			var3162 = var3179
		else
			error("Unsupported wire type: " .. var5217)
		end
	end
	return var3161
end

function t_155:jsonEncode()
	local t = {}
	
	if self.search_query ~= nil then
		t.searchQuery = self.search_query:jsonEncode()
	end
	if self.search_type ~= nil then
		t.searchType = self.search_type:jsonEncode()
	end
	return t
end

function t_155:jsonDecode()
	-- upvalues: t_155 (ref), propTypesModule (ref)
	local var3180 = t_155.new()
	
	if self.search_query ~= nil then
		var3180.search_query = propTypesModule.StringProp.jsonDecode(self.search_query)
	end
	if self.searchQuery ~= nil then
		var3180.search_query = propTypesModule.StringProp.jsonDecode(self.searchQuery)
	end
	if self.search_type ~= nil then
		var3180.search_type = propTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		var3180.search_type = propTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return var3180
end

t_155.descriptor = {
	name = "OpenSearchResultsWithQueryAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSearchResultsWithQueryAction_Params = t_155
typeRegistryModule.default:register(t.OpenSearchResultsWithQueryAction_Params)
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
	local var3180 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3181, var3182 = protoModule.writeTag(buff, var3180, 1, protoModule.wireTypes.varint)
		var3181, var5239 = protoModule.writeVarInt(var3181, var3182, t.ActionType.toNumber(self.action_type))
		buff = var3181
		var3180 = var3182
	end
	if self.action_params ~= nil then
		local var3183 = self.action_params:encode()
		local var3184, var3185 = protoModule.writeTag(buff, var3180, 2, protoModule.wireTypes.lengthDelimited)
		var3184, var5242 = protoModule.writeBuffer(var3184, var3185, var3183, buffer.len(var3183))
		buff = var3184
		var3180 = var3185
	end
	local buff_1 = buffer.create(var3180)
	buffer.copy(buff_1, 0, buff, 0, var3180)
	
	return buff_1
end

function t_156.decode(p156)
	-- upvalues: t_156 (ref), protoModule (ref), t (ref)
	local var3180 = t_156.new()
	local var3181 = 0
	while var3181 < buffer.len(p156) do
		local _ = nil
		local var3182 = nil
		local var3183, var3184, var3185 = protoModule.readTag(p156, var3181)
		local var3186 = var3183
		var3182 = var3184
		var3181 = var3185
		
		if var3182 == protoModule.wireTypes.varint then
			if var3186 == 1 then
				local _ = nil
				local var3187, var3188 = protoModule.readVarIntI32(p156, var3181)
				local var3189 = var3187
				var3181 = var3188
				var3180.action_type = t.ActionType.fromNumber(var3189) or var3189
			else
				local _ = nil
				local var3190, var3191 = protoModule.readVarInt(p156, var3181)
				local _ = var3190
				var3181 = var3191
			end
		end
		if var3182 == protoModule.wireTypes.lengthDelimited then
			if var3186 == 2 then
				local _ = nil
				local var3192, var3193 = protoModule.readBuffer(p156, var3181)
				var3181 = var3193
				var3180.action_params = t.SelectMarketplaceFavoritesCategory_Params.decode(var3192)
			else
				local _ = nil
				local var3194, var3195 = protoModule.readVarInt(p156, var3181)
				var3181 = var3195 + var3194
			end
		elseif var3182 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3196, var3197 = protoModule.readFixed32(p156, var3181)
			local _ = var3196
			var3181 = var3197
		elseif var3182 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3198, var3199 = protoModule.readFixed64(p156, var3181)
			local _ = var3198
			var3181 = var3199
		else
			error("Unsupported wire type: " .. var5246)
		end
	end
	return var3180
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
	local var3200 = t_156.new()
	
	if self.action_type ~= nil then
		var3200.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3200.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3200.action_params = t.SelectMarketplaceFavoritesCategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3200.action_params = t.SelectMarketplaceFavoritesCategory_Params.jsonDecode(self.actionParams)
	end
	return var3200
end

t_156.descriptor = {
	name = "SelectMarketplaceFavoritesCategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceFavoritesCategory"
}
t.SelectMarketplaceFavoritesCategory = t_156
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesCategory)
local t_157 = {}
t_157.__index = t_157

function t_157.new(p157)
	-- upvalues: t_157 (ref)
	return setmetatable({
		category_id = if p157 == nil or p157.category_id == nil then nil else p157.category_id
	}, t_157)
end

function t_157:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3200 = 0
	
	if self.category_id ~= nil then
		local var3201 = self.category_id:encode()
		local var3202, var3203 = protoModule.writeTag(buff, var3200, 1, protoModule.wireTypes.lengthDelimited)
		var3202, var5270 = protoModule.writeBuffer(var3202, var3203, var3201, buffer.len(var3201))
		buff = var3202
		var3200 = var3203
	end
	local buff_1 = buffer.create(var3200)
	buffer.copy(buff_1, 0, buff, 0, var3200)
	
	return buff_1
end

function t_157.decode(p157)
	-- upvalues: t_157 (ref), protoModule (ref), propTypesModule (ref)
	local var3200 = t_157.new()
	local var3201 = 0
	while var3201 < buffer.len(p157) do
		local _ = nil
		local var3202 = nil
		local var3203, var3204, var3205 = protoModule.readTag(p157, var3201)
		local var3206 = var3203
		var3202 = var3204
		var3201 = var3205
		
		if var3202 == protoModule.wireTypes.varint then
			local _ = nil
			local var3207, var3208 = protoModule.readVarInt(p157, var3201)
			local _ = var3207
			var3201 = var3208
			continue
		end
		if var3202 == protoModule.wireTypes.lengthDelimited then
			if var3206 == 1 then
				local _ = nil
				local var3209, var3210 = protoModule.readBuffer(p157, var3201)
				var3201 = var3210
				var3200.category_id = propTypesModule.StringProp.decode(var3209)
			else
				local _ = nil
				local var3211, var3212 = protoModule.readVarInt(p157, var3201)
				var3201 = var3212 + var3211
			end
		elseif var3202 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3213, var3214 = protoModule.readFixed32(p157, var3201)
			local _ = var3213
			var3201 = var3214
		elseif var3202 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3215, var3216 = protoModule.readFixed64(p157, var3201)
			local _ = var3215
			var3201 = var3216
		else
			error("Unsupported wire type: " .. var5274)
		end
	end
	return var3200
end

function t_157:jsonEncode()
	local t = {}
	
	if self.category_id ~= nil then
		t.categoryId = self.category_id:jsonEncode()
	end
	return t
end

function t_157:jsonDecode()
	-- upvalues: t_157 (ref), propTypesModule (ref)
	local var3217 = t_157.new()
	
	if self.category_id ~= nil then
		var3217.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var3217.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	return var3217
end

t_157.descriptor = {
	name = "SelectMarketplaceFavoritesCategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceFavoritesCategory_Params = t_157
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesCategory_Params)
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
	local var3217 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3218, var3219 = protoModule.writeTag(buff, var3217, 1, protoModule.wireTypes.varint)
		var3218, var5294 = protoModule.writeVarInt(var3218, var3219, t.ActionType.toNumber(self.action_type))
		buff = var3218
		var3217 = var3219
	end
	if self.action_params ~= nil then
		local var3220 = self.action_params:encode()
		local var3221, var3222 = protoModule.writeTag(buff, var3217, 2, protoModule.wireTypes.lengthDelimited)
		var3221, var5297 = protoModule.writeBuffer(var3221, var3222, var3220, buffer.len(var3220))
		buff = var3221
		var3217 = var3222
	end
	local buff_1 = buffer.create(var3217)
	buffer.copy(buff_1, 0, buff, 0, var3217)
	
	return buff_1
end

function t_158.decode(p158)
	-- upvalues: t_158 (ref), protoModule (ref), t (ref)
	local var3217 = t_158.new()
	local var3218 = 0
	while var3218 < buffer.len(p158) do
		local _ = nil
		local var3219 = nil
		local var3220, var3221, var3222 = protoModule.readTag(p158, var3218)
		local var3223 = var3220
		var3219 = var3221
		var3218 = var3222
		
		if var3219 == protoModule.wireTypes.varint then
			if var3223 == 1 then
				local _ = nil
				local var3224, var3225 = protoModule.readVarIntI32(p158, var3218)
				local var3226 = var3224
				var3218 = var3225
				var3217.action_type = t.ActionType.fromNumber(var3226) or var3226
			else
				local _ = nil
				local var3227, var3228 = protoModule.readVarInt(p158, var3218)
				local _ = var3227
				var3218 = var3228
			end
		end
		if var3219 == protoModule.wireTypes.lengthDelimited then
			if var3223 == 2 then
				local _ = nil
				local var3229, var3230 = protoModule.readBuffer(p158, var3218)
				var3218 = var3230
				var3217.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.decode(var3229)
			else
				local _ = nil
				local var3231, var3232 = protoModule.readVarInt(p158, var3218)
				var3218 = var3232 + var3231
			end
		elseif var3219 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3233, var3234 = protoModule.readFixed32(p158, var3218)
			local _ = var3233
			var3218 = var3234
		elseif var3219 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3235, var3236 = protoModule.readFixed64(p158, var3218)
			local _ = var3235
			var3218 = var3236
		else
			error("Unsupported wire type: " .. var5301)
		end
	end
	return var3217
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
	local var3237 = t_158.new()
	
	if self.action_type ~= nil then
		var3237.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3237.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3237.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3237.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.jsonDecode(self.actionParams)
	end
	return var3237
end

t_158.descriptor = {
	name = "SelectMarketplaceFavoritesSubcategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceFavoritesSubcategory"
}
t.SelectMarketplaceFavoritesSubcategory = t_158
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesSubcategory)
local t_159 = {}
t_159.__index = t_159

function t_159.new(p159)
	-- upvalues: t_159 (ref)
	return setmetatable({
		subcategory_id = if p159 == nil or p159.subcategory_id == nil then nil else p159.subcategory_id
	}, t_159)
end

function t_159:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3237 = 0
	
	if self.subcategory_id ~= nil then
		local var3238 = self.subcategory_id:encode()
		local var3239, var3240 = protoModule.writeTag(buff, var3237, 1, protoModule.wireTypes.lengthDelimited)
		var3239, var5325 = protoModule.writeBuffer(var3239, var3240, var3238, buffer.len(var3238))
		buff = var3239
		var3237 = var3240
	end
	local buff_1 = buffer.create(var3237)
	buffer.copy(buff_1, 0, buff, 0, var3237)
	
	return buff_1
end

function t_159.decode(p159)
	-- upvalues: t_159 (ref), protoModule (ref), propTypesModule (ref)
	local var3237 = t_159.new()
	local var3238 = 0
	while var3238 < buffer.len(p159) do
		local _ = nil
		local var3239 = nil
		local var3240, var3241, var3242 = protoModule.readTag(p159, var3238)
		local var3243 = var3240
		var3239 = var3241
		var3238 = var3242
		
		if var3239 == protoModule.wireTypes.varint then
			local _ = nil
			local var3244, var3245 = protoModule.readVarInt(p159, var3238)
			local _ = var3244
			var3238 = var3245
			continue
		end
		if var3239 == protoModule.wireTypes.lengthDelimited then
			if var3243 == 1 then
				local _ = nil
				local var3246, var3247 = protoModule.readBuffer(p159, var3238)
				var3238 = var3247
				var3237.subcategory_id = propTypesModule.StringProp.decode(var3246)
			else
				local _ = nil
				local var3248, var3249 = protoModule.readVarInt(p159, var3238)
				var3238 = var3249 + var3248
			end
		elseif var3239 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3250, var3251 = protoModule.readFixed32(p159, var3238)
			local _ = var3250
			var3238 = var3251
		elseif var3239 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3252, var3253 = protoModule.readFixed64(p159, var3238)
			local _ = var3252
			var3238 = var3253
		else
			error("Unsupported wire type: " .. var5329)
		end
	end
	return var3237
end

function t_159:jsonEncode()
	local t = {}
	
	if self.subcategory_id ~= nil then
		t.subcategoryId = self.subcategory_id:jsonEncode()
	end
	return t
end

function t_159:jsonDecode()
	-- upvalues: t_159 (ref), propTypesModule (ref)
	local var3254 = t_159.new()
	
	if self.subcategory_id ~= nil then
		var3254.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var3254.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	return var3254
end

t_159.descriptor = {
	name = "SelectMarketplaceFavoritesSubcategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceFavoritesSubcategory_Params = t_159
typeRegistryModule.default:register(t.SelectMarketplaceFavoritesSubcategory_Params)
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
	local var3254 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3255, var3256 = protoModule.writeTag(buff, var3254, 1, protoModule.wireTypes.varint)
		var3255, var5349 = protoModule.writeVarInt(var3255, var3256, t.ActionType.toNumber(self.action_type))
		buff = var3255
		var3254 = var3256
	end
	if self.action_params ~= nil then
		local var3257 = self.action_params:encode()
		local var3258, var3259 = protoModule.writeTag(buff, var3254, 2, protoModule.wireTypes.lengthDelimited)
		var3258, var5352 = protoModule.writeBuffer(var3258, var3259, var3257, buffer.len(var3257))
		buff = var3258
		var3254 = var3259
	end
	local buff_1 = buffer.create(var3254)
	buffer.copy(buff_1, 0, buff, 0, var3254)
	
	return buff_1
end

function t_160.decode(p160)
	-- upvalues: t_160 (ref), protoModule (ref), t (ref)
	local var3254 = t_160.new()
	local var3255 = 0
	while var3255 < buffer.len(p160) do
		local _ = nil
		local var3256 = nil
		local var3257, var3258, var3259 = protoModule.readTag(p160, var3255)
		local var3260 = var3257
		var3256 = var3258
		var3255 = var3259
		
		if var3256 == protoModule.wireTypes.varint then
			if var3260 == 1 then
				local _ = nil
				local var3261, var3262 = protoModule.readVarIntI32(p160, var3255)
				local var3263 = var3261
				var3255 = var3262
				var3254.action_type = t.ActionType.fromNumber(var3263) or var3263
			else
				local _ = nil
				local var3264, var3265 = protoModule.readVarInt(p160, var3255)
				local _ = var3264
				var3255 = var3265
			end
		end
		if var3256 == protoModule.wireTypes.lengthDelimited then
			if var3260 == 2 then
				local _ = nil
				local var3266, var3267 = protoModule.readBuffer(p160, var3255)
				var3255 = var3267
				var3254.action_params = t.PinExperienceShortcutAction_Params.decode(var3266)
			else
				local _ = nil
				local var3268, var3269 = protoModule.readVarInt(p160, var3255)
				var3255 = var3269 + var3268
			end
		elseif var3256 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3270, var3271 = protoModule.readFixed32(p160, var3255)
			local _ = var3270
			var3255 = var3271
		elseif var3256 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3272, var3273 = protoModule.readFixed64(p160, var3255)
			local _ = var3272
			var3255 = var3273
		else
			error("Unsupported wire type: " .. var5356)
		end
	end
	return var3254
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
	local var3274 = t_160.new()
	
	if self.action_type ~= nil then
		var3274.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3274.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3274.action_params = t.PinExperienceShortcutAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3274.action_params = t.PinExperienceShortcutAction_Params.jsonDecode(self.actionParams)
	end
	return var3274
end

t_160.descriptor = {
	name = "PinExperienceShortcutAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.PinExperienceShortcutAction"
}
t.PinExperienceShortcutAction = t_160
typeRegistryModule.default:register(t.PinExperienceShortcutAction)
local t_161 = {}
t_161.__index = t_161

function t_161.new(p161)
	-- upvalues: t_161 (ref)
	return setmetatable({
		place_id = if p161 == nil or p161.place_id == nil then nil else p161.place_id,
		universe_id = if p161 == nil or p161.universe_id == nil then nil else p161.universe_id,
		game_name = if p161 == nil or p161.game_name == nil then nil else p161.game_name
	}, t_161)
end

function t_161:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3274 = 0
	
	if self.place_id ~= nil then
		local var3275 = self.place_id:encode()
		local var3276, var3277 = protoModule.writeTag(buff, var3274, 1, protoModule.wireTypes.lengthDelimited)
		var3276, var5380 = protoModule.writeBuffer(var3276, var3277, var3275, buffer.len(var3275))
		buff = var3276
		var3274 = var3277
	end
	if self.universe_id ~= nil then
		local var3278 = self.universe_id:encode()
		local var3279, var3280 = protoModule.writeTag(buff, var3274, 2, protoModule.wireTypes.lengthDelimited)
		var3279, var5383 = protoModule.writeBuffer(var3279, var3280, var3278, buffer.len(var3278))
		buff = var3279
		var3274 = var3280
	end
	if self.game_name ~= nil then
		local var3281 = self.game_name:encode()
		local var3282, var3283 = protoModule.writeTag(buff, var3274, 3, protoModule.wireTypes.lengthDelimited)
		var3282, var5386 = protoModule.writeBuffer(var3282, var3283, var3281, buffer.len(var3281))
		buff = var3282
		var3274 = var3283
	end
	local buff_1 = buffer.create(var3274)
	buffer.copy(buff_1, 0, buff, 0, var3274)
	
	return buff_1
end

function t_161.decode(p161)
	-- upvalues: t_161 (ref), protoModule (ref), propTypesModule (ref)
	local var3274 = t_161.new()
	local var3275 = 0
	while var3275 < buffer.len(p161) do
		local _ = nil
		local var3276 = nil
		local var3277, var3278, var3279 = protoModule.readTag(p161, var3275)
		local var3280 = var3277
		var3276 = var3278
		var3275 = var3279
		
		if var3276 == protoModule.wireTypes.varint then
			local _ = nil
			local var3281, var3282 = protoModule.readVarInt(p161, var3275)
			local _ = var3281
			var3275 = var3282
			continue
		end
		if var3276 == protoModule.wireTypes.lengthDelimited then
			if var3280 == 1 then
				local _ = nil
				local var3283, var3284 = protoModule.readBuffer(p161, var3275)
				var3275 = var3284
				var3274.place_id = propTypesModule.StringProp.decode(var3283)
			elseif var3280 == 2 then
				local _ = nil
				local var3285, var3286 = protoModule.readBuffer(p161, var3275)
				var3275 = var3286
				var3274.universe_id = propTypesModule.StringProp.decode(var3285)
			elseif var3280 == 3 then
				local _ = nil
				local var3287, var3288 = protoModule.readBuffer(p161, var3275)
				var3275 = var3288
				var3274.game_name = propTypesModule.StringProp.decode(var3287)
			else
				local _ = nil
				local var3289, var3290 = protoModule.readVarInt(p161, var3275)
				var3275 = var3290 + var3289
			end
		elseif var3276 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3291, var3292 = protoModule.readFixed32(p161, var3275)
			local _ = var3291
			var3275 = var3292
		elseif var3276 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3293, var3294 = protoModule.readFixed64(p161, var3275)
			local _ = var3293
			var3275 = var3294
		else
			error("Unsupported wire type: " .. var5390)
		end
	end
	return var3274
end

function t_161:jsonEncode()
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

function t_161:jsonDecode()
	-- upvalues: t_161 (ref), propTypesModule (ref)
	local var3295 = t_161.new()
	
	if self.place_id ~= nil then
		var3295.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var3295.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var3295.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3295.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.game_name ~= nil then
		var3295.game_name = propTypesModule.StringProp.jsonDecode(self.game_name)
	end
	if self.gameName ~= nil then
		var3295.game_name = propTypesModule.StringProp.jsonDecode(self.gameName)
	end
	return var3295
end

t_161.descriptor = {
	name = "PinExperienceShortcutAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.PinExperienceShortcutAction_Params = t_161
typeRegistryModule.default:register(t.PinExperienceShortcutAction_Params)
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
	local var3295 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3296, var3297 = protoModule.writeTag(buff, var3295, 1, protoModule.wireTypes.varint)
		var3296, var5414 = protoModule.writeVarInt(var3296, var3297, t.ActionType.toNumber(self.action_type))
		buff = var3296
		var3295 = var3297
	end
	if self.action_params ~= nil then
		local var3298 = self.action_params:encode()
		local var3299, var3300 = protoModule.writeTag(buff, var3295, 2, protoModule.wireTypes.lengthDelimited)
		var3299, var5417 = protoModule.writeBuffer(var3299, var3300, var3298, buffer.len(var3298))
		buff = var3299
		var3295 = var3300
	end
	local buff_1 = buffer.create(var3295)
	buffer.copy(buff_1, 0, buff, 0, var3295)
	
	return buff_1
end

function t_162.decode(p162)
	-- upvalues: t_162 (ref), protoModule (ref), t (ref)
	local var3295 = t_162.new()
	local var3296 = 0
	while var3296 < buffer.len(p162) do
		local _ = nil
		local var3297 = nil
		local var3298, var3299, var3300 = protoModule.readTag(p162, var3296)
		local var3301 = var3298
		var3297 = var3299
		var3296 = var3300
		
		if var3297 == protoModule.wireTypes.varint then
			if var3301 == 1 then
				local _ = nil
				local var3302, var3303 = protoModule.readVarIntI32(p162, var3296)
				local var3304 = var3302
				var3296 = var3303
				var3295.action_type = t.ActionType.fromNumber(var3304) or var3304
			else
				local _ = nil
				local var3305, var3306 = protoModule.readVarInt(p162, var3296)
				local _ = var3305
				var3296 = var3306
			end
		end
		if var3297 == protoModule.wireTypes.lengthDelimited then
			if var3301 == 2 then
				local _ = nil
				local var3307, var3308 = protoModule.readBuffer(p162, var3296)
				var3296 = var3308
				var3295.action_params = t.NavigateAction_Params.decode(var3307)
			else
				local _ = nil
				local var3309, var3310 = protoModule.readVarInt(p162, var3296)
				var3296 = var3310 + var3309
			end
		elseif var3297 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3311, var3312 = protoModule.readFixed32(p162, var3296)
			local _ = var3311
			var3296 = var3312
		elseif var3297 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3313, var3314 = protoModule.readFixed64(p162, var3296)
			local _ = var3313
			var3296 = var3314
		else
			error("Unsupported wire type: " .. var5421)
		end
	end
	return var3295
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
	local var3315 = t_162.new()
	
	if self.action_type ~= nil then
		var3315.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3315.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3315.action_params = t.NavigateAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3315.action_params = t.NavigateAction_Params.jsonDecode(self.actionParams)
	end
	return var3315
end

t_162.descriptor = {
	name = "NavigateAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.NavigateAction"
}
t.NavigateAction = t_162
typeRegistryModule.default:register(t.NavigateAction)
local t_163 = {}
t_163.__index = t_163

function t_163.new(p163)
	-- upvalues: t_163 (ref)
	return setmetatable({
		destination = if p163 == nil or p163.destination == nil then nil else p163.destination,
		source = if p163 == nil or p163.source == nil then nil else p163.source
	}, t_163)
end

function t_163:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3315 = 0
	
	if self.destination ~= nil then
		local var3316 = self.destination:encode()
		local var3317, var3318 = protoModule.writeTag(buff, var3315, 1, protoModule.wireTypes.lengthDelimited)
		var3317, var5445 = protoModule.writeBuffer(var3317, var3318, var3316, buffer.len(var3316))
		buff = var3317
		var3315 = var3318
	end
	if self.source ~= nil then
		local var3319 = self.source:encode()
		local var3320, var3321 = protoModule.writeTag(buff, var3315, 2, protoModule.wireTypes.lengthDelimited)
		var3320, var5448 = protoModule.writeBuffer(var3320, var3321, var3319, buffer.len(var3319))
		buff = var3320
		var3315 = var3321
	end
	local buff_1 = buffer.create(var3315)
	buffer.copy(buff_1, 0, buff, 0, var3315)
	
	return buff_1
end

function t_163.decode(p163)
	-- upvalues: t_163 (ref), protoModule (ref), propTypesModule (ref)
	local var3315 = t_163.new()
	local var3316 = 0
	while var3316 < buffer.len(p163) do
		local _ = nil
		local var3317 = nil
		local var3318, var3319, var3320 = protoModule.readTag(p163, var3316)
		local var3321 = var3318
		var3317 = var3319
		var3316 = var3320
		
		if var3317 == protoModule.wireTypes.varint then
			local _ = nil
			local var3322, var3323 = protoModule.readVarInt(p163, var3316)
			local _ = var3322
			var3316 = var3323
			continue
		end
		if var3317 == protoModule.wireTypes.lengthDelimited then
			if var3321 == 1 then
				local _ = nil
				local var3324, var3325 = protoModule.readBuffer(p163, var3316)
				var3316 = var3325
				var3315.destination = propTypesModule.StringProp.decode(var3324)
			elseif var3321 == 2 then
				local _ = nil
				local var3326, var3327 = protoModule.readBuffer(p163, var3316)
				var3316 = var3327
				var3315.source = propTypesModule.StringProp.decode(var3326)
			else
				local _ = nil
				local var3328, var3329 = protoModule.readVarInt(p163, var3316)
				var3316 = var3329 + var3328
			end
		elseif var3317 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3330, var3331 = protoModule.readFixed32(p163, var3316)
			local _ = var3330
			var3316 = var3331
		elseif var3317 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3332, var3333 = protoModule.readFixed64(p163, var3316)
			local _ = var3332
			var3316 = var3333
		else
			error("Unsupported wire type: " .. var5452)
		end
	end
	return var3315
end

function t_163:jsonEncode()
	local t = {}
	
	if self.destination ~= nil then
		t.destination = self.destination:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_163:jsonDecode()
	-- upvalues: t_163 (ref), propTypesModule (ref)
	local var3334 = t_163.new()
	
	if self.destination ~= nil then
		var3334.destination = propTypesModule.StringProp.jsonDecode(self.destination)
	end
	if self.source ~= nil then
		var3334.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var3334
end

t_163.descriptor = {
	name = "NavigateAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.NavigateAction_Params = t_163
typeRegistryModule.default:register(t.NavigateAction_Params)
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
	local var3334 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3335, var3336 = protoModule.writeTag(buff, var3334, 1, protoModule.wireTypes.varint)
		var3335, var5474 = protoModule.writeVarInt(var3335, var3336, t.ActionType.toNumber(self.action_type))
		buff = var3335
		var3334 = var3336
	end
	if self.action_params ~= nil then
		local var3337 = self.action_params:encode()
		local var3338, var3339 = protoModule.writeTag(buff, var3334, 2, protoModule.wireTypes.lengthDelimited)
		var3338, var5477 = protoModule.writeBuffer(var3338, var3339, var3337, buffer.len(var3337))
		buff = var3338
		var3334 = var3339
	end
	local buff_1 = buffer.create(var3334)
	buffer.copy(buff_1, 0, buff, 0, var3334)
	
	return buff_1
end

function t_164.decode(p164)
	-- upvalues: t_164 (ref), protoModule (ref), t (ref)
	local var3334 = t_164.new()
	local var3335 = 0
	while var3335 < buffer.len(p164) do
		local _ = nil
		local var3336 = nil
		local var3337, var3338, var3339 = protoModule.readTag(p164, var3335)
		local var3340 = var3337
		var3336 = var3338
		var3335 = var3339
		
		if var3336 == protoModule.wireTypes.varint then
			if var3340 == 1 then
				local _ = nil
				local var3341, var3342 = protoModule.readVarIntI32(p164, var3335)
				local var3343 = var3341
				var3335 = var3342
				var3334.action_type = t.ActionType.fromNumber(var3343) or var3343
			else
				local _ = nil
				local var3344, var3345 = protoModule.readVarInt(p164, var3335)
				local _ = var3344
				var3335 = var3345
			end
		end
		if var3336 == protoModule.wireTypes.lengthDelimited then
			if var3340 == 2 then
				local _ = nil
				local var3346, var3347 = protoModule.readBuffer(p164, var3335)
				var3335 = var3347
				var3334.action_params = t.DownloadAppAction_Params.decode(var3346)
			else
				local _ = nil
				local var3348, var3349 = protoModule.readVarInt(p164, var3335)
				var3335 = var3349 + var3348
			end
		elseif var3336 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3350, var3351 = protoModule.readFixed32(p164, var3335)
			local _ = var3350
			var3335 = var3351
		elseif var3336 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3352, var3353 = protoModule.readFixed64(p164, var3335)
			local _ = var3352
			var3335 = var3353
		else
			error("Unsupported wire type: " .. var5481)
		end
	end
	return var3334
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
	local var3354 = t_164.new()
	
	if self.action_type ~= nil then
		var3354.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3354.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3354.action_params = t.DownloadAppAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3354.action_params = t.DownloadAppAction_Params.jsonDecode(self.actionParams)
	end
	return var3354
end

t_164.descriptor = {
	name = "DownloadAppAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DownloadAppAction"
}
t.DownloadAppAction = t_164
typeRegistryModule.default:register(t.DownloadAppAction)
local t_165 = {}
t_165.__index = t_165

function t_165.new(p165)
	-- upvalues: t_165 (ref)
	return setmetatable({
		source = if p165 == nil or p165.source == nil then nil else p165.source,
		download_type = if p165 == nil or p165.download_type == nil then nil else p165.download_type
	}, t_165)
end

function t_165:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3354 = 0
	
	if self.source ~= nil then
		local var3355 = self.source:encode()
		local var3356, var3357 = protoModule.writeTag(buff, var3354, 1, protoModule.wireTypes.lengthDelimited)
		var3356, var5505 = protoModule.writeBuffer(var3356, var3357, var3355, buffer.len(var3355))
		buff = var3356
		var3354 = var3357
	end
	if self.download_type ~= nil then
		local var3358 = self.download_type:encode()
		local var3359, var3360 = protoModule.writeTag(buff, var3354, 2, protoModule.wireTypes.lengthDelimited)
		var3359, var5508 = protoModule.writeBuffer(var3359, var3360, var3358, buffer.len(var3358))
		buff = var3359
		var3354 = var3360
	end
	local buff_1 = buffer.create(var3354)
	buffer.copy(buff_1, 0, buff, 0, var3354)
	
	return buff_1
end

function t_165.decode(p165)
	-- upvalues: t_165 (ref), protoModule (ref), propTypesModule (ref)
	local var3354 = t_165.new()
	local var3355 = 0
	while var3355 < buffer.len(p165) do
		local _ = nil
		local var3356 = nil
		local var3357, var3358, var3359 = protoModule.readTag(p165, var3355)
		local var3360 = var3357
		var3356 = var3358
		var3355 = var3359
		
		if var3356 == protoModule.wireTypes.varint then
			local _ = nil
			local var3361, var3362 = protoModule.readVarInt(p165, var3355)
			local _ = var3361
			var3355 = var3362
			continue
		end
		if var3356 == protoModule.wireTypes.lengthDelimited then
			if var3360 == 1 then
				local _ = nil
				local var3363, var3364 = protoModule.readBuffer(p165, var3355)
				var3355 = var3364
				var3354.source = propTypesModule.StringProp.decode(var3363)
			elseif var3360 == 2 then
				local _ = nil
				local var3365, var3366 = protoModule.readBuffer(p165, var3355)
				var3355 = var3366
				var3354.download_type = propTypesModule.StringProp.decode(var3365)
			else
				local _ = nil
				local var3367, var3368 = protoModule.readVarInt(p165, var3355)
				var3355 = var3368 + var3367
			end
		elseif var3356 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3369, var3370 = protoModule.readFixed32(p165, var3355)
			local _ = var3369
			var3355 = var3370
		elseif var3356 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3371, var3372 = protoModule.readFixed64(p165, var3355)
			local _ = var3371
			var3355 = var3372
		else
			error("Unsupported wire type: " .. var5512)
		end
	end
	return var3354
end

function t_165:jsonEncode()
	local t = {}
	
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	if self.download_type ~= nil then
		t.downloadType = self.download_type:jsonEncode()
	end
	return t
end

function t_165:jsonDecode()
	-- upvalues: t_165 (ref), propTypesModule (ref)
	local var3373 = t_165.new()
	
	if self.source ~= nil then
		var3373.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.download_type ~= nil then
		var3373.download_type = propTypesModule.StringProp.jsonDecode(self.download_type)
	end
	if self.downloadType ~= nil then
		var3373.download_type = propTypesModule.StringProp.jsonDecode(self.downloadType)
	end
	return var3373
end

t_165.descriptor = {
	name = "DownloadAppAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DownloadAppAction_Params = t_165
typeRegistryModule.default:register(t.DownloadAppAction_Params)
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
	local var3373 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3374, var3375 = protoModule.writeTag(buff, var3373, 1, protoModule.wireTypes.varint)
		var3374, var5534 = protoModule.writeVarInt(var3374, var3375, t.ActionType.toNumber(self.action_type))
		buff = var3374
		var3373 = var3375
	end
	if self.action_params ~= nil then
		local var3376 = self.action_params:encode()
		local var3377, var3378 = protoModule.writeTag(buff, var3373, 2, protoModule.wireTypes.lengthDelimited)
		var3377, var5537 = protoModule.writeBuffer(var3377, var3378, var3376, buffer.len(var3376))
		buff = var3377
		var3373 = var3378
	end
	local buff_1 = buffer.create(var3373)
	buffer.copy(buff_1, 0, buff, 0, var3373)
	
	return buff_1
end

function t_166.decode(p166)
	-- upvalues: t_166 (ref), protoModule (ref), t (ref)
	local var3373 = t_166.new()
	local var3374 = 0
	while var3374 < buffer.len(p166) do
		local _ = nil
		local var3375 = nil
		local var3376, var3377, var3378 = protoModule.readTag(p166, var3374)
		local var3379 = var3376
		var3375 = var3377
		var3374 = var3378
		
		if var3375 == protoModule.wireTypes.varint then
			if var3379 == 1 then
				local _ = nil
				local var3380, var3381 = protoModule.readVarIntI32(p166, var3374)
				local var3382 = var3380
				var3374 = var3381
				var3373.action_type = t.ActionType.fromNumber(var3382) or var3382
			else
				local _ = nil
				local var3383, var3384 = protoModule.readVarInt(p166, var3374)
				local _ = var3383
				var3374 = var3384
			end
		end
		if var3375 == protoModule.wireTypes.lengthDelimited then
			if var3379 == 2 then
				local _ = nil
				local var3385, var3386 = protoModule.readBuffer(p166, var3374)
				var3374 = var3386
				var3373.action_params = t.ActionSequenceAction_Params.decode(var3385)
			else
				local _ = nil
				local var3387, var3388 = protoModule.readVarInt(p166, var3374)
				var3374 = var3388 + var3387
			end
		elseif var3375 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3389, var3390 = protoModule.readFixed32(p166, var3374)
			local _ = var3389
			var3374 = var3390
		elseif var3375 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3391, var3392 = protoModule.readFixed64(p166, var3374)
			local _ = var3391
			var3374 = var3392
		else
			error("Unsupported wire type: " .. var5541)
		end
	end
	return var3373
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
	local var3393 = t_166.new()
	
	if self.action_type ~= nil then
		var3393.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3393.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3393.action_params = t.ActionSequenceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3393.action_params = t.ActionSequenceAction_Params.jsonDecode(self.actionParams)
	end
	return var3393
end

t_166.descriptor = {
	name = "ActionSequenceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionSequenceAction"
}
t.ActionSequenceAction = t_166
typeRegistryModule.default:register(t.ActionSequenceAction)
local t_167 = {}
t_167.__index = t_167

function t_167.new(p167)
	-- upvalues: t_167 (ref)
	return setmetatable({
		actions = if p167 == nil or p167.actions == nil then {} else p167.actions
	}, t_167)
end

function t_167:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3393 = 0
	
	if self.actions ~= nil and #self.actions > 0 then
		for i, v in self.actions do
			local var3394 = v:encode()
			local var3395, var3396 = protoModule.writeTag(buff, var3393, 1, protoModule.wireTypes.lengthDelimited)
			var3395, var5565 = protoModule.writeBuffer(var3395, var3396, var3394, buffer.len(var3394))
			buff = var3395
			var3393 = var3396
		end
	end
	local buff_1 = buffer.create(var3393)
	buffer.copy(buff_1, 0, buff, 0, var3393)
	
	return buff_1
end

function t_167.decode(p167)
	-- upvalues: t_167 (ref), protoModule (ref), t (ref)
	local var3397 = t_167.new()
	local var3398 = 0
	while var3398 < buffer.len(p167) do
		local _ = nil
		local var3399 = nil
		local var3400, var3401, var3402 = protoModule.readTag(p167, var3398)
		local var3403 = var3400
		var3399 = var3401
		var3398 = var3402
		
		if var3399 == protoModule.wireTypes.varint then
			local _ = nil
			local var3404, var3405 = protoModule.readVarInt(p167, var3398)
			local _ = var3404
			var3398 = var3405
			continue
		end
		if var3399 == protoModule.wireTypes.lengthDelimited then
			if var3403 == 1 then
				local _ = nil
				local var3406, var3407 = protoModule.readBuffer(p167, var3398)
				var3398 = var3407
				table.insert(var3397.actions, t.ActionProp.decode(var3406))
			else
				local _ = nil
				local var3408, var3409 = protoModule.readVarInt(p167, var3398)
				var3398 = var3409 + var3408
			end
		elseif var3399 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3410, var3411 = protoModule.readFixed32(p167, var3398)
			local _ = var3410
			var3398 = var3411
		elseif var3399 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3412, var3413 = protoModule.readFixed64(p167, var3398)
			local _ = var3412
			var3398 = var3413
		else
			error("Unsupported wire type: " .. var5569)
		end
	end
	return var3397
end

function t_167:jsonEncode()
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

function t_167:jsonDecode()
	-- upvalues: t_167 (ref), t (ref)
	local var3414 = t_167.new()
	
	if self.actions ~= nil then
		local t_1 = {}
		
		for i, v in self.actions do
			table.insert(t_1, t.ActionProp.jsonDecode(v))
		end
		var3414.actions = t_1
	end
	return var3414
end

t_167.descriptor = {
	name = "ActionSequenceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ActionSequenceAction_Params = t_167
typeRegistryModule.default:register(t.ActionSequenceAction_Params)
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
	local var3415 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3416, var3417 = protoModule.writeTag(buff, var3415, 1, protoModule.wireTypes.varint)
		var3416, var5591 = protoModule.writeVarInt(var3416, var3417, t.ActionType.toNumber(self.action_type))
		buff = var3416
		var3415 = var3417
	end
	if self.action_params ~= nil then
		local var3418 = self.action_params:encode()
		local var3419, var3420 = protoModule.writeTag(buff, var3415, 2, protoModule.wireTypes.lengthDelimited)
		var3419, var5594 = protoModule.writeBuffer(var3419, var3420, var3418, buffer.len(var3418))
		buff = var3419
		var3415 = var3420
	end
	local buff_1 = buffer.create(var3415)
	buffer.copy(buff_1, 0, buff, 0, var3415)
	
	return buff_1
end

function t_168.decode(p168)
	-- upvalues: t_168 (ref), protoModule (ref), t (ref)
	local var3415 = t_168.new()
	local var3416 = 0
	while var3416 < buffer.len(p168) do
		local _ = nil
		local var3417 = nil
		local var3418, var3419, var3420 = protoModule.readTag(p168, var3416)
		local var3421 = var3418
		var3417 = var3419
		var3416 = var3420
		
		if var3417 == protoModule.wireTypes.varint then
			if var3421 == 1 then
				local _ = nil
				local var3422, var3423 = protoModule.readVarIntI32(p168, var3416)
				local var3424 = var3422
				var3416 = var3423
				var3415.action_type = t.ActionType.fromNumber(var3424) or var3424
			else
				local _ = nil
				local var3425, var3426 = protoModule.readVarInt(p168, var3416)
				local _ = var3425
				var3416 = var3426
			end
		end
		if var3417 == protoModule.wireTypes.lengthDelimited then
			if var3421 == 2 then
				local _ = nil
				local var3427, var3428 = protoModule.readBuffer(p168, var3416)
				var3416 = var3428
				var3415.action_params = t.RefreshFeedEntryFromApiAction_Params.decode(var3427)
			else
				local _ = nil
				local var3429, var3430 = protoModule.readVarInt(p168, var3416)
				var3416 = var3430 + var3429
			end
		elseif var3417 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3431, var3432 = protoModule.readFixed32(p168, var3416)
			local _ = var3431
			var3416 = var3432
		elseif var3417 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3433, var3434 = protoModule.readFixed64(p168, var3416)
			local _ = var3433
			var3416 = var3434
		else
			error("Unsupported wire type: " .. var5598)
		end
	end
	return var3415
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
	local var3435 = t_168.new()
	
	if self.action_type ~= nil then
		var3435.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3435.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3435.action_params = t.RefreshFeedEntryFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3435.action_params = t.RefreshFeedEntryFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var3435
end

t_168.descriptor = {
	name = "RefreshFeedEntryFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshFeedEntryFromApiAction"
}
t.RefreshFeedEntryFromApiAction = t_168
typeRegistryModule.default:register(t.RefreshFeedEntryFromApiAction)
local t_169 = {}
t_169.__index = t_169

function t_169.new(p169)
	-- upvalues: t_169 (ref)
	return setmetatable({
		page_entry_identifier = if p169 == nil or p169.page_entry_identifier == nil then nil else p169.page_entry_identifier,
		feed_entry_identifier = if p169 == nil or p169.feed_entry_identifier == nil then nil else p169.feed_entry_identifier,
		selected_option_ids = if p169 == nil or p169.selected_option_ids == nil then nil else p169.selected_option_ids
	}, t_169)
end

function t_169:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3435 = 0
	
	if self.page_entry_identifier ~= nil then
		local var3436 = self.page_entry_identifier:encode()
		local var3437, var3438 = protoModule.writeTag(buff, var3435, 1, protoModule.wireTypes.lengthDelimited)
		var3437, var5622 = protoModule.writeBuffer(var3437, var3438, var3436, buffer.len(var3436))
		buff = var3437
		var3435 = var3438
	end
	if self.feed_entry_identifier ~= nil then
		local var3439 = self.feed_entry_identifier:encode()
		local var3440, var3441 = protoModule.writeTag(buff, var3435, 2, protoModule.wireTypes.lengthDelimited)
		var3440, var5625 = protoModule.writeBuffer(var3440, var3441, var3439, buffer.len(var3439))
		buff = var3440
		var3435 = var3441
	end
	if self.selected_option_ids ~= nil then
		local var3442 = self.selected_option_ids:encode()
		local var3443, var3444 = protoModule.writeTag(buff, var3435, 3, protoModule.wireTypes.lengthDelimited)
		var3443, var5628 = protoModule.writeBuffer(var3443, var3444, var3442, buffer.len(var3442))
		buff = var3443
		var3435 = var3444
	end
	local buff_1 = buffer.create(var3435)
	buffer.copy(buff_1, 0, buff, 0, var3435)
	
	return buff_1
end

function t_169.decode(p169)
	-- upvalues: t_169 (ref), protoModule (ref), propTypesModule (ref)
	local var3435 = t_169.new()
	local var3436 = 0
	while var3436 < buffer.len(p169) do
		local _ = nil
		local var3437 = nil
		local var3438, var3439, var3440 = protoModule.readTag(p169, var3436)
		local var3441 = var3438
		var3437 = var3439
		var3436 = var3440
		
		if var3437 == protoModule.wireTypes.varint then
			local _ = nil
			local var3442, var3443 = protoModule.readVarInt(p169, var3436)
			local _ = var3442
			var3436 = var3443
			continue
		end
		if var3437 == protoModule.wireTypes.lengthDelimited then
			if var3441 == 1 then
				local _ = nil
				local var3444, var3445 = protoModule.readBuffer(p169, var3436)
				var3436 = var3445
				var3435.page_entry_identifier = propTypesModule.StringProp.decode(var3444)
			elseif var3441 == 2 then
				local _ = nil
				local var3446, var3447 = protoModule.readBuffer(p169, var3436)
				var3436 = var3447
				var3435.feed_entry_identifier = propTypesModule.StringProp.decode(var3446)
			elseif var3441 == 3 then
				local _ = nil
				local var3448, var3449 = protoModule.readBuffer(p169, var3436)
				var3436 = var3449
				var3435.selected_option_ids = propTypesModule.StringArrayProp.decode(var3448)
			else
				local _ = nil
				local var3450, var3451 = protoModule.readVarInt(p169, var3436)
				var3436 = var3451 + var3450
			end
		elseif var3437 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3452, var3453 = protoModule.readFixed32(p169, var3436)
			local _ = var3452
			var3436 = var3453
		elseif var3437 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3454, var3455 = protoModule.readFixed64(p169, var3436)
			local _ = var3454
			var3436 = var3455
		else
			error("Unsupported wire type: " .. var5632)
		end
	end
	return var3435
end

function t_169:jsonEncode()
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

function t_169:jsonDecode()
	-- upvalues: t_169 (ref), propTypesModule (ref)
	local var3456 = t_169.new()
	
	if self.page_entry_identifier ~= nil then
		var3456.page_entry_identifier = propTypesModule.StringProp.jsonDecode(self.page_entry_identifier)
	end
	if self.pageEntryIdentifier ~= nil then
		var3456.page_entry_identifier = propTypesModule.StringProp.jsonDecode(self.pageEntryIdentifier)
	end
	if self.feed_entry_identifier ~= nil then
		var3456.feed_entry_identifier = propTypesModule.StringProp.jsonDecode(self.feed_entry_identifier)
	end
	if self.feedEntryIdentifier ~= nil then
		var3456.feed_entry_identifier = propTypesModule.StringProp.jsonDecode(self.feedEntryIdentifier)
	end
	if self.selected_option_ids ~= nil then
		var3456.selected_option_ids = propTypesModule.StringArrayProp.jsonDecode(self.selected_option_ids)
	end
	if self.selectedOptionIds ~= nil then
		var3456.selected_option_ids = propTypesModule.StringArrayProp.jsonDecode(self.selectedOptionIds)
	end
	return var3456
end

t_169.descriptor = {
	name = "RefreshFeedEntryFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshFeedEntryFromApiAction_Params = t_169
typeRegistryModule.default:register(t.RefreshFeedEntryFromApiAction_Params)
local t_170 = {}
t_170.__index = t_170

function t_170.new(p170)
	-- upvalues: t (ref), t_170 (ref)
	return setmetatable({
		action_type = if p170 == nil or p170.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p170.action_type,
		action_params = if p170 == nil or p170.action_params == nil then nil else p170.action_params
	}, t_170)
end

function t_170:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3456 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3457, var3458 = protoModule.writeTag(buff, var3456, 1, protoModule.wireTypes.varint)
		var3457, var5656 = protoModule.writeVarInt(var3457, var3458, t.ActionType.toNumber(self.action_type))
		buff = var3457
		var3456 = var3458
	end
	if self.action_params ~= nil then
		local var3459 = self.action_params:encode()
		local var3460, var3461 = protoModule.writeTag(buff, var3456, 2, protoModule.wireTypes.lengthDelimited)
		var3460, var5659 = protoModule.writeBuffer(var3460, var3461, var3459, buffer.len(var3459))
		buff = var3460
		var3456 = var3461
	end
	local buff_1 = buffer.create(var3456)
	buffer.copy(buff_1, 0, buff, 0, var3456)
	
	return buff_1
end

function t_170.decode(p170)
	-- upvalues: t_170 (ref), protoModule (ref), t (ref)
	local var3456 = t_170.new()
	local var3457 = 0
	while var3457 < buffer.len(p170) do
		local _ = nil
		local var3458 = nil
		local var3459, var3460, var3461 = protoModule.readTag(p170, var3457)
		local var3462 = var3459
		var3458 = var3460
		var3457 = var3461
		
		if var3458 == protoModule.wireTypes.varint then
			if var3462 == 1 then
				local _ = nil
				local var3463, var3464 = protoModule.readVarIntI32(p170, var3457)
				local var3465 = var3463
				var3457 = var3464
				var3456.action_type = t.ActionType.fromNumber(var3465) or var3465
			else
				local _ = nil
				local var3466, var3467 = protoModule.readVarInt(p170, var3457)
				local _ = var3466
				var3457 = var3467
			end
		end
		if var3458 == protoModule.wireTypes.lengthDelimited then
			if var3462 == 2 then
				local _ = nil
				local var3468, var3469 = protoModule.readBuffer(p170, var3457)
				var3457 = var3469
				var3456.action_params = t.OpenProfileFramesEditorAction_Params.decode(var3468)
			else
				local _ = nil
				local var3470, var3471 = protoModule.readVarInt(p170, var3457)
				var3457 = var3471 + var3470
			end
		elseif var3458 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3472, var3473 = protoModule.readFixed32(p170, var3457)
			local _ = var3472
			var3457 = var3473
		elseif var3458 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3474, var3475 = protoModule.readFixed64(p170, var3457)
			local _ = var3474
			var3457 = var3475
		else
			error("Unsupported wire type: " .. var5663)
		end
	end
	return var3456
end

function t_170:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_170:jsonDecode()
	-- upvalues: t_170 (ref), t (ref)
	local var3476 = t_170.new()
	
	if self.action_type ~= nil then
		var3476.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3476.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3476.action_params = t.OpenProfileFramesEditorAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3476.action_params = t.OpenProfileFramesEditorAction_Params.jsonDecode(self.actionParams)
	end
	return var3476
end

t_170.descriptor = {
	name = "OpenProfileFramesEditorAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenProfileFramesEditorAction"
}
t.OpenProfileFramesEditorAction = t_170
typeRegistryModule.default:register(t.OpenProfileFramesEditorAction)
local t_171 = {}
t_171.__index = t_171

function t_171.new(p171)
	-- upvalues: t_171 (ref)
	return setmetatable({
		prompt_id = if p171 == nil or p171.prompt_id == nil then nil else p171.prompt_id,
		prompt_type = if p171 == nil or p171.prompt_type == nil then nil else p171.prompt_type,
		source = if p171 == nil or p171.source == nil then nil else p171.source
	}, t_171)
end

function t_171:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3476 = 0
	
	if self.prompt_id ~= nil then
		local var3477 = self.prompt_id:encode()
		local var3478, var3479 = protoModule.writeTag(buff, var3476, 1, protoModule.wireTypes.lengthDelimited)
		var3478, var5687 = protoModule.writeBuffer(var3478, var3479, var3477, buffer.len(var3477))
		buff = var3478
		var3476 = var3479
	end
	if self.prompt_type ~= nil then
		local var3480 = self.prompt_type:encode()
		local var3481, var3482 = protoModule.writeTag(buff, var3476, 2, protoModule.wireTypes.lengthDelimited)
		var3481, var5690 = protoModule.writeBuffer(var3481, var3482, var3480, buffer.len(var3480))
		buff = var3481
		var3476 = var3482
	end
	if self.source ~= nil then
		local var3483 = self.source:encode()
		local var3484, var3485 = protoModule.writeTag(buff, var3476, 3, protoModule.wireTypes.lengthDelimited)
		var3484, var5693 = protoModule.writeBuffer(var3484, var3485, var3483, buffer.len(var3483))
		buff = var3484
		var3476 = var3485
	end
	local buff_1 = buffer.create(var3476)
	buffer.copy(buff_1, 0, buff, 0, var3476)
	
	return buff_1
end

function t_171.decode(p171)
	-- upvalues: t_171 (ref), protoModule (ref), propTypesModule (ref)
	local var3476 = t_171.new()
	local var3477 = 0
	while var3477 < buffer.len(p171) do
		local _ = nil
		local var3478 = nil
		local var3479, var3480, var3481 = protoModule.readTag(p171, var3477)
		local var3482 = var3479
		var3478 = var3480
		var3477 = var3481
		
		if var3478 == protoModule.wireTypes.varint then
			local _ = nil
			local var3483, var3484 = protoModule.readVarInt(p171, var3477)
			local _ = var3483
			var3477 = var3484
			continue
		end
		if var3478 == protoModule.wireTypes.lengthDelimited then
			if var3482 == 1 then
				local _ = nil
				local var3485, var3486 = protoModule.readBuffer(p171, var3477)
				var3477 = var3486
				var3476.prompt_id = propTypesModule.StringProp.decode(var3485)
			elseif var3482 == 2 then
				local _ = nil
				local var3487, var3488 = protoModule.readBuffer(p171, var3477)
				var3477 = var3488
				var3476.prompt_type = propTypesModule.StringProp.decode(var3487)
			elseif var3482 == 3 then
				local _ = nil
				local var3489, var3490 = protoModule.readBuffer(p171, var3477)
				var3477 = var3490
				var3476.source = propTypesModule.StringProp.decode(var3489)
			else
				local _ = nil
				local var3491, var3492 = protoModule.readVarInt(p171, var3477)
				var3477 = var3492 + var3491
			end
		elseif var3478 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3493, var3494 = protoModule.readFixed32(p171, var3477)
			local _ = var3493
			var3477 = var3494
		elseif var3478 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3495, var3496 = protoModule.readFixed64(p171, var3477)
			local _ = var3495
			var3477 = var3496
		else
			error("Unsupported wire type: " .. var5697)
		end
	end
	return var3476
end

function t_171:jsonEncode()
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

function t_171:jsonDecode()
	-- upvalues: t_171 (ref), propTypesModule (ref)
	local var3497 = t_171.new()
	
	if self.prompt_id ~= nil then
		var3497.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var3497.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.prompt_type ~= nil then
		var3497.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var3497.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.source ~= nil then
		var3497.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var3497
end

t_171.descriptor = {
	name = "OpenProfileFramesEditorAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenProfileFramesEditorAction_Params = t_171
typeRegistryModule.default:register(t.OpenProfileFramesEditorAction_Params)
local t_172 = {}
t_172.__index = t_172

function t_172.new(p172)
	-- upvalues: t (ref), t_172 (ref)
	return setmetatable({
		action_type = if p172 == nil or p172.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p172.action_type,
		action_params = if p172 == nil or p172.action_params == nil then nil else p172.action_params
	}, t_172)
end

function t_172:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3497 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3498, var3499 = protoModule.writeTag(buff, var3497, 1, protoModule.wireTypes.varint)
		var3498, var5721 = protoModule.writeVarInt(var3498, var3499, t.ActionType.toNumber(self.action_type))
		buff = var3498
		var3497 = var3499
	end
	if self.action_params ~= nil then
		local var3500 = self.action_params:encode()
		local var3501, var3502 = protoModule.writeTag(buff, var3497, 2, protoModule.wireTypes.lengthDelimited)
		var3501, var5724 = protoModule.writeBuffer(var3501, var3502, var3500, buffer.len(var3500))
		buff = var3501
		var3497 = var3502
	end
	local buff_1 = buffer.create(var3497)
	buffer.copy(buff_1, 0, buff, 0, var3497)
	
	return buff_1
end

function t_172.decode(p172)
	-- upvalues: t_172 (ref), protoModule (ref), t (ref)
	local var3497 = t_172.new()
	local var3498 = 0
	while var3498 < buffer.len(p172) do
		local _ = nil
		local var3499 = nil
		local var3500, var3501, var3502 = protoModule.readTag(p172, var3498)
		local var3503 = var3500
		var3499 = var3501
		var3498 = var3502
		
		if var3499 == protoModule.wireTypes.varint then
			if var3503 == 1 then
				local _ = nil
				local var3504, var3505 = protoModule.readVarIntI32(p172, var3498)
				local var3506 = var3504
				var3498 = var3505
				var3497.action_type = t.ActionType.fromNumber(var3506) or var3506
			else
				local _ = nil
				local var3507, var3508 = protoModule.readVarInt(p172, var3498)
				local _ = var3507
				var3498 = var3508
			end
		end
		if var3499 == protoModule.wireTypes.lengthDelimited then
			if var3503 == 2 then
				local _ = nil
				local var3509, var3510 = protoModule.readBuffer(p172, var3498)
				var3498 = var3510
				var3497.action_params = t.ApplyDevStoreSeeAllCategoryFilterAction_Params.decode(var3509)
			else
				local _ = nil
				local var3511, var3512 = protoModule.readVarInt(p172, var3498)
				var3498 = var3512 + var3511
			end
		elseif var3499 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3513, var3514 = protoModule.readFixed32(p172, var3498)
			local _ = var3513
			var3498 = var3514
		elseif var3499 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3515, var3516 = protoModule.readFixed64(p172, var3498)
			local _ = var3515
			var3498 = var3516
		else
			error("Unsupported wire type: " .. var5728)
		end
	end
	return var3497
end

function t_172:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_172:jsonDecode()
	-- upvalues: t_172 (ref), t (ref)
	local var3517 = t_172.new()
	
	if self.action_type ~= nil then
		var3517.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3517.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3517.action_params = t.ApplyDevStoreSeeAllCategoryFilterAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3517.action_params = t.ApplyDevStoreSeeAllCategoryFilterAction_Params.jsonDecode(self.actionParams)
	end
	return var3517
end

t_172.descriptor = {
	name = "ApplyDevStoreSeeAllCategoryFilterAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ApplyDevStoreSeeAllCategoryFilterAction"
}
t.ApplyDevStoreSeeAllCategoryFilterAction = t_172
typeRegistryModule.default:register(t.ApplyDevStoreSeeAllCategoryFilterAction)
local t_173 = {}
t_173.__index = t_173

function t_173.new(p173)
	-- upvalues: t_173 (ref)
	return setmetatable({
		selected_category_id = if p173 == nil or p173.selected_category_id == nil then nil else p173.selected_category_id
	}, t_173)
end

function t_173:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3517 = 0
	
	if self.selected_category_id ~= nil then
		local var3518 = self.selected_category_id:encode()
		local var3519, var3520 = protoModule.writeTag(buff, var3517, 1, protoModule.wireTypes.lengthDelimited)
		var3519, var5752 = protoModule.writeBuffer(var3519, var3520, var3518, buffer.len(var3518))
		buff = var3519
		var3517 = var3520
	end
	local buff_1 = buffer.create(var3517)
	buffer.copy(buff_1, 0, buff, 0, var3517)
	
	return buff_1
end

function t_173.decode(p173)
	-- upvalues: t_173 (ref), protoModule (ref), propTypesModule (ref)
	local var3517 = t_173.new()
	local var3518 = 0
	while var3518 < buffer.len(p173) do
		local _ = nil
		local var3519 = nil
		local var3520, var3521, var3522 = protoModule.readTag(p173, var3518)
		local var3523 = var3520
		var3519 = var3521
		var3518 = var3522
		
		if var3519 == protoModule.wireTypes.varint then
			local _ = nil
			local var3524, var3525 = protoModule.readVarInt(p173, var3518)
			local _ = var3524
			var3518 = var3525
			continue
		end
		if var3519 == protoModule.wireTypes.lengthDelimited then
			if var3523 == 1 then
				local _ = nil
				local var3526, var3527 = protoModule.readBuffer(p173, var3518)
				var3518 = var3527
				var3517.selected_category_id = propTypesModule.StringProp.decode(var3526)
			else
				local _ = nil
				local var3528, var3529 = protoModule.readVarInt(p173, var3518)
				var3518 = var3529 + var3528
			end
		elseif var3519 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3530, var3531 = protoModule.readFixed32(p173, var3518)
			local _ = var3530
			var3518 = var3531
		elseif var3519 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3532, var3533 = protoModule.readFixed64(p173, var3518)
			local _ = var3532
			var3518 = var3533
		else
			error("Unsupported wire type: " .. var5756)
		end
	end
	return var3517
end

function t_173:jsonEncode()
	local t = {}
	
	if self.selected_category_id ~= nil then
		t.selectedCategoryId = self.selected_category_id:jsonEncode()
	end
	return t
end

function t_173:jsonDecode()
	-- upvalues: t_173 (ref), propTypesModule (ref)
	local var3534 = t_173.new()
	
	if self.selected_category_id ~= nil then
		var3534.selected_category_id = propTypesModule.StringProp.jsonDecode(self.selected_category_id)
	end
	if self.selectedCategoryId ~= nil then
		var3534.selected_category_id = propTypesModule.StringProp.jsonDecode(self.selectedCategoryId)
	end
	return var3534
end

t_173.descriptor = {
	name = "ApplyDevStoreSeeAllCategoryFilterAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ApplyDevStoreSeeAllCategoryFilterAction_Params = t_173
typeRegistryModule.default:register(t.ApplyDevStoreSeeAllCategoryFilterAction_Params)
local t_174 = {}
t_174.__index = t_174

function t_174.new(p174)
	-- upvalues: t (ref), t_174 (ref)
	return setmetatable({
		action_type = if p174 == nil or p174.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p174.action_type,
		action_params = if p174 == nil or p174.action_params == nil then nil else p174.action_params
	}, t_174)
end

function t_174:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3534 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3535, var3536 = protoModule.writeTag(buff, var3534, 1, protoModule.wireTypes.varint)
		var3535, var5776 = protoModule.writeVarInt(var3535, var3536, t.ActionType.toNumber(self.action_type))
		buff = var3535
		var3534 = var3536
	end
	if self.action_params ~= nil then
		local var3537 = self.action_params:encode()
		local var3538, var3539 = protoModule.writeTag(buff, var3534, 2, protoModule.wireTypes.lengthDelimited)
		var3538, var5779 = protoModule.writeBuffer(var3538, var3539, var3537, buffer.len(var3537))
		buff = var3538
		var3534 = var3539
	end
	local buff_1 = buffer.create(var3534)
	buffer.copy(buff_1, 0, buff, 0, var3534)
	
	return buff_1
end

function t_174.decode(p174)
	-- upvalues: t_174 (ref), protoModule (ref), t (ref)
	local var3534 = t_174.new()
	local var3535 = 0
	while var3535 < buffer.len(p174) do
		local _ = nil
		local var3536 = nil
		local var3537, var3538, var3539 = protoModule.readTag(p174, var3535)
		local var3540 = var3537
		var3536 = var3538
		var3535 = var3539
		
		if var3536 == protoModule.wireTypes.varint then
			if var3540 == 1 then
				local _ = nil
				local var3541, var3542 = protoModule.readVarIntI32(p174, var3535)
				local var3543 = var3541
				var3535 = var3542
				var3534.action_type = t.ActionType.fromNumber(var3543) or var3543
			else
				local _ = nil
				local var3544, var3545 = protoModule.readVarInt(p174, var3535)
				local _ = var3544
				var3535 = var3545
			end
		end
		if var3536 == protoModule.wireTypes.lengthDelimited then
			if var3540 == 2 then
				local _ = nil
				local var3546, var3547 = protoModule.readBuffer(p174, var3535)
				var3535 = var3547
				var3534.action_params = t.SetGameTileNotInterestedAction_Params.decode(var3546)
			else
				local _ = nil
				local var3548, var3549 = protoModule.readVarInt(p174, var3535)
				var3535 = var3549 + var3548
			end
		elseif var3536 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3550, var3551 = protoModule.readFixed32(p174, var3535)
			local _ = var3550
			var3535 = var3551
		elseif var3536 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3552, var3553 = protoModule.readFixed64(p174, var3535)
			local _ = var3552
			var3535 = var3553
		else
			error("Unsupported wire type: " .. var5783)
		end
	end
	return var3534
end

function t_174:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_174:jsonDecode()
	-- upvalues: t_174 (ref), t (ref)
	local var3554 = t_174.new()
	
	if self.action_type ~= nil then
		var3554.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3554.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3554.action_params = t.SetGameTileNotInterestedAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3554.action_params = t.SetGameTileNotInterestedAction_Params.jsonDecode(self.actionParams)
	end
	return var3554
end

t_174.descriptor = {
	name = "SetGameTileNotInterestedAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.SetGameTileNotInterestedAction"
}
t.SetGameTileNotInterestedAction = t_174
typeRegistryModule.default:register(t.SetGameTileNotInterestedAction)
local t_175 = {}
t_175.__index = t_175

function t_175.new(p175)
	-- upvalues: t_175 (ref)
	return setmetatable({
		universe_id = if p175 == nil or p175.universe_id == nil then nil else p175.universe_id,
		place_id = if p175 == nil or p175.place_id == nil then nil else p175.place_id,
		collection_id = if p175 == nil or p175.collection_id == nil then nil else p175.collection_id,
		is_sponsored = if p175 == nil or p175.is_sponsored == nil then nil else p175.is_sponsored
	}, t_175)
end

function t_175:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3554 = 0
	
	if self.universe_id ~= nil then
		local var3555 = self.universe_id:encode()
		local var3556, var3557 = protoModule.writeTag(buff, var3554, 1, protoModule.wireTypes.lengthDelimited)
		var3556, var5807 = protoModule.writeBuffer(var3556, var3557, var3555, buffer.len(var3555))
		buff = var3556
		var3554 = var3557
	end
	if self.place_id ~= nil then
		local var3558 = self.place_id:encode()
		local var3559, var3560 = protoModule.writeTag(buff, var3554, 2, protoModule.wireTypes.lengthDelimited)
		var3559, var5810 = protoModule.writeBuffer(var3559, var3560, var3558, buffer.len(var3558))
		buff = var3559
		var3554 = var3560
	end
	if self.collection_id ~= nil then
		local var3561 = self.collection_id:encode()
		local var3562, var3563 = protoModule.writeTag(buff, var3554, 3, protoModule.wireTypes.lengthDelimited)
		var3562, var5813 = protoModule.writeBuffer(var3562, var3563, var3561, buffer.len(var3561))
		buff = var3562
		var3554 = var3563
	end
	if self.is_sponsored ~= nil then
		local var3564 = self.is_sponsored:encode()
		local var3565, var3566 = protoModule.writeTag(buff, var3554, 4, protoModule.wireTypes.lengthDelimited)
		var3565, var5816 = protoModule.writeBuffer(var3565, var3566, var3564, buffer.len(var3564))
		buff = var3565
		var3554 = var3566
	end
	local buff_1 = buffer.create(var3554)
	buffer.copy(buff_1, 0, buff, 0, var3554)
	
	return buff_1
end

function t_175.decode(p175)
	-- upvalues: t_175 (ref), protoModule (ref), propTypesModule (ref)
	local var3554 = t_175.new()
	local var3555 = 0
	while var3555 < buffer.len(p175) do
		local _ = nil
		local var3556 = nil
		local var3557, var3558, var3559 = protoModule.readTag(p175, var3555)
		local var3560 = var3557
		var3556 = var3558
		var3555 = var3559
		
		if var3556 == protoModule.wireTypes.varint then
			local _ = nil
			local var3561, var3562 = protoModule.readVarInt(p175, var3555)
			local _ = var3561
			var3555 = var3562
			continue
		end
		if var3556 == protoModule.wireTypes.lengthDelimited then
			if var3560 == 1 then
				local _ = nil
				local var3563, var3564 = protoModule.readBuffer(p175, var3555)
				var3555 = var3564
				var3554.universe_id = propTypesModule.StringProp.decode(var3563)
			elseif var3560 == 2 then
				local _ = nil
				local var3565, var3566 = protoModule.readBuffer(p175, var3555)
				var3555 = var3566
				var3554.place_id = propTypesModule.StringProp.decode(var3565)
			elseif var3560 == 3 then
				local _ = nil
				local var3567, var3568 = protoModule.readBuffer(p175, var3555)
				var3555 = var3568
				var3554.collection_id = propTypesModule.StringProp.decode(var3567)
			elseif var3560 == 4 then
				local _ = nil
				local var3569, var3570 = protoModule.readBuffer(p175, var3555)
				var3555 = var3570
				var3554.is_sponsored = propTypesModule.BoolProp.decode(var3569)
			else
				local _ = nil
				local var3571, var3572 = protoModule.readVarInt(p175, var3555)
				var3555 = var3572 + var3571
			end
		elseif var3556 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3573, var3574 = protoModule.readFixed32(p175, var3555)
			local _ = var3573
			var3555 = var3574
		elseif var3556 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3575, var3576 = protoModule.readFixed64(p175, var3555)
			local _ = var3575
			var3555 = var3576
		else
			error("Unsupported wire type: " .. var5820)
		end
	end
	return var3554
end

function t_175:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	if self.collection_id ~= nil then
		t.collectionId = self.collection_id:jsonEncode()
	end
	if self.is_sponsored ~= nil then
		t.isSponsored = self.is_sponsored:jsonEncode()
	end
	return t
end

function t_175:jsonDecode()
	-- upvalues: t_175 (ref), propTypesModule (ref)
	local var3577 = t_175.new()
	
	if self.universe_id ~= nil then
		var3577.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3577.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var3577.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var3577.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.collection_id ~= nil then
		var3577.collection_id = propTypesModule.StringProp.jsonDecode(self.collection_id)
	end
	if self.collectionId ~= nil then
		var3577.collection_id = propTypesModule.StringProp.jsonDecode(self.collectionId)
	end
	if self.is_sponsored ~= nil then
		var3577.is_sponsored = propTypesModule.BoolProp.jsonDecode(self.is_sponsored)
	end
	if self.isSponsored ~= nil then
		var3577.is_sponsored = propTypesModule.BoolProp.jsonDecode(self.isSponsored)
	end
	return var3577
end

t_175.descriptor = {
	name = "SetGameTileNotInterestedAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SetGameTileNotInterestedAction_Params = t_175
typeRegistryModule.default:register(t.SetGameTileNotInterestedAction_Params)
local t_176 = {}
t_176.__index = t_176

function t_176.new(p176)
	-- upvalues: t (ref), t_176 (ref)
	return setmetatable({
		action_type = if p176 == nil or p176.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p176.action_type,
		action_params = if p176 == nil or p176.action_params == nil then nil else p176.action_params
	}, t_176)
end

function t_176:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3577 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3578, var3579 = protoModule.writeTag(buff, var3577, 1, protoModule.wireTypes.varint)
		var3578, var5846 = protoModule.writeVarInt(var3578, var3579, t.ActionType.toNumber(self.action_type))
		buff = var3578
		var3577 = var3579
	end
	if self.action_params ~= nil then
		local var3580 = self.action_params:encode()
		local var3581, var3582 = protoModule.writeTag(buff, var3577, 2, protoModule.wireTypes.lengthDelimited)
		var3581, var5849 = protoModule.writeBuffer(var3581, var3582, var3580, buffer.len(var3580))
		buff = var3581
		var3577 = var3582
	end
	local buff_1 = buffer.create(var3577)
	buffer.copy(buff_1, 0, buff, 0, var3577)
	
	return buff_1
end

function t_176.decode(p176)
	-- upvalues: t_176 (ref), protoModule (ref), t (ref)
	local var3577 = t_176.new()
	local var3578 = 0
	while var3578 < buffer.len(p176) do
		local _ = nil
		local var3579 = nil
		local var3580, var3581, var3582 = protoModule.readTag(p176, var3578)
		local var3583 = var3580
		var3579 = var3581
		var3578 = var3582
		
		if var3579 == protoModule.wireTypes.varint then
			if var3583 == 1 then
				local _ = nil
				local var3584, var3585 = protoModule.readVarIntI32(p176, var3578)
				local var3586 = var3584
				var3578 = var3585
				var3577.action_type = t.ActionType.fromNumber(var3586) or var3586
			else
				local _ = nil
				local var3587, var3588 = protoModule.readVarInt(p176, var3578)
				local _ = var3587
				var3578 = var3588
			end
		end
		if var3579 == protoModule.wireTypes.lengthDelimited then
			if var3583 == 2 then
				local _ = nil
				local var3589, var3590 = protoModule.readBuffer(p176, var3578)
				var3578 = var3590
				var3577.action_params = t.UndoGameTileNotInterestedAction_Params.decode(var3589)
			else
				local _ = nil
				local var3591, var3592 = protoModule.readVarInt(p176, var3578)
				var3578 = var3592 + var3591
			end
		elseif var3579 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3593, var3594 = protoModule.readFixed32(p176, var3578)
			local _ = var3593
			var3578 = var3594
		elseif var3579 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3595, var3596 = protoModule.readFixed64(p176, var3578)
			local _ = var3595
			var3578 = var3596
		else
			error("Unsupported wire type: " .. var5853)
		end
	end
	return var3577
end

function t_176:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_176:jsonDecode()
	-- upvalues: t_176 (ref), t (ref)
	local var3597 = t_176.new()
	
	if self.action_type ~= nil then
		var3597.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3597.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3597.action_params = t.UndoGameTileNotInterestedAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3597.action_params = t.UndoGameTileNotInterestedAction_Params.jsonDecode(self.actionParams)
	end
	return var3597
end

t_176.descriptor = {
	name = "UndoGameTileNotInterestedAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.UndoGameTileNotInterestedAction"
}
t.UndoGameTileNotInterestedAction = t_176
typeRegistryModule.default:register(t.UndoGameTileNotInterestedAction)
local t_177 = {}
t_177.__index = t_177

function t_177.new(p177)
	-- upvalues: t_177 (ref)
	return setmetatable({
		universe_id = if p177 == nil or p177.universe_id == nil then nil else p177.universe_id,
		collection_id = if p177 == nil or p177.collection_id == nil then nil else p177.collection_id
	}, t_177)
end

function t_177:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3597 = 0
	
	if self.universe_id ~= nil then
		local var3598 = self.universe_id:encode()
		local var3599, var3600 = protoModule.writeTag(buff, var3597, 1, protoModule.wireTypes.lengthDelimited)
		var3599, var5877 = protoModule.writeBuffer(var3599, var3600, var3598, buffer.len(var3598))
		buff = var3599
		var3597 = var3600
	end
	if self.collection_id ~= nil then
		local var3601 = self.collection_id:encode()
		local var3602, var3603 = protoModule.writeTag(buff, var3597, 2, protoModule.wireTypes.lengthDelimited)
		var3602, var5880 = protoModule.writeBuffer(var3602, var3603, var3601, buffer.len(var3601))
		buff = var3602
		var3597 = var3603
	end
	local buff_1 = buffer.create(var3597)
	buffer.copy(buff_1, 0, buff, 0, var3597)
	
	return buff_1
end

function t_177.decode(p177)
	-- upvalues: t_177 (ref), protoModule (ref), propTypesModule (ref)
	local var3597 = t_177.new()
	local var3598 = 0
	while var3598 < buffer.len(p177) do
		local _ = nil
		local var3599 = nil
		local var3600, var3601, var3602 = protoModule.readTag(p177, var3598)
		local var3603 = var3600
		var3599 = var3601
		var3598 = var3602
		
		if var3599 == protoModule.wireTypes.varint then
			local _ = nil
			local var3604, var3605 = protoModule.readVarInt(p177, var3598)
			local _ = var3604
			var3598 = var3605
			continue
		end
		if var3599 == protoModule.wireTypes.lengthDelimited then
			if var3603 == 1 then
				local _ = nil
				local var3606, var3607 = protoModule.readBuffer(p177, var3598)
				var3598 = var3607
				var3597.universe_id = propTypesModule.StringProp.decode(var3606)
			elseif var3603 == 2 then
				local _ = nil
				local var3608, var3609 = protoModule.readBuffer(p177, var3598)
				var3598 = var3609
				var3597.collection_id = propTypesModule.StringProp.decode(var3608)
			else
				local _ = nil
				local var3610, var3611 = protoModule.readVarInt(p177, var3598)
				var3598 = var3611 + var3610
			end
		elseif var3599 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3612, var3613 = protoModule.readFixed32(p177, var3598)
			local _ = var3612
			var3598 = var3613
		elseif var3599 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3614, var3615 = protoModule.readFixed64(p177, var3598)
			local _ = var3614
			var3598 = var3615
		else
			error("Unsupported wire type: " .. var5884)
		end
	end
	return var3597
end

function t_177:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.collection_id ~= nil then
		t.collectionId = self.collection_id:jsonEncode()
	end
	return t
end

function t_177:jsonDecode()
	-- upvalues: t_177 (ref), propTypesModule (ref)
	local var3616 = t_177.new()
	
	if self.universe_id ~= nil then
		var3616.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3616.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.collection_id ~= nil then
		var3616.collection_id = propTypesModule.StringProp.jsonDecode(self.collection_id)
	end
	if self.collectionId ~= nil then
		var3616.collection_id = propTypesModule.StringProp.jsonDecode(self.collectionId)
	end
	return var3616
end

t_177.descriptor = {
	name = "UndoGameTileNotInterestedAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.UndoGameTileNotInterestedAction_Params = t_177
typeRegistryModule.default:register(t.UndoGameTileNotInterestedAction_Params)
local t_178 = {}
t_178.__index = t_178

function t_178.new(p178)
	-- upvalues: t (ref), t_178 (ref)
	return setmetatable({
		action_type = if p178 == nil or p178.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p178.action_type,
		action_params = if p178 == nil or p178.action_params == nil then nil else p178.action_params
	}, t_178)
end

function t_178:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3616 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3617, var3618 = protoModule.writeTag(buff, var3616, 1, protoModule.wireTypes.varint)
		var3617, var5906 = protoModule.writeVarInt(var3617, var3618, t.ActionType.toNumber(self.action_type))
		buff = var3617
		var3616 = var3618
	end
	if self.action_params ~= nil then
		local var3619 = self.action_params:encode()
		local var3620, var3621 = protoModule.writeTag(buff, var3616, 2, protoModule.wireTypes.lengthDelimited)
		var3620, var5909 = protoModule.writeBuffer(var3620, var3621, var3619, buffer.len(var3619))
		buff = var3620
		var3616 = var3621
	end
	local buff_1 = buffer.create(var3616)
	buffer.copy(buff_1, 0, buff, 0, var3616)
	
	return buff_1
end

function t_178.decode(p178)
	-- upvalues: t_178 (ref), protoModule (ref), t (ref)
	local var3616 = t_178.new()
	local var3617 = 0
	while var3617 < buffer.len(p178) do
		local _ = nil
		local var3618 = nil
		local var3619, var3620, var3621 = protoModule.readTag(p178, var3617)
		local var3622 = var3619
		var3618 = var3620
		var3617 = var3621
		
		if var3618 == protoModule.wireTypes.varint then
			if var3622 == 1 then
				local _ = nil
				local var3623, var3624 = protoModule.readVarIntI32(p178, var3617)
				local var3625 = var3623
				var3617 = var3624
				var3616.action_type = t.ActionType.fromNumber(var3625) or var3625
			else
				local _ = nil
				local var3626, var3627 = protoModule.readVarInt(p178, var3617)
				local _ = var3626
				var3617 = var3627
			end
		end
		if var3618 == protoModule.wireTypes.lengthDelimited then
			if var3622 == 2 then
				local _ = nil
				local var3628, var3629 = protoModule.readBuffer(p178, var3617)
				var3617 = var3629
				var3616.action_params = t.OpenWhyThisAdAction_Params.decode(var3628)
			else
				local _ = nil
				local var3630, var3631 = protoModule.readVarInt(p178, var3617)
				var3617 = var3631 + var3630
			end
		elseif var3618 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3632, var3633 = protoModule.readFixed32(p178, var3617)
			local _ = var3632
			var3617 = var3633
		elseif var3618 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3634, var3635 = protoModule.readFixed64(p178, var3617)
			local _ = var3634
			var3617 = var3635
		else
			error("Unsupported wire type: " .. var5913)
		end
	end
	return var3616
end

function t_178:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_178:jsonDecode()
	-- upvalues: t_178 (ref), t (ref)
	local var3636 = t_178.new()
	
	if self.action_type ~= nil then
		var3636.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3636.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3636.action_params = t.OpenWhyThisAdAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3636.action_params = t.OpenWhyThisAdAction_Params.jsonDecode(self.actionParams)
	end
	return var3636
end

t_178.descriptor = {
	name = "OpenWhyThisAdAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenWhyThisAdAction"
}
t.OpenWhyThisAdAction = t_178
typeRegistryModule.default:register(t.OpenWhyThisAdAction)
local t_179 = {}
t_179.__index = t_179

function t_179.new(p179)
	-- upvalues: t_179 (ref)
	return setmetatable({
		universe_id = if p179 == nil or p179.universe_id == nil then nil else p179.universe_id,
		payer_name = if p179 == nil or p179.payer_name == nil then nil else p179.payer_name,
		sponsored_user_cohort = if p179 == nil or p179.sponsored_user_cohort == nil then nil else p179.sponsored_user_cohort,
		content_type = if p179 == nil or p179.content_type == nil then nil else p179.content_type
	}, t_179)
end

function t_179:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3636 = 0
	
	if self.universe_id ~= nil then
		local var3637 = self.universe_id:encode()
		local var3638, var3639 = protoModule.writeTag(buff, var3636, 1, protoModule.wireTypes.lengthDelimited)
		var3638, var5937 = protoModule.writeBuffer(var3638, var3639, var3637, buffer.len(var3637))
		buff = var3638
		var3636 = var3639
	end
	if self.payer_name ~= nil then
		local var3640 = self.payer_name:encode()
		local var3641, var3642 = protoModule.writeTag(buff, var3636, 2, protoModule.wireTypes.lengthDelimited)
		var3641, var5940 = protoModule.writeBuffer(var3641, var3642, var3640, buffer.len(var3640))
		buff = var3641
		var3636 = var3642
	end
	if self.sponsored_user_cohort ~= nil then
		local var3643 = self.sponsored_user_cohort:encode()
		local var3644, var3645 = protoModule.writeTag(buff, var3636, 3, protoModule.wireTypes.lengthDelimited)
		var3644, var5943 = protoModule.writeBuffer(var3644, var3645, var3643, buffer.len(var3643))
		buff = var3644
		var3636 = var3645
	end
	if self.content_type ~= nil then
		local var3646 = self.content_type:encode()
		local var3647, var3648 = protoModule.writeTag(buff, var3636, 4, protoModule.wireTypes.lengthDelimited)
		var3647, var5946 = protoModule.writeBuffer(var3647, var3648, var3646, buffer.len(var3646))
		buff = var3647
		var3636 = var3648
	end
	local buff_1 = buffer.create(var3636)
	buffer.copy(buff_1, 0, buff, 0, var3636)
	
	return buff_1
end

function t_179.decode(p179)
	-- upvalues: t_179 (ref), protoModule (ref), propTypesModule (ref)
	local var3636 = t_179.new()
	local var3637 = 0
	while var3637 < buffer.len(p179) do
		local _ = nil
		local var3638 = nil
		local var3639, var3640, var3641 = protoModule.readTag(p179, var3637)
		local var3642 = var3639
		var3638 = var3640
		var3637 = var3641
		
		if var3638 == protoModule.wireTypes.varint then
			local _ = nil
			local var3643, var3644 = protoModule.readVarInt(p179, var3637)
			local _ = var3643
			var3637 = var3644
			continue
		end
		if var3638 == protoModule.wireTypes.lengthDelimited then
			if var3642 == 1 then
				local _ = nil
				local var3645, var3646 = protoModule.readBuffer(p179, var3637)
				var3637 = var3646
				var3636.universe_id = propTypesModule.StringProp.decode(var3645)
			elseif var3642 == 2 then
				local _ = nil
				local var3647, var3648 = protoModule.readBuffer(p179, var3637)
				var3637 = var3648
				var3636.payer_name = propTypesModule.StringProp.decode(var3647)
			elseif var3642 == 3 then
				local _ = nil
				local var3649, var3650 = protoModule.readBuffer(p179, var3637)
				var3637 = var3650
				var3636.sponsored_user_cohort = propTypesModule.StringProp.decode(var3649)
			elseif var3642 == 4 then
				local _ = nil
				local var3651, var3652 = protoModule.readBuffer(p179, var3637)
				var3637 = var3652
				var3636.content_type = propTypesModule.StringProp.decode(var3651)
			else
				local _ = nil
				local var3653, var3654 = protoModule.readVarInt(p179, var3637)
				var3637 = var3654 + var3653
			end
		elseif var3638 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3655, var3656 = protoModule.readFixed32(p179, var3637)
			local _ = var3655
			var3637 = var3656
		elseif var3638 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3657, var3658 = protoModule.readFixed64(p179, var3637)
			local _ = var3657
			var3637 = var3658
		else
			error("Unsupported wire type: " .. var5950)
		end
	end
	return var3636
end

function t_179:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.payer_name ~= nil then
		t.payerName = self.payer_name:jsonEncode()
	end
	if self.sponsored_user_cohort ~= nil then
		t.sponsoredUserCohort = self.sponsored_user_cohort:jsonEncode()
	end
	if self.content_type ~= nil then
		t.contentType = self.content_type:jsonEncode()
	end
	return t
end

function t_179:jsonDecode()
	-- upvalues: t_179 (ref), propTypesModule (ref)
	local var3659 = t_179.new()
	
	if self.universe_id ~= nil then
		var3659.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3659.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.payer_name ~= nil then
		var3659.payer_name = propTypesModule.StringProp.jsonDecode(self.payer_name)
	end
	if self.payerName ~= nil then
		var3659.payer_name = propTypesModule.StringProp.jsonDecode(self.payerName)
	end
	if self.sponsored_user_cohort ~= nil then
		var3659.sponsored_user_cohort = propTypesModule.StringProp.jsonDecode(self.sponsored_user_cohort)
	end
	if self.sponsoredUserCohort ~= nil then
		var3659.sponsored_user_cohort = propTypesModule.StringProp.jsonDecode(self.sponsoredUserCohort)
	end
	if self.content_type ~= nil then
		var3659.content_type = propTypesModule.StringProp.jsonDecode(self.content_type)
	end
	if self.contentType ~= nil then
		var3659.content_type = propTypesModule.StringProp.jsonDecode(self.contentType)
	end
	return var3659
end

t_179.descriptor = {
	name = "OpenWhyThisAdAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenWhyThisAdAction_Params = t_179
typeRegistryModule.default:register(t.OpenWhyThisAdAction_Params)
local t_180 = {}
t_180.__index = t_180

function t_180.new(p180)
	-- upvalues: t (ref), t_180 (ref)
	return setmetatable({
		action_type = if p180 == nil or p180.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p180.action_type,
		action_params = if p180 == nil or p180.action_params == nil then nil else p180.action_params
	}, t_180)
end

function t_180:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var3659 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3660, var3661 = protoModule.writeTag(buff, var3659, 1, protoModule.wireTypes.varint)
		var3660, var5976 = protoModule.writeVarInt(var3660, var3661, t.ActionType.toNumber(self.action_type))
		buff = var3660
		var3659 = var3661
	end
	if self.action_params ~= nil then
		local var3662 = self.action_params:encode()
		local var3663, var3664 = protoModule.writeTag(buff, var3659, 2, protoModule.wireTypes.lengthDelimited)
		var3663, var5979 = protoModule.writeBuffer(var3663, var3664, var3662, buffer.len(var3662))
		buff = var3663
		var3659 = var3664
	end
	local buff_1 = buffer.create(var3659)
	buffer.copy(buff_1, 0, buff, 0, var3659)
	
	return buff_1
end

function t_180.decode(p180)
	-- upvalues: t_180 (ref), protoModule (ref), t (ref)
	local var3659 = t_180.new()
	local var3660 = 0
	while var3660 < buffer.len(p180) do
		local _ = nil
		local var3661 = nil
		local var3662, var3663, var3664 = protoModule.readTag(p180, var3660)
		local var3665 = var3662
		var3661 = var3663
		var3660 = var3664
		
		if var3661 == protoModule.wireTypes.varint then
			if var3665 == 1 then
				local _ = nil
				local var3666, var3667 = protoModule.readVarIntI32(p180, var3660)
				local var3668 = var3666
				var3660 = var3667
				var3659.action_type = t.ActionType.fromNumber(var3668) or var3668
			else
				local _ = nil
				local var3669, var3670 = protoModule.readVarInt(p180, var3660)
				local _ = var3669
				var3660 = var3670
			end
		end
		if var3661 == protoModule.wireTypes.lengthDelimited then
			if var3665 == 2 then
				local _ = nil
				local var3671, var3672 = protoModule.readBuffer(p180, var3660)
				var3660 = var3672
				var3659.action_params = t.RequestPushNotificationPermissionAction_Params.decode(var3671)
			else
				local _ = nil
				local var3673, var3674 = protoModule.readVarInt(p180, var3660)
				var3660 = var3674 + var3673
			end
		elseif var3661 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3675, var3676 = protoModule.readFixed32(p180, var3660)
			local _ = var3675
			var3660 = var3676
		elseif var3661 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3677, var3678 = protoModule.readFixed64(p180, var3660)
			local _ = var3677
			var3660 = var3678
		else
			error("Unsupported wire type: " .. var5983)
		end
	end
	return var3659
end

function t_180:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t_1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t_1.actionParams = self.action_params:jsonEncode()
	end
	return t_1
end

function t_180:jsonDecode()
	-- upvalues: t_180 (ref), t (ref)
	local var3679 = t_180.new()
	
	if self.action_type ~= nil then
		var3679.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3679.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3679.action_params = t.RequestPushNotificationPermissionAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3679.action_params = t.RequestPushNotificationPermissionAction_Params.jsonDecode(self.actionParams)
	end
	return var3679
end

t_180.descriptor = {
	name = "RequestPushNotificationPermissionAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RequestPushNotificationPermissionAction"
}
t.RequestPushNotificationPermissionAction = t_180
typeRegistryModule.default:register(t.RequestPushNotificationPermissionAction)
local t_181 = {}
t_181.__index = t_181

function t_181.new(p181)
	-- upvalues: t_181 (ref)
	return setmetatable({
		source = if p181 == nil or p181.source == nil then nil else p181.source
	}, t_181)
end

function t_181:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3679 = 0
	
	if self.source ~= nil then
		local var3680 = self.source:encode()
		local var3681, var3682 = protoModule.writeTag(buff, var3679, 1, protoModule.wireTypes.lengthDelimited)
		var3681, var6007 = protoModule.writeBuffer(var3681, var3682, var3680, buffer.len(var3680))
		buff = var3681
		var3679 = var3682
	end
	local buff_1 = buffer.create(var3679)
	buffer.copy(buff_1, 0, buff, 0, var3679)
	
	return buff_1
end

function t_181.decode(p181)
	-- upvalues: t_181 (ref), protoModule (ref), propTypesModule (ref)
	local var3679 = t_181.new()
	local var3680 = 0
	while var3680 < buffer.len(p181) do
		local _ = nil
		local var3681 = nil
		local var3682, var3683, var3684 = protoModule.readTag(p181, var3680)
		local var3685 = var3682
		var3681 = var3683
		var3680 = var3684
		
		if var3681 == protoModule.wireTypes.varint then
			local _ = nil
			local var3686, var3687 = protoModule.readVarInt(p181, var3680)
			local _ = var3686
			var3680 = var3687
			continue
		end
		if var3681 == protoModule.wireTypes.lengthDelimited then
			if var3685 == 1 then
				local _ = nil
				local var3688, var3689 = protoModule.readBuffer(p181, var3680)
				var3680 = var3689
				var3679.source = propTypesModule.StringProp.decode(var3688)
			else
				local _ = nil
				local var3690, var3691 = protoModule.readVarInt(p181, var3680)
				var3680 = var3691 + var3690
			end
		elseif var3681 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3692, var3693 = protoModule.readFixed32(p181, var3680)
			local _ = var3692
			var3680 = var3693
		elseif var3681 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3694, var3695 = protoModule.readFixed64(p181, var3680)
			local _ = var3694
			var3680 = var3695
		else
			error("Unsupported wire type: " .. var6011)
		end
	end
	return var3679
end

function t_181:jsonEncode()
	local t = {}
	
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function t_181:jsonDecode()
	-- upvalues: t_181 (ref), propTypesModule (ref)
	local var3696 = t_181.new()
	
	if self.source ~= nil then
		var3696.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var3696
end

t_181.descriptor = {
	name = "RequestPushNotificationPermissionAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RequestPushNotificationPermissionAction_Params = t_181
typeRegistryModule.default:register(t.RequestPushNotificationPermissionAction_Params)
local t_182 = {}
t_182.__index = t_182

function t_182.new(p182)
	-- upvalues: t_182 (ref)
	return setmetatable({
		kind = if p182 == nil or p182.kind == nil then nil else p182.kind,
		telemetry_handler = if p182 == nil or p182.telemetry_handler == nil then nil else p182.telemetry_handler,
		accessibility_label = if p182 == nil or p182.accessibility_label == nil then nil else p182.accessibility_label,
		skip_unified_logging = if p182 == nil or p182.skip_unified_logging == nil then nil else p182.skip_unified_logging,
		action_event_name = if p182 == nil or p182.action_event_name == nil then nil else p182.action_event_name
	}, t_182)
end

function t_182:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3696 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "dismiss_dialog_action" then
			local var3697 = self.kind.value:encode()
			local var3698, var3699 = protoModule.writeTag(buff, var3696, 1, protoModule.wireTypes.lengthDelimited)
			var3698, var6032 = protoModule.writeBuffer(var3698, var3699, var3697, buffer.len(var3697))
			buff = var3698
			var3696 = var3699
		elseif self.kind.type == "link_action" then
			local var3700 = self.kind.value:encode()
			local var3701, var3702 = protoModule.writeTag(buff, var3696, 2, protoModule.wireTypes.lengthDelimited)
			var3701, var6035 = protoModule.writeBuffer(var3701, var3702, var3700, buffer.len(var3700))
			buff = var3701
			var3696 = var3702
		elseif self.kind.type == "open_game_details_action" then
			local var3703 = self.kind.value:encode()
			local var3704, var3705 = protoModule.writeTag(buff, var3696, 3, protoModule.wireTypes.lengthDelimited)
			var3704, var6038 = protoModule.writeBuffer(var3704, var3705, var3703, buffer.len(var3703))
			buff = var3704
			var3696 = var3705
		elseif self.kind.type == "open_join_friends_action" then
			local var3706 = self.kind.value:encode()
			local var3707, var3708 = protoModule.writeTag(buff, var3696, 4, protoModule.wireTypes.lengthDelimited)
			var3707, var6041 = protoModule.writeBuffer(var3707, var3708, var3706, buffer.len(var3706))
			buff = var3707
			var3696 = var3708
		elseif self.kind.type == "open_marketplace_try_on_action" then
			local var3709 = self.kind.value:encode()
			local var3710, var3711 = protoModule.writeTag(buff, var3696, 5, protoModule.wireTypes.lengthDelimited)
			var3710, var6044 = protoModule.writeBuffer(var3710, var3711, var3709, buffer.len(var3709))
			buff = var3710
			var3696 = var3711
		elseif self.kind.type == "open_see_all_action" then
			local var3712 = self.kind.value:encode()
			local var3713, var3714 = protoModule.writeTag(buff, var3696, 6, protoModule.wireTypes.lengthDelimited)
			var3713, var6047 = protoModule.writeBuffer(var3713, var3714, var3712, buffer.len(var3712))
			buff = var3713
			var3696 = var3714
		elseif self.kind.type == "open_sponsored_tooltip_action" then
			local var3715 = self.kind.value:encode()
			local var3716, var3717 = protoModule.writeTag(buff, var3696, 7, protoModule.wireTypes.lengthDelimited)
			var3716, var6050 = protoModule.writeBuffer(var3716, var3717, var3715, buffer.len(var3715))
			buff = var3716
			var3696 = var3717
		elseif self.kind.type == "play_button_click_action" then
			local var3718 = self.kind.value:encode()
			local var3719, var3720 = protoModule.writeTag(buff, var3696, 8, protoModule.wireTypes.lengthDelimited)
			var3719, var6053 = protoModule.writeBuffer(var3719, var3720, var3718, buffer.len(var3718))
			buff = var3719
			var3696 = var3720
		elseif self.kind.type == "update_user_settings_action" then
			local var3721 = self.kind.value:encode()
			local var3722, var3723 = protoModule.writeTag(buff, var3696, 9, protoModule.wireTypes.lengthDelimited)
			var3722, var6056 = protoModule.writeBuffer(var3722, var3723, var3721, buffer.len(var3721))
			buff = var3722
			var3696 = var3723
		elseif self.kind.type == "open_tooltip_action" then
			local var3724 = self.kind.value:encode()
			local var3725, var3726 = protoModule.writeTag(buff, var3696, 10, protoModule.wireTypes.lengthDelimited)
			var3725, var6059 = protoModule.writeBuffer(var3725, var3726, var3724, buffer.len(var3724))
			buff = var3725
			var3696 = var3726
		elseif self.kind.type == "open_badge_details_action" then
			local var3727 = self.kind.value:encode()
			local var3728, var3729 = protoModule.writeTag(buff, var3696, 11, protoModule.wireTypes.lengthDelimited)
			var3728, var6062 = protoModule.writeBuffer(var3728, var3729, var3727, buffer.len(var3727))
			buff = var3728
			var3696 = var3729
		elseif self.kind.type == "load_more_from_api_action" then
			local var3730 = self.kind.value:encode()
			local var3731, var3732 = protoModule.writeTag(buff, var3696, 12, protoModule.wireTypes.lengthDelimited)
			var3731, var6065 = protoModule.writeBuffer(var3731, var3732, var3730, buffer.len(var3730))
			buff = var3731
			var3696 = var3732
		elseif self.kind.type == "share_action" then
			local var3733 = self.kind.value:encode()
			local var3734, var3735 = protoModule.writeTag(buff, var3696, 13, protoModule.wireTypes.lengthDelimited)
			var3734, var6068 = protoModule.writeBuffer(var3734, var3735, var3733, buffer.len(var3733))
			buff = var3734
			var3696 = var3735
		elseif self.kind.type == "open_abuse_report_action" then
			local var3736 = self.kind.value:encode()
			local var3737, var3738 = protoModule.writeTag(buff, var3696, 14, protoModule.wireTypes.lengthDelimited)
			var3737, var6071 = protoModule.writeBuffer(var3737, var3738, var3736, buffer.len(var3736))
			buff = var3737
			var3696 = var3738
		elseif self.kind.type == "remove_badge_from_inventory_action" then
			local var3739 = self.kind.value:encode()
			local var3740, var3741 = protoModule.writeTag(buff, var3696, 15, protoModule.wireTypes.lengthDelimited)
			var3740, var6074 = protoModule.writeBuffer(var3740, var3741, var3739, buffer.len(var3739))
			buff = var3740
			var3696 = var3741
		elseif self.kind.type == "open_profile_action" then
			local var3742 = self.kind.value:encode()
			local var3743, var3744 = protoModule.writeTag(buff, var3696, 16, protoModule.wireTypes.lengthDelimited)
			var3743, var6077 = protoModule.writeBuffer(var3743, var3744, var3742, buffer.len(var3742))
			buff = var3743
			var3696 = var3744
		elseif self.kind.type == "open_facial_age_estimation_action" then
			local var3745 = self.kind.value:encode()
			local var3746, var3747 = protoModule.writeTag(buff, var3696, 17, protoModule.wireTypes.lengthDelimited)
			var3746, var6080 = protoModule.writeBuffer(var3746, var3747, var3745, buffer.len(var3745))
			buff = var3746
			var3696 = var3747
		elseif self.kind.type == "open_add_connections_page_action" then
			local var3748 = self.kind.value:encode()
			local var3749, var3750 = protoModule.writeTag(buff, var3696, 18, protoModule.wireTypes.lengthDelimited)
			var3749, var6083 = protoModule.writeBuffer(var3749, var3750, var3748, buffer.len(var3748))
			buff = var3749
			var3696 = var3750
		elseif self.kind.type == "open_marketplace_action" then
			local var3751 = self.kind.value:encode()
			local var3752, var3753 = protoModule.writeTag(buff, var3696, 19, protoModule.wireTypes.lengthDelimited)
			var3752, var6086 = protoModule.writeBuffer(var3752, var3753, var3751, buffer.len(var3751))
			buff = var3752
			var3696 = var3753
		elseif self.kind.type == "hide_profile_completion_action" then
			local var3754 = self.kind.value:encode()
			local var3755, var3756 = protoModule.writeTag(buff, var3696, 20, protoModule.wireTypes.lengthDelimited)
			var3755, var6089 = protoModule.writeBuffer(var3755, var3756, var3754, buffer.len(var3754))
			buff = var3755
			var3696 = var3756
		elseif self.kind.type == "select_marketplace_catalog_category" then
			local var3757 = self.kind.value:encode()
			local var3758, var3759 = protoModule.writeTag(buff, var3696, 21, protoModule.wireTypes.lengthDelimited)
			var3758, var6092 = protoModule.writeBuffer(var3758, var3759, var3757, buffer.len(var3757))
			buff = var3758
			var3696 = var3759
		elseif self.kind.type == "select_marketplace_catalog_subcategory" then
			local var3760 = self.kind.value:encode()
			local var3761, var3762 = protoModule.writeTag(buff, var3696, 22, protoModule.wireTypes.lengthDelimited)
			var3761, var6095 = protoModule.writeBuffer(var3761, var3762, var3760, buffer.len(var3760))
			buff = var3761
			var3696 = var3762
		elseif self.kind.type == "open_marketplace_catalog_see_all" then
			local var3763 = self.kind.value:encode()
			local var3764, var3765 = protoModule.writeTag(buff, var3696, 23, protoModule.wireTypes.lengthDelimited)
			var3764, var6098 = protoModule.writeBuffer(var3764, var3765, var3763, buffer.len(var3763))
			buff = var3764
			var3696 = var3765
		elseif self.kind.type == "close_marketplace_category_tooltip" then
			local var3766 = self.kind.value:encode()
			local var3767, var3768 = protoModule.writeTag(buff, var3696, 24, protoModule.wireTypes.lengthDelimited)
			var3767, var6101 = protoModule.writeBuffer(var3767, var3768, var3766, buffer.len(var3766))
			buff = var3767
			var3696 = var3768
		elseif self.kind.type == "resize_marketplace_catalog" then
			local var3769 = self.kind.value:encode()
			local var3770, var3771 = protoModule.writeTag(buff, var3696, 25, protoModule.wireTypes.lengthDelimited)
			var3770, var6104 = protoModule.writeBuffer(var3770, var3771, var3769, buffer.len(var3769))
			buff = var3770
			var3696 = var3771
		elseif self.kind.type == "open_marketplace_catalog_filters" then
			local var3772 = self.kind.value:encode()
			local var3773, var3774 = protoModule.writeTag(buff, var3696, 26, protoModule.wireTypes.lengthDelimited)
			var3773, var6107 = protoModule.writeBuffer(var3773, var3774, var3772, buffer.len(var3772))
			buff = var3773
			var3696 = var3774
		elseif self.kind.type == "open_social_link_action" then
			local var3775 = self.kind.value:encode()
			local var3776, var3777 = protoModule.writeTag(buff, var3696, 27, protoModule.wireTypes.lengthDelimited)
			var3776, var6110 = protoModule.writeBuffer(var3776, var3777, var3775, buffer.len(var3775))
			buff = var3776
			var3696 = var3777
		elseif self.kind.type == "open_charts_sort_detail_action" then
			local var3778 = self.kind.value:encode()
			local var3779, var3780 = protoModule.writeTag(buff, var3696, 28, protoModule.wireTypes.lengthDelimited)
			var3779, var6113 = protoModule.writeBuffer(var3779, var3780, var3778, buffer.len(var3778))
			buff = var3779
			var3696 = var3780
		elseif self.kind.type == "open_song_detail_action" then
			local var3781 = self.kind.value:encode()
			local var3782, var3783 = protoModule.writeTag(buff, var3696, 29, protoModule.wireTypes.lengthDelimited)
			var3782, var6116 = protoModule.writeBuffer(var3782, var3783, var3781, buffer.len(var3781))
			buff = var3782
			var3696 = var3783
		elseif self.kind.type == "refresh_from_api_action" then
			local var3784 = self.kind.value:encode()
			local var3785, var3786 = protoModule.writeTag(buff, var3696, 30, protoModule.wireTypes.lengthDelimited)
			var3785, var6119 = protoModule.writeBuffer(var3785, var3786, var3784, buffer.len(var3784))
			buff = var3785
			var3696 = var3786
		elseif self.kind.type == "rsvp_to_event_action" then
			local var3787 = self.kind.value:encode()
			local var3788, var3789 = protoModule.writeTag(buff, var3696, 31, protoModule.wireTypes.lengthDelimited)
			var3788, var6122 = protoModule.writeBuffer(var3788, var3789, var3787, buffer.len(var3787))
			buff = var3788
			var3696 = var3789
		elseif self.kind.type == "apply_charts_filter_action" then
			local var3790 = self.kind.value:encode()
			local var3791, var3792 = protoModule.writeTag(buff, var3696, 32, protoModule.wireTypes.lengthDelimited)
			var3791, var6125 = protoModule.writeBuffer(var3791, var3792, var3790, buffer.len(var3790))
			buff = var3791
			var3696 = var3792
		elseif self.kind.type == "analytics_event_action" then
			local var3793 = self.kind.value:encode()
			local var3794, var3795 = protoModule.writeTag(buff, var3696, 33, protoModule.wireTypes.lengthDelimited)
			var3794, var6128 = protoModule.writeBuffer(var3794, var3795, var3793, buffer.len(var3793))
			buff = var3794
			var3696 = var3795
		elseif self.kind.type == "custom_analytics_event_action" then
			local var3796 = self.kind.value:encode()
			local var3797, var3798 = protoModule.writeTag(buff, var3696, 34, protoModule.wireTypes.lengthDelimited)
			var3797, var6131 = protoModule.writeBuffer(var3797, var3798, var3796, buffer.len(var3796))
			buff = var3797
			var3696 = var3798
		elseif self.kind.type == "open_game_invite_action" then
			local var3799 = self.kind.value:encode()
			local var3800, var3801 = protoModule.writeTag(buff, var3696, 35, protoModule.wireTypes.lengthDelimited)
			var3800, var6134 = protoModule.writeBuffer(var3800, var3801, var3799, buffer.len(var3799))
			buff = var3800
			var3696 = var3801
		elseif self.kind.type == "open_event_details_action" then
			local var3802 = self.kind.value:encode()
			local var3803, var3804 = protoModule.writeTag(buff, var3696, 36, protoModule.wireTypes.lengthDelimited)
			var3803, var6137 = protoModule.writeBuffer(var3803, var3804, var3802, buffer.len(var3802))
			buff = var3803
			var3696 = var3804
		elseif self.kind.type == "launch_experience_action" then
			local var3805 = self.kind.value:encode()
			local var3806, var3807 = protoModule.writeTag(buff, var3696, 37, protoModule.wireTypes.lengthDelimited)
			var3806, var6140 = protoModule.writeBuffer(var3806, var3807, var3805, buffer.len(var3805))
			buff = var3806
			var3696 = var3807
		elseif self.kind.type == "toggle_experience_favorite_action" then
			local var3808 = self.kind.value:encode()
			local var3809, var3810 = protoModule.writeTag(buff, var3696, 38, protoModule.wireTypes.lengthDelimited)
			var3809, var6143 = protoModule.writeBuffer(var3809, var3810, var3808, buffer.len(var3808))
			buff = var3809
			var3696 = var3810
		elseif self.kind.type == "toggle_experience_follow_action" then
			local var3811 = self.kind.value:encode()
			local var3812, var3813 = protoModule.writeTag(buff, var3696, 39, protoModule.wireTypes.lengthDelimited)
			var3812, var6146 = protoModule.writeBuffer(var3812, var3813, var3811, buffer.len(var3811))
			buff = var3812
			var3696 = var3813
		elseif self.kind.type == "toggle_experience_vote_action" then
			local var3814 = self.kind.value:encode()
			local var3815, var3816 = protoModule.writeTag(buff, var3696, 40, protoModule.wireTypes.lengthDelimited)
			var3815, var6149 = protoModule.writeBuffer(var3815, var3816, var3814, buffer.len(var3814))
			buff = var3815
			var3696 = var3816
		elseif self.kind.type == "open_purchase_prompt_action" then
			local var3817 = self.kind.value:encode()
			local var3818, var3819 = protoModule.writeTag(buff, var3696, 41, protoModule.wireTypes.lengthDelimited)
			var3818, var6152 = protoModule.writeBuffer(var3818, var3819, var3817, buffer.len(var3817))
			buff = var3818
			var3696 = var3819
		elseif self.kind.type == "open_sdui_overlay_action" then
			local var3820 = self.kind.value:encode()
			local var3821, var3822 = protoModule.writeTag(buff, var3696, 42, protoModule.wireTypes.lengthDelimited)
			var3821, var6155 = protoModule.writeBuffer(var3821, var3822, var3820, buffer.len(var3820))
			buff = var3821
			var3696 = var3822
		elseif self.kind.type == "open_badges_see_all_action" then
			local var3823 = self.kind.value:encode()
			local var3824, var3825 = protoModule.writeTag(buff, var3696, 43, protoModule.wireTypes.lengthDelimited)
			var3824, var6158 = protoModule.writeBuffer(var3824, var3825, var3823, buffer.len(var3823))
			buff = var3824
			var3696 = var3825
		elseif self.kind.type == "open_experience_store_see_all_action" then
			local var3826 = self.kind.value:encode()
			local var3827, var3828 = protoModule.writeTag(buff, var3696, 44, protoModule.wireTypes.lengthDelimited)
			var3827, var6161 = protoModule.writeBuffer(var3827, var3828, var3826, buffer.len(var3826))
			buff = var3827
			var3696 = var3828
		elseif self.kind.type == "dismiss_game_feedback_action" then
			local var3829 = self.kind.value:encode()
			local var3830, var3831 = protoModule.writeTag(buff, var3696, 45, protoModule.wireTypes.lengthDelimited)
			var3830, var6164 = protoModule.writeBuffer(var3830, var3831, var3829, buffer.len(var3829))
			buff = var3830
			var3696 = var3831
		elseif self.kind.type == "open_game_feedback_form_action" then
			local var3832 = self.kind.value:encode()
			local var3833, var3834 = protoModule.writeTag(buff, var3696, 46, protoModule.wireTypes.lengthDelimited)
			var3833, var6167 = protoModule.writeBuffer(var3833, var3834, var3832, buffer.len(var3832))
			buff = var3833
			var3696 = var3834
		elseif self.kind.type == "enable_event_notifications_action" then
			local var3835 = self.kind.value:encode()
			local var3836, var3837 = protoModule.writeTag(buff, var3696, 47, protoModule.wireTypes.lengthDelimited)
			var3836, var6170 = protoModule.writeBuffer(var3836, var3837, var3835, buffer.len(var3835))
			buff = var3836
			var3696 = var3837
		elseif self.kind.type == "dismiss_event_notifications_modal_action" then
			local var3838 = self.kind.value:encode()
			local var3839, var3840 = protoModule.writeTag(buff, var3696, 48, protoModule.wireTypes.lengthDelimited)
			var3839, var6173 = protoModule.writeBuffer(var3839, var3840, var3838, buffer.len(var3838))
			buff = var3839
			var3696 = var3840
		elseif self.kind.type == "open_amp_wizard_action" then
			local var3841 = self.kind.value:encode()
			local var3842, var3843 = protoModule.writeTag(buff, var3696, 49, protoModule.wireTypes.lengthDelimited)
			var3842, var6176 = protoModule.writeBuffer(var3842, var3843, var3841, buffer.len(var3841))
			buff = var3842
			var3696 = var3843
		elseif self.kind.type == "open_subscription_purchase_page_action" then
			local var3844 = self.kind.value:encode()
			local var3845, var3846 = protoModule.writeTag(buff, var3696, 50, protoModule.wireTypes.lengthDelimited)
			var3845, var6179 = protoModule.writeBuffer(var3845, var3846, var3844, buffer.len(var3844))
			buff = var3845
			var3696 = var3846
		elseif self.kind.type == "refresh_game_passes_action" then
			local var3847 = self.kind.value:encode()
			local var3848, var3849 = protoModule.writeTag(buff, var3696, 51, protoModule.wireTypes.lengthDelimited)
			var3848, var6182 = protoModule.writeBuffer(var3848, var3849, var3847, buffer.len(var3847))
			buff = var3848
			var3696 = var3849
		elseif self.kind.type == "refresh_playability_action" then
			local var3850 = self.kind.value:encode()
			local var3851, var3852 = protoModule.writeTag(buff, var3696, 52, protoModule.wireTypes.lengthDelimited)
			var3851, var6185 = protoModule.writeBuffer(var3851, var3852, var3850, buffer.len(var3850))
			buff = var3851
			var3696 = var3852
		elseif self.kind.type == "open_social_proof_user_list_sheet_action" then
			local var3853 = self.kind.value:encode()
			local var3854, var3855 = protoModule.writeTag(buff, var3696, 53, protoModule.wireTypes.lengthDelimited)
			var3854, var6188 = protoModule.writeBuffer(var3854, var3855, var3853, buffer.len(var3853))
			buff = var3854
			var3696 = var3855
		elseif self.kind.type == "report_surface_load_time_milestone_action" then
			local var3856 = self.kind.value:encode()
			local var3857, var3858 = protoModule.writeTag(buff, var3696, 54, protoModule.wireTypes.lengthDelimited)
			var3857, var6191 = protoModule.writeBuffer(var3857, var3858, var3856, buffer.len(var3856))
			buff = var3857
			var3696 = var3858
		elseif self.kind.type == "open_search_results_tab_action" then
			local var3859 = self.kind.value:encode()
			local var3860, var3861 = protoModule.writeTag(buff, var3696, 55, protoModule.wireTypes.lengthDelimited)
			var3860, var6194 = protoModule.writeBuffer(var3860, var3861, var3859, buffer.len(var3859))
			buff = var3860
			var3696 = var3861
		elseif self.kind.type == "open_phone_upsell_modal_action" then
			local var3862 = self.kind.value:encode()
			local var3863, var3864 = protoModule.writeTag(buff, var3696, 56, protoModule.wireTypes.lengthDelimited)
			var3863, var6197 = protoModule.writeBuffer(var3863, var3864, var3862, buffer.len(var3862))
			buff = var3863
			var3696 = var3864
		elseif self.kind.type == "open_email_upsell_modal_action" then
			local var3865 = self.kind.value:encode()
			local var3866, var3867 = protoModule.writeTag(buff, var3696, 57, protoModule.wireTypes.lengthDelimited)
			var3866, var6200 = protoModule.writeBuffer(var3866, var3867, var3865, buffer.len(var3865))
			buff = var3866
			var3696 = var3867
		elseif self.kind.type == "dismiss_prompt_action" then
			local var3868 = self.kind.value:encode()
			local var3869, var3870 = protoModule.writeTag(buff, var3696, 58, protoModule.wireTypes.lengthDelimited)
			var3869, var6203 = protoModule.writeBuffer(var3869, var3870, var3868, buffer.len(var3868))
			buff = var3869
			var3696 = var3870
		elseif self.kind.type == "request_friendship_action" then
			local var3871 = self.kind.value:encode()
			local var3872, var3873 = protoModule.writeTag(buff, var3696, 59, protoModule.wireTypes.lengthDelimited)
			var3872, var6206 = protoModule.writeBuffer(var3872, var3873, var3871, buffer.len(var3871))
			buff = var3872
			var3696 = var3873
		elseif self.kind.type == "refresh_developer_products_action" then
			local var3874 = self.kind.value:encode()
			local var3875, var3876 = protoModule.writeTag(buff, var3696, 60, protoModule.wireTypes.lengthDelimited)
			var3875, var6209 = protoModule.writeBuffer(var3875, var3876, var3874, buffer.len(var3874))
			buff = var3875
			var3696 = var3876
		elseif self.kind.type == "open_fae_trial_upsell_action" then
			local var3877 = self.kind.value:encode()
			local var3878, var3879 = protoModule.writeTag(buff, var3696, 61, protoModule.wireTypes.lengthDelimited)
			var3878, var6212 = protoModule.writeBuffer(var3878, var3879, var3877, buffer.len(var3877))
			buff = var3878
			var3696 = var3879
		elseif self.kind.type == "refresh_omni_recommendation_feed_item_action" then
			local var3880 = self.kind.value:encode()
			local var3881, var3882 = protoModule.writeTag(buff, var3696, 62, protoModule.wireTypes.lengthDelimited)
			var3881, var6215 = protoModule.writeBuffer(var3881, var3882, var3880, buffer.len(var3880))
			buff = var3881
			var3696 = var3882
		elseif self.kind.type == "ai_overview_feedback_action" then
			local var3883 = self.kind.value:encode()
			local var3884, var3885 = protoModule.writeTag(buff, var3696, 63, protoModule.wireTypes.lengthDelimited)
			var3884, var6218 = protoModule.writeBuffer(var3884, var3885, var3883, buffer.len(var3883))
			buff = var3884
			var3696 = var3885
		elseif self.kind.type == "open_trusted_friends_upsell_modal_action" then
			local var3886 = self.kind.value:encode()
			local var3887, var3888 = protoModule.writeTag(buff, var3696, 64, protoModule.wireTypes.lengthDelimited)
			var3887, var6221 = protoModule.writeBuffer(var3887, var3888, var3886, buffer.len(var3886))
			buff = var3887
			var3696 = var3888
		elseif self.kind.type == "record_party_chat_conversation_upsell_acknowledgement_action" then
			local var3889 = self.kind.value:encode()
			local var3890, var3891 = protoModule.writeTag(buff, var3696, 65, protoModule.wireTypes.lengthDelimited)
			var3890, var6224 = protoModule.writeBuffer(var3890, var3891, var3889, buffer.len(var3889))
			buff = var3890
			var3696 = var3891
		elseif self.kind.type == "open_search_results_with_query_action" then
			local var3892 = self.kind.value:encode()
			local var3893, var3894 = protoModule.writeTag(buff, var3696, 66, protoModule.wireTypes.lengthDelimited)
			var3893, var6227 = protoModule.writeBuffer(var3893, var3894, var3892, buffer.len(var3892))
			buff = var3893
			var3696 = var3894
		elseif self.kind.type == "select_marketplace_favorites_category" then
			local var3895 = self.kind.value:encode()
			local var3896, var3897 = protoModule.writeTag(buff, var3696, 67, protoModule.wireTypes.lengthDelimited)
			var3896, var6230 = protoModule.writeBuffer(var3896, var3897, var3895, buffer.len(var3895))
			buff = var3896
			var3696 = var3897
		elseif self.kind.type == "download_app_action" then
			local var3898 = self.kind.value:encode()
			local var3899, var3900 = protoModule.writeTag(buff, var3696, 68, protoModule.wireTypes.lengthDelimited)
			var3899, var6233 = protoModule.writeBuffer(var3899, var3900, var3898, buffer.len(var3898))
			buff = var3899
			var3696 = var3900
		elseif self.kind.type == "refresh_charts_sort_detail_action" then
			local var3901 = self.kind.value:encode()
			local var3902, var3903 = protoModule.writeTag(buff, var3696, 69, protoModule.wireTypes.lengthDelimited)
			var3902, var6236 = protoModule.writeBuffer(var3902, var3903, var3901, buffer.len(var3901))
			buff = var3902
			var3696 = var3903
		elseif self.kind.type == "join_community_action" then
			local var3904 = self.kind.value:encode()
			local var3905, var3906 = protoModule.writeTag(buff, var3696, 70, protoModule.wireTypes.lengthDelimited)
			var3905, var6239 = protoModule.writeBuffer(var3905, var3906, var3904, buffer.len(var3904))
			buff = var3905
			var3696 = var3906
		elseif self.kind.type == "view_community_action" then
			local var3907 = self.kind.value:encode()
			local var3908, var3909 = protoModule.writeTag(buff, var3696, 71, protoModule.wireTypes.lengthDelimited)
			var3908, var6242 = protoModule.writeBuffer(var3908, var3909, var3907, buffer.len(var3907))
			buff = var3908
			var3696 = var3909
		elseif self.kind.type == "pin_experience_shortcut_action" then
			local var3910 = self.kind.value:encode()
			local var3911, var3912 = protoModule.writeTag(buff, var3696, 72, protoModule.wireTypes.lengthDelimited)
			var3911, var6245 = protoModule.writeBuffer(var3911, var3912, var3910, buffer.len(var3910))
			buff = var3911
			var3696 = var3912
		elseif self.kind.type == "select_marketplace_favorites_subcategory" then
			local var3913 = self.kind.value:encode()
			local var3914, var3915 = protoModule.writeTag(buff, var3696, 73, protoModule.wireTypes.lengthDelimited)
			var3914, var6248 = protoModule.writeBuffer(var3914, var3915, var3913, buffer.len(var3913))
			buff = var3914
			var3696 = var3915
		elseif self.kind.type == "show_toast_action" then
			local var3916 = self.kind.value:encode()
			local var3917, var3918 = protoModule.writeTag(buff, var3696, 74, protoModule.wireTypes.lengthDelimited)
			var3917, var6251 = protoModule.writeBuffer(var3917, var3918, var3916, buffer.len(var3916))
			buff = var3917
			var3696 = var3918
		elseif self.kind.type == "open_incoming_transfer_upsell_action" then
			local var3919 = self.kind.value:encode()
			local var3920, var3921 = protoModule.writeTag(buff, var3696, 75, protoModule.wireTypes.lengthDelimited)
			var3920, var6254 = protoModule.writeBuffer(var3920, var3921, var3919, buffer.len(var3919))
			buff = var3920
			var3696 = var3921
		elseif self.kind.type == "action_sequence_action" then
			local var3922 = self.kind.value:encode()
			local var3923, var3924 = protoModule.writeTag(buff, var3696, 76, protoModule.wireTypes.lengthDelimited)
			var3923, var6257 = protoModule.writeBuffer(var3923, var3924, var3922, buffer.len(var3922))
			buff = var3923
			var3696 = var3924
		elseif self.kind.type == "refresh_feed_entry_from_api_action" then
			local var3925 = self.kind.value:encode()
			local var3926, var3927 = protoModule.writeTag(buff, var3696, 77, protoModule.wireTypes.lengthDelimited)
			var3926, var6260 = protoModule.writeBuffer(var3926, var3927, var3925, buffer.len(var3925))
			buff = var3926
			var3696 = var3927
		elseif self.kind.type == "open_profile_frames_editor_action" then
			local var3928 = self.kind.value:encode()
			local var3929, var3930 = protoModule.writeTag(buff, var3696, 78, protoModule.wireTypes.lengthDelimited)
			var3929, var6263 = protoModule.writeBuffer(var3929, var3930, var3928, buffer.len(var3928))
			buff = var3929
			var3696 = var3930
		elseif self.kind.type == "navigate_action" then
			local var3931 = self.kind.value:encode()
			local var3932, var3933 = protoModule.writeTag(buff, var3696, 79, protoModule.wireTypes.lengthDelimited)
			var3932, var6266 = protoModule.writeBuffer(var3932, var3933, var3931, buffer.len(var3931))
			buff = var3932
			var3696 = var3933
		elseif self.kind.type == "set_game_tile_not_interested_action" then
			local var3934 = self.kind.value:encode()
			local var3935, var3936 = protoModule.writeTag(buff, var3696, 80, protoModule.wireTypes.lengthDelimited)
			var3935, var6269 = protoModule.writeBuffer(var3935, var3936, var3934, buffer.len(var3934))
			buff = var3935
			var3696 = var3936
		elseif self.kind.type == "refresh_home_action" then
			local var3937 = self.kind.value:encode()
			local var3938, var3939 = protoModule.writeTag(buff, var3696, 81, protoModule.wireTypes.lengthDelimited)
			var3938, var6272 = protoModule.writeBuffer(var3938, var3939, var3937, buffer.len(var3937))
			buff = var3938
			var3696 = var3939
		elseif self.kind.type == "undo_game_tile_not_interested_action" then
			local var3940 = self.kind.value:encode()
			local var3941, var3942 = protoModule.writeTag(buff, var3696, 82, protoModule.wireTypes.lengthDelimited)
			var3941, var6275 = protoModule.writeBuffer(var3941, var3942, var3940, buffer.len(var3940))
			buff = var3941
			var3696 = var3942
		elseif self.kind.type == "apply_dev_store_see_all_category_filter_action" then
			local var3943 = self.kind.value:encode()
			local var3944, var3945 = protoModule.writeTag(buff, var3696, 83, protoModule.wireTypes.lengthDelimited)
			var3944, var6278 = protoModule.writeBuffer(var3944, var3945, var3943, buffer.len(var3943))
			buff = var3944
			var3696 = var3945
		elseif self.kind.type == "open_why_this_ad_action" then
			local var3946 = self.kind.value:encode()
			local var3947, var3948 = protoModule.writeTag(buff, var3696, 84, protoModule.wireTypes.lengthDelimited)
			var3947, var6281 = protoModule.writeBuffer(var3947, var3948, var3946, buffer.len(var3946))
			buff = var3947
			var3696 = var3948
		elseif self.kind.type == "request_push_notification_permission_action" then
			local var3949 = self.kind.value:encode()
			local var3950, var3951 = protoModule.writeTag(buff, var3696, 85, protoModule.wireTypes.lengthDelimited)
			var3950, var6284 = protoModule.writeBuffer(var3950, var3951, var3949, buffer.len(var3949))
			buff = var3950
			var3696 = var3951
		end
	end
	if self.telemetry_handler ~= nil then
		local var3952 = self.telemetry_handler:encode()
		local var3953, var3954 = protoModule.writeTag(buff, var3696, 1000, protoModule.wireTypes.lengthDelimited)
		var3953, var6287 = protoModule.writeBuffer(var3953, var3954, var3952, buffer.len(var3952))
		buff = var3953
		var3696 = var3954
	end
	if self.accessibility_label ~= nil then
		local var3955 = self.accessibility_label:encode()
		local var3956, var3957 = protoModule.writeTag(buff, var3696, 1001, protoModule.wireTypes.lengthDelimited)
		var3956, var6290 = protoModule.writeBuffer(var3956, var3957, var3955, buffer.len(var3955))
		buff = var3956
		var3696 = var3957
	end
	if self.skip_unified_logging ~= nil then
		local var3958 = self.skip_unified_logging:encode()
		local var3959, var3960 = protoModule.writeTag(buff, var3696, 1002, protoModule.wireTypes.lengthDelimited)
		var3959, var6293 = protoModule.writeBuffer(var3959, var3960, var3958, buffer.len(var3958))
		buff = var3959
		var3696 = var3960
	end
	if self.action_event_name ~= nil then
		local var3961 = self.action_event_name:encode()
		local var3962, var3963 = protoModule.writeTag(buff, var3696, 1003, protoModule.wireTypes.lengthDelimited)
		var3962, var6296 = protoModule.writeBuffer(var3962, var3963, var3961, buffer.len(var3961))
		buff = var3962
		var3696 = var3963
	end
	local buff_1 = buffer.create(var3696)
	buffer.copy(buff_1, 0, buff, 0, var3696)
	
	return buff_1
end

function t_182.decode(p182)
	-- upvalues: t_182 (ref), protoModule (ref), t (ref), propTypesModule (ref)
	local var3696 = t_182.new()
	local var3697 = 0
	while var3697 < buffer.len(p182) do
		local _ = nil
		local var3698 = nil
		local var3699, var3700, var3701 = protoModule.readTag(p182, var3697)
		local var3702 = var3699
		var3698 = var3700
		var3697 = var3701
		
		if var3698 == protoModule.wireTypes.varint then
			local _ = nil
			local var3703, var3704 = protoModule.readVarInt(p182, var3697)
			local _ = var3703
			var3697 = var3704
			continue
		end
		if var3698 == protoModule.wireTypes.lengthDelimited then
			if var3702 == 1 then
				local _ = nil
				local var3705, var3706 = protoModule.readBuffer(p182, var3697)
				var3697 = var3706
				var3696.kind = {
					type = "dismiss_dialog_action",
					value = t.DismissDialogAction.decode(var3705)
				}
			elseif var3702 == 2 then
				local _ = nil
				local var3707, var3708 = protoModule.readBuffer(p182, var3697)
				var3697 = var3708
				var3696.kind = {
					type = "link_action",
					value = t.LinkAction.decode(var3707)
				}
			elseif var3702 == 3 then
				local _ = nil
				local var3709, var3710 = protoModule.readBuffer(p182, var3697)
				var3697 = var3710
				var3696.kind = {
					type = "open_game_details_action",
					value = t.OpenGameDetailsAction.decode(var3709)
				}
			elseif var3702 == 4 then
				local _ = nil
				local var3711, var3712 = protoModule.readBuffer(p182, var3697)
				var3697 = var3712
				var3696.kind = {
					type = "open_join_friends_action",
					value = t.OpenJoinFriendsAction.decode(var3711)
				}
			elseif var3702 == 5 then
				local _ = nil
				local var3713, var3714 = protoModule.readBuffer(p182, var3697)
				var3697 = var3714
				var3696.kind = {
					type = "open_marketplace_try_on_action",
					value = t.OpenMarketplaceTryOnAction.decode(var3713)
				}
			elseif var3702 == 6 then
				local _ = nil
				local var3715, var3716 = protoModule.readBuffer(p182, var3697)
				var3697 = var3716
				var3696.kind = {
					type = "open_see_all_action",
					value = t.OpenSeeAllAction.decode(var3715)
				}
			elseif var3702 == 7 then
				local _ = nil
				local var3717, var3718 = protoModule.readBuffer(p182, var3697)
				var3697 = var3718
				var3696.kind = {
					type = "open_sponsored_tooltip_action",
					value = t.OpenSponsoredTooltipAction.decode(var3717)
				}
			elseif var3702 == 8 then
				local _ = nil
				local var3719, var3720 = protoModule.readBuffer(p182, var3697)
				var3697 = var3720
				var3696.kind = {
					type = "play_button_click_action",
					value = t.PlayButtonClickAction.decode(var3719)
				}
			elseif var3702 == 9 then
				local _ = nil
				local var3721, var3722 = protoModule.readBuffer(p182, var3697)
				var3697 = var3722
				var3696.kind = {
					type = "update_user_settings_action",
					value = t.UpdateUserSettingsAction.decode(var3721)
				}
			elseif var3702 == 10 then
				local _ = nil
				local var3723, var3724 = protoModule.readBuffer(p182, var3697)
				var3697 = var3724
				var3696.kind = {
					type = "open_tooltip_action",
					value = t.OpenTooltipAction.decode(var3723)
				}
			elseif var3702 == 11 then
				local _ = nil
				local var3725, var3726 = protoModule.readBuffer(p182, var3697)
				var3697 = var3726
				var3696.kind = {
					type = "open_badge_details_action",
					value = t.OpenBadgeDetailsAction.decode(var3725)
				}
			elseif var3702 == 12 then
				local _ = nil
				local var3727, var3728 = protoModule.readBuffer(p182, var3697)
				var3697 = var3728
				var3696.kind = {
					type = "load_more_from_api_action",
					value = t.LoadMoreFromApiAction.decode(var3727)
				}
			elseif var3702 == 13 then
				local _ = nil
				local var3729, var3730 = protoModule.readBuffer(p182, var3697)
				var3697 = var3730
				var3696.kind = {
					type = "share_action",
					value = t.ShareAction.decode(var3729)
				}
			elseif var3702 == 14 then
				local _ = nil
				local var3731, var3732 = protoModule.readBuffer(p182, var3697)
				var3697 = var3732
				var3696.kind = {
					type = "open_abuse_report_action",
					value = t.OpenAbuseReportAction.decode(var3731)
				}
			elseif var3702 == 15 then
				local _ = nil
				local var3733, var3734 = protoModule.readBuffer(p182, var3697)
				var3697 = var3734
				var3696.kind = {
					type = "remove_badge_from_inventory_action",
					value = t.RemoveBadgeFromInventoryAction.decode(var3733)
				}
			elseif var3702 == 16 then
				local _ = nil
				local var3735, var3736 = protoModule.readBuffer(p182, var3697)
				var3697 = var3736
				var3696.kind = {
					type = "open_profile_action",
					value = t.OpenProfileAction.decode(var3735)
				}
			elseif var3702 == 17 then
				local _ = nil
				local var3737, var3738 = protoModule.readBuffer(p182, var3697)
				var3697 = var3738
				var3696.kind = {
					type = "open_facial_age_estimation_action",
					value = t.OpenFacialAgeEstimationAction.decode(var3737)
				}
			elseif var3702 == 18 then
				local _ = nil
				local var3739, var3740 = protoModule.readBuffer(p182, var3697)
				var3697 = var3740
				var3696.kind = {
					type = "open_add_connections_page_action",
					value = t.OpenAddConnectionsPageAction.decode(var3739)
				}
			elseif var3702 == 19 then
				local _ = nil
				local var3741, var3742 = protoModule.readBuffer(p182, var3697)
				var3697 = var3742
				var3696.kind = {
					type = "open_marketplace_action",
					value = t.OpenMarketplaceAction.decode(var3741)
				}
			elseif var3702 == 20 then
				local _ = nil
				local var3743, var3744 = protoModule.readBuffer(p182, var3697)
				var3697 = var3744
				var3696.kind = {
					type = "hide_profile_completion_action",
					value = t.HideProfileCompletionAction.decode(var3743)
				}
			elseif var3702 == 21 then
				local _ = nil
				local var3745, var3746 = protoModule.readBuffer(p182, var3697)
				var3697 = var3746
				var3696.kind = {
					type = "select_marketplace_catalog_category",
					value = t.SelectMarketplaceCatalogCategory.decode(var3745)
				}
			elseif var3702 == 22 then
				local _ = nil
				local var3747, var3748 = protoModule.readBuffer(p182, var3697)
				var3697 = var3748
				var3696.kind = {
					type = "select_marketplace_catalog_subcategory",
					value = t.SelectMarketplaceCatalogSubcategory.decode(var3747)
				}
			elseif var3702 == 23 then
				local _ = nil
				local var3749, var3750 = protoModule.readBuffer(p182, var3697)
				var3697 = var3750
				var3696.kind = {
					type = "open_marketplace_catalog_see_all",
					value = t.OpenMarketplaceCatalogSeeAll.decode(var3749)
				}
			elseif var3702 == 24 then
				local _ = nil
				local var3751, var3752 = protoModule.readBuffer(p182, var3697)
				var3697 = var3752
				var3696.kind = {
					type = "close_marketplace_category_tooltip",
					value = t.CloseMarketplaceCategoryTooltip.decode(var3751)
				}
			elseif var3702 == 25 then
				local _ = nil
				local var3753, var3754 = protoModule.readBuffer(p182, var3697)
				var3697 = var3754
				var3696.kind = {
					type = "resize_marketplace_catalog",
					value = t.ResizeMarketplaceCatalog.decode(var3753)
				}
			elseif var3702 == 26 then
				local _ = nil
				local var3755, var3756 = protoModule.readBuffer(p182, var3697)
				var3697 = var3756
				var3696.kind = {
					type = "open_marketplace_catalog_filters",
					value = t.OpenMarketplaceCatalogFilters.decode(var3755)
				}
			elseif var3702 == 27 then
				local _ = nil
				local var3757, var3758 = protoModule.readBuffer(p182, var3697)
				var3697 = var3758
				var3696.kind = {
					type = "open_social_link_action",
					value = t.OpenSocialLinkAction.decode(var3757)
				}
			elseif var3702 == 28 then
				local _ = nil
				local var3759, var3760 = protoModule.readBuffer(p182, var3697)
				var3697 = var3760
				var3696.kind = {
					type = "open_charts_sort_detail_action",
					value = t.OpenChartsSortDetailAction.decode(var3759)
				}
			elseif var3702 == 29 then
				local _ = nil
				local var3761, var3762 = protoModule.readBuffer(p182, var3697)
				var3697 = var3762
				var3696.kind = {
					type = "open_song_detail_action",
					value = t.OpenSongDetailAction.decode(var3761)
				}
			elseif var3702 == 30 then
				local _ = nil
				local var3763, var3764 = protoModule.readBuffer(p182, var3697)
				var3697 = var3764
				var3696.kind = {
					type = "refresh_from_api_action",
					value = t.RefreshFromApiAction.decode(var3763)
				}
			elseif var3702 == 31 then
				local _ = nil
				local var3765, var3766 = protoModule.readBuffer(p182, var3697)
				var3697 = var3766
				var3696.kind = {
					type = "rsvp_to_event_action",
					value = t.RsvpToEventAction.decode(var3765)
				}
			elseif var3702 == 32 then
				local _ = nil
				local var3767, var3768 = protoModule.readBuffer(p182, var3697)
				var3697 = var3768
				var3696.kind = {
					type = "apply_charts_filter_action",
					value = t.ApplyChartsFilterAction.decode(var3767)
				}
			elseif var3702 == 33 then
				local _ = nil
				local var3769, var3770 = protoModule.readBuffer(p182, var3697)
				var3697 = var3770
				var3696.kind = {
					type = "analytics_event_action",
					value = t.AnalyticsEventAction.decode(var3769)
				}
			elseif var3702 == 34 then
				local _ = nil
				local var3771, var3772 = protoModule.readBuffer(p182, var3697)
				var3697 = var3772
				var3696.kind = {
					type = "custom_analytics_event_action",
					value = t.CustomAnalyticsEventAction.decode(var3771)
				}
			elseif var3702 == 35 then
				local _ = nil
				local var3773, var3774 = protoModule.readBuffer(p182, var3697)
				var3697 = var3774
				var3696.kind = {
					type = "open_game_invite_action",
					value = t.OpenGameInviteAction.decode(var3773)
				}
			elseif var3702 == 36 then
				local _ = nil
				local var3775, var3776 = protoModule.readBuffer(p182, var3697)
				var3697 = var3776
				var3696.kind = {
					type = "open_event_details_action",
					value = t.OpenEventDetailsAction.decode(var3775)
				}
			elseif var3702 == 37 then
				local _ = nil
				local var3777, var3778 = protoModule.readBuffer(p182, var3697)
				var3697 = var3778
				var3696.kind = {
					type = "launch_experience_action",
					value = t.LaunchExperienceAction.decode(var3777)
				}
			elseif var3702 == 38 then
				local _ = nil
				local var3779, var3780 = protoModule.readBuffer(p182, var3697)
				var3697 = var3780
				var3696.kind = {
					type = "toggle_experience_favorite_action",
					value = t.ToggleExperienceFavoriteAction.decode(var3779)
				}
			elseif var3702 == 39 then
				local _ = nil
				local var3781, var3782 = protoModule.readBuffer(p182, var3697)
				var3697 = var3782
				var3696.kind = {
					type = "toggle_experience_follow_action",
					value = t.ToggleExperienceFollowAction.decode(var3781)
				}
			elseif var3702 == 40 then
				local _ = nil
				local var3783, var3784 = protoModule.readBuffer(p182, var3697)
				var3697 = var3784
				var3696.kind = {
					type = "toggle_experience_vote_action",
					value = t.ToggleExperienceVoteAction.decode(var3783)
				}
			elseif var3702 == 41 then
				local _ = nil
				local var3785, var3786 = protoModule.readBuffer(p182, var3697)
				var3697 = var3786
				var3696.kind = {
					type = "open_purchase_prompt_action",
					value = t.OpenPurchasePromptAction.decode(var3785)
				}
			elseif var3702 == 42 then
				local _ = nil
				local var3787, var3788 = protoModule.readBuffer(p182, var3697)
				var3697 = var3788
				var3696.kind = {
					type = "open_sdui_overlay_action",
					value = t.OpenSduiOverlayAction.decode(var3787)
				}
			elseif var3702 == 43 then
				local _ = nil
				local var3789, var3790 = protoModule.readBuffer(p182, var3697)
				var3697 = var3790
				var3696.kind = {
					type = "open_badges_see_all_action",
					value = t.OpenBadgesSeeAllAction.decode(var3789)
				}
			elseif var3702 == 44 then
				local _ = nil
				local var3791, var3792 = protoModule.readBuffer(p182, var3697)
				var3697 = var3792
				var3696.kind = {
					type = "open_experience_store_see_all_action",
					value = t.OpenExperienceStoreSeeAllAction.decode(var3791)
				}
			elseif var3702 == 45 then
				local _ = nil
				local var3793, var3794 = protoModule.readBuffer(p182, var3697)
				var3697 = var3794
				var3696.kind = {
					type = "dismiss_game_feedback_action",
					value = t.DismissGameFeedbackAction.decode(var3793)
				}
			elseif var3702 == 46 then
				local _ = nil
				local var3795, var3796 = protoModule.readBuffer(p182, var3697)
				var3697 = var3796
				var3696.kind = {
					type = "open_game_feedback_form_action",
					value = t.OpenGameFeedbackFormAction.decode(var3795)
				}
			elseif var3702 == 47 then
				local _ = nil
				local var3797, var3798 = protoModule.readBuffer(p182, var3697)
				var3697 = var3798
				var3696.kind = {
					type = "enable_event_notifications_action",
					value = t.EnableEventNotificationsAction.decode(var3797)
				}
			elseif var3702 == 48 then
				local _ = nil
				local var3799, var3800 = protoModule.readBuffer(p182, var3697)
				var3697 = var3800
				var3696.kind = {
					type = "dismiss_event_notifications_modal_action",
					value = t.DismissEventNotificationsModalAction.decode(var3799)
				}
			elseif var3702 == 49 then
				local _ = nil
				local var3801, var3802 = protoModule.readBuffer(p182, var3697)
				var3697 = var3802
				var3696.kind = {
					type = "open_amp_wizard_action",
					value = t.OpenAmpWizardAction.decode(var3801)
				}
			elseif var3702 == 50 then
				local _ = nil
				local var3803, var3804 = protoModule.readBuffer(p182, var3697)
				var3697 = var3804
				var3696.kind = {
					type = "open_subscription_purchase_page_action",
					value = t.OpenSubscriptionPurchasePageAction.decode(var3803)
				}
			elseif var3702 == 51 then
				local _ = nil
				local var3805, var3806 = protoModule.readBuffer(p182, var3697)
				var3697 = var3806
				var3696.kind = {
					type = "refresh_game_passes_action",
					value = t.RefreshGamePassesAction.decode(var3805)
				}
			elseif var3702 == 52 then
				local _ = nil
				local var3807, var3808 = protoModule.readBuffer(p182, var3697)
				var3697 = var3808
				var3696.kind = {
					type = "refresh_playability_action",
					value = t.RefreshPlayabilityAction.decode(var3807)
				}
			elseif var3702 == 53 then
				local _ = nil
				local var3809, var3810 = protoModule.readBuffer(p182, var3697)
				var3697 = var3810
				var3696.kind = {
					type = "open_social_proof_user_list_sheet_action",
					value = t.OpenSocialProofUserListSheetAction.decode(var3809)
				}
			elseif var3702 == 54 then
				local _ = nil
				local var3811, var3812 = protoModule.readBuffer(p182, var3697)
				var3697 = var3812
				var3696.kind = {
					type = "report_surface_load_time_milestone_action",
					value = t.ReportSurfaceLoadTimeMilestoneAction.decode(var3811)
				}
			elseif var3702 == 55 then
				local _ = nil
				local var3813, var3814 = protoModule.readBuffer(p182, var3697)
				var3697 = var3814
				var3696.kind = {
					type = "open_search_results_tab_action",
					value = t.OpenSearchResultsTabAction.decode(var3813)
				}
			elseif var3702 == 56 then
				local _ = nil
				local var3815, var3816 = protoModule.readBuffer(p182, var3697)
				var3697 = var3816
				var3696.kind = {
					type = "open_phone_upsell_modal_action",
					value = t.OpenPhoneUpsellModalAction.decode(var3815)
				}
			elseif var3702 == 57 then
				local _ = nil
				local var3817, var3818 = protoModule.readBuffer(p182, var3697)
				var3697 = var3818
				var3696.kind = {
					type = "open_email_upsell_modal_action",
					value = t.OpenEmailUpsellModalAction.decode(var3817)
				}
			elseif var3702 == 58 then
				local _ = nil
				local var3819, var3820 = protoModule.readBuffer(p182, var3697)
				var3697 = var3820
				var3696.kind = {
					type = "dismiss_prompt_action",
					value = t.DismissPromptAction.decode(var3819)
				}
			elseif var3702 == 59 then
				local _ = nil
				local var3821, var3822 = protoModule.readBuffer(p182, var3697)
				var3697 = var3822
				var3696.kind = {
					type = "request_friendship_action",
					value = t.RequestFriendshipAction.decode(var3821)
				}
			elseif var3702 == 60 then
				local _ = nil
				local var3823, var3824 = protoModule.readBuffer(p182, var3697)
				var3697 = var3824
				var3696.kind = {
					type = "refresh_developer_products_action",
					value = t.RefreshDeveloperProductsAction.decode(var3823)
				}
			elseif var3702 == 61 then
				local _ = nil
				local var3825, var3826 = protoModule.readBuffer(p182, var3697)
				var3697 = var3826
				var3696.kind = {
					type = "open_fae_trial_upsell_action",
					value = t.OpenFaeTrialUpsellAction.decode(var3825)
				}
			elseif var3702 == 62 then
				local _ = nil
				local var3827, var3828 = protoModule.readBuffer(p182, var3697)
				var3697 = var3828
				var3696.kind = {
					type = "refresh_omni_recommendation_feed_item_action",
					value = t.RefreshOmniRecommendationFeedItemAction.decode(var3827)
				}
			elseif var3702 == 63 then
				local _ = nil
				local var3829, var3830 = protoModule.readBuffer(p182, var3697)
				var3697 = var3830
				var3696.kind = {
					type = "ai_overview_feedback_action",
					value = t.AiOverviewFeedbackAction.decode(var3829)
				}
			elseif var3702 == 64 then
				local _ = nil
				local var3831, var3832 = protoModule.readBuffer(p182, var3697)
				var3697 = var3832
				var3696.kind = {
					type = "open_trusted_friends_upsell_modal_action",
					value = t.OpenTrustedFriendsUpsellModalAction.decode(var3831)
				}
			elseif var3702 == 65 then
				local _ = nil
				local var3833, var3834 = protoModule.readBuffer(p182, var3697)
				var3697 = var3834
				var3696.kind = {
					type = "record_party_chat_conversation_upsell_acknowledgement_action",
					value = t.RecordPartyChatConversationUpsellAcknowledgementAction.decode(var3833)
				}
			elseif var3702 == 66 then
				local _ = nil
				local var3835, var3836 = protoModule.readBuffer(p182, var3697)
				var3697 = var3836
				var3696.kind = {
					type = "open_search_results_with_query_action",
					value = t.OpenSearchResultsWithQueryAction.decode(var3835)
				}
			elseif var3702 == 67 then
				local _ = nil
				local var3837, var3838 = protoModule.readBuffer(p182, var3697)
				var3697 = var3838
				var3696.kind = {
					type = "select_marketplace_favorites_category",
					value = t.SelectMarketplaceFavoritesCategory.decode(var3837)
				}
			elseif var3702 == 68 then
				local _ = nil
				local var3839, var3840 = protoModule.readBuffer(p182, var3697)
				var3697 = var3840
				var3696.kind = {
					type = "download_app_action",
					value = t.DownloadAppAction.decode(var3839)
				}
			elseif var3702 == 69 then
				local _ = nil
				local var3841, var3842 = protoModule.readBuffer(p182, var3697)
				var3697 = var3842
				var3696.kind = {
					type = "refresh_charts_sort_detail_action",
					value = t.RefreshChartsSortDetailAction.decode(var3841)
				}
			elseif var3702 == 70 then
				local _ = nil
				local var3843, var3844 = protoModule.readBuffer(p182, var3697)
				var3697 = var3844
				var3696.kind = {
					type = "join_community_action",
					value = t.JoinCommunityAction.decode(var3843)
				}
			elseif var3702 == 71 then
				local _ = nil
				local var3845, var3846 = protoModule.readBuffer(p182, var3697)
				var3697 = var3846
				var3696.kind = {
					type = "view_community_action",
					value = t.ViewCommunityAction.decode(var3845)
				}
			elseif var3702 == 72 then
				local _ = nil
				local var3847, var3848 = protoModule.readBuffer(p182, var3697)
				var3697 = var3848
				var3696.kind = {
					type = "pin_experience_shortcut_action",
					value = t.PinExperienceShortcutAction.decode(var3847)
				}
			elseif var3702 == 73 then
				local _ = nil
				local var3849, var3850 = protoModule.readBuffer(p182, var3697)
				var3697 = var3850
				var3696.kind = {
					type = "select_marketplace_favorites_subcategory",
					value = t.SelectMarketplaceFavoritesSubcategory.decode(var3849)
				}
			elseif var3702 == 74 then
				local _ = nil
				local var3851, var3852 = protoModule.readBuffer(p182, var3697)
				var3697 = var3852
				var3696.kind = {
					type = "show_toast_action",
					value = t.ShowToastAction.decode(var3851)
				}
			elseif var3702 == 75 then
				local _ = nil
				local var3853, var3854 = protoModule.readBuffer(p182, var3697)
				var3697 = var3854
				var3696.kind = {
					type = "open_incoming_transfer_upsell_action",
					value = t.OpenIncomingTransferUpsellAction.decode(var3853)
				}
			elseif var3702 == 76 then
				local _ = nil
				local var3855, var3856 = protoModule.readBuffer(p182, var3697)
				var3697 = var3856
				var3696.kind = {
					type = "action_sequence_action",
					value = t.ActionSequenceAction.decode(var3855)
				}
			elseif var3702 == 77 then
				local _ = nil
				local var3857, var3858 = protoModule.readBuffer(p182, var3697)
				var3697 = var3858
				var3696.kind = {
					type = "refresh_feed_entry_from_api_action",
					value = t.RefreshFeedEntryFromApiAction.decode(var3857)
				}
			elseif var3702 == 78 then
				local _ = nil
				local var3859, var3860 = protoModule.readBuffer(p182, var3697)
				var3697 = var3860
				var3696.kind = {
					type = "open_profile_frames_editor_action",
					value = t.OpenProfileFramesEditorAction.decode(var3859)
				}
			elseif var3702 == 79 then
				local _ = nil
				local var3861, var3862 = protoModule.readBuffer(p182, var3697)
				var3697 = var3862
				var3696.kind = {
					type = "navigate_action",
					value = t.NavigateAction.decode(var3861)
				}
			elseif var3702 == 80 then
				local _ = nil
				local var3863, var3864 = protoModule.readBuffer(p182, var3697)
				var3697 = var3864
				var3696.kind = {
					type = "set_game_tile_not_interested_action",
					value = t.SetGameTileNotInterestedAction.decode(var3863)
				}
			elseif var3702 == 81 then
				local _ = nil
				local var3865, var3866 = protoModule.readBuffer(p182, var3697)
				var3697 = var3866
				var3696.kind = {
					type = "refresh_home_action",
					value = t.RefreshHomeAction.decode(var3865)
				}
			elseif var3702 == 82 then
				local _ = nil
				local var3867, var3868 = protoModule.readBuffer(p182, var3697)
				var3697 = var3868
				var3696.kind = {
					type = "undo_game_tile_not_interested_action",
					value = t.UndoGameTileNotInterestedAction.decode(var3867)
				}
			elseif var3702 == 83 then
				local _ = nil
				local var3869, var3870 = protoModule.readBuffer(p182, var3697)
				var3697 = var3870
				var3696.kind = {
					type = "apply_dev_store_see_all_category_filter_action",
					value = t.ApplyDevStoreSeeAllCategoryFilterAction.decode(var3869)
				}
			elseif var3702 == 84 then
				local _ = nil
				local var3871, var3872 = protoModule.readBuffer(p182, var3697)
				var3697 = var3872
				var3696.kind = {
					type = "open_why_this_ad_action",
					value = t.OpenWhyThisAdAction.decode(var3871)
				}
			elseif var3702 == 85 then
				local _ = nil
				local var3873, var3874 = protoModule.readBuffer(p182, var3697)
				var3697 = var3874
				var3696.kind = {
					type = "request_push_notification_permission_action",
					value = t.RequestPushNotificationPermissionAction.decode(var3873)
				}
			elseif var3702 == 1000 then
				local _ = nil
				local var3875, var3876 = protoModule.readBuffer(p182, var3697)
				var3697 = var3876
				var3696.telemetry_handler = propTypesModule.StringProp.decode(var3875)
			elseif var3702 == 1001 then
				local _ = nil
				local var3877, var3878 = protoModule.readBuffer(p182, var3697)
				var3697 = var3878
				var3696.accessibility_label = propTypesModule.StringFormat.decode(var3877)
			elseif var3702 == 1002 then
				local _ = nil
				local var3879, var3880 = protoModule.readBuffer(p182, var3697)
				var3697 = var3880
				var3696.skip_unified_logging = propTypesModule.BoolProp.decode(var3879)
			elseif var3702 == 1003 then
				local _ = nil
				local var3881, var3882 = protoModule.readBuffer(p182, var3697)
				var3697 = var3882
				var3696.action_event_name = propTypesModule.StringProp.decode(var3881)
			else
				local _ = nil
				local var3883, var3884 = protoModule.readVarInt(p182, var3697)
				var3697 = var3884 + var3883
			end
		elseif var3698 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3885, var3886 = protoModule.readFixed32(p182, var3697)
			local _ = var3885
			var3697 = var3886
		elseif var3698 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3887, var3888 = protoModule.readFixed64(p182, var3697)
			local _ = var3887
			var3697 = var3888
		else
			error("Unsupported wire type: " .. var6300)
		end
	end
	return var3696
end

function t_182:jsonEncode()
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
		elseif self.kind.type == "set_game_tile_not_interested_action" then
			t.setGameTileNotInterestedAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "refresh_home_action" then
			t.refreshHomeAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "undo_game_tile_not_interested_action" then
			t.undoGameTileNotInterestedAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "apply_dev_store_see_all_category_filter_action" then
			t.applyDevStoreSeeAllCategoryFilterAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "open_why_this_ad_action" then
			t.openWhyThisAdAction = self.kind.value:jsonEncode()
		elseif self.kind.type == "request_push_notification_permission_action" then
			t.requestPushNotificationPermissionAction = self.kind.value:jsonEncode()
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

function t_182:jsonDecode()
	-- upvalues: t_182 (ref), t (ref), propTypesModule (ref)
	local var3889 = t_182.new()
	
	if self.dismiss_dialog_action ~= nil then
		var3889.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismiss_dialog_action)
		}
	end
	if self.dismissDialogAction ~= nil then
		var3889.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismissDialogAction)
		}
	end
	if self.link_action ~= nil then
		var3889.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.link_action)
		}
	end
	if self.linkAction ~= nil then
		var3889.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.linkAction)
		}
	end
	if self.open_game_details_action ~= nil then
		var3889.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.open_game_details_action)
		}
	end
	if self.openGameDetailsAction ~= nil then
		var3889.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.openGameDetailsAction)
		}
	end
	if self.open_join_friends_action ~= nil then
		var3889.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.open_join_friends_action)
		}
	end
	if self.openJoinFriendsAction ~= nil then
		var3889.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.openJoinFriendsAction)
		}
	end
	if self.open_marketplace_try_on_action ~= nil then
		var3889.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.open_marketplace_try_on_action)
		}
	end
	if self.openMarketplaceTryOnAction ~= nil then
		var3889.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.openMarketplaceTryOnAction)
		}
	end
	if self.open_see_all_action ~= nil then
		var3889.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.open_see_all_action)
		}
	end
	if self.openSeeAllAction ~= nil then
		var3889.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.openSeeAllAction)
		}
	end
	if self.open_sponsored_tooltip_action ~= nil then
		var3889.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.open_sponsored_tooltip_action)
		}
	end
	if self.openSponsoredTooltipAction ~= nil then
		var3889.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.openSponsoredTooltipAction)
		}
	end
	if self.play_button_click_action ~= nil then
		var3889.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.play_button_click_action)
		}
	end
	if self.playButtonClickAction ~= nil then
		var3889.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.playButtonClickAction)
		}
	end
	if self.update_user_settings_action ~= nil then
		var3889.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.update_user_settings_action)
		}
	end
	if self.updateUserSettingsAction ~= nil then
		var3889.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.updateUserSettingsAction)
		}
	end
	if self.open_tooltip_action ~= nil then
		var3889.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.open_tooltip_action)
		}
	end
	if self.openTooltipAction ~= nil then
		var3889.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.openTooltipAction)
		}
	end
	if self.open_badge_details_action ~= nil then
		var3889.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.open_badge_details_action)
		}
	end
	if self.openBadgeDetailsAction ~= nil then
		var3889.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.openBadgeDetailsAction)
		}
	end
	if self.load_more_from_api_action ~= nil then
		var3889.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.load_more_from_api_action)
		}
	end
	if self.loadMoreFromApiAction ~= nil then
		var3889.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.loadMoreFromApiAction)
		}
	end
	if self.share_action ~= nil then
		var3889.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.share_action)
		}
	end
	if self.shareAction ~= nil then
		var3889.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.shareAction)
		}
	end
	if self.open_abuse_report_action ~= nil then
		var3889.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.open_abuse_report_action)
		}
	end
	if self.openAbuseReportAction ~= nil then
		var3889.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.openAbuseReportAction)
		}
	end
	if self.remove_badge_from_inventory_action ~= nil then
		var3889.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.remove_badge_from_inventory_action)
		}
	end
	if self.removeBadgeFromInventoryAction ~= nil then
		var3889.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.removeBadgeFromInventoryAction)
		}
	end
	if self.open_profile_action ~= nil then
		var3889.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.open_profile_action)
		}
	end
	if self.openProfileAction ~= nil then
		var3889.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.openProfileAction)
		}
	end
	if self.open_facial_age_estimation_action ~= nil then
		var3889.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.open_facial_age_estimation_action)
		}
	end
	if self.openFacialAgeEstimationAction ~= nil then
		var3889.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.openFacialAgeEstimationAction)
		}
	end
	if self.open_add_connections_page_action ~= nil then
		var3889.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.open_add_connections_page_action)
		}
	end
	if self.openAddConnectionsPageAction ~= nil then
		var3889.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.openAddConnectionsPageAction)
		}
	end
	if self.open_marketplace_action ~= nil then
		var3889.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.open_marketplace_action)
		}
	end
	if self.openMarketplaceAction ~= nil then
		var3889.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.openMarketplaceAction)
		}
	end
	if self.hide_profile_completion_action ~= nil then
		var3889.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hide_profile_completion_action)
		}
	end
	if self.hideProfileCompletionAction ~= nil then
		var3889.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hideProfileCompletionAction)
		}
	end
	if self.select_marketplace_catalog_category ~= nil then
		var3889.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.select_marketplace_catalog_category)
		}
	end
	if self.selectMarketplaceCatalogCategory ~= nil then
		var3889.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.selectMarketplaceCatalogCategory)
		}
	end
	if self.select_marketplace_catalog_subcategory ~= nil then
		var3889.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.select_marketplace_catalog_subcategory)
		}
	end
	if self.selectMarketplaceCatalogSubcategory ~= nil then
		var3889.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.selectMarketplaceCatalogSubcategory)
		}
	end
	if self.open_marketplace_catalog_see_all ~= nil then
		var3889.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.open_marketplace_catalog_see_all)
		}
	end
	if self.openMarketplaceCatalogSeeAll ~= nil then
		var3889.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.openMarketplaceCatalogSeeAll)
		}
	end
	if self.close_marketplace_category_tooltip ~= nil then
		var3889.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.close_marketplace_category_tooltip)
		}
	end
	if self.closeMarketplaceCategoryTooltip ~= nil then
		var3889.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.closeMarketplaceCategoryTooltip)
		}
	end
	if self.resize_marketplace_catalog ~= nil then
		var3889.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resize_marketplace_catalog)
		}
	end
	if self.resizeMarketplaceCatalog ~= nil then
		var3889.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resizeMarketplaceCatalog)
		}
	end
	if self.open_marketplace_catalog_filters ~= nil then
		var3889.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.open_marketplace_catalog_filters)
		}
	end
	if self.openMarketplaceCatalogFilters ~= nil then
		var3889.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.openMarketplaceCatalogFilters)
		}
	end
	if self.open_social_link_action ~= nil then
		var3889.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.open_social_link_action)
		}
	end
	if self.openSocialLinkAction ~= nil then
		var3889.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.openSocialLinkAction)
		}
	end
	if self.open_charts_sort_detail_action ~= nil then
		var3889.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.open_charts_sort_detail_action)
		}
	end
	if self.openChartsSortDetailAction ~= nil then
		var3889.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.openChartsSortDetailAction)
		}
	end
	if self.open_song_detail_action ~= nil then
		var3889.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.open_song_detail_action)
		}
	end
	if self.openSongDetailAction ~= nil then
		var3889.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.openSongDetailAction)
		}
	end
	if self.refresh_from_api_action ~= nil then
		var3889.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refresh_from_api_action)
		}
	end
	if self.refreshFromApiAction ~= nil then
		var3889.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refreshFromApiAction)
		}
	end
	if self.rsvp_to_event_action ~= nil then
		var3889.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvp_to_event_action)
		}
	end
	if self.rsvpToEventAction ~= nil then
		var3889.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvpToEventAction)
		}
	end
	if self.apply_charts_filter_action ~= nil then
		var3889.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.apply_charts_filter_action)
		}
	end
	if self.applyChartsFilterAction ~= nil then
		var3889.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.applyChartsFilterAction)
		}
	end
	if self.analytics_event_action ~= nil then
		var3889.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analytics_event_action)
		}
	end
	if self.analyticsEventAction ~= nil then
		var3889.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analyticsEventAction)
		}
	end
	if self.custom_analytics_event_action ~= nil then
		var3889.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.custom_analytics_event_action)
		}
	end
	if self.customAnalyticsEventAction ~= nil then
		var3889.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.customAnalyticsEventAction)
		}
	end
	if self.open_game_invite_action ~= nil then
		var3889.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.open_game_invite_action)
		}
	end
	if self.openGameInviteAction ~= nil then
		var3889.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.openGameInviteAction)
		}
	end
	if self.open_event_details_action ~= nil then
		var3889.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.open_event_details_action)
		}
	end
	if self.openEventDetailsAction ~= nil then
		var3889.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.openEventDetailsAction)
		}
	end
	if self.launch_experience_action ~= nil then
		var3889.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launch_experience_action)
		}
	end
	if self.launchExperienceAction ~= nil then
		var3889.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launchExperienceAction)
		}
	end
	if self.toggle_experience_favorite_action ~= nil then
		var3889.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggle_experience_favorite_action)
		}
	end
	if self.toggleExperienceFavoriteAction ~= nil then
		var3889.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggleExperienceFavoriteAction)
		}
	end
	if self.toggle_experience_follow_action ~= nil then
		var3889.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggle_experience_follow_action)
		}
	end
	if self.toggleExperienceFollowAction ~= nil then
		var3889.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggleExperienceFollowAction)
		}
	end
	if self.toggle_experience_vote_action ~= nil then
		var3889.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggle_experience_vote_action)
		}
	end
	if self.toggleExperienceVoteAction ~= nil then
		var3889.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggleExperienceVoteAction)
		}
	end
	if self.open_purchase_prompt_action ~= nil then
		var3889.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.open_purchase_prompt_action)
		}
	end
	if self.openPurchasePromptAction ~= nil then
		var3889.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.openPurchasePromptAction)
		}
	end
	if self.open_sdui_overlay_action ~= nil then
		var3889.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.open_sdui_overlay_action)
		}
	end
	if self.openSduiOverlayAction ~= nil then
		var3889.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.openSduiOverlayAction)
		}
	end
	if self.open_badges_see_all_action ~= nil then
		var3889.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.open_badges_see_all_action)
		}
	end
	if self.openBadgesSeeAllAction ~= nil then
		var3889.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.openBadgesSeeAllAction)
		}
	end
	if self.open_experience_store_see_all_action ~= nil then
		var3889.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.open_experience_store_see_all_action)
		}
	end
	if self.openExperienceStoreSeeAllAction ~= nil then
		var3889.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.openExperienceStoreSeeAllAction)
		}
	end
	if self.dismiss_game_feedback_action ~= nil then
		var3889.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismiss_game_feedback_action)
		}
	end
	if self.dismissGameFeedbackAction ~= nil then
		var3889.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismissGameFeedbackAction)
		}
	end
	if self.open_game_feedback_form_action ~= nil then
		var3889.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.open_game_feedback_form_action)
		}
	end
	if self.openGameFeedbackFormAction ~= nil then
		var3889.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.openGameFeedbackFormAction)
		}
	end
	if self.enable_event_notifications_action ~= nil then
		var3889.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enable_event_notifications_action)
		}
	end
	if self.enableEventNotificationsAction ~= nil then
		var3889.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enableEventNotificationsAction)
		}
	end
	if self.dismiss_event_notifications_modal_action ~= nil then
		var3889.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismiss_event_notifications_modal_action)
		}
	end
	if self.dismissEventNotificationsModalAction ~= nil then
		var3889.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismissEventNotificationsModalAction)
		}
	end
	if self.open_amp_wizard_action ~= nil then
		var3889.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.open_amp_wizard_action)
		}
	end
	if self.openAmpWizardAction ~= nil then
		var3889.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.openAmpWizardAction)
		}
	end
	if self.open_subscription_purchase_page_action ~= nil then
		var3889.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.open_subscription_purchase_page_action)
		}
	end
	if self.openSubscriptionPurchasePageAction ~= nil then
		var3889.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.openSubscriptionPurchasePageAction)
		}
	end
	if self.refresh_game_passes_action ~= nil then
		var3889.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refresh_game_passes_action)
		}
	end
	if self.refreshGamePassesAction ~= nil then
		var3889.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refreshGamePassesAction)
		}
	end
	if self.refresh_playability_action ~= nil then
		var3889.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refresh_playability_action)
		}
	end
	if self.refreshPlayabilityAction ~= nil then
		var3889.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refreshPlayabilityAction)
		}
	end
	if self.open_social_proof_user_list_sheet_action ~= nil then
		var3889.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.open_social_proof_user_list_sheet_action)
		}
	end
	if self.openSocialProofUserListSheetAction ~= nil then
		var3889.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.openSocialProofUserListSheetAction)
		}
	end
	if self.report_surface_load_time_milestone_action ~= nil then
		var3889.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.report_surface_load_time_milestone_action)
		}
	end
	if self.reportSurfaceLoadTimeMilestoneAction ~= nil then
		var3889.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.reportSurfaceLoadTimeMilestoneAction)
		}
	end
	if self.open_search_results_tab_action ~= nil then
		var3889.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.open_search_results_tab_action)
		}
	end
	if self.openSearchResultsTabAction ~= nil then
		var3889.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.openSearchResultsTabAction)
		}
	end
	if self.open_phone_upsell_modal_action ~= nil then
		var3889.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.open_phone_upsell_modal_action)
		}
	end
	if self.openPhoneUpsellModalAction ~= nil then
		var3889.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.openPhoneUpsellModalAction)
		}
	end
	if self.open_email_upsell_modal_action ~= nil then
		var3889.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.open_email_upsell_modal_action)
		}
	end
	if self.openEmailUpsellModalAction ~= nil then
		var3889.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.openEmailUpsellModalAction)
		}
	end
	if self.dismiss_prompt_action ~= nil then
		var3889.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismiss_prompt_action)
		}
	end
	if self.dismissPromptAction ~= nil then
		var3889.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismissPromptAction)
		}
	end
	if self.request_friendship_action ~= nil then
		var3889.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.request_friendship_action)
		}
	end
	if self.requestFriendshipAction ~= nil then
		var3889.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.requestFriendshipAction)
		}
	end
	if self.refresh_developer_products_action ~= nil then
		var3889.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refresh_developer_products_action)
		}
	end
	if self.refreshDeveloperProductsAction ~= nil then
		var3889.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refreshDeveloperProductsAction)
		}
	end
	if self.open_fae_trial_upsell_action ~= nil then
		var3889.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.open_fae_trial_upsell_action)
		}
	end
	if self.openFaeTrialUpsellAction ~= nil then
		var3889.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.openFaeTrialUpsellAction)
		}
	end
	if self.refresh_omni_recommendation_feed_item_action ~= nil then
		var3889.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refresh_omni_recommendation_feed_item_action)
		}
	end
	if self.refreshOmniRecommendationFeedItemAction ~= nil then
		var3889.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refreshOmniRecommendationFeedItemAction)
		}
	end
	if self.ai_overview_feedback_action ~= nil then
		var3889.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.ai_overview_feedback_action)
		}
	end
	if self.aiOverviewFeedbackAction ~= nil then
		var3889.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.aiOverviewFeedbackAction)
		}
	end
	if self.open_trusted_friends_upsell_modal_action ~= nil then
		var3889.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.open_trusted_friends_upsell_modal_action)
		}
	end
	if self.openTrustedFriendsUpsellModalAction ~= nil then
		var3889.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.openTrustedFriendsUpsellModalAction)
		}
	end
	if self.record_party_chat_conversation_upsell_acknowledgement_action ~= nil then
		var3889.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.record_party_chat_conversation_upsell_acknowledgement_action)
		}
	end
	if self.recordPartyChatConversationUpsellAcknowledgementAction ~= nil then
		var3889.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.recordPartyChatConversationUpsellAcknowledgementAction)
		}
	end
	if self.open_search_results_with_query_action ~= nil then
		var3889.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.open_search_results_with_query_action)
		}
	end
	if self.openSearchResultsWithQueryAction ~= nil then
		var3889.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.openSearchResultsWithQueryAction)
		}
	end
	if self.select_marketplace_favorites_category ~= nil then
		var3889.kind = {
			type = "select_marketplace_favorites_category",
			value = t.SelectMarketplaceFavoritesCategory.jsonDecode(self.select_marketplace_favorites_category)
		}
	end
	if self.selectMarketplaceFavoritesCategory ~= nil then
		var3889.kind = {
			type = "select_marketplace_favorites_category",
			value = t.SelectMarketplaceFavoritesCategory.jsonDecode(self.selectMarketplaceFavoritesCategory)
		}
	end
	if self.download_app_action ~= nil then
		var3889.kind = {
			type = "download_app_action",
			value = t.DownloadAppAction.jsonDecode(self.download_app_action)
		}
	end
	if self.downloadAppAction ~= nil then
		var3889.kind = {
			type = "download_app_action",
			value = t.DownloadAppAction.jsonDecode(self.downloadAppAction)
		}
	end
	if self.refresh_charts_sort_detail_action ~= nil then
		var3889.kind = {
			type = "refresh_charts_sort_detail_action",
			value = t.RefreshChartsSortDetailAction.jsonDecode(self.refresh_charts_sort_detail_action)
		}
	end
	if self.refreshChartsSortDetailAction ~= nil then
		var3889.kind = {
			type = "refresh_charts_sort_detail_action",
			value = t.RefreshChartsSortDetailAction.jsonDecode(self.refreshChartsSortDetailAction)
		}
	end
	if self.join_community_action ~= nil then
		var3889.kind = {
			type = "join_community_action",
			value = t.JoinCommunityAction.jsonDecode(self.join_community_action)
		}
	end
	if self.joinCommunityAction ~= nil then
		var3889.kind = {
			type = "join_community_action",
			value = t.JoinCommunityAction.jsonDecode(self.joinCommunityAction)
		}
	end
	if self.view_community_action ~= nil then
		var3889.kind = {
			type = "view_community_action",
			value = t.ViewCommunityAction.jsonDecode(self.view_community_action)
		}
	end
	if self.viewCommunityAction ~= nil then
		var3889.kind = {
			type = "view_community_action",
			value = t.ViewCommunityAction.jsonDecode(self.viewCommunityAction)
		}
	end
	if self.pin_experience_shortcut_action ~= nil then
		var3889.kind = {
			type = "pin_experience_shortcut_action",
			value = t.PinExperienceShortcutAction.jsonDecode(self.pin_experience_shortcut_action)
		}
	end
	if self.pinExperienceShortcutAction ~= nil then
		var3889.kind = {
			type = "pin_experience_shortcut_action",
			value = t.PinExperienceShortcutAction.jsonDecode(self.pinExperienceShortcutAction)
		}
	end
	if self.select_marketplace_favorites_subcategory ~= nil then
		var3889.kind = {
			type = "select_marketplace_favorites_subcategory",
			value = t.SelectMarketplaceFavoritesSubcategory.jsonDecode(self.select_marketplace_favorites_subcategory)
		}
	end
	if self.selectMarketplaceFavoritesSubcategory ~= nil then
		var3889.kind = {
			type = "select_marketplace_favorites_subcategory",
			value = t.SelectMarketplaceFavoritesSubcategory.jsonDecode(self.selectMarketplaceFavoritesSubcategory)
		}
	end
	if self.show_toast_action ~= nil then
		var3889.kind = {
			type = "show_toast_action",
			value = t.ShowToastAction.jsonDecode(self.show_toast_action)
		}
	end
	if self.showToastAction ~= nil then
		var3889.kind = {
			type = "show_toast_action",
			value = t.ShowToastAction.jsonDecode(self.showToastAction)
		}
	end
	if self.open_incoming_transfer_upsell_action ~= nil then
		var3889.kind = {
			type = "open_incoming_transfer_upsell_action",
			value = t.OpenIncomingTransferUpsellAction.jsonDecode(self.open_incoming_transfer_upsell_action)
		}
	end
	if self.openIncomingTransferUpsellAction ~= nil then
		var3889.kind = {
			type = "open_incoming_transfer_upsell_action",
			value = t.OpenIncomingTransferUpsellAction.jsonDecode(self.openIncomingTransferUpsellAction)
		}
	end
	if self.action_sequence_action ~= nil then
		var3889.kind = {
			type = "action_sequence_action",
			value = t.ActionSequenceAction.jsonDecode(self.action_sequence_action)
		}
	end
	if self.actionSequenceAction ~= nil then
		var3889.kind = {
			type = "action_sequence_action",
			value = t.ActionSequenceAction.jsonDecode(self.actionSequenceAction)
		}
	end
	if self.refresh_feed_entry_from_api_action ~= nil then
		var3889.kind = {
			type = "refresh_feed_entry_from_api_action",
			value = t.RefreshFeedEntryFromApiAction.jsonDecode(self.refresh_feed_entry_from_api_action)
		}
	end
	if self.refreshFeedEntryFromApiAction ~= nil then
		var3889.kind = {
			type = "refresh_feed_entry_from_api_action",
			value = t.RefreshFeedEntryFromApiAction.jsonDecode(self.refreshFeedEntryFromApiAction)
		}
	end
	if self.open_profile_frames_editor_action ~= nil then
		var3889.kind = {
			type = "open_profile_frames_editor_action",
			value = t.OpenProfileFramesEditorAction.jsonDecode(self.open_profile_frames_editor_action)
		}
	end
	if self.openProfileFramesEditorAction ~= nil then
		var3889.kind = {
			type = "open_profile_frames_editor_action",
			value = t.OpenProfileFramesEditorAction.jsonDecode(self.openProfileFramesEditorAction)
		}
	end
	if self.navigate_action ~= nil then
		var3889.kind = {
			type = "navigate_action",
			value = t.NavigateAction.jsonDecode(self.navigate_action)
		}
	end
	if self.navigateAction ~= nil then
		var3889.kind = {
			type = "navigate_action",
			value = t.NavigateAction.jsonDecode(self.navigateAction)
		}
	end
	if self.set_game_tile_not_interested_action ~= nil then
		var3889.kind = {
			type = "set_game_tile_not_interested_action",
			value = t.SetGameTileNotInterestedAction.jsonDecode(self.set_game_tile_not_interested_action)
		}
	end
	if self.setGameTileNotInterestedAction ~= nil then
		var3889.kind = {
			type = "set_game_tile_not_interested_action",
			value = t.SetGameTileNotInterestedAction.jsonDecode(self.setGameTileNotInterestedAction)
		}
	end
	if self.refresh_home_action ~= nil then
		var3889.kind = {
			type = "refresh_home_action",
			value = t.RefreshHomeAction.jsonDecode(self.refresh_home_action)
		}
	end
	if self.refreshHomeAction ~= nil then
		var3889.kind = {
			type = "refresh_home_action",
			value = t.RefreshHomeAction.jsonDecode(self.refreshHomeAction)
		}
	end
	if self.undo_game_tile_not_interested_action ~= nil then
		var3889.kind = {
			type = "undo_game_tile_not_interested_action",
			value = t.UndoGameTileNotInterestedAction.jsonDecode(self.undo_game_tile_not_interested_action)
		}
	end
	if self.undoGameTileNotInterestedAction ~= nil then
		var3889.kind = {
			type = "undo_game_tile_not_interested_action",
			value = t.UndoGameTileNotInterestedAction.jsonDecode(self.undoGameTileNotInterestedAction)
		}
	end
	if self.apply_dev_store_see_all_category_filter_action ~= nil then
		var3889.kind = {
			type = "apply_dev_store_see_all_category_filter_action",
			value = t.ApplyDevStoreSeeAllCategoryFilterAction.jsonDecode(self.apply_dev_store_see_all_category_filter_action)
		}
	end
	if self.applyDevStoreSeeAllCategoryFilterAction ~= nil then
		var3889.kind = {
			type = "apply_dev_store_see_all_category_filter_action",
			value = t.ApplyDevStoreSeeAllCategoryFilterAction.jsonDecode(self.applyDevStoreSeeAllCategoryFilterAction)
		}
	end
	if self.open_why_this_ad_action ~= nil then
		var3889.kind = {
			type = "open_why_this_ad_action",
			value = t.OpenWhyThisAdAction.jsonDecode(self.open_why_this_ad_action)
		}
	end
	if self.openWhyThisAdAction ~= nil then
		var3889.kind = {
			type = "open_why_this_ad_action",
			value = t.OpenWhyThisAdAction.jsonDecode(self.openWhyThisAdAction)
		}
	end
	if self.request_push_notification_permission_action ~= nil then
		var3889.kind = {
			type = "request_push_notification_permission_action",
			value = t.RequestPushNotificationPermissionAction.jsonDecode(self.request_push_notification_permission_action)
		}
	end
	if self.requestPushNotificationPermissionAction ~= nil then
		var3889.kind = {
			type = "request_push_notification_permission_action",
			value = t.RequestPushNotificationPermissionAction.jsonDecode(self.requestPushNotificationPermissionAction)
		}
	end
	if self.telemetry_handler ~= nil then
		var3889.telemetry_handler = propTypesModule.StringProp.jsonDecode(self.telemetry_handler)
	end
	if self.telemetryHandler ~= nil then
		var3889.telemetry_handler = propTypesModule.StringProp.jsonDecode(self.telemetryHandler)
	end
	if self.accessibility_label ~= nil then
		var3889.accessibility_label = propTypesModule.StringFormat.jsonDecode(self.accessibility_label)
	end
	if self.accessibilityLabel ~= nil then
		var3889.accessibility_label = propTypesModule.StringFormat.jsonDecode(self.accessibilityLabel)
	end
	if self.skip_unified_logging ~= nil then
		var3889.skip_unified_logging = propTypesModule.BoolProp.jsonDecode(self.skip_unified_logging)
	end
	if self.skipUnifiedLogging ~= nil then
		var3889.skip_unified_logging = propTypesModule.BoolProp.jsonDecode(self.skipUnifiedLogging)
	end
	if self.action_event_name ~= nil then
		var3889.action_event_name = propTypesModule.StringProp.jsonDecode(self.action_event_name)
	end
	if self.actionEventName ~= nil then
		var3889.action_event_name = propTypesModule.StringProp.jsonDecode(self.actionEventName)
	end
	return var3889
end

t_182.descriptor = {
	name = "Action",
	fullName = "roblox.apppageplatform.shared.v1beta1.Action"
}
t.Action = t_182
typeRegistryModule.default:register(t.Action)
local t_183 = {}
t_183.__index = t_183

function t_183.new(p183)
	-- upvalues: t_183 (ref)
	return setmetatable({
		kind = if p183 == nil or p183.kind == nil then nil else p183.kind
	}, t_183)
end

function t_183:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3889 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "value" then
			local var3890 = self.kind.value:encode()
			local var3891, var3892 = protoModule.writeTag(buff, var3889, 1, protoModule.wireTypes.lengthDelimited)
			var3891, var6497 = protoModule.writeBuffer(var3891, var3892, var3890, buffer.len(var3890))
			buff = var3891
			var3889 = var3892
		elseif self.kind.type == "conditional" then
			local var3893 = self.kind.value:encode()
			local var3894, var3895 = protoModule.writeTag(buff, var3889, 2, protoModule.wireTypes.lengthDelimited)
			var3894, var6500 = protoModule.writeBuffer(var3894, var3895, var3893, buffer.len(var3893))
			buff = var3894
			var3889 = var3895
		end
	end
	local buff_1 = buffer.create(var3889)
	buffer.copy(buff_1, 0, buff, 0, var3889)
	
	return buff_1
end

function t_183.decode(p183)
	-- upvalues: t_183 (ref), protoModule (ref), t (ref)
	local var3889 = t_183.new()
	local var3890 = 0
	while var3890 < buffer.len(p183) do
		local _ = nil
		local var3891 = nil
		local var3892, var3893, var3894 = protoModule.readTag(p183, var3890)
		local var3895 = var3892
		var3891 = var3893
		var3890 = var3894
		
		if var3891 == protoModule.wireTypes.varint then
			local _ = nil
			local var3896, var3897 = protoModule.readVarInt(p183, var3890)
			local _ = var3896
			var3890 = var3897
			continue
		end
		if var3891 == protoModule.wireTypes.lengthDelimited then
			if var3895 == 1 then
				local _ = nil
				local var3898, var3899 = protoModule.readBuffer(p183, var3890)
				var3890 = var3899
				var3889.kind = { type = "value", value = t.Action.decode(var3898) }
			elseif var3895 == 2 then
				local _ = nil
				local var3900, var3901 = protoModule.readBuffer(p183, var3890)
				var3890 = var3901
				var3889.kind = {
					type = "conditional",
					value = t.ActionProp_ConditionalOptions.decode(var3900)
				}
			else
				local _ = nil
				local var3902, var3903 = protoModule.readVarInt(p183, var3890)
				var3890 = var3903 + var3902
			end
		elseif var3891 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3904, var3905 = protoModule.readFixed32(p183, var3890)
			local _ = var3904
			var3890 = var3905
		elseif var3891 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3906, var3907 = protoModule.readFixed64(p183, var3890)
			local _ = var3906
			var3890 = var3907
		else
			error("Unsupported wire type: " .. var6504)
		end
	end
	return var3889
end

function t_183:jsonEncode()
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

function t_183:jsonDecode()
	-- upvalues: t_183 (ref), t (ref)
	local var3908 = t_183.new()
	
	if self.value ~= nil then
		var3908.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	if self.conditional ~= nil then
		var3908.kind = {
			type = "conditional",
			value = t.ActionProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var3908
end

t_183.descriptor = {
	name = "ActionProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionProp"
}
t.ActionProp = t_183
typeRegistryModule.default:register(t.ActionProp)
local t_184 = {}
t_184.__index = t_184

function t_184.new(p184)
	-- upvalues: t_184 (ref)
	return setmetatable({
		condition = if p184 == nil or p184.condition == nil then nil else p184.condition,
		kind = if p184 == nil or p184.kind == nil then nil else p184.kind
	}, t_184)
end

function t_184:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3908 = 0
	
	if self.condition ~= nil then
		local var3909 = self.condition:encode()
		local var3910, var3911 = protoModule.writeTag(buff, var3908, 1, protoModule.wireTypes.lengthDelimited)
		var3910, var6527 = protoModule.writeBuffer(var3910, var3911, var3909, buffer.len(var3909))
		buff = var3910
		var3908 = var3911
	end
	if self.kind ~= nil and self.kind.type == "value" then
		local var3912 = self.kind.value:encode()
		local var3913, var3914 = protoModule.writeTag(buff, var3908, 3, protoModule.wireTypes.lengthDelimited)
		var3913, var6530 = protoModule.writeBuffer(var3913, var3914, var3912, buffer.len(var3912))
		buff = var3913
		var3908 = var3914
	end
	local buff_1 = buffer.create(var3908)
	buffer.copy(buff_1, 0, buff, 0, var3908)
	
	return buff_1
end

function t_184.decode(p184)
	-- upvalues: t_184 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var3908 = t_184.new()
	local var3909 = 0
	while var3909 < buffer.len(p184) do
		local _ = nil
		local var3910 = nil
		local var3911, var3912, var3913 = protoModule.readTag(p184, var3909)
		local var3914 = var3911
		var3910 = var3912
		var3909 = var3913
		
		if var3910 == protoModule.wireTypes.varint then
			local _ = nil
			local var3915, var3916 = protoModule.readVarInt(p184, var3909)
			local _ = var3915
			var3909 = var3916
			continue
		end
		if var3910 == protoModule.wireTypes.lengthDelimited then
			if var3914 == 1 then
				local _ = nil
				local var3917, var3918 = protoModule.readBuffer(p184, var3909)
				var3909 = var3918
				var3908.condition = propConditionModule.PropCondition.decode(var3917)
			elseif var3914 == 3 then
				local _ = nil
				local var3919, var3920 = protoModule.readBuffer(p184, var3909)
				var3909 = var3920
				var3908.kind = { type = "value", value = t.Action.decode(var3919) }
			else
				local _ = nil
				local var3921, var3922 = protoModule.readVarInt(p184, var3909)
				var3909 = var3922 + var3921
			end
		elseif var3910 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3923, var3924 = protoModule.readFixed32(p184, var3909)
			local _ = var3923
			var3909 = var3924
		elseif var3910 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3925, var3926 = protoModule.readFixed64(p184, var3909)
			local _ = var3925
			var3909 = var3926
		else
			error("Unsupported wire type: " .. var6534)
		end
	end
	return var3908
end

function t_184:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "value" then
		t.value = self.kind.value:jsonEncode()
	end
	return t
end

function t_184:jsonDecode()
	-- upvalues: t_184 (ref), propConditionModule (ref), t (ref)
	local var3927 = t_184.new()
	
	if self.condition ~= nil then
		var3927.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.value ~= nil then
		var3927.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	return var3927
end

t_184.descriptor = {
	name = "ActionProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ActionProp_ConditionalOption = t_184
typeRegistryModule.default:register(t.ActionProp_ConditionalOption)
local t_185 = {}
t_185.__index = t_185

function t_185.new(p185)
	-- upvalues: t_185 (ref)
	return setmetatable({
		options = if p185 == nil or p185.options == nil then {} else p185.options
	}, t_185)
end

function t_185:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3927 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3928 = v:encode()
			local var3929, var3930 = protoModule.writeTag(buff, var3927, 1, protoModule.wireTypes.lengthDelimited)
			var3929, var6557 = protoModule.writeBuffer(var3929, var3930, var3928, buffer.len(var3928))
			buff = var3929
			var3927 = var3930
		end
	end
	local buff_1 = buffer.create(var3927)
	buffer.copy(buff_1, 0, buff, 0, var3927)
	
	return buff_1
end

function t_185.decode(p185)
	-- upvalues: t_185 (ref), protoModule (ref), t (ref)
	local var3931 = t_185.new()
	local var3932 = 0
	while var3932 < buffer.len(p185) do
		local _ = nil
		local var3933 = nil
		local var3934, var3935, var3936 = protoModule.readTag(p185, var3932)
		local var3937 = var3934
		var3933 = var3935
		var3932 = var3936
		
		if var3933 == protoModule.wireTypes.varint then
			local _ = nil
			local var3938, var3939 = protoModule.readVarInt(p185, var3932)
			local _ = var3938
			var3932 = var3939
			continue
		end
		if var3933 == protoModule.wireTypes.lengthDelimited then
			if var3937 == 1 then
				local _ = nil
				local var3940, var3941 = protoModule.readBuffer(p185, var3932)
				var3932 = var3941
				table.insert(var3931.options, t.ActionProp_ConditionalOption.decode(var3940))
			else
				local _ = nil
				local var3942, var3943 = protoModule.readVarInt(p185, var3932)
				var3932 = var3943 + var3942
			end
		elseif var3933 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3944, var3945 = protoModule.readFixed32(p185, var3932)
			local _ = var3944
			var3932 = var3945
		elseif var3933 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3946, var3947 = protoModule.readFixed64(p185, var3932)
			local _ = var3946
			var3932 = var3947
		else
			error("Unsupported wire type: " .. var6561)
		end
	end
	return var3931
end

function t_185:jsonEncode()
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

function t_185:jsonDecode()
	-- upvalues: t_185 (ref), t (ref)
	local var3948 = t_185.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ActionProp_ConditionalOption.jsonDecode(v))
		end
		var3948.options = t_1
	end
	return var3948
end

t_185.descriptor = {
	name = "ActionProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ActionProp_ConditionalOptions = t_185
typeRegistryModule.default:register(t.ActionProp_ConditionalOptions)
local t_186 = {}
t_186.__index = t_186

function t_186.new(p186)
	-- upvalues: t_186 (ref)
	return setmetatable({
		kind = if p186 == nil or p186.kind == nil then nil else p186.kind
	}, t_186)
end

function t_186:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3949 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3950 = self.kind.value:encode()
			local var3951, var3952 = protoModule.writeTag(buff, var3949, 1, protoModule.wireTypes.lengthDelimited)
			var3951, var6584 = protoModule.writeBuffer(var3951, var3952, var3950, buffer.len(var3950))
			buff = var3951
			var3949 = var3952
		elseif self.kind.type == "conditional" then
			local var3953 = self.kind.value:encode()
			local var3954, var3955 = protoModule.writeTag(buff, var3949, 2, protoModule.wireTypes.lengthDelimited)
			var3954, var6587 = protoModule.writeBuffer(var3954, var3955, var3953, buffer.len(var3953))
			buff = var3954
			var3949 = var3955
		elseif self.kind.type == "binding_path" then
			local var3956, var3957 = protoModule.writeTag(buff, var3949, 3, protoModule.wireTypes.lengthDelimited)
			var3956, var6589 = protoModule.writeString(var3956, var3957, self.kind.value)
			buff = var3956
			var3949 = var3957
		end
	end
	local buff_1 = buffer.create(var3949)
	buffer.copy(buff_1, 0, buff, 0, var3949)
	
	return buff_1
end

function t_186.decode(p186)
	-- upvalues: t_186 (ref), protoModule (ref), t (ref)
	local var3949 = t_186.new()
	local var3950 = 0
	while var3950 < buffer.len(p186) do
		local _ = nil
		local var3951 = nil
		local var3952, var3953, var3954 = protoModule.readTag(p186, var3950)
		local var3955 = var3952
		var3951 = var3953
		var3950 = var3954
		
		if var3951 == protoModule.wireTypes.varint then
			local _ = nil
			local var3956, var3957 = protoModule.readVarInt(p186, var3950)
			local _ = var3956
			var3950 = var3957
			continue
		end
		if var3951 == protoModule.wireTypes.lengthDelimited then
			if var3955 == 1 then
				local _ = nil
				local var3958, var3959 = protoModule.readBuffer(p186, var3950)
				var3950 = var3959
				var3949.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(var3958)
				}
			elseif var3955 == 2 then
				local _ = nil
				local var3960, var3961 = protoModule.readBuffer(p186, var3950)
				var3950 = var3961
				var3949.kind = {
					type = "conditional",
					value = t.FocusNavActionsProp_ConditionalOptions.decode(var3960)
				}
			elseif var3955 == 3 then
				local _ = nil
				local var3962, var3963 = protoModule.readBuffer(p186, var3950)
				var3950 = var3963
				var3949.kind = { type = "binding_path", value = buffer.tostring(var3962) }
			else
				local _ = nil
				local var3964, var3965 = protoModule.readVarInt(p186, var3950)
				var3950 = var3965 + var3964
			end
		elseif var3951 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3966, var3967 = protoModule.readFixed32(p186, var3950)
			local _ = var3966
			var3950 = var3967
		elseif var3951 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3968, var3969 = protoModule.readFixed64(p186, var3950)
			local _ = var3968
			var3950 = var3969
		else
			error("Unsupported wire type: " .. var6593)
		end
	end
	return var3949
end

function t_186:jsonEncode()
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

function t_186:jsonDecode()
	-- upvalues: t_186 (ref), t (ref)
	local var3970 = t_186.new()
	
	if self.literal ~= nil then
		var3970.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
		}
	end
	if self.conditional ~= nil then
		var3970.kind = {
			type = "conditional",
			value = t.FocusNavActionsProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var3970.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3970.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3970
end

t_186.descriptor = {
	name = "FocusNavActionsProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavActionsProp"
}
t.FocusNavActionsProp = t_186
typeRegistryModule.default:register(t.FocusNavActionsProp)
local t_187 = {}
t_187.__index = t_187

function t_187.new(p187)
	-- upvalues: t_187 (ref)
	return setmetatable({
		condition = if p187 == nil or p187.condition == nil then nil else p187.condition,
		kind = if p187 == nil or p187.kind == nil then nil else p187.kind
	}, t_187)
end

function t_187:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3970 = 0
	
	if self.condition ~= nil then
		local var3971 = self.condition:encode()
		local var3972, var3973 = protoModule.writeTag(buff, var3970, 1, protoModule.wireTypes.lengthDelimited)
		var3972, var6618 = protoModule.writeBuffer(var3972, var3973, var3971, buffer.len(var3971))
		buff = var3972
		var3970 = var3973
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3974 = self.kind.value:encode()
			local var3975, var3976 = protoModule.writeTag(buff, var3970, 3, protoModule.wireTypes.lengthDelimited)
			var3975, var6621 = protoModule.writeBuffer(var3975, var3976, var3974, buffer.len(var3974))
			buff = var3975
			var3970 = var3976
		elseif self.kind.type == "binding_path" then
			local var3977, var3978 = protoModule.writeTag(buff, var3970, 4, protoModule.wireTypes.lengthDelimited)
			var3977, var6623 = protoModule.writeString(var3977, var3978, self.kind.value)
			buff = var3977
			var3970 = var3978
		end
	end
	local buff_1 = buffer.create(var3970)
	buffer.copy(buff_1, 0, buff, 0, var3970)
	
	return buff_1
end

function t_187.decode(p187)
	-- upvalues: t_187 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var3970 = t_187.new()
	local var3971 = 0
	while var3971 < buffer.len(p187) do
		local _ = nil
		local var3972 = nil
		local var3973, var3974, var3975 = protoModule.readTag(p187, var3971)
		local var3976 = var3973
		var3972 = var3974
		var3971 = var3975
		
		if var3972 == protoModule.wireTypes.varint then
			local _ = nil
			local var3977, var3978 = protoModule.readVarInt(p187, var3971)
			local _ = var3977
			var3971 = var3978
			continue
		end
		if var3972 == protoModule.wireTypes.lengthDelimited then
			if var3976 == 1 then
				local _ = nil
				local var3979, var3980 = protoModule.readBuffer(p187, var3971)
				var3971 = var3980
				var3970.condition = propConditionModule.PropCondition.decode(var3979)
			elseif var3976 == 3 then
				local _ = nil
				local var3981, var3982 = protoModule.readBuffer(p187, var3971)
				var3971 = var3982
				var3970.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(var3981)
				}
			elseif var3976 == 4 then
				local _ = nil
				local var3983, var3984 = protoModule.readBuffer(p187, var3971)
				var3971 = var3984
				var3970.kind = { type = "binding_path", value = buffer.tostring(var3983) }
			else
				local _ = nil
				local var3985, var3986 = protoModule.readVarInt(p187, var3971)
				var3971 = var3986 + var3985
			end
		elseif var3972 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3987, var3988 = protoModule.readFixed32(p187, var3971)
			local _ = var3987
			var3971 = var3988
		elseif var3972 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3989, var3990 = protoModule.readFixed64(p187, var3971)
			local _ = var3989
			var3971 = var3990
		else
			error("Unsupported wire type: " .. var6627)
		end
	end
	return var3970
end

function t_187:jsonEncode()
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

function t_187:jsonDecode()
	-- upvalues: t_187 (ref), propConditionModule (ref), t (ref)
	local var3991 = t_187.new()
	
	if self.condition ~= nil then
		var3991.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var3991.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3991.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3991.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3991
end

t_187.descriptor = {
	name = "FocusNavActionsProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FocusNavActionsProp_ConditionalOption = t_187
typeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOption)
local t_188 = {}
t_188.__index = t_188

function t_188.new(p188)
	-- upvalues: t_188 (ref)
	return setmetatable({
		options = if p188 == nil or p188.options == nil then {} else p188.options
	}, t_188)
end

function t_188:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3991 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3992 = v:encode()
			local var3993, var3994 = protoModule.writeTag(buff, var3991, 1, protoModule.wireTypes.lengthDelimited)
			var3993, var6652 = protoModule.writeBuffer(var3993, var3994, var3992, buffer.len(var3992))
			buff = var3993
			var3991 = var3994
		end
	end
	local buff_1 = buffer.create(var3991)
	buffer.copy(buff_1, 0, buff, 0, var3991)
	
	return buff_1
end

function t_188.decode(p188)
	-- upvalues: t_188 (ref), protoModule (ref), t (ref)
	local var3995 = t_188.new()
	local var3996 = 0
	while var3996 < buffer.len(p188) do
		local _ = nil
		local var3997 = nil
		local var3998, var3999, var4000 = protoModule.readTag(p188, var3996)
		local var4001 = var3998
		var3997 = var3999
		var3996 = var4000
		
		if var3997 == protoModule.wireTypes.varint then
			local _ = nil
			local var4002, var4003 = protoModule.readVarInt(p188, var3996)
			local _ = var4002
			var3996 = var4003
			continue
		end
		if var3997 == protoModule.wireTypes.lengthDelimited then
			if var4001 == 1 then
				local _ = nil
				local var4004, var4005 = protoModule.readBuffer(p188, var3996)
				var3996 = var4005
				table.insert(var3995.options, t.FocusNavActionsProp_ConditionalOption.decode(var4004))
			else
				local _ = nil
				local var4006, var4007 = protoModule.readVarInt(p188, var3996)
				var3996 = var4007 + var4006
			end
		elseif var3997 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4008, var4009 = protoModule.readFixed32(p188, var3996)
			local _ = var4008
			var3996 = var4009
		elseif var3997 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4010, var4011 = protoModule.readFixed64(p188, var3996)
			local _ = var4010
			var3996 = var4011
		else
			error("Unsupported wire type: " .. var6656)
		end
	end
	return var3995
end

function t_188:jsonEncode()
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

function t_188:jsonDecode()
	-- upvalues: t_188 (ref), t (ref)
	local var4012 = t_188.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FocusNavActionsProp_ConditionalOption.jsonDecode(v))
		end
		var4012.options = t_1
	end
	return var4012
end

t_188.descriptor = {
	name = "FocusNavActionsProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FocusNavActionsProp_ConditionalOptions = t_188
typeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOptions)
local t_189 = {}
t_189.__index = t_189

function t_189.new(p189)
	-- upvalues: t_189 (ref)
	return setmetatable({
		keys = if p189 == nil or p189.keys == nil then {} else p189.keys,
		events = if p189 == nil or p189.events == nil then {} else p189.events
	}, t_189)
end

function t_189:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4013 = 0
	
	if self.keys ~= nil and next(self.keys) ~= nil then
		for i, v in self.keys do
			local var4014, var4015 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4014, var6678 = protoModule.writeString(var4014, var4015, i)
			local var4016 = v:encode()
			var4015, var6680 = protoModule.writeTag(var4014, var4015, 2, protoModule.wireTypes.lengthDelimited)
			var4015, var6680 = protoModule.writeBuffer(var4015, var6680, var4016, buffer.len(var4016))
			local var4017 = var4015
			local var4018 = var6680
			local var4019, var4020 = protoModule.writeTag(buff, var4013, 3, protoModule.wireTypes.lengthDelimited)
			var4019, var6684 = protoModule.writeBuffer(var4019, var4020, var4017, var4018)
			buff = var4019
			var4013 = var4020
		end
	end
	if self.events ~= nil and next(self.events) ~= nil then
		for i, v in self.events do
			local var4021, var4022 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4021, var6686 = protoModule.writeString(var4021, var4022, i)
			local var4023 = v:encode()
			var4022, var6688 = protoModule.writeTag(var4021, var4022, 2, protoModule.wireTypes.lengthDelimited)
			var4022, var6688 = protoModule.writeBuffer(var4022, var6688, var4023, buffer.len(var4023))
			local var4024 = var4022
			local var4025 = var6688
			local var4026, var4027 = protoModule.writeTag(buff, var4013, 4, protoModule.wireTypes.lengthDelimited)
			var4026, var6692 = protoModule.writeBuffer(var4026, var4027, var4024, var4025)
			buff = var4026
			var4013 = var4027
		end
	end
	local buff_1 = buffer.create(var4013)
	buffer.copy(buff_1, 0, buff, 0, var4013)
	
	return buff_1
end

function t_189.decode(p189)
	-- upvalues: t_189 (ref), protoModule (ref), t (ref), propTypesEngineModule (ref)
	local var4028 = t_189.new()
	local var4029 = 0
	while var4029 < buffer.len(p189) do
		local _ = nil
		local var4030 = nil
		local var4031, var4032, var4033 = protoModule.readTag(p189, var4029)
		local var4034 = var4031
		var4030 = var4032
		var4029 = var4033
		
		if var4030 == protoModule.wireTypes.varint then
			local _ = nil
			local var4035, var4036 = protoModule.readVarInt(p189, var4029)
			local _ = var4035
			var4029 = var4036
			continue
		end
		if var4030 == protoModule.wireTypes.lengthDelimited then
			if var4034 == 3 then
				local _ = nil
				local var4037, var4038 = protoModule.readBuffer(p189, var4029)
				var4029 = var4038
				var4037 = t.FocusNavActionsProp_FocusNavData_KeysEntry.decode(var4037)
				var4028.keys[var4037.key or ""] = var4037.value or propTypesEngineModule.KeyCodeProp.new()
			elseif var4034 == 4 then
				local _ = nil
				local var4039, var4040 = protoModule.readBuffer(p189, var4029)
				var4029 = var4040
				var4039 = t.FocusNavActionsProp_FocusNavData_EventsEntry.decode(var4039)
				var4028.events[var4039.key or ""] = var4039.value or t.ActionProp.new()
			else
				local _ = nil
				local var4041, var4042 = protoModule.readVarInt(p189, var4029)
				var4029 = var4042 + var4041
			end
		elseif var4030 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4043, var4044 = protoModule.readFixed32(p189, var4029)
			local _ = var4043
			var4029 = var4044
		elseif var4030 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4045, var4046 = protoModule.readFixed64(p189, var4029)
			local _ = var4045
			var4029 = var4046
		else
			error("Unsupported wire type: " .. var6696)
		end
	end
	return var4028
end

function t_189:jsonEncode()
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

function t_189:jsonDecode()
	-- upvalues: t_189 (ref), propTypesEngineModule (ref), t (ref)
	local var4047 = t_189.new()
	
	if self.keys ~= nil then
		local t_1 = {}
		
		for i, v in self.keys do
			t_1[i] = propTypesEngineModule.KeyCodeProp.jsonDecode(v)
		end
		var4047.keys = t_1
	end
	if self.events ~= nil then
		local t_1 = {}
		
		for i, v in self.events do
			t_1[i] = t.ActionProp.jsonDecode(v)
		end
		var4047.events = t_1
	end
	return var4047
end

t_189.descriptor = {
	name = "FocusNavActionsProp_FocusNavData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavData"
}
t.FocusNavActionsProp_FocusNavData = t_189
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData)
local t_190 = {}
t_190.__index = t_190

function t_190.new(p190)
	-- upvalues: t_190 (ref)
	return setmetatable({
		key = if p190 == nil or p190.key == nil then "" else p190.key,
		value = if p190 == nil or p190.value == nil then nil else p190.value
	}, t_190)
end

function t_190:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4048 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var4049, var4050 = protoModule.writeTag(buff, var4048, 1, protoModule.wireTypes.lengthDelimited)
		var4049, var6722 = protoModule.writeString(var4049, var4050, self.key)
		buff = var4049
		var4048 = var4050
	end
	if self.value ~= nil then
		local var4051 = self.value:encode()
		local var4052, var4053 = protoModule.writeTag(buff, var4048, 2, protoModule.wireTypes.lengthDelimited)
		var4052, var6725 = protoModule.writeBuffer(var4052, var4053, var4051, buffer.len(var4051))
		buff = var4052
		var4048 = var4053
	end
	local buff_1 = buffer.create(var4048)
	buffer.copy(buff_1, 0, buff, 0, var4048)
	
	return buff_1
end

function t_190.decode(p190)
	-- upvalues: t_190 (ref), protoModule (ref), propTypesEngineModule (ref)
	local var4048 = t_190.new()
	local var4049 = 0
	while var4049 < buffer.len(p190) do
		local _ = nil
		local var4050 = nil
		local var4051, var4052, var4053 = protoModule.readTag(p190, var4049)
		local var4054 = var4051
		var4050 = var4052
		var4049 = var4053
		
		if var4050 == protoModule.wireTypes.varint then
			local _ = nil
			local var4055, var4056 = protoModule.readVarInt(p190, var4049)
			local _ = var4055
			var4049 = var4056
			continue
		end
		if var4050 == protoModule.wireTypes.lengthDelimited then
			if var4054 == 1 then
				local _ = nil
				local var4057, var4058 = protoModule.readBuffer(p190, var4049)
				var4049 = var4058
				var4048.key = buffer.tostring(var4057)
			elseif var4054 == 2 then
				local _ = nil
				local var4059, var4060 = protoModule.readBuffer(p190, var4049)
				var4049 = var4060
				var4048.value = propTypesEngineModule.KeyCodeProp.decode(var4059)
			else
				local _ = nil
				local var4061, var4062 = protoModule.readVarInt(p190, var4049)
				var4049 = var4062 + var4061
			end
		elseif var4050 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4063, var4064 = protoModule.readFixed32(p190, var4049)
			local _ = var4063
			var4049 = var4064
		elseif var4050 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4065, var4066 = protoModule.readFixed64(p190, var4049)
			local _ = var4065
			var4049 = var4066
		else
			error("Unsupported wire type: " .. var6729)
		end
	end
	return var4048
end

function t_190:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_190:jsonDecode()
	-- upvalues: t_190 (ref), propTypesEngineModule (ref)
	local var4067 = t_190.new()
	
	if self.key ~= nil then
		var4067.key = self.key
	end
	if self.value ~= nil then
		var4067.value = propTypesEngineModule.KeyCodeProp.jsonDecode(self.value)
	end
	return var4067
end

t_190.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_KeysEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.KeysEntry"
}
t.FocusNavActionsProp_FocusNavData_KeysEntry = t_190
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_KeysEntry)
local t_191 = {}
t_191.__index = t_191

function t_191.new(p191)
	-- upvalues: t_191 (ref)
	return setmetatable({
		key = if p191 == nil or p191.key == nil then "" else p191.key,
		value = if p191 == nil or p191.value == nil then nil else p191.value
	}, t_191)
end

function t_191:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4067 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var4068, var4069 = protoModule.writeTag(buff, var4067, 1, protoModule.wireTypes.lengthDelimited)
		var4068, var6751 = protoModule.writeString(var4068, var4069, self.key)
		buff = var4068
		var4067 = var4069
	end
	if self.value ~= nil then
		local var4070 = self.value:encode()
		local var4071, var4072 = protoModule.writeTag(buff, var4067, 2, protoModule.wireTypes.lengthDelimited)
		var4071, var6754 = protoModule.writeBuffer(var4071, var4072, var4070, buffer.len(var4070))
		buff = var4071
		var4067 = var4072
	end
	local buff_1 = buffer.create(var4067)
	buffer.copy(buff_1, 0, buff, 0, var4067)
	
	return buff_1
end

function t_191.decode(p191)
	-- upvalues: t_191 (ref), protoModule (ref), t (ref)
	local var4067 = t_191.new()
	local var4068 = 0
	while var4068 < buffer.len(p191) do
		local _ = nil
		local var4069 = nil
		local var4070, var4071, var4072 = protoModule.readTag(p191, var4068)
		local var4073 = var4070
		var4069 = var4071
		var4068 = var4072
		
		if var4069 == protoModule.wireTypes.varint then
			local _ = nil
			local var4074, var4075 = protoModule.readVarInt(p191, var4068)
			local _ = var4074
			var4068 = var4075
			continue
		end
		if var4069 == protoModule.wireTypes.lengthDelimited then
			if var4073 == 1 then
				local _ = nil
				local var4076, var4077 = protoModule.readBuffer(p191, var4068)
				var4068 = var4077
				var4067.key = buffer.tostring(var4076)
			elseif var4073 == 2 then
				local _ = nil
				local var4078, var4079 = protoModule.readBuffer(p191, var4068)
				var4068 = var4079
				var4067.value = t.ActionProp.decode(var4078)
			else
				local _ = nil
				local var4080, var4081 = protoModule.readVarInt(p191, var4068)
				var4068 = var4081 + var4080
			end
		elseif var4069 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4082, var4083 = protoModule.readFixed32(p191, var4068)
			local _ = var4082
			var4068 = var4083
		elseif var4069 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4084, var4085 = protoModule.readFixed64(p191, var4068)
			local _ = var4084
			var4068 = var4085
		else
			error("Unsupported wire type: " .. var6758)
		end
	end
	return var4067
end

function t_191:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_191:jsonDecode()
	-- upvalues: t_191 (ref), t (ref)
	local var4086 = t_191.new()
	
	if self.key ~= nil then
		var4086.key = self.key
	end
	if self.value ~= nil then
		var4086.value = t.ActionProp.jsonDecode(self.value)
	end
	return var4086
end

t_191.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_EventsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsEntry"
}
t.FocusNavActionsProp_FocusNavData_EventsEntry = t_191
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_EventsEntry)
t.ActionType = {
	fromNumber = function(p192)
		return if p192 == 0 then "ACTION_TYPE_INVALID" elseif p192 == 1 then "ACTION_TYPE_DISMISS_DIALOG" elseif p192 == 2 then "ACTION_TYPE_LINK" elseif p192 == 3 then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p192 == 4 then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p192 == 5 then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p192 == 6 then "ACTION_TYPE_OPEN_SEE_ALL" elseif p192 == 7 then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p192 == 8 then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p192 == 9 then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p192 == 10 then "ACTION_TYPE_OPEN_TOOLTIP" elseif p192 == 11 then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p192 == 12 then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p192 == 13 then "ACTION_TYPE_SHARE" elseif p192 == 14 then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p192 == 15 then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p192 == 16 then "ACTION_TYPE_OPEN_PROFILE" elseif p192 == 17 then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p192 == 18 then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p192 == 19 then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p192 == 20 then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p192 == 21 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p192 == 22 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p192 == 23 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p192 == 24 then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p192 == 25 then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p192 == 26 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p192 == 27 then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p192 == 28 then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p192 == 29 then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p192 == 30 then "ACTION_TYPE_REFRESH_FROM_API" elseif p192 == 31 then "ACTION_TYPE_RSVP_TO_EVENT" elseif p192 == 32 then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p192 == 33 then "ACTION_TYPE_ANALYTICS_EVENT" elseif p192 == 34 then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p192 == 35 then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p192 == 36 then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p192 == 37 then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p192 == 38 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p192 == 39 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p192 == 40 then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p192 == 41 then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p192 == 42 then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p192 == 43 then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p192 == 44 then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p192 == 45 then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p192 == 46 then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p192 == 47 then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p192 == 48 then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p192 == 49 then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p192 == 50 then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p192 == 51 then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p192 == 52 then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p192 == 53 then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p192 == 54 then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p192 == 55 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p192 == 56 then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p192 == 57 then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p192 == 58 then "ACTION_TYPE_DISMISS_PROMPT" elseif p192 == 59 then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p192 == 60 then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p192 == 61 then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p192 == 62 then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p192 == 63 then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p192 == 64 then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p192 == 65 then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p192 == 66 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" elseif p192 == 67 then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" elseif p192 == 68 then "ACTION_TYPE_DOWNLOAD_APP" elseif p192 == 69 then "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" elseif p192 == 70 then "ACTION_TYPE_JOIN_COMMUNITY" elseif p192 == 71 then "ACTION_TYPE_VIEW_COMMUNITY" elseif p192 == 72 then "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" elseif p192 == 73 then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" elseif p192 == 74 then "ACTION_TYPE_SHOW_TOAST" elseif p192 == 75 then "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" elseif p192 == 76 then "ACTION_TYPE_ACTION_SEQUENCE" elseif p192 == 77 then "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" elseif p192 == 78 then "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" elseif p192 == 79 then "ACTION_TYPE_NAVIGATE" elseif p192 == 80 then "ACTION_TYPE_SET_GAME_TILE_NOT_INTERESTED" elseif p192 == 81 then "ACTION_TYPE_REFRESH_HOME" elseif p192 == 82 then "ACTION_TYPE_UNDO_GAME_TILE_NOT_INTERESTED" elseif p192 == 83 then "ACTION_TYPE_APPLY_DEV_STORE_SEE_ALL_CATEGORY_FILTER" elseif p192 == 84 then "ACTION_TYPE_OPEN_WHY_THIS_AD" elseif p192 == 85 then "ACTION_TYPE_REQUEST_PUSH_NOTIFICATION_PERMISSION" else nil
	end,
	toNumber = function(p192)
		return if p192 == "ACTION_TYPE_INVALID" then 0 elseif p192 == "ACTION_TYPE_DISMISS_DIALOG" then 1 elseif p192 == "ACTION_TYPE_LINK" then 2 elseif p192 == "ACTION_TYPE_OPEN_GAME_DETAILS" then 3 elseif p192 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then 4 elseif p192 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then 5 elseif p192 == "ACTION_TYPE_OPEN_SEE_ALL" then 6 elseif p192 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then 7 elseif p192 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then 8 elseif p192 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then 9 elseif p192 == "ACTION_TYPE_OPEN_TOOLTIP" then 10 elseif p192 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then 11 elseif p192 == "ACTION_TYPE_LOAD_MORE_FROM_API" then 12 elseif p192 == "ACTION_TYPE_SHARE" then 13 elseif p192 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then 14 elseif p192 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then 15 elseif p192 == "ACTION_TYPE_OPEN_PROFILE" then 16 elseif p192 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then 17 elseif p192 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then 18 elseif p192 == "ACTION_TYPE_OPEN_MARKETPLACE" then 19 elseif p192 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then 20 elseif p192 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then 21 elseif p192 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then 22 elseif p192 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then 23 elseif p192 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then 24 elseif p192 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then 25 elseif p192 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then 26 elseif p192 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then 27 elseif p192 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then 28 elseif p192 == "ACTION_TYPE_OPEN_SONG_DETAIL" then 29 elseif p192 == "ACTION_TYPE_REFRESH_FROM_API" then 30 elseif p192 == "ACTION_TYPE_RSVP_TO_EVENT" then 31 elseif p192 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then 32 elseif p192 == "ACTION_TYPE_ANALYTICS_EVENT" then 33 elseif p192 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then 34 elseif p192 == "ACTION_TYPE_OPEN_GAME_INVITE" then 35 elseif p192 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then 36 elseif p192 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then 37 elseif p192 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then 38 elseif p192 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then 39 elseif p192 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then 40 elseif p192 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then 41 elseif p192 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then 42 elseif p192 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then 43 elseif p192 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then 44 elseif p192 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then 45 elseif p192 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then 46 elseif p192 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then 47 elseif p192 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then 48 elseif p192 == "ACTION_TYPE_OPEN_AMP_WIZARD" then 49 elseif p192 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then 50 elseif p192 == "ACTION_TYPE_REFRESH_GAME_PASSES" then 51 elseif p192 == "ACTION_TYPE_REFRESH_PLAYABILITY" then 52 elseif p192 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then 53 elseif p192 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then 54 elseif p192 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then 55 elseif p192 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then 56 elseif p192 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then 57 elseif p192 == "ACTION_TYPE_DISMISS_PROMPT" then 58 elseif p192 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then 59 elseif p192 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then 60 elseif p192 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then 61 elseif p192 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then 62 elseif p192 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then 63 elseif p192 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then 64 elseif p192 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then 65 elseif p192 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then 66 elseif p192 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" then 67 elseif p192 == "ACTION_TYPE_DOWNLOAD_APP" then 68 elseif p192 == "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" then 69 elseif p192 == "ACTION_TYPE_JOIN_COMMUNITY" then 70 elseif p192 == "ACTION_TYPE_VIEW_COMMUNITY" then 71 elseif p192 == "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" then 72 elseif p192 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" then 73 elseif p192 == "ACTION_TYPE_SHOW_TOAST" then 74 elseif p192 == "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" then 75 elseif p192 == "ACTION_TYPE_ACTION_SEQUENCE" then 76 elseif p192 == "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" then 77 elseif p192 == "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" then 78 elseif p192 == "ACTION_TYPE_NAVIGATE" then 79 elseif p192 == "ACTION_TYPE_SET_GAME_TILE_NOT_INTERESTED" then 80 elseif p192 == "ACTION_TYPE_REFRESH_HOME" then 81 elseif p192 == "ACTION_TYPE_UNDO_GAME_TILE_NOT_INTERESTED" then 82 elseif p192 == "ACTION_TYPE_APPLY_DEV_STORE_SEE_ALL_CATEGORY_FILTER" then 83 elseif p192 == "ACTION_TYPE_OPEN_WHY_THIS_AD" then 84 elseif p192 == "ACTION_TYPE_REQUEST_PUSH_NOTIFICATION_PERMISSION" then 85 else p192
	end,
	fromName = function(p192)
		return if p192 == "ACTION_TYPE_INVALID" then "ACTION_TYPE_INVALID" elseif p192 == "ACTION_TYPE_DISMISS_DIALOG" then "ACTION_TYPE_DISMISS_DIALOG" elseif p192 == "ACTION_TYPE_LINK" then "ACTION_TYPE_LINK" elseif p192 == "ACTION_TYPE_OPEN_GAME_DETAILS" then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p192 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p192 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p192 == "ACTION_TYPE_OPEN_SEE_ALL" then "ACTION_TYPE_OPEN_SEE_ALL" elseif p192 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p192 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p192 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p192 == "ACTION_TYPE_OPEN_TOOLTIP" then "ACTION_TYPE_OPEN_TOOLTIP" elseif p192 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p192 == "ACTION_TYPE_LOAD_MORE_FROM_API" then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p192 == "ACTION_TYPE_SHARE" then "ACTION_TYPE_SHARE" elseif p192 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p192 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p192 == "ACTION_TYPE_OPEN_PROFILE" then "ACTION_TYPE_OPEN_PROFILE" elseif p192 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p192 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p192 == "ACTION_TYPE_OPEN_MARKETPLACE" then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p192 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p192 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p192 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p192 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p192 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p192 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p192 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p192 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p192 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p192 == "ACTION_TYPE_OPEN_SONG_DETAIL" then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p192 == "ACTION_TYPE_REFRESH_FROM_API" then "ACTION_TYPE_REFRESH_FROM_API" elseif p192 == "ACTION_TYPE_RSVP_TO_EVENT" then "ACTION_TYPE_RSVP_TO_EVENT" elseif p192 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p192 == "ACTION_TYPE_ANALYTICS_EVENT" then "ACTION_TYPE_ANALYTICS_EVENT" elseif p192 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p192 == "ACTION_TYPE_OPEN_GAME_INVITE" then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p192 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p192 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p192 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p192 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p192 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p192 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p192 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p192 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p192 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p192 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p192 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p192 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p192 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p192 == "ACTION_TYPE_OPEN_AMP_WIZARD" then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p192 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p192 == "ACTION_TYPE_REFRESH_GAME_PASSES" then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p192 == "ACTION_TYPE_REFRESH_PLAYABILITY" then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p192 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p192 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p192 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p192 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p192 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p192 == "ACTION_TYPE_DISMISS_PROMPT" then "ACTION_TYPE_DISMISS_PROMPT" elseif p192 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p192 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p192 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p192 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p192 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p192 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p192 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p192 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" elseif p192 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" elseif p192 == "ACTION_TYPE_DOWNLOAD_APP" then "ACTION_TYPE_DOWNLOAD_APP" elseif p192 == "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" then "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" elseif p192 == "ACTION_TYPE_JOIN_COMMUNITY" then "ACTION_TYPE_JOIN_COMMUNITY" elseif p192 == "ACTION_TYPE_VIEW_COMMUNITY" then "ACTION_TYPE_VIEW_COMMUNITY" elseif p192 == "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" then "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" elseif p192 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" elseif p192 == "ACTION_TYPE_SHOW_TOAST" then "ACTION_TYPE_SHOW_TOAST" elseif p192 == "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" then "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" elseif p192 == "ACTION_TYPE_ACTION_SEQUENCE" then "ACTION_TYPE_ACTION_SEQUENCE" elseif p192 == "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" then "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" elseif p192 == "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" then "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" elseif p192 == "ACTION_TYPE_NAVIGATE" then "ACTION_TYPE_NAVIGATE" elseif p192 == "ACTION_TYPE_SET_GAME_TILE_NOT_INTERESTED" then "ACTION_TYPE_SET_GAME_TILE_NOT_INTERESTED" elseif p192 == "ACTION_TYPE_REFRESH_HOME" then "ACTION_TYPE_REFRESH_HOME" elseif p192 == "ACTION_TYPE_UNDO_GAME_TILE_NOT_INTERESTED" then "ACTION_TYPE_UNDO_GAME_TILE_NOT_INTERESTED" elseif p192 == "ACTION_TYPE_APPLY_DEV_STORE_SEE_ALL_CATEGORY_FILTER" then "ACTION_TYPE_APPLY_DEV_STORE_SEE_ALL_CATEGORY_FILTER" elseif p192 == "ACTION_TYPE_OPEN_WHY_THIS_AD" then "ACTION_TYPE_OPEN_WHY_THIS_AD" elseif p192 == "ACTION_TYPE_REQUEST_PUSH_NOTIFICATION_PERMISSION" then "ACTION_TYPE_REQUEST_PUSH_NOTIFICATION_PERMISSION" else nil
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
	RefreshHomeAction = t.RefreshHomeAction,
	RefreshHomeAction_Params = t.RefreshHomeAction_Params,
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
	ApplyDevStoreSeeAllCategoryFilterAction = t.ApplyDevStoreSeeAllCategoryFilterAction,
	ApplyDevStoreSeeAllCategoryFilterAction_Params = t.ApplyDevStoreSeeAllCategoryFilterAction_Params,
	SetGameTileNotInterestedAction = t.SetGameTileNotInterestedAction,
	SetGameTileNotInterestedAction_Params = t.SetGameTileNotInterestedAction_Params,
	UndoGameTileNotInterestedAction = t.UndoGameTileNotInterestedAction,
	UndoGameTileNotInterestedAction_Params = t.UndoGameTileNotInterestedAction_Params,
	OpenWhyThisAdAction = t.OpenWhyThisAdAction,
	OpenWhyThisAdAction_Params = t.OpenWhyThisAdAction_Params,
	RequestPushNotificationPermissionAction = t.RequestPushNotificationPermissionAction,
	RequestPushNotificationPermissionAction_Params = t.RequestPushNotificationPermissionAction_Params,
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